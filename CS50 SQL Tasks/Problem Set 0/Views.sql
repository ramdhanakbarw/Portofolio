---From 1830 to 1832, the Japanese artist Katsushika Hokusai created 36 woodblock prints depicting 36 different views of Mount Fuji, a volcano on the Honshū island of Japan. Among the series’ most famous works are Fine Wind, Clear Morning and The Great Wave off Kanagawa. The prints became so influential that another Japanese artist of the time period—Utagawa Hiroshige—created his own series of 36 prints, each depicting a new view of Fuji.

---In views.db, you’ll find details on the 36 prints created, respectively, by Hokusai and Hiroshige. In total, you’ll have data on 72 prints. Prints like these tend to be appreciated for their aesthetics, not their statistics, but computer science now helps create additional numeric insights about artwork. In addition to each print’s title and author, you’ll find some statistics commonly used in computational image analysis: the print’s average color, its brightness, its contrast, and its entropy. 

---sources code : wget https://cdn.cs50.net/sql/2023/x/psets/0/views.zip

---In the views table, you’ll find the following columns:
---id, which uniquely identifies each row (print) in the table
---print_number, which identifies the number of the print in either Hokusai’s or Hiroshige’s series
---english_title, which is the English title of the print
---japanese_title, which is the Japanese title of the print
---artist, which is the last name of the print’s artist
---average_color, which is the hexadecimal representation of the color found by averaging the colors of each pixel in the image
---brightness, which is a number corresponding to the overall lightness or darkness of the image
---contrast, which is a number representing the extent of the difference between light and dark areas of the image
---entropy, which is a measure used to quantify the complexity of the artwork

---a translator might take interest in: list, side by side, the Japanese title and the English title for each print. Ensure the Japanese title is the first column, followed by the English title
SELECT "english_title","japanese_title" FROM "views" ;

---list the average colors of prints by Hokusai that include “river” in the English title. (As an aside, do they have any hint of blue?)
SELECT "average_color" FROM "views"
WHERE ("artist" = "Hokusai") AND "english_title" LIKE '%river%' ;

---count how many prints by Hokusai include “Fuji” in the English title. 
SELECT COUNT("print_number") FROM "views"
WHERE ("artist" = "Hokusai") AND "english_title" LIKE '%fuji%' ;

---count how many prints by Hiroshige have English titles that refer to the “Eastern Capital”. Hiroshige’s prints were created in Japan’s “Edo period,” referencing the eastern capital city of Edo, now Tokyo.
SELECT COUNT("print_number") FROM "views"
WHERE ("artist" = "Hiroshige")
AND "english_title" LIKE '%Eastern Capital%' ;

---find the highest contrast value of prints by Hokusai. Name the column “Maximum Contrast”. 
SELECT MAX ("contrast") AS "Maximum Contrast" FROM "views"
WHERE ("artist" = "Hokusai")  ;

---find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.
SELECT ROUND (AVG("entropy"), 2)
AS "Hiroshige Average Entropy"
FROM "views"
WHERE "artist" = 'Hiroshige' ;

---list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
SELECT "english_title" FROM "views"
WHERE "artist" = "Hiroshige"
ORDER BY "brightness" DESC LIMIT 5 ;

---list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.
SELECT "english_title" FROM "views"
WHERE "artist" = "Hokusai"
ORDER BY "contrast" ASC LIMIT 5 ;

---find the English title and artist of the print with the highest brightness
SELECT "english_title","artist" FROM "views"
ORDER BY "brightness" DESC LIMIT 1 ;

---find the top 10 most print by Hiroshige
SELECT "english_title" AS "Top 10 Most Print Number by Hiroshige"
FROM "views"
WHERE ("artist" = "Hiroshige")
ORDER BY "print_number" DESC LIMIT 10 ;
