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
import { DSpecie, RIDSpecie } from '../specie.interface';
export class RUpdateSpecieDto implements Partial<RIDSpecie> {
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
  people?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files?: IdDto[];
}
export class UpdateSpecieDto implements Partial<DSpecie> {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  average_height?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  average_lifespan?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  classification?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  designation?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  eye_colors?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  hair_colors?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  language?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  name?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  skin_colors?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => RUpdateSpecieDto)
  relations?: RUpdateSpecieDto;
}
