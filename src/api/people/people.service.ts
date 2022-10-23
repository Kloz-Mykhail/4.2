import { Injectable } from '@nestjs/common';
import { ResourceService } from 'src/common/resource.service';
import { CreatePeopleDto } from './dto/create-people.dto';
import { UpdatePeopleDto } from './dto/update-people.dto';
import { DPeople, RIDPeople } from './people.interface';
import { People } from './people.entity';
import { PeopleRepository } from './people.repository';

@Injectable()
export class PeopleService extends ResourceService<
  CreatePeopleDto,
  UpdatePeopleDto,
  People,
  DPeople,
  RIDPeople
> {
  constructor(peopleRepository: PeopleRepository) {
    super(peopleRepository);
  }
}
