CREATE DATABASE sub_query;
USE sub_query;

CREATE TABLE student(
rollNo INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
marks INT,
city VARCHAR(50)
);

INSERT INTO student
VALUES
(101,'Abhishek',78,'Trichi'),
(102,'Ram',93,'Madurai'),
(103,'Muthu',85,'Madurai'),
(104,'Rajeshwari',96,'Chennai'),
(105,'Nirmal',92,'Chennai'),
(106,'Shiny',82,'Chennai'),
(107,'Tamil',98,'Madurai'),
(108,'Muthulakshmi',96,'Tirunelveli');

set sql_safe_updates=0;

update student set city='Trinulveli' where city='Tirunelveli';

select * from student;

select max(marks)  from student where marks < (select max(marks) from student);

select name,marks from student where marks > (select avg(marks) from student);

select name,marks from student where marks > (select min(marks)from student) order by marks desc;

select name,marks from student where city='madurai'and marks > (select avg(marks) from student where city='chennai');

select name,marks from student where marks >=  (select marks from student order by marks desc limit 1 offset 2);






