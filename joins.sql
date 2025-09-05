use practice;
-- Create departments table
CREATE TABLE dept (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert values
INSERT INTO dept (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance');

----------------------------------------------------------

-- Create employees table
CREATE TABLE emp (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Insert values
INSERT INTO emp (emp_id, emp_name, dept_id) VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Karthik', 3),
(104, 'Meena', 2),
(105, 'John', NULL);

-- This are the Questions 

select e.emp_name,d.dept_name from emp as e join dept as d
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name from emp e left join dept d 
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name from emp e right join dept d 
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name from emp e join dept d 
on e.dept_id=d.dept_id where dept_name='IT';

select e.emp_name,d.dept_name from emp e left join dept d 
on e.dept_id=d.dept_id  where d.dept_name is null ;

select e.emp_name,d.dept_name from emp e join dept d 
on e.dept_id=d.dept_id  where d.dept_name < 1 ;

select d.dept_name,count(e.emp_name) emp_count from emp e join dept d 
on e.dept_id=d.dept_id group by d.dept_name;

select d.dept_name from emp e right join dept d 
on e.dept_id=d.dept_id where e.emp_id is null;

select e.emp_name,d.dept_name from emp e join dept d on e.dept_id=d.dept_id order by d.dept_name; 

select e.emp_id,e.emp_name,coalesce(d.dept_name,'No department') as dept_name from emp e left join dept d on e.dept_id = d.dept_id;