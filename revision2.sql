SET ECHO ON
CREATE TABLE STATION
(nomstation Varchar(30) PRIMARY KEY,
capacite INTEGER NOT NULL,
lieu Varchar(30) NOT NULL,
region Varchar(30) NOT NULL
CHECK (region IN ('Europe','Amerique','Ocean Indien','Antilles','Extreme-Orient')),
tarif NUMBER(10,2) DEFAULT 0 
CHECK (tarif >= 0),
UNIQUE(lieu, region)
)

CREATE TABLE ACTIVITE
(
nomstation Varchar(30),
libelle Varchar(100),
prix NUMBER(10,2) DEFAULT 0,
CONSTRAINT PKACT PRIMARY KEY(nomstation, libelle), 
CONSTRAINT VERIFPRIX CHECK ( prix >= 0),
CONSTRAINT VERIFFK FOREIGN KEY nomstation¸ REFERENCES STATION(nomstation)
ON DELETE CASCADE ON UPDATE CASCADE
)
/
CREATE TABLE CLIENT
(id INTEGER PRIMARY KEY,
nom Varchar(30) NOT NULL
prenom Varchar(30),
ville Varchar(30) NOT NULL,
region Varchar(30)
solde NUMBER(10,2) DEFAULT 0 NOT NULL
CHECK (solde >= 0);
)
/
CREATE TABLE SEJOUR
(idclient INTEGER,
station Varchar(30),
datedebut DATE,
nbplaces INTEGER NOT NULL,
CHECK (nbplaces >= 0),
PRIMARY KEY(idclient,station,datedebut),
FOREIGN KEY(idclient) REFERENCES CLIENT.id
ON UPDATE CASCADE ON DELETE SET NULL
FOREIGN KEY(station) REFERENCES STATION.nomstation
ON DELETE CASCADE ON UPDATE CASCADE


)