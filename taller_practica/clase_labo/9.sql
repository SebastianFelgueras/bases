WITH precios AS 
(SELECT p.PlaylistId,COALESCE(SUM(t.UnitPrice),0) Precio FROM Playlist p
LEFT JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
LEFT JOIN Track t ON t.TrackId = pt.TrackId
GROUP BY p.PlaylistId)
SELECT * FROM precios pr WHERE pr.Precio = (SELECT MAX(Precio) maximo FROM precios);