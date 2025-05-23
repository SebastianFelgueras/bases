SELECT c.FirstName, c.LastName, c.Address, c.Email, e.FirstName, e.LastName, COUNT(DISTINCT i.InvoiceId) FROM Customer c
LEFT JOIN Employee e ON e.EmployeeId = c.SupportRepId
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE DATEPART(year,i.InvoiceDate) > 2010 OR i.InvoiceDate IS NULL
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Address, c.Email, e.EmployeeId, e.FirstName, e.LastName;
