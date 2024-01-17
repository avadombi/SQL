-- Do not forget to give the necessary privileges

DROP PROCEDURE IF EXISTS display_countries;

CREATE PROCEDURE display_countries()
BEGIN
    SELECT * FROM cleaned_db.countries;
END;

CALL display_countries();