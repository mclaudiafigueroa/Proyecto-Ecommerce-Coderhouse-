 Base de Datos E-Commerce — Productos para Mascotas y Decoración del Hogar | MySQL
Descripción
Base de datos relacional diseñada en MySQL para gestionar las operaciones de un emprendimiento de comercio electrónico dedicado a la venta de productos para mascotas y artículos de decoración del hogar (camitas, almohadones, productos personalizados con estampado DTF). Las ventas se realizan a través de Mercado Libre, redes sociales y tienda web.
Problema que resuelve
La información de pedidos, clientes, pagos y stock se manejaba de forma dispersa. Esta base de datos centraliza y relaciona todos los procesos del negocio, eliminando errores en el registro de ventas y facilitando el control de stock y entregas.
Herramientas utilizadas

MySQL (diseño, modelado relacional, consultas)
MySQL Workbench (diagrama E-R)
Power BI (visualización de datos conectada vía conector MySQL)

Estructura de la base de datos
El modelo contiene 11 tablas relacionadas:
Tablas principales: pedido, pedido_items, cliente, producto, variante, pago, inventario, canal_de_venta, categoria, color, personalizacion
Tipo de modelo: estrella con tabla de hechos pedido y tablas de dimensiones relacionadas
Objetos desarrollados
Vistas

vista_total_pedidos — calcula el importe total de cada pedido (cantidad × precio por ítem)
vista_pedidos_envio — filtra pedidos con modalidad de envío a domicilio
vista_stock — calcula el stock disponible por variante a partir de movimientos de inventario

Funciones

fn_total_cliente — calcula el total gastado por un cliente en sus pedidos
fn_cantidad_por_cliente — devuelve la cantidad de pedidos realizados por un cliente

Stored Procedures

crear_pedido — permite registrar pedidos de forma estructurada y reutilizable sin INSERT manual
actualizar_estado — actualiza el estado de un pedido existente

Triggers

descontar_stock — descuenta stock automáticamente en inventario al insertar un registro en pedido_items
estado_pendiente — asigna estado "Pendiente" automáticamente al ingresar un pedido nuevo

Visualización en Power BI
La base de datos fue conectada a Power BI mediante conector MySQL. Se desarrollaron gráficos con indicadores clave: pedidos por canal de venta y por mes, cantidad de pedidos por cliente, precio por producto y cantidad vendida por producto.
