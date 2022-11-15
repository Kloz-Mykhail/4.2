import {
  BackSetFields,
  ID,
  RIDRes,
  SRes,
} from 'src/common/interfaces/common.interface';
import { IFile } from 'src/file/file.interface';
import { IFilm } from '../film/film.interface';
import { IPeople } from '../people/people.interface';

export interface IVehicle extends DVehicle, RVehicle, BackSetFields, ID {}

export interface DVehicle {
  consumables: string;
  cargo_capacity: string;
  cost_in_credits: string;
  crew: string;
  length: string;
  manufacturer: string;
  max_atmosphering_speed: string;
  model: string;
  name: string;
  passengers: string;
  vehicle_class: string;
}
export interface RVehicle {
  pilots: IPeople[];
  films: IFilm[];
  files: IFile[];
}
export type RIDVehicle = RIDRes<RVehicle>;
export type SVehicle = SRes<RVehicle>;
