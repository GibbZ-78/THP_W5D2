-- moocacademy.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)
-- THP W5D2
--          How to use this file?
--          1) Copy this SQL script file into your (SQLite3 DB) desired directory
--          2) Run SQLite 3 with a "sqlite3 <db name>" command
--          3) Once in SQLite3 interactive mode, type ".read blog.sql"
--          4) Enjoy ;-)

.shell clear
.shell echo
.shell echo "BEGINNING OF 'MOOCacademy' SQL SCRIPT"
.shell echo

/****************/
/* DROP SECTION */
/****************/

-- Uncomment to suppress all tables (and their content) from the 'blog' scheme before (re)creating them below
.shell echo
.shell echo "DROP SECTION"
.shell echo
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `lesson`;

/**************************/
/* TABLE CREATION SECTION */
/**************************/

.shell echo
.shell echo "TABLE CREATION SECTION"
.shell echo

-- Creation of the "course" table
CREATE TABLE IF NOT EXISTS `course` (
`course_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`title` TEXT,
`description` TEXT,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creation of the "lesson" table
-- Linking course and lesson via a "(1..n, 1..1)" relation
-- NB: pedagogical content does not detail if a lesson can be (re)used on serveral courses
--     hence asserting a lesson is part of 1 and only course. In case of a (1..n, 0..n) relation
--     and intermediary 'realtion table' would be mandatory
CREATE TABLE IF NOT EXISTS `lesson` (
`lesson_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`course_id` INTEGER REFERENCES course(course_id) ON UPDATE CASCADE,
`title` TEXT,
`body` TEXT,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

/**************************/
/* DATA INSERTION SECTION */
/**************************/

.shell echo
.shell echo "DATA INSERTION SECTION"
.shell echo

-- Loading the 'course' table
INSERT INTO `course` (`title`,`description`) VALUES ("Course #1 - Ruby","Learn Ruby and Rails from scratch in 6 months.");
INSERT INTO `course` (`title`,`description`) VALUES ("Course #2 - Python","Upgrade your Python mastery to embrace advance data analysis.");
INSERT INTO `course` (`title`,`description`) VALUES ("Course #3 - Turbo Pascal","What about learning algorithms with a good ol' colid language?");
INSERT INTO `course` (`title`,`description`) VALUES ("Course #4 - Assembly programming","Who still want to code in assmebly nowadays...?");

-- Loading the 'lesson' table
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (1,"Ruby 101","All what you need to start learning Ruby programming.");    
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (1,"Advanced Ruby","Upgrade your Python skills from apprentice to Jedi.");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (1,"Rails","The wellknown gem from A to Z");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (2,"Python 101","Learn Python from scratch.");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (2,"Advanced Python","Python for advanced coders or coders switching from another language.");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (2,"Django for lamers","Build up on your Python skills to learn about its windows to the web!");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (2,"Data analysis with Python","K-means algorithm will unveil their power just for you ;-)");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (2,"Data visualization with Python","Build and maintain nice data viz with Python dedicated libs.");
INSERT INTO `lesson` (`course_id`,`title`,`body`) VALUES (3,"Coding games with Turbo Pascal 3.0","Learn TP basics, gfx, interruptions, mouse management... And more!");

-- "Validating" all previous SQL commands (uncomment if any useful)
-- COMMIT;

-- SQLite3 specific CLI commands
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
.shell echo "[ course TABLE ]"
SELECT * FROM course;

.shell echo
.shell echo "[ lesson TABLE ]"
SELECT * FROM lesson;

.shell echo

.shell echo
.shell echo "[ course(s) with all their respective lessons ]"
.shell echo
SELECT course.course_id AS 'COURSE NR.',
       course.title AS 'CURRICULUM NAME',
       course.description AS 'DESCRIPTION',
       course.update_time AS 'LAST UPDATED ON',
       lesson.lesson_id AS 'LECTURE NR.',
       lesson.title AS 'LECTURE TITLE',
       lesson.body AS 'LECTURE CONTENT'
FROM course, lesson
WHERE course.course_id = lesson.course_id;

.shell echo
.shell echo "[ course(s) with no lesson yet ]"
.shell echo
SELECT course.course_id AS "COURSE NR.",
       course.title AS 'CURRICULUM NAME',
       course.description AS 'DESCRIPTION',
       course.update_time AS 'LAST UPDATED ON',
       course.create_time AS 'CREATED ON'
FROM course
WHERE (SELECT COUNT(*) FROM lesson tmp1 where tmp1.course_id = course.course_id) = 0;

.shell echo
.shell echo "END OF 'MOOCacademy' SQL SCRIPT"
.shell echo
.shell echo

-- moocacademy.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)
