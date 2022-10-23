import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ResourceRepository } from 'src/common/resource.repository';
import { FindManyOptions, Repository } from 'typeorm';
import { Film } from '../film/film.entity';
import { People } from '../people/people.entity';
import { DPlanet, RIDPlanet } from './planet.interface';
import { Planet } from './planet.entity';
import { File } from 'src/file/file.entity';

@Injectable()
export class PlanetRepository extends ResourceRepository<
  Planet,
  DPlanet,
  RIDPlanet
> {
  constructor(
    @InjectRepository(Planet)
    ormPlanetRepo: Repository<Planet>,
    @InjectRepository(People)
    private readonly peopleRepo: Repository<People>,
    @InjectRepository(Film)
    private readonly filmRepo: Repository<Film>,
    @InjectRepository(File)
    private readonly fileRepo: Repository<File>,
  ) {
    super(ormPlanetRepo);
  }
  async findWithRelations(options?: FindManyOptions<Planet>) {
    return await this.repository.find({
      relations: ['films', 'residents', 'files', 'files.file'],
      ...options,
    });
  }
  async addRelations(ent: Planet, rel: Partial<RIDPlanet>) {
    if (rel.films) {
      ent.films = await this.getExistingEntity(this.filmRepo, rel.films);
    }
    if (rel.residents) {
      ent.residents = await this.getExistingEntity(
        this.peopleRepo,
        rel.residents,
      );
    }
    if (rel.files) {
      ent.files = await this.getExistingEntity(this.fileRepo, rel.files);
    }
    return ent;
  }
}
