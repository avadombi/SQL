/* Delete the db `myfirstdb` if exists */
DROP DATABASE IF EXISTS myfirstdb;

-- Create, if not exists, a db named avadshop
CREATE DATABASE IF NOT EXISTS avadshop;

-- Select the database to simply the query below
USE avadshop;

-- Create if not exists a table named customers
CREATE TABLE IF NOT EXISTS customers(
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    -- update each time a modification is done
    inscriptionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);
