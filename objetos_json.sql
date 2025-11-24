-- Agregar una columna JSON a la tabla products
ALTER TABLE products 
ADD COLUMN data JSON AFTER price;    


-- Actualizar la columna JSON con datos específicos para un producto
UPDATE products 
SET data = '{"brand": "Pear", "HDSize": "40 gigabytes"}' 
WHERE product_id = 10;

-- Consultar productos y mostrar datos del JSON
SELEct *
from products
WHERE product_id = 10;

-- Actualizar un valor específico dentro del objeto JSON
UPDATE products 
SET data = JSON_REPLACE(data, '$.brand', 'Banana') 
WHERE product_id = 10;