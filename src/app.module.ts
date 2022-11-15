import { Module } from '@nestjs/common';
import { SwapiModule } from './swapi/swapi.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { DbModule } from './db/db.module';
import { AuthModule } from './auth/auth.module';
import { PassportModule } from '@nestjs/passport';
import { FileModule } from './file/file.module';
import { ENV_FILE_PATH } from './app.constants';
import { getTypeormConfig } from './configs/data-source.config';
import { getEnvVar } from './configs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: ENV_FILE_PATH,
      isGlobal: true,
      load: [getEnvVar],
    }),
    TypeOrmModule.forRoot(getTypeormConfig()),
    PassportModule.register({ session: true }),
    SwapiModule,
    DbModule,
    AuthModule,
    FileModule,
  ],
})
export class AppModule {}
