-- Configuración de Seguridad Basada en Roles (RBAC)
-- Objetivo: Separar responsabilidades entre el personal administrativo y la gerencia.
-- Implementa permisos específicos sobre esquemas de Clientes y Pagos.

CREATE USER Recepcionista FOR LOGIN UsuarioRecepcion;
CREATE USER Gerente FOR LOGIN UsuarioGerente;
CREATE ROLE RolCargaDatos;
CREATE ROLE RolGerencia;
CREATE LOGIN RolCargaDatos WITH PASSWORD = '*************';
CREATE LOGIN RolGerencia WITH PASSWORD = '************';
ALTER ROLE RolCargaDatos ADD MEMBER Recepcionista;
ALTER ROLE RolGerencia ADD MEMBER Gerente;
GRANT SELECT, INSERT, UPDATE ON SCHEMA::PAGOS TO RolCargaDatos;
GRANT SELECT, INSERT, UPDATE ON SCHEMA::Clientes TO RolCargaDatos;
GRANT SELECT TO RolGerencia;
