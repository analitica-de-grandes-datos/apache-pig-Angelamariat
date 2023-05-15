/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta 
data = LOAD 'data.tsv' USING PigStorage('\t') AS (
        letter:chararray, 
        tuples:bag{t:tuple(l_mins:chararray)}, 
        keys:map[]);

flat_data = FOREACH data GENERATE FLATTEN(tuples) AS tuples_f, FLATTEN(keys) AS keys_f;

grouped = GROUP flat_data BY (tuples_f,keys_f);

count = FOREACH grouped GENERATE group, COUNT(flat_data);

STORE count INTO 'output' USING PigStorage(',');
