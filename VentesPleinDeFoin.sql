SET ECHO ON
-- Script Oracle SQL*plus de creation du schema VentesPleinDeFoin 

-- Creation des tables
SET ECHO ON
DROP TABLE DetailLivraison
/
DROP TABLE Livraison
/
DROP TABLE LigneCommande
/
DROP TABLE Commande
/
DROP TABLE Client
/
DROP TABLE Article
/
CREATE TABLE Client
(noClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 PRIMARY KEY 	(noClient)
)
/
CREATE TABLE Article
(noArticle 		INTEGER		NOT NULL,
 description 	VARCHAR(20),
 prixUnitaire 	DECIMAL(10,2)	NOT NULL,
 quantiteEnStock	INTEGER		DEFAULT 0 NOT NULL 
 	CHECK (quantiteEnStock >= 0),
 PRIMARY KEY (noArticle))
/
CREATE TABLE Commande
(noCommande 	INTEGER 		NOT NULL,
 dateCommande	DATE			NOT NULL,
 noClient		INTEGER		NOT NULL,
 PRIMARY KEY 	(noCommande),
 FOREIGN KEY 	(noClient) REFERENCES Client
)
/
CREATE TABLE LigneCommande
(noCommande 	INTEGER		NOT NULL,
 noArticle 		INTEGER		NOT NULL,
 quantite 		INTEGER		NOT NULL
	CHECK (quantite > 0),
 PRIMARY KEY (noCommande, noArticle),
 FOREIGN KEY (noCommande) REFERENCES Commande,
 FOREIGN KEY (noArticle) REFERENCES Article
)
/
CREATE TABLE Livraison
(noLivraison 	INTEGER 		NOT NULL,
 dateLivraison	DATE			NOT NULL,
 PRIMARY KEY (noLivraison)
)
/
CREATE TABLE DetailLivraison
(noLivraison 	INTEGER 		NOT NULL,
 noCommande 	INTEGER		NOT NULL,
 noArticle 		INTEGER		NOT NULL,
 quantiteLivree	INTEGER		NOT NULL
	CHECK (quantiteLivree > 0),
 PRIMARY KEY (noLivraison, noCommande, noArticle),
 FOREIGN KEY (noLivraison) REFERENCES Livraison,
 FOREIGN KEY (noCommande, noArticle) REFERENCES LigneCommande
)
/
INSERT INTO Client
 	VALUES(10,'Luc Sansom','(999)999-9999')
/
INSERT INTO Client
 	VALUES(20,'Dollard Tremblay','(888)888-8888')
/
INSERT INTO Client
 	VALUES(30,'Lin Be','(777)777-7777')
/
INSERT INTO Client
 	VALUES(40,'Jean Leconte','(666)666-6666')
/
INSERT INTO Client
 	VALUES(50,'Hafed Alaoui','(555)555-5555')
/
INSERT INTO Client
 	VALUES(60,'Marie Leconte','(666)666-6666')
/
INSERT INTO Client
 	VALUES(70,'Simon Lecoq','(444)444-4419')
/
INSERT INTO Client
 	VALUES(80,'Dollard Tremblay','(333)333-3333')
/
INSERT INTO Article
 	VALUES(10,'Cedre en boule',10.99,10)
/
INSERT INTO Article
 	VALUES(20,'Sapin',12.99,10)
/
INSERT INTO Article
 	VALUES(40,'epinette bleue',25.99,10)
/
INSERT INTO Article
 	VALUES(50,'Chene',22.99,10)
/
INSERT INTO Article
 	VALUES(60,'erable argente',15.99,10)
/
INSERT INTO Article
 	VALUES(70,'Herbe a puce',10.99,10)
/
INSERT INTO Article
 	VALUES(80,'Poirier',26.99,10)
/
INSERT INTO Article
 	VALUES(81,'Catalpa',25.99,10)
/
INSERT INTO Article
 	VALUES(90,'Pommier',25.99,10)
/
INSERT INTO Article
 	VALUES(95,'Genevrier',15.99,10)
/
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY'
/
INSERT INTO Commande 
 	VALUES(1,'01/06/2000',10)
/
INSERT INTO Commande 
 	VALUES(2,'02/06/2000',20)
/
INSERT INTO Commande 
 	VALUES(3,'02/06/2000',10)
/
INSERT INTO Commande 
 	VALUES(4,'05/07/2000',10)
/
INSERT INTO Commande 
 	VALUES(5,'09/07/2000',30)
/
INSERT INTO Commande 
 	VALUES(6,'09/07/2000',20)
/
INSERT INTO Commande 
 	VALUES(7,'15/07/2000',40)
/
INSERT INTO Commande 
 	VALUES(8,'15/07/2000',40)
/
INSERT INTO LigneCommande 
 	VALUES(1,10,10)
/
INSERT INTO LigneCommande 
 	VALUES(1,70,5)
/
INSERT INTO LigneCommande 
 	VALUES(1,90,1)
/
INSERT INTO LigneCommande 
 	VALUES(2,40,2)
/
INSERT INTO LigneCommande 
 	VALUES(2,95,3)
/
INSERT INTO LigneCommande 
 	VALUES(3,20,1)
/
INSERT INTO LigneCommande 
 	VALUES(4,40,1)
/
INSERT INTO LigneCommande 
 	VALUES(4,50,1)
/
INSERT INTO LigneCommande 
 	VALUES(5,70,3)
/
INSERT INTO LigneCommande 
 	VALUES(5,10,5)
/
INSERT INTO LigneCommande 
 	VALUES(5,20,5)
/
INSERT INTO LigneCommande 
 	VALUES(6,10,5)
/
INSERT INTO LigneCommande 
 	VALUES(6,40,1)
/
INSERT INTO LigneCommande 
 	VALUES(7,50,1)
/
INSERT INTO LigneCommande
 	VALUES(8,20,3)
/
INSERT INTO Livraison
 	VALUES(100,'03/06/2000')
/
INSERT INTO Livraison
 	VALUES(101,'04/06/2000')
/
INSERT INTO Livraison
 	VALUES(102,'04/06/2000')
/
INSERT INTO Livraison
 	VALUES(103,'05/06/2000')
/
INSERT INTO Livraison
 	VALUES(104,'07/07/2000')
/
INSERT INTO Livraison
 	VALUES(105,'08/07/2000')
/
INSERT INTO DetailLivraison
 	VALUES(100,1,10,7)
/
INSERT INTO DetailLivraison
 	VALUES(100,1,70,5)
/
INSERT INTO DetailLivraison
 	VALUES(101,1,10,3)
/
INSERT INTO DetailLivraison
 	VALUES(102,2,40,2)
/
INSERT INTO DetailLivraison
 	VALUES(102,2,95,1)
/
INSERT INTO DetailLivraison
 	VALUES(100,3,20,1)
/
INSERT INTO DetailLivraison
 	VALUES(103,1,90,1)
/
INSERT INTO DetailLivraison
 	VALUES(104,4,40,1)
/
INSERT INTO DetailLivraison
 	VALUES(105,5,70,2)
/
COMMIT
/