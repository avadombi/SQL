USE country_db;

-- prefix index
CREATE INDEX idx_city_name
ON cities(city_name(30));
