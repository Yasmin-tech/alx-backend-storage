-- a SQL script that creates a stored procedure AddBonus that adds a new correction for a student
-- CREATE the PROCEDURE
DELIMITER $$

DROP PROCEDURE IF EXISTS AddBonus $$

CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    DECLARE project_new_id INT;

    IF project_name NOT IN (SELECT name FROM projects) THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_new_id = LAST_INSERT_ID();
    ELSE
        SELECT id INTO project_new_id FROM projects WHERE name = project_name;
    END IF;

    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_new_id, score);
END $$

DELIMITER ;

