/* EJERCICIOS SOBRE TABLA CLIENTE Mario Gabriel Núñez Alcázar de Velasco */
/*--------------------------------*/
/* 1.- CARGA LA BASE DE DATOS JARDINERIA */
	CREATE DATABASE JARDINERIA;
	USE JARDINERIA;
    /* importamos la base de datos ejecutando el archivo SQL JARDINERIA.sql*/
    
/* 2.- AÑADE UN CAMPO LLAMADO ACTIVO QUE SERÁ DE TIPO BOOLEANO (S/N) EN LA TABLA CLIENTE, ANTES DEL CAMPO TELEFONO */
	ALTER TABLE CLIENTE ADD COLUMN ACTIVO BOOLEAN AFTER APELLIDO_CONTACTO;
    /* DADA LA ESTRUCTURA DE LA TABLA, AL PONER "AFTER APELLIDO_CONTACTO" ESTARÍAMOS COLOCANDO EL LA COLUMNA "ACTIVO" ANTES DE LA COLUMNA "TELEFONO" */
    
/* 3.- ACTUALIZA EL CAMPO ANTERIOR, PONIENDO S A LOS CLIENTES QUE ESTÉN EN MADRID, BARCELONA, FUENLABRA O HUMANES */
	SET SQL_SAFE_UPDATES = 0;
	/* UPDATE CLIENTE SET ACTIVO = 'S' WHERE CIUDAD = 'MADRID' OR CIUDAD = 'BARCELONA' OR CIUDAD = 'FUENLABRADA' OR CIUDAD = 'HUMANES'; */
	/* EN VEZ DE 'S' UTILIZAMOS '1' PORQUE EN MYSQL WORKBENCH CUANDO INTENTAMOS CREAR UNA COLUMNA DE TIPO BOOLEANO, NO DEJA, Y LO CREA COMO 'TINYINT' POR LO QUE: 'S' = 1 */
	UPDATE CLIENTE SET ACTIVO = '1' WHERE CIUDAD = 'MADRID' OR CIUDAD = 'BARCELONA' OR CIUDAD = 'FUENLABRADA' OR CIUDAD = 'HUMANES'; 
    
/* 4.- LOS REGISTROS QUE SEAN DE FUENLABRADA Y GETAFE, TENDRÁN UN LIMITE DE CREDITO DE 5000 */
	UPDATE CLIENTE SET LIMITE_CREDITO = 5000 WHERE CIUDAD = 'FUENLABRADA' OR CIUDAD = 'GETAFE';
    
/* 5.- AÑADE UN CAMPO DESPUES DE LIMITE_CREDITO, QUE SE LLAMARÁ CONSUMO Y SU VALOR SERÁ LA MITAD DEL LIMITE_CREDITO  */
	ALTER TABLE CLIENTE ADD COLUMN CONSUMO INTEGER AFTER LIMITE_CREDITO;
    UPDATE CLIENTE SET CONSUMO = (LIMITE_CREDITO / 2);
    
/* 6.- CREA UN CAMPO MEMBRETE DESPUÉS DE FAX, EN EL QUE ESTARÁN CONCATENADOS EL NOMBRE Y APELLIDOS DEL CONTACTO, CON LA DIRECCIÓN ENTRE PARENTESIS */
	ALTER TABLE CLIENTE ADD COLUMN MEMBRETE VARCHAR(200) AFTER FAX;
    UPDATE CLIENTE SET MEMBRETE = CONCAT(NOMBRE_CONTACTO, ' ', APELLIDO_CONTACTO, '  (', LINEA_DIRECCION1, ')');
	
/* 7.- CREA UN CAMPO LLAMADO DESCUENTO, Y ESTABLECE COMO CONTENIDO DEL MISMO "OFERTA NAVIDAD", PARA LOS REGISTROS QUE SEAN DE MADRID O FUENLABRADA Y TENGAN UN CREDITO MAYOR DE 6000 */
	ALTER TABLE CLIENTE ADD COLUMN DESCUENTO VARCHAR(200);
    UPDATE CLIENTE SET DESCUENTO = 'OFERTA NAVIDAD' WHERE (CIUDAD = 'FUENLABRADA' OR CIUDAD = 'MADRID') AND LIMITE_CREDITO > 6000;

/*------------------------------------------------------*/
/*           QUERYS SENCILLAS SQL - JARDINERIA          */
/*------------------------------------------------------*/
/* LISTA CON EL CÓDIGO DE OFICINA Y LA CIUDAD DONDE HAY OFICINAS*/
	SELECT CODIGO_OFICINA, CIUDAD FROM OFICINA WHERE CIUDAD IS NOT NULL;
    
/* LISTA CON LA CIUDAD Y EL TELÉFONO DE LAS OFICINAS DE ESPAÑA*/
	SELECT CIUDAD, TELEFONO FROM OFICINA WHERE PAIS = 'ESPAÑA';
    
/* SACA NOMBRE DEL PUESTO, NOMBRE, APELLIDOS Y EMAIL DEL JEFE DE LA EMPRESA.*/
	SELECT PUESTO, NOMBRE, APELLIDO1, APELLIDO2, EMAIL FROM EMPLEADO WHERE PUESTO = 'Director General';
    
