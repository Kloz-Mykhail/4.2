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
import { CreatePeopleDto } from './dto/create-people.dto';
import { PeopleService } from './people.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { PagDto } from 'src/common/dto/pag.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { UpdatePeopleDto } from './dto/update-people.dto';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { IPeople } from './people.interface';
import { Roles } from 'src/auth/role/roles.decorator';
import { Pagination } from 'nestjs-typeorm-paginate';
import { People } from './people.entity';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';

@ApiTags('People')
@Controller('people')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(People)
@UseInterceptors(ClassSerializerInterceptor)
export class PeopleController {
  constructor(private readonly peopleService: PeopleService) {}

  @Post()
  @ApiOperation({ summary: 'Add new people' })
  @ApiResponseData(People, HttpStatus.CREATED)
  @Roles(Role.ADMIN)
  addOne(@Body() dto: CreatePeopleDto, @Req() req: Request): Promise<IPeople> {
    return this.peopleService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(People)
  @ApiOperation({ summary: 'Get one people by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<IPeople> {
    return this.peopleService.getOneBy(id);
  }

  @Get()
  @ApiPaginatedResponse(People)
  @ApiOperation({ summary: 'Get many people' })
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<People>> {
    return this.peopleService.getMany(pag, req);
  }

  @Put('/:id')
  @ApiPaginatedResponse(People)
  @ApiOperation({ summary: 'Update people by id' })
  @Roles(Role.ADMIN)
  updeteOne(
    @Param() id: IdDto,
    @Body() dto: CreatePeopleDto,
  ): Promise<IPeople> {
    return this.peopleService.updateBy(id, dto);
  }

  @Patch('/:id')
  @ApiPaginatedResponse(People)
  @ApiOperation({ summary: 'Update people by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdatePeopleDto,
  ): Promise<IPeople> {
    return this.peopleService.patchUpdateBy(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one people by id' })
  @ApiNoContentResponse()
  @HttpCode(HttpStatus.NO_CONTENT)
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.peopleService.deleteBy(id);
  }
}
