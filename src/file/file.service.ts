import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { IdDto } from 'src/common/dto/id.dto';
import { Repository } from 'typeorm';
import { File } from './file.entity';
import { FileS3Service } from './file-s3.service';
@Injectable()
export class FileService {
  constructor(
    @InjectRepository(File) private readonly fileRepo: Repository<File>,
    private readonly s3Service: FileS3Service,
  ) {}
  add(files: Express.Multer.File[]): Promise<File[]> {
    return Promise.all(
      files.map(async (file) => {
        const uploadResult = await this.s3Service.addFile(file);
        const ent = this.fileRepo.create({
          name: uploadResult.Key,
          url: uploadResult.Location,
        });
        return await this.fileRepo.save(ent);
      }),
    );
  }

  getFile(id: IdDto): Promise<File> {
    return this.fileRepo.findOneBy(id);
  }

  async remove(id: IdDto): Promise<void> {
    const ent = await this.fileRepo.findOneBy(id);
    if (ent) {
      await this.s3Service.removeFile(ent.name);

      await this.fileRepo.remove(ent);
    }
  }
}
