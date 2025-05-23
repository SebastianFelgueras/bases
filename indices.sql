SELECT 
  i.name             AS Indice,
  i.type_desc        AS Tipo,
  i.is_unique        AS EsUnico,
  c.name             AS Columna,
  ic.key_ordinal     AS OrdenClave
FROM sys.indexes i
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c        ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE i.object_id = OBJECT_ID('Sales.Customer')  -- Reemplaza con tu esquema y tabla
ORDER BY i.name, ic.key_ordinal;