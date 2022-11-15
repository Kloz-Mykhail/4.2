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
import { CreatePlanetDto } from './dto/create-planet.dto';
import { PlanetService } from './planet.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdatePlanetDto } from './dto/update-planet.dto';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { IPlanet } from './planet.interface';
import { Roles } from 'src/auth/role/roles.decorator';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Planet } from './planet.entity';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';

@ApiTags('Planets')
@Controller('planets')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(Planet)
@UseInterceptors(ClassSerializerInterceptor)
export class PlanetController {
  constructor(private readonly planetService: PlanetService) {}

  @Post()
  @ApiResponseData(Planet, HttpStatus.CREATED)
  @ApiOperation({ summary: 'Add one new planet' })
  @Roles(Role.ADMIN)
  addOne(@Body() dto: CreatePlanetDto, @Req() req: Request): Promise<IPlanet> {
    return this.planetService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(Planet)
  @ApiOperation({ summary: 'Get planet by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<IPlanet> {
    return this.planetService.getOneBy(id);
  }

  @Get()
  @ApiPaginatedResponse(Planet)
  @ApiOperation({ summary: 'Get many planets' })
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<Planet>> {
    return this.planetService.getMany(pag, req);
  }

  @Patch('/:id')
  @ApiResponseData(Planet)
  @ApiOperation({ summary: 'Update planet by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdatePlanetDto,
  ): Promise<IPlanet> {
    return this.planetService.patchUpdateBy(id, dto);
  }

  @Put('/:id')
  @ApiResponseData(Planet)
  @ApiOperation({ summary: 'Update planet by id' })
  @Roles(Role.ADMIN)
  updeteOne(
    @Param() id: IdDto,
    @Body() dto: CreatePlanetDto,
  ): Promise<IPlanet> {
    return this.planetService.updateBy(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one planet by id' })
  @ApiNoContentResponse()
  @HttpCode(HttpStatus.NO_CONTENT)
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.planetService.deleteBy(id);
  }
}
