/*
Create a database schema to organize our data
(tables, relationships, integrity constraints, indexes)

And copy data into our tables from csv files
*/

-- Create our schema if not exists
CREATE SCHEMA IF NOT EXISTS country_info_schema;

-- Create our countries table
/*
Before that, we would like to remove the table
if already exists and recreate it
*/

DROP TABLE IF EXISTS country_info_schema.countries;
CREATE TABLE country_info_schema.countries(
    /* create a country_id and allows for it to
    be generated automatically everytime a record
    is inserted into our table.
    */
    country_id INT GENERATED ALWAYS AS IDENTITY,
    country_name VARCHAR(50),
    country_code_2 VARCHAR(10),
    country_code_3 VARCHAR(10),
    region VARCHAR(50),
    sub_region VARCHAR(100),
    intermediate_region VARCHAR(100),
    create_on DATE,
    -- define our primary key
    PRIMARY KEY (country_id)
);


