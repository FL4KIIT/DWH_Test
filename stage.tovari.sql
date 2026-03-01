CREATE TABLE stage.tovari (
    product_id NVARCHAR(20) PRIMARY KEY,
    name NVARCHAR(200),
    description NVARCHAR(500),
    price DECIMAL(10,2),
    weight DECIMAL(10,3) NULL,
    created_at DATETIME2
);