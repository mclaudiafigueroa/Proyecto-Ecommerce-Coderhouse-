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
                      fecha DATE DEFAULT 'PENDIENTE'
                      );
DROP TABLE IF EXISTS pago;
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