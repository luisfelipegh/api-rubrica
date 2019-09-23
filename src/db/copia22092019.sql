PGDMP     1    1                w            rubrica    11.5    11.5 .    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    17051    rubrica    DATABASE     e   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE rubrica;
             luisfelipegarciaherrera    false            �            1259    17052    equipos    TABLE     �   CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.equipos;
       public         postgres    false            �            1259    17055    equipos_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.equipos_codigo_seq;
       public       postgres    false    196            �           0    0    equipos_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;
            public       postgres    false    197            �            1259    17057    estudiantes    TABLE     �   CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         postgres    false            �            1259    17128    estudiantes_equipos    TABLE     �   CREATE TABLE public.estudiantes_equipos (
    equipo integer NOT NULL,
    grupo character varying(2044) NOT NULL,
    estudiante character varying(2044) NOT NULL,
    id integer NOT NULL
);
 '   DROP TABLE public.estudiantes_equipos;
       public         postgres    false            �            1259    17144    estudiantes_equipos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estudiantes_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.estudiantes_equipos_id_seq;
       public       postgres    false    204            �           0    0    estudiantes_equipos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.estudiantes_equipos_id_seq OWNED BY public.estudiantes_equipos.id;
            public       postgres    false    205            �            1259    17063    grupos    TABLE     �   CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);
    DROP TABLE public.grupos;
       public         postgres    false            �            1259    17069    grupos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grupos_id_seq;
       public       postgres    false    199            �           0    0    grupos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;
            public       postgres    false    200            �            1259    17071    rubricas    TABLE     �   CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    semestre numeric(5,0) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.rubricas;
       public         postgres    false            �            1259    17077    rubricas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.rubricas_id_seq;
       public       postgres    false    201            �           0    0    rubricas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;
            public       postgres    false    202            �            1259    17079    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false                       2604    17082    equipos codigo    DEFAULT     p   ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);
 =   ALTER TABLE public.equipos ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    197    196                       2604    17146    estudiantes_equipos id    DEFAULT     �   ALTER TABLE ONLY public.estudiantes_equipos ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_equipos_id_seq'::regclass);
 E   ALTER TABLE public.estudiantes_equipos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204                       2604    17083 	   grupos id    DEFAULT     f   ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);
 8   ALTER TABLE public.grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199                       2604    17084    rubricas id    DEFAULT     j   ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);
 :   ALTER TABLE public.rubricas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �          0    17052    equipos 
   TABLE DATA               8   COPY public.equipos (codigo, grupo, nombre) FROM stdin;
    public       postgres    false    196   `4       �          0    17057    estudiantes 
   TABLE DATA               B   COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
    public       postgres    false    198   �4       �          0    17128    estudiantes_equipos 
   TABLE DATA               L   COPY public.estudiantes_equipos (equipo, grupo, estudiante, id) FROM stdin;
    public       postgres    false    204   �5       �          0    17063    grupos 
   TABLE DATA               H   COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
    public       postgres    false    199   �5       �          0    17071    rubricas 
   TABLE DATA               M   COPY public.rubricas (nombre, semestre, creador, json, id, tipo) FROM stdin;
    public       postgres    false    201   g6       �          0    17079    usuarios 
   TABLE DATA               D   COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
    public       postgres    false    203   �9       �           0    0    equipos_codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipos_codigo_seq', 5, true);
            public       postgres    false    197            �           0    0    estudiantes_equipos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.estudiantes_equipos_id_seq', 9, true);
            public       postgres    false    205            �           0    0    grupos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grupos_id_seq', 2, true);
            public       postgres    false    200            �           0    0    rubricas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rubricas_id_seq', 9, true);
            public       postgres    false    202                       2606    17086    equipos equipos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public         postgres    false    196    196                       2606    17088    estudiantes estudiantes_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);
 D   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pk;
       public         postgres    false    198    198    198                       2606    17090    grupos grupos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public         postgres    false    199                       2606    17181 *   estudiantes_equipos pk_estudiantes_equipos 
   CONSTRAINT     w   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT pk_estudiantes_equipos PRIMARY KEY (grupo, estudiante);
 T   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT pk_estudiantes_equipos;
       public         postgres    false    204    204                       2606    17183    rubricas rubricas_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (nombre, creador);
 @   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT rubricas_pkey;
       public         postgres    false    201    201                       2606    17094    rubricas unique_rubricas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT unique_rubricas_id;
       public         postgres    false    201                       2606    17096    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    203            #           2606    17097    rubricas creador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT creador;
       public       postgres    false    3100    203    201                        2606    17102 %   estudiantes estudiantes_estudiante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 O   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_estudiante_fk;
       public       postgres    false    198    3100    203            !           2606    17107     estudiantes estudiantes_grupo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 J   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_grupo_fk;
       public       postgres    false    3094    198    199                       2606    17112    equipos grupo    FK CONSTRAINT     o   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 7   ALTER TABLE ONLY public.equipos DROP CONSTRAINT grupo;
       public       postgres    false    199    196    3094            %           2606    17139 #   estudiantes_equipos grupos_est_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_est_fkey FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 M   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_est_fkey;
       public       postgres    false    3100    203    204            "           2606    17117    grupos grupos_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    203    3100    199            $           2606    17134    estudiantes_equipos grupos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (equipo, grupo) REFERENCES public.equipos(codigo, grupo);
 I   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    3090    204    204    196    196            �   4   x�3�45�4�t-,�,�W0�2B�)p�s���M�L�|K��=... �a      �   �   x�u��n�0E��c�8`��uY�7t�T��$��#������P����ѽ3jSoV�]"D�mz䄉~U���
