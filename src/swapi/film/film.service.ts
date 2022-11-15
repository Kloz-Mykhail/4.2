import { Injectable } from '@nestjs/common';
import { CreateFilmDto } from './dto/create-film.dto';
import { FilmRepository } from './film.repository';
import { ResourceService } from 'src/common/resource.service';
import { DFilm, RIDFilm } from './film.interface';
import { Film } from './film.entity';
import { UpdateFilmDto } from './dto/update-film.dto';

@Injectable()
export class FilmService extends ResourceService<
  CreateFilmDto,
  UpdateFilmDto,
  Film,
  DFilm,
  RIDFilm
> {
  constructor(filmRepository: FilmRepository) {
    super(filmRepository);
  }
}
