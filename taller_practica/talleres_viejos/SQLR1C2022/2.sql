SELECT * FROM Track t 
WHERE t.Milliseconds > (
    SELECT AVG(t2.Milliseconds) FROM Track t2
    INNER JOIN Genre g ON g.GenreId = t2.GenreId
    WHERE g.Name = 'Rock'
);