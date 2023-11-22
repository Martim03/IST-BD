SELECT c.cust_no,c.name
FROM customer c
NATURAL JOIN pay p
GROUP BY c.cust_no
HAVING COUNT(p.order_no) = (SELECT MAX(ct.count_orders)
    FROM (SELECT COUNT(p.order_no) as count_orders
        FROM pay p
        NATURAL JOIN customer c
        GROUP BY p.cust_no) ct
);

SELECT e.name
FROM employee e
JOIN process p ON e.ssn = p.ssn
RIGHT JOIN "order" o ON o.order_no = p.order_no
WHERE EXTRACT(YEAR FROM o.date) = 2022
GROUP BY e.ssn
HAVING COUNT(DISTINCT EXTRACT(DAY FROM o.date)) = (
    SELECT COUNT(DISTINCT EXTRACT(DAY FROM "order".date)) as total_days
    FROM "order"
    LEFT JOIN process ON "order".order_no = process.order_no
    WHERE EXTRACT(YEAR FROM "order".date) = 2022
);



SELECT EXTRACT(MONTH FROM o.date), COUNT(*)
FROM "order" o
WHERE EXTRACT(YEAR FROM o.date) = 2022 AND NOT EXISTS (
    SELECT*
    FROM pay
    WHERE pay.order_no = o.order_no
)
GROUP BY EXTRACT(MONTH FROM o.date);