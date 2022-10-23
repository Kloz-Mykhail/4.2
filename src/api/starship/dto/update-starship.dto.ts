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
import { DStarship, RIDStarship } from '../starship.interface';
export class RUpdateStarshipDto implements Partial<RIDStarship> {
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
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
export class UpdateStarshipDto implements Partial<DStarship> {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  MGLT?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  cargo_capacity?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  consumables?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  cost_in_credits?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  crew?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  hyperdrive_rating?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  length?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  manufacturer?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  max_atmosphering_speed?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  model?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  name?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  passengers?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  starship_class?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => RUpdateStarshipDto)
  relations?: RUpdateStarshipDto;
}
