DELIMITER $$

CREATE PROCEDURE ClassificarFaixaEtaria(IN p_idade INT)
BEGIN
    DECLARE v_faixa VARCHAR(20);

    IF p_idade < 13 THEN
        SET v_faixa = 'Criança';
    ELSEIF p_idade BETWEEN 13 AND 17 THEN
        SET v_faixa = 'Adolescente';
    ELSEIF p_idade BETWEEN 18 AND 59 THEN
        SET v_faixa = 'Adulto';
    ELSE
        SET v_faixa = 'Idoso';
    END IF;

    SELECT p_idade AS idade,
           v_faixa AS faixa_etaria;
END $$

DELIMITER ;

