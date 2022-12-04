import { NotFoundException } from '@nestjs/common';
import {
  IPaginationOptions,
  paginate,
  Pagination,
} from 'nestjs-typeorm-paginate';
import {
  DeepPartial,
  FindManyOptions,
  FindOptionsWhere,
  Repository,
} from 'typeorm';
import { BackSetFields, ID, URL } from './interfaces/common.interface';

export abstract class ResourceRepository<
  Entity extends BackSetFields & ID & DRes & Record<keyof RIdRes, unknown>,
  DRes,
  RIdRes,
> {
  constructor(
    protected readonly repository: Repository<Entity>,
    private readonly relations: Array<keyof RIdRes & string>,
  ) {}

  async create(
    discr: DRes & URL & Partial<ID>,
    rel?: DeepPartial<RIdRes>,
  ): Promise<Entity> {
    const { url } = discr;
    let ent = this.repository.create(discr as DeepPartial<Entity>);
    if (rel) {
      ent = await this.addRelations(ent, rel);
    }
    const people = await this.repository.save(ent);
    people.url = `${url}/${people.id}`;

    return await this.repository.save(people);
  }

  async update(
    id: FindOptionsWhere<Entity>,
    discr?: DeepPartial<DRes>,
    rel?: DeepPartial<RIdRes>,
  ): Promise<Entity> {
    let ent = await this.repository.findOneBy(id);

    if (discr) {
      ent = this.repository.create({ ...ent, ...discr });
    }
    if (rel) {
      ent = await this.addRelations(ent, rel);
    }
    return await this.repository.save(ent);
  }

  abstract addRelations(
    ent: DeepPartial<Entity>,
    rel: DeepPartial<RIdRes>,
  ): Promise<Entity>;

  async delete(id: FindOptionsWhere<Entity>): Promise<void> {
    await this.repository.remove(await this.repository.findOneBy(id));
  }

  async getOneBy(id: FindOptionsWhere<Entity>): Promise<Entity> {
    const ent = (await this.findWithRelations({ where: id })).at(0);
    if (ent) {
      return ent;
    }
    throw new NotFoundException();
  }

  // async getMany({ offset, count }: PagOpt): Promise<Entity[]> {
  //   return await this.findWithRelations({ take: count, skip: offset });
  // }
  async getMany(opt: IPaginationOptions): Promise<Pagination<Entity>> {
    return paginate(this.repository, opt, { relations: this.relations });
  }

  async findWithRelations(options?: FindManyOptions<Entity>) {
    return await this.repository.find({
      relations: this.relations,
      ...options,
    });
  }

  async getExistingEntity<T extends ID>(
    repo: Repository<T>,
    entitiesId: number[],
  ): Promise<T[]> {
    return (
      await Promise.all(
        entitiesId.map(async (id) => {
          return await repo.findOneById(id);
        }),
      )
    ).filter((val) => val !== null);
  }
}
