/*Para análisis de las estaciones más visitadas,cree una view en donde considere la de las visitas a estaciones en todos los meses de mis BD*/

CREATE VIEW start_stations_data AS
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_august_2020_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_september_2020_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_october_2020_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_november_2020_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_december_2020_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_january_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_february_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_february_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_march_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_april_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_may_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_june_2021_cyclistic
GROUP BY start_station_name,Month,member_casual
UNION
SELECT start_station_name, DATE_TRUNC('month', started_at)AS Month,member_casual,COUNT(*)
FROM clean_july_2021_cyclistic
GROUP BY start_station_name,Month,member_casual

/*Con la data de la view, realice un query para poder verificar las estacionec con más 25k visitas y cuantas fueron hechas por cada tipo de usuario*/

SELECT start_station_name,member_casual, ROUND(AVG(count)) AS avrg_visits 
FROM start_stations_data
GROUP BY start_station_name,member_casual
HAVING ROUND(AVG(count)) > 25000

/*Con el resultado de la Query se verifica que hay  ciertas estaciones preferidas por nuestros usuarios casuales y otras por los miembros*/