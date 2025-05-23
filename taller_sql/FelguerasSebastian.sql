-- Consulta 1
-- Clientes con mayor gasto
WITH gasto_cliente AS (
    SELECT c.FirstName, c.LastName, SUM(i.Total) TotalGastado FROM Customer c
    LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
    GROUP BY c.CustomerId, c.FirstName, c.LastName
)


SELECT * FROM gasto_cliente gc
WHERE gc.TotalGastado > (SELECT AVG(gc2.TotalGastado) FROM gasto_cliente gc2)
ORDER BY gc.TotalGastado DESC;


GO

-- Consulta 2 
--Clientes con compras de distintos g�neros
SELECT c.FirstName, c.LastName, COUNT(DISTINCT t.GenreId) CantidadGeneros FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId
GROUP BY c.CustomerId, c.FirstName, c.LastName
HAVING COUNT(DISTINCT t.GenreId) > 1
ORDER BY COUNT(DISTINCT t.GenreId) DESC;


GO
-- Consulta 3
--Albumes con canciones m�s largas que el promedio
-- Se me indicó durante el taller que no debía filtrar los elementos cuyo MediaType no sea exclusivamente de audio
WITH albumes_no_cumplen AS (SELECT Album.AlbumId FROM Album
EXCEPT 
SELECT t.AlbumId FROM Track t 
WHERE t.Milliseconds < (SELECT AVG(t2.Milliseconds) FROM Track t2))

SELECT al.Title FROM Album al 
INNER JOIN albumes_no_cumplen anc ON anc.AlbumId = al.AlbumId
ORDER BY al.Title ASC;



GO
-- Consulta 4 
--  Artistas con m�s de 10 �lbumes
SELECT ar.Name, COUNT(DISTINCT al.AlbumId) CantidadAlbumes FROM Artist ar 
INNER JOIN Album al ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId, ar.Name
HAVING COUNT(DISTINCT al.AlbumId) > 10
ORDER BY COUNT(DISTINCT al.AlbumId) DESC;



GO
