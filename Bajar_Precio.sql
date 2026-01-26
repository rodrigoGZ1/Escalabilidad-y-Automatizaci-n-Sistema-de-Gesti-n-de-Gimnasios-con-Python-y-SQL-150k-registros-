create or alter procedure Bajar_Precio ( @Resta int)
as
begin

update PAGOS
set monto = MONTO - @Resta;

PRINT 'El precio a disminuido';
end
go


