DECLARE @o INT = 1;

WHILE @o <= 100
BEGIN
    INSERT INTO stage.zakazi
    VALUES (
        CONCAT('ORD',FORMAT(@o,'0000')),
        1 + ABS(CHECKSUM(NEWID())) % 50,
        CONCAT('PR',FORMAT(1 + ABS(CHECKSUM(NEWID())) % 20,'000')),
        1 + ABS(CHECKSUM(NEWID())) % 5,
        CAST(GETDATE() AS DATE),
        100 + ABS(CHECKSUM(NEWID())) % 1000,
        CHOOSE((@o % 3)+1,'NEW','PAID','CANCELLED'),
        GETDATE(),
        GETDATE()
    );
    SET @o+=1;
END;