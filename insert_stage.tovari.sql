INSERT INTO stage.tovari (product_id,name,description,price,weight,created_at)
VALUES
('PR001','Йогурт клубничный','Йогурт 150 г',120,NULL,GETDATE()),
('PR002','Йогурт персиковый','Йогурт 200 г',130,NULL,GETDATE()),
('PR003','Огурцы','Свежие огурцы 1 кг',90,NULL,GETDATE()),
('PR004','Помидоры','Томаты 1 кг',110,NULL,GETDATE()),
('PR005','Молоко','Молоко 1 л',80,NULL,GETDATE());
DECLARE @p INT = 6;

WHILE @p <= 20
BEGIN
    INSERT INTO stage.tovari
    VALUES (
        CONCAT('PR',FORMAT(@p,'000')),
        CONCAT('Товар_',@p),
        CONCAT('Описание товара ',@p,' 500 г'),
        50 + (@p * 10),
        NULL,
        GETDATE()
    );
    SET @p+=1;
END;