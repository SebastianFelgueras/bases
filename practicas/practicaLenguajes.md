### 2.1
- a)
    - AR: $$π_{firstName, lastName} (σ _{"Brasil" = country} (customer))$$
    - CRT: $$\{t / ∃p ∈ customer ∧ p.country = "Brasil" ∧ t = (p.firstName,p.lastName)\} $$
    - SQL: 
    ```sql
    SELECT firstName,lastName FROM customer WHERE country = "Brasil"
    ```

- b)
    - AR: $$π_{firstName, lastName,invoiceDate,invoiceID} (invoice⋈customer)$$
    - CRT: $$\{t / ∃p ∈ customer ∧ ∃r ∈ invoice ∧ p.customerID = r.customerID  ∧ t = (p.firstName,p.lastName,r.invoiceDate,r.invoiceID)\} $$
    - SQL: 
    ```sql
    SELECT customer.firstName,customer.lastName,invoice.invoiceDate,invoice.invoiceID FROM customer,invoice WHERE customer.customerID = invoice.customerID
    ```

- c)
    - AR: $$π_{track.name,artist.name} (track ⋈_{track.AlbumID=album.AlbumID} album ⋈_{ArtistID = artist.ArtistID} artist)$$
    - CRT: $$\{t / ∃p ∈ track ∧ ∃r ∈ album ∧ ∃q ∈ artist ∧p.AlbumID = r.AlbumID ∧ r.ArtistID = q.ArtistID  ∧ t = (p.name,q.name)\} $$
    - SQL: 
    ```sql
    SELECT track.name,artist.name FROM track,album,artist WHERE track.AlbumID = album.AlbumID AND album.ArtistID = artist.ArtistID
    ```

- d)
    - AR: $$π_{playlist.name}(σ_{mediaType.name = \text{"MPEG audio file"}} (playlist ⋈ playlistTrack ⋈ track ⋈ mediaType))$$
    - CRT: $$\{(pl.name) / ∃pl ∈ playlist ∧ ∃plt ∈ playlistTrack ∧ ∃tr ∈ track ∧ ∃mt ∈ mediaType ∧ pl.PlaylistId = plt.PlaylistId ∧  plt.TrackId = tr.TrackId ∧ tr.MediaTypeId = mt.MediaTypeId ∧ mt.name = \text{"MPEG audio file"}  \} $$

- e) No es posible resolver esta consulta mediante AR o CRT ya que estos lenguajes no permiten contar elementos en una columna y usar la cantidad como filtro. La consulta que resuelve lo pedido en SQL es: 
```sql
SELECT Playlist.Name,COUNT(*) Cantidad
FROM Playlist INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
 INNER JOIN Track ON Track.TrackId = PlaylistTrack.TrackId
 INNER JOIN Album ON Album.AlbumId = Track.AlbumId
 INNER JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE
	Artist.Name = "Iron Maiden"
GROUP BY Playlist.PlaylistId
HAVING 	
	COUNT(*) > 10;
```

- f) SQL:
```sql
SELECT Playlist.Name,COUNT(DISTINCT Album.AlbumId) Cantidad
FROM Playlist LEFT JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
    LEFT JOIN Track ON Track.TrackId = PlaylistTrack.TrackId
    LEFT JOIN Album ON Album.AlbumId = Track.AlbumId
GROUP BY Playlist.PlaylistId;
```

- g) SQL:
```sql
SELECT Employee.FirstName, Employee.LastName,InvoiceLine.Quantity
FROM Employee LEFT JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
 LEFT JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
 LEFT JOIN InvoiceLine ON Invoice.InvoiceId = Invoice.InvoiceId
WHERE 
	strftime("%Y",Employee.BirthDate) < 2000
	AND 
	InvoiceLine.Quantity > 10;
```

- h) SQL:
```sql
SELECT customer.firstName,customer.lastName,invoice.invoiceDate,invoice.invoiceID 
FROM customer LEFT OUTER JOIN Invoice ON customer.customerID = invoice.customerID;
```

- j) y k)
```sql
SELECT e1.FirstName EmpleadoNombre, e1.LastName EmpleadoApellido,e2.FirstName JefeNombre, e2.LastName JefeApellido
FROM Employee e1 LEFT JOIN Employee e2 ON e1.ReportsTo = e2.EmployeeId;
```

- l)
```sql
SELECT FirstName,LastName,AVG(Cantidad) Promedio
FROM (SELECT CUSTOMER.FirstName,CUSTOMER.LastName,SUM(InvoiceLine.Quantity) Cantidad, Customer.CustomerId
	FROM Customer LEFT JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
	 LEFT JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
	GROUP BY Customer.CustomerId, Invoice.InvoiceId
GROUP BY CustomerId;
```

### 2.2

- a)
    - AR: 
    $$
    π_{bar,persona}(σ_{persona = "Juan K."}(gusta ⋈ sirve))
    $$
    - CRT:
    $$
    \{t/∃g∈gusta ∧ ∃s∈sirve ∧ g.persona = "\textit{Juan K.}" ∧ g.cerveza = s.cerveza ∧ t = (s.bar,g.persona)\}
    $$
    - SQL:
    ```sql
    SELECT sirve.bar,gusta.persona
    FROM gusta INNER JOIN sirve ON gusta.cerveza = sirve.cerveza
    WHERE
        gusta.persona = "Juan K.";
    ```

