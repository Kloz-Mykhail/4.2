import axios from 'axios';
import { MigrationInterface, QueryRunner } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { MY_URL, SWAPI_URL } from 'src/app.constants';
import { VehicleRepository } from 'src/swapi/vehicle/vehicle.repository';
import { Vehicle } from 'src/swapi/vehicle/vehicle.entity';
import { Film } from 'src/swapi/film/film.entity';
import { People } from 'src/swapi/people/people.entity';
import { File } from 'src/file/file.entity';

@Injectable()
export default class Vehicles1668122270029 implements MigrationInterface {
  name: 'VehicleSeed1668122270029';
  public async up(queryRunner: QueryRunner): Promise<void> {
    const connection = queryRunner.manager;

    const vehicleRepo = new VehicleRepository(
      connection.getRepository(Vehicle),
      connection.getRepository(Film),
      connection.getRepository(People),
      connection.getRepository(File),
    );
    function getArrayOfId(array: Array<string>) {
      return array.map((el) => +el.split('/').at(-2));
    }
    async function recursiveRunner(url: string): Promise<void> {
      const resp = await axios.get(url).then((response) => response.data);
      resp.results.forEach((el) => {
        const fields = {
          id: getArrayOfId([el.url]).at(0),
          name: el.name,
          consumables: el.consumables,
          cargo_capacity: el.cargo_capacity,
          cost_in_credits: el.cost_in_credits,
          crew: el.crew,
          length: el.length,
          manufacturer: el.manufacturer,
          max_atmosphering_speed: el.max_atmosphering_speed,
          model: el.model,
          passengers: el.passengers,
          vehicle_class: el.vehicle_class,
          url: MY_URL + '/api/vehicles',
        };
        vehicleRepo.create(fields, {
          films: getArrayOfId(el.films),
          pilots: getArrayOfId(el.pilots),
        });
      });
      if (resp.next) {
        await recursiveRunner(resp.next);
      }
    }
    await recursiveRunner(SWAPI_URL + '/api/vehicles?page=1');
  }
  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DELETE FROM vehicle');
  }
}
