INSERT INTO funcionarios (nome, salario)
SELECT 'Ana', 2000.00
WHERE NOT EXISTS (SELECT 1 FROM funcionarios WHERE nome = 'Ana');

INSERT INTO funcionarios (nome, salario)
SELECT 'Bruno', 2500.00
WHERE NOT EXISTS (SELECT 1 FROM funcionarios WHERE nome = 'Bruno');

INSERT INTO funcionarios (nome, salario)
SELECT 'Carla', 3000.00
WHERE NOT EXISTS (SELECT 1 FROM funcionarios WHERE nome = 'Carla');

INSERT INTO funcionarios (nome, salario)
SELECT 'Diego', 3500.00
WHERE NOT EXISTS (SELECT 1 FROM funcionarios WHERE nome = 'Diego');

DROP PROCEDURE IF EXISTS pr_distribuirBonus;
DELIMITER $$

CREATE PROCEDURE pr_distribuirBonus(
  IN p_limiteBonus DECIMAL(10, 2),
  IN p_bonus DECIMAL(10, 2)
)
BEGIN
  DECLARE v_id INT;
  DECLARE v_totalDistribuido DECIMAL(10, 2) DEFAULT 0.00;


  SELECT MIN(id) INTO v_id FROM funcionarios;

  distribuir_loop: LOOP
    IF v_id IS NULL THEN
      LEAVE distribuir_loop;
    END IF;

    IF v_totalDistribuido + p_bonus > p_limiteBonus THEN
      LEAVE distribuir_loop;
    END IF;

    UPDATE funcionarios
    SET salario = salario + p_bonus
    WHERE id = v_id;

    SET v_totalDistribuido = v_totalDistribuido + p_bonus;

    SELECT id
    INTO v_id
    FROM funcionarios
    WHERE id > v_id
    ORDER BY id
    LIMIT 1;
  END LOOP distribuir_loop;
END$$

DELIMITER ;


CALL pr_distribuirBonus(500.00, 3);

