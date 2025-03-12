select e1.name AS Employee1, e2.name AS Employee2, d.name as Department
from employees e1
join employees e2 on e1.department_id = e2.department_id
join departments d on e1.department_id = d.id
where e1.id < e2.id
order by d.name;