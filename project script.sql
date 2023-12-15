create database sales_analysis;
create table orders(order_id varchar(50),Product varchar(100),Quantity_Ordered int ,Price_Each decimal(10,2),Purchase_Address varchar(50),Month varchar(2),
sales decimal(10,2),City varchar(50),Hour varchar(3));
load data infile"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/saleproject.csv" into table orders
fields terminated by "," ignore 1 lines;
select * from orders;
# products we sell
select Product,count(distinctrow product )from orders group by Product;
# Orders placed across the year(2019 to 2020 purchases)
select count(*) as orders_Placed from orders;
# Orders placed across the year(2019 to 2020 purchases) by products
select product,count(*) as orders_Placed from orders group by product order by count(*) desc;
# Orders by hours 
select Hour,count(*) as orders_Placed from orders group by hour order by count(*) desc;
# adding of a new column named period to identify what time the day most purchases were made
Select hour,Case
when Hour between 0 and 12 then 'early_morning'
when Hour between 13 and 19 then 'mid_morning'
else 'Night'
end as period from orders;
alter table orders add column period varchar(20);
update orders set Period=Case
when Hour between 0 and 12 then 'early_morning'
when Hour between 13 and 19 then 'mid_morning'
else 'Night'
end ;
# bulk orders
