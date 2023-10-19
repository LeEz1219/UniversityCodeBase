COLUMN table_name FORMAT A4 
COLUMN column_name FORMAT A4 
COLUMN comments FORMAT A40 WRAPPED 
SET LINESIZE 55 
SET PAGESIZE 55
spool aa.txt
DESC Department
DESC AcademicStaff
DESC Courses
DESC TeachingHour
DESC Modules
DESC StudentModule
DESC Students
DESC NextOfKin
spool off
