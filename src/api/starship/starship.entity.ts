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
export class Starship {
  @ManyToMany(() => People, (people) => people.starships)
  pilots: People[];

  @ManyToMany(() => Film, (film) => film.starships)
  @JoinTable()
  films: Film[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  MGLT: string;
  @Column()
  cargo_capacity: string;
  @Column()
  consumables: string;
  @Column()
  cost_in_credits: string;
  @Column()
  created: string;
  @Column()
  crew: string;
  @Column()
  edited: string;
  @Column()
  hyperdrive_rating: string;
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
  starship_class: string;
  @Column()
  url: string;
}
