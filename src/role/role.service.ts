import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateRoleDto } from './dto/create-role.dto';
import { Role } from './role.entity';

@Injectable()
export class RoleService {
  constructor(
    @InjectRepository(Role) private readonly roleRepo: Repository<Role>,
  ) {}
  async create(createRoleDto: CreateRoleDto) {
    return await this.roleRepo.save(this.roleRepo.create(createRoleDto));
  }

  getRole(name: string) {
    return this.roleRepo.findOneBy({ name });
  }
}
