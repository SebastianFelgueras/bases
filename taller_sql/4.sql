SELECT ar.Name, COUNT(DISTINCT al.AlbumId) CantidadAlbumes FROM Artist ar 
INNER JOIN Album al ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId, ar.Name
HAVING COUNT(DISTINCT al.AlbumId) > 10
ORDER BY COUNT(DISTINCT al.AlbumId) DESC;