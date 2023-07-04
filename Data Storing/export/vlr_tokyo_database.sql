--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

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
-- Name: agents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agents (
    agent_name character varying(20) NOT NULL,
    agent_role character varying(15)
);


ALTER TABLE public.agents OWNER TO postgres;

--
-- Name: controller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.controller (
    agent_name character varying(20) NOT NULL,
    ability_1 character varying(30),
    ability_1_time_cooldown integer,
    ability_2 character varying(30),
    ability_2_price integer,
    ability_3 character varying(30),
    ability3_price integer,
    ability_ultimate character varying(30),
    ability_ultimate_points integer
);


ALTER TABLE public.controller OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_code character varying(10) NOT NULL,
    country_name character varying(20) NOT NULL,
    region_code character varying(10) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: duelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.duelist (
    agent_name character varying(20) NOT NULL,
    ability_1 character varying(30),
    ability_1_kill_cooldown integer,
    ability_2 character varying(30),
    ability_2_price integer,
    ability_3 character varying(30),
    ability3_price integer,
    ability_ultimate character varying(30),
    ability_ultimate_points integer
);


ALTER TABLE public.duelist OWNER TO postgres;

--
-- Name: has_picked_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.has_picked_map (
    team_code character varying(10) NOT NULL,
    map_name character varying(30) NOT NULL
);


ALTER TABLE public.has_picked_map OWNER TO postgres;

--
-- Name: initiator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.initiator (
    agent_name character varying(20) NOT NULL,
    ability_1 character varying(30),
    ability_1_time_cooldown integer,
    ability_2 character varying(30),
    ability_2_price integer,
    ability_3 character varying(30),
    ability3_price integer,
    ability_ultimate character varying(30),
    ability_ultimate_points integer
);


ALTER TABLE public.initiator OWNER TO postgres;

--
-- Name: map_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_stats (
    map_name character varying(30) NOT NULL,
    amount_played integer NOT NULL,
    atk_winrate real,
    def_winrate real,
    skye_pick real,
    killjoy_pick real,
    jett_pick real,
    raze_pick real,
    viper_pick real,
    omen_pick real,
    breach_pick real,
    brimstone_pick real,
    sova_pick real,
    kayo_pick real,
    cypher_pick real,
    astra_pick real,
    harbor_pick real,
    fade_pick real,
    neon_pick real,
    gekko_pick real,
    sage_pick real,
    phoenix_pick real,
    chamber_pick real,
    reyna_pick real,
    yoru_pick real
);


ALTER TABLE public.map_stats OWNER TO postgres;

--
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    team_code character varying(10) NOT NULL,
    date date NOT NULL,
    team_name character varying(30),
    opponent_name character varying(30),
    team_score integer,
    opponent_score integer
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- Name: player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_stats (
    player_ign character varying(30) NOT NULL,
    team_code character varying(10) NOT NULL,
    country_code character varying(10),
    rounds_played integer,
    rating real,
    acs real,
    kill_death_ratio real,
    kast real,
    avg_damage_per_round real,
    avg_kills_per_round real,
    avg_assists_per_round real,
    fkpr real,
    fdpr real,
    headshot_percentage real,
    clutch_percentage real,
    kmax integer,
    kills integer,
    deaths integer,
    assists integer,
    first_kills integer,
    first_deaths integer
);


ALTER TABLE public.player_stats OWNER TO postgres;

--
-- Name: plays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plays (
    player_ign character varying(30) NOT NULL,
    agent_name character varying(20) NOT NULL
);


ALTER TABLE public.plays OWNER TO postgres;

--
-- Name: sentinel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sentinel (
    agent_name character varying(20) NOT NULL,
    ability_1 character varying(30),
    ability_1_range real,
    ability_1_time_cooldown integer,
    ability_2 character varying(30),
    ability_2_price integer,
    ability_2_range real,
    ability_3 character varying(30),
    ability3_price integer,
    ability_3_range real,
    ability_ultimate character varying(30),
    ability_ultimate_points integer
);


