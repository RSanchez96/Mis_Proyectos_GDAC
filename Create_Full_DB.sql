/*Para poder trabajar las graficas del análisis con mayor facilidad, realice una tabla con toda la información mensual limpia*/

CREATE TABLE Full_cyclistic_database AS
SELECT * FROM clean_august_2020_cyclistic
UNION
SELECT * FROM clean_september_2020_cyclistic
UNION
SELECT * FROM clean_october_2020_cyclistic
UNION
SELECT * FROM clean_november_2020_cyclistic
UNION
SELECT * FROM clean_december_2020_cyclistic
UNION
SELECT * FROM clean_january_2021_cyclistic
UNION
SELECT * FROM clean_february_2021_cyclistic
UNION
SELECT * FROM clean_march_2021_cyclistic
UNION
SELECT * FROM clean_april_2021_cyclistic
UNION
SELECT * FROM clean_may_2021_cyclistic
UNION
SELECT * FROM clean_june_2021_cyclistic
UNION
SELECT * FROM clean_july_2021_cyclistic

/*Y posteriormente lo exporte como un archivo CSV, usando las opciones de exportación de PostgreSQL*/