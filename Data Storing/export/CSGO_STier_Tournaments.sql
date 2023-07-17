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
    team_id character(7) NOT NULL,
    team_name character varying(50) NOT NULL,
    region character varying(30) NOT NULL,
    approx_total_winnings bigint NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: tournament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament (
    tournament_id character(7) NOT NULL,
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
    tournament_id character(7) NOT NULL,
    winner_id character(7) NOT NULL,
    runner_up_id character(7) NOT NULL
);


ALTER TABLE public.winner_runner_up OWNER TO postgres;

--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (team_id, team_name, region, approx_total_winnings) FROM stdin;
TEAM001	Heroic	Europe	3129372
TEAM002	Team Vitality	Europe	3477705
TEAM003	ENCE	Europe	1860460
TEAM004	MOUZ	Europe	4194087
TEAM005	GamerLegion	Europe	453755
TEAM006	FaZe Clan	Europe	7155597
TEAM007	Cloud9	CIS	3262876
TEAM008	G2 Esports	Europe	4521259
TEAM009	Team Liquid	Europe	5878569
TEAM010	Outsiders	CIS	718750
TEAM011	Natus Vincere	Europe	9522791
TEAM012	BIG	Europe	1900308
TEAM013	Gambit Esports	CIS	3258151
TEAM014	Ninjas in Pyjamas	Europe	3867447
TEAM015	OG	Europe	1092892
TEAM016	Virtus.pro	CIS	4784062
TEAM017	Astralis	Europe	9681684
TEAM018	FURIA Esports	North America	1618275
TEAM019	100 Thieves	North America	191600
TEAM020	Evil Geniuses	North America	1270735
TEAM021	MIBR	North America	2071519
TEAM022	Complexity Gaming	North America	1814188
TEAM023	MAD Lions	Europe	728688
TEAM024	Fnatic	Europe	5988784
TEAM025	AVANGAR	CIS	772045
TEAM026	Windigo Gaming	Europe	775118
TEAM027	AGO esports	Europe	818331
TEAM028	Vega Squadron	CIS	306811
TEAM029	North	Europe	1150000
TEAM030	NRG Esports	North America	1145675
TEAM031	Space Soldiers	Europe	757282
TEAM032	SK Gaming	North America	3696729
TEAM033	Immortals	North America	571425
TEAM034	Team Envy	North America	2156631
TEAM035	devils.one	Europe	861019
TEAM036	OpTic Gaming	Europe	1353650
TEAM037	Renegades	Oceania	1070183
TEAM038	Dignitas	Europe	1049036
TEAM039	Luminosity Gaming	North America	1426082
TEAM040	Tempo Storm	Europe	155860
TEAM041	Team SoloMid	North America	613710
TEAM042	Team France	Europe	79850
TEAM043	Team Poland	Europe	57804
TEAM044	Titan	Europe	190544
TEAM045	Team LDLC	Europe	604207
TEAM046	iBUYPOWER	North America	0
TEAM047	Clan-Mystik	Europe	35622
TEAM048	VeryGames	Europe	279552
TEAM049	Astana Dragons	CIS	37697
TEAM050	Lemondogs	Europe	60559
TEAM051	Epsilon Esports	Europe	483160
TEAM052	Quantic Gaming	North America	7962
\.


