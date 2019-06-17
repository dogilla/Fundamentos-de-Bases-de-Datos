--Procedimientos para insertar entradas en la base de datos de la base de Taxis
use BaseTaxis
GO

CREATE PROCEDURE EntradaPersona(@correo VARCHAR(50), @domicilio VARCHAR(100), @celular BIGINT)
AS BEGIN
INSERT INTO BaseTaxis.dbo.Persona VALUES (@correo, @domicilio, @celular)
END
GO

CREATE PROCEDURE EntradaName(@nombre VARCHAR(50), @paterno VARCHAR(50), @materno VARCHAR(50))
AS BEGIN
INSERT INTO BaseTaxis.dbo.Name VALUES (@nombre, @paterno ,@materno)
END
GO

CREATE PROCEDURE EntradaCliente(@ent TIME, @sal TIME, @tel BIGINT, @fac VARCHAR(50), @status_unam INT)
AS BEGIN
INSERT INTO BaseTaxis.dbo.Cliente VALUES (@ent, @sal, @tel, @fac, @status_unam)
END
GO

CREATE PROCEDURE EntradaAsociado(@nlicencia int, @ingreso DATE, @status BIT)
AS BEGIN
INSERT INTO BaseTaxis.dbo.Asociado VALUES (@nlicencia, @ingreso)
INSERT INTO BaseTaxis.dbo.Chofer VALUES (@status)
INSERT INTO BaseTaxis.dbo.Manejar
SELECT TOP 1 vehiculoID FROM BaseTaxis.dbo.Vehiculo ORDER BY newid()
END
GO

CREATE PROCEDURE EntradaDueno(@rfc VARCHAR(50))
AS BEGIN
INSERT INTO BaseTaxis.dbo.Dueno VALUES (@rfc)
INSERT INTO BaseTaxis.dbo.Poseer
SELECT TOP 1 vehiculoID FROM BaseTaxis.dbo.Vehiculo ORDER BY newid()
END
GO

CREATE PROCEDURE EntradaViaje(@dist INT, @time TIME, @np INT, @origen VARCHAR(50), @desino VARCHAR(50), @cliente int, @viaje int, @ganancia REAL)
AS BEGIN
INSERT INTO BaseTaxis.dbo.Viaje VALUES (@dist, @time, @np, @origen, @desino, @ganancia)

INSERT INTO BaseTaxis.dbo.Cuenta (choferID, vehiculoID)
SELECT *
FROM (SELECT TOP 1 * FROM BaseTaxis.dbo.Manejar ORDER BY newid()) A
END

UPDATE BaseTaxis.dbo.Cuenta
SET clienteID = @cliente
WHERE viajeID = @cliente;
GO
