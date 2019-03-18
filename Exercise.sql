-- Section 0 select basics
-- Question 1
SELECT population FROM world WHERE name = 'Germany'
-- Question 2
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- Question 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
  
  
-- Section 1 select names
-- Question 1
SELECT name FROM world
  WHERE name LIKE 'Y%'
-- Question 2
SELECT name FROM world
  WHERE name LIKE '%y'
-- Question 3
SELECT name FROM world
  WHERE name LIKE '%x%'
-- Question 4
SELECT name FROM world
  WHERE name LIKE '%land'
-- Question 5
SELECT name FROM world
  WHERE name LIKE 'C%' and name LIKE '%ia'
-- Question 6
SELECT name FROM world
  WHERE name LIKE '%oo%'
-- Question 7
-- No solution yet

-- Question 8
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
-- Question 9
SELECT name FROM world
 WHERE name LIKE '%o__o%'
-- Question 10
SELECT name FROM world
 WHERE name LIKE '____'
-- Question 11
SELECT name 
  FROM world
 WHERE name LIKE world.capital
-- Question 12
SELECT name
  FROM world
 WHERE capital LIKE concat (name, ' City')
-- Question 13
SELECT capital, name
  FROM world
 WHERE capital Like concat (name, '%%')
-- Question 14
SELECT capital, name
  FROM world
 WHERE capital Like concat (name, '%_%')
-- Question 15
SELECT name, replace (capital, name, '')
  FROM world
 WHERE capital Like concat (name, '%_%')
 
 
-- Section 2 select from world
-- Question 1
SELECT name, continent, population FROM world
-- Question 2
SELECT name FROM world
WHERE population >= 200000000
-- Question 3
SELECT name, gdp/population FROM world
WHERE population >= 200000000
-- Question 4
SELECT name, population/1000000 FROM world
WHERE continent ='South America'
-- Question 5
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')
-- Question 6
SELECT name FROM world
WHERE name Like '%United%'
-- Question 7
SELECT name, population, area FROM world
WHERE area >= 3000000 or population >=250000000
-- Question 8
SELECT name, population, area FROM world
WHERE area >= 3000000 XOR population >=250000000
-- Question 9
SELECT name, round(population/1000000, 2), round(GDP/1000000000,2) FROM world
WHERE continent ='South America'
-- Question 10
SELECT name, round(gdp/population, -3) FROM world
WHERE gdp>= 1000000000000
-- Question 11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
-- Question 12
SELECT name, capital
FROM world where LEFT(name,1) = LEFT(capital,1) and name !=capital
-- Question 13
SELECT name
   FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%' and name NOT LIKE '% %'

-- Section 3 select from nobel
-- Question 1
SELECT *
  FROM nobel
 WHERE yr = 1950
-- Question 2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
-- Question 3
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'
-- Question 4
SELECT winner
  FROM nobel
 WHERE yr >= 2000 and subject ='Peace'
-- Question 5
SELECT yr, subject, winner
  FROM nobel
 WHERE yr between 1980 and 1989 and subject ='Literature'
-- Question 6
select * from nobel where winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
-- Question 7
select winner from nobel where winner LIKE 'John%'
-- Question 8
select yr,subject,winner from nobel where (subject='Physics' and yr=1980) OR (subject='Chemistry' and yr =1984)
-- Question 9
select yr,subject,winner from nobel where subject !='Chemistry' and subject !='Medicine' and yr =1980
-- Question 10
select yr,subject,winner from nobel where (subject ='Medicine' and yr <1910) OR (subject ='Literature' and yr >=2004)
-- Question 11
select yr,subject,winner from nobel where winner='PETER GRÜNBERG'
-- Question 12
select yr,subject,winner from nobel where winner='EUGENE O''NEILL'
-- Question 13
select winner,yr, subject from nobel where winner Like 'Sir%' Order By yr desc, winner asc
-- Question 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984 and subject IN ('Chemistry','Physics')
 ORDER BY subject, subject, winner


-- Section 4 select with select
-- Question 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Question 2
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') and continent='Europe'

-- Question 3
SELECT name, continent FROM world
  WHERE continent in 
     (SELECT continent FROM world
      WHERE name='Argentina' or name ='Australia') order by name

-- Question 4
SELECT name, population FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Canada') and  population <(SELECT population FROM world
      WHERE name='Poland')

-- Question 5
SELECT name, concat(Round(population/(SELECT population FROM world
      WHERE name='Germany')*100,0),'%') FROM world where continent ='Europe'

-- Question 6
SELECT name
  FROM world
 WHERE gdp >= ALL(SELECT gdp
                           FROM world
                          WHERE gdp>0 and continent='Europe') and continent!='Europe'

-- Question 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
  
-- Question 8
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
 
 -- Question 9
 -- no solution yet
 -- Question 10
 -- no solution yet
 
-- section 5 sum and count
 
 -- Question 1
 SELECT SUM(population)
FROM world

-- Question 2
SELECT distinct continent
FROM world

-- Question 3
SELECT sum(GDP)
FROM world where continent ='Africa'

-- Question 4
SELECT count(name)
FROM world where area>1000000

-- Question 5
SELECT sum(population)
FROM world where name in ('Estonia', 'Latvia', 'Lithuania')

