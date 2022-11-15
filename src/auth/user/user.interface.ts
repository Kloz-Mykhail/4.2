import { ID } from 'src/common/interfaces/common.interface';
import { DRole } from 'src/auth/role/role.interface';

export interface DUser {
  username: string;
  password: string;
}
export interface RUser {
  roles: DRole[];
}
export interface IUser extends DUser, RUser, ID {}
