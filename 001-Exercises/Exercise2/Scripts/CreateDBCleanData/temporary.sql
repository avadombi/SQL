-- Show countries with duplicates (count > 1) in cleaned_db.countries table
SELECT
    -- get country code
    country_code_2,
    -- count how many time this country code appears
    COUNT(*)
FROM
    cleaned_db.countries
GROUP BY
    country_code_2
HAVING
    COUNT(*) > 1;

-- Remove duplicates in cleaned_db.countries table
