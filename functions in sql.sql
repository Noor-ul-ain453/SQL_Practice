DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

        --agregate function
SELECT * FROM products;

-- Total Quantity Available of all products
SELECT SUM(quantity) AS total_quantity 
FROM products;

SELECT SUM(quantity) AS quantity_of_ele
FROM products
WHERE category='Electronics' AND price > 20000 ;

-- Total number of products

SELECT COUNT(*) AS total_products
FROM products;

-- count with condition

SELECT COUNT(*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';


-- Average Price of Products
SELECT AVG(price) AS average_price
FROM products;

-- Average Price of Products with condition
SELECT AVG(price) AS average_price
FROM products
WHERE category='Accessories' OR added_date > '2024-02-01';

SELECT * FROM products;


-- Maximum and Minimum price

SELECT MAX(price) AS MAX_PRICE,
		MIN(PRICE) AS MIN_PRICE
FROM products;

      --string function
 -- Get all the categories in Lowercase

SELECT LOWER(category) AS Catergory_Capital
FROM products;



-- Join Product_name adn category text with hypen.
SELECT CONCAT(product_name,'-',category) As product_details
FROM products;

-- Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name, 1,5) AS short_name
FROM products;

-- Count length
SELECT product_name, LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;


--Remove leading and trailing spaces from string
 SELECT LENGTH(TRIM('  Monitor    ')) AS Trimmed_Text;
 SELECT LENGTH('  Monitor    ') AS Trimmed_Text;


-- Replace the word "phone" with "device" in product names
SELECT REPLACE(product_name, 'phone','device') AS updated
FROM products;


-- Get the first 3 characters from category

SELECT RIGHT(category, 3) AS Catergory_Capital
FROM products;

SELECT * from products;

        --date and time function
-- 1. NOW() – Get Current Date and Time

SELECT NOW() AS Current_Datetime;


-- 2. CURRENT_DATE() – Get Current Date
SELECT CURRENT_DATE AS today_date;

SELECT Added_date, Current_Date, (CURRENT_DATE- added_date) AS Days_difference
FROM products;


-- 3. EXTRACT() – Extract Parts of a Date
-- Extract the year, month, and day from the added_date column.

SELECT product_name,
		EXTRACT(YEAR FROM added_date) AS Year_Added,
		EXTRACT(MONTH FROM added_date) AS Month_Added,
		EXTRACT(DAY FROM added_date) AS Day_Added
FROM products;

-- 4. AGE() – Calculate Age Between Dates
-- Calculate the time difference between added_date and today’s date.

SELECT product_name,
	AGE(CURRENT_DATE, added_date) AS Age_since_added
FROM products;
  	
-- 5. TO_CHAR() – Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).

SELECT product_name,
	TO_CHAR(added_date, 'MM-DD-YYYY') AS FORMATED_DATE
FROM products;


-- 6. DATE_PART() – Get Specific Date Part
-- Extract the day of the week from added_date.

SELECT product_name, added_date,
		DATE_PART('month', added_date) AS day_of_week
FROM products;

-- 7. DATE_TRUNC() – Truncate Date to Precision
-- Truncate added_date to the start of the month.


SELECT product_name, added_date,
		DATE_TRUNC('week', added_date) AS week_start,
		DATE_PART('isodow', added_date) AS day_of_week
FROM products;

-- 8. INTERVAL – Add or Subtract Time Intervals
-- Add 6 months to the added_date.

SELECT product_name, added_date,
		added_date + INTERVAL '6 months' AS new_date
FROM products;

-- 9. CURRENT_TIME() – Get Current Time
--Retrieve only the current time.

SELECT CURRENT_TIME AS current_time;

-- 10. TO_DATE() – Convert String to Date
-- Convert a string to a date format.

SELECT TO_DATE('28-11-2024', 'DD-MM-YYYY') AS converted_date;
SELECT * from products;

     --conditional functions
/* 1. CASE Function – Categorizing Based on Conditions
 We will categorize products into price ranges:

Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/

SELECT product_name, price,
		CASE
			WHEN price>=50000 THEN 'Expensive'
			WHEN price>=10000 AND price<=49999 THEN 'Moderate'
			ELSE 'Affordable'
		END AS price_category
FROM products;
/* 2. CASE with AND & OR Operators – Stock Status
We will classify products based on quantity available:

In Stock if quantity is 10 or more.
Limited Stock if quantity is between 5 and 9.
Out of Stock Soon if quantity is less than 5.
*/


SELECT product_name, quantity, 
		CASE
			WHEN quantity >=10 THEN 'InStock'
			WHEN quantity BETWEEN 6 AND 9 THEN 'Limited stock'
			ELSE 'Out of stock soon'
		END AS stock_status
FROM products;



/* 3. CASE with LIKE Operator – Category Classification
Check if the category name contains "Electronics" or "Furniture" using LIKE.
*/


SELECT product_name, category, 
		CASE
			WHEN category LIKE 'Electronics%' THEN 'Electronic Item'
			WHEN category LIKE 'Furniture%' THEN 'Furniture Item'
			ELSE 'Accessory Item'
		END AS category_Status
FROM products;



SELECT * FROM products;

ALTER TABLE products
DROP COLUMN discount_price;

ALTER TABLE products 
ADD COLUMN discount_price NUMERIC(10,2);



UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop','Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN('Laptop','Desk');


SELECT product_name, price, discount_price 
FROM products;


SELECT product_name, 
		COALESCE(discount_price, price) AS Final_price
FROM products;

SELECT * FROM products;

           --window function
-- Assign a unique row number to each product within the same category.

SELECT product_name, category, price,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS Ranking
FROM products;


SELECT product_name, category, price,
		sum(price) OVER(PARTITION BY category ORDER BY price ASC) AS Running_Total
FROM products;
