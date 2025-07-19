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

# Final 3

Cuestionario Final de Base de Datos - Verdadero o Falso
Tema 1: Conceptos Fundamentales de Bases de Datos
Una clave primaria puede contener valores nulos.
Una clave foránea siempre debe apuntar a una clave primaria en otra tabla.
Un esquema de base de datos es la estructura descrita en un lenguaje formal soportado por el sistema de gestión de bases de datos (DBMS).
La redundancia de datos es deseable en las bases de datos relacionales porque mejora la velocidad de las consultas.
Tema 2: Lenguaje SQL: DDL (Data Definition Language)
El comando DROP TABLE elimina la estructura y los datos de una tabla, y esta acción no se puede deshacer.
ALTER TABLE permite añadir o eliminar únicamente columnas, pero no restricciones.
TRUNCATE TABLE es un comando DML que elimina todas las filas de una tabla una por una.
La restricción UNIQUE en una columna impide la inserción de valores duplicados, pero permite múltiples valores NULL.
Tema 3: Lenguaje SQL: DML (Data Manipulation Language)
El comando INSERT solo puede agregar una fila a la vez a una tabla.
El comando UPDATE puede modificar varias filas en una sola ejecución si la cláusula WHERE coincide con múltiples registros.
Si se ejecuta un DELETE sin la cláusula WHERE, se eliminará la tabla completa.
La sentencia MERGE combina operaciones de INSERT, UPDATE y DELETE en una sola sentencia.
Tema 4: Lenguaje SQL: DQL (Data Query Language)
SELECT * es generalmente la forma más eficiente de consultar datos porque recupera toda la información de una vez.
La cláusula HAVING se utiliza para filtrar filas después de que se hayan aplicado las funciones de agregación y el GROUP BY.
Un LEFT JOIN entre la Tabla A y la Tabla B devolverá todos los registros de la Tabla B, incluso si no tienen correspondencia en la Tabla A.
El operador LIKE se utiliza para la comparación de patrones en cadenas de texto.
Tema 5: Funciones y Agregaciones en SQL
La función AVG() ignora los valores NULL en su cálculo.
COUNT(*) siempre devuelve el mismo resultado que COUNT(nombre_columna).
Es obligatorio usar un GROUP BY siempre que se utiliza una función de agregación en la cláusula SELECT para obtener un resultado por grupo.
La función COALESCE devuelve el primer valor no nulo de una lista de argumentos.
Tema 6: Transacciones y Propiedades ACID
La propiedad de Atomicidad (Atomicity) asegura que todas las operaciones dentro de una transacción se completen con éxito o ninguna de ellas lo haga.
La Consistencia (Consistency) en ACID significa que la base de datos pasa de un estado válido a otro, respetando todas las reglas y restricciones definidas.
La Durabilidad (Durability) garantiza que una vez que una transacción se confirma (COMMIT), sus cambios persistirán incluso ante fallos del sistema.
Una transacción que solo realiza operaciones de lectura no necesita cumplir con las propiedades ACID.
Tema 7: Niveles de Aislamiento y Concurrencia
El nivel de aislamiento READ UNCOMMITTED es el más estricto y previene todos los fenómenos de concurrencia.
Una "lectura sucia" (dirty read) ocurre cuando una transacción lee datos que han sido modificados por otra transacción que aún no ha sido confirmada.
El nivel de aislamiento SERIALIZABLE puede reducir la concurrencia del sistema pero garantiza la máxima consistencia de los datos.
Un deadlock (bloqueo mutuo) ocurre cuando dos o más transacciones se esperan mutuamente para liberar recursos, creando un ciclo de espera infinito.
Tema 8: Normalización de Bases de Datos
El principal objetivo de la normalización es eliminar o reducir la redundancia de datos y mejorar la integridad de los mismos.
Una tabla está en Primera Forma Normal (1FN) si todos sus atributos contienen valores atómicos (indivisibles).
Para que una tabla esté en Tercera Forma Normal (3FN), primero debe estar en Segunda Forma Normal (2FN).
La desnormalización es una técnica que nunca se debe utilizar porque viola los principios de un buen diseño de base de datos.
Tema 9: Bases de Datos NoSQL
Las bases de datos NoSQL son una buena opción para aplicaciones que requieren un esquema flexible o no definido.
Todas las bases de datos NoSQL siguen el modelo de consistencia eventual (eventual consistency).
El término "NoSQL" significa que este tipo de bases de datos no utilizan ningún tipo de lenguaje de consulta.
Las bases de datos orientadas a documentos, como MongoDB, almacenan los datos en un formato similar a JSON.
Tema 10: Big Data y Almacenamiento de Datos
El "Volumen" es la única característica que define al Big Data.
Un Data Warehouse está diseñado principalmente para el procesamiento de transacciones en línea (OLTP) a alta velocidad.
El proceso ETL (Extract, Transform, Load) se utiliza para mover y preparar datos desde diversas fuentes a un repositorio central, como un Data Warehouse.
La "Variedad" en Big Data se refiere a la capacidad de procesar grandes volúmenes de datos de diferentes tipos, como texto, imágenes, videos y datos de sensores.
Respuestas y Justificaciones
Falso. Por definición, una clave primaria debe identificar unívocamente a cada registro y no puede contener valores nulos.
Falso. Una clave foránea debe apuntar a una columna que sea única en la tabla referenciada, que generalmente es la clave primaria, pero también puede ser una columna con una restricción UNIQUE.
Verdadero. El esquema define la estructura lógica de la base de datos, incluyendo tablas, vistas y relaciones.
Falso. La redundancia es un problema que la normalización busca reducir para evitar inconsistencias y anomalías en los datos.
Verdadero. DROP es una operación DDL destructiva y permanente.
Falso. ALTER TABLE es un comando muy versátil que permite modificar la estructura de la tabla, incluyendo añadir, eliminar o modificar columnas y restricciones.
Falso. TRUNCATE TABLE es un comando DDL. Elimina todas las filas de una tabla de forma muy eficiente, pero no es DML como DELETE.
Verdadero. La restricción UNIQUE asegura que todos los valores en la columna sean distintos entre sí, pero la mayoría de los motores de BD permiten insertar múltiples valores NULL.
Falso. Se pueden insertar múltiples filas usando la sintaxis INSERT INTO ... VALUES (...), (...), ... o INSERT INTO ... SELECT ....
Verdadero. La cláusula WHERE determina qué filas serán afectadas, y si varias cumplen la condición, todas serán actualizadas.
Falso. Eliminará todas las filas de la tabla, pero la estructura de la tabla (columnas, índices) permanecerá. Para eliminar la tabla se usa DROP TABLE.
Verdadero. MERGE (o UPSERT en algunos dialectos) es muy útil para sincronizar datos entre tablas.
Falso. Es ineficiente porque puede transferir más datos de los necesarios y puede impedir el uso de ciertos índices. Es mejor práctica especificar las columnas que se necesitan.
Verdadero. WHERE filtra filas antes de la agregación, HAVING filtra grupos después de la agregación.
Falso. Un LEFT JOIN de A con B devuelve todos los registros de la Tabla A (la de la izquierda) y los registros coincidentes de la Tabla B.
Verdadero. Se usa con caracteres comodín (%, _) para buscar subcadenas o patrones.
Verdadero. Todas las funciones de agregación (SUM, AVG, MAX, MIN), excepto COUNT(*), ignoran los valores NULL.
Falso. COUNT(*) cuenta todas las filas, mientras que COUNT(nombre_columna) solo cuenta las filas donde esa columna específica no tiene un valor NULL.
Falso. Se puede usar una función de agregación sin GROUP BY para calcular un único valor agregado para toda la tabla. El GROUP BY es necesario cuando se quiere calcular agregados por cada grupo y se incluyen columnas no agregadas en el SELECT.
Verdadero. Es una función muy útil para manejar valores nulos y proporcionar un valor por defecto.
Verdadero. Es el principio de "todo o nada".
Verdadero. La transacción lleva a la base de datos de un estado válido a otro, asegurando que se cumplan todas las reglas de integridad.
Verdadero. Los cambios confirmados son permanentes y sobreviven a reinicios o fallos.
Falso. Aunque no modifican datos, las transacciones de solo lectura aún necesitan Aislamiento (Isolation) para evitar leer datos inconsistentes de otras transacciones.
Falso. Es el nivel de aislamiento más bajo y permisivo; permite lecturas sucias, no repetibles y fantasma. El más estricto es SERIALIZABLE.
Verdadero. Es uno de los principales problemas de concurrencia que los niveles de aislamiento más altos buscan prevenir.
Verdadero. Ofrece la máxima protección contra anomalías de concurrencia a costa de un menor rendimiento, ya que puede limitar las operaciones paralelas.
Verdadero. Es un problema clásico de concurrencia que los DBMS deben detectar y resolver (generalmente terminando una de las transacciones).
Verdadero. Su objetivo es organizar los datos para minimizar la repetición y evitar anomalías de actualización, inserción y borrado.
Verdadero. La atomicidad de los valores es el requisito fundamental de la 1FN.
Verdadero. Las formas normales son acumulativas. Una tabla en 3FN debe cumplir los requisitos de 2FN y 1FN.
Falso. La desnormalización es una técnica de optimización que se aplica conscientemente en ciertos casos (como en Data Warehouses) para mejorar el rendimiento de las consultas, a pesar de introducir redundancia.
Verdadero. La flexibilidad del esquema es una de sus ventajas clave, ideal para datos no estructurados o que evolucionan rápidamente.
Falso. Aunque muchas favorecen el modelo BASE (que incluye consistencia eventual), algunas bases de datos NoSQL ofrecen transacciones ACID o niveles de consistencia más fuertes.
Falso. El término significa "Not Only SQL" (No solo SQL), indicando que pueden usar otros lenguajes de consulta además de o en lugar de SQL.
Verdadero. Almacenan objetos de datos (documentos) en formatos como BSON (una representación binaria de JSON), lo que permite estructuras anidadas y complejas.
Falso. Big Data se define comúnmente por las "V": Volumen, Velocidad, Variedad, Veracidad y Valor.
Falso. Un Data Warehouse está optimizado para el análisis de datos (OLAP - Online Analytical Processing), no para transacciones (OLTP).
Verdadero. ETL es el proceso estándar para poblar Data Warehouses y otros sistemas de análisis de datos.
Verdadero. La variedad se refiere a la heterogeneidad de las fuentes y tipos de datos que se deben procesar.

