--Usuarios
CREATE TABLE public.usuarios
(
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    PRIMARY KEY (correo)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.usuarios
    OWNER to postgres;


--Rubricas
CREATE TABLE public.rubricas
(
    nombre character varying(100) NOT NULL,
    semestre numeric(5) NOT NULL,
    creador character varying(100),
    PRIMARY KEY (nombre, semestre, creador),
    CONSTRAINT creador FOREIGN KEY (creador)
        REFERENCES public.usuarios (correo) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.rubricas
    OWNER to postgres;