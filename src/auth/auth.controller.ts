import {
  Controller,
  Post,
  UseGuards,
  Get,
  Req,
  Body,
  HttpCode,
  HttpStatus,
  ClassSerializerInterceptor,
  UseInterceptors,
} from '@nestjs/common';
import {
  ApiBody,
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
  OmitType,
} from '@nestjs/swagger';
import { AuthDto } from './dto/auth.dto';
import { AuthLocalGuard } from './guards/auth-local.guard';
import { UserService } from 'src/auth/user/user.service';
import { Role } from 'src/auth/role/helpers/role.enum';
import { AuthGuard } from './guards/auth.guard';
import { IUser } from 'src/auth/user/user.interface';
import { UserNotExistPipe } from './user/user-not-exist.pipe';
import { User } from './user/user.entity';
import { promisify } from 'util';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
const ApiUser = OmitType(User, ['password']);
@ApiTags('Authentication')
@Controller('auth')
@ApiExtraModels(ApiUser)
@UseInterceptors(ClassSerializerInterceptor)
export class AuthController {
  constructor(private readonly userService: UserService) {}
  @Post('/login')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiOperation({ summary: 'Create session for authirization' })
  @ApiBody({ type: AuthDto })
  @UseGuards(AuthLocalGuard)
  login(): void {
    return;
  }

  @Get('/logout')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiOperation({ summary: 'Logout' })
  @UseGuards(AuthGuard)
  async logout(@Req() req): Promise<void> {
    await promisify(req.logOut)();
  }

  @Post('/register')
  @ApiOperation({ summary: 'Register' })
  @ApiResponseData(ApiUser, HttpStatus.CREATED)
  async register(@Body(UserNotExistPipe) dto: AuthDto): Promise<IUser> {
    return await this.userService.addUser({ ...dto, roles: [Role.USER] });
  }
}
