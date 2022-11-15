import { SetMetadata } from '@nestjs/common';
import { ROLES_KEY } from 'src/app.constants';
import { Role } from './helpers/role.enum';

export const Roles = (...roles: Role[]) => SetMetadata(ROLES_KEY, roles);
