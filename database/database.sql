CREATE DATABASE eventosPoli;
create schema IF NOT EXISTS eventos;

CREATE TABLE EVENTOS.AREAS
  (
    codigo            INTEGER NOT NULL ,
    nombre            VARCHAR (40) NOT NULL ,
    codigo_facultad   INTEGER NOT NULL ,
    id_coordinador    VARCHAR (15) NOT NULL
  )
   ;
CREATE UNIQUE INDEX AREAS__IDX ON EVENTOS.AREAS
  (
    id_coordinador ASC
  )
  ;
ALTER TABLE EVENTOS.AREAS ADD CONSTRAINT AREAS_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.CIUDADES
  (
    codigo   INTEGER NOT NULL ,
    nombre   VARCHAR (20) NOT NULL ,
    cod_dpto INTEGER NOT NULL
  )
   ;
ALTER TABLE EVENTOS.CIUDADES ADD CONSTRAINT CIUDADES_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.DEPARTAMENTOS
  (
    codigo   INTEGER NOT NULL ,
    nombre   VARCHAR (20) NOT NULL ,
    cod_pais INTEGER NOT NULL
  )
   ;
ALTER TABLE EVENTOS.DEPARTAMENTOS ADD CONSTRAINT DEPARTAMENTOS_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.EMPLEADOS
  (
    identificacion    VARCHAR (15) NOT NULL ,
    nombres           VARCHAR (30) NOT NULL ,
    apellidos         VARCHAR (30) NOT NULL ,
    email             VARCHAR (40) NOT NULL ,
    tipo_contratacion VARCHAR (30) NOT NULL ,
    tipo_empleado     VARCHAR (30) NOT NULL ,
    cod_facultad      INTEGER NOT NULL ,
    codigo_sede       INTEGER NOT NULL ,
    lugar_nacimiento  INTEGER NOT NULL
  )
   ;
ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMPLEADOS_PK PRIMARY KEY ( identificacion ) ;


CREATE TABLE EVENTOS.FACULTADES
  (
    codigo       INTEGER NOT NULL ,
    nombre       VARCHAR (30) NOT NULL ,
    ubicacion    VARCHAR (15) NOT NULL ,
    nro_telefono VARCHAR (15) NOT NULL ,
    id_decano    VARCHAR (15)
  )
   ;
CREATE UNIQUE INDEX FACULTADES__IDX ON EVENTOS.FACULTADES
  (
    id_decano ASC
  )
  ;
ALTER TABLE EVENTOS.FACULTADES ADD CONSTRAINT FACULTADES_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.PAISES
  (
    codigo INTEGER NOT NULL ,
    nombre VARCHAR (20) NOT NULL
  )
   ;
ALTER TABLE EVENTOS.PAISES ADD CONSTRAINT PAISES_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.PROGRAMAS
  (
    codigo       INTEGER NOT NULL ,
    nombre       VARCHAR (40) NOT NULL ,
    codigo_area INTEGER NOT NULL
  )
   ;
ALTER TABLE EVENTOS.PROGRAMAS ADD CONSTRAINT PROGRAMAS_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.SEDES
  (
    codigo        INTEGER NOT NULL ,
    nombre        VARCHAR (20) ,
    cod_ciudad INTEGER NOT NULL
  )
   ;
ALTER TABLE EVENTOS.SEDES ADD CONSTRAINT SEDES_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE EVENTOS.TIPOS_CONTRATACION
  ( nombre VARCHAR (30) NOT NULL
  )  ;
ALTER TABLE EVENTOS.TIPOS_CONTRATACION ADD CONSTRAINT TIPOS_CONTRATACION_PK PRIMARY KEY ( nombre ) ;


CREATE TABLE EVENTOS.TIPOS_EMPLEADO
  ( nombre VARCHAR (30) NOT NULL
  )  ;
ALTER TABLE EVENTOS.TIPOS_EMPLEADO ADD CONSTRAINT TIPOS_EMPLEADO_PK PRIMARY KEY ( nombre ) ;


ALTER TABLE EVENTOS.AREAS ADD CONSTRAINT AREAS_EMPLEADOS_FK FOREIGN KEY ( id_coordinador ) REFERENCES EVENTOS.EMPLEADOS ( identificacion ) ;

ALTER TABLE EVENTOS.AREAS ADD CONSTRAINT AREAS_FACULTADES_FK FOREIGN KEY ( codigo_facultad ) REFERENCES EVENTOS.FACULTADES ( codigo ) ;

