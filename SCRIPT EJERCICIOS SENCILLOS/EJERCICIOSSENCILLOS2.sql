CREATE DATABASE EJERCICIOSSENCILLOS2

USE EJERCICIOSSENCILLOS2

CREATE TABLE MEDICOS(
 Numero_colegiado smallInt Not Null
 CONSTRAINT PK_MEDICOS PRIMARY KEY (Numero_colegiado)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
)

CREATE TABLE USUSARIOS(
 Numero_SS smallInt Not Null
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
,Numero_colegiado_Medico smallInt Not Null
,CONSTRAINT PK_USUARIOS PRIMARY KEY (Numero_SS)
,CONSTRAINT FK_USUARIOS_MEDICOS FOREIGN KEY(Numero_colegiado_Medico) 
REFERENCES MEDICOS(Numero_colegiado) ON DELETE NO ACTION ON UPDATE CASCADE
)

