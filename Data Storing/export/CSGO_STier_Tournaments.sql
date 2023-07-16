--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    region character varying(30) NOT NULL,
    approx_total_winnings bigint NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: tournament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament (
    tournament_id integer NOT NULL,
    tournament_name character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    city character varying(30),
    country character varying(30),
    type_of_tournament character varying(30) NOT NULL,
    is_major boolean NOT NULL,
    prize_pool double precision NOT NULL,
    number_of_teams integer NOT NULL
);


ALTER TABLE public.tournament OWNER TO postgres;

--
-- Name: winner_runner_up; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.winner_runner_up (
    tournament_id integer NOT NULL,
    winner_id integer NOT NULL,
    runner_up_id integer NOT NULL
);


ALTER TABLE public.winner_runner_up OWNER TO postgres;

--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (team_id, team_name, region, approx_total_winnings) FROM stdin;
1	Heroic	Europe	3129372
2	Team Vitality	Europe	3477705
3	ENCE	Europe	1860460
4	MOUZ	Europe	4194087
5	GamerLegion	Europe	453755
6	FaZe Clan	Europe	7155597
7	Cloud9	CIS	3262876
8	G2 Esports	Europe	4521259
9	Team Liquid	Europe	5878569
10	Outsiders	CIS	718750
11	Natus Vincere	Europe	9522791
12	BIG	Europe	1900308
13	Gambit Esports	CIS	3258151
14	Ninjas in Pyjamas	Europe	3867447
15	OG	Europe	1092892
16	Virtus.pro	CIS	4784062
17	Astralis	Europe	9681684
18	FURIA Esports	North America	1618275
19	100 Thieves	North America	191600
20	Evil Geniuses	North America	1270735
21	MIBR	North America	2071519
22	Complexity Gaming	North America	1814188
23	MAD Lions	Europe	728688
24	Fnatic	Europe	5988784
25	AVANGAR	CIS	772045
26	Windigo Gaming	Europe	775118
27	AGO esports	Europe	818331
28	Vega Squadron	CIS	306811
29	North	Europe	1150000
30	NRG Esports	North America	1145675
31	Space Soldiers	Europe	757282
32	SK Gaming	North America	3696729
33	Immortals	North America	571425
34	Team Envy	North America	2156631
35	devils.one	Europe	861019
36	OpTic Gaming	Europe	1353650
37	Renegades	Oceania	1070183
38	Dignitas	Europe	1049036
39	Luminosity Gaming	North America	1426082
40	Tempo Storm	Europe	155860
41	Team SoloMid	North America	613710
42	Team France	Europe	79850
43	Team Poland	Europe	57804
44	Titan	Europe	190544
45	Team LDLC	Europe	604207
46	iBUYPOWER	North America	0
47	Clan-Mystik	Europe	35622
48	VeryGames	Europe	279552
49	Astana Dragons	CIS	37697
50	Lemondogs	Europe	60559
51	Epsilon Esports	Europe	483160
52	Quantic Gaming	North America	7962
\.


