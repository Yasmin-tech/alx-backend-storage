-- a SQL script that creates a trigger that resets the attribute valid_email
-- only when the email has been changed.

-- CREATE THE TRIGGER
DELIMITER $$
CREATE TRIGGER trigger_update_user_valid_email
BEFORE UPDATE
ON users
FOR EACH ROW
BEGIN
    IF old.email != new.email THEN
        SET new.valid_email = 0;
    END IF;
END $$
DELIMITER ;

