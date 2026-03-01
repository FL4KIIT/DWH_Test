CREATE OR ALTER PROCEDURE mart.calc_top_products
AS
BEGIN
    TRUNCATE TABLE mart.top_products_by_city;

    WITH sales AS (
        SELECT 
            c.city,
            p.name,
            SUM(o.quantity) AS total_qty,
            SUM(o.amount) AS total_amount
        FROM dwh.orders o
        JOIN dwh.customer c 
            ON o.dwh_customer_id = c.dwh_customer_id
        JOIN dwh.products p 
            ON o.dwh_product_id = p.dwh_product_id
        GROUP BY c.city, p.name
    )
    INSERT INTO mart.top_products_by_city
    SELECT city, name, total_qty, total_amount, rn
    FROM (
        SELECT *,
            ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_qty DESC) rn
        FROM sales
    ) t
    WHERE rn <= 5;
END;