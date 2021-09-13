/*Para análisis del tipo de bicicleta más usado genere una view consolidando la información mensual necesaria*/

CREATE VIEW rideable_type_by_month AS 
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_august_2020_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_september_2020_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_october_2020_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_november_2020_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_december_2020_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_january_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_february_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_march_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_april_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_may_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_june_2021_cyclistic
GROUP BY rideable_type,Month,member_casual
UNION
SELECT rideable_type, DATE_TRUNC('month', started_at)AS Month, member_casual, COUNT(*)
FROM clean_july_2021_cyclistic
GROUP BY rideable_type,Month,member_casual;

/*Con la view generada procedi a hacer un query que me muestre la evolución del alquiler de ambos tipos de bicicletas*/

SELECT docked.rideable_type AS Docked_bikes , docked.count AS Amount_of_docked_bikes, electric.rideable_type Electric_types, electric.count AS Amount_of_electric_bikes, docked.member_casual, docked.month
FROM rideable_type_by_month AS docked
JOIN  rideable_type_by_month AS electric
ON docked.member_casual = electric.member_casual AND docked.month = electric.month
WHERE docked.rideable_type = 'docked_bike' AND electric.rideable_type = 'electric_bike';

/*Como conclusión de esto, se deduce un constante amplio margen de preferencia sobre las bicicletas docked por ambos tipos de usuarios, Casuales y Miembros*/