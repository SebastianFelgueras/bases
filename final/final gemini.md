# Final 1

1 - Normalización

Una tabla está en Primera Forma Normal (1NF) si contiene al menos una clave primaria.

El objetivo principal de la normalización es reducir la redundancia de datos.

Una dependencia transitiva (un atributo no clave que depende de otro atributo no clave) viola la Segunda Forma Normal (2NF).

Llevar una base de datos a la Tercera Forma Normal (3NF) siempre mejora el rendimiento de las consultas de lectura.

2 - Índices

Un índice CLUSTERED ordena físicamente los datos en el disco según la columna del índice.

Una tabla puede tener múltiples índices CLUSTERED.

Agregar un índice a una tabla siempre acelera las operaciones INSERT, UPDATE y DELETE.

Un índice sobre una columna con baja cardinalidad (pocos valores únicos, como "Género") es siempre la mejor opción para optimizar consultas.

3 - Joins en SQL

INNER JOIN y RIGHT JOIN siempre devuelven la misma cantidad de registros.

Un CROSS JOIN entre una tabla A (100 filas) y una tabla B (50 filas) devolverá 150 filas.

Un FULL OUTER JOIN incluye tanto las filas que coinciden en ambas tablas como las que no tienen correspondencia en la tabla opuesta.

La cláusula ON en un JOIN es funcionalmente idéntica a la cláusula WHERE para filtrar los resultados del JOIN.

4 - Subconsultas (Subqueries)

Una subconsulta siempre debe devolver una única columna y una única fila.

Las subconsultas correlacionadas se ejecutan una vez por cada fila de la consulta principal.

El operador EXISTS suele ser más eficiente que IN cuando se trabaja con subconsultas que devuelven un gran volumen de datos.

No es posible utilizar una subconsulta en la cláusula UPDATE.

5 - Transacciones y Concurrencia

Una transacción que finaliza con ROLLBACK guarda permanentemente solo una parte de los cambios realizados.

El nivel de aislamiento READ UNCOMMITTED previene el problema de "lecturas sucias" (dirty reads).

Un deadlock (interbloqueo) ocurre cuando una transacción espera por un recurso que nunca será liberado.

La propiedad de "Durabilidad" (la D en ACID) asegura que una vez que una transacción ha sido confirmada (COMMIT), sus cambios sobrevivirán a fallas del sistema.

6 - Vistas (Views) en SQL

Una vista es una tabla física que almacena una copia de los datos de una consulta.

Siempre se puede realizar una operación INSERT o UPDATE sobre una vista simple (basada en una sola tabla).

Modificar la estructura de una tabla base (ej: eliminar una columna) no afecta a las vistas que dependen de ella.

Las vistas se utilizan para simplificar consultas complejas y para implementar seguridad a nivel de fila/columna.

Respuestas
1 - Normalización

Una tabla está en Primera Forma Normal (1NF) si contiene al menos una clave primaria.
FALSO. Una tabla está en 1NF si todos sus atributos son atómicos (contienen un solo valor) y cada registro es único. Si bien tener una PK ayuda a garantizar la unicidad, el requisito fundamental de 1NF es la atomicidad de los datos.

El objetivo principal de la normalización es reducir la redundancia de datos.
VERDADERO. La normalización busca organizar las columnas y tablas para minimizar la duplicación de datos y, con ello, evitar anomalías de inserción, actualización y borrado, mejorando la integridad de los datos.

Una dependencia transitiva (un atributo no clave que depende de otro atributo no clave) viola la Segunda Forma Normal (2NF).
FALSO. La dependencia transitiva viola la Tercera Forma Normal (3NF). La 2NF se enfoca en eliminar dependencias parciales (cuando un atributo no clave depende solo de una parte de una clave primaria compuesta).

Llevar una base de datos a la Tercera Forma Normal (3NF) siempre mejora el rendimiento de las consultas de lectura.
FALSO. La normalización puede requerir más operaciones JOIN para reconstruir la información, lo que a menudo puede ralentizar las consultas de lectura. La desnormalización es una técnica que se usa a veces para mejorar el rendimiento de lectura a costa de la redundancia.

2 - Índices

Un índice CLUSTERED ordena físicamente los datos en el disco según la columna del índice.
VERDADERO. Esta es la definición de un índice agrupado o CLUSTERED. Actúa como el índice de un libro, donde los datos mismos están ordenados.

Una tabla puede tener múltiples índices CLUSTERED.
FALSO. Dado que un índice CLUSTERED dicta el orden físico de las filas, una tabla solo puede tener un único orden físico y, por lo tanto, un solo índice de este tipo.

