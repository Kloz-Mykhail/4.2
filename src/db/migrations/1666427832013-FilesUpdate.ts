import { MigrationInterface, QueryRunner } from 'typeorm';

export class FilesUpdate1666427832013 implements MigrationInterface {
  name = 'FilesUpdate1666427832013';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`planet_files_file\` (\`planetId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_9730b955e8b5b511a01baf0e3c\` (\`planetId\`), INDEX \`IDX_18ce78fac2c0eb6f90bc09ca34\` (\`fileId\`), PRIMARY KEY (\`planetId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`specie_files_file\` (\`specieId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_5e13672a812f73e2ecdbe408bc\` (\`specieId\`), INDEX \`IDX_c743e012914d6e8ef725358fd6\` (\`fileId\`), PRIMARY KEY (\`specieId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`starship_files_file\` (\`starshipId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_cbcbe8d2404964d4486df2550b\` (\`starshipId\`), INDEX \`IDX_f22d0edfc0ac2f8d60c6dd4296\` (\`fileId\`), PRIMARY KEY (\`starshipId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`vehicle_files_file\` (\`vehicleId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_0d8de2b7ec619775daabc8ae88\` (\`vehicleId\`), INDEX \`IDX_e26b4c088947363d3f6da7165b\` (\`fileId\`), PRIMARY KEY (\`vehicleId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`film_files_file\` (\`filmId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_6cd51afc585f3666ca3743c4a2\` (\`filmId\`), INDEX \`IDX_4cb516b47e9e7b739f2cd9b0d4\` (\`fileId\`), PRIMARY KEY (\`filmId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `CREATE TABLE \`people_files_file\` (\`peopleId\` int NOT NULL, \`fileId\` int NOT NULL, INDEX \`IDX_62210608321a83292e39c6300b\` (\`peopleId\`), INDEX \`IDX_05a153c750526a8286e8ed53e8\` (\`fileId\`), PRIMARY KEY (\`peopleId\`, \`fileId\`)) ENGINE=InnoDB`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files_file\` ADD CONSTRAINT \`FK_9730b955e8b5b511a01baf0e3cf\` FOREIGN KEY (\`planetId\`) REFERENCES \`planet\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files_file\` ADD CONSTRAINT \`FK_18ce78fac2c0eb6f90bc09ca34f\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files_file\` ADD CONSTRAINT \`FK_5e13672a812f73e2ecdbe408bcb\` FOREIGN KEY (\`specieId\`) REFERENCES \`specie\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files_file\` ADD CONSTRAINT \`FK_c743e012914d6e8ef725358fd68\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files_file\` ADD CONSTRAINT \`FK_cbcbe8d2404964d4486df2550b0\` FOREIGN KEY (\`starshipId\`) REFERENCES \`starship\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files_file\` ADD CONSTRAINT \`FK_f22d0edfc0ac2f8d60c6dd42964\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files_file\` ADD CONSTRAINT \`FK_0d8de2b7ec619775daabc8ae881\` FOREIGN KEY (\`vehicleId\`) REFERENCES \`vehicle\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files_file\` ADD CONSTRAINT \`FK_e26b4c088947363d3f6da7165b3\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files_file\` ADD CONSTRAINT \`FK_6cd51afc585f3666ca3743c4a2f\` FOREIGN KEY (\`filmId\`) REFERENCES \`film\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files_file\` ADD CONSTRAINT \`FK_4cb516b47e9e7b739f2cd9b0d45\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files_file\` ADD CONSTRAINT \`FK_62210608321a83292e39c6300bd\` FOREIGN KEY (\`peopleId\`) REFERENCES \`people\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files_file\` ADD CONSTRAINT \`FK_05a153c750526a8286e8ed53e88\` FOREIGN KEY (\`fileId\`) REFERENCES \`file\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`people_files_file\` DROP FOREIGN KEY \`FK_05a153c750526a8286e8ed53e88\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`people_files_file\` DROP FOREIGN KEY \`FK_62210608321a83292e39c6300bd\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files_file\` DROP FOREIGN KEY \`FK_4cb516b47e9e7b739f2cd9b0d45\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`film_files_file\` DROP FOREIGN KEY \`FK_6cd51afc585f3666ca3743c4a2f\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files_file\` DROP FOREIGN KEY \`FK_e26b4c088947363d3f6da7165b3\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`vehicle_files_file\` DROP FOREIGN KEY \`FK_0d8de2b7ec619775daabc8ae881\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files_file\` DROP FOREIGN KEY \`FK_f22d0edfc0ac2f8d60c6dd42964\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`starship_files_file\` DROP FOREIGN KEY \`FK_cbcbe8d2404964d4486df2550b0\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files_file\` DROP FOREIGN KEY \`FK_c743e012914d6e8ef725358fd68\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`specie_files_file\` DROP FOREIGN KEY \`FK_5e13672a812f73e2ecdbe408bcb\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files_file\` DROP FOREIGN KEY \`FK_18ce78fac2c0eb6f90bc09ca34f\``,
    );
    await queryRunner.query(
      `ALTER TABLE \`planet_files_file\` DROP FOREIGN KEY \`FK_9730b955e8b5b511a01baf0e3cf\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_05a153c750526a8286e8ed53e8\` ON \`people_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_62210608321a83292e39c6300b\` ON \`people_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`people_files_file\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_4cb516b47e9e7b739f2cd9b0d4\` ON \`film_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_6cd51afc585f3666ca3743c4a2\` ON \`film_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`film_files_file\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_e26b4c088947363d3f6da7165b\` ON \`vehicle_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_0d8de2b7ec619775daabc8ae88\` ON \`vehicle_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`vehicle_files_file\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_f22d0edfc0ac2f8d60c6dd4296\` ON \`starship_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_cbcbe8d2404964d4486df2550b\` ON \`starship_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`starship_files_file\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_c743e012914d6e8ef725358fd6\` ON \`specie_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_5e13672a812f73e2ecdbe408bc\` ON \`specie_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`specie_files_file\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_18ce78fac2c0eb6f90bc09ca34\` ON \`planet_files_file\``,
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_9730b955e8b5b511a01baf0e3c\` ON \`planet_files_file\``,
    );
    await queryRunner.query(`DROP TABLE \`planet_files_file\``);
  }
}
