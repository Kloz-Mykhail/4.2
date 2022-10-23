import { Role } from 'src/role/role.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;
  @Column({ unique: true, nullable: false })
  username: string;
  @Column({ nullable: false })
  password: string;
  @ManyToMany(() => Role, (role) => role.users)
  @JoinTable()
  roles: Role[];
}
