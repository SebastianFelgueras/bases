#### Definiciones:
- Base de datos
- Dato
- DDL
- DML
- Catálogo de la BD
#### Niveles
- Interno (físico)
- Lógico
- Externo
#### Claves
- PK
- CK
- SK
#### Interrelaciones
- Integridad referencial
#### Anomalías
- Inserción
- Actualización
- Eliminación
#### Normalización
- Pérdida de dependencias funcionales
- NonAdditive Join
- Formas normales
- Reglas de inferencia de Armströng
#### ACID
#### Partes de BD
- Transaction manager (TM)
- Scheduler (planificador)
- Recovery manager (RM o log manager)
- Buffer manager (BM)
- Cache manager (CM)
- Data manager (DM)
#### Concurrencia
- Problemas
    - Incorrect Summary
    - Lost Update 
    - Dirty Read
    - Non repeatable read
    - Phantom Read
- Niveles de aislamiento
#### Historias
- Equivalencia
- Seriabilizabilidad
- Recuperabilidad
    - Recuperable
    - ACA
    - Strict (ST)
#### Locking
- 2PL
    - 2PL Estricto 
    - 2PL Rigurso
- Deadlock
    - Wait die
    - Wound wait
#### Optimista
- Timestamp
- 2V2PL
- MV2PL
- Reglas
    - Thomas
    - Write too late
    - Read too late
#### Fallos 
- System crash
- Falla en transacción o sistema
- Condiciones de excepción
- Control de concurrencia
- Falla de disco
- Falla catastrófica
#### Logging
- Log
- Tipos de entradas en el log
- Tipos de log
    - UNDO
    - REDO
    - UNDO/REDO
- Checkpoint
    - Quiesciente
    - No quiesciente
#### Optimización
- Factores
    - Heurísticas
    - Estadísticas (selectividad)
    - Índices y tipos de archivos disponibles
#### Índices y archivos
- Archivos
    - Heap file
    - Sorted file
- Índices
    - Índice Clustered
    - Índice Unclustered
    - Índice Hash
- Árboles B+
#### Partes plan ejecución
- Interpretación de consulta
    - Parse
    - Bind
    - Optimize
    - Execute
- Nodos plan de ejecución soportan
    - Open
    - getRow
    - Close
- Operadores acceso datos
    - Scan
    - Seek
- Operadores junta
    - Nested loop join
    - Merge join
    - Hash join
- Otros operadores
    - Sort 
    - Filter
    - Compute scalar
    - Agregación
        - Stream
        - Hash
- Materialización y pipelining
#### Long duration transactions
- Saga
- Transacciones de compensación
#### DDBMS
- Fragmentación
    - Vertical
    - Horizontal
    - Mixta
- Replicación
    - Total
    - Nula
    - Parcial
- Transparencia
    - Ubicación
    - Nombres
    - Fragmentación
    - Replicación
    - Diseño
    - Ejecución
- Availability
- Tolerancia a fallas
- CAP
- Escalabilidad
    - Vertical
    - Horizontal
- Autonomía
    - Diseño
    - Comunicación
    - Ejecución
- Control de concurrencia
    - Sitio primario
    - Sitio primario + backup
    - Copia primaria
    - Votación (lock distribuido basado en mayorías)
- Catálogo
    - Centralizado
    - Totalmente replicado
    - Replicación parcial
- Commit distribuido
    - 2PC
    - 3PC
- Fases de consulta
    - Parseo y mapeo
    - Localización
    - Optimización global
    - Opimización local
- BD federadas
#### BASE
- Basic Availability
- Soft State
- Eventual Consistency
#### OLTP y OLAP
#### NoSQL
- Clave valor
- Column family
- Grafos
- Documentos
- Column Store
#### Big Data
- Volumen
- Velocidad
- Variedad
- Veracidad
- Valor
#### Open data
- Acceso abierto si
    - Gratuito
    - De libre uso
    - Integral
    - Oportuno
    - No discriminatorio
    - Primario
    - Permanente
    - Legible por máquinas
- Nivel de apertura
    1. Datos no estructurados
    2. Datos estructurados
    3. Formatos de uso libre
    4. Interconección de datos
    5. Vinculación de datos para proveer contexto
#### Gobierno de datos
- Niveles de madurez
    - Indisciplinado
    - Reactivo
    - Proactivo
    - Gobernado
#### Arquitectura de datos
- Buena si
    - Colaborativa
    - Administrada
    - Simple
    - Elástica
    - Segura
    - Resiliente
#### Data warehouse
- ETL
- Datos
    - Subject-oriented
    - Integrated
    - Time-variant
    - Non-volatile
- Metadata
- Carga incremental
#### Seguridad
- Pilares
    - Integridad
    - Confidencialidad
    - Disponibilidad
- Seguridad física 
- Inyección SQL
- Medidas estrictamente de BD
    - Autenticación, usuarios y roles
    - Trazabilidad
    - Cifrado
    - Views
    - Grant y Revoke

#### Ley nacional de protección de datos personales