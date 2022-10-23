import { Injectable } from '@nestjs/common';
import { Request } from 'express';
import { IdDto } from 'src/common/dto/id.dto';
import { PagDto } from 'src/common/dto/pag.dto';
import { ResourceRepository } from './resource.repository';
import { BackSetFields, ID, Rel } from './common.interface';
import { FindOptionsWhere } from 'typeorm';

@Injectable()
export abstract class ResourceService<
  CreateDto extends Rel<RIdRes> & DRes,
  UpdateDto extends Partial<Rel<Partial<RIdRes>> & DRes>,
  Entity extends BackSetFields & ID & DRes & Record<keyof RIdRes, any>,
  DRes,
  RIdRes extends { files: ID[] },
> {
  constructor(
    private readonly repository: ResourceRepository<Entity, DRes, RIdRes>,
  ) {}

  async addOne({ relations, ...all }: CreateDto, req: Request): Promise<ID> {
    return await this.repository.create(
      { ...(all as DRes), ...this.getDiscriptionFields(this.getFullUrl(req)) },
      relations,
    );
  }

  async getOneById(id: IdDto) {
    return this.repository.getOneBy(id as FindOptionsWhere<Entity>);
  }
  async getMany(pag: PagDto) {
    return this.repository.getMany(pag);
  }

  async updateById(id: IdDto, { relations, ...all }: UpdateDto) {
    return await this.repository.update(
      id,
      { ...(all as DRes), edited: new Date().toISOString() },
      relations,
    );
  }

  async deleteById(id: IdDto) {
    return this.repository.delete(id as FindOptionsWhere<Entity>);
  }

  getFullUrl(req: Request) {
    return `${req.protocol}://${req.get('Host')}${req.originalUrl}`;
  }

  getDiscriptionFields(url: string) {
    const time = new Date().toISOString();
    return {
      created: time,
      edited: time,
      url,
    };
  }
}