--
-- Data for Name: tournament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament (tournament_id, tournament_name, start_date, end_date, city, country, type_of_tournament, is_major, prize_pool, number_of_teams) FROM stdin;
158	ESL Pro League Season 13	2021-03-08	2021-04-11			Online	f	750000	24
1	ESWC 2012	2012-10-31	2012-11-04	Paris	France	Offline	f	22000	10
2	DreamHack Winter 2012	2012-11-22	2012-11-24	Jönköping	Sweden	Offline	f	45275.16	16
3	ESL Major Series One - Spring 2013	2013-03-19	2013-04-14	Cologne	Germany	Online/Offline	f	35000	16
4	ESEA Global Finals Season 13	2013-04-19	2013-04-21	Dallas	United States	Offline	f	39500	8
5	DreamHack Summer 2013	2013-06-15	2013-06-18	Jönköping	Sweden	Offline	f	30901.45	16
6	ESL Major Series One - Summer 2013	2013-05-14	2013-06-30	Cologne	Germany	Online/Offline	f	35000	16
7	ESEA Global Finals Season 14	2013-05-27	2013-08-18	Dallas	United States	Offline	f	39500	6
8	DreamHack Bucharest 2013	2013-09-14	2013-09-15	Bucharest	Romania	Offline	f	15000	16
9	StarLadder StarSeries VII	2013-10-10	2013-10-13	Kyiv	Ukraine	Offline	f	15000	4
10	ESL Major Series One - Fall 2013	2013-10-01	2013-10-27	Cologne	Germany	Online/Offline	f	35000	16
11	Electronic Sports World Cup 2013	2013-10-30	2013-11-03	Paris	France	Offline	f	25000	16
12	DreamHack Winter 2013	2013-11-28	2013-11-30	Jönköping	Sweden	Offline	t	250000	16
13	Fragbite Masters Season 1	2013-12-12	2013-12-13			Online	f	21304.9	8
14	ESEA Global Finals Season 15	2014-01-17	2014-01-19	Dallas	United States	Offline	f	39500	6
15	ESL Major Series One Katowice 2014	2014-03-13	2014-03-16	Katowice	Poland	Offline	t	250000	16
16	Fragbite Masters Season 2	2014-03-01	2014-04-01			Online	f	25408.2	16
17	StarLadder StarSeries IX	2014-05-02	2014-05-04	Kyiv	Ukraine	Offline	f	30000	4
18	DreamHack Summer 2014	2014-06-14	2014-06-17	Jönköping	Sweden	Offline	f	30000	16
19	ESEA Season 16 - Global Invite Division	2014-06-27	2014-06-29	Dallas	United States	Offline	f	47500	8
20	Gfinity G3	2014-08-02	2014-08-03	London	United Kingdom	Offline	f	45000	12
21	ESL One: Cologne 2014	2014-08-14	2014-08-17	Cologne	Germany	Offline	t	250000	16
22	StarLadder StarSeries X	2014-08-30	2014-08-31	Kyiv	Ukraine	Offline	f	30000	4
23	DreamHack Invitational II	2014-09-25	2014-09-26	Stockholm	Sweden	Offline	f	30000	8
24	StarLadder StarSeries XI	2014-09-12	2014-10-19	Kyiv	Ukraine	Online/Offline	f	35000	16
25	FACEIT League - Season 2	2014-09-03	2014-10-26	Milan	Italy	Offline	f	50000	14
26	ESWC 2014	2014-10-29	2014-11-02	Paris	France	Offline	f	60000	24
27	Fragbite Masters Season 3	2014-10-01	2014-11-09	Stockholm	Sweden	Online/Offline	f	43851.9	16
28	DreamHack Winter 2014	2014-11-27	2014-11-29	Jönköping	Sweden	Offline	t	250000	16
29	ESEA Season 17 - Global Invite Division	2014-12-05	2014-12-07	Dallas	United States	Offline	f	47500	8
30	MLG X Games Aspen Invitational	2015-01-23	2015-01-25	Aspen	United States	Offline	f	50000	8
31	ESL One: Katowice 2015	2015-03-12	2015-03-15	Katowice	Poland	Offline	t	250000	16
32	Gfinity Spring Masters 1	2015-03-20	2015-03-22	London	United Kingdom	Offline	f	50000	8
33	StarLadder StarSeries XII	2015-01-13	2015-03-29	Kyiv	Ukraine	Online/Offline	f	50000	16
34	ESL Pro League Winter 2014/15	2015-04-10	2015-04-12	Cologne	Germany	Offline	f	48000	8
35	ESEA Season 18: Global Invite Division	2015-04-17	2015-04-19	Dallas	United States	Offline	f	144000	8
36	PGL CS:GO Championship Series Kick-Off Season	2015-04-24	2015-04-26	Bucharest	Romania	Offline	f	75000	4
37	FACEIT League 2015 Stage I Finals	2015-05-01	2015-05-03	London	United Kingdom	Offline	f	85000	8
38	DreamHack Open Tours 2015	2015-05-08	2015-05-10	Tours	France	Offline	f	40000	8
39	Gfinity Spring Masters 2	2015-05-15	2015-05-17	London	United Kingdom	Offline	f	50000	10
40	Fragbite Masters Season 4	2015-06-06	2015-06-07	Stockholm	Sweden	Offline	f	62494.43	4
41	DreamHack Open Summer 2015	2015-06-13	2015-06-15	Jönköping	Sweden	Offline	f	40000	8
42	StarLadder StarSeries XIII	2015-05-18	2015-06-21	Kyiv	Ukraine	Online/Offline	f	50000	16
43	Gfinity Masters Summer 1	2015-06-26	2015-06-28	London	United Kingdom	Offline	f	80000	8
44	ESL ESEA Pro League Season 1 - Finals	2015-07-02	2015-07-05	Cologne	Germany	Offline	f	250000	8
45	Electronic Sports World Cup 2015	2015-07-10	2015-07-12	Montreal	Canada	Offline	f	75000	16
46	FACEIT 2015 Stage 2 Finals	2015-07-16	2015-07-18	Valencia	Spain	Offline	f	100000	8
47	CEVO Season 7 Professional	2015-07-24	2015-07-26	Columbus	United States	Offline	f	75000	8
48	Intel Extreme Masters Season X - gamescom	2015-08-05	2015-08-08	Cologne	Germany	Offline	f	80500	6
49	ESL One: Cologne 2015	2015-08-20	2015-08-23	Cologne	Germany	Offline	t	250000	16
50	ESL ESEA Pro League Invitational	2015-09-10	2015-09-12	Dubai	United Arab Emirates	Offline	f	250000	8
51	DreamHack Open London 2015	2015-09-19	2015-09-20	London	United Kingdom	Offline	f	40000	8
52	Gfinity Champion of Champions	2015-09-26	2015-09-27	Birmingham	United Kingdom	Offline	f	100000	4
53	PGL CS:GO Championship Series Season 1	2015-10-02	2015-10-04	Bucharest	Romania	Offline	f	75000	4
54	The World Championships 2015	2015-10-08	2015-10-11	Belgrade	Serbia	Online/Offline	f	100000	16
55	DreamHack Open Cluj-Napoca 2015	2015-10-28	2015-11-01	Cluj-Napoca	Romania	Offline	t	250000	16
56	CEVO Season 8 Professional	2015-08-16	2015-11-08	Columbus	United States	Offline	f	100000	24
57	Intel Extreme Masters X - San Jose	2015-11-21	2015-11-22	San Jose	United States	Offline	f	125000	8
58	FACEIT League 2015 Stage 3 Finals	2015-11-26	2015-11-29	Jönköping	Sweden	Offline	f	250000	8
59	Fragbite Masters Season 5	2015-12-04	2015-12-06	Stockholm	Sweden	Offline	f	58852	4
60	ESL ESEA Pro League Season 2 - Finals	2015-12-10	2015-12-13	Burbank	United States	Offline	f	250000	8
61	StarLadder i-League StarSeries XIV	2016-01-13	2016-01-17	Minsk	Belarus	Offline	f	200000	8
62	DreamHack Open Leipzig 2016	2016-01-22	2016-01-24	Leipzig	Germany	Offline	f	100000	8
63	Global eSports Cup - Season 1	2016-02-04	2016-02-07	Vilnius	Lithuania	Offline	f	200000	8
64	Intel Extreme Masters X - World Championship	2016-03-02	2016-03-05	Katowice	Poland	Offline	f	250000	12
65	MLG Major Championship: Columbus 2016	2016-03-29	2016-04-03	Columbus	United States	Offline	t	1000000	16
66	DreamHack Masters Malmö 2016	2016-04-12	2016-04-17	Malmö	Sweden	Offline	f	250000	16
67	CEVO Pro League Season 9	2016-04-28	2016-05-01	London	United Kingdom	Offline	f	125000	8
68	ESL Pro League Season 3 - Finals	2016-05-11	2016-05-15	LeicesterLondon	United Kingdom	Offline	f	512000	8
69	StarLadder i-League Invitational #1	2016-05-19	2016-05-22	Kyiv	Ukraine	Offline	f	100000	8
70	DreamHack Open Summer 2016	2016-06-18	2016-06-21	Jönköping	Sweden	Offline	f	100000	8
71	Esports Championship Series Season 1 - Finals	2016-06-24	2016-06-26	London	United Kingdom	Offline	f	765000	8
72	ESL One: Cologne 2016	2016-07-05	2016-07-10	Cologne	Germany	Offline	t	1000000	16
73	ELEAGUE Season 1	2016-05-24	2016-07-30	Atlanta	United States	Offline	f	1400000	24
74	StarLadder i-League StarSeries Season 2	2016-09-07	2016-09-11	Kyiv	Ukraine	Offline	f	300000	16
75	DreamHack Open Bucharest 2016	2016-09-16	2016-09-18	Bucharest	Romania	Offline	f	100000	8
76	ESL One: New York 2016	2016-09-30	2016-10-02	New York City	United States	Offline	f	250000	8
77	EPICENTER 2016	2016-10-17	2016-10-23	Moscow	Russia	Offline	f	490000	8
78	ESL Pro League Season 4 - Finals	2016-10-26	2016-10-30	São Paulo	Brazil	Offline	f	600000	12
79	Intel Extreme Masters XI - Oakland	2016-11-16	2016-11-20	Oakland	United States	Offline	f	300000	12
80	DreamHack Open Winter 2016	2016-11-24	2016-11-26	Jönköping	Sweden	Offline	f	100000	8
81	ELEAGUE Season 2	2016-10-21	2016-12-03	Atlanta	United States	Offline	f	1100000	16
82	Esports Championship Series Season 2 - Finals	2016-12-09	2016-12-11	Anaheim	United States	Offline	f	660000	8
83	World Electronic Sports Games 2016	2017-01-12	2017-01-15	Changzhou	China	Offline	f	1500000	23
84	ELEAGUE Major Atlanta 2017	2017-01-22	2017-01-29	Atlanta	United States	Offline	t	1000000	16
85	DreamHack Masters Las Vegas 2017	2017-02-15	2017-02-19	Las Vegas	United States	Offline	f	450000	16
86	Intel Extreme Masters XI - World Championship	2017-03-01	2017-03-05	Katowice	Poland	Offline	f	250000	12
87	StarLadder i-League StarSeries Season 3	2017-04-04	2017-04-09	Kyiv	Ukraine	Offline	f	300000	16
88	Intel Extreme Masters XII - Sydney	2017-05-03	2017-05-07	Sydney	Australia	Offline	f	200000	8
89	ESL Pro League Season 5 - Finals	2017-05-30	2017-06-04	Dallas	United States	Offline	f	750000	12
159	DreamHack Masters Spring 2021	2021-04-29	2021-05-09			Online	f	250000	16
90	Esports Championship Series Season 3 - Finals	2017-06-23	2017-06-25	London	United Kingdom	Offline	f	660000	8
91	ESL One: Cologne 2017	2017-07-04	2017-07-09	Cologne	Germany	Offline	f	250000	16
92	PGL Major Kraków 2017	2017-07-16	2017-07-23	Kraków	Poland	Offline	t	1000000	16
93	DreamHack Masters Malmö 2017	2017-08-30	2017-09-03	Malmö	Sweden	Offline	f	250000	16
94	ESG Tour Mykonos 2017	2017-09-07	2017-09-10	Mykonos	Greece	Offline	f	240561.53	8
95	ESL One: New York 2017	2017-09-15	2017-09-17	New York City	United States	Offline	f	250000	8
96	ELEAGUE CS:GO Premier 2017	2017-09-08	2017-10-13	Atlanta	United States	Offline	f	1000000	16
97	EPICENTER 2017	2017-10-24	2017-10-29	St. Petersburg	Russia	Offline	f	490000	8
98	Intel Extreme Masters XII - Oakland	2017-11-14	2017-11-19	BurbankOakland	United States	Offline	f	300000	12
99	ESL Pro League Season 6 - Finals	2017-12-05	2017-12-10	Odense	Denmark	Offline	f	750000	12
100	Esports Championship Series Season 4 - Finals	2017-12-15	2017-12-17	Cancun	Mexico	Offline	f	660000	8
101	ELEAGUE Major Boston 2018	2018-01-12	2018-01-28	AtlantaBoston	United States	Offline	t	1000000	23
102	StarLadder & i-League StarSeries Season 4	2018-02-17	2018-02-25	Kyiv	Ukraine	Offline	f	300000	16
103	Intel Extreme Masters XII - World Championship	2018-02-27	2018-03-04	Katowice	Poland	Offline	f	500000	16
104	World Electronic Sports Games 2017	2018-03-13	2018-03-18	Haikou	China	Offline	f	1500000	27
105	DreamHack Masters Marseille 2018	2018-04-18	2018-04-22	Marseille	France	Offline	f	250000	16
106	Intel Extreme Masters XIII - Sydney	2018-05-01	2018-05-06	Sydney	Australia	Offline	f	250000	16
107	ESL Pro League Season 7 - Finals	2018-05-15	2018-05-20	Dallas	United States	Offline	f	750000	16
108	StarSeries & i-League CS:GO Season 5	2018-05-28	2018-06-03	Kyiv	Ukraine	Offline	f	300000	16
109	Esports Championship Series Season 5 - Finals	2018-06-08	2018-06-10	London	United Kingdom	Offline	f	660000	8
110	ESL One: Belo Horizonte 2018	2018-06-13	2018-06-17	Belo Horizonte	Brazil	Offline	f	200000	8
111	ESL One: Cologne 2018	2018-07-03	2018-07-08	Cologne	Germany	Offline	f	300000	16
112	ELEAGUE CS:GO Premier 2018	2018-07-21	2018-07-29	Atlanta	United States	Offline	f	1000000	8
113	DreamHack Masters Stockholm 2018	2018-08-29	2018-09-02	Stockholm	Sweden	Offline	f	250000	16
114	FACEIT Major: London 2018	2018-09-05	2018-09-23	London	United Kingdom	Offline	t	1000000	24
115	ESL One: New York 2018	2018-09-26	2018-09-30	New York City	United States	Offline	f	250000	8
116	StarSeries & i-League CS:GO Season 6	2018-10-07	2018-10-14	Kyiv	Ukraine	Offline	f	300000	16
117	EPICENTER 2018	2018-10-23	2018-10-28	Moscow	Russia	Offline	f	295000	8
118	Intel Extreme Masters XIII - Chicago	2018-11-06	2018-11-11	Chicago	United States	Offline	f	250000	16
119	Esports Championship Series Season 6 - Finals	2018-11-22	2018-11-25	Arlington	United States	Offline	f	660000	8
120	ESL Pro League Season 8 - Finals	2018-12-04	2018-12-09	Odense	Denmark	Offline	f	750000	16
121	Intel Extreme Masters XIII - Katowice Major 2019	2019-02-13	2019-03-03	Katowice	Poland	Offline	t	1000000	24
122	World Electronic Sports Games 2018	2019-03-11	2019-03-17	Chongqing	China	Offline	f	890000	27
123	StarSeries & i-League CS:GO Season 7	2019-03-30	2019-04-07	Shanghai	China	Offline	f	500000	16
124	Intel Extreme Masters XIV - Sydney	2019-04-29	2019-05-05	Sydney	Australia	Offline	f	250000	16
125	DreamHack Masters Dallas 2019	2019-05-28	2019-06-02	Dallas	United States	Offline	f	250000	16
126	Esports Championship Series Season 7 - Finals	2019-06-06	2019-06-09	London	United Kingdom	Offline	f	500000	8
127	ESL Pro League Season 9 - Finals	2019-06-18	2019-06-23	Montpellier	France	Offline	f	600000	16
128	ESL One: Cologne 2019	2019-07-02	2019-07-07	Cologne	Germany	Offline	f	300000	16
129	Intel Extreme Masters XIV - Chicago	2019-07-18	2019-07-21	Chicago	United States	Offline	f	250000	8
130	StarLadder Berlin Major 2019	2019-08-23	2019-09-08	Berlin	Germany	Offline	t	1000000	24
131	ESL One: New York 2019	2019-09-26	2019-09-29	New York City	United States	Offline	f	200000	8
132	DreamHack Masters Malmö 2019	2019-10-01	2019-10-06	Malmö	Sweden	Offline	f	250000	16
133	StarSeries & i-League CS:GO Season 8	2019-10-21	2019-10-27	Belek	Turkey	Offline	f	500000	16
134	Intel Extreme Masters XIV - Beijing	2019-11-07	2019-11-10	Beijing-Haidian	China	Offline	f	250000	8
135	CS:GO Asia Championships 2019	2019-11-20	2019-11-24	Shanghai	China	Offline	f	500000	8
136	Esports Championship Series Season 8 - Finals	2019-11-28	2019-12-01	Arlington	United States	Offline	f	500000	8
137	ESL Pro League Season 10 - Finals	2019-12-03	2019-12-08	Odense	Denmark	Offline	f	600000	16
138	BLAST Pro Series: Global Final 2019	2019-12-12	2019-12-14	Riffa	Bahrain	Offline	f	500000	4
139	EPICENTER 2019	2019-12-17	2019-12-22	Moscow	Russia	Offline	f	500000	8
140	Intel Extreme Masters XIV - World Championship	2020-02-24	2020-03-01	Katowice	Poland	Offline	f	500000	16
141	ESL Pro League Season 11: Europe	2020-03-16	2020-04-12			Online	f	531000	18
142	ESL Pro League Season 11: North America	2020-03-26	2020-04-12			Online	f	219000	6
143	Flashpoint Season 1	2020-03-13	2020-04-19	Los Angeles	United States	Offline/Online	f	1000000	12
144	DreamHack Masters Spring 2020: Europe	2020-05-19	2020-06-14			Online	f	160000	16
145	BLAST Premier: Spring 2020 European Finals	2020-06-15	2020-06-21			Online	f	500000	8
146	BLAST Premier: Spring 2020 American Finals	2020-06-16	2020-06-21			Online	f	250000	4
147	ESL One: Cologne 2020 Online - North America	2020-08-18	2020-08-29			Online	f	135000	8
148	ESL One: Cologne 2020 Online - Europe	2020-08-18	2020-08-30			Online	f	325000	16
149	ESL Pro League Season 12: North America	2020-09-01	2020-09-27			Online	f	225000	8
150	ESL Pro League Season 12: Europe	2020-09-01	2020-10-04			Online	f	450000	16
151	Intel Extreme Masters XV - Beijing Online: Europe	2020-11-06	2020-11-22			Online	f	150000	16
152	Flashpoint Season 2	2020-11-10	2020-12-06			Online	f	1000000	12
153	DreamHack Masters Winter 2020: Europe	2020-11-30	2020-12-06			Online	f	150000	16
154	BLAST Premier: Fall 2020	2020-12-08	2020-12-13			Online	f	425000	8
155	Intel Extreme Masters XV - Global Challenge	2020-12-15	2020-12-20			Online	f	500000	8
156	BLAST Premier: Global Final 2020	2021-01-19	2021-01-24			Online	f	1000000	8
157	Intel Extreme Masters XV - World Championship	2021-02-16	2021-02-28			Online	f	1000000	24
160	Intel Extreme Masters XVI - Summer	2021-06-03	2021-06-13			Online	f	250000	16
161	BLAST Premier: Spring Finals 2021	2021-06-15	2021-06-20			Online	f	425000	8
162	Intel Extreme Masters XVI - Cologne	2021-07-06	2021-07-18	Cologne	Germany	Offline	f	1000000	24
163	ESL Pro League Season 14	2021-08-16	2021-09-12			Online	f	750000	24
164	PGL Major Stockholm 2021	2021-10-26	2021-11-07	Stockholm	Sweden	Offline	t	2000000	24
165	BLAST Premier: Fall Finals 2021	2021-11-24	2021-11-28	Copenhagen	Denmark	Offline	f	425000	8
166	Intel Extreme Masters XVI - Winter	2021-12-02	2021-12-12	Stockholm	Sweden	Offline	f	250000	16
167	BLAST Premier: World Final 2021	2021-12-14	2021-12-19	Copenhagen	Denmark	Offline	f	1000000	8
168	Intel Extreme Masters XVI - Katowice	2022-02-15	2022-02-27	Katowice	Poland	Offline	f	1000000	24
169	ESL Pro League Season 15	2022-03-09	2022-04-10	Düsseldorf	Germany	Offline	f	823000	24
170	PGL Major Antwerp 2022	2022-05-09	2022-05-22	Antwerp	Belgium	Offline	t	1000000	24
171	Intel Extreme Masters XVII - Dallas	2022-05-30	2022-06-05	Dallas	United States	Offline	f	250000	16
172	BLAST Premier: Spring Finals 2022	2022-06-15	2022-06-19	Lisbon	Portugal	Offline	f	425000	8
173	Roobet Cup 2022	2022-06-22	2022-06-30			Online	f	250000	16
174	Intel Extreme Masters XVII - Cologne	2022-07-05	2022-07-17	Cologne	Germany	Offline	f	1000000	24
175	ESL Pro League Season 16	2022-08-31	2022-10-02	Naxxar	Malta	Offline	f	835000	24
176	Intel Extreme Masters Rio Major 2022	2022-10-31	2022-11-13	Rio de Janeiro	Brazil	Offline	t	1250000	24
177	BLAST Premier: Fall Finals 2022	2022-11-23	2022-11-27	Copenhagen	Denmark	Offline	f	425000	8
178	BLAST Premier: World Final 2022	2022-12-14	2022-12-18	Abu Dhabi	United Arab Emirates	Offline	f	1000000	8
179	Intel Extreme Masters Katowice 2023	2023-02-01	2023-02-12	Katowice	Poland	Offline	f	1000000	24
180	ESL Pro League Season 17	2023-02-22	2023-03-26	Saint Julians	Malta	Offline	f	850000	32
181	Intel Extreme Masters Rio 2023	2023-04-17	2023-04-23	Rio de Janeiro	Brazil	Offline	f	250000	16
182	BLAST.tv Paris Major 2023	2023-05-08	2023-05-21	Paris	France	Offline	t	1250000	24
183	Intel Extreme Masters Dallas 2023	2023-05-29	2023-06-04	Dallas	United States	Offline	f	250000	16
184	BLAST Premier: Spring Final 2023	2023-06-07	2023-06-11	Washington D.C.	United States	Offline	f	425000	8
\.


