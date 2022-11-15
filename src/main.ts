import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as morgan from 'morgan';
import { NestExpressApplication } from '@nestjs/platform-express';
import { Logger, ValidationPipe } from '@nestjs/common';
import { GlobalResponseInterceptor } from './common/interceptors/global-response.interceptor';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { GlobalExceptionFilter } from './common/filters/global-exception.filter';
import { ConfigService } from '@nestjs/config';
import { config } from 'aws-sdk';
import * as session from 'express-session';
import * as passport from 'passport';
import { Aws, Session } from './configs/config';
import { PaginatedDto } from './common/dto/paginated.dto';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  const configService = app.get(ConfigService);
  app.use(
    morgan(
      ':remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length] - :response-time ms',
    ),
  );
  app.setGlobalPrefix('api', { exclude: ['/'] });
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, transform: true }));
  app.useGlobalFilters(new GlobalExceptionFilter(configService));
  app.useGlobalInterceptors(new GlobalResponseInterceptor());

  const aws = configService.get<Aws>('aws');
  const s = configService.get<Session>('session');
  const port = configService.get<number>('port');
  const env = configService.get<string>('env');

  config.update({
    accessKeyId: aws.keyId,
    secretAccessKey: aws.secretKey,
    region: aws.region,
  });
  app.use(
    session({
      secret: s.secretKey,
      resave: true,
      saveUninitialized: false,
    }),
  );
  app.use(passport.initialize());
  app.use(passport.session());
  if (env === 'development') {
    const cfg = new DocumentBuilder()
      .setTitle('Starwars API')
      .setDescription('API for starwars')
      .setVersion('1.0')
      .build();
    const document = SwaggerModule.createDocument(app, cfg, {
      extraModels: [PaginatedDto],
    });
    SwaggerModule.setup('/api/docs', app, document);
  }

  await app.listen(port, () => {
    Logger.log(`Server is running on ${port} port`);
  });
}
bootstrap();
