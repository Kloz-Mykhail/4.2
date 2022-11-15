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
import { CreateVehicleDto } from './dto/create-vehicle.dto';
import { VehicleService } from './vehicle.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { DefaultPagValuePipe } from 'src/common/pipes/default-pag-value.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateVehicleDto } from './dto/update-vehicle.dto';
import {
  ApiExtraModels,
  ApiNoContentResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { RoleAuthGuard } from 'src/auth/guards/role-auth.guard';
import { Role } from 'src/auth/role/helpers/role.enum';
import { IVehicle } from './vehicle.interface';
import { Roles } from 'src/auth/role/roles.decorator';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Vehicle } from './vehicle.entity';
import { ApiResponseData } from 'src/common/docs/data-response-api.decorator';
import { ApiPaginatedResponse } from 'src/common/docs/paginate-response-api.decorator';

@ApiTags('Vehicles')
@Controller('vehicles')
@UseGuards(RoleAuthGuard)
@ApiExtraModels(Vehicle)
@UseInterceptors(ClassSerializerInterceptor)
export class VehicleController {
  constructor(private readonly vehicleService: VehicleService) {}

  @Post()
  @Roles(Role.ADMIN)
  @ApiResponseData(Vehicle, HttpStatus.CREATED)
  @ApiOperation({ summary: 'Add one vehicle' })
  addOne(
    @Body() dto: CreateVehicleDto,
    @Req() req: Request,
  ): Promise<IVehicle> {
    console.log(dto);
    return this.vehicleService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiResponseData(Vehicle)
  @ApiOperation({ summary: 'Get one vehicle by id' })
  @Roles(Role.USER, Role.ADMIN)
  getOneById(@Param() id: IdDto): Promise<IVehicle> {
    return this.vehicleService.getOneBy(id);
  }

  @Get()
  @ApiPaginatedResponse(Vehicle)
  @ApiOperation({ summary: 'Get many vehicles' })
  @Roles(Role.USER, Role.ADMIN)
  getMany(
    @Query(DefaultPagValuePipe) pag: PagDto,
    @Req() req: Request,
  ): Promise<Pagination<Vehicle>> {
    return this.vehicleService.getMany(pag, req);
  }

  @Put('/:id')
  @ApiResponseData(Vehicle)
  @ApiOperation({ summary: 'Update one vehicle by id' })
  @Roles(Role.ADMIN)
  updeteOne(
    @Param() id: IdDto,
    @Body() dto: CreateVehicleDto,
  ): Promise<IVehicle> {
    return this.vehicleService.updateBy(id, dto);
  }

  @Patch('/:id')
  @ApiResponseData(Vehicle)
  @ApiOperation({ summary: 'Update one vehicle by id' })
  @Roles(Role.ADMIN)
  patchUpdeteOne(
    @Param() id: IdDto,
    @Body() dto: UpdateVehicleDto,
  ): Promise<IVehicle> {
    return this.vehicleService.patchUpdateBy(id, dto);
  }

  @Delete()
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiOperation({ summary: 'Delete one vehicle by id' })
  @Roles(Role.ADMIN)
  deleteOne(@Body() id: IdDto): Promise<void> {
    return this.vehicleService.deleteBy(id);
  }
}
