DELIMITER $$
drop function if exists  fn_fahrenheit_para_celsius $$
create function  fn_fahrenheit_para_celsius(fh decimal(10,2))
returns decimal(10,2)
deterministic
no sql
begin
    declare c decimal(10,2);
    set c = (fh - 32) * 5/9;
    return c;
end $$
DELIMITER ;