DELIMITER $$

CREATE PROCEDURE SugerirRoupa(IN p_temperatura DECIMAL(5,2))
BEGIN
    SELECT p_temperatura AS temperatura,
           IF(p_temperatura < 15,
              'Leve um casaco',
              'Roupa leve') AS sugestao;
END $$

DELIMITER ;

