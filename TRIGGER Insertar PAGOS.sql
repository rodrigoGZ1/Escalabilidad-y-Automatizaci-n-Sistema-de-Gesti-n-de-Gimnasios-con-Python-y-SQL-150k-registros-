CREATE OR ALTER TRIGGER Insertar_Pagos on SOCIOS
AFTER INSERT
AS
BEGIN

declare  @monto int;
DECLARE @SOCIOS INT;

set @monto = (select ISNULL(max(monto) , 6000) from PAGOS);
SET @SOCIOS = (SELECT ISNULL(MAX(ID_SOCIOS_AP), 1)  FROM dbo.SOCIOS);

INSERT INTO PAGOS 
VALUES ( @socios ,  @monto  , month(getdate()) ,YEAR(getdate())  , DAY(getdate()))


END
GO




