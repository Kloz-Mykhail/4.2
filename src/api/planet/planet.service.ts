import { Injectable } from '@nestjs/common';
import { ResourceService } from 'src/common/resource.service';
import { CreatePlanetDto } from './dto/create-planet.dto';
import { UpdatePlanetDto } from './dto/update-planet.dto';
import { DPlanet, RIDPlanet } from './planet.interface';
import { Planet } from './planet.entity';
import { PlanetRepository } from './planet.repository';

@Injectable()
export class PlanetService extends ResourceService<
  CreatePlanetDto,
  UpdatePlanetDto,
  Planet,
  DPlanet,
  RIDPlanet
> {
  constructor(planetRepo: PlanetRepository) {
    super(planetRepo);
  }
}
