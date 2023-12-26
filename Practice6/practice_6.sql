--task01
SELECT last_name, hire_date
FROM hr.employees
WHERE department_id = (SELECT department_id
	FROM hr.employees
	WHERE last_name = 'Zlotkey')
	AND last_name <> 'Zlotkey';

--task02
SELECT employee_id, last_name
FROM hr.employees
WHERE salary > (SELECT AVG(salary)
	FROM hr.employees);

--task03
SELECT employee_id, last_name
FROM hr.employees
WHERE department_id IN (SELECT department_id
	FROM hr.employees
	WHERE last_name like '%u%');

--task04
SELECT last_name, department_id, job_id
FROM hr.employees
WHERE department_id IN (SELECT department_id
	FROM hr.departments
	WHERE location_id = 1700);

--task05
SELECT last_name, salary
FROM hr.employees
WHERE manager_id = (SELECT employee_id
	FROM hr.employees
	WHERE employee_id = 100);

--task06
SELECT department_id, last_name, job_id
FROM hr.employees
WHERE department_id IN (SELECT department_id
	FROM hr.departments
	WHERE department_name = 'Executive');

--task07
SELECT employee_id, last_name, salary
FROM hr.employees
WHERE department_id IN (SELECT department_id
	FROM hr.employees
	WHERE last_name like '%u%')
AND salary > (SELECT AVG(salary)
	FROM hr.employees);