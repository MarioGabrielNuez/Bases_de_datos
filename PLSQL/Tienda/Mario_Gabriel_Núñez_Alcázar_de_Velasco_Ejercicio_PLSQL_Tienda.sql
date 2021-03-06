/**********************************************************
 * DECLARACIÓN DE LA TABLA
 **********************************************************/
CREATE DATABASE IF NOT EXISTS TIENDA;
USE TIENDA;

CREATE TABLE IF NOT EXISTS CLIENTES (
	CODIGO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    APELNOM CHAR(100) NOT NULL ,
    FECHALTA TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EMAIL CHAR(100) NOT NULL ,
    DIRECCIÓN CHAR(150) NOT NULL 
);

CREATE TABLE IF NOT EXISTS PEDIDOS (
	CODPED INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CODCLI INT NOT NULL,
    PRODUCTO CHAR(50) NOT NULL,
    CANTIDAD INT NOT NULL,
    BASEIMPONIBLE CHAR(50) NOT NULL,
    PVP DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS CARRITO (
	CODC INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CODPRO INT NOT NULL,
    CODCLI INT NOT NULL,
    FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CANTIDAD INT NOT NULL
);

CREATE TABLE IF NOT EXISTS LOG (
	CODC INT NOT NULL,
    CDPRO INT NOT NULL,
    FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ENTREGAS (
	CODENV INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CLIENTE INT NOT NULL,
    PEDIDO INT NOT NULL,
    FENTREGA DATE NOT NULL
);

INSERT INTO `tienda`.`clientes` (`APELNOM`, `EMAIL`, `DIRECCIÓN`) VALUES ('miguel', 'miguel@hsa.com', 'calle fernandez');
INSERT INTO `tienda`.`clientes` (`APELNOM`, `EMAIL`, `DIRECCIÓN`) VALUES ('anamaria', 'ana@gmail.com', 'calle de juarez');

/**********************************************************
 * PROCEDIMIENTOS
 **********************************************************/
/*Procedimiento SELECCION() que llevará al carrito los datos de usuario, producto y cantidad indicados en el procedimiento*/
USE `TIENDA`;
DROP procedure IF EXISTS `SELECCION`;

DELIMITER $$
USE `TIENDA`$$
CREATE PROCEDURE `SELECCION` (CODCLI INTEGER, CODPRO INTEGER, CANTIDAD INTEGER)
BEGIN
	INSERT INTO CARRITO (CODPRO, CODCLI, CANTIDAD) VALUES (CODPRO, CODCLI, CANTIDAD);
END$$

DELIMITER ;

/* Procedimiento COMPRAR() al indicarle un número de carrito al procedimiento, creará el pedido correspondiente con los datos del carrito y borrará el carrito*/
USE `TIENDA`;
DROP procedure IF EXISTS `COMPRAR`;

DELIMITER $$
USE `TIENDA`$$
CREATE PROCEDURE `COMPRAR` (CODCA INTEGER)
BEGIN
	/* DECLARE */
    DECLARE PRODUCT INTEGER;
    DECLARE CODCLIe INTEGER;
    DECLARE CANTIDA INTEGER;
    DECLARE BASEIMPONIBL INTEGER;
    DECLARE PVPv INTEGER;
    
	/*set*/
    SET BASEIMPONIBL = 100;
	SET PRODUCT = (SELECT CODPRO FROM CARRITO WHERE CODC = CODCA);
	SET CODCLIe = (SELECT CODCLI FROM CARRITO WHERE CODC = CODCA);
	SET CANTIDA = (SELECT CANTIDAD FROM CARRITO WHERE CODC = CODCA);
    set PVPv = (((BASEIMPONIBL * cantida) * 21) / 100) + (BASEIMPONIBL * cantida);
	
	INSERT INTO PEDIDOS (CODCLI, PRODUCTO, CANTIDAD, BASEIMPONIBLE, PVP) VALUES (CODCLIe, PRODUCT, CANTIDA, BASEIMPONIBL, PVPv);
	DELETE FROM CARRITO WHERE CODC = CODCA;
END$$

DELIMITER ;

/**********************************************************
 * TRIGGERS
 **********************************************************/
 /*copiar datos de carrito en log cuando se borre un registro*/
DELIMITER //
CREATE TRIGGER COPIA_SEG AFTER DELETE ON CARRITO FOR EACH ROW BEGIN
	INSERT INTO LOG SET LOG.CODC = OLD.CODC,
                        LOG.CDPRO = OLD.CODPRO,
                        LOG.FECHA = OLD.FECHA;
END//
// DELIMITER ;

/*RELLENAR ENTREGA CUANDO SE CREA UN REGISTRO EN PEDIDOS*/
DELIMITER //
CREATE TRIGGER GENERATE_ENTREGA AFTER INSERT ON PEDIDOS FOR EACH ROW BEGIN
	INSERT INTO ENTREGAS SET ENTREGAS.PEDIDO = NEW.CODPED,
						ENTREGAS.CLIENTE = NEW.CODCLI,
                        ENTREGAS.FENTREGA = DATE_ADD(NOW(), INTERVAL 7 DAY);
END//
// DELIMITER ;