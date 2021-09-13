/*Revisando los tipos de bicicleta */

SELECT DISTINCT rideable_type
FROM july_2021_cyclistic;

/*Detecte que a partir de Diciembre en adelante, aparecia un tercer tipo de bicicleta al que llamaban Classic. 
Asumi que este tipo de bicicleta es la misma a la bicicleta Docked, 
por lo que para unificar la data cambie todos las entradas de Classic a Docked de los registros mensuales */

UPDATE june_2021_cyclistic
SET rideable_type = 'docked_bike'
WHERE rideable_type = 'classic_bike';

/*Revisando los nombres de las estaciones */

SELECT DISTINCT star_station_name
FROM july_2021_cyclistic;

/*Encontre estaciones de prueba entre lo registrado (estas incluian nombres como Test o Base).
Para no considerar datos falsos, borre estas de los registros mensuales */

DELETE FROM august_2020_cyclistic
WHERE start_station_name ILIKE '%TEST%' OR start_station_name ILIKE '%BASE%';

/*Revise en las bases de datos en caso haya alguna entrada de tipo de usuario incorrecta, sin encontrar datos falsos */

SELECT DISTINCT (member_casual)
FROM september_2020_cyclistic;

/*Verificque si habian usos de la bicicleta con una duración menor a un minuto, 
ya que asumi que eran entradas falsas */

SELECT (ended_at - started_at), start_station_name, end_station_name AS ride_time
FROM august_2020_cyclistic
WHERE (ended_at - started_at) < '00:01:00';

/*Elimine estas entradas */

DELETE FROM august_2020_cyclistic
WHERE (ended_at - started_at) < '00:01:00';