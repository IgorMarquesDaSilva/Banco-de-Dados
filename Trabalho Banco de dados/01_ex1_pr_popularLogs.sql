CREATE TABLE IF NOT EXISTS logs_acesso (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mensagem VARCHAR(100),
  data_registro DATETIME
);

DROP PROCEDURE IF EXISTS pr_popularLogs;
DELIMITER $$

CREATE PROCEDURE pr_popularLogs(IN p_N INT)
BEGIN
  DECLARE v_i INT DEFAULT 1;

  WHILE v_i <= p_N DO
    INSERT INTO logs_acesso (mensagem, data_registro)
    VALUES (CONCAT('Log #', v_i), NOW());

    SET v_i = v_i + 1;
  END WHILE;
END$$

DELIMITER ;


CALL pr_popularLogs(10);

