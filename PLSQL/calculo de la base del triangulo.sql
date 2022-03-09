USE `empresa`;
DROP function IF EXISTS `TRIANGULO`;

DELIMITER $$
USE `empresa`$$
CREATE DEFINER = `root`@`localhost` FUNCTION TRIANGULO (BASE DOUBLE, ALTURA DOUBLE) RETURNS CHAR
BEGIN
	DECLARE SALIDA CHAR(50);
    SET SALIDA = CONCAT("el area del triangulo es: ", (BASE * ALTURA) / 2);
	RETURN SALIDA;
END$$

DELIMITER ;