# Final 4 Grok, guarda que se equivoca

### Preguntas

#### 1 - SQL
1. SQL es un lenguaje declarativo.  
2. SQL puede ser utilizado para crear procedimientos almacenados.  
3. SQL solo se utiliza para consultar datos, no para modificarlos.  
4. SQL es un lenguaje estandarizado por ANSI e ISO.  

#### 2 - Tablas
5. Una tabla en una base de datos relacional debe tener una clave primaria.  
6. Es posible tener filas duplicadas en una tabla sin clave primaria.  
7. Una fila en una tabla puede tener todos sus columnas establecidas en NULL.  
8. Una clave primaria puede consistir en múltiples columnas.  

#### 3 - NULL en SQL
9. La función COALESCE se puede utilizar para reemplazar NULL con un valor especificado.  
10. Cualquier operación aritmética que involucre un valor NULL resultará en NULL.  
11. Las funciones de agregación como SUM y AVG ignoran los valores NULL.  
12. En SQL, NULL es equivalente a FALSE en expresiones lógicas.  

#### 4 - Sentencias SQL
13. La sentencia INSERT se puede utilizar junto con una sentencia SELECT para insertar datos de otra tabla.  
14. La sentencia DELETE debe incluir siempre una cláusula WHERE para especificar qué filas eliminar.  
15. SQL admite tipos de datos para números de punto fijo, como DECIMAL.  
16. SQL no admite números de punto flotante.  

