import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ResourceRepository } from 'src/common/resource.repository';
import { FindManyOptions, Repository } from 'typeorm';
import { Film } from '../film/film.entity';
import { People } from '../people/people.entity';
import { DVehicle, RIDVehicle } from './vehicle.interface';
import { Vehicle } from './vehicle.entity';
import { File } from 'src/file/file.entity';

@Injectable()
export class VehicleRepository extends ResourceRepository<
  Vehicle,
  DVehicle,
  RIDVehicle
> {
  constructor(
    @InjectRepository(Vehicle)
    ormVehicleRepo: Repository<Vehicle>,
    @InjectRepository(Film)
    private readonly filmRepo: Repository<Film>,
    @InjectRepository(People)
    private readonly peopleRepo: Repository<People>,
    @InjectRepository(File)
    private readonly fileRepo: Repository<File>,
  ) {
    super(ormVehicleRepo);
  }
  async findWithRelations(options?: FindManyOptions<Vehicle>) {
    return await this.repository.find({
      relations: ['films', 'pilots', 'files'],
      ...options,
    });
  }
  async addRelations(ent: Vehicle, rel: Partial<RIDVehicle>) {
    if (rel.films) {
      ent.films = await this.getExistingEntity(this.filmRepo, rel.films);
    }
    if (rel.pilots) {
      ent.pilots = await this.getExistingEntity(this.peopleRepo, rel.pilots);
    }
    if (rel.files) {
      ent.files = await this.getExistingEntity(this.fileRepo, rel.files);
    }
    return ent;
  }
}
