import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsArray, IsObject, IsString, ValidateNested } from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DStarship, RIDStarship } from '../starship.interface';
export class RCreateStarshipDto implements RIDStarship {
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
export class CreateStarshipDto implements DStarship {
  @ApiProperty()
  @IsString()
  MGLT: string;
  @ApiProperty()
  @IsString()
  cargo_capacity: string;
  @ApiProperty()
  @IsString()
  consumables: string;
  @ApiProperty()
  @IsString()
  cost_in_credits: string;
  @ApiProperty()
  @IsString()
  crew: string;
  @ApiProperty()
  @IsString()
  hyperdrive_rating: string;
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
  starship_class: string;

  @ApiProperty()
  @IsObject()
  @ValidateNested()
  @Type(() => RCreateStarshipDto)
  relations: RCreateStarshipDto;
}
