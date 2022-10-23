import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsArray, IsObject, IsString, ValidateNested } from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
import { DSpecie, RIDSpecie } from '../specie.interface';
export class RCreateSpecieDto implements RIDSpecie {
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  people: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  files: IdDto[];
}
export class CreateSpecieDto implements DSpecie {
  @ApiProperty()
  @IsString()
  average_height: string;
  @ApiProperty()
  @IsString()
  average_lifespan: string;
  @ApiProperty()
  @IsString()
  classification: string;
  @ApiProperty()
  @IsString()
  designation: string;
  @ApiProperty()
  @IsString()
  eye_colors: string;
  @ApiProperty()
  @IsString()
  hair_colors: string;
  @ApiProperty()
  @IsString()
  language: string;
  @ApiProperty()
  @IsString()
  name: string;
  @ApiProperty()
  @IsString()
  skin_colors: string;

  @ApiProperty()
  @IsObject()
  @ValidateNested()
  @Type(() => RCreateSpecieDto)
  relations: RCreateSpecieDto;
}
