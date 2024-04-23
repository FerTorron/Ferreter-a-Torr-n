-- CREACION DE USUARIOS

-- Crear usuario 'gerente' con todos los permisos sobre la base de datos 'ferreteria'
CREATE USER IF NOT EXISTS 'gerente'@'localhost' IDENTIFIED BY 'gerente_password';
GRANT ALL PRIVILEGES ON ferreteria.* TO 'gerente'@'localhost';

-- Crear usuario 'cajero' con permisos limitados para manejar ventas
CREATE USER IF NOT EXISTS 'cajero'@'localhost' IDENTIFIED BY 'cajero_password';
GRANT SELECT, INSERT, UPDATE ON ferreteria.Venta TO 'cajero'@'localhost';

-- Verificar los usuarios creados y sus permisos
SELECT * FROM mysql.user;

-- Verificar los permisos otorgados al usuario 'gerente'
SHOW GRANTS FOR 'gerente'@'localhost';

-- Verificar los permisos otorgados al usuario 'cajero'
SHOW GRANTS FOR 'cajero'@'localhost';
