import { MigrationInterface, QueryRunner } from 'typeorm';

export class Init1666278608911 implements MigrationInterface {
  name = 'Init1666278608911';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`file\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`planet_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`planetId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_09d18fbb3c63c5a57c301bfb62\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`planet\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`rotation_period\` varchar(255) NOT NULL, \`orbital_period\` varchar(255) NOT NULL, \`diameter\` varchar(255) NOT NULL, \`climate\` varchar(255) NOT NULL, \`gravity\` varchar(255) NOT NULL, \`terrain\` varchar(255) NOT NULL, \`surface_water\` varchar(255) NOT NULL, \`population\` varchar(255) NOT NULL, \`created\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_0c6595b668a276b8482611a20e\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`specie_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`specieId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_f4d91823a8dff489546f6a16d7\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`specie\` (\`id\` int NOT NULL AUTO_INCREMENT, \`average_height\` varchar(255) NOT NULL, \`average_lifespan\` varchar(255) NOT NULL, \`classification\` varchar(255) NOT NULL, \`created\` varchar(255) NOT NULL, \`designation\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`eye_colors\` varchar(255) NOT NULL, \`hair_colors\` varchar(255) NOT NULL, \`language\` varchar(255) NOT NULL, \`name\` varchar(255) NOT NULL, \`skin_colors\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_7ba28414e58e42dde126265c0c\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`starship_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`starshipId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_38ab93e6717eeb91ec1358f7ff\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`starship\` (\`id\` int NOT NULL AUTO_INCREMENT, \`MGLT\` varchar(255) NOT NULL, \`cargo_capacity\` varchar(255) NOT NULL, \`consumables\` varchar(255) NOT NULL, \`cost_in_credits\` varchar(255) NOT NULL, \`created\` varchar(255) NOT NULL, \`crew\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`hyperdrive_rating\` varchar(255) NOT NULL, \`length\` varchar(255) NOT NULL, \`manufacturer\` varchar(255) NOT NULL, \`max_atmosphering_speed\` varchar(255) NOT NULL, \`model\` varchar(255) NOT NULL, \`name\` varchar(255) NOT NULL, \`passengers\` varchar(255) NOT NULL, \`starship_class\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_c2d61780efcb47029ac7792a2c\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`vehicle_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`vehicleId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_5343fc580a8eb32b9e8162b7f4\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`vehicle\` (\`id\` int NOT NULL AUTO_INCREMENT, \`consumables\` varchar(255) NOT NULL, \`cargo_capacity\` varchar(255) NOT NULL, \`cost_in_credits\` varchar(255) NOT NULL, \`created\` varchar(255) NOT NULL, \`crew\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`length\` varchar(255) NOT NULL, \`manufacturer\` varchar(255) NOT NULL, \`max_atmosphering_speed\` varchar(255) NOT NULL, \`model\` varchar(255) NOT NULL, \`name\` varchar(255) NOT NULL, \`passengers\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, \`vehicle_class\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_9d8f33468a4dbf65d2b37370c9\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`film_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`filmId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_00b764f19f67b760e3a5275719\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`film\` (\`id\` int NOT NULL AUTO_INCREMENT, \`created\` varchar(255) NOT NULL, \`director\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`episode_id\` int NOT NULL, \`opening_crawl\` text NOT NULL, \`producer\` varchar(255) NOT NULL, \`release_date\` varchar(255) NOT NULL, \`title\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_91baa4f1f62ea493de2afdd3d6\` (\`title\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`mass\` varchar(255) NOT NULL, \`height\` varchar(255) NOT NULL, \`hair_color\` varchar(255) NOT NULL, \`skin_color\` varchar(255) NOT NULL, \`eye_color\` varchar(255) NOT NULL, \`birth_year\` varchar(255) NOT NULL, \`gender\` varchar(255) NOT NULL, \`created\` varchar(255) NOT NULL, \`edited\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, \`homeworldId\` int NULL, UNIQUE INDEX \`IDX_e7ec00b080e693706a6eaa6d31\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`peopleId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_b1715fec4a16ddffa3ec1055ad\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`planet_films_film\` (\`planetId\` int NOT NULL, \`filmId\` int NOT NULL, INDEX \`IDX_b8d1e881fca1b60fb24f212a74\` (\`planetId\`), INDEX \`IDX_80d06ca2f65a80e668607394cd\` (\`filmId\`), PRIMARY KEY (\`planetId\`, \`filmId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`specie_films_film\` (\`specieId\` int NOT NULL, \`filmId\` int NOT NULL, INDEX \`IDX_2832825557b2ccf35eca8f1a25\` (\`specieId\`), INDEX \`IDX_28c0943be888ee49ed041c9dc8\` (\`filmId\`), PRIMARY KEY (\`specieId\`, \`filmId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`starship_films_film\` (\`starshipId\` int NOT NULL, \`filmId\` int NOT NULL, INDEX \`IDX_96edb4a60fd9881e834430c7e5\` (\`starshipId\`), INDEX \`IDX_a8877c30a5bbfe55d54c84236c\` (\`filmId\`), PRIMARY KEY (\`starshipId\`, \`filmId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`vehicle_films_film\` (\`vehicleId\` int NOT NULL, \`filmId\` int NOT NULL, INDEX \`IDX_6b3e6115252f46fa30e9211a26\` (\`vehicleId\`), INDEX \`IDX_98a3873430cacac567ed5253ba\` (\`filmId\`), PRIMARY KEY (\`vehicleId\`, \`filmId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_films_film\` (\`peopleId\` int NOT NULL, \`filmId\` int NOT NULL, INDEX \`IDX_99ce84505b9d277789a5742906\` (\`peopleId\`), INDEX \`IDX_c4597771baad7514441c33793f\` (\`filmId\`), PRIMARY KEY (\`peopleId\`, \`filmId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_species_specie\` (\`peopleId\` int NOT NULL, \`specieId\` int NOT NULL, INDEX \`IDX_a5c58a307b2a71698b33c2403d\` (\`peopleId\`), INDEX \`IDX_b3a523bcb0a735cd88cfbdb369\` (\`specieId\`), PRIMARY KEY (\`peopleId\`, \`specieId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_vehicles_vehicle\` (\`peopleId\` int NOT NULL, \`vehicleId\` int NOT NULL, INDEX \`IDX_0c4799c95577dd53de3c919206\` (\`peopleId\`), INDEX \`IDX_69511f955e4694544aa0056f25\` (\`vehicleId\`), PRIMARY KEY (\`peopleId\`, \`vehicleId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_starships_starship\` (\`peopleId\` int NOT NULL, \`starshipId\` int NOT NULL, INDEX \`IDX_cd69a89b18df6a4e42c67877cf\` (\`peopleId\`), INDEX \`IDX_baf66aafe260a12223240c8d4a\` (\`starshipId\`), PRIMARY KEY (\`peopleId\`, \`starshipId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files\` ADD CONSTRAINT \`FK_64ed5c255978b21f8d40b1c9a88\` FOREIGN KEY (\`planetId\`) REFERENCES \`planet\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files\` ADD CONSTRAINT \`FK_09d18fbb3c63c5a57c301bfb62d\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files\` ADD CONSTRAINT \`FK_75d2c8ffc785e7a9d81fca92d1e\` FOREIGN KEY (\`specieId\`) REFERENCES \`specie\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files\` ADD CONSTRAINT \`FK_f4d91823a8dff489546f6a16d73\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files\` ADD CONSTRAINT \`FK_3a07dcb02e79a265280871f5c70\` FOREIGN KEY (\`starshipId\`) REFERENCES \`starship\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files\` ADD CONSTRAINT \`FK_38ab93e6717eeb91ec1358f7ff7\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files\` ADD CONSTRAINT \`FK_2df8b76ee02158ab30f69236c30\` FOREIGN KEY (\`vehicleId\`) REFERENCES \`vehicle\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files\` ADD CONSTRAINT \`FK_5343fc580a8eb32b9e8162b7f4a\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files\` ADD CONSTRAINT \`FK_4017f1ec6de43598ac6d776e445\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files\` ADD CONSTRAINT \`FK_00b764f19f67b760e3a52757194\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people\` ADD CONSTRAINT \`FK_8f79bb098a482fa585da15ef3a6\` FOREIGN KEY (\`homeworldId\`) REFERENCES \`planet\`(\`id\`) ON DELETE SET NULL ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files\` ADD CONSTRAINT \`FK_f4be75434071b61482a9e5149c9\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files\` ADD CONSTRAINT \`FK_b1715fec4a16ddffa3ec1055add\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_films_film\` ADD CONSTRAINT \`FK_b8d1e881fca1b60fb24f212a748\` FOREIGN KEY (\`planetId\`) REFERENCES \`planet\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_films_film\` ADD CONSTRAINT \`FK_80d06ca2f65a80e668607394cdd\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_films_film\` ADD CONSTRAINT \`FK_2832825557b2ccf35eca8f1a257\` FOREIGN KEY (\`specieId\`) REFERENCES \`specie\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_films_film\` ADD CONSTRAINT \`FK_28c0943be888ee49ed041c9dc83\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_films_film\` ADD CONSTRAINT \`FK_96edb4a60fd9881e834430c7e58\` FOREIGN KEY (\`starshipId\`) REFERENCES \`starship\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_films_film\` ADD CONSTRAINT \`FK_a8877c30a5bbfe55d54c84236c1\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_films_film\` ADD CONSTRAINT \`FK_6b3e6115252f46fa30e9211a26f\` FOREIGN KEY (\`vehicleId\`) REFERENCES \`vehicle\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_films_film\` ADD CONSTRAINT \`FK_98a3873430cacac567ed5253ba1\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_films_film\` ADD CONSTRAINT \`FK_99ce84505b9d277789a5742906b\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_films_film\` ADD CONSTRAINT \`FK_c4597771baad7514441c33793f5\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_species_specie\` ADD CONSTRAINT \`FK_a5c58a307b2a71698b33c2403d3\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_species_specie\` ADD CONSTRAINT \`FK_b3a523bcb0a735cd88cfbdb3694\` FOREIGN KEY (\`specieId\`) REFERENCES \`specie\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_vehicles_vehicle\` ADD CONSTRAINT \`FK_0c4799c95577dd53de3c9192060\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_vehicles_vehicle\` ADD CONSTRAINT \`FK_69511f955e4694544aa0056f256\` FOREIGN KEY (\`vehicleId\`) REFERENCES \`vehicle\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_starships_starship\` ADD CONSTRAINT \`FK_cd69a89b18df6a4e42c67877cf5\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_starships_starship\` ADD CONSTRAINT \`FK_baf66aafe260a12223240c8d4a5\` FOREIGN KEY (\`starshipId\`) REFERENCES \`starship\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`people_starships_starship\` DROP FOREIGN KEY \`FK_baf66aafe260a12223240c8d4a5\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_starships_starship\` DROP FOREIGN KEY \`FK_cd69a89b18df6a4e42c67877cf5\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_vehicles_vehicle\` DROP FOREIGN KEY \`FK_69511f955e4694544aa0056f256\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_vehicles_vehicle\` DROP FOREIGN KEY \`FK_0c4799c95577dd53de3c9192060\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_species_specie\` DROP FOREIGN KEY \`FK_b3a523bcb0a735cd88cfbdb3694\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_species_specie\` DROP FOREIGN KEY \`FK_a5c58a307b2a71698b33c2403d3\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_films_film\` DROP FOREIGN KEY \`FK_c4597771baad7514441c33793f5\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_films_film\` DROP FOREIGN KEY \`FK_99ce84505b9d277789a5742906b\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_films_film\` DROP FOREIGN KEY \`FK_98a3873430cacac567ed5253ba1\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_films_film\` DROP FOREIGN KEY \`FK_6b3e6115252f46fa30e9211a26f\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_films_film\` DROP FOREIGN KEY \`FK_a8877c30a5bbfe55d54c84236c1\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_films_film\` DROP FOREIGN KEY \`FK_96edb4a60fd9881e834430c7e58\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_films_film\` DROP FOREIGN KEY \`FK_28c0943be888ee49ed041c9dc83\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_films_film\` DROP FOREIGN KEY \`FK_2832825557b2ccf35eca8f1a257\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_films_film\` DROP FOREIGN KEY \`FK_80d06ca2f65a80e668607394cdd\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_films_film\` DROP FOREIGN KEY \`FK_b8d1e881fca1b60fb24f212a748\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files\` DROP FOREIGN KEY \`FK_b1715fec4a16ddffa3ec1055add\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files\` DROP FOREIGN KEY \`FK_f4be75434071b61482a9e5149c9\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people\` DROP FOREIGN KEY \`FK_8f79bb098a482fa585da15ef3a6\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files\` DROP FOREIGN KEY \`FK_00b764f19f67b760e3a52757194\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files\` DROP FOREIGN KEY \`FK_4017f1ec6de43598ac6d776e445\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files\` DROP FOREIGN KEY \`FK_5343fc580a8eb32b9e8162b7f4a\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files\` DROP FOREIGN KEY \`FK_2df8b76ee02158ab30f69236c30\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files\` DROP FOREIGN KEY \`FK_38ab93e6717eeb91ec1358f7ff7\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files\` DROP FOREIGN KEY \`FK_3a07dcb02e79a265280871f5c70\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files\` DROP FOREIGN KEY \`FK_f4d91823a8dff489546f6a16d73\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files\` DROP FOREIGN KEY \`FK_75d2c8ffc785e7a9d81fca92d1e\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files\` DROP FOREIGN KEY \`FK_09d18fbb3c63c5a57c301bfb62d\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files\` DROP FOREIGN KEY \`FK_64ed5c255978b21f8d40b1c9a88\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_baf66aafe260a12223240c8d4a\` ON \`people_starships_starship\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_cd69a89b18df6a4e42c67877cf\` ON \`people_starships_starship\``,
    );
    await queryRunner.query(`DROP TABLE \`people_starships_starship\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_69511f955e4694544aa0056f25\` ON \`people_vehicles_vehicle\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_0c4799c95577dd53de3c919206\` ON \`people_vehicles_vehicle\``,
    );
    await queryRunner.query(`DROP TABLE \`people_vehicles_vehicle\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_b3a523bcb0a735cd88cfbdb369\` ON \`people_species_specie\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_a5c58a307b2a71698b33c2403d\` ON \`people_species_specie\``,
    );
    await queryRunner.query(`DROP TABLE \`people_species_specie\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_c4597771baad7514441c33793f\` ON \`people_films_film\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_99ce84505b9d277789a5742906\` ON \`people_films_film\``,
    );
    await queryRunner.query(`DROP TABLE \`people_films_film\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_98a3873430cacac567ed5253ba\` ON \`vehicle_films_film\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_6b3e6115252f46fa30e9211a26\` ON \`vehicle_films_film\``,
    );
    await queryRunner.query(`DROP TABLE \`vehicle_films_film\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_a8877c30a5bbfe55d54c84236c\` ON \`starship_films_film\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_96edb4a60fd9881e834430c7e5\` ON \`starship_films_film\``,
    );
    await queryRunner.query(`DROP TABLE \`starship_films_film\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_28c0943be888ee49ed041c9dc8\` ON \`specie_films_film\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_2832825557b2ccf35eca8f1a25\` ON \`specie_films_film\``,
    );
    await queryRunner.query(`DROP TABLE \`specie_films_film\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_80d06ca2f65a80e668607394cd\` ON \`planet_films_film\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_b8d1e881fca1b60fb24f212a74\` ON \`planet_films_film\``,
    );
    await queryRunner.query(`DROP TABLE \`planet_films_film\``);
    await queryRunner.query(
      `DROP INDEX \`REL_b1715fec4a16ddffa3ec1055ad\` ON \`people_files\``,
    );
    await queryRunner.query(`DROP TABLE \`people_files\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_e7ec00b080e693706a6eaa6d31\` ON \`people\``,
    );
    await queryRunner.query(`DROP TABLE \`people\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_91baa4f1f62ea493de2afdd3d6\` ON \`film\``,
    );
    await queryRunner.query(`DROP TABLE \`film\``);
    await queryRunner.query(
      `DROP INDEX \`REL_00b764f19f67b760e3a5275719\` ON \`film_files\``,
    );
    await queryRunner.query(`DROP TABLE \`film_files\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_9d8f33468a4dbf65d2b37370c9\` ON \`vehicle\``,
    );
    await queryRunner.query(`DROP TABLE \`vehicle\``);
    await queryRunner.query(
      `DROP INDEX \`REL_5343fc580a8eb32b9e8162b7f4\` ON \`vehicle_files\``,
    );
    await queryRunner.query(`DROP TABLE \`vehicle_files\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_c2d61780efcb47029ac7792a2c\` ON \`starship\``,
    );
    await queryRunner.query(`DROP TABLE \`starship\``);
    await queryRunner.query(
      `DROP INDEX \`REL_38ab93e6717eeb91ec1358f7ff\` ON \`starship_files\``,
    );
    await queryRunner.query(`DROP TABLE \`starship_files\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_7ba28414e58e42dde126265c0c\` ON \`specie\``,
    );
    await queryRunner.query(`DROP TABLE \`specie\``);
    await queryRunner.query(
      `DROP INDEX \`REL_f4d91823a8dff489546f6a16d7\` ON \`specie_files\``,
    );
    await queryRunner.query(`DROP TABLE \`specie_files\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_0c6595b668a276b8482611a20e\` ON \`planet\``,
    );
    await queryRunner.query(`DROP TABLE \`planet\``);
    await queryRunner.query(
      `DROP INDEX \`REL_09d18fbb3c63c5a57c301bfb62\` ON \`planet_files\``,
    );
    await queryRunner.query(`DROP TABLE \`planet_files\``);
    await queryRunner.query(`DROP TABLE \`file\``);
  }
}