ALTER TABLE public.sentinel OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_code character varying(10) NOT NULL,
    team_name character varying(30) NOT NULL,
    region_code character varying(10) NOT NULL,
    team_wins integer,
    team_ranking integer
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: uses_weapon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_weapon (
    player_ign character varying(30) NOT NULL,
    weapon_name character varying(30) NOT NULL
);


ALTER TABLE public.uses_weapon OWNER TO postgres;

--
-- Name: vct_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vct_regions (
    region_code character varying(10) NOT NULL,
    num_participating_teams integer,
    region_name character varying(100) NOT NULL
);


ALTER TABLE public.vct_regions OWNER TO postgres;

--
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    weapon_name character varying(15) NOT NULL,
    weapon_price integer NOT NULL,
    damage_range1 real NOT NULL,
    damage_range2 real,
    damage_range3 real,
    fire_rate integer NOT NULL,
    is_suppresed boolean NOT NULL
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agents (agent_name, agent_role) FROM stdin;
\.


--
-- Data for Name: controller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.controller (agent_name, ability_1, ability_1_time_cooldown, ability_2, ability_2_price, ability_3, ability3_price, ability_ultimate, ability_ultimate_points) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_code, country_name, region_code) FROM stdin;
\.


--
-- Data for Name: duelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.duelist (agent_name, ability_1, ability_1_kill_cooldown, ability_2, ability_2_price, ability_3, ability3_price, ability_ultimate, ability_ultimate_points) FROM stdin;
\.


--
-- Data for Name: has_picked_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.has_picked_map (team_code, map_name) FROM stdin;
\.


--
-- Data for Name: initiator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.initiator (agent_name, ability_1, ability_1_time_cooldown, ability_2, ability_2_price, ability_3, ability3_price, ability_ultimate, ability_ultimate_points) FROM stdin;
\.


--
-- Data for Name: map_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_stats (map_name, amount_played, atk_winrate, def_winrate, skye_pick, killjoy_pick, jett_pick, raze_pick, viper_pick, omen_pick, breach_pick, brimstone_pick, sova_pick, kayo_pick, cypher_pick, astra_pick, harbor_pick, fade_pick, neon_pick, gekko_pick, sage_pick, phoenix_pick, chamber_pick, reyna_pick, yoru_pick) FROM stdin;
Lotus	12	0.53	0.47	0.71	0.71	0.38	0.54	0.58	0.83	0.13	0	0	0.08	0.29	0.13	0.04	0.21	0.21	0.17	0	0	0	0	0
Fracture	12	0.52	0.48	0.21	0.83	0.29	0.67	0.13	0.13	0.96	0.88	0.25	0.13	0.08	0	0	0.21	0.25	0	0	0	0	0	0
Split	9	0.47	0.53	1	0.06	0.78	0.83	0.72	0.28	0.11	0	0	0.06	0.28	0.72	0	0	0.06	0	0.11	0	0	0	0
Bind	8	0.52	0.48	0.94	0	0.06	0.94	0.75	0	0	0.69	0	0.19	0.19	0.06	0.44	0.13	0	0.31	0.13	0	0.13	0.06	0
Haven	8	0.44	0.56	0.31	0.81	1	0	0.13	0.81	0.88	0	0.56	0	0.19	0.06	0.13	0	0	0.13	0	0	0	0	0
Pearl	7	0.49	0.51	0.93	0.93	1	0	0.79	0	0	0	0.07	0.14	0	0.21	0.79	0	0	0	0	0.14	0	0	0
Ascent	6	0.56	0.44	0	0.75	1	0	0	1	0	0	0.83	1	0.17	0	0	0.17	0	0	0.08	0	0	0	0
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (team_code, date, team_name, opponent_name, team_score, opponent_score) FROM stdin;
FUT	2023-06-11	FUT Esports	Evil Geniuses	0	2
DRX	2023-06-11	DRX	Attacking Soul Esports	2	0
EDG	2023-06-11	EDward Gaming	T1	1	2
NRG	2023-06-12	NRG Esports	Natus Vincere	2	1
DRX	2023-06-12	DRX	Evil Geniuses	0	2
NRG	2023-06-13	NRG Esports	T1	2	1
ASE	2023-06-13	Attacking Soul Esports	FUT Esports	1	2
NAVI	2023-06-13	Natus Vincere	EDward Gaming	0	2
DRX	2023-06-14	DRX	FUT Esports	2	1
T1	2023-06-14	T1	EDward Gaming	0	2
LOUD	2023-06-16	LOUD	Evil Geniuses	0	2
TL	2023-06-16	Team Liquid	EDward Gaming	2	1
FNC	2023-06-17	FNATIC	NRG Esports	2	0
PRX	2023-06-17	Paper Rex	DRX	2	0
EDG	2023-06-18	EDward Gaming	LOUD	2	0
DRX	2023-06-18	DRX	NRG Esports	0	2
TL	2023-06-19	Team Liquid	Evil Geniuses	0	2
PRX	2023-06-19	Paper Rex	FNATIC	0	2
TL	2023-06-20	Team Liquid	NRG Esports	1	2
PRX	2023-06-20	Paper Rex	EDward Gaming	2	1
FNC	2023-06-21	FNATIC	Evil Geniuses	2	1
NRG	2023-06-21	NRG Esports	Paper Rex	1	2
EG	2023-06-24	Evil Geniuses	Paper Rex	3	2
FNC	2023-06-25	FNATIC	Evil Geniuses	3	0
\.


