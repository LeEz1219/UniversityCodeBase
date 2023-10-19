/* University Database
Purpose: Insert data into each table
Author: Li and Yniguez
*/

SET LINESIZE 150

SET CONSTRAINTS ALL DEFERRED;


-- Adds departments to table
INSERT INTO Department VALUES ('2345', 'CompSciEng', '5555555550', '5555555551', 'BlockA', '00128');

-- Adds staff to table
INSERT INTO AcademicStaff VALUES ('00128', '2345', '01-11-19', '00128', 'Jackson Storm', '5555555560', '5555555561', 'M', '50000', 'Lecturer', 'MS', '725 Thanos Lane');



-- Adds courses to table
INSERT INTO Courses VALUES ('99880', '00128', '2345', 'CompSci', '4 Years');



-- Adds teaching hours to tables
INSERT INTO TeachingHour VALUES ('00128', '99880', '100 Hours');



-- Adds modules to tables
INSERT INTO Modules VALUES ('86255', '99880', '00128', 'CSE201', '17-SEP-18', '19-DEC-18', 'multimedia', '95%');


-- Adds student modules info to tables
INSERT INTO StudentModule VALUES ('86255', '00562555', 'A');




-- Adds students to tables
INSERT INTO Students VALUES ('00562555', '99880', '562555', 'Isaac Newton', 'Titanus Moon', '08-MAY-95', 'M', 'Y');




-- Adds next-of-kin to tables
INSERT INTO NextOfKin VALUES ('Isaac Newton', 'James Newton', '00562555');



SET CONSTRAINTS ALL IMMEDIATE;

SET PAUSE OFF

spool UniversityDB.txt

SELECT * FROM Department;
SELECT * FROM AcademicStaff;
SELECT * FROM Courses;
SELECT * FROM TeachingHour;
SELECT * FROM Modules;
SELECT * FROM StudentModule;
SELECT * FROM Students;
SELECT * FROM NextOfKin;

SET PAUSE ON

spool off
