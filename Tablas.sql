Create database GIM;
USE GIM;
CREATE TABLE SOCIOS(
ID_SOCIOS_AP INT PRIMARY KEY IDENTITY(1,1) not null ,
DNI INT UNIQUE NOT NULL,
NOMBRE VARCHAR (20) NOT NULL,
APELLIDO VARCHAR (30) NOT NULL,
FECHA_ADMISION DATE NOT NULL,
TELEFONO INT NOT NULL
);

CREATE TABLE  PAGOS (
ID_PAGO INT PRIMARY KEY IDENTITY(1,1),
ID_SOCIOS_AP INT not null,
MONTO INT NOT NULL,
MES INT  not null,
AÑO INT not null,
DIA int not null
);

Create table Balance_Mensual(
MONTO_MENSUAL INT NOT NULL,
AÑO  INT not null,
MES iNT   not null,
PRIMARY KEY (AÑO, MES)
);

Create table Balance_Anual(
monto int , 
AÑO int  primary key
);

ALTER TABLE PAGOS
ADD CONSTRAINT FK_Socio_Pago
FOREIGN KEY (ID_SOCIOS_AP) REFERENCES SOCIOS(ID_SOCIOS_AP);

ALTER TABLE PAGOS
DROP CONSTRAINT FK_Socio_Pago;

DELETE FROM pagos
WHERE id_pago BETWEEN 190001 AND 200000;

sET NOCOUNT ON;

DECLARE @Contador INT = 1;
DECLARE @DNI_Base INT = 10000000; -- Empezamos con un rango de DNI alto

PRINT 'Iniciando carga de 200,000 socios... Por favor, espere.';

BEGIN TRANSACTION; -- Usamos una transacción para que la inserción sea mucho más veloz

WHILE @Contador <= 200000
BEGIN
    INSERT INTO dbo.SOCIOS (DNI, NOMBRE, APELLIDO, FECHA_ADMISION, TELEFONO)
    VALUES (
        @DNI_Base + @Contador, 
        'SocioNombre_' + CAST(@Contador AS VARCHAR), 
        'SocioApellido_' + CAST(@Contador AS VARCHAR), 
        -- Generamos fechas aleatorias en los últimos 2 años para que mañana tengas gráficos variados
        DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 730), GETDATE()), 
        1100000000 + @Contador 
    );

    -- Cada 10,000 registros nos avisa para no perder la paciencia
    IF @Contador % 10000 = 0
    BEGIN
        PRINT 'Cargados: ' + CAST(@Contador AS VARCHAR);
    END

    SET @Contador = @Contador + 1;
END

COMMIT; -- Cerramos la transacción y guardamos todo de golpe

PRINT 'Carga finalizada con éxito.';
SET NOCOUNT OFF;


SELECT COUNT(*) AS Total_Socios FROM SOCIOS;

select count(id_pago) from pagos





