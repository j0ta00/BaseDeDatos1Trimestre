/*
Crea una base de datos llamada Ejemplos, si no la tienes ya creada.
Crea las tablas siguientes:
1. DatosRestrictivos. Columnas:
ID Es un SmallInt autonumérico que se rellenará con números impares. No admite nulos. Clave primaria
Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
Numpelos: Int con valores comprendidos entre 0 y 150.000
TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
NumSuerte: TinyInt. Tiene que ser un número entre 10 y 40, divisible por 3.
Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.
2. DatosRelacionados. Columnas:
NombreRelacionado: Cadena de tamaño 15. Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
-¿Deberíamos poner la misma restricción que en la columna correspondiente?
No, no es necesario y de hecho lo correcto es no colocarla
-¿Qué ocurriría si la ponemos?
Sería algo redundante pues la columna hace referencia a otra que ya cumple dicha restricción
-¿Y si no la ponemos?
No sucederá nada pero si introducimos un valor inválido y que por lo tanto no esta en la columna a la que referenciamos, nos aparecerá un error de que la instrucción INSERT se encuentra en conflicto con la restricción FOREIGN KEY 
debido a que estaremos haciendo referencia a un valor inexistente en la tabla de la clave foránea, por lo que introducimos un valor antes en la columna que referenciamos y pues esta al tener la restricción CHECK no podremos introducirle 
un valor no válido de forma que la columna que depende de esta también tendrá un valor válido sí o sí.
PalabraTabu: Cadena de longitud max 20. No admitirá los valores "MENA”,"Gurtel”, "ERE”, "Procés” ni "sobresueldo”. Tampoco admitirá ninguna palabra terminada en "eo”
NumRarito: TinyInt menor que 20. No admitirá números primos.
NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
-¿Puede tener valores menores que 20?
No, entra en conflicto con la restricción de la columna NumMasGrande ya que incumpliría la restricción de la columna NumRarito por lo que entonces por consecuencia también la de NumMasGrande.
3. DatosAlMogollon. Columnas:
ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
Etiqueta. Cadena de 3 caracteres max. No puede tener los valores "lao”, "leo”, "lio” ni "luo”
*/

GO
CREATE  DATABASE  Ejemplos
GO
USE Ejemplos
GO
CREATE TABLE DatosRestrictivos(
ID SmallInt Not Null 
,CONSTRAINT  PK_DatosRestrictivos PRIMARY KEY(ID)
,Nombre nVarChar(15) Not Null
,CONSTRAINT UQ_Nombre UNIQUE(Nombre)
,NumPelos Int Not Null
,TipoRopa nChar(1) Not null
,NumSuerte TinyInt Null
,Minutos TinyInt Not Null
,CONSTRAINT CK_IDDatosRestrictivos CHECK (ID%2<>0)
,CONSTRAINT CK_Nombre CHECK (Nombre NOT LIKE '[XY]%')
,CONSTRAINT CK_NumPelos CHECK (NumPelos BETWEEN 0 AND 150000)
,CONSTRAINT CK_TipoRopa CHECK(TipoRopa LIKE '[CEFPBN]')
,CONSTRAINT CK_NumSuerte CHECK(NumSuerte BETWEEN 10 AND 40 AND NumSuerte%3=0)
,CONSTRAINT CK_Minutos CHECK(Minutos BETWEEN 20 AND 85 OR  Minutos BETWEEN 120 AND 185)
)
GO
CREATE TABLE DatosRelacionados(
NumMasGrande SmallInt
,CONSTRAINT PK_DatosRelacionados PRIMARY KEY(NumMasGrande)
,PalabraTabu nVarChar(20) Not Null
,NumRarito TinyInt Not Null
,NombreRelacionado nVarChar(15) Not Null
,CONSTRAINT FK_DatosRelacionados_DatosRestrictivos FOREIGN KEY(NombreRelacionado) REFERENCES DatosRestrictivos(Nombre) ON DELETE NO ACTION ON UPDATE NO ACTION
,CONSTRAINT CK_PalabraTabu CHECK(PalabraTabu NOT IN('MENA','Gurtel','ERE','Procés','sobresueldo') AND PalabraTabu NOT LIKE '_eo')
,CONSTRAINT CK_NumRarito CHECK (NumRarito<20 AND NumRarito NOT IN ('2','3','5','7','11','13','17','19'))
,CONSTRAINT CK_NumeroMasGrande CHECK(NumMasGrande BETWEEN NumRarito AND 1000)
)
GO
CREATE TABLE DatosAlMogollon(
ID SmallInt Not Null
CONSTRAINT PK_DatosAlMogollon PRIMARY KEY (ID)
,LimiteSuperior SmallInt Not Null
,OtroNumero SmallInt Not Null
,CONSTRAINT UQ_OtroNumero UNIQUE(OtroNumero)
,NumeroQueVinoDelMasAlla SmallInt Not Null
,CONSTRAINT FK_DatosRelacionadosDatosAlMogollon FOREIGN KEY (NumeroQueVinoDelMasAlla) REFERENCES DatosRelacionados(NumMasGrande) ON DELETE NO ACTION ON UPDATE NO ACTION
,Etiqueta nVarChar(3) Not Null
,CONSTRAINT CK_IDDatosAlMogollon CHECK (ID%5<>0 AND ID<LimiteSuperior)
,CONSTRAINT CK_LimiteSuperior CHECK (LimiteSuperior BETWEEN 1500 AND 2000)
,CONSTRAINT CK_OtroNumero CHECK(OtroNumero BETWEEN ID AND LimiteSuperior)
,CONSTRAINT CK_Etiqueta CHECK(Etiqueta NOT LIKE'[l]%[aeiu][_o]')
)