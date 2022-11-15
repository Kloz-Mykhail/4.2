import { ID } from 'src/common/interfaces/common.interface';
import { DUser } from 'src/auth/user/user.interface';

export interface DRole {
  name: string;
}
export interface RRole {
  users: DUser[];
}
export interface IRole extends DRole, RRole, ID {}
