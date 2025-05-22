SELECT e.EmployeeId,Datepart(year,i.InvoiceDate) Año,SUM(i.Total) Cantidad FROM Employee e
LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId,YEAR(i.InvoiceDate)
HAVING Datepart(year,i.InvoiceDate) IS NOT NULL;
