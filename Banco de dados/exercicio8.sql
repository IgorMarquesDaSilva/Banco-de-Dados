DELIMITER $$

CREATE PROCEDURE Autenticar(
    IN p_senha VARCHAR(50),
    OUT p_sucesso TINYINT
)
BEGIN
    IF p_senha = '1234' THEN
        SET p_sucesso = 1;
    ELSE
        SET p_sucesso = 0;
    END IF;
END $$

DELIMITER ;

