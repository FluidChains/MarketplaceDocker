--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO rails;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    nombre_categoria character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying
);


ALTER TABLE public.categories OWNER TO rails;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO rails;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: has_categories; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.has_categories (
    id bigint NOT NULL,
    service_id bigint,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.has_categories OWNER TO rails;

--
-- Name: has_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.has_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_categories_id_seq OWNER TO rails;

--
-- Name: has_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.has_categories_id_seq OWNED BY public.has_categories.id;


--
-- Name: has_skills; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.has_skills (
    id bigint NOT NULL,
    service_id bigint,
    skill_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.has_skills OWNER TO rails;

--
-- Name: has_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.has_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_skills_id_seq OWNER TO rails;

--
-- Name: has_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.has_skills_id_seq OWNED BY public.has_skills.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    mensaje text,
    contacto_mail character varying,
    user_id bigint,
    service_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requests OWNER TO rails;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO rails;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rails;

--
-- Name: services; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying,
    information text,
    skills text,
    precio integer,
    valid_until date,
    aditional_info text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    lenguaje text,
    exos_amount integer,
    mail_servicio character varying,
    horas integer,
    wpp character varying,
    web text,
    currency_sugest character varying,
    state character varying DEFAULT 'published'::character varying
);


ALTER TABLE public.services OWNER TO rails;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO rails;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.skills (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color_tag character varying
);


ALTER TABLE public.skills OWNER TO rails;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO rails;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rails
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    name character varying,
    last_name character varying,
    mail character varying,
    company character varying,
    web_site character varying,
    skill character varying,
    lenguage character varying,
    discord_user character varying,
    wpp character varying,
    udi character varying,
    provider character varying,
    permission_level integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


ALTER TABLE public.users OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: has_categories id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_categories ALTER COLUMN id SET DEFAULT nextval('public.has_categories_id_seq'::regclass);


--
-- Name: has_skills id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_skills ALTER COLUMN id SET DEFAULT nextval('public.has_skills_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2020-05-18 08:04:07.179104	2020-05-18 08:04:07.179104
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.categories (id, nombre_categoria, description, created_at, updated_at, color) FROM stdin;
1	Que necesitas	Crea una publicación con los servicios que necesitas encontrar en la comunidad Rutanio	2020-05-23 07:24:18.724116	2020-05-23 07:24:18.724116	#331038
2	Que ofreces	Crea una publicación con los servicios de tu portafolio y expande tu mercado.	2020-05-23 07:25:30.141388	2020-05-23 07:25:30.141388	#ff4663
\.


--
-- Data for Name: has_categories; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.has_categories (id, service_id, category_id, created_at, updated_at) FROM stdin;
2	2	2	2020-05-23 08:54:48.902367	2020-05-23 08:54:48.902367
3	3	2	2020-05-23 09:02:33.123464	2020-05-23 09:02:33.123464
4	4	2	2020-05-23 09:11:53.538847	2020-05-23 09:11:53.538847
6	6	2	2020-05-23 09:31:22.997079	2020-05-23 09:31:22.997079
7	7	2	2020-05-23 09:36:37.229962	2020-05-23 09:36:37.229962
8	8	2	2020-05-23 10:16:03.445858	2020-05-23 10:16:03.445858
9	9	2	2020-05-23 10:19:51.289165	2020-05-23 10:19:51.289165
10	10	2	2020-05-23 10:29:03.547268	2020-05-23 10:29:03.547268
11	11	2	2020-05-23 10:32:02.462571	2020-05-23 10:32:02.462571
12	12	2	2020-05-23 10:36:44.572275	2020-05-23 10:36:44.572275
13	13	2	2020-05-23 10:40:49.22716	2020-05-23 10:40:49.22716
14	14	2	2020-05-23 10:45:51.663723	2020-05-23 10:45:51.663723
15	15	2	2020-05-23 10:54:37.634296	2020-05-23 10:54:37.634296
16	16	2	2020-05-23 11:00:06.798343	2020-05-23 11:00:06.798343
17	17	2	2020-05-23 11:05:10.998397	2020-05-23 11:05:10.998397
18	18	2	2020-05-23 11:08:55.698125	2020-05-23 11:08:55.698125
19	19	2	2020-05-23 11:12:48.368003	2020-05-23 11:12:48.368003
20	20	2	2020-05-23 11:15:12.428573	2020-05-23 11:15:12.428573
21	21	2	2020-05-26 19:15:48.706041	2020-05-26 19:15:48.706041
22	22	1	2020-05-27 21:39:31.624677	2020-05-27 21:39:31.624677
23	23	2	2020-05-27 21:57:03.562882	2020-05-27 21:57:03.562882
25	25	2	2020-06-08 13:00:33.179967	2020-06-08 13:00:33.179967
26	26	1	2020-06-11 22:11:22.445646	2020-06-11 22:11:22.445646
27	27	2	2020-06-11 22:23:45.145942	2020-06-11 22:23:45.145942
28	28	1	2020-06-11 22:26:08.96873	2020-06-11 22:26:08.96873
29	29	1	2020-06-11 22:29:14.567154	2020-06-11 22:29:14.567154
30	30	1	2020-06-16 13:44:07.769703	2020-06-16 13:44:07.769703
31	31	2	2020-06-26 17:57:18.411582	2020-06-26 17:57:18.411582
32	32	1	2020-06-26 18:10:00.805995	2020-06-26 18:10:00.805995
33	33	2	2020-07-02 22:00:15.398711	2020-07-02 22:00:15.398711
34	34	1	2020-07-04 17:50:46.055251	2020-07-04 17:50:46.055251
35	35	2	2020-07-09 21:18:26.439695	2020-07-09 21:18:26.439695
36	36	2	2020-07-10 16:21:23.643561	2020-07-10 16:21:23.643561
37	37	2	2020-07-10 16:21:28.822893	2020-07-10 16:21:28.822893
38	38	2	2020-07-14 19:36:13.502465	2020-07-14 19:36:13.502465
39	39	1	2020-07-15 16:51:38.372895	2020-07-15 16:51:38.372895
40	40	1	2020-07-15 19:35:02.412529	2020-07-15 19:35:02.412529
41	41	1	2020-07-15 19:43:34.883103	2020-07-15 19:43:34.883103
42	42	1	2020-07-15 20:24:39.310338	2020-07-15 20:24:39.310338
43	43	2	2020-07-15 20:24:41.474272	2020-07-15 20:24:41.474272
44	44	1	2020-07-15 21:57:37.549245	2020-07-15 21:57:37.549245
45	45	1	2020-07-15 21:57:38.783116	2020-07-15 21:57:38.783116
46	46	2	2020-07-16 16:36:57.881818	2020-07-16 16:36:57.881818
47	47	2	2020-07-17 13:10:52.112018	2020-07-17 13:10:52.112018
48	48	1	2020-07-17 16:55:47.808161	2020-07-17 16:55:47.808161
49	49	2	2020-07-17 16:56:03.758829	2020-07-17 16:56:03.758829
50	50	2	2020-07-17 23:18:25.951502	2020-07-17 23:18:25.951502
51	51	1	2020-07-17 23:21:12.694079	2020-07-17 23:21:12.694079
52	52	1	2020-07-21 22:42:39.273561	2020-07-21 22:42:39.273561
54	54	2	2020-07-22 19:21:50.617106	2020-07-22 19:21:50.617106
56	56	2	2020-07-23 16:04:31.979999	2020-07-23 16:04:31.979999
57	57	2	2020-07-23 20:45:14.974478	2020-07-23 20:45:14.974478
58	58	2	2020-07-24 20:42:07.143573	2020-07-24 20:42:07.143573
59	59	2	2020-07-25 00:39:11.339316	2020-07-25 00:39:11.339316
63	63	2	2020-07-28 23:11:07.108206	2020-07-28 23:11:07.108206
64	64	2	2020-07-28 23:25:08.970759	2020-07-28 23:25:08.970759
65	65	2	2020-07-31 16:57:39.0615	2020-07-31 16:57:39.0615
66	66	2	2020-07-31 16:59:57.892157	2020-07-31 16:59:57.892157
67	67	1	2020-07-31 17:06:51.133517	2020-07-31 17:06:51.133517
68	68	2	2020-07-31 18:33:36.752379	2020-07-31 18:33:36.752379
69	69	2	2020-07-31 21:19:47.373261	2020-07-31 21:19:47.373261
72	72	1	2020-08-03 23:03:59.821916	2020-08-03 23:03:59.821916
\.


--
-- Data for Name: has_skills; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.has_skills (id, service_id, skill_id, created_at, updated_at) FROM stdin;
8	2	4	2020-05-23 08:54:48.904914	2020-05-23 08:54:48.904914
9	3	4	2020-05-23 09:02:33.126265	2020-05-23 09:02:33.126265
10	3	5	2020-05-23 09:02:33.128722	2020-05-23 09:02:33.128722
11	4	2	2020-05-23 09:11:53.541529	2020-05-23 09:11:53.541529
12	4	4	2020-05-23 09:11:53.544027	2020-05-23 09:11:53.544027
13	4	5	2020-05-23 09:11:53.546258	2020-05-23 09:11:53.546258
16	6	5	2020-05-23 09:31:23.000716	2020-05-23 09:31:23.000716
17	7	2	2020-05-23 09:36:37.232747	2020-05-23 09:36:37.232747
18	7	4	2020-05-23 09:36:37.235079	2020-05-23 09:36:37.235079
19	7	5	2020-05-23 09:36:37.237363	2020-05-23 09:36:37.237363
20	8	5	2020-05-23 10:16:03.448989	2020-05-23 10:16:03.448989
21	9	5	2020-05-23 10:19:51.291717	2020-05-23 10:19:51.291717
22	10	5	2020-05-23 10:29:03.549882	2020-05-23 10:29:03.549882
23	11	5	2020-05-23 10:32:02.465045	2020-05-23 10:32:02.465045
24	12	5	2020-05-23 10:36:44.57472	2020-05-23 10:36:44.57472
25	13	5	2020-05-23 10:40:49.229594	2020-05-23 10:40:49.229594
26	14	1	2020-05-23 10:45:51.666096	2020-05-23 10:45:51.666096
27	14	2	2020-05-23 10:45:51.668225	2020-05-23 10:45:51.668225
28	14	3	2020-05-23 10:45:51.670261	2020-05-23 10:45:51.670261
29	14	4	2020-05-23 10:45:51.672339	2020-05-23 10:45:51.672339
30	14	5	2020-05-23 10:45:51.674313	2020-05-23 10:45:51.674313
31	14	6	2020-05-23 10:45:51.676332	2020-05-23 10:45:51.676332
32	14	7	2020-05-23 10:45:51.678298	2020-05-23 10:45:51.678298
33	15	5	2020-05-23 10:54:37.638709	2020-05-23 10:54:37.638709
34	16	2	2020-05-23 11:00:06.801278	2020-05-23 11:00:06.801278
35	16	6	2020-05-23 11:00:06.803924	2020-05-23 11:00:06.803924
36	17	4	2020-05-23 11:05:11.000972	2020-05-23 11:05:11.000972
37	18	5	2020-05-23 11:08:55.701311	2020-05-23 11:08:55.701311
38	19	4	2020-05-23 11:12:48.371016	2020-05-23 11:12:48.371016
39	19	5	2020-05-23 11:12:48.373874	2020-05-23 11:12:48.373874
40	20	4	2020-05-23 11:15:12.432371	2020-05-23 11:15:12.432371
41	20	5	2020-05-23 11:15:12.435788	2020-05-23 11:15:12.435788
42	21	1	2020-05-26 19:15:48.722091	2020-05-26 19:15:48.722091
43	21	6	2020-05-26 19:15:48.727276	2020-05-26 19:15:48.727276
44	21	7	2020-05-26 19:15:48.731624	2020-05-26 19:15:48.731624
45	21	8	2020-05-26 19:15:48.735819	2020-05-26 19:15:48.735819
46	22	5	2020-05-27 21:39:31.638783	2020-05-27 21:39:31.638783
47	23	1	2020-05-27 21:57:03.566965	2020-05-27 21:57:03.566965
48	23	7	2020-05-27 21:57:03.570964	2020-05-27 21:57:03.570964
54	25	1	2020-06-08 13:00:33.18881	2020-06-08 13:00:33.18881
55	25	2	2020-06-08 13:00:33.191765	2020-06-08 13:00:33.191765
56	26	3	2020-06-11 22:11:22.453904	2020-06-11 22:11:22.453904
57	27	8	2020-06-11 22:23:45.149505	2020-06-11 22:23:45.149505
58	28	2	2020-06-11 22:26:08.972419	2020-06-11 22:26:08.972419
59	29	1	2020-06-11 22:29:14.569691	2020-06-11 22:29:14.569691
60	29	5	2020-06-11 22:29:14.572069	2020-06-11 22:29:14.572069
61	30	4	2020-06-16 13:44:07.772893	2020-06-16 13:44:07.772893
62	30	5	2020-06-16 13:44:07.775561	2020-06-16 13:44:07.775561
63	31	2	2020-06-26 17:57:18.420082	2020-06-26 17:57:18.420082
64	31	4	2020-06-26 17:57:18.43933	2020-06-26 17:57:18.43933
65	31	5	2020-06-26 17:57:18.441922	2020-06-26 17:57:18.441922
66	32	1	2020-06-26 18:10:00.808671	2020-06-26 18:10:00.808671
67	32	7	2020-06-26 18:10:00.811133	2020-06-26 18:10:00.811133
68	33	4	2020-07-02 22:00:15.402417	2020-07-02 22:00:15.402417
69	33	5	2020-07-02 22:00:15.406217	2020-07-02 22:00:15.406217
70	34	1	2020-07-04 17:50:46.058374	2020-07-04 17:50:46.058374
71	34	2	2020-07-04 17:50:46.061117	2020-07-04 17:50:46.061117
72	35	1	2020-07-09 21:18:26.448873	2020-07-09 21:18:26.448873
73	35	2	2020-07-09 21:18:26.452006	2020-07-09 21:18:26.452006
74	35	3	2020-07-09 21:18:26.454503	2020-07-09 21:18:26.454503
75	35	4	2020-07-09 21:18:26.457044	2020-07-09 21:18:26.457044
76	35	5	2020-07-09 21:18:26.459652	2020-07-09 21:18:26.459652
77	35	6	2020-07-09 21:18:26.462177	2020-07-09 21:18:26.462177
78	35	7	2020-07-09 21:18:26.464518	2020-07-09 21:18:26.464518
79	35	8	2020-07-09 21:18:26.466784	2020-07-09 21:18:26.466784
80	36	1	2020-07-10 16:21:23.646464	2020-07-10 16:21:23.646464
81	36	2	2020-07-10 16:21:23.649124	2020-07-10 16:21:23.649124
82	36	6	2020-07-10 16:21:23.651481	2020-07-10 16:21:23.651481
83	37	1	2020-07-10 16:21:28.825467	2020-07-10 16:21:28.825467
84	37	2	2020-07-10 16:21:28.827793	2020-07-10 16:21:28.827793
85	38	1	2020-07-14 19:36:13.506145	2020-07-14 19:36:13.506145
86	38	2	2020-07-14 19:36:13.509357	2020-07-14 19:36:13.509357
87	38	3	2020-07-14 19:36:13.512143	2020-07-14 19:36:13.512143
88	38	4	2020-07-14 19:36:13.515109	2020-07-14 19:36:13.515109
89	38	5	2020-07-14 19:36:13.517804	2020-07-14 19:36:13.517804
90	38	6	2020-07-14 19:36:13.520577	2020-07-14 19:36:13.520577
91	38	7	2020-07-14 19:36:13.523094	2020-07-14 19:36:13.523094
92	38	8	2020-07-14 19:36:13.525491	2020-07-14 19:36:13.525491
93	39	3	2020-07-15 16:51:38.375735	2020-07-15 16:51:38.375735
94	40	7	2020-07-15 19:35:02.415513	2020-07-15 19:35:02.415513
95	40	8	2020-07-15 19:35:02.41827	2020-07-15 19:35:02.41827
96	41	6	2020-07-15 19:43:34.885866	2020-07-15 19:43:34.885866
97	41	7	2020-07-15 19:43:34.88849	2020-07-15 19:43:34.88849
98	42	1	2020-07-15 20:24:39.314135	2020-07-15 20:24:39.314135
99	42	4	2020-07-15 20:24:39.316959	2020-07-15 20:24:39.316959
100	42	5	2020-07-15 20:24:39.319258	2020-07-15 20:24:39.319258
101	42	6	2020-07-15 20:24:39.321662	2020-07-15 20:24:39.321662
102	42	7	2020-07-15 20:24:39.32481	2020-07-15 20:24:39.32481
103	43	1	2020-07-15 20:24:41.476899	2020-07-15 20:24:41.476899
104	43	4	2020-07-15 20:24:41.479653	2020-07-15 20:24:41.479653
105	43	5	2020-07-15 20:24:41.481956	2020-07-15 20:24:41.481956
106	44	1	2020-07-15 21:57:37.552273	2020-07-15 21:57:37.552273
107	44	4	2020-07-15 21:57:37.554884	2020-07-15 21:57:37.554884
108	44	5	2020-07-15 21:57:37.557147	2020-07-15 21:57:37.557147
109	45	1	2020-07-15 21:57:38.785789	2020-07-15 21:57:38.785789
110	45	4	2020-07-15 21:57:38.788242	2020-07-15 21:57:38.788242
111	45	7	2020-07-15 21:57:38.790504	2020-07-15 21:57:38.790504
112	46	5	2020-07-16 16:36:57.884767	2020-07-16 16:36:57.884767
113	47	1	2020-07-17 13:10:52.115066	2020-07-17 13:10:52.115066
114	47	2	2020-07-17 13:10:52.117752	2020-07-17 13:10:52.117752
115	47	3	2020-07-17 13:10:52.120192	2020-07-17 13:10:52.120192
116	47	4	2020-07-17 13:10:52.122597	2020-07-17 13:10:52.122597
117	47	5	2020-07-17 13:10:52.125006	2020-07-17 13:10:52.125006
118	47	6	2020-07-17 13:10:52.12799	2020-07-17 13:10:52.12799
119	47	7	2020-07-17 13:10:52.130507	2020-07-17 13:10:52.130507
120	47	8	2020-07-17 13:10:52.132857	2020-07-17 13:10:52.132857
121	48	5	2020-07-17 16:55:47.811226	2020-07-17 16:55:47.811226
122	49	4	2020-07-17 16:56:03.761479	2020-07-17 16:56:03.761479
123	49	5	2020-07-17 16:56:03.763886	2020-07-17 16:56:03.763886
124	49	6	2020-07-17 16:56:03.76616	2020-07-17 16:56:03.76616
125	49	7	2020-07-17 16:56:03.768417	2020-07-17 16:56:03.768417
126	49	8	2020-07-17 16:56:03.770678	2020-07-17 16:56:03.770678
127	50	4	2020-07-17 23:18:25.954615	2020-07-17 23:18:25.954615
128	50	5	2020-07-17 23:18:25.957628	2020-07-17 23:18:25.957628
129	51	3	2020-07-17 23:21:12.696978	2020-07-17 23:21:12.696978
130	51	6	2020-07-17 23:21:12.69937	2020-07-17 23:21:12.69937
131	51	7	2020-07-17 23:21:12.702246	2020-07-17 23:21:12.702246
132	51	8	2020-07-17 23:21:12.704957	2020-07-17 23:21:12.704957
133	52	4	2020-07-21 22:42:39.276765	2020-07-21 22:42:39.276765
134	52	5	2020-07-21 22:42:39.279636	2020-07-21 22:42:39.279636
136	54	1	2020-07-22 19:21:50.62012	2020-07-22 19:21:50.62012
137	54	2	2020-07-22 19:21:50.62277	2020-07-22 19:21:50.62277
138	54	4	2020-07-22 19:21:50.62515	2020-07-22 19:21:50.62515
139	54	5	2020-07-22 19:21:50.627597	2020-07-22 19:21:50.627597
140	54	7	2020-07-22 19:21:50.629962	2020-07-22 19:21:50.629962
141	54	8	2020-07-22 19:21:50.632283	2020-07-22 19:21:50.632283
144	56	2	2020-07-23 16:04:31.983111	2020-07-23 16:04:31.983111
145	56	4	2020-07-23 16:04:31.985895	2020-07-23 16:04:31.985895
146	56	5	2020-07-23 16:04:31.988234	2020-07-23 16:04:31.988234
147	56	6	2020-07-23 16:04:31.99054	2020-07-23 16:04:31.99054
148	57	1	2020-07-23 20:45:14.977444	2020-07-23 20:45:14.977444
149	57	2	2020-07-23 20:45:14.980169	2020-07-23 20:45:14.980169
150	57	3	2020-07-23 20:45:14.982631	2020-07-23 20:45:14.982631
151	57	4	2020-07-23 20:45:14.985044	2020-07-23 20:45:14.985044
152	57	5	2020-07-23 20:45:14.987242	2020-07-23 20:45:14.987242
153	57	6	2020-07-23 20:45:14.989381	2020-07-23 20:45:14.989381
154	57	7	2020-07-23 20:45:14.991515	2020-07-23 20:45:14.991515
155	57	8	2020-07-23 20:45:14.993606	2020-07-23 20:45:14.993606
156	58	1	2020-07-24 20:42:07.14637	2020-07-24 20:42:07.14637
157	58	2	2020-07-24 20:42:07.148981	2020-07-24 20:42:07.148981
158	58	3	2020-07-24 20:42:07.151436	2020-07-24 20:42:07.151436
159	58	4	2020-07-24 20:42:07.153959	2020-07-24 20:42:07.153959
160	58	5	2020-07-24 20:42:07.156337	2020-07-24 20:42:07.156337
161	58	6	2020-07-24 20:42:07.15848	2020-07-24 20:42:07.15848
162	58	7	2020-07-24 20:42:07.160782	2020-07-24 20:42:07.160782
163	58	8	2020-07-24 20:42:07.16285	2020-07-24 20:42:07.16285
164	59	1	2020-07-25 00:39:11.342392	2020-07-25 00:39:11.342392
165	59	2	2020-07-25 00:39:11.345239	2020-07-25 00:39:11.345239
166	59	3	2020-07-25 00:39:11.347616	2020-07-25 00:39:11.347616
167	59	4	2020-07-25 00:39:11.350178	2020-07-25 00:39:11.350178
168	59	5	2020-07-25 00:39:11.352572	2020-07-25 00:39:11.352572
169	59	6	2020-07-25 00:39:11.354999	2020-07-25 00:39:11.354999
170	59	7	2020-07-25 00:39:11.357348	2020-07-25 00:39:11.357348
171	59	8	2020-07-25 00:39:11.359419	2020-07-25 00:39:11.359419
189	63	5	2020-07-28 23:11:07.111076	2020-07-28 23:11:07.111076
190	64	4	2020-07-28 23:25:08.973733	2020-07-28 23:25:08.973733
191	64	5	2020-07-28 23:25:08.976354	2020-07-28 23:25:08.976354
192	64	6	2020-07-28 23:25:08.978719	2020-07-28 23:25:08.978719
193	65	1	2020-07-31 16:57:39.065688	2020-07-31 16:57:39.065688
194	65	2	2020-07-31 16:57:39.069532	2020-07-31 16:57:39.069532
195	65	3	2020-07-31 16:57:39.071877	2020-07-31 16:57:39.071877
196	65	4	2020-07-31 16:57:39.074106	2020-07-31 16:57:39.074106
197	65	6	2020-07-31 16:57:39.07635	2020-07-31 16:57:39.07635
198	65	7	2020-07-31 16:57:39.078526	2020-07-31 16:57:39.078526
199	65	8	2020-07-31 16:57:39.080702	2020-07-31 16:57:39.080702
200	66	1	2020-07-31 16:59:57.894618	2020-07-31 16:59:57.894618
201	66	2	2020-07-31 16:59:57.89702	2020-07-31 16:59:57.89702
202	66	3	2020-07-31 16:59:57.899112	2020-07-31 16:59:57.899112
203	66	4	2020-07-31 16:59:57.901218	2020-07-31 16:59:57.901218
204	66	5	2020-07-31 16:59:57.903305	2020-07-31 16:59:57.903305
205	66	6	2020-07-31 16:59:57.905431	2020-07-31 16:59:57.905431
206	66	7	2020-07-31 16:59:57.907497	2020-07-31 16:59:57.907497
207	66	8	2020-07-31 16:59:57.909655	2020-07-31 16:59:57.909655
208	67	1	2020-07-31 17:06:51.135912	2020-07-31 17:06:51.135912
209	67	4	2020-07-31 17:06:51.138169	2020-07-31 17:06:51.138169
210	67	5	2020-07-31 17:06:51.140323	2020-07-31 17:06:51.140323
211	68	2	2020-07-31 18:33:36.755732	2020-07-31 18:33:36.755732
212	68	5	2020-07-31 18:33:36.75865	2020-07-31 18:33:36.75865
213	69	4	2020-07-31 21:19:47.37633	2020-07-31 21:19:47.37633
214	69	5	2020-07-31 21:19:47.379107	2020-07-31 21:19:47.379107
215	69	8	2020-07-31 21:19:47.381502	2020-07-31 21:19:47.381502
226	72	1	2020-08-03 23:03:59.824809	2020-08-03 23:03:59.824809
227	72	7	2020-08-03 23:03:59.82728	2020-08-03 23:03:59.82728
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.requests (id, mensaje, contacto_mail, user_id, service_id, created_at, updated_at) FROM stdin;
1	fgcbn	jsagudeloaa@gmail.com	4	3	2020-05-23 09:03:28.331065	2020-05-23 09:03:28.331065
4	Hola me interesa tu servicio	\N	2	2	2020-05-28 22:52:05.159135	2020-05-28 22:52:05.159135
5	Buen dia\r\n\r\nMe gustaria obtener mas informacion sobre los servicios que tienen dispoonible para el diseño de paginas web	\N	24	23	2020-05-29 02:35:13.931096	2020-05-29 02:35:13.931096
6	Hola, me gustaría saber de que se trata y como funciona  Drones? Vi una charla en rutanio acerca de una empresa de drones, quizás es la misma? espero su respuesta para saber si es venta de dron o servicio de medición?\r\n\r\nA mis hij@s les encantaría organizar carreras de drones tenemos un terreno disponible y están pensando en la experiencia\r\n\r\nAngelo Ortega\r\n+56973352112	\N	25	14	2020-06-02 13:09:00.656602	2020-06-02 13:09:00.656602
7	Buenos Días , me interesa el servicio, como se procede a plantear la necesidad y evaluar posibilidades de desarrollo?	\N	25	21	2020-06-02 13:10:53.130054	2020-06-02 13:10:53.130054
8	Hola me interesa saber más del servicio a través de rutas, mi fono es +56973352112	\N	25	3	2020-06-02 13:27:09.515292	2020-06-02 13:27:09.515292
9	Buen Día, vivo en Chile, hay una cantidad enorme de plantaciones, como funciona el servicio? es viable que la app la ocupen desde acá? que pasaría con el tema de los drones?\r\n\r\nsaludos\r\n\r\nANgelo Ortega\r\n+56973352112	\N	25	6	2020-06-02 13:49:06.17106	2020-06-02 13:49:06.17106
10	Hola.\r\nTe escribe Poly de Rutanio Core  Estoy trabajando en consolidar una oferta de servicios legales que pudieramos hacer correr sobre Rutanio. Estoy en contacto con algunos equipos dandole forma a eso.\r\nQue areas de servicios legales estas requiriendo en este momento?\r\nConversemos.\r\n	\N	37	22	2020-06-17 15:48:14.871948	2020-06-17 15:48:14.871948
11	Hola\r\nMi nombre es Policarpo del Core Team Rutanio\r\nMe gustaria conversar con uds sobre servicios que ofrecen.\r\nTenemos algunos proyectos en temas de virtualizacion + blockchain\r\nConversemos\r\nSalud!\r\npolicarpo.guerrero@rutanio.com\r\n	\N	37	21	2020-06-19 12:20:42.263058	2020-06-19 12:20:42.263058
12	Hi, how can i get this service of content marketing? is able in spanish? i mean my audience is spanish latam	\N	39	25	2020-06-24 01:09:53.460142	2020-06-24 01:09:53.460142
13	Hola, me interesa conocer algunos casos de uso de su servicio o experiencias y como contratar? aceptan rutas? mi fono es +56973352112 saludos Angelo	\N	39	4	2020-06-24 01:11:07.371566	2020-06-24 01:11:07.371566
14	Hola, me interesa conocer algunos casos de uso de su servicio o experiencias y como contratar? aceptan rutas? mi fono es +56973352112 saludos Angelo	\N	39	9	2020-06-24 01:11:42.310358	2020-06-24 01:11:42.310358
25	gcfbn	\N	27	22	2020-06-26 10:20:32.069967	2020-06-26 10:20:32.069967
26	Hola Estoy interesado en su producto; soy Daniel Toro de Petrra Partners ( constructora).\r\nFelipe Cano me recomendó	\N	49	36	2020-07-14 14:51:32.003032	2020-07-14 14:51:32.003032
27	Mate dame lo tuyo	\N	63	49	2020-07-17 16:59:46.415689	2020-07-17 16:59:46.415689
29	Buenos días \r\n\r\nTengo el perfil y conocimiento necesario para este proceso 	\N	42	30	2020-07-22 18:09:43.802345	2020-07-22 18:09:43.802345
31	Hola\r\nMi nombre es Policarpo y soy parte del Core Team de Rutanio.\r\nYo he trabajado con un sistema similar a Minecraft que involucra crypto....me encantaria presentarselos para que lo tengan en cueenta : www.cryptovoxels.com\r\nMe puedes contactar a policarpo.guerrero@rutanio.com\r\n\r\n	\N	37	40	2020-07-22 23:24:01.984879	2020-07-22 23:24:01.984879
32	Hola Jose!\r\nSi deseas desde Furore con parte Rutas y parte en dinero lo podemos hacer!  Me puedes contactar al 311 634 55 66 - Alejandra Zuleta\r\nFeliz día! 	\N	72	32	2020-07-23 16:07:36.527603	2020-07-23 16:07:36.527603
33	Hola Alejandro\r\nEn furore lo podemos hacer, podemos negociar parte en rutas y parte en dinero. Si te interesa, contáctame. \r\nAlejandra Zuleta 311 634 55 66	\N	72	44	2020-07-23 16:09:36.589102	2020-07-23 16:09:36.589102
34	Prueba de Contacto	\N	76	59	2020-07-25 00:39:40.954929	2020-07-25 00:39:40.954929
35	Hola, como estas?\r\nEstoy interesado en esta mentoría, si quieres hablamos por celular, 3023881392  Daniel Acosta\r\n	\N	54	35	2020-07-25 20:20:46.150675	2020-07-25 20:20:46.150675
40	Buenas tardes, \r\n\r\nSoy Juan Esteban Vallejo, soy el gerente de Cuadro Legal Abogados, estoy interesado en ejecutar y prestar la asesoría para desarrollar el contrato de vesting.   Mi celular es 3113726185 y nuestra pagina de internet es www.cuadrolegal.com.\r\n\r\nCordialmente, \r\n\r\nJuan E. Vallejo 	\N	86	52	2020-07-31 21:11:54.51292	2020-07-31 21:11:54.51292
41	Hola\r\nTe escribe Policarpo de Core Team Rutanio\r\nQueria saber si te han dado respuesta a esto para ayudarte en caso haga falta.\r\nMe cuentas cualquier cosa\r\nGracias por participar en Rutanio	\N	37	52	2020-08-01 10:43:56.53633	2020-08-01 10:43:56.53633
46	Hola Juan, estoy interesado en hacer match con tu oferta de servicio	\N	2	69	2020-08-03 17:20:46.672791	2020-08-03 17:20:46.672791
47	Hola me interesa bastante tu oferta	\N	2	68	2020-08-03 17:42:20.446733	2020-08-03 17:42:20.446733
48	Hola Jose me avisas si ya conectaron contigo si no estariamos interesados en suplir tu necesidad	\N	2	32	2020-08-03 17:47:03.201762	2020-08-03 17:47:03.201762
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.schema_migrations (version) FROM stdin;
20200424094702
20200424100311
20200424100434
20200424100735
20200424101158
20200427074422
20200428051200
20200430054507
20200430055911
20200430070620
20200430071009
20200430072341
20200511114711
20200605124644
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.services (id, name, information, skills, precio, valid_until, aditional_info, created_at, updated_at, user_id, lenguaje, exos_amount, mail_servicio, horas, wpp, web, currency_sugest, state) FROM stdin;
17	Trabaja Desde Casa o Desde Cualquier Lugar con Avaya Spaces	Gratis por 60 días	\N	1	2020-10-31	Costa Rica, El Salvador, Panamá, República Dominicana, Guatemala \r\nUnidades disponibles para este servicio 10	2020-05-23 11:05:10.994683	2020-05-23 11:05:10.994683	17	Español, Inglés	\N	jerezmariajose@gmail.com	\N		https://news.avaya.com/es-cp-commercial-spaces-coronavirus-response-reg?CTA=20US2-UC-DG-SPCORCM-EM&TAC=20US2-UC-DG-SPCORCM-ES-EM&WT.tsrc=Email&utm_source=Email&utm_medium=email		published
2	Elementos de seguridad	Confeccionamos tapabocas y tenemos más de 100.000 unidades; además de caretas de seguridad con más de 350.0000 unidades disponibles y también cámaras térmicas.	\N	30	2020-05-30	500,000 Unidades disponibles para esta oferta	2020-05-23 08:54:48.899131	2020-06-08 12:05:29.261659	3	Español	\N	sac@nasuu.com	\N	+57 3144355708	https://nasuu.policomercio.com/		in_draft
6	Ecofy, plataforma para la gestión y control agrícola	Plataforma para la gestión y control de cultivos	\N	1	2020-05-31		2020-05-23 09:31:22.991513	2020-06-08 12:05:48.45286	7	Español	\N	rbedoya@ubicasat.com	\N	+57 3002687349	http://www.ecofy.co/ag/		in_draft
7	¡Asesoramiento GRATUITO en Google Cloud!	Como Partners Premier de Google Cloud, estamos listos y dispuestos a utilizar estas poderosas herramientas para hacer frente a la crisis actual. ¿Qué esperas? Solo debes contactarnos a info@esourcecapital.com, y juntos comenzaremos el camino a la innovación.	\N	0	2020-05-31		2020-05-23 09:36:37.226557	2020-06-08 12:05:56.720249	8	Español, Inglés	\N	info@esourcecapital.com	\N		https://www.esourcecapital.com		in_draft
8	Asesoría LegalTech	Nuestra asesoría busca crear certeza de la forma segura y eficiente de hacer negocios en línea\r\nSe ha habilitado la compatibilidad con lectores de pantalla.\r\n \r\n 	\N	725	2020-05-30	Haremos un gran equipo de trabajo\r\nCantidad disponible para esta oferta 10	2020-05-23 10:16:03.441756	2020-06-08 12:06:10.763455	9	Inglés	\N	hectortorres@torres.legal	\N	+50378700632			in_draft
10	Una hora de consultoría para implementar LumApps	Analizamos tus procesos internos y te ayudamos a implementar una Intranet efectiva y de calidad.	\N	1000	2020-05-31	Cantidad de unidades para esta oferta 10	2020-05-23 10:29:03.54394	2020-06-08 12:06:19.176835	12	Español, Inglés	\N	rocio@ptree.com.mx	\N		https://www.lumapps.com/product/features/		in_draft
11	Una hora de consultoría para mejorar la administración de tus proyectos	Te ayudamos a mejorara la experiencia del manejo de tus proyectos sugiriendote mejoras.	\N	1000	2020-05-31	Unidades disponibles para esta oferta 10	2020-05-23 10:32:02.459443	2020-06-08 12:06:26.394952	12	Español, Inglés	\N	rocio@ptree.com.mx	1		https://help.smartsheet.com/es/help?dlm=111		in_draft
16	10% DESCUENTO	10% DE DESCUENTO EN TODOS NUESTROS PRODUCTOS	\N	10	2020-05-31	REPUBLICA DOMINICANA\r\nAPLICA SOLO PARA LOS VISITANTES REGISTRADOS DEL CONNECTB2B\r\nUnidades disponibles para esta oferta 10	2020-05-23 11:00:06.794461	2020-06-08 12:06:39.26723	16		\N	ruben.hiciano@cablecomm.com.do	\N	+18299615914	http://www.cablecomm.do		in_draft
3	Investigaciones de Mercado en Colombia y America y facilitacion de Negocios en Coombia	Análisis de mercado de productos para el Mercado Cde Colombia y America a Partir de la información comercial de importacion y exportacion al igual que la información financiera de empresas	\N	1000	2020-05-31	el valor ofertado es 1000 rutas por hora como pago parcial	2020-05-23 09:02:33.119918	2020-06-09 21:57:35.092563	4	Español , Ingles	\N	juanfdovelez@amerin.com.co	1	+57 3113095875	http://amerin.com.co/sitio/		in_draft
12	Cyber Threat Assessment Program (CTAP)	El servicio de CTAP “Cyber Threat Assessment Program” de Fortinet permite llevar a cabo una auditoría de seguridad mediante los siguientes pasos:\r\nColocar un Fortigate en una zona de la red para monitorizar la actividad de la la infraestructura.\r\nDespués de unos 7  días de logs, se genera un informe automático (español o inglés).\r\nContinex le brindará el informe a   los responsables de seguridad de la organización y le ayudaremos  a interpretar los hallazgos encontrados y ver que plan de acción deben tomar.	\N	28000	2020-05-24	Unidades diponibles para este servicio 10	2020-05-23 10:36:44.569288	2020-06-10 10:21:58.768898	13	Español, Inglés	\N	omadriz@continex.net	\N	89113554			in_draft
9	Consultoria Estrategica	Consultoria Estrategica con foco en Transformación Exponencial, Sourcing, Blockchain y Ciberseguridad	\N	5000	2020-06-30	Unidades disponibles para este servicio 5	2020-05-23 10:19:51.285991	2020-07-06 06:28:28.157317	10	Español	\N	david.gil@ndc-digital.com	\N	+50760048972	https://www.ndc-digital.com		in_draft
14	DRONES	Servicios de levantamiento de terrenos, inspeccion de redes, agricultura de precision	\N	600	2020-06-30	Unidades disponibles para esta oferta 6	2020-05-23 10:45:51.660829	2020-07-06 06:28:46.754341	14	Español	\N	carlos.angel@anka.com.co	\N				in_draft
15	Contact Center y BPO	10 puestos de trabajo con 10% de descuento.	\N	780	2020-06-30	Contratos cerrados entre mayo y junio de 2020\r\nEl precio de $780 dolares por puesto de trabajo mensual.	2020-05-23 10:54:37.630556	2020-07-06 06:28:56.169564	15	Español, Inglés	\N	isabel.amaya@andesbpo.com	\N	3128604213	https://andesbpo.com	El precio de $780 dolares por puesto de trabajo mensual.	in_draft
4	Consultoría Marketing Digital 4 horas	4 horas de consultoría en la estrategia de marketing digital de la empresa, consistente en un análisis de la situación y del negocio, una investigación digital y la entrega de un reporte con recomendaciones de acciones para ejecutar dentro del ecosistema digital de la marca, orientadas a optimizar sus presencias digitales para el cumplimiento de los objetivos de negocio declarados.	\N	4000000	2020-07-08	Consultorías a ejecutar a partir de junio - Virtuales 100%\r\nHe participado en mas de 500 proyectos de marketing y negocios digitales, la gran mayoría en calidad de Planner, pero siempre como director de equipos multidisciplinarios de trabajo.	2020-05-23 09:11:53.535131	2020-07-14 22:08:36.893189	5	Español	\N	manuel.caro@exponencial-mente.com	4	+57 3187348006	http://www.exponencial-mente.com		in_draft
21	Desarrollo de software / VR / Video Juegos / Experiencias interactivas / MVP's	Servicios de desarrollo de software personalizado:\r\n\r\n- Realidad virtual \r\n\r\n- Video Juegos\r\n\r\n- Aplicaciones \r\n\r\n- Desarrollo web (back y front)	\N	1	\N		2020-05-26 19:15:48.686184	2020-05-26 19:15:48.686184	21	Español, Inglés	2	maria@alternova.co	1	+16282300053	https://www.alternova.co/	COP, USD	published
27	Compañías interesadas en sesión GRATUITA con consultores ExO!	Si usted gerencia un negocio, tiene la oportunidad de recibir totalmente gratis servicio de consultoría ExO para acelerar su organización con consultores ExO en formación. Compañías con vínculos a la Economía de Rutanio, o de Medellín, tendrán prioridad en la selección. Por favor, aplique aquí: https://rutanio.webflow.io/marketplace/apply-for-an-opportunity	\N	1	2020-01-14	Si usted gerencia un negocio, tiene la oportunidad de recibir totalmente gratis servicio de consultoría ExO para acelerar su organización con consultores ExO en formación. Compañías con vínculos a la Economía de Rutanio, o de Medellín, tendrán prioridad en la selección. Por favor, aplique aquí: https://rutanio.webflow.io/marketplace/apply-for-an-opportunity\r\nJulian Garcia Restrepo	2020-06-11 22:23:45.141823	2020-06-11 22:23:49.043393	32	ENG,ESP	\N	cesar.castro@fluidchains.com	1		www.openexo.com		in_draft
13	Diagnóstico de Seguridad (CTAP)	Nuestro Servicio de diagnóstico de Seguridad permite llevar a cabo una auditoría de seguridad mediante los siguientes pasos:\r\n1. Colocar un Fortigate en una zona de la red para monitorizar la actividad de la infraestructura.\r\n2. Después de unos pocos días de recogida de logs en la nube de Fortinet, se genera un informe automático (español o inglés).\r\n3. Revisar el informe con los responsables de seguridad de la organización y ayudarles a interpretar los hallazgos interesantes\r\n4. Desarrollar un plan de mitigación de los hallazgos.\r\n	\N	1500	2020-05-31	Aplica para Costa Rica unidades disponibles para esta oferta 50	2020-05-23 10:40:49.224126	2020-06-08 12:06:32.307949	13	Español, Inglés	\N	omadriz@continex.net	\N	50688113554	http://www.continex.net/		in_draft
20	Conferencia de 30min, a través de videollamada, para su Equipo Ejecutivo sobre cómo dar forma a un proyecto de transformación Exponencial.	"Conferencia de 30min, a través de videollamada, para su Equipo Ejecutivo sobre cómo dar forma a un proyecto de transformación Exponencial.\r\n\r\nEn los últimos 3 años hemos ayudado a dar forma y remodelar el futuro de más de 20 organizaciones.\r\n"	\N	3500	2020-05-31	Escalate Group	2020-05-23 11:15:12.423348	2020-06-08 12:06:51.6842	19		\N	eg.marketing@escalategroup.com	\N		https://www.escalategroup.com		in_draft
19	Conferencia de 1 hora, a través de videollamada, para su Equipo Ejecutivo o Junta Directiva sobre cómo dar forma a una organización exponencial	"Conferencia de 1 hora, a través de videollamada, para su Equipo Ejecutivo o Junta Directiva sobre cómo dar forma a una organización exponencial.     En los últimos 3 años hemos ayudado a dar forma y remodelar el futuro de más de 20 organizaciones.\r\n"	\N	6000	2020-05-31	Escalate Group \r\nA convenir horarios y dias\r\n	2020-05-23 11:12:48.363992	2020-06-08 12:06:55.441656	19	Español, Inglés	\N	eg.marketing@escalategroup.com	1		https://www.escalategroup.com		in_draft
18	CONNECTAB2B.LIVE FULL BUNDLE 50% OFF	Todos nuestros cursos están en etapa Early Birds, los cursos son on-demand e iniciar el 1ero de Junio	\N	299	2020-05-30	ECUUVE DE COSTA RICA S.A. Costa Rica\r\nHasta el 15 de Mayo todos los cursos por un precio único. Una oportunidad increíble dónde obtendrás todo lo que necesitas para proyectar y potenciar tu emprendimiento o acelerar tu empresa actual. Por $299.00 Un único pago precio original ($599.99) Oferta 50% \r\nUnidades disponibles para este servicio 1000000	2020-05-23 11:08:55.694668	2020-06-08 12:07:00.467181	18		\N	plataforma@ecuuve.com	\N	50687308479	http://academia.chichoquesada.com		in_draft
26	Translate 2 forms ENG->ESP	2-3 short paragraphs + a few short questions	\N	1000	2019-03-12		2020-06-11 22:11:22.43415	2020-06-11 22:11:27.219436	31	ENG,ESP	50	info@rutanio.com	1			1000 RUTAs and 50 EXOS for 1 hour(s)	in_draft
28	Desde Rutanio buscamos crecer y fortalecer nuestro posicionamiento en el mercado	Buscamos una persona apasionada por la tecnología y que la movilice el propósito de contribuir a un mundo mejor, para que a través de la generación de contenido y desarrollo de estrategias de Marketing Digital lleguemos con nuestro mensaje a la audiencia adecuada para estimular el intercambio a través de nuestra economía Rutanio	\N	1000	2020-03-20	Requerimos de un profesional en las áreas de comunicación social o mercadeo con mínimo 3 años de experiencia en la generación de contenido, desarrollo de actividades de marketing digital y desarrollo de eventos 	2020-06-11 22:26:08.964253	2020-06-11 22:26:12.893846	33	ESP	\N	jeronimo.perez@rutanio.com	10				in_draft
29	Senior UX designer consultant needed	UX consulting work for a COVID-19 app currently under development Consulting,Design	\N	5000	2020-03-04	Consulting,Design Liliana Parra Santamaría	2020-06-11 22:29:14.563988	2020-06-11 22:29:19.524296	34	ENG,ESP	\N	lparra@fluyt.org	8	(323) 288-9878	https://pasteapp.com/p/2yBKNFe9pFt/s/eCQI7JARqZQ?view=EMhp3qvGjFg	5000 RUTAs for 8 hour(s)	in_draft
32	Creacion de Logo y Pagina Web	Creacion de un logo y pagina web sencilla para stratup	\N	10000	\N		2020-06-26 18:10:00.802626	2020-06-26 18:10:00.802626	40		\N	jose.gaviria@amerin.com.co	\N				published
31	Investigacion de Mercados	Ofrecemos consultoria especializada en análisis de mercados internacionales a organizaciones que quieran conocer un mercado y los competidores, proveedores actuales y potenciales.	\N	2000	2020-10-31		2020-06-26 17:57:18.400411	2020-06-26 18:11:54.37372	40	Español y/o Ingles	500	jose.gaviria@amerin.com.co	\N		www.amerin.com		published
33	Asesoría en Estrategia Tecnológica	Análisis de la situación actual de la tecnología usada por el negocio para plantear un plan de evolución a corto, medio y largo plazo que permita alcanzar los objetivos definidos a partir de la estrategia de la compañía.	\N	4000	\N		2020-07-02 22:00:15.391601	2020-07-02 22:00:15.391601	41	Español	400	jorge_lozano@hotmail.com	4	+573015717800	https://www.ploosi.com		published
22	ASESORÍA LEGAL	Asesoría legal en emprendimientos digitales relacionados con blockchain	\N	3000	2020-06-28		2020-05-27 21:39:31.608371	2020-07-06 06:29:40.629096	22	español 	\N	soy@companiax.com	1	(57) 3197894642	https://companiax.com/		in_draft
25	Newsletter Content marketing	Need a freelance responsible for creating, editing, posting and updating MONTHLY newsletter	\N	3000	2020-06-20	3000 RUTAs for 3 hour(s)\r\nI saw this opportunity ** Newsletter Content marketing **  posted by Olga Calvache in the Rutanio Alpha Marketplace. 	2020-06-08 13:00:33.168719	2020-07-07 13:21:10.713976	28	ENG	\N	olga@escalategroup.com	3				in_draft
30	Análisis financiero	Se necesita profesional para realizar un análisis financiero de proyecto relacionado con aplicaciones móviles y software .	\N	1000	2020-07-03		2020-06-16 13:44:07.765309	2020-07-26 12:43:09.44625	35	Español o inglés	\N	juan.220894@gmail.com	1				in_draft
23	Página web	Diseño y creación de página web, Incluye:\r\n\r\nSEO interno\r\nCertificado SSL\r\nCompatibilidad con dispositivos móviles.\r\n	\N	5000	2020-06-28	No incluye hosting ni dominio. 	2020-05-27 21:57:03.558092	2020-07-06 06:29:50.838276	22	Español	\N	soy@companiax.com	\N	(57) 3197894642	https://companiax.com/		in_draft
38	Evaluación UX de productos digitales con 20 consumidores reales	Paruma.co construimos un laboratorio de consumidores para que nuestros clientes puedan evaluar la experiencia de sus usuarios. Descubrimos percepciones y encontramos errores de los productos digitales que van a lanzar al mercado o aquellos que ya están publicados y requieren conocer cual es la brecha que existe entre el producto y el consumidor.	\N	70000	2020-08-31	Segmentación del público objetivo del producto digital	2020-07-14 19:36:13.497648	2020-07-14 19:36:13.497648	50	Español	\N	hola@paruma.com.co	\N	+573104287576	paruma.co		published
39	Curso de inglés	Estoy interesado en inscribirme en un curso de inglés usando Rutas	\N	4000	2020-08-31		2020-07-15 16:51:38.369079	2020-07-15 16:51:38.369079	51	Español- inglés	\N	joel.sanchez.aristizabal@gmail.com	4	+573504238080			published
40	Profesores de Roblox o Minecraft	Necesitamos profesores de Roblox o Minecraft para piloto de enseñanza de programación a niños	\N	5000	\N		2020-07-15 19:35:02.408783	2020-07-15 19:35:02.408783	52	español	\N	sergio@ypac.cl	12	+56952071405			published
41	Diagnostico desarrollo de wallet en blockchain	Necesito un desarrollador blockchain para integrar una wallet a proyecto creado en MERN stack, aplicación estilo Rappi. \r\n\r\n	\N	2000	2020-08-31		2020-07-15 19:43:34.879732	2020-07-15 19:43:34.879732	53	Español - Ingles	\N	benjamin@dbinversiones.com	2	+56984787937	https://www.criptopos.com		published
42	Asesoría en desarrollo plataforma Factoring	Revisar la posibilidad de hacer una plataforma cerrada donde los proveedores de la compañia puedan acceder a negociar sus facturas con pronto pago y obtener liquidez con las mismas compañía del grupo	\N	2000	2020-08-21		2020-07-15 20:24:39.305727	2020-07-15 20:24:39.305727	55	Español	\N	dcadavid71@gmail.com	2	+573218006035			published
43	Montería en cadena de abastecimiento	Mentoría en procesos de negociación estratégica ( proceso de compras y abastecimiento)	\N	2000	2020-08-31		2020-07-15 20:24:41.47086	2020-07-15 20:24:41.47086	54	Español	\N	acosta713@hotmail.com	2	+573023881392			published
44	Necesito UX/UI	Requiero una asesoria en UX/UI para uno de nuestros productos web.	\N	3000	2020-08-31		2020-07-15 21:57:37.545737	2020-07-15 21:57:37.545737	58	Espa#nol	\N	alejandro.gomez@digitalamericas.ai	3	+57 3015863277			published
45	Desarrollo de Aplicación Celular	Se requieren servicios diversos dentro del desarrollo de APP para celulares y su ecosistema, pueden ser web en el mismo.	\N	5000	2020-08-30		2020-07-15 21:57:38.779756	2020-07-15 21:57:38.779756	57	Español	\N	valerio.quintero@gmail.com	5	57+3176652490			published
46	Diagnóstico estratégico y procesos corporativos	Realización de diagnóstico de la estrategia y procesos corporativos 	\N	3000	2020-08-31		2020-07-16 16:36:57.878272	2020-07-16 16:38:37.916225	61	Español	\N	gerencia@consultoriaestrategia.com.co	3	3113412736	www.consultoriaestrategia.com.co		published
49	Shot en consultoria en Estrategia y/o Innovación	Con el Metodo Enconcreto logramos tangibilizar proyectos estrategicos en las organizaciones y movilizar a las personas hacia nuevas metas.	\N	3000	2020-08-21		2020-07-17 16:56:03.755609	2020-07-17 16:57:20.418607	64	Español o Ingles	\N	mtcalderon@enconcreto.co	3	+573102079580	enconcreto.co		published
50	Coaching Personal y Ejecutivo 	Logra tus resultados en tu vida personal y empresarial, si no sabes lo que quieres, o si no emprendes acciones o o no avanzas en tus resultados o algo que no te deja avanzar es momento de acompañarte de un experto para que brilles	\N	5000	\N	Sala Virtual por covid 19	2020-07-17 23:18:25.947281	2020-07-17 23:18:25.947281	66	Español	\N	fm@proyectosinteligentes.com	1	+573104243033	https://www.proyectosinteligentes.com		published
51	Mejoramiento presentaión Corporativa	Mejoramiento de la presentación corporativa PPT u otro formato (Deck)	\N	2000	2020-09-30	Mejorar la presentación corporativa para clientes	2020-07-17 23:21:12.690445	2020-07-17 23:21:12.690445	65	Español	\N	sm@proyectosinteligentes.com	5	3104260022	www.proyectosinteligentes.com		published
52	Servicio legal	Realizar un contrato de vesting	\N	2000	2020-08-30		2020-07-21 22:42:39.269502	2020-07-21 22:42:39.269502	68	Español	\N	andres@grovity.co	2				published
47	Marketing de Start-Up	Nos encontramos en la búsqueda de un experto/s en marketing capaz de:\r\n-Lanzar al mercado una StarpUp de alcance mundial.\r\n-Ofrecer material en varios idiomas (Español e Inglés).\r\n-Manejar varias plataformas y herramientas preferentemente.\r\n-Organizar futuros eventos.\r\n\r\nQueremos tener una charla previa de una hora para obtener más detalles del perfil y observar las posibles alternativas que ofrecen.\r\n	\N	2100	\N		2020-07-17 13:10:52.108397	2020-07-20 13:45:22.947559	35	Español / Inglés	\N	juanclertora@gmail.com	1				published
54	Servicios De Análisis Financiero Modelo DUPONT 	Análisis de los estados financieros de las empresas para obtener indicadores de gestión y crecimiento financiero, que sirve para la toma de decisiones \r\n\r\nIndicadores: \r\n\r\nROE\r\nROI \r\nEVIDTA \r\nEVA	\N	5000	\N	Debe ser empresa con mínimo 2 años para analizar los cierres contables 	2020-07-22 19:21:50.613555	2020-07-22 19:21:50.613555	42	Español	50	jonathan-financiero@hotmail.com	8	3104355821		$ 4.500.000	published
48	Una consultoria de MATE	Necesito una consultoria de Mate Calderon	\N	2000	2020-07-18		2020-07-17 16:55:47.804272	2020-07-26 12:42:55.675245	63	Espanglish	\N	sebastian.castrillon@estratek.com.co	2	+573152929282			in_draft
35	Mentoria caso de uso Blockchain para pagos	Poder incluir en una plataforma de cobranza la opcion de pagos con RUTAS.	\N	2000	2020-07-31		2020-07-09 21:18:26.429066	2020-08-02 05:49:32.017299	45	Español	\N	soportepi@gmail.com	2	3006125633			in_draft
36	Recorrido Virtual 360 Matterport Inmoiliario	Ofrecemos Recorridos virtuales 360 profesionales para el sector inmobiliario usando la tecnología Matterport. \r\n\r\nPromocione sus inmuebles de manera virtual en cualquier dispositivo y en cualquier momento.	\N	8000	2020-07-31		2020-07-10 16:21:23.639206	2020-08-02 05:49:37.194226	47	Español - Inglés	\N	juan@dissmo.com	8	+573216388999	www.dissmovr.com		in_draft
37	Recorrido Virtual 360 Matterport Automotriz	Ofrecemos recorridos virtuales 360 profesionales para el sector automotriz usando tecnología Matterport. Promocione su concesionario de manera virtual en cualquier dispositivo y en cualquier momento.	\N	65000	2020-08-31		2020-07-10 16:21:28.819517	2020-08-02 05:49:41.624914	48	Español	\N	lfcardona@dissmo.com	65	+573137190770	www.dissmovr.com		in_draft
56	Planeación estratégica digital	Workshop de planeación estratégica digital para tu compañía. \r\nTrabajaremos en conjunto para realizar un diagnóstico de tu compañía, evaluaremos tu propósito y otras bases estratégicas, e identificaremos oportunidades en el mercado. Definiremos tu visión, tus segmentos de mercado y la propuesta de valor para esos segmentos. \r\n\r\nCon esto construiremos juntos la base para tener un plan de marketing digital acorde a los retos que nos impone el nuevo mercado.	\N	24000	2020-12-16	El workshop se hará de manera virtual. En caso de estar en Medellín pueden haber sesiones presenciales. \r\nEn este es importante la participación de gerencia, dirección comercial, dirección de marketing y servicio al cliente. 	2020-07-23 16:04:31.975302	2020-07-23 16:04:31.975302	72	español / inglés	\N	alejandra@furore.co	18	3116345566	www.furore.co	USD 696	published
57	CONSULTA LEAN STARTUP	CONSULTA LEAN STARTUP PARA DICTAR UN TALLER 1 HORA  NIVEL BASICO	\N	2000	\N		2020-07-23 20:45:14.971048	2020-07-23 20:45:14.971048	74	ESPAÑOL	\N	lorenapalma85@gmail.com	1	+56983179814			published
58	Espacios y Servicios de Coworking	espacios de trabajo\r\noficinas privadas\r\nsalas de reuniones 	\N	1000	2020-08-31	10 unidades disponibles	2020-07-24 20:42:07.139976	2020-07-24 20:42:07.139976	75		\N	mafe@circularcoworking.com	8	3136000204	www.circularcoworking.com		published
59	Tecnology Information Consulting System	Ofrezco mi experiencia en el área de Tecnología, soy docente universitario en la Universidad Nacional Autónoma de Honduras y en la Universidad Tecnológica de Honduras.\r\n\r\nTengo experiencia en Infraestructura de Red, Comercio Electrónico, Ventas, Atención al Cliente.\r\n\r\nHabilidades: Ventas, Manejo de Grupos, Diseño de Soluciones e Integrador de Tecnología.\r\n\r\nFortalezas: Resiliente, Automotivación, Inteligencia Emocional, Actitud Positiva.\r\n	\N	1	2021-01-31		2020-07-25 00:39:11.334953	2020-07-25 00:39:11.334953	76	Español 100% / Ingles 60%	500	rene.velasquez@megatech-sa.com	8	504-95660865	https://www.linkedin.com/in/rene-velasquez-6a772352	500	published
63	Consultoría en logística	¿Tienes dudas o problemas con tu rotación de inventarios?\r\n¿Crees que puedes hacer un acomodo eficiente de tus espacios de almacén?\r\n¿Administras una flotilla vehicular y necesitas saber el costo por día, kilómetro, establecer fechas de mantenimiento, depreciación, amortizaciones para tener costos controlados y establecer precios de fletes? \r\n\r\n¡Con gusto te ayudo!\r\n\r\nCharlemos una hora a precio base. Experiencia como Jefe y Gerente Corporativo de Logística en el ramo de los abarrotes y productos de consumo humano. 	\N	1000	2020-12-31		2020-07-28 23:11:07.103876	2020-07-28 23:11:07.103876	43	español, english	\N	alejandro.molymol@gmail.com	1	+52 999 1627239	https://sites.google.com/view/alejandromolina-agilecoaching/inicio 	USD paypal $25 dlls. o $500 pesos mexicanos por hora	published
64	Creación de tu escuela virtual en LMS	La educación el línea llego par quedarse. \r\n\r\nHabilitar tu LMS es necesario, no importa el proveedor que uses. \r\n\r\nYo te ayudo a hacer una experiencia intuitiva para maestros y estudiantes. \r\n\r\nHe sido académico presencial y en línea usando Moodle, Blackboard, Edmodo, G-classroom en asignaturas de matemáticas, física, para estudiantes de bachillerato y de ingenierías. \r\n\r\nLo importante es aplicar las habilidades blandas digitales para tener éxito. 	\N	1000	2020-12-31		2020-07-28 23:25:08.966889	2020-07-28 23:25:08.966889	43	Español / English	\N	alejandro.molymol@gmail.com	1	+52 999 1627239	https://sites.google.com/view/alejandromolina-agilecoaching/inicio 		published
66	Onboarding Digital de Usuarios	Servicio de Onboarding Digital de Usuarios para 20 usuarios.	\N	200000	2020-09-30	Inicialmente para Colombia	2020-07-31 16:59:57.888992	2020-07-31 16:59:57.888992	83	Español	\N	ricardo.garcia@evertecinc.com	20	+573116462371	www.placetopay.com		published
65	Asesoria en Planes de Movilidad Empresarial Sostenible	Asesoría y acompañamiento en ideación, planeación e implementacion de estrategias para transformar la movilidad de tu empresa u organización en una movilidad mas consciente y sostenible.	\N	2000	1991-09-13	Ninguna - Todo sea por la transformación y disminución de impacto generado por el transporte. Impulsar la movilidad como vida y libertad.	2020-07-31 16:57:39.056738	2020-07-31 17:06:50.424555	81	Español/English	1	ricardocardonadiaz@gmail.com	2	+573147724908	www.oasisgroup.com.co	USD	published
67	Consultoría seguimiento de obra BIM	Soluciones para seguimiento de proyectos de construcción virtual 	\N	2000	\N		2020-07-31 17:06:51.130545	2020-07-31 17:06:51.130545	79	Inglés y Español	\N	danielasaffon@gmail.com	2	3209779406	www.porticoing.com		published
68	Accesoria de Inversión 	Somos una organización de empresarios de la nueva era, expertos en negocios inteligentes. con un sistema de capacitación y formación profesional para generar ingresos masivos na corto, mediano y largo plazo. 	\N	1000	2020-12-31		2020-07-31 18:33:36.748009	2020-07-31 18:33:36.748009	85	Español.	\N	oro.sulmym@gmail.com	1	52 99881548846			published
69	Servicios Legales para empresas	Ofrecemos consultoría legal en Derecho Corporativo, Comercial y Propiedad Intelectual.  Pueden consultar mas sobre nuestros servicios y perfiles en nuestra página web www.cuadrolegal.com \r\n\r\nWe offer high quality legal services on Commercial Law and Intellectual Property.  Check us on www.cuadrolegal.com	\N	2000	2020-12-30	Legal services	2020-07-31 21:19:47.369354	2020-07-31 21:19:47.369354	86	Español-English-Portuguese	100	juan.vallejo@cuadrolegal.com	1	+573113726185	www.cuadrolegal.com		published
34	Community Manager Rutanio	Buscamos Community manager para nuestra organización Rutanio, enfocado en el crecimiento de nuestra comunidad en redes, impulsando contenido y acciones que permitan ampliar nuestro alcanza y profundizar relaciones con nuestros usuarios y comunidad. \r\n\r\nLa persona seleccionada estará enfocada en el desarrollando piezas, responden comentarios, generar estrategia, crear contenido, etc.\r\n\r\nBuscamos una persona apasionada por aprender sobre el mundo de Blockchain, que le interese transformar el mundo a través de una de las tecnologías exponenciales de mayor impacto en el futuro.	\N	10000	2020-07-30		2020-07-04 17:50:46.050101	2020-08-02 05:49:24.32945	33		\N	jeronimo.perez@rutanio.com	10				in_draft
72	Creación Página web	Necesito crear una página web sencilla. 	\N	8000	2020-08-09	30% previo a trabajo, 70% terminado 	2020-08-03 23:03:59.818695	2020-08-03 23:03:59.818695	77	Español	\N	rodrigo.salazar.barria@gmail.com	\N	+56978798810	N.A.		published
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.skills (id, name, created_at, updated_at, color_tag) FROM stdin;
1	Design	2020-05-23 07:28:55.875397	2020-05-25 10:43:43.856915	#331038
2	Marketing	2020-05-23 07:29:15.402797	2020-05-25 10:44:18.177216	#331038
3	Translation	2020-05-23 07:29:36.698832	2020-05-25 10:44:33.68893	#331038
4	Advisory	2020-05-23 07:29:51.368477	2020-05-25 10:44:44.817147	#331038
5	Consulting	2020-05-23 07:30:06.069539	2020-05-25 10:44:56.364606	#331038
6	Prototyping	2020-05-23 07:30:21.826535	2020-05-25 10:45:06.097648	#331038
7	Development	2020-05-23 07:30:36.711126	2020-05-25 10:45:15.609923	#331038
8	Other	2020-05-25 10:45:31.406315	2020-05-25 10:45:31.406315	#331038
9	Legal	2020-08-04 19:44:11.477642	2020-08-04 19:44:11.477642	#000000
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, name, last_name, mail, company, web_site, skill, lenguage, discord_user, wpp, udi, provider, permission_level, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
40	jose.gaviria@amerin.com.co	$2a$11$/JtLiNlZySapOgu1/7ZtdeZ.igmZ71Jt.tD6GemoJIgQQD72LNZTC	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-26 17:49:13.284961	2020-06-26 17:49:13.284961	\N	\N	\N	\N
3	sac@nasuu.com	$2a$11$KBqsO5i6hhbde8eGvRpbruB8eaM6gaI9Pn36dkTaXdWapumMIX5XK	\N	\N	\N	0	\N	\N	\N	\N	\N	Eider Sepúlveda		Nasuu					\N	\N	\N	\N	2020-05-23 07:42:31.540811	2020-05-23 07:43:11.412089	\N	\N	\N	\N
4	juanfdovelez@amerin.com.co	$2a$11$l3fmhSsBUpKNbrSuNwQ9rOPXEUomYxQFb6ZneRAIiKj5PtLcOI.PS	\N	\N	\N	0	\N	\N	\N	\N	\N	JUAN FERNANDO VELEZ ORTIZ	juanfdovelez@amerin.com.co	AMERIN SAS	http://amerin.com.co/sitio/		Español, Inglés		\N	\N	\N	\N	2020-05-23 08:56:51.534868	2020-05-23 08:58:53.404774	\N	\N	\N	\N
5	manuel.caro@exponencial-mente.com	$2a$11$p04IRPQm81LaaLkkqkxZs.k9W9X0Q/Pk9PtVATi2opDzWiRP0NM16	\N	\N	\N	0	\N	\N	\N	\N	\N	Manuel Caro	manuel.caro@exponencial-mente.com	Exponencial-Mente S.A.S.	http://www.exponencial-mente.com		Español		\N	\N	\N	\N	2020-05-23 09:04:06.46729	2020-05-23 09:06:45.581254	\N	\N	\N	\N
6	director@paruma.com	$2a$11$9rsI1Uz03E9yh826I6FKmez/XDchZP6wl1vR1ottVfGIz7V32n32.	\N	\N	\N	0	\N	\N	\N	\N	\N		director@paruma.com	Paruma Crowd Experience	https://paruma.co/que-evaluamos/		Español		\N	\N	\N	\N	2020-05-23 09:13:22.079923	2020-05-23 09:18:04.713358	\N	\N	\N	\N
7	rbedoya@ubicasat.com	$2a$11$4n0BtdjHosfj8s2HtOi7r.kghnrE6A0IH1.ICI6QaD4J.G./rXoV6	\N	\N	\N	0	\N	\N	\N	\N	\N	Richard Bedoya	rbedoya@ubicasat.com	Ubicasat Soluciones SAS	http://www.ecofy.co/ag/		Español		\N	\N	\N	\N	2020-05-23 09:24:04.896766	2020-05-23 09:25:13.039591	\N	\N	\N	\N
8	info@esourcecapital.com	$2a$11$NWEcI3PNS9VSizyo9ZNUgeLR6534ozJoFjInLAL2RyiE0ExMwuyLm	\N	\N	\N	0	\N	\N	\N	\N	\N		info@esourcecapital.com	eSource Capital	https://www.esourcecapital.com		Español, Inglés		\N	\N	\N	\N	2020-05-23 09:32:45.056235	2020-05-23 09:34:28.483247	\N	\N	\N	\N
9	hectortorres@torres.legal	$2a$11$lvmPHd/61F/JQdzToaQ2rebWzPpYU9hrWHkzglIgLilHViSdRd0WS	\N	\N	\N	0	\N	\N	\N	\N	\N	Hector Torres		Torres Legal			Inglés		\N	\N	\N	\N	2020-05-23 09:37:25.076009	2020-05-23 10:13:34.807371	\N	\N	\N	\N
10	david.gil@ndc-digital.com	$2a$11$c38hVwg4m74uXoBs8rcmbeLRCyDNo75gDZotjJsX4lSv.xb7PCnWO	\N	\N	\N	0	\N	\N	\N	\N	\N		david.gil@ndc-digital.com	NDC Digital	https://www.ndc-digital.com		Español		\N	\N	\N	\N	2020-05-23 10:16:47.614648	2020-05-23 10:17:27.393747	\N	\N	\N	\N
11	sales@masterdent.com.co	$2a$11$ZA1j5VP82l23TXHrxgvuH.HpkApyk88b8tG77olcA/3l2ZYkR9V5K	\N	\N	\N	0	\N	\N	\N	\N	\N	Sebastian Quesada	sales@masterdent.com.co	Masterdent Ltda	https://masterdent.com.co/		Español, Inglés		\N	\N	\N	\N	2020-05-23 10:20:44.135936	2020-05-23 10:22:15.333358	\N	\N	\N	\N
41	jorge_lozano@hotmail.com	$2a$11$bDsqeRLBZe8SToy81O16s.L.XCSA5tMhVl4q4bWSfX2YoCops2Soe	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-02 21:49:41.197052	2020-07-02 21:49:41.197052	\N	\N	\N	\N
12	rocio@ptree.com.mx	$2a$11$owpCM22hlkLZuV4WUQjqROf63lJXA5.qqUVUxNAe/FN5GR2BXKvXi	\N	\N	\N	0	\N	\N	\N	\N	\N		rocio@ptree.com.mx	LumApps	https://www.lumapps.com/product/features/				\N	\N	\N	\N	2020-05-23 10:23:25.322418	2020-05-23 10:25:56.980352	\N	\N	\N	\N
13	omadriz@continex.net	$2a$11$HEJJ2MNlFT0GcCvd5m0mYefUwqhbFFFbKvfZPW4ITLUYnesoAEC1O	\N	\N	\N	0	\N	\N	\N	\N	\N		omadriz@continex.net	Continex			Español, Inglés		\N	\N	\N	\N	2020-05-23 10:32:43.385624	2020-05-23 10:33:22.918454	\N	\N	\N	\N
14	carlos.angel@anka.com.co	$2a$11$SmAbEMxMg7vtUBgU2JRKVuFMpvm/1AmizaMYadvX4HtymDtcaRke2	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 10:41:45.070447	2020-05-23 10:41:45.070447	\N	\N	\N	\N
15	isabel.amaya@andesbpo.com	$2a$11$0k7waLioDASXQDUUMPnDa./Ib24.dtyUmRjeZn.60.tu3Q2p3JZb.	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 10:52:34.581702	2020-05-23 10:52:34.581702	\N	\N	\N	\N
16	ruben.hiciano@cablecomm.com.do	$2a$11$rmT6Y5rm/RzT4fLfv9lOde4R1oSsrMxZD5Oj2BBSWnf4MEUwrbGVy	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 10:55:53.432835	2020-05-23 10:55:53.432835	\N	\N	\N	\N
17	jerezmariajose@gmail.com	$2a$11$pOy68JAnJXJMD7M4qFK8CupKRTlhHE7P0U3gU5sRgKg9XapeEl.je	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 11:02:50.722235	2020-05-23 11:02:50.722235	\N	\N	\N	\N
18	plataforma@ecuuve.com	$2a$11$zc.8pqsnwoUk4pPQtBJwue1qofxO3eo2gm/OzzhSt0Oofva5bqVXe	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 11:05:49.892837	2020-05-23 11:05:49.892837	\N	\N	\N	\N
19	eg.marketing@escalategroup.com	$2a$11$093ZBK77CaXfepxQrqx8dOyF6Hd9KqNDqLTjuojCIdZfohR5XBw1q	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-23 11:09:25.06108	2020-05-23 11:09:25.06108	\N	\N	\N	\N
20	jimmytesla@protonmail.com	$2a$11$6z2r7WHYZEHoRsHhTXR.d.5p/SISAFiseiAAe63jXxXLOvi59M2Te	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-26 16:38:34.785246	2020-05-26 16:38:34.785246	\N	\N	\N	\N
21	maria@alternova.co	$2a$11$QNyqENba1Vs.FdBLTsFC5usHcxPJDkb6ppKogb2rY9q8gyMzW0zeW	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-26 18:59:17.39749	2020-05-26 18:59:17.39749	\N	\N	\N	\N
22	soy@companiax.com	$2a$11$UoGzXauMHif9w82QjssSoOElq.2bNXEHDbBDNQCj50UtO0PtQfUdO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-26 22:58:45.339727	2020-05-26 22:58:45.339727	\N	\N	\N	\N
23	wihic99682@chordmi.com	$2a$11$Lwl2S/prn1r3AovKlIlybuILLcFc5AixCMyIu0fxGrrNVcnRMv6lm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-27 16:03:14.147806	2020-05-27 16:03:14.147806	\N	\N	\N	\N
24	inserdtechgroup@gmail.com	$2a$11$W2qn2AaqGzTvnJBy7NMxxedBa2p1wpYxt53hHDMG4WuQ7oX2YYpbG	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-05-29 02:34:16.733245	2020-05-29 02:34:16.733245	\N	\N	\N	\N
26	lvera10@gmail.com	$2a$11$K56ZggyYtBUOnGt08CQDo.dzjGNdUSOhb66lNmlzFeqtuS56NfD56	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-04 15:40:04.790979	2020-06-04 15:40:04.790979	\N	\N	\N	\N
27	rutanio.confirmation@gmail.com	$2a$11$05X5DamiAcSqwWSjLLaT0OACmXywpuTbNdkN2EUgEmVWNEKrkpuyy	\N	\N	\N	0	\N	\N	\N	\N	\N								\N	\N	\N	2	2020-06-08 12:01:31.584411	2020-06-08 12:01:43.807608	\N	\N	\N	\N
28	olga@escalategroup.com	$2a$11$5IT7XUF4pyuDuO1pIOBJq.T/K4QfFCNtI9mfR.AqBpHjypQ9mUcV6	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-08 12:57:44.024437	2020-06-08 12:57:44.024437	\N	\N	\N	\N
29	javier.molina@gotodigital.es	$2a$11$y1MftqHVaalx54.ZBVbiPuJZwutX86hkuYwizhnkF8WCpn7abm93W	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-08 13:03:26.685927	2020-06-08 13:03:26.685927	\N	\N	\N	\N
31	info@rutanio.com	$2a$11$HZxUXyvwcw2bS.d4QULl0.TjqE1aFLVpBLY40kZrstM/1ziNKRbdu	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-11 22:07:27.660642	2020-06-11 22:07:27.660642	\N	\N	\N	\N
32	cesar.castro@fluidchains.com	$2a$11$5aC7RDC3UmZMKEjztv0ViO4XjjCFBIrt6o7w1z9RDd0VgveYsGopK	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-11 22:21:46.531583	2020-06-11 22:21:46.531583	\N	\N	\N	\N
33	jeronimo.perez@rutanio.com	$2a$11$/szLtTE2NNkgeL1nJukKL.TmH/xbb/e2C8p0ZGJjxo0rwykysaiDO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-11 22:24:53.447316	2020-06-11 22:24:53.447316	\N	\N	\N	\N
34	lparra@fluyt.org	$2a$11$o1jm3Q30PRdiviGWPD0iruQ2cHQt4JuwyQQvkcc/AYrLb/9bDYmJi	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-11 22:27:30.652674	2020-06-11 22:27:30.652674	\N	\N	\N	\N
35	juan.220894@gmail.com	$2a$11$myt75cMcR0PdsKm8zKqyyONF8qJntra9Ew/rC6vEnuonx0RxoelQm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-16 13:36:37.202282	2020-06-16 13:36:37.202282	\N	\N	\N	\N
36	josenelsoncarrillo1974@gmail.com	$2a$11$Q9PhYeBJi.W.b.2BbfYfxOO9usX2bwn.t2G9hlyg3EGKCrOJD6nzK	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-16 13:56:54.137852	2020-06-16 13:56:54.137852	\N	\N	\N	\N
38	felipecanom@hotmail.com	$2a$11$yu5YOGmgF1fug9cVxxJT.u/fWGOlW4gC3XXYRRFD0rvi3QGiSpIXy	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-17 16:33:37.189212	2020-06-17 16:33:37.189212	\N	\N	\N	\N
39	venturechile@gmail.com	$2a$11$Gc3oIynmm9Dp9UluOaHH4OlXnGTtmeD6VVX8G4KzwCK2w./r8V8Am	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-24 01:08:36.225773	2020-06-24 01:08:36.225773	\N	\N	\N	\N
44	paola.contreras.torres@gmail.com	$2a$11$m8Lgs3msea5ptbgDIiMPO.aaAQNfOrukXXx3fDvotSXSzIG60BaUK	\N	\N	\N	0	\N	\N	\N	\N	\N	Paola Contreras Torres		Independiente		Arquitecto Empresarial	Español	Nina#7005	\N	\N	\N	\N	2020-07-07 00:39:08.709485	2020-07-07 00:43:57.103038	\N	\N	\N	\N
45	soportepi@gmail.com	$2a$11$NeSuDcZd04OUDY11yh9YAeebaF/lKiCPw7kiCaW8fZM8ENkXlP31W	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-09 21:14:19.001222	2020-07-09 21:14:19.001222	\N	\N	\N	\N
46	k.besprosvan@gmail.com	$2a$11$mbxoQRnIn9cKYG52WejWLOdOJOmyHOmxmxHx5FMvL3Eb5op5shXD2	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-10 14:45:45.202092	2020-07-10 14:45:45.202092	\N	\N	\N	\N
47	camilomolina@gmail.com	$2a$11$stN7bsQC9.nIi7LYDTPETuZfpEiKUvR.Q6n/vbwwpX8PXMojOx.xO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-10 16:16:24.902339	2020-07-10 16:16:24.902339	\N	\N	\N	\N
48	lfcardona@gmail.com	$2a$11$LNUkKRNAOdgVpRbhHvnE8eXMj8Yv9DqdmAD24anQR4CDj1HPzFgES	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-10 16:16:26.760902	2020-07-10 16:16:26.760902	\N	\N	\N	\N
37	polydeveloper@gmail.com	$2a$11$KSExPoZf.x2CDRiTQxE04excDemyiSZTyR0VQ6/6K3Nmk061F/uR6	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-17 12:01:40.489691	2020-08-04 13:51:45.392566	q4eeybr_FRHHWJEeLs9R	2020-08-04 13:51:45.392085	2020-08-04 13:49:04.970962	\N
25	angelo@internationalcenter.cl	$2a$11$YWrguBuRQE4EVFNnJ1MPWO7wPkTVaA4qeBYChjTjyPpgP/Z0oNAzO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-06-02 12:59:31.492398	2020-08-05 16:23:51.316157	8ozv_zZK_4Py23ZbzSbh	2020-08-05 16:23:51.315668	2020-08-05 16:13:52.768342	\N
49	datouri@gmail.com	$2a$11$MMB4SZFBRQER9KecEKJiHO6HZJV2F5DFUJmmTh80ShGc9Cr6E5Tey	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-14 14:50:01.877271	2020-07-14 14:50:01.877271	\N	\N	\N	\N
50	director@paruma.co	$2a$11$uKdB0SBbzihFwLDQ0wYFGemcTGTV7DknTx0sKVULkc50WE/hsaomK	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-14 19:25:34.322132	2020-07-14 19:25:34.322132	\N	\N	\N	\N
51	joel.sanchez.aristizabal@gmail.com	$2a$11$jAEmLASNqyCF8uvrJ2ZnreDomhEHBsm/DTTRKOXU8cZa4nCet2VCy	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 16:47:23.052862	2020-07-15 16:47:23.052862	\N	\N	\N	\N
52	sergio@ypac.cl	$2a$11$1EAGSA71aBzA3WO6kV1NTueJPOBehF38psfJRrTaOQpKOK4Na3EwW	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 19:31:51.063957	2020-07-15 19:31:51.063957	\N	\N	\N	\N
53	b.lattanzimerino@gmail.com	$2a$11$slCEjbcs/GZmvch/k5J5HOHoNXcHD8h5Wk4Q9LxRiylZA4J2LTbxG	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 19:35:05.776237	2020-07-15 19:35:05.776237	\N	\N	\N	\N
54	acosta713@hotmail.com	$2a$11$i/ae8Hr8G6IbnhRQz/.W4OqMr8gDta5mhl/lH.5XSUzMeZjPb0wO.	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 20:16:55.454576	2020-07-15 20:16:55.454576	\N	\N	\N	\N
55	dcadavid71@gmail.com	$2a$11$lK/HCY/WIvN6QZZwbjfuyeoJoPrhlZ5wBNzL0e8Zf2j/nVsiW6RYK	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 20:17:13.074601	2020-07-15 20:17:13.074601	\N	\N	\N	\N
56	elvipineda25616@gmail.com	$2a$11$xk9CL0Xk3rpt7f5MyFNaZOeXK2ga.N6.4FtuRz46VpLktbYgpMIqW	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 20:31:07.27207	2020-07-15 20:31:07.27207	\N	\N	\N	\N
57	valerio.quintero@gmail.com	$2a$11$97v5Xq3HGbTNvJ4QX85mq.KqjAGurab1FuJaf5HRlPw7PGCUoVew2	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 21:50:32.152955	2020-07-15 21:50:32.152955	\N	\N	\N	\N
58	alejandro.gomez@digitalamericas.ai	$2a$11$vfCJRakEPKQDC0whESJxNugIG.swRvL7t.gaSIUP99veOMjvZqAdu	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 21:50:44.655118	2020-07-15 21:50:44.655118	\N	\N	\N	\N
59	cristian.gomez@dataknow.co	$2a$11$0xON.CqZlq32fpv/TT0XvOrl2I.x89OyQCGAyiXgsQptv.Gab6ppm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 21:50:53.466684	2020-07-15 21:50:53.466684	\N	\N	\N	\N
60	agarmolina@gmail.com	$2a$11$X2m5zgWKlyAGq.yYN8CZUu55YYjwGsVuwdkEb7SqtLzTMk49Yk9mu	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-15 21:51:08.152606	2020-07-15 21:51:08.152606	\N	\N	\N	\N
61	gerencia@consultoriaestrategia.com.co	$2a$11$AEOqzyBz3GQnIujLvko95.gjqGLxkfJZiv6OKKtLdT/UH30u1dvya	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-16 16:30:38.003041	2020-07-16 16:30:38.003041	\N	\N	\N	\N
62	andres@givu.co	$2a$11$R/3dSVTU/67yqUBTj7JSi.FKruKSEvADhdpwZqQ8MFKGOsZMduljy	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-17 00:15:33.29974	2020-07-17 00:15:33.29974	\N	\N	\N	\N
63	sebastian.castrillon@estratek.com.co	$2a$11$hnzOuOm4F3op1GH327mE1efFi7F3SR5M0/Wx7Sq83f0OpoRqNTucC	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-17 16:50:41.270546	2020-07-17 16:50:41.270546	\N	\N	\N	\N
64	mtcalderon@enconcreto.co	$2a$11$lirXvlmenUSjuCVSRiAV0etkZBsIrCl8vzR36Bh716J4XVJbAVzFG	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-17 16:50:56.906635	2020-07-17 16:50:56.906635	\N	\N	\N	\N
65	sm@proyectosinteligentes.com	$2a$11$ndBYK5.Hsvnp25/p.XaYu.vshOMhEh7i.Fx/dAHtMCKbXzGjV3JRS	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-17 23:08:08.885143	2020-07-17 23:08:08.885143	\N	\N	\N	\N
66	fm@proyectosinteligentes.com	$2a$11$7irnOl9i01pYTF0sq3fwiOTV4ROVQ.NgXqPqNrwm543/THNVehrn.	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-17 23:08:25.430946	2020-07-17 23:08:25.430946	\N	\N	\N	\N
67	christopher_cordero@yahoo.com.mx	$2a$11$WHTDYj1YSE/6RcZrkYLY4.21UQ0u.AJ9z0P6413nZuyTF6xKaBlmm	\N	\N	\N	0	\N	\N	\N	\N	\N	Christopher Lopez	christopher_cordero@yahoo.com.mx		https://www.linkedin.com/in/christopher-l%C3%B3pez-cordero-91736397/	QA Manager y Lean Change Agent	Español	#5305	\N	\N	\N	\N	2020-07-21 21:59:07.10981	2020-07-21 22:03:45.918151	\N	\N	\N	\N
68	andres@grovity.co	$2a$11$aSv2off1786doLsn8nUf2.ol.HIxVzI/S0nxLGcd4A10RlGsft7Qu	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-21 22:40:37.98114	2020-07-21 22:40:37.98114	\N	\N	\N	\N
69	alejaposada@gmail.com	$2a$11$z8iirMSssmNRLbs2jxZSUOaC3sRaz2tO/wITRgOw8WnFn64kJtLfa	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-22 18:36:51.656654	2020-07-22 18:36:51.656654	\N	\N	\N	\N
42	jonathan-financiero@hotmail.com	$2a$11$Sm4/gKqnU/P/8qY/OmFnzOlvIRMaoSsEa.y8ZOlFikT95LY6tyjq6	\N	\N	\N	0	\N	\N	\N	\N	\N	Jonathan Duque 	jonathan-financiero@hotmail.com	AEEM SAS 	www.aeemsas.com	Ingeniero Financiero - Especialista en Finanzas y Magister en administración financiera 	Español		\N	\N	\N	\N	2020-07-04 01:03:59.262713	2020-07-22 19:07:08.134016	\N	\N	\N	\N
70	jose@novusconcepta.com	$2a$11$N5bc5eUSBxYWWSe8s3w6Lu76PAZGB8THHhUbV7whpAT9FtB4GnjWm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-22 20:16:24.465849	2020-07-22 20:16:24.465849	\N	\N	\N	\N
71	comeculos@4000.com	$2a$11$FoWcQBNeHrqRyqJbCHoS0ugRHBHczGnCs4LSiE2TC.gT4MK3ep3Rm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-22 22:54:49.933839	2020-07-22 22:54:49.933839	\N	\N	\N	\N
81	ricardocardonadiaz@gmail.com	$2a$11$sPMTDF0KYHYw0QV81QRQWeT7l4dITsfSAL3EuTInuWgRP0uf6xQCC	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:48:12.782943	2020-07-31 16:48:12.782943	\N	\N	\N	\N
72	alejandra@furore.co	$2a$11$c20QQCOyXwXIF5U7/QgazO9TPjkdBGE43xc3jaO8KUc8M1eaPCBO6	\N	\N	\N	0	\N	\N	\N	\N	\N	Alejandra Zuleta	info@furore.co	Furore	www.furore.co	Ingeniera de Diseño de Producto, Especialista en Mercadeo y Marketing de Lujo	Español, Inglés, Alemán		\N	\N	\N	\N	2020-07-23 15:52:51.540009	2020-07-23 16:06:31.964559	\N	\N	\N	\N
73	admin@viferente.com	$2a$11$cDQSKfXJL8XjXYINUPCNUOMJeJCyCuBaNzk20e5lK3/b7Ni9iWA9C	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-23 20:10:46.236498	2020-07-23 20:10:46.236498	\N	\N	\N	\N
82	gerencia@ambientesoluciones.com	$2a$11$iOBEQOU5NW4VhrJZyUwY3.Bxu2jNm9AWqpwiRjTaupuxit/d6ESK6	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:48:15.053969	2020-07-31 16:48:15.053969	\N	\N	\N	\N
74	lorenapalma85@gmail.com	$2a$11$V00OW1tM0LXAovaZTU4YQul7/1H6nSb.auMhNKFJpEMRqAf8QbosS	\N	\N	\N	0	\N	\N	\N	\N	\N	Lorena Palma		rutanio 		Especialista en Innnovación	Españaol	Lore Palma	\N	\N	\N	\N	2020-07-23 20:20:26.188675	2020-07-23 20:37:09.497072	\N	\N	\N	\N
75	jmoncada@circularcoworking.com	$2a$11$OBfHSECUE22P0bTlBY/GG.8/w5hzkkwoY0WCUx4G2uD5/TnrQgCv6	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-24 20:36:29.686711	2020-07-24 20:36:29.686711	\N	\N	\N	\N
76	rene.velasquez@gmail.com	$2a$11$Acv68g5KGZDmrDrqqKYsauIipqd.NvDq86hSgwrrhoK5u.QTXeavS	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-25 00:03:07.913193	2020-07-25 00:03:07.913193	\N	\N	\N	\N
43	alejandro.molymol@gmail.com	$2a$11$O7YSk4aaksUr23d3NAKHbezCUbZwtIGO5RBzhjS5ploZJUQtj08wq	\N	\N	\N	0	\N	\N	\N	\N	\N	Alejandro Molina y Molina	alejandro.molymol@gmail.com	Alejandro Molina, Agile Coach	https://sites.google.com/view/alejandromolina-agilecoaching/inicio	Ingeniero Industrial	Español / English	Alejandro Molina#8147	\N	\N	\N	\N	2020-07-05 21:21:21.698396	2020-07-28 23:17:04.922567	\N	\N	\N	\N
78	dvplot@gmail.com	$2a$11$nTmY77Gr4urwKGWp96K6DuJ9qLsBYXRbNdS6GXeFrbCkf/h.qH1aa	\N	\N	\N	0	\N	\N	\N	\N	\N	Daniel Plotrino						@dplotrino	\N	\N	\N	\N	2020-07-29 13:54:22.857627	2020-07-29 13:56:59.380946	\N	\N	\N	\N
79	danielasaffon@gmail.com	$2a$11$NucPSSZcln.3aMLNFMq.Ce2B.rkU6uUE8TBD0fgISdQvaMn0qELwG	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:47:33.368504	2020-07-31 16:47:33.368504	\N	\N	\N	\N
80	ginamontes86@gmail.com	$2a$11$mGEYoNTM7HhDXdrvXbUkJu3Uaus2NltKGWQyxqx/GBmnC.ZnNb4OO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:47:46.981714	2020-07-31 16:47:46.981714	\N	\N	\N	\N
83	rickgarciam@gmail.com	$2a$11$vCXmqiIjZcW.6e4hVYVJjO1DmOOQjD3.w0oTO.K18zMMQlA6jWE9e	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:48:32.676855	2020-07-31 16:48:32.676855	\N	\N	\N	\N
84	chernandez@futbolparaelfuturo.org	$2a$11$7k5gCZP7wsbkovqEpjxNVextP6x4UuP99ErWEUq4vL5wP9qFLV.w2	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 16:50:36.641736	2020-07-31 16:50:36.641736	\N	\N	\N	\N
85	oro.sulmym@gmail.com	$2a$11$DeiiilCawDrprjraqa5gB.dwri82Z.Qmp/fsbR/AQA/ZipSHsRo/G	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 18:26:33.423294	2020-07-31 18:26:33.423294	\N	\N	\N	\N
86	juan.vallejo@cuadrolegal.com	$2a$11$oGv3ETzZV9bl1MlO2JZn8OMjcCUh/gIHhrBCSfNGON13zIrec43wm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-31 21:09:08.540254	2020-07-31 21:09:08.540254	\N	\N	\N	\N
87	vivian.sierra@gmail.com	$2a$11$foSb1oElFJaZP9z2wUXeJ.27IaSLuvKLxO68KDV0gauRuUz0v6WAS	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-08-01 04:12:07.096604	2020-08-01 04:12:07.096604	\N	\N	\N	\N
2	jsagudeloaa@gmail.com	$2a$11$f1.j9HyKhoRn0L6j8KyM4u1MYv6muo/rO/ocBJL4yOJGBBOmmSyLW	8798b4dbf85aaa1989f70cfac3f4573232835dc525dcb92d7a7e3e9f0cc41c17	2020-08-03 03:49:46.805708	\N	0	\N	\N	\N	\N	\N	Sebastian Agudelo							\N	\N	\N	2	2020-05-23 00:47:58.588647	2020-08-03 03:49:46.806113	7JhM8xxz2bM-8zYQ1Fx7	2020-08-02 10:15:08.070711	2020-08-02 10:14:53.284504	\N
88	tokens@escalategroup.com	$2a$11$fzAGx29AqUid.mxW9zez0epTFySziIKIUQU5IUzRQjhkuS6n1BWJm	\N	\N	\N	0	\N	\N	\N	\N	\N	Escalate				Services	Español - English - Português		\N	\N	\N	\N	2020-08-02 21:22:25.360579	2020-08-02 21:26:09.654815	UahFrydskV8YBFcQMR_L	2020-08-02 21:23:09.541048	2020-08-02 21:22:25.360734	\N
77	rodrigo.salazar.barria@gmail.com	$2a$11$S6aXWZ4cs4c6PwsiwKuJzOPJpDLrLOAerDXSmOYH2m4OsPK7XQoHm	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-07-28 20:41:57.077358	2020-08-02 22:35:50.434112	3JBPYixxqb3WsexXKesx	2020-08-02 22:35:50.433608	2020-08-02 22:35:35.197229	\N
90	andreap@bluestudies.com	$2a$11$TSQPIC80Mr73ZgHjes5JUuvWBWPY.5yGOqqmCtwQCX5fbFTaEkeNG	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-08-04 00:02:37.636611	2020-08-04 00:04:12.579568	uJq3Wqja4HgAfZFB93ME	2020-08-04 00:04:12.578817	2020-08-04 00:02:37.636696	\N
91	carlosangel81@gmail.com	$2a$11$ECrf6N.cgTL6pGjpg1cSfOLPIKwq5fWERP5aWduCqcBlOyTP0t.RO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-08-04 00:02:56.722915	2020-08-04 00:06:17.126372	xwzkJ2exvN_BDsv5AWfn	2020-08-04 00:06:17.125871	2020-08-04 00:02:56.72303	\N
89	jennyprada03@gmail.com	$2a$11$x3olbBAWN1EsogVec8eyhOceGJyL.qRpy6rwXiN3GYZ13gAcB/gLq	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-08-04 00:02:33.145797	2020-08-04 00:06:34.492051	v2McPYjj6bf_7vAgiumM	2020-08-04 00:06:34.491504	2020-08-04 00:02:33.145895	\N
92	p.lopezsela@gmail.com	$2a$11$AL5GPw70SVVyNdhxGF9AAu34.Rh5JABvaUtGcTPtkgrKuPjyUK/wO	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-08-05 18:22:51.057988	2020-08-05 18:23:12.4707	KgG2rU5ryshNNscwuoZc	2020-08-05 18:23:12.470247	2020-08-05 18:22:51.058084	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: has_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.has_categories_id_seq', 73, true);


--
-- Name: has_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.has_skills_id_seq', 228, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.requests_id_seq', 48, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.services_id_seq', 73, true);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.skills_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('public.users_id_seq', 92, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: has_categories has_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_categories
    ADD CONSTRAINT has_categories_pkey PRIMARY KEY (id);


--
-- Name: has_skills has_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_skills
    ADD CONSTRAINT has_skills_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_has_categories_on_category_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_has_categories_on_category_id ON public.has_categories USING btree (category_id);


--
-- Name: index_has_categories_on_service_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_has_categories_on_service_id ON public.has_categories USING btree (service_id);


--
-- Name: index_has_skills_on_service_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_has_skills_on_service_id ON public.has_skills USING btree (service_id);


--
-- Name: index_has_skills_on_skill_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_has_skills_on_skill_id ON public.has_skills USING btree (skill_id);


--
-- Name: index_requests_on_service_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_requests_on_service_id ON public.requests USING btree (service_id);


--
-- Name: index_requests_on_user_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_requests_on_user_id ON public.requests USING btree (user_id);


--
-- Name: index_services_on_user_id; Type: INDEX; Schema: public; Owner: rails
--

CREATE INDEX index_services_on_user_id ON public.services USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: rails
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: rails
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: has_skills fk_rails_3588c20a86; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_skills
    ADD CONSTRAINT fk_rails_3588c20a86 FOREIGN KEY (skill_id) REFERENCES public.skills(id);


--
-- Name: services fk_rails_51a813203f; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_rails_51a813203f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: has_categories fk_rails_7cabfe7326; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_categories
    ADD CONSTRAINT fk_rails_7cabfe7326 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: requests fk_rails_8ead8b1e6b; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_rails_8ead8b1e6b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: has_categories fk_rails_94f476ea9f; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_categories
    ADD CONSTRAINT fk_rails_94f476ea9f FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: requests fk_rails_b33e95139d; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_rails_b33e95139d FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: has_skills fk_rails_f39bd0f6ec; Type: FK CONSTRAINT; Schema: public; Owner: rails
--

ALTER TABLE ONLY public.has_skills
    ADD CONSTRAINT fk_rails_f39bd0f6ec FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- PostgreSQL database dump complete
--

