--Ejercicio 1
--1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).
CREATE TABLE IF NOT EXISTS Clientes (
	ID INT	PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	EMAIL VARCHAR(255)
)

--2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".
INSERT INTO public.clientes (ID, name, email)
VALUES (1, 'Juan', 'juan@example.com')

--3. Actualizar el email del cliente con id=1 a "juan@gmail.com".
UPDATE PUBLIC.clientes
SET email = 'juan@gmail.com'
WHERE ID = 1

--4. Eliminar el cliente con id=1 de la tabla "Clientes".
DELETE FROM public.clientes
WHERE ID = 1

--5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).
CREATE TABLE IF NOT EXISTS Pedidos (
	ID INT	PRIMARY KEY,
	CLIENTE_ID INT NOT NULL,
	PRODUCTO VARCHAR(255) NOT NULL,
	CANTIDAD INT NOT NULL,
	CONSTRAINT FK_CLIENTE_ID 
	FOREIGN KEY (CLIENTE_ID) REFERENCES clientes(ID)
	)

--6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.
INSERT INTO public.clientes (ID, name, email)
VALUES (1, 'Juan', 'juan@gmail.com')

INSERT INTO public.pedidos (ID, CLIENTE_ID, PRODUCTO, CANTIDAD)
VALUES (1,1,'camiseta',2)

--7. Actualizar la cantidad del pedido con id=1 a 3.
UPDATE PUBLIC.pedidos
SET cantidad = 3
WHERE ID = 1

--8. Eliminar el pedido con id=1 de la tabla "Pedidos".
DELETE FROM public.pedidos
WHERE ID = 1

--9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).
CREATE TABLE IF NOT EXISTS Productos(
ID INT	PRIMARY KEY,
	NOMBRE VARCHAR(255) NOT NULL,
	PRECIO NUMERIC
) 

--10. Insertar varios productos en la tabla "Productos" con diferentes valores.
INSERT INTO public.Productos (ID, NOMBRE, PRECIO)
VALUES (1,'PANTALON', 30),
(2,'ZAPATOS', 80),
(3,'CAMISA', 25),
(4,'CAMISETA', 12)

--11. Consultar todos los clientes de la tabla "Clientes".
SELECT * FROM public.clientes

--12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.
--primero debí agregar a Juan nuevamente 
INSERT INTO public.clientes (ID, name, email)
VALUES (1, 'Juan', 'juan@gmail.com') 
-- Luego ya pude hacer la consulta
SELECT public.pedidos.*, public.clientes.name
FROM public.pedidos
LEFT JOIN public.clientes
ON public.pedidos.cliente_id = public.clientes.id

--13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
SELECT public.Productos.nombre, public.Productos.precio
FROM public.Productos 
WHERE public.productos.precio > 50

--14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.
--Primero agregué mas clinetes para poder asignarle compras a diferentes personas
INSERT INTO public.clientes (ID, name, email)
VALUES (3, 'Diego', 'diego@gmail.com'),
(2,'Pedro','pedro@gmail.com'),
(4,'suana','susana@gmail.com')
--Ahora agregué compras nuevasa la tabla pedidos
INSERT INTO public.pedidos (ID, CLIENTE_ID, PRODUCTO, CANTIDAD)
VALUES (2,1,'ZAPATOS', 3),
(3,2,'CAMISA', 6),
(4,4,'PANTALON', 12)
--Ahora recién realizo la peticion
SELECT *
FROM PUBLIC.PEDIDOS B
WHERE B.CANTIDAD > 5

--15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".
--Primero agregé un clinete con nombre que comienza con A
INSERT INTO PUBLIC.CLIENTES (ID, name, email)
VALUES (5, 'Ana', 'ana@gmail.com')
-- Ahora hago la consulta
SELECT *
FROM public.clientes
WHERE name LIKE 'A%'

--16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.
SELECT A.id, A.name, B.cantidad
FROM public.CLIENTES A
LEFT JOIN public.PEDIDOS B
ON A.ID = B.CLIENTE_ID

--17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.
SELECT B.producto, B.cantidad
FROM public.PEDIDOS B

--18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
ALTER TABLE public.pedidos
ADD Fecha date;

--19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".

--primero dejé la columna nombre para que solo pueda recibir elementos no repetidos
ALTER TABLE productos
ADD CONSTRAINT UQ_nombre UNIQUE (nombre);

--Luego agregé la constraint vinculando productos.nombre con pedidos.producto

ALTER TABLE public.pedidos
ADD CONSTRAINT FK_producto
FOREIGN KEY (producto) 
REFERENCES productos(nombre) 

--20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.

SELECT A.id, A.name, B.cliente_id, B.producto, B.cantidad
FROM public.clientes A
LEFT JOIN public.pedidos B
ON A.id = B.cliente_id
WHERE B.cliente_id IS NOT NULL