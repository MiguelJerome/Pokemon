use Pokemon;
-- 1. WHERE
-- La requ�te SELECT qui r�cup�re des donn�es de plusieurs tables en utilisant des jointures. 
-- La requ�te s�lectionne plusieurs colonnes de la table "National_Dex" ainsi que des colonnes de deux autres tables
-- "Generation1" et "Generation2" en utilisant une jointure gauche (LEFT JOIN) pour lier les donn�es.

-- La requ�te utilise la clause "LEFT JOIN" pour lier les tables "National_Dex" 
-- et "Generation1" en utilisant la colonne "Number" comme cl� de jointure. 
-- Elle lie �galement les tables "National_Dex" et "Generation2" en utilisant 
-- la m�me colonne "Number" comme cl� de jointure.

-- La requ�te retourne une liste de donn�es pour chaque Pokemon dans la table "National_Dex", 
-- avec les informations de la premi�re et deuxi�me g�n�ration dans les colonnes correspondantes 
-- s'il y en a. Si un Pokemon n'a pas d'informations pour une g�n�ration, 
-- les colonnes correspondantes auront une valeur NULL.

SELECT nd.Number, nd.Name, nd.Type_1, nd.Type_2, nd.HP, nd.Attack, nd.Defense, nd.Sp_Attack, nd.Sp_Defense, nd.Speed,
       g1.Name AS Gen1_Name, g1.Type_1 AS Gen1_Type_1, g1.Type_2 AS Gen1_Type_2, g1.HP AS Gen1_HP, g1.Attack AS Gen1_Attack,
       g1.Defense AS Gen1_Defense, g1.Sp_Attack AS Gen1_Sp_Attack, g1.Sp_Defense AS Gen1_Sp_Defense, g1.Speed AS Gen1_Speed,
       g2.Name AS Gen2_Name, g2.Type_1 AS Gen2_Type_1, g2.Type_2 AS Gen2_Type_2, g2.HP AS Gen2_HP, g2.Attack AS Gen2_Attack,
       g2.Defense AS Gen2_Defense, g2.Sp_Attack AS Gen2_Sp_Attack, g2.Sp_Defense AS Gen2_Sp_Defense, g2.Speed AS Gen2_Speed
FROM National_Dex nd
LEFT JOIN Generation1 g1 ON nd.Number = g1.Number
LEFT JOIN Generation2 g2 ON nd.Number = g2.Number;

-- 2. WHERE
-- La requ�te suivante s�lectionne les dix premiers Pok�mon de la table National_Dex 
-- ainsi que leurs informations dans les tables de chaque g�n�ration 1, 2, 9

-- La clause TOP est utilis�e pour limiter la s�lection aux 10 premiers r�sultats. 
-- Les informations s�lectionn�es incluent le num�ro du Pok�mon, son nom, ses types, 
-- ses statistiques de base (HP, Attack, Defense, Sp_Attack, Sp_Defense, et Speed), 
-- ainsi que les informations de la g�n�ration 1 (si existante), de la g�n�ration 2 (si existante) 
-- et de la g�n�ration 9 (si existante).

