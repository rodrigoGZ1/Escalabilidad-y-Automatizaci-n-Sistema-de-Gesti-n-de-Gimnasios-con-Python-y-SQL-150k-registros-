create or alter procedure Insertar_Clientes (
@DNI INT,
@NOMBRE VARCHAR (20) ,
@APELLIDO VARCHAR (30) ,
@FECHA_ADMISION DATE ,
@TELEFONO INT)
as
begin


insert into SOCIOS ( DNI, NOMBRE , APELLIDO , FECHA_ADMISION , TELEFONO)
values        (@DNI, @NOMBRE, @APELLIDO, GETDATE(), @TELEFONO );



print 'Se a insertado correctamente todos los datos'


end
go



