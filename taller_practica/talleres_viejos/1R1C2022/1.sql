SELECT t.TrackId,t.Name, COUNT(DISTINCT il.InvoiceId) InvoicesPorTrack FROM Track t
LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name;
