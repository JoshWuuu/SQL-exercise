-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
-- 2.1 Select the last name of all employees.
select lastname from Employees
-- 2.2 Select the last name of all employees, without duplicates.
select distinct LastName from employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
select * from employees where lastname = 'Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where lastname in ('Smith', 'Doe');
-- 2.5 Select all the data of employees that work in department 14.
select * from Employees where department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
select * from employees where department = 37 or department = 77;
select * from employees where department in (37, 77);

-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from employees where lastname like 'S%'

-- 2.8 Select the sum of all the departments' budgets.
select sum(budget) from Departments
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select code, count(name) from department group by code
-- 2.10 Select all the data of employees, including each employee's department's data.
select a.*, b.* from employees a join departments b on a.department = b.code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select a.name, a.lastname, b.name Department_name, b.Budget
from employees a join departments b
on a.department = b.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select a.name, a.lastname
from employees a join departments b
on a.department = b.code
WHERE b.Budget > 60000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select code
from department 
where budget > (select AVG(budget) from department)

-- 2.14 Select the names of departments with more than two employees.
select name
from department
where code in (select department from employees group by department having count(*) > 2)

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
select a.name, a.lastname
from employees a join departments b
on a.department = b.code
where 1 = (select count(name) from departments c where c.budget < b.budget);
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
insert into departments values (11, "Quality Assurance", 40000)
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into employees values ()
-- 2.17 Reduce the budget of all departments by 10%.
update departments
set budget = 0.9 * budget
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employees
set department = 14
where department = 77;

-- 2.19 Delete from the table all employees in the IT department (code 14).
delete from employees
where department = 14
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees
where department in (select code from departments where budget >= 60000)
-- 2.21 Delete from the table all employees.
delete from employees;
