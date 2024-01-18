USE cleaned_db;

SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/Export/countries.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM countries;

SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/Export/cities.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM cities;

SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/Export/currencies.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM currencies;