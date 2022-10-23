import { ID } from 'src/common/common.interface';
export interface IFile extends DFile, ID {}
export interface DFile {
  name: string;
  url: string;
}
