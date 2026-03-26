DELIMITER $$
drop function if exists fn_primeira_letra $$
create function fn_primeira_letra(nome varchar(100))
returns varchar(100)
deterministic
contains sql
begin
    return left(nome, 1);
end $$
DELIMITER ;