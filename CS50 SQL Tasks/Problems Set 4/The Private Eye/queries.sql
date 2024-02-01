CREATE TABLE "triplets" (
    "sentence_id" INTEGER,
    "character_number" INTEGER,
    "lenght" INTEGER
) ;

INSERT INTO "triplets" ("sentence_id","character_number","lenght") VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5)
;

CREATE VIEW "message" AS
SELECT substr("sentence","character_number","lenght") AS "phrase" FROM "triplets"
JOIN "sentences" ON "sentences"."id" = "triplets"."sentence_id" ;
