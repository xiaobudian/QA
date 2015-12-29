DELIMITER $$
DROP PROCEDURE IF EXISTS WK;
CREATE PROCEDURE WK()
  BEGIN
    DECLARE i INT;
    SET i = 1310690;
    WHILE i > 1210690 DO
      INSERT INTO question_tags (question_id, tag_id)
      VALUES (i, floor(rand() * 10) + 2);
      SET i = i - 1;
    END WHILE;
  END $$

DELIMITER ;
CALL WK();