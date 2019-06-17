CREATE DATABASE BaseTaxis
GO

--1
CREATE TABLE BaseTaxis.dbo.Persona
( personaID INT IDENTITY(1,1),
  correo VARCHAR(50),
  domicilio VARCHAR(100),
  celular BIGINT,
  CONSTRAINT persona_pk PRIMARY KEY (personaID)
);
GO

--2
CREATE TABLE BaseTaxis.dbo.Cliente
( clienteID INT IDENTITY(1,1),
  hr_ent TIME,
  hr_sal TIME,
  telefono BIGINT,
  facultad VARCHAR(50),
  status_unam INT,
  FOREIGN KEY (clienteID) REFERENCES Persona(personaID)
);
GO

--3
CREATE TABLE BaseTaxis.dbo.Name
( personaID INT IDENTITY(1,1),
  nombre VARCHAR(50),
  paterno VARCHAR(50),
  materno VARCHAR(50),
  FOREIGN KEY (personaID) REFERENCES Persona(personaID)
);
GO

--4
CREATE TABLE BaseTaxis.dbo.Asociado
( personaID INT IDENTITY(1,1),
  n_lincencia INT,
  fecha_ing DATE,
  FOREIGN KEY (personaID) REFERENCES Persona(personaID)
);
GO

--5
CREATE TABLE BaseTaxis.dbo.Dueno
( duenoID INT IDENTITY(1,1),
  rfc VARCHAR(20),
  FOREIGN KEY (duenoID) REFERENCES Persona(personaID)
);
GO

--6
CREATE TABLE BaseTaxis.dbo.Chofer
( choferID INT IDENTITY(1,1),
  status_dueno BIT,
  FOREIGN KEY (ChoferID) REFERENCES Persona(personaID)
);
GO
--7
CREATE TABLE BaseTaxis.dbo.Vehiculo
( vehiculoID INT IDENTITY(1000,1),
  refaccion BIT,
  CONSTRAINT vehiculo_pk PRIMARY KEY (vehiculoID)
);
GO

--8
CREATE TABLE BaseTaxis.dbo.Manejar
( choferID INT IDENTITY(1,1),
  vehiculoID INT,
  FOREIGN KEY (ChoferID) REFERENCES Persona(personaID),
  FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID)
);
GO

--9
CREATE TABLE BaseTaxis.dbo.Poseer
( duenoID INT IDENTITY(1,1),
  vehiculoID INT,
  FOREIGN KEY (duenoID) REFERENCES Persona(personaID),
  FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID)
);
GO

--10
CREATE TABLE BaseTaxis.dbo.Tipovhl
( vehiculoID INT IDENTITY(1000,1),
  modelo VARCHAR(50),
  marca VARCHAR(50),
  ano INT,
  n_cilindros INT,
  n_puertas INT,
  manejo BIT,
  FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID)
);
GO

--11
CREATE TABLE BaseTaxis.dbo.Multa
( multaID INT IDENTITY(100,1),
  lugar VARCHAR(50),
  hora TIME,
  agente VARCHAR(100),
  CONSTRAINT multa_pk PRIMARY KEY (multaID)
);
GO

--12
CREATE TABLE BaseTaxis.dbo.Infraccion
( vehiculoID INT,
  multaID INT IDENTITY(100,1),
  lugar VARCHAR(50),
  FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID),
  FOREIGN KEY (multaID) REFERENCES Multa(multaID)
);
GO

--13
CREATE TABLE BaseTaxis.dbo.Viaje
( viajeID INT IDENTITY(5000,1),
  distancia INT,
  tiempo TIME,
  n_personas INT,
  origen VARCHAR(50),
  destino VARCHAR(50),
  CONSTRAINT viaje_pk PRIMARY KEY (viajeID)
);
GO

--14
CREATE TABLE BaseTaxis.dbo.Cuenta
( clienteID INT,
  choferID INT,
  vehiculoID INT,
  viajeID INT IDENTITY(1,1),
);
GO

ALTER TABLE BaseTaxis.dbo.Viaje
  ADD ganancia REAL;


