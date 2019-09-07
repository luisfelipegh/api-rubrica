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
BEGIN;

-- CREATE TABLE "rubricas" -------------------------------------
CREATE TABLE "public"."rubricas" ( 
	"nombre" Character Varying( 100 ) NOT NULL,
	"semestre" Numeric( 5, 0 ) NOT NULL,
	"creador" Character Varying( 100 ) NOT NULL,
	"json" JSONB NOT NULL,
	"id" Integer DEFAULT nextval('rubricas_id_seq'::regclass) NOT NULL,
	PRIMARY KEY ( "nombre", "semestre", "creador" ),
	CONSTRAINT "unique_rubricas_id" UNIQUE( "id" ) );
 ;
-- -------------------------------------------------------------

COMMIT;

BEGIN;

-- CREATE LINK "creador" ---------------------------------------
ALTER TABLE "public"."rubricas"
	ADD CONSTRAINT "creador" FOREIGN KEY ( "creador" )
	REFERENCES "public"."usuarios" ( "correo" ) MATCH SIMPLE
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;