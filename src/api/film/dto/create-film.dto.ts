import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsInt,
  IsObject,
  IsString,
  ValidateNested,
} from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
export class RCreateFilmDto {
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  planets: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  characters: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  species: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  starships: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  vehicles: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files: IdDto[];
}
export class CreateFilmDto {
  @ApiProperty()
  @IsString()
  director: string;
  @ApiProperty()
  @IsInt()
  @Type(() => Number)
  episode_id: number;
  @ApiProperty()
  @IsString()
  opening_crawl: string;
  @ApiProperty()
  @IsString()
  producer: string;
  @ApiProperty()
  @IsString()
  release_date: string;
  @ApiProperty()
  @IsString()
  title: string;
  @ApiProperty()
  @IsObject()
  @ValidateNested()
  @Type(() => RCreateFilmDto)
  relations: RCreateFilmDto;
}
