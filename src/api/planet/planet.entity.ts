import { File } from 'src/file/file.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Film } from '../film/film.entity';
import { People } from '../people/people.entity';

@Entity()
export class Planet {
  @OneToMany(() => People, (people) => people.homeworld)
  residents: People[];

  @ManyToMany(() => Film, (film) => film.planets)
  @JoinTable()
  films: Film[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column({ unique: true })
  name: string;
  @Column()
  rotation_period: string;
  @Column()
  orbital_period: string;
  @Column()
  diameter: string;
  @Column()
  climate: string;
  @Column()
  gravity: string;
  @Column()
  terrain: string;
  @Column()
  surface_water: string;
  @Column()
  population: string;
  @Column()
  created: string;
  @Column()
  edited: string;
  @Column()
  url: string;
}
