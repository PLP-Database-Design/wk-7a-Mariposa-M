-- Question 1 Achieving 1NF (First Normal Form) 🛠️
-- Task:
-- You are given the following table ProductDetail:
-- OrderID	CustomerName	Products
-- 101	John Doe	Laptop, Mouse
-- 102	Jane Smith	Tablet, Keyboard, Mouse
-- 103	Emily Clark	Phone
-- In the table above, the Products column contains multiple values, which violates 1NF.
-- Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order
CREATE TABLE
    OrderDetails (
        orderID INT NOT NULL,
        productName VARCHAR(100),
        FOREIGN KEY (orderID) REFERENCES Orders (orderID)
    );

CREATE TABLE
    Orders (
        orderID INT PRIMARY KEY,
        customerName VARCHAR(100) NOT NULL
    );

-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- You are given the following table OrderDetails, which is already in 1NF but still contains partial dependencies:
-- OrderID	CustomerName	Product	Quantity
-- 101	John Doe	Laptop	2
-- 101	John Doe	Mouse	1
-- 102	Jane Smith	Tablet	3
-- 102	Jane Smith	Keyboard	1
-- 102	Jane Smith	Mouse	2
-- 103	Emily Clark	Phone	1
-- In the table above, the CustomerName column depends on OrderID (a partial dependency), which violates 2NF.
-- Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.
CREATE TABLE
    Products (
        productID INT PRIMARY KEY,
        productName VARCHAR(100) NOT NULL
    );

CREATE TABLE
    Customers (
        customerID INT PRIMARY KEY,
        firstName VARCHAR(50) NOT NULL,
        lastName VARCHAR(50) NOT NULL
    );

CREATE TABLE
    Orders (
        orderID INT PRIMARY KEY,
        customerID INT NOT NULL,
        FOREIGN KEY (customerID) REFERENCES customers (customerID),
    );

CREATE TABLE
    OrderDetails (
        orderID INT NOT NULL, 
        productID INT NOT NULL,
        productQuantity INT NOT NULL,
        FOREIGN KEY (orderID) REFERENCES Orders (orderID),
        FOREIGN KEY (productID) REFERENCES products (productID)
    );
