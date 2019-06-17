--| Base de datos para Tarea 6
CREATE DATABASE T6
GO

--1
CREATE TABLE T6.dbo.Empleado
( curp VARCHAR(20) NOT NULL,
  fecha_nac DATE,
  CONSTRAINT empleado_pk PRIMARY KEY (curp)
);
GO

--2
CREATE TABLE T6.dbo.Empresa
( rfc VARCHAR(10) NOT NULL,
  razon_social VARCHAR(100) UNIQUE,
  CONSTRAINT empresa_pk PRIMARY KEY (rfc)
);
GO

--3
CREATE TABLE T6.dbo.Nombres
( curp VARCHAR(20),
  nombre VARCHAR(100),
  paterno VARCHAR(100),
  materno VARCHAR(100),
  FOREIGN KEY (curp) REFERENCES Empleado(curp)
);
GO

--4
CREATE TABLE T6.dbo.Direccion
( curp VARCHAR(20),
  calle VARCHAR(300),
  numero INT,
  cp INT,
  ciudad VARCHAR(300),
  FOREIGN KEY (curp) REFERENCES Empleado(curp)
);
GO
--5
CREATE TABLE T6.dbo.Supervizar
( curpe VARCHAR(20),
  curps VARCHAR(20),
  FOREIGN KEY (curpe) REFERENCES Empleado(curp),
  FOREIGN KEY (curps) REFERENCES Empleado(curp)
);
--6
CREATE TABLE T6.dbo.Dirigir
( curp VARCHAR(20),
  rfc VARCHAR(10),
  fecha_ini DATE,
  FOREIGN KEY (curp) REFERENCES Empleado(curp),
  FOREIGN KEY (rfc) REFERENCES Empresa(rfc)
);
--7
CREATE TABLE T6.dbo.Trabajar
( curp VARCHAR(20),
  rfc VARCHAR(10),
  fecha_ing DATE,
  salario MONEY,
  FOREIGN KEY (curp) REFERENCES Empleado(curp),
  FOREIGN KEY (rfc) REFERENCES Empresa(rfc)
);
--8
CREATE TABLE T6.dbo.Proyecto
( numProy INT NOT NULL,
  nombre VARCHAR(100),
  fecha_ini DATE,
  fecha_fin DATE,
  CONSTRAINT proyecto_pk PRIMARY KEY (numProy)
);
--9
CREATE TABLE T6.dbo.Coloborar
( curp VARCHAR(20),
  numProy INT,
  cfecha_ini DATE,
  cfecha_fin DATE,
  numHor INT,
  FOREIGN KEY (curp) REFERENCES Empleado(curp),
  FOREIGN KEY (numProy) REFERENCES Proyecto(numProy)
);
--10
CREATE TABLE T6.dbo.Controlar
( rfc VARCHAR(10),
  numProy INT,
  nombre VARCHAR(100),
  fecha_ini DATE,
  fecha_fin DATE,
  FOREIGN KEY (numProy) REFERENCES Proyecto(numProy),
  FOREIGN KEY (rfc) REFERENCES Empresa(rfc));
--11
CREATE TABLE T6.dbo.DireccionE
( rfc VARCHAR(10),
  empresaID INT,
  calle VARCHAR(300),
  numero INT,
  cp INT,
  FOREIGN KEY (rfc) REFERENCES Empresa(rfc)
);
GO


--Crea ids para facilitar el poblamiento de las tablas 
ALTER TABLE T6.dbo.DireccionE
ADD direccionID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Empleado
ADD empleadoID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Empresa
ADD empresaID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Nombres
ADD Nombresid INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Direccion
ADD DireccionID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Supervizar
ADD SupervizarID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Dirigir
ADD DirigirID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Coloborar
ADD colaborarID INT IDENTITY(1,1)
GO

ALTER TABLE T6.dbo.Trabajar
ADD TrabajarID INT IDENTITY(1,1)
GO