#### 5 - ACID
17. La atomicidad asegura que una transacción se trate como una unidad única, que se completa enteramente o no se completa en absoluto.  
18. La consistencia asegura que una transacción lleve la base de datos de un estado válido a otro.  
19. El aislamiento asegura que las transacciones concurrentes no interfieran entre sí.  
20. La durabilidad asegura que una vez que una transacción se ha comprometido, sus cambios son permanentes, incluso en caso de fallo del sistema.  

#### 6 - Relaciones entre tablas
21. Si hay una restricción de clave externa de Localidad a Provincia, no podemos eliminar una provincia que tenga localidades asociadas.  
22. No podemos insertar una localidad con una provincia que no exista en la tabla Provincia.  
23. Es posible insertar una localidad sin especificar una provincia, si la clave externa permite NULL.  
24. Podemos actualizar la provincia de una localidad existente a otra provincia existente.  

#### 7 - Niveles de aislamiento
25. El nivel de aislamiento SERIALIZABLE asegura que las transacciones se ejecuten de manera equivalente a alguna ejecución serial.  
26. SERIALIZABLE es el nivel de aislamiento más rápido porque permite la máxima concurrencia.  
27. El uso de SERIALIZABLE puede llevar a deadlocks.  
28. SERIALIZABLE es el único nivel de aislamiento que garantiza completamente las propiedades ACID.  

