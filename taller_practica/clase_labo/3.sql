-- SELECT a.ArtistId, a.Name  FROM Artist a
-- EXCEPT
-- SELECT a.ArtistId, a.Name FROM Artist a
-- INNER JOIN Album al ON a.ArtistId = al.ArtistId;

SELECT a.ArtistId, a.Name FROM Artist a
WHERE
    NOT EXISTS (SELECT * FROM Album al WHERE al.ArtistId = a.ArtistId )