import { ApiProperty } from '@nestjs/swagger';
import { IsArray, IsEnum } from 'class-validator';
import { AuthDto } from 'src/auth/dto/login.dto';
import { Roles } from 'src/role/helpers/role.enum';

export class CreateUserDto extends AuthDto {
  @ApiProperty({
    description: 'List of enums',
    isArray: true,
    enum: Roles,
  })
  @IsEnum(Roles, { each: true })
  @IsArray()
  roles: Roles[];
}
