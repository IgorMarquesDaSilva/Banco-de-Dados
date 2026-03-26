DELIMITER $$
drop function if exists fn_atualiza_estoque $$
create function fn_atualiza_estoque(p_id int, p_qtd int)
returns int
modifies sql data
begin
    update produtos
    set estoque = estoque - p_qtd
    where id = p_id;
    return (select estoque from produtos where id = p_id);
end $$
DELIMITER ;