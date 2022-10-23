import { Injectable, PipeTransform } from '@nestjs/common';

@Injectable()
export class ParsePagPipe implements PipeTransform {
  transform(value: any) {
    const offset = +((value.offset || 0) >= 0 ? value.offset || 0 : 0);
    const count = +(value.count || 10);

    return { offset, count };
  }
}
