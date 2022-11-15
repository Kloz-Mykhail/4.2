import { ID } from 'src/common/interfaces/common.interface';
export interface IFile extends DFile, ID {}
export interface DFile {
  name: string;
  url: string;
}
