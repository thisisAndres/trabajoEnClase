USE master;

-- Crear la base de datos
CREATE DATABASE trabajoEnClase;

GO

USE trabajoEnClase;

-- Crear la tabla Estado_productos
CREATE TABLE Estado_productos (
  ID_Estado INT NOT NULL PRIMARY KEY,
  Nombre_estado VARCHAR(50) NOT NULL
);

-- Crear la tabla Ubicacion
CREATE TABLE Ubicacion (
  ID_Ubicacion INT NOT NULL PRIMARY KEY,
  Nombre_ubicacion VARCHAR(50) NOT NULL
);

-- Crear la tabla Productos
CREATE TABLE Productos (
  ID_Producto INT NOT NULL PRIMARY KEY,
  Nombre_producto VARCHAR(50) NOT NULL,
  Fecha_ingreso DATE NOT NULL,
  Fecha_egreso DATE NULL,
  Cantidad INT NOT NULL,
  ID_Estado INT NOT NULL,
  Precio DECIMAL(10,2) NOT NULL,
  ID_Ubicacion INT NOT NULL,
  CONSTRAINT FK_Productos_Estado FOREIGN KEY (ID_Estado) REFERENCES Estado_productos (ID_Estado),
  CONSTRAINT FK_Productos_Ubicacion FOREIGN KEY (ID_Ubicacion) REFERENCES Ubicacion (ID_Ubicacion)
);

-- Crear la tabla Rol
CREATE TABLE Rol (
  ID_Rol INT NOT NULL PRIMARY KEY,
  Nombre_Rol VARCHAR(50) NOT NULL
);

-- Crear la tabla Estado_usuario
CREATE TABLE Estado_usuario (
  ID_Estado_usuario INT NOT NULL PRIMARY KEY,
  Nombre_estado VARCHAR(50) NOT NULL
);

-- Crear la tabla Categoria
CREATE TABLE Categoria (
  ID_Categoria INT NOT NULL PRIMARY KEY,
  Nombre_categoria VARCHAR(50) NOT NULL
);


-- Crear la tabla Persona
CREATE TABLE Persona (
  ID_Persona INT NOT NULL PRIMARY KEY,
  Nombre_Cpersona VARCHAR(50) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Telefono VARCHAR(20) NOT NULL,
  ID_Rol INT NOT NULL,
  Correo VARCHAR(50) NOT NULL,
  CONSTRAINT FK_Persona_Rol FOREIGN KEY (ID_Rol) REFERENCES Rol (ID_Rol)
  CONSTRAINT FK_Persona_Estado FOREIGN KEY (ID_Estado_usuario) REFERENCES Estado_usuario (ID_Estado_pedido)
  CONSTRAINT FK_Persona_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria (ID_Categoria)
);

-- Crear la tabla Tipo_Entrega
CREATE TABLE Tipo_Entrega (
  ID_Entrega INT NOT NULL PRIMARY KEY,
  Nombre_Entrega VARCHAR(50) NOT NULL
);

-- Crear la tabla Ventas
CREATE TABLE Ventas (
  ID_Venta INT NOT NULL PRIMARY KEY,
  ID_Persona INT NOT NULL,
  ID_Producto INT NOT NULL,
  ID_Entrega INT NOT NULL,
  Precio_total DECIMAL(10,2) NOT NULL,
  Descuento DECIMAL(10,2) NULL,
  Fecha_venta DATE NOT NULL,
  CONSTRAINT FK_Ventas_Persona FOREIGN KEY (ID_Persona) REFERENCES Persona (ID_Persona),
  CONSTRAINT FK_Ventas_Producto FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
  CONSTRAINT FK_Ventas_Entrega FOREIGN KEY (ID_Entrega) REFERENCES Tipo_Entrega (ID_Entrega)
);

-- Crear la tabla Estado_pedido
CREATE TABLE Estado_pedido (
  ID_Estado_pedido INT NOT NULL PRIMARY KEY,
  Nombre_estado_pedido VARCHAR(50) NOT NULL
);

