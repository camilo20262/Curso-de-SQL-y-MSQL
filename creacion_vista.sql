CREATE VIEW ventas_diarias AS (
  SELECT DATE(date_added) AS fecha, 
  COUNT(bill_product_id) AS cantidad_facturas, 
  SUM(quantity) AS suma_cantidad,
  AVG(discount) AS promedio_descuento,
  MAX(discount) AS descuento_maximo, 
  MAX(total) AS total_maximo,
  SUM(total) AS total_ventas
  FROM bill_products
  GROUP BY fecha ASC
  ORDER BY 1 ASC
)