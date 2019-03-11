0 select basics
Question 1
SELECT population FROM world WHERE name = 'Germany'
Question 2
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
Question 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
  
  
1 select names
Q1
SELECT name FROM world
  WHERE name LIKE 'Y%'
Q2
SELECT name FROM world
  WHERE name LIKE '%y'
Q3
SELECT name FROM world
  WHERE name LIKE '%x%'
Q4
SELECT name FROM world
  WHERE name LIKE '%land'
Q5
SELECT name FROM world
  WHERE name LIKE 'C%' and name LIKE '%ia'
Q6
SELECT name FROM world
  WHERE name LIKE '%oo%'
Q7


Q8
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
Q9
SELECT name FROM world
 WHERE name LIKE '%o__o%'
Q10
SELECT name FROM world
 WHERE name LIKE '____'
Q11
SELECT name 
  FROM world
 WHERE name LIKE world.capital
Q12
SELECT name
  FROM world
 WHERE capital LIKE concat (name, ' City')
Q13
SELECT capital, name
  FROM world
 WHERE capital Like concat (name, '%%')
Q14
SELECT capital, name
  FROM world
 WHERE capital Like concat (name, '%_%')
Q15
SELECT name, replace (capital, name, '')
  FROM world
 WHERE capital Like concat (name, '%_%')
 
 
2 select from world
Q1
SELECT name, continent, population FROM world
Q2
SELECT name FROM world
WHERE population >= 200000000
Q3
SELECT name, gdp/population FROM world
WHERE population >= 200000000
Q4
SELECT name, population/1000000 FROM world
WHERE continent ='South America'
Q5
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')
Q6
SELECT name FROM world
WHERE name Like '%United%'
Q7
SELECT name, population, area FROM world
WHERE area >= 3000000 or population >=250000000
Q8
SELECT name, population, area FROM world
WHERE area >= 3000000 xor population >=250000000
Q9
SELECT name, round(population/1000000, 2), round(GDP/1000000000,2) FROM world
WHERE continent ='South America'
Q10
SELECT name, round(gdp/population, -3) FROM world
WHERE gdp>= 1000000000000
Q11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
Q12
SELECT name, capital
FROM world where LEFT(name,1) = LEFT(capital,1) and name !=capital
Q13
SELECT name
   FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%' and name NOT LIKE '% %'
