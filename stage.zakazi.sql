CREATE TABLE stage.zakazi (
    order_id NVARCHAR(20) PRIMARY KEY,
    customer_id INT,
    product_id NVARCHAR(20),
    quantity INT,
    order_dt DATE,
    amount DECIMAL(10,2),
    status NVARCHAR(20),
    created_at DATETIME2,
    updated_at DATETIME2
);