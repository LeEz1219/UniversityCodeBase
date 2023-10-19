-- lab:  lab02-A

-- 006704029

-- set 75 characters per line

SET linesize 75

-- output queries result to text file 
spool  lab02aOutput_Shutu.txt

-- note each sql query has at least one comment line

-- to describe what the query is expected to produce 


-- list available tables from HR user

SELECT table_name

   FROM all_tables

   WHERE owner = 'HR';

--Describe attributes of jobs table
   DESC HR.jobs;

--List all columns
   SELECT * FROM HR.jobs;
--List specific columns
   SELECT job_id, job_title FROM HR.jobs;

   SELECT  * | { [DISTINCT] column | expression[Alias],... }FROM table;
--Simple column Alias
   SELECT job_title, min_salary Minimum_ASSalary FROM HR.jobs;
--120% Minimum Salary
   SELECT job_title, min_salary*1.2 FROM HR.jobs; 
   
   SELECT  * | { [DISTINCT] column | expression[Alias],... }FROM table;

-- All mathmatic expression
   SELECT job_title, min_salary*12Annual_Minimum FROM HR.jobs;
   SELECT job_title, min_salary*12 + 2000 New_Minimum FROM HR.jobs;
   SELECT job_title, (min_salary+max_salary)/2  Average_SalaryFROM HR.jobs;
   
-- Set up the NULL VALUE
   SELECT  * | { [DISTINCT] column | expression[Alias],... } FROM table;
   SELECT last_name, salary, commission_pct FROM HR.employees;
   SELECT last_name, salary, 12*salary*commission_pct FROM HR.employees;

-- Concatenation of multiple columns
   SELECT job_title||min_salaryAS "Job Title Min Salary " FROM HR.jobs;

-- Concatenation of multiple columns and literal character strings
   SELECT job_id|| ',' ||job_titleAS "Job ID, Title "FROM HR.jobs;

   SELECT  * | { [DISTINCT] column | expression[Alias],... } FROM table;
   
-- List all minimum salaries
   SELECT min_salary FROM HR.jobs;
-- List only unique minimum salaries
   SELECT DISTINCTmin_salary FROM HR.jobs;  
-- stop sending output to file  

spool off
