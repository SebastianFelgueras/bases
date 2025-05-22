SELECT COUNT(t.TrackId) Cantidad,SUM(t.Milliseconds)/(60*1000) Minutos FROM Track t
INNER JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId
WHERE m.Name LIKE '%audio%' AND t.Milliseconds > 
(
    SELECT AVG(t.Milliseconds) FROM Track t 
    INNER JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId
    WHERE m.Name LIKE '%audio%'
    );