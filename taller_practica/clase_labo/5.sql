SELECT c.CustomerId, COUNT(e.EmployeeId) Cantidad FROM Customer c 
LEFT JOIN Employee e ON c.City = e.City
GROUP BY c.CustomerId
ORDER BY Cantidad DESC;