---find the average player salary by year
---Sort by year in descending order
---Round the salary to two decimal places
---call the column “average salary”
SELECT "year", ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year" ORDER BY "year" DESC ;

--- find Cal Ripken Jr.’s salary history
---Sort by year in descending order
SELECT "year","salary" FROM "salaries"
JOIN "players" ON "salaries"."player_id" = "players"."id"
WHERE ("first_name" = "Cal") AND "last_name" LIKE '%Ripken%'
ORDER BY "year" DESC ;

---find Ken Griffey Jr.’s home run history (This Ken Griffey was born in 1969)
---Sort by year in descending order
SELECT "year","HR" FROM "performances"
JOIN "players" ON "performances"."player_id" = "players"."id"
WHERE ("first_name" = "Ken") AND ("birth_year" = "1969") AND "last_name" LIKE '%Griffey%'
ORDER BY "year" DESC ;

---find the 50 players paid the least in 2001 
---Sort players by salary, lowest to highest.
---If two players have the same salary, sort alphabetically by first name and then by last name.
---If two players have the same first and last name, sort by player ID
SELECT "first_name","last_name","salary" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "year" = "2001"
ORDER BY "salary" ASC, "first_name","last_name" LIMIT 50 ;

--- find all teams that Satchel Paige played for.
SELECT "name" FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "players"."first_name" = "Satchel" ;

---return the top 5 teams, sorted by the total number of hits by players in 2001.
---Call the column representing total hits by players in 2001 “total hits”.
---Sort by total hits, highest to lowest.
SELECT "name", SUM("H") AS "total hits" FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = "2001"
GROUP BY "performances"."team_id"
ORDER BY "total hits" DESC LIMIT 5 ;

---find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
SELECT "first_name","last_name" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
ORDER BY "salary" DESC LIMIT 1;

---find the 2001 salary of the player who hit the most home runs in 2001.
SELECT "salary" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = "2001"
ORDER BY "performances"."HR" DESC LIMIT 1 ;

---find the 5 lowest paying teams (by average salary) in 2001.
---Round the average salary column to two decimal places and call it “average salary”.
---Sort the teams by average salary, least to greatest.
SELECT "name", ROUND(AVG("salary"), 2) AS "Average Salary" FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = "2001"
GROUP BY "teams"."id"
ORDER BY "Average Salary" LIMIT 5;

---The general manager has asked you for a report which details each player’s name, their salary for each year they’ve been playing, and their number of home runs for each year they’ve been playing
---the table should include: player’s first names,last names,salaries,home runs, and the year in which the player was paid that salary and hit those home runs
SELECT "salary","first_name","last_name","HR","performances"."year"
FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id" AND "performances"."year" = "salaries"."year"
ORDER BY "players"."id","salaries"."year" DESC, "HR" DESC, "salary" DESC ;

---find the 10 least expensive players per hit in 2001.
SELECT "first_name","last_name","salary"/"H" AS "dollars per hit"
FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id" AND "performances"."year" = "salaries"."year"
WHERE "performances"."year" = 2001 AND "H" > 0
ORDER BY "dollars per hit","first_name","last_name" LIMIT 10 ;

---find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
SELECT "first_name","last_name" FROM (
    SELECT "first_name","last_name","id" FROM(
        SELECT "first_name","last_name","players"."id" AS "id"
        FROM "performances"
        JOIN "players" ON "players"."id" = "performances"."player_id"
        JOIN "salaries" ON "salaries"."player_id" = "players"."id" AND "performances"."year" = "salaries"."year"
        WHERE "performances"."year" = 2001 AND "H" > 0
        ORDER BY "salary"/"H" LIMIT 10 )
INTERSECT
SELECT "first_name","last_name","id" FROM (
    SELECT "first_name","last_name","players"."id" AS "id"
    FROM "performances"
    JOIN "players" ON "players"."id" = "performances"."player_id"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id" AND "performances"."year" = "salaries"."year"
    WHERE "performances"."year" = 2001 AND "RBI" > 0
    ORDER BY "salary"/"RBI" LIMIT 10 )
)
ORDER BY "id" ;
