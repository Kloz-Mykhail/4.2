import { MigrationInterface, QueryRunner } from 'typeorm';

export class DropFilesTable1666428976095 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    queryRunner.query('DROP TABLE film_files');
    queryRunner.query('DROP TABLE people_files');
    queryRunner.query('DROP TABLE planet_files');
    queryRunner.query('DROP TABLE specie_files');
    queryRunner.query('DROP TABLE starship_files');
    queryRunner.query('DROP TABLE vehicle_files');
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`people_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`peopleId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_b1715fec4a16ddffa3ec1055ad\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`film_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`filmId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_00b764f19f67b760e3a5275719\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`vehicle_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`vehicleId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_5343fc580a8eb32b9e8162b7f4\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`starship_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`starshipId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_38ab93e6717eeb91ec1358f7ff\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`specie_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`specieId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_f4d91823a8dff489546f6a16d7\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`planet_files\` (\`id\` int NOT NULL AUTO_INCREMENT, \`planetId\` int NULL, \`fileId\` int NULL, UNIQUE INDEX \`REL_09d18fbb3c63c5a57c301bfb62\` (\`fileId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
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
  }
}
