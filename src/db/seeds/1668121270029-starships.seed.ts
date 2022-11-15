import axios from 'axios';
import { MigrationInterface, QueryRunner } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { MY_URL, SWAPI_URL } from 'src/app.constants';
import { StarshipRepository } from 'src/swapi/starship/starship.repository';
import { Starship } from 'src/swapi/starship/starship.entity';
import { Film } from 'src/swapi/film/film.entity';
import { People } from 'src/swapi/people/people.entity';
import { File } from 'src/file/file.entity';

@Injectable()
export default class Starships1668121270029 implements MigrationInterface {
  name: 'StarshipSeed1668121270029';
  public async up(queryRunner: QueryRunner): Promise<void> {
    const connection = queryRunner.manager;

    const starshipRepo = new StarshipRepository(
      connection.getRepository(Starship),
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
        starshipRepo.create(
          {
            name: el.name,
            MGLT: el.MGLT,
            cargo_capacity: el.cargo_capacity,
            consumables: el.consumables,
            cost_in_credits: el.cost_in_credits,
            crew: el.crew,
            hyperdrive_rating: el.hyperdrive_rating,
            length: el.length,
            manufacturer: el.manufacturer,
            max_atmosphering_speed: el.max_atmosphering_speed,
            model: el.model,
            passengers: el.passengers,
            starship_class: el.starship_class,
            url: MY_URL + '/api/starships',
          },
          {
            films: getArrayOfId(el.films),
            pilots: getArrayOfId(el.pilots),
          },
        );
      });
      if (resp.next) {
        await recursiveRunner(resp.next);
      }
    }
    await recursiveRunner(SWAPI_URL + '/api/starships?page=1');
  }
  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DELETE FROM starship');
  }
}
