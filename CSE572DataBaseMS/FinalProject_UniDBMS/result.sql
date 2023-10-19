COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 150
SET PAGESIZE 55
spool results.txt

SELECT * FROM Department;
SELECT * FROM AcademicStaff;
SELECT * FROM Courses;
SELECT * FROM TeachingHour;
SELECT * FROM Modules;
SELECT * FROM StudentModule;
SELECT * FROM Students;
SELECT * FROM NextOfKin;

spool off
