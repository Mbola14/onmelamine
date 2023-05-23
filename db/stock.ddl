ALTER TABLE Numero_telephone DROP CONSTRAINT FKNumero_tel523354;
ALTER TABLE Contrat DROP CONSTRAINT FKContrat270933;
ALTER TABLE Validation DROP CONSTRAINT FKValidation72913;
ALTER TABLE Mouvement DROP CONSTRAINT FKMouvement55548;
ALTER TABLE Mouvement DROP CONSTRAINT FKMouvement16659;
DROP TABLE IF EXISTS Accessoire CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Numero_telephone CASCADE;
DROP TABLE IF EXISTS Contrat CASCADE;
DROP TABLE IF EXISTS Validation CASCADE;
DROP TABLE IF EXISTS Mouvement CASCADE;
CREATE TABLE Accessoire (
  id_accessoire SERIAL NOT NULL, 
  accessoire    varchar(255) NOT NULL, 
  unite         varchar(255) NOT NULL, 
  PRIMARY KEY (id_accessoire));
CREATE TABLE Client (
  id_client SERIAL NOT NULL, 
  nom       varchar(255) NOT NULL, 
  prenom    varchar(255) NOT NULL, 
  PRIMARY KEY (id_client));
CREATE TABLE Numero_telephone (
  id_tel    SERIAL NOT NULL, 
  id_client int4 NOT NULL, 
  numero    varchar(255) NOT NULL, 
  PRIMARY KEY (id_tel));
CREATE TABLE Contrat (
  id_contrat SERIAL NOT NULL, 
  id_client  int4 NOT NULL, 
  date_debut date NOT NULL, 
  PRIMARY KEY (id_contrat));
CREATE TABLE Validation (
  id_validation   SERIAL NOT NULL, 
  id_contrat      int4 NOT NULL, 
  date_validation date, 
  PRIMARY KEY (id_validation));
CREATE TABLE Mouvement (
  id_mouvement  SERIAL NOT NULL, 
  id_contrat    int4 NOT NULL, 
  id_accessoire int4 NOT NULL, 
  entrees       int4, 
  sorties       int4, 
  stock_final   int4, 
  PRIMARY KEY (id_mouvement));
ALTER TABLE Numero_telephone ADD CONSTRAINT FKNumero_tel523354 FOREIGN KEY (id_client) REFERENCES Client (id_client);
ALTER TABLE Contrat ADD CONSTRAINT FKContrat270933 FOREIGN KEY (id_client) REFERENCES Client (id_client);
ALTER TABLE Validation ADD CONSTRAINT FKValidation72913 FOREIGN KEY (id_contrat) REFERENCES Contrat (id_contrat);
ALTER TABLE Mouvement ADD CONSTRAINT FKMouvement55548 FOREIGN KEY (id_accessoire) REFERENCES Accessoire (id_accessoire);
ALTER TABLE Mouvement ADD CONSTRAINT FKMouvement16659 FOREIGN KEY (id_contrat) REFERENCES Contrat (id_contrat);