Agregar un índice a una tabla siempre acelera las operaciones INSERT, UPDATE y DELETE.
FALSO. Al contrario, los índices suelen ralentizar estas operaciones. Cuando se inserta, actualiza o elimina una fila, la base de datos no solo debe modificar los datos en la tabla, sino también en cada uno de los índices asociados a ella.

Un índice sobre una columna con baja cardinalidad (pocos valores únicos, como "Género") es siempre la mejor opción para optimizar consultas.
FALSO. Los índices son más efectivos en columnas de alta cardinalidad (muchos valores únicos, como un DNI o un email). Un índice en una columna de baja cardinalidad no filtra suficientes datos como para ser eficiente y el motor de la base de datos podría decidir no utilizarlo.

3 - Joins en SQL

INNER JOIN y RIGHT JOIN siempre devuelven la misma cantidad de registros.
FALSO. Solo devolverían la misma cantidad de registros en el caso de que todas las filas de la tabla derecha tuvieran una correspondencia en la tabla izquierda, un caso poco común. Un RIGHT JOIN puede devolver más filas si hay registros en la tabla derecha sin correspondencia en la izquierda.

Un CROSS JOIN entre una tabla A (100 filas) y una tabla B (50 filas) devolverá 150 filas.
FALSO. Un CROSS JOIN genera el producto cartesiano de las dos tablas. El resultado sería 100 * 50 = 5000 filas.

Un FULL OUTER JOIN incluye tanto las filas que coinciden en ambas tablas como las que no tienen correspondencia en la tabla opuesta.
VERDADERO. Es la unión de un LEFT JOIN y un RIGHT JOIN. Devuelve todas las filas de ambas tablas, rellenando con NULL donde no hay correspondencia.

La cláusula ON en un JOIN es funcionalmente idéntica a la cláusula WHERE para filtrar los resultados del JOIN.
FALSO. Aunque para un INNER JOIN el resultado puede ser el mismo, para los OUTER JOIN (LEFT, RIGHT, FULL) hay una diferencia crucial. La condición en ON se aplica antes de unir las tablas para determinar las correspondencias, mientras que WHERE filtra el resultado después de que el JOIN se ha completado. Usar WHERE en un LEFT JOIN puede convertirlo efectivamente en un INNER JOIN.

4 - Subconsultas (Subqueries)

Una subconsulta siempre debe devolver una única columna y una única fila.
FALSO. Esto solo es cierto para las subconsultas escalares (usadas en un SELECT o WHERE con =). Las subconsultas también pueden devolver múltiples filas (para usar con IN o EXISTS) o múltiples columnas (si son subconsultas de tabla en la cláusula FROM).

Las subconsultas correlacionadas se ejecutan una vez por cada fila de la consulta principal.
VERDADERO. Una subconsulta correlacionada depende de los valores de la consulta externa, por lo que necesita ser re-evaluada para cada fila procesada por la consulta principal, lo que puede afectar el rendimiento.

El operador EXISTS suele ser más eficiente que IN cuando se trabaja con subconsultas que devuelven un gran volumen de datos.
VERDADERO. EXISTS solo necesita encontrar la primera fila que cumpla la condición para devolver TRUE, no necesita procesar el conjunto de resultados completo de la subconsulta. IN, por otro lado, generalmente necesita obtener y procesar todos los resultados de la subconsulta primero.

No es posible utilizar una subconsulta en la cláusula UPDATE.
FALSO. Sí es posible. Se pueden usar subconsultas en la cláusula SET para asignar un nuevo valor o en la cláusula WHERE para determinar qué filas actualizar.

5 - Transacciones y Concurrencia

Una transacción que finaliza con ROLLBACK guarda permanentemente solo una parte de los cambios realizados.
FALSO. Un ROLLBACK deshace todos los cambios realizados desde el inicio de la transacción, dejando la base de datos en el estado en que se encontraba antes de que comenzara.

El nivel de aislamiento READ UNCOMMITTED previene el problema de "lecturas sucias" (dirty reads).
FALSO. Este es el nivel de aislamiento más bajo y permite explícitamente las lecturas sucias, es decir, leer datos de transacciones que aún no han sido confirmadas (COMMIT).

Un deadlock (interbloqueo) ocurre cuando una transacción espera por un recurso que nunca será liberado.
FALSO. Esa es la descripción de un starvation o inanición. Un deadlock es un ciclo en el que dos (o más) transacciones se bloquean mutuamente, ya que cada una espera un recurso que la otra posee.

