import { getEnvVar } from './config';

export const getDumpConfig = () => {
  const { mysql } = getEnvVar();
  return {
    connection: {
      host: mysql.host,
      user: mysql.user,
      password: mysql.password,
      database: mysql.database,
      port: mysql.port,
    },
    dumpToFile: 'database/backups/dump.sql',
  };
};
