/*Para análisis del promedio de tiempo de manejo de las bicicletas,cree una view en donde considere la mensual data necesaria para el análisis*/

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
GROUP BY Day_of_the_week,Month,member_casual;

/*Con la view generada procedi a hacer un query que me muestre el promedio de forma mensual para ambos tipos de usuarios*/

SELECT casual.day_of_the_week,casual.member_casual,AVG(casual.avg) AS Avrg_casual_time_use,
ROUND(AVG(casual.count))AS Avg_casual_user,SUM(casual.count)AS Total_casual_user, member.member_casual,
AVG(member.avg)AS Avrg_member_time_use,ROUND(AVG(member.count))AS Avg_member_user, SUM(member.count)AS Total_member_user
FROM day_of_week_data AS casual
JOIN day_of_week_data AS member
ON casual.day_of_the_week = member.day_of_the_week
WHERE casual.member_casual = 'casual' AND member.member_casual = 'member' 
GROUP BY casual.day_of_the_week,casual.member_casual, member.member_casual;

/*Como conclusión de este query, se tiene que la mayoria de usuarios (Casuales y Miembros) suelen usar las bicicletas por 20 minutos a menos en un uso promedio */