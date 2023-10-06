--Task1
SELECT last_name, salary
FROM hr.employees
WHERE salary > 12000;

--Task2
SELECT last_name, department_id
FROM hr.employees
WHERE employee_id = 176;

--Task3
SELECT last_name, salary
FROM hr.employees
WHERE salary NOT BETWEEN 5000 AND 12000;

--Task4
SELECT last_name, job_id, hire_date
FROM hr.employees
WHERE hire_date BETWEEN '20-Feb-1998' AND '01-May-1998'
ORDER BY hire_date;

--Task5
SELECT last_name, department_id
FROM hr.employees
WHERE department_id IN (20, 50)
ORDER BY last_name;

--Task6
SELECT last_name AS "Employee", salary AS "Monthly Salary"
FROM hr.employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20,50);

--Task7
SELECT last_name, hire_date
FROM hr.employees
WHERE hire_date BETWEEN '01-JAN-94' AND '31-DEC-94';

--Task8
SELECT last_name, job_id
FROM hr.employees
WHERE manager_id IS NULL;

--Task9
SELECT last_name, salary, commission_pct
FROM hr.employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

--Task10
SELECT last_name
FROM hr.employees
WHERE last_name LIKE '__a%';

--Task11
SELECT last_name
FROM hr.employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

--Task12
SELECT last_name, job_id, salary
FROM hr.employees
WHERE job_id IN ('SA_REP','ST_CLERK') AND salary NOT IN (2500,3500, 7000);

--Task13
SELECT last_name AS "Employee", salary AS "Monthly Salary", commission_pct
FROM hr.employees
WHERE commission_pct = .20;