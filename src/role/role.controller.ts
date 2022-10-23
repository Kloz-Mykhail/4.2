import { Controller, Post, Body, UseGuards } from '@nestjs/common';
import { RoleService } from './role.service';
import { CreateRoleDto } from './dto/create-role.dto';
import { RoleGuard } from './role.guard';
import { Roles } from './helpers/role.enum';
import { ApiOperation, ApiTags } from '@nestjs/swagger';

@ApiTags('role')
@Controller('role')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  @Post()
  @ApiOperation({ summary: 'Add new role' })
  @UseGuards(new RoleGuard([Roles.ADMIN]))
  create(@Body() createRoleDto: CreateRoleDto) {
    return this.roleService.create(createRoleDto);
  }
}
