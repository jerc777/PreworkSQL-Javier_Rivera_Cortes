--Ejercicio 2
--Nivel de dificultad: Fácil
--1. Crea una base de datos llamada "MiBaseDeDatos".
--2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE IF NOT EXISTS USUARIOS(
ID NUMERIC PRIMARY KEY,
NOMBRE VARCHAR(255) NOT NULL,
EDAD INT
)
--3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO public.usuarios (id,nombre, edad)
VALUES (1,'sergio', 30),(2,'pedro', 28),(3,'jose',15), (4,'roberto',56)

--4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE Usuarios
SET edad = 35
WHERE id = 4;

--5. Elimina un usuario de la tabla "Usuarios". 
DELETE FROM public.usuarios
where id=3

--Nivel de dificultad: Moderado
--1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE IF NOT EXISTS ciudades (
	ID NUMERIC	PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	pais VARCHAR(255)
)

--2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO public.ciudades (id,name, pais)
VALUES (1,'Madrid','España'),
(2,'Astana','Kazajistan'),
(3,'Ulan Bator','Mongolia')

--3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".


--4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).


--5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).