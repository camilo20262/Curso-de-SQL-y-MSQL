-- Create trigger to update materialized view on insert
DELIMITER |
-- 
CREATE TRIGGER matview_insert
AFTER INSERT ON bill_products
FOR EACH ROW
BEGIN
    INSERT INTO ventas_diarias_m (date, count, total)
    VALUES (
        DATE(NEW.date_added),
        (SELECT COUNT(*) FROM bill_products WHERE DATE(date_added) = DATE(NEW.date_added)),
        (SELECT SUM(total) FROM bill_products WHERE DATE(date_added) = DATE(NEW.date_added))
    )
    ON DUPLICATE KEY UPDATE
    count = VALUES(count),
    total = VALUES(total);
END
|
DELIMITER ; 
