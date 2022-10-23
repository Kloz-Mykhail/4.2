import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsArray, IsObject, IsString, ValidateNested } from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DVehicle, RIDVehicle } from '../vehicle.interface';
export class RCreateVehicleDto implements RIDVehicle {
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  pilots: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files: IdDto[];
}
export class CreateVehicleDto implements DVehicle {
  @ApiProperty()
  @IsString()
  consumables: string;
  @ApiProperty()
  @IsString()
  cargo_capacity: string;
  @ApiProperty()
  @IsString()
  cost_in_credits: string;
  @ApiProperty()
  @IsString()
  crew: string;
  @ApiProperty()
  @IsString()
  length: string;
  @ApiProperty()
  @IsString()
  manufacturer: string;
  @ApiProperty()
  @IsString()
  max_atmosphering_speed: string;
  @ApiProperty()
  @IsString()
  model: string;
  @ApiProperty()
  @IsString()
  name: string;
  @ApiProperty()
  @IsString()
  passengers: string;
  @ApiProperty()
  @IsString()
  vehicle_class: string;

  @IsObject()
  @ValidateNested()
  @Type(() => RCreateVehicleDto)
  relations: RCreateVehicleDto;
}
