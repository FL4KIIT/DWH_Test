CREATE TABLE dwh.products (
    dwh_product_id INT IDENTITY PRIMARY KEY,
    product_id NVARCHAR(20),
    name NVARCHAR(200),
    description NVARCHAR(500),
    price DECIMAL(10,2),
    weight DECIMAL(10,3),
    valid_from DATETIME2,
    valid_to DATETIME2,
    is_active BIT,
    created_at DATETIME2
);