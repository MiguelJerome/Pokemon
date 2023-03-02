--	Script des requêtes incluant les clauses: 

--	Where
SELECT Number, Name, Type_1, Type_2, HP
FROM National_Dex
WHERE HP < 15

--	Top
SELECT top(6) Name, Type_1, Type_2, Attack 
FROM Generation4
ORDER BY Attack desc

--	Like
SELECT * 
FROM Generation1
WHERE Name LIKE '%Mew%'

--	Or
SELECT Number, Name, Type_1, Type_2 
FROM Generation1
WHERE Name LIKE '%eon' OR Name LIKE 'Ee%ee'

--	And
SELECT * 
FROM Generation5
WHERE Defense > 100 AND Sp_Defense > 100

--	In
SELECT Number, Name, Type_1, Type_2
FROM Generation6
WHERE Number in (650,651,652,653,654,655,656,657,658)

--	Exists 
SELECT Name, Type_1, Type_2, Sp_Attack
FROM Generation7
WHERE EXISTS 
(SELECT Name FROM Generation7 WHERE Type_2 = NULL)
ORDER BY Sp_Attack ASC

--	Group by
SELECT COUNT(Type_1) AS Pokemon_per_Type, Type_1
FROM Generation8
GROUP BY Type_1 
ORDER BY Pokemon_per_Type ASC

--	Having
SELECT SUM(Attack) AS AttackPower, Type_1
FROM National_Dex
GROUP BY Type_1 
HAVING SUM(Attack) > 30
ORDER BY AttackPower ASC

--	Between
SELECT * 
FROM Generation2
WHERE HP BETWEEN 150 AND 260
ORDER BY HP DESC