--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-09 21:17:08

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 215 (class 1259 OID 17670)
-- Name: costo_fijo_id_fijo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.costo_fijo_id_fijo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.costo_fijo_id_fijo_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17678)
-- Name: costo_variable_id_variable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.costo_variable_id_variable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.costo_variable_id_variable_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 18540)
-- Name: cultivo_plaga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cultivo_plaga (
    id_plaga integer NOT NULL,
    id integer,
    nombre_plaga character varying(255),
    fecha_ultima_deteccion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cultivo_plaga OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18563)
-- Name: cultivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cultivos (
    "ID" integer NOT NULL,
    nombre character varying(255),
    tipo character varying(255),
    espacio character varying(255),
    cosecha_estimada integer,
    fecha_aspercion date,
    nombre_producto character varying(255),
    dosis integer,
    tipo_aspercion character varying(255),
    tipo_fertilizante character varying(255),
    cantidad_fertilizante integer,
    observaciones character varying(255),
    fecha_siembra date,
    fecha_cosecha date,
    tipo_riego character varying(255),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_fertilizacion date,
    id_espacio integer
);


ALTER TABLE public.cultivos OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18569)
-- Name: cultivos_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."cultivos_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."cultivos_ID_seq" OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 245
-- Name: cultivos_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."cultivos_ID_seq" OWNED BY public.cultivos."ID";


--
-- TOC entry 234 (class 1259 OID 18132)
-- Name: dataSet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."dataSet" (
    "id_dataSet" integer NOT NULL,
    nombre character varying,
    definicion character varying,
    familia character varying,
    tratamiento character varying,
    amenaza boolean
);


ALTER TABLE public."dataSet" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18131)
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."dataSet_id_dataSet_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."dataSet_id_dataSet_seq" OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 233
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."dataSet_id_dataSet_seq" OWNED BY public."dataSet"."id_dataSet";


--
-- TOC entry 217 (class 1259 OID 17693)
-- Name: datos_veterinarios_id_veterinario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datos_veterinarios_id_veterinario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datos_veterinarios_id_veterinario_seq OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18547)
-- Name: espacios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.espacios (
    "Id_espacios" integer NOT NULL,
    nombre_espacio character varying(255) NOT NULL,
    estatus character varying(255) NOT NULL,
    recursos_hidricos character varying(255) NOT NULL,
    historial_uso character varying(255) NOT NULL,
    observaciones character varying(255) NOT NULL,
    tipo_riego character varying(255) NOT NULL,
    "Habilitado" integer DEFAULT 1 NOT NULL,
    poligono_id numeric
);


ALTER TABLE public.espacios OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18553)
-- Name: espacios_Id_espacios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."espacios_Id_espacios_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."espacios_Id_espacios_seq" OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 243
-- Name: espacios_Id_espacios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."espacios_Id_espacios_seq" OWNED BY public.espacios."Id_espacios";


--
-- TOC entry 247 (class 1259 OID 18592)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id_modelo integer NOT NULL,
    "pesosH5" bytea,
    "modelsH5" bytea,
    prediccion_py bytea,
    tiempo character varying(30)
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18591)
-- Name: modelo_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_modelo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modelo_id_modelo_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 246
-- Name: modelo_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_modelo_seq OWNED BY public.modelo.id_modelo;


--
-- TOC entry 218 (class 1259 OID 17764)
-- Name: modulo_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulo_movil (
    "Id_Modulos" integer NOT NULL,
    "Id_Subprograma" integer NOT NULL,
    nombre_modulo character varying(255) NOT NULL
);


ALTER TABLE public.modulo_movil OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17767)
-- Name: modulo_Id_Modulos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."modulo_Id_Modulos_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."modulo_Id_Modulos_seq" OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 219
-- Name: modulo_Id_Modulos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."modulo_Id_Modulos_seq" OWNED BY public.modulo_movil."Id_Modulos";


--
-- TOC entry 235 (class 1259 OID 18140)
-- Name: notificaciones_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones_movil (
    id_notificacion integer NOT NULL,
    etiqueta boolean,
    expansion boolean
);


ALTER TABLE public.notificaciones_movil OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18433)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    "Id_Perfil" integer NOT NULL,
    nombre_perfil character varying,
    estado character varying
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17768)
-- Name: perfil_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil_movil (
    "Id_Perfil" integer NOT NULL,
    nombre_perfil character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    trial377 character(1)
);


ALTER TABLE public.perfil_movil OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17773)
-- Name: perfil_Id_Perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."perfil_Id_Perfil_seq" OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 221
-- Name: perfil_Id_Perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."perfil_Id_Perfil_seq" OWNED BY public.perfil_movil."Id_Perfil";


--
-- TOC entry 238 (class 1259 OID 18432)
-- Name: perfil_Id_Perfil_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."perfil_Id_Perfil_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."perfil_Id_Perfil_seq1" OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 238
-- Name: perfil_Id_Perfil_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."perfil_Id_Perfil_seq1" OWNED BY public.perfil."Id_Perfil";


--
-- TOC entry 222 (class 1259 OID 17774)
-- Name: perfil_modulo_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil_modulo_movil (
    "Id_Perfil" integer NOT NULL,
    "Id_Modulo" integer NOT NULL,
    trial380 character(1)
);


ALTER TABLE public.perfil_modulo_movil OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17777)
-- Name: perfil_programa_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil_programa_movil (
    "Id_Perfil" integer NOT NULL,
    "Id_Programa" integer NOT NULL,
    trial380 character(1)
);


ALTER TABLE public.perfil_programa_movil OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17780)
-- Name: perfil_subprograma_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil_subprograma_movil (
    "Id_Perfil" integer NOT NULL,
    "Id_Subprograma" integer NOT NULL,
    trial383 character(1)
);


ALTER TABLE public.perfil_subprograma_movil OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18539)
-- Name: plagas_id_plaga_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plagas_id_plaga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plagas_id_plaga_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 240
-- Name: plagas_id_plaga_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plagas_id_plaga_seq OWNED BY public.cultivo_plaga.id_plaga;


