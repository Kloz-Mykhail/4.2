import { Injectable } from '@nestjs/common';
import { ResourceService } from 'src/common/resource.service';
import { CreateVehicleDto } from './dto/create-vehicle.dto';
import { UpdateVehicleDto } from './dto/update-vehicle.dto';
import { DVehicle, RIDVehicle } from './vehicle.interface';
import { Vehicle } from './vehicle.entity';
import { VehicleRepository } from './vehicle.repository';
@Injectable()
export class VehicleService extends ResourceService<
  CreateVehicleDto,
  UpdateVehicleDto,
  Vehicle,
  DVehicle,
  RIDVehicle
> {
  constructor(vehicleRepo: VehicleRepository) {
    super(vehicleRepo);
  }
}
