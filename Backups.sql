/* GUÍA DE CONFIGURACIÓN DE BACKUPS AUTOMÁTICOS
Este documento detalla los pasos seguidos para automatizar el resguardo 
de la base de datos en SQL Server Management Studio (SSMS).
*/

-- PASO 1: ACTIVAR EL AGENTE
-- Es obligatorio que el 'Agente SQL Server' esté iniciado (clic derecho > Iniciar).
-- Sin esto, los trabajos programados no se ejecutan.

-- PASO 2: CREACIÓN DEL TRABAJO (JOB)
-- 1. Ir a la carpeta 'Agente SQL Server' -> 'Trabajos'.
-- 2. Clic derecho -> 'Nuevo trabajo' y asignarle un nombre (ej: Backup_Diario).

-- PASO 3: PROGRAMAR EL PASO (STEP)
-- 1. En la pestaña 'Pasos', crear uno nuevo.
-- 2. Definir el comando T-SQL de backup:
BACKUP DATABASE [Nombre_De_Tu_Base] 
TO DISK = N'C:\Ruta\Tu_Archivo.bak' 
WITH NOFORMAT, NOINIT, SKIP, STATS = 10; - Muestra el avance de la tarea cada 10%, esencial para procesos criticos y pesados.

-- PASO 4: PESTAÑA DE PROGRAMACIONES (SCHEDULE)
-- 1. Ir a 'Nueva programación'.
-- 2. Especificar la Recurrencia: 'Diaria' o 'Semanal'.
-- 3. Definir Horarios de inicio: Se recomienda fuera del horario comercial 
--    (ej: 03:00 AM) para evitar impacto en el rendimiento.
--
