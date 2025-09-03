USE JOINS;
SHOW TABLES;
select  c.cust_name,o.order_amount from 
customers as c 
inner join orders as o on c.cust_id=o.cust_id;

select c.cust_name,o.order_amount from 
customers as c
inner join orders as o on c.cust_id=o.cust_id order by order_amount desc limit 1;

select  c.cust_name,o.order_amount from 
customers as c 
left join orders as o on c.cust_id=o.cust_id;

select  c.cust_name,o.order_amount from 
customers as c 
right join orders as o on c.cust_id=o.cust_id;

select c.cust_name,o.order_detail from 
customers as c join orders as o on c.cust_id=o.cust_id;



select * from customers as C 
inner join orders as O on C.cust_id=O.cust_id;

select C.cust_name ,C.city,O.order_detail from Customers as C
join orders as O on C.city='Velachery';

select C.cust_name,sum(O.order_amount) as total_order from customers as C join orders as O ON C.cust_id=O.cust_id group by C.cust_name;

select C.cust_name ,O.order_detail from customers as C left join orders as O ON C.cust_id=O.cust_id where O.order_detail IS NULL;

select C.cust_name,O.order_amount from customers as C join orders O on  C.cust_id=O.cust_id order by O.order_amount desc limit 1;

select C.cust_name,O.order_detail from customers as C left join orders as O ON C.cust_id = O.cust_id;

select C.cust_name ,count(O.order_detail) as No_orders  from customers as C left join orders as O ON C.cust_id = O.cust_id group by C.cust_name ;

select C.cust_name,count(O.order_detail) as Order_Count from customers as C join orders as O ON C.cust_id=O.cust_id group by C.cust_name having count(O.order_detail)>1;

select O.order_detail,C.city,C.cust_name from  customers C join orders O On C.cust_id=O.cust_id ;

select C.cust_name,O.order_detail from customers C join orders O ON C.cust_id=O.cust_id where O.order_detail='Briyani';

select C.cust_name,C.city,O.order_detail from customers C left join orders O ON C.cust_id=O.cust_id where C.City='Velachery';

select C.city,sum(O.order_amount) from customers C join orders O On C.cust_id = O.cust_id group by C.city;

select order_detail,count(order_detail) as Most_ordered_item from Orders  group by order_detail having count(order_detail) ;

select C.cust_name,sum(O.order_amount) as Total_amt from customers C left join orders O on C.cust_id=O.cust_id group by C.cust_name having sum(O.order_amount) >200;

select C.cust_name,C.city,coalesce(O.order_detail,'No Order')as order_detail from customers as C 
left join orders as O on C.cust_id=O.cust_id ;

select current_timestamp() as Date_and_Time;

select cust_name from customers  union select order_detail from orders; 

select city from customers union all select order_detail from orders;

