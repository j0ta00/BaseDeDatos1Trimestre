
CREATE DATABASE EJERCICIOSSENCILLOS4

USE EJERCICIOSSENCILLOS4

CREATE TABLE PASAJEROS(
 ID smallInt Not Null 
,CONSTRAINT PK_PASAJEROS PRIMARY KEY(ID)
,Nombre Varchar(35) Not Null
,Apellidos Varchar(35) Not Null
,fecha_de_nacimiento date Not Null
)

CREATE TABLE VUELOS(
 Codigo smallInt Not Null 
,CONSTRAINT PK_VUELOS PRIMARY KEY(Codigo)
)

CREATE TABLE ASIENTOS(
 Codigo_de_Vuelo smallInt Not Null
,numero_fila smallInt Not Null
,letra varChar(1) Not Null
,ID_Pasajero smallInt Null
,CONSTRAINT PK_ASIENTOS PRIMARY KEY(Codigo_de_Vuelo,numero_fila,letra)
,CONSTRAINT FK_VUELOS_ASIENTOS FOREIGN KEY(Codigo_de_Vuelo) 
REFERENCES VUELOS(Codigo) ON DELETE CASCADE
,CONSTRAINT FK_PASAJEROS_ASIENTOS FOREIGN KEY(ID_Pasajero) REFERENCES
PASAJEROS(ID) ON DELETE NO ACTION ON UPDATE CASCADE

) 

