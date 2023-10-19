-- lab:  lab03-B

-- 006704029

   SET LINESIZE 3200
   SET PAGESIZE 3200
 
spool  lab03BOutput_Shutu.txt

    SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

    SELECT department_ID, employee_ID, first_name, last_name, hire_date, (SYSDATE - HIRE_DATE) / 365 AS "YEARS_SERVICE" FROM HR.employees WHERE (SYSDATE - HIRE_DATE) / 365 >= 15;
    
     SELECT department_ID, employee_ID, first_name, last_name, hire_date, (SYSDATE - HIRE_DATE) / 365  AS "YEARS_SERVICE" FROM HR.employees 
     WHERE (SYSDATE - HIRE_DATE) / 365 >= 15 AND department_ID IN (100, 110)
     ORDER BY department_ID, employee_ID;

     SELECT employee_ID, first_name, last_name, hire_date, (SYSDATE - HIRE_DATE) / 365  AS "YEARS_SERVICE" FROM HR.employees 
     WHERE HIRE_DATE <= TO_DATE('01-01-2008', 'DD-MM-YYYY')
     ORDER BY YEARS_SERVICE ASC; 

     SELECT employee_ID, last_name, first_name, salary, hire_date, (SYSDATE - HIRE_DATE) / 365  AS "YEARS_SERVICE" FROM HR.employees
     WHERE (SYSDATE - HIRE_DATE) / 365 >= 15 AND salary < 10000
     ORDER BY last_name, first_name;
    
     SELECT COUNT(*) FROM HR.employees;
     SELECT MIN(salary), MAX(salary) FROM HR.employees;

     SELECT JOB_ID FROM HR.employees
     ORDER BY JOB_ID ASC;

     SELECT first_name, last_name FROM HR.employees
     WHERE first_name LIKE '%D%' AND LENGTH (first_name) > 6;

     SELECT UPPER (last_name), UPPER (first_name), JOB_ID FROM HR.employees
     WHERE JOB_ID LIKE '%IT%';

     SELECT DISTINCT salary FROM HR.employees
     WHERE  salary >= 10000
     ORDER BY salary DESC;

     SELECT employee_ID, hire_date AS "start_date", SYSDATE AS "end_date", JOB_ID, department_ID   FROM HR.employees
     ORDER BY hire_date ASC;

spool off
