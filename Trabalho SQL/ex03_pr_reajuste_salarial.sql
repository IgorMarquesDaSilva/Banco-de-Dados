DROP PROCEDURE IF EXISTS pr_reajuste_salarial;
DELIMITER $$

CREATE PROCEDURE pr_reajuste_salarial(
  IN p_depto   VARCHAR(255),
  IN p_aumento DECIMAL(10,2)
)
BEGIN
  UPDATE funcionarios
  SET salario = salario + p_aumento
  WHERE departamento = p_depto;
END $$

DELIMITER ;

CALL pr_reajuste_salarial('TI', 5);