DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
CREATE TABLE cliente (
                      id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      nombre_apellido VARCHAR(50) NOT NULL,
                      telefono VARCHAR(50) NOT NULL,
                      mail VARCHAR(50) NULL UNIQUE
                      );
 CREATE TABLE categoria (
                      id_categoria INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      nombre_categoria VARCHAR(50) NOT NULL
                      );     
 CREATE TABLE color (
                      id_color INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      nombre_color VARCHAR(50) NOT NULL
                      );                      
CREATE TABLE canal_de_venta (
                      id_canal_de_venta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      nombre_canal_de_venta VARCHAR(50) NOT NULL
                      );
CREATE TABLE pedido (
                      id_pedido INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_cliente INT NOT NULL ,
                      id_canal INT NOT NULL,
					  tipo_entrega VARCHAR(50) NOT NULL,
                      estado VARCHAR(50) NULL, 
                      fecha DATE NOT NULL
                      );                      
 CREATE TABLE personalizacion (
                      id_personalizacion INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_item INT NOT NULL,
                      diseño VARCHAR(50) NOT NULL,
                      tipo_tecnica VARCHAR(50) NULL
                      );

 CREATE TABLE pago (
                      id_pago INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_pedido INT NOT NULL,
                      metodo_pago VARCHAR(50) NOT NULL,
                      estado_pago VARCHAR(50) NULL,
                      importe DECIMAL NOT NULL,
                      fecha DATE DEFAULT NULL
                      );
                      
 CREATE TABLE producto (
                      id_producto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_categoria INT NOT NULL,
                      producto VARCHAR(50) NOT NULL,
					  precio_venta DECIMAL NOT NULL
					  );
 CREATE TABLE variante (
                      id_variante INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_color INT NOT NULL,
                      id_producto INT NOT NULL,
                      nombre VARCHAR(50) NOT NULL,
					  precio DECIMAL NOT NULL
					  );
CREATE TABLE pedido_items (
                      id_item INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_pedido INT NOT NULL ,
                      id_variante INT NOT NULL,
					  detalle_productos VARCHAR(50) NOT NULL,
                      cantidad INT NOT NULL, 
                      precio DECIMAL NOT NULL
                      );                      
CREATE TABLE inventario (
                      id_movimiento_stock INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                      id_producto INT NOT NULL ,
                      movimiento_stock VARCHAR(50) NOT NULL,
				      cantidad INT NOT NULL, 
                      fecha DATE NOT NULL
                      );                      
ALTER TABLE pedido 
                  CHANGE COLUMN id_canal id_canal_de_venta INT NOT NULL;
ALTER TABLE inventario 
                  CHANGE COLUMN id_producto id_variante INT NOT NULL;
 
ALTER TABLE pedido 
                  ADD FOREIGN KEY(id_cliente) references cliente(id_cliente);
ALTER TABLE pedido 
                  ADD FOREIGN KEY(id_canal_de_venta) references canal_de_venta(id_canal_de_venta);
ALTER TABLE personalizacion 
                  ADD FOREIGN KEY(id_item) references pedido_items(id_item);                  
ALTER TABLE pago 
                  ADD FOREIGN KEY(id_pedido) references pedido(id_pedido);
ALTER TABLE inventario 
                  ADD FOREIGN KEY(id_variante) references variante(id_variante);
ALTER TABLE producto 
                  ADD FOREIGN KEY(id_categoria) references categoria(id_categoria);
ALTER TABLE variante 
                  ADD FOREIGN KEY(id_color) references color(id_color),                  
                  ADD FOREIGN KEY(id_producto) references producto(id_producto);
ALTER TABLE pedido_items 
                  ADD FOREIGN KEY(id_pedido) references pedido(id_pedido),                  
                  ADD FOREIGN KEY(id_variante) references variante(id_variante);
		
INSERT INTO cliente (nombre_apellido, telefono, mail) 
VALUES
('Juan Perez', '111111111', 'juan.perez@mail.com'),
('Ana Lopez', '222222222', 'ana.lopez@mail.com'),
('Carlos Gomez', '333333333', 'carlos.gomez@mail.com'),
('Mariana Diaz', '444444444', 'mariana.diaz@mail.com'),
('Lucas Fernandez', '555555555', 'lucas.fernandez@mail.com'),
('Sofia Martinez', '666666666', 'sofia.martinez@mail.com'),
('Diego Rodriguez', '777777777', 'diego.rodriguez@mail.com'),
('Valentina Suarez', '888888888', 'valentina.suarez@mail.com'),
('Martin Torres', '999999999', 'martin.torres@mail.com'),
('Camila Herrera', '101010101', 'camila.herrera@mail.com');

