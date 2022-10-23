import { Module } from '@nestjs/common';
import { FilmModule } from 'src/api/film/film.module';
import { PeopleModule } from 'src/api/people/people.module';
import { PlanetModule } from 'src/api/planet/planet.module';
import { SpecieModule } from 'src/api/specie/specie.module';
import { StarshipModule } from 'src/api/starship/starship.module';
import { VehicleModule } from 'src/api/vehicle/vehicle.module';
import { CronModule } from './cron/cron.module';

@Module({
  imports: [
    CronModule,
    PeopleModule,
    PlanetModule,
    FilmModule,
    SpecieModule,
    VehicleModule,
    StarshipModule,
  ],
})
export class DbModule {}
