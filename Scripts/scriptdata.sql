insert into admin(nom,mdp) values ('admin','admin');

insert into departement(nomdept) values("Ressource Humaine");
insert into departement(nomdept) values("INformatique");
INSERT INTO departement (nomdept) VALUES ('finances');
INSERT INTO departement (nomdept) VALUES ('commerciales');

insert into genre(nomgenre) values('homme');
insert into genre(nomgenre) values('femme');

insert into qualification(nomqualification) values("situation juridique");
insert into qualification(nomqualification) values("nombre d'enfant à charge");
insert into qualification(nomqualification) values("localisation");

INSERT INTO annonce (nbrrequise,poste,iddept,diplome,experience,agemin,agemax) VALUES (10,'developpeur back-end',2,'License','2 ans d exp professionnelle',22,45);

insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Jean','Paul','1995-12-05',1);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Marc','Rakoto','1997-05-15',1);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Mbola','Herizo','1996-07-15',1);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Rasoa','Julie','1998-01-18',2);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Koto','Baba','1997-06-22',1);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Jeanne','Rasolo','1995-12-05',2);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Marie','Lucy','1995-12-05',1);
insert into candidat(idannonce,nom,prenom,datenaissance,idgenre) values(1,'Mialy','Raj','1999-10-04',1);

INSERT INTO coeffensemble (idannonce,coefdiplome,coefexp,coefgenre,coefage) VALUES (1,5,4,0,1);

insert into coeffqualification(idqualification,idannonce,coefficient) values(1,1,4);
insert into coeffqualification(idqualification,idannonce,coefficient) values(3,1,5);

insert into datetest_entretien(datetest) values ('2022-10-09-07:00');