INSERT INTO categoria (nombre_categoria) VALUES ('Hogar'), ('Mascotas');

INSERT INTO color (nombre_color) 
VALUES
('Beige'),
('Gris'),
('Rosa'),
('Rosa Viejo'),
('Azul'),
('Verde'),
('Celeste'),
('Oliva'),
('Mostaza'),
('Amarillo'),
('Azul Acero'),
('Terracota'),
('Negro');

INSERT INTO canal_de_venta (nombre_canal_de_venta) 
VALUES
('Instagram'),
('Web'),
('MercadoLibre');

-- LINEA HOGAR
INSERT INTO producto (id_categoria, producto, precio_venta) 
VALUES
(1, 'Almohadon Tusor', 20000),
(1, 'Almohadon Letra', 45000),
(1, 'Almohadon Formas', 45000),
(1, 'Almohadon Pelo', 15000),
(1, 'Pie de Cama', 15000),
(1, 'Manta Rústica', 25000),
(1, 'Velas decorativas', 10000),
(1, 'Wax Melts', 10000)
;
-- LINEA MASCOTAS
INSERT INTO producto (id_categoria, producto, precio_venta) 
VALUES
(1, 'Cama gato simple', 60000),
(1, 'Cama gato doble', 90000),
(1, 'Mueble litera', 55000),
(1, 'Muñecos de tela', 9000),
(1, 'Collar', 22000),
(1, 'Pretal + correa', 48000)
;

UPDATE producto 
SET id_categoria = 2 
WHERE id_categoria = 1 
AND producto IN ('Cama gato simple', 'Cama gato doble', 'Mueble litera', 'Muñecos de tela', 'Collar', 'Pretal + correa');
select * from producto
;
-- LINEA HOGAR
-- VARIANTE ALMOHADON TUSOR
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(1, 1, '40x40', 20000),
(1, 2, '45x45', 23000),
(1, 3, '50x50', 26000)
;
-- VARIANTE ALMOHADON LETRAS
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(1, 1, 'tusor', 45000),
(1, 2, 'pana', 48000),
(1, 3, 'corderito', 52000)
;
UPDATE variante
SET id_producto = 2
WHERE id_variante IN (4,5,6);

-- VARIANTE ALMOHADON FORMAS
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(1, 1, 'nube', 45000),
(1, 2, 'flor', 45000),
(1, 3, 'estrella', 45000)
;
SELECT id_producto, nombre
FROM variante
WHERE nombre IN ('nube', 'flor', 'estrella')
;
-- VARIANTE ALMOHADON PELO
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(4, 1, '45x45', 15000)
;
-- VARIANTE PIE DE CAMA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(5, 1, '45x45', 15000)
;
DELETE FROM variante
WHERE id_producto IN (4,5)
;
-- VARIANTE ALMOHADON PELO
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(4, 1, '45x45', 15000),  -- Beige
(4, 2, '45x45', 15000),  -- Gris
(4, 3, '45x45', 15000)   -- Rosa
; 

-- VARIANTE PIE DE CAMA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(5, 1, 'Standard', 15000),  -- Beige
(5, 2, 'Standard', 15000),  -- Gris
(5, 3, 'Standard', 15000)  -- Rosa
;
-- VARIANTE MANTA RUSTICA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(6, 1, 'Beige con negro', 25000),
(6, 1, 'Beige con blanco', 25000)
;
-- VARIANTE VELAS
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(7, 1, 'UNICO', 10000)
;
-- VARIANTE WAX MELTS
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(8, 1, 'UNICO', 10000)
;

-- LINEA MASCOTAS
-- VARIANTE CAMA SIMPLE
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(9, 1, 'UNICO', 60000)
;
-- VARIANTE CAMA DOBLE
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(10, 1, 'UNICO', 90000)
;
-- VARIANTE MUEBLE PARA LITERA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(11, 1, 'UNICO', 55000)
;

-- VARIANTE MUÑECO DE TELA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(12, 1, 'UNICO', 9000)
;

-- VARIANTE COLLAR
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(13, 1, 'UNICO', 22000)
;
-- VARIANTE PRETAL+CORREA
INSERT INTO variante (id_producto, id_color, nombre, precio) 
VALUES
(14, 1, 'UNICO', 48000)
;

