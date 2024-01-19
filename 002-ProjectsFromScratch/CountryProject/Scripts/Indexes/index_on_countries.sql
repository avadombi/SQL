-- Do not forget to attribute the needed privileges (INDEX)
-- and disconnect and reconnect the db for it to work

USE country_db;

CREATE UNIQUE INDEX idx_country_name
ON countries(country_name);

CREATE UNIQUE INDEX idx_country_code
ON countries(country_code);

CREATE INDEX idx_region
ON countries(region);
