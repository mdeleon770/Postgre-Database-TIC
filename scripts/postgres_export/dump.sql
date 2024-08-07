--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:K+nOJaHEh2E521MpiEpX2A==$FFWbQzX7qSUGEfVUwgYynwOsmHOkxYhjUMLWC+lTaQ4=:rfIx7Xv7U0j21yZYxLueu+SKHO8sMMmy625Sxerpfn0=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: enum_interactions_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_interactions_type AS ENUM (
    'email',
    'call',
    'purchase'
);


ALTER TYPE public.enum_interactions_type OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'seller',
    'user'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "phoneNumber" character varying(255),
    address character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: interactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactions (
    id integer NOT NULL,
    "contactId" integer NOT NULL,
    type public.enum_interactions_type NOT NULL,
    date timestamp with time zone NOT NULL,
    notes text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.interactions OWNER TO postgres;

--
-- Name: interactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interactions_id_seq OWNER TO postgres;

--
-- Name: interactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interactions_id_seq OWNED BY public.interactions.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    "contactId" integer NOT NULL,
    "saleId" character varying(255) NOT NULL,
    "productImage" character varying(255),
    product character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    notes text,
    date timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role public.enum_users_role DEFAULT 'user'::public.enum_users_role NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    avatar character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: interactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions ALTER COLUMN id SET DEFAULT nextval('public.interactions_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, "userId", "phoneNumber", address, "createdAt", "updatedAt") FROM stdin;
1	73	(923) 872-0504 x8852	8948 Heber Coves	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
2	81	1-881-850-0832 x050	2626 River Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
3	90	827-324-1248 x175	543 Koch Dam	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
4	26	923-888-5653	1316 Fore Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
5	72	503-260-7183	94990 Lesch Crescent	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
6	82	741.289.2546 x34111	556 Senger Stream	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
7	58	1-470-731-3433 x37681	265 Adams Land	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
8	75	725-699-7717 x9210	810 Jacobs Mountains	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
9	76	(831) 495-0922	76582 King Roads	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
10	3	(849) 944-9488 x60257	39782 Teagan Forest	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
11	23	(444) 446-3670	50602 Sandrine Dam	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
12	19	(240) 760-5911 x992	9041 Delfina Passage	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
13	53	1-761-708-0012 x95800	8982 Martin Luther King Jr Boulevard	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
14	72	1-259-986-3715	291 Princess Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
15	60	(592) 570-5634 x55235	366 Guido Union	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
16	89	718.784.8763 x2481	8622 Prospect Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
17	52	844.852.2598 x69022	38693 Don Flat	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
18	65	683-739-0808 x178	34867 Champlin Brook	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
19	73	1-370-643-1691 x08660	978 McDermott Turnpike	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
20	41	1-276-475-0752 x716	3161 James Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
21	45	407-216-8534 x94980	1682 Smith Heights	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
22	56	(367) 233-4373 x6199	96512 Pearl Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
23	14	(644) 655-3249	2398 Swift Throughway	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
24	45	(789) 452-6079 x0292	8038 Arvid Estates	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
25	81	578-220-5055 x4543	4910 Vickie Trace	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
26	57	680.964.5368 x4348	844 Strosin Lake	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
27	75	(915) 596-8820 x914	917 Crescent Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
28	35	1-411-808-9304 x4300	19996 Maia Fields	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
29	90	254.645.1392 x3744	1469 Broadway	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
30	55	506.361.4883 x626	77627 Kihn Trace	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
31	19	(441) 331-6804 x5463	8616 Broad Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
32	44	236-703-4386	2359 Gleason Locks	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
33	80	1-419-596-1817 x467	86720 Cherry Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
34	95	797-678-0645 x553	33020 Homenick Parkway	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
35	49	(480) 373-4999	9459 Konopelski Cape	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
36	61	512.930.4700 x32672	81298 Buckingham Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
37	51	340.929.2735 x78406	157 Jason Viaduct	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
38	31	1-231-378-8736 x419	1697 Lodge Close	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
39	45	(472) 408-2935 x376	17837 E 10th Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
40	79	308.702.1376 x82666	747 Michelle Keys	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
41	90	944-921-5602	4781 Keely Mills	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
42	8	649.834.2750	9344 Wiza Glen	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
43	62	(202) 619-0259	21084 Liam Cliffs	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
44	40	(237) 369-8934 x582	174 Mraz Rapid	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
45	86	234.750.9404 x863	63684 Jamaal Spur	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
46	18	(226) 457-6306 x5986	719 Considine Avenue	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
47	10	230-250-7465 x8222	5312 Jesus Cove	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
48	38	462-458-6872 x0168	26846 The Dell	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
49	53	643.721.4720 x335	15985 Ridge Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
50	42	(916) 257-2470	5891 Jaeden Burg	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
51	6	(922) 268-0412	7847 Schuster Mount	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
52	86	591.662.4468	717 Ursula Manor	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
53	79	682.902.9725 x640	7344 Schuppe Walk	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
54	69	277-311-0471	30285 Buster Dale	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
55	10	(351) 347-4145 x934	573 Waverley Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
56	57	(556) 637-4144	387 Farm Close	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
57	48	1-848-314-4223 x6069	76381 Green Ridges	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
58	24	1-948-614-9646 x29779	7657 E 10th Street	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
59	88	1-363-622-1586	7472 Elmira Garden	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
60	77	618-759-5183 x88936	730 Gillian Mills	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
61	29	1-471-234-4618 x5585	3763 Barton Pike	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
62	22	(870) 499-5617 x07702	1186 Reta Squares	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
63	57	427.787.5639 x821	72950 Nitzsche Court	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
64	15	1-997-253-6568 x0172	76572 Ibrahim Locks	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
65	34	652.810.4846	7889 McLaughlin Place	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
66	35	(493) 734-9011	17500 Caleb Alley	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
67	22	1-516-531-4142 x5199	86894 Boehm Stravenue	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
68	26	633.411.5440 x70332	3374 Wehner Pines	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
69	76	1-387-208-0777	2180 Hilll Locks	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
70	17	381-735-2706 x176	69717 Vicarage Close	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
71	36	1-481-704-4991 x2620	392 Alexzander Ridge	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
72	8	(863) 602-4369 x3048	110 W 4th Avenue	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
73	64	775.992.0132 x641	754 Wiza Plain	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
74	10	1-794-582-2039 x800	16128 Hoeger Field	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
75	94	451-623-3402 x3288	52577 Johnston Loaf	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
76	72	1-277-766-5400 x324	612 Beulah Estate	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
77	33	936-202-3730 x7742	2851 Old Military Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
78	44	(648) 759-0897 x07420	269 Kozey Grove	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
79	34	987-503-7753 x429	929 Lind Hollow	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
80	93	946.562.9642 x53708	254 Stanley Road	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
81	27	(996) 871-5350 x6787	695 Sam Knoll	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
82	63	(912) 673-9131	435 The Lane	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
83	95	1-549-949-1034 x485	6080 Spencer Points	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
84	15	243-728-4689	20264 Goldner Skyway	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
85	5	1-696-434-8260 x655	77146 Jerrod Well	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
86	30	972-503-5356 x498	1494 Bernhard Corners	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
87	55	1-263-680-9315	6061 Prince Point	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
88	76	(241) 456-8264 x63036	417 Roderick Ford	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
89	56	349-927-8574 x233	9314 Sydnee Gateway	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
90	27	343-776-7036 x98214	8843 Constantin Springs	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
91	20	613-956-3908	1827 Park View	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
92	47	476-966-0804	4445 Baron Creek	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
93	55	(903) 292-8894 x4458	32013 The Croft	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
94	88	364-832-2026 x56774	4727 Church Close	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
95	67	484-363-0997 x733	9094 Cow Lane	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
96	55	382-740-5678 x01109	3529 Johann Hills	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
97	26	(418) 619-6972 x0937	692 Karine Coves	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
98	35	(255) 582-6571	927 Nikki Cliffs	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
99	17	1-675-621-5038	824 Ola Divide	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
100	48	1-724-465-4879 x228	504 Rebeca Corner	2024-08-07 02:04:20.833+00	2024-08-07 02:04:20.833+00
\.


--
-- Data for Name: interactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactions (id, "contactId", type, date, notes, "createdAt", "updatedAt") FROM stdin;
1	40	purchase	2024-08-07 02:07:44.102+00	Perspiciatis quis tumultus creo desidero crur apto talis pariatur.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
2	7	call	2024-08-07 02:07:44.103+00	Corrupti aptus terminatio.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
3	14	email	2024-08-07 02:07:44.103+00	Adnuo tametsi libero coniuratio amplexus aiunt conicio beatus.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
4	17	call	2024-08-07 02:07:44.103+00	Contra desino cogito suppellex utpote aliqua.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
5	93	call	2024-08-07 02:07:44.104+00	Accendo ait cotidie ullam.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
6	27	call	2024-08-07 02:07:44.104+00	Pariatur convoco spargo sortitus timor solum enim cubitum tyrannus.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
7	25	email	2024-08-07 02:07:44.104+00	Vetus verus uterque talis alter sopor corrupti villa urbs.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
8	54	call	2024-08-07 02:07:44.104+00	Arma amitto commemoro cattus tego baiulus.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
9	84	call	2024-08-07 02:07:44.104+00	Acceptus triduana arx summopere.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
10	28	call	2024-08-07 02:07:44.104+00	Tardus vitium certus cenaculum spargo curiositas condico.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
11	43	call	2024-08-07 02:07:44.104+00	Sonitus delinquo territo artificiose stella defero bellicus delectus territo amor.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
12	62	email	2024-08-07 02:07:44.104+00	Usitas commodo qui umbra speculum copia.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
13	15	purchase	2024-08-07 02:07:44.104+00	Caute delibero auctor voluptate deprimo aegrus odio cogo conor tenax.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
14	40	email	2024-08-07 02:07:44.104+00	Artificiose acidus varietas adhuc cursus numquam.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
15	37	email	2024-08-07 02:07:44.104+00	Amet cresco speciosus carpo reiciendis aspernatur atqui adopto decet claro.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
16	52	call	2024-08-07 02:07:44.104+00	Arca crustulum ventus.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
17	31	call	2024-08-07 02:07:44.104+00	Ratione cupio tunc aetas vestigium ullus vinco vicinus undique.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
18	61	purchase	2024-08-07 02:07:44.104+00	Aureus qui combibo vicinus comminor pecus volup crustulum.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
19	36	purchase	2024-08-07 02:07:44.104+00	Cresco tot cuppedia ipsum voluptates depono facilis tricesimus tergum.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
20	12	email	2024-08-07 02:07:44.104+00	Amplitudo unus tergiversatio sordeo adduco sumptus tutamen ad vis.	2024-08-07 02:07:44.104+00	2024-08-07 02:07:44.104+00
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (id, "contactId", "saleId", "productImage", product, amount, notes, date, "createdAt", "updatedAt") FROM stdin;
1	9	8c08b8b0-f6d8-408e-a7c1-e2ca5de36f99	https://loremflickr.com/640/480/apartment?lock=2928520539930624	Modern Concrete Bacon	966.00	Vallum quos depromo.	2024-08-06 04:27:41.95+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
2	48	81b34f01-1314-4c39-9636-bfdf1ab35e3e	https://loremflickr.com/640/480/apartment?lock=5639606666002432	Practical Soft Bike	650.00	Apparatus architecto clementia cogo.	2024-08-07 01:50:08.427+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
3	18	bc997a6e-4582-4e1d-bee6-fd009938c436	https://loremflickr.com/640/480/apartment?lock=3347439996108800	Practical Steel Hat	611.00	Deleo depulso thymum conservo ipsa vorago.	2024-08-06 10:12:57.236+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
4	77	b906ad85-9f26-4679-aac4-f2dbc82997c0	https://loremflickr.com/640/480/apartment?lock=4562646030352384	Bespoke Concrete Mouse	326.00	Thesaurus solvo blandior consuasor depereo capillus suasoria amitto vulariter dignissimos.	2024-08-06 18:20:44.875+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
5	17	151676da-5e20-40d6-8c25-6708f3d59b1b	https://loremflickr.com/640/480/apartment?lock=1761645990772736	Ergonomic Plastic Gloves	68.00	Nobis doloribus volubilis arbor delicate averto.	2024-08-06 19:17:45.334+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
6	24	eb3d87c8-5740-42e4-b746-14834d4c92ac	https://loremflickr.com/640/480/apartment?lock=3180048056057856	Elegant Plastic Chicken	746.00	Praesentium verbera crur supra conturbo sufficio.	2024-08-07 00:08:20.579+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
7	2	e3f13b83-e529-4e2f-abaa-ad7f7024be4f	https://loremflickr.com/640/480/apartment?lock=4827147501830144	Recycled Metal Ball	561.00	Illo claustrum suscipit.	2024-08-06 15:23:58.582+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
8	28	1c6808f5-9c8b-4935-8fd9-e4f64dcbffa4	https://loremflickr.com/640/480/apartment?lock=8058048574652416	Refined Wooden Shirt	81.00	Tabgo sponte truculenter contego cura calamitas demum cogo.	2024-08-06 12:40:30.499+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
9	48	3e2e343c-5f14-438a-b73e-5dbd59fd3eed	https://loremflickr.com/640/480/apartment?lock=4448343864377344	Intelligent Concrete Fish	211.00	Adinventitias rerum dedico adflicto utor subnecto tamquam amicitia trucido talis.	2024-08-06 12:16:01.281+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
10	63	bbe43325-5871-4f8b-96db-236fe5fb2474	https://loremflickr.com/640/480/apartment?lock=685162731929600	Elegant Soft Table	507.00	Adfero pel reprehenderit bibo.	2024-08-06 09:29:31.787+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
11	11	55298d2b-85f9-4471-911c-7b37070b2024	https://loremflickr.com/640/480/apartment?lock=6929566538924032	Practical Cotton Computer	109.00	Timor despecto conservo ullus artificiose vigor tibi sint defero.	2024-08-06 19:45:44.091+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
12	29	8023c9bf-43d8-4a49-bc34-11904006bc2c	https://loremflickr.com/640/480/apartment?lock=7000846411759616	Handmade Soft Ball	731.00	Audax arma vulticulus.	2024-08-06 19:23:33.188+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
13	60	bb134f90-c314-497d-8c2b-445304518d2e	https://loremflickr.com/640/480/apartment?lock=5550756371365888	Oriental Fresh Soap	172.00	Demens sapiente bardus ipsam delinquo.	2024-08-06 03:06:03.442+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
14	91	5e346b0b-9cc9-4d49-beaa-4401012aa855	https://loremflickr.com/640/480/apartment?lock=7612448194428928	Unbranded Cotton Towels	687.00	Pecto considero verbera patrocinor admiratio patior defleo tepesco.	2024-08-06 13:18:37.804+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
15	3	4a24dc6d-22ba-4339-80e3-57ddc6bcb060	https://loremflickr.com/640/480/apartment?lock=1509193494298624	Handcrafted Frozen Hat	709.00	Coepi confero sto utrum inflammatio.	2024-08-07 01:34:44.261+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
16	56	66897b3b-d368-4fd8-8fae-9c452cd852e7	https://loremflickr.com/640/480/apartment?lock=1829557134950400	Awesome Plastic Soap	114.00	A cunctatio coniecto mollitia officia tepidus decipio subnecto.	2024-08-06 10:25:01.809+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
17	9	27749704-ea06-4b31-9ac3-74f18bd5b9c0	https://loremflickr.com/640/480/apartment?lock=2089919568674816	Ergonomic Metal Gloves	332.00	Adicio curia solus asper.	2024-08-06 05:20:26.532+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
18	8	62f15097-a6e4-4125-81f7-8db98f3282a5	https://loremflickr.com/640/480/apartment?lock=8697422408581120	Luxurious Metal Pizza	544.00	Comes teres pel.	2024-08-06 05:20:28.174+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
19	54	e5b40380-6c50-4940-a19c-ce7ff2901ce1	https://loremflickr.com/640/480/apartment?lock=1948630200090624	Incredible Fresh Mouse	325.00	Inventore utique subseco texo crux.	2024-08-06 17:26:01.161+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
20	1	70050dc9-eada-43e9-ac05-626dadae8311	https://loremflickr.com/640/480/apartment?lock=380766502518784	Fantastic Plastic Chair	105.00	Uter enim decor templum tunc adaugeo.	2024-08-07 02:02:38.829+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
21	96	090781e7-2d4d-4794-88f5-e7810a8a36dc	https://loremflickr.com/640/480/apartment?lock=820097696399360	Fantastic Plastic Shoes	265.00	Conor aspicio verbum stillicidium accusator.	2024-08-06 10:00:46.38+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
22	61	96fb2ff3-d8ea-4f70-a58f-f4c7f8e3c5eb	https://loremflickr.com/640/480/apartment?lock=8079009250279424	Oriental Steel Pizza	515.00	Valde claro usitas veritas venustas clibanus aegre tergeo via facere.	2024-08-06 22:58:32.963+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
23	8	5b693a34-e518-4743-9fc9-b0e934d0f3eb	https://loremflickr.com/640/480/apartment?lock=4914513946083328	Small Concrete Hat	135.00	Patruus crinis acceptus dignissimos claustrum apostolus xiphias centum decet.	2024-08-06 16:40:32.039+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
24	16	4a7348f8-882b-49d4-bdba-1f1fbc1ccdee	https://loremflickr.com/640/480/apartment?lock=4362749758930944	Oriental Rubber Shirt	928.00	Vita adipisci cibo una reiciendis amor dolor sodalitas alius aro.	2024-08-06 12:27:06.379+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
25	6	30ac332c-1820-4455-8306-9abeb69ff4a2	https://loremflickr.com/640/480/apartment?lock=6798397847633920	Oriental Plastic Shirt	937.00	Theatrum desolo sapiente cunae verbum amissio summa.	2024-08-06 03:49:12.173+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
26	83	ea751980-70eb-4134-b028-7855db7f73dd	https://loremflickr.com/640/480/apartment?lock=746325125627904	Small Soft Shoes	847.00	Uter aureus somniculosus.	2024-08-06 07:53:54.994+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
27	32	38228754-4cc7-4a1f-9f32-a5c47f44fd16	https://loremflickr.com/640/480/apartment?lock=5042695519076352	Ergonomic Rubber Salad	465.00	Deprimo synagoga turbo celer acsi decet occaecati maxime exercitationem admoveo.	2024-08-06 08:02:25.983+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
28	15	c70b05bc-2968-4f68-941c-0cae1987df13	https://loremflickr.com/640/480/apartment?lock=5476648170291200	Generic Rubber Towels	346.00	Nihil solutio calco adsuesco arcus summopere.	2024-08-06 21:55:43.81+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
29	7	39d1ac17-d5a2-4b26-82b2-76dc32cd0e92	https://loremflickr.com/640/480/apartment?lock=826574098137088	Modern Concrete Shoes	90.00	Timor approbo vapulus.	2024-08-06 08:49:33.582+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
30	7	f1f1dc89-2bf3-440b-b1f8-18cdcb6497b1	https://loremflickr.com/640/480/apartment?lock=1141488595501056	Rustic Wooden Salad	951.00	Defleo canis conqueror ratione.	2024-08-06 03:36:21.197+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
31	4	990bf550-c803-430f-a141-97ebf992672f	https://loremflickr.com/640/480/apartment?lock=740468270825472	Generic Fresh Cheese	869.00	Tamen alius consuasor inventore tum amplus causa vis anser perspiciatis.	2024-08-06 17:55:38.765+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
32	10	6fc7f6f7-43ee-4cbc-bf54-0fc20901f0bc	https://loremflickr.com/640/480/apartment?lock=4995100243394560	Handcrafted Cotton Towels	554.00	Venio ulterius sui quae arceo.	2024-08-06 06:33:42.881+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
33	63	e6362b5a-f31c-45dd-a952-123e3232bb2d	https://loremflickr.com/640/480/apartment?lock=6399224428101632	Bespoke Bronze Mouse	525.00	Depraedor cenaculum depromo tabella.	2024-08-07 01:20:20.789+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
34	10	d6464df7-b198-4663-b3ec-b229ac301965	https://loremflickr.com/640/480/apartment?lock=3781116007809024	Practical Wooden Pants	141.00	Defessus adicio universe volubilis demens vilitas.	2024-08-06 13:45:42.258+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
35	29	4b86c5f0-530b-4de7-a4e3-51335a632a33	https://loremflickr.com/640/480/apartment?lock=4109974267494400	Incredible Plastic Hat	673.00	Taceo truculenter tantillus quidem causa vix creo spiritus pauper tutis.	2024-08-07 00:42:27.416+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
36	46	9bf5a6b1-b2a5-422f-8fb9-dc148253fb74	https://loremflickr.com/640/480/apartment?lock=5191187327614976	Luxurious Steel Keyboard	716.00	Defleo video aduro virtus creator victoria testimonium decumbo timidus.	2024-08-06 17:27:35.903+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
37	81	7bea6e36-2e2e-466c-88ab-1c6d53b21af2	https://loremflickr.com/640/480/apartment?lock=3601339789606912	Handcrafted Cotton Chips	261.00	Ventito patrocinor alter.	2024-08-06 03:20:30.13+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
38	4	63a21cf3-03b6-488e-a1bf-cdf300b43056	https://loremflickr.com/640/480/apartment?lock=6253800790687744	Bespoke Concrete Ball	375.00	Chirographum supra ea possimus harum torqueo thorax bellicus distinctio denuo.	2024-08-06 15:52:26.473+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
39	55	b5f0e0d2-f208-45cd-a38d-f84423f04057	https://loremflickr.com/640/480/apartment?lock=2437823590301696	Rustic Cotton Bacon	501.00	Natus nesciunt adsum tersus articulus enim catena depraedor verto.	2024-08-06 14:35:07.306+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
40	51	dbc1d431-2ee6-4b8c-bf53-0617275d838c	https://loremflickr.com/640/480/apartment?lock=6286955209818112	Rustic Granite Sausages	646.00	Sodalitas terreo damno atque aedificium vigor charisma.	2024-08-06 09:22:09.782+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
41	83	6cacc256-fa7d-45c0-a71b-e724fe338183	https://loremflickr.com/640/480/apartment?lock=377235850657792	Incredible Frozen Salad	161.00	Thymum careo admiratio ab sumo eaque beneficium.	2024-08-06 18:20:51.708+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
42	13	74be8285-386b-4f5c-a423-c4845808e405	https://loremflickr.com/640/480/apartment?lock=4896666945585152	Refined Steel Chips	511.00	Copiose desparatus consequatur via confido acsi theatrum excepturi theca versus.	2024-08-07 02:01:23.871+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
43	66	99a4ee7e-abf1-4ab5-b5ef-e76d364b41bf	https://loremflickr.com/640/480/apartment?lock=1561638603849728	Gorgeous Steel Sausages	972.00	Acsi aeternus voluptatum cras custodia.	2024-08-06 15:40:45.385+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
44	10	60ee90f3-d9c6-4ac2-b7c4-01d309401a9f	https://loremflickr.com/640/480/apartment?lock=145812661207040	Awesome Fresh Shirt	642.00	Expedita adsum vis acies creptio curvo amitto.	2024-08-06 05:08:10.316+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
45	39	cbf22cce-8722-4ad9-af7b-0c54b90b65de	https://loremflickr.com/640/480/apartment?lock=5778701966901248	Handmade Fresh Sausages	480.00	Thymum sonitus arma decens artificiose supellex.	2024-08-06 10:11:31.45+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
46	63	65ae02bb-c858-4584-a77d-5c883e427a41	https://loremflickr.com/640/480/apartment?lock=2137710915485696	Practical Fresh Towels	932.00	Suggero cinis tricesimus advenio.	2024-08-06 02:11:11.721+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
47	40	8a2edb51-340d-4167-bfc0-a6717b14ad17	https://loremflickr.com/640/480/apartment?lock=2535785169420288	Practical Rubber Car	703.00	Vulnus verecundia verbum carcer caste magni defungo somnus carmen.	2024-08-06 19:25:06.038+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
48	46	4117a737-4c20-4810-b21b-b0ad4172997c	https://loremflickr.com/640/480/apartment?lock=1562437522292736	Small Bronze Towels	568.00	Vulpes alienus vereor claustrum deinde tantillus turpis arcus comes.	2024-08-07 01:37:34.207+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
49	80	37c9027f-ab81-448f-a72b-0c7df084dfaf	https://loremflickr.com/640/480/apartment?lock=5091756680937472	Modern Cotton Bacon	550.00	Abstergo sublime asperiores calculus tamdiu pel dolorum velum suscipio.	2024-08-06 13:58:22.525+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
50	7	dab8083a-4ca2-4006-b826-1c56fb995db7	https://loremflickr.com/640/480/apartment?lock=1051737949470720	Intelligent Granite Pizza	334.00	At vulgaris alius.	2024-08-06 18:37:35.663+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
51	72	bb8459fc-9318-46f9-84d0-eda352c6d7b4	https://loremflickr.com/640/480/apartment?lock=2668935356874752	Licensed Granite Pizza	406.00	Denuncio totus cavus agnosco verus adhuc curatio cedo.	2024-08-06 04:41:52.337+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
52	85	88bfb070-4e8d-4790-b070-9d7919eeae07	https://loremflickr.com/640/480/apartment?lock=3118588785328128	Elegant Frozen Ball	235.00	Vetus absens alioqui molestiae acsi.	2024-08-06 10:53:49.126+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
53	41	c4911b95-8e4f-4935-8a0d-8331fa4edd96	https://loremflickr.com/640/480/apartment?lock=2056005500272640	Awesome Frozen Salad	400.00	Vetus vulpes tergum ulciscor cuius.	2024-08-06 21:31:15.77+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
54	37	f2781f7f-9eee-4fd8-85ed-5fdb9a5356c3	https://loremflickr.com/640/480/apartment?lock=8080522238492672	Modern Rubber Bike	421.00	Valeo tendo peior vulticulus apud fuga debilito.	2024-08-06 18:25:40.739+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
55	51	93c7d0ad-6e31-4543-ba02-c975eee1ddbf	https://loremflickr.com/640/480/apartment?lock=8809685761130496	Oriental Wooden Sausages	828.00	Alias succurro ab.	2024-08-06 05:00:41.993+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
56	6	e45518d3-5fec-4414-91ee-67d7dba8f477	https://loremflickr.com/640/480/apartment?lock=7930771299893248	Sleek Soft Computer	970.00	Exercitationem ventosus contigo verbera.	2024-08-06 22:03:34.761+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
57	92	a867956b-6d4e-44c6-9cfd-aae4220f88e1	https://loremflickr.com/640/480/apartment?lock=6254770436177920	Generic Rubber Car	277.00	Carmen arto textor valens spectaculum.	2024-08-06 15:14:57.821+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
58	81	a32816a5-1190-45cd-9b27-3aed06b278d3	https://loremflickr.com/640/480/apartment?lock=1574143755550720	Sleek Steel Hat	982.00	Varietas cunabula molestiae argumentum talis bellum argumentum.	2024-08-06 09:53:16.731+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
59	4	dad31d5d-233a-4cd9-a1ac-597728e5a78b	https://loremflickr.com/640/480/apartment?lock=7171540737064960	Modern Steel Salad	150.00	Patruus adeo dolorem verbum tamquam.	2024-08-06 10:04:52.445+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
60	18	32fe050c-af69-42a3-9936-275bc6c68054	https://loremflickr.com/640/480/apartment?lock=676271761653760	Ergonomic Wooden Bike	873.00	Suffoco absum demergo aegrus tumultus.	2024-08-06 21:48:10.219+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
61	47	7c049806-01c8-49e9-960c-2e710bc6f854	https://loremflickr.com/640/480/apartment?lock=6955146737090560	Gorgeous Cotton Cheese	252.00	Suscipit coepi cibus totidem.	2024-08-06 07:29:26.874+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
62	58	a1c648e7-ba45-4e30-924f-8ac4ef50678d	https://loremflickr.com/640/480/apartment?lock=3669659362525184	Generic Bronze Chicken	104.00	Aggero accusantium vulgivagus atque curtus compono quisquam vergo.	2024-08-06 19:53:16.736+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
63	22	a1cc857f-a6d5-4eff-9c2c-31f287a951e9	https://loremflickr.com/640/480/apartment?lock=2315051639767040	Ergonomic Concrete Chicken	71.00	Approbo curia suggero.	2024-08-06 17:46:38.51+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
64	59	40e9ad1e-61ad-4a08-bbed-3dac1a444149	https://loremflickr.com/640/480/apartment?lock=1514904674631680	Handmade Concrete Sausages	484.00	Averto sui deduco.	2024-08-07 00:34:16.995+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
65	58	8457872d-7f66-41b5-94fe-bd04649a56e9	https://loremflickr.com/640/480/apartment?lock=3965431142416384	Rustic Metal Hat	819.00	Dolore terra conculco.	2024-08-07 00:13:43.622+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
66	34	b7c4ff18-f13e-409c-b17c-783aca7be24e	https://loremflickr.com/640/480/apartment?lock=2114280990179328	Refined Soft Chicken	339.00	Beneficium absum despecto apud verbera tonsor.	2024-08-06 23:54:03.029+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
67	14	af257c6c-e25f-49a2-bfa7-fdc3e3a40fc8	https://loremflickr.com/640/480/apartment?lock=6358939746697216	Rustic Bronze Pizza	812.00	Sui adeo repellat demum assentator commodi crepusculum.	2024-08-06 22:49:11.27+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
68	50	59c3dd7f-623a-44fe-9e4d-b8477b9bf152	https://loremflickr.com/640/480/apartment?lock=8227811768664064	Fantastic Cotton Cheese	949.00	Aufero depraedor comes vulgo audeo adipisci spargo.	2024-08-06 21:59:37.567+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
69	93	b217b7d5-1100-443c-9085-90befe6badd3	https://loremflickr.com/640/480/apartment?lock=8390311281688576	Tasty Granite Car	885.00	Quod via sub iure amplus conqueror coerceo crinis delicate.	2024-08-06 20:52:25.838+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
70	78	80f4cdcf-b9b3-48cd-91c9-703025e1296d	https://loremflickr.com/640/480/apartment?lock=17339839938560	Refined Concrete Pants	915.00	Caries ventosus possimus socius cito tripudio id demonstro doloribus tonsor.	2024-08-06 17:01:57.488+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
71	45	16e095b5-eee1-4b15-8009-e2a6c3350d5c	https://loremflickr.com/640/480/apartment?lock=4727566772469760	Modern Plastic Towels	736.00	Amicitia maxime cognatus ullus ara custodia explicabo adinventitias quisquam cohaero.	2024-08-06 17:52:03.289+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
72	75	df0cf96f-13b8-47f9-8179-b35018250971	https://loremflickr.com/640/480/apartment?lock=8246037319778304	Rustic Metal Tuna	797.00	Possimus quas blanditiis appello sto conforto stipes.	2024-08-06 22:08:22.591+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
73	33	f879fe40-39bb-4933-bb40-da4a49168cab	https://loremflickr.com/640/480/apartment?lock=276061417897984	Bespoke Frozen Car	333.00	Cupiditas speculum statua denuncio debitis neque deserunt.	2024-08-06 06:21:30.384+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
74	29	691c3054-62d9-4764-a238-7f5c2ef023d3	https://loremflickr.com/640/480/apartment?lock=4799858871369728	Fantastic Cotton Soap	98.00	Adiuvo benevolentia vis solus solus.	2024-08-06 20:15:03.463+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
75	4	114ae865-f482-44a9-aeb8-959db877e2af	https://loremflickr.com/640/480/apartment?lock=6504588909740032	Licensed Concrete Shoes	139.00	Bene decerno demonstro facilis.	2024-08-06 10:38:27.708+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
76	1	8a17eb4e-46cf-43be-8201-571f629eaa64	https://loremflickr.com/640/480/apartment?lock=2942777363005440	Luxurious Frozen Chair	707.00	Impedit peccatus sum speculum.	2024-08-07 01:30:50.917+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
77	54	7891f54c-12f1-452f-b57d-74abdf1ca82d	https://loremflickr.com/640/480/apartment?lock=4596270177976320	Recycled Wooden Keyboard	768.00	Censura cur aperte truculenter cervus.	2024-08-06 13:20:24.484+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
78	12	065c5ca9-faff-486a-bc47-11959d313b45	https://loremflickr.com/640/480/apartment?lock=4070754974957568	Rustic Plastic Tuna	882.00	Voluptatibus arbustum et coruscus nam teneo civis natus.	2024-08-06 03:14:33.726+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
79	51	1c74bf54-4ea8-461b-a372-dfb53d211429	https://loremflickr.com/640/480/apartment?lock=7611443740409856	Elegant Frozen Table	705.00	Maxime solum torqueo vir creber studio.	2024-08-07 01:28:01.977+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
80	73	26ad4b89-2659-4c9c-9949-c7473d5885e6	https://loremflickr.com/640/480/apartment?lock=1487449190563840	Ergonomic Bronze Tuna	773.00	Tantillus utpote deleo aestas suppono articulus conicio adhuc tenax.	2024-08-06 02:42:56.721+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
81	65	0c711f0d-a9c7-4838-a29a-9fdc26a9a443	https://loremflickr.com/640/480/apartment?lock=6003016134033408	Awesome Metal Car	466.00	Aro collum beatus voluntarius possimus celebrer ventus.	2024-08-06 11:19:25.865+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
82	5	6adce9e3-4f03-4974-bdc7-73606a2db65b	https://loremflickr.com/640/480/apartment?lock=6756987041742848	Intelligent Steel Chicken	189.00	Sono voco verbum apparatus.	2024-08-06 05:22:23.003+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
83	84	ac8a84fb-9dc2-470f-87bf-d854574abee7	https://loremflickr.com/640/480/apartment?lock=8809234328190976	Oriental Wooden Chicken	334.00	Caterva vulgaris aufero textilis vomito claustrum.	2024-08-06 07:35:23.67+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
84	22	954c3ed8-4ed9-44e0-be54-2a2582ab82d9	https://loremflickr.com/640/480/apartment?lock=6056393285042176	Generic Concrete Gloves	410.00	Currus vitae subvenio suus vinculum decipio benigne.	2024-08-06 12:11:38.55+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
85	59	206c9841-b4fb-4ed6-b051-67a219f64dcc	https://loremflickr.com/640/480/apartment?lock=4747239591247872	Tasty Fresh Fish	897.00	Esse despecto ustilo acerbitas cras vinum illum.	2024-08-06 07:40:41.632+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
86	57	c4288782-de21-4652-9ed2-6e3612a0b7eb	https://loremflickr.com/640/480/apartment?lock=631262750441472	Awesome Fresh Chips	789.00	Ratione thesis charisma culpa facere harum.	2024-08-06 08:30:13.501+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
87	85	5675ce0c-8692-4d77-a62f-5379f0ae38fb	https://loremflickr.com/640/480/apartment?lock=3885336035852288	Elegant Frozen Towels	800.00	Suscipit dolore sub itaque.	2024-08-06 05:13:25.152+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
88	64	c13566ee-5d36-469e-8692-b996be6e6322	https://loremflickr.com/640/480/apartment?lock=5225536215318528	Bespoke Metal Ball	338.00	Turbo tollo uredo debeo aliquam porro derelinquo ancilla.	2024-08-06 07:06:18.467+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
89	26	243e134c-1dd5-4143-a2be-337f857ccde5	https://loremflickr.com/640/480/apartment?lock=518767259942912	Modern Bronze Chicken	878.00	Animi doloribus strenuus decimus terra sapiente.	2024-08-06 11:11:07.304+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
90	85	8626d102-d32c-4bf2-8a03-171795075622	https://loremflickr.com/640/480/apartment?lock=335206793871360	Awesome Steel Ball	644.00	Turpis thesaurus confugo.	2024-08-06 19:11:25.712+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
91	76	6284214a-0567-4cee-b67d-788728ff52d0	https://loremflickr.com/640/480/apartment?lock=7702837133836288	Oriental Cotton Shoes	288.00	Ubi temperantia ventus aeternus valde sursum amoveo ipsam suasoria cupio.	2024-08-06 15:00:04.027+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
92	98	1e454215-b562-4207-9567-00cfda14f2f9	https://loremflickr.com/640/480/apartment?lock=6388941003423744	Small Plastic Cheese	991.00	Ad cunabula ultio stultus.	2024-08-06 12:15:36.058+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
93	90	7ee1a249-ff2c-4cb1-a270-1ef349005af6	https://loremflickr.com/640/480/apartment?lock=3037707576016896	Rustic Rubber Salad	918.00	Terminatio caste eum ex.	2024-08-07 01:22:28.169+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
94	82	50e6ac9f-2d7b-48c2-9595-c97feb6b5719	https://loremflickr.com/640/480/apartment?lock=7463975107166208	Handcrafted Wooden Car	828.00	Adfero depromo alius ipsam talio allatus thesis.	2024-08-06 05:54:00.338+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
95	89	8758b5cb-63b0-4fd6-8f56-a23f88c938e9	https://loremflickr.com/640/480/apartment?lock=1294612461256704	Rustic Steel Sausages	610.00	Crustulum eum averto voluptas articulus somnus.	2024-08-06 15:01:39.954+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
96	80	d51c7136-9a98-48a6-8513-ed09e85c4c0a	https://loremflickr.com/640/480/apartment?lock=8140873000812544	Handmade Fresh Salad	34.00	Creta vestigium rem.	2024-08-06 12:13:38.391+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
97	100	690d14d7-187b-41c2-90bd-7025911fbf67	https://loremflickr.com/640/480/apartment?lock=8054313809084416	Elegant Frozen Keyboard	640.00	Decipio cado voro aptus adficio porro impedit comes blandior quas.	2024-08-06 22:55:20.245+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
98	81	7b251082-e000-4a3e-b408-c14a03db2e03	https://loremflickr.com/640/480/apartment?lock=7742356354760704	Awesome Concrete Car	519.00	Ullam dedico credo subvenio sustineo combibo tripudio.	2024-08-06 03:32:39.807+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
99	71	13eb948b-9dbd-4bce-9c2d-f8f3566eeff7	https://loremflickr.com/640/480/apartment?lock=6994118020431872	Intelligent Bronze Chair	908.00	Trado audeo credo concido audacia circumvenio carcer peccatus.	2024-08-06 15:04:55.599+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
100	26	467ccf4b-9b60-4f28-a1cc-f68e66f63d38	https://loremflickr.com/640/480/apartment?lock=527186240995328	Elegant Soft Bike	23.00	Vapulus decor adipisci textilis provident tollo.	2024-08-06 18:45:33.265+00	2024-08-07 02:06:25.805+00	2024-08-07 02:06:25.805+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, role, "firstName", "lastName", avatar, "createdAt", "updatedAt") FROM stdin;
1	Michaela.Hessel3	P2zGPxpLgeewT93	Roderick.Smith@gmail.com	seller	Cooper	Larkin-Gibson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/612.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
2	Candida.Turner27	nuP_uhYZj8FMyFa	Marcelina.Denesik47@yahoo.com	seller	David	Wehner	https://avatars.githubusercontent.com/u/92325223	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
3	Michael_Moore9	koNO01FlPFS0wBm	Greta.Crona@gmail.com	seller	Clint	Fisher	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
4	Adell.Fritsch	wi_jLdIeMKl08m8	Adaline_Gorczany@gmail.com	user	Misty	Hauck	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/706.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
5	Everette6	Wpi__ETX3USW134	Nathan_Ankunding78@yahoo.com	seller	Andy	Doyle	https://avatars.githubusercontent.com/u/4100264	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
6	Jessica10	CxABWQuBBXKomvt	Nathan_Kuvalis@yahoo.com	admin	Tristin	Bartell	https://avatars.githubusercontent.com/u/82295148	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
7	Elian31	OKKpHOxFLTlKGlO	Lavern.Weimann-Herman@gmail.com	seller	Catharine	Rutherford	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/816.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
8	Joy55	kl8s3_MgCHXLTTa	Hoyt_Nader79@gmail.com	seller	Audreanne	Mann	https://avatars.githubusercontent.com/u/5207741	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
9	Mina_Abernathy	dWf67OTxFFZpJZ8	Rhett.Walsh47@hotmail.com	seller	Francisco	Weissnat	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/952.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
10	Alessandro31	KU9CjCMXsAJ7Y4_	Effie.Nienow99@gmail.com	admin	Mabelle	Weber	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/713.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
11	Dorthy_Hagenes59	yj9hHCf6AvGREs8	Green86@hotmail.com	seller	Reilly	Weber	https://avatars.githubusercontent.com/u/93189657	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
12	Meredith.Terry	FbeDMeHyK9HcSeW	Laron2@hotmail.com	seller	Mattie	Hickle	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/114.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
13	Gunnar_Simonis48	OKEu2L2Bk631Q2F	Concepcion73@gmail.com	user	Kasandra	Parker	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1127.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
14	Chandler.Crooks	pzgXVFm30cn91L4	Lacy.Reynolds65@yahoo.com	admin	Olga	Zieme	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/592.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
15	Yvette.Morissette	M6157MlETyWw2zP	Frederic_Vandervort61@yahoo.com	seller	Eulalia	Walter	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/348.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
16	Vernice_Vandervort	FV7gfFmHcKACrG1	Jewell_Pfannerstill4@hotmail.com	user	Joanne	Shields	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/652.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
17	Wilhelmine.McDermott-Kuhic94	I7UTCEWky2_HXP7	Retha_Goyette67@hotmail.com	admin	Dalton	Kovacek	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
18	Titus17	IrVnCfUvqpEhAGx	Kayden_Hintz@gmail.com	user	Treva	Spencer	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/210.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
19	Kennedy43	PZVcXd8aMbbygBc	Harvey_Zieme@gmail.com	admin	Hubert	Simonis	https://avatars.githubusercontent.com/u/90957376	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
20	Garrison.West97	0rpdBhwex_UFLeB	Felton21@gmail.com	seller	Christelle	Conn	https://avatars.githubusercontent.com/u/38916195	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
21	Harrison.Dickinson71	m_EsE5JgCwBFKqq	Cicero.Braun@hotmail.com	user	Jeffrey	Keebler	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
22	Lyric0	rFiIqNbbRY5wp14	Coy27@yahoo.com	user	Bradly	Towne-Toy	https://avatars.githubusercontent.com/u/10970132	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
23	Emelia_Oberbrunner	G3pxwNwZYvHpg7i	Hulda38@gmail.com	seller	Frances	Kunze	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/239.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
24	Nicole_Wolf84	GC7fzQLDLZPn6Yv	Chad.Kovacek67@hotmail.com	user	Kariane	Schamberger	https://avatars.githubusercontent.com/u/70033798	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
25	Elody.Wisozk	zbHaUbfutKb5qhy	Demetrius.Reynolds37@hotmail.com	seller	Jasper	Raynor-McKenzie	https://avatars.githubusercontent.com/u/17320848	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
26	Kennedy.King	tR2_uE6EhATsoue	Veronica4@gmail.com	user	Colton	McKenzie	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1008.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
27	Holly.Cummings	PCz9BtUFfDGWcWb	Nikita90@yahoo.com	admin	Carolanne	Daugherty	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/415.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
28	Alice_Mueller	MUsKy4XLTi_q8J7	Malinda.Predovic@hotmail.com	user	Shanelle	Casper	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/731.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
29	Columbus_Rowe	S9dkc61WyWY0qoc	Felipe.Hettinger35@yahoo.com	admin	Golden	Jacobi-Franecki	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/97.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
30	Juana.Carroll73	LJw2JdnXRoEBirC	Adrien_Bosco@gmail.com	user	Christiana	McKenzie	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/964.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
31	Lilyan_Lynch	_E1jcPZmphLizfO	Alphonso_Mosciski98@yahoo.com	seller	Claudie	Brakus	https://avatars.githubusercontent.com/u/34392931	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
32	Jaime39	E18Wt6cscUVifBi	Olga84@gmail.com	user	Silas	Altenwerth	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
33	Tomas_Kirlin	YW8BpzktPh1wu3t	Larue_Lehner79@gmail.com	seller	Gabe	Schneider	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/740.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
34	Kathleen.Rice	sX6kZWILI6I9kgG	Constance_Collins39@yahoo.com	seller	Christian	Hermiston	https://avatars.githubusercontent.com/u/13174152	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
35	Nelle60	PvCypf_YuJZrBPM	Serenity.Schaefer39@hotmail.com	admin	Quinn	Pouros	https://avatars.githubusercontent.com/u/91167686	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
36	Delilah.Okuneva3	wf1Ldrcsyznrqgh	Declan30@yahoo.com	user	Ray	Boyer	https://avatars.githubusercontent.com/u/10148991	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
37	Naomie8	88YVoBQofLGtdOn	Makenna23@hotmail.com	admin	Ressie	Pfannerstill-Johnson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/597.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
38	Clay.Wintheiser16	vEF5HylIl4_yCJW	Margaretta_Reichel@yahoo.com	admin	Bell	Lebsack	https://avatars.githubusercontent.com/u/90952367	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
39	Timothy.Dicki	QVw4P442xRx9TQN	Keshaun.Stoltenberg43@hotmail.com	user	Ford	Bergnaum	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
40	Verona49	lNnXzkt1LiSdVg0	Mabel.Littel20@gmail.com	admin	Enid	Harvey	https://avatars.githubusercontent.com/u/58152953	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
41	Bessie.Block52	8RNOjCtHC_jzLp7	Joelle_Greenholt@hotmail.com	admin	Telly	Bode	https://avatars.githubusercontent.com/u/3473539	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
42	Winona83	Te76sVaJgiZJLf3	Lavern29@hotmail.com	user	Evie	Stoltenberg	https://avatars.githubusercontent.com/u/12526808	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
43	Alanna_Von93	8bPr_jfy41n4wqw	Shane_Marquardt80@yahoo.com	seller	Esperanza	Koepp	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
44	Vita_Jerde	NXG9ZeiQ6iQEBId	Lauren52@hotmail.com	seller	Emmanuel	Torphy	https://avatars.githubusercontent.com/u/76726314	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
45	Adolfo_VonRueden-Okuneva60	HPx4w3fQyAdZ8G6	Nannie.Hilll@gmail.com	user	Hank	Abbott	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/663.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
46	Jerel_Waelchi88	Fpwsj44bE3BMj3l	Sammie0@gmail.com	user	Wayne	Beahan	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/761.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
47	Lonzo_Jacobs28	axbZxekOA4N55aq	Ova_Kshlerin@gmail.com	admin	Sherwood	Koelpin	https://avatars.githubusercontent.com/u/94626541	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
48	Amelia_McLaughlin-Konopelski29	R8POeCHKaJpPdHy	Wilhelm_Hoppe66@yahoo.com	seller	Bernhard	Friesen	https://avatars.githubusercontent.com/u/87616605	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
49	Mortimer_Wilkinson23	ZvGz_QPKqACfICc	Reba_Willms@yahoo.com	seller	Patience	McKenzie	https://avatars.githubusercontent.com/u/95807183	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
50	Elissa.Cummerata	xSLJphX0DOu2lRe	Jessica_Spencer@yahoo.com	user	Pierce	Upton	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/654.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
51	Meghan3	96s3Hhv1DvuBMcO	Hollie.Dach33@yahoo.com	user	Linda	Terry	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/822.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
52	Jeffry64	2GSuQ3qL3vY1S8T	Manuel_Bins17@hotmail.com	seller	Zachery	Balistreri	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1203.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
53	Courtney28	NekoGZOLzhUzW_N	Eliezer50@yahoo.com	user	Floyd	Swaniawski	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1070.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
54	Monserrate.Thiel0	zUPi18WnjCprFvz	Vicenta.Klein@gmail.com	seller	Kris	Runolfsdottir	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/598.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
55	Lane.Mueller16	UkOIVjd7MnAAaxy	Stone_Moore18@gmail.com	admin	Joelle	Hauck	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/525.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
56	Charles_Reynolds52	OJMzIX3w3stQqbg	Devin24@hotmail.com	user	Keon	Satterfield	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/911.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
57	Annabel.Emmerich45	KGYlZsN8tj0AgVz	Mathew96@hotmail.com	user	Juliana	Goldner	https://avatars.githubusercontent.com/u/31125969	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
58	Kenna_Toy59	3xJIFvIw0nDY6ma	Foster_OReilly@yahoo.com	admin	Elissa	Goodwin-Turcotte	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1022.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
59	Trinity72	eEjZitJc3WI1vrs	Wyman80@hotmail.com	seller	Magnolia	Mante	https://avatars.githubusercontent.com/u/36948957	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
60	Connor_Sipes	hE_imH9eSm3nwkp	Sandy.Corkery@hotmail.com	user	Tyrese	Gutkowski	https://avatars.githubusercontent.com/u/77492088	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
61	Joana.Larkin	dVWqmFHb9kJr3xH	Kyler.Kovacek44@yahoo.com	seller	Elvie	Schoen	https://avatars.githubusercontent.com/u/16738659	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
62	Tate26	GeWpEEyKJY1RRgY	Irwin.Crooks39@gmail.com	user	Percy	Greenfelder	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
63	Darian.West8	S8yjwdaXHh2uUTP	Lilly.Auer44@yahoo.com	seller	Nellie	Gutmann	https://avatars.githubusercontent.com/u/90381199	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
64	Aliyah_Bartoletti82	iwtzuODyzRjjzmC	Tessie58@hotmail.com	seller	Dean	Bartoletti	https://avatars.githubusercontent.com/u/60398938	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
65	Ona97	qN4J9juEfLmD4pj	Lavern.Pagac@yahoo.com	user	Jaida	Robel	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1209.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
66	Cara_Hamill81	jw_t5blIPVgEuzb	Torrance91@gmail.com	seller	Velva	Schmeler	https://avatars.githubusercontent.com/u/91666046	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
67	Grover.DAmore	7Xtoo7UguM92Lws	Hal.Lesch@yahoo.com	user	Candice	Ryan	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/781.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
68	Jaqueline_Crooks30	fdmefdYZ7wKntnx	Alexander.Schaden5@hotmail.com	admin	Zaria	Huel	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
69	Constantin74	SEeJZDYt5hU43wZ	Lucie_Homenick36@yahoo.com	seller	Devin	Grant-Gulgowski	https://avatars.githubusercontent.com/u/83622999	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
70	Lukas.Rogahn-Ziemann	ZFQqz_xuyL0AXNk	Jewell.Mraz27@yahoo.com	admin	Misael	Dibbert	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/964.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
71	Marcelina17	pf7z0J103wZm449	Anibal_Wiza@yahoo.com	seller	Myrna	Schimmel	https://avatars.githubusercontent.com/u/79029074	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
72	Christopher.Gleason	i0sOVwH7D2HauLe	Orville.Graham99@yahoo.com	user	Delaney	Dicki	https://avatars.githubusercontent.com/u/39816643	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
73	Enoch.Koch45	a4GoNoE_GfYkDcE	Madeline.Schumm62@hotmail.com	admin	Albertha	Turcotte	https://avatars.githubusercontent.com/u/13574280	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
74	Jazmyn_Kilback57	5JRtMAz4WUwBtKM	Nya_Mitchell61@hotmail.com	user	Tillman	Champlin	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/982.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
75	Amber.DAmore-Crona18	JM9M468A7MQQPTo	Candace.Beier@hotmail.com	user	Jerrod	Oberbrunner	https://avatars.githubusercontent.com/u/53804196	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
76	Erwin.Gislason36	3dSEJ1QryYhwVSV	Markus.Moen92@yahoo.com	admin	Maximillia	Buckridge	https://avatars.githubusercontent.com/u/21194323	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
77	Lizeth.Ritchie-Daniel53	BmAEzgp0HBXtmv0	Theresa_Vandervort@hotmail.com	user	Mortimer	Christiansen	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/854.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
78	Juwan.Ferry75	yjnqwM34NbqQfpT	Annamarie.Mayer29@hotmail.com	seller	Amani	Kling	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/475.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
79	Perry75	GZ6DFl8ATePVwMm	Herminia_Fritsch@hotmail.com	admin	Jedidiah	Strosin	https://avatars.githubusercontent.com/u/64312576	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
80	Paolo22	K4VRYMYpi_d_wh7	Yadira_Farrell87@gmail.com	seller	Verlie	Swift	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/418.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
81	Pat.Windler39	BdMxpSa57Xls_VH	Jamie.Lind@gmail.com	seller	Maci	Rolfson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/408.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
82	Triston_Walker	1i9WB4FgCcS_Gwd	Terrence.Kunde83@gmail.com	admin	Kristopher	Harris	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1104.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
83	Violet24	zODR63R2zN6Vvtd	Jarvis91@yahoo.com	admin	Bo	Bradtke	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
84	Jorge_Bednar	K6peDVoNniJ0cEV	Rafael.Erdman35@yahoo.com	seller	Agustina	Wiegand	https://avatars.githubusercontent.com/u/84119797	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
85	Birdie_Kunde3	giR8u5EBXxKmfP8	Enid_Bernhard28@hotmail.com	admin	Leonardo	Hermann	https://avatars.githubusercontent.com/u/96685526	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
86	Alana34	HOuoyvVeXkkaHZu	Clay.Harvey97@hotmail.com	seller	Kyla	Schneider-Braun	https://avatars.githubusercontent.com/u/67149936	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
87	Saul53	VvfusEwiSI32P2f	Joesph.Emmerich@yahoo.com	seller	Aiden	Grimes	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1116.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
88	Bobbie_Beahan61	bC6CNeUX1Lu4XGo	Easton.Corkery@gmail.com	user	Emmett	Beier	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/709.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
89	Reyes70	U1AXI1j6tsLRUSV	Quinton_Zieme@gmail.com	seller	Nikolas	Welch	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/806.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
90	Javonte12	iiZt6e9RhA5lIN9	Eliezer_Aufderhar13@yahoo.com	admin	Karina	Stroman	https://avatars.githubusercontent.com/u/85636848	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
91	Berneice.Lueilwitz80	bpOyJSiQp8fb9ay	Albin.Hills91@gmail.com	admin	Willa	Nader	https://avatars.githubusercontent.com/u/12705678	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
92	Princess_Ruecker	I3zLIbmpdXZDy1c	Tracey.Lesch21@gmail.com	seller	Lea	Gibson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
93	Virginia5	4eBpaiVz5Lj6O3r	Tyrel57@yahoo.com	seller	Gabriel	Kautzer	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/125.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
94	Edison.Gutkowski21	JAh1oWZOyIQBqqE	Jasmin_Flatley92@hotmail.com	user	Elisabeth	Prohaska	https://avatars.githubusercontent.com/u/66095369	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
95	Reina.Ratke56	OO5rn0cr8ufUP4p	Magnus.Hoppe@hotmail.com	user	Philip	Jacobson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/343.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
96	Marshall13	vXftHuZSqsovhdp	Rebeka_Keeling1@yahoo.com	user	Ciara	Senger	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1165.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
97	Ladarius_Brekke61	eSg6nwuHjNNvtMH	Angelina.Schinner@gmail.com	user	Abigail	Hudson	https://avatars.githubusercontent.com/u/9414723	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
98	Shemar_Stanton	PDF3fFRTTaCvgH6	Camilla.Cormier-Morar@gmail.com	user	Uriah	Bauch	https://avatars.githubusercontent.com/u/76164456	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
99	Sylvan.Kovacek	Etle5_L0EQu9ArF	Felicity.Wintheiser48@yahoo.com	seller	Susie	Schumm	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
100	Aniyah24	AR_B6nV9BJBL0af	Titus_Marquardt1@hotmail.com	admin	Neha	Osinski	https://avatars.githubusercontent.com/u/17973803	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 100, true);


--
-- Name: interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interactions_id_seq', 20, true);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: interactions interactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT interactions_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sales sales_saleId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT "sales_saleId_key" UNIQUE ("saleId");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: contacts contacts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT "contacts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: interactions interactions_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT "interactions_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public.contacts(id);


--
-- Name: sales sales_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT "sales_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public.contacts(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

