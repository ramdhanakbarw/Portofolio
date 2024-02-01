CREATE TABLE Users (
    "id" INTEGER,
    "First_Name" TEXT,
    "Last_Name" TEXT,
    "Username" TEXT,
    "Password" TEXT,
    PRIMARY KEY("id")
) ;

CREATE TABLE Schools (
    "id" INTEGER,
    "Name" TEXT,
    "Type" TEXT,
    "Location" TEXT,
    "Year" INTEGER,
    PRIMARY KEY ("id")
) ;

CREATE TABLE Companies (
    "id" INTEGER,
    "Name" TEXT,
    "Industry" TEXT,
    "Location" TEXT,
    PRIMARY KEY ("id")
) ;

CREATE TABLE User_Connections (
    "User1_id" INTEGER,
    "User2_id" INTEGER,
    PRIMARY KEY ("User1_id","User2_id"),
    FOREIGN KEY ("User1_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("User2_id") REFERENCES "Users"("id")
) ;

CREATE TABLE School_Connections (
    "User_id" TEXT,
    "School_id" TEXT,
    "Start" DATE,
    "End" DATE,
    "Degree" TEXT,
    PRIMARY KEY ("User_id","School_id"),
    FOREIGN KEY ("User_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("School_id") REFERENCES "Schools"("id")
) ;

CREATE TABLE Company_Connections (
    "User_id" TEXT,
    "Company_id" TEXT,
    "Start" DATE,
    "End" DATE,
    "Title" TEXT,
    PRIMARY KEY ("User_id","Company_id"),
    FOREIGN KEY ("User_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("Company_id") REFERENCES "Companies"("id")
) ;
