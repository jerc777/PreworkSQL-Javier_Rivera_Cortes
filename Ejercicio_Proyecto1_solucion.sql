-- Creacion de Tablas

CREATE TABLE Alumnos(
	id_alumno SERIAL PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellido VARCHAR(100)
);
SELECT * FROM Alumnos;


CREATE TABLE Cursos(
	id_curso SERIAL PRIMARY KEY,
	NOMBRE_CURSO varchar(100),
	Semanas INTEGER,
	fecha DATE
);
SELECT * FROM Cursos;


CREATE TABLE Inscripciones(
	id_inscripcion SERIAL PRIMARY KEY,
	id_alumno INT REFERENCES Alumnos(id_alumno),
	id_curso INT REFERENCES Cursos(id_curso),
	fecha DATE
);
SELECT * FROM Inscripciones;


CREATE TABLE Participaciones(
	id_participacion SERIAL PRIMARY KEY,
	id_alumno INT REFERENCES Alumnos(id_alumno),
	id_curso INT REFERENCES Cursos(id_curso),
	tipo TEXT CHECK (tipo in ('Foro','Clase','Tareas')),
	fecha DATE
);
SELECT * FROM Participaciones;

--Restriccion numero 2. Modificar Tablas

ALTER TABLE Alumnos
ADD COLUMN antiguedad integer;

SELECT * FROM Alumnos;

-- Restriccion numero 4. Poblar Tablas

INSERT into ALUMNOS (NOMBRE, APELLIDO, ANTIGUEDAD) VALUES
('Juan','Perez',3),
('Maria','Gonzalez',1);

SELECT * FROM Alumnos;

INSERT into Cursos (nombre_curso, semanas,fecha) VALUES
('Python',12,'2023-01-15'),
('SQL',8,'2023-02-11');

SELECT * FROM Cursos;

INSERT into inscripciones (id_alumno,id_curso,fecha) VALUES
(1,3,'2023-01-20'),
(2,3,'2023-01-22');

SELECT * FROM inscripciones;

INSERT into participaciones (id_alumno,id_curso,tipo,fecha) VALUES
(1,3,'Foro','2023-01-21'),
(2,3,'Clases','2023-01-25');

SELECT * FROM participaciones;

--Restriccion numero 5, Consultas

SELECT Cursos.nombre_curso, Cursos.semanas
FROM Cursos
INNER JOIN Inscripciones on cursos.id_curso = inscripciones.id_curso
WHERE Inscripciones.id_alumno = 1;

SELECT Alumnos.nombre, CONT(*) AS Total_participaciones
FROM Alumnos
INNER JOIN Participaciones ON Alumnos.id_alumno = Participaciones.id_alumnos
WHERE Participaciones.tipo ='Foro'
GROUP BY Alumnos.nombre;

SELECT Cursos.nombre_curso
FROM Cursos
LEFT JOIN INSCRIPCIONES ON cURSOS.id_alumno = INSCRIPCIONES.id_CURSO
WHERE Inscripciones.id_curso IS NULL;

SELECT Cursos.nombre_curso, AVG(Alumnos.antiguedad) AS antiguedad_promedio
FROM Cursos
inner JOIN inscripciones ON cursos.id_curso = inscripciones.id_curso
inner JOIN Alumnos on inscripciones.id_alumno = Alumnos.id_alumno
GROUP BY curos.nombre_curso

--QUE TIPO DE PARTICIPACIONES Y EN QUE FECHA HA HECHO MARÍA

SELECT Participaciones.tipo, participaciones.fecha
FROM participaciones
WHERE Participaciones.ID_alumno = 2;


INSERT INTO Participaciones (id_alumnos, id_curso, tipo, fecha) VALUES
(2,1,'Tareas','2023-01-16')