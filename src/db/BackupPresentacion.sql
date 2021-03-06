PGDMP         -            	    w            rubrica    11.3    11.3 A    U           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            V           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            W           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            X           1262    19281    rubrica    DATABASE     ?   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE rubrica;
             postgres    false            ?            1259    19282    actividades    TABLE     ?   CREATE TABLE public.actividades (
    rubrica integer NOT NULL,
    nombre character varying(100) NOT NULL,
    id integer NOT NULL,
    creador character varying(100) NOT NULL
);
    DROP TABLE public.actividades;
       public         postgres    false            ?            1259    19285    actividades_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.actividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.actividades_id_seq;
       public       postgres    false    196            Y           0    0    actividades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.actividades_id_seq OWNED BY public.actividades.id;
            public       postgres    false    197            ?            1259    19287    calificaciones    TABLE     J  CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    actividad integer NOT NULL,
    tipo character varying NOT NULL,
    calificado character varying(100) NOT NULL,
    nota numeric(10,2) NOT NULL,
    profesor character varying(100) NOT NULL,
    rubrica json NOT NULL,
    grupo character varying(100) NOT NULL
);
 "   DROP TABLE public.calificaciones;
       public         postgres    false            ?            1259    19293    calificaciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.calificaciones_id_seq;
       public       postgres    false    198            Z           0    0    calificaciones_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;
            public       postgres    false    199            ?            1259    19295    equipos    TABLE     ?   CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.equipos;
       public         postgres    false            ?            1259    19298    equipos_codigo_seq    SEQUENCE     ?   CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.equipos_codigo_seq;
       public       postgres    false    200            [           0    0    equipos_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;
            public       postgres    false    201            ?            1259    19300    estudiantes    TABLE     ?   CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         postgres    false            ?            1259    19306    estudiantes_equipos    TABLE     ?   CREATE TABLE public.estudiantes_equipos (
    equipo integer NOT NULL,
    grupo character varying(2044) NOT NULL,
    estudiante character varying(2044) NOT NULL,
    id integer NOT NULL
);
 '   DROP TABLE public.estudiantes_equipos;
       public         postgres    false            ?            1259    19312    estudiantes_equipos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.estudiantes_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.estudiantes_equipos_id_seq;
       public       postgres    false    203            \           0    0    estudiantes_equipos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.estudiantes_equipos_id_seq OWNED BY public.estudiantes_equipos.id;
            public       postgres    false    204            ?            1259    19314    grupos    TABLE     ?   CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);
    DROP TABLE public.grupos;
       public         postgres    false            ?            1259    19320    grupos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grupos_id_seq;
       public       postgres    false    205            ]           0    0    grupos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;
            public       postgres    false    206            ?            1259    19322    rubricas    TABLE     ?   CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.rubricas;
       public         postgres    false            ?            1259    19328    rubricas_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.rubricas_id_seq;
       public       postgres    false    207            ^           0    0    rubricas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;
            public       postgres    false    208            ?            1259    19330    usuarios    TABLE     ?   CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false            ?
           2604    19333    actividades id    DEFAULT     p   ALTER TABLE ONLY public.actividades ALTER COLUMN id SET DEFAULT nextval('public.actividades_id_seq'::regclass);
 =   ALTER TABLE public.actividades ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            ?
           2604    19334    calificaciones id    DEFAULT     v   ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);
 @   ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            ?
           2604    19335    equipos codigo    DEFAULT     p   ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);
 =   ALTER TABLE public.equipos ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    201    200            ?
           2604    19336    estudiantes_equipos id    DEFAULT     ?   ALTER TABLE ONLY public.estudiantes_equipos ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_equipos_id_seq'::regclass);
 E   ALTER TABLE public.estudiantes_equipos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            ?
           2604    19337 	   grupos id    DEFAULT     f   ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);
 8   ALTER TABLE public.grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    205            ?
           2604    19338    rubricas id    DEFAULT     j   ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);
 :   ALTER TABLE public.rubricas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    207            E          0    19282    actividades 
   TABLE DATA               C   COPY public.actividades (rubrica, nombre, id, creador) FROM stdin;
    public       postgres    false    196   &L       G          0    19287    calificaciones 
   TABLE DATA               i   COPY public.calificaciones (id, actividad, tipo, calificado, nota, profesor, rubrica, grupo) FROM stdin;
    public       postgres    false    198   ?L       I          0    19295    equipos 
   TABLE DATA               8   COPY public.equipos (codigo, grupo, nombre) FROM stdin;
    public       postgres    false    200   ?R       K          0    19300    estudiantes 
   TABLE DATA               B   COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
    public       postgres    false    202   S       L          0    19306    estudiantes_equipos 
   TABLE DATA               L   COPY public.estudiantes_equipos (equipo, grupo, estudiante, id) FROM stdin;
    public       postgres    false    203   ?S       N          0    19314    grupos 
   TABLE DATA               H   COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
    public       postgres    false    205   rT       P          0    19322    rubricas 
   TABLE DATA               C   COPY public.rubricas (nombre, creador, json, id, tipo) FROM stdin;
    public       postgres    false    207   ?T       R          0    19330    usuarios 
   TABLE DATA               D   COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
    public       postgres    false    209   ?Z       _           0    0    actividades_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.actividades_id_seq', 4, true);
            public       postgres    false    197            `           0    0    calificaciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.calificaciones_id_seq', 6, true);
            public       postgres    false    199            a           0    0    equipos_codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipos_codigo_seq', 6, true);
            public       postgres    false    201            b           0    0    estudiantes_equipos_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.estudiantes_equipos_id_seq', 11, true);
            public       postgres    false    204            c           0    0    grupos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grupos_id_seq', 2, true);
            public       postgres    false    206            d           0    0    rubricas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.rubricas_id_seq', 16, true);
            public       postgres    false    208            ?
           2606    19341    actividades actividades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividades_pkey;
       public         postgres    false    196            ?
           2606    19343 "   calificaciones calificaciones_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public         postgres    false    198            ?
           2606    19345    equipos equipos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public         postgres    false    200    200            ?
           2606    19347    estudiantes estudiantes_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);
 D   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pk;
       public         postgres    false    202    202    202            ?
           2606    19349    grupos grupos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public         postgres    false    205            ?
           2606    19351 *   estudiantes_equipos pk_estudiantes_equipos 
   CONSTRAINT     w   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT pk_estudiantes_equipos PRIMARY KEY (grupo, estudiante);
 T   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT pk_estudiantes_equipos;
       public         postgres    false    203    203            ?
           2606    19353    rubricas rubricas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT rubricas_pkey;
       public         postgres    false    207            ?
           2606    19355    rubricas unique_rubricas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT unique_rubricas_id;
       public         postgres    false    207            ?
           2606    19357    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    209            ?
           2606    19358     actividades actividad_creador_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_creador_fk FOREIGN KEY (creador) REFERENCES public.usuarios(correo);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_creador_fk;
       public       postgres    false    2751    209    196            ?
           2606    19363     actividades actividad_rubrica_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_rubrica_fk FOREIGN KEY (rubrica) REFERENCES public.rubricas(id);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_rubrica_fk;
       public       postgres    false    2747    207    196            ?
           2606    19368 (   calificaciones calificacion_actividad_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_actividad_fk FOREIGN KEY (actividad) REFERENCES public.actividades(id);
 R   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_actividad_fk;
       public       postgres    false    2735    196    198            ?
           2606    19373 $   calificaciones calificacion_grupo_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 N   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_grupo_fk;
       public       postgres    false    2745    205    198            ?
           2606    19378 '   calificaciones calificacion_profesor_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_profesor_fk FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 Q   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_profesor_fk;
       public       postgres    false    198    209    2751            ?
           2606    19383    rubricas creador    FK CONSTRAINT     ?   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT creador;
       public       postgres    false    209    2751    207            ?
           2606    19388 %   estudiantes estudiantes_estudiante_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 O   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_estudiante_fk;
       public       postgres    false    202    2751    209            ?
           2606    19393     estudiantes estudiantes_grupo_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 J   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_grupo_fk;
       public       postgres    false    202    205    2745            ?
           2606    19398    equipos grupo    FK CONSTRAINT     o   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 7   ALTER TABLE ONLY public.equipos DROP CONSTRAINT grupo;
       public       postgres    false    2745    200    205            ?
           2606    19403 #   estudiantes_equipos grupos_est_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_est_fkey FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 M   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_est_fkey;
       public       postgres    false    2751    209    203            ?
           2606    19408    grupos grupos_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    2751    205    209            ?
           2606    19413    estudiantes_equipos grupos_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (equipo, grupo) REFERENCES public.equipos(codigo, grupo);
 I   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    203    203    2739    200    200            E   s   x?34?t?+)JMOT.(??+Q0???4?L/HO,NNt(MI??KM)?K??24?(J-N?+IL???Sp,K?KN??+?4???n?o~JjN~?Bq???gRnb^Qfai*??=... ?1]      G     x??Z?r?6]?_??????v6a%?e?Ȫd{?6??T($? ?7?????'?????'??^?Q??kg??L?р pϹ?+?UiU?#?b?$7????a>?5?ǯ'?n?f^E???I0???u??F??T>kL;??QG;iT5?9tZ[?ֵ?&?[p#?z??	C>?Fj??'ħ?????!h???G?	??`V?٘?aޚ????3r?gl?tF줶?r?M,?`4????<qjc?s?8??63??@?? V??Kǰ?M?/7tɌ?B;?9??Ǟ|??|fS??d꽐L?$?+??H ?=u?%B?)????ۄ#?? ?ב?? ???dT??_??0[?'t??l?$?q??Si_C?ZK?y?Yxo?G]?9?p???ajS?N6?qS??r`/?G.?ƌ{?z?'`.???>p?	???????9?DHP???ܚ??
??}`??ud?B???F\??Qb??oP??@}AA{??>?,????u???Q?Qɘh?b?8?E??^1????A!??W?:L?????Y-;?.|??a??ݰ?Q?F?/??l?v$??@?Sdy???!;Q?$HqL ?Mq??fs?a?.2>fxHaIAž???عU@?nj?5S"1
??Q??0?б?N~#?~?&????̀?d?E>?
?|,?+?LDaK"]??`n??????춲52N;?1????v?x?BW?7F!%^ =UI?BU~c?9?#.?X???o#>?mC6???Xӏ?XӳX?	????????d?
e?B??	 +??:?GJ???6???Bv??vנ_?J???ӥ?F?t*p??:S?.???? O ?dM??m,b[+?ܑ)???bb?????fh?v??yzq?K?????Y?@?@c??XA??CD8????
J???v@?.??>?oSAlȈ?FԖ1??FVw?{6????G??
>???Ȕqx?Z9m5??A?ZcS֡YMP9?ߦQ??3??@?JU?*8G?[?qN??ݨ?a?D
?F?v?A??g?S???<=Gg???1=??=?nn*r?]?s*???Z???i???N???????f)?}@)??_J??? {""?P??.?Dp!?J\???%?wV?{?Rk?B??4????;??+z7?h???ĥ?`??-?KZ99??t?????<5?@ߙ??90R?|f?Mṅ?*?/A`ǣʹ?^?^\v-?wa????8a?n7f??????eF?????	u?+???????LA????=???C????#ۏr?o??Y?????Q_v-??K??c?{2??/h?z??{=g?橙??þ?Vǘ?i\AȜ??+???V????ݚ?0n???W
3R=?C?A$?b?x??1?*z??~|?dy??U??©????e7[v????????v???Z7[$?%t???N??>?n??^?4?;?t???{\?liNS?~X??w:???wUz???J?????s?Kj?껼Kj???T???U/?.?T??\}?>9???'??z?t??y?T?%?wI??.)i&?????>      I   4   x?3?45?4?t-,?,?W0?2B?)p?s???M?L?|K??=... ?a      K   ?   x????j?0???Ø8m ?%??v?t??`????u?`?e????0?p`????~?ީ݆???(?v??0a?T?TUQ??!?C?(??????	<
??Ԋ??-??+?.?5q??????Q?ue????^?g????o?O????-?'ຖ?|l??3???	fXir???Èy?%b?<Y?u?GG?a???[6"????`y??!E:ᔱ4?_??EQ?j      L   p   x?M?;?0 ?9>LDJR??A??C>(??C???=o????臣?`%A?mZJ?T?y@?o??]2ZƦ<???vbf???č??|I.zHƮo????<????V?, |?S4?      N   ^   x?3?45?4?420?4???KO??L-:?6Q!%U!8???<?(U?3?3? =?89ѡ4%5W/5?T/9?????ޜΤ?ļ????T?1z\\\ ?(?      P   ?  x????n?6ǯ?? t?4?l?uқ:YV?:#???h?6?Q?JJY?"???}?]{??ɞd?P?%[r#;?????y??|?????$?H???jX?$ӯ)?q??????	????y|??ē4d??;UR<?L?ʃ???Ti?f7? ?J?J|????|??]?x???ӄ	???on???
^?&??T3¤]?a???p9e?3}??/?n?g???!?ѐN5?H~?????d?Okɟ0?L?h+f;?S??J>u?ʺ?????USR??g???x.c?aϘ?-??X+2??lx??}??	?Y܁??B??U9???????$?Z?p???BvXE4?4.X??????[M????6?'???^??B??!?[?QH???:??????m?σӃM/???9?"??"???^Z;?f????cSq?-??6+?w?|?٤?DP??a?/??s(Xa>&???'?:?Zi??wT`??ο?R?D?W??P?!?1df??W?Ĕt?7į??@s? ?43|? ????q???f??? D??J?l???L?nń*g?y !{>?K*?I???A?I'?4????3,???j\GB?,G?????+I?N?"?\?9?c??.=???]??0s?oȄ??,??R??4t?Ŭ!??Y\?2e8?????T???A?ÆA?p??D.?0'	??f\?\?d??????Q??S??fQyX??Ĝ???;A??x%S?5m??&?씵-??$?^f??ɥ[?w?}CZ?VVe???8tĕ?Q?$mɛ??U??????P?MEŒ?e?%?o?? K?sB)???R?????ۤ??z??ݒ??t??fd??q??q7?????슊?!A?=?????L?R??f@V??????????????v?.?ᖪ]%`&?e?L?y?????c?4?w@????Ԑ]B?׶j??]ы?6?Z?ΣB??"??E??a???
O?)5??*Ƴx??
?1?td??󂼁?;h?op[?Q?Iw?5?p???q??l?َ?g;?v??8?q???]r?ʨ?Z??{??}L??x??O??|؍??:?uH???!?CZ??i??i??:L?ݠ?Q??jGՎ?U;?vT???Q????ܠx?iK?]?8h?7?o6?p=8???????????%?Ώ?_?&?~v
y??`?????????K׺??ۍ%_???(i????Y>@?<?\i~Crw?>?}?)Wo??p??+????wS????C??8וK+Bhޕz??}0???f??%$|b???y?G????^????:6k????-G?ϖ}v7???ZcS?_k???:?l?J&3?z?N%6?????ؽ?(???_a??l1lw?)???????`?.jЮ+?Uk;?N??V??j?yU??????meW??
mr?$?$z?'???R?sYQ?:Du???!?CT??Q?A??X?
???mw????????8??      R   Z  x??TQn?0??S??lU??c??`??Y?D??2?PS'a??z?=S/?6[?ubi???͛??Ƹ????T????dW(cG??x }	?s?S??)?D???0??&??g-??"?V[s?;Uo?ڸ}?, ?1 3*%?𗋳?^29??????>^?tEf,?{R??,?t*I? ??gW??v?o?'????I?A Y?&d1,???#Dq?K?}?J=?Zه?N?? ]??????rTNzo?x?W?9:?? C s?P? ???j?Ҹ???4?"?J2J?\?"??9?F^?8^^?%?|??t??xy"tQ?h????9?V??n|?????}2??=H?%?oF?؁M٫2???6k}?1??=R3?K?1l?'J6??W?ʟ??^U???+1j???'1K?0???P5N?U??4?.F:o?d?a???K1?????h?Ue???_MN????8?t=9O2?Y??$?Bv??b??a?p5?^	l?*?D??i7?n?\W??y?5eX?$nw??c??X?ӌo???dg?1}Z4o??f??????????????'A$1ß????Aǵy????(???U??G??
?֒??^?????o??p??D??     