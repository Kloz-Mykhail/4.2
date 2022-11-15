import { BackSetFields, ID } from 'src/common/interfaces/common.interface';
import { IFile } from 'src/file/file.interface';
import { IFilm } from '../film/film.interface';
import { IPlanet } from '../planet/planet.interface';
import { ISpecie } from '../specie/specie.interface';
import { IStarship } from '../starship/starship.interface';
import { IVehicle } from '../vehicle/vehicle.interface';

export interface IPeople extends BackSetFields, DPeople, RPeople, ID {}
export interface DPeople {
  name: string;
  mass: string;
  height: string;
  hair_color: string;
  skin_color: string;
  eye_color: string;
  birth_year: string;
  gender: string;
}
export interface RPeople {
  films: IFilm[];
  species: ISpecie[];
  vehicles: IVehicle[];
  starships: IStarship[];
  homeworld: IPlanet;
  files: IFile[];
}
export interface SPeople {
  films: string[];
  species: string[];
  vehicles: string[];
  starships: string[];
  homeworld: string;
}
export interface RIDPeople {
  films: number[];
  species: number[];
  vehicles: number[];
  starships: number[];
  homeworld: number;
  files: number[];
}
