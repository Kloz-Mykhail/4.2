import { MigrationInterface, QueryRunner } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { Role } from 'src/auth/role/role.entity';
import { ADMIN_NAME, ADMIN_PASS, SALT_ROUNDS } from 'src/app.constants';
import { User } from 'src/auth/user/user.entity';
import * as bcrypt from 'bcrypt';
import { Role as Roles } from 'src/auth/role/helpers/role.enum';

@Injectable()
export default class Users1668124270029 implements MigrationInterface {
  name: 'RolesSeed1668124270029';
  public async up(queryRunner: QueryRunner): Promise<void> {
    const userRepo = queryRunner.manager.getRepository(User);
    const roleRepo = queryRunner.manager.getRepository(Role);
    const ent = userRepo.create({
      username: ADMIN_NAME,
      password: await bcrypt.hash(ADMIN_PASS, SALT_ROUNDS),
    });
    ent.roles = [await roleRepo.findOneBy({ name: Roles.ADMIN })];
    await userRepo.save(ent);
  }
  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DELETE FROM user WHERE username="${ADMIN_NAME}"`);
  }
}
