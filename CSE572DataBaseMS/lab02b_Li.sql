-- lab:  lab02-B

-- 006704029

-- set 150 characters per line

   SET linesize 150
 

-- output queries result to text file
spool  lab02bOutput_Shutu.txt

--list available tables from HR user 

    SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';
   
-- List attributes of each of those tables
   DESC REGIONS;
   DESC LOCATIONS;
   DESC DEPARTMENTS;
   DESC HR.JOBS;
   DESC EMPLOYEES;
   DESC JOB_HISTORY;
   DESC JOB_GRADES;
   DESC COUNTRIES;

--Query job_id, job_title, maximum salary, minimum salary and difference between two salaries.  
   SELECT job_id, job_title, max_salary AS "Maximum_Salary", min_salary AS "Minimum_Salary", max_salary - min_salary AS "difference" FROM HR.jobs;

   
--Query employee_ID, employee’s full name, hire date, Years_employed, and salary of all employees
   SELECT EMPLOYEE_ID, last_name|| ',' ||first_name AS "FULL_NAME", HIRE_DATE, (SYSDATE - HIRE_DATE)/365 AS "YEARS_EMPLOYED", SALARY FROM EMPLOYEES;
--Count current number of employees in the company
   SELECT COUNT(*) FROM EMPLOYEES;

--Query max and min salaries in the company.    
   SELECT DISTINCT max_salary, min_salary FROM HR.jobs;

--Query number of unique salaries in the company
   SELECT COUNT(DISTINCT min_salary) FROM HR.jobs;
   SELECT COUNT(DISTINCT max_salary) FROM HR.jobs;
-- stop sending output to file  

spool off


