--Creaci�n de BD
CREATE DATABASE DBRegistro
GO
USE DBRegistro
GO 

--Crear tabla Ciudad
CREATE TABLE Ciudades(
IdCiudad INT PRIMARY KEY IDENTITY,
Nombre NVARCHAR (60) NOT NULL,
Estado BIT DEFAULT 1
);

--Crear tabla Personas
CREATE TABLE Personas(
IdPersona INT PRIMARY KEY IDENTITY,
Nombres NVARCHAR(40) NOT NULL,
Apellidos NVARCHAR(40) NOT NULL,
IdCiudad INT FOREIGN KEY REFERENCES Ciudades (IdCiudad),
Activo BIT DEFAULT 1
);

--Consultas de insertar
INSERT INTO Ciudades(Nombre) VALUES('Masaya'),('Granada'),('Jinotepe'),('Managua'),('Le�n');

INSERT INTO Personas(Nombres, Apellidos, IdCiudad) VALUES('Bel�n','Acu�a',4),
('Erick','Mart�nez',4),
('Sergio','Rivas',1),
('Elmer','Mart�nez',3),
('Cesar','Gallardo',5);

/*CRUD*/
/*Visualizar Datos*/
SELECT * FROM Ciudades;

SELECT * FROM Personas;

SELECT IdCiudad AS 'C�digo', Nombre AS 'Ciudad', Estado AS 'Est' From Ciudades;

SELECT Personas.IdPersona AS C�digo, Personas.Nombres + ' ' + Personas.Apellidos AS 'Nombre Completo',
Ciudades.Nombre AS Ciudad FROM Personas 
INNER JOIN Ciudades ON Personas.IdCiudad=Ciudades.IdCiudad;

/*Variables o b�squedas*/
DECLARE @Nombres NVARCHAR (40)
SET @Nombres = '%A%'

SELECT * FROM Personas WHERE Nombres LIKE @Nombres