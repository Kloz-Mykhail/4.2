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
import { DPlanet, RIDPlanet } from '../planet.interface';
export class RUpdatePlanetDto implements Partial<RIDPlanet> {
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  films?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsArray()
  @IsOptional()
  residents?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsArray()
  @IsOptional()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files?: IdDto[];
}
export class UpdatePlanetDto implements Partial<DPlanet> {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  name?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  rotation_period?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  orbital_period?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  diameter?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  climate?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  gravity?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  terrain?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  surface_water?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  population?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => RUpdatePlanetDto)
  relations?: RUpdatePlanetDto;
}
