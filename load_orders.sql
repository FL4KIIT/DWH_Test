CREATE OR ALTER PROCEDURE dwh.load_orders
AS
BEGIN
    MERGE dwh.orders AS tgt
    USING (
        SELECT 
            z.order_id,
            c.dwh_customer_id,
            p.dwh_product_id,
            z.quantity,
            z.order_dt,
            z.amount,
            z.status,
            z.created_at,
            z.updated_at
        FROM stage.zakazi z
        JOIN dwh.customer c 
            ON z.customer_id = c.customer_id
        JOIN dwh.products p 
            ON z.product_id = p.product_id
    ) AS src
    ON tgt.order_id = src.order_id

    WHEN MATCHED THEN
        UPDATE SET
            quantity = src.quantity,
            amount = src.amount,
            status = src.status,
            updated_at = src.updated_at

    WHEN NOT MATCHED THEN
        INSERT (
            order_id,
            dwh_customer_id,
            dwh_product_id,
            quantity,
            order_dt,
            amount,
            status,
            created_at,
            updated_at
        )
        VALUES (
            src.order_id,
            src.dwh_customer_id,
            src.dwh_product_id,
            src.quantity,
            src.order_dt,
            src.amount,
            src.status,
            src.created_at,
            src.updated_at
        );
END;