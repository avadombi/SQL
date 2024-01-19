USE country_db;

DROP VIEW IF EXISTS extract_country_canada;

CREATE VIEW extract_country_canada AS
SELECT c.country_id, c.country_name, i.city_name, i.city_id
FROM countries c
INNER JOIN cities i
ON c.country_id = i.country_id
WHERE c.country_name = 'canada';