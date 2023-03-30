-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
SELECT Name FROM Products;
-- 1.2 Select the names and the prices of all the products in the store.
SELECT name, price FROM products;
-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT name FROM products WHERE price <= 200;
-- 1.4 Select all the products with a price between $60 and $120.
SELECT * FROM products WHERE price BETWEEN 60 AND 120;
SELECT * FROM products WHERE price >= 60 AND price <= 120;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT name, price*100 FROM products
-- 1.6 Compute the average price of all the products.
SELECT AVG(price) FROM products;
SELECT SUM(price)/COUNT(price) FROM products;
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(price) FROM products WHERE Manufacturer = 2;
-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(name) FROM products WHERE price >= 180
-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name, price FROM products WHERE price >=180 ORDER BY price desc, name asc
-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT a.*, b.name FROM Products a, Manufacturer b WHERE a.manufacturer = b.code
-- 1.11 Select the product name, price, and manufacturer name of all the products.
select a.name, a.price, b.name from products a join Manufacturers b on(a.manufacturer = b.code);
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;
-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select b.name, AVG(a.price) from products a join Manufacturers b on(a.manufacturer = b.code) GROUP BY b.name
-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
select b.name from products a join Manufacturers b on(a.manufacturer = b.code) GROUP BY b.name HAVING AVG(a.price) >= 150
-- 1.15 Select the name and price of the cheapest product.
SELECT name, price FROM Products WHERE price = (SELECT min(price) FROM products)
-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select b.name, a.name, a.price from products a join Manufacturers b on(a.manufacturer = b.code) WHERE a.price = (
    SELECT max(c.price) FROM products c WHERE c.manufacturer = a. manufacturer
)
-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO products values (11, 'Loudspeakers', 70, 2)
-- 1.18 Update the name of product 8 to "Laser Printer".
update products
set name = "Laser Printer"
WHERE Code = 8
-- 1.19 Apply a 10% discount to all products.
update products
set price = 0.9 * price
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120..
update products
set price = 0.9 * price
where price >= 120
