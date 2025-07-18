PGDMP              
        }            transportadora_db_pg    14.18    16.3 -               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24579    transportadora_db_pg    DATABASE     �   CREATE DATABASE transportadora_db_pg WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 $   DROP DATABASE transportadora_db_pg;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    24618    cliente    TABLE     �  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(100),
    cpf_cnpj character varying(20),
    email character varying(100),
    telefone character varying(20),
    endereco character varying(150),
    cidade character varying(50),
    estado character varying(2),
    cep character varying(10),
    ie character varying(30),
    tipo_cliente character varying(20),
    status character varying(20),
    data_cadastro date
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    4            �            1259    24617    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    4    210                       0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    209            �            1259    24655    entrega    TABLE     �  CREATE TABLE public.entrega (
    id_entrega integer NOT NULL,
    id_pedido integer NOT NULL,
    id_motorista integer,
    id_veiculo integer,
    cte_numero character varying(20),
    cte_chave_acesso character varying(44),
    cte_data_emissao date,
    cte_status_sefaz character varying(20),
    cte_xml text,
    data_saida date,
    data_prevista_entrega date,
    data_entrega date,
    status character varying(20),
    local_origem character varying(150),
    local_destino character varying(150),
    rastreio_codigo character varying(50),
    tipo_frete character varying(20),
    observacoes text,
    criado_por character varying(50),
    data_criacao date
);
    DROP TABLE public.entrega;
       public         heap    postgres    false    4            �            1259    24654    entrega_id_entrega_seq    SEQUENCE     �   CREATE SEQUENCE public.entrega_id_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.entrega_id_entrega_seq;
       public          postgres    false    218    4                        0    0    entrega_id_entrega_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.entrega_id_entrega_seq OWNED BY public.entrega.id_entrega;
          public          postgres    false    217            �            1259    24627 	   motorista    TABLE     �  CREATE TABLE public.motorista (
    id_motorista integer NOT NULL,
    nome character varying(100),
    cpf character varying(20),
    rg character varying(20),
    cnh_numero character varying(20),
    cnh_categoria character varying(5),
    validade_cnh date,
    email character varying(100),
    telefone character varying(20),
    endereco character varying(150),
    cidade character varying(50),
    estado character varying(2),
    data_cadastro date
);
    DROP TABLE public.motorista;
       public         heap    postgres    false    4            �            1259    24626    motorista_id_motorista_seq    SEQUENCE     �   CREATE SEQUENCE public.motorista_id_motorista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.motorista_id_motorista_seq;
       public          postgres    false    212    4            !           0    0    motorista_id_motorista_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.motorista_id_motorista_seq OWNED BY public.motorista.id_motorista;
          public          postgres    false    211            �            1259    24641    pedido    TABLE     �  CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer,
    data_pedido date,
    prazo_entrega_previsto date,
    data_entrega_real date,
    valor_total numeric(10,2),
    forma_pagamento character varying(30),
    prioridade character varying(10),
    status character varying(20),
    observacoes text,
    criado_por character varying(50),
    data_criacao date
);
    DROP TABLE public.pedido;
       public         heap    postgres    false    4            �            1259    24640    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    4    216            "           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    215            �            1259    24634    veiculo    TABLE     �  CREATE TABLE public.veiculo (
    id_veiculo integer NOT NULL,
    ano_fabricacao integer,
    ano_modelo integer,
    capacidade_carga_kg numeric(10,2),
    chassi character varying(30),
    cor character varying(20),
    data_aquisicao date,
    data_ultima_manutencao date,
    marca character varying(50),
    modelo character varying(50),
    placa character varying(10),
    renavam character varying(20),
    status character varying(20),
    tipo_veiculo character varying(30)
);
    DROP TABLE public.veiculo;
       public         heap    postgres    false    4            �            1259    24633    veiculo_id_veiculo_seq    SEQUENCE     �   CREATE SEQUENCE public.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.veiculo_id_veiculo_seq;
       public          postgres    false    4    214            #           0    0    veiculo_id_veiculo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.veiculo_id_veiculo_seq OWNED BY public.veiculo.id_veiculo;
          public          postgres    false    213            p           2604    24621    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    209    210    210            t           2604    24658    entrega id_entrega    DEFAULT     x   ALTER TABLE ONLY public.entrega ALTER COLUMN id_entrega SET DEFAULT nextval('public.entrega_id_entrega_seq'::regclass);
 A   ALTER TABLE public.entrega ALTER COLUMN id_entrega DROP DEFAULT;
       public          postgres    false    218    217    218            q           2604    24630    motorista id_motorista    DEFAULT     �   ALTER TABLE ONLY public.motorista ALTER COLUMN id_motorista SET DEFAULT nextval('public.motorista_id_motorista_seq'::regclass);
 E   ALTER TABLE public.motorista ALTER COLUMN id_motorista DROP DEFAULT;
       public          postgres    false    212    211    212            s           2604    24644    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    216    215    216            r           2604    24637    veiculo id_veiculo    DEFAULT     x   ALTER TABLE ONLY public.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('public.veiculo_id_veiculo_seq'::regclass);
 A   ALTER TABLE public.veiculo ALTER COLUMN id_veiculo DROP DEFAULT;
       public          postgres    false    213    214    214                      0    24618    cliente 
   TABLE DATA           �   COPY public.cliente (id_cliente, nome, cpf_cnpj, email, telefone, endereco, cidade, estado, cep, ie, tipo_cliente, status, data_cadastro) FROM stdin;
    public          postgres    false    210   �;                 0    24655    entrega 
   TABLE DATA           7  COPY public.entrega (id_entrega, id_pedido, id_motorista, id_veiculo, cte_numero, cte_chave_acesso, cte_data_emissao, cte_status_sefaz, cte_xml, data_saida, data_prevista_entrega, data_entrega, status, local_origem, local_destino, rastreio_codigo, tipo_frete, observacoes, criado_por, data_criacao) FROM stdin;
    public          postgres    false    218   �<                 0    24627 	   motorista 
   TABLE DATA           �   COPY public.motorista (id_motorista, nome, cpf, rg, cnh_numero, cnh_categoria, validade_cnh, email, telefone, endereco, cidade, estado, data_cadastro) FROM stdin;
    public          postgres    false    212   �<                 0    24641    pedido 
   TABLE DATA           �   COPY public.pedido (id_pedido, id_cliente, data_pedido, prazo_entrega_previsto, data_entrega_real, valor_total, forma_pagamento, prioridade, status, observacoes, criado_por, data_criacao) FROM stdin;
    public          postgres    false    216   =                 0    24634    veiculo 
   TABLE DATA           �   COPY public.veiculo (id_veiculo, ano_fabricacao, ano_modelo, capacidade_carga_kg, chassi, cor, data_aquisicao, data_ultima_manutencao, marca, modelo, placa, renavam, status, tipo_veiculo) FROM stdin;
    public          postgres    false    214   -=       $           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 10, true);
          public          postgres    false    209            %           0    0    entrega_id_entrega_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.entrega_id_entrega_seq', 1, false);
          public          postgres    false    217            &           0    0    motorista_id_motorista_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.motorista_id_motorista_seq', 1, false);
          public          postgres    false    211            '           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public          postgres    false    215            (           0    0    veiculo_id_veiculo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.veiculo_id_veiculo_seq', 1, false);
          public          postgres    false    213            v           2606    24625    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    210            ~           2606    24662    entrega entrega_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (id_entrega);
 >   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_pkey;
       public            postgres    false    218            x           2606    24632    motorista motorista_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id_motorista);
 B   ALTER TABLE ONLY public.motorista DROP CONSTRAINT motorista_pkey;
       public            postgres    false    212            |           2606    24648    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    216            z           2606    24639    veiculo veiculo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);
 >   ALTER TABLE ONLY public.veiculo DROP CONSTRAINT veiculo_pkey;
       public            postgres    false    214            �           2606    24668 !   entrega entrega_id_motorista_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_motorista);
 K   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_id_motorista_fkey;
       public          postgres    false    212    3192    218            �           2606    24663    entrega entrega_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);
 H   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_id_pedido_fkey;
       public          postgres    false    218    216    3196            �           2606    24673    entrega entrega_id_veiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES public.veiculo(id_veiculo);
 I   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_id_veiculo_fkey;
       public          postgres    false    218    3194    214                       2606    24649    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public          postgres    false    3190    216    210                 x�͐Mn�@F��s�0���]i�JEU� �n\�J#Ʌ��)�XG���������#x��V-J �8Ie�!"tɏzd3�Ύ@T�Y�đ"h.,�����~���2Xhk@BDW����OP�e�,^��b:�r5W
U"�����x����I�,�֞Q�TJ=�&
�:;��ZGt�rww&E�p�Y�U����+z-*���-4���s�bG�.�v��é�� �DR쳤�I�ϒ2O$�>K*<�D賥O�/�            x������ � �            x������ � �            x������ � �            x������ � �     