SELECT c.CustomerId FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceLineId
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY c.CustomerId
HAVING COUNT(DISTINCT t.GenreId) = 1;  