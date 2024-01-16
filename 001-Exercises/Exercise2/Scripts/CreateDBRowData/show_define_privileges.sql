-- DO NOT WORK FOR THE MOMENT

-- Let's write a stored procedure
-- First specify our delimiter (to avoid conflict with ; in MySQL)
-- the delimite allow to delimite our stored procedureS

-- Our stored procedure to give privilege
CREATE PROCEDURE grand_privilege_if_not_already_attributed()
BEGIN
    DECLARE privilege_count INT;

    SELECT COUNT(*) INTO privilege_count
    FROM mysql.user
    WHERE User='avadombi' AND File_priv = 'Y';

    IF privilege_count = 0 THEN
        GRANT FILE ON *.* TO 'avadombi'@'localhost';
    END IF;

END;

-- A second stored privilege to show privileges
CREATE PROCEDURE show_privileges()
BEGIN
    SHOW GRANTS FOR 'avadombi'@'localhost';
END;



-- Show the user=avadombi privviliges
CALL show_privileges();

/* Give the user=avadombi the privilege to LOAD DATA INFILE (FILE)
only if he doesn't already have it.
*/

-- Now, let's call this stored procedure
CALL grand_privilege_if_not_already_attributed();

-- Show the user=avadombi privviliges
SHOW GRANTS FOR 'avadombi'@'localhost';