-- Question 6
SELECT continent, count(name)
FROM world group by continent

-- Question 7
select continent, count(name) FROM world where population>10000000 group by continent 

-- Question 8
select continent
from world 
group by continent
having sum(population)>100000000

-- Section 6 Join
-- Question 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- Question 2
SELECT id,stadium,team1,team2
  FROM game
where id =1012

-- Question 3
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id=matchid)
where teamid = 'GER'

-- Question 4
select team1, team2, player 
from game 
join goal on goal.matchid=game.id
where player like 'Mario%'

-- Question 5
SELECT player, teamid, coach, gtime
FROM goal 
join eteam ON (goal.teamid=eteam.id)
JOIN game ON (goal.matchid=game.id)
WHERE gtime<=10

-- Question 6
select mdate, teamname
from game
join eteam on game.team1 = eteam.id
where coach ='Fernando Santos'

-- Question 7
select player 
from goal
join game on goal.matchid=game.id
where stadium = 'National Stadium, Warsaw'

-- Question 8
select distinct player 
from goal
join game on goal.matchid=game.id
where (team2 ='GER' or team1 ='GER') and teamid !='GER'

-- Question 9
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
group by teamname
 ORDER BY teamname

-- Question 10
select stadium, count(matchid)
from game
join goal on game.id = goal.matchid
group by stadium

-- Question 11
SELECT matchid,mdate, count(matchid) as noOfGoals
  FROM game 
JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

-- Question 12
select matchid, mdate, count(matchid) 
from goal
join game on goal.matchid = game.id
where teamid='GER'
group by matchid, mdate

-- Section 7- More join operators
-- Question 1
SELECT id, title
 FROM movie
 WHERE yr=1962
-- Question 2
SELECT yr
 FROM movie
 WHERE title ='Citizen Kane'
-- Question 3
select id, title, yr 
from movie
where title like '%Star Trek%'
order by yr
-- Question 4
select id
from actor
where name ='Glenn Close'
-- Question 5
select id
from movie
where title ='Casablanca'
-- Question 6
select name 
from actor
join casting on actor.id = casting.actorid
where movieid=(select id
from movie
where title ='Casablanca')
-- Question 7
select name 
from actor
join casting on actor.id = casting.actorid
where movieid=(select id
from movie
where title ='Alien')
-- Question 8
select title 
from movie
join casting on movie.id = casting.movieid
where actorid=
(select id
from actor
where name='Harrison Ford')
-- Question 9
select title 
from movie
join casting on movie.id = casting.movieid
where actorid=
(select id
from actor
where name='Harrison Ford')
and ord!=1
-- Question 10
select title, name
from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where casting.ord=1 and yr = 1962

-- Question 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)
-- Question 12
select title, name from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where movie.id in(
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
and casting.ord=1
-- Question 13
select name
from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where ord=1
group by name
having count(name)>=30
-- Question 14
select title, count(actorid) from movie
join casting on movie.id = casting.movieid
where yr =1978
group by title
order by count(actorid) DESC, title

-- Question 15
select distinct name
from actor
join casting on actor.id = casting.actorid
where movieid in
(select movieid
from casting
join actor on casting.actorid = actor.id
where name = 'Art Garfunkel')
and name != 'Art Garfunkel'
-- alternate answer
select distinct name from actor
where id in 
(select actorid
from casting
where movieid in
(select movieid
from casting
where actorid in
(select id 
from actor
where name = 'Art Garfunkel')))
and name != 'Art Garfunkel'

-- exercise 8
-- Question 1
select name 
from teacher
where dept is null
-- exercise 8+ numeric eg
-- Question 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- Question 2
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >=100

-- Question 3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'
-- Question 4
select subject, sum(response)
from nss
where
question ='Q22'
and 
(subject ='(8) Computer Science' 
or
subject = '(H) Creative Arts and Design')
group by subject
-- Question 5
select subject, sum(A_STRONGLY_AGREE*response/100)
from nss
where question ='Q22'
and 
(
subject ='(8) Computer Science' 
or
subject ='(H) Creative Arts and Design'
)
group by subject

-- Question 6
-- no solution yet
-- Question 7
select institution, round(avg(score),0)
from nss
where
institution like '%Manchester%'
and question ='Q22'
group by institution
-- Question 8
-- no solution yet



-- Exercise 9 Self Join
-- Question 1
select count(id) 
from stops

-- Question 2
select id 
from stops
where 
name = 'Craiglockhart'

-- Question 3
select id, name 
from stops
join route on stops.id = route.stop
where
route.company ='LRT'
and
route.num =4
-- Question 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2
-- Question 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop in(
select id 
from stops
where name='London Road')

-- Question 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

-- Question 7
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop =137

-- Question 8
select a.company, a.num
from route a 
join route b on (a.company = b.company and a.num=b.num)
join stops x on (a.stop = x.id)
join stops y on (b.stop = y.id)
where 
x.name = 'Craiglockhart' and y.name ='Tollcross'

-- Question 9
select distinct y.name, b.company, b.num
from route a
join route b on a.company = b.company and a.num = b.num
join stops x on a.stop = x.id
join stops y on b.stop = y.id
where
a.company ='LRT'
and x.name = 'Craiglockhart'

-- Question 10
-- no solution yet



