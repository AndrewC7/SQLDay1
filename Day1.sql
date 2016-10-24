WHERE!!!!!!

 -- What is the population of the US? (starts with 2, ends with 000)
SELECT name, population
FROM countries
WHERE name = 'United States';



 -- What is the area of the US? (starts with 9, ends with million square miles)
SELECT name, surfacearea
FROM countries
WHERE name = 'United States'



-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45?
SELECT name, population, lifeexpectancy, continent
FROM countries
Where continent = 'Africa' AND population < 30000000 AND lifeexpectancy > 45



-- Which countries are some kind of republic?
SELECT name, governmentform
FROM countries
WHERE governmentform LIKE '%Republic%'



-- Which countries are some kind of republic and acheived independence after 1945?
SELECT name, governmentform, indepyear
FROM countries
WHERE governmentform LIKE '%Republic%' AND indepyear > 1945



-- Which countries acheived independence after 1945 and are not some kind of republic?
SELECT name, governmentform, indepyear
FROM countries
WHERE governmentform NOT IN ('Socialistic Republic','Federal Republic','Republic') AND indepyear > 1945




ORDER BY!!!!!

-- Which fifteen countries have the lowest life expectancy?
SELECT name, lifeexpectancy
FROM countries
ORDER BY lifeexpectancy
LIMIT 15
Highest life expactancy?
SELECT name, lifeexpectancy
FROM countries
WHERE lifeexpectancy > 1
ORDER BY lifeexpectancy DESC
LIMIT 15



-- Which five countries have the lowest population density?
SELECT name, (population/surfacearea) AS popdensity
FROM countries
WHERE population > 1
ORDER BY popdensity
LIMIT 5



-- Highest population density?
SELECT name, (population/surfacearea) AS popdensity
FROM countries
WHERE population > 1
ORDER BY popdensity DESC
LIMIT 5



-- Which is the smallest country, by area and population?
SELECT name, surfacearea
FROM countries
ORDER BY surfacearea

SELECT name, population
FROM countries
WHERE population > 1
ORDER BY population

-- the 10 smallest countries, by area and population?
SELECT name, surfacearea
FROM countries
ORDER BY surfacearea
LIMIT 10

SELECT name, population
FROM countries
WHERE population > 1
ORDER BY population
LIMIT 10



-- Which is the biggest country, by area and population?
SELECT name, surfacearea
FROM countries
ORDER BY surfacearea DESC

SELECT name, population
FROM countries
WHERE population > 1
ORDER BY population DESC

SELECT name, surfacearea, population
FROM countries
WHERE population > 0 AND surfacearea > 0
ORDER BY population DESC
LIMIT 1

-- the 10 biggest countries, by area and population?
SELECT name, surfacearea
FROM countries
ORDER BY surfacearea DESC
LIMIT 10

SELECT name, population
FROM countries
WHERE population > 1
ORDER BY population DESC
LIMIT 10



WITH!!!!!

-- Of the smallest 10 countries, which has the biggest gnp?
WITH small10 AS (
  SELECT name, population, gnp
   FROM countries
   WHERE population > 0 AND gnp > 1
   ORDER BY population
   LIMIT 10)
SELECT name, population, gnp
     FROM small10
   ORDER BY population



-- Of the smallest 10 countries, which has the biggest per capita gnp?
WITH small10 AS (
  SELECT name, population, gnp, (gnp/population) AS capita_gnp
   FROM countries
   WHERE population > 0 AND gnp > 0
   ORDER BY population
   LIMIT 10)
SELECT name, population, gnp, capita_gnp
     FROM small10
   ORDER BY capita_gnp DESC




-- Of the biggest 10 countries, which has the biggest gnp?
WITH big10 AS (
  SELECT name, population, gnp
   FROM countries
   WHERE population > 0 AND gnp > 1
   ORDER BY population DESC
   LIMIT 10)
SELECT name, population, gnp
     FROM big10
   ORDER BY population DESC



-- Of the biggest 10 countries, which has the biggest per capita gnp?
WITH big10 AS (
SELECT name, population, gnp, (gnp/population) AS capita_gnp
 FROM countries
 WHERE population > 0 AND gnp > 0
 ORDER BY population DESC
 LIMIT 10)
SELECT name, population, gnp, capita_gnp
   FROM big10
 ORDER BY capita_gnp DESC


-- What is the sum of surface area of the 10 biggest countries in the world?
WITH big10 AS (
SELECT name, population, surfacearea
 FROM countries
 WHERE population > 0
 ORDER BY population DESC
 LIMIT 10)
SELECT SUM(big10.surfacearea) AS totalarea
   FROM big10
ORDER BY totalarea


--The 10 smallest?
WITH small10 AS (
SELECT name, population, surfacearea
 FROM countries
 WHERE population > 0
 ORDER BY population
 LIMIT 10)
SELECT SUM(small10.surfacearea) AS totalarea
   FROM small10
ORDER BY totalarea
