import { Injectable } from '@nestjs/common';
import { IUser } from 'src/auth/user/user.interface';
import { UserService } from 'src/auth/user/user.service';
import * as bcrypt from 'bcrypt';
@Injectable()
export class AuthService {
  constructor(private readonly userService: UserService) {}
  async validateUser(username: string, password: string) {
    const user: IUser | null = await this.userService.getUserByName(username);
    if (user) {
      if (bcrypt.compareSync(password, user.password)) {
        return { id: user.id, roles: user.roles };
      }
    }
    return null;
  }
}
