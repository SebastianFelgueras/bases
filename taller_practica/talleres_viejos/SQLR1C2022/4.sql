WITH Cantidades AS (
    SELECT TrackId,SUM(Quantity) Cantidad FROM InvoiceLine
    GROUP BY TrackId)

SELECT t.TrackId, t.Name, SUM(il.Quantity) FROM InvoiceLine il
INNER JOIN Track t ON t.TrackId = il.TrackId 
GROUP BY t.TrackId, t.Name
HAVING SUM(il.Quantity) = (SELECT MAX(Cantidad) FROM Cantidades);