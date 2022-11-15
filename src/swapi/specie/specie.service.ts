import { Injectable } from '@nestjs/common';
import { ResourceService } from 'src/common/resource.service';
import { CreateSpecieDto } from './dto/create-specie.dto';
import { UpdateSpecieDto } from './dto/update-specie.dto';
import { DSpecie, RIDSpecie } from './specie.interface';
import { Specie } from './specie.entity';
import { SpecieRepository } from './specie.repository';

@Injectable()
export class SpecieService extends ResourceService<
  CreateSpecieDto,
  UpdateSpecieDto,
  Specie,
  DSpecie,
  RIDSpecie
> {
  constructor(specieRepo: SpecieRepository) {
    super(specieRepo);
  }
}
