PGDMP         1            	    w            rubrica    11.3    11.3     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            %           1262    19063    rubrica    DATABASE     �   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE rubrica;
             postgres    false            �            1259    19224    calificaciones    TABLE       CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    actividad integer NOT NULL,
    tipo character varying NOT NULL,
    calificado character varying(100) NOT NULL,
    nota numeric(2,2) NOT NULL,
    profesor character varying(100) NOT NULL,
    rubrica json NOT NULL
);
 "   DROP TABLE public.calificaciones;
       public         postgres    false            �            1259    19222    calificaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.calificaciones_id_seq;
       public       postgres    false    209            &           0    0    calificaciones_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;
            public       postgres    false    208            �
           2604    19227    calificaciones id    DEFAULT     v   ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);
 @   ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209                      0    19224    calificaciones 
   TABLE DATA               b   COPY public.calificaciones (id, actividad, tipo, calificado, nota, profesor, rubrica) FROM stdin;
    public       postgres    false    209   �       '           0    0    calificaciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);
            public       postgres    false    208            �
           2606    19232 "   calificaciones calificaciones_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public         postgres    false    209            �
           2606    19233 (   calificaciones calificacion_actividad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_actividad_fk FOREIGN KEY (actividad) REFERENCES public.actividades(id);
 R   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_actividad_fk;
       public       postgres    false    209            �
           2606    19238 '   calificaciones calificacion_profesor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_profesor_fk FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 Q   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_profesor_fk;
       public       postgres    false    209                  x������ � �     