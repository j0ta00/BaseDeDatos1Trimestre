CREATE DATABASE EJERCICIOSSENCILLOS3

USE EJERCICIOSSENCILLOS3

CREATE TABLE PERSONAS(
 Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
CONSTRAINT PK_PERSONAS PRIMARY KEY (Nombre, Apellidos)
)

CREATE TABLE ENTRADAS(
 Sesion smallInt Not Null
,Fila smallInt  Not Null
,Numero_de_Asiento smallInt Not Null
,Nombre_Persona  Varchar(35) Null
,Apellidos_Persona Varchar(35) Null
,CONSTRAINT PK_ENTRADAS PRIMARY KEY (Sesion, fila, Numero_de_Asiento)
,CONSTRAINT FK_ENTRADAS_PERSONAS FOREIGN KEY(Nombre_Persona, Apellidos_Persona) 
REFERENCES PERSONAS(Nombre, Apellidos) ON DELETE NO ACTION ON UPDATE CASCADE
)
