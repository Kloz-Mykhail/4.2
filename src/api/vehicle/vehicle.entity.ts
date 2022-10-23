import { File } from 'src/file/file.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Film } from '../film/film.entity';
import { People } from '../people/people.entity';

@Entity()
export class Vehicle {
  @ManyToMany(() => People, (people) => people.vehicles)
  pilots: People[];
  @ManyToMany(() => Film, (film) => film.vehicles)
  @JoinTable()
  films: Film[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  consumables: string;
  @Column()
  cargo_capacity: string;
  @Column()
  cost_in_credits: string;
  @Column()
  created: string;
  @Column()
  crew: string;
  @Column()
  edited: string;
  @Column()
  length: string;
  @Column()
  manufacturer: string;
  @Column()
  max_atmosphering_speed: string;
  @Column()
  model: string;
  @Column({ unique: true })
  name: string;
  @Column()
  passengers: string;
  @Column()
  url: string;
  @Column()
  vehicle_class: string;
}
