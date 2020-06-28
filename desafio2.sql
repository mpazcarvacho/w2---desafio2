--Desafío 2

CREATE DATABASE desafio2;

\c desafio2

--CREACIÓN TABLAS

CREATE TABLE editoriales(
    id SERIAL,
    editorial VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE autores(
    id SERIAL,
    autor VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE libros(
    codigo_libro SMALLINT NOT NULL,
    titulo VARCHAR(230) NOT NULL,
    PRIMARY KEY (codigo_libro)
);

CREATE TABLE editorial_libro(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_editorial SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_editorial) REFERENCES editoriales(id)
);

CREATE TABLE autor_libro(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_autor SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_autor) REFERENCES autores(id)
);

CREATE TABLE lectores(
    id SERIAL,
    apellido_paterno VARCHAR(150) NOT NULL,
    apellido_materno VARCHAR(150) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE prestamos(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_lector SMALLINT NOT NULL,
    fecha_devolucion DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_lector) REFERENCES lectores(id)
);

--Ingreso datos
INSERT INTO editoriales(editorial)
VALUES ('UTHEA'),('Reverté'),('McGrawHill'),('MIR');

INSERT INTO autores(autor)
VALUES ('Lambe, C.'),('Christen, Hans Rudol'),('Serway, Raymond A'),
('G Tranter, C. J'),('Murray Spiegel'),('Voevodin, Valentin V');

INSERT INTO libros(codigo_libro, titulo)
VALUES (515, 'Ecuaciones diferenciales para ingenieros y científicos'),
    (540,'Química'),
    (530,'Física'),
    (519,'Estadística'),
    (512,'Algebra Lineal');

INSERT INTO lectores(apellido_paterno, apellido_materno, nombre)
VALUES ('Pérez','Gómez','Juan'),
    ('Ortega','Pereira','Margarita'),
    ('García','Contreras','Rosa'),
    ('López','Molina','Ana');

INSERT INTO prestamos(codigo_libro, id_lector, fecha_devolucion)
VALUES (515,1,'2019-09-15'),
    (540,2,'2019-08-23'),
    (530,3,'2019-09-24'),
    (519,4,'2019-09-18'),
    (512,1,'2019-09-17');

INSERT INTO editorial_libro(codigo_libro,id_editorial)
VALUES (515,1),
    (540,2),
    (530,3),
    (519,3),
    (512,4);

INSERT INTO autor_libro(codigo_libro, id_autor)
VALUES (515,1),
    (540,2),
    (530,3),
    (515,4),
    (519,5),
    (512,6);

