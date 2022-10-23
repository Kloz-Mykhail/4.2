import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt } from 'class-validator';

export class PagDto {
  @ApiProperty({ required: false, default: 0 })
  @IsInt()
  @Type(() => Number)
  offset: number;
  @ApiProperty({ required: false, default: 10 })
  @IsInt()
  @Type(() => Number)
  count: number;
}
