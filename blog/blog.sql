-- blog.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)
-- THP W5D2
--          How to use this file?
--          1) Copy this SQL script file into your (SQLite3 DB) desired directory
--          2) Run SQLite 3 with a "sqlite3 <db name>" command
--          3) Once in SQLite3 interactive mode, type ".read blog.sql"
--          4) Enjoy ;-)

.shell clear
.shell echo
.shell echo "BEGINNING OF 'Blog' SQL SCRIPT"
.shell echo

/****************/
/* DROP SECTION */
/****************/

-- Uncomment to suppress all tables (and their content) from the 'blog' scheme before (re)creating them below
.shell echo
.shell echo "DROP SECTION"
.shell echo
DROP TABLE IF EXISTS `category_tag`;
DROP TABLE IF EXISTS `article_category`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `user`;

/******************/
/* DELETE SECTION */
/******************/

-- Uncomment to suppress all tables' content while keeping the overall structure of the 'blog' scheme
-- .shell echo "DELETE SECTION"
-- DELETE FROM `category_tag`;
-- DELETE FROM `article_category`;
-- DELETE FROM `tag`;
-- DELETE FROM `category`;
-- DELETE FROM `article`;
-- DELETE FROM `user`;

/**************************/
/* TABLE CREATION SECTION */
/**************************/

.shell echo
.shell echo "TABLE CREATION SECTION"
.shell echo

