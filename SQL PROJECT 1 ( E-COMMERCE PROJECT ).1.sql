-- CREATE DATABASE ECommerce_Project;
-- USE ECommerce_Project;-- 
-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT, -- Primary Key, automatically increments
--     first_name VARCHAR(50) NOT NULL,             -- Customer's first name
--     last_name VARCHAR(50) NOT NULL,              -- Customer's last name
--     email VARCHAR(100) UNIQUE NOT NULL,          -- Email, must be unique for each customer
--     phone_number VARCHAR(15),                    -- Optional phone number
--     join_date DATE NOT NULL                      -- Date the customer joined
-- );
-- INSERT INTO Customers (first_name, last_name, email, phone_number, join_date) VALUES
-- ('Alice', 'Johnson', 'alice.j@email.com', '555-0101', '2024-01-15'),
-- ('Bob', 'Williams', 'bob.w@email.com', '555-0102', '2024-02-20'),
-- ('Charlie', 'Brown', 'charlie.b@email.com', '555-0103', '2024-03-01'),
-- ('Diana', 'Prince', 'diana.p@email.com', '555-0104', '2024-04-10');
-- select * from Customers ;


-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary Key
--     product_name VARCHAR(100) NOT NULL UNIQUE,  -- Product name, must be unique
--     category VARCHAR(50) NOT NULL,              -- Product category (e.g., Electronics, Apparel)
--     unit_price DECIMAL(10, 2) NOT NULL,         -- Selling price
--     stock_quantity INT NOT NULL,                -- Current inventory level
--     
--     -- Constraint: Price must be positive
--     CHECK (unit_price > 0), 
--     
--     -- Constraint: Stock cannot be negative
--     CHECK (stock_quantity >= 0) 
-- );
-- INSERT INTO Products (product_name, category, unit_price, stock_quantity) VALUES
-- ('Smartphone X10', 'Electronics', 699.99, 50),
-- ('Cotton T-Shirt', 'Apparel', 19.99, 200),
-- ('Wireless Mouse', 'Electronics', 25.50, 120),
-- ('Organic Coffee Beans', 'Grocery', 12.00, 80);
-- select * from Products ;


-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY AUTO_INCREMENT,    -- Primary Key
--     customer_id INT NOT NULL,                   -- Foreign Key linking to the Customers table
--     order_date DATE NOT NULL,                   -- Date the order was placed
--     shipping_status VARCHAR(20) DEFAULT 'Pending', -- Status with a default value
--     
--     -- Foreign Key definition
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
--         ON UPDATE CASCADE                       -- If customer_id changes, update here
--         ON DELETE RESTRICT                      -- Prevent deleting a customer who has orders
-- );
-- INSERT INTO Orders (customer_id, order_date, shipping_status) VALUES
-- (1, '2024-05-01', 'Shipped'),
-- (2, '2024-05-05', 'Delivered'),
-- (1, '2024-05-10', 'Pending'),
-- (3, '2024-05-12', 'Shipped');


-- CREATE TABLE Order_Details (
--     order_id INT NOT NULL,                      -- Foreign Key to Orders table
--     product_id INT NOT NULL,                    -- Foreign Key to Products table
--     quantity INT NOT NULL,                      -- Quantity of the product ordered
--     discount DECIMAL(4, 2) DEFAULT 0.00,        -- Discount applied (e.g., 0.10 for 10%)
--     
--     -- Composite Primary Key: ensures the same product can't be added twice to the same order
--     PRIMARY KEY (order_id, product_id),
--     
--     -- Foreign Key constraints
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id)
--         ON DELETE CASCADE,                      -- If an order is deleted, delete the details
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
--         ON DELETE RESTRICT,                     -- Prevent deleting a product that's been ordered
--         
--     -- Constraint: Quantity must be positive
--     CHECK (quantity > 0)
-- );
-- INSERT INTO Order_Details (order_id, product_id, quantity, discount) VALUES
-- (1, 1, 1, 0.00),   -- Alice bought 1 Smartphone X10
-- (1, 3, 2, 0.00),   -- Alice bought 2 Wireless Mouse
-- (2, 2, 5, 0.10),   -- Bob bought 5 T-Shirts (10% discount)
-- (3, 4, 3, 0.00),   -- Alice bought 3 Coffee Beans
-- (4, 3, 1, 0.00);


-- CREATE TABLE Suppliers (
--     supplier_id INT PRIMARY KEY AUTO_INCREMENT, -- Primary Key
--     supplier_name VARCHAR(100) NOT NULL UNIQUE, -- Supplier name
--     contact_name VARCHAR(50),                   -- Main contact person
--     country VARCHAR(50) NOT NULL                -- Supplier's country of origin
-- );
-- INSERT INTO Suppliers (supplier_name, contact_name, country) VALUES
-- ('Tech-Source Inc.', 'Maria Lopez', 'USA'),
-- ('Global Fabrics Ltd.', 'Kenji Tanaka', 'Japan'),
-- ('Fresh Produce Co.', 'Simon Rhee', 'South Korea');


-- CREATE TABLE Product_Suppliers (
--     product_id INT NOT NULL,                    -- Foreign Key to Products table
--     supplier_id INT NOT NULL,                   -- Foreign Key to Suppliers table
--     supply_price DECIMAL(10, 2),                -- Cost price from this specific supplier
--     
--     -- Composite Primary Key
--     PRIMARY KEY (product_id, supplier_id),
--     
--     -- Foreign Key constraints
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
--         ON DELETE CASCADE,
--     FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
--         ON DELETE CASCADE,
--         
--     -- Constraint: Supply price must be positive
--     CHECK (supply_price > 0)
-- );
-- INSERT INTO Product_Suppliers (product_id, supplier_id, supply_price) VALUES
-- (1, 1, 450.00), -- Smartphone X10 from Tech-Source
-- (2, 2, 8.50),   -- T-Shirt from Global Fabrics
-- (3, 1, 15.00),  -- Wireless Mouse from Tech-Source
-- (4, 3, 7.50);



-- CREATE INDEX idx_product_category
-- ON Products (category);
-- CREATE INDEX idx_order_date
-- ON Orders (order_date);

-- UPDATE Products
-- SET unit_price = unit_price * 1.10
-- WHERE product_name = 'Wireless Mouse';

-- UPDATE Orders
-- SET shipping_status = 'Delivered'
-- WHERE order_date < '2024-05-10' AND shipping_status = 'Shipped';

-- DELETE FROM Products
-- WHERE product_id = 10
-- AND stock_quantity = 0;-- 

