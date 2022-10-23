import { Injectable } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';
import dump from 'mysqldump';
import { dumpConfig } from '../../configs/db-dump.config';

@Injectable()
export class CronService {
  @Cron(CronExpression.EVERY_DAY_AT_MIDNIGHT, { name: 'db-dump' })
  makeDump() {
    dump(dumpConfig);
  }
}
