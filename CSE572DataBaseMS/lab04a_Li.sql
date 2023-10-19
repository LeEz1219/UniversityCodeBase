-- lab:  lab04-A

-- 006704029S

   SET LINESIZE 3200
   SET PAGESIZE 3200
 
spool  lab04aOutput_Shutu.txt

    SELECT table_name
    FROM all_tables
    WHERE owner = 'HR';

--SELECT employee with the same first_name
    SELECT employee_ID, first_name, last_name, salary 
    FROM HR.employees WHERE UPPER(first_name)= 'DAVID';

 --Using Dummy table : DUAL
    SELECT LOWER('SQL Course') FROM DUAL;

--LENGTH(‘Sqlplus’) : 7
    SELECT LENGTH('Sqlplus')FROM DUAL;

 -- INSTR('Sqlplus', 'I', 3, 2) = 5
SELECT INSTR('Sqlplus', 'l', 3, 2)
	FROM DUAL;

-- LPAD (24000, 10, '*') = *****24000
SELECT LPAD(24000, 10, '*')
	FROM DUAL;

-- RPAD (24000, 10, '*') = 24000*****
SELECT RPAD(24000, 10, '*')
	FROM DUAL;


-- TRIM ('L' FROM 'Loyal')
SELECT TRIM('L' FROM 'Loyal')
	FROM DUAL;

-- REPLACE ('Hello home', 'h', 'H') = hello home
SELECT REPLACE ('Hello home','H','h')
	FROM DUAL;

-- ROUND(45.936, 2) = 45.94
SELECT ROUND (45.936, 2)
	FROM DUAL;

-- MOD(5,3) = 2
SELECT MOD(5,3)
	FROM DUAL;

-- list employees and days being hired
SELECT employee_ID, first_name, last_name, SYSDATE - hire_date AS Days_Hired
	FROM HR.employees
	WHERE job_id = 'IT_PROG';

-- list programmers and months being hired
SELECT employee_ID, first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 0) AS Months_Hired
	From HR.employees
	WHERE job_id = 'IT_PROG';

-- add 6 months
SELECT ADD_MONTHS('11-JAN-96', 6)
	FROM DUAL;

-- get date of next Friday
SELECT NEXT_DAY('01-SEP-95', 'FRIDAY')
	FROM DUAL;

-- get last date of the month
SELECT LAST_DAY('01-FEB-95')
	FROM DUAL;

-- get first day of the nearest month
SELECT ROUND(SYSDATE, 'MONTH')
	FROM DUAL;

-- get first date of the current year
SELECT TRUNC(SYSDATE, 'YEAR')
	FROM DUAL;

-- show today's date
SELECT TO_CHAR(SYSDATE, 'DAY DD MON, YYYY')
	FROM DUAL;

-- show employees whose first name is DAVID with their salaries
SELECT first_name, last_name, TO_CHAR(salary, 'L9,999,999.00')
	FROM HR.employees
	WHERE UPPER(first_name) = 'DAVID';

-- list programmer and months being hired
SELECT employee_ID, first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 0) AS Months_Hired
	FROM HR.employees
	WHERE job_id = 'IT_PROG';

-- list bonus based on commission
SELECT first_name, last_name, salary, commission_pct, NVL2(commission_pct, salary*commission_pct, salary*0.1) bonus
	FROM HR.employees;

-- same as above but using COALESCE
SELECT first_name, last_name, salary, commission_pct, COALESCE(commission_pct, salary*commission_pct, salary*0.1) bonus
	FROM HR.employees;

-- compute bonus based on job title
SELECT first_name, last_name, salary, 
	CASE job_id
		WHEN 'IT_PROG' THEN salary*0.25
		WHEN 'ST_CLERK' THEN salary*0.3
		ELSE salary*0.1
	END Bonus
	FROM HR.employees;

-- same as above but using DECODE
SELECT first_name, last_name, salary,
	DECODE (job_id,
		'IT_PROG', salary*0.25,
		'ST_CLERK', salary*0.3,
		salary*0.1) Bonus
	FROM HR.employees;
  

spool off
