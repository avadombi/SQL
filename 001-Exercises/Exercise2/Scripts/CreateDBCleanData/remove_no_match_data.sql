-- No match in countries table
DELETE FROM cleaned_db.countries
WHERE country_code_2 IN ('aq', 'bv', 'cc', 'io', 'tf');

-- No match in cities table
DELETE FROM cleaned_db.cities
WHERE country_code_2 IN ('bq', 'md', 'sh', 'tz');
