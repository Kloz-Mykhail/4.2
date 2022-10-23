import { ExecutionContext, Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class AuthLocalGuard extends AuthGuard('local') {
  async canActivate(context: ExecutionContext): Promise<boolean> {
    const res = (await super.canActivate(context)) as boolean;
    await super.logIn(context.switchToHttp().getRequest());
    return res;
  }
}
