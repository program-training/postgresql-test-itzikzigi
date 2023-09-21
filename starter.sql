--1
SELECT * FROM employees


--3
SELECT first_name, last_name , city
FROM employees
WHERE country = 'USA'
AND city NOT LIKE 'Seattle'


--5
WITH counter AS
(SELECT COUNT(product_id) AS category_count, category_id 
FROM products 
GROUP BY category_id)
SELECT category_id 
FROM counter
WHERE category_count > 10
ORDER BY category_id


--6
WITH counter AS
(SELECT COUNT(product_id) AS category_count, category_id 
FROM products 
GROUP BY category_id)
SELECT category_name 
FROM categories JOIN counter
ON categories.category_id = counter.category_id
AND category_count > 10


--8
SELECT first_name , last_name,  territory_description 
FROM employees JOIN employee_territories
ON employees.employee_id = employee_territories.employee_id
JOIN territories
ON employee_territories.territory_id = territories.territory_id


--9
SELECT first_name, last_name, COUNT(order_id)
FROM employees JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY first_name, last_name
HAVING COUNT(order_id) > 100
