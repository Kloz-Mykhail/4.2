import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ID } from 'src/common/interfaces/common.interface';
import { RoleService } from 'src/auth/role/role.service';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './user.entity';
import * as bcrypt from 'bcrypt';
import { SALT_ROUNDS } from 'src/app.constants';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User) private readonly userRepo: Repository<User>,
    private readonly roleService: RoleService,
  ) {}
  async hashPassword(password: string): Promise<string> {
    return bcrypt.hash(password, SALT_ROUNDS);
  }

  async addUser({ username, password, roles }: CreateUserDto): Promise<User> {
    const ent = this.userRepo.create({ username });
    ent.roles = await Promise.all(
      roles.map((role) => this.roleService.getRole(role)),
    );
    ent.password = await this.hashPassword(password);
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
