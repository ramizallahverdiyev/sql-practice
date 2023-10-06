--Task1
SELECT sysdate AS "Date"
FROM hr.employees;

--Task2
SELECT employee_id, last_name, salary, ROUND(salary * 1.15, 0) AS "New Salary"
FROM
hr.employees;

--Task4
SELECT employee_id, last_name, salary, ROUND(salary * 1.15, 0) AS "New Salary", ROUND(salary * 1.15, 0)- salary AS "Increase"
FROM
hr.employees;

--Task5
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM hr.employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'M%' OR last_name LIKE 'A%'
ORDER BY last_name;

--Task6
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS_WORKED" FROM hr.employees
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date)

--Task7
SELECT last_name || ' earns ' ||TO_CHAR(salary, 'fm$99,999.00')||' monthly but wants '||TO_CHAR(salary * 3, 'fm$99,999.00') ||'.' AS "Dream Salaries"
FROM hr.employees;

--Task8
SELECT last_name, LPAD(salary, 15, '$') AS "SALARY"
FROM hr.employees;

--Task9
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'),'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW 
FROM hr.employees;

--Task10
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM hr.employees
ORDER BY TO_CHAR(hire_date - 1, 'd');

--Task11
SELECT last_name, NVL(TO_CHAR(commission_pct), 'No Commission') AS "COMM" 
FROM hr.employees;

--Task12
SELECT rpad(last_name, 8)||' '|| rpad(' ', salary/1000+1, '*') AS "EMPLOYEES_AND_THEIR_SALARIES"
FROM hr.employees
ORDER BY salary DESC;

--Task13
SELECT job_id, decode (job_id,'ST_CLERK','E','SA_REP','D','IT_PROG','C','ST_MAN','B','AD_PRES','A','0')AS "GRADE"
FROM hr.employees;

--Task14
SELECT job_id, (CASE job_id
WHEN 'ST_CLERK' THEN 'E'
WHEN 'SA_REP' THEN 'D'
WHEN 'IT_PROG' THEN 'C'
WHEN 'ST_MAN' THEN 'B'
WHEN 'AD_PRES' THEN 'A'
ELSE '0' END) AS "GRADE"
FROM hr.employees;