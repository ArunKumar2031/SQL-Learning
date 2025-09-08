-- Data_Base created 
create database movie_ticket_booking;
use movie_ticket_booking;
show tables;
desc users;
-- Users table
create table users
(user_id int auto_increment primary key,
name varchar(20),email varchar(50) unique,
phone int unique);

alter table users modify phone varchar(15);

-- Movie details
create table movies
(movie_id int primary key auto_increment,
title varchar(20),genere varchar(20),
language varchar(20),duration time);
-- theater details
create table theater
(theater_id int auto_increment primary key ,
theater_name varchar(50),
location varchar(30));

-- Show details
create table shows
(show_id int primary key auto_increment,
movie_id int ,theater_id int, 
show_time datetime,price int,
foreign key(movie_id) references movies(movie_id),
foreign key(theater_id)references theater(theater_id));
  
-- Booking details
create table bookings
(booking_id int auto_increment primary key,
user_id int,show_id int,seats_booked varchar(20),
booking_date datetime ,
foreign key (user_id)references users(user_id),
foreign key (show_id)references shows(show_id));

-- User Details
INSERT INTO users (name, email, phone) VALUES
('Arjun Kumar', 'arjun@example.com', 9876543210),
('Meera Nair', 'meera@example.com', 9876501234),
('Ravi Singh', 'ravi@example.com', 9876512345),
('Priya Sharma', 'priya@example.com', 9876523456),
('Karthik Iyer', 'karthik@example.com', 9876534567);
-- Movie Details
INSERT INTO movies (title, genere, language, duration) VALUES
('Inception', 'Sci-Fi', 'English', '02:28:00'),
('RRR', 'Action', 'Telugu', '03:05:00'),
('Dangal', 'Drama', 'Hindi', '02:45:00'),
('KGF 2', 'Action', 'Kannada', '02:48:00'),
('Interstellar', 'Sci-Fi', 'English', '02:49:00');
-- Theater details
INSERT INTO theater (theater_name, location) VALUES
('PVR Cinemas', 'Bangalore'),
('INOX', 'Chennai'),
('Cinepolis', 'Hyderabad'),
('Sathyam Cinemas', 'Chennai'),
('Miraj Cinemas', 'Mumbai');
select * from theater;
-- Shows Details
INSERT INTO shows (movie_id, theater_id, show_time, price) VALUES
(1, 1, '2025-09-07 18:30:00', 250),  -- Inception at PVR
(2, 2, '2025-09-07 20:00:00', 200),  -- RRR at INOX
(3, 3, '2025-09-07 19:00:00', 180),  -- Dangal at Cinepolis
(4, 4, '2025-09-07 21:00:00', 220),  -- KGF 2 at Sathyam
(5, 5, '2025-09-07 17:30:00', 300),  -- Interstellar at Miraj
(2, 1, '2025-09-08 15:00:00', 210),  -- RRR at PVR
(3, 2, '2025-09-08 16:00:00', 190),  -- Dangal at INOX
(1, 3, '2025-09-08 14:00:00', 240);  -- Inception at Cinepolis
-- bookings details
INSERT INTO bookings (user_id, show_id, seats_booked, booking_date) VALUES
(1, 1, 2, '2025-09-06 10:15:00'), -- Arjun booked 2 seats for Inception at PVR
(2, 2, 4, '2025-09-06 11:20:00'), -- Meera booked 4 seats for RRR at INOX
(3, 3, 3, '2025-09-06 12:45:00'), -- Ravi booked 3 seats for Dangal at Cinepolis
(4, 4, 5, '2025-09-06 14:00:00'), -- Priya booked 5 seats for KGF 2 at Sathyam
(5, 5, 2, '2025-09-06 15:30:00'), -- Karthik booked 2 seats for Interstellar at Miraj
(1, 2, 1, '2025-09-07 10:00:00'), -- Arjun again booked 1 seat for RRR at INOX
(2, 1, 2, '2025-09-07 11:00:00'), -- Meera booked Inception at PVR
(3, 4, 1, '2025-09-07 13:00:00'); -- Ravi booked KGF 2 at Sathyam


