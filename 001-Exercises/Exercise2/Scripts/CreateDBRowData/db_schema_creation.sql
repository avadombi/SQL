/*
Create a database schema to organize our data
(tables, relationships, integrity constraints, indexes)

And copy data into our tables from csv files
*/

-- Create our schema if not exists. In MySQL, a schema is
-- equivalent to a DB
CREATE SCHEMA IF NOT EXISTS country_db;

-- Create our countries table
/*
Before that, we would like to remove the table
if already exists and recreate it
*/

DROP TABLE IF EXISTS country_db.countries;
CREATE TABLE country_db.countries(
    /* create a country_id and allows for it to
    be generated automatically everytime a record
    is inserted into our table.
    */
    country_id INT AUTO_INCREMENT,
    country_name VARCHAR(50),
    country_code_2 VARCHAR(50),
    country_code_3 VARCHAR(50),
    region VARCHAR(50),
    sub_region VARCHAR(100),
    intermediate_region VARCHAR(100),
    create_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- define our primary key
    PRIMARY KEY (country_id)
);

/*
Let's extract the data from our CSV
For security purposes, it is recommanded to store our data in the following directroy:
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/'
    Note: ProgramDat is a hidden Directory
    To find the above path, I executed the following in cmd:
        SHOW VARIABLES LIKE 'secure_file_priv';
    From there, let's create a directory named Exercise1
        In that directory, create another directory named Data
            Move data into this directory

-- I found that some data was truncated, so that more data than existing column has been created (no sql data)
-- so, I decided to remove them manually. L31, 156, 198, 231

-- ENCLOSED BY '"'  -- Our values are not enclosed by ", so it's not necessary here
IGNORE 1 ROWS  -- because the first row is a header
*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/countries.csv'
INTO TABLE country_db.countries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`country_name`, `country_code_2`, `country_code_3`, `region`, `sub_region`, `intermediate_region`);

-- As above, create the tables for the other csv files
DROP TABLE IF EXISTS country_db.cities;
CREATE TABLE country_db.cities(
    city_id INT AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    latitude DECIMAL(8, 4), -- 8 numbers from which 4 decimals
    longitude DECIMAL(8, 4),
    country_code_2 VARCHAR(50),
    capital VARCHAR(5),
    population INT,
    insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (city_id)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/cities.csv'
INTO TABLE country_db.cities
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`city_name`, `latitude`, `longitude`, `country_code_2`, `capital`, @`population`, `insert_date`) -- notice @
SET population = NULLIF(@population, '') -- if value of pop = '', replace by NULL
;  -- never forget ;

-- Now for currencies
DROP TABLE IF EXISTS country_db.currencies;
CREATE TABLE country_db.currencies(
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code_2 VARCHAR(50),
    currency_name VARCHAR(100),
    currency_code VARCHAR(3)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/currencies.csv'
INTO TABLE country_db.currencies
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`country_code_2`, `currency_name`, `currency_code`);


-- Languages
DROP TABLE IF EXISTS country_db.languages;
CREATE TABLE country_db.languages(
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language VARCHAR(50),
    country_code_2 VARCHAR(10)
);


-- On lines 263 and 268, I had to modify the data to prevent from getting more
-- columns than defined fields (columns) in our schema for table languages
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/languages.csv'
INTO TABLE country_db.languages
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`language`, @`country_code_2`)
SET country_code_2 = TRIM(@country_code_2);

