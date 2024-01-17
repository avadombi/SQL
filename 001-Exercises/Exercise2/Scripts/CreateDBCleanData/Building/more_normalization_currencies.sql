-- Same for currencies table
ALTER TABLE cleaned_db.currencies
ADD CONSTRAINT fk_country_currencies
FOREIGN KEY (country_code_2)
REFERENCES cleaned_db.countries (country_code_2);
