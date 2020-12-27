﻿CREATE DATABASE LeoBikes
GO
USE LeoBikes
GO
--Incluye cat�logo e inventario
CREATE TABLE LB_Productos(--Incluye cat�logo e inventario
	Codigo Char(5) not null 
	,Nombre VarChar(40) not null default 'Producto Generico'
	,PVP SmallMoney
	,Stock_Actual SmallInt
	,Stock_Minimo TinyInt
	,Constraint PK_Productos Primary Key (Codigo)
	)
GO

				
-- Eso. Los que pagan
CREATE TABLE LB_Clientes(
	DI Char (10) Not Null
	,Apellidos VarChar(25) Not Null
	,Nombre VarChar(15) Not Null
	,Localidad VarChar(15) Null
	,Descuento TinyInt Default 0
	,SaldoPuntos SmallInt Not Null
	,Constraint PK_Clientes Primary Key (DI)
	)
GO
						-- Pedidos recibidos de nuestros clientes
CREATE TABLE LB_Pedidos(
	Codigo Int IDENTITY Not Null
	,DI_Cliente Char(10) default '00000002'
	,Fecha_Creacion SmallDateTime not null default CURRENT_TIMESTAMP
	,Fecha_Servido SmallDateTime null
	,Constraint PK_Pedidos Primary Key (Codigo)
	,Constraint FK_Pedidos_Clientes Foreign Key (DI_Cliente) REFERENCES LB_Clientes (DI)
		ON UPDATE CASCADE ON DELETE NO ACTION
	)
GO
CREATE TABLE LB_Lineas_Pedido(
	Cod_Pedido Int Not Null
	,Cod_producto Char(5) Not Null
	,Cantidad int Not Null Default 1
	,Precio SmallMoney Not Null
	,Constraint PK_Lineas_Pedido Primary Key (Cod_Pedido, Cod_Producto)
	,Constraint FK_LineasPedido_Pedidos Foreign Key (Cod_Pedido) REFERENCES LB_Pedidos (Codigo)
		ON UPDATE CASCADE ON DELETE CASCADE
	,Constraint FK_LineasPedido_Producto Foreign Key (Cod_Producto) REFERENCES LB_Productos (Codigo)
		ON UPDATE CASCADE ON DELETE NO ACTION
	)

CREATE TABLE LB_Facturas(
	Codigo Int not null Identity Primary Key
	,DI_Cliente Char(10) default '00000001'
	,Fecha smalldatetime not null default CURRENT_TIMESTAMP
	,Fecha_Cobro Date null
	,Importe Money
	,Constraint	FK_Facturas_Clientes Foreign Key (DI_Cliente) REFERENCES LB_Clientes (DI)
		ON UPDATE CASCADE ON DELETE NO ACTION
	)
GO
-- Relaci�n entre Facturas y Productos
CREATE TABLE LB_Lineas_Factura(
	Cod_Factura Int Not Null,
	Cod_Producto Char(5) Not Null,
	Cantidad Int Not Null default 1,
	Precio SmallMoney Not Null,
	Constraint PK_LineasFactura Primary Key (Cod_Factura, Cod_Producto),
	Constraint FK_LineasFactura_Factura Foreign Key (Cod_Factura) REFERENCES LB_Facturas (Codigo),
	Constraint FK_LineasFactura_Productos Foreign Key (Cod_Producto) REFERENCES LB_Productos (Codigo)
	)

	--MODIFICACIONES DE LAS TABLAS
	--1:
	CREATE TABLE LB_Avisos(
	ID SmallInt Not Null
	,CONSTRAINT PK_Avisos PRIMARY KEY (ID)
	,Cod_Producto Char(5) not null 
	,Fecha_Crea Date Not Null
	,Stock_Minimo SmallInt Null
	,Stock_Actual SmallInt Null
	)
	--2:
	ALTER TABLE LB_Avisos ADD DEFAULT 0 FOR Stock_Minimo
	ALTER TABLE LB_Avisos ADD DEFAULT 0 FOR Stock_Actual
	--3:
	ALTER TABLE LB_Clientes ADD CONSTRAINT CK_SaldoPuntos CHECK (SaldoPuntos>=0) 
	ALTER TABLE LB_Clientes ADD DEFAULT 0 FOR SaldoPuntos
	--4:
	ALTER TABLE LB_Avisos ADD DEFAULT CURRENT_TIMESTAMP FOR Fecha_Crea
	ALTER TABLE LB_Avisos ADD Fecha_Actualiza Date Null DEFAULT CURRENT_TIMESTAMP
	--5:
	ALTER TABLE LB_Avisos ADD CONSTRAINT FK_Avisos_Productos FOREIGN KEY (Cod_Producto) REFERENCES LB_Productos(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
	--6:
	ALTER TABLE LB_Avisos ADD CONSTRAINT CK_Fecha_Actualiza CHECK ((Fecha_Actualiza<>NULL AND  Fecha_Actualiza>Fecha_Crea) OR Fecha_Actualiza=Null)
	--7:
	ALTER TABLE LB_Clientes ADD CONSTRAINT CK_Descuento CHECK (Descuento BETWEEN 0 AND 50)
	--8:
	ALTER TABLE LB_Productos ADD Margen AS (Stock_Actual-Stock_Minimo)



	DROP DATABASE LeoBikes