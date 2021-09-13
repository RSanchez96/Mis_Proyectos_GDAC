 CREATE TABLE October_2020_Cyclistic (
    ride_id VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    rideable_type VARCHAR(20),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(10),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(10),
    start_lat DECIMAL,
    start_lng DECIMAL,
    end_lat DECIMAL,
    end_lng DECIMAL,
    member_casual VARCHAR(10)
    );