-- Les trois tables sont reli�es par la cl� �trang�re "Number" qui est une r�f�rence au num�ro 
-- unique de chaque Pok�mon dans la table National_Dex.
-- Les clauses LEFT JOIN sont utilis�es pour inclure les informations des tables 
-- de chaque g�n�ration si elles existent, mais ne pas exclure les r�sultats 
-- qui ne correspondent � aucune g�n�ration.
-- La s�lection est tri�e par ordre croissant des num�ros de Pok�mon.
SELECT TOP 10 nd.Number, nd.Name, nd.Type_1, nd.Type_2, nd.HP, nd.Attack, nd.Defense, nd.Sp_Attack, nd.Sp_Defense, nd.Speed,
       g1.Name AS Gen1_Name, g1.Type_1 AS Gen1_Type_1, g1.Type_2 AS Gen1_Type_2, g1.HP AS Gen1_HP, g1.Attack AS Gen1_Attack,
       g1.Defense AS Gen1_Defense, g1.Sp_Attack AS Gen1_Sp_Attack, g1.Sp_Defense AS Gen1_Sp_Defense, g1.Speed AS Gen1_Speed,
       g2.Name AS Gen2_Name, g2.Type_1 AS Gen2_Type_1, g2.Type_2 AS Gen2_Type_2, g2.HP AS Gen2_HP, g2.Attack AS Gen2_Attack,
       g2.Defense AS Gen2_Defense, g2.Sp_Attack AS Gen2_Sp_Attack, g2.Sp_Defense AS Gen2_Sp_Defense, g2.Speed AS Gen2_Speed,
       g9.Name AS Gen9_Name, g9.Type_1 AS Gen9_Type_1, g9.Type_2 AS Gen9_Type_2, g9.HP AS Gen9_HP, g9.Attack AS Gen9_Attack,
       g9.Defense AS Gen9_Defense, g9.Sp_Attack AS Gen9_Sp_Attack, g9.Sp_Defense AS Gen9_Sp_Defense, g9.Speed AS Gen9_Speed
FROM National_Dex nd
LEFT JOIN Generation1 g1 ON nd.Number = g1.Number
LEFT JOIN Generation2 g2 ON nd.Number = g2.Number
LEFT JOIN Generation9 g9 ON nd.Number = g9.Number
ORDER BY nd.Number ASC;

--3. Like 
-- La requ�te s�lectionne les colonnes Name, Type_1 et Type_2 de la table National_Dex.
-- La clause JOIN est utilis�e pour joindre la table National_Dex avec la table Generation7 
-- en utilisant la colonne Number comme cl� de jointure.

-- La condition WHERE sp�cifie que seuls les Pok�mon ayant un num�ro compris entre 722 et 809 (inclus) 
-- seront retourn�s, ce qui correspond � la g�n�ration 7.

-- le r�sultat de cette requ�te ne contient que les Pok�mon ayant un type 1 et/ou un type 2 
-- d�fini dans la table National_Dex. Les Pok�mon qui n'ont qu'un seul type dans la table Generation7 
-- ne seront pas inclus dans les r�sultats.
SELECT nb.Name, nb.Type_1, nb.Type_2
FROM National_Dex nb
JOIN Generation7 g7
ON nb.Number = g7.Number
WHERE nb.Number BETWEEN 722 AND 809;

--4. Or 
-- La requ�te s�lectionne toutes les colonnes de la table "National_Dex" et joint les informations correspondantes de la table "Generation9" en utilisant la cl� �trang�re "Number". La clause "LEFT JOIN" est utilis�e pour inclure toutes les entr�es de la table "National_Dex", 
-- m�me si elles n'ont pas de correspondance dans la table "Generation9".

-- La clause "WHERE" est utilis�e pour filtrer les r�sultats en ne retournant 
-- que les entr�es o� le type 1 ou le type 2 dans la table "Generation9" est "Fire". 
-- La clause "OR" est utilis�e pour inclure les entr�es qui correspondent � l'un ou 
-- l'autre des crit�res.
SELECT *
FROM National_Dex
LEFT JOIN Generation9 g9 ON National_Dex.Number = g9.Number
WHERE g9.Type_1 = 'Fire' OR g9.Type_2 = 'Fire'

--5. And 
-- La requ�te s�lectionne toutes les colonnes des tables "National_Dex" 
-- et "Generation9" pour lesquelles la valeur de la colonne "Type_1" de la table "National_Dex" 
-- est "Fire" et la valeur de la colonne "HP" de la table "Generation9" est sup�rieure � 100.

-- La clause "AND" est utilis�e pour combiner deux conditions diff�rentes. 
-- La jointure entre les tables est r�alis�e gr�ce � la clause "JOIN" qui sp�cifie 
-- comment les tables sont li�es en utilisant les cl�s �trang�res "Number" des deux tables.
SELECT *
FROM National_Dex nd
JOIN Generation9 g9 ON nd.Number = g9.Number
WHERE nd.Type_1 = 'Fire' AND g9.HP > 100;

