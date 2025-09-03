create database Practice;
use Practice;
create table Employees(emp_id int primary key,emp_name varchar(50),deparment varchar(50),Salary decimal(10,2),hire_date date);

INSERT INTO Employees VALUES
(1, 'Arun', 'HR', 45000, '2021-01-15'),
(2, 'Meena', 'IT', 60000, '2020-06-20'),
(3, 'Raj', 'Finance', 50000, '2019-03-12'),
(4, 'Priya', 'IT', 75000, '2022-11-01'),
(5, 'Karthik', 'Marketing', 40000, '2021-08-19'),
(6, 'Divya', 'Finance', 52000, '2020-12-30');

select * from Employees;

select max(salary) as Highest_Salary from Employees;
select max(salary) from Employees where salary < (select max(salary) from Employees);
select emp_name from Employees where hire_date > '2021-01-01';
alter table employees rename column deparment to department;
select department,count(emp_name) as Employee_count from Employees Group by department;
Set sql_safe_updates=0;
update Employees set salary=salary * 1.10 where department='Finance';
delete from employees where salary < 45000;
alter table employees add column bonus decimal(10,2) ;
update employees set bonus = salary * 0.05;
select * from employees order by salary desc;
select emp_name from employees where emp_name like 'P%';

select department,sum(salary) as total_salary from employees group by department;
select department,count(department) as countted_value from employees group by department;
select department,max(salary) as highest_salary from employees group by department;
select department,count(department) as Department_numbers from employees group by department having count(department)>1; 
select department,min(salary) as min_salary from employees group by department ;
select emp_name,salary from employees where salary >(select avg(salary) from employees);
select department,sum(salary) as employees_sum from employees group by department having sum(salary)>100000;
select emp_name,hire_date from employees  order by hire_date limit 1;
select count(*) as emp from employees where emp_name like 'P%';

CREATE DATABASE joins;
USE joins;

CREATE TABLE customers(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(50) NOT NULL,
city VARCHAR(50)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_detail VARCHAR(50),
order_amount DECIMAL(6,3),
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES customers(cust_id)
);


INSERT INTO customers
VALUES
(101 , 'Gomathi','T Nagar'),
(102,'Kathir','Velachery'),
(103 , 'Guna','Thiruvanmayur'),
(104,'Anees','Velachery'),
(105 , 'Babu','Adayar'),
(106,'Jawahar','Taramani'),
(107,'Deekshaya','Guindy');

INSERT INTO orders
VALUES
(6001,'Briyani',150.0,101),
(6002,'Idly',75.0,103),
(6003,'Fried Rice',120.0,102),
(6004,'Dhal Chawal',100.0,106),
(6005,'Parotta',100.0,101);

select * from orders;

select cust.cust_name, ord.order_amount 
from customers AS cust
JOIN orders AS ord ON
cust.cust_id = ord.cust_id;

select cust.cust_name, ord.order_amount 
from customers AS cust
LEFT JOIN orders AS ord ON
cust.cust_id = ord.cust_id;

select cust.cust_name, ord.order_amount 
from customers AS cust
RIGHT JOIN orders AS ord ON
cust.cust_id = ord.cust_id;

select cust.city, ord.order_detail
from customers AS cust
JOIN orders AS ord ON
cust.cust_id=ord.cust_id;

select cust.city, ord.order_detail
from customers AS cust
LEFT JOIN orders AS ord ON
cust.cust_id=ord.cust_id;

select cust.city, ord.order_amount
from customers AS cust 
RIGHT JOIN orders AS ord ON
cust.cust_id=ord.cust_id GROUP BY city ;

use practice;
show tables;
select * from Manager;
create table Manager (emp_id int, name varchar(20),manager_id int);
insert into Manager values(121,'Arun',122),
						  (122,'Guru',124),
                          (123,'Allwin',123),
                          (124,'Ranjith',122),
                          (125,'Aravint',null);
                          
set sql_safe_updates=0;
                          
delete from  manager where  manager_id=123;

insert into  Manager value(123,'Allwin',121);
 
Select e.name as Staff,m.name as Manager
from Manager as e
left join  Manager as m
ON e.emp_id=m.Manager_id;      

create table bank_accounts(acc_id int primary key,balance decimal default 0,acc_num int unique);  
create table emp(emp_age int check (emp_age >=18));
create table exam_results (result_id int auto_increment, Mark int ,student_id int ,Foreign key(result_id) references students (student_id) );

show databases;
create database company;
use company;
 CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
job_desc VARCHAR(50),
salary int);
INSERT INTO employee VALUES
(1,'Joseph','Developer',25000),
(2,'Revathy','HR',30000),
(3,'Nisha','Developer',20000),
(4,'Pramoth','HR',35000),
(5,'Malik','Tester',10000),
(6,'Suresh','Tester',15000),
(7,'Shanthi','Admin',8000),
(8,'Sundar','Admin',10000),
(9,'Pramela','Manager',80000),
(10,'Kesavan','CEO',100000),
(11,'Kedharnath','Manager',75000),
(12,'Ameer','Developer',30000),
(13,'Ashok','Tester',30000),
(14,'Sam','Analyst',25000),
(15,'Joshibha','Analyst',35000),
(16,'Hari','Analyst',45000);

select * from employee;

select job_desc,sum(salary) as Total_salary from employee group by job_desc;

select job_desc,max(salary) as High_salary from employee group by job_desc;

select job_desc,count(*) as each_role from employee group by job_desc;

select job_desc,count(*) as greter_two from employee group by job_desc having count(*)>2;

select  job_desc ,
count(*) as no_of_emp ,
sum(salary) as sumofSalary ,
min(salary) as min_salary ,
max(salary) as max_salary,
avg(salary) as avg_salary from employee 
group by job_desc;







                 
 





