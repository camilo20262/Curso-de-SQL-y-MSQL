
-- Count clients by country
select country, count(*) as total
from clients
group by country
order by total;
-- Count clients by country and gender
select country, gender, count(*) as total
from clients
group by country,gender
order by total;
--HOLS

-- Select all from example
select length(description) as longitud_description
from products;

--Reemplazar espacios por guiones: Podemos usar expresiones regulares con REGEXP_REPLACE()
SELECT name, REGEXP_REPLACE(LOWER(name), ' ', '-') AS generated, slug
FROM products 
LIMIT 10;

-- Total sales by date
select date(date_added) as fecha, count(bill_product_id), sum(quantity),
avg(discount),max(discount), max(total),sum(total)
from bill_products
group by 1
order by 1 asc; 


-- Insert daily sales summary into ventas_diarias_m
INSERT INTO ventas_diarias_m (`date`, `count`, total)
SELECT 
    DATE(date_added),
    COUNT(bill_product_id),
    SUM(total)
FROM bill_products
GROUP BY 1;


-- Select bill products for clients from Argentina
SELECT 
    bp.bill_product_id,
    bp.date_added,
    bp.total
FROM 
    bill_products AS bp
    LEFT JOIN bills AS b ON bp.bill_id = b.bill_id
    LEFT JOIN clients AS c ON b.client_id = c.client_id
WHERE 
    c.country = 'AR' and  c.gender = 'M'
order by 3 asc;


--subconsulta

SELECT 
    bp.bill_product_id,
    bp.date_added,
    bp.total 
FROM 
    bill_products AS bp
WHERE 
    bp.bill_id IN (
        SELECT 
            b.bill_id 
        FROM 
            bills AS b
            LEFT JOIN clients AS c ON b.client_id = c.client_id
        WHERE 
            c.country = 'AR' and  c.gender  = 'M'   
    )
ORDER BY 2 ASC;
