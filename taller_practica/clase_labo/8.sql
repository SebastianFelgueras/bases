WITH con_Rock AS (SELECT DISTINCT pt.PlaylistId FROM PlaylistTrack pt
INNER JOIN Track t ON pt.TrackId = t.TrackId
INNER JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Rock')
SELECT p.PlaylistId FROM Playlist p
EXCEPT 
(SELECT * FROM con_Rock);