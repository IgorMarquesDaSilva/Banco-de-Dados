DELIMITER $$

CREATE PROCEDURE CalcularFrete(
    IN p_valor_compra DECIMAL(10,2),
    IN p_tipo_entrega INT
)
BEGIN
    DECLARE v_frete DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);

    CASE p_tipo_entrega
        WHEN 1 THEN
            SET v_frete = 10.00;
        WHEN 2 THEN
            SET v_frete = 25.00;
        ELSE
            SET v_frete = 0.00;
    END CASE;

    SET v_total = p_valor_compra + v_frete;

    SELECT p_valor_compra AS valor_compra,
           p_tipo_entrega AS tipo_entrega,
           v_frete AS valor_frete,
           v_total AS total_com_frete;
END $$

DELIMITER ;

