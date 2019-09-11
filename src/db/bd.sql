BEGIN;
-- CREATE TABLE "usuarios" -------------------------------------
CREATE TABLE "public"."usuarios" ( 
	"correo" Character Varying( 100 ) NOT NULL,
	"nombre" Character Varying( 150 ) NOT NULL,
	"contrasena" Character Varying( 20 ) NOT NULL,
	"tipo" Character Varying( 20 ) NOT NULL,
	PRIMARY KEY ( "correo" ) );
 ;
-- -------------------------------------------------------------
COMMIT;

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

BEGIN;
-- CREATE TABLE "grupos" ---------------------------------------
CREATE TABLE "public"."grupos" ( 
	"id" Integer DEFAULT nextval('grupos_id_seq'::regclass) NOT NULL,
	"codigo" Character Varying( 100 ) NOT NULL,
	"semestre" Character Varying( 2044 ) NOT NULL,
	"nombre" Character Varying( 2044 ) NOT NULL,
	"profesor" Character Varying( 2044 ) NOT NULL );
 ;
-- -------------------------------------------------------------
COMMIT;

BEGIN;
-- CREATE LINK "grupos_fkey" -----------------------------------
ALTER TABLE "public"."grupos"
	ADD CONSTRAINT "grupos_fkey" FOREIGN KEY ( "profesor" )
	REFERENCES "public"."usuarios" ( "correo" ) MATCH SIMPLE
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
COMMIT;

BEGIN;
-- CREATE TABLE "grupos_estudiantes" ---------------------------
CREATE TABLE "public"."grupos_estudiantes" ( 
	"estudiante" Character Varying( 2044 ) NOT NULL,
	"grupo" Character Varying( 2044 ) NOT NULL,
	"id" Integer DEFAULT nextval('grupos_estudiantes_id_seq'::regclass) NOT NULL,
	CONSTRAINT "unique_grupos_estudiantes_grupo" UNIQUE( "grupo" ),
	CONSTRAINT "unique_grupos_estudiantes_estudiante" UNIQUE( "estudiante" ) );
 ;
-- -------------------------------------------------------------
-- CREATE INDEX "index_id" -------------------------------------
CREATE INDEX "index_id" ON "public"."grupos_estudiantes" USING btree( "id" Asc NULLS Last );
-- -------------------------------------------------------------
COMMIT;

BEGIN;
-- CREATE LINK "grupos_estudiantes_est_fkey" -------------------
ALTER TABLE "public"."grupos_estudiantes"
	ADD CONSTRAINT "grupos_estudiantes_est_fkey" FOREIGN KEY ( "estudiante" )
	REFERENCES "public"."usuarios" ( "correo" ) MATCH SIMPLE
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
COMMIT;