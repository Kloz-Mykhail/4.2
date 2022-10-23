import { DFilm, SFilm } from 'src/api/film/film.interface';
import { DPeople, SPeople } from 'src/api/people/people.interface';
import { DPlanet, SPlanet } from 'src/api/planet/planet.interface';
import { DSpecie, SSpecie } from 'src/api/specie/specie.interface';
import { DStarship, SStarship } from 'src/api/starship/starship.interface';
import { DVehicle, SVehicle } from 'src/api/vehicle/vehicle.interface';
import { ADMIN_NAME, ADMIN_PASS, MY_URL, SWAPI_URL } from 'src/app.constants';
import { BackSetFields } from 'src/common/common.interface';
import { ENV_FILE_NAME } from 'src/app.constants';
import * as dotenv from 'dotenv';

dotenv.config({
  path: ENV_FILE_NAME,
});
class Seeder {
  async seed() {
    await this.addAll(`${MY_URL}/api/films`, await this.seedFilms());
    await this.addAll(`${MY_URL}/api/people`, await this.seedPeoples());
    await this.addAll(`${MY_URL}/api/planets`, await this.seedPlanets());
    await this.addAll(`${MY_URL}/api/species`, await this.seedSpecie());
    await this.addAll(`${MY_URL}/api/starships`, await this.seedStarships());
    await this.addAll(`${MY_URL}/api/vehicles`, await this.seedVehicles());
  }

  async seedFilms() {
    const res: (DFilm & SFilm)[] = await this.getAll(`${SWAPI_URL}/api/films`);
    return res.map(
      ({
        director,
        episode_id,
        opening_crawl,
        producer,
        release_date,
        title,
        ...el
      }) => ({
        director,
        episode_id,
        opening_crawl,
        producer,
        release_date,
        title,
        relations: {
          characters: this.getArrayOfId(el.characters),
          planets: this.getArrayOfId(el.planets),
          species: this.getArrayOfId(el.species),
          starships: this.getArrayOfId(el.starships),
          vehicles: this.getArrayOfId(el.vehicles),
          files: [],
        },
      }),
    );
  }

  async seedPeoples() {
    const res: (DPeople & SPeople)[] = await this.getAll(
      `${SWAPI_URL}/api/people`,
    );
    return res.map(
      ({
        name,
        mass,
        height,
        hair_color,
        skin_color,
        eye_color,
        birth_year,
        gender,
        ...el
      }) => ({
        name,
        mass,
        height,
        hair_color,
        skin_color,
        eye_color,
        birth_year,
        gender,
        relations: {
          films: this.getArrayOfId(el.films),
          homeworld: this.getArrayOfId([el.homeworld]).at(0),
          species: this.getArrayOfId(el.species),
          starships: this.getArrayOfId(el.starships),
          vehicles: this.getArrayOfId(el.vehicles),
          files: [],
        },
      }),
    );
  }
  async seedPlanets() {
    const res: (DPlanet & SPlanet & BackSetFields)[] = await this.getAll(
      `${SWAPI_URL}/api/planets`,
    );
    return res.map(({ films, residents, url, created, edited, ...el }) => ({
      ...el,
      relations: {
        films: this.getArrayOfId(films),
        residents: this.getArrayOfId(residents),
        files: [],
      },
    }));
  }
  async seedSpecie() {
    const res: (DSpecie & SSpecie & BackSetFields)[] = await this.getAll(
      `${SWAPI_URL}/api/species`,
    );
    return res.map(({ films, people, url, created, edited, ...el }) => ({
      ...el,
      relations: {
        films: this.getArrayOfId(films),
        people: this.getArrayOfId(people),
        files: [],
      },
    }));
  }
  async seedStarships() {
    const res: (DStarship & SStarship & BackSetFields)[] = await this.getAll(
      `${SWAPI_URL}/api/starships`,
    );
    return res.map(({ films, pilots, url, created, edited, ...el }) => ({
      ...el,
      relations: {
        films: this.getArrayOfId(films),
        pilots: this.getArrayOfId(pilots),
        files: [],
      },
    }));
  }
  async seedVehicles() {
    const res: (DVehicle & SVehicle & BackSetFields)[] = await this.getAll(
      `${SWAPI_URL}/api/vehicles`,
    );
    return res.map(({ films, pilots, url, created, edited, ...el }) => ({
      ...el,
      relations: {
        films: this.getArrayOfId(films),
        pilots: this.getArrayOfId(pilots),
        files: [],
      },
    }));
  }
  getArrayOfId(array: Array<string>) {
    return array.map((el) => ({
      id: el.split('/').at(-2),
    }));
  }
  async getAll(url: string) {
    const { count, results: firstResult } = await this.req(`${url}?page=1`);
    const pages = Math.ceil(count / firstResult.length);
    let res = [];
    for (let i = 1; i <= pages; i++) {
      const { results } = await this.req(`${url}?page=${i}`);
      res = [...res, ...results];
    }
    return res;
  }
  async addAll(url: string, res: Array<object>) {
    Promise.all(res.map(async (el) => await this.req(url, el, 'POST')));
  }
  async req(url: string, body?: object, method?: string) {
    const data: RequestInit = {
      headers: {
        'Content-Type': 'application/json',
      },
    };
    if (body) {
      data.body = JSON.stringify(body);
    }
    if (method) {
      data.method = method;
    }
    console.log(url);
    console.log('Body: ', data.body);
    return await (await fetch(url, data)).json();
  }
}
new Seeder().seed();
