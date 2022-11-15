import {
  Body,
  ClassSerializerInterceptor,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Patch,
  Post,
  Put,
  Query,
  Req,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { PagDto } from 'src/common/dto/pag.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { Role } from 'src/auth/role/helpers/role.enum';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Roles } from 'src/auth/role/roles.decorator';
import { CreateFilmDto } from './dto/create-film.dto';
import { UpdateFilmDto } from './dto/update-film.dto';
import { IFilm } from './film.interface';
import { FilmService } from './film.service';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Film } from './film.entity';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';

@ApiTags('Films')
@Controller('films')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(Film)
@UseInterceptors(ClassSerializerInterceptor)
export class FilmController {
  constructor(private readonly filmService: FilmService) {}

  @Post()
  @ApiResponseData(Film, HttpStatus.CREATED)
  @ApiOperation({ summary: 'Add new film' })
  @Roles(Role.ADMIN)
  addOne(@Body() dto: CreateFilmDto, @Req() req: Request): Promise<IFilm> {
    return this.filmService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(Film)
  @ApiOperation({ summary: 'Get one film by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<IFilm> {
    return this.filmService.getOneBy(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many films' })
  @ApiPaginatedResponse(Film)
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<Film>> {
    return this.filmService.getMany(pag, req);
  }

  @Put('/:id')
  @ApiResponseData(Film)
  @ApiOperation({ summary: 'Update film by id' })
  @Roles(Role.ADMIN)
  updeteOne(@Param() id: IdDto, @Body() dto: CreateFilmDto): Promise<IFilm> {
    return this.filmService.updateBy(id, dto);
  }

  @Patch('/:id')
  @ApiResponseData(Film)
  @ApiOperation({ summary: 'Update film by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdateFilmDto,
  ): Promise<IFilm> {
    return this.filmService.patchUpdateBy(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete film by id' })
  @ApiNoContentResponse()
  @HttpCode(HttpStatus.NO_CONTENT)
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.filmService.deleteBy(id);
  }
}