ALTER TABLE EVENTOS.CIUDADES ADD CONSTRAINT CIUDAD_DEPARTAMENTOS_FK FOREIGN KEY ( cod_dpto ) REFERENCES EVENTOS.DEPARTAMENTOS ( codigo ) ;

ALTER TABLE EVENTOS.DEPARTAMENTOS ADD CONSTRAINT DEPARTAMENTOS_PAISES_FK FOREIGN KEY ( cod_pais ) REFERENCES EVENTOS.PAISES ( codigo ) ;

ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMPLEADOS_FACULTADES_FK FOREIGN KEY ( cod_facultad ) REFERENCES EVENTOS.FACULTADES ( codigo ) ;

ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMPLEADOS_CIUDADES_FK FOREIGN KEY ( lugar_nacimiento ) REFERENCES EVENTOS.CIUDADES ( codigo ) ;

ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMPLEADOS_SEDES_FK FOREIGN KEY ( codigo_sede ) REFERENCES EVENTOS.SEDES ( codigo ) ;

ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMP_TIPOS_CONTRATACION_FK FOREIGN KEY ( tipo_contratacion ) REFERENCES EVENTOS.TIPOS_CONTRATACION ( nombre ) ;

ALTER TABLE EVENTOS.EMPLEADOS ADD CONSTRAINT EMPLEADOS_TIPOS_EMPLEADO_FK FOREIGN KEY ( tipo_empleado ) REFERENCES EVENTOS.TIPOS_EMPLEADO ( nombre ) ;

ALTER TABLE EVENTOS.FACULTADES ADD CONSTRAINT FACULTADES_EMPLEADOS_FK FOREIGN KEY ( id_decano ) REFERENCES EVENTOS.EMPLEADOS ( identificacion ) ;

ALTER TABLE EVENTOS.PROGRAMAS ADD CONSTRAINT PROGRAMAS_AREAS_FK FOREIGN KEY ( codigo_area) REFERENCES EVENTOS.AREAS ( codigo ) ;

ALTER TABLE EVENTOS.SEDES ADD CONSTRAINT SEDES_CIUDADES_FK FOREIGN KEY ( cod_ciudad ) REFERENCES EVENTOS.CIUDADES ( codigo ) ;

insert into eventos.PAISES (codigo,nombre) values (57, 'COLOMBIA'); 
insert into eventos.DEPARTAMENTOS (codigo,nombre, cod_pais) values (1, 'ANTIOQUIA', 57); 
insert into eventos.ciudades (codigo,nombre, cod_dpto) values (1, 'MEDELLIN', 1); 
insert into eventos.facultades (codigo,nombre,ubicacion,nro_telefono) values (1,'INGENIERIA', 'P38-203','3197906');

insert into eventos.sedes (codigo,nombre,cod_ciudad) values (1, 'POBLADO', 1);

insert into eventos.tipos_contratacion (nombre) values ('LIBRE NOMBRAMIENTO');
insert into eventos.tipos_contratacion (nombre) values ('CARRERA ADMINISTRATIVA');
insert into eventos.tipos_contratacion (nombre) values ('CARRERA DOCENTE');

insert into eventos.tipos_empleado (nombre) values ('ADMINISTRATIVO');
insert into eventos.tipos_empleado (nombre) values ('DOCENTE');

insert into eventos.empleados (identificacion,nombres,apellidos,email,tipo_contratacion,tipo_empleado,cod_facultad,codigo_sede,lugar_nacimiento) values (10,'LUZ','LOPEZ','LMLOPEZ@ELPOLI.EDU.CO','CARRERA ADMINISTRATIVA','ADMINISTRATIVO', 1,1,1);
insert into eventos.empleados (identificacion,nombres,apellidos,email,tipo_contratacion,tipo_empleado,cod_facultad,codigo_sede,lugar_nacimiento) values (11,'JOSE LEONARDO','RAMIREZ','JOSERAMIREZ@ELPOLI.EDU.CO','LIBRE NOMBRAMIENTO','ADMINISTRATIVO', 1,1,1);

insert into eventos.areas (codigo,nombre,codigo_facultad, id_coordinador) values (1, 'APIT', 1, 10); 

insert into eventos.PROGRAMAS (codigo,nombre,codigo_area) values (15,'INGENIERIA INFORMATICA', 1);
