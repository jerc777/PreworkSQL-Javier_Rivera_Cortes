--Ejercicios 3
--1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE IF NOT EXISTS productos(
	id NUMERIC PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio INT NOT NULL	
)

--2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO public.productos(id, nombre, precio)
VALUES (1,'patatas', 1.5),
(2,'Huevos', 2.8),
(3,'Aceite', 8),
(4,'Cebolla', 1.6),
(5,'Tomates', 1.3),
(6,'Ajo', 0.8);

--3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE productos
SET nombre = 'patatas', precio=0.9
WHERE id = 1;

--4. Elimina un producto de la tabla "Productos".
DELETE FROM public.productos
where id=5

--5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").

-- Con esta sentencia agrego la columna Usuarios_id para usarla de FK
ALTER TABLE public.productos
ADD usuarios_id int;

-- con esta sentencia actualizo el indice de usuario_id de los productos que ya están

UPDATE productos
SET usuarios_id = 1
WHERE id = 1;

-- y con esta creo  nuevas

INSERT INTO public.productos(id,nombre, precio, usuarios_id)
VALUES (7,'patatas', 0.9, 2);
(8,'Huevos', 2.8, 3),
(9,'Aceite', 8, 3),
(10,'Cebolla', 1.6, 3),
(11,'Ajo', 0.8, 4),
(12,'Cebolla', 1.6, 4);

--Ahora hago la consulta

SELECT * 
FROM public.usuarios A
INNER JOIN public.productos B
on A.id = B.usuarios_id
ORDER BY A.id ASC

