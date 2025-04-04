### 2.1
- a)
    - AR: $$π_{firstName, lastName} (σ _{"Brasil" = country} (customer))$$
    - CRT: $$\{t / ∃p ∈ customer ∧ p.country = "Brasil" ∧ t = (p.firstName,p.lastName)\} $$
    - SQL: ```SELECT firstName,lastName FROM customer WHERE country = "Brasil"```

- b)
    - AR: $$π_{firstName, lastName,invoiceDate,invoiceID} (invoice⋈customer)$$
    - CRT: $$\{t / ∃p ∈ customer ∧ ∃r ∈ invoice ∧ p.customerID = r.customerID  ∧ t = (p.firstName,p.lastName,r.invoiceDate,r.invoiceID)\} $$
    - SQL: ```SELECT customer.firstName,customer.lastName,invoice.invoiceDate,invoice.invoiceID FROM customer,invoice WHERE customer.customerID = invoice.customerID```

- c)
    - AR: $$π_{track.name,artist.name} (track ⋈_{track.AlbumID=album.AlbumID} album ⋈_{ArtistID = artist.ArtistID} artist)$$
    - CRT: $$\{t / ∃p ∈ track ∧ ∃r ∈ album ∧ ∃q ∈ artist ∧p.AlbumID = r.AlbumID ∧ r.ArtistID = q.ArtistID  ∧ t = (p.name,q.name)\} $$
    - SQL: ```SELECT track.name,artist.name FROM track,album,artist WHERE track.AlbumID = album.AlbumID AND album.ArtistID = artist.ArtistID```

- d)
    - AR: $$π_{playlist.name}(σ_{mediaType.name = \text{"MPEG audio file"}} (playlist ⋈ playlistTrack ⋈ track ⋈ mediaType))$$
    - CRT: $$\{(pl.name) / ∃pl ∈ playlist ∧ ∃plt ∈ playlistTrack ∧ ∃tr ∈ track ∧ ∃mt ∈ mediaType ∧ pl.PlaylistId = plt.PlaylistId ∧  plt.TrackId = tr.TrackId ∧ tr.MediaTypeId = mt.MediaTypeId ∧ mt.name = \text{"MPEG audio file"}  \} $$