- b)
    - AR: 
    $$
    π_{persona}(gusta ⋈ sirve ⋈ frecuenta)
    $$
    - CRT:
    $$
    \{t/∃g ∈ gusta ∧ ∃s ∈ sirve ∧ g.cerveza = s.cerveza ∧ ∃f ∈ frecuenta ∧ f.bar = s.bar ∧ g.persona = f.persona ∧ t = (g.persona)\}
    $$
    - SQL:
    ```sql
    SELECT DISTINCT gusta.persona
    FROM gusta 
        INNER JOIN sirve ON gusta.cerveza = sirve.cerveza
        INNER JOIN frecuenta ON frecuenta.persona = gusta.persona AND frecuenta.bar = sirve.bar;
    ```

- c)
    - AR: 
    $$
    π_{persona}(gusta) - π_{persona}(gusta ⋈ sirve ⋈ frecuenta)
    $$
    - CRT:
    $$
    \{t/∀g,s (g ∈ gusta ∧ s ∈ sirve ∧ g.cerveza = s.cerveza  ⟹ ∄f ∈ frecuenta ∧ f.persona = g.persona ∧ s.bar = f.bar )\}
    $$
    - SQL:
    ```sql
    SELECT DISTINCT g.Persona
    FROM GUSTA g
    WHERE g.Persona NOT IN (
        SELECT f.Persona
        FROM FRECUENTA f
        JOIN SIRVE s ON f.Bar = s.Bar
        JOIN GUSTA g2 ON f.Persona = g2.Persona AND s.Cerveza = g2.Cerveza);
    ```

- d)
    - AR: 
    $$
    (frecuenta ⋈ sirve) ÷ sirve
    $$
    - CRT:
    $$
    \{t/ ∀s (s ∈ sirve ⟹ ∃f ∈ frecuenta (t = f.persona ∧ s.bar = f.bar) )\}
    $$
    - SQL:
    ```sql
    SELECT DISTINCT f.Persona
    FROM frecuenta f, sirven s
    WHERE
        size(DISTINCT s.bar) = (SELECT SIZE(DISTINCT f2.bar) FROM frecuenta f2 WHERE f.persona = f2.persona);        
    ```

- e)
```sql
SELECT f.persona, f.bar, g.cerveza
FROM frecuenta f 
    INNER JOIN gusta g ON f.persona = g.persona
    INNER JOIN sirve s ON s.bar = f.bar AND s.cerveza = g.cerveza;
```

### 2.3

- a)
```sql
SELECT Album.Title NombreAlbum
FROM 
	PlaylistTrack INNER JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
	INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
	INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Album.AlbumId
HAVING
	COUNT(DISTINCT Playlist.PlaylistId) = (SELECT COUNT(DISTINCT Playlist.PlaylistId) FROM Playlist)
;
```

- b)
```sql
WITH view AS (SELECT Artist.Name nombre, COUNT(DISTINCT Album.AlbumId) cantidad
FROM 
	PlaylistTrack INNER JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
	INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
	INNER JOIN Album ON Track.AlbumId = Album.AlbumId
	INNER JOIN Artist on Artist.ArtistId = Album.ArtistId 
GROUP BY Artist.ArtistId)
SELECT nombre, cantidad FROM view WHERE cantidad = (SELECT MIN(cantidad) FROM view);
```

### 2.4

- a)
    - AR:
        $$R ≡ Playlist ⋈ PlaylistTrack ⋈ Track ⋈ Album ⋈ Artist \\
        π_{Playlist.Name}(R) - π_{Playlist.Name}(σ_{Artist.Name = \textit{“Black Sabbath”} ∨ Artist.Name = \textit{“Chico Buarque”}}(R))
        $$

    - CRT
        $$
        \{t / ∃pl ∈ Playlist ∧ t = pl.Name ∧ [∀plt,tr,al,ar (plt ∈ PlaylistTrack ∧ tr ∈ Track ∧ al ∈ Album ∧ ar ∈ Artist ∧ plt.PlaylistID = pl.PlaylistId ∧ tr.TrackID = plt.TrackID ∧ tr.AlbumID = al.AlbumID ∧ al.ArtistID = ar.ArtistID ⟹ ar.Name ≠ \textit{“Black Sabbath”} ∧ ar.Name ≠  \textit{“Chico Buarque”} )] \}
        $$
    - SQL
        ```sql
        SELECT DISTINCT Playlist.Name
        FROM Playlist 
        WHERE Playlist.PlaylistId NOT IN (SELECT DISTINCT Playlist.PlaylistId
        FROM 
            PlaylistTrack INNER JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
            INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
            INNER JOIN Album ON Track.AlbumId = Album.AlbumId
            INNER JOIN Artist on Artist.ArtistId = Album.ArtistId 
        WHERE
            Artist.Name IN ("Black Sabbath","Chico Buarque"));
        ```
