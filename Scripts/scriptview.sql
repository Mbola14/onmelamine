create or replace view v_annonce as 
select idannonce,nbrrequise,poste,annonce.iddept,nomdept,annonce.idgenre,nomgenre,diplome,experience,agemin,agemax from annonce left join departement on annonce.iddept=departement.iddept left join genre on annonce.idgenre=genre.idgenre;

create or replace view v_candidat as
select idcandidat,idannonce,nom,prenom,datenaissance,candidat.idgenre,nomgenre from candidat join genre on candidat.idgenre=genre.idgenre;

create or replace view v_qualificationcandidat as
select idnotequalification,notequalification.idqualification,nomqualification,idcandidat,valeur,note from notequalification join qualification on notequalification.idqualification=qualification.idqualification;

create or replace view v_qualif as select q.nomqualification,c.* from qualification q,coeffqualification c 
where q.idqualification=c.idqualification; 

create or replace view v_notecandidat as select n.idnotequalification,c.idcandidat,c.idannonce,n.idqualification,q.nomqualification,n.note,co.coefficient from candidat c inner join notequalification n on c.idcandidat=n.idcandidat inner join qualification q on q.idqualification=n.idqualification inner join coeffqualification co on co.idqualification=n.idqualification group by n.idnotequalification,c.idcandidat,c.idannonce,n.idqualification,q.nomqualification,n.note,co.coefficient order by c.idannonce;

create or replace view v_moyennequalif as select vn.idcandidat,(sum(note*coefficient))/(sum(coefficient)) moyenne2 from v_notecandidat vn group by idcandidat order by idcandidat;

create or replace view tempo as select c.idcandidat id,c.idannonce idannonce,c.nom,c.prenom,datenaissance,g.nomgenre genre,(n.notediplome*ce.coefdiplome+n.noteexperience*ce.coefexp+n.notegenre*ce.coefgenre+n.noteage*ce.coefage)/(coefdiplome+coefexp+coefgenre+coefage) moyenne1 from candidat c inner join coeffensemble ce on c.idannonce=ce.idannonce inner join noteensemble n on c.idcandidat=n.idcandidat inner join genre g on g.idgenre=c.idgenre group by id,nom,prenom,datenaissance,genre,moyenne1 order by moyenne1 desc;

create or replace view list_selects as select t.*,vn.moyenne2,(t.moyenne1+vn.moyenne2)/2 moyenne from tempo t join v_moyennequalif vn on t.id=vn.idcandidat order by moyenne desc;

create or replace view list_embauches as select a.idannonce,a.nbrrequise,c.idcandidat id,c.nom,c.prenom,datenaissance,g.nomgenre genre,(notetest+noteentretien)/2 notefinal, notetest , noteentretien from candidat c inner join annonce a on c.idannonce=a.idannonce  inner join coeffensemble ce on c.idannonce=ce.idannonce inner join notetest_entretien n on c.idcandidat=n.idcandidat inner join genre g on g.idgenre=c.idgenre group by id,nom,prenom,datenaissance,genre,notefinal,a.idannonce,a.nbrrequise order by a.idannonce asc,notefinal desc ;

create or replace view login_admins as select * from admin;

CREATE OR REPLACE VIEW v_dates as SELECT c.idcandidat, c.idannonce, nom, prenom, datenaissance, idgenre,iddatetest_entretien, datetest, dateentretien FROM candidat c JOIN datetest_entretien d ON c.idcandidat = d.idcandidat;

create or replace view v_questionreponse as
select idreponsecandidat,idcandidat,reponsecandidat.idquestion,question,reponsecandidat.reponse,questiontest.note from reponsecandidat join questiontest on reponsecandidat.idquestion=questiontest.idquestion;
