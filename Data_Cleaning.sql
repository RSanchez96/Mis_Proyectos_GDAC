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
FROM july_2021_cyclistic

/*Encontre estaciones de prueba entre lo registrado (estas incluian nombres como Test o Base).
Para no considerar datos falsos, borre estas de los registros mensuales */

DELETE FROM august_2020_cyclistic
WHERE start_station_name ILIKE '%TEST%' OR start_station_name ILIKE '%BASE%'

/*Encontre estaciones de prueba entre lo registrado (estas incluian nombres como Test o Base).
Para no considerar datos falsos, borre estas de los registros mensuales */