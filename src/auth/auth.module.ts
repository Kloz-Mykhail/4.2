import { Module } from '@nestjs/common';
import { UserModule } from 'src/auth/user/user.module';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { AuthStrategy } from './strategy/auth.strategy';
import { SesionSerializer } from './session/session.serializer';
import { AuthLocalGuard } from './guards/auth-local.guard';
import { AuthGuard } from './guards/auth.guard';
import { RoleModule } from './role/role.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './user/user.entity';

@Module({
  imports: [UserModule, RoleModule, TypeOrmModule.forFeature([User])],
  controllers: [AuthController],
  providers: [
    AuthService,
    AuthStrategy,
    SesionSerializer,
    AuthLocalGuard,
    AuthGuard,
  ],
})
export class AuthModule {}
