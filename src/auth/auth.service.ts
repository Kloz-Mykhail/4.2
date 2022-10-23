import { Injectable } from '@nestjs/common';
import { IUser } from 'src/user/user.interface';
import { UserService } from 'src/user/user.service';

@Injectable()
export class AuthService {
  constructor(private readonly userService: UserService) {}
  async validateUser(username: string, password: string) {
    const user: IUser | null = await this.userService.getUserByName(username);
    if (user) {
      if (user.password === password) {
        return { id: user.id, roles: user.roles };
      }
    }
    return null;
  }
}
