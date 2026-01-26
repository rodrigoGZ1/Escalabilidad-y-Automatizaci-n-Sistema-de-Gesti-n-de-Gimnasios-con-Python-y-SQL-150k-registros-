create or alter procedure Verificar_Precio ( @Valor int)
as
begin

update PRECIOS
set VALOR = @Valor


PRINT 'El precio se ha actualizado';
print @Valor

end
go
