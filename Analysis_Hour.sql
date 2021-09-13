/*Para análisis de la hora de mayor uso,cree una view en donde considere la data mensual necesaria para el análisis, 
considere solo la hora de inicio del uso de las bicicletas */

CREATE VIEW Hour_of_Day_Data AS
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_august_2020_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_september_2020_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_october_2020_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_november_2020_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_december_2020_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_january_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_february_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_march_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_april_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_may_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_june_2021_cyclistic
GROUP BY hour_of_day,member_casual
UNION
SELECT TO_CHAR(started_at,'hh24')AS hour_of_day,member_casual, AVG(ride_time),COUNT(*)
FROM clean_july_2021_cyclistic
GROUP BY hour_of_day,member_casual;

/*Con la view generada realice un query donde se tenga las cantidades mensuales y según hora del día en las que los usuarios empezaban el uso de las bicicletas*/

SELECT casual.hour_of_day,casual.member_casual, AVG(casual.avg) AS Avrg_casual_time_use , 
ROUND(AVG(casual.count)) AS Avrg_casual_user, ROUND(SUM(casual.count)) AS Total_casual_user, member.member_casual,
AVG(member.avg)AS Avrg_member_time_use,ROUND(AVG(member.count))AS Avrg_member_user,ROUND(SUM(member.count))AS Total_member_user
FROM hour_of_day_data AS casual
JOIN hour_of_day_data AS member
ON casual.hour_of_day = member.hour_of_day
WHERE casual.member_casual = 'casual' AND member.member_casual = 'member' 
GROUP BY casual.hour_of_day,member.member_casual,casual.member_casual

/*Con el resultado de la Query se deduce que la hora de mayor uso de los usuarios (casuales y miembros)son las 5 p.m.,
hora en la que la gente suele salir del trabajo e indicaria esta es la principal razón para el uso de nuestros servicios*/