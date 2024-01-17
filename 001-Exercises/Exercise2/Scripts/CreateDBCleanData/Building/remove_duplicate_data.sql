/*
-- Delete rows from t1
-- For that, let's joint t1 and t2 where countries are the same
-- And delete only rows where t1.country_id > t2.country_id
*/


DELETE t1 FROM cleaned_db.countries AS t1
INNER JOIN cleaned_db.countries AS t2
WHERE
    t1.country_code_2 = t2.country_code_2
AND
    t1.country_id > t2.country_id;  


/*
-- Check if there remain any duplicates
-- get country code
-- count how many time this country code appears
*/

SELECT
    country_code_2,
    COUNT(*)
FROM
    cleaned_db.countries
GROUP BY
    country_code_2
HAVING
    COUNT(*) > 1;

-- Display complete data after removing duplicates
SELECT country_id, country_code_2
FROM cleaned_db.countries
ORDER BY country_code_2 ASC, country_id ASC;

