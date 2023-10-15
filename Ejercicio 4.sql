Ejercicio 4
--1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").

CREATE TABLE IF NOT EXISTS pedidos(
	ID SERIAL PRIMARY KEY,
	ID_CLIENTE INT NOT NULL,
	ID_PRODUCTO INT NOT NULL,
	CONSTRAINT FK_ID_CLINETE
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(id),
	CONSTRAINT FK_ID_PRODUCTO
	FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(id)
)

--2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.

INSERT INTO public.pedidos (id_cliente, id_producto)
VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(2,4),(3,3),(3,4),(3,6),(5,1),(5,2);

--3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

SELECT A.name, B.nombre
FROM public.clientes A
LEFT JOIN public.pedidos C 
ON A.id = C.id_cliente
LEFT JOIN public.productos B
ON B.id = C.id_producto

--4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).



--5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
--Cree la columna
ALTER TABLE public.pedidos
ADD cantidad int
--Rellené cada fila con valores aleatorios enteros entre 1 y 10
UPDATE public.pedidos
SET cantidad = ROUND(RANDOM() * 10);

