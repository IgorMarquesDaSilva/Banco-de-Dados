DROP PROCEDURE IF EXISTS pr_adicionar_usuario;
DELIMITER $$

CREATE PROCEDURE pr_adicionar_usuario(
  IN p_nome  VARCHAR(255),
  IN p_email VARCHAR(255),
  IN p_idade INT
)
BEGIN
  IF p_idade >= 18 THEN
    INSERT INTO usuarios (nome, email, idade)
    VALUES (p_nome, p_email, p_idade);
  ELSE
    SELECT 'Erro: Idade mínima não atingida' AS mensagem;
  END IF;
END $$

DELIMITER ;

CALL pr_adicionar_usuario('Ana', 'ana@gmail.com', 20);