INSERT INTO pedido (id_cliente, id_canal_de_venta, tipo_entrega, estado, fecha) 
VALUES
(1, 1, 'Envio', 'Pendiente', '2026-02-01'),
(2, 2, 'Retiro', 'Entregado', '2026-02-02'),
(3, 3, 'Envio', 'Pendiente', '2026-02-03'),
(4, 1, 'Envio', 'Entregado', '2026-03-04'),
(5, 2, 'Retiro', 'Pendiente', '2026-02-05'),
(6, 3, 'Envio', 'Entregado', '2026-02-06'),
(7, 1, 'Envio', 'Pendiente', '2026-03-07'),
(8, 2, 'Retiro', 'Entregado', '2026-02-08'),
(9, 3, 'Envio', 'Pendiente', '2026-02-09'),
(10, 1, 'Envio', 'Entregado', '2026-02-10')
;

-- triggers

DELIMITER //

CREATE TRIGGER descontar_stock
AFTER INSERT ON pedido_items
FOR EACH ROW
BEGIN
    INSERT INTO inventario (id_variante, movimiento_stock, cantidad, fecha)
    VALUES (NEW.id_variante, 'Salida', -NEW.cantidad, CURDATE());
END //

DELIMITER ;

-- trigger 2

DELIMITER //

CREATE TRIGGER estado_pendiente
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
    IF NEW.estado IS NULL THEN
        SET NEW.estado = 'Pendiente';
    END IF;
END //

DELIMITER ;

INSERT INTO pedido_items (id_pedido, id_variante, detalle_productos, cantidad, precio) 
VALUES
(1, 1, 'Almohadon Tusor 40x40', 2, 20000),
(1, 12, 'Almohadon Pelo 45x45', 1, 15000),
(2, 20, 'Velas decorativas', 3, 10000),
(3, 23, 'Cama gato simple', 1, 60000),
(4, 2, 'Almohadon Tusor 45x45', 1, 23000),
(4, 25, 'Collar talle M', 1, 22000),
(5, 15, 'Pie de cama', 1, 15000),
(6, 18, 'Manta rustica', 1, 25000),
(7, 3, 'Almohadon Tusor 50x50', 2, 26000),
(8, 24, 'Cama gato doble', 1, 90000),
(9, 21, 'Wax melts', 4, 10000),
(10, 27, 'Pretal + correa', 1, 48000);

SELECT id_variante, id_producto, nombre
FROM variante;
SELECT id_variante, nombre FROM variante;
INSERT INTO pedido_items (id_pedido, id_variante, detalle_productos, cantidad, precio) VALUES

-- Pedido 1
(1, 1, 'Almohadon Tusor 40x40', 2, 20000),
(1, 12, 'Almohadon Pelo 45x45', 1, 15000),
-- Pedido 2
(2, 20, 'Velas decorativas', 3, 10000),
-- Pedido 3
(3, 23, 'Cama gato simple', 1, 60000),
-- Pedido 4
(4, 2, 'Almohadon Tusor 45x45', 1, 23000),
(4, 25, 'Collar talle M', 1, 22000),
-- Pedido 5
(5, 15, 'Pie de cama', 1, 15000),
-- Pedido 6
(6, 18, 'Manta rustica Beige con negro', 1, 25000),
-- Pedido 7
(7, 3, 'Almohadon Tusor 50x50', 2, 26000),
-- Pedido 8
(8, 24, 'Cama gato doble', 1, 90000),
-- Pedido 9
(9, 21, 'Wax melts', 4, 10000),
-- Pedido 10
(10, 27, 'Pretal + correa', 1, 48000)
;

INSERT INTO pago (id_pedido, metodo_pago, estado_pago, importe, fecha) 
VALUES
(1, 'Transferencia', 'Pendiente', 55000, '2026-02-01'),
(2, 'Efectivo', 'Pagado', 30000, '2026-02-02'),
(3, 'Tarjeta', 'Pagado', 60000, '2026-02-03'),
(4, 'Transferencia', 'Pagado', 45000, '2026-02-04'),
(5, 'Efectivo', 'Pendiente', 15000, '2026-02-05'),
(6, 'Tarjeta', 'Pagado', 25000, '2026-02-06'),
(7, 'Transferencia', 'Pendiente', 52000, '2026-02-07'),
(8, 'Efectivo', 'Pagado', 90000, '2026-02-08'),
(9, 'Tarjeta', 'Pendiente', 40000, '2026-02-09'),
(10, 'Transferencia', 'Pagado', 48000, '2026-02-10')
;
ALTER TABLE personalizacion
CHANGE diseño diseno VARCHAR(50)
;

