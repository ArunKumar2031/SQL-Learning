CREATE DATABASE walmart;
USE walmart;

CREATE TABLE sales (
    invoice_id      VARCHAR(30) PRIMARY KEY,
    branch          CHAR(1),                -- Branch code (A, B, C)
    city            VARCHAR(50),            -- City name
    customer_type   VARCHAR(20),            -- e.g. Member, Normal
    gender          VARCHAR(10),            -- Male, Female
    product_line    VARCHAR(100),           -- Product category
    unit_price      DECIMAL(10,2),          -- Price per unit
    quantity        INT,                    -- Number of items bought
    tax_5           DECIMAL(10,2),          -- VAT = 5% of total
    total           DECIMAL(10,2),          -- Total incl. VAT
    date            DATE,                   -- Purchase date
    time            TIME,                   -- Purchase time
    payment         VARCHAR(20),            -- Payment method
    cogs            DECIMAL(10,2),          -- Cost of Goods Sold (before VAT)
    gross_margin_pct DECIMAL(10,2),         -- % margin
    gross_income    DECIMAL(10,2),          -- Profit
    rating          DECIMAL(3,1)            -- Customer rating (1–10)
);
INSERT INTO sales VALUES
('750-67-8428', 'A', 'Yangon', 'Member', 'Female', 'Health and beauty', 74.69, 7, 26.14, 548.54, '2019-01-05', '13:08:00', 'Ewallet', 522.40, 4.76, 26.14, 9.1),
('226-31-3081', 'C', 'Naypyitaw', 'Normal', 'Female', 'Electronic accessories', 15.28, 5, 3.82, 80.22, '2019-03-08', '10:29:00', 'Cash', 76.40, 4.76, 3.82, 9.6),
('631-41-3108', 'B', 'Mandalay', 'Member', 'Male', 'Home and lifestyle', 46.33, 7, 16.22, 339.55, '2019-03-03', '13:23:00', 'Credit card', 323.33, 4.76, 16.22, 7.4),
('123-19-1176', 'A', 'Yangon', 'Normal', 'Male', 'Food and beverages', 37.84, 2, 3.78, 79.46, '2019-01-27', '17:15:00', 'Ewallet', 75.68, 4.76, 3.78, 8.5),
('373-73-7910', 'A', 'Yangon', 'Member', 'Female', 'Fashion accessories', 40.35, 3, 6.05, 127.10, '2019-02-08', '16:57:00', 'Cash', 121.05, 4.76, 6.05, 6.8);

select * from sales;

select  city, count(distinct city)  as No_of_city  from sales group by city;

select distinct branch,city from sales ;

select count(distinct product_line) as Products from sales;

select  payment,count(payment) as payment_methods from sales group by payment order by count(payment) desc limit 1 ;

select product_line,sum(total) as high from sales group by product_line order by sum(total) desc limit 1;

SELECT MONTHNAME(date) AS Month_name, SUM(total) AS product_income FROM sales GROUP BY MONTHNAME(date);

SELECT MONTHNAME(DATE) AS Month_name ,SUM(COGS) as goods_count from sales group by	monthname(DATE) ORDER BY SUM(COGS) DESC LIMIT 1;

SELECT PRODUCT_LINE,SUM(TOTAL) AS HIGH_REV FROM SALES GROUP BY PRODUCT_LINE order by SUM(TOTAL) DESC LIMIT 1;