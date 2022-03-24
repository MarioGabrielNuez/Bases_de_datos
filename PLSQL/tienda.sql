create database if not exists tienda;
use tienda;

create table if not exists clientes(
	codigo int not null primary key auto_increment,
    apelnom char(100) not null ,
    falta timestamp default current_timestamp,
    email char(100) not null ,
    dire char(150) not null 
);

create table if not exists Pedidos(
	codped int not null primary key auto_increment,
    codcli int not null,
    producto char(50) not null,
    cant int not null,
    bimponible char(50) not null,
    pvp double not null
);

create table if not exists carrito(
	codc int not null primary key auto_increment,
    codpro int not null,
    codcli int not null,
    fecha timestamp default current_timestamp
);

create table if not exists entregas(
	codenv int not null primary key auto_increment,
    codcli int not null,
    codped int not null,
    fecha date not null
);