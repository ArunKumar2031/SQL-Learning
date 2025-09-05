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

select emp_name,salary,dept_id,
max(salary) over(partition by dept_id ) as highest_salary 
from employees;

select emp_name,salary,dept_id from( 
select emp_name,salary,dept_id,
	dense_rank()over(partition by dept_id order by salary desc ) as rank_ 
from employees ) as t
where Rank_=2; 

select emp_name,salary,dept_id,
dense_rank() over(partition by dept_id) as Top_two
from employees order by salary desc limit 2;





