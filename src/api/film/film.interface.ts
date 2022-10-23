import { DiscRes, RIDRes, SRes } from 'src/common/common.interface';
import { IFile } from 'src/file/file.interface';
import { IPeople } from '../people/people.interface';
import { IPlanet } from '../planet/planet.interface';
import { ISpecie } from '../specie/specie.interface';
import { IStarship } from '../starship/starship.interface';
import { IVehicle } from '../vehicle/vehicle.interface';

export interface DFilm {
  director: string;
  episode_id: number;
  opening_crawl: string;
  producer: string;
  release_date: string;
  title: string;
}
export interface RFilm {
  planets: IPlanet[];
  characters: IPeople[];
  species: ISpecie[];
  starships: IStarship[];
  vehicles: IVehicle[];
  files: IFile[];
}
export interface IFilm extends DiscFilm, RFilm {}

export type RIDFilm = RIDRes<RFilm>;
export type SFilm = SRes<RFilm>;
export type DiscFilm = DiscRes<DFilm>;
