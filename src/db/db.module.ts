import { Module } from '@nestjs/common';
import { CronModule } from './cron/cron.module';

@Module({
  imports: [CronModule],
})
export class DbModule {}