La propiedad de "Durabilidad" (la D en ACID) asegura que una vez que una transacción ha sido confirmada (COMMIT), sus cambios sobrevivirán a fallas del sistema.
VERDADERO. La durabilidad garantiza que los cambios de una transacción confirmada se escriben de forma permanente (generalmente en un log de transacciones y luego en disco) y no se perderán aunque el sistema falle (por ejemplo, por un corte de energía).

6 - Vistas (Views) en SQL

Una vista es una tabla física que almacena una copia de los datos de una consulta.
FALSO. Una vista es una tabla virtual. No almacena datos por sí misma, sino que es una consulta SELECT almacenada. Cada vez que se consulta la vista, la consulta subyacente se ejecuta en tiempo real sobre las tablas base. (Excepción: vistas materializadas, que sí almacenan los datos).

Siempre se puede realizar una operación INSERT o UPDATE sobre una vista simple (basada en una sola tabla).
VERDADERO. En general, si una vista se basa en una sola tabla y no contiene funciones de agregación, GROUP BY, DISTINCT, etc., es actualizable.

Modificar la estructura de una tabla base (ej: eliminar una columna) no afecta a las vistas que dependen de ella.
FALSO. Afecta directamente. Si una vista hace referencia a una columna que fue eliminada de la tabla base, la vista quedará en un estado inválido y arrojará un error al ser consultada.

Las vistas se utilizan para simplificar consultas complejas y para implementar seguridad a nivel de fila/columna.
VERDADERO. Permiten encapsular la lógica de JOINs y cálculos complejos en un objeto simple. Además, se puede conceder permiso a un usuario sobre una vista (que solo muestra ciertas columnas o filas) sin darle acceso a las tablas base completas.

# Final 2

1 - Claves y Restricciones (Constraints)

Una Clave Externa (FOREIGN KEY) siempre debe apuntar a la Clave Primaria (PRIMARY KEY) de otra tabla.

Una restricción UNIQUE en una columna permite múltiples valores NULL.

La restricción CHECK se puede usar para validar que un valor de una columna esté en un rango determinado (ej: edad > 18).

Eliminar una tabla (DROP TABLE) también elimina automáticamente todos los índices y restricciones asociados a ella.

2 - Lenguajes de SQL (DDL, DML, DCL)

TRUNCATE TABLE es una operación DML (Lenguaje de Manipulación de Datos) porque modifica datos.

GRANT y REVOKE son comandos DDL (Lenguaje de Definición de Datos).

Una operación DELETE FROM mi_tabla (sin WHERE) es funcionalmente idéntica a TRUNCATE TABLE mi_tabla en todos los aspectos.

Usar ALTER TABLE para añadir una columna con un valor por defecto NOT NULL a una tabla muy grande es una operación instantánea y no bloquea la tabla.

3 - Funciones de Agregación y Agrupamiento

La cláusula HAVING filtra las filas antes de que se realice la agrupación con GROUP BY.

COUNT(columna) y COUNT(*) siempre devuelven el mismo número.

No es posible usar más de una función de agregación en la misma consulta SELECT.

Si una consulta incluye una cláusula GROUP BY, todas las columnas en la lista del SELECT deben ser o bien parte de la cláusula GROUP BY o bien estar dentro de una función de agregación.

4 - Bases de Datos NoSQL

Las bases de datos NoSQL son la mejor opción cuando el requerimiento principal es la consistencia fuerte de los datos (ACID).

Las bases de datos orientadas a documentos, como MongoDB, almacenan los datos en un formato similar a JSON, lo que permite esquemas flexibles.

El modelo de datos "clave-valor" es ideal para representar relaciones complejas con múltiples JOINs.

"Escalabilidad vertical" (aumentar la potencia de un solo servidor) es el principal método de escalado en la mayoría de los sistemas NoSQL.

5 - Optimización y Rendimiento

El plan de ejecución (EXPLAIN PLAN) es una herramienta que muestra cómo la base de datos ejecutará internamente una consulta.

Realizar un "Full Table Scan" (recorrer la tabla completa) es siempre menos performante que usar un índice.

Las variables de enlace (bind variables) o consultas parametrizadas ayudan a prevenir la inyección SQL y permiten al motor de base de datos reutilizar planes de ejecución.

Almacenar imágenes o archivos grandes directamente en la base de datos (en campos tipo BLOB) es generalmente más eficiente que almacenar solo la ruta al archivo en el sistema de archivos.

6 - Conceptos Avanzados

Un disparador (TRIGGER) es una operación que un usuario debe ejecutar manualmente para que se active.

Los Procedimientos Almacenados (Stored Procedures) se ejecutan en el cliente y ayudan a reducir el tráfico de red enviando múltiples comandos SQL al servidor.

