/*
Link countries table to cities table using country_code_2 as a foreign key
in the cities table.

-- Do not forget to give ALTER and REFERENCES privileges.
Then restart (and not refresh) the connection to allow the changes to be applied.
*/

ALTER TABLE cleaned_db.cities
-- constraint name: name of the FK
ADD CONSTRAINT fk_country_city
FOREIGN KEY (country_code_2)
-- whick key to reference from parent table
REFERENCES cleaned_db.countries (country_code_2);

--

