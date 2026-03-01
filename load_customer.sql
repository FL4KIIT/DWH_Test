CREATE OR ALTER PROCEDURE dwh.load_customer
AS
BEGIN
    MERGE dwh.customer AS tgt
    USING stage.klienti AS src
    ON tgt.customer_id = src.customer_id

    WHEN MATCHED THEN
        UPDATE SET
            subname = src.subname,
            name = src.name,
            phone_number = src.phone_number,
            city = src.city,
            Registrated_date = src.Registrated_date

    WHEN NOT MATCHED THEN
        INSERT (customer_id,subname,name,phone_number,city,Registrated_date)
        VALUES (src.customer_id,src.subname,src.name,src.phone_number,src.city,src.Registrated_date);
END;