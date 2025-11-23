-- Create trigger after insert on bill_products to update ventas_diarias_m materialized view
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
END |
DELIMITER ; 


----- Create trigger after delete on bill_products to delete  ventas_diarias_m materialized view
DELIMITER |
CREATE TRIGGER MathView_delete
AFTER DELETE ON bill_products
FOR EACH ROW
BEGIN
    UPDATE ventas_diarias_m
    SET date = date(old.date_added),
        count = (SELECT COUNT(*) FROM bill_products WHERE date(date_added) = date(old.date_added)),
        total = (SELECT SUM(total) FROM bill_products WHERE date(date_added) = date(old.date_added))
    WHERE date = date(old.date_added);
END |

DELIMITER ; 
