/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

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

data_size = FOREACH data GENERATE letter, SIZE(tuples), SIZE(keys);

sorted_data = ORDER data_size BY $0, $1, $2 ASC;

STORE sorted_data INTO 'output' USING PigStorage(',');