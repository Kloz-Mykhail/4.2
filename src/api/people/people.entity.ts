import { File } from 'src/file/file.entity';
import {
  Column,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Film } from '../film/film.entity';
import { Planet } from '../planet/planet.entity';
import { Specie } from '../specie/specie.entity';
import { Starship } from '../starship/starship.entity';
import { Vehicle } from '../vehicle/vehicle.entity';

@Entity()
export class People {
  @ManyToOne(() => Planet, (planet) => planet.residents, {
    onDelete: 'SET NULL',
  })
  @JoinColumn()
  homeworld: Planet;

  @ManyToMany(() => Film, (film) => film.characters)
  @JoinTable()
  films: Film[];

  @ManyToMany(() => Specie, (species) => species.people)
  @JoinTable()
  species: Specie[];

  @ManyToMany(() => Vehicle, (vehicle) => vehicle.pilots)
  @JoinTable()
  vehicles: Vehicle[];

  @ManyToMany(() => Starship, (starship) => starship.pilots)
  @JoinTable()
  starships: Starship[];

  @ManyToMany(() => File)
  @JoinTable()
  files: File[];

  @PrimaryGeneratedColumn()
  id: number;
  @Column({ unique: true })
  name: string;
  @Column()
  mass: string;
  @Column()
  height: string;
  @Column()
  hair_color: string;
  @Column()
  skin_color: string;
  @Column()
  eye_color: string;
  @Column()
  birth_year: string;
  @Column()
  gender: string;
  @Column()
  created: string;
  @Column()
  edited: string;
  @Column()
  url: string;
}
