USE country_db;

-- For this to work, you have to be the SUPER USER or have its.
-- privilege. One option is to create a new connection with root user.
-- This will work fine.
-- create the table to store the changes
CREATE TABLE IF NOT EXISTS city_remote_insert(
    city_remote_id INT AUTO_INCREMENT PRIMARY KEY,
    change_type VARCHAR(10),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- create the trigger
CREATE TRIGGER IF NOT EXISTS insert_city_trigger
AFTER INSERT
ON cities
FOR EACH ROW
BEGIN
    INSERT INTO city_remote_insert (city_id, change_type)
    VALUES (NEW.city_id, 'INSERT');
END;
