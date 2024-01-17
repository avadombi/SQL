/*
Another normalization operation
Here we want to impose a unicity constraints on country_code_2
so that if we add a new record with a country_code_2 value that
already exists an error is triggered
*/

ALTER TABLE cleaned_db.countries
ADD CONSTRAINT unique_country_code_2 UNIQUE (country_code_2);