--
-- Data for Name: player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_stats (player_ign, team_code, country_code, rounds_played, rating, acs, kill_death_ratio, kast, avg_damage_per_round, avg_kills_per_round, avg_assists_per_round, fkpr, fdpr, headshot_percentage, clutch_percentage, kmax, kills, deaths, assists, first_kills, first_deaths) FROM stdin;
Alfajer	FNC	\N	210	1.31	229.2	1.63	0.8	143.3	0.88	0.16	0.11	0.06	0.29	0.21	25	184	113	34	23	12
Leo	FNC	\N	210	1.29	200.9	1.47	0.8	129.4	0.71	0.45	0.05	0.01	0.18	0.18	26	150	102	94	11	2
Chronicle	FNC	\N	210	1.21	236.8	1.33	0.76	149.6	0.83	0.43	0.07	0.09	0.26	\N	22	174	131	91	15	19
ZmjjKK	EDG	\N	341	1.15	273.8	1.3	0.73	169.7	0.96	0.17	0.24	0.16	0.19	0.13	30	329	254	59	82	54
Derke	FNC	\N	210	1.12	247.3	1.18	0.7	157.7	0.82	0.2	0.24	0.22	0.22	0.38	28	173	147	42	51	47
s0m	NRG	\N	351	1.12	209.3	1.16	0.74	135.8	0.75	0.43	0.09	0.09	0.23	0.15	24	264	228	151	31	30
SUYGETSU	NAVI	\N	124	1.1	205.8	1.17	0.72	144.8	0.73	0.23	0.05	0.1	0.33	0.21	23	91	78	28	6	12
Ethan	EG	\N	401	1.09	190.4	1.07	0.78	118.6	0.65	0.58	0.05	0.06	0.18	0.24	20	262	246	231	20	23
Victor	NRG	\N	351	1.09	218.4	1.1	0.74	144.4	0.74	0.27	0.08	0.11	0.23	0.16	24	261	237	95	29	40
Rb	DRX	\N	231	1.09	235.3	1.19	0.75	147.2	0.85	0.24	0.13	0.05	0.28	0.06	25	196	165	55	29	11
Demon1	EG	\N	401	1.09	210.9	1.19	0.73	143.2	0.79	0.17	0.14	0.1	0.38	0.21	28	318	267	69	56	39
Smoggy	EDG	\N	341	1.07	195.3	1.13	0.77	130.3	0.74	0.27	0.08	0.07	0.32	0.19	31	251	222	92	27	23
jawgemo	EG	\N	401	1.06	211.7	1.04	0.74	141.4	0.72	0.3	0.13	0.14	0.19	0.32	22	290	279	121	52	56
YHchen	ASE	\N	101	1.06	206.6	0.91	0.75	134.3	0.66	0.59	0.11	0.08	0.18	\N	16	67	74	60	11	8
MaKo	DRX	\N	231	1.06	195.5	0.97	0.74	130.4	0.66	0.53	0.07	0.09	0.28	0.04	24	152	156	122	16	21
Boaster	FNC	\N	210	1.05	171.3	0.91	0.78	104.8	0.55	0.52	0.08	0.07	0.14	0.06	15	116	127	110	16	14
d4v41	PRX	\N	333	1.05	188.3	1	0.76	127.8	0.67	0.4	0.08	0.05	0.28	0.12	23	222	223	134	26	16
Jinggg	PRX	\N	333	1.05	253.5	1.09	0.71	166.5	0.86	0.23	0.14	0.14	0.18	0.05	28	285	262	78	47	48
qw1	FUT	\N	162	1.05	225.4	1.18	0.67	142.5	0.85	0.13	0.2	0.19	0.28	0.17	28	137	116	21	33	31
Shao	NAVI	\N	124	1.05	190.6	1.15	0.73	137.4	0.73	0.22	0.06	0.08	0.33	0.07	34	90	78	27	8	10
C0M	EG	\N	401	1.05	183.6	0.99	0.73	120.5	0.63	0.37	0.06	0.07	0.21	0.17	19	252	255	147	26	27
CHICHOO	EDG	\N	341	1.05	191.7	1.09	0.77	127.8	0.68	0.25	0.06	0.06	0.25	0.2	27	232	213	84	22	19
Sayf	TL	\N	169	1.05	246	1.08	0.71	158	0.82	0.23	0.19	0.19	0.22	0.05	26	139	129	39	32	32
aspas	LOUD	\N	80	1.04	252	1.02	0.69	159	0.83	0.19	0.21	0.2	0.28	\N	20	66	65	15	17	16
cNed	NAVI	\N	124	1.04	247.6	1.03	0.72	157.3	0.85	0.22	0.22	0.14	0.23	\N	27	106	103	27	27	17
ardiis	NRG	\N	351	1.03	211.1	1.07	0.7	142.1	0.73	0.22	0.16	0.16	0.19	0.14	23	255	239	76	57	57
Boostio	EG	\N	401	1.02	220.6	1.07	0.68	143.4	0.77	0.2	0.15	0.11	0.22	0.16	35	310	289	80	59	43
Haodong	EDG	\N	341	1.02	187.4	0.98	0.8	118	0.67	0.36	0.09	0.09	0.25	0.18	24	228	232	124	30	32
AtaKaptan	FUT	\N	162	1.02	182.3	0.93	0.71	118.5	0.64	0.46	0.07	0.08	0.26	0.16	22	104	112	75	12	13
Munchkin	T1	\N	173	1	209.8	0.98	0.67	147	0.69	0.2	0.12	0.14	0.23	0.07	20	119	122	34	21	25
nAts	TL	\N	169	1	213.8	1.08	0.75	139.6	0.77	0.15	0.1	0.04	0.29	0.06	26	130	120	26	17	6
crashies	NRG	\N	351	0.99	166.8	0.93	0.75	110.7	0.6	0.4	0.05	0.09	0.3	0.17	19	212	229	139	18	32
monk	ASE	\N	101	0.99	216.6	0.91	0.68	153.8	0.7	0.32	0.09	0.05	0.2	0.21	21	71	78	32	9	5
Life	ASE	\N	101	0.98	221	0.96	0.73	144.1	0.78	0.15	0.23	0.13	0.23	\N	22	79	82	15	23	13
BuZz	DRX	\N	231	0.98	220.2	1.01	0.7	144.3	0.73	0.17	0.15	0.15	0.19	0.14	19	169	167	40	34	35
nobody	EDG	\N	341	0.98	191.9	0.96	0.75	125.7	0.68	0.33	0.06	0.1	0.27	0.21	22	233	242	112	19	33
f0rsakeN	PRX	\N	333	0.96	215.1	0.94	0.7	140.9	0.73	0.26	0.17	0.15	0.26	0.05	24	243	259	86	55	51
MrFaliN	FUT	\N	162	0.95	174.4	0.86	0.69	115	0.6	0.39	0.09	0.07	0.22	0.19	18	97	113	63	15	12
mindfreak	PRX	\N	333	0.95	174.6	0.93	0.71	113.6	0.63	0.35	0.06	0.08	0.25	0.17	23	211	228	115	20	27
qRaxs	FUT	\N	162	0.94	206.8	0.9	0.77	135.4	0.69	0.44	0.09	0.07	0.31	0.06	21	111	124	71	14	12
FiNESSE	NRG	\N	351	0.94	173.9	0.89	0.7	120.6	0.61	0.33	0.08	0.08	0.2	0.08	21	213	240	116	29	28
soulcas	TL	\N	169	0.94	176.8	0.94	0.73	117.9	0.64	0.29	0.04	0.08	0.34	0.09	18	109	116	49	7	13
MOJJ	FUT	\N	162	0.91	184.8	0.98	0.69	118.9	0.68	0.19	0.06	0.07	0.24	0.1	20	110	112	31	9	11
Carpe	T1	\N	173	0.91	176.6	0.81	0.68	112.5	0.61	0.48	0.05	0.06	0.27	0.08	22	105	129	83	8	11
Less	LOUD	\N	80	0.91	199.5	0.89	0.65	136.7	0.71	0.2	0.04	0.11	0.23	0.13	26	57	64	16	3	9
Foxy9	DRX	\N	83	0.91	215.8	0.85	0.69	143.4	0.69	0.22	0.19	0.28	0.2	0.25	16	57	67	18	16	23
stax	DRX	\N	231	0.9	162.6	0.78	0.7	108.7	0.56	0.47	0.03	0.08	0.29	0.15	22	130	167	108	6	19
Sayaplayer	T1	\N	173	0.9	212.5	0.94	0.69	138.6	0.76	0.14	0.16	0.18	0.23	0.31	26	132	140	24	27	31
ANGE1	NAVI	\N	124	0.9	163.2	0.7	0.71	108.6	0.52	0.38	0.12	0.08	0.28	0.09	17	65	93	47	15	10
Jamppi	TL	\N	169	0.9	177.6	0.88	0.69	115.3	0.63	0.34	0.05	0.11	0.24	0.18	18	106	121	58	9	19
Zyppan	NAVI	\N	124	0.89	163.6	0.8	0.7	111.8	0.59	0.32	0.1	0.05	0.41	0.09	19	73	91	40	13	6
Zest	DRX	\N	148	0.87	154.7	0.78	0.72	97.7	0.54	0.39	0.04	0.1	0.3	0.2	21	80	103	58	6	15
xeta	T1	\N	173	0.87	157.8	0.72	0.72	106.8	0.53	0.34	0.04	0.08	0.19	0.23	18	91	126	59	7	13
ban	T1	\N	173	0.83	181.8	0.84	0.66	121.3	0.64	0.25	0.06	0.11	0.26	0.14	22	110	131	44	11	19
bunt	ASE	\N	101	0.83	179.8	0.79	0.67	110.3	0.65	0.4	0.04	0.09	0.25	\N	20	66	84	40	4	9
tuyz	LOUD	\N	80	0.83	163.5	0.67	0.64	98.2	0.54	0.39	0.08	0.03	0.31	0.17	17	43	64	31	6	2
cgrs	PRX	\N	333	0.81	150	0.73	0.69	97.2	0.52	0.32	0.05	0.08	0.2	0.16	23	173	237	105	15	28
Redgar	TL	\N	169	0.78	136.1	0.69	0.69	87.5	0.49	0.41	0.08	0.12	0.32	0.11	16	82	118	70	13	21
cauanzin	LOUD	\N	80	0.77	170.3	0.72	0.63	110.2	0.6	0.26	0.09	0.08	0.26	0.17	15	48	67	21	7	6
hfmi0dzjc9z7	ASE	\N	101	0.74	151.4	0.71	0.58	104	0.54	0.22	0.07	0.12	0.24	0.27	14	55	77	22	7	12
saadhak	LOUD	\N	80	0.64	130	0.49	0.65	88.1	0.4	0.4	0.05	0.13	0.18	0.08	10	32	65	32	4	10
\.


