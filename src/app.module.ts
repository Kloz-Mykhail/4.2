import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { ApiModule } from './api/api.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmAsyncConfig } from './configs/orm.config';
import { LoggerMiddleware } from './common/logger';
import { ConfigModule } from '@nestjs/config';
import { DbModule } from './db/db.module';
import { UserModule } from './user/user.module';
import { RoleModule } from './role/role.module';
import { AuthModule } from './auth/auth.module';
import { PassportModule } from '@nestjs/passport';
import { FileModule } from './file/file.module';
import { ENV_FILE_NAME } from './app.constants';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: ENV_FILE_NAME,
      isGlobal: true,
    }),
    ApiModule,
    DbModule,
    UserModule,
    RoleModule,
    AuthModule,
    FileModule,

    TypeOrmModule.forRootAsync(typeOrmAsyncConfig),
    PassportModule.register({ session: true }),
  ],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}
