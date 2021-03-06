SET ECHO ON

CREATE TABLE ACTEURS
(id INTEGER PRIMARY KEY
nom Varchar(30),
)
/
CREATE TABLE DISTRIBUTIONS
(idfilm INTEGER,
idacteur INTEGER,
rang INTEGER,
PRIMARY KEY(idfilm,idacteur)
)
/
CREATE TABLE REALISATEURS
(id INTEGER PRIMARY KEY,
nom Varchar(30),
)
/
CREATE TABLE FILMS
(id INTEGER PRIMARY KEY,
titre Varchar(30),
annee DATE,
score INTEGER,
nbvotant INTEGER,
idrealisateur INTEGER
FOREIGN KEY(idrealisateur) REFERENCES REALISATEURS.id
)
/
--
SELECT id,titre,annee FROM FILMS ORDER BY titre;
SELECT * FROM FILMS WHERE score >= 9;
SELECT idacteur, nom FROM FILMS, ACTEURS, DISTRIBUTIONS WHERE ACTEURS.id = idacteur AND FILM.id = idfilm AND rang = 1 AND annee = 2000 ORDER BY nom;
SELECT FILMS.id FROM FILMS WHERE annee < 1930 UNION SELECT idfilm AS id FROM ACTEURS WHERE DISTRIBUTIONS.idacteur = 12;
SELECT ACTEURS.id FROM ACTEURS, DISTRIBUTIONS WHERE id = idacteur AND rang = 1 AND idfilm = 11 ORDER BY nom ASC;
SELECT nom FROM FILMS, REALISATEURS WHERE FILM.idrealisateur = REALISATEURS.id AND annee < 1970 AND titre LIKE('%the%');
SELECT FILMS.id, titre FROM FILMS WHERE id NOT IN (SELECT idfilm FROM DISTRIBUTIONS);
SELECT DISTINCT id, titre FROM DISTRIBUTIONS d1,DISTRIBUTIONS d2 ,FILMS  WHERE annee = 2000 AND d1.idacteur > d2.idacteur AND d1.idfilm = d2.idfilm AND idfilm = FILMS.id
