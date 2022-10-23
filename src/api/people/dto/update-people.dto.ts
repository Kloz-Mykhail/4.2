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

export class RUpdatePeopleDto {
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => IdDto)
  homeworld?: IdDto;
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  species?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  starships?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  vehicles?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files: IdDto[];
}
export class UpdatePeopleDto {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  name?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  mass?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  height?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  hair_color?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  skin_color?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  eye_color?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  birth_year?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  gender?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ValidateNested()
  @Type(() => RUpdatePeopleDto)
  relations?: RUpdatePeopleDto;
}