--6. In  
-- La requ�te s�lectionne toutes les colonnes dans les tables National_Dex et Generation6 
-- o� le type 1 des Pok�mons dans National_Dex est soit "Grass", "Fire", ou "Water" et 
-- o� le num�ro dans les deux tables correspond. 
-- La clause "IN" est utilis�e pour sp�cifier les valeurs possibles pour la colonne Type_1 
-- dans National_Dex.
SELECT *
FROM National_Dex nd
JOIN Generation6 g6
ON nd.Number = g6.Number
WHERE nd.Type_1 IN ('Grass', 'Fire', 'Water')

--7.  Exists
-- La requ�te clause WHERE EXISTS avec un JOIN pour s�lectionner les informations 
-- de la table Generation5 uniquement si un enregistrement correspondant existe 
-- dans la table National_Dex 

-- La requ�te s�lectionne toutes les colonnes de la table Generation5 pour lesquelles il existe 
-- un enregistrement correspondant dans la table National_Dex. 
-- La sous-requ�te v�rifie si la colonne Number de la table National_Dex 
-- correspond � la colonne Number de la table Generation5.
SELECT g5.*
FROM Generation5 g5
JOIN National_Dex n ON g5.Number = n.Number
WHERE EXISTS (
    SELECT *
    FROM National_Dex
    WHERE Number = g5.Number
);

--8. Group by
-- La requ�te permet de calculer la moyenne des points de vie (HP) 
-- pour chaque type de Pok�mon de la g�n�ration 4

-- On utilise la clause JOIN pour combiner les donn�es des tables "National_Dex" 
-- et "Generation4" en utilisant la cl� �trang�re "Number" comme condition de jointure.

-- La clause GROUP BY est utilis�e pour regrouper les r�sultats par type de Pok�mon, 
-- et la fonction AVG() calcule la moyenne des points de vie de chaque groupe. 
-- Le r�sultat final affiche le type de chaque Pok�mon et la moyenne 
-- de ses points de vie pour la g�n�ration 4
SELECT nb.Type_1, AVG(nb.HP) as Avg_HP
FROM National_Dex nb
JOIN Generation4 g4
ON nb.Number = g4.Number
GROUP BY nb.Type_1;

--9 Having 
-- La requ�te commence par s�lectionner les colonnes "Type_1" et "HP" de la table "National_Dex" 
-- et calculer la moyenne des points de vie pour chaque type de Pok�mon en utilisant 
-- la fonction "AVG()".

-- On utilise la clause "JOIN" pour lier cette table � la table "Generation8" 
-- en fonction du num�ro de chaque Pok�mon.

-- Apr�s avoir regroup� les r�sultats par type de Pok�mon avec la clause "GROUP BY", 
-- elle applique la clause "HAVING" pour ne renvoyer que les types de Pok�mon 
-- dont la moyenne de points de vie est sup�rieure � 80.
SELECT nb.Type_1, AVG(nb.HP) as Avg_HP
FROM National_Dex nb
JOIN Generation8 g8
ON nb.Number = g8.Number
GROUP BY nb.Type_1
HAVING AVG(nb.HP) > 80;

--10. Between 
-- La requ�te s�lectionne tous les enregistrements de la table National_Dex 
-- qui ont une vitesse comprise entre 50 et 100, et qui ont un enregistrement correspondant 
-- dans la table Generation6 gr�ce � la jointure

-- On utilise la clause BETWEEN avec la colonne "Speed" de la table National_Dex. 
-- La condition WHERE permet de s�lectionner uniquement les enregistrements qui ont une vitesse 
-- comprise entre 50 et 100. 

-- On utilise la jointure avec la table Generation6 
-- pour obtenir des informations suppl�mentaires sur ces Pok�mon. 
SELECT *
FROM National_Dex nb
JOIN Generation6 g6
ON nb.Number = g6.Number
WHERE nb.Speed BETWEEN 50 AND 100;