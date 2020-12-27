CREATE DATABASE EJERCICIOSSENCILLOS6
USE EJERCICIOSSENCILLOS6

CREATE TABLE POLITICOS(
 ID smallInt Not Null 
,CONSTRAINT PK_POLITICOS PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
)
CREATE TABLE ABOGADOS(
 ID smallInt Not Null 
,CONSTRAINT PK_ABOGADOS PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
)
CREATE TABLE CAUSAS(
 Numero smallInt Not Null
,Causas smallInt Not Null
,Nombre_del_Juzgado varChar(30) Not Null
,CONSTRAINT PK_CAUSAS PRIMARY KEY(Numero, Causas, Nombre_del_Juzgado)
)

CREATE TABLE IMPLICA(
 ID_Abogado smallInt Not Null 
,ID_Politico smallInt Not Null
,Numero_Causa smallInt Not Null
,Causas_Causa smallInt Not Null
,Nombre_del_Juzgado_Causa varChar(30) Not Null
,CONSTRAINT PK_IMPLICA PRIMARY KEY(ID_Abogado, ID_Politico, Numero_Causa, Causas_Causa, Nombre_del_Juzgado_Causa)
,CONSTRAINT FK_CAUSAS_IMPLICA FOREIGN KEY(Numero_Causa, Causas_Causa, Nombre_del_Juzgado_Causa) REFERENCES
CAUSAS(Numero,Causas,Nombre_del_juzgado) ON DELETE NO ACTION ON UPDATE CASCADE
,CONSTRAINT FK_ABOGADOS_IMPLICA FOREIGN KEY(ID_Abogado) REFERENCES
ABOGADOS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
,CONSTRAINT FK_POLITICOS_IMPLICA FOREIGN KEY(ID_Politico) REFERENCES
POLITICOS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)