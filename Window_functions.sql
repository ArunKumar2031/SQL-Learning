create database window_functions;
use window_functions;


CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id  INT,
    salary   INT
);
INSERT INTO employees (emp_id, emp_name, dept_id, salary) VALUES
(1, 'Alice',   10, 50000),
(2, 'Bob',     10, 60000),
(3, 'Charlie', 20, 55000),
(4, 'David',   20, 70000),
(5, 'Eva',     10, 60000);

select emp_name,salary,
RANK() OVER(ORDER BY SALARY desc) AS Rank_ from employees;
select emp_name,salary,
DENSE_RANK() OVER(ORDER BY SALARY desc) AS Rank_ from employees;
select emp_name,salary,
RANK() OVER(PARTITION BY dept_id ORDER BY SALARY desc)  AS Rank_dept from employees;
select emp_name,salary,
DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY SALARY desc)  AS Rank_dept from employees;

-- SQL Window Function Practice Questions
-- Find the highest salary employee in each department using RANK() and PARTITION BY. -
select emp_name,salary,dept_id,
max(salary) over(partition by dept_id ) as highest_salary 
from employees;
-- Find the 2nd highest salary in each department using DENSE_RANK(). -
select emp_name,salary,dept_id from( 
select emp_name,salary,dept_id,
	dense_rank()over(partition by dept_id order by salary desc ) as rank_ 
from employees ) as t
where Rank_=2; 
-- Show the top 2 employees per department based on salary. -
select emp_name,salary,dept_id from(
select emp_name,salary,dept_id,
	dense_rank()over(partition by dept_id order by salary desc ) as rank_ 
from employees ) as t
where Rank_ <=2; 
-- Display employees with their salary rank within each department using DENSE_RANK(). -
select emp_name,salary,dept_id,
dense_rank() over(partition by dept_id order by salary desc) as salary_wise_rank
from employees ;
-- Find the lowest salary employee in each department. 
select emp_id,dept_id,salary,
min(salary) over(partition by dept_id) as min_salary
from employees;
-- Show all employees with their row number based on salary within department.
select emp_id,emp_name,salary,dept_id,
row_number()over(partition by dept_id order by salary desc) as S_no
from employees;
-- List employees who share the same salary rank in a department (use RANK() with PARTITION BY).
select emp_id,emp_name,dept_id,salary from (
	select emp_id,emp_name,dept_id,salary,
		rank()over(partition by dept_id order by salary desc  ) as salary_rank
			from employees) as t where salary_rank = 1;
-- Retrieve the 3rd highest salary employee in each department.
select emp_name,salary,dept_id from (
	select emp_name,salary,dept_id,
    row_number() over(partition by dept_id order by salary desc) as rank_
    from employees) as t where rank_ <=3 ;
-- Find employees whose salary is not the highest but still in top 3 per department
select emp_name,salary,dept_id from (
	select emp_name,salary,dept_id,
    rank()over(partition by dept_id order by salary desc) as rank_ 
    from employees) as t where rank_=3;
    -- Show employees ordered by salary and assign both ROW_NUMBER() and RANK() – compare the difference. 
    select emp_name,salary,dept_id,
        row_number()over(partition by dept_id order by salary desc) as rows_,
        rank()over(partition by dept_id order by salary desc) as rank_
        from employees  order by dept_id ,salary ;

    
    





