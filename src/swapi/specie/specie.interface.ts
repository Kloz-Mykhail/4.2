import {
  BackSetFields,
  ID,
  RIDRes,
  SRes,
} from 'src/common/interfaces/common.interface';
import { IFile } from 'src/file/file.interface';
import { IFilm } from '../film/film.interface';
import { IPeople } from '../people/people.interface';

export interface ISpecie extends DSpecie, RSpecie, BackSetFields, ID {}
export interface DSpecie {
  average_height: string;
  average_lifespan: string;
  classification: string;
  designation: string;
  eye_colors: string;
  hair_colors: string;
  language: string;
  name: string;
  skin_colors: string;
}
export interface RSpecie {
  people: IPeople[];
  films: IFilm[];
  files: IFile[];
}

export type RIDSpecie = RIDRes<RSpecie>;
export type SSpecie = SRes<RSpecie>;