-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (1,'2022-09-24-07:00','2022-09-26-10:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (2,'2022-09-24-08:00','2022-09-25-09:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (3,'2022-09-25-07:00','2022-09-27-09:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (4,'2022-09-25-08:00','2022-09-27-14:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (5,'2022-09-27-10:00','2022-09-27-16:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (6,'2022-09-27-07:00','2022-09-28-09:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (7,'2022-09-28-07:00','2022-09-28-11:00');
-- insert into datetest_entretien(idcandidat,datetest,dateentretien) values (8,'2022-09-29-14:00','2022-09-30-08:00');

insert into diplome(nomdiplome,idcandidat) values('BACC D',1);
insert into diplome(nomdiplome,idcandidat) values('MASTER Informatique',1);
insert into diplome(nomdiplome,idcandidat) values('BACC C',2);
insert into diplome(nomdiplome,idcandidat) values('Licence Informatique',2);
insert into diplome(nomdiplome,idcandidat) values('BACC D',3);
insert into diplome(nomdiplome,idcandidat) values('Master Informatique',3);
insert into diplome(nomdiplome,idcandidat) values('BACC D',4);
insert into diplome(nomdiplome,idcandidat) values('Master Informatique',4);
insert into diplome(nomdiplome,idcandidat) values('BACC C',5);
insert into diplome(nomdiplome,idcandidat) values('Licence gestion',5);
insert into diplome(nomdiplome,idcandidat) values('Master informatique',5);
insert into diplome(nomdiplome,idcandidat) values('BACC C',6);
insert into diplome(nomdiplome,idcandidat) values('Master gestion',6);
insert into diplome(nomdiplome,idcandidat) values('Master Informatique',6);
insert into diplome(nomdiplome,idcandidat) values('BACC D',7);
insert into diplome(nomdiplome,idcandidat) values('DOCTORAT Informatique',7);
insert into diplome(nomdiplome,idcandidat) values('BACC D',8);
insert into diplome(nomdiplome,idcandidat) values('Master Informatique',8);

insert into experience(idcandidat,debut,fin,descri) values(1,'2010-01-05','2022-10-05','Developper fullstack chez BOCASAY');
insert into experience(idcandidat,debut,fin,descri) values(2,'2011-11-12','2019-04-10','Developper web BICI');
insert into experience(idcandidat,debut,fin,descri) values(2,'2019-05-01','2022-05-10','Developper BOCASAY Maurice');
insert into experience(idcandidat,debut,fin,descri) values(3,'2016-09-21','2019-10-01','Developpeur Front End BICI');
insert into experience(idcandidat,debut,fin,descri) values(4,'2020-09-06','2022-05-14','Developpeur Windev TELMA');
insert into experience(idcandidat,debut,fin,descri) values(5,'2018-09-24','2020-08-11','Developpeur Back End Orange');
insert into experience(idcandidat,debut,fin,descri) values(6,'2014-03-05','2018-03-01','Lead Developpeur BOCASAY');
insert into experience(idcandidat,debut,fin,descri) values(7,'2015-09-21','2021-10-01','Developpeur Fullstack Orange');
insert into experience(idcandidat,debut,fin,descri) values(8,'2019-09-21','2022-09-01','Developpeur Front End ESTI');

insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(1,3,5,5,2);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(2,5,2,3,5);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(3,4,5,5,3);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(4,1,3,3,2);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(5,4,4,5,2);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(6,4,5,4,5);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(7,4,2,5,3);
insert into noteensemble(idcandidat,notediplome,noteexperience,notegenre,noteage) values(8,2,2,5,2);

insert into notequalification(idqualification,idcandidat,note) values(1,1,3);
insert into notequalification(idqualification,idcandidat,note) values(3,1,5);

insert into notequalification(idqualification,idcandidat,note) values(1,2,4);
insert into notequalification(idqualification,idcandidat,note) values(3,2,4);

insert into notequalification(idqualification,idcandidat,note) values(1,3,3);
insert into notequalification(idqualification,idcandidat,note) values(3,3,2);

insert into notequalification(idqualification,idcandidat,note) values(1,4,2);
insert into notequalification(idqualification,idcandidat,note) values(3,4,5);

insert into notequalification(idqualification,idcandidat,note) values(1,5,1);
insert into notequalification(idqualification,idcandidat,note) values(3,5,4);

insert into notequalification(idqualification,idcandidat,note) values(1,6,4);
insert into notequalification(idqualification,idcandidat,note) values(3,6,3);

insert into notequalification(idqualification,idcandidat,note) values(1,7,2);
insert into notequalification(idqualification,idcandidat,note) values(3,7,4);

insert into notequalification(idqualification,idcandidat,note) values(1,8,5);
insert into notequalification(idqualification,idcandidat,note) values(3,8,4);

insert into notetest_entretien(idcandidat,notetest,noteentretien) values(1,3,5);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(2,5,5);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(3,4,4);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(4,4,3);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(5,2,3);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(6,1,5);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(7,3,3);
insert into notetest_entretien(idcandidat,notetest,noteentretien) values(8,5,2);

insert into questiontest(idannonce,question,reponse,note) values(1,'Un develloper fullstack est il à la fois front et back?','oui',1);
insert into questiontest(idannonce,question,reponse,note) values(1,'Laravel est il un framework? ','oui',1);
insert into questiontest(idannonce,question,reponse,note) values(1,'bootstrap est il une language?','non',1);
insert into questiontest(idannonce,question,reponse,note) values(1,'le ram fait il des calculs?','non',1);
insert into questiontest(idannonce,question,note) values(1,'citer 3 languages de programmation',2);
insert into questiontest(idannonce,question,note) values(1,'citer 3 Framework',2);

insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,2,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,3,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,4,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,5,'Java python angular');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(1,6,'Laravel synphony CI');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,1,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,2,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,3,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,4,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,5,'Php bootstrap c');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(2,6,'bootstrap dotnet CI');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,1,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,2,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,3,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,4,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,5,'java c++ csharp');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(3,6,'bootstrap laravel js');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,2,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,3,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,4,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,5,'python php ruby');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(4,6,'laravel bootstrap nodejs');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,2,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,3,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,4,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,5,'python c c++');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(5,6,'laravel symphony CI3');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,2,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,3,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,4,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,5,'java ruby angular');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(6,6,'laravel tomcat CI');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,2,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,3,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,4,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,5,'python ruby csharp');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(7,6,'laravel html symphony');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,1,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,2,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,3,'oui');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,4,'non');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,5,'html php js');
insert into reponsecandidat(idcandidat,idquestion,reponse) values(8,6,'laravel symphony CI');
