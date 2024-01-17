/*
SELECT * FROM cleaned_db.view_unique_countries;
SELECT * FROM cleaned_db.view_unique_country_code_2_in_cities;
SELECT * FROM cleaned_db.view_duplicates_cities;
SELECT * FROM cleaned_db.view_count_distinct_country_code_2_in_countries;
SELECT * FROM cleaned_db.view_count_distinct_country_code_2_in_cities;
*/

DROP PROCEDURE IF EXISTS test_integrity;
CREATE PROCEDURE test_integrity(IN testChoice VARCHAR(50))
BEGIN
    CASE testChoice
        WHEN 'divCountryCities' THEN
            SELECT * FROM cleaned_db.view_left_join_countries_cities_only_where_cities_null;
        WHEN 'leftJoinCountryCities' THEN
            SELECT * FROM cleaned_db.view_left_join_countries_cities;
        ELSE
            SELECT * FROM cleaned_db.view_countries;
    END CASE;
END;

CALL test_integrity('divCountryCities');