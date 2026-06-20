CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1,1001,1,2,240),
(2,1002,4,3,180),
(3,1003,5,1,250),
(4,1003,8,2,100),
(5,1004,1,2,240),
(6,1004,6,2,90),
(7,1004,8,1,30),
(8,1005,2,3,150);