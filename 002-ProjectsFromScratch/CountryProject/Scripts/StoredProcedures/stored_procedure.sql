USE country_db;

DROP PROCEDURE IF EXISTS display_table;
CREATE PROCEDURE display_table(IN chosenTable VARCHAR(15))
BEGIN
    CASE chosenTable
            WHEN 'Countries' THEN
                SELECT country_id, country_name, coundtry_code, region FROM counties ORDER BY country_id;

            WHEN 'Cities' THEN
                SELECT city_id, city_name, FORMAT(population, 0) AS population FROM cities ORDER BY city_id;
            ELSE
                SELECT * FROM currencies ORDER BY currency_id;
    END CASE;
END;

CALL display_table('Cities');
