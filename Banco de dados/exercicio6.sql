DELIMITER $$

CREATE PROCEDURE ReajustarSalario(
    IN p_salario_atual DECIMAL(10,2),
    IN p_nivel INT
)
BEGIN
    DECLARE v_salario_novo DECIMAL(10,2);
    DECLARE v_percentual DECIMAL(5,2);

    CASE p_nivel
        WHEN 1 THEN
            SET v_percentual = 0.10;
        WHEN 2 THEN
            SET v_percentual = 0.20;
        WHEN 3 THEN
            SET v_percentual = 0.30;
        ELSE
            SET v_percentual = 0.00;
    END CASE;

    SET v_salario_novo = p_salario_atual * (1 + v_percentual);

    SELECT p_salario_atual AS salario_antigo,
           v_salario_novo AS salario_novo,
           v_percentual * 100 AS percentual_aumento;
END $$

DELIMITER ;

