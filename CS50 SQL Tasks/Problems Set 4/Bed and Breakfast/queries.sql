---This view should contain all dates that are available at all listings. Ensure the view contains the following columns:
---id, which is the id of the listing from the listings table.
---property_type, from the listings table.
---host_name, from the listings table.
---date, from the availabilities table, which is the date of the availability.
CREATE VIEW "available" AS
SELECT "listings"."id","property_type","host_name","date" FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE "available" = "TRUE" ;

---This view should contain the 100 most frequently reviewed listings, sorted from most- to least-frequently reviewed. Ensure the view contains the following columns:
---id, which is the id of the listing from the listings table.
---property_type, from the listings table.
---host_name, from the listings table.
---reviews, which is the number of reviews the listing has received.
CREATE VIEW "frequently_reviewed" AS 
SELECT "listings"."id","property_type","host_name" FROM "listings"
JOIN "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
ORDER BY COUNT("listing_id") DESC,"property_type","host_name" LIMIT 100 ;

---This view should contain all listings and the number of days in June of 2023 that they remained vacant. Ensure the view contains the following columns:
---id, which is the id of the listing from the listings table.
---property_type, from the listings table.
---host_name, from the listings table.
---days_vacant, which is the number of days in June of 2023, that the given listing was marked as available.
CREATE VIEW "june_vacancies" AS
SELECT "listings"."id","property_type","host_name",COUNT("date") FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE ("date" BETWEEN '2023-06-01' AND '2023-06-30')
AND "available" = "TRUE"
GROUP BY "listings"."id" ;

--- create a view named no_descriptions that includes all of the columns in the listings table except for description.
CREATE VIEW "no_descriptions" AS
SELECT "id","property_type","host_name","accommodates","bedrooms" FROM "listings";

---This view should contain all listings that have exactly one bedroom. Ensure the view contains the following columns:
---id, which is the id of the listing from the listings table.
---property_type, from the listings table.
---host_name, from the listings table.
---accommodates, from the listings table.
CREATE VIEW "one_bedrooms" AS
SELECT "id","property_type","host_name","accommodates" FROM "listings"
WHERE "bedrooms" = 1 ;
