CREATE role mbola login password 'Benji.800';
CREATE
DATABASE ecole_baovola;
ALTER
DATABASE ecole_baovola OWNER TO mbola;
\c ecole_baovola mbola

ALTER TABLE Candidat DROP CONSTRAINT FKCandidat409929;
ALTER TABLE Candidat DROP CONSTRAINT FKCandidat462334;
ALTER TABLE candidature DROP CONSTRAINT FKcandidatur154726;
ALTER TABLE bac_candidat DROP CONSTRAINT FKbac_candid931210;
ALTER TABLE bac_candidat DROP CONSTRAINT FKbac_candid512227;
ALTER TABLE ecole DROP CONSTRAINT FKecole983694;
ALTER TABLE candidature DROP CONSTRAINT FKcandidatur110031;
ALTER TABLE candidature DROP CONSTRAINT FKcandidatur450763;

DROP TABLE IF EXISTS Candidat CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS region CASCADE;
DROP TABLE IF EXISTS ecole CASCADE;
DROP TABLE IF EXISTS serie CASCADE;
DROP TABLE IF EXISTS filiere CASCADE;
DROP TABLE IF EXISTS session CASCADE;
DROP TABLE IF EXISTS candidature CASCADE;
DROP TABLE IF EXISTS bac_candidat CASCADE;

CREATE TABLE Candidat
(
    id_candidat     SERIAL       NOT NULL,
    nom_candidat    varchar(255) NOT NULL,
    prenom_candidat varchar(255) NOT NULL,
    date_naissance  date         NOT NULL,
    genreid_genre   int4         NOT NULL,
    ecoleid_ecole   int4         NOT NULL,
    PRIMARY KEY (id_candidat)
);

CREATE TABLE genre
(
    id_genre  SERIAL       NOT NULL,
    nom_genre varchar(255) NOT NULL,
    PRIMARY KEY (id_genre)
);

CREATE TABLE region
(
    id_region  SERIAL       NOT NULL,
    nom_region varchar(255) NOT NULL,
    PRIMARY KEY (id_region)
);

CREATE TABLE ecole
(
    id_ecole        SERIAL       NOT NULL,
    nom_ecole       varchar(255) NOT NULL,
    regionid_region int4         NOT NULL,
    PRIMARY KEY (id_ecole)
);

CREATE TABLE serie
(
    id_serie  SERIAL       NOT NULL,
    nom_serie varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (id_serie)
);

CREATE TABLE filiere
(
    id_filiere  SERIAL       NOT NULL,
    nom_filiere varchar(255) NOT NULL,
    PRIMARY KEY (id_filiere)
);

CREATE TABLE "session"
(
    id_session SERIAL NOT NULL,
    date_debut date   NOT NULL,
    date_fin   date   NOT NULL,
    PRIMARY KEY (id_session)
);

CREATE TABLE candidature
(
    id_candidature      SERIAL NOT NULL,
    Candidatid_candidat int4   NOT NULL,
    filiereid_filiere   int4   NOT NULL,
    sessionid_session   int4   NOT NULL,
    PRIMARY KEY (id_candidature)
);

CREATE TABLE bac_candidat
(
    Candidatid_candidat int4 NOT NULL,
    serieid_serie       int4 NOT NULL,
    note_maths          int4 NOT NULL,
    note_francais       int4 NOT NULL,
    note_anglais        int4,
    PRIMARY KEY (Candidatid_candidat,
                 serieid_serie)
);

ALTER TABLE Candidat
    ADD CONSTRAINT FKCandidat409929 FOREIGN KEY (genreid_genre) REFERENCES genre (id_genre);
ALTER TABLE Candidat
    ADD CONSTRAINT FKCandidat462334 FOREIGN KEY (ecoleid_ecole) REFERENCES ecole (id_ecole);
ALTER TABLE candidature
    ADD CONSTRAINT FKcandidatur154726 FOREIGN KEY (filiereid_filiere) REFERENCES filiere (id_filiere);
ALTER TABLE ecole
    ADD CONSTRAINT FKecole983694 FOREIGN KEY (regionid_region) REFERENCES region (id_region);
ALTER TABLE candidature
    ADD CONSTRAINT FKcandidatur110031 FOREIGN KEY (sessionid_session) REFERENCES "session" (id_session);
ALTER TABLE candidature
    ADD CONSTRAINT FKcandidatur450763 FOREIGN KEY (Candidatid_candidat) REFERENCES Candidat (id_candidat);
ALTER TABLE bac_candidat
    ADD CONSTRAINT FKbac_candid931210 FOREIGN KEY (serieid_serie) REFERENCES serie (id_serie);
ALTER TABLE bac_candidat
    ADD CONSTRAINT FKbac_candid512227 FOREIGN KEY (Candidatid_candidat) REFERENCES Candidat (id_candidat);
