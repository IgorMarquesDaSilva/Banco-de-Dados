DROP PROCEDURE IF EXISTS pr_total_vendas_periodo;
DELIMITER $$

CREATE PROCEDURE pr_total_vendas_periodo(
  IN  p_inicio      DATE,
  IN  p_fim         DATE,
  OUT p_total_final DECIMAL(18,2)
)
BEGIN
  SELECT COALESCE(SUM(valor_total), 0)
    INTO p_total_final
  FROM vendas
  WHERE data_venda BETWEEN p_inicio AND p_fim;
END $$

DELIMITER ;


CALL pr_total_vendas_periodo('2026-01-10', '2026-03-12', @resultado);