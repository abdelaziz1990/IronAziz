-- 1. From the order_items table, find the price of the highest priced order and lowest price order?

select * from order_items;
select sum(price) as pr, order_item_id from order_items group by order_item_id limit 1;
select sum(price) as pr, order_item_id from order_items group by order_item_id desc limit 1;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
select * from order_items;
select shipping_limit_date ,order_id from order_items order by shipping_limit_date;

-- 3. From the customers table, find the states with the greatest number of customers?
select * from customers;
select customer_state, count(customer_id) as cv from customers group by customer_state order by cv desc limit 1;

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.

select customer_state, count(customer_id) as cv, customer_city  from customers group by customer_state order by cv desc limit 1;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
select * from closed_deals;
select distinct business_segment  from closed_deals where business_segment is not null;

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

select sum(declared_monthly_revenue) as su, business_segment from closed_deals  group by business_segment  having count(*)>1 order by su desc limit 3;

-- 7. From the order_reviews table, find the total number of distinct review score values.
select * from order_reviews;
select   count(distinct review_score) as total from order_reviews;
-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
select * from order_reviews;
alter table order_reviews add new_column nvarchar(50);
select * from order_reviews;
UPDATE  order_reviews
set new_column = (select review_id,review_score from order_reviews order by review_score);
UPDATE  order_reviews
set new_column = review_id where   review_score between 1 and 5  ;
select * from order_reviews;

