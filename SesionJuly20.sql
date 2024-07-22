--Creación de BD
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
INSERT INTO Ciudades(Nombre) VALUES('Masaya'),('Granada'),('Jinotepe'),('Managua'),('León');

INSERT INTO Personas(Nombres, Apellidos, IdCiudad) VALUES('Belén','Acuña',4),
('Erick','Martínez',4),
('Sergio','Rivas',1),
('Elmer','Martínez',3),
('Cesar','Gallardo',5);

/*CRUD*/
/*Visualizar Datos*/
SELECT * FROM Ciudades;

SELECT * FROM Personas;

SELECT IdCiudad AS 'Código', Nombre AS 'Ciudad', Estado AS 'Est' From Ciudades;

SELECT Personas.IdPersona AS Código, Personas.Nombres + ' ' + Personas.Apellidos AS 'Nombre Completo',
Ciudades.Nombre AS Ciudad FROM Personas 
INNER JOIN Ciudades ON Personas.IdCiudad=Ciudades.IdCiudad;

/*Variables o búsquedas*/
DECLARE @Nombres NVARCHAR (40)
SET @Nombres = '%A%'

SELECT * FROM Personas WHERE Nombres LIKE @Nombres