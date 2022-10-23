import { Injectable } from '@nestjs/common';
import { ResourceService } from 'src/common/resource.service';
import { CreateStarshipDto } from './dto/create-starship.dto';
import { UpdateStarshipDto } from './dto/update-starship.dto';
import { DStarship, RIDStarship } from './starship.interface';
import { Starship } from './starship.entity';
import { StarshipRepository } from './starship.repository';

@Injectable()
export class StarshipService extends ResourceService<
  CreateStarshipDto,
  UpdateStarshipDto,
  Starship,
  DStarship,
  RIDStarship
> {
  constructor(starshipRepo: StarshipRepository) {
    super(starshipRepo);
  }
}
