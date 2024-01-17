SELECT country_code_2, country_name FROM cleaned_db.countries
WHERE country_code_2 IN ('gy', 'lc', 'ne', 'si');

INSERT INTO cleaned_db.currencies (country_code_2, currency_name, currency_code)
VALUES
    ('gy', 'guyanese dollar', 'gyd'),
    ('lc', 'canadian dollar', 'cad'),
    ('ne', 'cfa franc bceao', 'xof'),
    ('si', 'euro', 'eur')
;

--