En el modelado de datos, una relación de muchos a muchos (N:M) entre dos entidades se resuelve creando una tercera tabla, conocida como tabla de unión o intermedia.

Las funciones de ventana (Window Functions) como ROW_NUMBER() o LAG() operan sobre un conjunto de filas (la "ventana") y pueden devolver un valor para cada fila basado en ese conjunto, sin colapsar el resultado como lo hace GROUP BY.

Respuestas
1 - Claves y Restricciones (Constraints)

Una Clave Externa (FOREIGN KEY) siempre debe apuntar a la Clave Primaria (PRIMARY KEY) de otra tabla.
FALSO. Si bien es la práctica más común y recomendada, una Clave Externa también puede apuntar a una columna (o conjunto de columnas) que tenga una restricción UNIQUE en la otra tabla.

Una restricción UNIQUE en una columna permite múltiples valores NULL.
VERDADERO. La mayoría de los motores de bases de datos (como PostgreSQL y SQL Server) permiten múltiples valores NULL en una columna con restricción UNIQUE, ya que NULL no es igual a ningún otro valor, ni siquiera a otro NULL. (Excepción: Oracle trata los NULL de manera diferente en este contexto).

La restricción CHECK se puede usar para validar que un valor de una columna esté en un rango determinado (ej: edad > 18).
VERDADERO. Esa es precisamente una de las finalidades de la restricción CHECK: asegurar que los valores de una columna cumplan una condición booleana específica.

Eliminar una tabla (DROP TABLE) también elimina automáticamente todos los índices y restricciones asociados a ella.
VERDADERO. Al eliminar una tabla, se elimina el objeto completo y todos los objetos dependientes de ella, como índices, restricciones (PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE), y disparadores (triggers).

2 - Lenguajes de SQL (DDL, DML, DCL)

TRUNCATE TABLE es una operación DML (Lenguaje de Manipulación de Datos) porque modifica datos.
FALSO. TRUNCATE es una operación DDL (Lenguaje de Definición de Datos). Aunque elimina datos, lo hace de una forma muy diferente a DELETE. No se puede deshacer fácilmente (ROLLBACK), no dispara triggers de borrado y es mucho más rápida porque libera las páginas de datos directamente.

GRANT y REVOKE son comandos DDL (Lenguaje de Definición de Datos).
FALSO. Son comandos DCL (Lenguaje de Control de Datos), ya que se utilizan para administrar permisos y accesos de los usuarios, no para definir la estructura de los objetos de la base de datos.

Una operación DELETE FROM mi_tabla (sin WHERE) es funcionalmente idéntica a TRUNCATE TABLE mi_tabla en todos los aspectos.
FALSO. DELETE es DML, elimina fila por fila, dispara triggers, genera una entrada en el log de transacciones por cada fila y se puede revertir (ROLLBACK). TRUNCATE es DDL, es más rápido, no dispara triggers de borrado y resetea los contadores de identidad (en la mayoría de los motores).

Usar ALTER TABLE para añadir una columna con un valor por defecto NOT NULL a una tabla muy grande es una operación instantánea y no bloquea la tabla.
FALSO. Tradicionalmente, esta operación requería reescribir la tabla entera y podía ser muy lenta y bloqueante. Aunque algunos motores de bases de datos modernos tienen optimizaciones para hacerla más rápida (guardando el cambio solo en los metadatos), no se puede garantizar que sea instantánea y no bloqueante en todos los casos y versiones.

3 - Funciones de Agregación y Agrupamiento

La cláusula HAVING filtra las filas antes de que se realice la agrupación con GROUP BY.
FALSO. La cláusula WHERE filtra las filas antes del agrupamiento. HAVING se usa para filtrar los grupos ya formados por GROUP BY, basándose en el resultado de las funciones de agregación.

COUNT(columna) y COUNT(*) siempre devuelven el mismo número.
FALSO. COUNT(*) cuenta todas las filas del grupo o tabla. COUNT(columna) cuenta solo las filas donde el valor de columna no es NULL.

No es posible usar más de una función de agregación en la misma consulta SELECT.
FALSO. Es totalmente posible y muy común. Ejemplo: SELECT AVG(precio), SUM(stock) FROM productos;

Si una consulta incluye una cláusula GROUP BY, todas las columnas en la lista del SELECT deben ser o bien parte de la cláusula GROUP BY o bien estar dentro de una función de agregación.
VERDADERO. Esta es la regla fundamental del GROUP BY. Para cada grupo, la base de datos necesita saber cómo calcular un valor único para cada columna seleccionada. Si la columna está en GROUP BY, su valor es el mismo para todo el grupo. Si no, debe ser el resultado de una agregación (como la suma, el promedio, etc.).

