
-- Find largest and lowest point for countries

SELECT MAX(latitude), MAX(longitude), MIN(latitude), MIN(longitude)
FROM countries


-- Number of countries in left side of Earth
SELECT count(name)
FROM countries
WHERE longitude > 0

-- Number of countries in right side of Earth
SELECT count(name)
FROM countries
WHERE longitude < 0


-- Number of countries in left side of Earth
SELECT count(name) as left_countries
FROM countries
WHERE latitude < 0



-- Number of countries in right side of Earth
SELECT count(name) as right_countries
FROM countries
WHERE latitude > 0





-- number of countries in latitude region
WITH new_countries AS
	(SELECT name, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT sectioned_lat_range, COUNT(sectioned_lat_range) as sectioned_lat_num

FROM new_countries
GROUP BY sectioned_lat_range
ORDER BY sectioned_lat_num DESC



-- number of countries in longitude region

WITH new_countries AS
	(SELECT name, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT sectioned_lon_range, COUNT(sectioned_lon_range) as sectioned_lon_num

FROM new_countries

GROUP BY sectioned_lon_range
ORDER BY sectioned_lon_num DESC

-- number of countries per region

SELECT region, COUNT(region) as num_countries
FROM countries
GROUP BY region
ORDER BY num_countries DESC

-- number of countries per subregion

SELECT subregion, COUNT(subregion) as num_countries
FROM countries
GROUP BY subregion
ORDER BY num_countries DESC


-- number of currency in Upper Arctic region
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Upper Arctic'
GROUP BY currency  
ORDER BY num_currency DESC

-- number of currency in Upper Arctic - Tropic of Cancer
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Arctic - Tropic of Cancer'
GROUP BY currency  
ORDER BY num_currency DESC

-- number of currency in Tropic of Cancer - Equator
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Tropic of Cancer - Equator'
GROUP BY currency  
ORDER BY num_currency DESC


-- number of currency in Equator - Tropic of Capricorn
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Equator - Tropic of Capricorn'
GROUP BY currency  
ORDER BY num_currency DESC

-- number of currency in Tropic of Capricorn - Antarctic
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Tropic of Capricorn - Antarctic'
GROUP BY currency  
ORDER BY num_currency DESC

-- number of currency in Below Antarctic
WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lat_range
FROM new_countries_currency
WHERE sectioned_lat_range = 'Below Antarctic'
GROUP BY currency  
ORDER BY num_currency DESC

-- number of currency in West 180 - West 120 longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'West 180 - West 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'West 120 - West 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'West 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - East 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'East 60 - East 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'East 120 - East 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'West 180 - West 120'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency in West 120 - West 60 longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'West 120 - West 60'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency in West 60 - Prime Meridian longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'West 60 - Prime Meridian'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency in Prime Meridian - East 60 longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'Prime Meridian - East 60'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency in East 60 - East 120 longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'East 60 - East 120'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency in East 120 - East 180 longitude region

WITH new_countries_currency AS
	(SELECT currency, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM countries)
    
SELECT currency, COUNT(currency) as num_currency, sectioned_lon_range
FROM new_countries_currency
WHERE sectioned_lon_range = 'East 120 - East 180'
GROUP BY currency
ORDER BY num_currency DESC

-- number of currency per country
SELECT currency, COUNT(currency) AS num_currency
FROM countries
GROUP BY currency
ORDER BY num_currency DESC

-- number of uniq currency per region
SELECT region, COUNT(DISTINCT currency) AS num_uniq_currency 
FROM countries
GROUP BY region
ORDER BY num_uniq_currency DESC

-- number of uniq currency per subregion
SELECT subregion, COUNT(DISTINCT currency) AS num_currency
FROM countries
GROUP BY subregion
ORDER BY num_currency DESC

-- Number of Subregion per region
SELECT region, COUNT(subregion) AS num_subregion 
FROM countries
GROUP BY region
ORDER BY num_subregion DESC

-- Number of states per region
SELECT countries.region, COUNT(cities.state_id) AS num_states FROM countries
INNER JOIN cities ON countries.id = cities.id
GROUP BY countries.region

-- Number of states per subregion
SELECT countries.subregion, COUNT(cities.state_id) AS num_states FROM countries
INNER JOIN cities ON countries.id = cities.id
-- WHERE countries.subregion IS NOT 'N/A'
GROUP BY countries.subregion
