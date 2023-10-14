Ejercicio 4
--1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").

CREATE TABLE IF NOT EXISTS pedidos(
	ID NUMERIC PRIMARY KEY,
	ID_USUARIO INT NOT NULL,
	ID_PRODUCTO INT NOT NULL,
	CONSTRAINT FK_ID_USUARIO
	FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
	CONSTRAINT FK_ID_PRODUCTO
	FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
)

--2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.



--3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).



--4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).



--5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)