## 1
Tomo choice y oral. El choice era en realidad verdadero o falso sobre 8 temas, mando los que me acuerdo:

El primer tema fue operaciones del scheduler (o sea viene una operacion qué puede hacer el scheduler, ignorarla, demorarla, etc)


Otro: claves primarias en sql. Si es posible definir tablas sin pk, si es posible definir fk sin referenciar a pk de otra tabla etc

Otro: bigdata

Otro: nivel de aislamiento read commited

Otro: null en sql, o sea logica trivaluada, operaciones de agregación sobre el null, como salvar null etc

## 2

Para q quede… el final con Emilio fue un oral grupal , pregunto en general estos conceptos …ACID, niveles de aislamiento, pedía ejemplos, Dsp preguntó tema de recovery manager, logging, sql, ddl y dml, y optimización, los joins y eso… fue bastante informal 
Hacia preguntas según la rta que le dabas tmb… pero generalmente fue eso

## 3
Fue un Verdadero/Falso de 30 mins con 40 preguntas agrupadas por 10 temas.  No se podia hacer preguntas sobre el enunciado, pero si >80% la respondio mal, entonces anulaba la pregunta.

Luego, hicimos un oral grupal donde Emilio fue repasando cada una de las preguntas. Elegia a alguien para justificar su respuesta (si la habia respondido bien) y a veces hacia preguntas relacionadas. Entiendo que si respondias mal afectaba a la nota, aunque no me queda claro. El oral duro cerca de 3 horas

No me acuerdo de todas las preguntas, pero eran mas o menos estas:

1 - SQL

- Es un lenguaje imperativo tipo Java, con estructuras de datos
- Es un lenguaje funcional puro
- Es un lenguaje orientado a objetos
- Es código abierto

2 - Tablas

- Podemos tener una tabla sin PK
- Pueden haber registros duplicados
- Puede un registro tener todos nulls
- Una PK es un campo que identifica univocamente a un campo

3 - NULL en SQL

- solo se salva con COALESCE
- cualquier operación entre columnas que una tenga un null dará null
- cualquier función de agregación sobre una columna que contenga algún null dará null
-  NULL "es equivalente a FALSE"

4 - Consultas SQL DDL

- Podemos usar INSERT junto con SELECT
- Podemos usar DELETE con WHERE
- se puede tener una columna con numeros de punto fijo
- se puede tener una columna con numeros de punto flotante

5 - ACID

- garantizar relaciones de tablas
- garantiza integridad
- no tiene fallas
- permite transacciones con más de una operación

6 - Tenemos una relación Localidad y Provincia

- Podemos borrar una provincia sin borrar sus localidades
- Podemos insertar una localidad con una provincia que no existe
- Podemos insertar una localidad sin provincia
- Podemos cambiar la provincia de una localidad existente.

7 - set ISOLATION LEVEL SERIALIZABLE

- equivale a una historia serial
- es el nivel de paralelismo más rápido
- puede haber deadlocks
- es la única forma de garantizar ACID.

8 - Big data

- no se puede guardar debido a su gran volumen
- la velocidad con la que llegan los datos no permite procesar nada
- la estructura de los datos que llegan varía periódicamente
- se le llama Big data a los datos que se guardan en las herramientas de big data


9 - ???

- ???
- ???
- ???
- ???

10 Legislación de protección de datos en Argentina

- Prohibe guardar datos sensibles sin tomar precauciones de seguridad.
- Prohibe compartir información sensible con organismos internacionales.
- Prohibe a los organismos religiosos guardar información sensible sobre sus miembros.
- Obliga a las entidades que recolectan datos a otorgar todos los datos que tienen sobre una persona cuando esta se los pide.
3) d. Podemos cambiar la provincia de una localidad existente.
10 - Legislación de protección de datos en Argentina
a. Prohibe guardar datos sensibles sin tomar precauciones de seguridad.
b. Prohibe compartir información sensible con organismos internacionales.
c. Prohibe a los organismos religiosos guardar información sensible sobre sus miembros.
d. Obliga a las entidades que recolectan datos a otorgar todos los datos que tienen sobre una persona cuando esta se los pide.
Algunas cosas que recuerdo distinto:

2)d) en realidad decía identifica unívocamente un campo en vez de registro

5)b) la velocidad con la que llegan los datos no permite procesar nada
c) la estructura de los datos que llegan varía periódicamente

Algunas que faltan:

8) isolation level serializable:
d) es la única forma de garantizar acid

9) una base de datos ACID:
c) no tiene fallas
d) permite transacciones con más de una operación

10) NULL en SQL:
a) solo se salva con COALESC
b) cualquier operación entre columnas que una tenga un null dará null
c) cualquier función de agregación sobre una columna que contenga algún null dará null
d) ???

## 4
Buenas, rendí el miércoles con Emilio, les dejo más o menos como fué la modalidad. Primero tomó un multiple choice de 40 preguntas y después un oral entre todos los que rendimos (5), los temas fueron:
- SQL (teoría y algunas preguntas sobre operaciones en sí tipo select, insert, etc)
- No-SQL
- Big Data
- Integridad referencial 
- software libre/open source
- legislación sobre protección de la información en Argentina

eran 4 preguntas por tema, los ultimos dos medio que no los tuvo en cuenta para corregir, era más para charlar sobre el tema (aparte que no se dieron en cursadas anteriores)

## 5
Buenas! Rendí con Emilio hoy, la temática fue un escrito de 45 mins dónde el te daba una serie de temas en el pizarrón y vos los tenías que explicar en más o menos 3 4 renglones. Si no me equivoco eran:

ACID
DDL
No sql
locks
Logging
Open data
Xml
Cualquier tema que se divide en subitems tipo acid dijo que podíamos armarlo en 3 renglones cada item
Después de un descanso nos junto a los 4 que estábamos y dimos un oral en conjunto, dónde el nos hacía preguntas desde muy simples hasta algunas que nunca ví xD. La idea de el era que si alguno se trababa con alguna otro podía contestar por el y así sumar puntos
Una cosa que menciono mucho en el examen es que el premia las respuestas correctas pero no descuenta punto por equivocarse, por lo que decía que nos la juguemos siempre antes de no contestar
No fue estricto corrigiendo las notas nos las dio al instante y no bajaron de 8 y nos dijo que suele mantener está mecánica en los exámenes solo que si la gente que anota es mucha suele reemplazar el examen escrito de desarrollar en pocos renglones por un múltiple choice

