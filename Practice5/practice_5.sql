--task1 True
--task2 False
--task3 True

--task04
select round(max(salary),0) as "Maximum",
round(min(salary),0) as "Minimum",
round(sum(salary),0) as "sum",
round(avg(salary),0) as "Average"
from hr.employees;

--task05
select job_id, round(max(salary),0) as "Maximum",
round(min(salary),0) as "Minimum",
round(sum(salary),0) as "sum",
round(avg(salary),0) as "Average"
from hr.employees
group by job_id;

--task06
select job_id, count(*)
from hr.employees
group by job_id;

--task07
select count(distinct manager_id) as "Number of Managers"
from hr.employees;

--task08
select max(salary) - min(salary) as "DIFFERENCE"
from hr.employees;

--task09
select manager_id, min(salary)
from hr.employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--task10
select d.department_name as "Name", d.location_id as "Location ",
count(*) as "Number of People",
round(avg(salary),2) as "Salary"
from hr.employees e, hr.departments d
where e.department_id = d.department_id
group by d.department_name, d.location_id;


--task11
select count(*) as "total",
sum(decode(to_char(hire_date, 'YYYY'),2000,1,0)) as "2000",
sum(decode(to_char(hire_date, 'YYYY'),2001,1,0)) as "2001",
sum(decode(to_char(hire_date, 'YYYY'),2002,1,0)) as "2002",
sum(decode(to_char(hire_date, 'YYYY'),2003,1,0)) as "2003"
from hr.employees;
--There is no record for the years 1995,1996,1997,1998 so i have changed the years to get some records

--task12
select job_id as "Job",
sum(decode(department_id , 20, salary)) as "Dept 20" ,
sum(decode(department_id , 50, salary)) as "Dept 50" ,
sum(decode(department_id , 80, salary)) as "Dept 80" ,
sum(decode(department_id , 90, salary)) as "Dept 90" ,
sum(salary) as "Total"
from hr.employees
group by job_id;