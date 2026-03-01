CREATE TABLE dwh.orders (
    dwh_order_id INT IDENTITY PRIMARY KEY,
    order_id NVARCHAR(20) UNIQUE,
    dwh_customer_id INT,
    dwh_product_id INT,
    quantity INT,
    order_dt DATE,
    amount DECIMAL(10,2),
    status NVARCHAR(20),
    created_at DATETIME2,
    updated_at DATETIME2
);