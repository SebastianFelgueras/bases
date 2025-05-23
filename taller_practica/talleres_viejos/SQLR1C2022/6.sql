SELECT * FROM Employee e
WHERE e.HireDate > (SELECT e2.HireDate FROM Employee e2 WHERE e2.FirstName = 'Margaret' AND e2.LastName = 'Park')