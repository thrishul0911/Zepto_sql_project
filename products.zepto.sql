CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);

INSERT INTO Products VALUES
(1,'Apple',1,120,100),
(2,'Banana',1,50,150),
(3,'Tomato',2,40,200),
(4,'Milk',3,60,120),
(5,'Cheese',3,250,50),
(6,'Coke',4,45,180),
(7,'Pepsi',4,40,170),
(8,'Chips',5,30,250),
(9,'Biscuits',5,25,300),
(10,'Orange',1,90,90);

-- Find highest priced product
SELECT *
FROM Products
ORDER BY price DESC
LIMIT 1;

-- Find total stock available
SELECT SUM(stock_quantity) AS Total_Stock
FROM Products;

-- Find products costing more than ₹100
SELECT *
FROM Products
WHERE price > 100;

-- Find top selling products
SELECT p.product_name,
       SUM(oi.quantity) AS TotalSold
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY TotalSold DESC;

-- Find products never ordered
SELECT product_name
FROM Products
WHERE product_id NOT IN
(
SELECT product_id
FROM Order_Items
);