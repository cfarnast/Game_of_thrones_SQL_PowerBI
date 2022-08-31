/****** Script for SelectTopNRows command from SSMS  ******/
-- Metodos mas ocurrentes de muerte
select top(10) Method as Método_muerte,
count(Method) as Número
from muertes
group by Method
order by Número desc

--Locaciones con mas muertes
select top(10)muertes.Location as Lugar,
count(muertes.Location) as Ocurrencias
from muertes
group by(muertes.Location)
order by Ocurrencias desc

--Victimas mas frecuentes
select top(10)Name as 'Victimas',
count(Name) as 'Numero'
from muertes
group by Name
order by Numero desc

--Castas mas asesinas
select top(10)Killers_House as Casta,
count(Killers_House) as Veces
from muertes
group by Killers_House
order by count(Killers_House) desc

--Personajes mas asesinos
select top(10)Killer,
sum(Cantidad_Muertes) as Cantidad_Muertes
from muertes
group by Killer
order by Cantidad_Muertes desc


-- Muertes por temporada

select sum(Cantidad_Muertes)
from muertes
where Season = 1
-- 58 muertes
select sum(Cantidad_Muertes)
from muertes
where Season = 2
--130
select sum(Cantidad_Muertes)
from muertes
where Season = 3
--86
select sum(Cantidad_Muertes)
from muertes
where Season = 4
--170
select sum(Cantidad_Muertes)
from muertes
where Season = 5
--158
select sum(Cantidad_Muertes)
from muertes
where Season = 6
--396
select sum(Cantidad_Muertes)
from muertes
where Season = 7
--334
select sum(Cantidad_Muertes)
from muertes
where Season = 8
--892. La ultima temporada fue la mas sangrienta!

--Cuales son los capitulos mas sangrientos
select top(500)Episode,
Season,
Killer,
Killers_House,
Method,
Name,
Location,
sum(Cantidad_Muertes) as Cantidad_Muertes
from muertes
group by Episode, Season, Killer, Method, Location, Killers_House, Name
order by Cantidad_Muertes desc
