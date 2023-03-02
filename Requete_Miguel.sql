use Pokemon;
-- 1. WHERE
-- La requête SELECT qui récupère des données de plusieurs tables en utilisant des jointures. 
-- La requête sélectionne plusieurs colonnes de la table "National_Dex" ainsi que des colonnes de deux autres tables
-- "Generation1" et "Generation2" en utilisant une jointure gauche (LEFT JOIN) pour lier les données.

-- La requête utilise la clause "LEFT JOIN" pour lier les tables "National_Dex" 
-- et "Generation1" en utilisant la colonne "Number" comme clé de jointure. 
-- Elle lie également les tables "National_Dex" et "Generation2" en utilisant 
-- la même colonne "Number" comme clé de jointure.

-- La requête retourne une liste de données pour chaque Pokemon dans la table "National_Dex", 
-- avec les informations de la première et deuxième génération dans les colonnes correspondantes 
-- s'il y en a. Si un Pokemon n'a pas d'informations pour une génération, 
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
-- La requête suivante sélectionne les dix premiers Pokémon de la table National_Dex 
-- ainsi que leurs informations dans les tables de chaque génération 1, 2, 9

-- La clause TOP est utilisée pour limiter la sélection aux 10 premiers résultats. 
-- Les informations sélectionnées incluent le numéro du Pokémon, son nom, ses types, 
-- ses statistiques de base (HP, Attack, Defense, Sp_Attack, Sp_Defense, et Speed), 
-- ainsi que les informations de la génération 1 (si existante), de la génération 2 (si existante) 
-- et de la génération 9 (si existante).

-- Les trois tables sont reliées par la clé étrangère "Number" qui est une référence au numéro 
-- unique de chaque Pokémon dans la table National_Dex.
-- Les clauses LEFT JOIN sont utilisées pour inclure les informations des tables 
-- de chaque génération si elles existent, mais ne pas exclure les résultats 
-- qui ne correspondent à aucune génération.
-- La sélection est triée par ordre croissant des numéros de Pokémon.
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
-- La requête sélectionne les colonnes Name, Type_1 et Type_2 de la table National_Dex.
-- La clause JOIN est utilisée pour joindre la table National_Dex avec la table Generation7 
-- en utilisant la colonne Number comme clé de jointure.

-- La condition WHERE spécifie que seuls les Pokémon ayant un numéro compris entre 722 et 809 (inclus) 
-- seront retournés, ce qui correspond à la génération 7.

-- le résultat de cette requête ne contient que les Pokémon ayant un type 1 et/ou un type 2 
-- défini dans la table National_Dex. Les Pokémon qui n'ont qu'un seul type dans la table Generation7 
-- ne seront pas inclus dans les résultats.
SELECT nb.Name, nb.Type_1, nb.Type_2
FROM National_Dex nb
JOIN Generation7 g7
ON nb.Number = g7.Number
WHERE nb.Number BETWEEN 722 AND 809;

--4. Or 
-- La requête sélectionne toutes les colonnes de la table "National_Dex" et joint les informations correspondantes de la table "Generation9" en utilisant la clé étrangère "Number". La clause "LEFT JOIN" est utilisée pour inclure toutes les entrées de la table "National_Dex", 
-- même si elles n'ont pas de correspondance dans la table "Generation9".

-- La clause "WHERE" est utilisée pour filtrer les résultats en ne retournant 
-- que les entrées où le type 1 ou le type 2 dans la table "Generation9" est "Fire". 
-- La clause "OR" est utilisée pour inclure les entrées qui correspondent à l'un ou 
-- l'autre des critères.
SELECT *
FROM National_Dex
LEFT JOIN Generation9 g9 ON National_Dex.Number = g9.Number
WHERE g9.Type_1 = 'Fire' OR g9.Type_2 = 'Fire'

--5. And 
-- La requête sélectionne toutes les colonnes des tables "National_Dex" 
-- et "Generation9" pour lesquelles la valeur de la colonne "Type_1" de la table "National_Dex" 
-- est "Fire" et la valeur de la colonne "HP" de la table "Generation9" est supérieure à 100.

