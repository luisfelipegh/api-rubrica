--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-09-17 23:18:31 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 17052)
-- Name: equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17055)
-- Name: equipos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 197
-- Name: equipos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;


--
-- TOC entry 198 (class 1259 OID 17057)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17128)
-- Name: estudiantes_equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes_equipos (
    equipo integer NOT NULL,
    grupo character varying(2044) NOT NULL,
    estudiante character varying(2044) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.estudiantes_equipos OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17144)
-- Name: estudiantes_equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiantes_equipos_id_seq OWNER TO postgres;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 205
-- Name: estudiantes_equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_equipos_id_seq OWNED BY public.estudiantes_equipos.id;


--
-- TOC entry 199 (class 1259 OID 17063)
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17069)
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_id_seq OWNER TO postgres;

--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 200
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;


--
-- TOC entry 201 (class 1259 OID 17071)
-- Name: rubricas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    semestre numeric(5,0) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.rubricas OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17077)
-- Name: rubricas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rubricas_id_seq OWNER TO postgres;

--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 202
-- Name: rubricas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;


--
-- TOC entry 203 (class 1259 OID 17079)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 3085 (class 2604 OID 17082)
-- Name: equipos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);


--
-- TOC entry 3088 (class 2604 OID 17146)
-- Name: estudiantes_equipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_equipos ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_equipos_id_seq'::regclass);


--
-- TOC entry 3086 (class 2604 OID 17083)
-- Name: grupos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);


--
-- TOC entry 3087 (class 2604 OID 17084)
-- Name: rubricas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);


--
-- TOC entry 3231 (class 0 OID 17052)
-- Dependencies: 196
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipos (codigo, grupo, nombre) FROM stdin;
7	5494	test23
8	5491	PRIMER EQUIPO
10	5494	equipo2
\.


--
-- TOC entry 3233 (class 0 OID 17057)
-- Dependencies: 198
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
5492	juaneschrome@gmail.com	20192
5492	sebas@gmail.com	20192
5492	luisfelipe@gmail.com	20192
5492	kevin@gmail.com	20192
5486	juanleal@gmail.com	20192
5486	alejomonsalve@gmail.com	20192
5486	yeffrigomez@gmail.com	20192
5494	luiscardona.159@gmail.com	20192
5494	grisales_08@hotmail.es	20192
5494	sefriee18@gmail.com	20192
5494	juane.leal98@gmail.com	20192
5494	josemejia11@hotmail.es	20192
5494	Arekusumf@gmail.com	20192
5494	ALMONTOYA02@OUTLOOK.COM	20192
5494	juaneschrome@gmail.com	20192
5494	luisfelipegarciacsj@gmail.com	20192
5494	sebas551v@gmail.com	20192
5494	alejandrouribep@gmail.com	20192
5494	cristianxapata@gmail.com	20192
5494	kevinospina03@gmail.com	20192
\.


--
-- TOC entry 3239 (class 0 OID 17128)
-- Dependencies: 204
-- Data for Name: estudiantes_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes_equipos (equipo, grupo, estudiante, id) FROM stdin;
7	5494	luisfelipegarciacsj@gmail.com	4
10	5494	luisfelipegarciacsj@gmail.com	11
\.


--
-- TOC entry 3234 (class 0 OID 17063)
-- Dependencies: 199
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
1	5492	20192	SIO II - 061	dvillanueva@udem.edu.co
2	5486	20192	SIO I - 061	mariaclara@udem.edu.co
3	5494	20192	ISW IV - 061	gloriagasca@udem.edu.co
1	5491	20192	ISW - 2	bmanrique@udem.edu.co
\.


--
-- TOC entry 3236 (class 0 OID 17071)
-- Dependencies: 201
-- Data for Name: rubricas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rubricas (nombre, semestre, creador, json, id) FROM stdin;
s	2012	bmanrique@udem.edu.co	{"levels": [{"id": 1, "name": "Conocimiento", "categories": [{"action": "", "skills": [{"text": "q23"}], "category": "eee"}]}], "nombre": "s", "semestre": "2012", "usuario_creacion": "bmanrique@udem.edu.co"}	3
2	32	bmanrique@udem.edu.co	{"levels": [{"id": 1, "name": "Conocimiento", "categories": [{"action": "", "skills": [{"text": "2"}], "category": "23"}]}], "nombre": "2", "semestre": "32", "usuario_creacion": "bmanrique@udem.edu.co"}	4
\.


