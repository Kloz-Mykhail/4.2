import { ID } from 'src/common/common.interface';
import { DUser } from 'src/user/user.interface';

export interface DRole {
  name: string;
}
export interface RRole {
  users: DUser[];
}
export interface IRole extends DRole, RRole, ID {}