4 - Bases de Datos NoSQL

Las bases de datos NoSQL son la mejor opción cuando el requerimiento principal es la consistencia fuerte de los datos (ACID).
FALSO. Las bases de datos relacionales (SQL) son el estándar para la consistencia ACID. Las NoSQL a menudo priorizan la disponibilidad y la escalabilidad, adoptando un modelo de consistencia eventual (BASE: Basically Available, Soft state, Eventual consistency).

Las bases de datos orientadas a documentos, como MongoDB, almacenan los datos en un formato similar a JSON, lo que permite esquemas flexibles.
VERDADERO. Utilizan documentos (como BSON en MongoDB) que no requieren que todos los registros tengan la misma estructura, facilitando la evolución del esquema de datos.

El modelo de datos "clave-valor" es ideal para representar relaciones complejas con múltiples JOINs.
FALSO. El modelo clave-valor es extremadamente simple y rápido para búsquedas directas por clave, pero no está diseñado para manejar relaciones complejas. Los modelos de grafos o relacionales son mucho mejores para eso.

"Escalabilidad vertical" (aumentar la potencia de un solo servidor) es el principal método de escalado en la mayoría de los sistemas NoSQL.
FALSO. El principal atractivo de los sistemas NoSQL es la "escalabilidad horizontal" (o escalar hacia afuera), que consiste en distribuir la carga y los datos a través de múltiples servidores más económicos.

5 - Optimización y Rendimiento

El plan de ejecución (EXPLAIN PLAN) es una herramienta que muestra cómo la base de datos ejecutará internamente una consulta.
VERDADERO. Muestra los pasos que seguirá el optimizador, como qué índices usará, el tipo de JOINs que realizará y el costo estimado de las operaciones, siendo fundamental para la optimización de consultas.

Realizar un "Full Table Scan" (recorrer la tabla completa) es siempre menos performante que usar un índice.
FALSO. No siempre. Si la consulta necesita recuperar un gran porcentaje de las filas de la tabla, puede ser más rápido para el motor leer la tabla secuencialmente ("Full Table Scan") que saltar de un lado a otro entre el índice y la tabla.

Las variables de enlace (bind variables) o consultas parametrizadas ayudan a prevenir la inyección SQL y permiten al motor de base de datos reutilizar planes de ejecución.
VERDADERO. Separan el código SQL de los datos del usuario, lo que neutraliza la inyección SQL. Además, como la consulta SQL es siempre la misma, el motor puede compilar el plan de ejecución una vez y reutilizarlo, mejorando el rendimiento.

Almacenar imágenes o archivos grandes directamente en la base de datos (en campos tipo BLOB) es generalmente más eficiente que almacenar solo la ruta al archivo en el sistema de archivos.
FALSO. Generalmente es lo contrario. Almacenar BLOBs puede inflar el tamaño de la base de datos, ralentizar los respaldos y la replicación. La práctica recomendada suele ser guardar los archivos en un sistema de archivos o un servicio de almacenamiento de objetos (como Amazon S3) y guardar solo la ruta o URL en la base de datos.

6 - Conceptos Avanzados

Un disparador (TRIGGER) es una operación que un usuario debe ejecutar manualmente para que se active.
FALSO. Un TRIGGER es un bloque de código que se ejecuta automáticamente en respuesta a un evento específico en una tabla (como un INSERT, UPDATE o DELETE).

Los Procedimientos Almacenados (Stored Procedures) se ejecutan en el cliente y ayudan a reducir el tráfico de red enviando múltiples comandos SQL al servidor.
FALSO. Se ejecutan en el servidor de la base de datos. Reducen el tráfico de red porque el cliente solo necesita enviar el nombre del procedimiento y sus parámetros, en lugar de un bloque grande de código SQL.

En el modelado de datos, una relación de muchos a muchos (N:M) entre dos entidades se resuelve creando una tercera tabla, conocida como tabla de unión o intermedia.
VERDADERO. Esta tabla intermedia contiene claves externas que apuntan a las claves primarias de las dos entidades originales, resolviendo así la relación N:M en dos relaciones de uno a muchos (1:N).

Las funciones de ventana (Window Functions) como ROW_NUMBER() o LAG() operan sobre un conjunto de filas (la "ventana") y pueden devolver un valor para cada fila basado en ese conjunto, sin colapsar el resultado como lo hace GROUP BY.
VERDADERO. Esta es la característica principal y la gran ventaja de las funciones de ventana. Permiten realizar cálculos complejos sobre un subconjunto de filas relacionadas con la fila actual, manteniendo el número total de filas en el resultado.







