Create DataBase KarinaBDExamen2
GO

Use KarinaBDExamen2

CREATE TABLE Usuarios
(
	UsuarioID INT IDENTITY (1,1),
	Nombre VARCHAR(50),
	CorreoElectronico VARCHAR(50),
	Telefono VARCHAR(20)
	CONSTRAINT pk_Usuario PRIMARY KEY(UsuarioID)
)
GO
CREATE TABLE Equipos
(
	EquipoID INT IDENTITY (1000,5),
	TipoEquipo VARCHAR(50) NOT NULL,
	Modelo VARCHAR(50) NOT NULL,
	UsuarioID INT,
	CONSTRAINT pk_EquipoID PRIMARY KEY (EquipoID),
)
GO
CREATE TABLE Reparaciones
(
	ReparacionID INT IDENTITY (10,2),
	EquipoID INT,
	FechaSolicitud DATETIME CONSTRAINT df_FechaSolicitud DEFAULT GETDATE(),
	Estado VARCHAR(50),
	CONSTRAINT pk_ReparacionID PRIMARY KEY (ReparacionID),
	CONSTRAINT fk_EquipoID FOREIGN KEY (EquipoID) REFERENCES Equipos (EquipoID)
)
GO
CREATE TABLE DetalleReparacion -- A
(
	DetalleID INT IDENTITY (30,1),
	ReparacionID INT,
	Descripcion VARCHAR(50),
	FechaInicio DATETIME CONSTRAINT df_FechaInicio DEFAULT GETDATE(),
	FechaFin DATETIME CONSTRAINT df_FechaFin DEFAULT GETDATE(),
	CONSTRAINT pk_DetalleID PRIMARY KEY (DetalleID),
	CONSTRAINT fk_ReparacionID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones (ReparacionID)
)
GO
CREATE TABLE Tecnicos
(
	TecnicoID INT IDENTITY(40,1),
	Nombre VARCHAR(50),
	Especialidad VARCHAR(50),
	CONSTRAINT pk_TecnicoID PRIMARY KEY (TecnicoID)
)
GO
CREATE TABLE Asignaciones 
(
	AsignacionID INT IDENTITY (10,2),
	ReparacionID INT,
	TecnicoID INT,
	FechaAsignacion DATETIME CONSTRAINT df_FechaAsignacion DEFAULT GETDATE(),
	CONSTRAINT pk_AsignacionID PRIMARY KEY (AsignacionID),
	CONSTRAINT fkk_ReparacionID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
	CONSTRAINT fk_TecnicoID Foreign Key (TecnicoID) References Tecnicos (TecnicoID)
)
GO
-- Procedimientos almacenado
CREATE PROCEDURE AgregarUsuario
	@Nombre VARCHAR(50),
	@CorreoElectronico VARCHAR(50),
	@Telefono VARCHAR(20)
AS
BEGIN
	INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono) VALUES (@Nombre, @CorreoElectronico, @Telefono)
END
GO
CREATE PROCEDURE BorrarUsuario
	@UsuarioID INT
AS
BEGIN
	DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID
END
GO
Create PROCEDURE ConsultarUsuario_Filtro
	@UsuarioID INT
AS
BEGIN
	SELECT * FROM Usuarios WHERE UsuarioID = @UsuarioID
END
GO
CREATE PROCEDURE ModificarUsuario 
	@UsuarioID INT,
	@Nombre VARCHAR(50),
	@CorreoElectronico VARCHAR(50),
	@Telefono VARCHAR(8)
AS
BEGIN
	UPDATE Usuarios SET Nombre = @Nombre, CorreoElectronico = @CorreoElectronico, Telefono = @Telefono WHERE UsuarioID = @UsuarioID
END
GO
-- Procedimientos para tabla de Equipos
CREATE PROCEDURE AgregarEquipo 
	@TipoEquipo VARCHAR(50),
	@Modelo VARCHAR(50),
	@UsuarioID INT
AS
BEGIN
	INSERT INTO Equipos(TipoEquipo, Modelo, UsuarioID) VALUES (@TipoEquipo, @Modelo, @UsuarioID)
END
GO
CREATE PROCEDURE BorrarEquipo 
	@EquipoID INT
AS
BEGIN
	Delete From Equipos WHERE EquipoID = @EquipoID
END
GO
CREATE PROCEDURE ConsultarEquipo_Filtro
	@EquipoID INT
AS
BEGIN
	SELECT * FROM Equipos WHERE EquipoID = @EquipoID
END
GO
CREATE PROCEDURE ModificarEquipo
	@EquipoID INT,
	@TipoEquipo VARCHAR(50),
	@Modelo VARCHAR(50),
	@UsuarioID INT
AS
BEGIN
	UPDATE Equipos SET TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID = @UsuarioID WHERE EquipoID = @EquipoID
END
GO
-- Procedimientos para tabla de Tecnicos
CREATE PROCEDURE AgregarTecnico
	@Nombre VARCHAR(50),
	@Especialidad VARCHAR(50)
AS
BEGIN
	Insert Into Tecnicos (Nombre, Especialidad) VALUES (@Nombre, @Especialidad)
END
GO
CREATE PROCEDURE BorrarTecnico
	@TecnicoID INT
AS
BEGIN
	DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID
END
GO
CREATE PROCEDURE ConsultarTecnico_Filtro
	@TecnicoID INT
AS
BEGIN
	SELECT * FROM Tecnicos WHERE TecnicoID = @TecnicoID
END
GO
CREATE PROCEDURE ModificarTecnico
	@TecnicoID INT,
	@Nombre VARCHAR (50),
	@Especialidad VARCHAR(50)
AS
BEGIN
	UPDATE Tecnicos SET	 Nombre = @Nombre, Especialidad = @Especialidad WHERE TecnicoID = @TecnicoID
END