-- 2.number of different products?
select distinct count(*) from products p ;
 
-- 6. list of countries covered by delivery
select count(distinct o.ship_country) from orders o; 
 
select distinct o.ship_country as country from orders o
order by country;
 
-- 7. list of available transporters
 
select count(1) from shippers s;
select s.company_name from shippers s;
 
-- 8.number of customer per countries
select count(1) from customers c;
 
select c.country,count(c.customer_id) as cnt from customers c
group by c.country
order by cnt desc;
 
--  9. number of orders which are "ordered" but not shipped
select count(1) from orders;
select * from orders
where
    orders.shipped_date is null 
    and orders.order_date is not null;
 
-- 10.  all the orders from france and belgium
select * from orders
where
    orders.ship_country ilike 'FRANCE'
    or orders.ship_country ilike 'BELGIUM';
 
select * from orders
where
    upper(orders.ship_country) in ('FRANCE', 'BELGIUM');
 
-- 11. most expensive products
select * from products p
order by p.unit_price desc 
limit 5;
 
-- 12. list of discontinued products
select p.product_name, p.discontinued from products p
where p.discontinued = 1
order by p.product_name;
 
-- 13. count of product per category
select c.category_name, count(p.product_id) from products p 
left join categories c on c.category_id =p.category_id 
group by c.category_name;
 
-- 14. average order price
select avg( (1-discount) * unit_price * quantity) from order_details od;
 
select avg(sumPerOrder) 
from (
    select order_id, sum((1-discount) * unit_price * quantity) as sumPerOrder
    from order_details od 
    group by order_id
) sumSelect;