import axios from 'axios';
import { MigrationInterface, QueryRunner } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { MY_URL, SWAPI_URL } from 'src/app.constants';
import { FilmRepository } from 'src/swapi/film/film.repository';
import { Film } from 'src/swapi/film/film.entity';
import { People } from 'src/swapi/people/people.entity';
import { Planet } from 'src/swapi/planet/planet.entity';
import { Specie } from 'src/swapi/specie/specie.entity';
import { Vehicle } from 'src/swapi/vehicle/vehicle.entity';
import { Starship } from 'src/swapi/starship/starship.entity';
import { File } from 'src/file/file.entity';
@Injectable()
export default class Films1668116270029 implements MigrationInterface {
  name: 'FilmsSeed1668116270029';
  public async up(queryRunner: QueryRunner): Promise<void> {
    const connection = queryRunner.manager;

    const filmRepo = new FilmRepository(
      connection.getRepository(Film),
      connection.getRepository(People),
      connection.getRepository(Planet),
      connection.getRepository(Specie),
      connection.getRepository(Vehicle),
      connection.getRepository(Starship),
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
          director: el.director,
          episode_id: el.episode_id,
          opening_crawl: el.opening_crawl,
          producer: el.producer,
          release_date: el.release_date,
          title: el.title,
          url: MY_URL + '/api/films',
        };
        filmRepo.create(fields);
      });
      if (resp.next) {
        await recursiveRunner(resp.next);
      }
    }
    await recursiveRunner(SWAPI_URL + '/api/films?page=1');
  }
  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DELETE FROM film');
  }
}
