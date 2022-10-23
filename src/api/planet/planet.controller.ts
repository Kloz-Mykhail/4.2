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
import { CreatePlanetDto } from './dto/create-planet.dto';
import { PlanetService } from './planet.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdatePlanetDto } from './dto/update-planet.dto';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { ID, Ok } from 'src/common/common.interface';
import { IPlanet } from './planet.interface';

@ApiTags('api/planets')
@Controller('api/planets')
export class PlanetController {
  constructor(private readonly planetService: PlanetService) {}

  @Post()
  @ApiOperation({ summary: 'Add one new planet' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  addOne(
    @Body(ValidationPipe) dto: CreatePlanetDto,
    @Req() req: Request,
  ): Promise<ID> {
    return this.planetService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get planet by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<IPlanet> {
    return this.planetService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many planets' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<IPlanet[]> {
    return this.planetService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update planet by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(
    @Param(ValidationPipe) id: IdDto,
    @Body(ValidationPipe) dto: UpdatePlanetDto,
  ): Promise<Ok> {
    return this.planetService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one planet by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body(ValidationPipe) id: IdDto): Promise<Ok> {
    return this.planetService.deleteById(id);
  }
}
