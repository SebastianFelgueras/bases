WITH n_tracks_Rock AS (SELECT p.PlaylistId, p.Name, COUNT(DISTINCT t.TrackId) Cantidad FROM Playlist p 
LEFT JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
LEFT JOIN Track t ON t.TrackId = pt.TrackId
LEFT JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY p.PlaylistId, p.Name
)
SELECT * FROM n_tracks_Rock
WHERE n_tracks_Rock.Cantidad = (SELECT MAX(Cantidad) FROM n_tracks_Rock)