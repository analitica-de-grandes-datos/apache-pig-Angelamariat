/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
        num_1:int,
        first_name:chararray,
        last_name:chararray,
        date:chararray,
        color:chararray,
        num_2:int);

name_color = FOREACH data GENERATE first_name, color;

filtered = FILTER name_color BY color == 'blue' AND first_name MATCHES 'Z.*';

format = FOREACH filtered GENERATE CONCAT(first_name,' ',color);

STORE format INTO 'output' USING PigStorage(',');
