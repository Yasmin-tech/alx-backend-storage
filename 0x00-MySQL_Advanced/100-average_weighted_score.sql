-- a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and store the average weighted score for a student
DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
    DECLARE weights INT;
    DECLARE total_weighted_score INT;

    SELECT SUM(p.weight)
    INTO weights
    FROM projects p
    JOIN corrections c ON p.id = c.project_id
    WHERE c.user_id = input_user_id;

    -- SELECT weights; -- Uncomment this line if you want to see the result

    SELECT SUM(p.weight * c.score)
    INTO total_weighted_score
    FROM corrections c
    JOIN projects p
    ON (c.project_id = p.id)
    WHERE c.user_id = input_user_id;

    UPDATE users SET average_score = total_weighted_score / weights
    WHERE users.id = input_user_id;

END $$

DELIMITER ;
