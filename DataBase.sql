Create database ProjetManagment;

CREATE TABLE employé (
	matricule serial PRIMARY KEY,
	Nome VARCHAR ( 50 ) NOT NULL,
	Prenom VARCHAR ( 50 ) NOT NULL,
	Phone VARCHAR ( 50 ) ,
	Login VARCHAR ( 50 ) NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	employéRole VARCHAR ( 50 ) NOT NULL,
	created_on TIMESTAMP NOT NULL
);
CREATE TABLE Oranisme (
	Code serial PRIMARY KEY,
	Nome VARCHAR ( 50 ) NOT NULL,
	Prenom VARCHAR ( 50 ) NOT NULL,
	Phone VARCHAR ( 50 ) ,
	Adresse VARCHAR ( 50 ) ,
	NomContact VARCHAR ( 50 ),
	Email VARCHAR ( 50 ),
	Website VARCHAR ( 50 ),
	created_on TIMESTAMP NOT NULL
);
CREATE TABLE Projet (
	Code serial PRIMARY KEY,
	Description varchar ( 1000 ) NOT NULL,
	DatDebut TIMESTAMP ,
	DateFin TIMESTAMP,
	Adresse VARCHAR ( 50 ) ,
	Montant decimal  ,
	Document varchar(200),
	OrganismeCode integer references Oranisme(Code),
	created_on TIMESTAMP NOT NULL
);
CREATE TABLE Phase (
	Code serial PRIMARY KEY,
	Libellé VARCHAR ( 50 ) ,
	Description VARCHAR ( 2000 ) ,
	DateDebut TIMESTAMP  ,
	DateFin TIMESTAMP ,
	MontantPayer decimal  ,
	EtatRealisation bool NOT NULL,
	EtatFacturation bool NOT NULL,
	Document VARCHAR ( 200 ) NOT NULL,
	ProjetCode integer REFERENCES Projet  (Code),
	created_on TIMESTAMP NOT NULL
);

CREATE TABLE EmloyeéProjet (
	Id serial PRIMARY KEY,
	EmloyeéProjetMatricule integer REFERENCES employé (matricule ),
	EmloyeéProjetCode integer REFERENCES Projet  (Code),
	created_on TIMESTAMP NOT NULL
);

CREATE TABLE Livrable (
	Code serial PRIMARY KEY,
	Libellé VARCHAR ( 50 ) ,
	Description VARCHAR ( 2000 ) ,
	CheminDoccier VARCHAR (2000),
	PhaseCode integer REFERENCES Phase (Code),
	created_on TIMESTAMP NOT NULL
);



