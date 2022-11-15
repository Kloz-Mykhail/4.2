import { ApiProperty } from '@nestjs/swagger';
import { IsArray, IsEnum } from 'class-validator';
import { AuthDto } from 'src/auth/dto/auth.dto';
import { Role } from 'src/auth/role/helpers/role.enum';

export class CreateUserDto extends AuthDto {
  @ApiProperty({
    description: 'Array of roles',
    isArray: true,
    enum: Role,
    example: ['user'],
  })
  @IsEnum(Role, { each: true })
  @IsArray()
  roles: Role[];
}
