CREATE TABLE dwh.customer (
    dwh_customer_id INT IDENTITY PRIMARY KEY,
    customer_id INT UNIQUE,
    subname NVARCHAR(100),
    name NVARCHAR(100),
    phone_number NVARCHAR(20),
    city NVARCHAR(100),
    Registrated_date DATE,
    load_dt DATETIME2 DEFAULT SYSDATETIME()
);