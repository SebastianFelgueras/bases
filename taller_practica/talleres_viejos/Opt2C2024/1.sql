SELECT * FROM Production.ProductReview pr
LEFT JOIN
Production.Product p ON p.ProductID = pr.ProductID;
/*
Puesto que se seleccionan todos los campos del join, requiere la información de ambas tablas y es entonces que procede a hacer un Scan de pr usando el clustered index en forma no ordenada (puesto que puede ser más rápido si no se requiere el órden) y luego procede a hacer un Seek del resto de los valores en p mediante un Nested Loop siendo pr el outer dado que es la tabla sobre la que se hace el scan y además es muy chica 
*/
SELECT * FROM Production.ProductReview pr
RIGHT JOIN
Production.Product p ON p.ProductID = pr.ProductID;
/*
Puesto que la tabla p es varios órdenes de magnitud más grande que pr y en este caso se requiere mantener todos los valores de p en el resultado, decide utilizar un non-clustered index ordenado por ProductID sobre pr que le permite mediante un Nested Loop hacer un lookup de los valores y obtenerlos ordenados. Entonces puede directamente hacer un merge con p mediante un Clustered Index Scan (ordenado esta vez), evitando hacer un Nested Loops que estimó que sería muy costoso en este caso al tener que tener la tabla p en el outer.
*/