import { Injectable } from '@nestjs/common';
import { Request } from 'express';
import { PagDto } from 'src/common/dto/pag.dto';
import { ResourceRepository } from './resource.repository';
import { BackSetFields, ID, Rel } from './interfaces/common.interface';
import { DeepPartial, FindOptionsWhere } from 'typeorm';
import { Pagination } from 'nestjs-typeorm-paginate';

@Injectable()
export abstract class ResourceService<
  CreateDto extends DeepPartial<Rel<RIdRes>> & DRes,
  UpdateDto extends DeepPartial<Rel<RIdRes> & DRes>,
  Entity extends BackSetFields & ID & DRes & Record<keyof RIdRes, unknown>,
  DRes,
  RIdRes,
> {
  constructor(
    private readonly repository: ResourceRepository<Entity, DRes, RIdRes>,
  ) {}

  async addOne(
    { relations, ...rest }: CreateDto,
    req: Request,
  ): Promise<Entity> {
    return await this.repository.create(
      {
        ...(rest as DRes),
        url: this.getUrl(req),
      },
      relations,
    );
  }
  getUrl(req: Request) {
    return `${req.protocol}://${req.get('Host')}${req.path}`;
  }

  getOneBy(id: FindOptionsWhere<Entity>): Promise<Entity> {
    return this.repository.getOneBy(id);
  }

  getMany(pag: PagDto, req: Request): Promise<Pagination<Entity>> {
    return this.repository.getMany({ ...pag, route: this.getUrl(req) });
  }

  patchUpdateBy(
    id: FindOptionsWhere<Entity>,
    { relations, ...rest }: UpdateDto,
  ): Promise<Entity> {
    return this.repository.update(id, rest as DeepPartial<DRes>, relations);
  }

  updateBy(
    id: FindOptionsWhere<Entity>,
    { relations, ...rest }: CreateDto,
  ): Promise<Entity> {
    return this.repository.update(id, rest as DRes, relations);
  }

  deleteBy(id: FindOptionsWhere<Entity>): Promise<void> {
    return this.repository.delete(id);
  }
}
