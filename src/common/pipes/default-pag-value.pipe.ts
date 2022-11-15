import { Injectable, PipeTransform } from '@nestjs/common';
import { DEFAULT_COUNT } from 'src/app.constants';
import { PagDto } from '../dto/pag.dto';

@Injectable()
export class DefaultPagValuePipe
  implements PipeTransform<Partial<PagDto>, PagDto>
{
  transform(value: Partial<PagDto>) {
    const page = value.page ? (value.page >= 1 ? value.page : 1) : 1;
    const limit = value.limit
      ? value.limit >= 0
        ? value.limit
        : 0
      : DEFAULT_COUNT;

    return { page, limit };
  }
}
