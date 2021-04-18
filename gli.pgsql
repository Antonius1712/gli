--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

SET default_table_access_method = heap;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: tbl_master_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_master_user (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tbl_master_user OWNER TO postgres;

--
-- Name: tbl_master_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_master_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_master_user_id_seq OWNER TO postgres;

--
-- Name: tbl_master_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_master_user_id_seq OWNED BY public.tbl_master_user.id;


--
-- Name: tbl_master_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_master_user_role (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tbl_master_user_role OWNER TO postgres;

--
-- Name: tbl_master_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_master_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_master_user_role_id_seq OWNER TO postgres;

--
-- Name: tbl_master_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_master_user_role_id_seq OWNED BY public.tbl_master_user_role.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: tbl_master_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_master_user ALTER COLUMN id SET DEFAULT nextval('public.tbl_master_user_id_seq'::regclass);


--
-- Name: tbl_master_user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_master_user_role ALTER COLUMN id SET DEFAULT nextval('public.tbl_master_user_role_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
3	2014_10_12_000000_create_users_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2021_04_17_040015_create_tbl_master_user	1
6	2021_04_17_040219_create_tbl_master_user_role	1
\.


--
-- Data for Name: tbl_master_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_master_user (id, role_id, username, password, email, created_at, updated_at) FROM stdin;
41	1	warior	$2y$10$cYMUW6MxPyomgItub7G.Q.nxABuf4Pn3LtmCIF7Nn090nrS9JAjFm	login123@gmail.com	2021-04-17 19:54:17	2021-04-17 19:54:17
45	4	dtogel	$2y$10$ZX2iKlJBu.fwYWwF3pJVl.1oPAXdB5iSz0N1ymgBfnc9a0m/3Do.O	login123@gmail.com	2021-04-18 04:22:47	2021-04-18 04:22:47
47	1	diw@diw.co.id	$2y$10$tGqzE1vML9WCCPFb4aaUyeMWp6srqx2LFMUx9VwF7NIRNXyWKDnce	asd@gmail.com	2021-04-18 05:15:29	2021-04-18 05:15:29
48	1	antoniusc121	$2y$10$3PJUXYGCsbBA5VDHqfh8WOI4L.t/KrBcC78n4kEBgctzgZVhbxBje	login123@gmail.com	2021-04-18 05:15:42	2021-04-18 05:15:42
49	1	anton123	$2y$10$rTh6ZFaInaPxt3LD7b6zXeqalkwaoD6FslF2WRgniohzkTwEnGqdm	asd@gmail.com	2021-04-18 05:21:37	2021-04-18 05:21:37
50	1	antonius1713	$2y$10$QXfK.AODcpDoyh6TSBRF8Omfbs8dFZ3ONOFToSFKOY8NHpXvbvwwa	asdsad@gmail.com	2021-04-18 05:22:35	2021-04-18 05:22:35
51	1	flasecret	$2y$10$Vbr5C/GJUnlKpL15xSLbKukkYfzdP1v3KTYiB4JnCYlEn64iah9Oy	dsager@gmail.com	2021-04-18 05:23:00	2021-04-18 05:23:00
\.


--
-- Data for Name: tbl_master_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_master_user_role (id, name, created_at, updated_at) FROM stdin;
1	Super Admin	\N	\N
3	User	\N	\N
4	DBA	2021-04-17 20:11:03	2021-04-17 20:11:03
6	Web Dev	2021-04-17 20:22:26	2021-04-17 20:22:26
7	Mobile Dev	2021-04-17 20:22:42	2021-04-17 20:22:42
8	UI	2021-04-17 20:23:03	2021-04-17 20:23:03
9	QA	2021-04-17 20:35:57	2021-04-17 20:35:57
12	DBA2	2021-04-17 20:44:17	2021-04-17 20:44:17
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- Name: tbl_master_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_master_user_id_seq', 51, true);


--
-- Name: tbl_master_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_master_user_role_id_seq', 12, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: tbl_master_user tbl_master_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_master_user
    ADD CONSTRAINT tbl_master_user_pkey PRIMARY KEY (id);


--
-- Name: tbl_master_user_role tbl_master_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_master_user_role
    ADD CONSTRAINT tbl_master_user_role_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

