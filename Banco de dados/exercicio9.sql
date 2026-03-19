DELIMITER $$

CREATE PROCEDURE ConverterNota(IN p_nota DECIMAL(3,1))
BEGIN
    DECLARE v_conceito CHAR(1);

    IF p_nota >= 9.0 AND p_nota <= 10.0 THEN
        SET v_conceito = 'A';
    ELSEIF p_nota >= 7.0 AND p_nota < 9.0 THEN
        SET v_conceito = 'B';
    ELSEIF p_nota >= 5.0 AND p_nota < 7.0 THEN
        SET v_conceito = 'C';
    ELSE
        SET v_conceito = 'F';
    END IF;

    SELECT p_nota AS nota,
           v_conceito AS conceito;
END $$

DELIMITER ;

