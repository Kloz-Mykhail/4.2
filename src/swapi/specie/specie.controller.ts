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
import { CreateSpecieDto } from './dto/create-specie.dto';
import { Request } from 'express';
import { SpecieService } from './specie.service';
import { IdDto } from 'src/common/dto/id.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateSpecieDto } from './dto/update-specie.dto';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { ISpecie } from './specie.interface';
import { Roles } from 'src/auth/role/roles.decorator';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Specie } from './specie.entity';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';

@ApiTags('Species')
@Controller('species')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(Specie)
@UseInterceptors(ClassSerializerInterceptor)
export class SpecieController {
  constructor(private readonly specieService: SpecieService) {}

  @Post()
  @ApiResponseData(Specie, HttpStatus.CREATED)
  @ApiOperation({ summary: 'Add new specie' })
  @Roles(Role.ADMIN)
  addOne(@Body() dto: CreateSpecieDto, @Req() req: Request): Promise<ISpecie> {
    return this.specieService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(Specie)
  @ApiOperation({ summary: 'Get one specie by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<ISpecie> {
    return this.specieService.getOneBy(id);
  }

  @Get()
  @ApiPaginatedResponse(Specie)
  @ApiOperation({ summary: 'Get many species' })
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<Specie>> {
    return this.specieService.getMany(pag, req);
  }

  @Put('/:id')
  @ApiResponseData(Specie)
  @ApiOperation({ summary: 'Update one specie by id' })
  @Roles(Role.ADMIN)
  updeteOne(
    @Param() id: IdDto,
    @Body() dto: CreateSpecieDto,
  ): Promise<ISpecie> {
    return this.specieService.updateBy(id, dto);
  }

  @Patch('/:id')
  @ApiResponseData(Specie)
  @ApiOperation({ summary: 'Update one specie by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdateSpecieDto,
  ): Promise<ISpecie> {
    return this.specieService.patchUpdateBy(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one specie by id' })
  @ApiNoContentResponse()
  @HttpCode(HttpStatus.NO_CONTENT)
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.specieService.deleteBy(id);
  }
}
