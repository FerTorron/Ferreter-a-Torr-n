CREATE DATABASE IF NOT EXISTS ferreteria;
USE ferreteria;

-- Tabla de Categorías de Productos
CREATE TABLE IF NOT EXISTS Categoria (
    IDCategoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS Producto (
    IDProducto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0,
    IDCategoria INT,
    FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria)
);

-- Tabla de Proveedores
CREATE TABLE IF NOT EXISTS Proveedor (
    IDProveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contacto VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

-- Tabla de Compras
CREATE TABLE IF NOT EXISTS Compra (
    IDCompra INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    IDProveedor INT,
    FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor)
);

-- Detalle de Compras
CREATE TABLE IF NOT EXISTS Detalle_Compra (
    IDDetalleCompra INT AUTO_INCREMENT PRIMARY KEY,
    IDCompra INT,
    IDProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (IDCompra) REFERENCES Compra(IDCompra),
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS Cliente (
    IDCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    Telefono VARCHAR(20)
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS Venta (
    IDVenta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    IDCliente INT,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Detalle de Ventas
CREATE TABLE IF NOT EXISTS Detalle_Venta (
    IDDetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
    IDVenta INT,
    IDProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (IDVenta) REFERENCES Venta(IDVenta),
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);