--
-- Data for Name: tournament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament (tournament_id, tournament_name, start_date, end_date, city, country, type_of_tournament, is_major, prize_pool, number_of_teams) FROM stdin;
TOUR001	ESWC 2012	2012-10-31	2012-11-04	Paris	France	Offline	f	22000	10
TOUR002	DreamHack Winter 2012	2012-11-22	2012-11-24	Jönköping	Sweden	Offline	f	45275.16	16
TOUR003	ESL Major Series One - Spring 2013	2013-03-19	2013-04-14	Cologne	Germany	Online/Offline	f	35000	16
TOUR004	ESEA Global Finals Season 13	2013-04-19	2013-04-21	Dallas	United States	Offline	f	39500	8
TOUR005	DreamHack Summer 2013	2013-06-15	2013-06-18	Jönköping	Sweden	Offline	f	30901.45	16
TOUR006	ESL Major Series One - Summer 2013	2013-05-14	2013-06-30	Cologne	Germany	Online/Offline	f	35000	16
TOUR007	ESEA Global Finals Season 14	2013-05-27	2013-08-18	Dallas	United States	Offline	f	39500	6
TOUR008	DreamHack Bucharest 2013	2013-09-14	2013-09-15	Bucharest	Romania	Offline	f	15000	16
TOUR009	StarLadder StarSeries VII	2013-10-10	2013-10-13	Kyiv	Ukraine	Offline	f	15000	4
TOUR010	ESL Major Series One - Fall 2013	2013-10-01	2013-10-27	Cologne	Germany	Online/Offline	f	35000	16
TOUR011	Electronic Sports World Cup 2013	2013-10-30	2013-11-03	Paris	France	Offline	f	25000	16
TOUR012	DreamHack Winter 2013	2013-11-28	2013-11-30	Jönköping	Sweden	Offline	t	250000	16
TOUR013	Fragbite Masters Season 1	2013-12-12	2013-12-13			Online	f	21304.9	8
TOUR014	ESEA Global Finals Season 15	2014-01-17	2014-01-19	Dallas	United States	Offline	f	39500	6
TOUR015	ESL Major Series One Katowice 2014	2014-03-13	2014-03-16	Katowice	Poland	Offline	t	250000	16
TOUR016	Fragbite Masters Season 2	2014-03-01	2014-04-01			Online	f	25408.2	16
TOUR017	StarLadder StarSeries IX	2014-05-02	2014-05-04	Kyiv	Ukraine	Offline	f	30000	4
TOUR018	DreamHack Summer 2014	2014-06-14	2014-06-17	Jönköping	Sweden	Offline	f	30000	16
TOUR019	ESEA Season 16 - Global Invite Division	2014-06-27	2014-06-29	Dallas	United States	Offline	f	47500	8
TOUR020	Gfinity G3	2014-08-02	2014-08-03	London	United Kingdom	Offline	f	45000	12
TOUR021	ESL One: Cologne 2014	2014-08-14	2014-08-17	Cologne	Germany	Offline	t	250000	16
TOUR022	StarLadder StarSeries X	2014-08-30	2014-08-31	Kyiv	Ukraine	Offline	f	30000	4
TOUR023	DreamHack Invitational II	2014-09-25	2014-09-26	Stockholm	Sweden	Offline	f	30000	8
TOUR024	StarLadder StarSeries XI	2014-09-12	2014-10-19	Kyiv	Ukraine	Online/Offline	f	35000	16
TOUR025	FACEIT League - Season 2	2014-09-03	2014-10-26	Milan	Italy	Offline	f	50000	14
TOUR026	ESWC 2014	2014-10-29	2014-11-02	Paris	France	Offline	f	60000	24
TOUR027	Fragbite Masters Season 3	2014-10-01	2014-11-09	Stockholm	Sweden	Online/Offline	f	43851.9	16
TOUR028	DreamHack Winter 2014	2014-11-27	2014-11-29	Jönköping	Sweden	Offline	t	250000	16
TOUR029	ESEA Season 17 - Global Invite Division	2014-12-05	2014-12-07	Dallas	United States	Offline	f	47500	8
TOUR030	MLG X Games Aspen Invitational	2015-01-23	2015-01-25	Aspen	United States	Offline	f	50000	8
TOUR031	ESL One: Katowice 2015	2015-03-12	2015-03-15	Katowice	Poland	Offline	t	250000	16
TOUR032	Gfinity Spring Masters 1	2015-03-20	2015-03-22	London	United Kingdom	Offline	f	50000	8
TOUR033	StarLadder StarSeries XII	2015-01-13	2015-03-29	Kyiv	Ukraine	Online/Offline	f	50000	16
TOUR034	ESL Pro League Winter 2014/15	2015-04-10	2015-04-12	Cologne	Germany	Offline	f	48000	8
TOUR035	ESEA Season 18: Global Invite Division	2015-04-17	2015-04-19	Dallas	United States	Offline	f	144000	8
TOUR036	PGL CS:GO Championship Series Kick-Off Season	2015-04-24	2015-04-26	Bucharest	Romania	Offline	f	75000	4
TOUR037	FACEIT League 2015 Stage I Finals	2015-05-01	2015-05-03	London	United Kingdom	Offline	f	85000	8
TOUR038	DreamHack Open Tours 2015	2015-05-08	2015-05-10	Tours	France	Offline	f	40000	8
TOUR039	Gfinity Spring Masters 2	2015-05-15	2015-05-17	London	United Kingdom	Offline	f	50000	10
TOUR040	Fragbite Masters Season 4	2015-06-06	2015-06-07	Stockholm	Sweden	Offline	f	62494.43	4
TOUR041	DreamHack Open Summer 2015	2015-06-13	2015-06-15	Jönköping	Sweden	Offline	f	40000	8
TOUR042	StarLadder StarSeries XIII	2015-05-18	2015-06-21	Kyiv	Ukraine	Online/Offline	f	50000	16
TOUR043	Gfinity Masters Summer 1	2015-06-26	2015-06-28	London	United Kingdom	Offline	f	80000	8
TOUR044	ESL ESEA Pro League Season 1 - Finals	2015-07-02	2015-07-05	Cologne	Germany	Offline	f	250000	8
TOUR045	Electronic Sports World Cup 2015	2015-07-10	2015-07-12	Montreal	Canada	Offline	f	75000	16
TOUR046	FACEIT 2015 Stage 2 Finals	2015-07-16	2015-07-18	Valencia	Spain	Offline	f	100000	8
TOUR047	CEVO Season 7 Professional	2015-07-24	2015-07-26	Columbus	United States	Offline	f	75000	8
TOUR048	Intel Extreme Masters Season X - gamescom	2015-08-05	2015-08-08	Cologne	Germany	Offline	f	80500	6
TOUR049	ESL One: Cologne 2015	2015-08-20	2015-08-23	Cologne	Germany	Offline	t	250000	16
TOUR050	ESL ESEA Pro League Invitational	2015-09-10	2015-09-12	Dubai	United Arab Emirates	Offline	f	250000	8
TOUR051	DreamHack Open London 2015	2015-09-19	2015-09-20	London	United Kingdom	Offline	f	40000	8
TOUR052	Gfinity Champion of Champions	2015-09-26	2015-09-27	Birmingham	United Kingdom	Offline	f	100000	4
TOUR053	PGL CS:GO Championship Series Season 1	2015-10-02	2015-10-04	Bucharest	Romania	Offline	f	75000	4
TOUR054	The World Championships 2015	2015-10-08	2015-10-11	Belgrade	Serbia	Online/Offline	f	100000	16
TOUR055	DreamHack Open Cluj⁠-⁠Napoca 2015	2015-10-28	2015-11-01	Cluj-Napoca	Romania	Offline	t	250000	16
TOUR056	CEVO Season 8 Professional	2015-08-16	2015-11-08	Columbus	United States	Offline	f	100000	24
TOUR057	Intel Extreme Masters X - San Jose	2015-11-21	2015-11-22	San Jose	United States	Offline	f	125000	8
TOUR058	FACEIT League 2015 Stage 3 Finals	2015-11-26	2015-11-29	Jönköping	Sweden	Offline	f	250000	8
TOUR059	Fragbite Masters Season 5	2015-12-04	2015-12-06	Stockholm	Sweden	Offline	f	58852	4
TOUR060	ESL ESEA Pro League Season 2 - Finals	2015-12-10	2015-12-13	Burbank	United States	Offline	f	250000	8
TOUR061	StarLadder i-League StarSeries XIV	2016-01-13	2016-01-17	Minsk	Belarus	Offline	f	200000	8
TOUR062	DreamHack Open Leipzig 2016	2016-01-22	2016-01-24	Leipzig	Germany	Offline	f	100000	8
TOUR063	Global eSports Cup - Season 1	2016-02-04	2016-02-07	Vilnius	Lithuania	Offline	f	200000	8
TOUR064	Intel Extreme Masters X - World Championship	2016-03-02	2016-03-05	Katowice	Poland	Offline	f	250000	12
TOUR065	MLG Major Championship: Columbus 2016	2016-03-29	2016-04-03	Columbus	United States	Offline	t	1000000	16
TOUR066	DreamHack Masters Malmö 2016	2016-04-12	2016-04-17	Malmö	Sweden	Offline	f	250000	16
TOUR067	CEVO Pro League Season 9	2016-04-28	2016-05-01	London	United Kingdom	Offline	f	125000	8
TOUR068	ESL Pro League Season 3 - Finals	2016-05-11	2016-05-15	LeicesterLondon	United Kingdom	Offline	f	512000	8
TOUR069	StarLadder i-League Invitational #1	2016-05-19	2016-05-22	Kyiv	Ukraine	Offline	f	100000	8
TOUR070	DreamHack Open Summer 2016	2016-06-18	2016-06-21	Jönköping	Sweden	Offline	f	100000	8
TOUR071	Esports Championship Series Season 1 - Finals	2016-06-24	2016-06-26	London	United Kingdom	Offline	f	765000	8
TOUR072	ESL One: Cologne 2016	2016-07-05	2016-07-10	Cologne	Germany	Offline	t	1000000	16
TOUR073	ELEAGUE Season 1	2016-05-24	2016-07-30	Atlanta	United States	Offline	f	1400000	24
TOUR074	StarLadder i-League StarSeries Season 2	2016-09-07	2016-09-11	Kyiv	Ukraine	Offline	f	300000	16
TOUR075	DreamHack Open Bucharest 2016	2016-09-16	2016-09-18	Bucharest	Romania	Offline	f	100000	8
TOUR076	ESL One: New York 2016	2016-09-30	2016-10-02	New York City	United States	Offline	f	250000	8
TOUR077	EPICENTER 2016	2016-10-17	2016-10-23	Moscow	Russia	Offline	f	490000	8
TOUR078	ESL Pro League Season 4 - Finals	2016-10-26	2016-10-30	São Paulo	Brazil	Offline	f	600000	12
TOUR079	Intel Extreme Masters XI - Oakland	2016-11-16	2016-11-20	Oakland	United States	Offline	f	300000	12
TOUR080	DreamHack Open Winter 2016	2016-11-24	2016-11-26	Jönköping	Sweden	Offline	f	100000	8
TOUR081	ELEAGUE Season 2	2016-10-21	2016-12-03	Atlanta	United States	Offline	f	1100000	16
TOUR082	Esports Championship Series Season 2 - Finals	2016-12-09	2016-12-11	Anaheim	United States	Offline	f	660000	8
TOUR083	World Electronic Sports Games 2016	2017-01-12	2017-01-15	Changzhou	China	Offline	f	1500000	23
TOUR084	ELEAGUE Major Atlanta 2017	2017-01-22	2017-01-29	Atlanta	United States	Offline	t	1000000	16
TOUR085	DreamHack Masters Las Vegas 2017	2017-02-15	2017-02-19	Las Vegas	United States	Offline	f	450000	16
TOUR086	Intel Extreme Masters XI - World Championship	2017-03-01	2017-03-05	Katowice	Poland	Offline	f	250000	12
TOUR087	StarLadder i-League StarSeries Season 3	2017-04-04	2017-04-09	Kyiv	Ukraine	Offline	f	300000	16
TOUR088	Intel Extreme Masters XII - Sydney	2017-05-03	2017-05-07	Sydney	Australia	Offline	f	200000	8
TOUR089	ESL Pro League Season 5 - Finals	2017-05-30	2017-06-04	Dallas	United States	Offline	f	750000	12
TOUR090	Esports Championship Series Season 3 - Finals	2017-06-23	2017-06-25	London	United Kingdom	Offline	f	660000	8
TOUR091	ESL One: Cologne 2017	2017-07-04	2017-07-09	Cologne	Germany	Offline	f	250000	16
TOUR092	PGL Major Kraków 2017	2017-07-16	2017-07-23	Kraków	Poland	Offline	t	1000000	16
TOUR093	DreamHack Masters Malmö 2017	2017-08-30	2017-09-03	Malmö	Sweden	Offline	f	250000	16
TOUR094	ESG Tour Mykonos 2017	2017-09-07	2017-09-10	Mykonos	Greece	Offline	f	240561.53	8
TOUR095	ESL One: New York 2017	2017-09-15	2017-09-17	New York City	United States	Offline	f	250000	8
TOUR096	ELEAGUE CS:GO Premier 2017	2017-09-08	2017-10-13	Atlanta	United States	Offline	f	1000000	16
TOUR097	EPICENTER 2017	2017-10-24	2017-10-29	St. Petersburg	Russia	Offline	f	490000	8
TOUR098	Intel Extreme Masters XII - Oakland	2017-11-14	2017-11-19	BurbankOakland	United States	Offline	f	300000	12
TOUR099	ESL Pro League Season 6 - Finals	2017-12-05	2017-12-10	Odense	Denmark	Offline	f	750000	12
TOUR100	Esports Championship Series Season 4 - Finals	2017-12-15	2017-12-17	Cancun	Mexico	Offline	f	660000	8
TOUR101	ELEAGUE Major Boston 2018	2018-01-12	2018-01-28	AtlantaBoston	United States	Offline	t	1000000	23
TOUR102	StarLadder & i-League StarSeries Season 4	2018-02-17	2018-02-25	Kyiv	Ukraine	Offline	f	300000	16
TOUR103	Intel Extreme Masters XII - World Championship	2018-02-27	2018-03-04	Katowice	Poland	Offline	f	500000	16
TOUR104	World Electronic Sports Games 2017	2018-03-13	2018-03-18	Haikou	China	Offline	f	1500000	27
TOUR105	DreamHack Masters Marseille 2018	2018-04-18	2018-04-22	Marseille	France	Offline	f	250000	16
TOUR106	Intel Extreme Masters XIII - Sydney	2018-05-01	2018-05-06	Sydney	Australia	Offline	f	250000	16
TOUR107	ESL Pro League Season 7 - Finals	2018-05-15	2018-05-20	Dallas	United States	Offline	f	750000	16
TOUR108	StarSeries & i-League CS:GO Season 5	2018-05-28	2018-06-03	Kyiv	Ukraine	Offline	f	300000	16
TOUR109	Esports Championship Series Season 5 - Finals	2018-06-08	2018-06-10	London	United Kingdom	Offline	f	660000	8
TOUR110	ESL One: Belo Horizonte 2018	2018-06-13	2018-06-17	Belo Horizonte	Brazil	Offline	f	200000	8
TOUR111	ESL One: Cologne 2018	2018-07-03	2018-07-08	Cologne	Germany	Offline	f	300000	16
TOUR112	ELEAGUE CS:GO Premier 2018	2018-07-21	2018-07-29	Atlanta	United States	Offline	f	1000000	8
TOUR113	DreamHack Masters Stockholm 2018	2018-08-29	2018-09-02	Stockholm	Sweden	Offline	f	250000	16
TOUR114	FACEIT Major: London 2018	2018-09-05	2018-09-23	London	United Kingdom	Offline	t	1000000	24
TOUR115	ESL One: New York 2018	2018-09-26	2018-09-30	New York City	United States	Offline	f	250000	8
TOUR116	StarSeries & i-League CS:GO Season 6	2018-10-07	2018-10-14	Kyiv	Ukraine	Offline	f	300000	16
TOUR117	EPICENTER 2018	2018-10-23	2018-10-28	Moscow	Russia	Offline	f	295000	8
TOUR118	Intel Extreme Masters XIII - Chicago	2018-11-06	2018-11-11	Chicago	United States	Offline	f	250000	16
TOUR119	Esports Championship Series Season 6 - Finals	2018-11-22	2018-11-25	Arlington	United States	Offline	f	660000	8
TOUR120	ESL Pro League Season 8 - Finals	2018-12-04	2018-12-09	Odense	Denmark	Offline	f	750000	16
TOUR121	Intel Extreme Masters XIII - Katowice Major 2019	2019-02-13	2019-03-03	Katowice	Poland	Offline	t	1000000	24
TOUR122	World Electronic Sports Games 2018	2019-03-11	2019-03-17	Chongqing	China	Offline	f	890000	27
TOUR123	StarSeries & i-League CS:GO Season 7	2019-03-30	2019-04-07	Shanghai	China	Offline	f	500000	16
TOUR124	Intel Extreme Masters XIV - Sydney	2019-04-29	2019-05-05	Sydney	Australia	Offline	f	250000	16
TOUR125	DreamHack Masters Dallas 2019	2019-05-28	2019-06-02	Dallas	United States	Offline	f	250000	16
TOUR126	Esports Championship Series Season 7 - Finals	2019-06-06	2019-06-09	London	United Kingdom	Offline	f	500000	8
TOUR127	ESL Pro League Season 9 - Finals	2019-06-18	2019-06-23	Montpellier	France	Offline	f	600000	16
TOUR128	ESL One: Cologne 2019	2019-07-02	2019-07-07	Cologne	Germany	Offline	f	300000	16
TOUR129	Intel Extreme Masters XIV - Chicago	2019-07-18	2019-07-21	Chicago	United States	Offline	f	250000	8
TOUR130	StarLadder Berlin Major 2019	2019-08-23	2019-09-08	Berlin	Germany	Offline	t	1000000	24
TOUR131	ESL One: New York 2019	2019-09-26	2019-09-29	New York City	United States	Offline	f	200000	8
TOUR132	DreamHack Masters Malmö 2019	2019-10-01	2019-10-06	Malmö	Sweden	Offline	f	250000	16
TOUR133	StarSeries & i-League CS:GO Season 8	2019-10-21	2019-10-27	Belek	Turkey	Offline	f	500000	16
TOUR134	Intel Extreme Masters XIV - Beijing	2019-11-07	2019-11-10	Beijing-Haidian	China	Offline	f	250000	8
TOUR135	CS:GO Asia Championships 2019	2019-11-20	2019-11-24	Shanghai	China	Offline	f	500000	8
TOUR136	Esports Championship Series Season 8 - Finals	2019-11-28	2019-12-01	Arlington	United States	Offline	f	500000	8
TOUR137	ESL Pro League Season 10 - Finals	2019-12-03	2019-12-08	Odense	Denmark	Offline	f	600000	16
TOUR138	BLAST Pro Series: Global Final 2019	2019-12-12	2019-12-14	Riffa	Bahrain	Offline	f	500000	4
TOUR139	EPICENTER 2019	2019-12-17	2019-12-22	Moscow	Russia	Offline	f	500000	8
TOUR140	Intel Extreme Masters XIV - World Championship	2020-02-24	2020-03-01	Katowice	Poland	Offline	f	500000	16
TOUR141	ESL Pro League Season 11: Europe	2020-03-16	2020-04-12			Online	f	531000	18
TOUR142	ESL Pro League Season 11: North America	2020-03-26	2020-04-12			Online	f	219000	6
TOUR143	Flashpoint Season 1	2020-03-13	2020-04-19	Los Angeles	United States	Offline/Online	f	1000000	12
TOUR144	DreamHack Masters Spring 2020: Europe	2020-05-19	2020-06-14			Online	f	160000	16
TOUR145	BLAST Premier: Spring 2020 European Finals	2020-06-15	2020-06-21			Online	f	500000	8
TOUR146	BLAST Premier: Spring 2020 American Finals	2020-06-16	2020-06-21			Online	f	250000	4
TOUR147	ESL One: Cologne 2020 Online - North America	2020-08-18	2020-08-29			Online	f	135000	8
TOUR148	ESL One: Cologne 2020 Online - Europe	2020-08-18	2020-08-30			Online	f	325000	16
TOUR149	ESL Pro League Season 12: North America	2020-09-01	2020-09-27			Online	f	225000	8
TOUR150	ESL Pro League Season 12: Europe	2020-09-01	2020-10-04			Online	f	450000	16
TOUR151	Intel Extreme Masters XV - Beijing Online: Europe	2020-11-06	2020-11-22			Online	f	150000	16
TOUR152	Flashpoint Season 2	2020-11-10	2020-12-06			Online	f	1000000	12
TOUR153	DreamHack Masters Winter 2020: Europe	2020-11-30	2020-12-06			Online	f	150000	16
TOUR154	BLAST Premier: Fall 2020	2020-12-08	2020-12-13			Online	f	425000	8
TOUR155	Intel Extreme Masters XV - Global Challenge	2020-12-15	2020-12-20			Online	f	500000	8
TOUR156	BLAST Premier: Global Final 2020	2021-01-19	2021-01-24			Online	f	1000000	8
TOUR157	Intel Extreme Masters XV - World Championship	2021-02-16	2021-02-28			Online	f	1000000	24
TOUR158	ESL Pro League Season 13	2021-03-08	2021-04-11			Online	f	750000	24
TOUR159	DreamHack Masters Spring 2021	2021-04-29	2021-05-09			Online	f	250000	16
TOUR160	Intel Extreme Masters XVI - Summer	2021-06-03	2021-06-13			Online	f	250000	16
TOUR161	BLAST Premier: Spring Finals 2021	2021-06-15	2021-06-20			Online	f	425000	8
TOUR162	Intel Extreme Masters XVI - Cologne	2021-07-06	2021-07-18	Cologne	Germany	Offline	f	1000000	24
TOUR163	ESL Pro League Season 14	2021-08-16	2021-09-12			Online	f	750000	24
TOUR164	PGL Major Stockholm 2021	2021-10-26	2021-11-07	Stockholm	Sweden	Offline	t	2000000	24
TOUR165	BLAST Premier: Fall Finals 2021	2021-11-24	2021-11-28	Copenhagen	Denmark	Offline	f	425000	8
TOUR166	Intel Extreme Masters XVI - Winter	2021-12-02	2021-12-12	Stockholm	Sweden	Offline	f	250000	16
TOUR167	BLAST Premier: World Final 2021	2021-12-14	2021-12-19	Copenhagen	Denmark	Offline	f	1000000	8
TOUR168	Intel Extreme Masters XVI - Katowice	2022-02-15	2022-02-27	Katowice	Poland	Offline	f	1000000	24
TOUR169	ESL Pro League Season 15	2022-03-09	2022-04-10	Düsseldorf	Germany	Offline	f	823000	24
TOUR170	PGL Major Antwerp 2022	2022-05-09	2022-05-22	Antwerp	Belgium	Offline	t	1000000	24
TOUR171	Intel Extreme Masters XVII - Dallas	2022-05-30	2022-06-05	Dallas	United States	Offline	f	250000	16
TOUR172	BLAST Premier: Spring Finals 2022	2022-06-15	2022-06-19	Lisbon	Portugal	Offline	f	425000	8
TOUR173	Roobet Cup 2022	2022-06-22	2022-06-30			Online	f	250000	16
TOUR174	Intel Extreme Masters XVII - Cologne	2022-07-05	2022-07-17	Cologne	Germany	Offline	f	1000000	24
TOUR175	ESL Pro League Season 16	2022-08-31	2022-10-02	Naxxar	Malta	Offline	f	835000	24
TOUR176	Intel Extreme Masters Rio Major 2022	2022-10-31	2022-11-13	Rio de Janeiro	Brazil	Offline	t	1250000	24
TOUR177	BLAST Premier: Fall Finals 2022	2022-11-23	2022-11-27	Copenhagen	Denmark	Offline	f	425000	8
TOUR178	BLAST Premier: World Final 2022	2022-12-14	2022-12-18	Abu Dhabi	United Arab Emirates	Offline	f	1000000	8
TOUR179	Intel Extreme Masters Katowice 2023	2023-02-01	2023-02-12	Katowice	Poland	Offline	f	1000000	24
TOUR180	ESL Pro League Season 17	2023-02-22	2023-03-26	Saint Julians	Malta	Offline	f	850000	32
TOUR181	Intel Extreme Masters Rio 2023	2023-04-17	2023-04-23	Rio de Janeiro	Brazil	Offline	f	250000	16
TOUR182	BLAST.tv Paris Major 2023	2023-05-08	2023-05-21	Paris	France	Offline	t	1250000	24
TOUR183	Intel Extreme Masters Dallas 2023	2023-05-29	2023-06-04	Dallas	United States	Offline	f	250000	16
TOUR184	BLAST Premier: Spring Final 2023	2023-06-07	2023-06-11	Washington D.C.	United States	Offline	f	425000	8
\.


