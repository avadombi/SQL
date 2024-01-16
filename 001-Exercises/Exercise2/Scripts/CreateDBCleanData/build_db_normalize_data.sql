-- This assume that you previously built the raw database (without existing relationships)

CREATE DATABASE IF NOT EXISTS cleaned_db;
USE cleaned_db;

DROP TABLE IF EXISTS cleaned_db.countries;
CREATE TABLE cleaned_db.countries(
    country_id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL,
    country_code_2 VARCHAR(50) NOT NULL,
    country_code_3 VARCHAR(50) NOT NULL,
    region VARCHAR(50),
    sub_region VARCHAR(100),
    intermediate_region VARCHAR(100),
    create_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (country_id)
);

INSERT INTO cleaned_db.countries(
    country_id,
    country_name,
    country_code_2,
    country_code_3,
    region,
    sub_region,
    intermediate_region,
    create_on
)

(
    SELECT
        c.country_id,
        -- ignore all alphanumeric caracters and consider only '. ', then replace by ''
        -- not [] means include and ^ in [] exclude and ^ followed by ^ in [] means include
        -- [abc.] all this elements are considered literal elements because of []
        -- g: global search and i: insensitive to case. e.g., 'Hello. World' => 'HelloWorld'
        -- TRIM: remove space at the beginning and the end of the string
        TRIM(LOWER(REGEXP_REPLACE(c.country_name, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        TRIM(LOWER(REGEXP_REPLACE(c.country_code_2, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        TRIM(LOWER(REGEXP_REPLACE(c.country_code_3, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        TRIM(LOWER(REGEXP_REPLACE(c.region, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        TRIM(LOWER(REGEXP_REPLACE(c.sub_region, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        TRIM(LOWER(REGEXP_REPLACE(c.intermediate_region, '[^[:alnum:][:space:]^. ]', '', 1, 0))),
        CURRENT_TIMESTAMP
    FROM
        country_db.countries AS c
);


