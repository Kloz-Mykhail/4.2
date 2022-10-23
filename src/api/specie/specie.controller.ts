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
  ValidationPipe,
} from '@nestjs/common';
import { CreateSpecieDto } from './dto/create-specie.dto';
import { Request } from 'express';
import { SpecieService } from './specie.service';
import { IdDto } from 'src/common/dto/id.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateSpecieDto } from './dto/update-specie.dto';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { ID, Ok } from 'src/common/common.interface';
import { ISpecie } from './specie.interface';

@ApiTags('api/species')
@Controller('api/species')
export class SpecieController {
  constructor(private readonly specieService: SpecieService) {}

  @Post()
  @ApiOperation({ summary: 'Add new specie' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  addOne(
    @Body(ValidationPipe) dto: CreateSpecieDto,
    @Req() req: Request,
  ): Promise<ID> {
    return this.specieService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get one specie by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<ISpecie> {
    return this.specieService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many species' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<ISpecie[]> {
    return this.specieService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update one specie by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(
    @Param(ValidationPipe) id: IdDto,
    @Body(ValidationPipe) dto: UpdateSpecieDto,
  ): Promise<Ok> {
    return this.specieService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one specie by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body(ValidationPipe) id: IdDto): Promise<Ok> {
    return this.specieService.deleteById(id);
  }
}
