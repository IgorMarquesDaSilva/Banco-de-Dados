DELIMITER $$

CREATE PROCEDURE CalcularMulta(IN p_velocidade INT)
BEGIN
    IF p_velocidade > 80 THEN
        SELECT p_velocidade AS velocidade,
               'Multado: R$ 200,00' AS resultado;
    ELSE
        SELECT p_velocidade AS velocidade,
               'Velocidade dentro do limite' AS resultado;
    END IF;
END $$

DELIMITER ;

