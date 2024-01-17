-- Same for currencies table
ALTER TABLE cleaned_db.languages
ADD CONSTRAINT fk_country_languages
FOREIGN KEY (country_code_2)
REFERENCES cleaned_db.countries (country_code_2);
