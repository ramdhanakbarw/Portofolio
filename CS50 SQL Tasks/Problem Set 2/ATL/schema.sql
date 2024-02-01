CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
) ;

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourses" TEXT,
    PRIMARY KEY("id")
) ;

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_Id" TEXT NOT NULL,
    "code_airport_departing" TEXT NOT NULL,
    "code_airport_heading_to" TEXT NOT NULL,
    "departure_datetime" DATETIME,
    "arrival_datetime" DATETIME,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
) ;

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "datetime" DATETIME,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
) ;
