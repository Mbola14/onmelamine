INSERT INTO genre (nom_genre)
VALUES ('homme');
INSERT INTO genre (nom_genre)
VALUES ('femme');

INSERT INTO region (nom_region)
VALUES ('Analamanga');
INSERT INTO region (nom_region)
VALUES ('Itasy');
INSERT INTO region (nom_region)
VALUES ('Vatovavy');
INSERT INTO region (nom_region)
VALUES ('Fito Vinany');
INSERT INTO region (nom_region)
VALUES ('Boeny');
INSERT INTO region (nom_region)
VALUES ('Sava');
INSERT INTO region (nom_region)
VALUES ('Diana');
INSERT INTO region (nom_region)
VALUES ('Vakinakaratra');
INSERT INTO region (nom_region)
VALUES ('Atsimo Andrefana');
INSERT INTO region (nom_region)
VALUES ('Bongolava');
INSERT INTO region (nom_region)
VALUES ('Atsinanana');
INSERT INTO region (nom_region)
VALUES ('Haute Matsiatra');

INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Mini-Pousse', 1);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Saint Michel Amparibe', 1);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Saint Michel Itaosy', 2);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('SFX Fianarantsoa', 3);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('SFX Antanimena', 4);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Les Farandoles', 4);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Boudchou', 5);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('College de France', 6);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Lycée Francais de Tananarive', 7);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Uni', 8);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Arcade', 9);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('ACEEM', 10);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Au ptit près', 11);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Petit Poucet', 12);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Mahavita', 12);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Pytagore', 10);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Fanovozantsoa', 1);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Sekolintsika', 11);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('ESCA', 1);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Mamiratra', 5);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Saint Ignace', 5);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Masera', 7);
INSERT INTO ecole (nom_ecole, id_region)
VALUES ('Les Schtroumph', 6);

INSERT INTO candidat (nom_candidat, prenom_candidat, date_naissance, id_genre, id_ecole)
VALUES ('ANDRIAMIFIDIMANANA', 'Mbolatiana Herizo', '2002-07-16', 1, 2);
INSERT INTO candidat (nom_candidat, prenom_candidat, date_naissance, id_genre, id_ecole)
VALUES ('RAKOTONDRADANO', 'Rovaniaina Mathieu', '2003-07-16', 1, 11);
INSERT INTO candidat (nom_candidat, prenom_candidat, date_naissance, id_genre, id_ecole)
VALUES ('RAZAFIARISON', 'Miaro Andy', '2002-04-04', 1, 10);
INSERT INTO candidat (nom_candidat, prenom_candidat, date_naissance, id_genre, id_ecole)
VALUES ('RAKOTOBE', 'Tsiry Andriamhenina', '2002-10-28', 1, 1);
INSERT INTO candidat (nom_candidat, prenom_candidat, date_naissance, id_genre, id_ecole)
VALUES ('RAMIARISON', 'Reharehan ny Tia Yohann', '2002-08-11', 1, 19);

INSERT INTO session (date_debut, date_fin) VALUES ('2022-09-01','2023-07-01');
INSERT INTO session (date_debut, date_fin) VALUES ('2023-09-01','2024-07-01');
INSERT INTO session (date_debut, date_fin) VALUES ('2024-09-01','2025-07-01');
INSERT INTO session (date_debut, date_fin) VALUES ('2025-09-01','2026-07-01');

INSERT INTO filiere (nom_filiere) VALUES ('Informatique');
INSERT INTO filiere (nom_filiere) VALUES ('Design');

INSERT INTO serie (nom_serie) VALUES ('S');
INSERT INTO serie (nom_serie) VALUES ('L');
INSERT INTO serie (nom_serie) VALUES ('D');
INSERT INTO serie (nom_serie) VALUES ('C');
INSERT INTO serie (nom_serie) VALUES ('A2');
INSERT INTO serie (nom_serie) VALUES ('A1');
INSERT INTO serie (nom_serie) VALUES ('Techonologique');

INSERT INTO etat_candidature (nom_etat) VALUES
                                               ('admis'),
                                               ('refusé'),
                                               ('en attente');

INSERT INTO semestre (nom_semestre) VALUES
                                            ('S1'),
                                            ('S2'),
                                            ('S3'),
                                            ('S4'),
                                            ('S5'),
                                            ('S6');

INSERT INTO type_paiement (type,montant) VALUES
                                                ('Payé',20000),
                                                ('En attente',0),
                                                ('premiere tranche',10000),
                                                ('deuxieme tranche',10000);

INSERT INTO candidature (id_candidat, id_filiere, id_session, id_etat_candidature) VALUES 
(1,1,1,1),
(2,1,1,2),
(3,2,2,1),
(4,2,1,3),
(5,2,1,3);

SELECT nom_candidat, prenom_candidat, date_naissance, nom_genre, nom_ecole, f.nom_filiere, s.date_debut, s.date_fin, ectr.nom_etat
FROM candidat
        JOIN ecole e ON e.id_ecole = candidat.id_ecole
        JOIN genre g ON g.id_genre = candidat.id_genre
        JOIN candidature ctr ON ctr.id_candidat = candidat.id_candidat
        JOIN filiere f ON f.id_filiere = ctr.id_filiere
        JOIN session s ON s.id_session = ctr.id_session
        JOIN etat_candidature ectr ON ectr.id_etat_candidature = ctr.id_etat_candidature ;
