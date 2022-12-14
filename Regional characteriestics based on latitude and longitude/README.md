# MySQL project
Authors: Wooyoung Jeong and Jisu Kim

# Research Questions
1. Find the characteristics of the divided regions based on latitude and longitude.
2. Find statistical characteristics by researching relationship between countries, regions, states, and cities.

# Abstract
In this data set, there is detailed information of each city, state and region with specific latitude. There are 250 countries, 4857 states, and 147400 cities. Based on specific geographical information of many different areas, we decided to dig further to find out specific unique information about areas that are separated by certain longitude and latitude points.

# Countries States Cities DataBase
Dataset: 🌍https://www.kaggle.com/datasets/tanweerulhaque/countries-states-cities-dataset

# Schemas Roadmap
![MySQL_project1_schemas_diagram](MySQL_project1_schemas_diagram.png)


# MySQL code
number of currency in 'latitude'
```SQL
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
WHERE sectioned_lat_range = '	'
GROUP BY currency  
ORDER BY num_currency DESC
```

number of currency in 'longitude'
```SQL
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
WHERE sectioned_lon_range = '	'
GROUP BY currency
ORDER BY num_currency DESC
```

# Results
<img src = "Graph/Number of Countries in Latitude.png" width=80% height=60%>
<img src = "Graph/Number of States in Latitude.png" width=80% height=60%>
<img src = "Graph/Number of Cities in Latitude.png" width=80% height=60%>

First three graphs show the distribution of countries, states and cities in specific areas that were divided by latitude.
More than half of states and cities are located between Arctic and Tropic of Cancer region. It seems very reasonable due to very friendly weather in this area.
However, there are more countries in the area between Tropic of Cacncer because it contains all area of Southern East Asia, Africa, and South America that have most of small countries in the world.

<img src = "Graph/Ratio of Countries, States, and Cities in Latitude.png" width="1000" height="500">

This graphic shows the relationship among coutries, states and cities in each different area.
The graphic shows very noticable characteriestic. Becuase human can only live in land, not ocean, the difference of states/countries and cities/states becomes extremely large when the areas are mostly made of ocean (Tropic of Capricorn - Antarctic). However, the ratio of 3 statistics become very similar when land portion takes most part of the area (Arctic-Tropic of Cancer).

<img src = "Graph/Frequency of Currency per the Area of Latitude.png" width="1000" height="400">

This graph shows the most frequently used currency in specific area that were divided by latitude.
This graphic gives very straightforward statistics.
Becuase most cultural development through eras grew together in similar latitude, most regions have very dominated currency. (Arctic - Tropic of Cancer [EURO]).


<img src = "Graph/Number of Countries in Longitude.png" width=80% height=60%>
<img src = "Graph/Number of States in Longitude.png" width=80% height=60%>
<img src = "Graph/Number of Cities in Longitude.png" width=80% height=60%>

In longitude, the area between Prime Memridian and East 60 has very large portion of all countries, states and cities. It has very close relationship with the history of the world. Since the South America, Africa, and Middle East Asia were very closely related with imperialism of Europe, all longitude region that contains those 3 areas have very large portion of data.

<img src = "Graph/Ratio of Countries, States, and Cities in Longitude.png" width="1000" height="500">

The ratio graph shows exactly same pattern with latitude ratio graph. If there are large portion of land in the area, it is more likekly to have big difference between the number of cities per number of states and number of states per number of countries. 

<img src = "Graph/Frequency of Currency per the Area of Longitude.png" width="1000" height="400">

For frequently used currency graph, it shows slightly different analysis compare to frequqently used currency graph for latitude. Because there are big difference in climate even in same area of longitude, there are many different types of currency compare to divided regions in latitude. Also, exrtremely high priority of EURO is observed in the area between Prime Meridian and East 60.

# Discussion
Limitations
1. It was unable to analyze the language of each country because the language column was written in origina language. If we can find other dataset that has english language names, it will be very helpful.
2. Since the population of the countries show very important characteriestics, deeper analysis will be available with extra data set with population. 


