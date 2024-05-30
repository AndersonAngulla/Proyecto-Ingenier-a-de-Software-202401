
CREATE TABLE Empleados (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    FechaIngreso DATE
);

select * from Empleados

INSERT INTO Empleados (Codigo, Nombre, Apellido, FechaIngreso) 
VALUES 
(1, 'Juan', 'Castillo', '2024-05-29'),
(2, 'María', 'González', '2024-05-29'),
(3, 'Carlos', 'Martínez', '2024-05-29'),
(4, 'Ana', 'Hernández', '2024-05-29'),
(5, 'Pedro', 'López', '2024-05-29'),
(6, 'Laura', 'Díaz', '2024-05-29'),
(7, 'Sofía', 'Ramírez', '2024-05-29'),
(8, 'Diego', 'Torres', '2024-05-29'),
(9, 'Lucía', 'Fernández', '2024-05-29'),
(10, 'Alejandro', 'Gómez', '2024-05-29');


CREATE PROCEDURE InsertarNuevoEmpleado(
    @Codigo int,
	@nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @fecha_ingreso DATE
)
AS
BEGIN
    INSERT INTO emplEmpleados(Codigo,Nombre, Apellido, FechaIngreso) 
    VALUES (@Codigo,@nombre, @apellido, @fecha_ingreso);
END;

drop procedure InsertarNuevoEmpleado

EXEC InsertarNuevoEmpleado 11,'brayan', 'chavez', '2024-05-29';


select * from Empleados

CREATE PROCEDURE ActualizarEmpleado(
     @codigo INT,
     @nombre VARCHAR(50),
     @apellido VARCHAR(50),
     @fecha_ingreso DATE
)
AS
BEGIN
    UPDATE Empleados
    SET Nombre = @nombre, Apellido = @apellido, FechaIngreso = @fecha_ingreso
    WHERE Codigo = @Codigo;
END 

Exec ActualizarEmpleado 11,'Juanchitoem','castillon','2024-05-29'

select * from Empleados

CREATE PROCEDURE EliminarEmpleado(
    @codigo INT
)
AS
BEGIN
    DELETE FROM Empleados WHERE Codigo = @codigo;
END 

Exec EliminarEmpleado 11

select * from Empleados

CREATE TABLE Inventario (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Stock INT,
    Proveedor VARCHAR(100),
    FechaEntrada DATE
)

INSERT INTO Inventario (Codigo, Nombre, Stock, Proveedor, FechaEntrada) 
VALUES
    (1, 'Pastillas para el dolor', 100, 'Marta Sánchez', '2024-05-29'),
    (2, 'Pastillas para la gripe', 50, 'Juan García', '2024-05-29'),
    (3, 'Pastillas para dormir', 80, 'Laura Rodríguez', '2024-05-29'),
    (4, 'Pastillas para la alergia', 20, 'Carlos Martínez', '2024-05-29'),
    (5, 'Pastillas vitaminadas', 120, 'Ana López', '2024-05-29'),
    (6, 'Pastillas para la ansiedad', 70, 'Diego Fernández', '2024-05-29'),
    (7, 'Pastillas para la digestión', 60, 'Sofía Pérez', '2024-05-29'),
    (8, 'Pastillas anticonceptivas', 200, 'Alejandro Gómez', '2024-05-29'),
    (9, 'Pastillas para el mareo', 30, 'Lucía Torres', '2024-05-29'),
    (10, 'Pastillas para la tos', 40, 'Pedro Díaz', '2024-05-29');

	Select * from Inventario

CREATE PROCEDURE InsertarProductoInventario (
    @codigo int,
    @nombre VARCHAR(50),
    @stock INT,
    @proveedor VARCHAR(100),
    @fecha_entrada DATE
)
AS
BEGIN
    INSERT INTO Inventario (Codigo, Nombre, Stock, Proveedor, FechaEntrada) 
    VALUES (@codigo, @nombre, @stock, @proveedor, @fecha_entrada);
END;

Exec InsertarProductoInventario 11,'Pastillas para la tos', 40, 'Pedro Díaz', '2024-05-29'

select * from Inventario



CREATE PROCEDURE ActualizarStockProducto(
    @codigo INT,
    @stock INT
)
AS
BEGIN
    UPDATE Inventario
    SET Stock = stock
    WHERE Codigo =codigo;
END 

Exec ActualizarStockProducto 1,100

select * from inventario


