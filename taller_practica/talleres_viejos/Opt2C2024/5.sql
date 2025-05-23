SELECT DISTINCT (PersonID) FROM Sales.Customer;
/*
Dado que no posee ningún índice sobre PersonID, decide hacer un Clustered Index Scan sin orden y eliminar los repetidos mediante un hash match
*/
SELECT DISTINCT (TerritoryID) FROM Sales.Customer;
/*
En este caso, puesto que posee un Indice non clustered sobre TerritoryID, decide hacer un Index Scan ordenado y eliminar los repetidos con un Stream Aggregate, que es significativamente menos costoso puesto que no hace falta construir el hash match y el unclustered index es mucho más pequeño
*/