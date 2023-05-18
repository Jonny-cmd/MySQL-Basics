#Query 1 Order Customers by Name

USE sql_store;

SELECT *
FROM customers
-- WHERE CUSTOMER_ID=1
order by first_name;

#Query 2 work out points + 10

SELECT last_name, first_name, points, points + 10
FROM customers;


#Task 1 - Using Query 2 change the points to read times by 10 and plus 100.

SELECT last_name, first_name, points, points * 10 +100
FROM customers;

#Using Query 2 show discount facotor so the table now shows a discount header and changing the (point +10) *100

#Query to work out points and rename resulting column AS discount_factor

SELECT last_name, first_name, points, (points +10) * 100 AS discount_factor
FROM customers;


#Task 2
#Write a SQL query to return all the products in our database in the result set. I want you to show columns; name, unit price, 
#and new column called new price which is based on this expression, (unit price * 1.1 ).
#So what you are doing is increasing the product price of each by 10%. 
#So with the query we want all the products the original price and the new  price.  

SELECT name, unit_price, (unit_price * 1.1) AS new_price
FROM products;

#Task 3
#Find all the customer with a birth date of > '1990-01-01'
SELECT *
FROM customers
WHERE birth_date > '1990-01-01'

#Task 4 Find out product with most amount in stock

#EITHER limit order
select * 
from products
order by quantity_in_stock desc
limit 1;

#OR Nested
select name 
from products
where quantity_in_stock = (select max(quantity_in_stock) from products);


#Task 5 name of most expensive product
USE sql_inventory

select name 
from products
where unit_price = (select max(unit_price) from products);


#Task 6 find first name, last name, address and birthdate of oldest customer
use sql_store

SELECT first_name, last_name, address, birth_date
from customers
where birth_date = (select min(birth_date) from customers)