--
-- Data for Name: winner_runner_up; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.winner_runner_up (tournament_id, winner_id, runner_up_id) FROM stdin;
TOUR001	TEAM014	TEAM048
TOUR002	TEAM014	TEAM048
TOUR003	TEAM014	TEAM024
TOUR004	TEAM014	TEAM052
TOUR005	TEAM014	TEAM051
TOUR006	TEAM048	TEAM016
TOUR007	TEAM014	TEAM022
TOUR008	TEAM014	TEAM050
TOUR009	TEAM048	TEAM049
TOUR010	TEAM048	TEAM014
TOUR011	TEAM047	TEAM048
TOUR012	TEAM024	TEAM014
TOUR013	TEAM014	TEAM047
TOUR014	TEAM046	TEAM044
TOUR015	TEAM016	TEAM014
TOUR016	TEAM038	TEAM044
TOUR017	TEAM011	TEAM014
TOUR018	TEAM014	TEAM011
TOUR019	TEAM046	TEAM022
TOUR020	TEAM016	TEAM044
TOUR021	TEAM014	TEAM024
TOUR022	TEAM024	TEAM011
TOUR023	TEAM044	TEAM045
TOUR024	TEAM045	TEAM011
TOUR025	TEAM024	TEAM046
TOUR026	TEAM024	TEAM045
TOUR027	TEAM024	TEAM045
TOUR028	TEAM045	TEAM014
TOUR029	TEAM024	TEAM016
TOUR030	TEAM045	TEAM014
TOUR031	TEAM024	TEAM014
TOUR032	TEAM034	TEAM014
TOUR033	TEAM034	TEAM014
TOUR034	TEAM011	TEAM044
TOUR035	TEAM016	TEAM024
TOUR036	TEAM041	TEAM024
TOUR037	TEAM041	TEAM014
TOUR038	TEAM024	TEAM034
TOUR039	TEAM024	TEAM016
TOUR040	TEAM041	TEAM024
TOUR041	TEAM024	TEAM011
TOUR042	TEAM011	TEAM034
TOUR043	TEAM034	TEAM014
TOUR044	TEAM024	TEAM007
TOUR045	TEAM011	TEAM007
TOUR046	TEAM041	TEAM007
TOUR047	TEAM016	TEAM011
TOUR048	TEAM034	TEAM041
TOUR049	TEAM024	TEAM034
TOUR050	TEAM016	TEAM041
TOUR051	TEAM034	TEAM041
TOUR052	TEAM034	TEAM024
TOUR053	TEAM041	TEAM016
TOUR054	TEAM042	TEAM043
TOUR055	TEAM034	TEAM011
TOUR056	TEAM016	TEAM004
TOUR057	TEAM011	TEAM041
TOUR058	TEAM024	TEAM039
TOUR059	TEAM024	TEAM014
TOUR060	TEAM024	TEAM011
TOUR061	TEAM024	TEAM011
TOUR062	TEAM011	TEAM039
TOUR063	TEAM034	TEAM038
TOUR064	TEAM024	TEAM039
TOUR065	TEAM039	TEAM011
TOUR066	TEAM014	TEAM011
TOUR067	TEAM040	TEAM032
TOUR068	TEAM039	TEAM008
TOUR069	TEAM016	TEAM011
TOUR070	TEAM033	TEAM014
TOUR071	TEAM008	TEAM039
TOUR072	TEAM032	TEAM009
TOUR073	TEAM016	TEAM024
TOUR074	TEAM014	TEAM008
TOUR075	TEAM016	TEAM007
TOUR076	TEAM011	TEAM016
TOUR077	TEAM038	TEAM016
TOUR078	TEAM007	TEAM032
TOUR079	TEAM014	TEAM032
TOUR080	TEAM013	TEAM037
TOUR081	TEAM036	TEAM017
TOUR082	TEAM017	TEAM036
TOUR083	TEAM034	TEAM035
TOUR084	TEAM017	TEAM016
TOUR085	TEAM016	TEAM032
TOUR086	TEAM017	TEAM006
TOUR087	TEAM006	TEAM017
TOUR088	TEAM032	TEAM006
TOUR089	TEAM008	TEAM029
TOUR090	TEAM032	TEAM006
TOUR091	TEAM032	TEAM007
TOUR092	TEAM013	TEAM033
TOUR093	TEAM008	TEAM029
TOUR094	TEAM004	TEAM009
TOUR095	TEAM006	TEAM009
TOUR096	TEAM006	TEAM017
TOUR097	TEAM032	TEAM016
TOUR098	TEAM014	TEAM006
TOUR099	TEAM032	TEAM006
TOUR100	TEAM006	TEAM004
TOUR101	TEAM007	TEAM006
TOUR102	TEAM004	TEAM011
TOUR103	TEAM024	TEAM006
TOUR104	TEAM024	TEAM031
TOUR105	TEAM017	TEAM011
TOUR106	TEAM006	TEAM017
TOUR107	TEAM017	TEAM009
TOUR108	TEAM011	TEAM030
TOUR109	TEAM017	TEAM009
TOUR110	TEAM006	TEAM004
TOUR111	TEAM011	TEAM012
TOUR112	TEAM017	TEAM009
TOUR113	TEAM029	TEAM017
TOUR114	TEAM017	TEAM011
TOUR115	TEAM004	TEAM009
TOUR116	TEAM003	TEAM028
TOUR117	TEAM006	TEAM011
TOUR118	TEAM017	TEAM009
TOUR119	TEAM017	TEAM021
TOUR120	TEAM017	TEAM009
TOUR121	TEAM017	TEAM003
TOUR122	TEAM026	TEAM027
TOUR123	TEAM011	TEAM024
TOUR124	TEAM009	TEAM024
TOUR125	TEAM009	TEAM003
TOUR126	TEAM002	TEAM018
TOUR127	TEAM009	TEAM008
TOUR128	TEAM009	TEAM002
TOUR129	TEAM009	TEAM003
TOUR130	TEAM017	TEAM025
TOUR131	TEAM020	TEAM017
TOUR132	TEAM024	TEAM002
TOUR133	TEAM020	TEAM024
TOUR134	TEAM017	TEAM019
TOUR135	TEAM004	TEAM003
TOUR136	TEAM017	TEAM009
TOUR137	TEAM004	TEAM024
TOUR138	TEAM017	TEAM009
TOUR139	TEAM002	TEAM004
TOUR140	TEAM011	TEAM008
TOUR141	TEAM024	TEAM004
TOUR142	TEAM009	TEAM020
TOUR143	TEAM023	TEAM021
TOUR144	TEAM012	TEAM008
TOUR145	TEAM022	TEAM002
TOUR146	TEAM020	TEAM021
TOUR147	TEAM020	TEAM009
TOUR148	TEAM001	TEAM002
TOUR149	TEAM018	TEAM019
TOUR150	TEAM017	TEAM011
TOUR151	TEAM002	TEAM011
TOUR152	TEAM016	TEAM015
TOUR153	TEAM017	TEAM004
TOUR154	TEAM002	TEAM017
TOUR155	TEAM017	TEAM009
TOUR156	TEAM011	TEAM017
TOUR157	TEAM013	TEAM016
TOUR158	TEAM001	TEAM013
TOUR159	TEAM011	TEAM013
TOUR160	TEAM013	TEAM015
TOUR161	TEAM013	TEAM011
TOUR162	TEAM011	TEAM008
TOUR163	TEAM011	TEAM002
TOUR164	TEAM011	TEAM008
TOUR165	TEAM011	TEAM002
TOUR166	TEAM002	TEAM014
TOUR167	TEAM011	TEAM013
TOUR168	TEAM006	TEAM008
TOUR169	TEAM006	TEAM003
TOUR170	TEAM006	TEAM011
TOUR171	TEAM007	TEAM003
TOUR172	TEAM011	TEAM002
TOUR173	TEAM012	TEAM006
TOUR174	TEAM006	TEAM011
TOUR175	TEAM002	TEAM009
TOUR176	TEAM010	TEAM001
TOUR177	TEAM001	TEAM006
TOUR178	TEAM008	TEAM009
TOUR179	TEAM008	TEAM001
TOUR180	TEAM006	TEAM007
TOUR181	TEAM002	TEAM001
TOUR182	TEAM002	TEAM005
TOUR183	TEAM003	TEAM004
TOUR184	TEAM001	TEAM002
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
-- Name: winner_runner_up winner_runner_up_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_runner_up
    ADD CONSTRAINT winner_runner_up_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.team(team_id);


--
-- PostgreSQL database dump complete
--

