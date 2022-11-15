import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ResourceRepository } from 'src/common/resource.repository';
import { DeepPartial, Repository } from 'typeorm';
import { People } from '../people/people.entity';
import { Planet } from '../planet/planet.entity';
import { Specie } from '../specie/specie.entity';
import { Starship } from '../starship/starship.entity';
import { Vehicle } from '../vehicle/vehicle.entity';
import { DFilm, RIDFilm } from './film.interface';
import { Film } from './film.entity';
import { File } from '../../file/file.entity';

@Injectable()
export class FilmRepository extends ResourceRepository<Film, DFilm, RIDFilm> {
  private readonly relFieldRepo: Record<keyof RIDFilm, Repository<unknown>> = {
    planets: this.planetRepo,
    species: this.specieRepo,
    characters: this.peopleRepo,
    starships: this.starshipRepo,
    vehicles: this.vehicleRepo,
    files: this.fileRepo,
  };
  constructor(
    @InjectRepository(Film)
    ormFilmRepo: Repository<Film>,
    @InjectRepository(People)
    private readonly peopleRepo: Repository<People>,
    @InjectRepository(Planet)
    private readonly planetRepo: Repository<Planet>,
    @InjectRepository(Specie)
    private readonly specieRepo: Repository<Specie>,
    @InjectRepository(Vehicle)
    private readonly vehicleRepo: Repository<Vehicle>,
    @InjectRepository(Starship)
    private readonly starshipRepo: Repository<Starship>,
    @InjectRepository(File)
    private readonly fileRepo: Repository<File>,
  ) {
    super(ormFilmRepo, [
      'planets',
      'species',
      'characters',
      'starships',
      'vehicles',
      'files',
    ]);
  }

  async addRelations(ent: Film, rel: DeepPartial<RIDFilm>): Promise<Film> {
    await Promise.all(
      Object.keys(this.relFieldRepo).map(async (field) => {
        if (rel[field]) {
          ent[field] = await this.getExistingEntity(
            this.relFieldRepo[field],
            rel[field],
          );
        }
      }),
    );
    return ent;
  }
}
