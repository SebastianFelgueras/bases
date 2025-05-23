SELECT * FROM Production.TransactionHistory WHERE ProductID = 870 OR
ProductID = 855;
/*
En este caso el optimizador estima que existen muchas tuplas que cumplen con la consición del where por lo que procede a hacer un Clustered Index Scan no ordenado de la tabla y selecciona solo las filas que cumplen el predicado
*/

SELECT * FROM Production.TransactionHistory WHERE ProductID = 843 OR
ProductID = 849;
/*
En este caso, como estima que habrá pocas filas que cumplan lo requerido, utiliza directamente el non-clustered index sobre ProductID y luego mediante un Nested Loops, recupera el resto de la información de esas filas haciendo un key lookup
*/