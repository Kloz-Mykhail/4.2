import { ExecutionContext, Injectable } from '@nestjs/common';
import { Request } from 'express';
import { AuthGuard } from 'src/auth/auth.guard';
import { IUser } from 'src/user/user.interface';

@Injectable()
export class RoleGuard extends AuthGuard {
  constructor(private readonly roles: Array<string>) {
    super();
  }

  async canActivate(ctx: ExecutionContext): Promise<boolean> {
    const res = await super.canActivate(ctx);
    if (!res) return false;

    if (!this.roles) {
      return true;
    }
    const user = ctx.switchToHttp().getRequest<Request>().user as IUser;

    if (user) {
      if (
        this.contains(
          this.roles,
          user.roles.map((total) => total.name),
        )
      ) {
        return true;
      }
    }
    return false;
  }

  contains(where: Array<string>, what: Array<string>) {
    for (let i = 0; i < what.length; i++) {
      if (where.includes(what[i])) return true;
    }
    return false;
  }
}
