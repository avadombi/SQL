SHOW GRANTS FOR 'avadombi'@'localhost';

-- view to show records of cities table where country_code_2 is in ('bq', 'md', 'sh', 'tz')
DROP VIEW IF EXISTS cleaned_db.view_cities_rows_to_delete;
CREATE VIEW cleaned_db.view_cities_rows_to_delete AS
SELECT COUNT(country_code_2) AS extra_rows_vs_total
FROM cleaned_db.cities
WHERE country_code_2 IN ('bq', 'md', 'sh', 'tz')
UNION ALL
SELECT COUNT(country_code_2)
FROM cleaned_db.cities
;

-- view to show records of cities table where country_code_2 is in ('aq', 'bv', 'cc', 'io', 'tf')
DROP VIEW IF EXISTS cleaned_db.view_countries_rows_to_delete;
CREATE VIEW cleaned_db.view_countries_rows_to_delete AS
SELECT COUNT(country_code_2) AS extra_rows_vs_total
FROM cleaned_db.countries
WHERE country_code_2 IN ('aq', 'bv', 'cc', 'io', 'tf')
UNION ALL
SELECT COUNT(country_code_2)
FROM cleaned_db.countries
;