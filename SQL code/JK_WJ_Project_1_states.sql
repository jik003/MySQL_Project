
-- Find largest and lowest point for states

SELECT MAX(latitude), MAX(longitude), MIN(latitude), MIN(longitude)
FROM states


-- Number of states in left side of Earth
SELECT count(name)
FROM states
WHERE longitude > 0

-- Number of states in right side of Earth
SELECT count(name)
FROM states
WHERE longitude < 0


-- Number of states in left side of Earth
SELECT count(name) as left_states
FROM states
WHERE latitude < 0



-- Number of states in right side of Earth
SELECT count(name) as right_states
FROM states
WHERE latitude > 0





-- number of states in latitude region
WITH new_states AS
	(SELECT name, 
	CASE 
			WHEN latitude BETWEEN 66.56 AND 90 THEN 'Upper Arctic'
            WHEN latitude BETWEEN 23.44 AND 66.56 THEN 'Arctic - Tropic of Cancer'
            WHEN latitude BETWEEN 0 AND 23.44 THEN 'Tropic of Cancer - Equator'
            WHEN latitude BETWEEN -23.44 AND 0 THEN 'Equator - Tropic of Capricorn'
            WHEN latitude BETWEEN -66.56 AND -23.44 THEN 'Tropic of Capricorn - Antarctic'
            WHEN latitude BETWEEN -90 AND -66.56 THEN 'Below Antarctic'
            end sectioned_lat_range
	FROM states)
    
SELECT sectioned_lat_range, COUNT(sectioned_lat_range) as sectioned_lat_num

FROM new_states
GROUP BY sectioned_lat_range
ORDER BY sectioned_lat_num DESC



-- number of states in longitude region

WITH new_states AS
	(SELECT name, 
	CASE 
			WHEN longitude BETWEEN 120 AND 180 THEN 'East 180 - East 120'
            WHEN longitude BETWEEN 60 AND 120 THEN 'East 120 - East 60'
            WHEN longitude BETWEEN 0 AND 60 THEN 'East 60 - Prime Meridian'
            WHEN longitude BETWEEN -60 AND 0 THEN 'Prime Meridian - West 60'
            WHEN longitude BETWEEN -120 AND -60 THEN 'West 60 - West 120'
            WHEN longitude BETWEEN -180 AND -120 THEN 'West 120 - West 180'
            end sectioned_lon_range
	FROM states)
    
SELECT sectioned_lon_range, COUNT(sectioned_lon_range) as sectioned_lon_num

FROM new_states
GROUP BY sectioned_lon_range
ORDER BY sectioned_lon_num DESC


-- number of states per countries

SELECT c.name as countury_name, COUNT(c.name) as num_states
FROM states s JOIN countries c
	ON s.country_id = c.id
GROUP BY c.name
ORDER BY num_states DESC

-- number of sates per region

SELECT c.region as region_name, COUNT(c.region) as num_states
FROM states s JOIN countries c
	ON s.country_id = c.id
GROUP BY region_name
ORDER BY num_states DESC