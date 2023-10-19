COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 132
SET PAGESIZE 55
spool dataDict.txt
-- Query comments of table
 SELECT table_name, comments
 FROM user_tab_comments
 WHERE table_name IN ('Department', 'AcademicStaff', 'Courses', 'TeachingHour', 'Modules', 'StudentModule', 'Students', 'NextOfKin')
 ORDER BY table_name;
-- Query comments of columns for every <tablename>
 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'Department';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'AcademicStaff';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'Courses';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'TeachingHour';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'Modules';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'StudentModule';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'Students';

 SELECT table_name, column_name, comments
 FROM user_col_comments
 WHERE table_name = 'NextOfKin';
spool off
