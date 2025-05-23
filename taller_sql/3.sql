WITH albumes_no_cumplen AS (SELECT Album.AlbumId FROM Album
EXCEPT 
SELECT t.AlbumId FROM Track t 
WHERE t.Milliseconds < (SELECT AVG(t2.Milliseconds) FROM Track t2))
SELECT al.Title FROM Album al 
INNER JOIN albumes_no_cumplen anc ON anc.AlbumId = al.AlbumId
ORDER BY al.Title ASC;