--
-- Data for Name: plays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plays (player_ign, agent_name) FROM stdin;
\.


--
-- Data for Name: sentinel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sentinel (agent_name, ability_1, ability_1_range, ability_1_time_cooldown, ability_2, ability_2_price, ability_2_range, ability_3, ability3_price, ability_3_range, ability_ultimate, ability_ultimate_points) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_code, team_name, region_code, team_wins, team_ranking) FROM stdin;
LOUD	LOUD	AMERICAS	\N	\N
TL	Team Liquid	EMEA	\N	\N
PRX	Paper Rex	PAC	\N	\N
EG	Evil Geniuses	AMERICAS	\N	\N
NRG	NRG Esports	AMERICAS	\N	\N
DRX	DRX	PAC	\N	\N
EDG	EDward Gaming	CH	\N	\N
NAVI	Natus Vincere	EMEA	\N	\N
T1	T1	PAC	\N	\N
ASE	Attacking Soul Esports	CH	\N	\N
FNC	FNATIC	EMEA	\N	\N
FUT	FUT Esports	EMEA	\N	\N
\.


--
-- Data for Name: uses_weapon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uses_weapon (player_ign, weapon_name) FROM stdin;
\.


--
-- Data for Name: vct_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vct_regions (region_code, num_participating_teams, region_name) FROM stdin;
EMEA	\N	Europe, Middle-East, Africa
AMERICAS	\N	AMERICAS (NA, SA, LA)
PAC	\N	Pacific
CH	\N	China
\.


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (weapon_name, weapon_price, damage_range1, damage_range2, damage_range3, fire_rate, is_suppresed) FROM stdin;
\.


