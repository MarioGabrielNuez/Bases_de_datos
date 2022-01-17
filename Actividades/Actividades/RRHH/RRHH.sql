CREATE DATABASE RRHH;
USE RRHH;

CREATE TABLE IF NOT EXISTS EMPRESA(
	IDEMP INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'IDENTIFICADOR DE LA EMPRESA',
    CIF VARCHAR(14) NOT NULL COMMENT 'CIF DE LA EMPRESA',
    RAZSO VARCHAR(200) NOT NULL COMMENT 'RAZÓN SOCIAL/NOMBRE DE LA EMPRESA',
    ACTIVP VARCHAR(200) NOT NULL COMMENT 'ACTIVIDAD PRINCIPAL DE LA EMPRESA',
    COTE INTEGER NOT NULL COMMENT 'COTIZACION DE LA EMPRESA',
    PAIS VARCHAR(50) NOT NULL COMMENT 'PAIS DE LA EMPRESA',
    MUN VARCHAR(50) NOT NULL COMMENT 'MUNICIPIO DE LA EMPRESA',
    DFIS VARCHAR(100) NOT NULL COMMENT 'DOMICILIO FISCAL DE LA EMPRESA',
    DOS VARCHAR(200) NOT NULL COMMENT 'DOMICILIO SOCIAL DE LA EMPRESA',
    DIRE VARCHAR(100) NOT NULL COMMENT 'DIRECTOR DE LA EMPRESA'
);

CREATE TABLE IF NOT EXISTS CONTRATO(
	CODCONTR INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'IDENTIFICACION DE LA EMPRESA',
    TIP VARCHAR(200) NOT NULL COMMENT 'TIPO DE CONTRATO',
    PPM VARCHAR(5) NOT NULL COMMENT 'PERIODO DE PRUEBA MINIMO EN MESES',
    PPMX VARCHAR(5) NOT NULL COMMENT 'PERIODO DE PRUEBA MÁXIMO EN MESES'
);

CREATE TABLE IF NOT EXISTS CATEGORIAS(
	CODCAT INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'CODIGO DE CATEGORIA DE CONTRATO',
    SULD DOUBLE NOT NULL COMMENT 'SUELDO',
    GC VARCHAR(10) NOT NULL COMMENT 'GRUPO DE COTIZACIÓN',
    SETH BOOLEAN COMMENT 'SISTEMA ESPECIAL TRABAJADORES DEL HOGAR',
    SECAA BOOLEAN COMMENT 'SISTEMA ESPECIAL TRABAJADORES CUENTA AJENA AGRARIOS'
);

CREATE TABLE IF NOT EXISTS EMPLEADOS(
	CODEMP INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'CODIGO DE EMLEADO',
    NOMBR VARCHAR(100) NOT NULL COMMENT 'NOMBRE DEL EMPLEADO',
    DNI VARCHAR(14) NOT NULL COMMENT 'DNI DEL EMPLEADO',
    FNACI DATE NOT NULL COMMENT 'FECHA DE NACIMIENTO',
    NSS VARCHAR(40) NOT NULL COMMENT 'NUMERO DE AFILIACIÓN A LA SEGURIDAD SOCIAL',
    NFOR VARCHAR(200) NOT NULL COMMENT 'NIVEL FORMARTIVO',
    NACI VARCHAR(50) NOT NULL COMMENT 'NACIONALIDAD',
    MDOC VARCHAR(50) NOT NULL COMMENT 'MUNICIPIO DEL DOMICILIO',
    PAIS VARCHAR(50) NOT NULL COMMENT 'PAIS DEL DOMICILIO',
    DOM VARCHAR(100) NOT NULL COMMENT 'DOMICILIO'
);

