--	Script des requêtes incluant les clauses: 

--	Where
select * from Generation8
where Type_1 = 'Fighting' and Type_2 is null


--	Top
select top(10) Name, Attack, Speed
from Generation3
where Type_1 = 'Electric'
order by Attack desc

--	Like
select Name
from Generation1
where name like '%chu'

--	Or
select *
from Generation1
where Type_1 = 'grass' or Attack >=100

--	And
select *
from Generation1
where Type_1 = 'grass' and Attack >=100

--	In
select Number, Name, Type_1
from Generation3
where Type_1 in ('water','dragon','ice')

--	Exists 
select Number, Name, Type_2
from Generation5
where exists (select Name from Generation5 where Type_2 is null);

--	Group by
select sum(Generation1.Speed) as Total_Speed_Generation1, Generation1.Type_1 as Type_de_Pokemon
from Generation1
group by Generation1.Type_1

--	Having
select count(Generation2.Attack) as Total_de_pokemon_par_type1, Type_1 as Type_de_pokemon, sum(Generation2.Attack) as Total_Attaque
from Generation2
group by Type_1
having sum(Generation2.Attack) > 250
order by Total_Attaque asc

--	Between
select Number, Name, Speed
from Generation7
where Speed between '75' and '150'
order by Speed asc