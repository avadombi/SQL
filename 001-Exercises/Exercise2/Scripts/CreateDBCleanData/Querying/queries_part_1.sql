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

