-- SELECT i.InvoiceId,i.InvoiceDate,i.BillingAddress FROM Invoice i
-- LEFT JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
-- GROUP BY i.InvoiceId,i.InvoiceDate,i.BillingAddress
-- HAVING NOT EXISTS (SELECT * FROM InvoiceLine il2 WHERE il2.UnitPrice = 0.99 AND il2.InvoiceId = i.InvoiceId);


SELECT DISTINCT i.InvoiceId,i.InvoiceDate,i.BillingAddress FROM Invoice i
LEFT JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
WHERE NOT EXISTS (SELECT * FROM InvoiceLine il2 WHERE il2.UnitPrice = 0.99 AND il2.InvoiceId = i.InvoiceId);