--
-- TOC entry 225 (class 1259 OID 17800)
-- Name: privilegios_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios_movil (
    id_privilegio integer NOT NULL,
    id_perfil integer NOT NULL,
    ver character varying(255) NOT NULL,
    editar character varying(255) NOT NULL,
    eliminar character varying(255) NOT NULL,
    imprimir character varying(255) NOT NULL,
    agregar character varying(255) NOT NULL,
    trial390 character(1)
);


ALTER TABLE public.privilegios_movil OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17805)
-- Name: privilegios_id_privilegio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privilegios_id_privilegio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.privilegios_id_privilegio_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 226
-- Name: privilegios_id_privilegio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privilegios_id_privilegio_seq OWNED BY public.privilegios_movil.id_privilegio;


--
-- TOC entry 227 (class 1259 OID 17806)
-- Name: programa_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programa_movil (
    "Id_Programa" integer NOT NULL,
    nombre character varying(255) NOT NULL,
    trial393 character(1)
);


ALTER TABLE public.programa_movil OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17809)
-- Name: programa_Id_Programa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."programa_Id_Programa_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."programa_Id_Programa_seq" OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 228
-- Name: programa_Id_Programa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."programa_Id_Programa_seq" OWNED BY public.programa_movil."Id_Programa";


--
-- TOC entry 229 (class 1259 OID 17823)
-- Name: sub_programa_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_programa_movil (
    "Id_Subprograma" integer NOT NULL,
    "Id_ProgramaS" integer NOT NULL,
    nombre_subp character varying(255) NOT NULL,
    trial406 character(1)
);


ALTER TABLE public.sub_programa_movil OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17826)
-- Name: sub_programa_Id_Subprograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sub_programa_Id_Subprograma_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."sub_programa_Id_Subprograma_seq" OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 230
-- Name: sub_programa_Id_Subprograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sub_programa_Id_Subprograma_seq" OWNED BY public.sub_programa_movil."Id_Subprograma";


--
-- TOC entry 236 (class 1259 OID 18420)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    "Id_Usuario" integer NOT NULL,
    "Id_Perfilp" integer NOT NULL,
    "Usuario" character varying(255) NOT NULL,
    "Clave" character varying(255) NOT NULL,
    "Nombre" character varying(225) NOT NULL,
    "Apellido" character varying(400) NOT NULL,
    tipo_usuario character varying(255) NOT NULL,
    "Respuesta_1" character varying(255) NOT NULL,
    "Respuesta_2" character varying(255) NOT NULL,
    "Respuesta_3" character varying(255) NOT NULL,
    "Habilitado" integer NOT NULL,
    "Fecha" timestamp without time zone,
    "Id_Perfil_Movil" integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17827)
-- Name: usuarios_movil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_movil (
    "Id_Usuario" integer NOT NULL,
    "Id_Perfilp" integer NOT NULL,
    "Usuario" character varying(255) NOT NULL,
    "Clave" character varying(255) NOT NULL,
    "Nombre" character varying(225) NOT NULL,
    "Apellido" character varying(400) NOT NULL,
    tipo_usuario character varying(255) NOT NULL,
    "Respuesta_1" character varying(255) NOT NULL,
    "Respuesta_2" character varying(255) NOT NULL,
    "Respuesta_3" character varying(255) NOT NULL,
    "Habilitado" integer DEFAULT 1 NOT NULL,
    "Fecha" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial413 character(1)
);


ALTER TABLE public.usuarios_movil OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17834)
-- Name: usuarios_Id_Usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usuarios_Id_Usuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."usuarios_Id_Usuario_seq" OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 232
-- Name: usuarios_Id_Usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usuarios_Id_Usuario_seq" OWNED BY public.usuarios_movil."Id_Usuario";


--
-- TOC entry 237 (class 1259 OID 18423)
-- Name: usuarios_Id_Usuario_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usuarios_Id_Usuario_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."usuarios_Id_Usuario_seq1" OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 237
-- Name: usuarios_Id_Usuario_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usuarios_Id_Usuario_seq1" OWNED BY public.usuarios."Id_Usuario";


--
-- TOC entry 4778 (class 2604 OID 18543)
-- Name: cultivo_plaga id_plaga; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivo_plaga ALTER COLUMN id_plaga SET DEFAULT nextval('public.plagas_id_plaga_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 18570)
-- Name: cultivos ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivos ALTER COLUMN "ID" SET DEFAULT nextval('public."cultivos_ID_seq"'::regclass);


--
-- TOC entry 4775 (class 2604 OID 18135)
-- Name: dataSet id_dataSet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."dataSet" ALTER COLUMN "id_dataSet" SET DEFAULT nextval('public."dataSet_id_dataSet_seq"'::regclass);


--
-- TOC entry 4780 (class 2604 OID 18554)
-- Name: espacios Id_espacios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espacios ALTER COLUMN "Id_espacios" SET DEFAULT nextval('public."espacios_Id_espacios_seq"'::regclass);


--
-- TOC entry 4784 (class 2604 OID 18595)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_id_modelo_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 17854)
-- Name: modulo_movil Id_Modulos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_movil ALTER COLUMN "Id_Modulos" SET DEFAULT nextval('public."modulo_Id_Modulos_seq"'::regclass);


--
-- TOC entry 4777 (class 2604 OID 18436)
-- Name: perfil Id_Perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."perfil_Id_Perfil_seq1"'::regclass);


--
-- TOC entry 4768 (class 2604 OID 17855)
-- Name: perfil_movil Id_Perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_movil ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."perfil_Id_Perfil_seq"'::regclass);