���D���6�8� �τ�P8W/8ld�h	�\p�	������n���ؖU��;�_ŋ�?#W�Q�<P�r=oa<+%o󱙖�����䱕�%E�����9R��P���!�v��njDr�{�?���bNt���CE�=���      �   W   x�M�;�  Й�D-F6��Ԋ>��d~�A�*v�.��G�=q�K����ߘ�Y2��ء��_	��4�kI2����"9      �   _   x�3�45�4�420�4���KO��L-:�6Q!%U!8?��<�(U�3�3� =�89ѡ4%5W/5�T/9������78܈3)71�(��4E]� ��      �   K  x��V�n1>'Oa함�� �^� ��G�a�DS�����Q%�<��y���f��)�pBBj�����3=YM9��������$�@�pZ���aZ�i�yHNф�X�{H(����J,dȏə�NSFh��'��@�̔���y�o�@-1�+4*����򡀳o��Up��#xTh�ϳC|Cv���Ͼ������"�;��-dd<݃��w�<��6ٝ���Ƥ�+�����
�,rx��c���g�x�<ɖWh0�B��t���C��a�u��ߔT�.J�M)��3��m��5�*VI��4
w�$\�{�!N�I�:BZ)hb#O��X�J��fI+�m��cCBș�F�/��[fL�B��W��2�Q���T��l5����ZyVĲ����s�P�� )��oʊ}��bБ��s�7dv��r�#.���%�%1�@a7���N�c���r3'�N�������͝0��\�0k��ќ���D1�a[���X1^"sA��/(�MP��ʰ!|=��ffhw���f��Ʒ�mPa�s|n)�.[9[��Q�>����:�zY�t��лW�rE&\�'�QO.p�BHY.���U};�b�]؊`���lC�������Y3�Yj�+F���Y��G�� ��k��U;�W��S0�߈��i�9#�%ҥB�p�s�CL��M���,����:�����?i]}����$-��	�S3zW{�1^^�
&��2����G����jCaWfZ�qs�Uu݈�z�D��o�vDLl^�Y\�'�c�u�M�r�MR��,��џB���e�?y]��򿋯u�U{]]�-V��b��luT��j�������      �   Z  x��TQn�0��S��lU��c��`��Y�D��2�PS'a��z�=S/�6[�ubi���͛��Ƹ���T����dW(cG��x }	�s�S��)�D���0�&��g-��"�V[s�;Uo�ڸ}�, �1 3*%�𗋳�^29������>^�tEf,�{R��,�t*I� ��gW��v�o�'���I�A Y�&d1,���#Dq�K�}�J=�Zه�N�� ]������rTNzo�x�W�9:�� C s�P� ���j�Ҹ���4�"�J2J�\�"��9�F^�8^^�%�|��t��xy"tQ�h����9�V��n|����}2�=H�%�oF�؁M٫2���6k}�1��=R3�K�1l�'J6��W�ʟ�^U���+1j��'1K�0���P5N�U��4�.F:o�d�a��K1�����h�Ue���_MN���8�t=9O2�Y��$�Bv��b��a�p5�^	l�*�D��i7�n�\W��y�5eX�$nw�?c��X�ӌo?��dg�1}Z4o��f�������������'A$1ß���Aǵy���(��U��G��
�֒��^�����o��p��D��     