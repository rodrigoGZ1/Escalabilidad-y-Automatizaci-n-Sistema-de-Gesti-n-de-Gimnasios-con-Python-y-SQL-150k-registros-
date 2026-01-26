create or alter procedure Eliminar_Clientes 
as
begin

DELETE SOCIOS 
WHERE
ID_SOCIOS_AP not in(
select
ID_SOCIOS_AP
from
PAGOS
);

PRINT ' Los datos se borraron correctamente '



end
go


