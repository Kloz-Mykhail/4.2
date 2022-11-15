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
import { CreateStarshipDto } from './dto/create-starship.dto';
import { StarshipService } from './starship.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateStarshipDto } from './dto/update-starship.dto';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { IStarship } from './starship.interface';
import { Roles } from 'src/auth/role/roles.decorator';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Starship } from './starship.entity';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';

@ApiTags('Starships')
@Controller('starships')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(Starship)
@UseInterceptors(ClassSerializerInterceptor)
export class StarshipController {
  constructor(private readonly starshipService: StarshipService) {}

  @Post()
  @Roles(Role.ADMIN)
  @ApiResponseData(Starship, HttpStatus.CREATED)
  @ApiOperation({ summary: 'Add one specie' })
  addOne(
    @Body() dto: CreateStarshipDto,
    @Req() req: Request,
  ): Promise<IStarship> {
    return this.starshipService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(Starship)
  @ApiOperation({ summary: 'Get one specie by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<IStarship> {
    return this.starshipService.getOneBy(id);
  }

  @Get()
  @ApiPaginatedResponse(Starship)
  @ApiOperation({ summary: 'Add many species' })
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<Starship>> {
    return this.starshipService.getMany(pag, req);
  }

  @Patch('/:id')
  @ApiResponseData(Starship)
  @ApiOperation({ summary: 'Update one specie by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdateStarshipDto,
  ): Promise<IStarship> {
    return this.starshipService.patchUpdateBy(id, dto);
  }

  @Put('/:id')
  @ApiResponseData(Starship)
  @ApiOperation({ summary: 'Update one specie by id' })
  @Roles(Role.ADMIN)
  updeteOne(
    @Param() id: IdDto,
    @Body() dto: CreateStarshipDto,
  ): Promise<IStarship> {
    return this.starshipService.updateBy(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one specie by id' })
  @ApiNoContentResponse()
  @HttpCode(HttpStatus.NO_CONTENT)
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.starshipService.deleteBy(id);
  }
}
