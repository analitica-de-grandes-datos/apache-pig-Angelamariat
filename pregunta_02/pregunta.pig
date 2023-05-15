/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
-- carga de datos desde la carpeta 
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:chararray, date:chararray, value:int);

-- ordenamos los datos por letter y value 
sorted_data = ORDER data BY letter, value ASC;

-- escribe el archivo de salida 
STORE sorted_data INTO 'output' USING PigStorage(',');