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

Exercise 7- More join operators
Q1
SELECT id, title
 FROM movie
 WHERE yr=1962
Q2
SELECT yr
 FROM movie
 WHERE title ='Citizen Kane'
Q3
select id, title, yr 
from movie
where title like '%Star Trek%'
order by yr
Q4
select id
from actor
where name ='Glenn Close'
Q5
select id
from movie
where title ='Casablanca'
Q6
select name 
from actor
join casting on actor.id = casting.actorid
where movieid=(select id
from movie
where title ='Casablanca')


Q7
select name 
from actor
join casting on actor.id = casting.actorid
where movieid=(select id
from movie
where title ='Alien')
Q8
select title 
from movie
join casting on movie.id = casting.movieid
where actorid=
(select id
from actor
where name='Harrison Ford')
Q9
select title 
from movie
join casting on movie.id = casting.movieid
where actorid=
(select id
from actor
where name='Harrison Ford')
and ord!=1
Q10
select title, name
from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where casting.ord=1 and yr = 1962

Q11
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
Q12
select title, name from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where movie.id in(
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
and casting.ord=1
Q13
select name
from movie
join casting on movie.id = casting.movieid
join actor on casting.actorid = actor.id
where ord=1
group by name
having count(name)>=30
Q14
select title, count(actorid) from movie
join casting on movie.id = casting.movieid
where yr =1978
group by title
order by count(actorid) DESC, title

Q15
select distinct name
from actor
join casting on actor.id = casting.actorid
where movieid in
(select movieid
from casting
join actor on casting.actorid = actor.id
where name = 'Art Garfunkel')
and name != 'Art Garfunkel'
alternate answer
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

exercise 8
Q1
select name 
from teacher
where dept is null
exercise 8+ numeric eg
Q1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

Q2
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >=100

Q3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'
Q4
select subject, sum(response)
from nss
where
question ='Q22'
and 
(subject ='(8) Computer Science' 
or
subject = '(H) Creative Arts and Design')
group by subject
Q5
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

Q6

Q7
select institution, round(avg(score),0)
from nss
where
institution like '%Manchester%'
and question ='Q22'
group by institution
Q8



Exercise 9 Self Join
Q1
select count(id) 
from stops

Q2
select id 
from stops
where 
name = 'Craiglockhart'

Q3
select id, name 
from stops
join route on stops.id = route.stop
where
route.company ='LRT'
and
route.num =4
Q4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2
Q5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop in(
select id 
from stops
where name='London Road')

Q6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

Q7
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop =137

Q8
select a.company, a.num
from route a 
join route b on (a.company = b.company and a.num=b.num)
join stops x on (a.stop = x.id)
join stops y on (b.stop = y.id)
where 
x.name = 'Craiglockhart' and y.name ='Tollcross'

Q9
select distinct y.name, b.company, b.num
from route a
join route b on a.company = b.company and a.num = b.num
join stops x on a.stop = x.id
join stops y on b.stop = y.id
where
a.company ='LRT'
and x.name = 'Craiglockhart'

Q10




