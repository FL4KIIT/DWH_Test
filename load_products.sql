CREATE OR ALTER PROCEDURE dwh.load_products
AS
BEGIN
    MERGE dwh.products AS tgt
    USING stage.tovari AS src
    ON tgt.product_id = src.product_id

    WHEN MATCHED THEN
        UPDATE SET
            name = src.name,
            description = src.description,
            price = src.price

    WHEN NOT MATCHED THEN
        INSERT (product_id,name,description,price,created_at)
        VALUES (src.product_id,src.name,src.description,src.price,src.created_at);
END;