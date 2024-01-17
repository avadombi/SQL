-- Do not forget to grant the user the CREATE VIEW privilege

DROP VIEW IF EXISTS cleaned_db.view_countries;

CREATE VIEW cleaned_db.view_countries AS
SELECT country_code_2, country_name
FROM cleaned_db.countries
LIMIT 5;
