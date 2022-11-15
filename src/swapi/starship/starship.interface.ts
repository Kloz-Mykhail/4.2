import {
  BackSetFields,
  ID,
  RIDRes,
  SRes,
} from 'src/common/interfaces/common.interface';
import { IFile } from 'src/file/file.interface';
import { IFilm } from '../film/film.interface';
import { IPeople } from '../people/people.interface';

export interface IStarship extends DStarship, RStarship, BackSetFields, ID {}

export interface DStarship {
  MGLT: string;
  cargo_capacity: string;
  consumables: string;
  cost_in_credits: string;
  crew: string;
  hyperdrive_rating: string;
  length: string;
  manufacturer: string;
  max_atmosphering_speed: string;
  model: string;
  name: string;
  passengers: string;
  starship_class: string;
}

export interface RStarship {
  pilots: IPeople[];
  films: IFilm[];
  files: IFile[];
}

export type RIDStarship = RIDRes<RStarship>;
export type SStarship = SRes<RStarship>;
