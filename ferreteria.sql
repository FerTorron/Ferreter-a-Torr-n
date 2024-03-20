CREATE DATABASE IF NOT EXISTS ferreteria;
USE ferreteria;

-- Crear la tabla Producto
CREATE TABLE IF NOT EXISTS Producto (
    IDProducto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    Stock INT DEFAULT 0
);

-- Crear la tabla Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    IDCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Email VARCHAR(255)
);

-- Crear la tabla Pedido
CREATE TABLE IF NOT EXISTS Pedido (
    IDPedido INT AUTO_INCREMENT PRIMARY KEY,
    IDCliente INT,
    Fecha DATE,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Crear la tabla Detalle_Pedido
CREATE TABLE IF NOT EXISTS Detalle_Pedido (
    IDDetalle INT AUTO_INCREMENT PRIMARY KEY,
    IDPedido INT,
    IDProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (IDPedido) REFERENCES Pedido(IDPedido),
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);