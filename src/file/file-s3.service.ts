import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { S3 } from 'aws-sdk';
import { v4 as uuid } from 'uuid';

@Injectable()
export class FileS3Service {
  constructor(private readonly configService: ConfigService) {}

  async addFile(file: Express.Multer.File) {
    const s3 = new S3();
    const uploadResult = await s3
      .upload({
        Bucket: this.configService.get('AWS_PUBLIC_BUCKET_NAME'),
        Body: file.buffer,
        Key: `${uuid()}-${file.originalname}`,
      })
      .promise();
    return uploadResult;
  }

  async removeFile(name: string) {
    const s3 = new S3();
    await s3
      .deleteObject({
        Bucket: this.configService.get('AWS_PUBLIC_BUCKET_NAME'),
        Key: name,
      })
      .promise();
  }
}
