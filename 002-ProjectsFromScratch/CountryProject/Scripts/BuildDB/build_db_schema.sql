-- create a db (or schema) if not exists
CREATE DATABASE IF NOT EXISTS country_db;

-- use the db;
USE country_db;

-- create the different tables
-- 1. Currencies table first

DROP TABLE IF EXISTS currencies;
CREATE TABLE currencies (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(100) NOT NULL,
    currency_code VARCHAR(3) NOT NULL
);


-- 2. Countries table

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    country_code VARCHAR(50),
    region VARCHAR(50),
    sub_region VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- FK
    currency_id INT,
    FOREIGN KEY (currency_id) REFERENCES currencies(currency_id)
);


-- 3. Cities table

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    latitude DECIMAL(8, 4),
    longitude DECIMAL(8, 4),
    capital VARCHAR(5),
    population INT,
    inserted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- FK
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

