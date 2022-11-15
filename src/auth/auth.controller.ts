import { Controller, Post, UseGuards, Get, Req, Body } from '@nestjs/common';
import { ApiBody, ApiOperation, ApiTags } from '@nestjs/swagger';
import { AuthDto } from './dto/auth.dto';
import { Ok } from 'src/common/interfaces/common.interface';
import { AuthLocalGuard } from './guards/auth-local.guard';
import { UserService } from 'src/auth/user/user.service';
import { Role } from 'src/auth/role/helpers/role.enum';
import { AuthGuard } from './guards/auth.guard';
import { IUser } from 'src/auth/user/user.interface';
import { UserNotExistPipe } from './user/user-not-exist.pipe';

@ApiTags('Authentication')
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
  async register(@Body(UserNotExistPipe) dto: AuthDto): Promise<IUser> {
    return await this.userService.addUser({ ...dto, roles: [Role.USER] });
  }
}
