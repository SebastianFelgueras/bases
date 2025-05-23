SELECT * FROM Album al 
WHERE 10 < (SELECT COUNT(t.TrackId) FROM Track t WHERE t.AlbumId = al.AlbumId)