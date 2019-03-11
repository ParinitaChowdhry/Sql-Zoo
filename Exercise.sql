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

3 select from nobel
Q1
SELECT *
  FROM nobel
 WHERE yr = 1950
Q2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
Q3
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'
Q4
SELECT winner
  FROM nobel
 WHERE yr >= 2000 and subject ='Peace'
Q5
SELECT yr, subject, winner
  FROM nobel
 WHERE yr between 1980 and 1989 and subject ='Literature'
Q6
select * from nobel where winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
Q7
select winner from nobel where winner LIKE 'John%'
Q8
select yr,subject,winner from nobel where (subject='Physics' and yr=1980) OR (subject='Chemistry' and yr =1984)
Q9
select yr,subject,winner from nobel where subject !='Chemistry' and subject !='Medicine' and yr =1980
Q10
select yr,subject,winner from nobel where (subject ='Medicine' and yr <1910) OR (subject ='Literature' and yr >=2004)
Q11
select yr,subject,winner from nobel where winner='PETER GRÜNBERG'
Q12
select yr,subject,winner from nobel where winner='EUGENE O''NEILL'
Q13
select winner,yr, subject from nobel where winner Like 'Sir%' Order By yr desc, winner asc
Q14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics'), subject, winner



4 select with select
Q1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

Q2
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') and continent='Europe'

Q3
SELECT name, continent FROM world
  WHERE continent in 
     (SELECT continent FROM world
      WHERE name='Argentina' or name ='Australia') order by name

Q4
SELECT name, population FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Canada') and  population <(SELECT population FROM world
      WHERE name='Poland')

Q5
SELECT name, concat(Round(population/(SELECT population FROM world
      WHERE name='Germany')*100,0),'%') FROM world where continent ='Europe'

Q6
SELECT name
  FROM world
 WHERE gdp >= ALL(SELECT gdp
                           FROM world
                          WHERE gdp>0 and continent='Europe') and continent!='Europe'

Q7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
  
Q8
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
 
 Q9
 
 Q10
 
 
 5 sum and count
 
 Q1
 SELECT SUM(population)
FROM world

Q2
SELECT distinct continent
FROM world

Q3
SELECT sum(GDP)
FROM world where continent ='Africa'

Q4
SELECT count(name)
FROM world where area>1000000

Q5
SELECT sum(population)
FROM world where name in ('Estonia', 'Latvia', 'Lithuania')

Q6
SELECT continent, count(name)
FROM world group by continent

Q7
select continent, count(name) FROM world where population>10000000 group by continent 

Q8
select continent
from world 
group by continent
having sum(population)>100000000

6 Join
Q1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

Q2
SELECT id,stadium,team1,team2
  FROM game
where id =1012

Q3
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id=matchid)
where teamid = 'GER'

Q4
select team1, team2, player 
from game 
join goal on goal.matchid=game.id
where player like 'Mario%'

Q5
SELECT player, teamid, coach, gtime
FROM goal 
join eteam ON (goal.teamid=eteam.id)
JOIN game ON (goal.matchid=game.id)
WHERE gtime<=10

Q6
select mdate, teamname
from game
join eteam on game.team1 = eteam.id
where coach ='Fernando Santos'

Q7
select player 
from goal
join game on goal.matchid=game.id
where stadium = 'National Stadium, Warsaw'

Q8
select distinct player 
from goal
join game on goal.matchid=game.id
where (team2 ='GER' or team1 ='GER') and teamid !='GER'

Q9
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
group by teamname
 ORDER BY teamname

Q10
select stadium, count(matchid)
from game
join goal on game.id = goal.matchid
group by stadium

Q11
SELECT matchid,mdate, count(matchid) as noOfGoals
  FROM game 
JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

Q12
select matchid, mdate, count(matchid) 
from goal
join game on goal.matchid = game.id
where teamid='GER'
group by matchid, mdate

Q13

