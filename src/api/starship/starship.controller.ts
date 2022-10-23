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
import { CreateStarshipDto } from './dto/create-starship.dto';
import { StarshipService } from './starship.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateStarshipDto } from './dto/update-starship.dto';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { IStarship } from './starship.interface';
import { ID, Ok } from 'src/common/common.interface';
@ApiTags('api/starships')
@Controller('api/starships')
export class StarshipController {
  constructor(private readonly starshipService: StarshipService) {}

  @Post()
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  @ApiOperation({ summary: 'Add one specie' })
  addOne(
    @Body(ValidationPipe) dto: CreateStarshipDto,
    @Req() req: Request,
  ): Promise<ID> {
    return this.starshipService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get one specie by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<IStarship> {
    return this.starshipService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Add many species' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<IStarship[]> {
    return this.starshipService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update one specie by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(
    @Param(ValidationPipe) id: IdDto,
    @Body(ValidationPipe) dto: UpdateStarshipDto,
  ): Promise<Ok> {
    return this.starshipService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one specie by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body(ValidationPipe) id: IdDto): Promise<Ok> {
    return this.starshipService.deleteById(id);
  }
}
