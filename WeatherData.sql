SET datestyle = 'ISO, DMY';
DROP TABLE IF EXISTS weatherdata;
CREATE TABLE WeatherData (
	Dateandtime varchar,
	Temperature numeric,
	DewPoint numeric,
	RelativeHumidity integer,
	Windspeed_kmh integer,
	Visibility_km numeric,
	Pressure_kPa numeric,
	Weather varchar);
COPY WeatherData
FROM 'C:\Users\user\Data Science\Introduction to data science\Lux-Dev-Introduction-to-Python-for-Data-Science\1. Weather Data.csv'
WITH (FORMAT CSV, HEADER);

--records of exactly clear weather
SELECT COUNT(weather) FROM WeatherData
WHERE weather = 'Clear';

--number of time wind speed was 4 km/h
SELECT COUNT(Windspeed_kmh) FROM WeatherData
where Windspeed_kmh = '4';

--find null values
SELECT 
    COUNT(*) - COUNT(Dateandtime) AS dateandtime_null_count,
    COUNT(*) - COUNT(temperature) AS temperature_null_count,
    COUNT(*) - COUNT(DewPoint) AS Dew_null_count,
    COUNT(*) - COUNT(Weather) AS weather_null_count,
	COUNT(*) - COUNT(RelativeHumidity) AS Humidity_null_count	
FROM weatherdata;

--records with windspeed of greater than 24km/h and visibility of 25km
SELECT COUNT(*) FROM WeatherData
WHERE Windspeed_kmh > '24'
AND Visibility_km = '25'


