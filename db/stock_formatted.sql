ALTER TABLE Numero_telephone DROP CONSTRAINT FKNumero_tel523354;
ALTER TABLE Contrat DROP CONSTRAINT FKContrat270933;
ALTER TABLE Validation DROP CONSTRAINT FKValidation72913;
ALTER TABLE Mouvement DROP CONSTRAINT FKMouvement55548;
ALTER TABLE Mouvement DROP CONSTRAINT FKMouvement16659;
ALTER TABLE Client DROP CONSTRAINT FKClient754006;

DROP TABLE IF EXISTS Accessoire CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Numero_telephone CASCADE;
DROP TABLE IF EXISTS Contrat CASCADE;
DROP TABLE IF EXISTS Validation CASCADE;
DROP TABLE IF EXISTS Mouvement CASCADE;
DROP TABLE IF EXISTS Civilite CASCADE;

CREATE TABLE Civilite (
  id_civilite   SERIAL NOT NULL, 
  nom_civilite varchar(255) NOT NULL, 
  PRIMARY KEY (id_civilite)
);

CREATE TABLE Accessoire (
  id_accessoire SERIAL NOT NULL, 
  accessoire    varchar(255) NOT NULL, 
  unite         varchar(255) NOT NULL, 
  PRIMARY KEY (id_accessoire)
);

CREATE TABLE Client (
  id_client   SERIAL NOT NULL, 
  nom         varchar(255) NOT NULL, 
  prenom      varchar(255) NOT NULL, 
  id_civilite int4 NOT NULL, 
  PRIMARY KEY (id_client)
);

CREATE TABLE Numero_telephone (
  id_tel    SERIAL NOT NULL, 
  id_client int4 NOT NULL, 
  numero    varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_tel)
);

CREATE TABLE Contrat (
  id_contrat SERIAL NOT NULL, 
  nom_contrat VARCHAR(255) NOT NULL,
  id_client  int4 NOT NULL, 
  date_debut date NOT NULL, 
  PRIMARY KEY (id_contrat)
);

CREATE TABLE Validation (
  id_validation   SERIAL NOT NULL, 
  id_contrat      int4 NOT NULL, 
  date_validation date,
  PRIMARY KEY (id_validation)
);

CREATE TABLE Mouvement (
  id_mouvement  SERIAL NOT NULL, 
  date_mouvement date NOT NULL,
  id_contrat    int4 NOT NULL, 
  id_accessoire int4 NOT NULL, 
  entrees       int4, 
  sorties       int4, 
  stock_final   int4, 
  PRIMARY KEY (id_mouvement)
);

ALTER TABLE Numero_telephone ADD CONSTRAINT FKNumero_tel523354 FOREIGN KEY (id_client) REFERENCES Client (id_client);
ALTER TABLE Contrat ADD CONSTRAINT FKContrat270933 FOREIGN KEY (id_client) REFERENCES Client (id_client);
ALTER TABLE Validation ADD CONSTRAINT FKValidation72913 FOREIGN KEY (id_contrat) REFERENCES Contrat (id_contrat);
ALTER TABLE Mouvement ADD CONSTRAINT FKMouvement55548 FOREIGN KEY (id_accessoire) REFERENCES Accessoire (id_accessoire);
ALTER TABLE Mouvement ADD CONSTRAINT FKMouvement16659 FOREIGN KEY (id_contrat) REFERENCES Contrat (id_contrat);

INSERT INTO civilite (nom_civilite) VALUES ('Monsieur');
INSERT INTO civilite (nom_civilite) VALUES ('Madame');

INSERT INTO accessoire (accessoire, unite) VALUES ('Plaque de 18 mm', 'plaque');
INSERT INTO accessoire (accessoire, unite) VALUES ('Plaque de 3 mm', 'plaque');
INSERT INTO accessoire (accessoire, unite) VALUES ('Vis de 4/50', 'piece');
INSERT INTO accessoire (accessoire, unite) VALUES ('col fox', 'boite');
INSERT INTO accessoire (accessoire, unite) VALUES ('diluant', 'boite');
INSERT INTO accessoire (accessoire, unite) VALUES ('bande de chant', 'mètre');

INSERT INTO client (nom, prenom, id_civilite) VALUES ('ANDRIAMIFIDIMANANA', 'Mbolatiana Herizo',1);
INSERT INTO client (nom, prenom, id_civilite) VALUES ('ANDRIAMIFIDIMANANA', 'Mikalo Herizo',1);

INSERT INTO Numero_telephone (id_client, numero) VALUES (1, '0345936875');
INSERT INTO Numero_telephone (id_client, numero) VALUES (2, '0341993341');

INSERT INTO contrat (nom_contrat, id_client, date_debut) VALUES ('Cuisine Ambohidratrimo',1,'2022-10-11');
INSERT INTO contrat (nom_contrat, id_client, date_debut) VALUES ('Cuisine Mme Mbola',2,'2022-10-25');

INSERT INTO validation (id_contrat, date_validation) VALUES (1,'2022-10-23');

INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-11',1,1,4,4,0);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-12',1,2,3,1,2);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-15',1,3,200,150,50);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-16',1,4,2,1,1);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-17',1,5,3,2,1);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-22',1,6,40,30,10);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-25',2,1,6,5,1);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-25',2,2,3,3,0);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-26',2,4,7,5,2);
INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) VALUES ('2022-10-29',2,6,60,40,20);

CREATE OR REPLACE VIEW v_mvt AS SELECT contrat.id_contrat, contrat.nom_contrat, client.nom, client.prenom, accessoire.id_accessoire, date_mouvement, accessoire, unite, entrees, sorties, stock_final FROM
  client JOIN contrat ON client.id_client = contrat.id_client
  JOIN mouvement ON mouvement.id_contrat = contrat.id_contrat
  JOIN accessoire ON accessoire.id_accessoire = mouvement.id_accessoire;

CREATE OR REPLACE VIEW v_contrat AS SELECT contrat.id_contrat, nom_contrat, contrat.id_client, nom_civilite, nom, prenom, numero, date_debut FROM 
  contrat JOIN client ON client.id_client = contrat.id_client 
  JOIN numero_telephone num ON client.id_client = num.id_client 
  JOIN civilite ON client.id_civilite = civilite.id_civilite WHERE contrat.id_contrat NOT IN (SELECT id_contrat FROM validation);

CREATE OR REPLACE VIEW v_contratValide AS SELECT contrat.id_contrat, nom_contrat, client.id_client, nom_civilite, nom, prenom, numero, date_debut, date_validation FROM 
  validation JOIN contrat ON contrat.id_contrat = validation.id_contrat
  JOIN client ON client.id_client = contrat.id_client 
  JOIN numero_telephone num ON client.id_client = num.id_client 
  JOIN civilite ON client.id_civilite = civilite.id_civilite;

CREATE OR REPLACE VIEW v_allContrats AS SELECT contrat.id_contrat, nom_contrat, contrat.id_client, nom_civilite, nom, prenom, numero, date_debut FROM 
  contrat JOIN client ON client.id_client = contrat.id_client 
  JOIN numero_telephone num ON client.id_client = num.id_client 
  JOIN civilite ON client.id_civilite = civilite.id_civilite;
