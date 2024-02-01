---Welcome to Cyberspace! Cyberchase is an animated, educational kid’s television series, aired by the United States’ Public Broadcasting Service (PBS) since 2002. Originally designed to “show kids that math is everywhere and everyone can be good at it,” the world of Cyberchase centers on Jackie, Matt, and Inez as they team up with Digit—a “cybird”—to stop Hacker from taking over Cyberspace and infecting Motherboard. Along the way, the quartet learn math, science, and problem-solving skills to thwart Hacker in his attempts.

--- Code Sources : wget https://cdn.cs50.net/sql/2023/x/psets/0/cyberchase.zip
--- In the episodes table, you’ll find the following columns:
---id, which uniquely identifies each row (episode) in the table
---season, which is the season number in which the episode aired
---episode_in_season, which is the episode’s number within its given season
---title, which is the episode’s title
---topic, which identifies the ideas the episode aimed to teach
---air_date, which is the date (expressed as YYYY-MM-DD) on which the episode “aired” (i.e., was published)
---production_code, which is the unique ID used by PBS to refer to each episode internally 

--- list the titles of all episodes in Cyberchase’s original season, Season 1
SELECT "title" FROM "episodes"
WHERE "season" = 1 ;

--- list the season number of, and title of, the first episode of every season
SELECT "season","title" FROM "episodes"
WHERE "episode_in_season" = 1 ;

--- find the production code for the episode “Hackerized!”
SELECT "production_code" FROM "episodes"
WHERE "title" LIKE '%Hackerized!%' ;

---find the titles of episodes that do not yet have a listed topic
SELECT "title" FROM "episodes"
WHERE "topic" IS NULL ;

---find the title of the holiday episode that aired on December 31st, 2004.
SELECT "title" FROM "episodes"
WHERE "air_date" LIKE '2004-12-31'  ;

---list the titles of episodes from season 6 (2008) that were released early, in 2007.
SELECT "title" FROM "episodes"
WHERE "season" = 6 AND "air_date" LIKE '%2007%' ;

---list the titles and topics of all episodes teaching fractions
SELECT "title","topic" FROM "episodes"
WHERE "topic" LIKE '%fraction%' ;

---counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.
SELECT COUNT("air_date") FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31' ;

---counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.
SELECT COUNT("air_date") FROM "episodes"
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31' ;

---list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.
SELECT "id","title","production_code" FROM "episodes"
ORDER BY "production_code" ;

---list the titles of episodes from season 5, in reverse alphabetical order
SELECT "title" FROM "episodes"
WHERE "season" = 5 ORDER BY "title" DESC ;

---count the number of unique episode titles
SELECT COUNT (DISTINCT "title") FROM "episodes" ;
