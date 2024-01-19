USE country_db;

-- Load data into Currencies First
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/ProjectFromScratch/Country/currencies.csv'
INTO TABLE currencies
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`currency_id`, `currency_name`, `currency_code`)
;

