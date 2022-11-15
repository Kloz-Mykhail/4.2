import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-local';
import { AuthService } from '../auth.service';

@Injectable()
export class AuthStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly authServise: AuthService) {
    super({
      usernameField: 'username',
      passwordField: 'password',
    });
  }
  async validate(username: string, passwort: string) {
    const user = await this.authServise.validateUser(username, passwort);

    if (!user) {
      throw new UnauthorizedException();
    }
    console.log(user);
    return user;
  }
}
