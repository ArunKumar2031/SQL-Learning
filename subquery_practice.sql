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

-- --testchange;

select * from  student where marks = any  (select  marks from student where city='chennai');

select * from student where marks > all( select marks from student where city='chennai');

select name,marks,
case
	when marks>90 then "A"
	when marks>80 and marks<90 then "B"
    when marks>70 and marks<80 then "C"
end  grade
from student;

select name,marks,
case
	when marks>90 then marks
	-- when marks<90 then marks = null
end  good_mark
from student;

use practice;

-- Create departments table
CREATE TABLE stud_dept (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO stud_dept (dept_id, dept_name) VALUES
(1, 'Science'),
(2, 'Commerce'),
(3, 'Arts'),
(4, 'Sports');

--------------------------------------------------------

-- Create students table
CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50),
    marks INT,
    dept_id INT
);

INSERT INTO students (student_id, student_name, marks, dept_id) VALUES
(1, 'Arun', 85, 1),
(2, 'Priya', 92, 2),
(3, 'Karthik', 76, 1),
(4, 'Meena', 89, 3),
(5, 'John', 55, 2),
(6, 'Divya', 95, 3);

select student_name,marks from students where marks > (select avg(marks) as avg_marks from students);

select student_name,marks from students order by marks desc limit 1;

select s.student_name,d.dept_name,s.marks from students s join  stud_dept d on s.dept_id= d.dept_id where 
s.dept_id in (select dept_id from students group by dept_id having avg(marks)>80);

select max(marks) from students where marks < (select max(marks) from students);

select student_name,marks from students  where marks > (select marks from students where student_name='Priya');

select s.student_name,d.dept_name from students s join stud_dept d on s.dept_id=d.dept_id where marks>90;

select s.student_name,d.dept_name from students s right join stud_dept d on s.dept_id=d.dept_id where s.student_name is null;

select student_name,marks from students order by marks desc limit 2; 

select s.student_name,d.dept_name,s.marks from students s join stud_dept d on s.dept_id=d.dept_id
where s.marks in (select min(marks) from students where dept_id=s.dept_id) ;

select s.student_name,d.dept_name,s.marks avg_marks from students s join stud_dept d on s.dept_id=d.dept_id 
where s.marks > (select avg(marks) from students where dept_id=s.dept_id);
 







