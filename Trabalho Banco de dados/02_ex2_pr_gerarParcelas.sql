CREATE TABLE IF NOT EXISTS parcelas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  valor_parcela DECIMAL(10, 2),
  data_vencimento DATE
);

DROP PROCEDURE IF EXISTS pr_gerarParcelas;
DELIMITER $$

CREATE PROCEDURE pr_gerarParcelas(
  IN p_numParcelas INT,
  IN p_valorTotal DECIMAL(10, 2)
)
BEGIN
  DECLARE v_contador INT DEFAULT 1;
  DECLARE v_valor_dividido DECIMAL(10, 2);

  SET v_valor_dividido = ROUND(p_valorTotal / p_numParcelas, 2);

  REPEAT
    INSERT INTO parcelas (valor_parcela, data_vencimento)
    VALUES (
      v_valor_dividido,
      DATE_ADD(CURDATE(), INTERVAL v_contador MONTH)
    );

    SET v_contador = v_contador + 1;
  UNTIL v_contador > p_numParcelas
  END REPEAT;
END$$

DELIMITER ;


CALL pr_gerarParcelas(5, 1000.00);

