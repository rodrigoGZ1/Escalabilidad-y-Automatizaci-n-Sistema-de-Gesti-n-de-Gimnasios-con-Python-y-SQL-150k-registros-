create or alter procedure Actualizar_Precio ( @precio int)
as
begin

update PAGOS
set monto = MONTO + @precio
where
mes_correspondiente = month(getdate())

PRINT 'El precio se ha actualizado';
end
go







