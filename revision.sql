SET ECHO ON
DROP TABLE PAYS
/
DROP TABLE
/
DROP TABLE
/
CREATE TABLE PAYS
(nompays Varchar(30),
chef Varchar(30),
PRIMARY KEY (nompays)
)
/
CREATE TABLE VILLE
(idville INTEGER NOT NULL,
nomville Varchar(30) NOT NULL,
nbhabitant INTEGER NOT NULL
CHECK nbhabitant > 10,
nompays Varchar(30) NOT NULL,
estcapitale INTEGER NOT NULL
CHECK (estcapitale IN(0,1)),
PRIMARY KEY (idville),
FOREIGN KEY (nompays) REFERENCES PAYS(nompays)
ON DELETE NO ACTION  ON UPDATE CASCADE
CONSTRAINT constD CHECK (NOT EXIST( SELECT nompays FROM ville WHERE estcapitale = 1 GROUP BY nompays HAVING COUNT(*) > 1))
)
/
CREATE TABLE CONSULAT
(idconsulat INTEGER NOT NULL,
nomconsulat Varchar(30) NOT NULL,
nomconsul Varchar(30),
adresse Varchar(100),
nompays Varchar(30) NOT NULL,
idville INTEGER NOT NULL,
PRIMARY KEY (idconsulat),
FOREIGN KEY (nompays) REFERENCES PAYS(nompays)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idville) REFERENCES VILLE(idville)
ON DELETE CASCADE ON UPDATE CASCADE
)
/

--pays ayant plus d'une capital
SELECT nompays FROM VILLE WHERE estcapitale = 1 GROUP BY nompays HAVING COUNT(*) > 1;
--ville ayant une capital et etant identique a une autre ville
SELECT v1.nompays FROM VILLE v1, VILLE v2 WHERE v1.nompays = v2.nompays AND v1.idville > v2.idville AND v1.estcapitale = 1 AND v1.estcapitale = v2.estcapitale;
