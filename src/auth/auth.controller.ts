import { Controller, Post, UseGuards, Get, Req, Body } from '@nestjs/common';
import { ApiBody, ApiOperation, ApiTags } from '@nestjs/swagger';
import { AuthDto } from './dto/login.dto';
import { Ok } from 'src/common/common.interface';
import { AuthLocalGuard } from './auth-local.guard';
import { UserService } from 'src/user/user.service';
import { Roles } from 'src/role/helpers/role.enum';
import { AuthGuard } from './auth.guard';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly userService: UserService) {}
  @Post('/login')
  @ApiOperation({ summary: 'Create session for authirization' })
  @ApiBody({ type: AuthDto })
  @UseGuards(AuthLocalGuard)
  login(): Ok {
    return { ok: true };
  }

  @Get('/logout')
  @ApiOperation({ summary: 'Logout' })
  @UseGuards(AuthGuard)
  logout(@Req() req) {
    req.logOut((err) => {
      if (err) throw err;
    });
    return { ok: true };
  }

  @Post('/register')
  @ApiOperation({ summary: 'Register' })
  async register(@Body() dto: AuthDto) {
    return await this.userService.addUser({ ...dto, roles: [Roles.USER] });
  }
}
