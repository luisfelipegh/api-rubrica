PGDMP     4                    w            rubrica    11.3    11.3 %    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            .           1262    18760    rubrica    DATABASE     �   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE rubrica;
             postgres    false            �            1259    19010    equipos    TABLE     �   CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.equipos;
       public         postgres    false            �            1259    19008    equipos_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.equipos_codigo_seq;
       public       postgres    false    202            /           0    0    equipos_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;
            public       postgres    false    201            �            1259    19045    estudiantes    TABLE     �   CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         postgres    false            �            1259    18815    grupos    TABLE     �   CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);
    DROP TABLE public.grupos;
       public         postgres    false            �            1259    18829    grupos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grupos_id_seq;
       public       postgres    false    196            0           0    0    grupos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;
            public       postgres    false    197            �            1259    18831    rubricas    TABLE     �   CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    semestre numeric(5,0) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.rubricas;
       public         postgres    false            �            1259    18837    rubricas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.rubricas_id_seq;
       public       postgres    false    198            1           0    0    rubricas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;
            public       postgres    false    199            �            1259    18839    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false            �
           2604    19013    equipos codigo    DEFAULT     p   ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);
 =   ALTER TABLE public.equipos ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    18842 	   grupos id    DEFAULT     f   ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);
 8   ALTER TABLE public.grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    18844    rubricas id    DEFAULT     j   ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);
 :   ALTER TABLE public.rubricas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            '          0    19010    equipos 
   TABLE DATA               8   COPY public.equipos (codigo, grupo, nombre) FROM stdin;
    public       postgres    false    202   �(       (          0    19045    estudiantes 
   TABLE DATA               B   COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
    public       postgres    false    203    )       !          0    18815    grupos 
   TABLE DATA               H   COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
    public       postgres    false    196   �)       #          0    18831    rubricas 
   TABLE DATA               G   COPY public.rubricas (nombre, semestre, creador, json, id) FROM stdin;
    public       postgres    false    198   *       %          0    18839    usuarios 
   TABLE DATA               D   COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
    public       postgres    false    200   �*       2           0    0    equipos_codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.equipos_codigo_seq', 1, false);
            public       postgres    false    201            3           0    0    grupos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.grupos_id_seq', 1, false);
            public       postgres    false    197            4           0    0    rubricas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rubricas_id_seq', 4, true);
            public       postgres    false    199            �
           2606    19015    equipos equipos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public         postgres    false    202    202            �
           2606    19052    estudiantes estudiantes_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);
 D   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pk;
       public         postgres    false    203    203    203            �
           2606    19007    grupos grupos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public         postgres    false    196            �
           2606    18846    rubricas rubricas_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (nombre, semestre, creador);
 @   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT rubricas_pkey;
       public         postgres    false    198    198    198            �
           2606    18852    rubricas unique_rubricas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT unique_rubricas_id;
       public         postgres    false    198            �
           2606    18854    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    200            �
           2606    18856    rubricas creador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT creador;
       public       postgres    false    2718    200    198            �
           2606    19058 %   estudiantes estudiantes_estudiante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 O   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_estudiante_fk;
       public       postgres    false    200    203    2718            �
           2606    19053     estudiantes estudiantes_grupo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 J   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_grupo_fk;
       public       postgres    false    196    2712    203            �
           2606    19016    equipos grupo    FK CONSTRAINT     o   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 7   ALTER TABLE ONLY public.equipos DROP CONSTRAINT grupo;
       public       postgres    false    202    196    2712            �
           2606    18866    grupos grupos_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    200    196    2718            '   9   x�3�45�4��I,Vp,J���I,�2���+��s#D�����R��b���� ��      (   m   x�u��@0E��1B���!6��2L[1!��=�j}�}�E��i�b�58lĩ	.�Y�hU>�`G��XdZ~�3��#���]F�8�)��x�u�ʁ֮4ܷϏХJ���B�      !   k   x�3�45�4�420����
��
�
f��)e�99�y��e��)��z�)�z��\F@f�:�r�2�s�P��l0���W��jH���HO,NF����� �*)      #   �   x�ŏK
�0@��)$k)6q�J�*���6	�G�һ�ĊPݸr5Û��jN-��>�6��+hc�,XW�<�,��6�z�`FjH)�Ycj,K\� g���Z�;s�_�{�
p��\����g 	l�n\���
����3�>J���H5��j�F"('�o��S���L��T�칦��R� ����      %   5  x�m�In�0E��)x��!� m�N@��0�0�$W�\4���t��,�>�az��8�4��T�U��$X�d�`i��@����5y�J	�kni�hd��.���Ha���_�|����A�8�û�<�fG�\i�:�}������M18��1F���*����O�]@#��t���<,#]��
���ƣ��g�8�~�����v�XM��z),|t�k7���.��!g�m�K9�F��VG�[�,�M2�:x��3g�c�%�&�v������(�T�"h��3]c�
^���[��g�n�p�5g��geY~{��     