USE country_db;

CREATE INDEX idx_currencY
ON currencies(currency_name, currency_code);
