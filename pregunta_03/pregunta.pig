/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta 
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:chararray, date:chararray, value:int);

value_data = FOREACH data GENERATE value;

sorted_data = ORDER value_data BY value ASC;

limited_data= FILTER sorted_data BY $0 <= 5;

STORE limited_data INTO 'output' USING PigStorage(',');