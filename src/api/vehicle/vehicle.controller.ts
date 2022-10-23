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
import { CreateVehicleDto } from './dto/create-vehicle.dto';
import { VehicleService } from './vehicle.service';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { ParsePagPipe } from 'src/common/parse-pag-query.pipe';
import { PagDto } from 'src/common/dto/pag.dto';
import { UpdateVehicleDto } from './dto/update-vehicle.dto';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { ID, Ok } from 'src/common/common.interface';
import { IVehicle } from './vehicle.interface';
@ApiTags('api/vehicles')
@Controller('api/vehicles')
export class VehicleController {
  constructor(private readonly vehicleService: VehicleService) {}

  @Post()
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  @ApiOperation({ summary: 'Add one vehicle' })
  addOne(
    @Body(ValidationPipe) dto: CreateVehicleDto,
    @Req() req: Request,
  ): Promise<ID> {
    console.log(dto);
    return this.vehicleService.addOne(dto, req);
  }

  @Get('/:id')
  @ApiOperation({ summary: 'Get one vehicle by id' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getOneById(@Param() id: IdDto): Promise<IVehicle> {
    return this.vehicleService.getOneById(id);
  }

  @Get()
  @ApiOperation({ summary: 'Get many vehicles' })
  @UseGuards(new RoleGuard([Roles.USER, Roles.ADMIN]))
  getMany(@Query(ParsePagPipe) pag: PagDto): Promise<IVehicle[]> {
    return this.vehicleService.getMany(pag);
  }

  @Put('/:id')
  @ApiOperation({ summary: 'Update one vehicle by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  updeteOne(
    @Param(ValidationPipe) id: IdDto,
    @Body(ValidationPipe) dto: UpdateVehicleDto,
  ): Promise<Ok> {
    return this.vehicleService.updateById(id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Delete one vehicle by id' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  deleteOne(@Body(ValidationPipe) id: IdDto): Promise<Ok> {
    return this.vehicleService.deleteById(id);
  }
}