INSERT INTO personalizacion (id_item, diseno, tipo_tecnica) 
VALUES
(1, 'Nombre bordado', 'Bordado'),
(2, 'Iniciales', 'DTF'),
(3, 'Nombre + fecha', 'Bordado'),
(4, 'Dibujo personalizado', 'DTF')
;
INSERT INTO inventario (id_variante, movimiento_stock, cantidad, fecha) 
VALUES
(1, 'Ingreso', 20, '2026-01-30'),
(2, 'Ingreso', 20, '2026-01-30'),
(3, 'Ingreso', 20, '2026-01-30'),
(4, 'Ingreso', 15, '2026-01-30'),
(5, 'Ingreso', 10, '2026-01-30'),
(1, 'Salida', -2, '2026-02-01'),
(12, 'Salida', -1, '2026-02-01'),
(20, 'Salida', -3, '2026-02-02'),
(23, 'Salida', -1, '2026-02-03'),
(24, 'Salida', -1, '2026-02-08');
SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM pedido_items;
SELECT * FROM producto;
SELECT * FROM variante;
SELECT * FROM color;
SELECT * FROM categoria;
SELECT * FROM canal_de_venta;
SELECT * FROM pago;
SELECT * FROM personalizacion;
SELECT * FROM inventario;
-- CREACION DE 3 VISTAS
-- VISTA 1
CREATE OR REPLACE VIEW vista_total_pedidos AS
SELECT 
    p.id_pedido,
    SUM(pi.cantidad * pi.precio) AS total_pedido
FROM pedido p
JOIN pedido_items pi ON p.id_pedido = pi.id_pedido
GROUP BY p.id_pedido
;
SELECT * FROM vista_total_pedidos;

-- VISTA 2
CREATE OR REPLACE VIEW vista_pedidos_envio AS
SELECT 
    p.id_pedido,
    c.nombre_apellido AS cliente,
    p.tipo_entrega
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
WHERE p.tipo_entrega = 'Envio';

SELECT * FROM vista_pedidos_envio;

-- VISTA 3
CREATE OR REPLACE VIEW vista_stock AS
SELECT 
    id_variante,
    SUM(cantidad) AS stock_actual
FROM inventario
GROUP BY id_variante;
SELECT * FROM vista_stock;

-- CREACION DE 2 FUNCIONES
-- FUNCION 1 

DELIMITER //
CREATE FUNCTION fn_total_cliente(p_id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE total DECIMAL(10,2);
SELECT SUM(pi.cantidad * pi.precio)
INTO total
FROM pedido p
JOIN pedido_items pi ON p.id_pedido = pi.id_pedido
WHERE p.id_cliente = p_id_cliente;
RETURN IFNULL(total, 0);
END //

DELIMITER ;
SELECT fn_total_cliente (1);

SELECT 
    c.nombre_apellido,
    fn_total_cliente(c.id_cliente) AS total_gastado
FROM cliente c
WHERE c.id_cliente = 1;

-- AGREGUÉ PEDIDOS CON EL MISMO ID DE CLIENTE
INSERT INTO pedido (id_cliente, id_canal_de_venta, tipo_entrega, estado, fecha) 
VALUES
(1, 1, 'Envio', 'Pendiente', '2026-03-10'),
(5, 2, 'Retiro', 'Entregado', '2026-02-28'),
(3, 3, 'Envio', 'Pendiente', '2026-02-15'),
(9, 1, 'Envio', 'Entregado', '2026-03-20'),
(5, 2, 'Retiro', 'Pendiente', '2026-02-25'),
(5, 3, 'Envio', 'Entregado', '2026-03-10'),
(2, 1, 'Envio', 'Pendiente', '2026-03-22'),
(2, 2, 'Retiro', 'Entregado', '2026-02-15'),
(2, 3, 'Envio', 'Pendiente', '2026-02-16'),
(2, 1, 'Envio', 'Entregado', '2026-03-25')
;
-- FUNCION 2

DELIMITER //
CREATE FUNCTION fn_cantidad_por_cliente(p_id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE cantidad INT;
SELECT count(*)
INTO cantidad
FROM pedido 
WHERE id_cliente = p_id_cliente;
RETURN IFNULL(cantidad, 0);
END //
DELIMITER ;

SELECT fn_cantidad_por_cliente(9);

-- PROCEDIMIENTOS

DELIMITER //

CREATE PROCEDURE crear_pedido
(
IN p_id_cliente INT,
IN p_id_canal_de_venta INT,
IN p_tipo_entrega VARCHAR(50),
IN p_fecha DATE
)
BEGIN
INSERT INTO pedido (id_cliente, id_canal_de_venta, tipo_entrega, fecha)
VALUES (p_id_cliente, p_id_canal_de_venta, p_tipo_entrega, p_fecha);
END //

DELIMITER ;

-- PROCEDIMIENTO 2

DELIMITER //

CREATE PROCEDURE actualizar_estado(
    IN p_id_pedido INT,
    IN p_estado VARCHAR(50)
)
BEGIN
    UPDATE pedido
    SET estado = p_estado
    WHERE id_pedido = p_id_pedido;
END //

DELIMITER ;




