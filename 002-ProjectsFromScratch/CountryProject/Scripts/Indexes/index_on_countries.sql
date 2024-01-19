USE country_db;

CREATE UNIQUE INDEX idx_country_name
ON countries(country_name);

CREATE UNIQUE INDEX idx_country_code
ON countries(country_code);

CREATE INDEX idx_region
ON countries(region);
