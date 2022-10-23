import { Injectable } from '@nestjs/common';
import { PassportSerializer } from '@nestjs/passport';
import { ID } from 'src/common/common.interface';
import { IUser } from 'src/user/user.interface';
import { UserService } from 'src/user/user.service';

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