--
-- Data for Name: winner_runner_up; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.winner_runner_up (tournament_id, winner_id, runner_up_id) FROM stdin;
1	14	48
2	14	48
3	14	24
4	14	52
5	14	51
6	48	16
7	14	22
8	14	50
9	48	49
10	48	14
11	47	48
12	24	14
13	14	47
14	46	44
15	16	14
16	38	44
17	11	14
18	14	11
19	46	22
20	16	44
21	14	24
22	24	11
23	44	45
24	45	11
25	24	46
26	24	45
27	24	45
28	45	14
29	24	16
30	45	14
31	24	14
32	34	14
33	34	14
34	11	44
35	16	24
36	41	24
37	41	14
38	24	34
39	24	16
40	41	24
41	24	11
42	11	34
43	34	14
44	24	7
45	11	7
46	41	7
47	16	11
48	34	41
49	24	34
50	16	41
51	34	41
52	34	24
53	41	16
54	42	43
55	34	11
56	16	4
57	11	41
58	24	39
59	24	14
60	24	11
61	24	11
62	11	39
63	34	38
64	24	39
65	39	11
66	14	11
67	40	32
68	39	8
69	16	11
70	33	14
71	8	39
72	32	9
73	16	24
74	14	8
75	16	7
76	11	16
77	38	16
78	7	32
79	14	32
80	13	37
81	36	17
82	17	36
83	34	35
84	17	16
85	16	32
86	17	6
87	6	17
88	32	6
89	8	29
90	32	6
91	32	7
92	13	33
93	8	29
94	4	9
95	6	9
96	6	17
97	32	16
98	14	6
99	32	6
100	6	4
101	7	6
102	4	11
103	24	6
104	24	31
105	17	11
106	6	17
107	17	9
108	11	30
109	17	9
110	6	4
111	11	12
112	17	9
113	29	17
114	17	11
115	4	9
116	3	28
117	6	11
118	17	9
119	17	21
120	17	9
121	17	3
122	26	27
123	11	24
124	9	24
125	9	3
126	2	18
127	9	8
128	9	2
129	9	3
130	17	25
131	20	17
132	24	2
133	20	24
134	17	19
135	4	3
136	17	9
137	4	24
138	17	9
139	2	4
140	11	8
141	24	4
142	9	20
143	23	21
144	12	8
145	22	2
146	20	21
147	20	9
148	1	2
149	18	19
150	17	11
151	2	11
152	16	15
153	17	4
154	2	17
155	17	9
156	11	17
157	13	16
158	1	13
159	11	13
160	13	15
161	13	11
162	11	8
163	11	2
164	11	8
165	11	2
166	2	14
167	11	13
168	6	8
169	6	3
170	6	11
171	7	3
172	11	2
173	12	6
174	6	11
175	2	9
176	10	1
177	1	6
178	8	9
179	8	1
180	6	7
181	2	1
182	2	5
183	3	4
184	1	2
\.


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- Name: tournament tournament_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_pkey PRIMARY KEY (tournament_id);


--
-- Name: winner_runner_up winner_runner_up_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_runner_up
    ADD CONSTRAINT winner_runner_up_pkey PRIMARY KEY (tournament_id);


--
-- Name: winner_runner_up winner_runner_up_runner_up_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_runner_up
    ADD CONSTRAINT winner_runner_up_runner_up_id_fkey FOREIGN KEY (runner_up_id) REFERENCES public.team(team_id);


--
-- Name: winner_runner_up winner_runner_up_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_runner_up
    ADD CONSTRAINT winner_runner_up_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES public.tournament(tournament_id);


--
-- Name: winner_runner_up winner_runner_up_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_runner_up
    ADD CONSTRAINT winner_runner_up_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.team(team_id);


--
-- PostgreSQL database dump complete
--

