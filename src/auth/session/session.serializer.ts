import { Injectable } from '@nestjs/common';
import { PassportSerializer } from '@nestjs/passport';
import { ID } from 'src/common/interfaces/common.interface';
import { IUser } from 'src/auth/user/user.interface';
import { UserService } from 'src/auth/user/user.service';

@Injectable()
export class SesionSerializer extends PassportSerializer {
  constructor(private readonly userService: UserService) {
    super();
  }
  serializeUser(user: ID, done: (err, user: ID) => void) {
    done(null, { id: user.id });
  }
  async deserializeUser(payload: ID, done: (err, user: IUser) => void) {
    const user = await this.userService.getUserById(payload);
    done(null, user);
  }
}
