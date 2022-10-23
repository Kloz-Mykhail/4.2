import { Module } from '@nestjs/common';
import { FileService } from './file.service';
import { FileController } from './file.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { File } from './file.entity';
import { MulterModule } from '@nestjs/platform-express';
import { FileS3Service } from './file-s3.service';

@Module({
  imports: [TypeOrmModule.forFeature([File]), MulterModule.register()],
  controllers: [FileController],
  providers: [FileService, FileS3Service],
})
export class FileModule {}
