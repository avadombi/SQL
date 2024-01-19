USE country_db;

-- First drop FK in cities
-- ALTER TABLE cities DROP FOREIGN KEY cities_ibfk_1;

-- Then retrieve distinct records
CREATE TABLE countries_new AS
SELECT
    MIN(country_id) AS country_id, 
    country_name, 
    country_code, 
    region, 
    sub_region, 
    created_on, 
    currency_id
FROM countries
GROUP BY country_name, country_code, region, sub_region, created_on, currency_id;

-- rename and drop
RENAME TABLE countries TO countries_old, countries_new TO countries;

DROP TABLE countries_old;