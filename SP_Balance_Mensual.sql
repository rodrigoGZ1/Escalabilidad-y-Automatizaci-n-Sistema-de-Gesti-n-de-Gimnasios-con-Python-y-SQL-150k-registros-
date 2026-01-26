create or alter procedure Precios_Mensuales  ( @año int  , @mes int  )
as
begin
begin try

insert into Precios_Historicos
select
sum(monto) , AÑO ,  MES 
from
PAGOS
group by
AÑO , MES
having
@año = AÑO and @mes = MES;

PRINT 'Los datos se han ingresado correctamente';
end try

begin catch
PRINT 'No se permiten ingresar datos duplicados';
end catch

end
go
