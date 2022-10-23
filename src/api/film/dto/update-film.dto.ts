import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsInt,
  IsObject,
  IsOptional,
  IsString,
  ValidateNested,
} from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DFilm, RIDFilm } from '../film.interface';
export class RUpdateFilmDto implements Partial<RIDFilm> {
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  planets?: IdDto[];
  @ApiProperty({ required: false, type: [IdDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  characters?: IdDto[];
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
export class UpdateFilmDto implements Partial<DFilm> {
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  director?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsInt()
  @Type(() => Number)
  episode_id?: number;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  opening_crawl?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  producer?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  release_date?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  title?: string;
  @ApiProperty({ required: false })
  @IsOptional()
  @IsObject()
  @ApiProperty({ required: false })
  @ValidateNested()
  @Type(() => RUpdateFilmDto)
  relations: RUpdateFilmDto;
}
