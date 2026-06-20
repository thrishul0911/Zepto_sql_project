CREATE DATABASE ZeptoDB;
USE ZeptoDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO Customers VALUES
(101,'Rahul','Hyderabad','9876543210'),
(102,'Sneha','Mumbai','9876543211'),
(103,'Amit','Bangalore','9876543212'),
(104,'Priya','Delhi','9876543213'),
(105,'Kiran','Pune','9876543214');

select * from customers;


-- Find total number of customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- Find customer who placed the most orders
SELECT customer_id,
       COUNT(*) AS TotalOrders
FROM Orders
GROUP BY customer_id
ORDER BY TotalOrders DESC
LIMIT 1;

-- Find customers who spent more than ₹300
SELECT c.customer_name,
       SUM(o.total_amount) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 300;

-- Find top 3 customers by spending
SELECT c.customer_name,
       SUM(o.total_amount) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY TotalSpent DESC
LIMIT 3;
