DROP VIEW IF EXISTS product_sales CASCADE;
CREATE VIEW product_sales AS
SELECT SUBSTRING(address FROM position('-' in address)+4) AS city,
       ct.SKU,
       o.order_no,
       ct.qty,
       (p.price * ct.qty) AS total_price,
       EXTRACT(YEAR FROM o.date) AS year,
       EXTRACT(MONTH FROM o.date) AS month,
       EXTRACT(DAY FROM o.date) AS day_of_month,
       EXTRACT(DOW FROM o.date) AS day_of_week

FROM customer c
JOIN "order" o ON c.cust_no = o.cust_no
JOIN contains ct ON o.order_no = ct.order_no
JOIN pay py ON o.order_no = py.order_no
JOIN product p ON ct.SKU = p.SKU;
