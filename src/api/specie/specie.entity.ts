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
export class Specie {
  @ManyToMany(() => People, (people) => people.species)
  people: People[];

  @ManyToMany(() => Film, (film) => film.species)
  @JoinTable()
  films: Film[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  average_height: string;
  @Column()
  average_lifespan: string;
  @Column()
  classification: string;
  @Column()
  created: string;
  @Column()
  designation: string;
  @Column()
  edited: string;
  @Column()
  eye_colors: string;
  @Column()
  hair_colors: string;
  @Column()
  language: string;
  @Column({ unique: true })
  name: string;
  @Column()
  skin_colors: string;
  @Column()
  url: string;
}