-- La clause "AND" est utilisée pour combiner deux conditions différentes. 
-- La jointure entre les tables est réalisée grâce à la clause "JOIN" qui spécifie 
-- comment les tables sont liées en utilisant les clés étrangères "Number" des deux tables.
SELECT *
FROM National_Dex nd
JOIN Generation9 g9 ON nd.Number = g9.Number
WHERE nd.Type_1 = 'Fire' AND g9.HP > 100;

--6. In  
-- La requête sélectionne toutes les colonnes dans les tables National_Dex et Generation6 
-- où le type 1 des Pokémons dans National_Dex est soit "Grass", "Fire", ou "Water" et 
-- où le numéro dans les deux tables correspond. 
-- La clause "IN" est utilisée pour spécifier les valeurs possibles pour la colonne Type_1 
-- dans National_Dex.
SELECT *
FROM National_Dex nd
JOIN Generation6 g6
ON nd.Number = g6.Number
WHERE nd.Type_1 IN ('Grass', 'Fire', 'Water')

--7.  Exists
-- La requête clause WHERE EXISTS avec un JOIN pour sélectionner les informations 
-- de la table Generation5 uniquement si un enregistrement correspondant existe 
-- dans la table National_Dex 

-- La requête sélectionne toutes les colonnes de la table Generation5 pour lesquelles il existe 
-- un enregistrement correspondant dans la table National_Dex. 
-- La sous-requête vérifie si la colonne Number de la table National_Dex 
-- correspond à la colonne Number de la table Generation5.
SELECT g5.*
FROM Generation5 g5
JOIN National_Dex n ON g5.Number = n.Number
WHERE EXISTS (
    SELECT *
    FROM National_Dex
    WHERE Number = g5.Number
);

--8. Group by
-- La requête permet de calculer la moyenne des points de vie (HP) 
-- pour chaque type de Pokémon de la génération 4

-- On utilise la clause JOIN pour combiner les données des tables "National_Dex" 
-- et "Generation4" en utilisant la clé étrangère "Number" comme condition de jointure.

-- La clause GROUP BY est utilisée pour regrouper les résultats par type de Pokémon, 
-- et la fonction AVG() calcule la moyenne des points de vie de chaque groupe. 
-- Le résultat final affiche le type de chaque Pokémon et la moyenne 
-- de ses points de vie pour la génération 4
SELECT nb.Type_1, AVG(nb.HP) as Avg_HP
FROM National_Dex nb
JOIN Generation4 g4
ON nb.Number = g4.Number
GROUP BY nb.Type_1;

--9 Having 
-- La requête commence par sélectionner les colonnes "Type_1" et "HP" de la table "National_Dex" 
-- et calculer la moyenne des points de vie pour chaque type de Pokémon en utilisant 
-- la fonction "AVG()".

-- On utilise la clause "JOIN" pour lier cette table à la table "Generation8" 
-- en fonction du numéro de chaque Pokémon.

-- Après avoir regroupé les résultats par type de Pokémon avec la clause "GROUP BY", 
-- elle applique la clause "HAVING" pour ne renvoyer que les types de Pokémon 
-- dont la moyenne de points de vie est supérieure à 80.
SELECT nb.Type_1, AVG(nb.HP) as Avg_HP
FROM National_Dex nb
JOIN Generation8 g8
ON nb.Number = g8.Number
GROUP BY nb.Type_1
HAVING AVG(nb.HP) > 80;

--10. Between 
-- La requête sélectionne tous les enregistrements de la table National_Dex 
-- qui ont une vitesse comprise entre 50 et 100, et qui ont un enregistrement correspondant 
-- dans la table Generation6 grâce à la jointure

-- On utilise la clause BETWEEN avec la colonne "Speed" de la table National_Dex. 
-- La condition WHERE permet de sélectionner uniquement les enregistrements qui ont une vitesse 
-- comprise entre 50 et 100. 

-- On utilise la jointure avec la table Generation6 
-- pour obtenir des informations supplémentaires sur ces Pokémon. 
SELECT *
FROM National_Dex nb
JOIN Generation6 g6
ON nb.Number = g6.Number
WHERE nb.Speed BETWEEN 50 AND 100;