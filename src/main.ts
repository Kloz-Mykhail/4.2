import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { ValidationPipe } from '@nestjs/common';
import { CommonResponseInterceptor } from './common/common-response.interceptor';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { ErrorFilter } from './common/error.filter';
import { ConfigService } from '@nestjs/config';
import { config } from 'aws-sdk';
import * as session from 'express-session';
import * as passport from 'passport';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
  app.useGlobalFilters(new ErrorFilter());
  app.useGlobalInterceptors(new CommonResponseInterceptor());

  const configService = app.get(ConfigService);

  config.update({
    accessKeyId: configService.get('AWS_ACCESS_KEY_ID'),
    secretAccessKey: configService.get('AWS_SECRET_ACCESS_KEY'),
    region: configService.get('AWS_REGION'),
  });
  app.use(
    session({
      secret: configService.get('SESSION_SECRET_KEY'),
      resave: true,
      saveUninitialized: false,
    }),
  );
  app.use(passport.initialize());
  app.use(passport.session());

  const cfg = new DocumentBuilder()
    .setTitle('Starwars API')
    .setDescription('API for starwars')
    .setVersion('1.0')
    .build();
  const document = SwaggerModule.createDocument(app, cfg);
  SwaggerModule.setup('/api', app, document);

  await app.listen(configService.get('PORT') || 3000);
}
bootstrap();