--
-- TOC entry 3238 (class 0 OID 17079)
-- Dependencies: 203
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
luiscardona.159@gmail.com	CARDONA GALLEGO LUIS FERNANDO	admin	ESTUDIANTE
luisfelipegarciacsj@gmail.com	GARCIA HERRERA LUIS FELIPE	admin	ESTUDIANTE
sefriee18@gmail.com	GOMEZ HINESTROZA YEFFRI SANTIAGO	admin	ESTUDIANTE
grisales_08@hotmail.es	GRISALES ZAPATA DUBAN ESTEBAN	admin	ESTUDIANTE
juane.leal98@gmail.com	LEAL GUTIERREZ JUAN ESTEBAN	admin	ESTUDIANTE
josemejia11@hotmail.es	MEJIA CHAVERRA JOSE MIGUEL	admin	ESTUDIANTE
Arekusumf@gmail.com	MONSALVE FLOREZ ALEJANDRO	admin	ESTUDIANTE
ALMONTOYA02@OUTLOOK.COM	MONTOYA GONZALEZ JOSE ALEJANDRO	admin	ESTUDIANTE
kevinospina03@gmail.com	OSPINA CA�AVERAL KEVIN SNEIDER	admin	ESTUDIANTE
sebas551v@gmail.com	RAMIREZ DAVID SEBASTIAN STIVEN	admin	ESTUDIANTE
alejandrouribep@gmail.com	URIBE PIEDRAHITA ALEJANDRO	admin	ESTUDIANTE
cristianxapata@gmail.com	ZAPATA LOPEZ CRISTIAN YESID	admin	ESTUDIANTE
bmanrique@udem.edu.co	Bell Manrrique Lozada	admin	PROFESOR
luisfelipe@gmail.com	Luis Felipe Garcia	admin	ESTUDIANTE
sebas@gmail.com	Sebastian Ramirez	admin	ESTUDIANTE
gloriagasca@udem.edu.co	Gloria Gasca	admin	PROFESOR
mariaclara@udem.edu.co	Maria Clara	admin	PROFESOR
dvillanueva@udem.edu.co	David Villanueva	admin	PROFESOR
kevin@gmail.com	Kevin Osipna	admin	ESTUDIANTE
katherine@gmail.com	Katherine Posada	admin	ESTUDIANTE
wilfri@gmail.com	Wilfri Zapata	admin	ESTUDIANTE
luisfernando@gmail.com	Luis Fernando	admin	ESTUDIANTE
juaneschrome@gmail.com	Juanes Quintero	admin	ESTUDIANTE
yeffrigomez@gmail.com	Yeffri Gomez	admin\n	ESTUDIANTE
alejomonsalve@gmail.com	Alejo Monsalve	admin	ESTUDIANTE
juanleal@gmail.com	Juanes Leal\n	admin	ESTUDIANTE
\.


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 197
-- Name: equipos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipos_codigo_seq', 10, true);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 205
-- Name: estudiantes_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_equipos_id_seq', 16, true);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 200
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_seq', 1, true);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 202
-- Name: rubricas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rubricas_id_seq', 7, true);


--
-- TOC entry 3090 (class 2606 OID 17086)
-- Name: equipos equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);


--
-- TOC entry 3092 (class 2606 OID 17088)
-- Name: estudiantes estudiantes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);


--
-- TOC entry 3094 (class 2606 OID 17090)
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3102 (class 2606 OID 17159)
-- Name: estudiantes_equipos pk_estudiantes_equipos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT pk_estudiantes_equipos PRIMARY KEY (grupo, estudiante, equipo);


--
-- TOC entry 3096 (class 2606 OID 17092)
-- Name: rubricas rubricas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (nombre, semestre, creador);


--
-- TOC entry 3098 (class 2606 OID 17094)
-- Name: rubricas unique_rubricas_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);


--
-- TOC entry 3100 (class 2606 OID 17096)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);


--
-- TOC entry 3107 (class 2606 OID 17097)
-- Name: rubricas creador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3104 (class 2606 OID 17102)
-- Name: estudiantes estudiantes_estudiante_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);


--
-- TOC entry 3105 (class 2606 OID 17107)
-- Name: estudiantes estudiantes_grupo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);


--
-- TOC entry 3103 (class 2606 OID 17112)
-- Name: equipos grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);


--
-- TOC entry 3109 (class 2606 OID 17139)
-- Name: estudiantes_equipos grupos_est_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_est_fkey FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);


--
-- TOC entry 3106 (class 2606 OID 17117)
-- Name: grupos grupos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);


--
-- TOC entry 3108 (class 2606 OID 17134)
-- Name: estudiantes_equipos grupos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (equipo, grupo) REFERENCES public.equipos(codigo, grupo);


-- Completed on 2019-09-17 23:18:32 -05

--
-- PostgreSQL database dump complete
--

