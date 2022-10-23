import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsArray, IsObject, IsString, ValidateNested } from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DPlanet, RIDPlanet } from '../planet.interface';
export class RCreatePlanetDto implements RIDPlanet {
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  residents: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files: IdDto[];
}
export class CreatePlanetDto implements DPlanet {
  @ApiProperty()
  @IsString()
  name: string;
  @ApiProperty()
  @IsString()
  rotation_period: string;
  @ApiProperty()
  @IsString()
  orbital_period: string;
  @ApiProperty()
  @IsString()
  diameter: string;
  @ApiProperty()
  @IsString()
  climate: string;
  @ApiProperty()
  @IsString()
  gravity: string;
  @ApiProperty()
  @IsString()
  terrain: string;
  @ApiProperty()
  @IsString()
  surface_water: string;
  @ApiProperty()
  @IsString()
  population: string;
  @ApiProperty()
  @IsObject()
  @ValidateNested()
  @Type(() => RCreatePlanetDto)
  relations: RCreatePlanetDto;
}
