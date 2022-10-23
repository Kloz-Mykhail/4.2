import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ResourceRepository } from 'src/common/resource.repository';
import { FindManyOptions, Repository } from 'typeorm';
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
    super(ormFilmRepo);
  }
  async findWithRelations(options?: FindManyOptions<Film>): Promise<Film[]> {
    return await this.repository.find({
      relations: [
        'planets',
        'characters',
        'species',
        'starships',
        'vehicles',
        'files',
      ],
      ...options,
    });
  }

  async addRelations(ent: Film, rel: Partial<RIDFilm>): Promise<Film> {
    if (rel.planets) {
      ent.planets = await this.getExistingEntity(this.planetRepo, rel.planets);
    }
    if (rel.species) {
      ent.species = await this.getExistingEntity(this.specieRepo, rel.species);
    }
    if (rel.starships) {
      ent.starships = await this.getExistingEntity(
        this.starshipRepo,
        rel.starships,
      );
    }
    if (rel.vehicles) {
      ent.vehicles = await this.getExistingEntity(
        this.vehicleRepo,
        rel.vehicles,
      );
    }
    if (rel.characters) {
      ent.characters = await this.getExistingEntity(
        this.peopleRepo,
        rel.characters,
      );
    }
    if (rel.files) {
      ent.files = await this.getExistingEntity(this.fileRepo, rel.files);
    }
    return ent;
  }
}
