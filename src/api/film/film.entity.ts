import { File } from 'src/file/file.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { People } from '../people/people.entity';
import { Planet } from '../planet/planet.entity';
import { Specie } from '../specie/specie.entity';
import { Starship } from '../starship/starship.entity';
import { Vehicle } from '../vehicle/vehicle.entity';

@Entity()
export class Film {
  @ManyToMany(() => Planet, (planet) => planet.films)
  planets: Planet[];

  @ManyToMany(() => People, (people) => people.films)
  characters: People[];

  @ManyToMany(() => Specie, (specie) => specie.films)
  species: Specie[];

  @ManyToMany(() => Starship, (starship) => starship.films)
  starships: Starship[];

  @ManyToMany(() => Vehicle, (vehicle) => vehicle.films)
  vehicles: Vehicle[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  created: string;
  @Column()
  director: string;
  @Column()
  edited: string;
  @Column()
  episode_id: number;
  @Column({ type: 'text' })
  opening_crawl: string;
  @Column()
  producer: string;
  @Column()
  release_date: string;
  @Column({ unique: true })
  title: string;
  @Column()
  url: string;
}
