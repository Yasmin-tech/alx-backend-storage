-- a SQL script that creates a stored procedure ComputeAverageScoreForUser
-- It computes and store the average score for a student.
DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN input_user_id INT)
BEGIN
    DECLARE average DECIMAL(10,2);

    SELECT AVG(score)
    INTO average
    FROM corrections
    WHERE user_id = input_user_id;

    UPDATE users SET average_score = average WHERE id = input_user_id;
END $$

DELIMITER ;
