import { ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Request } from 'express';
import { ROLES_KEY } from 'src/app.constants';
import { AuthGuard } from 'src/auth/guards/auth.guard';
import { RUser } from 'src/auth/user/user.interface';
import { Role } from '../role/helpers/role.enum';

@Injectable()
export class RoleAuthGuard extends AuthGuard {
  constructor(private reflector: Reflector) {
    super();
  }

  async canActivate(ctx: ExecutionContext): Promise<boolean> {
    // return true;
    const res = await super.canActivate(ctx);
    if (!res) return false;

    const roles = this.reflector.get<Role[]>(ROLES_KEY, ctx.getHandler());

    if (!roles) {
      return true;
    }
    const user = ctx.switchToHttp().getRequest<Request>().user;

    if (this.hasRoles(user)) {
      return this.contains(
        roles,
        user.roles.map((total) => total.name),
      );
    }
    return false;
  }
  hasRoles(user: object): user is RUser {
    return 'roles' in user;
  }

  contains(where: Array<string>, what: Array<string>) {
    for (let i = 0; i < what.length; i++) {
      if (where.includes(what[i])) return true;
    }
    return false;
  }
}
