-- Do not forget to grant the user the CREATE VIEW privilege

DROP VIEW IF EXISTS cleaned_db.view_countries;
CREATE VIEW cleaned_db.view_countries AS
SELECT country_code_2, country_name
FROM cleaned_db.countries
LIMIT 5;

DROP VIEW IF EXISTS cleaned_db.view_unique_countries;
CREATE VIEW cleaned_db.view_unique_countries AS
SELECT DISTINCT country_code_2, country_name
FROM cleaned_db.countries
ORDER BY country_code_2 ASC;

DROP VIEW IF EXISTS cleaned_db.view_unique_country_code_2_in_cities;
CREATE VIEW cleaned_db.view_unique_country_code_2_in_cities AS
SELECT DISTINCT country_code_2
FROM cleaned_db.cities
ORDER BY country_code_2 ASC;

DROP VIEW IF EXISTS cleaned_db.view_duplicates_cities;
CREATE VIEW cleaned_db.view_duplicates_cities AS
SELECT country_code_2, COUNT(*)
FROM cleaned_db.cities
GROUP BY country_code_2
HAVING COUNT(*) > 1
ORDER BY country_code_2 ASC;

DROP VIEW IF EXISTS cleaned_db.view_count_distinct_country_code_2_in_countries;
CREATE VIEW cleaned_db.view_count_distinct_country_code_2_in_countries AS
SELECT COUNT(DISTINCT country_code_2) AS number_distinct_countries
FROM cleaned_db.countries;

DROP VIEW IF EXISTS cleaned_db.view_count_distinct_country_code_2_in_cities;
CREATE VIEW cleaned_db.view_count_distinct_country_code_2_in_cities AS
SELECT COUNT(DISTINCT country_code_2) AS number_distinct_countries
FROM cleaned_db.cities;

DROP VIEW IF EXISTS cleaned_db.view_left_join_countries_cities;
CREATE VIEW cleaned_db.view_left_join_countries_cities AS
SELECT DISTINCT c.country_code_2 AS 'from country', i.country_code_2 'from cities'
FROM cleaned_db.countries AS c
LEFT JOIN cleaned_db.cities AS i ON c.country_code_2 = i.country_code_2
WHERE i.country_code_2 IS NULL
ORDER BY c.country_code_2 ASC, i.country_code_2 ASC;

DROP VIEW IF EXISTS cleaned_db.view_right_join_countries_cities;
CREATE VIEW cleaned_db.view_right_join_countries_cities AS
SELECT DISTINCT c.country_code_2 AS 'from country', i.country_code_2 'from cities'
FROM cleaned_db.countries AS c
RIGHT JOIN cleaned_db.cities AS i ON c.country_code_2 = i.country_code_2
WHERE c.country_code_2 IS NULL
ORDER BY c.country_code_2 ASC, i.country_code_2 ASC;

-- view to show records of cities table where country_code_2 is in ('bq', 'md', 'sh', 'tz') vs total records
DROP VIEW IF EXISTS cleaned_db.view_cities_rows_to_delete;
CREATE VIEW cleaned_db.view_cities_rows_to_delete AS
SELECT t1.total, t2.extra
FROM (SELECT COUNT(*) AS total FROM cleaned_db.cities) AS t1
JOIN (SELECT COUNT(*) AS extra FROM cleaned_db.cities WHERE country_code_2 IN ('bq', 'md', 'sh', 'tz')) AS t2
ON 1=1;

-- view to show records of countries table where country_code_2 is in ('aq', 'bv', 'cc', 'io', 'tf') vs total records
DROP VIEW IF EXISTS cleaned_db.view_countries_rows_to_delete;
CREATE VIEW cleaned_db.view_countries_rows_to_delete AS
SELECT t1.total, t2.extra
FROM (SELECT COUNT(*) AS total FROM cleaned_db.countries) AS t1
JOIN (SELECT COUNT(*) AS extra FROM cleaned_db.countries WHERE country_code_2 IN ('aq', 'bv', 'cc', 'io', 'tf')) AS t2
ON 1=1;


/*
COUNTRIES vs CURRENCIES
*/

DROP VIEW IF EXISTS cleaned_db.view_left_join_countries_currencies;
CREATE VIEW cleaned_db.view_left_join_countries_currencies AS
SELECT DISTINCT c.country_code_2 AS 'from country', i.country_code_2 'from currencies'
FROM cleaned_db.countries AS c
LEFT JOIN cleaned_db.currencies AS i ON c.country_code_2 = i.country_code_2
WHERE i.country_code_2 IS NULL
ORDER BY c.country_code_2 ASC, i.country_code_2 ASC;

DROP VIEW IF EXISTS cleaned_db.view_right_join_countries_currencies;
CREATE VIEW cleaned_db.view_right_join_countries_currencies AS
SELECT DISTINCT c.country_code_2 AS 'from country', i.country_code_2 'from currencies'
FROM cleaned_db.countries AS c
RIGHT JOIN cleaned_db.currencies AS i ON c.country_code_2 = i.country_code_2
WHERE c.country_code_2 IS NULL
ORDER BY c.country_code_2 ASC, i.country_code_2 ASC;
