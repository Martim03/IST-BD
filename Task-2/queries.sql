---- Relational Algebra Queries -----


-- 1. Liste o nome de todos os clientes que fizeram encomendas
-- contendo produtos de preço superior a €50 no ano de 2023

SELECT c.name -- c.name
FROM (SELECT sku, name AS product_name, description, price FROM product) p
NATURAL JOIN contains c2
NATURAL JOIN orders o
NATURAL JOIN customer c
WHERE p.price > 50
AND EXTRACT(YEAR FROM o.date) = 2023
GROUP BY c.cust_no;


-- 2. Liste o nome de todos os empregados que trabalham em armazéns e não em escritórios e
-- processaram encomendas em Janeiro de 2023

SELECT e.name
FROM process p
NATURAL JOIN orders o
NATURAL JOIN (SELECT *
              FROM warehouse
              WHERE NOT EXISTS(SELECT 1
                               FROM office
                               WHERE warehouse.address = office.address)) l
NATURAL JOIN (SELECT name as dep_name, ssn, address FROM works) w
NATURAL JOIN employee e
WHERE EXTRACT(YEAR FROM o.date) = 2023 AND
      EXTRACT(MONTH FROM o.date) = 1;


-- 3. Indique o nome do produto mais vendido

WITH total_vendas AS(
    SELECT c.sku, SUM(c.qty) AS total
    FROM product p
    NATURAL JOIN sale s
    NATURAL JOIN contains c
    GROUP BY c.sku
)
SELECT name
FROM product
NATURAL JOIN total_vendas
NATURAL JOIN (SELECT sku, max(total) AS max_total
              FROM total_vendas
              GROUP BY sku
              HAVING total = (SELECT MAX(total)
                                   FROM total_vendas)
              ) as max_total_table;


-- 4. Indique o valor total de cada venda realizada

SELECT order_no, SUM(sale_value) AS total_sale_value
FROM (SELECT order_no, (price * qty) AS sale_value
      FROM sale s
          NATURAL JOIN contains c
          NATURAL JOIN product p) as onssv
GROUP BY order_no;
