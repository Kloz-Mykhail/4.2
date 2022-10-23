import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsArray, IsObject, IsString, ValidateNested } from 'class-validator';
import { IdDto } from 'src/common/dto/id.dto';
export class RCreatePeopleDto {
  @ApiProperty({ type: [IdDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => IdDto)
  films: IdDto[];
  @ApiProperty({ type: [IdDto] })
  @IsObject()
  @ValidateNested()
  @Type(() => IdDto)
  homeworld: IdDto;
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
export class CreatePeopleDto {
  @ApiProperty()
  @IsString()
  name: string;
  @ApiProperty()
  @IsString()
  mass: string;
  @ApiProperty()
  @IsString()
  height: string;
  @ApiProperty()
  @IsString()
  hair_color: string;
  @ApiProperty()
  @IsString()
  skin_color: string;
  @ApiProperty()
  @IsString()
  eye_color: string;
  @ApiProperty()
  @IsString()
  birth_year: string;
  @ApiProperty()
  @IsString()
  gender: string;
  @ApiProperty()
  @IsObject()
  @ValidateNested()
  @Type(() => RCreatePeopleDto)
  relations: RCreatePeopleDto;
}
