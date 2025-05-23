SELECT ISNULL(p.Title, '') +' ' + p.FirstName + ' ' + p.LastName
FROM Person.Person AS p
WHERE p.LastName = 'Erickson';
/*
Puesto que la condición del where es SARGable sobre el non clustered index seleccionado dado que el primer campo es LastName, procede a hacer el seek sobre ese índice y luego mediante un Nested Loops recupera el Title haciendo un lookup en el clustered index. Luego hace un compute scalar para concatenar los resultados de la forma pedida
*/

SELECT ISNULL(p.Title, '') + ' ' + p.FirstName + ' ' + p.LastName
FROM Person.Person AS p
WHERE p.BusinessEntityID = 5;
/*
Dado que el Where filtra directamente sobre el único campo en la clave clustered, directamente hace un seek y concatena los resultados con compute scalar
*/