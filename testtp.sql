SET ECHO ON
--a)
SELECT nom FROM interpretes JOIN chanteur ON interpretes.idchanteur = chanteurs.id WHERE idchanson = 33 AND rang = 1;
--b)
SELECT DISTINCT nom FROM chansons, auteurs WHERE annee < 2000 AND titre LIKE '%CHA%1%' ORDER BY nom ASC;
--c)
SELECT chansons.id, titre, COUNT(idchanteur) AS nbchanteurs FROM interpretes JOIN chansons ON interpretes.idchanson = chansons.id GROUP BY chansons.id, titre;
--d)
SELECT nom, SUM(nbvotant) AS totalvotant FROM chansons JOIN interpretes ON chansons.id = interpretes.idchanson JOIN chanteurs ON interpretes.idchanteur = chanteurs.id GROUP BY nom ORDER BY nom ASC ;
--e)
SELECT DISTINCT idchanteur, nom FROM interpretes JOIN chanteurs ON interpretes.idchanteur = chanteurs.id WHERE idchanteur IN (SELECT idchanteur FROM interpretes GROUP BY idchanteur HAVING COUNT(DISTINCT rang) >= 3 );
--f)
SELECT auteurs.id, nom FROM (SELECT auteurs.id, nom,COUNT(chansons.id) AS nbchansonsecrites	FROM chansons JOIN auteurs ON chansons.idauteur = auteurs.id GROUP BY auteurs.id, nom) query1, (SELECT MAX(query2.nbchansonsecrites) AS highest_count FROM (SELECT auteurs.id, nom,COUNT(chansons.id) AS nbchansonsecrites FROM chansons JOIN auteurs ON chansons.idauteur = auteurs.id GROUP BY auteurs.id, nom) query2) query3 WHERE query1.nbchansonsecrites = query3.highest_count;