#### 8 - Big Data
29. Big data se refiere a conjuntos de datos que son demasiado grandes para ser procesados por sistemas de bases de datos tradicionales.  
30. El aspecto de velocidad en big data significa que los datos se generan y necesitan ser procesados en tiempo real o casi en tiempo real.  
31. La variedad en big data se refiere a los diferentes formatos y estructuras de datos, como datos estructurados, semi-estructurados y no estructurados.  
32. Big data solo se trata del volumen de datos y no de su velocidad o variedad.  

#### 9 - Consultas SQL
33. Es posible utilizar la función de agregación SUM sin una cláusula GROUP BY, lo que sumaría sobre toda la tabla.  
34. En una consulta SELECT sin joins, el número de filas en el resultado no puede exceder el número de filas en la tabla.  
35. Al unir dos tablas, el número de filas en el resultado puede ser mayor que el número de filas en cualquiera de las tablas.  
36. Una consulta con una cláusula GROUP BY siempre devolverá menos filas que la tabla original.  

#### 10 - Legislación de protección de datos
37. Las leyes de protección de datos generalmente requieren que las organizaciones tomen medidas de seguridad para proteger los datos personales sensibles.  
38. Generalmente está prohibido compartir datos personales sensibles con organizaciones internacionales sin las salvaguardas adecuadas.  
39. Las organizaciones religiosas a menudo están exentas de las leyes de protección de datos respecto a los datos de sus miembros.  
40. Los individuos tienen el derecho de acceder y obtener una copia de sus datos personales en poder de las organizaciones.  

---

### Respuestas
1. Verdadero  
2. Verdadero  
3. Falso  
4. Verdadero  
5. Falso  
6. Verdadero  
7. Verdadero  
8. Verdadero  
9. Verdadero  
10. Verdadero  
11. Verdadero  
12. Falso  
13. Verdadero  
14. Falso  
15. Verdadero  
16. Falso  
17. Verdadero  
18. Verdadero  
19. Verdadero  
20. Verdadero  
21. Verdadero  
22. Verdadero  
23. Verdadero  
24. Verdadero  
25. Verdadero  
26. Falso  
27. Verdadero  
28. Falso  
29. Verdadero  
30. Verdadero  
31. Verdadero  
32. Falso  
33. Verdadero  
34. Verdadero  
35. Verdadero  
36. Falso  
37. Verdadero  
38. Verdadero  
39. Falso  
40. Verdadero  

---

# Final 5 Grok, guarda que se equivoca

### Preguntas

#### 1 - Conceptos Básicos de Bases de Datos
1. Una base de datos es simplemente una colección de datos almacenados en una computadora.  
2. El modelo relacional organiza los datos en tablas con filas y columnas.  
3. En una base de datos relacional, cada tabla debe tener una clave primaria.  
4. Las bases de datos NoSQL no pueden manejar datos estructurados.  

#### 2 - SQL
5. SQL significa "Structured Query Language" y se utiliza para administrar y manipular bases de datos relacionales.  
6. La sentencia SELECT se utiliza para insertar nuevos datos en una tabla.  
7. La cláusula WHERE se puede utilizar para filtrar filas en una consulta SELECT.  
8. SQL no permite realizar operaciones de unión (JOIN) entre tablas.  

