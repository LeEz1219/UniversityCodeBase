-- lab:  lab03-a

-- 006704029

   SET LINESIZE 3200
   SET PAGESIZE 3200
 
spool  lab03aOutput_Shutu.txt
--Search for a specific record
    SELECT employee_ID, first_name, last_name FROM HR.employees WHERE employee_ID= 130;
--List rows  of the same column value
    SELECT employee_ID, first_name, last_name FROM HR.employees WHERE department_id= 90;
--List rows that column values are in a range
    SELECT employee_ID, first_name, last_name, department_id FROM HR.employees 
    WHERE department_id BETWEEN 50 AND 150;
    SELECT employee_ID, first_name, last_name, department_id FROM HR.employees 
    WHERE department_id IN (50, 70, 90 );
--List rows that column values have same string
    SELECT employee_ID, first_name, last_name FROM HR.employees WHERE first_name LIKE '%Da%';
--List high paid Programmers
    SELECT employee_ID, first_name, last_name, department_id, job_id, salary 
    FROM HR.employees WHERE job_id= 'IT_PROG' AND salary >= 5000 ;
--List high paid and managers in the company
    SELECT employee_ID, first_name, last_name, department_id, job_id, salary 
    FROM HR.employees WHERE  salary >= 10000 OR job_id LIKE '%MGR';
--SELECT employee_ID, first_name, last_namethat has ‘Da’ string
    FROM HR.employees WHERE first_name NOT LIKE '%Da%';
--List rows with combined conditions
    SELECT employee_ID, first_name, last_name, job_id, salary 
    FROM HR.employees WHERE job_id= 'IT_PROG' OR job_id= 'AD_PRES' AND salary > 10000; 
    
    SELECT employee_ID, first_name, last_name, job_id, salary
    FROM HR.employees WHERE (job_id= 'IT_PROG' OR job_id= 'AD_PRES') AND salary > 10000;

--List employees in order of department_ID
    SELECT employee_ID, department_id, first_name, last_name
    FROM HR.employees ORDER BY department_id;
--List employees in order of department_ID, higher Annual Salary
    SELECT employee_ID, department_id, first_name, last_name, salary*12 Annual 
    FROM HR.employees ORDER BY department_id, Annual DESC;
--List employees in order of department_ID, First name, Last name
    SELECT employee_ID, department_id, first_name, last_name 
    FROM HR.employees ORDER BY department_id, first_name, last_name;

spool off


