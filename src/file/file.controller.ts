import {
  Controller,
  Post,
  Param,
  Delete,
  UseInterceptors,
  UploadedFiles,
  ValidationPipe,
  UseGuards,
} from '@nestjs/common';
import { FileService } from './file.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { multerOptions } from 'src/file/helpers/multer.options';
import { IdDto } from 'src/common/dto/id.dto';
import { ApiBody, ApiConsumes, ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { FILES_FIELD, MAX_COUNT_FILES } from 'src/app.constants';
import { UploadFileDto } from './dto/upload-file.dto';

@ApiTags('files')
@Controller('files')
export class FileController {
  constructor(private readonly fileService: FileService) {}

  @Post()
  @ApiConsumes('multipart/form-data')
  @ApiOperation({ summary: 'Add images' })
  @ApiBody({ type: UploadFileDto })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  @UseInterceptors(
    FilesInterceptor(FILES_FIELD, MAX_COUNT_FILES, multerOptions),
  )
  create(
    @UploadedFiles()
    files: Express.Multer.File[],
  ) {
    return this.fileService.add(files);
  }

  @Delete(':id')
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  @ApiOperation({ summary: 'Delete images' })
  remove(@Param(ValidationPipe) id: IdDto) {
    return this.fileService.remove(id);
  }
}
