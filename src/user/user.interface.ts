import { ID } from 'src/common/common.interface';
import { DRole } from 'src/role/role.interface';

export interface DUser {
  username: string;
  password: string;
}
export interface RUser {
  roles: DRole[];
}
export interface IUser extends DUser, RUser, ID {}
