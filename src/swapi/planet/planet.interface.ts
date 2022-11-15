import {
  BackSetFields,
  ID,
  RIDRes,
  SRes,
} from 'src/common/interfaces/common.interface';
import { IFile } from 'src/file/file.interface';
import { IFilm } from '../film/film.interface';
import { IPeople } from '../people/people.interface';

export interface IPlanet extends BackSetFields, DPlanet, RPlanet, ID {}

export interface DPlanet {
  name: string;
  rotation_period: string;
  orbital_period: string;
  diameter: string;
  climate: string;
  gravity: string;
  terrain: string;
  surface_water: string;
  population: string;
}

export interface RPlanet {
  residents: IPeople[];
  films: IFilm[];
  files: IFile[];
}

export type RIDPlanet = RIDRes<RPlanet>;
export type SPlanet = SRes<RPlanet>;
