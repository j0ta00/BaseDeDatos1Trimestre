CREATE DATABASE EJERCICIOSSENCILLOS5

USE EJERCICIOSSENCILLOS5

CREATE TABLE AGRICULTORES(
 ID smallInt Not Null 
,CONSTRAINT PK_AGRICULTORES PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
)

CREATE TABLE PARCELAS(
 ID smallInt Not Null 
,CONSTRAINT PK_PARCELAS PRIMARY KEY(ID)
,Calle Varchar(35) Not Null
,Numero SmallInt Not Null
,Letra Varchar(2) Null
,Piso TinyInt Null
,ID_Agricultores SmallInt Null
,CONSTRAINT FK_AGRICULTORES_PARCELAS FOREIGN KEY(ID_Agricultores) 
REFERENCES AGRICULTORES(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)
CREATE TABLE PLANTAS(
 ID smallInt Not Null 
,CONSTRAINT PK_PLANTAS PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Nombre_cientifico Varchar(50) Not Null
,mes_cosecha date Not Null
)

CREATE TABLE PARCELAS_PLANTAS(
 ID_Planta smallInt Not Null 
,ID_Parcela smallInt Not Null 
,CONSTRAINT PK_VUELOS PRIMARY KEY(ID_Parcela,ID_Planta)
,CONSTRAINT FK_PLANTAS_PLANTAS_PARCELAS FOREIGN KEY(ID_Planta) REFERENCES
PLANTAS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
,CONSTRAINT FK_PARCELAS_PLANTAS_PARCELAS FOREIGN KEY(ID_Parcela) REFERENCES
PARCELAS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)
