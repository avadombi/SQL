DROP PROCEDURE IF EXISTS test_integrity;
CREATE PROCEDURE test_integrity(IN testChoice VARCHAR(50))
BEGIN
    CASE testChoice
        WHEN 'leftJoinCountryCities' THEN
            SELECT * FROM cleaned_db.view_left_join_countries_cities;
        WHEN 'rightJoinCountryCities' THEN
            SELECT * FROM cleaned_db.view_right_join_countries_cities;
        WHEN 'nbCountriesNoMatches' THEN
            SELECT cities.*, countries.*
            FROM (SELECT * FROM cleaned_db.view_cities_rows_to_delete) AS cities
            JOIN (SELECT * FROM cleaned_db.view_countries_rows_to_delete) AS countries
            ON 1=1;
        ELSE
            SELECT * FROM cleaned_db.view_countries;
    END CASE;
END;


CALL test_integrity('nbCountriesNoMatches');