import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, Matches } from 'class-validator';

export class AuthDto {
  @IsString()
  @Length(4, 20)
  @ApiProperty({ example: 'admin' })
  username: string;

  @IsString()
  @Length(4, 20)
  @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message: 'password too weak',
  })
  @ApiProperty({ example: 'admin' })
  password: string;
}
