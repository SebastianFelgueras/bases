SELECT a.Name NombreArtista, COUNT(t.TrackId) Cantidad FROM Artist a 
INNER JOIN Album al ON a.ArtistId = al.ArtistId
INNER JOIN Track t ON t.AlbumId = al.AlbumId
GROUP BY a.ArtistId,a.Name
HAVING COUNT(t.TrackId) > 50
ORDER BY Cantidad;