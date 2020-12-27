If Not Exists (SELECT * From Sys.databases Where name = 'Ejemplos' )
	Create Database Ejemplos
GO
USE Ejemplos
GO

CREATE TABLE CriaturitasRaras(
	ID tinyint Not NULL,
	Nombre nvarchar(30) Not NULL,
	FechaNac Date NULL, 
	NumeroPie SmallInt NULL,
	NivelIngles NChar(2) NULL,
	Historieta VarChar(300) NULL,
	NumeroChico TinyInt NULL,
	NumeroGrande BigInt NULL,
	NumeroIntermedio SmallInt NULL,
	Temperatura Decimal(3,1) NULL,
	CONSTRAINT [PK_CriaturitasEx] PRIMARY KEY(ID),
	CONSTRAINT CK_NumeroPie Check (NumeroPie Between 25 AND 60),
	CONSTRAINT CK_NumeroChico Check (NumeroChico<25),
	CONSTRAINT CK_NumeroGrande Check (NumeroGrande>(NumeroChico*1000)),
	CONSTRAINT CK_NumeroMediano Check ((NumeroIntermedio%2=0) AND (NumeroIntermedio Between NumeroChico AND NumeroGrande )),
	CONSTRAINT CK_FechaNacimiento Check (FechaNac<CURRENT_TIMESTAMP),
	CONSTRAINT CK_NivelDeingles Check (NivelIngles IN ('A0','A1','A2','B1','B2')),
	CONSTRAINT CK_Historieta Check (Historieta NOT IN ('oscuro','apocalipsis')),
	CONSTRAINT CK_Temperatura Check (Temperatura Between 32.55 AND 44)
)

GO