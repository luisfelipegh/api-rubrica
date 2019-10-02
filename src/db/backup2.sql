PGDMP          3            	    w            rubrica    11.3    11.3 7    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            I           1262    19063    rubrica    DATABASE     �   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE rubrica;
             postgres    false            �            1259    19167    actividades    TABLE     �   CREATE TABLE public.actividades (
    rubrica integer NOT NULL,
    nombre character varying(100) NOT NULL,
    id integer NOT NULL,
    creador character varying(100) NOT NULL
);
    DROP TABLE public.actividades;
       public         postgres    false            �            1259    19165    actividades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.actividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.actividades_id_seq;
       public       postgres    false    207            J           0    0    actividades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.actividades_id_seq OWNED BY public.actividades.id;
            public       postgres    false    206            �            1259    19064    equipos    TABLE     �   CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.equipos;
       public         postgres    false            �            1259    19067    equipos_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.equipos_codigo_seq;
       public       postgres    false    196            K           0    0    equipos_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;
            public       postgres    false    197            �            1259    19069    estudiantes    TABLE     �   CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         postgres    false            �            1259    19075    estudiantes_equipos    TABLE     �   CREATE TABLE public.estudiantes_equipos (
    equipo integer NOT NULL,
    grupo character varying(2044) NOT NULL,
    estudiante character varying(2044) NOT NULL,
    id integer NOT NULL
);
 '   DROP TABLE public.estudiantes_equipos;
       public         postgres    false            �            1259    19081    estudiantes_equipos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estudiantes_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.estudiantes_equipos_id_seq;
       public       postgres    false    199            L           0    0    estudiantes_equipos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.estudiantes_equipos_id_seq OWNED BY public.estudiantes_equipos.id;
            public       postgres    false    200            �            1259    19083    grupos    TABLE     �   CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);
    DROP TABLE public.grupos;
       public         postgres    false            �            1259    19089    grupos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grupos_id_seq;
       public       postgres    false    201            M           0    0    grupos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;
            public       postgres    false    202            �            1259    19091    rubricas    TABLE     �   CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.rubricas;
       public         postgres    false            �            1259    19097    rubricas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.rubricas_id_seq;
       public       postgres    false    203            N           0    0    rubricas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;
            public       postgres    false    204            �            1259    19099    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false            �
           2604    19170    actividades id    DEFAULT     p   ALTER TABLE ONLY public.actividades ALTER COLUMN id SET DEFAULT nextval('public.actividades_id_seq'::regclass);
 =   ALTER TABLE public.actividades ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    19160    equipos codigo    DEFAULT     p   ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);
 =   ALTER TABLE public.equipos ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    19161    estudiantes_equipos id    DEFAULT     �   ALTER TABLE ONLY public.estudiantes_equipos ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_equipos_id_seq'::regclass);
 E   ALTER TABLE public.estudiantes_equipos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            �
           2604    19162 	   grupos id    DEFAULT     f   ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);
 8   ALTER TABLE public.grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �
           2604    19163    rubricas id    DEFAULT     j   ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);
 :   ALTER TABLE public.rubricas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            C          0    19167    actividades 
   TABLE DATA               C   COPY public.actividades (rubrica, nombre, id, creador) FROM stdin;
    public       postgres    false    207   �>       8          0    19064    equipos 
   TABLE DATA               8   COPY public.equipos (codigo, grupo, nombre) FROM stdin;
    public       postgres    false    196   ?       :          0    19069    estudiantes 
   TABLE DATA               B   COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
    public       postgres    false    198   O?       ;          0    19075    estudiantes_equipos 
   TABLE DATA               L   COPY public.estudiantes_equipos (equipo, grupo, estudiante, id) FROM stdin;
    public       postgres    false    199   <@       =          0    19083    grupos 
   TABLE DATA               H   COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
    public       postgres    false    201   �@       ?          0    19091    rubricas 
   TABLE DATA               C   COPY public.rubricas (nombre, creador, json, id, tipo) FROM stdin;
    public       postgres    false    203   A       A          0    19099    usuarios 
   TABLE DATA               D   COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
    public       postgres    false    205   mF       O           0    0    actividades_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.actividades_id_seq', 1, false);
            public       postgres    false    206            P           0    0    equipos_codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipos_codigo_seq', 5, true);
            public       postgres    false    197            Q           0    0    estudiantes_equipos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.estudiantes_equipos_id_seq', 9, true);
            public       postgres    false    200            R           0    0    grupos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grupos_id_seq', 2, true);
            public       postgres    false    202            S           0    0    rubricas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.rubricas_id_seq', 16, true);
            public       postgres    false    204            �
           2606    19172    actividades actividades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividades_pkey;
       public         postgres    false    207            �
           2606    19107    equipos equipos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public         postgres    false    196    196            �
           2606    19109    estudiantes estudiantes_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);
 D   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pk;
       public         postgres    false    198    198    198            �
           2606    19111    grupos grupos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public         postgres    false    201            �
           2606    19113 *   estudiantes_equipos pk_estudiantes_equipos 
   CONSTRAINT     w   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT pk_estudiantes_equipos PRIMARY KEY (grupo, estudiante);
 T   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT pk_estudiantes_equipos;
       public         postgres    false    199    199            �
           2606    19115    rubricas rubricas_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (nombre, creador);
 @   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT rubricas_pkey;
       public         postgres    false    203    203            �
           2606    19117    rubricas unique_rubricas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT unique_rubricas_id;
       public         postgres    false    203            �
           2606    19119    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    205            �
           2606    19178     actividades actividad_creador_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_creador_fk FOREIGN KEY (creador) REFERENCES public.usuarios(correo);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_creador_fk;
       public       postgres    false    207    205    2739            �
           2606    19173     actividades actividad_rubrica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_rubrica_fk FOREIGN KEY (rubrica) REFERENCES public.rubricas(id);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_rubrica_fk;
       public       postgres    false    207    203    2737            �
           2606    19120    rubricas creador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT creador;
       public       postgres    false    203    205    2739            �
           2606    19125 %   estudiantes estudiantes_estudiante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 O   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_estudiante_fk;
       public       postgres    false    198    205    2739            �
           2606    19130     estudiantes estudiantes_grupo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 J   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_grupo_fk;
       public       postgres    false    198    201    2733            �
           2606    19135    equipos grupo    FK CONSTRAINT     o   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 7   ALTER TABLE ONLY public.equipos DROP CONSTRAINT grupo;
       public       postgres    false    196    201    2733            �
           2606    19140 #   estudiantes_equipos grupos_est_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_est_fkey FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 M   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_est_fkey;
       public       postgres    false    199    205    2739            �
           2606    19145    grupos grupos_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    201    205    2739            �
           2606    19150    estudiantes_equipos grupos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (equipo, grupo) REFERENCES public.equipos(codigo, grupo);
 I   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    196    2727    196    199    199            C      x������ � �      8   4   x�3�45�4�t-,�,�W0�2B�)p�s���M�L�|K��=... �a      :   �   x�u��n�0E��c�8`��uY�7t�T��$��#������P����ѽ3jSoV�]"D�mz䄉~U���
���D���6�8� �τ�P8W/8ld�h	�\p�	������n���ؖU��;�_ŋ�?#W�Q�<P�r=oa<+%o󱙖�����䱕�%E�����9R��P���!�v��njDr�{�?���bNt���CE�=���      ;   W   x�M�;�  Й�D-F6��Ԋ>��d~�A�*v�.��G�=q�K����ߘ�Y2��ء��_	��4�kI2����"9      =   _   x�3�45�4�420�4���KO��L-:�6Q!%U!8?��<�(U�3�3� =�89ѡ4%5W/5�T/9������78܈3)71�(��4E]� ��      ?   K  x��Z�n�6>;OA��4���c�^�ͺ�m�pzj�(h��R�����.�ާ���#�M�$��d[��Dq~6)8�#�����f8�=�\<��u�P��iȢ�;�j}�;c�x/ɯ�=�_�x�F�z�J��G��Dyp=�	;Q��|�$�Ļ�w.�v���	�ӄ	�~�����[�{b�,�H5#L�1F{��&9�W��@���җ\�{q���h������6���A���TAa���Qf�H~�I
O5{I���Ox��V��fT�EL���hP5u�|E.�R�� I�v�MBI�|C�*���j�+ce�$�Hm�:��E�f��A.�f�3�DZ�Be��Y�H�!�° [&L�̈́Z���@�"ӫ/���X�"�� �UeeWe�+�XRxpZ7�cAey���8~��T���&��D�J�H3�)���
���ó�X(�W�b)\/
�:��p�Y���l�m`.�Ŝ�2���?��XIC��*�Y�9�U4�Ek8�M�gS��!LF��Ff��!�
�F-�0�t��«�,F. -��v�-�:\��MI�Y#sP�Bǥ��x�,H�Q�ATn����B�3>�ͳ��C�	e�A���se�q$$͊˵��
a(��*,X%(�E(��)U^̊9Ϙ�1E � ��� ���0� /;��~U��W�|tFEz� ,�4��ܥLp�A�S�fR�!�L���ͳ	�	v~��k�Up�� �>'���n�a��xf ����!b�P��Ux5n.ق�.��*��1ߨ�FÒ�8�����@� 3;�����o}7<my!m�4f�5#.aB�,�:}J�W��Ua� VD�"�u�d�OR6��iD�搒+-������N�%�9���Z��n���O�]C�p?Q	��A~�ٶѵ8���v�~~���20k�O:�+D��-�]�o��.~{�ۼ�Bp]?���wH�����
���G:�q����������c��ݪ�����N��#�R��T-��1Ľ*�ޓ=�T ���^{r �)_�\TŚ��D� ���~��%x��
��8JЩ]mi�|K��.��-����C6����it�骛��骛��骛��骛��骛��Q�j�<x��u>^�1.z�ۗ-�Ek<��;�x����p뇔�f�\��/����	g�W�.v1�n��?�n���p�Zס���k�����P���
��ᛟ�~�߼�x�,\=�m>�1���U�Y��Y��*w�Y���t7�mJwS��?t��7�ݽ��M]��ze�!�FTg�G�Gt�W���ˁ=�c�[�@��Ԥ�l M5it�iDkHy�.�����lmm�\�?)      A   Z  x��TQn�0��S��lU��c��`��Y�D��2�PS'a��z�=S/�6[�ubi���͛��Ƹ���T����dW(cG��x }	�s�S��)�D���0�&��g-��"�V[s�;Uo�ڸ}�, �1 3*%�𗋳�^29������>^�tEf,�{R��,�t*I� ��gW��v�o�'���I�A Y�&d1,���#Dq�K�}�J=�Zه�N�� ]������rTNzo�x�W�9:�� C s�P� ���j�Ҹ���4�"�J2J�\�"��9�F^�8^^�%�|��t��xy"tQ�h����9�V��n|����}2�=H�%�oF�؁M٫2���6k}�1��=R3�K�1l�'J6��W�ʟ�^U���+1j��'1K�0���P5N�U��4�.F:o�d�a��K1�����h�Ue���_MN���8�t=9O2�Y��$�Bv��b��a�p5�^	l�*�D��i7�n�\W��y�5eX�$nw�?c��X�ӌo?��dg�1}Z4o��f�������������'A$1ß���Aǵy���(��U��G��
�֒��^�����o��p��D��     