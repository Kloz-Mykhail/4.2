import { Module } from '@nestjs/common';
import { UserModule } from 'src/user/user.module';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { AuthStrategy } from './auth.strategy';
import { SesionSerializer } from './session.serializer';

@Module({
  imports: [UserModule],
  controllers: [AuthController],
  providers: [AuthService, AuthStrategy, SesionSerializer],
})
export class AuthModule {}
