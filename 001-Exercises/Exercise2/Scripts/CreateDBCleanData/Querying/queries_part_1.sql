-- SHOW GRANTS FOR 'avadombi'@'localhost';

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

/*
List the country, city name, population and city name length for the city names that are palindromes in the 
Western Asia sub-region.  Format the population with a thousands separator (1,000) and format the length of 
the city name in roman numerals.  Order by the length of the city name in descending order and 
alphabetically in ascending order.
*/


SELECT
    c.country_name,
    i.city_name,
    FORMAT(i.population, 0) AS population, -- 0 mean no decimal,
    LENGTH(i.city_name) AS city_name_length
FROM cleaned_db.countries AS c
INNER JOIN cleaned_db.cities AS i
ON c.country_code_2 = i.country_code_2
WHERE c.sub_region = 'western asia' AND (i.city_name = REVERSE(i.city_name))
ORDER BY city_name_length DESC, i.city_name ASC;


/* 
List all of the countries that end in 'stan'.  Make your query case-insensitive and list 
whether the total population of the cities listed is an odd or even number for cities inserted in 2022 or +.  
Order by whether the population value is odd or even in ascending order and country name in alphabetical order.
*/

SELECT
    CONCAT(UCASE(SUBSTRING(c.country_name, 1, 1)), SUBSTRING(c.country_name, 2)),
    FORMAT(SUM(i.population), 0),
    CASE
        WHEN (SUM(i.population) % 2 = 0) THEN
            'Even'
        ELSE
            'Odd'
    END AS odd_or_even

FROM cleaned_db.countries c
INNER JOIN cleaned_db.cities i
ON c.country_code_2 = i.country_code_2
WHERE
    c.country_name LIKE '%stan' AND EXTRACT(YEAR FROM i.insert_date) >= 2022
GROUP BY c.country_name
ORDER BY c.country_name ASC, odd_or_even ASC
;


/*
List the third most populated city ranked by region WITHOUT using limit or offset.  
List the region name, city name, population and order the results by region.
*/

SELECT
    CONCAT(UCASE(SUBSTRING(region, 1, 1)), SUBSTRING(region, 2)) AS region,
    city_name,
    FORMAT(population, 0) AS population
FROM
    (
        SELECT
            c.region,
            i.city_name,
            i.population,
            -- ROW_NUMBER() attribute a no to each row of the output
            -- OVER is used to define a window to which apply something
            -- PARTITION BY region divide data in distinct groups based on region
            -- ORDER BY define the order from which the row's number will be attribuated (for each group)
            ROW_NUMBER() OVER (PARTITION BY c.region ORDER BY i.population DESC) AS rn
        FROM cleaned_db.countries c
        JOIN cleaned_db.cities i ON c.country_code_2 = i.country_code_2
    ) AS ranked_cities
WHERE ranked_cities.rn = 3
ORDER BY region;