--
-- Name: countries countries_country_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_code_key UNIQUE (country_code);


--
-- Name: countries countries_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_name_key UNIQUE (country_name);


--
-- Name: map_stats map_stats_map_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_stats
    ADD CONSTRAINT map_stats_map_name_key UNIQUE (map_name);


--
-- Name: agents pk_agents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT pk_agents PRIMARY KEY (agent_name);


--
-- Name: controller pk_controller; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.controller
    ADD CONSTRAINT pk_controller PRIMARY KEY (agent_name);


--
-- Name: countries pk_countries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT pk_countries PRIMARY KEY (country_code);


--
-- Name: duelist pk_duelist; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duelist
    ADD CONSTRAINT pk_duelist PRIMARY KEY (agent_name);


--
-- Name: initiator pk_initiator; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.initiator
    ADD CONSTRAINT pk_initiator PRIMARY KEY (agent_name);


--
-- Name: map_stats pk_maps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_stats
    ADD CONSTRAINT pk_maps PRIMARY KEY (map_name);


--
-- Name: matches pk_matches; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT pk_matches PRIMARY KEY (team_code, date);


--
-- Name: has_picked_map pk_picked_map; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_picked_map
    ADD CONSTRAINT pk_picked_map PRIMARY KEY (team_code, map_name);


