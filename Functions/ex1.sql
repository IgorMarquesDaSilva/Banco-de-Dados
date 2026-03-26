DELIMITER $$
drop function if exists fn_media_vendas_mes $$
create function fn_media_vendas_mes (mes int, ano int)
returns decimal(10,2)
deterministic
reads sql data
begin
    declare media decimal(10,2);
    select avg(valor_total) into media
    from vendas
    where year(data_venda) = ano
    and month(data_venda) = mes;
    return media;
end $$
DELIMITER ;