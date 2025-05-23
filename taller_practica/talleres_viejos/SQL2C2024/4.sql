SELECT g.*,COUNT(DISTINCT al.AlbumId) Cantidad FROM Genre g 
LEFT JOIN Track t ON t.GenreId = g.GenreId
LEFT JOIN Album al ON t.AlbumId = al.AlbumId
GROUP BY g.GenreId, g.Name