CREATE PROCEDURE EliminarProductoInventario(
    @codigo INT
)
AS
BEGIN
    DELETE FROM Inventario WHERE Codigo = @codigo;
END 

Exec EliminarProductoInventario 11

select * from inventario

CREATE TABLE Productos (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    FechaIngreso DATE,
    FechaCaducidad DATE,
    Categoria VARCHAR(50),
    Etiqueta VARCHAR(50),
    CantidadMalEstado INT,
    Stock INT
);

INSERT INTO Productos (Codigo, Nombre, Descripcion, FechaIngreso, FechaCaducidad, Categoria, Etiqueta, CantidadMalEstado, Stock) 
VALUES
    (1, 'Pastillas para el dolor', 'Pastillas para el alivio del dolor, caja de 20.', '2024-05-29', '2024-11-30', 'Medicamentos', 'Analgesia', 5, 100),
    (2, 'Pastillas para la gripe', 'Pastillas para el alivio de los síntomas de la gripe, caja de 10.', '2024-05-29', '2025-02-28', 'Medicamentos', 'Resfriado', 3, 50),
    (3, 'Pastillas para dormir', 'Pastillas para conciliar el sueño, caja de 30.', '2024-05-29', '2025-01-31', 'Medicamentos', 'Sueño', 2, 80),
    (4, 'Pastillas para la alergia', 'Pastillas para controlar los síntomas de la alergia, caja de 15.', '2024-05-29', '2024-10-31', 'Medicamentos', 'Alergia', 0, 20),
    (5, 'Pastillas vitaminadas', 'Pastillas multivitamínicas para el bienestar general, bote de 100.', '2024-05-29', '2024-12-31', 'Medicamentos', 'Vitaminas', 1, 120),
    (6, 'Pastillas para la ansiedad', 'Pastillas para el control de la ansiedad, caja de 30.', '2024-05-29', '2025-03-31', 'Medicamentos', 'Salud Mental', 0, 70),
    (7, 'Pastillas para la digestión', 'Pastillas para la mejora de la digestión, frasco de 60.', '2024-05-29', '2025-04-30', 'Medicamentos', 'Digestión', 2, 60),
    (8, 'Pastillas anticonceptivas', 'Pastillas anticonceptivas para la prevención del embarazo, caja de 28.', '2024-05-29', '2025-05-31', 'Medicamentos', 'Anticoncepción', 0, 200),
    (9, 'Pastillas para el mareo', 'Pastillas para aliviar el mareo y las náuseas, caja de 10.', '2024-05-29', '2024-09-30', 'Medicamentos', 'Mareo', 0, 30),
    (10, 'Pastillas para la tos', 'Pastillas para el alivio de la tos, caja de 20.', '2024-05-29', '2024-08-31', 'Medicamentos', 'Resfriado', 4, 40);

Select * from Productos



CREATE PROCEDURE InsertarProducto(
    @codigo int,
    @nombre VARCHAR(50),
    @Descripcion VARCHAR(50),
    @Fechaingreso DATE,
    @FechaCaducidad DATE,
    @Categoria VARCHAR(50),
    @Etiqueta VARCHAR(50),
    @Cantidadmalestado INT,
    @stock INT
)
AS
BEGIN
    INSERT INTO Productos (Codigo, Nombre, Descripcion, FechaIngreso, FechaCaducidad, Categoria, Etiqueta, CantidadMalEstado, Stock) 
    VALUES (@codigo, @nombre, @Descripcion, @Fechaingreso, @FechaCaducidad, @Categoria, @Etiqueta, @Cantidadmalestado, @stock);
END;

Exec InsertarProducto 11,'Pastillas para la tos', 'Pastillas para el alivio de la tos, caja de 20.', '2024-05-29', '2024-08-31', 'Medicamentos', 'Resfriado', 4, 40;

select * from productos

CREATE PROCEDURE ActualizarStockProducto(
    @codigo int,
    @Stock INT
)
AS
BEGIN
    UPDATE productos 
    SET Stock = @Stock
    WHERE Codigo = @codigo;
END;

drop procedure actualizarStockproducto

Exec ActualizarStockProducto 11, '100'

select * from productos

CREATE PROCEDURE EliminarProducto(
    @codigo int
)
AS
BEGIN
    BEGIN TRANSACTION;

    DELETE FROM Productos
    WHERE Codigo = @codigo;

    DELETE FROM Inventario
    WHERE Codigo = @codigo;

    COMMIT TRANSACTION;
END;

drop procedure EliminarProducto

Exec eliminarproducto 11

select * from productos