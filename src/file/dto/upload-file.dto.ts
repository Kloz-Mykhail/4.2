import { ApiProperty } from '@nestjs/swagger';
import { FILES_FIELD } from 'src/app.constants';

export class UploadFileDto {
  @ApiProperty({ type: ['file'] })
  [FILES_FIELD]: any[];
}
