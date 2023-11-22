-- 1. As quantidade e valores totais de venda de cada produto em 2022, globalmente, por cidade, por
-- mês, dia do mês e dia da semana
SELECT
    SKU,
  month,
  day_of_month,
  day_of_week,
  city,
  SUM(qty) AS total_quantity,
  SUM(total_price) AS total_sales
FROM
  product_sales
WHERE
  year = 2022
GROUP BY GROUPING SETS(
    (sku),
    (sku, city),
    (sku, month),
    (sku, day_of_month),
    (sku, day_of_week)
    );

-- 2. O valor médio diário das vendas de todos os produtos em 2022, globalmente, por mês e dia da
-- semana

SELECT
  month,
  day_of_week,
  AVG(total_sales) AS average_daily_sales
FROM
  (SELECT
     month,
     day_of_week,
     SUM(total_price) AS total_sales
   FROM
     product_sales
   WHERE
     year = 2022
   GROUP BY
     year, month, day_of_month, day_of_week) AS month_week_sales
GROUP BY GROUPING SETS (
    (month),
    (day_of_week),
    ()
);