-- List all users with their email and phone.
select name,email,phone from users;
-- Show all movies with their title, genre, and duration.
select title,genere,duration from movies;
-- Display all theatres located in Chennai.
select theatre_name from theater where location='Chennai';
-- Find all shows scheduled on 2025-09-07.
select t.title,s.show_time from shows s  join movies t on t.movie_id=s.movie_id where date(s.show_time)='2025-09-07 ';
-- Get details of the movie with the longest duration.
select title, genere, duration from movies where duration = (select max(duration) from movies);
-- Show all shows with movie title, theatre name, show time, and price.
select m.title,t.theater_name,s.show_time,s.price 
from movies m join theater t join shows s on
m.movie_id=s.movie_id and s.theater_id=t.theater_id;


-- List all movies playing in PVR Cinemas.
select m.title,t.theater_name
from movies m  join theater t join shows s on 
m.movie_id=s.movie_id and t.theater_id=s.theater_id
where t.theater_name='PVR Cinemas';
-- Find all shows of the movie “RRR” across all theatres.
select m.title,t.theater_name,s.show_time 
from movies m join theater t join shows s
on m.movie_id=s.movie_id and t.theater_id=s.theater_id where m.title='RRR';
-- Show the theatres where English movies are being screened.
select t.theater_name,m.title,m.genere,s.show_time 
from theater t join movies m join shows s on
m.movie_id=s.movie_id and t.theater_id=s.theater_id 
where m.language='English';
-- List all users and their bookings (include user name, movie title, seats booked).
select u.name,m.title,b.seats_booked ,s.show_time
from users u join movies m join bookings b join shows s on
u.user_id=b.user_id and m.movie_id=s.movie_id ;
-- Find the total number of users registered in the system.
select count(user_id) as total_no_users from users;


-- Count how many shows are scheduled for each movie.
select m.title,count(s.show_time) as  show_count
from movies m join shows s on 
m.movie_id=s.movie_id group by m.title ;
-- Calculate the average ticket price for each theatre.
select t.theater_name,avg(s.price) as avg_price 
from shows s join theater t on t.theater_id=s.theater_id 
group by t.theater_name;
-- Find the highest-priced show (movie name, theatre name, price).
select m.title,t.theater_name,s.price
from movies m join theater t join shows s on
m.movie_id=s.movie_id and t.theater_id=s.theater_id
order by s.price desc limit 1;
-- Show the total revenue per movie.
-- 👉 (Revenue = SUM(seats_booked * price) from bookings + shows)
select m.title,sum(b.seats_booked*s.price) as Revenue 
from movies m join shows s join bookings b on
m.movie_id = s.movie_id and s.show_id=b.show_id
group by m.title;


-- Find the users who have made bookings for the most expensive show.
select distinct u.name from users u join shows s join bookings b on 
u.user_id=b.user_id and s.show_id=b.show_id
 where price <  (select max(price)from shows );
 -- List movies that are playing in more than 1 theatre.
 select m.title,count(distinct t.theater_id) as count_movies from movies m join theater t join shows s on
 m.movie_id=s.movie_id and t.theater_id=s.theater_id 
 group by m.title having count(distinct t.theater_id)>1;
 -- Find the theatres that are screening the same movies as "RRR".
 select m.title,t.theater_name 
 from movies m join theater t join shows s on
 m.movie_id=s.movie_id and t.theater_id=s.theater_id 
 where m.movie_id in (select movie_id from movies where title='RRR');
 -- Show the details of users who booked more seats than the average number of seats booked.
 select u.name,sum(b.seats_booked) as avg_bookings  from users as u join bookings as b 
 on u.user_id=b.user_id group by u.name having avg(b.seats_booked)>(select avg(seats_booked) from bookings);
 -- List all movies that are not booked by any user.
select distinct m.title
from movies m
left join shows s on m.movie_id = s.movie_id
left join bookings b on s.show_id = b.show_id
where b.booking_id is null;

-- Window funtions 
-- Assign a row number to each show, ordered by show_time.
select m.title,t.theater_name,s.show_time,
row_number () over(order by show_time ) as Show_time
from movies m join theater t join shows s on
m.movie_id=s.movie_id and t.theater_id=s.theater_id;
-- For each theatre, rank the shows based on ticket price (highest = rank 1).
select t.theater_name,s.price,
rank()over(partition by t.theater_name order by s.price desc)as rank_
from theater t join shows s on
t.theater_id=s.theater_id ;
 -- For each movie, calculate the running total of seats booked (order by show_time).
 select m.title,s.show_time,
 sum(b.seats_booked)over(partition by m.title order by show_time) as total_seats
 from movies m join shows s join bookings b on
 m.movie_id=s.movie_id and s.show_id=b.show_id ;


