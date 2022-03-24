drop database if exists red;
create database red;
use red;

create table if not exists usuarios(
	cod int primary key auto_increment,
	nombre char(50) not null,
	ape1 char(50) not null,
	ape2 char(50) not null,
	fnaci date,
	edad double,
	usuario char(15),
	cp char(5),
	falta timestamp default current_timestamp,
	perfil char(10)
);

create Table actas (
	CODIGO INTEGER, 
    APELNOM CHAR(200),
    NOTA DOUBLE,
    CODEXP CHAR(15)
);
