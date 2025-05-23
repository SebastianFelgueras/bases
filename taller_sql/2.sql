SELECT c.FirstName, c.LastName, COUNT(DISTINCT t.GenreId) CantidadGeneros FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId
GROUP BY c.CustomerId, c.FirstName, c.LastName
HAVING COUNT(DISTINCT t.GenreId) > 1
ORDER BY COUNT(DISTINCT t.GenreId) DESC;