--
-- Name: player_stats pk_player; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT pk_player PRIMARY KEY (player_ign);


--
-- Name: plays pk_plays; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT pk_plays PRIMARY KEY (player_ign, agent_name);


--
-- Name: vct_regions pk_regions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vct_regions
    ADD CONSTRAINT pk_regions PRIMARY KEY (region_code);


--
-- Name: sentinel pk_sentinel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentinel
    ADD CONSTRAINT pk_sentinel PRIMARY KEY (agent_name);


--
-- Name: teams pk_teams; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT pk_teams PRIMARY KEY (team_code);


--
-- Name: uses_weapon pk_uses_weapon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_weapon
    ADD CONSTRAINT pk_uses_weapon PRIMARY KEY (player_ign, weapon_name);


--
-- Name: weapons pk_weapons; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT pk_weapons PRIMARY KEY (weapon_name);


--
-- Name: player_stats player_stats_player_ign_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_player_ign_key UNIQUE (player_ign);


--
-- Name: teams teams_team_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_code_key UNIQUE (team_code);


--
-- Name: teams teams_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_name_key UNIQUE (team_name);


--
-- Name: vct_regions vct_regions_region_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vct_regions
    ADD CONSTRAINT vct_regions_region_code_key UNIQUE (region_code);


--
-- Name: weapons weapons_weapon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_weapon_name_key UNIQUE (weapon_name);


