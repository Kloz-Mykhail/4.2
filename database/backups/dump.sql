/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `director` varchar(255) NOT NULL,
  `episode_id` int NOT NULL,
  `opening_crawl` text NOT NULL,
  `producer` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_91baa4f1f62ea493de2afdd3d6` (`title`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: films_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `films_files` (
  `filmId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`filmId`, `fileId`),
  KEY `IDX_81d8d8099c2c127007efc99e09` (`filmId`),
  KEY `IDX_36c856a2089f6f82b9e823eca8` (`fileId`),
  CONSTRAINT `FK_36c856a2089f6f82b9e823eca8f` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_81d8d8099c2c127007efc99e09a` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: films_people
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `films_people` (
  `filmId` int NOT NULL,
  `peopleId` int NOT NULL,
  PRIMARY KEY (`filmId`, `peopleId`),
  KEY `IDX_1e5f93a920705fb172133d1cfd` (`filmId`),
  KEY `IDX_8d3e51a7748348eec6aa6cdfa7` (`peopleId`),
  CONSTRAINT `FK_1e5f93a920705fb172133d1cfd0` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_8d3e51a7748348eec6aa6cdfa75` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mass` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `hair_color` varchar(255) NOT NULL,
  `skin_color` varchar(255) NOT NULL,
  `eye_color` varchar(255) NOT NULL,
  `birth_year` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `url` varchar(255) NOT NULL,
  `homeworldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e7ec00b080e693706a6eaa6d31` (`name`),
  KEY `FK_8f79bb098a482fa585da15ef3a6` (`homeworldId`),
  CONSTRAINT `FK_8f79bb098a482fa585da15ef3a6` FOREIGN KEY (`homeworldId`) REFERENCES `planet` (`id`) ON DELETE
  SET
  NULL
) ENGINE = InnoDB AUTO_INCREMENT = 85 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_files` (
  `peopleId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `fileId`),
  KEY `IDX_f4be75434071b61482a9e5149c` (`peopleId`),
  KEY `IDX_b1715fec4a16ddffa3ec1055ad` (`fileId`),
  CONSTRAINT `FK_b1715fec4a16ddffa3ec1055add` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f4be75434071b61482a9e5149c9` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: planet
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `planet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rotation_period` varchar(255) NOT NULL,
  `orbital_period` varchar(255) NOT NULL,
  `diameter` varchar(255) NOT NULL,
  `climate` varchar(255) NOT NULL,
  `gravity` varchar(255) NOT NULL,
  `terrain` varchar(255) NOT NULL,
  `surface_water` varchar(255) NOT NULL,
  `population` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0c6595b668a276b8482611a20e` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 61 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: planets_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `planets_files` (
  `planetId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`planetId`, `fileId`),
  KEY `IDX_43f4f9d8b36bf0e62b8e9976bc` (`planetId`),
  KEY `IDX_2f66c9d791f6739000bd0035fc` (`fileId`),
  CONSTRAINT `FK_2f66c9d791f6739000bd0035fca` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_43f4f9d8b36bf0e62b8e9976bcb` FOREIGN KEY (`planetId`) REFERENCES `planet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: planets_films
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `planets_films` (
  `planetId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`planetId`, `filmId`),
  KEY `IDX_0669ab21b7cee95d60dff164b9` (`planetId`),
  KEY `IDX_f8e8b057a96edc77554d5e7ed6` (`filmId`),
  CONSTRAINT `FK_0669ab21b7cee95d60dff164b9d` FOREIGN KEY (`planetId`) REFERENCES `planet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f8e8b057a96edc77554d5e7ed67` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: role
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae4578dcaed5adff96595e6166` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: specie
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `specie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `average_height` varchar(255) NOT NULL,
  `average_lifespan` varchar(255) NOT NULL,
  `classification` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `designation` varchar(255) NOT NULL,
  `eye_colors` varchar(255) NOT NULL,
  `hair_colors` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skin_colors` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_7ba28414e58e42dde126265c0c` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: species_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `species_files` (
  `specieId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`specieId`, `fileId`),
  KEY `IDX_28eecf8b1866b1217f75ba4791` (`specieId`),
  KEY `IDX_fc83a968d762f178eee88f54f2` (`fileId`),
  CONSTRAINT `FK_28eecf8b1866b1217f75ba47913` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fc83a968d762f178eee88f54f2e` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: species_films
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `species_films` (
  `specieId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`specieId`, `filmId`),
  KEY `IDX_90486df3539bccc8e95637f6da` (`specieId`),
  KEY `IDX_8822d687beced14aecdfd67076` (`filmId`),
  CONSTRAINT `FK_8822d687beced14aecdfd670760` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_90486df3539bccc8e95637f6da0` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: species_people
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `species_people` (
  `specieId` int NOT NULL,
  `peopleId` int NOT NULL,
  PRIMARY KEY (`specieId`, `peopleId`),
  KEY `IDX_3a41f889e5a38ddb836fc7ffe2` (`specieId`),
  KEY `IDX_8019a9b0a4e75b66f02bc76a7c` (`peopleId`),
  CONSTRAINT `FK_3a41f889e5a38ddb836fc7ffe24` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_8019a9b0a4e75b66f02bc76a7c1` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starship
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MGLT` varchar(255) NOT NULL,
  `cargo_capacity` varchar(255) NOT NULL,
  `consumables` varchar(255) NOT NULL,
  `cost_in_credits` varchar(255) NOT NULL,
  `crew` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `hyperdrive_rating` varchar(255) NOT NULL,
  `length` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `max_atmosphering_speed` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `passengers` varchar(255) NOT NULL,
  `starship_class` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_c2d61780efcb47029ac7792a2c` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 79 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starships_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starships_files` (
  `starshipId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`starshipId`, `fileId`),
  KEY `IDX_11dcd33b40372586c435b70810` (`starshipId`),
  KEY `IDX_65cae233d3074b5696a0700fd4` (`fileId`),
  CONSTRAINT `FK_11dcd33b40372586c435b70810d` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_65cae233d3074b5696a0700fd4e` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starships_films
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starships_films` (
  `starshipId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`starshipId`, `filmId`),
  KEY `IDX_69539bdac9f2e1cf41057b7975` (`starshipId`),
  KEY `IDX_c10ff2757d2684ca298114a859` (`filmId`),
  CONSTRAINT `FK_69539bdac9f2e1cf41057b79756` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c10ff2757d2684ca298114a8591` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starships_people
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starships_people` (
  `starshipId` int NOT NULL,
  `peopleId` int NOT NULL,
  PRIMARY KEY (`starshipId`, `peopleId`),
  KEY `IDX_1f5fed0fd05c5d164cddb392b3` (`starshipId`),
  KEY `IDX_26d0aa1855752c3b47b6703a69` (`peopleId`),
  CONSTRAINT `FK_1f5fed0fd05c5d164cddb392b34` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_26d0aa1855752c3b47b6703a69e` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: typeorm_migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `typeorm_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: typeorm_seeds
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `typeorm_seeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users_roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users_roles` (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`userId`, `roleId`),
  KEY `IDX_776b7cf9330802e5ef5a8fb18d` (`userId`),
  KEY `IDX_4fb14631257670efa14b15a3d8` (`roleId`),
  CONSTRAINT `FK_4fb14631257670efa14b15a3d86` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_776b7cf9330802e5ef5a8fb18dc` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consumables` varchar(255) NOT NULL,
  `cargo_capacity` varchar(255) NOT NULL,
  `cost_in_credits` varchar(255) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `edited` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `crew` varchar(255) NOT NULL,
  `length` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `max_atmosphering_speed` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `passengers` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `vehicle_class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9d8f33468a4dbf65d2b37370c9` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 77 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicles_files
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicles_files` (
  `vehicleId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`vehicleId`, `fileId`),
  KEY `IDX_839cd14956eb89077b59b563bf` (`vehicleId`),
  KEY `IDX_53a125bea2df4703a388b1d1e0` (`fileId`),
  CONSTRAINT `FK_53a125bea2df4703a388b1d1e0d` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_839cd14956eb89077b59b563bf4` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicles_films
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicles_films` (
  `vehicleId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`vehicleId`, `filmId`),
  KEY `IDX_0b4253bb8e3fc64c66157b2701` (`vehicleId`),
  KEY `IDX_d5a728d877f70748195c576f0c` (`filmId`),
  CONSTRAINT `FK_0b4253bb8e3fc64c66157b2701a` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_d5a728d877f70748195c576f0c9` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicles_people
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicles_people` (
  `vehicleId` int NOT NULL,
  `peopleId` int NOT NULL,
  PRIMARY KEY (`vehicleId`, `peopleId`),
  KEY `IDX_24ef6d872e5b68e6417da9d66a` (`vehicleId`),
  KEY `IDX_dddb9d7b6f97f1c21e8df59fe5` (`peopleId`),
  CONSTRAINT `FK_24ef6d872e5b68e6417da9d66ad` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dddb9d7b6f97f1c21e8df59fe5a` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: film
# ------------------------------------------------------------

INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    1,
    'George Lucas',
    4,
    'It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire\'s\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire\'s\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....',
    'Gary Kurtz, Rick McCallum',
    '1977-05-25',
    'A New Hope',
    'http://localhost:3000/api/films/1',
    '2022-12-05 12:28:34.042180',
    '2022-12-05 12:28:34.000000'
  );
INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    2,
    'Irvin Kershner',
    5,
    'It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....',
    'Gary Kurtz, Rick McCallum',
    '1980-05-17',
    'The Empire Strikes Back',
    'http://localhost:3000/api/films/2',
    '2022-12-05 12:28:34.045366',
    '2022-12-05 12:28:34.000000'
  );
INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    3,
    'Richard Marquand',
    6,
    'Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...',
    'Howard G. Kazanjian, George Lucas, Rick McCallum',
    '1983-05-25',
    'Return of the Jedi',
    'http://localhost:3000/api/films/3',
    '2022-12-05 12:28:34.048919',
    '2022-12-05 12:28:34.000000'
  );
INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    4,
    'George Lucas',
    1,
    'Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....',
    'Rick McCallum',
    '1999-05-19',
    'The Phantom Menace',
    'http://localhost:3000/api/films/4',
    '2022-12-05 12:28:34.053136',
    '2022-12-05 12:28:34.000000'
  );
INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    5,
    'George Lucas',
    2,
    'There is unrest in the Galactic\r\nSenate. Several thousand solar\r\nsystems have declared their\r\nintentions to leave the Republic.\r\n\r\nThis separatist movement,\r\nunder the leadership of the\r\nmysterious Count Dooku, has\r\nmade it difficult for the limited\r\nnumber of Jedi Knights to maintain \r\npeace and order in the galaxy.\r\n\r\nSenator Amidala, the former\r\nQueen of Naboo, is returning\r\nto the Galactic Senate to vote\r\non the critical issue of creating\r\nan ARMY OF THE REPUBLIC\r\nto assist the overwhelmed\r\nJedi....',
    'Rick McCallum',
    '2002-05-16',
    'Attack of the Clones',
    'http://localhost:3000/api/films/5',
    '2022-12-05 12:28:34.055103',
    '2022-12-05 12:28:34.000000'
  );
INSERT INTO
  `film` (
    `id`,
    `director`,
    `episode_id`,
    `opening_crawl`,
    `producer`,
    `release_date`,
    `title`,
    `url`,
    `created`,
    `edited`
  )
VALUES
  (
    6,
    'George Lucas',
    3,
    'War! The Republic is crumbling\r\nunder attacks by the ruthless\r\nSith Lord, Count Dooku.\r\nThere are heroes on both sides.\r\nEvil is everywhere.\r\n\r\nIn a stunning move, the\r\nfiendish droid leader, General\r\nGrievous, has swept into the\r\nRepublic capital and kidnapped\r\nChancellor Palpatine, leader of\r\nthe Galactic Senate.\r\n\r\nAs the Separatist Droid Army\r\nattempts to flee the besieged\r\ncapital with their valuable\r\nhostage, two Jedi Knights lead a\r\ndesperate mission to rescue the\r\ncaptive Chancellor....',
    'Rick McCallum',
    '2005-05-19',
    'Revenge of the Sith',
    'http://localhost:3000/api/films/6',
    '2022-12-05 12:28:34.057051',
    '2022-12-05 12:28:34.000000'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: films_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: films_people
# ------------------------------------------------------------

INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 4);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 5);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 6);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 7);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 8);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 9);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 12);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 13);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 14);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 15);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 16);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 18);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 19);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (1, 81);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 4);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 5);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 13);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 14);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 18);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 20);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 21);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 22);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 23);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 24);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 25);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (2, 26);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 4);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 5);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 13);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 14);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 16);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 18);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 20);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 21);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 22);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 25);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 27);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 28);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 29);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 30);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 31);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (3, 45);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 11);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 16);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 20);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 21);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 32);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 33);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 34);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 35);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 36);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 37);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 38);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 39);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 40);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 41);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 42);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 43);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 44);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 46);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 47);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 48);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 49);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 50);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 51);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 52);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 53);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 54);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 55);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 56);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 57);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 58);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (4, 59);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 6);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 7);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 11);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 20);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 21);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 22);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 33);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 35);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 36);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 40);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 43);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 46);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 51);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 52);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 53);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 58);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 59);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 60);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 61);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 62);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 63);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 64);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 65);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 66);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 67);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 68);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 69);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 70);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 71);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 72);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 73);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 74);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 75);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 76);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 77);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 78);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (5, 82);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 2);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 3);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 4);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 5);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 6);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 7);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 10);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 11);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 12);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 13);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 20);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 21);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 33);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 35);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 46);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 51);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 52);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 53);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 54);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 55);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 56);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 58);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 63);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 64);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 67);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 68);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 75);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 78);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 79);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 80);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 81);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 82);
INSERT INTO
  `films_people` (`filmId`, `peopleId`)
VALUES
  (6, 83);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people
# ------------------------------------------------------------

INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    2,
    'C-3PO',
    '75',
    '167',
    'n/a',
    'gold',
    'yellow',
    '112BBY',
    'n/a',
    '2022-12-05 12:28:34.669846',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/2',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    3,
    'R2-D2',
    '32',
    '96',
    'n/a',
    'white, blue',
    'red',
    '33BBY',
    'n/a',
    '2022-12-05 12:28:34.673476',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/3',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    4,
    'Darth Vader',
    '136',
    '202',
    'none',
    'white',
    'yellow',
    '41.9BBY',
    'male',
    '2022-12-05 12:28:34.676092',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/4',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    5,
    'Leia Organa',
    '49',
    '150',
    'brown',
    'light',
    'brown',
    '19BBY',
    'female',
    '2022-12-05 12:28:34.677301',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/5',
    2
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    6,
    'Owen Lars',
    '120',
    '178',
    'brown, grey',
    'light',
    'blue',
    '52BBY',
    'male',
    '2022-12-05 12:28:34.609983',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/6',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    7,
    'Beru Whitesun lars',
    '75',
    '165',
    'brown',
    'light',
    'blue',
    '47BBY',
    'female',
    '2022-12-05 12:28:34.612292',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/7',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    8,
    'R5-D4',
    '32',
    '97',
    'n/a',
    'white, red',
    'red',
    'unknown',
    'n/a',
    '2022-12-05 12:28:34.684427',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/8',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    9,
    'Biggs Darklighter',
    '84',
    '183',
    'black',
    'light',
    'brown',
    '24BBY',
    'male',
    '2022-12-05 12:28:34.686791',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/9',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    10,
    'Obi-Wan Kenobi',
    '77',
    '182',
    'auburn, white',
    'fair',
    'blue-gray',
    '57BBY',
    'male',
    '2022-12-05 12:28:34.712630',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/10',
    20
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    11,
    'Anakin Skywalker',
    '84',
    '188',
    'blond',
    'fair',
    'blue',
    '41.9BBY',
    'male',
    '2022-12-05 12:28:35.095607',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/11',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    12,
    'Wilhuff Tarkin',
    'unknown',
    '180',
    'auburn, grey',
    'fair',
    'blue',
    '64BBY',
    'male',
    '2022-12-05 12:28:35.043979',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/12',
    21
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    13,
    'Chewbacca',
    '112',
    '228',
    'brown',
    'unknown',
    'blue',
    '200BBY',
    'male',
    '2022-12-05 12:28:35.127260',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/13',
    14
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    14,
    'Han Solo',
    '80',
    '180',
    'brown',
    'fair',
    'brown',
    '29BBY',
    'male',
    '2022-12-05 12:28:35.074455',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/14',
    22
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    15,
    'Greedo',
    '74',
    '173',
    'n/a',
    'green',
    'black',
    '44BBY',
    'male',
    '2022-12-05 12:28:35.076867',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/15',
    23
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    16,
    'Jabba Desilijic Tiure',
    '1,358',
    '175',
    'n/a',
    'green-tan, brown',
    'orange',
    '600BBY',
    'hermaphrodite',
    '2022-12-05 12:28:35.078330',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/16',
    24
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    18,
    'Wedge Antilles',
    '77',
    '170',
    'brown',
    'fair',
    'hazel',
    '21BBY',
    'male',
    '2022-12-05 12:28:35.107519',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/18',
    22
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    19,
    'Jek Tono Porkins',
    '110',
    '180',
    'brown',
    'fair',
    'blue',
    'unknown',
    'male',
    '2022-12-05 12:28:35.081309',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/19',
    26
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    20,
    'Yoda',
    '17',
    '66',
    'white',
    'green',
    'brown',
    '896BBY',
    'male',
    '2022-12-05 12:28:35.084161',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/20',
    28
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    21,
    'Palpatine',
    '75',
    '170',
    'grey',
    'pale',
    'yellow',
    '82BBY',
    'male',
    '2022-12-05 12:28:35.061547',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/21',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    22,
    'Boba Fett',
    '78.2',
    '183',
    'black',
    'fair',
    'brown',
    '31.5BBY',
    'male',
    '2022-12-05 12:28:35.437112',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/22',
    10
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    23,
    'IG-88',
    '140',
    '200',
    'none',
    'metal',
    'red',
    '15BBY',
    'none',
    '2022-12-05 12:28:35.437521',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/23',
    28
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    24,
    'Bossk',
    '113',
    '190',
    'none',
    'green',
    'red',
    '53BBY',
    'male',
    '2022-12-05 12:28:35.439789',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/24',
    29
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    25,
    'Lando Calrissian',
    '79',
    '177',
    'black',
    'dark',
    'brown',
    '31BBY',
    'male',
    '2022-12-05 12:28:35.442281',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/25',
    30
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    26,
    'Lobot',
    '79',
    '175',
    'none',
    'light',
    'blue',
    '37BBY',
    'male',
    '2022-12-05 12:28:35.417610',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/26',
    6
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    27,
    'Ackbar',
    '83',
    '180',
    'none',
    'brown mottle',
    'orange',
    '41BBY',
    'male',
    '2022-12-05 12:28:35.445119',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/27',
    31
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    28,
    'Mon Mothma',
    'unknown',
    '150',
    'auburn',
    'fair',
    'blue',
    '48BBY',
    'female',
    '2022-12-05 12:28:35.422444',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/28',
    32
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    29,
    'Arvel Crynyd',
    'unknown',
    'unknown',
    'brown',
    'fair',
    'brown',
    'unknown',
    'male',
    '2022-12-05 12:28:35.447008',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/29',
    28
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    30,
    'Wicket Systri Warrick',
    '20',
    '88',
    'brown',
    'brown',
    'brown',
    '8BBY',
    'male',
    '2022-12-05 12:28:35.448073',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/30',
    7
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    31,
    'Nien Nunb',
    '68',
    '160',
    'none',
    'grey',
    'black',
    'unknown',
    'male',
    '2022-12-05 12:28:35.494494',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/31',
    33
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    32,
    'Qui-Gon Jinn',
    '89',
    '193',
    'brown',
    'fair',
    'blue',
    '92BBY',
    'male',
    '2022-12-05 12:28:35.837125',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/32',
    28
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    33,
    'Nute Gunray',
    '90',
    '191',
    'none',
    'mottled green',
    'red',
    'unknown',
    'male',
    '2022-12-05 12:28:35.837415',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/33',
    18
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    34,
    'Finis Valorum',
    'unknown',
    '170',
    'blond',
    'fair',
    'blue',
    '91BBY',
    'male',
    '2022-12-05 12:28:35.772883',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/34',
    9
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    35,
    'Padm?? Amidala',
    '45',
    '185',
    'brown',
    'light',
    'brown',
    '46BBY',
    'female',
    '2022-12-05 12:28:35.841271',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/35',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    36,
    'Jar Jar Binks',
    '66',
    '196',
    'none',
    'orange',
    'orange',
    '52BBY',
    'male',
    '2022-12-05 12:28:35.842483',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/36',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    37,
    'Roos Tarpals',
    '82',
    '224',
    'none',
    'grey',
    'orange',
    'unknown',
    'male',
    '2022-12-05 12:28:35.843733',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/37',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    38,
    'Rugor Nass',
    'unknown',
    '206',
    'none',
    'green',
    'orange',
    'unknown',
    'male',
    '2022-12-05 12:28:35.844983',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/38',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    39,
    'Ric Oli??',
    'unknown',
    '183',
    'brown',
    'fair',
    'blue',
    'unknown',
    'male',
    '2022-12-05 12:28:35.846073',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/39',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    40,
    'Watto',
    'unknown',
    '137',
    'black',
    'blue, grey',
    'yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:35.847287',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/40',
    34
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    41,
    'Sebulba',
    '40',
    '112',
    'none',
    'grey, red',
    'orange',
    'unknown',
    'male',
    '2022-12-05 12:28:35.848758',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/41',
    35
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    42,
    'Quarsh Panaka',
    'unknown',
    '183',
    'black',
    'dark',
    'brown',
    '62BBY',
    'male',
    '2022-12-05 12:28:36.020020',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/42',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    43,
    'Shmi Skywalker',
    'unknown',
    '163',
    'black',
    'fair',
    'brown',
    '72BBY',
    'female',
    '2022-12-05 12:28:36.025954',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/43',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    44,
    'Darth Maul',
    '80',
    '175',
    'none',
    'red',
    'yellow',
    '54BBY',
    'male',
    '2022-12-05 12:28:36.124563',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/44',
    36
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    45,
    'Bib Fortuna',
    'unknown',
    '180',
    'none',
    'pale',
    'pink',
    'unknown',
    'male',
    '2022-12-05 12:28:36.075879',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/45',
    37
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    46,
    'Ayla Secura',
    '55',
    '178',
    'none',
    'blue',
    'hazel',
    '48BBY',
    'female',
    '2022-12-05 12:28:36.077641',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/46',
    37
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    47,
    'Ratts Tyerel',
    '15',
    '79',
    'none',
    'grey, blue',
    'unknown',
    'unknown',
    'male',
    '2022-12-05 12:28:36.078674',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/47',
    38
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    48,
    'Dud Bolt',
    '45',
    '94',
    'none',
    'blue, grey',
    'yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:36.079591',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/48',
    39
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    49,
    'Gasgano',
    'unknown',
    '122',
    'none',
    'white, blue',
    'black',
    'unknown',
    'male',
    '2022-12-05 12:28:36.080465',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/49',
    40
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    50,
    'Ben Quadinaros',
    '65',
    '163',
    'none',
    'grey, green, yellow',
    'orange',
    'unknown',
    'male',
    '2022-12-05 12:28:36.081803',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/50',
    41
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    51,
    'Mace Windu',
    '84',
    '188',
    'none',
    'dark',
    'brown',
    '72BBY',
    'male',
    '2022-12-05 12:28:36.044683',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/51',
    42
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    52,
    'Ki-Adi-Mundi',
    '82',
    '198',
    'white',
    'pale',
    'yellow',
    '92BBY',
    'male',
    '2022-12-05 12:28:36.463321',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/52',
    43
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    53,
    'Kit Fisto',
    '87',
    '196',
    'none',
    'green',
    'black',
    'unknown',
    'male',
    '2022-12-05 12:28:36.464225',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/53',
    44
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    54,
    'Eeth Koth',
    'unknown',
    '171',
    'black',
    'brown',
    'brown',
    'unknown',
    'male',
    '2022-12-05 12:28:36.466291',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/54',
    45
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    55,
    'Adi Gallia',
    '50',
    '184',
    'none',
    'dark',
    'blue',
    'unknown',
    'female',
    '2022-12-05 12:28:36.468738',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/55',
    9
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    56,
    'Saesee Tiin',
    'unknown',
    '188',
    'none',
    'pale',
    'orange',
    'unknown',
    'male',
    '2022-12-05 12:28:36.469827',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/56',
    47
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    57,
    'Yarael Poof',
    'unknown',
    '264',
    'none',
    'white',
    'yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:36.470826',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/57',
    48
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    58,
    'Plo Koon',
    '80',
    '188',
    'none',
    'orange',
    'black',
    '22BBY',
    'male',
    '2022-12-05 12:28:36.487236',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/58',
    49
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    59,
    'Mas Amedda',
    'unknown',
    '196',
    'none',
    'blue',
    'blue',
    'unknown',
    'male',
    '2022-12-05 12:28:36.474653',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/59',
    50
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    60,
    'Gregar Typho',
    '85',
    '185',
    'black',
    'dark',
    'brown',
    'unknown',
    'male',
    '2022-12-05 12:28:36.475901',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/60',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    61,
    'Cord??',
    'unknown',
    '157',
    'brown',
    'light',
    'brown',
    'unknown',
    'female',
    '2022-12-05 12:28:36.460814',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/61',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    62,
    'Cliegg Lars',
    'unknown',
    '183',
    'brown',
    'fair',
    'blue',
    '82BBY',
    'male',
    '2022-12-05 12:28:36.894079',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/62',
    1
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    63,
    'Poggle the Lesser',
    '80',
    '183',
    'none',
    'green',
    'yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:36.918007',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/63',
    11
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    64,
    'Luminara Unduli',
    '56.2',
    '170',
    'black',
    'yellow',
    'blue',
    '58BBY',
    'female',
    '2022-12-05 12:28:36.919844',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/64',
    51
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    65,
    'Barriss Offee',
    '50',
    '166',
    'black',
    'yellow',
    'blue',
    '40BBY',
    'female',
    '2022-12-05 12:28:36.921044',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/65',
    51
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    66,
    'Dorm??',
    'unknown',
    '165',
    'brown',
    'light',
    'brown',
    'unknown',
    'female',
    '2022-12-05 12:28:36.922077',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/66',
    8
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    67,
    'Dooku',
    '80',
    '193',
    'white',
    'fair',
    'brown',
    '102BBY',
    'male',
    '2022-12-05 12:28:36.940384',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/67',
    52
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    68,
    'Bail Prestor Organa',
    'unknown',
    '191',
    'black',
    'tan',
    'brown',
    '67BBY',
    'male',
    '2022-12-05 12:28:36.924634',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/68',
    2
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    69,
    'Jango Fett',
    '79',
    '183',
    'black',
    'tan',
    'brown',
    '66BBY',
    'male',
    '2022-12-05 12:28:36.910080',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/69',
    53
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    70,
    'Zam Wesell',
    '55',
    '168',
    'blonde',
    'fair, green, yellow',
    'yellow',
    'unknown',
    'female',
    '2022-12-05 12:28:36.944215',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/70',
    54
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    71,
    'Dexter Jettster',
    '102',
    '198',
    'none',
    'brown',
    'yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:36.928462',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/71',
    55
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    72,
    'Lama Su',
    '88',
    '229',
    'none',
    'grey',
    'black',
    'unknown',
    'male',
    '2022-12-05 12:28:37.304167',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/72',
    10
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    73,
    'Taun We',
    'unknown',
    '213',
    'none',
    'grey',
    'black',
    'unknown',
    'female',
    '2022-12-05 12:28:37.306437',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/73',
    10
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    74,
    'Jocasta Nu',
    'unknown',
    '167',
    'white',
    'fair',
    'blue',
    'unknown',
    'female',
    '2022-12-05 12:28:37.308376',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/74',
    9
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    75,
    'R4-P17',
    'unknown',
    '96',
    'none',
    'silver, red',
    'red, blue',
    'unknown',
    'female',
    '2022-12-05 12:28:37.290920',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/75',
    28
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    76,
    'Wat Tambor',
    '48',
    '193',
    'none',
    'green, grey',
    'unknown',
    'unknown',
    'male',
    '2022-12-05 12:28:37.311403',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/76',
    56
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    77,
    'San Hill',
    'unknown',
    '191',
    'none',
    'grey',
    'gold',
    'unknown',
    'male',
    '2022-12-05 12:28:37.312645',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/77',
    57
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    78,
    'Shaak Ti',
    '57',
    '178',
    'none',
    'red, blue, white',
    'black',
    'unknown',
    'female',
    '2022-12-05 12:28:37.314497',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/78',
    58
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    79,
    'Grievous',
    '159',
    '216',
    'none',
    'brown, white',
    'green, yellow',
    'unknown',
    'male',
    '2022-12-05 12:28:37.395540',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/79',
    59
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    80,
    'Tarfful',
    '136',
    '234',
    'brown',
    'brown',
    'blue',
    'unknown',
    'male',
    '2022-12-05 12:28:37.318473',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/80',
    14
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    81,
    'Raymus Antilles',
    '79',
    '188',
    'brown',
    'light',
    'brown',
    'unknown',
    'male',
    '2022-12-05 12:28:37.301611',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/81',
    2
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    82,
    'Sly Moore',
    '48',
    '178',
    'none',
    'pale',
    'white',
    'unknown',
    'female',
    '2022-12-05 12:28:37.552584',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/people/82',
    60
  );
INSERT INTO
  `people` (
    `id`,
    `name`,
    `mass`,
    `height`,
    `hair_color`,
    `skin_color`,
    `eye_color`,
    `birth_year`,
    `gender`,
    `created`,
    `edited`,
    `url`,
    `homeworldId`
  )
VALUES
  (
    83,
    'Tion Medon',
    '80',
    '206',
    'none',
    'grey',
    'black',
    'unknown',
    'male',
    '2022-12-05 12:28:37.557328',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/people/83',
    12
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planet
# ------------------------------------------------------------

INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    1,
    'Tatooine',
    '23',
    '304',
    '10465',
    'arid',
    '1 standard',
    'desert',
    '1',
    '200000',
    '2022-12-05 12:28:37.983143',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/1'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    2,
    'Alderaan',
    '24',
    '364',
    '12500',
    'temperate',
    '1 standard',
    'grasslands, mountains',
    '40',
    '2000000000',
    '2022-12-05 12:28:37.985022',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/2'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    3,
    'Yavin IV',
    '24',
    '4818',
    '10200',
    'temperate, tropical',
    '1 standard',
    'jungle, rainforests',
    '8',
    '1000',
    '2022-12-05 12:28:37.966851',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/3'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    4,
    'Hoth',
    '23',
    '549',
    '7200',
    'frozen',
    '1.1 standard',
    'tundra, ice caves, mountain ranges',
    '100',
    'unknown',
    '2022-12-05 12:28:37.968322',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/4'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    5,
    'Dagobah',
    '23',
    '341',
    '8900',
    'murky',
    'N/A',
    'swamp, jungles',
    '8',
    'unknown',
    '2022-12-05 12:28:37.969777',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/5'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    6,
    'Bespin',
    '12',
    '5110',
    '118000',
    'temperate',
    '1.5 (surface), 1 standard (Cloud City)',
    'gas giant',
    '0',
    '6000000',
    '2022-12-05 12:28:37.999871',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/6'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    7,
    'Endor',
    '18',
    '402',
    '4900',
    'temperate',
    '0.85 standard',
    'forests, mountains, lakes',
    '8',
    '30000000',
    '2022-12-05 12:28:38.012313',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/7'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    8,
    'Naboo',
    '26',
    '312',
    '12120',
    'temperate',
    '1 standard',
    'grassy hills, swamps, forests, mountains',
    '12',
    '4500000000',
    '2022-12-05 12:28:38.018566',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/8'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    9,
    'Coruscant',
    '24',
    '368',
    '12240',
    'temperate',
    '1 standard',
    'cityscape, mountains',
    'unknown',
    '1000000000000',
    '2022-12-05 12:28:38.020487',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/9'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    10,
    'Kamino',
    '27',
    '463',
    '19720',
    'temperate',
    '1 standard',
    'ocean',
    '100',
    '1000000000',
    '2022-12-05 12:28:38.021874',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/10'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    11,
    'Geonosis',
    '30',
    '256',
    '11370',
    'temperate, arid',
    '0.9 standard',
    'rock, desert, mountain, barren',
    '5',
    '100000000000',
    '2022-12-05 12:28:38.329026',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/11'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    12,
    'Utapau',
    '27',
    '351',
    '12900',
    'temperate, arid, windy',
    '1 standard',
    'scrublands, savanna, canyons, sinkholes',
    '0.9',
    '95000000',
    '2022-12-05 12:28:38.330251',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/12'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    13,
    'Mustafar',
    '36',
    '412',
    '4200',
    'hot',
    '1 standard',
    'volcanoes, lava rivers, mountains, caves',
    '0',
    '20000',
    '2022-12-05 12:28:38.313738',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/13'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    14,
    'Kashyyyk',
    '26',
    '381',
    '12765',
    'tropical',
    '1 standard',
    'jungle, forests, lakes, rivers',
    '60',
    '45000000',
    '2022-12-05 12:28:38.333894',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/14'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    15,
    'Polis Massa',
    '24',
    '590',
    '0',
    'artificial temperate ',
    '0.56 standard',
    'airless asteroid',
    '0',
    '1000000',
    '2022-12-05 12:28:38.319131',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/15'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    16,
    'Mygeeto',
    '12',
    '167',
    '10088',
    'frigid',
    '1 standard',
    'glaciers, mountains, ice canyons',
    'unknown',
    '19000000',
    '2022-12-05 12:28:38.321170',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/16'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    17,
    'Felucia',
    '34',
    '231',
    '9100',
    'hot, humid',
    '0.75 standard',
    'fungus forests',
    'unknown',
    '8500000',
    '2022-12-05 12:28:38.323193',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/17'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    18,
    'Cato Neimoidia',
    '25',
    '278',
    '0',
    'temperate, moist',
    '1 standard',
    'mountains, fields, forests, rock arches',
    'unknown',
    '10000000',
    '2022-12-05 12:28:38.341857',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/18'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    19,
    'Saleucami',
    '26',
    '392',
    '14920',
    'hot',
    'unknown',
    'caves, desert, mountains, volcanoes',
    'unknown',
    '1400000000',
    '2022-12-05 12:28:38.326182',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/19'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    20,
    'Stewjon',
    'unknown',
    'unknown',
    '0',
    'temperate',
    '1 standard',
    'grass',
    'unknown',
    'unknown',
    '2022-12-05 12:28:38.327871',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/20'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    21,
    'Eriadu',
    '24',
    '360',
    '13490',
    'polluted',
    '1 standard',
    'cityscape',
    'unknown',
    '22000000000',
    '2022-12-05 12:28:38.588853',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/21'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    22,
    'Corellia',
    '25',
    '329',
    '11000',
    'temperate',
    '1 standard',
    'plains, urban, hills, forests',
    '70',
    '3000000000',
    '2022-12-05 12:28:38.591265',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/22'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    23,
    'Rodia',
    '29',
    '305',
    '7549',
    'hot',
    '1 standard',
    'jungles, oceans, urban, swamps',
    '60',
    '1300000000',
    '2022-12-05 12:28:38.595440',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/23'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    24,
    'Nal Hutta',
    '87',
    '413',
    '12150',
    'temperate',
    '1 standard',
    'urban, oceans, swamps, bogs',
    'unknown',
    '7000000000',
    '2022-12-05 12:28:38.597683',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/24'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    25,
    'Dantooine',
    '25',
    '378',
    '9830',
    'temperate',
    '1 standard',
    'oceans, savannas, mountains, grasslands',
    'unknown',
    '1000',
    '2022-12-05 12:28:38.586011',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/25'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    26,
    'Bestine IV',
    '26',
    '680',
    '6400',
    'temperate',
    'unknown',
    'rocky islands, oceans',
    '98',
    '62000000',
    '2022-12-05 12:28:38.600102',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/26'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    27,
    'Ord Mantell',
    '26',
    '334',
    '14050',
    'temperate',
    '1 standard',
    'plains, seas, mesas',
    '10',
    '4000000000',
    '2022-12-05 12:28:38.587363',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/27'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    28,
    'unknown',
    '0',
    '0',
    '0',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:38.603164',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/28'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    29,
    'Trandosha',
    '25',
    '371',
    '0',
    'arid',
    '0.62 standard',
    'mountains, seas, grasslands, deserts',
    'unknown',
    '42000000',
    '2022-12-05 12:28:38.606969',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/29'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    30,
    'Socorro',
    '20',
    '326',
    '0',
    'arid',
    '1 standard',
    'deserts, mountains',
    'unknown',
    '300000000',
    '2022-12-05 12:28:38.609084',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/30'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    31,
    'Mon Cala',
    '21',
    '398',
    '11030',
    'temperate',
    '1',
    'oceans, reefs, islands',
    '100',
    '27000000000',
    '2022-12-05 12:28:38.801961',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/31'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    32,
    'Chandrila',
    '20',
    '368',
    '13500',
    'temperate',
    '1',
    'plains, forests',
    '40',
    '1200000000',
    '2022-12-05 12:28:38.803543',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/32'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    33,
    'Sullust',
    '20',
    '263',
    '12780',
    'superheated',
    '1',
    'mountains, volcanoes, rocky deserts',
    '5',
    '18500000000',
    '2022-12-05 12:28:38.805782',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/33'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    34,
    'Toydaria',
    '21',
    '184',
    '7900',
    'temperate',
    '1',
    'swamps, lakes',
    'unknown',
    '11000000',
    '2022-12-05 12:28:38.807957',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/34'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    35,
    'Malastare',
    '26',
    '201',
    '18880',
    'arid, temperate, tropical',
    '1.56',
    'swamps, deserts, jungles, mountains',
    'unknown',
    '2000000000',
    '2022-12-05 12:28:38.809234',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/35'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    36,
    'Dathomir',
    '24',
    '491',
    '10480',
    'temperate',
    '0.9',
    'forests, deserts, savannas',
    'unknown',
    '5200',
    '2022-12-05 12:28:38.810432',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/36'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    37,
    'Ryloth',
    '30',
    '305',
    '10600',
    'temperate, arid, subartic',
    '1',
    'mountains, valleys, deserts, tundra',
    '5',
    '1500000000',
    '2022-12-05 12:28:38.811693',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/37'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    38,
    'Aleen Minor',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:38.812963',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/38'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    39,
    'Vulpter',
    '22',
    '391',
    '14900',
    'temperate, artic',
    '1',
    'urban, barren',
    'unknown',
    '421000000',
    '2022-12-05 12:28:38.814222',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/39'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    40,
    'Troiken',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'desert, tundra, rainforests, mountains',
    'unknown',
    'unknown',
    '2022-12-05 12:28:38.816509',
    '2022-12-05 12:28:38.000000',
    'http://localhost:3000/api/planets/40'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    41,
    'Tund',
    '48',
    '1770',
    '12190',
    'unknown',
    'unknown',
    'barren, ash',
    'unknown',
    '0',
    '2022-12-05 12:28:39.042582',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/41'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    42,
    'Haruun Kal',
    '25',
    '383',
    '10120',
    'temperate',
    '0.98',
    'toxic cloudsea, plateaus, volcanoes',
    'unknown',
    '705300',
    '2022-12-05 12:28:39.043837',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/42'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    43,
    'Cerea',
    '27',
    '386',
    'unknown',
    'temperate',
    '1',
    'verdant',
    '20',
    '450000000',
    '2022-12-05 12:28:39.045088',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/43'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    44,
    'Glee Anselm',
    '33',
    '206',
    '15600',
    'tropical, temperate',
    '1',
    'lakes, islands, swamps, seas',
    '80',
    '500000000',
    '2022-12-05 12:28:39.046623',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/44'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    45,
    'Iridonia',
    '29',
    '413',
    'unknown',
    'unknown',
    'unknown',
    'rocky canyons, acid pools',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.051601',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/45'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    46,
    'Tholoth',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.040852',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/46'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    47,
    'Iktotch',
    '22',
    '481',
    'unknown',
    'arid, rocky, windy',
    '1',
    'rocky',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.054033',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/47'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    48,
    'Quermia',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.055435',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/48'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    49,
    'Dorin',
    '22',
    '409',
    '13400',
    'temperate',
    '1',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.056682',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/49'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    50,
    'Champala',
    '27',
    '318',
    'unknown',
    'temperate',
    '1',
    'oceans, rainforests, plateaus',
    'unknown',
    '3500000000',
    '2022-12-05 12:28:39.057940',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/50'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    51,
    'Mirial',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'deserts',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.295109',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/51'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    52,
    'Serenno',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'rainforests, rivers, mountains',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.296617',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/52'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    53,
    'Concord Dawn',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'jungles, forests, deserts',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.298573',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/53'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    54,
    'Zolan',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.300780',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/54'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    55,
    'Ojom',
    'unknown',
    'unknown',
    'unknown',
    'frigid',
    'unknown',
    'oceans, glaciers',
    '100',
    '500000000',
    '2022-12-05 12:28:39.302569',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/55'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    56,
    'Skako',
    '27',
    '384',
    'unknown',
    'temperate',
    '1',
    'urban, vines',
    'unknown',
    '500000000000',
    '2022-12-05 12:28:39.304010',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/56'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    57,
    'Muunilinst',
    '28',
    '412',
    '13800',
    'temperate',
    '1',
    'plains, forests, hills, mountains',
    '25',
    '5000000000',
    '2022-12-05 12:28:39.305472',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/57'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    58,
    'Shili',
    'unknown',
    'unknown',
    'unknown',
    'temperate',
    '1',
    'cities, savannahs, seas, plains',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.308000',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/58'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    59,
    'Kalee',
    '23',
    '378',
    '13850',
    'arid, temperate, tropical',
    '1',
    'rainforests, cliffs, canyons, seas',
    'unknown',
    '4000000000',
    '2022-12-05 12:28:39.309561',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/59'
  );
INSERT INTO
  `planet` (
    `id`,
    `name`,
    `rotation_period`,
    `orbital_period`,
    `diameter`,
    `climate`,
    `gravity`,
    `terrain`,
    `surface_water`,
    `population`,
    `created`,
    `edited`,
    `url`
  )
VALUES
  (
    60,
    'Umbara',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:39.310678',
    '2022-12-05 12:28:39.000000',
    'http://localhost:3000/api/planets/60'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planets_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planets_films
# ------------------------------------------------------------

INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (1, 1);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (1, 3);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (1, 4);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (1, 5);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (1, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (2, 1);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (2, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (3, 1);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (4, 2);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (5, 2);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (5, 3);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (5, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (6, 2);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (7, 3);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (8, 3);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (8, 4);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (8, 5);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (8, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (9, 3);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (9, 4);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (9, 5);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (9, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (10, 5);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (11, 5);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (12, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (13, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (14, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (15, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (16, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (17, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (18, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (19, 6);
INSERT INTO
  `planets_films` (`planetId`, `filmId`)
VALUES
  (27, 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: role
# ------------------------------------------------------------

INSERT INTO
  `role` (`id`, `name`)
VALUES
  (2, 'admin');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (1, 'user');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: specie
# ------------------------------------------------------------

INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    1,
    '180',
    '120',
    'mammal',
    '2022-12-05 12:28:39.811598',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'brown, blue, green, hazel, grey, amber',
    'blonde, brown, black, red',
    'Galactic Basic',
    'Human',
    'caucasian, black, asian, hispanic',
    'http://localhost:3000/api/species/1'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    2,
    'n/a',
    'indefinite',
    'artificial',
    '2022-12-05 12:28:39.813349',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'n/a',
    'n/a',
    'n/a',
    'Droid',
    'n/a',
    'http://localhost:3000/api/species/2'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    3,
    '210',
    '400',
    'mammal',
    '2022-12-05 12:28:39.814877',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'blue, green, yellow, brown, golden, red',
    'black, brown',
    'Shyriiwook',
    'Wookie',
    'gray',
    'http://localhost:3000/api/species/3'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    4,
    '170',
    'unknown',
    'sentient',
    '2022-12-05 12:28:39.818424',
    '2022-12-05 12:28:40.000000',
    'reptilian',
    'black',
    'n/a',
    'Galatic Basic',
    'Rodian',
    'green, blue',
    'http://localhost:3000/api/species/4'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    5,
    '300',
    '1000',
    'gastropod',
    '2022-12-05 12:28:39.820270',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow, red',
    'n/a',
    'Huttese',
    'Hutt',
    'green, brown, tan',
    'http://localhost:3000/api/species/5'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    6,
    '66',
    '900',
    'mammal',
    '2022-12-05 12:28:39.842462',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'brown, green, yellow',
    'brown, white',
    'Galactic basic',
    'Yoda\'s species',
    'green, yellow',
    'http://localhost:3000/api/species/6'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    7,
    '200',
    'unknown',
    'reptile',
    '2022-12-05 12:28:39.853790',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow, orange',
    'none',
    'Dosh',
    'Trandoshan',
    'brown, green',
    'http://localhost:3000/api/species/7'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    8,
    '160',
    'unknown',
    'amphibian',
    '2022-12-05 12:28:39.856024',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'Mon Calamarian',
    'Mon Calamari',
    'red, blue, brown, magenta',
    'http://localhost:3000/api/species/8'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    9,
    '100',
    'unknown',
    'mammal',
    '2022-12-05 12:28:39.858383',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'orange, brown',
    'white, brown, black',
    'Ewokese',
    'Ewok',
    'brown',
    'http://localhost:3000/api/species/9'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    10,
    '180',
    'unknown',
    'mammal',
    '2022-12-05 12:28:39.860013',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Sullutese',
    'Sullustan',
    'pale',
    'http://localhost:3000/api/species/10'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    11,
    '180',
    'unknown',
    'unknown',
    '2022-12-05 12:28:40.110921',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'red, pink',
    'none',
    'Neimoidia',
    'Neimodian',
    'grey, green',
    'http://localhost:3000/api/species/11'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    12,
    '190',
    'unknown',
    'amphibian',
    '2022-12-05 12:28:40.112238',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'orange',
    'none',
    'Gungan basic',
    'Gungan',
    'brown, green',
    'http://localhost:3000/api/species/12'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    13,
    '120',
    '91',
    'mammal',
    '2022-12-05 12:28:40.113366',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'Toydarian',
    'Toydarian',
    'blue, green, grey',
    'http://localhost:3000/api/species/13'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    14,
    '100',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.114788',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow, blue',
    'none',
    'Dugese',
    'Dug',
    'brown, purple, grey, red',
    'http://localhost:3000/api/species/14'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    15,
    '200',
    'unknown',
    'mammals',
    '2022-12-05 12:28:40.117975',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'blue, brown, orange, pink',
    'none',
    'Twi\'leki',
    'Twi\'lek',
    'orange, yellow, blue, green, pink, purple, tan',
    'http://localhost:3000/api/species/15'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    16,
    '80',
    '79',
    'reptile',
    '2022-12-05 12:28:40.119225',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'unknown',
    'none',
    'Aleena',
    'Aleena',
    'blue, gray',
    'http://localhost:3000/api/species/16'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    17,
    '100',
    'unknown',
    'unknown',
    '2022-12-05 12:28:40.120113',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'vulpterish',
    'Vulptereen',
    'grey',
    'http://localhost:3000/api/species/17'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    18,
    '125',
    'unknown',
    'unknown',
    '2022-12-05 12:28:40.121078',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Xextese',
    'Xexto',
    'grey, yellow, purple',
    'http://localhost:3000/api/species/18'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    19,
    '200',
    'unknown',
    'unknown',
    '2022-12-05 12:28:40.122076',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'orange',
    'none',
    'Tundan',
    'Toong',
    'grey, green, yellow',
    'http://localhost:3000/api/species/19'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    20,
    '200',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.123028',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'hazel',
    'red, blond, black, white',
    'Cerean',
    'Cerean',
    'pale pink',
    'http://localhost:3000/api/species/20'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    21,
    '180',
    '70',
    'amphibian',
    '2022-12-05 12:28:40.368923',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Nautila',
    'Nautolan',
    'green, blue, brown, red',
    'http://localhost:3000/api/species/21'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    22,
    '180',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.370149',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'brown, orange',
    'black',
    'Zabraki',
    'Zabrak',
    'pale, brown, red, orange, yellow',
    'http://localhost:3000/api/species/22'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    23,
    'unknown',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.371502',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'blue, indigo',
    'unknown',
    'unknown',
    'Tholothian',
    'dark',
    'http://localhost:3000/api/species/23'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    24,
    '180',
    'unknown',
    'unknown',
    '2022-12-05 12:28:40.373885',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'orange',
    'none',
    'Iktotchese',
    'Iktotchi',
    'pink',
    'http://localhost:3000/api/species/24'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    25,
    '240',
    '86',
    'mammal',
    '2022-12-05 12:28:40.375004',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'Quermian',
    'Quermian',
    'white',
    'http://localhost:3000/api/species/25'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    26,
    '180',
    '70',
    'unknown',
    '2022-12-05 12:28:40.375956',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black, silver',
    'none',
    'Kel Dor',
    'Kel Dor',
    'peach, orange, red',
    'http://localhost:3000/api/species/26'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    27,
    '190',
    'unknown',
    'amphibian',
    '2022-12-05 12:28:40.376837',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'blue',
    'none',
    'Chagria',
    'Chagrian',
    'blue',
    'http://localhost:3000/api/species/27'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    28,
    '178',
    'unknown',
    'insectoid',
    '2022-12-05 12:28:40.377727',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'green, hazel',
    'none',
    'Geonosian',
    'Geonosian',
    'green, brown',
    'http://localhost:3000/api/species/28'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    29,
    '180',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.378578',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'blue, green, red, yellow, brown, orange',
    'black, brown',
    'Mirialan',
    'Mirialan',
    'yellow, green',
    'http://localhost:3000/api/species/29'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    30,
    '180',
    '70',
    'reptilian',
    '2022-12-05 12:28:40.379418',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'Clawdite',
    'Clawdite',
    'green, yellow',
    'http://localhost:3000/api/species/30'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    31,
    '178',
    '75',
    'amphibian',
    '2022-12-05 12:28:40.657817',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'besalisk',
    'Besalisk',
    'brown',
    'http://localhost:3000/api/species/31'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    32,
    '220',
    '80',
    'amphibian',
    '2022-12-05 12:28:40.659415',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Kaminoan',
    'Kaminoan',
    'grey, blue',
    'http://localhost:3000/api/species/32'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    33,
    'unknown',
    'unknown',
    'mammal',
    '2022-12-05 12:28:40.660534',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'unknown',
    'none',
    'Skakoan',
    'Skakoan',
    'grey, green',
    'http://localhost:3000/api/species/33'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    34,
    '190',
    '100',
    'mammal',
    '2022-12-05 12:28:40.661841',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Muun',
    'Muun',
    'grey, white',
    'http://localhost:3000/api/species/34'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    35,
    '180',
    '94',
    'mammal',
    '2022-12-05 12:28:40.663092',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'red, orange, yellow, green, blue, black',
    'none',
    'Togruti',
    'Togruta',
    'red, white, orange, yellow, green, blue',
    'http://localhost:3000/api/species/35'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    36,
    '170',
    '80',
    'reptile',
    '2022-12-05 12:28:40.664277',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'yellow',
    'none',
    'Kaleesh',
    'Kaleesh',
    'brown, orange, tan',
    'http://localhost:3000/api/species/36'
  );
INSERT INTO
  `specie` (
    `id`,
    `average_height`,
    `average_lifespan`,
    `classification`,
    `created`,
    `edited`,
    `designation`,
    `eye_colors`,
    `hair_colors`,
    `language`,
    `name`,
    `skin_colors`,
    `url`
  )
VALUES
  (
    37,
    '190',
    '700',
    'mammal',
    '2022-12-05 12:28:40.666050',
    '2022-12-05 12:28:40.000000',
    'sentient',
    'black',
    'none',
    'Utapese',
    'Pau\'an',
    'grey',
    'http://localhost:3000/api/species/37'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: species_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: species_films
# ------------------------------------------------------------

INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 1);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 2);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (1, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 1);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 2);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (2, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (3, 1);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (3, 2);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (3, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (3, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (4, 1);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (5, 1);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (5, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (6, 2);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (6, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (6, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (6, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (6, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (7, 2);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (8, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (9, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (10, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (11, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (12, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (12, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (13, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (13, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (14, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (15, 3);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (15, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (15, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (15, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (16, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (17, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (18, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (19, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (19, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (20, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (20, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (21, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (22, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (23, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (23, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (24, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (24, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (25, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (25, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (26, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (26, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (27, 4);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (27, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (28, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (28, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (29, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (29, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (30, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (30, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (31, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (32, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (33, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (33, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (34, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (34, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (35, 5);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (35, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (36, 6);
INSERT INTO
  `species_films` (`specieId`, `filmId`)
VALUES
  (37, 6);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: species_people
# ------------------------------------------------------------

INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (1, 66);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (1, 67);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (1, 68);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (1, 74);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (2, 2);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (2, 3);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (2, 8);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (2, 23);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (3, 13);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (3, 80);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (4, 15);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (5, 16);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (6, 20);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (7, 24);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (8, 27);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (9, 30);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (10, 31);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (11, 33);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (12, 36);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (12, 37);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (12, 38);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (13, 40);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (14, 41);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (15, 45);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (15, 46);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (16, 47);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (17, 48);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (18, 49);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (19, 50);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (20, 52);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (21, 53);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (22, 44);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (22, 54);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (23, 55);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (24, 56);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (25, 57);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (26, 58);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (27, 59);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (28, 63);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (29, 64);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (29, 65);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (30, 70);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (31, 71);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (32, 72);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (32, 73);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (33, 76);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (34, 77);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (35, 78);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (36, 79);
INSERT INTO
  `species_people` (`specieId`, `peopleId`)
VALUES
  (37, 83);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starship
# ------------------------------------------------------------

INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    2,
    '60',
    '3000000',
    '1 year',
    '3500000',
    '30-165',
    '2022-12-05 12:28:41.299761',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '150',
    'Corellian Engineering Corporation',
    '950',
    'CR90 corvette',
    'CR90 corvette',
    '600',
    'corvette',
    'http://localhost:3000/api/starships/2'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    3,
    '60',
    '36000000',
    '2 years',
    '150000000',
    '47,060',
    '2022-12-05 12:28:41.301468',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '1,600',
    'Kuat Drive Yards',
    '975',
    'Imperial I-class Star Destroyer',
    'Star Destroyer',
    'n/a',
    'Star Destroyer',
    'http://localhost:3000/api/starships/3'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    5,
    '70',
    '180000',
    '1 month',
    '240000',
    '5',
    '2022-12-05 12:28:41.302755',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '38',
    'Sienar Fleet Systems, Cyngus Spaceworks',
    '1000',
    'Sentinel-class landing craft',
    'Sentinel-class landing craft',
    '75',
    'landing craft',
    'http://localhost:3000/api/starships/5'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    9,
    '10',
    '1000000000000',
    '3 years',
    '1000000000000',
    '342,953',
    '2022-12-05 12:28:41.304813',
    '2022-12-05 12:28:41.000000',
    '4.0',
    '120000',
    'Imperial Department of Military Research, Sienar Fleet Systems',
    'n/a',
    'DS-1 Orbital Battle Station',
    'Death Star',
    '843,342',
    'Deep Space Mobile Battlestation',
    'http://localhost:3000/api/starships/9'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    10,
    '75',
    '100000',
    '2 months',
    '100000',
    '4',
    '2022-12-05 12:28:41.324066',
    '2022-12-05 12:28:41.000000',
    '0.5',
    '34.37',
    'Corellian Engineering Corporation',
    '1050',
    'YT-1300 light freighter',
    'Millennium Falcon',
    '6',
    'Light freighter',
    'http://localhost:3000/api/starships/10'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    11,
    '80',
    '110',
    '1 week',
    '134999',
    '2',
    '2022-12-05 12:28:41.308900',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '14',
    'Koensayr Manufacturing',
    '1000km',
    'BTL Y-wing',
    'Y-wing',
    '0',
    'assault starfighter',
    'http://localhost:3000/api/starships/11'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    12,
    '100',
    '110',
    '1 week',
    '149999',
    '1',
    '2022-12-05 12:28:41.326998',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '12.5',
    'Incom Corporation',
    '1050',
    'T-65 X-wing',
    'X-wing',
    '0',
    'Starfighter',
    'http://localhost:3000/api/starships/12'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    13,
    '105',
    '150',
    '5 days',
    'unknown',
    '1',
    '2022-12-05 12:28:41.328189',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '9.2',
    'Sienar Fleet Systems',
    '1200',
    'Twin Ion Engine Advanced x1',
    'TIE Advanced x1',
    '0',
    'Starfighter',
    'http://localhost:3000/api/starships/13'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    15,
    '40',
    '250000000',
    '6 years',
    '1143350000',
    '279,144',
    '2022-12-05 12:28:41.313961',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '19000',
    'Kuat Drive Yards, Fondor Shipyards',
    'n/a',
    'Executor-class star dreadnought',
    'Executor',
    '38000',
    'Star dreadnought',
    'http://localhost:3000/api/starships/15'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    17,
    '20',
    '19000000',
    '6 months',
    'unknown',
    '6',
    '2022-12-05 12:28:41.316708',
    '2022-12-05 12:28:41.000000',
    '4.0',
    '90',
    'Gallofree Yards, Inc.',
    '650',
    'GR-75 medium transport',
    'Rebel transport',
    '90',
    'Medium transport',
    'http://localhost:3000/api/starships/17'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    21,
    '70',
    '70000',
    '1 month',
    'unknown',
    '1',
    '2022-12-05 12:28:41.597301',
    '2022-12-05 12:28:41.000000',
    '3.0',
    '21.5',
    'Kuat Systems Engineering',
    '1000',
    'Firespray-31-class patrol and attack',
    'Slave 1',
    '6',
    'Patrol craft',
    'http://localhost:3000/api/starships/21'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    22,
    '50',
    '80000',
    '2 months',
    '240000',
    '6',
    '2022-12-05 12:28:41.602451',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '20',
    'Sienar Fleet Systems',
    '850',
    'Lambda-class T-4a shuttle',
    'Imperial shuttle',
    '20',
    'Armed government transport',
    'http://localhost:3000/api/starships/22'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    23,
    '40',
    '6000000',
    '2 years',
    '8500000',
    '854',
    '2022-12-05 12:28:41.585433',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '300',
    'Kuat Drive Yards',
    '800',
    'EF76 Nebulon-B escort frigate',
    'EF76 Nebulon-B escort frigate',
    '75',
    'Escort ship',
    'http://localhost:3000/api/starships/23'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    27,
    '60',
    'unknown',
    '2 years',
    '104000000',
    '5400',
    '2022-12-05 12:28:41.586930',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '1200',
    'Mon Calamari shipyards',
    'n/a',
    'MC80 Liberty type Star Cruiser',
    'Calamari Cruiser',
    '1200',
    'Star Cruiser',
    'http://localhost:3000/api/starships/27'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    28,
    '120',
    '40',
    '1 week',
    '175000',
    '1',
    '2022-12-05 12:28:41.607785',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '9.6',
    'Alliance Underground Engineering, Incom Corporation',
    '1300',
    'RZ-1 A-wing Interceptor',
    'A-wing',
    '0',
    'Starfighter',
    'http://localhost:3000/api/starships/28'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    29,
    '91',
    '45',
    '1 week',
    '220000',
    '1',
    '2022-12-05 12:28:41.589828',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '16.9',
    'Slayn & Korpil',
    '950',
    'A/SF-01 B-wing starfighter',
    'B-wing',
    '0',
    'Assault Starfighter',
    'http://localhost:3000/api/starships/29'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    31,
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '9',
    '2022-12-05 12:28:41.591157',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '115',
    'Corellian Engineering Corporation',
    '900',
    'Consular-class cruiser',
    'Republic Cruiser',
    '16',
    'Space cruiser',
    'http://localhost:3000/api/starships/31'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    32,
    'unknown',
    '4000000000',
    '500 days',
    'unknown',
    '175',
    '2022-12-05 12:28:41.592542',
    '2022-12-05 12:28:41.000000',
    '2.0',
    '3170',
    'Hoersch-Kessel Drive, Inc.',
    'n/a',
    'Lucrehulk-class Droid Control Ship',
    'Droid control ship',
    '139000',
    'Droid control ship',
    'http://localhost:3000/api/starships/32'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    39,
    'unknown',
    '65',
    '7 days',
    '200000',
    '1',
    '2022-12-05 12:28:41.611473',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '11',
    'Theed Palace Space Vessel Engineering Corps',
    '1100',
    'N-1 starfighter',
    'Naboo fighter',
    '0',
    'Starfighter',
    'http://localhost:3000/api/starships/39'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    40,
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '8',
    '2022-12-05 12:28:41.612297',
    '2022-12-05 12:28:41.000000',
    '1.8',
    '76',
    'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives',
    '920',
    'J-type 327 Nubian royal starship',
    'Naboo Royal Starship',
    'unknown',
    'yacht',
    'http://localhost:3000/api/starships/40'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    41,
    'unknown',
    '2500000',
    '30 days',
    '55000000',
    '1',
    '2022-12-05 12:28:41.812051',
    '2022-12-05 12:28:41.000000',
    '1.5',
    '26.5',
    'Republic Sienar Systems',
    '1180',
    'Star Courier',
    'Scimitar',
    '6',
    'Space Transport',
    'http://localhost:3000/api/starships/41'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    43,
    'unknown',
    'unknown',
    '1 year',
    '2000000',
    '5',
    '2022-12-05 12:28:41.795573',
    '2022-12-05 12:28:41.000000',
    '0.7',
    '39',
    'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives',
    '2000',
    'J-type diplomatic barge',
    'J-type diplomatic barge',
    '10',
    'Diplomatic barge',
    'http://localhost:3000/api/starships/43'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    47,
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:41.796902',
    '2022-12-05 12:28:41.000000',
    'unknown',
    '390',
    'Botajef Shipyards',
    'unknown',
    'Botajef AA-9 Freighter-Liner',
    'AA-9 Coruscant freighter',
    '30000',
    'freighter',
    'http://localhost:3000/api/starships/47'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    48,
    'unknown',
    '60',
    '7 days',
    '180000',
    '1',
    '2022-12-05 12:28:41.817311',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '8',
    'Kuat Systems Engineering',
    '1150',
    'Delta-7 Aethersprite-class interceptor',
    'Jedi starfighter',
    '0',
    'Starfighter',
    'http://localhost:3000/api/starships/48'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    49,
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '4',
    '2022-12-05 12:28:41.818431',
    '2022-12-05 12:28:41.000000',
    '0.9',
    '47.9',
    'Theed Palace Space Vessel Engineering Corps',
    '8000',
    'H-type Nubian yacht',
    'H-type Nubian yacht',
    'unknown',
    'yacht',
    'http://localhost:3000/api/starships/49'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    52,
    'unknown',
    '11250000',
    '2 years',
    'unknown',
    '700',
    '2022-12-05 12:28:41.803748',
    '2022-12-05 12:28:41.000000',
    '0.6',
    '752',
    'Rothana Heavy Engineering',
    'unknown',
    'Acclamator I-class assault ship',
    'Republic Assault ship',
    '16000',
    'assault ship',
    'http://localhost:3000/api/starships/52'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    58,
    'unknown',
    '240',
    '7 days',
    '35700',
    '3',
    '2022-12-05 12:28:41.806258',
    '2022-12-05 12:28:41.000000',
    '1.5',
    '15.2',
    'Huppla Pasa Tisc Shipwrights Collective',
    '1600',
    'Punworcca 116-class interstellar sloop',
    'Solar Sailer',
    '11',
    'yacht',
    'http://localhost:3000/api/starships/58'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    59,
    'unknown',
    '50000000',
    '4 years',
    '125000000',
    '600',
    '2022-12-05 12:28:41.822074',
    '2022-12-05 12:28:41.000000',
    '1.5',
    '1088',
    'Rendili StarDrive, Free Dac Volunteers Engineering corps.',
    '1050',
    'Providence-class carrier/destroyer',
    'Trade Federation cruiser',
    '48247',
    'capital ship',
    'http://localhost:3000/api/starships/59'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    61,
    'unknown',
    '50000',
    '56 days',
    '1000000',
    '5',
    '2022-12-05 12:28:41.809213',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '18.5',
    'Cygnus Spaceworks',
    '2000',
    'Theta-class T-2c shuttle',
    'Theta-class T-2c shuttle',
    '16',
    'transport',
    'http://localhost:3000/api/starships/61'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    63,
    'unknown',
    '20000000',
    '2 years',
    '59000000',
    '7400',
    '2022-12-05 12:28:41.810976',
    '2022-12-05 12:28:41.000000',
    '1.0',
    '1137',
    'Kuat Drive Yards, Allanteen Six shipyards',
    '975',
    'Senator-class Star Destroyer',
    'Republic attack cruiser',
    '2000',
    'star destroyer',
    'http://localhost:3000/api/starships/63'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    64,
    'unknown',
    'unknown',
    'unknown',
    'unknown',
    '3',
    '2022-12-05 12:28:42.069900',
    '2022-12-05 12:28:42.000000',
    '0.5',
    '29.2',
    'Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated',
    '1050',
    'J-type star skiff',
    'Naboo star skiff',
    '3',
    'yacht',
    'http://localhost:3000/api/starships/64'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    65,
    'unknown',
    '60',
    '2 days',
    '320000',
    '1',
    '2022-12-05 12:28:42.070917',
    '2022-12-05 12:28:42.000000',
    '1.0',
    '5.47',
    'Kuat Systems Engineering',
    '1500',
    'Eta-2 Actis-class light interceptor',
    'Jedi Interceptor',
    '0',
    'starfighter',
    'http://localhost:3000/api/starships/65'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    66,
    '100',
    '110',
    '5 days',
    '155000',
    '3',
    '2022-12-05 12:28:42.061566',
    '2022-12-05 12:28:42.000000',
    '1.0',
    '14.5',
    'Incom Corporation, Subpro Corporation',
    '1000',
    'Aggressive Reconnaissance-170 starfighte',
    'arc-170',
    '0',
    'starfighter',
    'http://localhost:3000/api/starships/66'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    68,
    'unknown',
    '40000000',
    '2 years',
    '57000000',
    '200',
    '2022-12-05 12:28:42.063306',
    '2022-12-05 12:28:42.000000',
    '1.0',
    '825',
    'Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries',
    'unknown',
    'Munificent-class star frigate',
    'Banking clan frigte',
    'unknown',
    'cruiser',
    'http://localhost:3000/api/starships/68'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    74,
    'unknown',
    '140',
    '7 days',
    '168000',
    '1',
    '2022-12-05 12:28:42.076496',
    '2022-12-05 12:28:42.000000',
    '6',
    '6.71',
    'Feethan Ottraw Scalable Assemblies',
    '1100',
    'Belbullab-22 starfighter',
    'Belbullab-22 starfighter',
    '0',
    'starfighter',
    'http://localhost:3000/api/starships/74'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    75,
    'unknown',
    '60',
    '15 hours',
    '102500',
    '1',
    '2022-12-05 12:28:42.067411',
    '2022-12-05 12:28:42.000000',
    '1.0',
    '7.9',
    'Kuat Systems Engineering',
    '1050',
    'Alpha-3 Nimbus-class V-wing starfighter',
    'V-wing',
    '0',
    'starfighter',
    'http://localhost:3000/api/starships/75'
  );
INSERT INTO
  `starship` (
    `id`,
    `MGLT`,
    `cargo_capacity`,
    `consumables`,
    `cost_in_credits`,
    `crew`,
    `created`,
    `edited`,
    `hyperdrive_rating`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `starship_class`,
    `url`
  )
VALUES
  (
    78,
    '60',
    '3000000',
    '1 year',
    '3500000',
    '30-165',
    '2022-12-05 12:46:22.435716',
    '2022-12-05 12:46:22.000000',
    '2.0',
    '150',
    'Corellian Engineering Corporation',
    '950',
    'CR90 corvette',
    'CR940 corvette',
    '600',
    'corvette',
    'http://localhost:3000/api/starships/78'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starships_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starships_films
# ------------------------------------------------------------

INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (2, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (2, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (2, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (3, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (3, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (3, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (5, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (9, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (10, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (10, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (10, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (11, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (11, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (11, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (12, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (12, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (12, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (13, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (15, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (15, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (17, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (17, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (21, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (21, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (22, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (22, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (23, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (23, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (27, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (28, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (29, 3);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (31, 4);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (32, 4);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (32, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (32, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (39, 4);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (39, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (40, 4);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (41, 4);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (43, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (47, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (48, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (48, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (49, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (52, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (58, 5);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (59, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (61, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (63, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (64, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (65, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (66, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (68, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (74, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (75, 6);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (78, 1);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (78, 2);
INSERT INTO
  `starships_films` (`starshipId`, `filmId`)
VALUES
  (78, 3);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starships_people
# ------------------------------------------------------------

INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (10, 13);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (10, 14);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (10, 25);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (10, 31);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (12, 9);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (12, 18);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (12, 19);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (13, 4);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (21, 22);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (22, 13);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (22, 14);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (28, 29);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (39, 11);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (39, 35);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (39, 60);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (40, 39);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (41, 44);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (48, 10);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (48, 58);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (49, 35);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (59, 10);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (59, 11);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (64, 10);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (64, 35);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (65, 10);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (65, 11);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (74, 10);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (74, 79);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (78, 2);
INSERT INTO
  `starships_people` (`starshipId`, `peopleId`)
VALUES
  (78, 3);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: typeorm_migrations
# ------------------------------------------------------------

INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (1, 1668113306555, 'CreateFilm1668113306555');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (2, 1668113533342, 'CreatePeople1668113533342');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (3, 1668113742178, 'CreatePlanet1668113742178');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (4, 1668113852378, 'CreateSpecie1668113852378');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (5, 1668114299651, 'CreateStarship1668114299651');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (6, 1668114481397, 'CreateVehicle1668114481397');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (7, 1668114764533, 'CreateFile1668114764533');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (
    8,
    1668114864533,
    'CreateSwapiRelations1668114864533'
  );
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (9, 1668114946371, 'CreateRole1668114946371');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (10, 1668115102592, 'CreateUser1668115102592');
INSERT INTO
  `typeorm_migrations` (`id`, `timestamp`, `name`)
VALUES
  (
    11,
    1668115270029,
    'CreateAuthRelations1668115270029'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: typeorm_seeds
# ------------------------------------------------------------

INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (1, 1668116270029, 'Films1668116270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (2, 1668117270029, 'People1668117270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (3, 1668119270029, 'Planets1668119270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (4, 1668120270029, 'Species1668120270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (5, 1668121270029, 'Starships1668121270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (6, 1668122270029, 'Vehicles1668122270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (7, 1668123270029, 'Roles1668123270029');
INSERT INTO
  `typeorm_seeds` (`id`, `timestamp`, `name`)
VALUES
  (8, 1668124270029, 'Users1668124270029');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user
# ------------------------------------------------------------

INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (
    1,
    'admin',
    '$2b$10$kG/jUjw4FJPcg5Td/GcZQuOqzai4CPVNI/wM4iloUxJLM9xdZghBC'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users_roles
# ------------------------------------------------------------

INSERT INTO
  `users_roles` (`userId`, `roleId`)
VALUES
  (1, 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle
# ------------------------------------------------------------

INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    4,
    '2 months',
    '50000',
    '150000',
    '2022-12-05 12:28:42.461921',
    '2022-12-05 12:28:42.000000',
    '46',
    '36.8 ',
    'Corellia Mining Corporation',
    '30',
    'Digger Crawler',
    'Sand Crawler',
    '30',
    'http://localhost:3000/api/vehicles/4',
    'wheeled'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    6,
    '0',
    '50',
    '14500',
    '2022-12-05 12:28:42.463828',
    '2022-12-05 12:28:42.000000',
    '1',
    '10.4 ',
    'Incom Corporation',
    '1200',
    'T-16 skyhopper',
    'T-16 skyhopper',
    '1',
    'http://localhost:3000/api/vehicles/6',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    7,
    'unknown',
    '5',
    '10550',
    '2022-12-05 12:28:42.465758',
    '2022-12-05 12:28:42.000000',
    '1',
    '3.4 ',
    'SoroSuub Corporation',
    '250',
    'X-34 landspeeder',
    'X-34 landspeeder',
    '1',
    'http://localhost:3000/api/vehicles/7',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    8,
    '2 days',
    '65',
    'unknown',
    '2022-12-05 12:28:42.467366',
    '2022-12-05 12:28:42.000000',
    '1',
    '6.4',
    'Sienar Fleet Systems',
    '1200',
    'Twin Ion Engine/Ln Starfighter',
    'TIE/LN starfighter',
    '0',
    'http://localhost:3000/api/vehicles/8',
    'starfighter'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    14,
    'none',
    '10',
    'unknown',
    '2022-12-05 12:28:42.485394',
    '2022-12-05 12:28:42.000000',
    '2',
    '4.5',
    'Incom corporation',
    '650',
    't-47 airspeeder',
    'Snowspeeder',
    '0',
    'http://localhost:3000/api/vehicles/14',
    'airspeeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    16,
    '2 days',
    'none',
    'unknown',
    '2022-12-05 12:28:42.470108',
    '2022-12-05 12:28:42.000000',
    '1',
    '7.8',
    'Sienar Fleet Systems',
    '850',
    'TIE/sa bomber',
    'TIE bomber',
    '0',
    'http://localhost:3000/api/vehicles/16',
    'space/planetary bomber'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    18,
    'unknown',
    '1000',
    'unknown',
    '2022-12-05 12:28:42.472728',
    '2022-12-05 12:28:42.000000',
    '5',
    '20',
    'Kuat Drive Yards, Imperial Department of Military Research',
    '60',
    'All Terrain Armored Transport',
    'AT-AT',
    '40',
    'http://localhost:3000/api/vehicles/18',
    'assault walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    19,
    'none',
    '200',
    'unknown',
    '2022-12-05 12:28:42.489628',
    '2022-12-05 12:28:42.000000',
    '2',
    '2',
    'Kuat Drive Yards, Imperial Department of Military Research',
    '90',
    'All Terrain Scout Transport',
    'AT-ST',
    '0',
    'http://localhost:3000/api/vehicles/19',
    'walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    20,
    '1 day',
    '10',
    '75000',
    '2022-12-05 12:28:42.476472',
    '2022-12-05 12:28:42.000000',
    '2',
    '7',
    'Bespin Motors',
    '1500',
    'Storm IV Twin-Pod',
    'Storm IV Twin-Pod cloud car',
    '0',
    'http://localhost:3000/api/vehicles/20',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    24,
    'Live food tanks',
    '2000000',
    '285000',
    '2022-12-05 12:28:42.478094',
    '2022-12-05 12:28:42.000000',
    '26',
    '30',
    'Ubrikkian Industries Custom Vehicle Division',
    '100',
    'Modified Luxury Sail Barge',
    'Sail barge',
    '500',
    'http://localhost:3000/api/vehicles/24',
    'sail barge'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    25,
    '1 day',
    '135000',
    '8000',
    '2022-12-05 12:28:42.858128',
    '2022-12-05 12:28:42.000000',
    '5',
    '9.5',
    'Ubrikkian Industries',
    '250',
    'Bantha-II',
    'Bantha-II cargo skiff',
    '16',
    'http://localhost:3000/api/vehicles/25',
    'repulsorcraft cargo skiff'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    26,
    '2 days',
    '75',
    'unknown',
    '2022-12-05 12:28:42.860437',
    '2022-12-05 12:28:42.000000',
    '1',
    '9.6',
    'Sienar Fleet Systems',
    '1250',
    'Twin Ion Engine Interceptor',
    'TIE/IN interceptor',
    '0',
    'http://localhost:3000/api/vehicles/26',
    'starfighter'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    30,
    '1 day',
    '4',
    '8000',
    '2022-12-05 12:28:42.880389',
    '2022-12-05 12:28:42.000000',
    '1',
    '3',
    'Aratech Repulsor Company',
    '360',
    '74-Z speeder bike',
    'Imperial Speeder Bike',
    '1',
    'http://localhost:3000/api/vehicles/30',
    'speeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    33,
    'none',
    '0',
    'unknown',
    '2022-12-05 12:28:42.863011',
    '2022-12-05 12:28:42.000000',
    '0',
    '3.5',
    'Haor Chall Engineering, Baktoid Armor Workshop',
    '1200',
    'Vulture-class droid starfighter',
    'Vulture Droid',
    '0',
    'http://localhost:3000/api/vehicles/33',
    'starfighter'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    34,
    'unknown',
    '12000',
    '138000',
    '2022-12-05 12:28:42.865340',
    '2022-12-05 12:28:42.000000',
    '4',
    '31',
    'Baktoid Armor Workshop',
    '35',
    'Multi-Troop Transport',
    'Multi-Troop Transport',
    '112',
    'http://localhost:3000/api/vehicles/34',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    35,
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:42.867072',
    '2022-12-05 12:28:42.000000',
    '4',
    '9.75',
    'Baktoid Armor Workshop',
    '55',
    'Armoured Assault Tank',
    'Armored Assault Tank',
    '6',
    'http://localhost:3000/api/vehicles/35',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    36,
    'none',
    'none',
    '2500',
    '2022-12-05 12:28:42.868342',
    '2022-12-05 12:28:42.000000',
    '1',
    '2',
    'Baktoid Armor Workshop',
    '400',
    'Single Trooper Aerial Platform',
    'Single Trooper Aerial Platform',
    '0',
    'http://localhost:3000/api/vehicles/36',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    37,
    '1 day',
    '1800000',
    '200000',
    '2022-12-05 12:28:42.869583',
    '2022-12-05 12:28:42.000000',
    '140',
    '210',
    'Haor Chall Engineering',
    '587',
    'C-9979 landing craft',
    'C-9979 landing craft',
    '284',
    'http://localhost:3000/api/vehicles/37',
    'landing craft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    38,
    'unknown',
    '1600',
    'unknown',
    '2022-12-05 12:28:42.889389',
    '2022-12-05 12:28:43.000000',
    '1',
    '15',
    'Otoh Gunga Bongameken Cooperative',
    '85',
    'Tribubble bongo',
    'Tribubble bongo',
    '2',
    'http://localhost:3000/api/vehicles/38',
    'submarine'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    42,
    'unknown',
    '2',
    '4000',
    '2022-12-05 12:28:42.890387',
    '2022-12-05 12:28:43.000000',
    '1',
    '1.5',
    'Razalon',
    '180',
    'FC-20 speeder bike',
    'Sith speeder',
    '0',
    'http://localhost:3000/api/vehicles/42',
    'speeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    44,
    'none',
    '200',
    '5750',
    '2022-12-05 12:28:43.166046',
    '2022-12-05 12:28:43.000000',
    '1',
    '3.68',
    'Mobquet Swoops and Speeders',
    '350',
    'Zephyr-G swoop bike',
    'Zephyr-G swoop bike',
    '1',
    'http://localhost:3000/api/vehicles/44',
    'repulsorcraft'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    45,
    'unknown',
    '80',
    'unknown',
    '2022-12-05 12:28:43.167684',
    '2022-12-05 12:28:43.000000',
    '1',
    '6.6',
    'Desler Gizh Outworld Mobility Corporation',
    '800',
    'Koro-2 Exodrive airspeeder',
    'Koro-2 Exodrive airspeeder',
    '1',
    'http://localhost:3000/api/vehicles/45',
    'airspeeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    46,
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:43.169837',
    '2022-12-05 12:28:43.000000',
    '1',
    '6.23',
    'Narglatch AirTech prefabricated kit',
    '720',
    'XJ-6 airspeeder',
    'XJ-6 airspeeder',
    '1',
    'http://localhost:3000/api/vehicles/46',
    'airspeeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    50,
    'unknown',
    '170',
    'unknown',
    '2022-12-05 12:28:43.154482',
    '2022-12-05 12:28:43.000000',
    '6',
    '17.4',
    'Rothana Heavy Engineering',
    '620',
    'Low Altitude Assault Transport/infrantry',
    'LAAT/i',
    '30',
    'http://localhost:3000/api/vehicles/50',
    'gunship'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    51,
    'unknown',
    '40000',
    'unknown',
    '2022-12-05 12:28:43.157048',
    '2022-12-05 12:28:43.000000',
    '1',
    '28.82',
    'Rothana Heavy Engineering',
    '620',
    'Low Altitude Assault Transport/carrier',
    'LAAT/c',
    '0',
    'http://localhost:3000/api/vehicles/51',
    'gunship'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    53,
    '21 days',
    '10000',
    'unknown',
    '2022-12-05 12:28:43.158186',
    '2022-12-05 12:28:43.000000',
    '6',
    '13.2',
    'Rothana Heavy Engineering, Kuat Drive Yards',
    '60',
    'All Terrain Tactical Enforcer',
    'AT-TE',
    '36',
    'http://localhost:3000/api/vehicles/53',
    'walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    54,
    '7 days',
    '500',
    'unknown',
    '2022-12-05 12:28:43.159378',
    '2022-12-05 12:28:43.000000',
    '25',
    '140',
    'Rothana Heavy Engineering',
    '35',
    'Self-Propelled Heavy Artillery',
    'SPHA',
    '30',
    'http://localhost:3000/api/vehicles/54',
    'walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    55,
    'unknown',
    'unknown',
    '8000',
    '2022-12-05 12:28:43.228792',
    '2022-12-05 12:28:43.000000',
    '1',
    '2',
    'Huppla Pasa Tisc Shipwrights Collective',
    '634',
    'Flitknot speeder',
    'Flitknot speeder',
    '0',
    'http://localhost:3000/api/vehicles/55',
    'speeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    56,
    '7 days',
    '1000',
    'unknown',
    '2022-12-05 12:28:43.162095',
    '2022-12-05 12:28:43.000000',
    '2',
    '20',
    'Haor Chall Engineering',
    '880',
    'Sheathipede-class transport shuttle',
    'Neimoidian shuttle',
    '6',
    'http://localhost:3000/api/vehicles/56',
    'transport'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    57,
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:43.163951',
    '2022-12-05 12:28:43.000000',
    '1',
    '9.8',
    'Huppla Pasa Tisc Shipwrights Collective',
    '20000',
    'Nantex-class territorial defense',
    'Geonosian starfighter',
    '0',
    'http://localhost:3000/api/vehicles/57',
    'starfighter'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    60,
    'none',
    '10',
    '15000',
    '2022-12-05 12:28:43.457792',
    '2022-12-05 12:28:43.000000',
    '1',
    '3.5',
    'Z-Gomot Ternbuell Guppat Corporation',
    '330',
    'Tsmeu-6 personal wheel bike',
    'Tsmeu-6 personal wheel bike',
    '1',
    'http://localhost:3000/api/vehicles/60',
    'wheeled walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    62,
    'unknown',
    'unknown',
    'unknown',
    '2022-12-05 12:28:43.442650',
    '2022-12-05 12:28:43.000000',
    '2',
    'unknown',
    'unknown',
    'unknown',
    'Fire suppression speeder',
    'Emergency Firespeeder',
    'unknown',
    'http://localhost:3000/api/vehicles/62',
    'fire suppression ship'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    67,
    'none',
    '0',
    '20000',
    '2022-12-05 12:28:43.444516',
    '2022-12-05 12:28:43.000000',
    '1',
    '5.4',
    'Colla Designs, Phlac-Arphocc Automata Industries',
    '1180',
    'tri-fighter',
    'Droid tri-fighter',
    '0',
    'http://localhost:3000/api/vehicles/67',
    'droid starfighter'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    69,
    '3 days',
    '50',
    '12125',
    '2022-12-05 12:28:43.445821',
    '2022-12-05 12:28:43.000000',
    '2',
    '15.1',
    'Appazanna Engineering Works',
    '420',
    'Oevvaor jet catamaran',
    'Oevvaor jet catamaran',
    '2',
    'http://localhost:3000/api/vehicles/69',
    'airspeeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    70,
    'none',
    '20',
    '14750',
    '2022-12-05 12:28:43.447740',
    '2022-12-05 12:28:43.000000',
    '2',
    '7',
    'Appazanna Engineering Works',
    '310',
    'Raddaugh Gnasp fluttercraft',
    'Raddaugh Gnasp fluttercraft',
    '0',
    'http://localhost:3000/api/vehicles/70',
    'air speeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    71,
    '20 days',
    '30000',
    '350000',
    '2022-12-05 12:28:43.450817',
    '2022-12-05 12:28:43.000000',
    '20',
    '49.4',
    'Kuat Drive Yards',
    '160',
    'HAVw A6 Juggernaut',
    'Clone turbo tank',
    '300',
    'http://localhost:3000/api/vehicles/71',
    'wheeled walker'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    72,
    'none',
    'none',
    '49000',
    '2022-12-05 12:28:43.452673',
    '2022-12-05 12:28:43.000000',
    '0',
    '10.96',
    'Techno Union',
    '100',
    'NR-N99 Persuader-class droid enforcer',
    'Corporate Alliance tank droid',
    '4',
    'http://localhost:3000/api/vehicles/72',
    'droid tank'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    73,
    'none',
    '0',
    '60000',
    '2022-12-05 12:28:43.453958',
    '2022-12-05 12:28:43.000000',
    '0',
    '12.3',
    'Baktoid Fleet Ordnance, Haor Chall Engineering',
    '820',
    'HMP droid gunship',
    'Droid gunship',
    '0',
    'http://localhost:3000/api/vehicles/73',
    'airspeeder'
  );
INSERT INTO
  `vehicle` (
    `id`,
    `consumables`,
    `cargo_capacity`,
    `cost_in_credits`,
    `created`,
    `edited`,
    `crew`,
    `length`,
    `manufacturer`,
    `max_atmosphering_speed`,
    `model`,
    `name`,
    `passengers`,
    `url`,
    `vehicle_class`
  )
VALUES
  (
    76,
    '1 day',
    '20',
    '40000',
    '2022-12-05 12:28:43.455227',
    '2022-12-05 12:28:43.000000',
    '1',
    '3.2',
    'Kuat Drive Yards',
    '90',
    'All Terrain Recon Transport',
    'AT-RT',
    '0',
    'http://localhost:3000/api/vehicles/76',
    'walker'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicles_files
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicles_films
# ------------------------------------------------------------

INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (4, 1);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (4, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (6, 1);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (7, 1);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (8, 1);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (8, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (8, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (14, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (16, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (16, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (18, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (18, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (19, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (19, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (20, 2);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (24, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (25, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (26, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (30, 3);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (33, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (33, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (34, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (35, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (36, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (37, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (38, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (42, 4);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (44, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (45, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (46, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (50, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (50, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (51, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (53, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (53, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (54, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (55, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (56, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (56, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (57, 5);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (60, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (62, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (67, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (69, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (70, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (71, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (72, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (73, 6);
INSERT INTO
  `vehicles_films` (`vehicleId`, `filmId`)
VALUES
  (76, 6);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicles_people
# ------------------------------------------------------------

INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (14, 18);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (19, 13);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (30, 5);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (38, 10);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (38, 32);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (42, 44);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (44, 11);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (45, 70);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (46, 11);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (55, 67);
INSERT INTO
  `vehicles_people` (`vehicleId`, `peopleId`)
VALUES
  (60, 79);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
