CREATE TABLE Costumers (
    "id" INTEGER,
    "First_name" TEXT,
    "Last_name" TEXT,
    "History_order" INTEGER,
    PRIMARY KEY("id","History_order")
    FOREIGN KEY ("History_order") REFERENCES "Orders"("id")
) ;

CREATE TABLE Ingredients (
    "id" INTEGER,
    "Name" TEXT,
    "Unit" TEXT,
    "Price" INTEGER,
    PRIMARY KEY("id")
) ;

CREATE TABLE Donuts (
    "id" INTEGER,
    "Name" TEXT,
    "Type" TEXT CHECK("Type" IN ('gluten free', 'not gluten free')),
    "Price" INTEGER,
    "Ingredient_id" INTEGER,
    PRIMARY KEY("id", "Ingredient_id"),
    FOREIGN KEY("Ingredient_id") REFERENCES "Ingredients"("id")
) ;

CREATE TABLE Orders (
    "id" INTEGER,
    "Number" INTEGER,
    "Item_id" TEXT,
    "Costumer_id" INTEGER,
    PRIMARY KEY("id","Item_id","Costumer_id")
    FOREIGN KEY ("Item_id") REFERENCES "Donuts"("id")
    FOREIGN KEY ("Costumer_id") REFERENCES "Costumers"("id")
) ;
