import * as dotenv from 'dotenv';
import { ENV_FILE_PATH } from 'src/app.constants';

dotenv.config({ path: ENV_FILE_PATH });
const { env } = process;
export type Mysql = typeof config.mysql;
export type Aws = typeof config.aws;
export type Session = typeof config.session;

const config = {
  env: env.NODE_ENV,
  port: +env.PORT || 3000,
  mysql: {
    user: env.DB_USER,
    password: env.DB_PASS,
    database: env.DB_NAME,
    host: env.DB_HOST,
    port: +env.MYSQL_PORT,
  },
  aws: {
    region: env.AWS_REGION,
    keyId: env.AWS_ACCESS_KEY_ID,
    secretKey: env.AWS_SECRET_ACCESS_KEY,
    bucketName: env.AWS_PUBLIC_BUCKET_NAME,
  },
  session: {
    secretKey: env.SESSION_SECRET_KEY,
  },
};
export const getEnvVar = () => config;
