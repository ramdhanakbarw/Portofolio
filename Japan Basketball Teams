---select athlete 3x3 basketball from japan---
SELECT * FROM olympics.athletes
WHERE NOC = 'Japan' AND Discipline LIKE '%3X3 Basketball%'
ORDER BY Discipline ;

---seperate men and women teams in 3x3 baskerball japan teams
SELECT name, NOC, Discipline,
CASE
    WHEN Name = 'BROWN IRA' THEN "Men's Team"
    WHEN Name = 'MAWULI STEPHANIE' THEN "Women's Team"
    WHEN Name = 'NISHIOKA RISA' THEN "Women's Team"
    WHEN Name = 'OCHIAI TOMOYA' THEN "Men's Team"
    WHEN Name = 'SHINOZAKI MIO' THEN "Women's Team"
    WHEN Name = 'TOMINAGA KEISEI' THEN "Men's Team"
    WHEN Name = 'YAMAMOTO MAI' THEN "Women's Team"
    ELSE "Men's Team"
END as discipline_teams
FROM olympics.athletes
WHERE NOC = 'Japan' AND Discipline LIKE '%3x3 Basketball%'
ORDER BY discipline_teams, name ;

---select japan basketball athlete
SELECT * FROM olympics.coaches
WHERE NOC = 'Japan' AND Discipline = 'Basketball'
ORDER BY Discipline, Name ;

---create japan basketball mens team
CREATE TABLE `Japan Mens Basketball Team` (
    `name` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL
    `number` INT
    ) ;

---insert a values to Japan Mens Basketball Team
INSERT INTO `Japan Mens Basketball Team` VALUES ('TOGASHI YUKI','Point Guard','2');
INSERT INTO `Japan Mens Basketball Team` VALUES ('HIEJIMA MAKOTO','Shooting Guard','6');
INSERT INTO `Japan Mens Basketball Team` VALUES ('HACHIMURA RUI','Small Forward','8');
INSERT INTO `Japan Mens Basketball Team` VALUES ('VANDRAME LEO','Point Guard','9');
INSERT INTO `Japan Mens Basketball Team` VALUES ('TANAKA DAIKI','Shooting Guard','24');
INSERT INTO `Japan Mens Basketball Team` VALUES ('SCHAFER AVI KOKI','Center','32');
INSERT INTO `Japan Mens Basketball Team` VALUES ('WATANABE HUGH','Power Forward','34');
INSERT INTO `Japan Mens Basketball Team` VALUES ('HARIMOTO TENKETSU','Small Forward','88');
INSERT INTO `Japan Mens Basketball Team` VALUES ('WATANABE YUTA','Small Forward','12');
INSERT INTO `Japan Mens Basketball Team` VALUES ('KANAMARU KOSUKE','Shooting Guard','14');
INSERT INTO `Japan Mens Basketball Team` VALUES ('BABA YUDAI','Small Forward','18');
INSERT INTO `Japan Mens Basketball Team` VALUES ('EDWARDS GAVIN EARL','Power Forward','23');
INSERT INTO `Japan Mens Basketball Team` VALUES ('LAMAS JULIO','Coach','0');

---create a view to sepearate men and women teams in basketball japan teams
CREATE VIEW `Japan Basketball Teams` AS 
SELECT name, NOC, Discipline,
CASE
    WHEN Name = 'TOGASHI YUKI' THEN "Men's Team"
    WHEN Name = 'HIEJIMA MAKOTO' THEN "Men's Team"
    WHEN Name = 'WATANABE YUTA' THEN "Men's Team"
    WHEN Name = 'KANAMARU KOSUKE' THEN "Men's Team"
    WHEN Name = 'BABA YUDAI' THEN "Men's Team"
    WHEN Name = 'EDWARDS GAVIN EARL' THEN "Men's Team"
    WHEN Name = 'HACHIMURA RUI' THEN "Men's Team"
    WHEN Name = 'VENDRAME LEO' THEN "Men's Team"
    WHEN Name = 'TANAKA DAIKI' THEN "Men's Team"
    WHEN Name = 'SCHAFER AVI KOKI' THEN "Men's Team"
    WHEN Name = 'WATANABE HUGH' THEN "Men's Team"
    WHEN Name = 'HARIMOTO TENKETSU' THEN "Men's Team"
    ELSE "Women's Team"
END AS discipline_teams
FROM olympics.athletes
WHERE NOC = 'Japan' AND Discipline = 'Basketball'
ORDER BY name ;

---show all women basketball team from japan
SELECT * FROM `Japan Basketball Teams`
WHERE discipline_teams = "Women's Teams"
ORDER BY name ;
