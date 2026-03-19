DELIMITER $$

CREATE PROCEDURE ClassificarClima(IN p_temperatura DECIMAL(5,2))
BEGIN
    DECLARE v_classificacao VARCHAR(20);

    IF p_temperatura > 30 THEN
        SET v_classificacao = 'Muito Quente';
    ELSEIF p_temperatura >= 20 AND p_temperatura <= 30 THEN
        SET v_classificacao = 'Agradável';
    ELSE
        SET v_classificacao = 'Frio';
    END IF;

    SELECT p_temperatura AS temperatura,
           v_classificacao AS clima;
END $$

DELIMITER ;

