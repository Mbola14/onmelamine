CREATE DATABASE RH;
use RH;

CREATE TABLE departement ( 
	iddept               INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nomdept              VARCHAR(50)  NOT NULL    
 ) engine=InnoDB;

CREATE TABLE genre ( 
	idgenre              INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nomgenre             VARCHAR(20)  NOT NULL    
 ) engine=InnoDB;

CREATE TABLE qualification ( 
	idqualification      INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nomqualification     VARCHAR(100)      
 ) engine=InnoDB;

CREATE TABLE annonce ( 
	idannonce            INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nbrrequise           INT      ,
	poste                VARCHAR(50)      ,
	iddept               INT      ,
	idgenre              INT      ,
	diplome                VARCHAR(50)      ,
	experience                VARCHAR(50)      ,
	agemin               INT      ,
	agemax              INT      ,
	FOREIGN KEY ( iddept ) REFERENCES departement( iddept )
 ) engine=InnoDB;

CREATE TABLE candidat ( 
	idcandidat           INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idannonce            INT      ,
	nom                  VARCHAR(100)  NOT NULL    ,
	prenom               VARCHAR(100)      ,
	datenaissance        DATE      ,
	idgenre              INT      ,
	FOREIGN KEY ( idannonce ) REFERENCES annonce( idannonce ),
	FOREIGN KEY ( idgenre ) REFERENCES genre( idgenre )
 ) engine=InnoDB;

CREATE TABLE coeffensemble ( 
	idcoeffensemble      INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idannonce            INT      ,
	coefdiplome          INT      ,
	coefexp              INT      ,
	coefgenre            INT      ,
	coefage              INT      ,
	FOREIGN KEY ( idannonce ) REFERENCES annonce( idannonce )
 ) engine=InnoDB;

CREATE TABLE coeffqualification ( 
	idcoeffqualification INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idqualification      INT      ,
	idannonce            INT      ,
	coefficient          INT  NOT NULL    ,
	FOREIGN KEY ( idqualification ) REFERENCES qualification( idqualification ),
	FOREIGN KEY ( idannonce ) REFERENCES annonce( idannonce )
 ) engine=InnoDB;

CREATE TABLE datetest_entretien ( 
	iddatetest_entretien INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idcandidat           INT UNIQUE      ,
	datetest             DATETIME  NOT NULL    ,
	dateentretien        DATETIME  NOT NULL    ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat )
 ) engine=InnoDB;

CREATE TABLE diplome ( 
	iddiplome            INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nomdiplome           VARCHAR(100)      ,
	idcandidat           INT      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat )
 ) engine=InnoDB;

CREATE TABLE experience ( 
	idexperience         INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idcandidat           INT      ,
	debut                DATE      ,
	fin                  DATE      ,
	descri               VARCHAR(100)      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat )
 ) engine=InnoDB;

CREATE TABLE noteensemble ( 
	idnoteensemble       INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idcandidat           INT      ,
	notediplome          INT      ,
	noteexperience       INT      ,
	notegenre            INT      ,
	noteage              INT      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat )
 ) engine=InnoDB;

CREATE TABLE notequalification ( 
	idnotequalification  INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idqualification      INT      ,
	idcandidat           INT      ,
	valeur               VARCHAR(200)      ,
	note                 INT      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat ),
	FOREIGN KEY ( idqualification ) REFERENCES qualification( idqualification )
 ) engine=InnoDB;

CREATE TABLE notetest_entretien ( 
	idnotetest_entertien INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idcandidat           INT      ,
	notetest             INT      ,
	noteentretien        INT      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat )
 ) engine=InnoDB;

CREATE TABLE questiontest ( 
	idquestion           INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idannonce            INT      ,
	question             VARCHAR(150)      ,
	reponse              VARCHAR(50)      ,
	note                 INT      ,
	FOREIGN KEY ( idannonce ) REFERENCES annonce( idannonce )
 ) engine=InnoDB;

CREATE TABLE reponsecandidat ( 
	idreponsecandidat    INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	idcandidat           INT      ,
	idquestion           INT      ,
	reponse              VARCHAR(150)      ,
	note                 INT      ,
	FOREIGN KEY ( idcandidat ) REFERENCES candidat( idcandidat ),
	FOREIGN KEY ( idquestion ) REFERENCES questiontest( idquestion )
 ) engine=InnoDB;

CREATE TABLE admin(
    idadmin int not null AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) not null,
    mdp VARCHAR(50) not null
);
