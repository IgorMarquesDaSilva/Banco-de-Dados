DELIMITER $$

CREATE PROCEDURE TipoTriangulo(
    IN p_l1 DECIMAL(10,2),
    IN p_l2 DECIMAL(10,2),
    IN p_l3 DECIMAL(10,2)
)
BEGIN
    DECLARE v_tipo VARCHAR(20);

    IF (p_l1 + p_l2 <= p_l3) OR
       (p_l1 + p_l3 <= p_l2) OR
       (p_l2 + p_l3 <= p_l1) THEN
        SET v_tipo = 'Não é triângulo';
    ELSE
        IF p_l1 = p_l2 AND p_l2 = p_l3 THEN
            SET v_tipo = 'Equilátero';
        ELSEIF p_l1 = p_l2 OR p_l1 = p_l3 OR p_l2 = p_l3 THEN
            SET v_tipo = 'Isósceles';
        ELSE
            SET v_tipo = 'Escaleno';
        END IF;
    END IF;

    SELECT p_l1 AS L1,
           p_l2 AS L2,
           p_l3 AS L3,
           v_tipo AS tipo_triangulo;
END $$

DELIMITER ;

