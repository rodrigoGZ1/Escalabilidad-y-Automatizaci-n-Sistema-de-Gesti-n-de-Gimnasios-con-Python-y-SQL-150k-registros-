create or alter procedure Precio_anual ( @año int)
as
begin
begin try

insert into Balance_Anual
select
sum(MONTO_MENSUAL) as Monton_Anual , AÑO
from
Precios_Historicos
group by
AÑO 
having
@año = AÑO ;

PRINT 'Los datos se han ingresado correctamente';

end try

begin catch
PRINT 'No se permiten ingresar datos duplicados';
end catch

end
go

