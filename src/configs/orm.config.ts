import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModuleAsyncOptions } from '@nestjs/typeorm';
import { MysqlConnectionOptions } from 'typeorm/driver/mysql/MysqlConnectionOptions';

export const typeOrmAsyncConfig: TypeOrmModuleAsyncOptions = {
  imports: [ConfigModule],
  inject: [ConfigService],
  useFactory: async (
    configService: ConfigService,
  ): Promise<MysqlConnectionOptions> => {
    return {
      type: 'mysql',
      host: configService.get('DB_HOST'),
      username: configService.get('DB_USER'),
      password: configService.get('DB_PASS'),
      database: configService.get('DB_NAME'),
      port: +configService.get('DB_PORT'),

      synchronize: false,
      entities: ['dist/**/*.entity{.js,.ts}'],
      dropSchema: false,
      logging: true,
      migrations: ['dist/**/migrations/*{.js, .ts}'],
      migrationsTableName: 'migrations_typeorm',
    };
  },
};
