--Ejercicios 3
--1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE IF NOT EXISTS productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio numeric NOT NULL	
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
SET nombre = 'Patatas', precio=0.9
WHERE id = 1;

--4. Elimina un producto de la tabla "Productos".
DELETE FROM public.productos
where id=5

--5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").

--Primero crearemos la tabla usuarios y la llenamos
CREATE TABLE IF NOT EXISTS Clientes (
	ID SERIAL	PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	EMAIL VARCHAR(255)
)
INSERT INTO public.clientes (name, email)
VALUES ('Juan', 'juan@example.com'),
('Diego', 'diego@gmail.com'),
('Pedro','pedro@gmail.com'),
('suana','susana@gmail.com'),
('Ana', 'ana@gmail.com');

--Ahora hago la consulta

SELECT A.id, A.name, B.nombre
FROM public.clientes A
INNER JOIN public.productos B
on A.id = B.id
ORDER BY A.id ASC

