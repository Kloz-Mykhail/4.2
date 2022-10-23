import { NotFoundException } from '@nestjs/common';
import {
  DeepPartial,
  FindManyOptions,
  FindOptionsWhere,
  Repository,
} from 'typeorm';
import { BackSetFields, ID, Ok, PagOpt } from './common.interface';

export abstract class ResourceRepository<
  Entity extends BackSetFields & ID & DRes & Record<keyof RIdRes, any>,
  DRes,
  RIdRes extends { files: ID[] },
> {
  constructor(protected readonly repository: Repository<Entity>) {}

  async create(discr: DRes & BackSetFields, rel: RIdRes) {
    const { url } = discr;

    const ent = await this.addRelations(
      this.repository.create(discr as DeepPartial<Entity>),
      rel,
    );

    const people = await this.repository.save(ent);
    people.url = `${url}/${people.id}/`;

    await this.repository.save(people);

    return { id: people.id };
  }

  async update(
    id: ID,
    discr?: Partial<DRes> & Partial<BackSetFields>,
    rel?: Partial<RIdRes>,
  ): Promise<Ok> {
    let ent = await this.repository.findOneBy(id as FindOptionsWhere<Entity>);
    if (discr) {
      ent = this.repository.create({ ...ent, ...discr });
    }
    if (rel) {
      ent = await this.addRelations(ent, rel);
    }
    await this.repository.save(ent);

    return { ok: true };
  }

  abstract addRelations(
    ent: DeepPartial<Entity>,
    rel: Partial<RIdRes>,
  ): Promise<Entity>;

  async delete(id: FindOptionsWhere<Entity>): Promise<Ok> {
    await this.repository.remove(await this.repository.findOneBy(id));
    return { ok: true };
  }

  async getOneBy(id: FindOptionsWhere<Entity>) {
    const ent = (await this.findWithRelations({ where: id })).at(0);
    if (ent) {
      return ent;
    }
    throw new NotFoundException();
  }

  async getMany({ offset = 0, count = 10 }: PagOpt) {
    return await this.findWithRelations({ take: count, skip: offset });
  }

  abstract findWithRelations(
    options?: FindManyOptions<Entity>,
  ): Promise<Entity[]>;

  async getExistingEntity<T extends ID>(repo: Repository<T>, entitiesId: ID[]) {
    return (
      await Promise.all(
        entitiesId.map(async (id) => {
          return await repo.findOneBy(id as FindOptionsWhere<T>);
        }),
      )
    ).filter((val) => val !== null);
  }
}
