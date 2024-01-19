-- Load data into countries
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/ProjectFromScratch/Country/cities.csv'
INTO TABLE cities
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`city_name`, `latitude`, `longitude`, `capital`, `population`, `country_id`)
;
