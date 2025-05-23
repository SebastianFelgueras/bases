WITH gasto_cliente AS (
    SELECT c.FirstName, c.LastName, SUM(i.Total) TotalGastado FROM Customer c
    LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
    GROUP BY c.CustomerId, c.FirstName, c.LastName
)


SELECT * FROM gasto_cliente gc
WHERE gc.TotalGastado > (SELECT AVG(gc2.TotalGastado) FROM gasto_cliente gc2)
ORDER BY gc.TotalGastado DESC;