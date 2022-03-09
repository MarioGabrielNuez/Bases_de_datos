use `escuela`;
drop function if exists `notas`;

delimiter $$
use `escuela`$$
create definer = `root`@`localhost` function notas(notaNum double) returns char(100) charset utf8mb4
begin
	if (notaNum < 0) then 
		return "error; la nota no puede ser menor de 0";
	elseif (notaNum > 10) then
		return "error; venga!, fantasma!";
	elseif (notaNum >= 0 and notaNum < 5) then
		return "suspenso";
	elseif (notaNum >= 5 and notaNum <= 6) then 
		return "suficiente";
	elseif (notaNum > 6 and notaNum <= 8) then
		return "notable";
	elseif (notaNum > 8 and notaNum <= 10) then
		return "sobresaliente";
	end if;
end$$
delimiter ; 
		
select notas(12	);