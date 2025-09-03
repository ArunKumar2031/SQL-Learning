use practice;

-- Create employees_india table
CREATE TABLE employees_india (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(50)
);

-- Insert values into employees_india
INSERT INTO employees_india (emp_id, emp_name, dept) VALUES
(1, 'Arun', 'HR'),
(2, 'Priya', 'IT'),
(3, 'Karthik', 'Sales'),
(4, 'Meena', 'IT');

----------------------------------------------------------

-- Create employees_usa table
CREATE TABLE employees_usa (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(50)
);

-- Insert values into employees_usa
INSERT INTO employees_usa (emp_id, emp_name, dept) VALUES
(1, 'John', 'HR'),
(2, 'Steve', 'Sales'),
(3, 'Priya', 'IT'),
(4, 'David', 'Finance');

select * from employees_india as ei join employees_usa as eu on ei.emp_id=eu.emp_id;

select emp_name from employees_india union select emp_name from  employees_usa;
select emp_name from employees_india union all select emp_name from  employees_usa;

select  dept from employees_india union select  dept from employees_usa;

select ei.emp_name from employees_india as ei left join employees_usa as eu on ei.emp_name=eu.emp_name where eu.emp_name is null ;

select eu.emp_name from employees_india as ei right join employees_usa as eu on ei.emp_name=eu.emp_name where ei.emp_name is null ;

select ei.emp_name from employees_india as ei join employees_usa as eu on ei.emp_name=eu.emp_name ;

select emp_name,dept,'India' as Country from employees_india union select emp_name,dept,'USA' as Country from employees_usa ;

select emp_name,dept from employees_india  union select emp_name,dept from employees_usa order by dept ;

SELECT COUNT(*) AS emp_count
FROM (
    SELECT emp_name FROM employees_india
    UNION
    SELECT emp_name FROM employees_usa
) as Combined;

select emp_name,dept from employees_india where dept='IT'
union select emp_name,dept from employees_usa where dept='IT';
