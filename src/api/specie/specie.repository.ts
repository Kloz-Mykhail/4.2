import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ResourceRepository } from 'src/common/resource.repository';
import { FindManyOptions, Repository } from 'typeorm';
import { Film } from '../film/film.entity';
import { People } from '../people/people.entity';
import { DSpecie, RIDSpecie } from './specie.interface';
import { Specie } from './specie.entity';
import { File } from 'src/file/file.entity';

@Injectable()
export class SpecieRepository extends ResourceRepository<
  Specie,
  DSpecie,
  RIDSpecie
> {
  constructor(
    @InjectRepository(Specie)
    ormSpecieRepo: Repository<Specie>,
    @InjectRepository(Film)
    private readonly filmRepo: Repository<Film>,
    @InjectRepository(People)
    private readonly peopleRepo: Repository<People>,
    @InjectRepository(File)
    private readonly fileRepo: Repository<File>,
  ) {
    super(ormSpecieRepo);
  }
  async findWithRelations(options?: FindManyOptions<Specie>) {
    return await this.repository.find({
      relations: ['films', 'people', 'files'],
      ...options,
    });
  }

  async addRelations(ent: Specie, rel: Partial<RIDSpecie>) {
    if (rel.films) {
      ent.films = await this.getExistingEntity(this.filmRepo, rel.films);
    }
    if (rel.people) {
      ent.people = await this.getExistingEntity(this.peopleRepo, rel.people);
    }
    if (rel.files) {
      ent.files = await this.getExistingEntity(this.fileRepo, rel.files);
    }
    return ent;
  }
}
