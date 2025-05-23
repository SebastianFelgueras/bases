SELECT * FROM Person.BusinessEntity b
JOIN Person.BusinessEntityAddress a ON b.BusinessEntityID >
a.BusinessEntityID;
/*
Puesto que la cardinalidad de a es significativamente menor a la de b, decide hacer un Clustered Index Scan sobre a no ordenado (lo que le permite además de obtener BusinessEntityID el resto de los campos requeridos) y luego hace en el inner loop un Seek de los valores que cumplen la condición en b aprovechando que la PK de b es BusinessEntityID y por lo tanto puede directamente obtener los valores requeridos, aunque son muchisimos dado que son todas las claves mayores a la seleccionada de a.
*/
SELECT * FROM Person.BusinessEntity b
JOIN Person.BusinessEntityAddress a ON b.BusinessEntityID =
a.BusinessEntityID;
/*
Puesto que en este caso se compara por igualdad para hacer el join, decide aprovechar que el primer campo de la PK de ambas tablas es BusinessEnetityID y hace un Scan ordenado sobre ambas y los une con un Merge
*/