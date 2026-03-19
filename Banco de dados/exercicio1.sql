DELIMITER $$

CREATE PROCEDURE CalcularDesconto(IN p_valor DECIMAL(10,2))
BEGIN
    DECLARE v_valor_final DECIMAL(10,2);

    IF p_valor > 100 THEN
        SET v_valor_final = p_valor * 0.90;
    ELSE
        SET v_valor_final = p_valor;
    END IF;

    SELECT p_valor AS valor_original,
           v_valor_final AS valor_final;
END $$

DELIMITER ;