-- Creation of the "user" table
CREATE TABLE IF NOT EXISTS `user` (
`user_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`firstname` TEXT,
`lastname` TEXT,
`nickname` TEXT,
`age` INTEGER,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "article" table
CREATE TABLE IF NOT EXISTS `article` (
`article_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`user_id` INTEGER REFERENCES user(user_id) ON UPDATE CASCADE,
`title` TEXT,
`content` TEXT,
`date` DATE,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "category" table
CREATE TABLE IF NOT EXISTS `category` (
`category_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`name` TEXT,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "tag" table
CREATE TABLE IF NOT EXISTS `tag` (
`tag_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`name` TEXT,
`color` TEXT,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "article_category" table
-- Linking article and category via a "(1..n, 0..n)" relation
CREATE TABLE IF NOT EXISTS `article_category` (
`article_category_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`article_id` INTEGER REFERENCES article(article_id) ON UPDATE CASCADE,
`category_id` INTEGER REFERENCES category(category_id) ON UPDATE CASCADE,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "category_tag" table
-- Linking category and tag via a "(1..n, 0..n)" relation
CREATE TABLE IF NOT EXISTS `category_tag` (
`category_tag_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`category_id` INTEGER REFERENCES category(category_id) ON UPDATE CASCADE,
`tag_id` INTEGER REFERENCES tag(tag_id) ON UPDATE CASCADE,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

/**************************/
/* DATA INSERTION SECTION */
/**************************/

.shell echo
.shell echo "DATA INSERTION SECTION"
.shell echo

-- Loading the 'user' table
INSERT INTO `user` (`firstname`,`lastname`,`nickname`,`age`) VALUES ("Jean-Baptiste","VIDAL","GibbZ",43);
INSERT INTO `user` (`firstname`,`lastname`,`nickname`,`age`) VALUES ("Valérie-Anne","DELAIDDE","Valy",44);
INSERT INTO `user` (`firstname`,`lastname`,`nickname`,`age`) VALUES ("Lucie","VIDAL-DELAIDDE","Lulu",7);
INSERT INTO `user` (`firstname`,`lastname`,`nickname`,`age`) VALUES ("Enguerrand","JORE","Engue",38);
INSERT INTO `user` (`firstname`,`lastname`,`nickname`,`age`) VALUES ("Stéphanie","BRAULT","Steph",40);

-- Loading the 'article' table
INSERT INTO `article` (`user_id`,`title`,`content`,`date`) VALUES (1,"My very 1st article","This is the content of my very first article. What do you think about it?",datetime("2022-02-08 17:00:00"));
INSERT INTO `article` (`user_id`,`title`,`content`,`date`) VALUES (1,"My 2nd article","This is the content of my 2nd and last article ever. I don't car what you may think about it?",datetime("2022-02-08 17:00:01"));
INSERT INTO `article` (`user_id`,`title`,`content`,`date`) VALUES (1,"My 3rd article","OK, I know I said I would never write an article again but, hey, need to make a living, you know.",datetime("2022-02-08 17:00:02"));
INSERT INTO `article` (`user_id`,`title`,`content`,`date`) VALUES (2,"Valy's best article ever","Yes, not only is she a brilliant psychologist but Valy also writes articles!",datetime("2022-02-08 17:00:03"));
INSERT INTO `article` (`user_id`,`title`,`content`,`date`) VALUES (5,"Stephanie's 1st and lats article","Just trying my luck... Don't want to be a f******g journalist!",datetime("2022-02-08 17:00:04"));

-- Loading the 'category' table
INSERT INTO `category` (`name`) VALUES ("Sciences");
INSERT INTO `category` (`name`) VALUES ("Politics");
INSERT INTO `category` (`name`) VALUES ("Finance");
INSERT INTO `category` (`name`) VALUES ("Society");
INSERT INTO `category` (`name`) VALUES ("Daily News");
INSERT INTO `category` (`name`) VALUES ("Gossips");

-- Loading the 'tag' table
INSERT INTO `tag` (`name`,`color`) VALUES ("#biology","green");               -- To be linked to category "Sciences"
INSERT INTO `tag` (`name`,`color`) VALUES ("#physics","light green");         -- To be linked to category "Sciences"
INSERT INTO `tag` (`name`,`color`) VALUES ("#mathematics","dark green");      -- To be linked to category "Sciences"
INSERT INTO `tag` (`name`,`color`) VALUES ("#equitymarkets","blue");          -- To be linked to category "Finance"
INSERT INTO `tag` (`name`,`color`) VALUES ("#realestate","light blue");       -- To be linked to category "Finance"
INSERT INTO `tag` (`name`,`color`) VALUES ("#cryptocurrencies","dark blue");  -- To be linked to category "Finance"
INSERT INTO `tag` (`name`,`color`) VALUES ("#nationalhealthsystem","yellow"); -- To be linked to category "Society"
INSERT INTO `tag` (`name`,`color`) VALUES ("#starsystem","red");              -- To be linked to category "Gossips"
INSERT INTO `tag` (`name`,`color`) VALUES ("#kpop","light red");              -- To be linked to category "Gossips"
INSERT INTO `tag` (`name`,`color`) VALUES ("#varietefrancaise","dark red");   -- To be linked to category "Gossips"

-- Loading the 'article_category' table
INSERT INTO `article_category` (`article_id`,`category_id`) VALUES (1,1);     -- Article #1 is from Category "Sciences"
INSERT INTO `article_category` (`article_id`,`category_id`) VALUES (2,1);     -- Article #2 is from Category "Sciences"
INSERT INTO `article_category` (`article_id`,`category_id`) VALUES (3,3);     -- Article #3 is from Category "Finance"
INSERT INTO `article_category` (`article_id`,`category_id`) VALUES (4,5);     -- Article #4 is from Category "Gossips"
INSERT INTO `article_category` (`article_id`,`category_id`) VALUES (5,5);     -- Article #5 is from Category "Gossips"

-- Loading the 'category_tag' table
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (1,1);     -- Category "Sciences" is linked to tag "#biology"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (1,2);     -- "Sciences" is linked to "#physics"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (1,3);     -- "Sciences" is linked to "#mathematics"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (3,4);     -- "Finance" ... "#equitymarkets" 
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (3,5);     -- "Finance" ... "#realestate"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (3,6);     -- "Finance" ... "#cryptocurrencies"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (4,7);     -- "Finance" ... "#cryptocurrencies"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (6,8);     -- "Gossips" ... "#starsystem"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (6,9);     -- "Gossips" ... "#kpop"
INSERT INTO `category_tag` (`category_id`,`tag_id`) VALUES (6,10);    -- "Gossips" ... "#varietefrancaise"

-- "Validating" all previous SQL commands
-- COMMIT;

-- SQLite3 specific CLi commands
.mode column
.headers on
.width 20 20 20 20 20 20 20 20 20 20

/**************************/
/* DATA SELECTION SECTION */
/**************************/

.shell echo
.shell echo "DATA SELECTION SECTION"
.shell echo

-- Simple selection to display tables content
.shell echo
.shell echo "[ user TABLE ]"
SELECT * FROM user;

.shell echo
.shell echo "[ article TABLE ]"
SELECT * FROM article;

.shell echo
.shell echo "[ category TABLE ]"
SELECT * from category;

.shell echo
.shell echo "[ tag TABLE ]"
SELECT * from tag;

.shell echo

.shell echo
.shell echo "[ user with at least 1 article ]"
.shell echo
SELECT user.firstname || " " || user.lastname AS 'Writer', article.title AS 'Title', article.content AS 'Article', article.date AS 'Issue date'
FROM user, article
WHERE article.user_id = user.user_id;

.shell echo
.shell echo "[ user whos wrote article(s) tagged with '#biology'(1)]"
.shell echo
SELECT user.firstname || " " || user.lastname AS 'Writer', 
       article.title || " (" || article.date || ")" AS 'Article (issue date)', 
       category.name AS 'Category',
       tag.name || " (" || tag.color || ")" AS 'Tag (color)'
FROM user, article, category, tag, article_category, category_tag
WHERE tag.tag_id = (SELECT tmp_table.tag_id FROM tag AS tmp_table WHERE tmp_table.name = "#biology") -- Just for demo purposes, would be simplier with 'tag.tag_id = 1'
AND article.user_id = user.user_id 
AND article.article_id = article_category.article_id 
AND category.category_id = article_category.category_id 
AND category.category_id = category_tag.category_id 
AND tag.tag_id = category_tag.tag_id;

.shell echo
.shell echo "END OF 'Blog' SQL SCRIPT"
.shell echo
.shell echo

-- blog.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)