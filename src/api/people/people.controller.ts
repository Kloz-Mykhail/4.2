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
import { CreatePeopleDto } from './dto/create-people.dto';
import { PeopleService } from './people.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { PagDto } from 'src/common/dto/pag.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { UpdatePeopleDto } from './dto/update-people.dto';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { ID, Ok } from 'src/common/common.interface';
import { IPeople } from './people.interface';

@ApiTags('api/people')
@Controller('api/people')
export class PeopleController {
  constructor(private readonly peopleService: PeopleService) {}

  @Post()
  @ApiOperation({ summary: 'Add new people' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  addOne(@Body() dto: CreatePeopleDto, @Req() req: Request): Promise<ID> {
    return this.peopleService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get one people by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<IPeople> {
    return this.peopleService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many people' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<IPeople[]> {
    return this.peopleService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update people by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(@Param() id: IdDto, @Body() dto: UpdatePeopleDto): Promise<Ok> {
    return this.peopleService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one people by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body() id: IdDto): Promise<Ok> {
    return this.peopleService.deleteById(id);
  }
}
