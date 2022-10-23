import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { Request } from 'express';
import { ID, Ok } from 'src/common/common.interface';
import { IdDto } from 'src/common/dto/id.dto';
import { PagDto } from 'src/common/dto/pag.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { Roles } from 'src/role/helpers/role.enum';
import { RoleGuard } from 'src/role/role.guard';
import { CreateFilmDto } from './dto/create-film.dto';
import { UpdateFilmDto } from './dto/update-film.dto';
import { IFilm } from './film.interface';
import { FilmService } from './film.service';

@ApiTags('api/films')
@Controller('api/films')
export class FilmController {
  constructor(private readonly filmService: FilmService) {}

  @Post()
  @ApiOperation({ summary: 'Add new film' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  addOne(@Body() dto: CreateFilmDto, @Req() req: Request): Promise<ID> {
    return this.filmService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get one film by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<IFilm> {
    return this.filmService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many films' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<IFilm[]> {
    return this.filmService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update film by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(@Param() id: IdDto, @Body() dto: UpdateFilmDto): Promise<Ok> {
    console.log(dto);
    dto.relations.files;
    return this.filmService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete film by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body() id: IdDto): Promise<Ok> {
    return this.filmService.deleteById(id);
  }
}