--
-- Name: plays fk_agent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT fk_agent FOREIGN KEY (agent_name) REFERENCES public.agents(agent_name);


--
-- Name: duelist fk_agent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duelist
    ADD CONSTRAINT fk_agent FOREIGN KEY (agent_name) REFERENCES public.agents(agent_name);


--
-- Name: sentinel fk_agent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentinel
    ADD CONSTRAINT fk_agent FOREIGN KEY (agent_name) REFERENCES public.agents(agent_name);


--
-- Name: controller fk_agent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.controller
    ADD CONSTRAINT fk_agent FOREIGN KEY (agent_name) REFERENCES public.agents(agent_name);


--
-- Name: initiator fk_agent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.initiator
    ADD CONSTRAINT fk_agent FOREIGN KEY (agent_name) REFERENCES public.agents(agent_name);


--
-- Name: player_stats fk_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT fk_country FOREIGN KEY (country_code) REFERENCES public.countries(country_code);


--
-- Name: has_picked_map fk_map; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_picked_map
    ADD CONSTRAINT fk_map FOREIGN KEY (map_name) REFERENCES public.map_stats(map_name);


--
-- Name: matches fk_opponent_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_opponent_name FOREIGN KEY (opponent_name) REFERENCES public.teams(team_name);


--
-- Name: plays fk_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT fk_player FOREIGN KEY (player_ign) REFERENCES public.player_stats(player_ign);


--
-- Name: uses_weapon fk_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_weapon
    ADD CONSTRAINT fk_player FOREIGN KEY (player_ign) REFERENCES public.player_stats(player_ign);


--
-- Name: teams fk_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT fk_region FOREIGN KEY (region_code) REFERENCES public.vct_regions(region_code);


--
-- Name: countries fk_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT fk_region FOREIGN KEY (region_code) REFERENCES public.vct_regions(region_code);


--
-- Name: has_picked_map fk_team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has_picked_map
    ADD CONSTRAINT fk_team FOREIGN KEY (team_code) REFERENCES public.teams(team_code);


--
-- Name: matches fk_team_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_team_code FOREIGN KEY (team_code) REFERENCES public.teams(team_code);


--
-- Name: matches fk_team_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_team_name FOREIGN KEY (team_name) REFERENCES public.teams(team_name);


--
-- Name: uses_weapon fk_weapon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_weapon
    ADD CONSTRAINT fk_weapon FOREIGN KEY (weapon_name) REFERENCES public.weapons(weapon_name);


--
-- PostgreSQL database dump complete
--

