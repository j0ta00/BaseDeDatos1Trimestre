CREATE DATABASE EJERCICIOSSENCILLOS7
USE EJERCICIOSSENCILLOS7

CREATE TABLE PROPUESTAS(
 Numero_de_Registro smallInt Not Null 
,CONSTRAINT PK_POLITICOS PRIMARY KEY(Numero_de_Registro)
,Texto char Not Null

)
CREATE TABLE INSCRITOS(
 ID smallInt Not Null 
,CONSTRAINT PK_INSCRITOS PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
)

CREATE TABLE PROPUESTAS_INSCRITOS(
 ID_Inscrito smallInt Not Null 
,Numero_de_Registro_Propuesta smallInt Not Null
,votaSN bit Not Null
,CONSTRAINT PK_PROPUESTAS_INSCRITOS PRIMARY KEY(ID_Inscrito, Numero_de_Registro_Propuesta)
,CONSTRAINT FK_INSCRITOS FOREIGN KEY(ID_Inscrito) REFERENCES
 INSCRITOS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
,CONSTRAINT FK_PROPUESTAS FOREIGN KEY(Numero_de_Registro_Propuesta) REFERENCES
 PROPUESTAS(Numero_de_Registro) ON DELETE NO ACTION ON UPDATE CASCADE
)