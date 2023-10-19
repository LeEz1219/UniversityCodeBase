-- lab:  lab04A-Query

-- 006704029

   SET LINESIZE 3200
   SET PAGESIZE 3200
 
spool  lab04AQueryOutput_Shutu.txt


    SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

    SELECT TO_CHAR(SYSDATE, 'MON DD, YYYY') AS column_DATE FROM DUAL;
   
    SELECT employee_ID, Last_Name, First_Name, commission_pct AS commission_point FROM HR.employees
    WHERE commission_pct is NOT NULL
    ORDER BY commission_point ASC;

--solution 1 for Q3   
    SELECT employee_ID, Last_Name, First_Name, TO_CHAR(Salary,'L999,999.00') AS "Salary",
    CASE 
         WHEN Salary >= 10000 THEN TO_CHAR(Salary* 1.15,'L999,999.00') 
         ELSE TO_CHAR(Salary* 1, 'L999,999.00') 
    END AS "New_Salary" FROM HR.employees 
    ORDER BY employee_ID;
    
--solution 2 for Q3   
    SELECT employee_ID, Last_Name, First_Name, TO_CHAR(Salary,'L999,999.00') AS "Salary", TO_CHAR(Salary* 1.15, 'L999,999.00') AS "New_Salary" FROM HR.employees
    WHERE Salary >= 10000
    ORDER BY employee_ID;

    
    SELECT INITCAP(last_name), LENGTH(last_name) FROM HR.employees
    WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
    ORDER BY last_name;

    
    SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS WORKED"              FROM HR.employees
    WHERE job_ID LIKE '%MGR' OR job_ID LIKE '%MAN'
    ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE, hire_date));

    SELECT last_name, LPAD(salary, 15,'$'), job_ID
    FROM HR.employees
    WHERE job_ID LIKE 'IT_PROG%' AND salary >= 3000;

    SELECT last_name, first_name, NVL2(commission_pct, TO_CHAR(salary* commission_pct, 'L999,999.00'), 'No Bonus') Bonus 
    FROM HR.employees
    WHERE department_ID LIKE '80' OR department_ID LIKE '90'
    ORDER BY last_name, first_name;
   
    SELECT last_name, first_name, Job_ID,
    DECODE (Job_ID, 'AD_PRES', 'A', 'ST_MAN', 'B', 'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK', 'E', 'NA') Grade
    FROM HR.employees  WHERE salary >= 10000  ORDER BY Grade; 
    
    SELECT last_name, first_name, Job_ID,
    CASE Job_ID
       WHEN 'AD_PRES' THEN 'A'
       WHEN 'ST_MAN' THEN 'B'
       WHEN 'IT_PROG'THEN 'C'
       WHEN 'SA_REP' THEN 'D'
       WHEN 'ST_CLERK' THEN 'E'
       ELSE'NA'
    END Grade
    FROM HR.employees  WHERE salary >= 10000  ORDER BY Grade; 








spool off
