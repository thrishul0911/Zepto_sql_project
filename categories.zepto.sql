CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO Categories VALUES
(1,'Fruits'),
(2,'Vegetables'),
(3,'Dairy'),
(4,'Beverages'),
(5,'Snacks');

-- Display all products with category names
SELECT p.product_name,
       c.category_name,
       p.price
FROM Products p
JOIN Categories c
ON p.category_id = c.category_id;

-- Find total sales by category
SELECT c.category_name,
       SUM(oi.subtotal) AS Sales
FROM Categories c
JOIN Products p
ON c.category_id = p.category_id
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name;