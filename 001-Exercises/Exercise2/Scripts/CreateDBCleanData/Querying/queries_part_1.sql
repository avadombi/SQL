/*
List all of the regions and the total number of countries in each region.  
Order by country count in descending order and capitalize the region name.
*/

SELECT
    CONCAT(UCASE(SUBSTRING(region, 1, 1)), SUBSTRING(region, 2)) AS region,
    COUNT(country_name) AS nb_countries
FROM
    cleaned_db.countries
GROUP BY
    region
ORDER BY nb_countries DESC;

/*
List all of the sub-regions and the total number of cities in each sub-region.  
Order by sub-region name alphabetically.
*/

SELECT
    c.sub_region AS sub_region,
    COUNT(i.city_name) AS nb_cities
FROM cleaned_db.countries AS c
INNER JOIN cleaned_db.cities AS i
ON c.country_code_2 = i.country_code_2
GROUP BY c.sub_region
ORDER BY sub_region ASC;

/*
 List all of the countries and the total number of cities in the Northern Europe sub-region.  
 List the country names in uppercase (only first letter) and order the list by the length of the country name and 
 alphabetically in ascending order.
*/

SELECT
    CONCAT(UCASE(SUBSTRING(country_name, 1, 1)), SUBSTRING(country_name, 2)) AS country_name,
    COUNT(i.city_name) AS nb_cities
FROM cleaned_db.countries AS c
INNER JOIN cleaned_db.cities AS i
ON c.country_code_2 = i.country_code_2
WHERE sub_region = 'northern europe'
GROUP BY country_name
ORDER BY LENGTH(country_name) ASC, country_name ASC;


/*
List all of the countries and the total number of cities in the Southern Europe sub-region that were inserted in 2021 or more.  
Capitalize the country names and order alphabetically by the **LAST** letter of the country name and the number of cities.
*/


SELECT
    CONCAT(UCASE(SUBSTRING(country_name, 1, 1)), SUBSTRING(country_name, 2))  AS country_name,
    COUNT(city_name) AS nb_cities
FROM cleaned_db.countries AS c
INNER JOIN cleaned_db.cities AS i
ON c.country_code_2 = i.country_code_2
WHERE sub_region = 'southern europe' AND EXTRACT(YEAR FROM create_on) >= 2021
GROUP BY country_name
ORDER BY SUBSTRING(country_name, -1) ASC, nb_cities ASC;


/*
List all of the countries in the region of Asia that did **NOT** have a city 
with an inserted date from June 2021 through Sept 2021.
*/ 

SELECT DISTINCT country_name
FROM cleaned_db.countries AS c
INNER JOIN cleaned_db.cities AS i
ON c.country_code_2 = i.country_code_2
WHERE (region = 'asia') AND (i.insert_date NOT BETWEEN '2021-06-01' AND '2021-09-30');



