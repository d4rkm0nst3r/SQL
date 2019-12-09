-- TABLA DEPARTAMENTOS
CREATE TABLE Departamentos
(
    IdDpto INT PRIMARY KEY,
    Nombre VARCHAR2(15),
    Presupuesto INT CHECK (Presupuesto IS NOT NULL AND Presupuesto>5000)
);
CREATE SEQUENCE IdDpto START WITH 1;
CREATE INDEX IndexDepartamento ON Departamentos (Nombre);
-- TABLA EMPLEADOS
CREATE TABLE Empleados
(
    IdEmp INT PRIMARY KEY,
    Nombre VARCHAR2(15),
    Apellidos VARCHAR2(20),
    Sexo CHAR(1),
    Fecha_nac DATE,
    Municipio VARCHAR2(20),
    Sueldo INT CHECK (Sueldo IS NOT NULL AND Sueldo>1000),
    IdDpto INT REFERENCES Departamentos (IdDpto) ON DELETE SET NULL
);
-- TABLA PROYECTOS
CREATE TABLE Proyectos
(
    IdProxy INT PRIMARY KEY,
    Nombre VARCHAR(20) DEFAULT 'INDEF' UNIQUE,
    Fecha_ini DATE,
    Fecha_fin DATE
);
-- TABLA ASIGNACION
CREATE TABLE Asignacion
(
    IdEmp INT PRIMARY KEY REFERENCES Empleados (IdEmp),
    IdProxy INT REFERENCES Proyectos (IdProxy)
);
--- DATOS DEPARTAMENTOS ---
INSERT INTO Departamentos (IdDpto,Nombre,Presupuesto)
VALUES (1,'I+D',50000);
INSERT INTO Departamentos (IdDpto,Nombre,Presupuesto)
VALUES (2,'Diseno',25000);
INSERT INTO Departamentos (IdDpto,Nombre,Presupuesto)
VALUES (3,'Ventas',15000);
INSERT INTO Departamentos (IdDpto,Nombre,Presupuesto)
VALUES (4,'Marketing',10000);

--- DATOS EMPLEADOS ---
INSERT INTO Empleados (IdEmp,Nombre,Apellidos,Sexo,Fecha_nac,Municipio,Sueldo,IdDpto)
VALUES (10478,'Alberto','Perez Lopez','M','12-10-1969','Madrid',1500,1);
INSERT INTO Empleados (IdEmp,Nombre,Apellidos,Sexo,Fecha_nac,Municipio,Sueldo,IdDpto)
VALUES (10479,'Gloria','Ruiz Ruiz','F','07-11-1965','Sevilla',1650,2);
INSERT INTO Empleados (IdEmp,Nombre,Apellidos,Sexo,Fecha_nac,Municipio,Sueldo,IdDpto)
VALUES (10480,'Antonio','Garcia Montero','M','07-10-1960','Madrid',1350,1);
INSERT INTO Empleados (IdEmp,Nombre,Apellidos,Sexo,Fecha_nac,Municipio,Sueldo,IdDpto)
VALUES (10481,'Ana','Lopez Ramirez','F','01-10-1990','Sevilla',1250,3);
INSERT INTO Empleados (IdEmp,Nombre,Apellidos,Sexo,Fecha_nac,Municipio,Sueldo,IdDpto)
VALUES (10482,'Eduardo','Chicon Terrales','M','07-11-1980','Cordoba',1470,2);

--- DATOS PROYECTOS ---
INSERT INTO Proyectos (IdProxy,Nombre,Fecha_ini,Fecha_fin)
VALUES (1,'SINUBE','01-01-2018','15-3-2018');
INSERT INTO Proyectos (IdProxy,Nombre,Fecha_ini,Fecha_fin)
VALUES (2,'TRASPI','15-02-2018','30-12-2018');
INSERT INTO Proyectos (IdProxy,Nombre,Fecha_ini,Fecha_fin)
VALUES (3,'RUNTA','6-6-2018','15-09-2018');
INSERT INTO Proyectos (IdProxy,Nombre,Fecha_ini,Fecha_fin)
VALUES (4,'CARTAL','05-05-2018','25-09-2018');

--- DATOS ASIGNACION ---
INSERT INTO Asignacion (IdEmp,IdProxy)
VALUES (10478,1);
INSERT INTO Asignacion (IdEmp,IdProxy)
VALUES (10480,3);
INSERT INTO Asignacion (IdEmp,IdProxy)
VALUES (10481,1);
INSERT INTO Asignacion (IdEmp,IdProxy)
VALUES (10482,2);
