PGDMP     3                 	    w            rubrica    11.5    11.5 A    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    17051    rubrica    DATABASE     e   CREATE DATABASE rubrica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE rubrica;
             luisfelipegarciaherrera    false            ?            1259    17198    actividades    TABLE     ?   CREATE TABLE public.actividades (
    rubrica integer NOT NULL,
    nombre character varying(100) NOT NULL,
    id integer NOT NULL,
    creador character varying(100) NOT NULL
);
    DROP TABLE public.actividades;
       public         postgres    false            ?            1259    17201    actividades_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.actividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.actividades_id_seq;
       public       postgres    false    206            ?           0    0    actividades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.actividades_id_seq OWNED BY public.actividades.id;
            public       postgres    false    207            ?            1259    17298    calificaciones    TABLE     J  CREATE TABLE public.calificaciones (
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
       public         postgres    false            ?            1259    17296    calificaciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.calificaciones_id_seq;
       public       postgres    false    209            ?           0    0    calificaciones_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;
            public       postgres    false    208            ?            1259    17052    equipos    TABLE     ?   CREATE TABLE public.equipos (
    codigo integer NOT NULL,
    grupo character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.equipos;
       public         postgres    false            ?            1259    17055    equipos_codigo_seq    SEQUENCE     ?   CREATE SEQUENCE public.equipos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.equipos_codigo_seq;
       public       postgres    false    196            ?           0    0    equipos_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.equipos_codigo_seq OWNED BY public.equipos.codigo;
            public       postgres    false    197            ?            1259    17057    estudiantes    TABLE     ?   CREATE TABLE public.estudiantes (
    grupo character varying NOT NULL,
    estudiante character varying NOT NULL,
    semestre numeric(5,0) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         postgres    false            ?            1259    17128    estudiantes_equipos    TABLE     ?   CREATE TABLE public.estudiantes_equipos (
    equipo integer NOT NULL,
    grupo character varying(2044) NOT NULL,
    estudiante character varying(2044) NOT NULL,
    id integer NOT NULL
);
 '   DROP TABLE public.estudiantes_equipos;
       public         postgres    false            ?            1259    17144    estudiantes_equipos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.estudiantes_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.estudiantes_equipos_id_seq;
       public       postgres    false    204            ?           0    0    estudiantes_equipos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.estudiantes_equipos_id_seq OWNED BY public.estudiantes_equipos.id;
            public       postgres    false    205            ?            1259    17063    grupos    TABLE     ?   CREATE TABLE public.grupos (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    semestre character varying(2044) NOT NULL,
    nombre character varying(2044) NOT NULL,
    profesor character varying(2044) NOT NULL
);
    DROP TABLE public.grupos;
       public         postgres    false            ?            1259    17069    grupos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grupos_id_seq;
       public       postgres    false    199            ?           0    0    grupos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;
            public       postgres    false    200            ?            1259    17071    rubricas    TABLE     ?   CREATE TABLE public.rubricas (
    nombre character varying(100) NOT NULL,
    creador character varying(100) NOT NULL,
    json jsonb NOT NULL,
    id integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.rubricas;
       public         postgres    false            ?            1259    17077    rubricas_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.rubricas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.rubricas_id_seq;
       public       postgres    false    201            ?           0    0    rubricas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.rubricas_id_seq OWNED BY public.rubricas.id;
            public       postgres    false    202            ?            1259    17079    usuarios    TABLE     ?   CREATE TABLE public.usuarios (
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    contrasena character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false                       2604    17203    actividades id    DEFAULT     p   ALTER TABLE ONLY public.actividades ALTER COLUMN id SET DEFAULT nextval('public.actividades_id_seq'::regclass);
 =   ALTER TABLE public.actividades ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206                       2604    17301    calificaciones id    DEFAULT     v   ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);
 @   ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209                       2604    17204    equipos codigo    DEFAULT     p   ALTER TABLE ONLY public.equipos ALTER COLUMN codigo SET DEFAULT nextval('public.equipos_codigo_seq'::regclass);
 =   ALTER TABLE public.equipos ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    197    196                       2604    17205    estudiantes_equipos id    DEFAULT     ?   ALTER TABLE ONLY public.estudiantes_equipos ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_equipos_id_seq'::regclass);
 E   ALTER TABLE public.estudiantes_equipos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204                       2604    17206 	   grupos id    DEFAULT     f   ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);
 8   ALTER TABLE public.grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199                       2604    17207    rubricas id    DEFAULT     j   ALTER TABLE ONLY public.rubricas ALTER COLUMN id SET DEFAULT nextval('public.rubricas_id_seq'::regclass);
 :   ALTER TABLE public.rubricas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            ?          0    17198    actividades 
   TABLE DATA               C   COPY public.actividades (rubrica, nombre, id, creador) FROM stdin;
    public       postgres    false    206   L       ?          0    17298    calificaciones 
   TABLE DATA               i   COPY public.calificaciones (id, actividad, tipo, calificado, nota, profesor, rubrica, grupo) FROM stdin;
    public       postgres    false    209   {L       ?          0    17052    equipos 
   TABLE DATA               8   COPY public.equipos (codigo, grupo, nombre) FROM stdin;
    public       postgres    false    196   ?R       ?          0    17057    estudiantes 
   TABLE DATA               B   COPY public.estudiantes (grupo, estudiante, semestre) FROM stdin;
    public       postgres    false    198   ?R       ?          0    17128    estudiantes_equipos 
   TABLE DATA               L   COPY public.estudiantes_equipos (equipo, grupo, estudiante, id) FROM stdin;
    public       postgres    false    204   ?S       ?          0    17063    grupos 
   TABLE DATA               H   COPY public.grupos (id, codigo, semestre, nombre, profesor) FROM stdin;
    public       postgres    false    199   DT       ?          0    17071    rubricas 
   TABLE DATA               C   COPY public.rubricas (nombre, creador, json, id, tipo) FROM stdin;
    public       postgres    false    201   ?T       ?          0    17079    usuarios 
   TABLE DATA               D   COPY public.usuarios (correo, nombre, contrasena, tipo) FROM stdin;
    public       postgres    false    203   F[       ?           0    0    actividades_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.actividades_id_seq', 4, true);
            public       postgres    false    207            ?           0    0    calificaciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.calificaciones_id_seq', 6, true);
            public       postgres    false    208            ?           0    0    equipos_codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipos_codigo_seq', 6, true);
            public       postgres    false    197            ?           0    0    estudiantes_equipos_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.estudiantes_equipos_id_seq', 11, true);
            public       postgres    false    205            ?           0    0    grupos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grupos_id_seq', 2, true);
            public       postgres    false    200            ?           0    0    rubricas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.rubricas_id_seq', 16, true);
            public       postgres    false    202            /           2606    17209    actividades actividades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividades_pkey;
       public         postgres    false    206            1           2606    17306 "   calificaciones calificaciones_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public         postgres    false    209            !           2606    17086    equipos equipos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (codigo, grupo);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public         postgres    false    196    196            #           2606    17088    estudiantes estudiantes_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (grupo, estudiante, semestre);
 D   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pk;
       public         postgres    false    198    198    198            %           2606    17090    grupos grupos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public         postgres    false    199            -           2606    17181 *   estudiantes_equipos pk_estudiantes_equipos 
   CONSTRAINT     w   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT pk_estudiantes_equipos PRIMARY KEY (grupo, estudiante);
 T   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT pk_estudiantes_equipos;
       public         postgres    false    204    204            '           2606    17185    rubricas rubricas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT rubricas_pkey;
       public         postgres    false    201            )           2606    17094    rubricas unique_rubricas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT unique_rubricas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT unique_rubricas_id;
       public         postgres    false    201            +           2606    17096    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (correo);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    203            9           2606    17210     actividades actividad_creador_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_creador_fk FOREIGN KEY (creador) REFERENCES public.usuarios(correo);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_creador_fk;
       public       postgres    false    206    3115    203            :           2606    17215     actividades actividad_rubrica_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_rubrica_fk FOREIGN KEY (rubrica) REFERENCES public.rubricas(id);
 J   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividad_rubrica_fk;
       public       postgres    false    201    3113    206            ;           2606    17307 (   calificaciones calificacion_actividad_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_actividad_fk FOREIGN KEY (actividad) REFERENCES public.actividades(id);
 R   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_actividad_fk;
       public       postgres    false    209    3119    206            =           2606    17317 $   calificaciones calificacion_grupo_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 N   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_grupo_fk;
       public       postgres    false    199    209    3109            <           2606    17312 '   calificaciones calificacion_profesor_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificacion_profesor_fk FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 Q   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificacion_profesor_fk;
       public       postgres    false    203    209    3115            6           2606    17097    rubricas creador    FK CONSTRAINT     ?   ALTER TABLE ONLY public.rubricas
    ADD CONSTRAINT creador FOREIGN KEY (creador) REFERENCES public.usuarios(correo) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.rubricas DROP CONSTRAINT creador;
       public       postgres    false    203    201    3115            3           2606    17102 %   estudiantes estudiantes_estudiante_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_estudiante_fk FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 O   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_estudiante_fk;
       public       postgres    false    3115    203    198            4           2606    17107     estudiantes estudiantes_grupo_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_grupo_fk FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 J   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_grupo_fk;
       public       postgres    false    199    3109    198            2           2606    17112    equipos grupo    FK CONSTRAINT     o   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT grupo FOREIGN KEY (grupo) REFERENCES public.grupos(codigo);
 7   ALTER TABLE ONLY public.equipos DROP CONSTRAINT grupo;
       public       postgres    false    196    3109    199            8           2606    17139 #   estudiantes_equipos grupos_est_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_est_fkey FOREIGN KEY (estudiante) REFERENCES public.usuarios(correo);
 M   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_est_fkey;
       public       postgres    false    3115    204    203            5           2606    17117    grupos grupos_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (profesor) REFERENCES public.usuarios(correo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    203    199    3115            7           2606    17134    estudiantes_equipos grupos_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.estudiantes_equipos
    ADD CONSTRAINT grupos_fkey FOREIGN KEY (equipo, grupo) REFERENCES public.equipos(codigo, grupo);
 I   ALTER TABLE ONLY public.estudiantes_equipos DROP CONSTRAINT grupos_fkey;
       public       postgres    false    3105    204    204    196    196            ?   V   x?34?t?+)JMOT(.W0?4?L?M?+?,,Mu(MI??KM)?K??24??.W0?4?L/HO,NNDW??\R?T??`?i?UI? ??$?      ?     x??Z?r?6]?_??????v6a%?e?Ȫd{?6??T($? ?7?????'?????'??^?Q??kg??L?р pϹ?+?UiU?#?b?$7????a>?5?ǯ'?n?f^E???I0???u??F??T>kL;??QG;iT5?9tZ[?ֵ?&?[p#?z??	C>?Fj??'ħ?????!h???G?	??`V?٘?aޚ????3r?gl?tF줶?r?M,?`4????<qjc?s?8??63??@?? V??Kǰ?M?/7tɌ?B;?9??Ǟ|??|fS??d꽐L?$?+??H ?=u?%B?)????ۄ#?? ?ב?? ???dT??_??0[?'t??l?$?q??Si_C?ZK?y?Yxo?G]?9?p???ajS?N6?qS??r`/?G.?ƌ{?z?'`.???>p?	???????9?DHP???ܚ??
??}`??ud?B???F\??Qb??oP??@}AA{??>?,????u???Q?Qɘh?b?8?E??^1????A!??W?:L?????Y-;?.|??a??ݰ?Q?F?/??l?v$??@?Sdy???!;Q?$HqL ?Mq??fs?a?.2>fxHaIAž???عU@?nj?5S"1
??Q??0?б?N~#?~?&????̀?d?E>?
?|,?+?LDaK"]??`n??????춲52N;?1????v?x?BW?7F!%^ =UI?BU~c?9?#.?X???o#>?mC6???Xӏ?XӳX?	????????d?
e?B??	 +??:?GJ???6???Bv??vנ_?J???ӥ?F?t*p??:S?.???? O ?dM??m,b[+?ܑ)???bb?????fh?v??yzq?K?????Y?@?@c??XA??CD8????
J???v@?.??>?oSAlȈ?FԖ1??FVw?{6????G??
>???Ȕqx?Z9m5??A?ZcS֡YMP9?ߦQ??3??@?JU?*8G?[?qN??ݨ?a?D
?F?v?A??g?S???<=Gg???1=??=?nn*r?]?s*???Z???i???N???????f)?}@)??_J??? {""?P??.?Dp!?J\???%?wV?{?Rk?B??4????;??+z7?h???ĥ?`??-?KZ99??t?????<5?@ߙ??90R?|f?Mṅ?*?/A`ǣʹ?^?^\v-?wa????8a?n7f??????eF?????	u?+???????LA????=???C????#ۏr?o??Y?????Q_v-??K??c?{2??/h?z??{=g?橙??þ?Vǘ?i\AȜ??+???V????ݚ?0n???W
3R=?C?A$?b?x??1?*z??~|?dy??U??©????e7[v????????v???Z7[$?%t???N??>?n??^?4?;?t???{\?liNS?~X??w:???wUz???J?????s?Kj?껼Kj???T???U/?.?T??\}?>9???'??z?t??y?T?%?wI??.)i&?????>      ?   4   x?3?45?4?t-,?,?W0?2B?)p?s???M?L?|K??=... ?a      ?   ?   x????j?0???Ø8m ?%??v?t??`????u?`?e????0?p`????~?ީ݆???(?v??0a?T?TUQ??!?C?(??????	<
??Ԋ??-??+?.?5q??????Q?ue????^?g????o?O????-?'ຖ?|l??3???	fXir???Èy?%b?<Y?u?GG?a???[6"????`y??!E:ᔱ4?_??EQ?j      ?   p   x?M?;?0 ?9>LDJR??A??C>(??C???=o????臣?`%A?mZJ?T?y@?o??]2ZƦ<???vbf???č??|I.zHƮo????<????V?, |?S4?      ?   _   x?3?45?4?420?4???KO??L-:?6Q!%U!8???<?(U?3?3? =?89ѡ4%5W/5?T/9??????78܈3)71?(??4E]? ??      ?   ?  x????n?6???? t?,??uڛ?mVhS#?Ֆa?e&`F?*)eI? ??S?v1??&{??C9?щl'????.M?_???Ҿ?I$S?'?	??E?%??V?_%΄?????@??p?	?|??DG2?"?t ??ĉ6R?.?Q&u?3?[??Tע2q?????P?0L(????oi???>3???߹L$n????}#??Ha???S??_&?\?*??X*ɍ??#y?O\n?:???2y,#n?????6q!?%? ?????ǟ?k?m?Emኈ+9?òM/Y??????%?`?|?e&?,7ΰ3i3???;VM???v^?(	ӝ?.p???ũ?u?
?H°???'???P;[?"BcK?!-?0vv?	23?Dr??4\}?2???rt??`\U??.?&?Qf2??F??}_?dy?Hq????3nђ<?????>?c???AWPУ?y?????,q*\ۥpJ??J?X?z?b?M?\??k?\?cY?6?r7Չ??2W83Gn?Z??,'????ur.F???J??*?s?IXD`??2;????x?ؠ???jan??<?-?6g?q???}??鸔N
???j?q?Hd?,ۥ8?????r??vr?m?R[P??˭?yӄ^r?UI?5eʳ?)׳4dj???Yu?g??4E?AxƱ@??3ۀ???|ԯʚwJ???q?/?IOC???????ˎ???S׈O?0Pfv??f?ف8V?|??ՋD?Yp???~?@?5]?Fz????
p(|p??S؟???jܽ?wqf?ch??FU??s????qv8? y!?ܥ?f??
.??????F0???¼??X&pA???R?S?W????::????T7?cVB?	??d? ??x?(]?tj?k?1???ja?<uzz?????}?3??L&?k??U4??j???N?ޗ?8?t?zqO]?ݚ??=n??????Zn?Ѿ,k=YW??}l?B?h ^??}?{??nWS??]}v?Z_?}N??`{U??޶3}??Yu3o??q?N??NK?C?*?X0??ᵦZ??~?d?q!g)>p?M????;??pޡ?`?-M??
???????????? 둠?/?6???????~????????????ŀ71O??P=?;???E?MB?;Q??\/??>Iv?ɰ??/%Բ???<6t=)?^3?Y
?w?	{Ԟ???j? $?s?] ??I??k???ʫ??????w??N????@???g?b0\?j 쵢>
?Eգ?3?=KTMTMTMTMTMTMTMTMTMT}?T????lŮ>???p?e|??????????ɮ
???a?j?j?j?j?j?j?j?j?j??{??\?T????5*o!??z?e?i?v]?J???{?nG/?S??+\֟:??F?}?uk0N?|?zgs?o?W??? ???R?c????[ZC?en`Ƣ???׌?[??qm?G?c???ã????[n;?;?????~???;??????A????bZ?z?=?U?O??:????]??Q???}???^wۃ?????????=???޷?K??j?z?>??}O??Q?R?R?????????z??qZ?ڭ?dpv톞?o??????j????~8???z4:?>??`??????7qmmll??RuK      ?   Z  x??TQn?0??S??lU??c??`??Y?D??2?PS'a??z?=S/?6[?ubi???͛??Ƹ????T????dW(cG??x }	?s?S??)?D???0??&??g-??"?V[s?;Uo?ڸ}?, ?1 3*%?𗋳?^29??????>^?tEf,?{R??,?t*I? ??gW??v?o?'????I?A Y?&d1,???#Dq?K?}?J=?Zه?N?? ]??????rTNzo?x?W?9:?? C s?P? ???j?Ҹ???4?"?J2J?\?"??9?F^?8^^?%?|??t??xy"tQ?h????9?V??n|?????}2??=H?%?oF?؁M٫2???6k}?1??=R3?K?1l?'J6??W?ʟ??^U???+1j???'1K?0???P5N?U??4?.F:o?d?a???K1?????h?Ue???_MN????8?t=9O2?Y??$?Bv??b??a?p5?^	l?*?D??i7?n?\W??y?5eX?$nw??c??X?ӌo???dg?1}Z4o??f??????????????'A$1ß????Aǵy????(???U??G??
?֒??^?????o??p??D??     