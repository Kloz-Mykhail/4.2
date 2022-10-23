import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ID } from 'src/common/common.interface';
import { RoleService } from 'src/role/role.service';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './user.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User) private readonly userRepo: Repository<User>,
    private readonly roleService: RoleService,
  ) {}
  async addUser({ username, password, roles }: CreateUserDto) {
    const ent = this.userRepo.create({
      username,
      password,
    });
    ent.roles = await Promise.all(
      roles.map((role) => this.roleService.getRole(role)),
    );
    return await this.userRepo.save(ent);
  }

  getUserByName(username: string): Promise<User | null> {
    return this.userRepo.findOne({
      where: { username },
      relations: ['roles'],
    });
  }
  getUserById(id: ID): Promise<User | null> {
    return this.userRepo.findOne({
      where: id,
      relations: ['roles'],
    });
  }
}
