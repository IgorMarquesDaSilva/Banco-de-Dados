DROP PROCEDURE IF EXISTS pr_desativar_clientes_antigos;
DELIMITER $$

CREATE PROCEDURE pr_desativar_clientes_antigos(IN p_data_limite DATE)
BEGIN
  UPDATE clientes
  SET status = 'Inativo'
  WHERE data_ultima_compra < p_data_limite;
END $$

DELIMITER ;

CALL pr_desativar_clientes_antigos('2023-05-11');