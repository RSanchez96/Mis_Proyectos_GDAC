/*Creación de bases de datos mensuales con la información limpia y solo considerando las columnas que me serviran para el análisis*/
CREATE TABLE clean_july_2021_cyclistic AS
SELECT ride_id,rideable_type,started_at,ended_at,
(ended_at - started_at) AS Ride_Time,start_station_name, end_station_name,member_casual
FROM july_2021_cyclistic
WHERE start_station_name IS NOT NULL AND end_station_name IS NOT NULL;