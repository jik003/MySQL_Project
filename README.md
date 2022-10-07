# MySQL project
Authors: Wooyoung Jeong and Jisu Kim

# Research Questions
1.
2.
3.

# Abstract
In this data set, there is detailed information of each city, state and region with specific latitude. There are 250 countries, 4857 states, and 147400 cities. Based on specific geographical information of many different areas, we decided to dig further to find out specific unique information about areas that are separated by certain longitude and latitude points.

# Countries States Cities DataBase
Dataset: 🌍https://www.kaggle.com/datasets/tanweerulhaque/countries-states-cities-dataset

# Schemas Roadmap
![MySQL_project1_schemas_diagram](MySQL_project1_schemas_diagram.png)


# MySQL code for Latitude and Longitude
```SQL
/*
-- Find largest and lowest point for cities

SELECT MAX(latitude), MAX(longitude), MIN(latitude), MIN(longitude)
FROM cities


-- Number of cities in left side of Earth
SELECT count(name)
FROM cities
WHERE longitude > 0

-- Number of cities in right side of Earth
SELECT count(name)
FROM cities
WHERE longitude < 0


-- Number of cities in left side of Earth
SELECT count(name) as left_cities
FROM cities
WHERE latitude < 0



-- Number of cities in right side of Earth
SELECT count(name) as right_cities
FROM cities
WHERE latitude > 0


*/


-- number of cities in certain range of latitude
WITH new_cities AS
	(SELECT name, 
	CASE 
			WHEN latitude BETWEEN 60 AND 90 THEN '60 ~ 90'
            WHEN latitude BETWEEN 30 AND 60 THEN '30 ~ 60'
            WHEN latitude BETWEEN 0 AND 30 THEN '0 ~ 30'
            WHEN latitude BETWEEN -30 AND 0 THEN '-30 ~ 0'
            WHEN latitude BETWEEN -60 AND -30 THEN '-60 ~ -30'
            WHEN latitude BETWEEN -90 AND -60 THEN '-90 ~ -60'
            end sectioned_lat
	FROM cities)
SELECT sectioned_lat, COUNT(sectioned_lat) as sectioned_lat_num

FROM new_cities
GROUP BY sectioned_lat
ORDER BY sectioned_lat



```