--
-- TOC entry 4769 (class 2604 OID 17858)
-- Name: privilegios_movil id_privilegio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_movil ALTER COLUMN id_privilegio SET DEFAULT nextval('public.privilegios_id_privilegio_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 17859)
-- Name: programa_movil Id_Programa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_movil ALTER COLUMN "Id_Programa" SET DEFAULT nextval('public."programa_Id_Programa_seq"'::regclass);


--
-- TOC entry 4771 (class 2604 OID 17862)
-- Name: sub_programa_movil Id_Subprograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_programa_movil ALTER COLUMN "Id_Subprograma" SET DEFAULT nextval('public."sub_programa_Id_Subprograma_seq"'::regclass);


--
-- TOC entry 4776 (class 2604 OID 18424)
-- Name: usuarios Id_Usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN "Id_Usuario" SET DEFAULT nextval('public."usuarios_Id_Usuario_seq1"'::regclass);


--
-- TOC entry 4772 (class 2604 OID 17863)
-- Name: usuarios_movil Id_Usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_movil ALTER COLUMN "Id_Usuario" SET DEFAULT nextval('public."usuarios_Id_Usuario_seq"'::regclass);


--
-- TOC entry 4991 (class 0 OID 18540)
-- Dependencies: 241
-- Data for Name: cultivo_plaga; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (9, 14, 'Test 1-001', '2024-12-02 00:00:00-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (10, 14, 'Test 1-002', '2024-12-02 20:32:38-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (11, 14, 'Test 1-003', '2024-12-02 20:33:00-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (12, 15, 'Test 2-002', '2024-12-02 20:34:21-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (14, 15, 'Test 2-003', '2024-12-02 06:40:28-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (16, 15, 'Test 2-004', '2024-12-02 07:25:46-04');
INSERT INTO public.cultivo_plaga (id_plaga, id, nombre_plaga, fecha_ultima_deteccion) VALUES (30, 15, 'Libre de Plagas', '2024-12-05 16:30:24-04');


--
-- TOC entry 4994 (class 0 OID 18563)
-- Dependencies: 244
-- Data for Name: cultivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (14, 'maiz', 'Hortaliza', 'poligono2', 200, '2024-11-15', 'fungicida', 200, 'movil', 'Orgánicos', 2, 'ninguna', '2024-11-14', '2025-07-10', 'Inundación', '2024-11-13 11:30:03.01716', '2024-11-07', 12);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (15, 'fresa', 'Frutal', 'poligono1', 240, '2024-11-06', 'fungicida', 20, 'movil', 'Químicos', 1, 'ninguna', '2024-11-12', '2025-01-15', 'Goteo', '2024-11-13 11:31:59.945436', '2024-11-08', 13);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (16, 'aguacate', 'Otro', 'poligono3', 47, '2024-11-12', 'fungicida', 30, 'movil', 'Minerales', 3, 'ninguna', '2024-11-12', '2025-01-11', 'Gravedad', '2024-11-13 11:34:54.640004', '2024-11-05', 14);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (17, 'yuca', 'Hortaliza', 'poligono2', 180, '2024-11-01', 'fungicida', 33, 'movil', 'Biológicos', 1, 'ninguna', '2024-11-04', '2025-03-14', 'Aspersión', '2024-11-13 11:37:19.292203', '2024-11-06', 12);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (18, 'Trigo', 'Cereal', 'poligono3', 120, '2024-11-14', 'fungicida', 30, 'movil', 'Orgánicos', 1, 'ninguna', '2024-11-11', '2025-03-19', 'Gravedad', '2024-11-13 11:39:33.544702', '2024-11-06', 14);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (19, 'jamaica', 'Flor', 'poligono2', 140, '2024-11-12', 'fungicida', 200, 'movil', 'Orgánicos', 3, 'ninguna', '2024-11-01', '2025-01-09', 'Inundación', '2024-11-13 11:41:08.481224', '2024-11-06', 12);
INSERT INTO public.cultivos ("ID", nombre, tipo, espacio, cosecha_estimada, fecha_aspercion, nombre_producto, dosis, tipo_aspercion, tipo_fertilizante, cantidad_fertilizante, observaciones, fecha_siembra, fecha_cosecha, tipo_riego, fecha_registro, fecha_fertilizacion, id_espacio) VALUES (20, 'auyama', 'Hortaliza', 'poligono1', 30, '2024-11-07', 'fungicida', 20, 'movil', 'Químicos', 5, 'ninguna', '2024-11-04', '2025-01-22', 'Surco', '2024-11-13 11:43:51.388083', '2024-10-30', 13);


--
-- TOC entry 4984 (class 0 OID 18132)
-- Dependencies: 234
-- Data for Name: dataSet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (37, 'Necrosis Apical', 'La necrosis apical del mango (NAM) es una enfermedad bacteriana causada por la bacteria Pseudomonas syringae pv. syringae. Esta enfermedad afecta principalmente a los árboles de mango en climas mediterráneos y subtropicales.

- Síntomas
Manchas necróticas: Aparición de manchas necróticas en las yemas vegetativas y florales. Estas manchas pueden extenderse hacia el tallo y las hojas.

Exudado: En algunas ocasiones, se pueden observar gotas de exudado blanco lechoso en las yemas o panículas florales, que más tarde oscurecen y toman aspecto de resina.

Secado y muerte: Las yemas afectadas se secan y mueren, lo que puede llevar a la muerte de la rama o incluso del árbol en casos extremos', 'La necrosis apical del mango es causada por la bacteria Pseudomonas syringae pv. syringae, que pertenece a la familia Pseudomonadaceae', 'Tratamiento de la Enfermedad:

- Eliminación de partes afectadas: Cortar y eliminar las partes del árbol que presenten síntomas de la enfermedad, como las yemas y ramas afectadas.

- Aplicación de bactericidas:
Tratar las plantas afectadas con bactericidas específicos para controlar la bacteria', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (87, 'Hoja de Guayaba', 'La hoja de guayaba es la hoja del árbol de guayabo (Psidium guajava), una planta tropical nativa de América Central y del Sur, conocida por sus frutos comestibles, las guayabas. Estas hojas tienen varias características y usos importantes:

Características de la Hoja de Guayaba
Forma y Tamaño: Las hojas de guayaba son generalmente ovadas, con un tamaño que varía entre los 7 y 15 cm de largo y los 3 a 5 cm de ancho.

Textura: Son gruesas, coriáceas, y tienen una superficie superior brillante y una superficie inferior algo más pálida y aterciopelada debido a la presencia de tricomas.

Color: Son de color verde brillante.

Olor: Tienen un aroma distintivo, algo similar al de la fruta pero menos pronunciado.', 'El guayabo (Psidium guajava) pertenece a la familia Myrtaceae. Esta es una familia de plantas dicotiledóneas que incluye numerosos árboles y arbustos, muchos de los cuales son de importancia económica y ecológica. Otras plantas conocidas de esta familia incluyen el eucalipto, el mirto, y el clavo de olor.', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (33, 'Hoja de Mango', 'El mango (Mangifera indica) es un árbol frutal tropical originario del sur de Asia, concretamente de la región entre India y Birmania', 'Este árbol pertenece a la familia de las Anacardiáceas', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (95, 'Candida Guillermondii', 'Candida guilliermondii no es una planta. Es una levadura, un tipo de hongo unicelular. Aunque el término "Candida" puede sonar similar a nombres de plantas, se refiere específicamente a un grupo de levaduras que pueden estar presentes en el medio ambiente, en alimentos, y también pueden causar infecciones en seres humanos y animales.

Las levaduras, incluyendo Candida guilliermondii, son organismos importantes tanto en aplicaciones industriales (como la fermentación) como en investigaciones médicas y biotecnológicas. También tienen aplicaciones en el control biológico en la agricultura, como mencioné antes, pero no son plantas.', 'Candida guilliermondii pertenece a la familia Debaryomycetaceae. Esta familia incluye varias especies de levaduras del género Candida, que son importantes tanto en contextos médicos debido a su capacidad para causar infecciones, como en aplicaciones industriales y biotecnológicas.', 'El tratamiento para Candida guilliermondii generalmente implica el uso de medicamentos antifúngicos. Aquí hay algunas opciones comunes:

Fluconazol: Un medicamento antifúngico comúnmente utilizado, aunque algunas cepas de Candida guilliermondii pueden mostrar resistencia.

Anfotericina B: Este medicamento es efectivo contra muchas cepas de Candida, incluyendo Candida guilliermondii.

Caso de resistencia: En casos donde hay resistencia a los tratamientos anteriores, se pueden considerar otros antifúngicos como el anidulafungina.

Es importante que el tratamiento sea supervisado por un profesional de la salud para asegurar su efectividad y evitar complicaciones.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (88, 'Hongo de Suelo', 'los hongos del suelo pueden afectar a la planta Zamioculcas zamiifolia (también conocida como Zamioculca). Aquí tienes una explicación más detallada:

Pudrición de raíces: Los hongos del suelo pueden infectar las raíces de la planta, causando que se pudran y se deterioren. Esto afecta la capacidad de la planta para absorber agua y nutrientes.

Hojas caídas y amarillentas: A medida que las raíces se pudren, la planta no puede mantenerse saludable, lo que lleva a que las hojas se vuelvan amarillas y caigan.

Muerte de la planta: Si la infección no se trata, la planta puede llegar a morir debido a la falta de nutrientes y agua adecuados.

Condiciones favorables: Los hongos prosperan en suelos húmedos y mal drenados, lo que crea un ambiente ideal para su crecimiento.

Mancha oscura: Esta es una enfermedad fúngica que causa manchas oscuras e irregulares en las hojas y tallos de la planta. La enfermedad se propaga en condiciones de alta humedad y puede ser altamente infecciosa.', 'Los hongos del suelo pertenecen a varias familias dentro del reino Fungi. Los principales grupos de hongos del suelo incluyen:

Ascomicetos (Ascomycota): Esta es la familia más grande del reino Fungi y contiene muchas especies que desempeñan un papel importante en la descomposición de materia orgánica.

Basidiomicetos (Basidiomycota): Estos hongos también son importantes descomponedores y pueden formar relaciones simbióticas con las raíces de las plantas (micorrizas).

Zigomicetos (Zygomycota): Estos hongos son conocidos por su capacidad para descomponer materia orgánica y pueden encontrarse en suelos ricos en materia orgánica.

Quitridiomicetos (Chytridiomycota): Aunque muchos de estos hongos son acuáticos, algunos pueden encontrarse en suelos húmedos y desempeñan un papel en la descomposición de materia orgánica.', 'Para tratar los hongos del suelo que afectan a tu Zamioculcas, puedes seguir estos pasos:

Mejorar el Drenaje del Suelo: Asegúrate de que el suelo tenga un buen drenaje para evitar el encharcamiento, que favorece el crecimiento de hongos. Puedes modificar la mezcla para macetas para aumentar la aireación y el drenaje1.

Ajustar los Hábitos de Riego: Reduce la frecuencia de riego y asegúrate de que el suelo se seque entre sesiones de riego. Esto ayuda a prevenir condiciones húmedas que favorecen los hongos2.

Aplicar Fungicidas: Utiliza un fungicida adecuado para controlar la propagación del hongo. Sigue las instrucciones del fabricante para aplicarlo correctamente2.

Mejorar la Ventilación: Aumenta la circulación de aire alrededor de la planta para reducir la retención de humedad. Esto puede ayudar a desalentar el crecimiento fúngico2.

Eliminar las Hojas Afectadas: Retira cualquier hoja afectada para evitar que el hongo se propague a otras partes de la planta.

Es importante actuar rápidamente para controlar la infestación y minimizar el daño a tu planta.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (92, 'Hoja de Tuatua', 'La hoja de tuatua, también conocida como Jatropha gossypiifolia o tua tua, es una planta herbácea silvestre originaria de Latinoamérica. Esta planta es conocida por sus múltiples propiedades medicinales.

Características de la Hoja de Tuatua
Hojas: Son grandes, de color verde oscuro y brillante, y pueden tener un tono violeta en algunas ocasiones.

Tallo: Es cilíndrico, muy ramificado y puede alcanzar hasta 2.5 metros de altura.

Flores: Son de color purpúreo y se agrupan en inflorescencias llamativas.

Frutos: Son pequeñas cápsulas triloculares que van oscureciéndose a medida que maduran.

Usos y Beneficios
Antibiótico Natural: Las hojas y el látex del tallo se utilizan para tratar infecciones cutáneas, bucales y oculares.

Cicatrizante: El látex del tallo se usa para preparar infusiones que actúan como cicatrizantes y restauradores de tejidos.

Diurético y Purgante: Se utiliza para tratar problemas urinarios y como purgante.

Antinflamatorio: Ayuda a reducir la inflamación en diversas partes del cuerpo.

Es importante tener en cuenta que, aunque la tua tua tiene muchas propiedades beneficiosas, también puede ser tóxica si se consume en grandes cantidades', 'La Jatropha gossypiifolia, comúnmente conocida como tua tua, pertenece a la familia Euphorbiaceae. Esta familia incluye muchas plantas que son conocidas por sus propiedades medicinales y también por sus toxinas, por lo que se deben manejar con cuidado. Algunos otros miembros notables de esta familia incluyen la poinsettia (Euphorbia pulcherrima) y el árbol de ricino (Ricinus communis).', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (94, 'Tithonia Diversifolia', 'Tithonia diversifolia, también conocida como girasol mexicano, girasol japonés o acahual. Es originaria de México y Centroamérica, pero se ha naturalizado en muchas regiones tropicales y subtropicales del mundo debido a su crecimiento vigoroso y su capacidad para adaptarse a diferentes condiciones ambientales.

Características de Tithonia diversifolia
Hojas: Son grandes, lobuladas y de color verde oscuro. Las hojas pueden tener entre 10 a 40 cm de largo.

Flores: Produce flores grandes y llamativas de color amarillo anaranjado, similares a las de los girasoles. Las flores atraen a polinizadores como abejas y mariposas.

Altura: Puede crecer entre 2 y 3 metros de altura, formando arbustos densos.

Tallo: Los tallos son gruesos, leñosos y a menudo ramificados.', 'Tithonia diversifolia, conocida comúnmente como girasol mexicano, pertenece a la familia Asteraceae. Esta familia, también conocida como la familia de las compuestas, incluye una amplia variedad de plantas que son populares tanto por su valor ornamental como por sus propiedades medicinales y ecológicas. Algunos miembros notables de esta familia incluyen el girasol (Helianthus annuus), la margarita (Bellis perennis) y el diente de león (Taraxacum officinale).', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (89, 'Zamioculca', 'La Zamioculca (Zamioculcas zamiifolia), también conocida comúnmente como "planta ZZ" o "planta de la eternidad", es una planta tropical nativa de África oriental, específicamente de regiones como Kenia y Tanzania. Es muy apreciada como planta de interior debido a su resistencia y fácil mantenimiento.

Características de la Zamioculca
Hojas: Tiene hojas pinnadas, brillantes y de color verde oscuro que crecen en pecíolos gruesos.

Tamaño: Puede alcanzar una altura de entre 45 cm a 60 cm, aunque en condiciones ideales puede crecer más.

Rizomas: Crece a partir de rizomas gruesos y subterráneos que almacenan agua, lo que permite a la planta sobrevivir en condiciones de sequía.

Floración: Las flores son raras y poco vistosas, generalmente ocultas entre las hojas.', 'La Zamioculcas zamiifolia, comúnmente conocida como Zamioculca o planta ZZ, pertenece a la familia Araceae. Esta familia, también conocida como la familia de los aroides, incluye muchas otras plantas ornamentales populares como los anturios, las alocasia y las dieffenbachias.', 'No Aplica', false);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (93, 'Roya', 'La roya es una enfermedad fúngica que puede afectar a muchas plantas, incluyendo la tua tua (Jatropha gossypiifolia). Esta enfermedad se caracteriza por la aparición de manchas de color amarillo, naranja o marrón en las hojas, tallos y frutos de la planta. Las manchas suelen estar acompañadas por un polvo de esporas característico del hongo que causa la roya.

Síntomas de la Roya en la Planta Tuatua
Manchas en las hojas: Manchas de color amarillo, naranja o marrón.

Pústulas polvorientas: Pequeñas protuberancias polvorientas en el envés de las hojas.

Decoloración y marchitamiento: Las hojas pueden decolorarse y marchitarse.

Caída prematura de las hojas: En casos severos, las hojas pueden caer antes de tiempo', 'La plaga de roya, que afecta a la planta tuatua, es causada por diversos hongos que pertenecen a diferentes familias fúngicas. En general, las royas son causadas por hongos de las familias Pucciniaceae y Uropyxidaceae. Estos hongos son altamente especializados y pueden afectar a una amplia variedad de plantas, incluidos cultivos importantes.', 'Para tratar la plaga de roya en plantas como la tuatua, puedes seguir estos pasos:

Eliminación de Plantas Afectadas: Retira y destruye las hojas infectadas para reducir la cantidad de esporas en el ambiente.

Fungicidas: Aplica fungicidas específicos para roya, como aquellos que contienen azufre o cobre. Es importante seguir las instrucciones del fabricante para la aplicación adecuada.

Rotación de Cultivos: Evita plantar especies susceptibles en el mismo lugar de cultivo durante varios años para reducir la acumulación de esporas en el suelo.

Mejora de la Circulación de Aire: Asegúrate de que las plantas tengan suficiente espacio para una buena circulación de aire, lo cual ayuda a reducir la humedad y la propagación de hongos.

Riego Adecuado: Evita el riego por aspersión y opta por sistemas de riego que mantengan las hojas secas, como el riego por goteo.

Estos métodos pueden ayudar a controlar y prevenir la roya en las plantas de tuatua.', true);
INSERT INTO public."dataSet" ("id_dataSet", nombre, definicion, familia, tratamiento, amenaza) VALUES (86, 'Phyllosticta psidiicola', 'Phyllosticta psidiicola es un hongo patógeno. Este hongo causa manchas rojizas en las hojas y frutos de la guayaba, lo que puede disminuir su valor comercial2. Las manchas suelen ser visibles como áreas hundidas de diversos tamaños en los frutos y hojas', 'Phyllosticta psidiicola pertenece a la familia Botryosphaeriaceae. Esta familia incluye muchos hongos que son patógenos de plantas y pueden causar diversas enfermedades, como manchas foliares, cancro y pudriciones.', 'Para tratar la infección por Phyllosticta psidiicola en las plantas de guayaba, puedes seguir estos pasos:

Control Cultural: Mantén el área de cultivo limpia eliminando restos de plantas infectadas y desechos de cultivo. Esto ayuda a reducir la cantidad de esporas en el suelo.

Riego Adecuado: Evita el riego excesivo y asegúrate de que el suelo tenga un buen drenaje para evitar condiciones de humedad que favorecen el crecimiento del hongo.

Uso de Fungicidas: Aplica fungicidas adecuados, como aquellos que contienen hexaconazol (0.1%), propiconazol (0.1%) o carbendazim + mancozeb. Pulveriza las plantas cuando se observe la enfermedad por primera vez y repite la aplicación dos veces con un intervalo de 20 días.

Manejo de pH del Suelo: Aumenta el pH del suelo aplicando cal, lo que puede ayudar a reducir la incidencia de la enfermedad.

Control Biológico: Si está disponible, utiliza métodos de control biológico para reducir la población del hongo.', true);


--
-- TOC entry 4992 (class 0 OID 18547)
-- Dependencies: 242
-- Data for Name: espacios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.espacios ("Id_espacios", nombre_espacio, estatus, recursos_hidricos, historial_uso, observaciones, tipo_riego, "Habilitado", poligono_id) VALUES (12, 'poligono2', 'Activo', 'pozo', 'ninguno', 'ninguna', 'Goteo', 1, 29);
INSERT INTO public.espacios ("Id_espacios", nombre_espacio, estatus, recursos_hidricos, historial_uso, observaciones, tipo_riego, "Habilitado", poligono_id) VALUES (13, 'poligono1', 'Activo', 'tanque de agua', 'ninguno', 'ninguna', 'Aspercion', 1, 28);
INSERT INTO public.espacios ("Id_espacios", nombre_espacio, estatus, recursos_hidricos, historial_uso, observaciones, tipo_riego, "Habilitado", poligono_id) VALUES (14, 'poligono3', 'Activo', 'tanque', 'fresa', 'ninguna', 'Inundacion', 1, 31);


--
-- TOC entry 4997 (class 0 OID 18592)
-- Dependencies: 247
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.modelo (id_modelo, "pesosH5", "modelsH5", prediccion_py, tiempo) VALUES (11, NULL, NULL, NULL, '03:33:48');
INSERT INTO public.modelo (id_modelo, "pesosH5", "modelsH5", prediccion_py, tiempo) VALUES (12, NULL, NULL, NULL, '03:37:03');
INSERT INTO public.modelo (id_modelo, "pesosH5", "modelsH5", prediccion_py, tiempo) VALUES (13, NULL, NULL, NULL, '00:10:43');
INSERT INTO public.modelo (id_modelo, "pesosH5", "modelsH5", prediccion_py, tiempo) VALUES (14, NULL, NULL, NULL, '13:10:41');


--
-- TOC entry 4968 (class 0 OID 17764)
-- Dependencies: 218
-- Data for Name: modulo_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 0 OID 18140)
-- Dependencies: 235
-- Data for Name: notificaciones_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.notificaciones_movil (id_notificacion, etiqueta, expansion) VALUES (1, true, false);


--
-- TOC entry 4989 (class 0 OID 18433)
-- Dependencies: 239
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil ("Id_Perfil", nombre_perfil, estado) VALUES (1, 'ADMINISTRADOR', 'Activo');
INSERT INTO public.perfil ("Id_Perfil", nombre_perfil, estado) VALUES (163, 'OPERADOR', 'Activo');
INSERT INTO public.perfil ("Id_Perfil", nombre_perfil, estado) VALUES (164, 'INSPECTOR', 'Activo');
INSERT INTO public.perfil ("Id_Perfil", nombre_perfil, estado) VALUES (165, 'PERFILII', 'Activo');
INSERT INTO public.perfil ("Id_Perfil", nombre_perfil, estado) VALUES (5, 'test', 'activo');


--
-- TOC entry 4972 (class 0 OID 17774)
-- Dependencies: 222
-- Data for Name: perfil_modulo_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 17768)
-- Dependencies: 220
-- Data for Name: perfil_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil_movil ("Id_Perfil", nombre_perfil, estado, trial377) VALUES (16, 'Administrador Movil', 'activo', NULL);
INSERT INTO public.perfil_movil ("Id_Perfil", nombre_perfil, estado, trial377) VALUES (34, 'Supervisor Movil', 'activo', NULL);
INSERT INTO public.perfil_movil ("Id_Perfil", nombre_perfil, estado, trial377) VALUES (33, 'Operador Movil', 'activo', NULL);


--
-- TOC entry 4973 (class 0 OID 17777)
-- Dependencies: 223
-- Data for Name: perfil_programa_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (33, 2, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (33, 3, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (33, 5, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (33, 1, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 2, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 3, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 4, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 5, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 5, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (16, 1, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (34, 4, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (34, 5, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (34, 5, NULL);
INSERT INTO public.perfil_programa_movil ("Id_Perfil", "Id_Programa", trial380) VALUES (34, 1, NULL);


--
-- TOC entry 4974 (class 0 OID 17780)
-- Dependencies: 224
-- Data for Name: perfil_subprograma_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (16, 1, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (16, 2, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (16, 3, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (33, 1, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (33, 3, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (34, 1, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (34, 2, NULL);
INSERT INTO public.perfil_subprograma_movil ("Id_Perfil", "Id_Subprograma", trial383) VALUES (34, 3, NULL);


--
-- TOC entry 4975 (class 0 OID 17800)
-- Dependencies: 225
-- Data for Name: privilegios_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.privilegios_movil (id_privilegio, id_perfil, ver, editar, eliminar, imprimir, agregar, trial390) VALUES (15, 16, 'true', 'true', 'true', 'true', 'true', NULL);
INSERT INTO public.privilegios_movil (id_privilegio, id_perfil, ver, editar, eliminar, imprimir, agregar, trial390) VALUES (33, 34, 'true', 'false', 'false', 'true', 'false', NULL);
INSERT INTO public.privilegios_movil (id_privilegio, id_perfil, ver, editar, eliminar, imprimir, agregar, trial390) VALUES (32, 33, 'true', 'true', 'true', 'false', 'false', NULL);


--
-- TOC entry 4977 (class 0 OID 17806)
-- Dependencies: 227
-- Data for Name: programa_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (1, 'Inicio', NULL);
INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (2, 'Animales', NULL);
INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (3, 'Cultivos', NULL);
INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (4, 'Usuarios', NULL);
INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (6, 'Configuracion', NULL);
INSERT INTO public.programa_movil ("Id_Programa", nombre, trial393) VALUES (5, 'IA', NULL);


--
-- TOC entry 4979 (class 0 OID 17823)
-- Dependencies: 229
-- Data for Name: sub_programa_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sub_programa_movil ("Id_Subprograma", "Id_ProgramaS", nombre_subp, trial406) VALUES (1, 5, 'Detector', NULL);
INSERT INTO public.sub_programa_movil ("Id_Subprograma", "Id_ProgramaS", nombre_subp, trial406) VALUES (2, 5, 'Modelos', NULL);
INSERT INTO public.sub_programa_movil ("Id_Subprograma", "Id_ProgramaS", nombre_subp, trial406) VALUES (3, 6, 'Conexion', NULL);


--
-- TOC entry 4986 (class 0 OID 18420)
-- Dependencies: 236
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios ("Id_Usuario", "Id_Perfilp", "Usuario", "Clave", "Nombre", "Apellido", tipo_usuario, "Respuesta_1", "Respuesta_2", "Respuesta_3", "Habilitado", "Fecha", "Id_Perfil_Movil") VALUES (1, 1, 'ADMINISTRADOR', '$2y$10$sVZfQflNKGsygthGDr4X4u3fsu3aGMlIkcdZFsHic5.9dD.MzqJze', 'ADMINISTRADOR', 'ADMINISTRADOR', 'prueba', 'ADMINISTRADOR', 'ADMINISTRADOR', 'ADMINISTRADOR', 1, '2024-01-29 15:06:10', 16);
INSERT INTO public.usuarios ("Id_Usuario", "Id_Perfilp", "Usuario", "Clave", "Nombre", "Apellido", tipo_usuario, "Respuesta_1", "Respuesta_2", "Respuesta_3", "Habilitado", "Fecha", "Id_Perfil_Movil") VALUES (74, 164, 'INSPECTOR', '$2y$10$3wcvicJGEH.NRmWHSu9w0OrnuMJ6fhRq0qXUM7x94I9l1ndMVo83G', 'INSPECTOR', 'INSPECTOR', 'INSPECTOR', 'INSPECTOR', 'INSPECTOR', 'INSPECTOR', 1, '2024-03-31 22:12:20', 34);
INSERT INTO public.usuarios ("Id_Usuario", "Id_Perfilp", "Usuario", "Clave", "Nombre", "Apellido", tipo_usuario, "Respuesta_1", "Respuesta_2", "Respuesta_3", "Habilitado", "Fecha", "Id_Perfil_Movil") VALUES (73, 163, 'OPERADOR', '$2y$10$eSTYkHU1OsS8JSP7Rd98TuGG1S71STapbGK6EXrrWfBNB3gK2dfMq', 'OPERADOR', 'OPERADOR', 'OPERADOR', 'OPERADOR', 'OPERADOR', 'OPERADOR', 1, '2024-03-31 22:11:57', 0);


--
-- TOC entry 4981 (class 0 OID 17827)
-- Dependencies: 231
-- Data for Name: usuarios_movil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios_movil ("Id_Usuario", "Id_Perfilp", "Usuario", "Clave", "Nombre", "Apellido", tipo_usuario, "Respuesta_1", "Respuesta_2", "Respuesta_3", "Habilitado", "Fecha", trial413) VALUES (5, 16, 'Ddaniel', '123456', 'Daniel', 'Molnar', 'admin', 'res1', 'res2', 'res3', 1, '2002-12-17 00:00:00', NULL);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 215
-- Name: costo_fijo_id_fijo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.costo_fijo_id_fijo_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 216
-- Name: costo_variable_id_variable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.costo_variable_id_variable_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 245
-- Name: cultivos_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."cultivos_ID_seq"', 20, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 233
-- Name: dataSet_id_dataSet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."dataSet_id_dataSet_seq"', 95, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 217
-- Name: datos_veterinarios_id_veterinario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datos_veterinarios_id_veterinario_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 243
-- Name: espacios_Id_espacios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."espacios_Id_espacios_seq"', 14, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 246
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_modelo_seq', 14, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 219
-- Name: modulo_Id_Modulos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."modulo_Id_Modulos_seq"', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: perfil_Id_Perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."perfil_Id_Perfil_seq"', 130, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 238
-- Name: perfil_Id_Perfil_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."perfil_Id_Perfil_seq1"', 5, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 240
-- Name: plagas_id_plaga_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plagas_id_plaga_seq', 30, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 226
-- Name: privilegios_id_privilegio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privilegios_id_privilegio_seq', 130, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 228
-- Name: programa_Id_Programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."programa_Id_Programa_seq"', 6, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 230
-- Name: sub_programa_Id_Subprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sub_programa_Id_Subprograma_seq"', 5, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: usuarios_Id_Usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuarios_Id_Usuario_seq"', 8, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 237
-- Name: usuarios_Id_Usuario_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuarios_Id_Usuario_seq1"', 9, true);


--
-- TOC entry 4808 (class 2606 OID 18577)
-- Name: cultivos cultivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivos
    ADD CONSTRAINT cultivos_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4798 (class 2606 OID 18139)
-- Name: dataSet dataSet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."dataSet"
    ADD CONSTRAINT "dataSet_pkey" PRIMARY KEY ("id_dataSet");


--
-- TOC entry 4810 (class 2606 OID 18599)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);


--
-- TOC entry 4800 (class 2606 OID 18144)
-- Name: notificaciones_movil notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones_movil
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 4804 (class 2606 OID 18440)
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY ("Id_Perfil");


--
-- TOC entry 4786 (class 2606 OID 17911)
-- Name: modulo_movil pk_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_movil
    ADD CONSTRAINT pk_modulo PRIMARY KEY ("Id_Modulos");


--
-- TOC entry 4788 (class 2606 OID 17913)
-- Name: perfil_movil pk_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_movil
    ADD CONSTRAINT pk_perfil PRIMARY KEY ("Id_Perfil");


--
-- TOC entry 4790 (class 2606 OID 17919)
-- Name: privilegios_movil pk_privilegios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_movil
    ADD CONSTRAINT pk_privilegios PRIMARY KEY (id_privilegio);


--
-- TOC entry 4792 (class 2606 OID 17921)
-- Name: programa_movil pk_programa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_movil
    ADD CONSTRAINT pk_programa PRIMARY KEY ("Id_Programa");


--
-- TOC entry 4794 (class 2606 OID 17927)
-- Name: sub_programa_movil pk_sub_programa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_programa_movil
    ADD CONSTRAINT pk_sub_programa PRIMARY KEY ("Id_Subprograma");


--
-- TOC entry 4796 (class 2606 OID 17929)
-- Name: usuarios_movil pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_movil
    ADD CONSTRAINT pk_usuarios PRIMARY KEY ("Id_Usuario");


--
-- TOC entry 4806 (class 2606 OID 18546)
-- Name: cultivo_plaga plagas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivo_plaga
    ADD CONSTRAINT plagas_pkey PRIMARY KEY (id_plaga);


--
-- TOC entry 4802 (class 2606 OID 18431)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY ("Id_Usuario");


--
-- TOC entry 4821 (class 2606 OID 18578)
-- Name: cultivo_plaga cult_plaga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivo_plaga
    ADD CONSTRAINT cult_plaga FOREIGN KEY (id) REFERENCES public.cultivos("ID") NOT VALID;


--
-- TOC entry 4811 (class 2606 OID 18052)
-- Name: modulo_movil fk_modulo_sub_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_movil
    ADD CONSTRAINT fk_modulo_sub_programa FOREIGN KEY ("Id_Subprograma") REFERENCES public.sub_programa_movil("Id_Subprograma");


--
-- TOC entry 4812 (class 2606 OID 18057)
-- Name: perfil_modulo_movil fk_perfil_modulo_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_modulo_movil
    ADD CONSTRAINT fk_perfil_modulo_modulo FOREIGN KEY ("Id_Modulo") REFERENCES public.modulo_movil("Id_Modulos");


--
-- TOC entry 4813 (class 2606 OID 18062)
-- Name: perfil_modulo_movil fk_perfil_modulo_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_modulo_movil
    ADD CONSTRAINT fk_perfil_modulo_perfil FOREIGN KEY ("Id_Perfil") REFERENCES public.perfil_movil("Id_Perfil");


--
-- TOC entry 4814 (class 2606 OID 18067)
-- Name: perfil_programa_movil fk_perfil_programa_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_programa_movil
    ADD CONSTRAINT fk_perfil_programa_perfil FOREIGN KEY ("Id_Perfil") REFERENCES public.perfil_movil("Id_Perfil");


--
-- TOC entry 4815 (class 2606 OID 18072)
-- Name: perfil_programa_movil fk_perfil_programa_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_programa_movil
    ADD CONSTRAINT fk_perfil_programa_programa FOREIGN KEY ("Id_Programa") REFERENCES public.programa_movil("Id_Programa");


--
-- TOC entry 4816 (class 2606 OID 18077)
-- Name: perfil_subprograma_movil fk_perfil_subprograma_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_subprograma_movil
    ADD CONSTRAINT fk_perfil_subprograma_perfil FOREIGN KEY ("Id_Perfil") REFERENCES public.perfil_movil("Id_Perfil");


--
-- TOC entry 4817 (class 2606 OID 18082)
-- Name: perfil_subprograma_movil fk_perfil_subprograma_sub_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil_subprograma_movil
    ADD CONSTRAINT fk_perfil_subprograma_sub_programa FOREIGN KEY ("Id_Subprograma") REFERENCES public.sub_programa_movil("Id_Subprograma") NOT VALID;


--
-- TOC entry 4818 (class 2606 OID 18087)
-- Name: privilegios_movil fk_privilegios_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_movil
    ADD CONSTRAINT fk_privilegios_perfil FOREIGN KEY (id_perfil) REFERENCES public.perfil_movil("Id_Perfil");


--
-- TOC entry 4820 (class 2606 OID 18102)
-- Name: usuarios_movil fk_usuarios_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_movil
    ADD CONSTRAINT fk_usuarios_perfil FOREIGN KEY ("Id_Perfilp") REFERENCES public.perfil_movil("Id_Perfil");


--
-- TOC entry 4819 (class 2606 OID 18107)
-- Name: sub_programa_movil pk_subprograma_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_programa_movil
    ADD CONSTRAINT pk_subprograma_programa FOREIGN KEY ("Id_ProgramaS") REFERENCES public.programa_movil("Id_Programa") NOT VALID;


-- Completed on 2024-12-09 21:17:08

--
-- PostgreSQL database dump complete
--

