import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsObject,
  IsOptional,
  IsString,
  ValidateNested,
} from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DVehicle, RIDVehicle } from '../vehicle.interface';
export class RUpdateVehicleDto implements Partial<RIDVehicle> {
  @ApiProperty({ required: false, type: [IdDto] })
  @IsArray()
  @IsOptional()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  pilots?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files?: IdDto[];
}
export class UpdateVehicleDto implements Partial<DVehicle> {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  consumables: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  cargo_capacity: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  cost_in_credits: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  crew: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  length: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  manufacturer: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  max_atmosphering_speed: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  model: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  name: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  passengers: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  vehicle_class: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => RUpdateVehicleDto)
  relations: RUpdateVehicleDto;
}
