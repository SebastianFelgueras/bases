WITH n_clientes AS (SELECT c.SupportRepId, COUNT(c.CustomerId) Cantidad FROM Customer c
GROUP BY c.SupportRepId)
SELECT FirstName, LastName FROM Customer
WHERE SupportRepId IN 
    (
    SELECT n.SupportRepId FROM n_clientes n WHERE n.Cantidad = (
        SELECT MAX(c2.Cantidad) FROM n_clientes c2
        )
    )