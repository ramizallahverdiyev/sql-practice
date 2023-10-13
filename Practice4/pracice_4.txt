--Task01
select e.last_name, e.department_id, d.department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

--Task02
select distinct job_id, location_id
from hr.employees, hr.departments
where hr.employees.department_id = hr.departments.department_id
and employees.department_id = 80;

--Task03
select e.last_name, d.department_name, d.location_id, l.city
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id and d.location_id = l.location_id and e.commission_pct is not null;

--Task04
select last_name, department_name
from hr.employees, hr.departments
where hr.employees.department_id = hr.departments.department_id
and last_name like '%a%';

--Task05
select e.last_name, e.job_id, e.department_id, d.department_name
from hr.employees e join hr.departments d
on (e.department_id = d.department_id)
join hr.locations l
on (d.location_id = l.location_id)
where lower(l.city) = 'toronto';

--Task06
select e_1.last_name as "Employee", e_1.employee_id as "EMP#", e_2.last_name as "Manager", e_2.employee_id as "Mgr#"
from hr.employees e_1 join hr.employees e_2
on (e_1.manager_id = e_2.employee_id);

--Task07
select e_1.last_name as "Employee", e_1.employee_id as "EMP#", e_2.last_name as "Manager", e_2.employee_id as "Mgr#"
from hr.employees e_1 left outer join hr.employees e_2
on (e_1.manager_id = e_2.employee_id);

--Task08
select e.department_id  as "department", e.last_name as "employee", c.last_name as "colleague"
from hr.employees e join hr.employees c
on (e.department_id = c.department_id)
where e.employee_id <> c.employee_id
order by e.department_id, e.last_name, c.last_name;

--Task09
select e.last_name, e.job_id, d.department_name, e.salary, j.job_title
from hr.employees e join hr.departments d
on (e.department_id = d.department_id)
join hr.jobs j
on (e.salary between j.min_salary and j.max_salary);

--Task10
select e.last_name, e.hire_date
from hr.employees e join hr.employees davies
on (davies.last_name = 'Davies')
where davies.hire_date < e.hire_date;

--Task11
select e.last_name, e.hire_date, m.last_name, m.hire_date
from hr.employees e JOIN hr.employees m
on (e.manager_id = m.employee_id)
where e.hire_date < m.hire_date;