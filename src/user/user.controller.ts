import { Controller, Post, Body, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { RoleGuard } from 'src/role/role.guard';
import { Roles } from 'src/role/helpers/role.enum';
import { ApiOperation, ApiTags } from '@nestjs/swagger';

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post()
  @ApiOperation({ summary: 'Create new user' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  create(@Body() createUserDto: CreateUserDto) {
    console.log(createUserDto);
    return this.userService.addUser(createUserDto);
  }
}