- b)
    - AR:
        $$
        R_1 = R_2 ≡ customer ⋈ invoice ⋈ invoiceline ⋈ track \\
        π_{R_1.customerName,R_1.customerID}(R_1)-π_{R_1.customerName,R_1.customerID}(σ_{R_1.customerID = R_2.customerID ∧ R_1.genreID ≠ R_2.genreID}(R_1 × R_2))
        $$

    - CRT
        $$
        \{t / ∃c ∈ customer ∧ t = c.Name ∧ \\
        [∀i,i', il,il', t,t' \\
        (i ∈ invoice ∧ il ∈ invoiceline ∧ t ∈ track ∧ i.customerID = c.customerID ∧ il.invoiceID = i.invoiceID ∧ t.trackID = il.trackID ∧ \\
        i' ∈ invoice ∧ il' ∈ invoiceline ∧ t' ∈ track ∧ i'.customerID = c'.customerID ∧ il'.invoiceID = i'.invoiceID ∧ t'.trackID = il'.trackID ⟹ \\
        t.genreID = t'.genreID)]\\\}
        $$
    - SQL
        ```sql
       SELECT Nombre, Apellido 
        FROM
            (SELECT Customer.FirstName Nombre, Customer.LastName Apellido, COUNT(DISTINCT Track.GenreId) Cantidad
            FROM Customer LEFT JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
                LEFT JOIN InvoiceLine ON InvoiceLine.InvoiceId = Invoice.InvoiceId
                LEFT JOIN Track ON InvoiceLine.TrackId = Track.TrackId
            GROUP BY Customer.CustomerId)
        WHERE
            Cantidad = 1;
        ```

### 2.5

- a) SQL:
```sql
SELECT DISTINCT ACTOR.nombreActor
FROM ACTOR INNER JOIN PARTICIPA_EN ON ACTOR.idActor =  PARTICIPA_EN.idActor
    INNER JOIN SERIE ON PARTICIPA_EN.idSerie = SERIE.idSerie
WHERE 
    ACTOR.edad > 30 AND SERIE.nombreSerie = "Friends";
```

- b) SQL:
```sql
SELECT Nombre
FROM
    (SELECT C.nombreCanal Nombre, COUNT(G.idGenero) Cantidad
    FROM CANAL C LEFT JOIN TRANSMITE T ON C.idCanal = T.idCanal
        LEFT JOIN SERIE S ON S.idSerie = T.idSerie
        LEFT JOIN GENERO G ON G.idGenero = S.idGenero
    WHERE 
        G.nombreGenero = "Comedia"
    GROUP BY C.idCanal, C.nombreCanal)
WHERE
    Cantidad = (SELECT COUNT(DISTINCT s.idSerie) FROM SERIE s INNER JOIN GENERO g ON s.idGenero = g.idGenero WHERE g.nombreGenero = "Comedia" )
    ;
```

- c)
```sql
SELECT DISTINCT ACTOR.nombreActor
FROM ACTOR INNER JOIN PARTICIPA_EN ON ACTOR.idActor =  PARTICIPA_EN.idActor
    INNER JOIN SERIE ON PARTICIPA_EN.idSerie = SERIE.idSerie
WHERE 
    ACTOR.edad > 30 AND SERIE.nombreSerie = "Friends" AND 
    2000 < 
        (SELECT MAX(s.añoInicio)
        FROM PARTICIPA_EN en INNER JOIN SERIE s ON en.idSerie = s.idSerie
        WHERE 
            en.actorId = ACTOR.actorId        
        );
```

- d)
```sql
SELECT DISTINCT ACTOR.nombreActor
FROM ACTOR INNER JOIN PARTICIPA_EN ON ACTOR.idActor =  PARTICIPA_EN.idActor
    INNER JOIN SERIE ON PARTICIPA_EN.idSerie = SERIE.idSerie
WHERE 
    ACTOR.edad > 30 AND SERIE.nombreSerie = "Friends" AND 
    2000 >= 
        (SELECT MAX(s.añoInicio)
        FROM PARTICIPA_EN en INNER JOIN SERIE s ON en.idSerie = s.idSerie
        WHERE 
            en.actorId = ACTOR.actorId        
        );
```

- e)
```sql
SELECT s.serieId 
FROM SERIE s
WHERE 
    s.añoInicio = 
    (SELECT MAX(s2.añoInicio) FROM SERIE s2);
```  

- f)
```sql
SELECT id
FROM
    (SELECT a.actorId id, COUNT(DISTINCT en.serieId) cantidad
    FROM ACTOR a INNER JOIN PARTICIPA_EN en ON en.actorId = a.actorId
    GROUP BY a.actorId)
WHERE cantidad > 1;
```  

- g)
```sql
SELECT nombre
FROM
    (SELECT s.nombreSerie nombre, COUNT(DISTINCT s.serieId) cantidad
    FROM SERIE s
    GROUP BY s.nombreSerie)
WHERE cantidad > 1;
```  