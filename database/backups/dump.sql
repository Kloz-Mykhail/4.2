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
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
  `episode_id` int NOT NULL,
  `opening_crawl` text NOT NULL,
  `producer` varchar(255) NOT NULL,
  `release_date` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_91baa4f1f62ea493de2afdd3d6` (`title`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: film_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `film_files_file` (
  `filmId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`filmId`, `fileId`),
  KEY `IDX_6cd51afc585f3666ca3743c4a2` (`filmId`),
  KEY `IDX_4cb516b47e9e7b739f2cd9b0d4` (`fileId`),
  CONSTRAINT `FK_4cb516b47e9e7b739f2cd9b0d45` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6cd51afc585f3666ca3743c4a2f` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations_typeorm
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations_typeorm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  `created` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `homeworldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e7ec00b080e693706a6eaa6d31` (`name`),
  KEY `FK_8f79bb098a482fa585da15ef3a6` (`homeworldId`),
  CONSTRAINT `FK_8f79bb098a482fa585da15ef3a6` FOREIGN KEY (`homeworldId`) REFERENCES `planet` (`id`) ON DELETE
  SET
  NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_files_file` (
  `peopleId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `fileId`),
  KEY `IDX_62210608321a83292e39c6300b` (`peopleId`),
  KEY `IDX_05a153c750526a8286e8ed53e8` (`fileId`),
  CONSTRAINT `FK_05a153c750526a8286e8ed53e88` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_62210608321a83292e39c6300bd` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_films_film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_films_film` (
  `peopleId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `filmId`),
  KEY `IDX_99ce84505b9d277789a5742906` (`peopleId`),
  KEY `IDX_c4597771baad7514441c33793f` (`filmId`),
  CONSTRAINT `FK_99ce84505b9d277789a5742906b` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c4597771baad7514441c33793f5` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_species_specie
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_species_specie` (
  `peopleId` int NOT NULL,
  `specieId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `specieId`),
  KEY `IDX_a5c58a307b2a71698b33c2403d` (`peopleId`),
  KEY `IDX_b3a523bcb0a735cd88cfbdb369` (`specieId`),
  CONSTRAINT `FK_a5c58a307b2a71698b33c2403d3` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_b3a523bcb0a735cd88cfbdb3694` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_starships_starship
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_starships_starship` (
  `peopleId` int NOT NULL,
  `starshipId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `starshipId`),
  KEY `IDX_cd69a89b18df6a4e42c67877cf` (`peopleId`),
  KEY `IDX_baf66aafe260a12223240c8d4a` (`starshipId`),
  CONSTRAINT `FK_baf66aafe260a12223240c8d4a5` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`),
  CONSTRAINT `FK_cd69a89b18df6a4e42c67877cf5` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: people_vehicles_vehicle
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `people_vehicles_vehicle` (
  `peopleId` int NOT NULL,
  `vehicleId` int NOT NULL,
  PRIMARY KEY (`peopleId`, `vehicleId`),
  KEY `IDX_0c4799c95577dd53de3c919206` (`peopleId`),
  KEY `IDX_69511f955e4694544aa0056f25` (`vehicleId`),
  CONSTRAINT `FK_0c4799c95577dd53de3c9192060` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_69511f955e4694544aa0056f256` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`)
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
  `created` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0c6595b668a276b8482611a20e` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: planet_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `planet_files_file` (
  `planetId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`planetId`, `fileId`),
  KEY `IDX_9730b955e8b5b511a01baf0e3c` (`planetId`),
  KEY `IDX_18ce78fac2c0eb6f90bc09ca34` (`fileId`),
  CONSTRAINT `FK_18ce78fac2c0eb6f90bc09ca34f` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_9730b955e8b5b511a01baf0e3cf` FOREIGN KEY (`planetId`) REFERENCES `planet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: planet_films_film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `planet_films_film` (
  `planetId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`planetId`, `filmId`),
  KEY `IDX_b8d1e881fca1b60fb24f212a74` (`planetId`),
  KEY `IDX_80d06ca2f65a80e668607394cd` (`filmId`),
  CONSTRAINT `FK_80d06ca2f65a80e668607394cdd` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_b8d1e881fca1b60fb24f212a748` FOREIGN KEY (`planetId`) REFERENCES `planet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: role
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae4578dcaed5adff96595e6166` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: specie
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `specie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `average_height` varchar(255) NOT NULL,
  `average_lifespan` varchar(255) NOT NULL,
  `classification` varchar(255) NOT NULL,
  `created` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
  `eye_colors` varchar(255) NOT NULL,
  `hair_colors` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skin_colors` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_7ba28414e58e42dde126265c0c` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: specie_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `specie_files_file` (
  `specieId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`specieId`, `fileId`),
  KEY `IDX_5e13672a812f73e2ecdbe408bc` (`specieId`),
  KEY `IDX_c743e012914d6e8ef725358fd6` (`fileId`),
  CONSTRAINT `FK_5e13672a812f73e2ecdbe408bcb` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c743e012914d6e8ef725358fd68` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: specie_films_film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `specie_films_film` (
  `specieId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`specieId`, `filmId`),
  KEY `IDX_2832825557b2ccf35eca8f1a25` (`specieId`),
  KEY `IDX_28c0943be888ee49ed041c9dc8` (`filmId`),
  CONSTRAINT `FK_2832825557b2ccf35eca8f1a257` FOREIGN KEY (`specieId`) REFERENCES `specie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_28c0943be888ee49ed041c9dc83` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
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
  `created` varchar(255) NOT NULL,
  `crew` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starship_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starship_files_file` (
  `starshipId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`starshipId`, `fileId`),
  KEY `IDX_cbcbe8d2404964d4486df2550b` (`starshipId`),
  KEY `IDX_f22d0edfc0ac2f8d60c6dd4296` (`fileId`),
  CONSTRAINT `FK_cbcbe8d2404964d4486df2550b0` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f22d0edfc0ac2f8d60c6dd42964` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: starship_films_film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `starship_films_film` (
  `starshipId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`starshipId`, `filmId`),
  KEY `IDX_96edb4a60fd9881e834430c7e5` (`starshipId`),
  KEY `IDX_a8877c30a5bbfe55d54c84236c` (`filmId`),
  CONSTRAINT `FK_96edb4a60fd9881e834430c7e58` FOREIGN KEY (`starshipId`) REFERENCES `starship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_a8877c30a5bbfe55d54c84236c1` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_roles_role
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_roles_role` (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`userId`, `roleId`),
  KEY `IDX_5f9286e6c25594c6b88c108db7` (`userId`),
  KEY `IDX_4be2f7adf862634f5f803d246b` (`roleId`),
  CONSTRAINT `FK_4be2f7adf862634f5f803d246b8` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_5f9286e6c25594c6b88c108db77` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consumables` varchar(255) NOT NULL,
  `cargo_capacity` varchar(255) NOT NULL,
  `cost_in_credits` varchar(255) NOT NULL,
  `created` varchar(255) NOT NULL,
  `crew` varchar(255) NOT NULL,
  `edited` varchar(255) NOT NULL,
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle_files_file
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle_files_file` (
  `vehicleId` int NOT NULL,
  `fileId` int NOT NULL,
  PRIMARY KEY (`vehicleId`, `fileId`),
  KEY `IDX_0d8de2b7ec619775daabc8ae88` (`vehicleId`),
  KEY `IDX_e26b4c088947363d3f6da7165b` (`fileId`),
  CONSTRAINT `FK_0d8de2b7ec619775daabc8ae881` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e26b4c088947363d3f6da7165b3` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicle_films_film
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicle_films_film` (
  `vehicleId` int NOT NULL,
  `filmId` int NOT NULL,
  PRIMARY KEY (`vehicleId`, `filmId`),
  KEY `IDX_6b3e6115252f46fa30e9211a26` (`vehicleId`),
  KEY `IDX_98a3873430cacac567ed5253ba` (`filmId`),
  CONSTRAINT `FK_6b3e6115252f46fa30e9211a26f` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_98a3873430cacac567ed5253ba1` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: file
# ------------------------------------------------------------

INSERT INTO
  `file` (`id`, `name`, `url`)
VALUES
  (
    1,
    '844a1934-be8d-40a4-b164-4e4284ba3142-photo_2022-09-19_15-36-47.jpg',
    'https://starwars-pet-project.s3.eu-central-1.amazonaws.com/844a1934-be8d-40a4-b164-4e4284ba3142-photo_2022-09-19_15-36-47.jpg'
  );
INSERT INTO
  `file` (`id`, `name`, `url`)
VALUES
  (
    2,
    '71484bf8-fd2e-4744-9677-712f9d96bc3b-photo_2022-09-19_15-36-47.jpg',
    'https://starwars-pet-project.s3.eu-central-1.amazonaws.com/71484bf8-fd2e-4744-9677-712f9d96bc3b-photo_2022-09-19_15-36-47.jpg'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: film
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: film_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations_typeorm
# ------------------------------------------------------------

INSERT INTO
  `migrations_typeorm` (`id`, `timestamp`, `name`)
VALUES
  (1, 1666278608911, 'Init1666278608911');
INSERT INTO
  `migrations_typeorm` (`id`, `timestamp`, `name`)
VALUES
  (2, 1666349243519, 'Auth1666349243519');
INSERT INTO
  `migrations_typeorm` (`id`, `timestamp`, `name`)
VALUES
  (3, 1666427832013, 'FilesUpdate1666427832013');
INSERT INTO
  `migrations_typeorm` (`id`, `timestamp`, `name`)
VALUES
  (4, 1666428976095, 'DropFilesTable1666428976095');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_films_film
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_species_specie
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_starships_starship
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: people_vehicles_vehicle
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planet
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planet_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: planet_films_film
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: role
# ------------------------------------------------------------

INSERT INTO
  `role` (`id`, `name`)
VALUES
  (1, 'admin');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (8, 'tesesdft');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (7, 'teset');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (9, 'tesswesddft');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (4, 'test');
INSERT INTO
  `role` (`id`, `name`)
VALUES
  (3, 'user');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: specie
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: specie_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: specie_films_film
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starship
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starship_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: starship_films_film
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user
# ------------------------------------------------------------

INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (1, 'Admin!1', 'Admin!1');
INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (2, 'adsgv3W#', 'adsgv3W#');
INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (3, 'adsgv3sdW#', 'adsgv3sdW#');
INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (4, 'admin', 'admin');
INSERT INTO
  `user` (`id`, `username`, `password`)
VALUES
  (6, 'str@3in#Sg', 'strWi@d@3ng');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_roles_role
# ------------------------------------------------------------

INSERT INTO
  `user_roles_role` (`userId`, `roleId`)
VALUES
  (1, 1);
INSERT INTO
  `user_roles_role` (`userId`, `roleId`)
VALUES
  (2, 3);
INSERT INTO
  `user_roles_role` (`userId`, `roleId`)
VALUES
  (3, 3);
INSERT INTO
  `user_roles_role` (`userId`, `roleId`)
VALUES
  (4, 1);
INSERT INTO
  `user_roles_role` (`userId`, `roleId`)
VALUES
  (6, 3);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle_files_file
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicle_films_film
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