/* LISTA CON EL NOMBRE, APELLIDOS Y PUESTO DE AQUELLOS EMPLEADOS QUE SEAN REPRESENTANTES DE VENTAS*/
	SELECT NOMBRE, APELLIDO1, APELLIDO2, PUESTO FROM EMPLEADO WHERE PUESTO = 'Representante Ventas';

/* LISTA CON EL NOMBRE DE LOS TODOS LOS CLIENTES ESPAÑOLES*/
	SELECT NOMBRE_CLIENTE FROM CLIENTE WHERE PAIS = 'Spain';
    
/* LISTA CON LOS DISTINTOS ESTADOS POR LOS QUE PUEDE PASAR UN PEDIDO. */
	SELECT DISTINCT ESTADO FROM PEDIDO;
    /* USAMOS 'SELECT DISTINCT' PARA EVITAR OS REGISTROS DUPLICADOS */
    
/* LISTA CON EL CÓDIGO DE CLIENTE DE AQUELLOS CLIENTES QUE REALIZARON ALGÚN PAGO EN 2008. TENGA EN CUENTA QUE DEBERÁ ELIMINAR AQUELLOS CÓDIGOS DE CLIENTE QUE APAREZCAN REPETIDOS. RESUELVA LA CONSULTA:*/
	SELECT CODIGO_CLIENTE FROM PAGO WHERE FECHA_PAGO > '2008-01-01' AND FECHA_PAGO < '2008-12-31' GROUP BY CODIGO_CLIENTE;
    
/* LISTA CON EL CÓDIGO DE PEDIDO, CÓDIGO DE CLIENTE, FECHA ESPERADA Y FECHA DE ENTREGA DE LOS PEDIDOS QUE NO HAN SIDO ENTREGADOS A TIEMPO.*/
	SELECT CODIGO_PEDIDO, CODIGO_CLIENTE, FECHA_ESPERADA, FECHA_ENTREGA FROM PEDIDO WHERE FECHA_ENTREGA > FECHA_ESPERADA;
    
/* LISTA CON EL CÓDIGO DE PEDIDO, CÓDIGO DE CLIENTE, FECHA ESPERADA Y FECHA DE ENTREGA DE LOS PEDIDOS CUYA FECHA DE ENTREGA HA SIDO AL MENOS UN DÍA ANTES DE LA FECHA ESPERADA.*/
	SELECT CODIGO_PEDIDO, CODIGO_CLIENTE, FECHA_ESPERADA, FECHA_ENTREGA FROM PEDIDO WHERE FECHA_ENTREGA < FECHA_ESPERADA;
    
/* LISTA DE TODOS LOS PEDIDOS QUE FUERON RECHAZADOS EN 2009.*/
	SELECT * FROM PEDIDO WHERE ESTADO = 'Rechazado';
    
/* LISTA DE TODOS LOS PEDIDOS QUE HAN SIDO ENTREGADOS EN EL MES DE ENERO DE CUALQUIER AÑO*/
	SELECT * FROM PEDIDO WHERE MONTH(FECHA_ENTREGA) = 01;
    
/* LISTA CON TODOS LOS CLIENTES QUE SEAN DE LA CIUDAD DE MADRID Y CUYO REPRESENTANTE DE VENTAS TENGA EL CÓDIGO DE EMPLEADO 11 O 30*/
	SELECT * FROM CLIENTES WHERE CIUDAD = 'MADRID' AND (CODIGO_EMPLEADO_REP_VENTAS = 11 OR CODIGO_EMPLEADO_REP_VENTAS = 30);
    
/* ¿CUÁNTOS EMPLEADOS HAY EN LA COMPAÑÍA? */
	SELECT COUNT(CODIGO_EMPLEADO) FROM EMPLEADO;
    
/* ¿CUÁL FUE EL PAGO MEDIO EN 2009? */
	SELECT AVG(TOTAL) FROM PAGO;
    
/* ¿CUÁNTOS PEDIDOS HAY EN CADA ESTADO? ORDENA EL RESULTADO DE FORMA DESCENDENTE POR EL NÚMERO DE PEDIDOS */
	SELECT COUNT(CODIGO_PEDIDO) AS NUMERO_PEDIDOS FROM PEDIDO GROUP BY ESTADO ORDER BY NUMERO_PEDIDOS ASC;
    
/* CALCULA EL PRECIO DE VENTA DEL PRODUCTO MÁS CARO Y MÁS BARATO EN UNA MISMA CONSULTA */
	SELECT MAX(TOTAL), MIN(TOTAL) FROM PAGO;
    
/* CALCULA EL NÚMERO DE CLIENTES QUE TIENE LA EMPRESA */
	SELECT COUNT(CODIGO_CLIENTE) FROM CLIENTE;
    
/* ¿CUANTOS CLIENTES TIENE LA CIUDAD DE MADRID? */
	SELECT COUNT(CODIGO_CLIENTE) FROM CLIENTE WHERE CIUDAD = 'Madrid';