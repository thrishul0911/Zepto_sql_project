CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1001,101,'2025-05-01',240),
(1002,102,'2025-05-02',180),
(1003,103,'2025-05-03',350),
(1004,101,'2025-05-05',400),
(1005,104,'2025-05-07',150);

-- Find total sales amount
SELECT SUM(total_amount) AS Total_Sales
FROM Orders;

-- Find average order value
SELECT AVG(total_amount) AS Avg_Order_Value
FROM Orders;

-- Find monthly revenue
SELECT MONTH(order_date) AS MonthNo,
       SUM(total_amount) AS Revenue
FROM Orders
GROUP BY MONTH(order_date);