-- Crear la tabla Pedidos
CREATE TABLE Pedidos (
  ID_Pedido INT NOT NULL PRIMARY KEY,
  ID_Persona INT NOT NULL,
  ID_Producto INT NOT NULL,
  ID_Estado_pedido INT NOT NULL,
  Fecha_pedido DATE NOT NULL,
  CONSTRAINT FK_Pedidos_Persona FOREIGN KEY (ID_Persona) REFERENCES Persona (ID_Persona),
  CONSTRAINT FK_Pedidos_Producto FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
  CONSTRAINT FK_Pedidos_Estado_pedido FOREIGN KEY (ID_Estado_pedido) REFERENCES Estado_pedido (ID_Estado_pedido)
);

---------------------------------------------------------------
-- Insertar datos de prueba en la tabla Estado_productos
INSERT INTO Estado_productos (ID_Estado, Nombre_estado) VALUES
(1, 'Disponible'),
(2, 'No disponible');

-- Insertar datos de prueba en la tabla Ubicacion
INSERT INTO Ubicacion (ID_Ubicacion, Nombre_ubicacion) VALUES
(1, 'Bodega 1'),
(2, 'Bodega 2'),
(3, 'Tienda 1');

-- Insertar datos de prueba en la tabla Rol
INSERT INTO Rol (ID_Rol, Nombre_Rol) VALUES
(1, 'Administrador'),
(2, 'Vendedor'),
(3, 'Cliente');

-- Insertar datos de prueba en la tabla Tipo_Entrega
INSERT INTO Tipo_Entrega (ID_Entrega, Nombre_Entrega) VALUES
(1, 'Entrega a domicilio'),
(2, 'Recogida en tienda');

-- Insertar datos de prueba en la tabla Estado_pedido
INSERT INTO Estado_pedido (ID_Estado_pedido, Nombre_estado_pedido) VALUES
(1, 'En proceso'),
(2, 'Completado'),
(3, 'Cancelado');

-- Insertar datos de prueba en la tabla Estado_usuario
INSERT INTO Estado_usuario (ID_Estado_usuario, Nombre_estado) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- Insertar datos de prueba en la tabla Categoria
INSERT INTO Categoria (ID_Categoria, Nombre_categoria) VALUES
(1, 'Ropa'),
(2, 'Electr�nica'),
(3, 'Electrodom�sticos');

-- Insertar datos de prueba en la tabla Productos
INSERT INTO Productos (ID_Producto, Nombre_producto, Fecha_ingreso, Fecha_egreso, Cantidad, ID_Estado, Precio, ID_Ubicacion) VALUES
(1, 'Camisa', '2024-03-01', NULL, 10, 1, 100, 1),
(2, 'Pantal�n', '2024-03-02', NULL, 5, 1, 150, 1),
(3, 'Zapatos', '2024-03-03', NULL, 15, 1, 200, 2),
(4, 'Celular', '2024-03-04', NULL, 8, 1, 500, 2),
(5, 'Televisor', '2024-03-05', NULL, 3, 1, 1000, 2),
(6, 'Lavadora', '2024-03-06', NULL, 2, 1, 800, 3),
(7, 'Refrigerador', '2024-03-07', NULL, 1, 1, 1500, 3);


-- Insertar datos de prueba en la tabla Persona
INSERT INTO Persona (ID_Persona, Nombre_Cpersona, Direccion, Telefono, ID_Rol, Correo) VALUES
(1, 'Juan Perez', 'Calle 123', '123456789', 1, 'juan@example.com'),
(2, 'Maria Lopez', 'Avenida 456', '987654321', 2, 'maria@example.com'),
(3, 'Carlos Garc�a', 'Carrera 789', '111222333', 3, 'carlos@example.com');

-- Insertar datos de prueba en la tabla Ventas
INSERT INTO Ventas (ID_Venta, ID_Persona, ID_Producto, ID_Entrega, Precio_total, Descuento, Fecha_venta) VALUES
(1, 1, 1, 1, 100, 0, '2024-03-07'),
(2, 2, 3, 2, 180, 20, '2024-03-07'),
(3, 3, 5, 1, 950, 50, '2024-03-07');

-- Insertar datos de prueba en la tabla Pedidos
INSERT INTO Pedidos (ID_Pedido, ID_Persona, ID_Producto, ID_Estado_pedido, Fecha_pedido) VALUES
(1, 1, 4, 1, '2024-03-07'),
(2, 2, 2, 2, '2024-03-07'),
(3, 3, 6, 1, '2024-03-07');



