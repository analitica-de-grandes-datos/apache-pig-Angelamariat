/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
        num_1:int,
        first_name:chararray,
        last_name:chararray,
        date:chararray,
        color:chararray,
        num_2:int);

last_name_len = FOREACH data GENERATE last_name, SIZE(last_name) AS len;

sorted_last= ORDER last_name_len BY len DESC, last_name ASC;

limited = LIMIT sorted_last 5;

STORE limited INTO 'output' USING PigStorage(',');
