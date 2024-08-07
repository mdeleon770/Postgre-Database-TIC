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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
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
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, "firstName", "lastName", email, "phoneNumber", address, "createdAt", "updatedAt") FROM stdin;
1	Margaret	Hegmann	Mario95@yahoo.com	1-403-670-6578 x37116	784 Baumbach Branch	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
2	Sibyl	Yundt	Alvina72@yahoo.com	1-994-939-3234	85895 Hawthorn Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
3	Glenna	Johnston	Colt_Gusikowski45@hotmail.com	251-632-3376 x8204	3274 Chadd Ramp	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
4	Roman	Feil-Trantow	Kody30@gmail.com	410.919.4163 x4647	816 Jeffry Ford	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
5	Michele	Beier	Lauretta64@yahoo.com	(593) 480-8625 x5726	3934 Tennyson Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
6	Braden	Baumbach	Esteban88@yahoo.com	930-691-1001 x718	425 Lincoln Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
7	Odessa	Romaguera	Shyann59@hotmail.com	975-586-4640 x484	95818 Stephan Falls	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
8	Cynthia	Price	Aliya_Brekke@hotmail.com	(941) 419-6918	41655 Miller Streets	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
9	Dortha	Grimes	Terrence59@hotmail.com	555-267-6288 x94379	1857 Gleason Point	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
10	Marcella	Hegmann	Destany19@yahoo.com	847-316-0598 x63511	9042 Lera Rest	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
11	Brody	Steuber	Lula_Schuppe89@gmail.com	(940) 903-5038 x61225	26275 Hilario Divide	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
12	Colby	Smitham	Clifton_Hansen@yahoo.com	1-203-956-0714 x990	492 Lenna Junction	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
13	Agustin	Homenick-Orn	Howell_Mertz@yahoo.com	605-603-9012	4507 Schaefer Lake	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
14	Lewis	Hayes	Ashleigh.Carroll85@yahoo.com	1-937-865-7450 x1388	73027 Barton Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
15	Quinton	Kunze	Neoma94@hotmail.com	1-243-962-4647 x095	792 Forest Heights	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
16	Terence	Satterfield	Julia.Kuhic@hotmail.com	(800) 373-2884	22299 Schowalter Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
17	Jacky	Gerhold	Lauryn76@yahoo.com	200.305.6362	73884 Elenor Circle	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
18	Jeffrey	Morar	Lon.Kling@yahoo.com	449.724.4017	728 E Walnut Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
19	Elna	Jacobs	Chaya81@hotmail.com	(828) 763-9217 x326	64112 West Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
20	Dolly	Mueller	Irving.Thiel98@hotmail.com	1-997-391-7776 x8418	8644 Schamberger Summit	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
21	Viola	Lynch	Hortense99@gmail.com	919.367.8776 x421	80130 Terry Isle	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
22	Lucy	Ward	Judge36@hotmail.com	1-367-601-4832	992 Kozey Rue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
23	Guillermo	Schulist	Aubrey81@gmail.com	609-903-8277 x17505	89396 Marshall Harbor	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
24	Danial	Lesch	Ofelia.Schiller34@gmail.com	946-401-7129 x16253	7821 Waters Field	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
25	Providenci	Schamberger	Bartholome_Kerluke@hotmail.com	646-842-7495 x955	1751 S 14th Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
26	Stephanie	Wuckert	Kaitlyn_Pollich46@yahoo.com	980.287.0366 x011	418 Elm Grove	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
27	Alycia	Klein	Virgil_Nikolaus76@gmail.com	1-959-981-0238	5391 Watery Lane	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
28	Georgette	Effertz	Kip.Hackett11@yahoo.com	1-444-330-0623 x83687	930 Sycamore Drive	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
29	Olin	Glover	Marcelo96@hotmail.com	499.457.1909 x002	551 Satterfield Way	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
30	Pearl	Treutel-Funk	Myrtis_Schultz72@hotmail.com	1-902-637-2486	6910 Jamar Wells	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
31	Norwood	Wisozk	Fabiola11@hotmail.com	1-482-666-9805 x33733	40312 Hahn Coves	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
32	Rebeka	Glover	Tamara.Gusikowski96@gmail.com	630-249-8729 x288	206 Nellie Harbor	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
33	Hellen	Dickens	Hester_Rempel@gmail.com	959-471-7922 x1119	34490 Larissa Alley	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
34	Clay	Little	Julie.Carroll-Hilpert@gmail.com	1-679-771-7006 x5722	6244 Lelah Parkways	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
35	Osvaldo	Runolfsdottir	Louvenia19@gmail.com	308.693.1919 x2071	35516 Cavendish Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
36	Guido	Erdman	Eula_Weimann@yahoo.com	547-919-6231	189 Lauren Manor	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
37	Devon	O'Connell	Erwin.Casper13@gmail.com	(312) 871-5813 x24674	550 Schowalter Stravenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
38	Rosina	Bergstrom	Antonette65@gmail.com	1-626-390-9364 x91237	1757 Blanche Trafficway	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
39	Amina	Smitham	Keanu_Goodwin@hotmail.com	(855) 455-9377 x6869	730 Vandervort Ville	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
40	Felicia	Nader-Murray	Aurore_Mosciski36@hotmail.com	981.634.9680 x9610	494 Sanford Walks	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
41	Althea	Hartmann	Raegan.Miller@gmail.com	376.567.7501 x671	937 Cloyd Lock	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
42	Adonis	Koepp	Marjorie_Price@gmail.com	956-660-3564 x129	56842 S Broadway Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
43	Ari	Hudson	Laney12@hotmail.com	721-891-3587 x729	50278 Brook Lane	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
44	Angelo	Predovic	Fletcher_Windler98@hotmail.com	465.203.4061 x7904	3379 Leffler Lock	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
45	Hans	Ankunding	Mike_Bartoletti@yahoo.com	864.468.6897 x3811	270 Wolf Drive	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
46	Merle	Beatty	Maryse11@gmail.com	207-935-0893 x42994	2251 Rodger Center	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
47	Antonette	Labadie	Emily.Konopelski@hotmail.com	(907) 240-5634	8828 McKenzie Neck	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
48	Chauncey	Wilderman-Mills	Hattie_Abbott@yahoo.com	466-425-8650 x470	78160 S Monroe Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
49	Gustave	Adams	Kip_Daniel-Kshlerin@hotmail.com	1-933-859-0173 x3555	94147 Davis Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
50	Jarrett	Thiel	Eileen83@gmail.com	(458) 691-3943 x0096	2223 Konopelski Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
51	Verla	Mohr	Jace.Kuhic@hotmail.com	1-219-207-5016	455 Lockman Underpass	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
52	Lilla	Wiza	Lysanne6@gmail.com	912.400.1303 x188	6526 Kade Glens	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
53	Fredrick	Daniel	Lon_Heaney-Walsh67@yahoo.com	(218) 660-4029 x0010	7904 Silver Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
54	Aurelio	Franey	Brandy.McClure56@yahoo.com	1-737-930-0190 x933	9283 N Center Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
55	Colton	Howe	Torrance_Walker50@hotmail.com	855-524-9631 x94081	92079 Domenick Points	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
56	Alexa	Stamm	Citlalli_OHara@yahoo.com	1-822-426-4979 x087	52693 Morissette Junction	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
57	Brendon	Maggio	Vivien57@hotmail.com	(341) 226-7124 x5580	89164 Crescent Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
58	Peggie	Kulas	Jennie48@yahoo.com	755-876-4017 x7747	2455 Bahringer Inlet	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
59	Kaleb	Schneider	Savanna.Sanford72@yahoo.com	460-738-0501 x4188	725 Abbie Shores	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
60	Bennett	Wehner	Michael34@yahoo.com	388.699.9675 x444	1707 Laburnum Grove	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
61	Janae	Gutkowski	Demario.Fahey72@hotmail.com	1-721-957-2816 x22513	11716 Thiel Bypass	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
62	Mariela	Simonis	Katlyn_Purdy@yahoo.com	1-462-599-2859 x830	9114 Lake Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
63	Kaleb	Koelpin	Christian13@yahoo.com	1-917-903-8529 x7194	136 Klocko Rue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
64	Johan	Stanton	Ova_Upton@hotmail.com	1-993-635-4880	6616 Jacobson Path	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
65	Kristoffer	Gusikowski	Mohammed.OHara94@hotmail.com	978.775.0548 x1701	3576 North Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
66	Tierra	Schiller	Jerad.Mohr@yahoo.com	870.251.9988 x7684	206 West Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
67	Dorthy	Hane	Letitia.Runte49@gmail.com	(808) 816-3765 x05854	5167 Baumbach Forest	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
68	Price	Harris	Deshawn.Mitchell78@hotmail.com	1-777-720-8359 x224	570 Trinity Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
69	Daija	Huels	Myrna33@hotmail.com	1-418-304-9687 x023	451 Lakin Trafficway	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
70	Garth	Christiansen	Brando33@yahoo.com	403.772.3612	574 Laurianne Knolls	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
71	Olin	Schroeder	Oren76@yahoo.com	336-650-7300 x64561	258 Samanta Points	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
72	Dominique	Boyer	Letha88@yahoo.com	921.557.8409 x87770	1356 Woodlands Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
73	Paxton	Weimann	Freddie97@gmail.com	216.544.8358 x9413	1693 Shyanne Crossroad	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
74	Reginald	Block	Felix47@yahoo.com	781-823-2855 x096	42446 Schumm Rapids	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
75	Karina	Hettinger	Clotilde.Schuster23@gmail.com	972.681.2881	21784 Breanna Branch	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
76	Roberto	Steuber	Kianna.Langosh@yahoo.com	541.248.8002 x509	66889 Deborah Fall	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
77	Willie	Ziemann	Adrian_Wehner49@yahoo.com	906-570-1698 x56857	394 VonRueden Junctions	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
78	Angelita	Nienow	Johann.Borer38@yahoo.com	1-270-280-3779 x38794	4453 Kuvalis Passage	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
79	Christina	Becker	Wiley.Gerhold@yahoo.com	270.705.0494 x103	936 Deckow Summit	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
80	Horace	Schultz	Dillan_Erdman@yahoo.com	1-204-636-8481 x34688	50387 Donnelly Shoal	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
81	Emelie	Runolfsson	Orland.Connelly@hotmail.com	575.901.5310 x76572	24812 Callie Crest	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
82	Edwardo	Weissnat	June.Abbott35@yahoo.com	749-876-4861 x200	7062 Heathcote Walk	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
83	Jayson	Stiedemann	Demarco96@yahoo.com	783-872-5898 x87329	81905 Albion Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
84	Ines	Sanford	Amaya_Yost@gmail.com	364-500-7548 x699	2944 Vine Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
85	Kraig	Hettinger	Chanel.Reynolds56@hotmail.com	835-682-7056 x025	55869 Christelle Lock	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
86	Carolyne	Smitham	Dwight_Abshire@yahoo.com	(912) 415-4840 x213	1857 Reyes Parkway	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
87	Jaquelin	Marks	Clair.Berge-Beer@yahoo.com	(971) 605-8252 x9183	81053 W Pine Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
88	Darrell	Schroeder	Jana66@gmail.com	1-774-407-1641 x95150	7560 Zane Fork	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
89	Irwin	Kohler	Sarah.Flatley@hotmail.com	1-366-828-7433 x5976	4882 Skyline Drive	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
90	Gerard	Mante	Sid.Purdy@gmail.com	828.722.0991 x1345	741 Miles Well	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
91	Sarai	Schuppe	Loyal82@gmail.com	(816) 405-0095 x42234	761 Barrows Lakes	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
92	Mitchell	Schumm	Misty50@yahoo.com	1-248-892-5581 x9604	74129 Zboncak Expressway	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
93	Marcel	Daniel	Kaylah.Heller@yahoo.com	(474) 991-8476 x96557	549 Crona Ville	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
94	Manuela	Dickinson	Celine.Langosh@yahoo.com	1-662-497-4723 x8486	929 N Center Street	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
95	Belle	Koss	Jay_Kuvalis12@gmail.com	788-877-3528 x82001	92813 Gusikowski Wells	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
96	Carroll	Koepp-Stehr	Orin.Graham65@gmail.com	(827) 880-9023 x969	1360 Park Lane	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
97	Noemy	Medhurst	Alford.Reynolds1@hotmail.com	1-843-933-6584 x56784	42118 Forest Avenue	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
98	Orland	Nitzsche	Cristopher.Schowalter@yahoo.com	1-908-878-6991	1273 Eusebio Oval	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
99	Gudrun	Ward	Brody_Cummerata@yahoo.com	376.704.7530 x10565	9705 Regan Spurs	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
100	Berenice	Daugherty	Maribel.Stroman29@gmail.com	895-772-1230 x0489	43625 Bath Road	2024-08-06 23:06:19.891+00	2024-08-06 23:06:19.891+00
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 100, true);


--
-- Name: contacts contacts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_email_key UNIQUE (email);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

