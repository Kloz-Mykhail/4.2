import { DataSource } from 'typeorm';
import * as dotenv from 'dotenv';
import { MysqlConnectionOptions } from 'typeorm/driver/mysql/MysqlConnectionOptions';
import { ENV_FILE_NAME } from 'src/app.constants';

dotenv.config({
  path: ENV_FILE_NAME,
});
export const typeOrmConfig: MysqlConnectionOptions = {
  type: 'mysql',
  host: process.env.DB_HOST,
  username: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: +process.env.DB_PORT,

  synchronize: false,
  entities: ['dist/**/*.entity{.js,.ts}'],
  dropSchema: false,
  logging: true,
  migrations: ['dist/**/migrations/*{.js, .ts}'],
  migrationsTableName: 'migrations_typeorm',
};

export default new DataSource(typeOrmConfig);
