PGDMP  .    "                |            postgres    16.3    16.3 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4825                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16407    GrupoJugadores    TABLE     k   CREATE TABLE public."GrupoJugadores" (
    "idGrupo" integer NOT NULL,
    "idJugador" integer NOT NULL
);
 $   DROP TABLE public."GrupoJugadores";
       public         heap    postgres    false            �            1259    16410    GrupoJugadores_idGrupo_seq    SEQUENCE     �   ALTER TABLE public."GrupoJugadores" ALTER COLUMN "idGrupo" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."GrupoJugadores_idGrupo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16404    JugadorXGrupo    TABLE     �   CREATE TABLE public."JugadorXGrupo" (
    "IdGrupo" integer,
    id1 integer NOT NULL,
    id2 integer,
    id3 integer,
    id4 integer
);
 #   DROP TABLE public."JugadorXGrupo";
       public         heap    postgres    false            �            1259    16412    grupo_jugador    TABLE     h   CREATE TABLE public.grupo_jugador (
    "idGrupo" integer NOT NULL,
    "idJugador" integer NOT NULL
);
 !   DROP TABLE public.grupo_jugador;
       public         heap    postgres    false            �            1259    16411    grupo_jugador_idGrupo_seq    SEQUENCE     �   CREATE SEQUENCE public."grupo_jugador_idGrupo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."grupo_jugador_idGrupo_seq";
       public          postgres    false    222            �           0    0    grupo_jugador_idGrupo_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."grupo_jugador_idGrupo_seq" OWNED BY public.grupo_jugador."idGrupo";
          public          postgres    false    221            �            1259    16419    grupo_x_jugador    TABLE     �   CREATE TABLE public.grupo_x_jugador (
    "idGrupoXJugador" integer NOT NULL,
    "idGrupo" integer NOT NULL,
    id1 integer NOT NULL,
    id2 integer NOT NULL,
    id3 integer NOT NULL,
    id4 integer NOT NULL
);
 #   DROP TABLE public.grupo_x_jugador;
       public         heap    postgres    false            �            1259    16418 #   grupo_x_jugador_idGrupoXJugador_seq    SEQUENCE     �   CREATE SEQUENCE public."grupo_x_jugador_idGrupoXJugador_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."grupo_x_jugador_idGrupoXJugador_seq";
       public          postgres    false    224            �           0    0 #   grupo_x_jugador_idGrupoXJugador_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."grupo_x_jugador_idGrupoXJugador_seq" OWNED BY public.grupo_x_jugador."idGrupoXJugador";
          public          postgres    false    223            �            1259    16398    jugador    TABLE     �  CREATE TABLE public.jugador (
    id integer NOT NULL,
    "Puntos" integer NOT NULL,
    "Contraseña" character varying NOT NULL,
    "Gmail" character varying NOT NULL,
    "Apellido" character varying NOT NULL,
    "Nombre" character varying NOT NULL,
    "Amigos" character varying NOT NULL,
    "idPartido" integer NOT NULL,
    "Rango" character varying NOT NULL,
    "IdGrupo" integer NOT NULL,
    "Foto" character varying NOT NULL,
    "Club" character varying NOT NULL
);
    DROP TABLE public.jugador;
       public         heap    postgres    false            �            1259    16403    jugador_id_seq    SEQUENCE     �   ALTER TABLE public.jugador ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.jugador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            .           2604    16415    grupo_jugador idGrupo    DEFAULT     �   ALTER TABLE ONLY public.grupo_jugador ALTER COLUMN "idGrupo" SET DEFAULT nextval('public."grupo_jugador_idGrupo_seq"'::regclass);
 F   ALTER TABLE public.grupo_jugador ALTER COLUMN "idGrupo" DROP DEFAULT;
       public          postgres    false    222    221    222            /           2604    16422    grupo_x_jugador idGrupoXJugador    DEFAULT     �   ALTER TABLE ONLY public.grupo_x_jugador ALTER COLUMN "idGrupoXJugador" SET DEFAULT nextval('public."grupo_x_jugador_idGrupoXJugador_seq"'::regclass);
 P   ALTER TABLE public.grupo_x_jugador ALTER COLUMN "idGrupoXJugador" DROP DEFAULT;
       public          postgres    false    223    224    224            �          0    16407    GrupoJugadores 
   TABLE DATA           B   COPY public."GrupoJugadores" ("idGrupo", "idJugador") FROM stdin;
    public          postgres    false    219   �(       �          0    16404    JugadorXGrupo 
   TABLE DATA           H   COPY public."JugadorXGrupo" ("IdGrupo", id1, id2, id3, id4) FROM stdin;
    public          postgres    false    218   �(       �          0    16412    grupo_jugador 
   TABLE DATA           ?   COPY public.grupo_jugador ("idGrupo", "idJugador") FROM stdin;
    public          postgres    false    222    )       �          0    16419    grupo_x_jugador 
   TABLE DATA           [   COPY public.grupo_x_jugador ("idGrupoXJugador", "idGrupo", id1, id2, id3, id4) FROM stdin;
    public          postgres    false    224   !)       �          0    16398    jugador 
   TABLE DATA           �   COPY public.jugador (id, "Puntos", "Contraseña", "Gmail", "Apellido", "Nombre", "Amigos", "idPartido", "Rango", "IdGrupo", "Foto", "Club") FROM stdin;
    public          postgres    false    216   K)       �           0    0    GrupoJugadores_idGrupo_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."GrupoJugadores_idGrupo_seq"', 1, false);
          public          postgres    false    220            �           0    0    grupo_jugador_idGrupo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."grupo_jugador_idGrupo_seq"', 1, true);
          public          postgres    false    221            �           0    0 #   grupo_x_jugador_idGrupoXJugador_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."grupo_x_jugador_idGrupoXJugador_seq"', 2, true);
          public          postgres    false    223            �           0    0    jugador_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.jugador_id_seq', 4, true);
          public          postgres    false    217            7           2606    16453 "   GrupoJugadores GrupoJugadores_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."GrupoJugadores"
    ADD CONSTRAINT "GrupoJugadores_pkey" PRIMARY KEY ("idGrupo");
 P   ALTER TABLE ONLY public."GrupoJugadores" DROP CONSTRAINT "GrupoJugadores_pkey";
       public            postgres    false    219            1           2606    16426 &   jugador PK_1ab9b28fb3c4e9135da05f1cc3c 
   CONSTRAINT     f   ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT "PK_1ab9b28fb3c4e9135da05f1cc3c" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.jugador DROP CONSTRAINT "PK_1ab9b28fb3c4e9135da05f1cc3c";
       public            postgres    false    216            9           2606    16417 ,   grupo_jugador PK_4cdf7aa4f7aec3a44cbfb4a308d 
   CONSTRAINT     s   ALTER TABLE ONLY public.grupo_jugador
    ADD CONSTRAINT "PK_4cdf7aa4f7aec3a44cbfb4a308d" PRIMARY KEY ("idGrupo");
 X   ALTER TABLE ONLY public.grupo_jugador DROP CONSTRAINT "PK_4cdf7aa4f7aec3a44cbfb4a308d";
       public            postgres    false    222            ;           2606    16424 .   grupo_x_jugador PK_a143dc9d4744c5de3d9c794024a 
   CONSTRAINT     }   ALTER TABLE ONLY public.grupo_x_jugador
    ADD CONSTRAINT "PK_a143dc9d4744c5de3d9c794024a" PRIMARY KEY ("idGrupoXJugador");
 Z   ALTER TABLE ONLY public.grupo_x_jugador DROP CONSTRAINT "PK_a143dc9d4744c5de3d9c794024a";
       public            postgres    false    224            3           2606    16428 &   jugador UQ_59089a3fc738271d4618497c350 
   CONSTRAINT     f   ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT "UQ_59089a3fc738271d4618497c350" UNIQUE ("Gmail");
 R   ALTER TABLE ONLY public.jugador DROP CONSTRAINT "UQ_59089a3fc738271d4618497c350";
       public            postgres    false    216            5           2606    16430 &   jugador UQ_cf8076b83801050d32b071d7f2e 
   CONSTRAINT     g   ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT "UQ_cf8076b83801050d32b071d7f2e" UNIQUE ("Nombre");
 R   ALTER TABLE ONLY public.jugador DROP CONSTRAINT "UQ_cf8076b83801050d32b071d7f2e";
       public            postgres    false    216            �      x������ � �      �      x������ � �      �      x�3�4����� ]      �      x�3�4B#NcN.#$v� 46p      �   �   x�3�4400�t��/�9z������E�y�`�Լ��DNNN�����TO ��#5�(139��b�Giz>�@5�$3/�
"�� c�@����P
�!P��1�����Z�����iJ� �AR�     