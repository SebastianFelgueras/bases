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

