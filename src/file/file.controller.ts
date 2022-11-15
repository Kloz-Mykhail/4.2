import {
  Controller,
  Post,
  Param,
  Delete,
  UseInterceptors,
  UploadedFiles,
  UseGuards,
  HttpCode,
  HttpStatus,
  Get,
} from '@nestjs/common';
import { FileService } from './file.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { multerOptions } from 'src/file/helpers/multer.options';
import { IdDto } from 'src/common/dto/id.dto';
import {
  ApiBody,
  ApiConsumes,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { FILES_FIELD, MAX_COUNT_FILES } from 'src/app.constants';
import { UploadFileDto } from './dto/upload-file.dto';
import { Roles } from 'src/auth/role/roles.decorator';
import { IFile } from './file.interface';

@ApiTags('Work with files')
@Controller('files')
export class FileController {
  constructor(private readonly fileService: FileService) {}

  @Post()
  @HttpCode(HttpStatus.OK)
  @ApiConsumes('multipart/form-data')
  @ApiOperation({ summary: 'Upload file' })
  @ApiBody({ type: UploadFileDto })
  @Roles(Role.ADMIN)
  @UseGuards(RoleAuthGuard)
  @UseInterceptors(
    FilesInterceptor(FILES_FIELD, MAX_COUNT_FILES, multerOptions),
  )
  create(
    @UploadedFiles()
    files: Express.Multer.File[],
  ): Promise<IFile[]> {
    return this.fileService.add(files);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get data of file' })
  @Roles(Role.USER, Role.ADMIN)
  @UseGuards(RoleAuthGuard)
  getFileData(@Param() dto: IdDto): Promise<IFile> {
    return this.fileService.getFile(dto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiOperation({ summary: 'Delete uploaded file' })
  @Roles(Role.ADMIN)
  @UseGuards(RoleAuthGuard)
  remove(@Param() id: IdDto): Promise<void> {
    return this.fileService.remove(id);
  }
}
