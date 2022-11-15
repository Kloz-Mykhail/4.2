<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

  <p align="center">Starwars API like <a href="https://swapi.dev" target="_blank">Swapi</a> on NestJS</p>

## Description

API where saved all information about starwars

## Installation

```bash
$ npm install
```

## Running the app

Set all environment variable and constants. Then run the application
Path to file with environment variable should add to constants(src/app.constants.ts -> ENV_FILE_PATH(default .env))

```bash
# Building
$ npm run build
# Up migrations
$ npm run migration:run
# Seeding
$ npm run seed:run
# After that you can start
$ npm run start
```

Start with docker compose
Set src/app.constants.ts -> ENV_FILE_PATH as .docker-compose.env
If you want to change app port then you should change a first number at line 30 in docker-compose.yaml(default 80)

```bash
# Building images
$ docker-compose build
# Start app
$ docker-compose up

```

## Documentation

Swagger is used here. Documentation is located on route `/api/docs`
