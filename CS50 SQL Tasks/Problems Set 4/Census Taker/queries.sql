---create a view named by_district. This view should contain the sums for each numeric column in census, grouped by district. Ensure the view contains each of the following columns:
---district, which is the name of the district.
---families, which is the total number of families in the district.
---households, which is the total number of households in the district.
---population, which is the total population of the district.
---male, which is the total number of people identifying as male in the district.
---female, which is the total number of people identifying as female in the district.
CREATE VIEW "by_district" AS
SELECT "district", SUM("families") AS "families",SUM("households"),SUM("population"),
SUM("male"),SUM("female")
FROM "census"
GROUP BY "district" ;

---create a view named most_populated. This view should contain, in order from greatest to least, the most populated districts in Nepal. Ensure the view contains each of the following columns:
---district, which is the name of the district.
---families, which is the total number of families in the district.
---households, which is the total number of households in the district.
---population, which is the total population of the district.
---male, which is the total number of people identifying as male in the district.
---female, which is the total number of people identifying as female in the district.
CREATE VIEW "most_populated" AS
SELECT "district","families","households","population","male","female"
FROM "census"
ORDER BY "population" DESC;

---Create a view named rural. This view should contain all census records relating to a rural municipality (identified by including “rural” in their name). 
---Ensure the view contains all of the columns from the census table.
CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" LIKE '%rural%' ;

---create a view named total. This view should contain the sums for each numeric column in census, across all districts and localities. Ensure the view contains each of the following columns:
---families, which is the sum of families from every locality in Nepal.
---households, which is the sum of households from every locality in Nepal.
---population, which is the sum of the population from every locality in Nepal.
---male, which is the sum of people identifying as male from every locality in Nepal.
---female, which is the sum of people identifying as female from every locality in Nepal.
CREATE VIEW "total" AS
SELECT SUM("families"),SUM("households") AS "households",SUM("population"),
SUM("male"),SUM("female") FROM "census";