#### 3 - Claves y Relaciones
9. Una clave foránea (foreign key) es un campo que identifica de manera única una fila en su propia tabla.  
10. La integridad referencial asegura que las relaciones entre tablas permanezcan consistentes.  
11. Una clave primaria puede contener valores NULL.  
12. Es posible tener más de una clave primaria en una tabla.  

#### 4 - Normalización
13. La normalización es el proceso de eliminar datos redundantes en una base de datos.  
14. Una base de datos en primera forma normal (1NF) no puede tener columnas con valores repetidos.  
15. La tercera forma normal (3NF) elimina las dependencias transitivas.  
16. La desnormalización se utiliza para mejorar el rendimiento en ciertas situaciones, a pesar de introducir redundancia.  

#### 5 - Índices
17. Un índice en una base de datos acelera las operaciones de búsqueda y consulta.  
18. Los índices solo se pueden crear en claves primarias.  
19. Un índice puede ralentizar las operaciones de inserción y actualización.  
20. Es posible tener múltiples índices en una sola tabla.  

#### 6 - Transacciones
21. Una transacción es una secuencia de operaciones que se ejecutan como una unidad atómica.  
22. El acrónimo ACID se refiere a las propiedades de Atomicidad, Consistencia, Aislamiento y Durabilidad.  
23. Todas las transacciones deben ser completadas en su totalidad o no ejecutarse en absoluto.  
24. El aislamiento de transacciones previene problemas como lecturas sucias y lecturas no repetibles.  

#### 7 - Seguridad en Bases de Datos
25. Los privilegios en una base de datos determinan qué usuarios pueden acceder a qué datos.  
26. La autenticación es el proceso de verificar la identidad de un usuario.  
27. Es posible revocar permisos otorgados a un usuario en una base de datos.  
28. La encriptación de datos es opcional y no es necesaria para proteger información sensible.  

#### 8 - Consultas SQL Avanzadas
29. La cláusula GROUP BY se utiliza para agrupar filas que tienen los mismos valores en columnas especificadas.  
30. La función COUNT() devuelve el número total de filas en una tabla, incluyendo las que tienen valores NULL.  
31. Es posible utilizar subconsultas (subqueries) dentro de una consulta SELECT.  
32. La cláusula HAVING se utiliza para filtrar grupos en una consulta con GROUP BY.  

#### 9 - Tipos de Datos en SQL
33. El tipo de dato VARCHAR se utiliza para almacenar cadenas de texto de longitud variable.  
34. El tipo de dato INT puede almacenar números decimales.  
35. El tipo de dato DATE se utiliza para almacenar fechas sin información de hora.  
36. Es posible almacenar imágenes y archivos binarios en una base de datos utilizando el tipo de dato BLOB.  

#### 10 - Vistas y Procedimientos Almacenados
37. Una vista es una tabla virtual basada en el resultado de una consulta SQL.  
38. Los procedimientos almacenados son bloques de código SQL que se pueden ejecutar repetidamente.  
39. Las vistas pueden ser utilizadas para simplificar consultas complejas y mejorar la seguridad.  
40. Los procedimientos almacenados no pueden aceptar parámetros.  

---

### Respuestas
1. Verdadero  
2. Verdadero  
3. Falso  
4. Falso  
5. Verdadero  
6. Falso  
7. Verdadero  
8. Falso  
9. Falso  
10. Verdadero  
11. Falso  
12. Falso  
13. Verdadero  
14. Verdadero  
15. Verdadero  
16. Verdadero  
17. Verdadero  
18. Falso  
19. Verdadero  
20. Verdadero  
21. Verdadero  
22. Verdadero  
23. Verdadero  
24. Verdadero  
25. Verdadero  
26. Verdadero  
27. Verdadero  
28. Falso  
29. Verdadero  
30. Verdadero  
31. Verdadero  
32. Verdadero  
33. Verdadero  
34. Falso  
35. Verdadero  
36. Verdadero  
37. Verdadero  
38. Verdadero  
39. Verdadero  
40. Falso  

---

