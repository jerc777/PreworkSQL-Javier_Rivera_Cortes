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
INSERT INTO public.usuarios (id,nombre,edad)
VALUES (1,'Sergio', 30),(2,'Pedro', 28),(3,'Jose',15), (4,'Roberto',56)

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
--Primero cree la columna ciudades_id
ALTER TABLE public.usuarios
ADD ciudades_id NUMERIC;
-- Ahora le dí la caracteristica de que no puede tener valores repetidos para que funcione com FK
ALTER TABLE public.usuarios
ADD CONSTRAINT OQ_ciudades_id
UNIQUE (ciudades_id)
-- llene los espacios con valores igual al id ( uno por uno)
UPDATE public.usuarios
SET ciudades_id = 3
WHERE ID=3
--Ahora para crear la fk 
ALTER TABLE public.ciudades
ADD CONSTRAINT FK_ciudades_id
FOREIGN KEY (id) 
REFERENCES usuarios(ciudades_id); 

--4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).

SELECT A.id, A.nombre, B.name, B.pais
FROM public.usuarios A
LEFT JOIN public.ciudades B
ON A.ciudades_id = B.id

--5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
--Primero agregué un par de personas sin ciudades asociadas 
INSERT INTO public.usuarios (id,nombre,edad)
VALUES (5,'Ana', 29),(6,'Laura', 53)

--Luego la consulta sería:
SELECT * 
FROM public.usuarios A
INNER JOIN public.ciudades B
on A.ciudades_id = B.id

                   --como consulta. intento agregar un nuevo lugar en la tabla de ciudades, y no me deja
									 INSERT INTO public.ciudades (id,name, pais)
									 VALUES (4,'Paris','Francia')
