CREATE DATABASE FILMOTECA;
USE FILMOTECA;

CREATE TABLE IF NOT EXISTS PELICULAS(
	COD int PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(200) NOT NULL COMMENT 'TITULO COMERCIAL ARTICULOS AL FINAL',
    DIRECTOR VARCHAR(100),
    RECAUDACION DOUBLE,
    PREMIOS INT,
    FECHAESTRENO DATE,
    ARGUMENTO MEDIUMTEXT
);

CREATE TABLE IF NOT EXISTS ACTORES(
	CODAC INT PRIMARY KEY AUTO_INCREMENT COMMENT 'CLAVE PRIONCIPAL DE ACTORES',
    NOMBRE VARCHAR (80) NOT NULL,
    FANCI DATE,
	SEXO ENUM('HOMBRE','MUJER') NOT NULL,
    EMAIL VARCHAR(15),
    CACHEACTOR FLOAT(9,2)
);

ALTER TABLE ACTORES ADD VALORACION TINYTEXT;
ALTER TABLE ACTORES DROP VALORACION;
ALTER TABLE ACTORES ADD PREMIOS INT;
ALTER TABLE ACTORES ADD VALORACION TINYTEXT AFTER PREMIOS;
ALTER TABLE ACTORES MODIFY VALORACION MEDIUMTEXT;

CREATE TABLE REPARTO (
	COD INTEGER NOT NULL,
    CODAC INTEGER NOT NULL,
    FINIRODAJE DATE,
    FFINRODAJE DATE,
    PERSONAJE VARCHAR(50),
    FOREIGN KEY (COD) REFERENCES PELICULAS (COD),
    FOREIGN KEY (CODAC) REFERENCES ACTORES (CODAC)
);

INSERT INTO PELICULAS (TITULO, DIRECTOR, RECAUDACION, PREMIOS, FECHAESTRENO, ARGUMENTO) VALUES ('El día de la noche del albor del hijo de la novia del regreso de la venganza de terror del ataque de los muertos vivientes malvados, mutantes, del infierno, comedores de carne, arrastrándose, zombies y sub humanoides, parte 5', 'James Riffel', 1000.00, 102, '1962-10-10', 'Los realizadores tomaron la pieza de cine El cerebro no quiere morir (1962) y limpiaron el audio y lo doblaron con una nueva banda sonora cómica'),																							  
('Black Sabbath', 'Matthew Longfellow', 1000.00, 102, '1963-10-10', 'Su título original es I tre volti della paura, que se traduce como las tres caras del miedo. Es una película italiana que cuenta tres historias de terror sobre mujeres amenazadas por misteriosas llamadas telefónicas, vampiros y peligrosas venganzas. Además, tiene la participación especial del legendario actor británico Boris Karloff y sí, cuenta la leyenda que el título que se le dio en inglés sirvió de inspiración para el nombre de la banda. Cabe mencionar que existe una versión estadounidense con importantes diferencias que la hacen menos interesante que la original.'),
('Barbarella', 'Roger Vadim', 1000.00, 102, '1968-10-10', 'En el año 40,000 el presidente de la Tierra le encarga a Barbarella la búsqueda del doctor Duran Duran, que habita en el...'),
('La noche del terror ciego', 'George A. Romero', 1000.00, 102, '1971-10-10', 'La película española, conocida también como Tombs of the blind dead, narra las desventuras de un grupo de personas que se topa con una maldición medieval en un...'),
('Ghoulies', 'Roger Vadim', 1000.00, 102, '1984-10-10', 'La historia trata de un joven que cae en una oscura tradición familiar y juguetea con peligrosos ritos...');

INSERT INTO ACTORES(NOMBRE, FANCI, SEXO, EMAIL, CACHEACTOR) VALUES ('SUS','0000-00-00','HOMBRE','SUS@SUS.SUS','10.00'),
('ACTOR2','0000-00-00','HOMBRE','SUS@SUS.SUS','10.00'),
('ACTOR3','0000-00-00','HOMBRE','SUS@SUS.SUS','10.00'),
('ACTOR4','0000-00-00','HOMBRE','SUS@SUS.SUS','10.00');