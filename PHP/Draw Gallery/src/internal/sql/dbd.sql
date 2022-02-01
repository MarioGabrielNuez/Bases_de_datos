CREATE DATABASE DATABASEWEB;
USE DATABASEWEB;

CREATE TABLE IF NOT EXISTS USERS (
    COD_U INTEGER AUTO_INCREMENT PRIMARY KEY COMMENT("CODIGO INTERNO DEL USUARIO"),
    NOM_U VARCHAR(200) NOT NULL COMMENT("NOMBRE DE USUARIO"),
    APE_U VARCHAR(200) COMMENT("APELLIDOS DEL USUARIO"),
    ALS_U VARCHAR(100) UNIQUE COMMENT("ALIAS DEL USUARIO"),
    IPE_U VARCHAR(2000) COMMENT("IMAGEN DE PERFIL DEL USUARIO"),
    PAC_U ENUM("ADMINISTRADOR", "EDITOR") COMMENT("PERMISOS DE PERFIL DEL USUARIO"),
    ACT_U BOOLEAN COMMENT("TRUE - CUENTA ACTIVA/FALSE - CUENTA INACTIVA")
);

CREATE DATABASE IF NOT EXISTS TICKET (
    IDN_P INTEGER AUTO_INCREMENT PRIMARY KEY COMMENT("CDG_NTRN"),
    CFR_P VARCHAR(190000) COMMENT("PAHSO/ASRM")
);

CREATE TABLE IF NOT EXISTS CREATE SESION (
    COD_U INTEGER COMMENT("CODIGO INTERNO DEL USUARIO"),
    IDN_P INTEGER COMMENT("CODIGO INTERNO"),
    FHA_U INTEGER COMMENT("FECHA DE ALTA DEL USUARIO"),
    FHB_U INTEGER COMMENT("FECHA DE BAJA DEL USUARIO"),
    FOREIGN KEY (COD_U) REFERENCES USERS(COD_U),
    FOREIGN KEY (IDN_P) REFERENCES TICKET(IDN_P)
);
