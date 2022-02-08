-- doctors.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)
-- THP W5D2
--          How to use this file? 
--          1) Copy this SQL script file into your (SQLite3 DB) desired directory
--          2) Run SQLite 3 with a "sqlite3 <db name>" command
--          3) Once in SQLite3 interactive mode, type ".read doctors.sql"
--          4) Enjoy ;-)

-- Flushing Stdio / Display:0
.shell clear

-- Uncomment bewlo lines to suppress 'doctors' table (and its content) from the current db scheme
.shell echo
.shell echo "[ DROP ] Suppressing 'doctors' table with all its content"
.shell echo
DROP TABLE IF EXISTS `doctors`;

-- Creation of the "doctors" table
.shell echo
.shell echo "[ CREATE ] Instantiating the 'doctors' table structure"
.shell echo
CREATE TABLE `doctors` (
`id` INTEGER PRIMARY KEY AUTOINCREMENT,
`name` TEXT,
`age` INTEGER,
`specialty` TEXT
);

-- Filling of the "doctors" table 
.shell echo
.shell echo "[ INSERT ] Loading the 'doctors' table with data"
.shell echo
INSERT INTO doctors VALUES(1,'Dr. Dolladille',45,'Dentist');
INSERT INTO doctors VALUES(2,'Dr. Doolittle',40,'General Practitioner');
INSERT INTO doctors VALUES(3,'Dr. Folamour',56,'Psychiatrist');
INSERT INTO doctors VALUES(4,'Dr. Whitenass',30,'Proctologist');
INSERT INTO doctors VALUES(5,'Dr. Blind',32,'Ophthalmologist');

-- Validation of previous CREATE and INSERT commands (if any useful at this stage)
-- COMMIT;

-- SQLite3 specific CLI commands
.mode column
.headers on
.width 20 20 20 20 20 20 20 20 20 20

-- Displaying all "doctors" table content
.shell echo
.shell echo "[ SELECT] All doctors"
.shell echo
SELECT * FROM doctors;

-- id     name                  age                   specialty
-- -----  --------------------  --------------------  --------------------
-- 1      Dr. Dolladille        45                    Dentist
-- 2      Dr. Doolittle         40                    General Practitioner
-- 3      Dr. Folamour          56                    Psychiatrist
-- 4      Dr. Whitenass         30                    Proctologist
-- 5      Dr. Blind             32                    Ophthalmologist

-- Displaying line(s) from "doctors" whose age is 45
.shell echo
.shell echo "[SELECT] Doctor(s) aged 40 and older"
.shell echo
SELECT * FROM doctors WHERE age > 40;

-- id     name                  age                   specialty
-- -----  --------------------  --------------------  --------------------
-- 1      Dr. Dolladille        45                    Dentist

-- Update name and age of doctor whose "id" is 3
.shell echo
.shell echo "[ UPDATE ] Update age and name of doctor with id = 3"
.shell echo

-- Displaying the related doctor to see if the update has taken effect
.shell echo
.shell echo "  > Information for doctor #3 BEFORE update"
.shell echo
SELECT * FROM doctors WHERE id = 3;

-- Update with conditions on 'id'
.shell echo
.shell echo "  > Updating name and age of doctor #3"
.shell echo
UPDATE doctors SET age = 40, name = 'John Smith' WHERE id = 3;

-- Displaying the related doctor to see if the update has taken effect
.shell echo
.shell echo "  > Information of all doctors, including doctor #3 AFTER update"
.shell echo
SELECT * FROM doctors;

-- id     name                  age                   specialty
-- -----  --------------------  --------------------  --------------------
-- 1      Dr. Dolladille        45                    Dentist
-- 2      Dr. Doolittle         40                    General Practitioner
-- 3      John Smith            40                    Psychiatrist
-- 4      Dr. Whitenass         30                    Proctologist
-- 5      Dr. Blind             32                    Ophthalmologist

-- Suppressing doctor with "id" equal to 3
.shell echo
.shell echo "[ DELETE ] Suppression of doctor #3"
.shell echo
DELETE FROM doctors WHERE id= 3;

-- Displaying all "doctors" to see the delete has successfully taken effect
.shell echo
.shell echo "[ SELECT ] Display all doctors to show doctor #3 has effectively disappeared"
.shell echo
SELECT * FROM doctors;
.shell echo

-- id     name                  age                   specialty
-- -----  --------------------  --------------------  --------------------
-- 1      Dr. Dolladille        45                    Dentist
-- 2      Dr. Doolittle         40                    General Practitioner
-- 4      Dr. Whitenass         30                    Proctologist
-- 5      Dr. Blind             32                    Ophthalmologist

.shell echo
.shell echo "End of 'doctor' SQL script"
.shell echo
.shell echo

-- doctors.sql - SQLed with love & sweat by Jean-Baptiste VIDAL for the "Developer" curriculum (Winter 2022)

