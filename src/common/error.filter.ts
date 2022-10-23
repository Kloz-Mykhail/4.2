import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
} from '@nestjs/common';
import { Response } from 'express';

@Catch(HttpException)
export class ErrorFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const res = host.switchToHttp().getResponse<Response>();
    const code = exception.getStatus();
    let error: string;
    if (code === 404) {
      error = 'Not found';
    } else if (code >= 400 && code < 500) {
      error = code + ' Bad request';
    } else if (code >= 500) {
      error = code + ' Internal server error';
    } else {
      error = '' + code + exception.message;
    }
    res.send(error);
  }
}
