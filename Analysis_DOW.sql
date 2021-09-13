/*Para análisis de los días de la semana con mayor uso de nuestros servicios,
cree una view con la información de los días en los que hecho cada uso de las bicicletas en todos los meses de mis BD*/

CREATE VIEW Day_of_week_data AS
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_august_2020_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_september_2020_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_october_2020_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_november_2020_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_december_2020_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_january_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_february_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_march_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_april_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_may_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_june_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual
UNION
SELECT TO_CHAR(started_at,'Day') AS Day_of_the_week, DATE_TRUNC('month', started_at)AS Month,member_casual, AVG(ride_time),COUNT(*)
FROM clean_july_2021_cyclistic
GROUP BY Day_of_the_week,Month,member_casual

/*Con los resultados de la View, genere un query para verificar el día de la semana con mayor cantidad de visitas promedio para ambos tipos de usuarios*/

SELECT casual.day_of_the_week,casual.member_casual,AVG(casual.avg) AS Avrg_casual_time_use,
ROUND(AVG(casual.count))AS Avg_casual_user,SUM(casual.count)AS Total_casual_user, member.member_casual,
AVG(member.avg)AS Avrg_member_time_use,ROUND(AVG(member.count))AS Avg_member_user, SUM(member.count)AS Total_member_user
FROM day_of_week_data AS casual
JOIN day_of_week_data AS member
ON casual.day_of_the_week = member.day_of_the_week
WHERE casual.member_casual = 'casual' AND member.member_casual = 'member' 
GROUP BY casual.day_of_the_week,casual.member_casual, member.member_casual

/*Como conclusión de esto se tiene que nuestros usuarios casuales suelen usar mayormente nuestro servicio los fines de semana, probablemente para recreación,
Y los miembros lo usan mayormente de lunes a viernes, para su traslado al trabajo y/o centro de estudios*/