create database College;
use College;
create table students(rollno int, name varchar(20),Deparment varchar(20));
insert into students values(001,'Arun','CSE'),(002,'Allwin','EEE'),(003,'Guru','AI&DS'),(004,'Ranjith','Mech');
select * from students;
ALTER TABLE STUDENTS ADD COLUMN(Marks int);
drop table students;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM STUDENTS WHERE MARKS = 100;
ALTER TABLE STUDENTS MODIFY COLUMN rollno varchar(10);
ALTER TABLE students DROP COLUMN Marks;
ALTER TABLE students RENAME column Deparment to dept;
ALTER TABLE students CHANGE COLUMN dept Department varchar(50);
ALTER TABLE students DROP Department;
RENAME TABLE STUDENTS TO STUD; 
TRUNCATE TABLE STUD;
DROP TABLE STUD;


create table library(book_id int primary key,title varchar(50),author varchar(50),price decimal(6,2));
insert into library values(1,'SQL Basics','John Smith',299.50);
update library set price=350.00 where book_id=1;
delete from library where book_id=1;
alter table library add column published_year int ;
update library set published_year=2020 where book_id=1;
alter table library rename column title to book_title;
insert into library values(2,'Database Systems','Elmasri',450.00,2018);
select count(*) from library ;
select * from library;
alter table library drop column published_year;
alter table library add column publisher varchar(50);
UPDATE library SET publisher = 'Pearson' WHERE book_title = 'Database Systems';
delete from library where price < 100;
insert into library values(3,'Java Basics','Herbert schildt',350,'McGraw Hill');
delete from library where book_title='Java Basics' ;
select count(*) from library;
alter table library rename column book_title to title;






                         