CREATE TABLE IF NOT EXISTS CONTRATACION(
	IDEMP INTEGER NOT NULL COMMENT 'IDENTIFICADOR DE LA EMPRESA',
	CODEMP INTEGER NOT NULL COMMENT 'CODIGO DE EMLEADO',
    CODCONTR INTEGER NOT NULL COMMENT 'IDENTIFICACION DE LA EMPRESA',
    CODCAT INTEGER NOT NULL COMMENT 'CODIGO DE CATEGORIA DE CONTRATO',
    FCHC TIMESTAMP NOT NULL COMMENT 'FECHA DE CELEBRACION DE CONTRATO',
    JORN VARCHAR(10) NOT NULL COMMENT 'JORNADA DEL CONTRATO',
    HJOR VARCHAR(10) NOT NULL COMMENT 'DURACION DE LA JORNADA EN HORAS',
    INIJ TIME COMMENT 'HORA DE INICIO DE LA JORNADA',
    FINJ TIME COMMENT 'FINALIZACION DE LA JORNADA',
    HDES VARCHAR(10) COMMENT 'NUMERO DE HORAS DE DESCANSO POR JORNADA',
    PPE VARCHAR(5) NOT NULL COMMENT 'DURACION DEL PERIODO DE PRUEBA ESTABBLECIDO',
    FOREIGN KEY (IDEMP) REFERENCES EMPRESA(IDEMP),
    FOREIGN KEY (CODEMP) REFERENCES EMPLEADOS(CODEMP),
    FOREIGN KEY (CODCONTR) REFERENCES CONTRATO(CODCONTR),
    FOREIGN KEY (CODCAT) REFERENCES CATEGORIAS(CODCAT)
);

INSERT INTO EMPRESA (CIF, RAZSO, ACTIVP, COTE, PAIS, MUN, DFIS, DOS, DIRE) VALUES 
					('W2774106E', 'Ingenier S.L.', 'Desarrollo de Software', '2000', 'España', 'Barcelona', 'Rúa Rosado, 0, 37º E', 'Rúa Rosado, 0, 37º E', 'Dn. Ignacio Sotelo Tercero');

INSERT INTO EMPRESA (CIF, RAZSO, ACTIVP, COTE, PAIS, MUN, DFIS, DOS, DIRE) VALUES 
					('E57361560', 'SInstems S.L.', 'venta de ordenadores', '2322', 'España', 'Madrid', 'Plaza Inés, 242, 7º 2º', 'Ruela Valdez, 41, 0º 1º', 'Srita. Ane Borrego Segundo');

INSERT INTO EMPRESA (CIF, RAZSO, ACTIVP, COTE, PAIS, MUN, DFIS, DOS, DIRE) VALUES 
					('A22006209', 'LimpiaQTLimpia S.A', 'Limpieza de naves industriales', '20232', 'España', 'Zaragoza', 'Travesía Sandra, 14, Ático 2º', 'Travesía Sandra, 14, Ático 2º', 'Héctor Alejandro Tercero');

INSERT INTO EMPLEADOS (NOMBR, DNI, FNACI, NSS, NFOR, NACI, MDOC, PAIS, DOM) VALUES 
					('Sandra Solano Hijo', '41994427S', '1984-5-13', '440149843', 'Ingeniería', 'España', 'Bilzen', 'España', 'Camino Pascual, 996, 9º 0º');

INSERT INTO EMPLEADOS (NOMBR, DNI, FNACI, NSS, NFOR, NACI, MDOC, PAIS, DOM) VALUES 
					('Miguel Ángel Leal', '17762566B', '1997-11-10', '160781797', 'Grado Superior', 'España', 'Madrid', 'España', 'Avenida Pozo, 92, Ático 2º');

INSERT INTO EMPLEADOS (NOMBR, DNI, FNACI, NSS, NFOR, NACI, MDOC, PAIS, DOM) VALUES 
					('Cristina Arellano', '59727490D', '1980-5-10', '408936264', 'Licenciatura', 'España', 'Utebo', 'España', 'Calle Ona, 13, 2º');
                    
INSERT INTO CATEGORIAS (SULD, GC) VALUES ('1466.40', '01');

INSERT INTO CATEGORIAS (SULD, GC) VALUES ('1215.90', '02');

INSERT INTO CATEGORIAS (SULD, GC, SETH) VALUES ('1232', '09', TRUE);

INSERT INTO CONTRATO (TIP, PPM, PPMX) VALUES ('INDEFINIDO','2','6');

INSERT INTO CONTRATO (TIP, PPM, PPMX) VALUES ('PRACTICAS','1','2');