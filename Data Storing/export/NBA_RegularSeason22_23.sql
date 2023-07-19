--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: check_team_per_day(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_team_per_day() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM team_matches
        WHERE matchdate = NEW.matchdate AND (team1 = NEW.team1 OR team2 = NEW.team1)
    ) THEN
        RAISE EXCEPTION 'Team % cannot play more than once in a day.', NEW.team1;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM team_matches
        WHERE matchdate = NEW.matchdate AND (team1 = NEW.team2 OR team2 = NEW.team2)
    ) THEN
        RAISE EXCEPTION 'Team % cannot play more than once in a day.', NEW.team2;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_team_per_day() OWNER TO postgres;

--
-- Name: player_bio_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_bio_player_id_seq
    START WITH 540
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_bio_player_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player_bio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_bio (
    playerid integer DEFAULT nextval('public.player_bio_player_id_seq'::regclass) NOT NULL,
    playername character varying(24) NOT NULL,
    "position" character varying(14) NOT NULL,
    playerheight numeric(6,2),
    playerweight integer,
    birthdate date NOT NULL,
    experience character varying(11),
    birth_city character varying(17),
    birth_state character varying(28),
    CONSTRAINT height_constraint CHECK ((playerheight > (0)::numeric)),
    CONSTRAINT player_bio_birthdate_check CHECK ((birthdate < '2003-11-19'::date)),
    CONSTRAINT position_constraint CHECK ((("position")::text = ANY ((ARRAY['Forward'::character varying, 'Power Forward'::character varying, 'Small Forward'::character varying, 'Guard'::character varying, 'Point Guard'::character varying, 'Shooting Guard'::character varying, 'Center'::character varying])::text[]))),
    CONSTRAINT weight_constraint CHECK ((playerweight > 0))
);


ALTER TABLE public.player_bio OWNER TO postgres;

--
-- Name: player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_stats (
    playerid integer NOT NULL,
    team character varying(22) NOT NULL,
    gp integer NOT NULL,
    gs integer NOT NULL,
    min numeric(4,1) NOT NULL,
    pts numeric(4,1) NOT NULL,
    offreb numeric(3,1) NOT NULL,
    defreb numeric(3,1) NOT NULL,
    ast numeric(4,1) NOT NULL,
    stl numeric(3,1) NOT NULL,
    blk numeric(3,1) NOT NULL,
    turnover numeric(3,1) NOT NULL,
    pf numeric(3,1) NOT NULL,
    CONSTRAINT ast_constraint CHECK ((ast >= (0)::numeric)),
    CONSTRAINT blk_constraint CHECK ((blk >= (0)::numeric)),
    CONSTRAINT defreb_constraint CHECK ((defreb >= (0)::numeric)),
    CONSTRAINT gp_constraint CHECK ((gp >= 0)),
    CONSTRAINT gs_constraint CHECK (((gs >= 0) AND (gs <= gp))),
    CONSTRAINT min_constraint CHECK (((min >= (0)::numeric) AND (min <= (60)::numeric))),
    CONSTRAINT or_constraint CHECK ((offreb >= (0)::numeric)),
    CONSTRAINT pf_constraint CHECK ((pf >= (0)::numeric)),
    CONSTRAINT pts_constraint CHECK ((pts >= (0)::numeric)),
    CONSTRAINT stl_constraint CHECK ((stl >= (0)::numeric)),
    CONSTRAINT turnover_constraint CHECK ((turnover >= (0)::numeric))
);


ALTER TABLE public.player_stats OWNER TO postgres;

--
-- Name: team_matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_matches (
    matchday character varying(9) NOT NULL,
    matchdate date NOT NULL,
    team1 character varying(22) NOT NULL,
    court character varying(6) NOT NULL,
    team2 character varying(22),
    winner character varying(22) NOT NULL,
    score1 integer NOT NULL,
    score2 integer NOT NULL,
    overtime boolean DEFAULT false,
    CONSTRAINT court_constraint CHECK (((court)::text = ANY ((ARRAY['Team 1'::character varying, 'Team 2'::character varying])::text[]))),
    CONSTRAINT match_constraint CHECK (((team1)::text <> (team2)::text)),
    CONSTRAINT matchdate_constraint CHECK (((matchdate >= '2022-10-18'::date) AND (matchdate <= '2023-04-09'::date))),
    CONSTRAINT matchday_constraint CHECK (((matchday)::text = ANY ((ARRAY['Monday'::character varying, 'Tuesday'::character varying, 'Wednesday'::character varying, 'Thursday'::character varying, 'Friday'::character varying, 'Saturday'::character varying, 'Sunday'::character varying])::text[]))),
    CONSTRAINT score_constraint CHECK (((score1 >= 0) AND (score2 >= 0))),
    CONSTRAINT winner_constraint CHECK (((((winner)::text = (team1)::text) AND (score1 > score2)) OR (((winner)::text = (team2)::text) AND (score2 > score1))))
);


ALTER TABLE public.team_matches OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    standing integer NOT NULL,
    city character varying(4) NOT NULL,
    name character varying(22) NOT NULL,
    conference character varying(18) NOT NULL,
    pct numeric(4,1) NOT NULL,
    ppg numeric(5,1) NOT NULL,
    oppppg numeric(5,1) NOT NULL,
    coach character varying(35),
    CONSTRAINT conference_constraint CHECK (((conference)::text = ANY ((ARRAY['Eastern Conference'::character varying, 'Western Conference'::character varying])::text[]))),
    CONSTRAINT oppppg_constraint CHECK ((oppppg >= (0)::numeric)),
    CONSTRAINT pct_constraint CHECK ((pct >= (0)::numeric)),
    CONSTRAINT ppg_constraint CHECK ((ppg >= (0)::numeric)),
    CONSTRAINT standing_constraint CHECK ((standing >= 1))
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Data for Name: player_bio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_bio (playerid, playername, "position", playerheight, playerweight, birthdate, experience, birth_city, birth_state) FROM stdin;
1	Giannis Antetokounmpo	Power Forward	210.82	243	1994-12-06	9th Season	Athens	Greece
2	Jrue Holiday	Point Guard	193.04	205	1990-06-12	13th Season	Chatsworth	CA
3	Brook Lopez	Center	213.36	282	1988-04-01	14th Season	North Hollywood	CA
4	Khris Middleton	Small Forward	200.66	222	1991-08-12	10th Season	Charleston	SC
5	Bobby Portis	Forward	208.28	250	1995-02-10	7th Season	Little Rock	AR
6	Grayson Allen	Shooting Guard	193.04	198	1995-10-08	4th Season	Jacksonville	FL
7	Jevon Carter	Point Guard	185.42	200	1995-09-14	4th Season	Maywood	IL
8	Pat Connaughton	Shooting Guard	195.58	209	1993-01-06	7th Season	Arlington	MA
9	Lindell Wigginton	Guard	185.42	189	1998-03-28	1st Season	Dartmouth	NS
10	Joe Ingles	Shooting Guard	203.20	220	1987-10-02	8th Season	Adelaide	SA
11	Jae Crowder	Power Forward	198.12	235	1990-07-06	10th Season	Villa Rica	GA
12	Jordan Nwora	Small Forward	203.20	225	1998-09-09	2nd Season	Buffalo	NY
13	Goran Dragic	Point Guard	190.50	190	1986-05-06	14th Season	Ljubljana	Slovenia
14	MarJon Beauchamp	Forward	200.66	202	2000-10-12	Rookie	\N	\N
15	George Hill	Point Guard	193.04	188	1986-05-04	14th Season	Indianapolis	IN
16	Meyers Leonard	Center	213.36	260	1992-02-27	9th Season	Robinson	IL
17	AJ Green	Guard	195.58	207	1999-09-27	Rookie	Cedar Falls	IA
18	Serge Ibaka	Forward	208.28	235	1989-09-18	13th Season	Brazzaville	Congo
19	Wesley Matthews	Shooting Guard	193.04	220	1986-10-14	13th Season	San Antonio	TX
20	Sandro Mamukelashvili	Power Forward	208.28	240	1999-05-23	1st Season	Tbilisi	Georgia
21	Thanasis Antetokounmpo	Small Forward	200.66	219	1992-07-18	4th Season	Athens	Greece
22	Jayson Tatum	Small Forward	203.20	210	1998-03-03	5th Season	Saint Louis	MO
23	Jaylen Brown	Shooting Guard	198.12	223	1996-10-24	6th Season	Marietta	GA
24	Malcolm Brogdon	Point Guard	193.04	229	1992-12-11	6th Season	Atlanta	GA
25	Derrick White	Point Guard	193.04	190	1994-07-02	5th Season	Parker	CO
26	Marcus Smart	Point Guard	193.04	220	1994-03-06	8th Season	Flower Mound	TX
27	Al Horford	Center	205.74	240	1986-06-03	15th Season	Puerto Plata	Dominican Republic
28	Grant Williams	Power Forward	198.12	236	1998-11-30	3rd Season	Charlotte	NC
29	Robert Williams III	Center	205.74	237	1997-10-17	4th Season	Shreveport	LA
30	Sam Hauser	Small Forward	200.66	217	1997-12-08	1st Season	Stevens Point	WI
31	Mike Muscala	Center	210.82	240	1991-07-01	9th Season	Saint Louis Park	MN
32	Payton Pritchard	Point Guard	185.42	195	1998-01-28	2nd Season	West Linn	OR
33	Blake Griffin	Power Forward	205.74	250	1989-03-16	12th Season	Oklahoma City	OK
34	Luke Kornet	Center	218.44	250	1995-07-15	5th Season	Lantana	TX
35	Justin Champagnie	Small Forward	198.12	206	2001-06-29	1st Season	Brooklyn	NY
36	JD Davison	Shooting Guard	185.42	195	2002-10-03	Rookie	Letohatchee	AL
37	Mfiondu Kabengele	Center	\N	\N	1997-08-14	\N	Burlington	ON
38	Noah Vonleh	Power Forward	\N	\N	1995-08-24	\N	Salem	MA
39	Justin Jackson	Small Forward	\N	\N	1995-03-28	\N	Tomball	TX
40	Joel Embiid	Center	213.36	280	1994-03-16	6th Season	Yaounde	Cameroon
41	James Harden	Shooting Guard	195.58	220	1989-08-26	13th Season	Los Angeles	CA
42	Tyrese Maxey	Point Guard	187.96	200	2000-11-04	2nd Season	Garland	TX
43	Louis King	Small Forward	200.66	205	1999-04-06	4th Season	Secaucus	NJ
44	Tobias Harris	Power Forward	200.66	226	1992-07-15	11th Season	Dix Hills	NY
45	Mac McClung	Shooting Guard	187.96	185	1999-01-06	1st Season	Gate City	VA
46	De'Anthony Melton	Shooting Guard	187.96	200	1998-05-28	4th Season	North Hollywood	CA
47	Shake Milton	Shooting Guard	195.58	205	1996-09-26	4th Season	Owasso	OK
48	Georges Niang	Small Forward	200.66	230	1993-06-17	6th Season	Methuen	MA
49	Jalen McDaniels	Power Forward	205.74	205	1998-01-31	3rd Season	Federal Way	WA
50	Montrezl Harrell	Center	200.66	240	1994-01-26	7th Season	Tarboro	NC
51	Danuel House Jr.	Small Forward	198.12	220	1993-06-07	6th Season	Fresno	TX
52	Paul Reed	Small Forward	205.74	210	1999-06-14	2nd Season	Orlando	FL
53	Furkan Korkmaz	Shooting Guard	200.66	202	1997-07-24	5th Season	Bakirkoy	Turkey
54	P.J. Tucker	Power Forward	195.58	245	1985-05-05	11th Season	Raleigh	NC
55	Dewayne Dedmon	Center	208.28	245	1989-08-12	9th Season	Lancaster	CA
56	Saben Lee	Guard	187.96	183	1999-06-23	2nd Season	Phoenix	AZ
57	Matisse Thybulle	Shooting Guard	195.58	201	1997-03-04	3rd Season	Issaquah	WA
58	Jaden Springer	Guard	193.04	205	2002-09-25	1st Season	Charlotte	NC
59	Julian Champagnie	Forward	205.74	210	2001-06-29	1st Season	Brooklyn	NY
60	Michael Foster Jr.	Forward	\N	\N	2003-01-16	\N	\N	\N
61	Donovan Mitchell	Shooting Guard	185.42	215	1996-09-07	5th Season	Greenwich	CT
62	Darius Garland	Point Guard	185.42	192	2000-01-26	3rd Season	Gary	IN
63	Evan Mobley	Power Forward	210.82	215	2001-06-18	1st Season	Murrieta	CA
64	Jarrett Allen	Center	205.74	243	1998-04-21	5th Season	Round Rock	TX
65	Caris LeVert	Shooting Guard	198.12	205	1994-08-25	6th Season	Pickerington	OH
66	Cedi Osman	Small Forward	200.66	230	1995-04-08	5th Season	Ohrid	Macedonia
67	Kevin Love	Power Forward	203.20	251	1988-09-07	14th Season	Santa Monica	CA
68	Danny Green	Forward	198.12	215	1987-06-22	13th Season	North Babylon	NY
69	Isaac Okoro	Small Forward	195.58	225	2001-01-26	2nd Season	Powder Springs	GA
70	Lamar Stevens	Forward	\N	\N	1997-07-09	\N	Philadelphia	PA
71	Ricky Rubio	Point Guard	187.96	190	1990-10-21	11th Season	Barcelona	Spain
72	Sam Merrill	Shooting Guard	193.04	205	1996-05-15	3rd Season	Bountiful	UT
73	Dean Wade	Power Forward	205.74	228	1996-11-20	3rd Season	Wichita	KS
74	Raul Neto	Point Guard	187.96	180	1992-05-19	7th Season	\N	\N
75	Robin Lopez	Center	213.36	281	1988-04-01	14th Season	North Hollywood	CA
76	Mamadi Diakite	Forward	205.74	228	1997-01-21	2nd Season	Conakry	Guinea
77	Isaiah Mobley	Forward	203.20	238	1999-09-24	1st Season	Murrieta	CA
78	Dylan Windler	Shooting Guard	200.66	196	1996-09-22	2nd Season	Indianapolis	IN
79	Julius Randle	Power Forward	203.20	250	1994-11-29	8th Season	Dallas	TX
80	Jalen Brunson	Point Guard	185.42	190	1996-08-31	4th Season	New Brunswick	NJ
81	RJ Barrett	Shooting Guard	198.12	214	2000-06-14	3rd Season	Toronto	ON
82	Immanuel Quickley	Shooting Guard	190.50	190	1999-06-17	2nd Season	Havre De Grace	MD
83	Quentin Grimes	Shooting Guard	193.04	210	2000-05-08	1st Season	The Woodlands	TX
84	Josh Hart	Shooting Guard	193.04	215	1995-03-06	5th Season	Silver Spring	MD
85	Cam Reddish	Small Forward	203.20	217	1999-09-01	3rd Season	Norristown	PA
86	Obi Toppin	Power Forward	205.74	220	1998-03-04	2nd Season	Brooklyn	NY
87	Mitchell Robinson	Center	213.36	240	1998-04-01	4th Season	Pensacola	FL
88	Evan Fournier	Shooting Guard	198.12	205	1992-10-29	10th Season	\N	\N
89	Derrick Rose	Point Guard	190.50	200	1988-10-04	13th Season	Chicago	IL
90	Isaiah Hartenstein	Center	213.36	250	1998-05-05	3rd Season	Eugene	OR
91	Miles McBride	Point Guard	187.96	195	2000-09-08	1st Season	Cincinnati	OH
92	Jericho Sims	Center	205.74	250	1998-10-20	1st Season	Minneapolis	MN
93	Svi Mykhailiuk	Shooting Guard	200.66	205	1997-06-10	4th Season	Cherkasy	Ukraine
94	Trevor Keels	Guard	193.04	221	2003-08-26	Rookie	Clinton	MD
95	Ryan Arcidiacono	Guard	\N	\N	1994-03-26	\N	Langhorne	PA
96	Kevin Durant	Power Forward	208.28	240	1988-09-29	14th Season	Suitland	MD
97	Kyrie Irving	Point Guard	187.96	195	1992-03-23	11th Season	Melbourne	VIC
98	Mikal Bridges	Small Forward	198.12	209	1996-08-30	4th Season	Malvern	PA
99	Cameron Johnson	Small Forward	203.20	210	1996-03-03	3rd Season	Moon Township	PA
100	Spencer Dinwiddie	Point Guard	198.12	215	1993-04-06	8th Season	Woodland Hills	CA
101	RaiQuan Gray	Forward	\N	\N	1999-07-07	\N	Fort Lauderdale	FL
102	Nic Claxton	Center	210.82	215	1999-04-17	3rd Season	Greenville	SC
103	Cam Thomas	Shooting Guard	190.50	210	2001-10-13	1st Season	Chesapeake	VA
104	T.J. Warren	Small Forward	203.20	220	1993-09-05	7th Season	Durham	NC
105	Seth Curry	Shooting Guard	185.42	185	1990-08-23	8th Season	Charlotte	NC
106	Royce O'Neale	Power Forward	198.12	226	1993-06-05	5th Season	Killeen	TX
107	Joe Harris	Small Forward	198.12	220	1991-09-06	8th Season	Chelan	WA
108	Dorian Finney-Smith	Power Forward	200.66	220	1993-05-04	6th Season	Portsmouth	VA
109	Edmond Sumner	Point Guard	\N	\N	1995-12-31	\N	Detroit	MI
110	Ben Simmons	Point Guard	208.28	240	1996-07-20	4th Season	Melbourne	VIC
111	Patty Mills	Point Guard	182.88	180	1988-08-11	13th Season	Canberra	ACT
112	Yuta Watanabe	Small Forward	203.20	215	1994-10-13	4th Season	Kagawa	Japan
113	Day'Ron Sharpe	Center	205.74	265	2001-11-06	1st Season	Greenville	NC
114	David Duke Jr.	Guard	193.04	207	1999-10-13	1st Season	Providence	RI
115	Markieff Morris	Power Forward	205.74	245	1989-09-02	11th Season	Philadelphia	PA
116	Dru Smith	Guard	190.50	203	1997-12-30	1st Season	Evansville	IN
117	Kessler Edwards	Small Forward	203.20	215	2000-08-09	1st Season	Rancho Cucamonga	CA
118	Nerlens Noel	Center	\N	\N	1994-04-10	\N	Malden	MA
119	Moses Brown	Center	\N	\N	1999-10-13	\N	Queens	NY
120	Alondes Williams	Guard	\N	\N	1999-06-19	\N	Milwaukee	WI
121	Jimmy Butler	Small Forward	200.66	230	1989-09-14	11th Season	Houston	TX
122	Bam Adebayo	Center	205.74	255	1997-07-18	5th Season	Newark	NJ
123	Tyler Herro	Point Guard	195.58	195	2000-01-20	3rd Season	Milwaukee	WI
124	Max Strus	Shooting Guard	195.58	215	1996-03-28	3rd Season	Hickory Hills	IL
125	Kyle Lowry	Point Guard	182.88	196	1986-03-25	16th Season	Philadelphia	PA
126	Victor Oladipo	Shooting Guard	193.04	213	1992-05-04	9th Season	Silver Spring	MD
127	Caleb Martin	Small Forward	195.58	205	1995-09-28	3rd Season	Mocksville	NC
128	Gabe Vincent	Point Guard	190.50	200	1996-06-14	3rd Season	Modesto	CA
129	Cody Zeller	Center	210.82	240	1992-10-05	9th Season	Washington	IN
130	Duncan Robinson	Forward	200.66	215	1994-04-22	4th Season	York	ME
131	Nikola Jovic	Forward	208.28	205	2003-06-09	Rookie	\N	\N
132	Jamal Cain	Forward	200.66	191	1999-03-20	Rookie	Pontiac	MI
133	Omer Yurtseven	Center	210.82	275	1998-06-19	1st Season	\N	\N
134	Haywood Highsmith	Forward	193.04	220	1996-12-09	2nd Season	Baltimore	MD
135	Udonis Haslem	Power Forward	203.20	235	1980-06-09	19th Season	Miami	FL
136	Jamaree Bouyea	Guard	\N	\N	1999-06-27	\N	Seaside	CA
137	Orlando Robinson	Center	213.36	235	2000-07-10	Rookie	Las Vegas	NV
138	Trae Young	Point Guard	185.42	164	1998-09-19	4th Season	Lubbock	TX
139	Dejounte Murray	Shooting Guard	195.58	180	1996-09-19	5th Season	Seattle	WA
140	De'Andre Hunter	Small Forward	203.20	221	1997-12-02	3rd Season	Philadelphia	PA
141	Bogdan Bogdanovic	Shooting Guard	195.58	225	1992-08-18	5th Season	Belgrade	Serbia
142	John Collins	Power Forward	205.74	226	1997-09-23	5th Season	West Palm Beach	FL
143	Clint Capela	Center	208.28	256	1994-05-18	8th Season	Geneva	Switzerland
144	Saddiq Bey	Small Forward	200.66	215	1999-04-09	2nd Season	Largo	MD
145	Onyeka Okongwu	Power Forward	205.74	240	2000-12-11	2nd Season	Chino	CA
146	AJ Griffin	Forward	198.12	222	2003-08-25	Rookie	White Plains	NY
147	Jalen Johnson	Small Forward	203.20	219	2001-12-18	1st Season	Milwaukee	WI
148	Garrison Mathews	Shooting Guard	198.12	215	1996-10-24	3rd Season	Franklin	TN
149	Justin Holiday	Small Forward	198.12	180	1989-04-05	9th Season	Chatsworth	CA
150	Jarrett Culver	Guard	\N	\N	1999-02-20	\N	Dallas	TX
151	Aaron Holiday	Guard	182.88	185	1996-09-30	4th Season	Chatsworth	CA
152	Bruno Fernando	Power Forward	208.28	240	1998-08-15	3rd Season	Luanda	Angola
153	Frank Kaminsky	Power Forward	213.36	240	1993-04-04	7th Season	Lisle	IL
154	Trent Forrest	Guard	193.04	210	1998-06-12	2nd Season	Chipley	FL
155	Donovan Williams	Guard	198.12	190	2001-09-06	Rookie	Houston	TX
156	Tyrese Martin	Guard	198.12	215	1999-03-07	Rookie	Allentown	PA
157	Vit Krejci	Guard	200.66	195	2000-06-19	3rd Season	\N	\N
158	Pascal Siakam	Power Forward	203.20	230	1994-04-02	6th Season	Douala	Cameroon
159	Fred VanVleet	Shooting Guard	182.88	197	1994-02-25	6th Season	Rockford	IL
160	Gary Trent Jr.	Shooting Guard	195.58	209	1999-01-18	4th Season	Columbus	OH
161	O.G. Anunoby	Small Forward	200.66	232	1997-07-17	5th Season	Jefferson City	MO
162	Scottie Barnes	Small Forward	203.20	225	2001-08-01	1st Season	West Palm Beach	FL
163	Jakob Poeltl	Center	215.90	245	1995-10-15	6th Season	Vienna	Austria
164	Chris Boucher	Power Forward	205.74	200	1993-01-11	5th Season	Montreal	PQ
165	Precious Achiuwa	Power Forward	203.20	225	1999-09-19	2nd Season	Queens	NY
166	Otto Porter Jr.	Small Forward	203.20	198	1993-06-03	9th Season	Saint Louis	MO
167	Malachi Flynn	Point Guard	185.42	175	1998-05-09	2nd Season	Tacoma	WA
168	Dalano Banton	Guard	200.66	204	1999-11-07	1st Season	Toronto	ON
169	Will Barton	Guard	195.58	181	1991-01-06	10th Season	Baltimore	MD
170	Thaddeus Young	Power Forward	203.20	235	1988-06-21	15th Season	New Orleans	LA
171	Christian Koloko	Center	213.36	230	2000-06-20	Rookie	Douala	Cameroon
172	Juancho Hernangomez	Power Forward	\N	\N	1995-09-28	\N	Madrid	Spain
173	Jeff Dowtin Jr.	Point Guard	190.50	177	1997-05-10	1st Season	Upper Marlboro	MD
174	Ron Harper Jr.	Forward	195.58	245	2000-04-12	Rookie	Franklin Lakes	NJ
175	Khem Birch	Center	203.20	233	1992-09-28	5th Season	Montreal	PQ
176	Joe Wieskamp	Small Forward	198.12	205	1999-08-23	1st Season	Muscatine	IA
177	Zach LaVine	Shooting Guard	195.58	200	1995-03-10	8th Season	Seattle	WA
178	DeMar DeRozan	Small Forward	198.12	220	1989-08-07	13th Season	Compton	CA
179	Nikola Vucevic	Center	208.28	260	1990-10-24	11th Season	Simi Valley	CA
180	Patrick Williams	Power Forward	200.66	215	2001-08-26	2nd Season	Charlotte	NC
181	Coby White	Point Guard	195.58	195	2000-02-16	3rd Season	Goldsboro	NC
182	Ayo Dosunmu	Shooting Guard	195.58	200	2000-01-17	1st Season	Chicago	IL
183	Andre Drummond	Center	210.82	279	1993-08-10	10th Season	Mount Vernon	NY
184	Patrick Beverley	Point Guard	187.96	180	1988-07-12	10th Season	Chicago	IL
185	Alex Caruso	Shooting Guard	195.58	186	1994-02-28	5th Season	College Station	TX
186	Javonte Green	Small Forward	195.58	205	1993-07-23	3rd Season	Petersburg	VA
187	Derrick Jones Jr.	Small Forward	198.12	210	1997-02-15	6th Season	Chester	PA
188	Terry Taylor	Forward	193.04	230	1999-09-23	1st Season	Bowling Green	KY
189	Carlik Jones	Guard	182.88	174	1997-12-23	1st Season	Cincinnati	OH
190	Dalen Terry	Forward	200.66	200	2002-07-12	Rookie	Phoenix	AZ
191	Tony Bradley	Center	\N	\N	1998-01-08	\N	Bartow	FL
192	Malcolm Hill	Forward	\N	\N	1995-10-26	\N	Fairview Heights	IL
193	Marko Simonovic	Center	213.36	220	1999-10-15	1st Season	Montenegro	Yugoslavia
194	Tyrese Haliburton	Point Guard	195.58	185	2000-02-29	2nd Season	Oshkosh	WI
195	Myles Turner	Center	210.82	250	1996-03-24	7th Season	Bedford	TX
196	Buddy Hield	Shooting Guard	193.04	220	1992-12-17	6th Season	Freeport	GB
197	Bennedict Mathurin	Shooting Guard	198.12	195	2002-06-19	Rookie	Montreal	PQ
198	Aaron Nesmith	Small Forward	195.58	215	1999-10-16	2nd Season	Charleston	SC
199	Andrew Nembhard	Point Guard	195.58	193	2000-01-16	Rookie	Aurora	ON
200	Jalen Smith	Power Forward	205.74	215	2000-03-16	2nd Season	Baltimore	MD
201	T.J. McConnell	Point Guard	185.42	190	1992-03-25	7th Season	Pittsburgh	PA
202	Gabe York	Guard	190.50	190	1993-08-02	1st Season	West Covina	CA
203	Chris Duarte	Shooting Guard	195.58	190	1997-06-13	1st Season	Puerto Plata	Dominican Republic
204	Isaiah Jackson	Small Forward	208.28	206	2002-01-10	1st Season	Pontiac	MI
205	Daniel Theis	Center	203.20	245	1992-04-04	5th Season	Salzgitter	Germany
206	Oshae Brissett	Small Forward	200.66	210	1998-06-20	3rd Season	Mississauga	ON
207	Goga Bitadze	Center	210.82	250	1999-07-20	3rd Season	Sagarejo	Georgia
208	Trevelin Queen	Shooting Guard	\N	\N	1997-02-25	\N	Glen Burnie	MD
209	James Johnson	Power Forward	200.66	240	1987-02-20	13th Season	Cheyenne	WY
210	Kendall Brown	Shooting Guard	203.20	205	2003-05-11	Rookie	Cottage Grove	MN
211	Bradley Beal	Shooting Guard	193.04	207	1993-06-28	10th Season	Saint Louis	MO
212	Kristaps Porzingis	Center	220.98	240	1995-08-02	6th Season	Liepaja	Latvia
213	Kyle Kuzma	Small Forward	205.74	221	1995-07-24	5th Season	Flint	MI
214	Rui Hachimura	Power Forward	203.20	230	1998-02-08	3rd Season	Toyama	Japan
215	Corey Kispert	Small Forward	198.12	224	1999-03-03	1st Season	Edmonds	WA
216	Monte Morris	Point Guard	187.96	183	1995-06-27	5th Season	Grand Rapids	MI
217	Deni Avdija	Small Forward	205.74	210	2001-01-03	2nd Season	Tel Aviv	Israel
218	Daniel Gafford	Center	208.28	234	1998-10-01	3rd Season	El Dorado	AR
219	Kendrick Nunn	Guard	190.50	190	1995-08-03	2nd Season	Chicago	IL
220	Delon Wright	Shooting Guard	195.58	185	1992-04-26	7th Season	Los Angeles	CA
221	Jay Huff	Center	215.90	240	1998-08-25	2nd Season	Durham	NC
222	Jordan Goodwin	Guard	190.50	200	1998-10-23	1st Season	Centreville	IL
223	Quenton Jackson	Guard	195.58	173	1998-09-15	Rookie	Los Angeles	CA
224	Johnny Davis	Guard	193.04	195	2002-02-27	Rookie	La Crosse	WI
225	Xavier Cooks	Guard	203.20	185	1995-08-19	Rookie	Wollongong	NSW
226	Taj Gibson	Forward	205.74	232	1985-06-24	13th Season	Brooklyn	NY
227	Anthony Gill	Power Forward	203.20	230	1992-10-17	2nd Season	High Point	NC
228	Jordan Schakel	Forward	\N	\N	1998-06-13	\N	Torrance	CA
229	Isaiah Todd	Power Forward	205.74	219	2001-10-17	1st Season	Baltimore	MD
230	Vernon Carey Jr.	Center	\N	\N	2001-02-25	\N	Southwest Ranches	FL
231	Devon Dotson	Guard	\N	\N	1999-08-02	\N	Charlotte	NC
232	Paolo Banchero	Power Forward	208.28	250	2002-11-12	Rookie	Seattle	WA
233	Franz Wagner	Small Forward	208.28	220	2001-08-27	1st Season	Berlin	Germany
234	Wendell Carter Jr.	Center	208.28	270	1999-04-16	4th Season	Atlanta	GA
235	Markelle Fultz	Point Guard	193.04	209	1998-05-29	5th Season	Upper Marlboro	MD
236	Cole Anthony	Point Guard	190.50	185	2000-05-15	2nd Season	New York	NY
237	Moritz Wagner	Center	210.82	245	1997-04-26	4th Season	Berlin	Germany
238	Jalen Suggs	Shooting Guard	195.58	205	2001-06-03	1st Season	Saint Paul	MN
239	Bol Bol	Center	218.44	220	1999-11-16	3rd Season	Khartoum	Sudan
240	Gary Harris	Shooting Guard	193.04	210	1994-09-14	8th Season	Fishers	IN
241	Terrence Ross	Guard	200.66	206	1991-02-05	10th Season	Portland	OR
242	Mo Bamba	Center	213.36	231	1998-05-12	4th Season	Harlem	NY
243	Jay Scrubb	Guard	195.58	220	2000-09-01	2nd Season	Louisville	KY
244	R.J. Hampton	Point Guard	\N	\N	2001-02-07	\N	Dallas	TX
245	Jonathan Isaac	Power Forward	208.28	230	1997-10-03	3rd Season	Naples	FL
246	Chuma Okeke	Power Forward	203.20	229	1998-08-18	2nd Season	Atlanta	GA
247	Michael Carter-Williams	Guard	195.58	190	1991-10-10	7th Season	Hamilton	MA
248	Admiral Schofield	Small Forward	195.58	241	1997-03-30	2nd Season	Zion	IL
249	Kevon Harris	Guard	198.12	220	1997-06-24	Rookie	Ellenwood	GA
250	Caleb Houstan	Guard	203.20	210	2003-01-09	Rookie	Mississauga	ON
251	LaMelo Ball	Point Guard	200.66	180	2001-08-22	2nd Season	Chino Hills	CA
252	Terry Rozier	Shooting Guard	185.42	190	1994-03-17	7th Season	Youngstown	OH
253	Kelly Oubre Jr.	Shooting Guard	198.12	203	1995-12-09	7th Season	Henderson	NV
254	P.J. Washington	Power Forward	200.66	230	1998-08-23	3rd Season	Louisville	KY
255	Gordon Hayward	Small Forward	200.66	225	1990-03-23	12th Season	Brownsburg	IN
256	Mason Plumlee	Center	213.36	254	1990-03-05	9th Season	Fort Wayne	IN
257	Mark Williams	Center	213.36	240	2001-12-16	Rookie	Virginia Beach	VA
258	Dennis Smith Jr.	Point Guard	187.96	205	1997-11-25	Rookie	Fayetteville	NC
259	Nick Richards	Center	213.36	245	1997-11-29	2nd Season	Kingston	Jamaica
260	Theo Maledon	Point Guard	195.58	175	2001-06-12	2nd Season	Paris	France
261	James Bouknight	Shooting Guard	193.04	190	2000-09-18	1st Season	Brooklyn	NY
262	Bryce McGowens	Guard	198.12	175	2002-11-08	Rookie	Pendleton	SC
263	Cody Martin	Small Forward	198.12	205	1995-09-28	3rd Season	Mocksville	NC
264	Xavier Sneed	Forward	195.58	215	1997-12-21	1st Season	Saint Louis	MO
265	JT Thor	Forward	205.74	203	2002-08-26	1st Season	Anchorage	AK
266	Kai Jones	Power Forward	210.82	221	2001-01-19	1st Season	Nassau	Bahamas
267	Kobi Simmons	Guard	195.58	180	1997-07-04	2nd Season	Atlanta	GA
268	Bojan Bogdanovic	Small Forward	200.66	226	1989-04-18	8th Season	\N	\N
269	Cade Cunningham	Point Guard	200.66	220	2001-09-25	1st Season	Arlington	TX
270	Jaden Ivey	Point Guard	193.04	195	2002-02-13	1st Season	South Bend	IN
271	Alec Burks	Shooting Guard	198.12	214	1991-07-20	11th Season	Grandview	MO
272	James Wiseman	Center	213.36	240	2001-03-31	2nd Season	Nashville	TN
273	Marvin Bagley III	Power Forward	208.28	235	1999-03-14	4th Season	Phoenix	AZ
274	Isaiah Stewart	Center	203.20	250	2001-05-22	2nd Season	Rochester	NY
275	Killian Hayes	Point Guard	195.58	195	2001-07-27	2nd Season	Lakeland	FL
276	Eugene Omoruyi	Forward	198.12	235	1997-02-14	2nd Season	Rexdale	ON
277	Hamidou Diallo	Shooting Guard	195.58	202	1998-07-31	4th Season	Queens	NY
278	Jalen Duren	Center	210.82	250	2003-11-18	Rookie	Sharon Hill	PA
279	Cory Joseph	Point Guard	190.50	200	1991-08-20	11th Season	Henderson	NV
280	Isaiah Livers	Power Forward	198.12	232	1998-07-27	1st Season	Kalamazoo	MI
281	Rodney McGruder	Guard	193.04	205	1991-07-29	6th Season	Landover	MD
282	Kevin Knox II	Small Forward	200.66	215	1999-08-11	4th Season	Phoenix	AZ
283	Jared Rhoden	Guard	198.12	210	1999-08-27	1st Season	Baldwin	NY
284	Stanley Umude	Guard	\N	\N	1999-04-12	\N	San Antonio	TX
285	Buddy Boeheim	Forward	198.12	205	1999-11-11	Rookie	Fayetteville	NY
286	Braxton Key	Forward	203.20	225	1997-02-14	2nd Season	Charlotte	NC
287	Nikola Jokic	Center	210.82	284	1995-02-19	7th Season	Sombor	Serbia
288	Jamal Murray	Point Guard	193.04	215	1997-02-23	5th Season	Kitchener	ON
289	Michael Porter Jr.	Small Forward	208.28	218	1998-06-29	3rd Season	Columbia	MO
290	Aaron Gordon	Power Forward	203.20	235	1995-09-16	8th Season	San Jose	CA
291	Bones Hyland	Point Guard	187.96	169	2000-09-14	1st Season	Wilmington	DE
292	Bruce Brown	Small Forward	193.04	202	1996-08-15	4th Season	Boston	MA
293	Kentavious Caldwell-Pope	Shooting Guard	195.58	204	1993-02-18	9th Season	Thomaston	GA
294	Reggie Jackson	Point Guard	187.96	208	1990-04-16	11th Season	Pordenone	Italy
295	Jeff Green	Power Forward	203.20	235	1986-08-28	14th Season	Hyattsville	MD
296	Zeke Nnaji	Power Forward	205.74	240	2001-01-09	2nd Season	Lakeville	MN
297	DeAndre Jordan	Center	210.82	265	1988-07-21	14th Season	Houston	TX
298	Vlatko Cancar	Small Forward	203.20	236	1997-04-10	3rd Season	Koper	Slovenia
299	Christian Braun	Guard	198.12	220	2001-04-17	Rookie	Burlington	KS
300	Thomas Bryant	Center	208.28	248	1997-07-31	5th Season	Rochester	NY
301	Peyton Watson	Forward	203.20	200	2002-09-11	Rookie	Long Beach	CA
302	Ish Smith	Point Guard	182.88	175	1988-07-05	12th Season	Concord	NC
303	Davon Reed	Shooting Guard	\N	\N	1995-06-11	\N	Ewing	NJ
304	Jack White	Forward	200.66	225	1997-08-05	Rookie	Traralgon	VIC
305	Ja Morant	Point Guard	190.50	174	1999-08-10	3rd Season	Dalzell	SC
306	Desmond Bane	Shooting Guard	195.58	215	1998-06-25	2nd Season	Richmond	IN
307	Jaren Jackson Jr.	Power Forward	210.82	242	1999-09-15	4th Season	Plainfield	NJ
308	Dillon Brooks	Small Forward	200.66	225	1996-01-22	5th Season	Mississauga	ON
309	Luke Kennard	Shooting Guard	195.58	206	1996-06-24	5th Season	Middletown	OH
310	Tyus Jones	Point Guard	182.88	196	1996-05-10	7th Season	Burnsville	MN
311	Brandon Clarke	Power Forward	203.20	215	1996-09-19	3rd Season	Vancouver	BC
312	Santi Aldama	Power Forward	210.82	215	2001-01-10	1st Season	Las Palmas De Gas	Spain
313	Steven Adams	Center	210.82	265	1993-07-20	9th Season	Rotorua	New Zealand
314	Xavier Tillman	Forward	203.20	245	1999-01-12	2nd Season	Grand Rapids	MI
315	David Roddy	Forward	195.58	255	2001-03-27	Rookie	Minneapolis	MN
316	Ziaire Williams	Forward	205.74	185	2001-09-12	1st Season	Lancaster	CA
317	John Konchar	Shooting Guard	195.58	210	1996-03-22	3rd Season	West Chicago	IL
318	Kenneth Lofton Jr.	Forward	203.20	275	2002-08-14	Rookie	Port Arthur	TX
319	Jacob Gilyard	Guard	175.26	160	1998-07-14	Rookie	Kansas City	MO
320	Jake LaRavia	Forward	200.66	235	2001-11-03	Rookie	Indianapolis	IN
321	Kennedy Chandler	Guard	\N	\N	2002-09-16	\N	Memphis	TN
322	Vince Williams Jr.	Guard	198.12	205	2000-08-30	Rookie	Toledo	OH
323	De'Aaron Fox	Point Guard	190.50	185	1997-12-20	5th Season	Houston	TX
324	Domantas Sabonis	Power Forward	213.36	240	1996-05-03	6th Season	Kaunas	Lithuania
325	Kevin Huerter	Shooting Guard	200.66	198	1998-08-27	4th Season	Albany	NY
326	Harrison Barnes	Small Forward	203.20	225	1992-05-30	10th Season	Ames	IA
327	Malik Monk	Shooting Guard	190.50	200	1998-02-04	5th Season	Lepanto	AR
328	Keegan Murray	Small Forward	203.20	215	2000-08-19	Rookie	Cedar Rapids	IA
329	Trey Lyles	Power Forward	205.74	234	1995-11-05	7th Season	Indianapolis	IN
330	Terence Davis	Shooting Guard	193.04	201	1997-05-16	3rd Season	Southaven	MS
331	Davion Mitchell	Point Guard	182.88	202	1998-09-05	1st Season	Hinesville	GA
332	Chimezie Metu	Power Forward	205.74	225	1997-03-22	4th Season	Lawndale	CA
333	Richaun Holmes	Forward	205.74	235	1993-10-15	7th Season	Lockport	IL
334	Neemias Queta	Center	213.36	245	1999-07-13	1st Season	Barreiro	Portugal
335	Alex Len	Center	215.90	250	1993-06-16	9th Season	Antratsit	Ukraine
336	Keon Ellis	Guard	195.58	175	2000-01-08	Rookie	Eustis	FL
337	Matthew Dellavedova	Point Guard	190.50	200	1990-09-08	8th Season	Maryborough	VIC
338	PJ Dozier	Guard	\N	\N	1996-10-25	\N	Columbia	SC
339	KZ Okpala	Small Forward	\N	\N	1999-04-28	\N	Orange County	CA
340	Chima Moneke	Forward	\N	\N	1995-12-24	\N	Canberra	ACT
341	Deonte Burton	Forward	\N	\N	1994-01-31	\N	Milwaukee	WI
342	Devin Booker	Shooting Guard	195.58	206	1996-10-30	7th Season	Grand Rapids	MI
343	Deandre Ayton	Center	213.36	250	1998-07-23	4th Season	Nassau	Bahamas
344	Chris Paul	Point Guard	182.88	175	1985-05-06	17th Season	Winston-Salem	NC
345	Cameron Payne	Point Guard	185.42	183	1994-08-08	7th Season	Bartlett	TN
346	Landry Shamet	Shooting Guard	193.04	190	1997-03-13	4th Season	Kansas City	MO
347	Damion Lee	Shooting Guard	195.58	210	1992-10-21	5th Season	Baltimore	MD
348	Duane Washington Jr.	Point Guard	187.96	197	2000-03-24	1st Season	Grand Rapids	MI
349	Torrey Craig	Small Forward	200.66	221	1990-12-19	5th Season	Columbia	SC
350	Josh Okogie	Small Forward	193.04	213	1998-09-01	4th Season	Lagos	Nigeria
351	Jock Landale	Center	210.82	255	1995-10-25	1st Season	E Malvern	VIC
352	Dario Saric	Power Forward	208.28	225	1994-04-08	5th Season	Sibenik	Croatia
353	Bismack Biyombo	Center	203.20	255	1992-08-28	11th Season	Lubumbashi	Congo
354	Ish Wainright	Forward	195.58	250	1994-09-12	1st Season	Kansas City	MO
355	Darius Bazley	Power Forward	205.74	216	2000-06-12	4th Season	Boston	MA
356	Kawhi Leonard	Small Forward	200.66	225	1991-06-29	10th Season	Los Angeles	CA
357	Paul George	Forward	203.20	220	1990-05-02	12th Season	Palmdale	CA
358	Norman Powell	Guard	190.50	215	1993-05-25	7th Season	San Diego	CA
359	Russell Westbrook	Point Guard	190.50	200	1988-11-12	14th Season	Long Beach	CA
360	John Wall	Point Guard	\N	\N	1990-09-06	\N	Raleigh	NC
361	Marcus Morris Sr.	Small Forward	203.20	218	1989-09-02	11th Season	Philadelphia	PA
362	Eric Gordon	Shooting Guard	\N	\N	1988-12-25	\N	Indianapolis	IN
363	Ivica Zubac	Center	213.36	240	1997-03-18	6th Season	Mostar	Bosnia & Herzegovina
364	Terance Mann	Shooting Guard	195.58	215	1996-10-18	3rd Season	Brooklyn	NY
365	Brandon Boston Jr.	Shooting Guard	198.12	188	2001-11-28	1st Season	Norcross	GA
366	Nicolas Batum	Power Forward	203.20	230	1988-12-14	14th Season	Lisieux	France
367	Robert Covington	Power Forward	200.66	209	1990-12-14	9th Season	Bellwood	IL
368	Amir Coffey	Shooting Guard	200.66	210	1997-06-17	3rd Season	Hopkins	MN
369	Jason Preston	Point Guard	190.50	181	1999-08-10	Rookie	Orlando	FL
370	Moussa Diabate	Forward	210.82	210	2002-01-21	Rookie	Paris	France
371	Xavier Moon	Point Guard	182.88	165	1995-01-02	1st Season	Goodwater	AL
372	Stephen Curry	Point Guard	187.96	185	1988-03-14	13th Season	Akron	OH
373	Klay Thompson	Shooting Guard	198.12	220	1990-02-08	9th Season	Los Angeles	CA
374	Jordan Poole	Shooting Guard	193.04	194	1999-06-19	3rd Season	Milwaukee	WI
375	Andrew Wiggins	Small Forward	200.66	197	1995-02-23	8th Season	Thornhill	ON
376	Jonathan Kuminga	Power Forward	200.66	225	2002-10-06	1st Season	Goma	Democratic Republic of Congo
377	Donte DiVincenzo	Shooting Guard	193.04	203	1997-01-31	5th Season	Newark	DE
378	Draymond Green	Power Forward	198.12	230	1990-03-04	10th Season	Saginaw	MI
379	Kevon Looney	Forward	205.74	222	1996-02-06	7th Season	Milwaukee	WI
380	Ty Jerome	Shooting Guard	195.58	195	1997-07-08	3rd Season	New Rochelle	NY
381	Anthony Lamb	Forward	198.12	227	1998-01-20	2nd Season	Rochester	NY
382	JaMychal Green	Forward	205.74	227	1990-06-21	8th Season	Montgomery	AL
383	Gary Payton II	Shooting Guard	187.96	195	1992-12-01	6th Season	Las Vegas	NV
384	Moses Moody	Shooting Guard	195.58	211	2002-05-31	1st Season	Little Rock	AR
385	Patrick Baldwin Jr.	Forward	205.74	220	2002-11-18	Rookie	Sussex	WI
386	Lester Quinones	Guard	195.58	205	2000-11-16	Rookie	Brentwood	NY
387	Andre Iguodala	Forward	198.12	215	1984-01-28	18th Season	Springfield	IL
388	Ryan Rollins	Guard	190.50	180	2002-07-03	Rookie	Macomb	MI
389	LeBron James	Small Forward	205.74	250	1984-12-30	19th Season	Akron	OH
390	Anthony Davis	Power Forward	208.28	253	1993-03-11	10th Season	Chicago	IL
391	D'Angelo Russell	Point Guard	193.04	193	1996-02-23	7th Season	Louisville	KY
392	Austin Reaves	Shooting Guard	195.58	197	1998-05-29	1st Season	Newark	AR
393	Dennis Schroder	Point Guard	185.42	172	1993-09-15	9th Season	Braunschweig	Germany
394	Lonnie Walker IV	Guard	193.04	204	1998-12-14	4th Season	Reading	PA
395	Malik Beasley	Shooting Guard	193.04	187	1996-11-26	6th Season	Atlanta	GA
396	Jarred Vanderbilt	Power Forward	203.20	214	1999-04-03	4th Season	Houston	TX
397	Troy Brown Jr.	Small Forward	198.12	215	1999-07-28	4th Season	Las Vegas	NV
398	Wenyen Gabriel	Forward	205.74	205	1997-03-26	3rd Season	Manchester	NH
399	Matt Ryan	Forward	198.12	215	1997-04-17	1st Season	Cortlandt Manor	NY
400	Max Christie	Guard	195.58	190	2003-02-10	Rookie	Arlington Heights	IL
401	Juan Toscano-Anderson	Small Forward	198.12	209	1993-04-10	3rd Season	Oakland	CA
402	Damian Jones	Center	210.82	245	1995-06-30	6th Season	Baton Rouge	LA
403	Scotty Pippen Jr.	Guard	185.42	185	2000-11-10	Rookie	Los Angeles	CA
404	Cole Swider	Forward	205.74	220	1999-05-08	Rookie	Portsmouth	RI
405	Sterling Brown	Small Forward	\N	\N	1995-02-10	\N	Maywood	IL
406	Anthony Edwards	Shooting Guard	193.04	225	2001-08-05	2nd Season	Atlanta	GA
407	Karl-Anthony Towns	Center	213.36	248	1995-11-15	7th Season	Edison	NJ
408	Mike Conley	Point Guard	185.42	175	1987-10-11	15th Season	Indianapolis	IN
409	Rudy Gobert	Center	215.90	258	1992-06-26	9th Season	\N	\N
410	Jaden McDaniels	Power Forward	205.74	185	2000-09-29	2nd Season	Seattle	WA
411	Naz Reid	Center	205.74	264	1999-08-26	3rd Season	Asbury Park	NJ
412	Jaylen Nowell	Shooting Guard	193.04	201	1999-07-09	3rd Season	Seattle	WA
413	Kyle Anderson	Small Forward	205.74	230	1993-09-20	8th Season	Fairview	NJ
414	Taurean Prince	Power Forward	198.12	218	1994-03-22	6th Season	San Marcos	TX
415	Luka Garza	Center	208.28	243	1998-12-27	1st Season	Washington	DC
416	Nickeil Alexander-Walker	Shooting Guard	195.58	205	1998-09-02	3rd Season	Toronto	ON
417	Austin Rivers	Shooting Guard	193.04	200	1992-08-01	10th Season	Winter Park	FL
418	Jordan McLaughlin	Point Guard	182.88	185	1996-04-09	3rd Season	Etiwanda	CA
419	Nathan Knight	Forward	203.20	253	1997-09-20	2nd Season	Syracuse	NY
420	Bryn Forbes	Shooting Guard	\N	\N	1993-07-23	\N	Lansing	MI
421	Josh Minott	Forward	203.20	205	2002-07-25	Rookie	Boca Raton	FL
422	A.J. Lawson	Guard	198.12	179	2000-07-15	Rookie	Brampton	ON
423	Wendell Moore Jr.	Guard	195.58	215	2001-09-18	Rookie	Charlotte	NC
424	Zion Williamson	Power Forward	198.12	284	2000-07-06	2nd Season	Salisbury	NC
425	Brandon Ingram	Small Forward	203.20	190	1997-09-02	6th Season	Kinston	NC
426	CJ McCollum	Shooting Guard	190.50	190	1991-09-19	9th Season	Canton	OH
427	Trey Murphy III	Shooting Guard	203.20	206	2000-06-18	1st Season	Durham	NC
428	Jonas Valanciunas	Center	210.82	265	1992-05-06	10th Season	Utena	Lithuania
429	Herbert Jones	Small Forward	200.66	206	1998-10-06	1st Season	Greensboro	AL
430	Naji Marshall	Small Forward	200.66	220	1998-01-24	2nd Season	Atlantic City	NJ
431	Jose Alvarado	Point Guard	182.88	179	1998-04-12	1st Season	Brooklyn	NY
432	Josh Richardson	Shooting Guard	198.12	200	1993-09-15	7th Season	Edmond	OK
433	Willy Hernangomez	Center	210.82	250	1994-05-27	6th Season	Madrid	Spain
434	Larry Nance Jr.	Power Forward	203.20	245	1993-01-01	7th Season	Akron	OH
435	Devonte' Graham	Point Guard	185.42	195	1995-02-22	4th Season	Raleigh	NC
436	Jaxson Hayes	Center	213.36	220	2000-05-23	3rd Season	Norman	OK
437	Kira Lewis Jr.	Point Guard	185.42	170	2001-04-06	2nd Season	Meridianville	AL
438	Dyson Daniels	Guard	203.20	200	2003-03-17	Rookie	Bendigo	VIC
439	Garrett Temple	Small Forward	\N	\N	1986-05-08	\N	Baton Rouge	LA
440	Dereon Seabron	Guard	195.58	183	2000-05-26	Rookie	Norfolk	VA
441	Shai Gilgeous-Alexander	Point Guard	198.12	195	1998-07-12	4th Season	Toronto	ON
442	Josh Giddey	Shooting Guard	203.20	216	2002-10-10	1st Season	\N	\N
443	Jalen Williams	Forward	198.12	218	2001-04-14	Rookie	Gilbert	AZ
444	Luguentz Dort	Guard	193.04	220	1999-04-19	3rd Season	Montreal	PQ
445	Isaiah Joe	Shooting Guard	190.50	165	1999-07-02	2nd Season	Fort Smith	AR
446	Aleksej Pokusevski	Forward	213.36	190	2001-12-26	2nd Season	Sabac	Serbia
447	Kenrich Williams	Small Forward	198.12	210	1994-12-02	4th Season	Waco	TX
448	Tre Mann	Point Guard	190.50	184	2001-02-03	1st Season	Gainesville	FL
449	Aaron Wiggins	Shooting Guard	195.58	190	1999-01-02	1st Season	Greensboro	NC
450	Jeremiah Robinson-Earl	Power Forward	205.74	240	2000-11-03	1st Season	Kansas City	KS
451	Jared Butler	Shooting Guard	190.50	193	2000-08-25	1st Season	Reserve	LA
452	Jaylin Williams	Forward	208.28	245	2002-06-29	Rookie	Fort Smith	AR
453	Lindy Waters III	Forward	198.12	210	1997-07-28	1st Season	Norman	OK
454	Ousmane Dieng	Forward	208.28	220	2003-05-21	Rookie	\N	\N
455	Olivier Sarr	Center	213.36	240	1999-02-20	1st Season	Bordeaux	France
456	Luka Doncic	Point Guard	200.66	230	1999-02-28	5th Season	Ljubljana	Slovenia
457	Christian Wood	Forward	205.74	214	1995-09-27	6th Season	Palmdale	CA
458	Tim Hardaway Jr.	Small Forward	195.58	205	1992-03-16	9th Season	Alameda	CA
459	Josh Green	Shooting Guard	200.66	200	2000-11-16	2nd Season	Sydney	NSW
460	Jaden Hardy	Guard	190.50	198	2002-07-05	Rookie	Henderson	NV
461	Kemba Walker	Point Guard	\N	\N	1990-05-08	\N	Bronx	NY
462	Reggie Bullock	Small Forward	198.12	205	1991-03-16	9th Season	Baltimore	MD
463	Dwight Powell	Center	208.28	240	1991-07-20	8th Season	Toronto	ON
464	Maxi Kleber	Power Forward	208.28	240	1992-01-29	5th Season	Wurzburg	Germany
465	Davis Bertans	Small Forward	208.28	225	1992-11-12	6th Season	\N	\N
466	JaVale McGee	Center	213.36	270	1988-01-19	14th Season	Flint	MI
467	McKinley Wright IV	Point Guard	180.34	192	1998-10-25	1st Season	North Robbinsdale	MN
468	Tyler Dorsey	Guard	\N	\N	1996-02-14	\N	Los Angeles	CA
469	Frank Ntilikina	Point Guard	193.04	200	1998-07-28	5th Season	Ixelles	Belgium
470	Theo Pinson	Guard	200.66	212	1995-11-05	4th Season	Greensboro	NC
471	Chris Silva	Forward	\N	\N	1996-09-19	\N	Libreville	Gabon
472	Facundo Campazzo	Guard	\N	\N	1991-03-23	\N	Cardoba	Argentina
473	Lauri Markkanen	Power Forward	213.36	240	1997-05-22	5th Season	Jyvaskyla	Finland
474	Jordan Clarkson	Point Guard	195.58	194	1992-06-07	8th Season	San Antonio	TX
475	Collin Sexton	Point Guard	187.96	190	1999-01-04	4th Season	Marietta	GA
476	Kris Dunn	Guard	190.50	205	1994-03-18	Rookie	New London	CT
477	Kelly Olynyk	Power Forward	210.82	240	1991-04-19	9th Season	Toronto	ON
478	Talen Horton-Tucker	Shooting Guard	193.04	234	2000-11-25	3rd Season	Chicago	IL
479	Luka Samanic	Forward	208.28	227	2000-01-09	Rookie	Zagreb	Croatia
480	Walker Kessler	Center	213.36	245	2001-07-26	Rookie	Newnan	GA
481	Ochai Agbaji	Guard	195.58	215	2000-04-20	Rookie	Kansas City	MO
482	Simone Fontecchio	Forward	200.66	209	1995-12-09	Rookie	L'aquila	Italy
483	Jarrell Brantley	Power Forward	195.58	250	1996-06-07	1st Season	Columbia	SC
484	Rudy Gay	Small Forward	203.20	250	1986-08-17	16th Season	Baltimore	MD
485	Johnny Juzang	Guard	200.66	215	2001-03-17	Rookie	Tarzana	CA
486	Udoka Azubuike	Center	208.28	280	1999-09-17	2nd Season	Delta	Nigeria
487	Micah Potter	Center	208.28	240	1998-04-06	1st Season	Mentor	OH
488	Leandro Bolmaro	Forward	\N	\N	2000-09-11	\N	Buenos Aires	Argentina
489	Frank Jackson	Guard	\N	\N	1998-05-04	\N	Washington	DC
490	Damian Lillard	Point Guard	187.96	195	1990-07-15	9th Season	Oakland	CA
491	Anfernee Simons	Shooting Guard	190.50	181	1999-06-08	3rd Season	Altamonte Springs	FL
492	Jerami Grant	Small Forward	203.20	210	1994-03-12	7th Season	Portland	OR
493	Skylar Mays	Shooting Guard	193.04	205	1997-09-05	Rookie	Baton Rouge	LA
494	Jusuf Nurkic	Center	213.36	290	1994-08-23	7th Season	Tuzla	Bosnia & Herzegovina
495	Jeenathan Williams	Guard	195.58	205	1999-02-12	Rookie	Rochester	NY
496	Shaedon Sharpe	Shooting Guard	195.58	200	2003-05-30	Rookie	London	ON
497	Shaquille Harrison	Guard	\N	\N	1993-10-06	\N	Kansas City	MO
498	Trendon Watford	Power Forward	\N	\N	2000-11-09	\N	Birmingham	AL
499	Chance Comanche	Center	\N	\N	1996-04-14	\N	Beverly Hills	CA
500	Justise Winslow	Power Forward	198.12	222	1996-03-26	6th Season	Houston	TX
501	Nassir Little	Small Forward	195.58	220	2000-02-11	2nd Season	Orange Park	FL
502	Drew Eubanks	Power Forward	208.28	245	1997-02-01	2nd Season	Troutdale	OR
503	Keon Johnson	Shooting Guard	190.50	185	2002-03-10	Rookie	Shelbyville	TN
504	Justin Minaya	Forward	200.66	210	1999-03-26	Rookie	Harrington Park	NJ
505	Jabari Walker	Forward	200.66	200	2002-07-30	Rookie	Inglewood	CA
506	John Butler Jr.	Forward	213.36	190	2002-12-04	Rookie	Greenville	SC
507	Greg Brown III	Power Forward	\N	\N	2001-09-01	\N	Austin	TX
508	Jalen Green	Shooting Guard	193.04	186	2002-02-09	2nd Season	Merced	CA
509	Kevin Porter Jr.	Shooting Guard	193.04	203	2000-05-04	3rd Season	Seattle	WA
510	Alperen Sengun	Center	210.82	243	2002-07-25	1st Season	\N	\N
511	Jabari Smith Jr.	Power Forward	210.82	220	2003-05-13	Rookie	Fayetteville	GA
512	Kenyon Martin Jr.	Forward	200.66	215	2001-01-06	Rookie	West Hills	CA
513	Tari Eason	Forward	203.20	215	2001-05-10	Rookie	Los Angeles	CA
514	Jae'Sean Tate	Small Forward	195.58	230	1995-10-28	2nd Season	Pickerington	OH
515	Josh Christopher	Shooting Guard	193.04	215	2001-12-08	Rookie	Carson	CA
516	TyTy Washington Jr.	Guard	190.50	195	2001-11-15	Rookie	Phoenix	AZ
517	Daishen Nix	Shooting Guard	\N	\N	2002-02-13	\N	Fairbanks	AK
518	Darius Days	Forward	200.66	245	1999-10-20	Rookie	Raleigh	FL
519	Boban Marjanovic	Center	223.52	290	1988-08-15	7th Season	Zajecar	Serbia
520	Usman Garuba	Power Forward	203.20	229	2002-03-09	Rookie	\N	\N
521	Trevor Hudgins	Guard	182.88	180	1999-03-23	Rookie	Manhattan	KS
522	Keldon Johnson	Small Forward	195.58	220	1999-10-11	3rd Season	South Hill	VA
523	Devin Vassell	Shooting Guard	195.58	200	2000-08-23	2nd Season	Suwanee	GA
524	Tre Jones	Point Guard	185.42	185	2000-01-08	2nd Season	Apple Valley	MN
525	Zach Collins	Power Forward	210.82	250	1997-11-19	4th Season	Las Vegas	NV
526	Jeremy Sochan	Forward	203.20	230	2003-05-20	Rookie	Milton Keynes	England
527	Doug McDermott	Small Forward	198.12	225	1992-01-03	8th Season	Grand Forks	ND
528	Malaki Branham	Guard	193.04	180	2003-05-12	Rookie	Columbus	OH
529	Keita Bates-Diop	Small Forward	203.20	229	1996-01-23	4th Season	Sacramento	CA
530	Joshua Primo	Shooting Guard	\N	\N	2002-12-24	\N	Toronto	ON
531	Romeo Langford	Shooting Guard	195.58	216	1999-10-25	3rd Season	New Albany	IN
532	Stanley Johnson	Small Forward	\N	\N	1996-05-29	\N	Fullerton	CA
533	Charles Bassey	Center	205.74	230	2000-10-28	1st Season	Lagos	Nigeria
534	Blake Wesley	Guard	193.04	190	2003-03-16	Rookie	South Bend	IN
535	Isaiah Roby	Forward	203.20	230	1998-02-03	3rd Season	Dixon	IL
536	Dominick Barlow	Forward	208.28	220	2003-05-26	Rookie	\N	\N
537	Gorgui Dieng	Center	208.28	265	1990-01-18	9th Season	Kebemer	Senegal
538	Jordan Hall	Guard	\N	\N	2002-01-14	\N	Wildwood	NJ
539	Alize Johnson	Forward	\N	\N	1996-04-22	\N	Williamsport	PA
\.


--
-- Data for Name: player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_stats (playerid, team, gp, gs, min, pts, offreb, defreb, ast, stl, blk, turnover, pf) FROM stdin;
1	Milwaukee Bucks	63	63	32.1	31.1	2.2	9.6	5.7	0.8	0.8	3.9	3.1
2	Milwaukee Bucks	67	65	32.6	19.3	1.2	3.9	7.4	1.2	0.4	2.9	1.7
3	Milwaukee Bucks	78	78	30.4	15.9	2.0	4.7	1.3	0.5	2.5	1.4	2.6
4	Milwaukee Bucks	33	19	24.3	15.1	0.8	3.4	4.9	0.7	0.2	2.2	2.1
5	Milwaukee Bucks	70	22	26.0	14.1	2.2	7.4	1.5	0.4	0.2	1.2	1.6
6	Milwaukee Bucks	72	70	27.4	10.4	0.8	2.4	2.3	0.9	0.2	1.0	1.6
7	Milwaukee Bucks	81	39	22.4	8.0	0.4	2.1	2.4	0.8	0.4	1.0	2.0
8	Milwaukee Bucks	61	33	23.7	7.6	0.8	3.8	1.3	0.6	0.2	0.5	1.1
9	Milwaukee Bucks	7	1	12.4	7.1	0.0	1.0	2.0	0.0	0.3	1.7	1.0
10	Milwaukee Bucks	46	0	22.7	6.9	0.3	2.5	3.3	0.7	0.1	1.2	1.6
11	Milwaukee Bucks	18	3	18.9	6.9	0.9	2.9	1.5	0.7	0.3	0.4	1.5
12	Milwaukee Bucks	38	3	15.7	6.0	0.8	2.3	1.0	0.3	0.2	0.9	0.9
13	Milwaukee Bucks	7	0	11.9	5.6	0.4	1.3	1.7	0.3	0.0	1.0	0.3
14	Milwaukee Bucks	52	11	13.5	5.1	0.7	1.5	0.7	0.4	0.1	0.9	1.3
15	Milwaukee Bucks	35	0	19.1	5.0	0.4	1.5	2.5	0.5	0.1	0.8	1.2
16	Milwaukee Bucks	9	2	12.7	4.8	1.3	2.4	0.1	0.2	0.0	0.7	1.8
17	Milwaukee Bucks	35	1	9.9	4.4	0.2	1.1	0.6	0.2	0.0	0.3	0.9
18	Milwaukee Bucks	16	0	11.6	4.1	0.9	1.8	0.3	0.1	0.4	0.7	1.4
19	Milwaukee Bucks	52	0	15.8	3.4	0.7	1.5	0.7	0.4	0.3	0.3	1.4
20	Milwaukee Bucks	24	0	9.0	2.4	0.8	1.6	0.7	0.2	0.2	0.4	0.8
21	Milwaukee Bucks	37	0	5.6	1.4	0.4	0.8	0.4	0.1	0.1	0.3	0.6
22	Boston Celtics	74	74	36.9	30.1	1.1	7.7	4.6	1.1	0.7	2.9	2.2
23	Boston Celtics	67	67	35.9	26.6	1.2	5.7	3.5	1.1	0.4	2.9	2.6
24	Boston Celtics	67	0	26.0	14.9	0.6	3.6	3.7	0.7	0.3	1.5	1.6
25	Boston Celtics	82	70	28.3	12.4	0.6	2.9	3.9	0.7	0.9	1.2	2.2
26	Boston Celtics	61	61	32.1	11.5	0.8	2.4	6.3	1.5	0.4	2.3	2.8
27	Boston Celtics	63	63	30.5	9.8	1.2	5.0	3.0	0.5	1.0	0.6	1.9
28	Boston Celtics	79	23	25.9	8.1	1.1	3.5	1.7	0.5	0.4	1.0	2.4
29	Boston Celtics	35	20	23.5	8.0	3.0	5.4	1.4	0.6	1.4	1.0	1.9
30	Boston Celtics	80	8	16.1	6.4	0.4	2.1	0.9	0.4	0.3	0.4	1.2
31	Boston Celtics	20	4	16.2	5.9	0.7	2.7	0.6	0.2	0.3	0.5	1.4
32	Boston Celtics	48	3	13.4	5.6	0.5	1.3	1.3	0.3	0.0	0.8	0.8
33	Boston Celtics	41	16	13.9	4.1	1.1	2.6	1.5	0.3	0.2	0.5	1.8
34	Boston Celtics	69	0	11.7	3.8	1.2	1.6	0.8	0.2	0.7	0.4	1.2
35	Boston Celtics	2	0	11.5	2.5	1.0	1.0	1.5	0.5	0.0	0.0	0.5
7	Boston Celtics	1	0	0.0	2.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
36	Boston Celtics	12	0	5.5	1.6	0.2	0.6	0.9	0.2	0.2	0.3	0.4
37	Boston Celtics	4	0	9.0	1.5	1.3	1.3	0.0	0.5	0.0	0.3	0.8
38	Boston Celtics	23	1	7.5	1.1	0.8	1.3	0.3	0.1	0.3	0.5	1.5
39	Boston Celtics	23	0	4.7	0.9	0.1	0.7	0.4	0.2	0.2	0.1	0.3
40	Philadelphia 76ers	66	66	34.6	33.1	1.7	8.4	4.2	1.0	1.7	3.4	3.1
41	Philadelphia 76ers	58	58	36.8	21.0	0.7	5.4	10.7	1.2	0.5	3.4	1.9
42	Philadelphia 76ers	60	41	33.6	20.3	0.4	2.6	3.5	0.8	0.1	1.3	2.2
43	Philadelphia 76ers	1	0	29.0	20.0	2.0	2.0	2.0	1.0	0.0	2.0	4.0
44	Philadelphia 76ers	74	74	32.9	14.7	0.9	4.8	2.5	0.9	0.5	1.2	2.0
45	Philadelphia 76ers	2	0	20.5	12.5	1.5	3.5	4.5	0.0	0.0	1.5	1.5
46	Philadelphia 76ers	77	58	27.9	10.1	0.9	3.2	2.6	1.6	0.5	1.3	2.5
47	Philadelphia 76ers	76	11	20.6	8.4	0.5	2.0	3.2	0.3	0.2	1.2	1.6
48	Philadelphia 76ers	78	1	19.4	8.2	0.2	2.1	1.0	0.4	0.2	0.7	1.9
49	Philadelphia 76ers	24	3	17.5	6.7	0.8	2.4	0.8	0.7	0.2	0.5	2.1
50	Philadelphia 76ers	57	7	11.9	5.6	1.2	1.6	0.6	0.3	0.4	0.6	1.3
51	Philadelphia 76ers	56	5	14.4	4.8	0.2	1.5	0.8	0.3	0.2	0.5	1.2
52	Philadelphia 76ers	69	2	10.9	4.2	1.6	2.2	0.4	0.7	0.7	0.7	1.8
53	Philadelphia 76ers	37	0	9.5	3.8	0.2	1.0	0.6	0.3	0.1	0.6	0.5
54	Philadelphia 76ers	75	75	25.6	3.5	1.3	2.7	0.8	0.5	0.2	0.6	2.4
55	Philadelphia 76ers	8	1	9.5	3.5	0.8	2.4	1.3	0.3	0.6	0.8	1.8
56	Philadelphia 76ers	2	0	5.0	3.0	0.0	0.0	1.0	0.5	0.0	1.5	0.5
57	Philadelphia 76ers	49	6	12.1	2.7	0.4	0.9	0.5	0.9	0.3	0.2	1.3
58	Philadelphia 76ers	16	2	5.6	2.6	0.4	0.5	0.5	0.4	0.2	0.2	0.9
59	Philadelphia 76ers	2	0	3.5	0.0	0.0	0.0	0.0	0.5	0.0	0.0	0.0
60	Philadelphia 76ers	1	0	1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
61	Cleveland Cavaliers	68	68	35.8	28.3	0.9	3.3	4.4	1.5	0.4	2.6	2.5
62	Cleveland Cavaliers	69	69	35.5	21.6	0.4	2.3	7.8	1.2	0.1	2.9	2.1
63	Cleveland Cavaliers	79	79	34.4	16.2	2.4	6.6	2.8	0.8	1.5	1.8	2.8
64	Cleveland Cavaliers	68	68	32.6	14.3	3.3	6.5	1.7	0.8	1.2	1.4	2.3
65	Cleveland Cavaliers	74	30	30.2	12.1	0.7	3.1	3.9	1.0	0.3	1.6	2.3
66	Cleveland Cavaliers	77	2	20.1	8.7	0.3	2.0	1.5	0.5	0.1	0.7	1.6
67	Cleveland Cavaliers	41	3	20.0	8.5	1.0	5.8	1.9	0.2	0.2	1.1	1.6
68	Cleveland Cavaliers	8	0	11.9	6.5	0.3	1.0	0.5	0.6	0.4	0.9	1.3
69	Cleveland Cavaliers	76	46	21.8	6.4	0.7	1.8	1.1	0.7	0.4	0.6	2.1
70	Cleveland Cavaliers	62	25	18.1	5.3	0.8	2.6	0.5	0.4	0.3	0.4	1.3
71	Cleveland Cavaliers	33	2	17.2	5.2	0.3	1.8	3.5	0.8	0.2	0.9	1.5
72	Cleveland Cavaliers	5	0	11.8	5.0	0.0	1.8	1.0	0.8	0.0	0.0	0.6
73	Cleveland Cavaliers	44	13	20.3	4.7	0.5	3.0	0.8	0.6	0.5	0.4	2.0
74	Cleveland Cavaliers	48	1	10.5	3.3	0.2	0.8	1.6	0.4	0.1	0.5	1.0
75	Cleveland Cavaliers	37	2	8.1	3.0	0.6	0.8	0.5	0.1	0.2	0.7	1.2
76	Cleveland Cavaliers	22	2	8.0	2.6	0.4	1.0	0.4	0.2	0.4	0.5	1.2
77	Cleveland Cavaliers	12	0	7.0	2.6	0.3	1.3	0.3	0.3	0.3	0.1	0.7
78	Cleveland Cavaliers	3	0	3.3	1.7	0.0	0.0	0.3	0.3	0.0	0.3	0.0
79	New York Knicks	77	77	35.5	25.1	1.8	8.1	4.1	0.6	0.3	2.8	3.0
80	New York Knicks	68	68	35.0	24.0	0.6	3.0	6.2	0.9	0.2	2.1	2.2
81	New York Knicks	73	73	33.9	19.6	0.8	4.2	2.8	0.4	0.2	2.2	2.5
82	New York Knicks	81	21	28.9	14.9	0.7	3.4	3.4	1.0	0.2	1.2	2.0
83	New York Knicks	71	66	29.9	11.3	0.7	2.5	2.1	0.7	0.4	1.0	2.5
84	New York Knicks	25	1	30.0	10.2	1.9	5.2	3.6	1.4	0.5	1.5	2.5
85	New York Knicks	20	8	21.9	8.4	0.4	1.2	1.0	0.8	0.4	0.8	1.6
86	New York Knicks	67	5	15.7	7.4	0.4	2.4	1.0	0.3	0.2	0.6	1.0
87	New York Knicks	59	58	26.9	7.4	4.5	4.9	0.9	0.9	1.8	0.7	2.7
88	New York Knicks	27	7	17.0	6.1	0.1	1.7	1.3	0.6	0.1	0.8	1.7
89	New York Knicks	27	0	12.5	5.6	0.3	1.2	1.7	0.3	0.2	0.8	0.7
90	New York Knicks	82	8	19.9	5.0	2.5	4.0	1.2	0.6	0.8	0.8	2.6
91	New York Knicks	64	2	11.9	3.5	0.2	0.6	1.1	0.6	0.1	0.4	0.9
92	New York Knicks	52	16	15.6	3.4	1.9	2.8	0.5	0.3	0.5	0.5	1.8
93	New York Knicks	13	0	3.1	1.6	0.0	0.5	0.1	0.1	0.0	0.2	0.1
94	New York Knicks	3	0	2.7	1.0	0.0	0.7	0.0	0.0	0.0	0.0	0.0
95	New York Knicks	11	0	2.4	0.3	0.0	0.4	0.2	0.2	0.0	0.1	0.3
96	Brooklyn Nets	39	39	36.0	29.7	0.4	6.4	5.3	0.8	1.5	3.5	2.4
97	Brooklyn Nets	40	40	37.0	27.1	1.0	4.2	5.3	1.0	0.8	2.3	2.7
98	Brooklyn Nets	27	27	34.2	26.1	0.9	3.6	2.7	1.0	0.6	1.8	1.6
99	Brooklyn Nets	25	25	30.8	16.6	0.8	4.0	2.1	1.4	0.3	1.1	2.2
100	Brooklyn Nets	26	26	35.3	16.5	0.3	3.8	9.1	1.1	0.3	2.1	2.4
101	Brooklyn Nets	1	0	35.0	16.0	3.0	6.0	7.0	0.0	1.0	4.0	5.0
102	Brooklyn Nets	76	76	29.9	12.6	2.4	6.8	1.9	0.9	2.5	1.3	2.8
103	Brooklyn Nets	57	4	16.6	10.6	0.1	1.5	1.4	0.4	0.1	1.1	1.0
104	Brooklyn Nets	26	0	18.8	9.5	0.5	2.3	1.1	0.6	0.3	0.7	1.7
105	Brooklyn Nets	61	7	19.9	9.2	0.2	1.4	1.6	0.6	0.1	0.8	1.6
106	Brooklyn Nets	76	53	31.7	8.8	0.7	4.3	3.7	0.9	0.6	1.5	3.1
107	Brooklyn Nets	74	33	20.6	7.6	0.3	1.9	1.4	0.5	0.2	0.6	1.9
108	Brooklyn Nets	26	26	27.7	7.2	1.8	3.1	1.6	0.7	0.6	1.0	2.5
109	Brooklyn Nets	53	12	13.9	7.1	0.2	1.2	1.3	0.6	0.2	0.9	1.6
110	Brooklyn Nets	42	33	26.3	6.9	1.0	5.3	6.1	1.3	0.6	2.3	3.3
111	Brooklyn Nets	40	2	14.2	6.2	0.2	0.9	1.4	0.4	0.1	0.8	0.8
112	Brooklyn Nets	58	1	16.0	5.6	0.5	1.9	0.8	0.4	0.3	0.4	1.4
113	Brooklyn Nets	48	3	11.5	4.7	2.1	2.1	0.8	0.3	0.7	0.9	1.9
114	Brooklyn Nets	23	0	9.9	3.7	0.5	0.8	0.9	0.4	0.0	0.8	1.3
115	Brooklyn Nets	27	1	10.6	3.6	0.5	1.7	0.9	0.3	0.2	0.5	1.2
116	Brooklyn Nets	10	0	9.2	3.3	0.1	1.4	1.7	0.6	0.1	0.2	1.3
117	Brooklyn Nets	14	1	5.7	1.1	0.4	0.6	0.1	0.2	0.1	0.3	0.2
118	Brooklyn Nets	3	1	14.3	1.0	1.0	2.0	1.0	1.0	0.3	1.7	2.3
119	Brooklyn Nets	2	0	3.0	0.0	0.0	0.0	0.0	0.5	0.0	0.5	0.5
120	Brooklyn Nets	1	0	5.0	0.0	0.0	1.0	0.0	0.0	0.0	2.0	1.0
121	Miami Heat	64	64	33.4	22.9	2.2	3.7	5.3	1.8	0.3	1.6	1.3
122	Miami Heat	75	75	34.6	20.4	2.5	6.7	3.2	1.2	0.8	2.5	2.8
123	Miami Heat	67	67	34.9	20.1	0.4	5.0	4.2	0.8	0.2	2.4	1.5
124	Miami Heat	80	33	28.4	11.5	0.6	2.6	2.1	0.5	0.2	0.9	2.1
125	Miami Heat	55	44	31.2	11.2	0.8	3.3	5.1	1.0	0.4	1.9	2.6
126	Miami Heat	42	2	26.3	10.7	0.4	2.7	3.5	1.4	0.3	2.1	2.4
127	Miami Heat	71	49	29.3	9.6	1.2	3.6	1.6	1.0	0.4	1.1	2.0
128	Miami Heat	68	34	25.9	9.4	0.4	1.7	2.5	0.9	0.1	1.4	2.3
67	Miami Heat	21	17	20.0	7.7	0.8	4.9	1.9	0.4	0.2	1.1	1.5
129	Miami Heat	15	2	14.5	6.5	1.7	2.6	0.7	0.2	0.3	0.9	2.2
130	Miami Heat	42	1	16.4	6.4	0.2	1.5	1.1	0.3	0.0	0.7	1.8
55	Miami Heat	30	0	11.7	5.7	0.9	2.7	0.5	0.2	0.5	0.6	2.0
131	Miami Heat	15	8	13.6	5.5	0.6	1.5	0.7	0.5	0.1	0.7	1.3
132	Miami Heat	18	0	13.3	5.4	0.8	2.1	0.7	0.6	0.1	0.3	1.2
133	Miami Heat	9	0	9.2	4.4	0.9	1.7	0.2	0.2	0.2	0.4	1.8
134	Miami Heat	54	11	17.9	4.4	1.1	2.4	0.8	0.7	0.3	0.8	1.5
135	Miami Heat	7	1	10.3	3.9	0.6	1.0	0.0	0.1	0.3	0.1	1.6
136	Miami Heat	4	0	16.3	3.8	0.3	1.0	1.0	1.0	0.5	1.0	1.3
137	Miami Heat	31	1	13.7	3.7	1.5	2.5	0.8	0.4	0.4	0.5	1.7
116	Miami Heat	5	1	13.4	2.2	0.2	1.6	1.0	0.8	0.6	0.2	2.0
138	Atlanta Hawks	73	73	34.8	26.2	0.8	2.2	10.2	1.1	0.1	4.1	1.4
139	Atlanta Hawks	74	74	36.4	20.5	0.7	4.5	6.1	1.5	0.3	2.2	1.4
140	Atlanta Hawks	67	67	31.7	15.4	0.7	3.6	1.4	0.5	0.3	1.2	3.0
141	Atlanta Hawks	54	9	27.9	14.0	0.4	2.6	2.8	0.8	0.3	1.2	1.6
142	Atlanta Hawks	71	71	30.0	13.1	1.1	5.4	1.2	0.6	1.0	1.1	3.1
143	Atlanta Hawks	65	63	26.6	12.0	4.0	7.1	0.9	0.7	1.2	0.8	2.1
144	Atlanta Hawks	25	7	25.2	11.6	1.6	3.2	1.4	0.8	0.0	0.7	1.5
145	Atlanta Hawks	80	18	23.1	9.9	2.7	4.5	1.0	0.7	1.3	1.0	3.1
146	Atlanta Hawks	72	12	19.5	8.9	0.5	1.6	1.0	0.6	0.2	0.6	1.2
147	Atlanta Hawks	70	6	14.9	5.6	0.7	3.3	1.2	0.5	0.5	0.6	1.6
148	Atlanta Hawks	9	0	9.3	4.8	0.1	1.1	0.3	0.1	0.1	0.1	0.7
149	Atlanta Hawks	28	0	14.7	4.5	0.1	0.8	0.9	0.2	0.4	0.4	1.3
150	Atlanta Hawks	10	1	13.7	4.4	1.0	2.8	0.6	0.6	0.2	0.7	1.4
151	Atlanta Hawks	63	6	13.4	3.9	0.4	0.8	1.4	0.6	0.2	0.6	1.3
152	Atlanta Hawks	8	0	5.1	3.4	0.8	1.1	0.1	0.0	0.4	0.6	0.8
153	Atlanta Hawks	26	0	6.8	2.7	0.1	1.3	0.8	0.2	0.0	0.3	0.8
154	Atlanta Hawks	23	3	12.0	2.3	0.2	1.4	1.7	0.3	0.1	0.7	0.7
155	Atlanta Hawks	2	0	2.0	2.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0
156	Atlanta Hawks	16	0	4.1	1.3	0.3	0.4	0.1	0.1	0.0	0.1	0.1
157	Atlanta Hawks	29	0	5.7	1.2	0.2	0.7	0.6	0.2	0.0	0.2	0.6
158	Toronto Raptors	71	71	37.4	24.2	1.8	6.0	5.8	0.9	0.5	2.4	3.2
159	Toronto Raptors	69	69	36.7	19.3	0.4	3.6	7.2	1.8	0.6	2.0	2.8
160	Toronto Raptors	66	44	32.1	17.4	0.5	2.2	1.6	1.6	0.2	0.8	1.5
161	Toronto Raptors	67	67	35.6	16.8	1.4	3.5	2.0	1.9	0.7	2.0	3.0
162	Toronto Raptors	77	76	34.8	15.3	2.3	4.3	4.8	1.1	0.8	2.0	2.2
163	Toronto Raptors	26	25	27.2	13.1	3.2	5.9	2.2	1.2	1.3	1.1	3.0
164	Toronto Raptors	76	0	20.0	9.4	2.1	3.5	0.4	0.6	0.8	0.5	1.9
165	Toronto Raptors	55	12	20.7	9.2	1.8	4.1	0.9	0.6	0.5	1.1	1.9
166	Toronto Raptors	8	2	18.3	5.5	0.8	1.6	1.0	1.4	0.0	0.5	0.9
167	Toronto Raptors	53	2	13.0	4.6	0.3	1.2	1.3	0.4	0.1	0.5	1.2
168	Toronto Raptors	31	2	9.0	4.6	0.4	1.1	1.2	0.4	0.4	0.6	1.1
169	Toronto Raptors	16	2	13.2	4.5	0.3	1.3	1.1	0.7	0.2	0.2	1.1
170	Toronto Raptors	54	9	14.7	4.4	1.3	1.8	1.4	1.0	0.1	0.8	1.6
171	Toronto Raptors	58	19	13.8	3.1	1.4	1.5	0.5	0.4	1.0	0.3	2.2
172	Toronto Raptors	42	10	14.6	2.9	0.6	2.3	0.6	0.4	0.1	0.4	1.0
173	Toronto Raptors	25	0	10.4	2.4	0.2	0.7	1.2	0.4	0.1	0.2	0.5
174	Toronto Raptors	9	0	5.3	2.2	0.3	0.4	0.4	0.0	0.1	0.0	0.3
175	Toronto Raptors	20	0	8.1	2.2	0.4	0.9	0.4	0.3	0.3	0.4	1.2
35	Toronto Raptors	3	0	3.7	2.0	0.3	1.0	0.3	0.0	0.0	0.0	0.3
176	Toronto Raptors	9	0	5.6	1.0	0.0	0.4	0.3	0.0	0.0	0.1	0.3
177	Chicago Bulls	77	77	35.9	24.8	0.5	3.9	4.2	0.9	0.2	2.5	2.1
178	Chicago Bulls	74	74	36.2	24.5	0.5	4.2	5.1	1.1	0.5	2.1	2.5
179	Chicago Bulls	82	82	33.5	17.6	1.9	9.1	3.2	0.7	0.7	1.7	2.2
180	Chicago Bulls	82	65	28.3	10.2	1.0	3.0	1.2	0.9	0.9	1.2	1.8
181	Chicago Bulls	74	2	23.4	9.7	0.2	2.6	2.8	0.7	0.1	1.0	1.6
182	Chicago Bulls	80	51	26.2	8.6	0.6	2.2	2.6	0.8	0.3	1.2	2.3
13	Chicago Bulls	51	0	15.4	6.4	0.3	1.1	2.7	0.2	0.1	1.1	1.2
183	Chicago Bulls	67	0	12.7	6.0	2.1	4.6	0.5	0.7	0.4	1.1	1.7
184	Chicago Bulls	22	22	27.5	5.8	0.9	4.0	3.5	1.0	0.7	0.8	2.9
185	Chicago Bulls	67	36	23.5	5.6	0.6	2.3	2.9	1.5	0.7	1.1	2.4
186	Chicago Bulls	32	1	15.0	5.2	0.8	1.9	0.7	0.8	0.7	0.6	1.6
187	Chicago Bulls	64	0	14.0	5.0	0.9	1.5	0.5	0.5	0.6	0.4	1.3
188	Chicago Bulls	5	0	7.2	4.0	1.0	0.6	0.0	0.0	0.2	0.0	0.4
189	Chicago Bulls	7	0	8.0	2.9	0.1	0.6	0.9	0.3	0.0	0.3	0.3
190	Chicago Bulls	38	0	5.6	2.2	0.3	0.7	0.6	0.3	0.1	0.2	0.6
191	Chicago Bulls	12	0	2.8	1.6	0.1	0.8	0.1	0.1	0.1	0.1	0.2
192	Chicago Bulls	5	0	1.8	1.0	0.0	0.6	0.0	0.0	0.0	0.0	0.2
193	Chicago Bulls	7	0	2.9	0.9	0.1	0.1	0.0	0.0	0.0	0.0	0.7
194	Indiana Pacers	56	56	33.6	20.7	0.6	3.1	10.4	1.6	0.4	2.5	1.2
195	Indiana Pacers	62	62	29.4	18.0	1.4	6.1	1.4	0.6	2.3	1.7	3.5
196	Indiana Pacers	80	73	31.0	16.8	0.8	4.2	2.8	1.2	0.3	1.7	2.0
197	Indiana Pacers	78	17	28.5	16.7	1.1	3.0	1.5	0.6	0.2	1.9	2.1
12	Indiana Pacers	24	11	24.6	13.0	0.9	3.8	2.1	0.5	0.3	1.3	1.7
198	Indiana Pacers	73	60	24.9	10.1	0.8	2.9	1.3	0.8	0.5	1.0	3.2
199	Indiana Pacers	75	63	27.7	9.5	0.5	2.2	4.5	0.9	0.2	1.7	2.4
200	Indiana Pacers	68	31	18.8	9.4	1.9	3.9	1.0	0.3	0.9	1.1	2.3
201	Indiana Pacers	75	6	20.3	8.7	0.6	2.5	5.3	1.1	0.1	1.9	1.4
202	Indiana Pacers	3	0	18.7	8.0	0.0	2.0	1.7	0.7	0.0	0.0	1.7
203	Indiana Pacers	46	12	19.5	7.9	0.4	2.1	1.4	0.5	0.2	0.9	1.4
204	Indiana Pacers	63	12	16.5	7.2	1.8	2.7	0.8	0.5	1.5	0.8	2.4
205	Indiana Pacers	7	1	15.6	7.0	1.0	2.1	1.3	0.3	0.9	0.4	1.0
206	Indiana Pacers	65	2	16.7	6.1	1.0	2.4	0.7	0.5	0.2	0.5	1.2
15	Indiana Pacers	11	1	15.1	5.2	0.2	1.5	1.9	0.6	0.3	0.6	1.3
207	Indiana Pacers	21	0	9.6	3.3	1.2	1.1	0.9	0.4	0.5	0.6	1.6
208	Indiana Pacers	7	0	10.0	3.0	1.1	1.3	0.9	0.3	0.7	1.0	0.6
209	Indiana Pacers	18	1	9.0	2.8	0.2	1.4	0.8	0.4	0.3	0.4	1.8
188	Indiana Pacers	26	2	8.8	2.7	0.8	0.7	0.4	0.1	0.2	0.3	0.9
210	Indiana Pacers	6	0	6.7	1.5	0.3	0.7	0.5	0.7	0.0	0.3	1.5
211	Washington Wizards	50	50	33.5	23.2	0.8	3.1	5.4	0.9	0.7	2.9	2.1
212	Washington Wizards	65	65	32.6	23.2	1.8	6.6	2.7	0.9	1.5	2.1	3.0
213	Washington Wizards	64	64	35.0	21.2	0.9	6.4	3.7	0.6	0.5	3.0	2.3
214	Washington Wizards	30	0	24.3	13.0	0.6	3.6	1.2	0.4	0.4	1.2	1.3
215	Washington Wizards	74	45	28.3	11.1	0.4	2.4	1.2	0.4	0.1	0.7	1.3
216	Washington Wizards	62	61	27.4	10.3	0.4	3.0	5.3	0.7	0.2	1.0	1.2
217	Washington Wizards	76	40	26.6	9.2	1.0	5.4	2.8	0.9	0.4	1.6	2.8
218	Washington Wizards	78	47	20.6	9.0	2.1	3.5	1.1	0.4	1.3	1.1	2.4
169	Washington Wizards	40	0	19.6	7.7	0.3	2.5	2.4	0.4	0.3	1.1	1.0
219	Washington Wizards	31	0	14.1	7.5	0.3	1.4	1.8	0.5	0.1	1.1	1.0
220	Washington Wizards	50	14	24.4	7.4	1.2	2.4	3.9	1.8	0.3	0.9	1.2
221	Washington Wizards	7	0	13.6	7.3	0.9	2.1	1.4	0.4	0.6	0.7	2.1
222	Washington Wizards	62	7	17.8	6.6	0.9	2.4	2.7	0.9	0.4	0.9	1.5
223	Washington Wizards	9	0	15.0	6.2	0.2	0.7	1.7	0.4	0.1	0.4	1.1
224	Washington Wizards	28	5	15.1	5.8	0.3	1.9	1.0	0.4	0.3	0.6	1.7
225	Washington Wizards	10	1	12.6	3.8	1.6	2.2	0.6	0.6	0.4	0.8	1.3
226	Washington Wizards	49	2	9.8	3.4	0.7	1.2	0.7	0.3	0.2	0.5	1.7
227	Washington Wizards	59	8	10.6	3.3	0.6	1.1	0.6	0.1	0.2	0.3	1.2
228	Washington Wizards	2	0	3.0	1.5	0.0	0.0	0.5	0.5	0.0	0.0	0.5
229	Washington Wizards	6	1	10.2	1.5	0.3	1.7	0.7	0.2	0.0	0.3	0.7
230	Washington Wizards	11	0	2.5	0.5	0.3	0.7	0.3	0.2	0.2	0.2	0.5
231	Washington Wizards	6	0	8.8	0.5	1.0	0.7	1.3	0.8	0.0	0.5	1.5
136	Washington Wizards	1	0	6.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0	1.0
232	Orlando Magic	72	72	33.8	20.0	1.2	5.7	3.7	0.8	0.5	2.8	2.2
233	Orlando Magic	80	80	32.6	18.6	0.9	3.2	3.5	1.0	0.2	2.1	2.3
234	Orlando Magic	57	54	29.6	15.2	2.1	6.6	2.3	0.5	0.6	1.9	2.8
235	Orlando Magic	60	60	29.6	14.0	1.2	2.8	5.7	1.5	0.4	2.3	2.2
236	Orlando Magic	60	4	25.9	13.0	0.8	4.0	3.9	0.6	0.5	1.5	2.6
237	Orlando Magic	57	18	19.5	10.5	1.2	3.3	1.5	0.6	0.2	1.2	2.4
238	Orlando Magic	53	19	23.5	9.9	1.0	2.0	2.9	1.3	0.5	1.8	2.3
239	Orlando Magic	70	33	21.5	9.1	1.0	4.8	1.0	0.4	1.2	1.6	1.3
240	Orlando Magic	48	42	24.7	8.3	0.4	1.6	1.2	0.9	0.3	0.6	1.9
241	Orlando Magic	42	9	22.5	8.0	0.2	1.8	1.3	0.6	0.2	0.9	1.3
242	Orlando Magic	40	6	17.0	7.3	1.2	3.4	1.1	0.3	1.0	0.6	2.2
243	Orlando Magic	2	0	15.0	6.5	0.0	3.0	0.5	1.0	0.0	1.5	1.0
207	Orlando Magic	17	1	15.0	5.8	2.1	3.1	1.2	0.4	0.9	0.6	1.8
244	Orlando Magic	26	0	13.9	5.7	0.3	1.2	1.3	0.6	0.2	0.8	0.8
245	Orlando Magic	11	0	11.3	5.0	1.4	2.6	0.5	1.3	0.4	0.4	0.5
246	Orlando Magic	27	8	19.2	4.7	1.0	2.6	1.4	0.7	0.4	0.6	1.5
247	Orlando Magic	4	0	11.0	4.3	0.3	1.0	1.8	0.3	0.3	1.0	1.3
248	Orlando Magic	37	0	12.2	4.2	0.6	1.1	0.8	0.2	0.1	0.4	1.6
249	Orlando Magic	34	0	13.4	4.1	0.8	1.2	0.5	0.5	0.1	0.6	1.6
250	Orlando Magic	51	4	15.9	3.8	0.7	1.3	0.6	0.2	0.1	0.4	1.2
251	Charlotte Hornets	36	36	35.2	23.3	1.2	5.3	8.4	1.3	0.3	3.6	3.3
252	Charlotte Hornets	63	63	35.3	21.1	0.8	3.3	5.1	1.2	0.3	2.1	1.9
253	Charlotte Hornets	48	40	32.3	20.3	1.4	3.8	1.1	1.4	0.4	1.3	2.9
254	Charlotte Hornets	73	73	32.6	15.7	1.0	3.9	2.4	0.9	1.1	1.5	2.6
255	Charlotte Hornets	50	50	31.5	14.7	0.7	3.6	4.1	0.8	0.2	2.0	1.4
256	Charlotte Hornets	56	56	28.5	12.2	3.3	6.3	3.7	0.6	0.6	1.6	2.9
49	Charlotte Hornets	56	21	26.7	10.6	0.8	4.0	2.0	1.2	0.5	1.4	2.8
93	Charlotte Hornets	19	8	22.5	10.6	0.8	1.6	2.7	0.7	0.2	1.2	1.2
257	Charlotte Hornets	43	17	19.3	9.0	2.2	4.9	0.4	0.7	1.0	0.9	2.2
258	Charlotte Hornets	54	15	25.7	8.8	0.5	2.6	4.8	1.4	0.5	1.5	2.3
259	Charlotte Hornets	65	9	18.7	8.2	2.3	4.1	0.6	0.2	1.1	0.9	2.4
260	Charlotte Hornets	44	7	19.4	6.7	0.3	2.5	3.5	0.8	0.3	1.3	1.4
261	Charlotte Hornets	34	0	15.1	5.6	0.2	1.9	1.2	0.4	0.1	0.9	1.4
262	Charlotte Hornets	46	7	17.1	5.3	0.4	1.6	1.2	0.3	0.1	0.9	1.0
263	Charlotte Hornets	7	0	19.1	5.0	1.1	2.3	1.6	0.6	0.1	0.3	1.9
264	Charlotte Hornets	4	0	12.0	4.3	0.0	1.3	1.3	0.0	0.3	0.8	1.8
265	Charlotte Hornets	69	8	14.0	3.8	0.5	1.7	0.5	0.3	0.3	0.6	1.0
266	Charlotte Hornets	46	0	12.0	3.4	0.8	1.9	0.3	0.4	0.7	0.7	1.4
267	Charlotte Hornets	5	0	5.6	1.0	0.2	0.6	1.0	0.0	0.4	0.2	0.0
268	Detroit Pistons	59	59	32.1	21.6	0.6	3.2	2.6	0.6	0.1	2.3	1.9
269	Detroit Pistons	12	12	33.3	19.9	1.0	5.2	6.0	0.8	0.6	3.3	2.8
270	Detroit Pistons	74	73	31.1	16.3	1.0	2.9	5.2	0.8	0.2	3.2	3.3
144	Detroit Pistons	52	30	28.8	14.8	1.1	3.5	1.6	1.0	0.2	1.0	1.7
271	Detroit Pistons	51	8	22.0	12.8	0.4	2.7	2.2	0.7	0.2	1.1	1.9
272	Detroit Pistons	24	22	25.2	12.7	2.3	5.8	0.7	0.2	0.8	1.5	2.9
273	Detroit Pistons	42	25	23.6	12.0	2.2	4.2	0.9	0.5	0.7	1.1	1.9
274	Detroit Pistons	50	47	28.3	11.3	2.3	5.8	1.4	0.4	0.7	1.4	2.7
275	Detroit Pistons	76	56	28.3	10.3	0.4	2.5	6.2	1.4	0.4	2.3	2.9
276	Detroit Pistons	17	4	21.9	9.7	1.2	2.2	1.0	0.8	0.2	1.1	2.6
277	Detroit Pistons	56	0	17.8	9.3	1.0	2.4	1.0	0.9	0.3	1.3	2.2
278	Detroit Pistons	67	31	24.9	9.1	3.4	5.5	1.1	0.7	0.9	1.4	2.7
244	Detroit Pistons	21	3	18.5	7.3	0.4	1.9	1.0	0.5	0.2	1.0	1.4
279	Detroit Pistons	62	2	19.8	6.9	0.3	1.4	3.5	0.5	0.1	0.9	1.4
280	Detroit Pistons	52	22	23.1	6.7	0.5	2.2	0.8	0.5	0.5	0.6	2.0
281	Detroit Pistons	32	12	16.4	5.7	0.6	1.7	0.9	0.5	0.0	0.3	1.2
282	Detroit Pistons	42	1	14.1	5.6	0.5	2.1	0.4	0.3	0.3	0.8	1.8
283	Detroit Pistons	14	0	14.1	3.2	0.8	1.9	0.3	0.3	0.1	0.2	1.6
118	Detroit Pistons	14	3	10.9	2.3	0.5	2.1	0.5	0.9	0.6	0.6	1.8
284	Detroit Pistons	1	0	2.0	2.0	0.0	0.0	0.0	1.0	1.0	0.0	0.0
285	Detroit Pistons	10	0	9.0	1.6	0.2	0.4	0.4	0.2	0.0	0.0	0.6
286	Detroit Pistons	3	0	3.0	1.3	0.0	0.3	0.0	0.0	0.0	0.0	0.0
287	Denver Nuggets	69	69	33.7	24.5	2.4	9.4	9.8	1.3	0.7	3.6	2.5
288	Denver Nuggets	65	65	32.8	20.0	0.7	3.2	6.2	1.0	0.2	2.2	1.6
289	Denver Nuggets	62	62	29.0	17.4	1.0	4.5	1.0	0.6	0.5	1.1	1.9
290	Denver Nuggets	68	68	30.2	16.3	2.4	4.1	3.0	0.8	0.8	1.4	1.9
291	Denver Nuggets	42	1	19.5	12.1	0.2	1.8	3.0	0.7	0.3	1.6	1.6
292	Denver Nuggets	80	31	28.5	11.5	0.8	3.3	3.4	1.1	0.6	1.5	2.4
293	Denver Nuggets	76	76	31.3	10.8	0.5	2.3	2.4	1.5	0.5	1.1	1.9
294	Denver Nuggets	16	2	19.9	7.9	0.2	1.6	3.1	0.6	0.1	1.2	1.4
295	Denver Nuggets	56	4	19.5	7.8	0.7	1.9	1.2	0.3	0.3	0.8	1.8
296	Denver Nuggets	53	5	13.7	5.2	1.2	1.4	0.3	0.3	0.4	0.6	2.0
297	Denver Nuggets	39	8	15.0	5.1	1.3	3.8	0.9	0.3	0.6	1.2	1.8
298	Denver Nuggets	60	9	14.8	5.0	0.4	1.7	1.3	0.4	0.2	0.6	1.4
299	Denver Nuggets	76	6	15.5	4.7	0.6	1.8	0.8	0.5	0.2	0.5	1.3
300	Denver Nuggets	18	1	11.4	4.6	1.1	2.3	0.1	0.1	0.4	0.6	1.4
301	Denver Nuggets	23	2	8.1	3.3	0.3	1.3	0.5	0.1	0.5	0.3	0.6
302	Denver Nuggets	43	0	9.3	2.5	0.1	1.1	2.3	0.2	0.2	1.0	0.8
303	Denver Nuggets	35	1	9.0	2.3	0.3	1.3	0.5	0.4	0.1	0.6	1.0
304	Denver Nuggets	17	0	3.9	1.2	0.4	0.6	0.2	0.2	0.1	0.1	0.5
305	Memphis Grizzlies	61	59	31.9	26.2	1.0	4.9	8.1	1.1	0.3	3.4	1.6
306	Memphis Grizzlies	58	58	31.7	21.5	0.7	4.3	4.4	1.0	0.4	2.2	2.6
307	Memphis Grizzlies	63	63	28.4	18.6	1.7	5.0	1.0	1.0	3.0	1.7	3.6
308	Memphis Grizzlies	73	73	30.3	14.3	0.6	2.7	2.6	0.9	0.2	1.4	3.3
309	Memphis Grizzlies	24	3	24.6	11.3	0.4	2.8	2.3	0.5	0.0	0.7	1.5
310	Memphis Grizzlies	80	22	24.2	10.3	0.4	2.2	5.2	1.0	0.1	0.9	0.4
311	Memphis Grizzlies	56	8	19.5	10.0	1.6	3.9	1.3	0.6	0.7	1.0	2.3
312	Memphis Grizzlies	77	20	21.8	9.0	1.1	3.7	1.3	0.6	0.6	0.8	1.9
313	Memphis Grizzlies	42	42	27.0	8.6	5.1	6.5	2.3	0.9	1.1	1.9	2.3
314	Memphis Grizzlies	61	29	19.3	7.0	2.0	3.0	1.6	1.0	0.5	0.7	1.6
315	Memphis Grizzlies	70	4	18.0	6.7	0.7	2.0	0.8	0.4	0.3	0.8	1.5
316	Memphis Grizzlies	37	4	15.2	5.7	0.4	1.7	0.9	0.4	0.2	1.0	1.6
317	Memphis Grizzlies	72	23	20.8	5.1	0.9	3.4	1.4	1.1	0.3	0.5	1.6
318	Memphis Grizzlies	24	1	7.3	5.0	0.8	1.3	0.8	0.2	0.1	0.5	1.2
68	Memphis Grizzlies	3	0	14.3	3.0	0.3	1.0	0.7	0.3	0.0	1.0	2.0
319	Memphis Grizzlies	1	0	41.0	3.0	0.0	4.0	7.0	3.0	0.0	2.0	3.0
320	Memphis Grizzlies	35	0	11.8	3.0	0.5	1.3	0.6	0.3	0.1	0.5	1.4
321	Memphis Grizzlies	36	0	7.8	2.2	0.3	0.8	1.6	0.3	0.1	0.5	0.4
322	Memphis Grizzlies	15	1	7.0	2.0	0.3	0.7	0.3	0.4	0.1	0.3	0.8
323	Sacramento Kings	73	73	33.4	25.0	0.5	3.6	6.1	1.1	0.3	2.5	2.4
324	Sacramento Kings	79	79	34.6	19.1	3.2	9.1	7.3	0.8	0.5	2.9	3.5
325	Sacramento Kings	75	75	29.4	15.2	0.6	2.8	2.9	1.1	0.3	1.3	2.4
326	Sacramento Kings	82	82	32.5	15.0	1.1	3.4	1.6	0.7	0.1	1.0	1.3
327	Sacramento Kings	77	0	22.3	13.5	0.4	2.2	3.9	0.6	0.3	1.9	1.6
328	Sacramento Kings	80	78	29.8	12.2	1.1	3.5	1.2	0.8	0.5	0.8	2.0
329	Sacramento Kings	74	0	16.9	7.6	0.9	3.1	0.9	0.4	0.4	0.9	1.3
330	Sacramento Kings	64	5	13.1	6.7	0.3	1.9	1.0	0.7	0.2	0.8	1.6
331	Sacramento Kings	80	9	18.1	5.6	0.2	1.1	2.3	0.6	0.2	0.8	1.4
332	Sacramento Kings	66	0	10.4	4.9	0.7	2.3	0.6	0.3	0.3	0.5	1.2
117	Sacramento Kings	22	3	13.9	3.9	0.8	1.4	1.0	0.5	0.2	0.4	1.7
333	Sacramento Kings	42	1	8.3	3.1	0.7	1.2	0.2	0.1	0.3	0.3	1.2
334	Sacramento Kings	5	0	5.8	2.4	1.0	1.2	0.2	0.0	0.4	0.2	1.4
335	Sacramento Kings	26	2	6.2	1.7	0.9	1.4	0.5	0.2	0.4	0.6	1.1
336	Sacramento Kings	16	0	4.4	1.5	0.3	0.3	0.4	0.3	0.1	0.1	0.6
337	Sacramento Kings	32	0	6.7	1.5	0.0	0.4	1.3	0.2	0.0	0.3	0.6
338	Sacramento Kings	16	0	4.9	1.4	0.1	0.8	0.6	0.4	0.1	0.3	0.4
339	Sacramento Kings	35	3	7.1	1.3	0.2	0.8	0.4	0.2	0.2	0.2	1.1
340	Sacramento Kings	2	0	4.0	1.0	1.0	0.0	0.5	0.0	0.0	1.0	1.0
341	Sacramento Kings	2	0	3.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
342	Phoenix Suns	53	53	34.6	27.8	0.9	3.7	5.5	1.0	0.3	2.7	3.0
96	Phoenix Suns	8	8	33.6	26.0	0.4	6.0	3.5	0.3	1.3	2.5	0.9
343	Phoenix Suns	67	67	30.4	18.0	2.6	7.4	1.7	0.6	0.8	1.8	2.8
98	Phoenix Suns	56	56	36.4	17.2	1.0	3.3	3.6	1.2	0.8	1.4	2.1
99	Phoenix Suns	17	16	25.2	13.9	0.8	3.0	1.5	0.9	0.4	0.6	1.7
344	Phoenix Suns	59	59	32.0	13.9	0.5	3.8	8.9	1.5	0.4	1.9	2.1
345	Phoenix Suns	48	15	20.2	10.3	0.3	2.0	4.5	0.7	0.2	1.7	1.8
241	Phoenix Suns	21	0	18.4	9.0	0.6	2.7	2.0	0.5	0.1	0.3	2.1
346	Phoenix Suns	40	9	20.2	8.7	0.3	1.4	2.3	0.7	0.1	0.9	1.5
347	Phoenix Suns	74	5	20.4	8.2	0.5	2.5	1.3	0.4	0.1	1.1	1.6
348	Phoenix Suns	31	3	12.7	7.9	0.1	1.1	2.0	0.2	0.1	1.1	0.7
349	Phoenix Suns	79	60	24.7	7.4	1.8	3.6	1.5	0.6	0.8	0.9	2.3
350	Phoenix Suns	72	26	18.8	7.3	1.5	2.0	1.5	0.8	0.5	0.9	1.6
351	Phoenix Suns	69	4	14.2	6.6	1.7	2.3	1.0	0.2	0.4	0.9	1.8
56	Phoenix Suns	23	1	15.8	6.3	0.6	1.4	2.8	0.8	0.0	0.9	1.3
352	Phoenix Suns	37	12	14.4	5.8	1.1	2.8	1.5	0.4	0.1	1.0	1.9
353	Phoenix Suns	61	14	14.3	4.3	1.5	2.8	0.9	0.3	1.4	0.8	1.9
104	Phoenix Suns	16	0	12.3	4.2	0.8	2.3	0.7	0.4	0.3	0.2	1.3
354	Phoenix Suns	60	2	15.3	4.2	0.8	1.6	0.9	0.6	0.4	0.4	2.0
355	Phoenix Suns	7	0	8.7	4.0	0.7	1.6	0.9	0.4	0.7	0.7	1.3
356	LA Clippers	52	50	33.6	23.8	1.1	5.4	3.9	1.4	0.5	1.7	1.6
357	LA Clippers	56	56	34.6	23.8	0.8	5.3	5.1	1.5	0.4	3.1	2.8
358	LA Clippers	60	8	26.1	17.0	0.4	2.5	1.8	0.8	0.3	1.7	2.1
359	LA Clippers	21	21	30.2	15.8	1.4	3.4	7.6	1.1	0.5	3.4	2.0
360	LA Clippers	34	3	22.2	11.4	0.4	2.3	5.2	0.8	0.4	2.4	1.7
361	LA Clippers	65	65	28.1	11.2	0.4	3.5	1.8	0.6	0.3	0.9	2.1
362	LA Clippers	22	11	24.9	11.0	0.2	1.5	2.1	0.6	0.4	1.0	1.5
294	LA Clippers	52	38	25.7	10.9	0.4	1.8	3.5	0.7	0.1	1.8	1.8
291	LA Clippers	14	0	18.9	10.8	0.7	2.8	3.4	0.8	0.1	1.1	2.1
363	LA Clippers	76	76	28.5	10.8	3.1	6.8	1.0	0.4	1.3	1.5	2.9
364	LA Clippers	81	36	23.1	8.8	1.0	2.5	2.3	0.5	0.3	1.0	1.8
309	LA Clippers	35	11	20.7	7.8	0.2	2.2	1.1	0.5	0.1	0.9	1.3
256	LA Clippers	23	4	19.9	7.5	1.8	5.1	1.7	0.5	0.5	1.3	2.4
365	LA Clippers	22	1	11.3	6.5	0.3	1.0	0.9	0.4	0.0	0.5	1.0
366	LA Clippers	78	19	21.9	6.1	0.8	3.0	1.6	0.7	0.6	0.6	1.9
367	LA Clippers	48	0	16.2	6.0	0.6	2.8	1.2	0.8	0.7	0.7	1.8
119	LA Clippers	34	1	8.5	4.6	1.7	2.4	0.1	0.1	0.4	0.4	1.1
368	LA Clippers	50	9	12.5	3.4	0.3	0.7	1.1	0.1	0.1	0.4	1.0
369	LA Clippers	14	0	8.9	2.9	0.1	1.4	1.9	0.1	0.0	0.7	0.5
370	LA Clippers	22	1	8.9	2.7	1.4	0.9	0.2	0.3	0.4	0.4	0.7
371	LA Clippers	4	0	5.0	1.8	0.0	0.8	1.3	0.0	0.0	0.3	0.5
372	Golden State Warriors	56	56	34.7	29.4	0.7	5.4	6.3	0.9	0.4	3.2	2.1
373	Golden State Warriors	69	69	33.0	21.9	0.6	3.6	2.4	0.7	0.4	1.8	1.9
374	Golden State Warriors	82	43	30.0	20.4	0.4	2.4	4.5	0.8	0.3	3.1	2.6
375	Golden State Warriors	37	37	32.2	17.1	1.6	3.4	2.3	1.2	0.8	1.3	2.9
376	Golden State Warriors	67	16	20.8	9.9	1.0	2.4	1.9	0.6	0.5	1.4	2.3
377	Golden State Warriors	72	36	26.3	9.4	1.1	3.4	3.5	1.3	0.1	1.6	1.8
378	Golden State Warriors	73	73	31.5	8.5	0.9	6.3	6.8	1.0	0.8	2.8	3.1
379	Golden State Warriors	82	70	23.9	7.0	3.3	5.9	2.5	0.6	0.6	0.5	2.7
272	Golden State Warriors	21	0	12.5	6.9	0.9	2.6	0.7	0.1	0.3	0.7	1.9
380	Golden State Warriors	45	2	18.1	6.9	0.2	1.6	3.0	0.5	0.1	0.7	1.4
381	Golden State Warriors	62	4	19.3	6.7	0.9	2.6	1.5	0.5	0.3	0.9	2.2
382	Golden State Warriors	57	1	14.0	6.4	1.3	2.3	0.9	0.4	0.4	0.9	1.8
383	Golden State Warriors	7	0	16.0	5.7	2.0	2.3	1.1	0.9	0.6	0.6	2.0
384	Golden State Warriors	63	3	13.0	4.8	0.4	1.2	0.8	0.3	0.1	0.5	0.9
385	Golden State Warriors	31	0	7.3	3.9	0.0	1.3	0.4	0.2	0.1	0.4	0.5
386	Golden State Warriors	4	0	4.5	2.5	0.3	0.5	0.5	0.3	0.0	1.3	0.0
387	Golden State Warriors	8	0	14.1	2.1	0.4	1.8	2.4	0.5	0.4	1.1	1.4
388	Golden State Warriors	12	0	5.2	1.9	0.3	0.8	0.5	0.1	0.1	1.3	0.8
389	Los Angeles Lakers	55	54	35.5	28.9	1.2	7.1	6.8	0.9	0.6	3.2	1.6
390	Los Angeles Lakers	56	54	34.0	25.9	3.5	9.1	2.6	1.1	2.0	2.2	2.6
391	Los Angeles Lakers	17	17	30.9	17.4	0.4	2.5	6.1	0.6	0.5	2.3	1.4
359	Los Angeles Lakers	52	3	28.7	15.9	1.1	5.0	7.5	1.0	0.4	3.5	2.3
392	Los Angeles Lakers	64	22	28.8	13.0	0.5	2.5	3.4	0.5	0.3	1.5	1.7
393	Los Angeles Lakers	66	50	30.1	12.6	0.3	2.2	4.5	0.8	0.2	1.7	2.2
300	Los Angeles Lakers	41	25	21.4	12.1	1.6	5.2	0.7	0.3	0.6	0.7	1.9
394	Los Angeles Lakers	56	32	23.2	11.7	0.3	1.7	1.1	0.5	0.3	0.8	1.3
395	Los Angeles Lakers	26	14	23.9	11.1	0.3	3.0	1.2	0.8	0.0	1.2	1.2
214	Los Angeles Lakers	33	9	22.4	9.6	1.0	3.7	0.7	0.2	0.4	0.5	1.0
396	Los Angeles Lakers	26	24	24.0	7.2	1.9	4.8	1.6	1.2	0.2	1.1	2.2
397	Los Angeles Lakers	76	45	24.5	7.1	0.8	3.2	1.3	0.8	0.2	0.6	1.6
219	Los Angeles Lakers	39	2	13.5	6.7	0.1	1.3	0.9	0.3	0.1	0.8	0.9
184	Los Angeles Lakers	45	45	26.9	6.4	0.5	2.6	2.6	0.9	0.6	0.9	2.8
398	Los Angeles Lakers	68	2	15.1	5.5	1.7	2.5	0.5	0.4	0.5	0.7	2.1
399	Los Angeles Lakers	12	0	10.8	3.9	0.2	1.0	0.3	0.2	0.0	0.3	1.2
242	Los Angeles Lakers	9	1	9.8	3.7	1.2	3.3	0.4	0.1	0.6	0.9	2.1
400	Los Angeles Lakers	41	3	12.5	3.1	0.2	1.7	0.5	0.2	0.2	0.3	0.8
401	Los Angeles Lakers	30	7	12.2	2.7	0.5	1.6	0.8	0.3	0.2	0.6	1.5
402	Los Angeles Lakers	22	1	8.0	2.5	0.8	1.7	0.2	0.1	0.5	0.4	0.8
403	Los Angeles Lakers	6	0	5.3	2.3	0.3	0.3	0.3	0.3	0.2	0.3	0.5
404	Los Angeles Lakers	7	0	5.9	1.3	0.1	0.9	0.6	0.0	0.0	0.0	0.4
303	Los Angeles Lakers	8	0	3.4	1.0	0.1	0.4	0.5	0.3	0.0	0.0	0.4
405	Los Angeles Lakers	4	0	6.0	0.0	0.8	1.3	0.5	0.8	0.0	0.0	1.0
406	Minnesota Timberwolves	79	79	36.0	24.6	0.6	5.2	4.4	1.6	0.7	3.3	2.4
407	Minnesota Timberwolves	29	29	33.0	20.8	1.7	6.5	4.8	0.7	0.6	3.0	3.8
391	Minnesota Timberwolves	54	54	32.9	17.9	0.5	2.5	6.2	1.1	0.4	2.7	2.2
408	Minnesota Timberwolves	24	24	31.4	14.0	0.7	2.5	5.0	1.2	0.2	1.2	1.9
409	Minnesota Timberwolves	70	70	30.7	13.4	3.3	8.3	1.2	0.8	1.4	1.7	3.0
410	Minnesota Timberwolves	79	79	30.6	12.1	1.2	2.7	1.9	0.9	1.0	1.4	3.4
411	Minnesota Timberwolves	68	11	18.4	11.5	1.1	3.8	1.1	0.6	0.8	1.4	2.6
412	Minnesota Timberwolves	65	2	19.3	10.8	0.6	2.1	2.0	0.6	0.1	1.0	1.6
413	Minnesota Timberwolves	69	46	28.4	9.4	1.0	4.4	4.9	1.1	0.9	1.5	2.1
414	Minnesota Timberwolves	54	4	22.1	9.1	0.3	2.2	1.6	0.5	0.3	1.3	2.3
415	Minnesota Timberwolves	28	0	8.7	6.5	1.2	1.1	0.6	0.1	0.1	0.5	1.5
416	Minnesota Timberwolves	23	0	15.5	5.9	0.3	1.5	1.4	0.3	0.3	0.4	1.3
417	Minnesota Timberwolves	52	10	19.5	4.9	0.1	1.5	1.4	0.5	0.1	0.4	1.5
418	Minnesota Timberwolves	43	0	15.8	3.7	0.3	1.1	3.4	0.7	0.1	0.8	0.7
419	Minnesota Timberwolves	38	0	7.7	3.7	0.6	0.9	0.3	0.3	0.2	0.6	1.1
420	Minnesota Timberwolves	25	0	10.7	3.6	0.2	0.4	0.7	0.3	0.1	0.5	0.9
399	Minnesota Timberwolves	22	0	8.2	3.4	0.1	0.5	0.5	0.1	0.0	0.2	0.6
421	Minnesota Timberwolves	15	0	6.4	3.1	0.3	1.3	0.3	0.3	0.4	0.2	0.7
422	Minnesota Timberwolves	1	0	2.0	2.0	0.0	1.0	0.0	0.0	0.0	0.0	1.0
423	Minnesota Timberwolves	29	2	5.3	1.4	0.1	0.5	0.6	0.3	0.2	0.3	0.4
424	New Orleans Pelicans	29	29	33.0	26.0	2.0	5.0	4.6	1.1	0.6	3.4	2.2
425	New Orleans Pelicans	45	45	34.2	24.7	0.5	5.0	5.8	0.7	0.4	3.3	2.6
426	New Orleans Pelicans	75	75	35.3	20.9	0.7	3.6	5.7	0.9	0.5	2.4	2.0
427	New Orleans Pelicans	79	65	31.0	14.5	0.7	2.8	1.4	1.1	0.5	0.8	2.0
428	New Orleans Pelicans	79	79	24.9	14.1	2.8	7.3	1.8	0.3	0.7	2.0	3.1
429	New Orleans Pelicans	66	66	29.6	9.8	1.5	2.6	2.5	1.6	0.6	1.3	3.2
430	New Orleans Pelicans	77	21	23.3	9.1	0.6	3.0	2.5	0.7	0.2	1.3	1.5
431	New Orleans Pelicans	61	10	21.5	9.0	0.5	1.9	3.0	1.1	0.2	1.3	2.0
432	New Orleans Pelicans	23	4	23.2	7.5	0.5	2.0	1.6	1.3	0.4	1.0	2.0
433	New Orleans Pelicans	38	2	12.1	6.9	1.5	3.2	0.9	0.4	0.3	1.0	1.7
434	New Orleans Pelicans	65	1	21.2	6.8	1.6	3.8	1.8	0.9	0.6	0.6	2.0
435	New Orleans Pelicans	53	0	15.3	5.3	0.2	1.1	2.2	0.6	0.2	0.5	0.9
436	New Orleans Pelicans	47	2	13.0	5.0	0.8	2.0	0.7	0.4	0.4	0.7	1.4
437	New Orleans Pelicans	25	0	9.4	4.6	0.2	1.1	0.9	0.4	0.1	0.4	1.0
438	New Orleans Pelicans	59	11	17.7	3.8	0.6	2.6	2.3	0.7	0.2	1.0	1.7
439	New Orleans Pelicans	25	0	6.5	2.0	0.2	0.5	0.5	0.4	0.1	0.2	0.6
440	New Orleans Pelicans	5	0	2.4	0.8	0.2	0.0	0.0	0.0	0.0	0.0	0.2
441	Oklahoma City Thunder	68	68	35.5	31.4	0.9	4.0	5.5	1.6	1.0	2.8	2.8
442	Oklahoma City Thunder	76	76	31.1	16.6	1.9	5.9	6.2	0.8	0.4	2.8	1.9
443	Oklahoma City Thunder	75	62	30.3	14.1	1.1	3.4	3.3	1.4	0.5	1.6	2.5
444	Oklahoma City Thunder	74	73	30.7	13.7	1.7	2.9	2.1	1.0	0.3	1.2	3.3
445	Oklahoma City Thunder	73	10	19.1	9.5	0.4	2.0	1.2	0.7	0.1	0.5	1.4
446	Oklahoma City Thunder	34	25	20.6	8.1	1.3	3.4	1.9	0.6	1.3	1.3	1.7
447	Oklahoma City Thunder	53	10	22.8	8.0	1.8	3.1	2.0	0.8	0.3	0.6	2.1
448	Oklahoma City Thunder	67	5	17.7	7.7	0.4	1.9	1.8	0.6	0.2	0.9	1.5
352	Oklahoma City Thunder	20	0	13.7	7.4	0.7	2.6	0.9	0.4	0.1	1.0	1.5
449	Oklahoma City Thunder	70	14	18.5	6.8	1.0	2.0	1.1	0.6	0.2	0.8	1.6
450	Oklahoma City Thunder	43	20	18.9	6.8	1.7	2.5	1.0	0.6	0.3	0.4	1.7
451	Oklahoma City Thunder	6	1	12.8	6.2	0.2	0.5	1.3	0.8	0.0	0.8	0.8
31	Oklahoma City Thunder	43	5	14.5	6.2	0.5	2.6	0.9	0.3	0.4	0.3	1.6
452	Oklahoma City Thunder	49	36	18.7	5.9	0.9	4.0	1.6	0.6	0.2	0.8	2.3
355	Oklahoma City Thunder	36	1	15.4	5.4	0.8	2.6	0.9	0.5	0.8	0.6	1.0
453	Oklahoma City Thunder	41	0	13.0	5.2	0.4	1.4	0.7	0.3	0.3	0.2	1.0
454	Oklahoma City Thunder	39	1	14.6	4.9	0.5	2.2	1.2	0.4	0.2	0.7	1.1
276	Oklahoma City Thunder	23	2	11.8	4.9	1.0	1.3	0.5	0.6	0.0	0.7	2.0
455	Oklahoma City Thunder	9	1	12.7	4.0	1.3	2.1	0.4	0.1	0.6	0.4	1.9
456	Dallas Mavericks	66	66	36.2	32.4	0.8	7.8	8.0	1.4	0.5	3.6	2.5
97	Dallas Mavericks	20	20	38.2	27.0	1.1	4.0	6.0	1.3	0.6	1.9	2.8
100	Dallas Mavericks	53	53	34.1	17.7	0.4	2.7	5.3	0.7	0.3	1.7	2.3
457	Dallas Mavericks	67	17	25.9	16.6	1.3	6.0	1.8	0.4	1.1	1.8	2.5
458	Dallas Mavericks	71	45	30.3	14.4	0.3	3.2	1.8	0.7	0.2	0.8	1.7
108	Dallas Mavericks	40	40	32.2	9.1	1.7	3.0	1.5	1.0	0.5	0.9	2.0
459	Dallas Mavericks	60	21	25.7	9.1	0.9	2.1	1.7	0.7	0.1	1.2	2.6
460	Dallas Mavericks	48	5	14.8	8.8	0.2	1.6	1.4	0.4	0.1	1.0	1.3
461	Dallas Mavericks	9	1	16.0	8.0	0.3	1.4	2.1	0.2	0.2	0.4	1.2
462	Dallas Mavericks	78	55	30.3	7.2	0.4	3.2	1.4	0.7	0.2	0.5	2.1
463	Dallas Mavericks	76	64	19.2	6.7	2.0	2.2	0.9	0.6	0.3	0.9	2.8
464	Dallas Mavericks	37	5	25.1	5.9	0.8	2.8	1.4	0.3	0.8	0.7	2.3
465	Dallas Mavericks	45	1	10.9	4.6	0.2	1.0	0.5	0.2	0.2	0.2	1.2
115	Dallas Mavericks	8	1	8.8	4.5	0.0	1.5	0.8	0.1	0.0	0.5	1.9
466	Dallas Mavericks	42	7	8.5	4.4	0.7	1.8	0.3	0.1	0.6	0.9	1.3
149	Dallas Mavericks	18	2	16.4	4.4	0.2	1.6	0.9	0.8	0.5	0.6	1.7
467	Dallas Mavericks	27	1	12.4	4.2	0.3	1.4	2.1	0.3	0.2	0.7	0.9
422	Dallas Mavericks	14	0	7.6	3.9	0.4	1.0	0.1	0.1	0.0	0.2	0.7
468	Dallas Mavericks	3	0	2.7	3.0	0.3	0.3	0.0	0.0	0.0	0.0	0.0
469	Dallas Mavericks	47	5	12.9	2.9	0.1	1.2	1.2	0.3	0.1	0.6	1.4
470	Dallas Mavericks	40	1	8.1	2.4	0.3	1.3	1.2	0.2	0.0	0.3	0.9
471	Dallas Mavericks	1	0	3.0	2.0	0.0	0.0	0.0	0.0	0.0	1.0	2.0
472	Dallas Mavericks	8	0	6.5	1.3	0.0	0.3	1.1	0.8	0.0	0.4	0.4
473	Utah Jazz	66	66	34.4	25.6	2.0	6.7	1.9	0.6	0.6	1.9	2.1
474	Utah Jazz	61	61	32.6	20.8	1.2	2.9	4.4	0.5	0.2	3.0	2.0
475	Utah Jazz	48	15	23.9	14.3	0.8	1.4	2.9	0.6	0.1	1.8	2.3
395	Utah Jazz	55	13	26.8	13.4	0.5	3.1	1.7	0.8	0.1	1.1	1.4
476	Utah Jazz	22	3	25.8	13.2	0.4	4.1	5.6	1.1	0.5	1.6	2.6
477	Utah Jazz	68	68	28.6	12.5	1.2	5.0	3.7	0.9	0.5	2.5	3.4
478	Utah Jazz	65	20	20.2	10.7	0.6	2.6	3.8	0.6	0.4	1.9	1.7
408	Utah Jazz	43	42	29.7	10.7	0.4	2.1	7.7	1.0	0.2	1.7	2.2
479	Utah Jazz	7	4	23.0	9.9	0.0	4.3	2.1	0.9	0.3	1.4	2.4
480	Utah Jazz	74	40	23.0	9.2	3.1	5.3	0.9	0.4	2.3	0.8	2.3
396	Utah Jazz	52	41	24.1	8.3	2.3	5.5	2.7	1.0	0.3	1.3	2.6
481	Utah Jazz	59	22	20.5	7.9	0.7	1.3	1.1	0.3	0.3	0.7	1.7
416	Utah Jazz	36	3	14.7	6.3	0.2	1.4	2.1	0.7	0.4	1.3	1.6
482	Utah Jazz	52	6	14.7	6.3	0.6	1.1	0.8	0.3	0.2	0.8	1.2
483	Utah Jazz	4	0	9.8	5.5	0.3	1.3	0.8	0.0	0.5	0.5	0.8
484	Utah Jazz	56	0	14.6	5.2	0.6	2.3	1.0	0.3	0.3	0.7	1.2
485	Utah Jazz	18	0	12.9	4.8	0.4	1.7	0.4	0.2	0.2	0.2	0.7
402	Utah Jazz	19	0	15.8	4.6	1.3	2.3	0.6	0.3	0.5	0.7	2.0
486	Utah Jazz	36	4	10.0	3.5	0.9	2.4	0.3	0.2	0.4	0.5	0.9
487	Utah Jazz	7	0	7.4	3.4	0.4	1.9	0.6	0.1	0.0	0.3	0.7
401	Utah Jazz	22	2	15.2	3.4	0.6	2.2	1.8	0.3	0.1	0.8	1.5
488	Utah Jazz	14	0	4.9	0.4	0.3	0.2	0.5	0.2	0.1	0.5	0.7
489	Utah Jazz	1	0	5.0	0.0	1.0	1.0	1.0	0.0	0.0	0.0	0.0
490	Portland Trail Blazers	58	58	36.3	32.2	0.8	4.0	7.3	0.9	0.3	3.3	1.9
491	Portland Trail Blazers	62	62	35.0	21.1	0.3	2.3	4.1	0.7	0.2	2.1	2.3
492	Portland Trail Blazers	63	63	35.7	20.5	0.8	3.7	2.4	0.8	0.8	1.8	2.4
493	Portland Trail Blazers	6	6	31.5	15.3	0.3	2.8	8.3	1.0	0.2	1.7	1.8
494	Portland Trail Blazers	52	52	26.8	13.3	2.2	6.9	2.9	0.8	0.8	2.3	3.6
85	Portland Trail Blazers	20	12	27.6	11.0	0.6	2.3	1.9	1.2	0.3	1.6	2.0
495	Portland Trail Blazers	5	4	25.4	10.6	2.0	1.0	2.0	0.6	0.4	0.8	2.6
496	Portland Trail Blazers	80	15	22.2	9.9	0.8	2.2	1.2	0.5	0.3	1.0	1.7
84	Portland Trail Blazers	51	51	33.4	9.5	1.9	6.3	3.9	1.1	0.2	1.5	2.6
497	Portland Trail Blazers	5	0	24.0	8.8	0.2	4.2	6.0	2.2	0.4	1.2	2.4
282	Portland Trail Blazers	21	4	17.1	8.5	0.7	2.6	0.9	0.5	0.0	0.9	1.0
57	Portland Trail Blazers	22	22	27.7	7.4	0.9	2.6	1.4	1.7	0.8	0.7	2.2
498	Portland Trail Blazers	62	12	19.1	7.4	0.7	3.2	2.1	0.5	0.2	1.1	1.9
499	Portland Trail Blazers	1	0	21.0	7.0	2.0	1.0	0.0	0.0	1.0	0.0	0.0
500	Portland Trail Blazers	29	11	26.8	6.8	1.7	3.3	3.4	1.0	0.4	1.5	3.1
501	Portland Trail Blazers	54	4	18.1	6.6	0.5	2.1	0.9	0.4	0.4	0.7	1.2
502	Portland Trail Blazers	78	28	20.3	6.6	1.7	3.7	1.3	0.5	1.3	0.9	2.2
503	Portland Trail Blazers	40	0	10.4	4.7	0.3	0.8	1.5	0.5	0.2	1.1	1.1
504	Portland Trail Blazers	4	0	22.3	4.3	0.8	3.0	1.0	0.5	1.3	1.0	2.3
383	Portland Trail Blazers	15	1	17.0	4.1	0.7	1.9	1.5	1.1	0.1	0.8	1.9
505	Portland Trail Blazers	56	0	11.1	3.9	0.9	1.5	0.6	0.2	0.2	0.5	1.2
95	Portland Trail Blazers	9	4	16.2	2.6	0.0	1.2	2.3	0.3	0.0	0.7	1.6
506	Portland Trail Blazers	19	1	11.6	2.4	0.2	0.7	0.6	0.4	0.5	0.1	1.2
507	Portland Trail Blazers	16	0	5.8	1.8	0.1	1.1	0.2	0.3	0.3	0.4	0.8
508	Houston Rockets	76	76	34.2	22.1	0.6	3.2	3.7	0.8	0.2	2.6	1.7
509	Houston Rockets	59	59	34.3	19.2	1.3	4.0	5.7	1.4	0.3	3.2	2.6
510	Houston Rockets	75	72	28.9	14.8	3.2	5.8	3.9	0.9	0.9	2.6	3.4
362	Houston Rockets	47	47	30.2	13.1	0.3	1.8	2.9	0.6	0.4	1.8	1.0
511	Houston Rockets	79	79	31.0	12.8	1.5	5.7	1.3	0.5	0.9	1.3	2.9
512	Houston Rockets	82	49	28.0	12.7	1.5	4.0	1.5	0.5	0.4	1.1	1.8
513	Houston Rockets	82	5	21.5	9.3	2.4	3.7	1.1	1.2	0.6	1.2	2.3
514	Houston Rockets	31	7	21.8	9.1	1.3	2.5	2.7	0.7	0.2	1.5	3.4
515	Houston Rockets	64	2	12.3	5.8	0.3	0.8	1.1	0.5	0.2	0.9	0.9
148	Houston Rockets	45	0	13.4	4.8	0.2	1.2	0.5	0.5	0.1	0.4	1.2
516	Houston Rockets	31	2	14.0	4.7	0.1	1.4	1.5	0.5	0.1	0.5	0.9
152	Houston Rockets	31	4	11.7	4.1	1.5	2.4	1.0	0.2	1.0	0.6	2.2
517	Houston Rockets	57	7	16.0	4.0	0.3	1.4	2.3	0.5	0.1	1.5	1.0
518	Houston Rockets	4	0	6.3	3.8	0.3	1.3	0.3	0.0	0.3	0.0	0.5
519	Houston Rockets	31	0	5.5	3.3	0.6	1.3	0.3	0.2	0.1	0.5	0.3
520	Houston Rockets	75	1	12.9	3.0	1.6	2.5	0.9	0.6	0.4	0.6	1.8
153	Houston Rockets	10	0	5.9	1.8	0.4	1.2	1.1	0.1	0.3	0.0	0.1
521	Houston Rockets	5	0	5.6	1.8	0.0	0.0	0.6	0.0	0.0	0.2	0.2
522	San Antonio Spurs	63	63	32.7	22.0	0.9	4.2	2.9	0.7	0.2	2.1	2.0
523	San Antonio Spurs	38	32	31.0	18.5	0.2	3.7	3.6	1.1	0.4	1.5	1.5
435	San Antonio Spurs	20	8	26.4	13.0	0.4	2.2	4.0	0.8	0.3	1.3	1.6
524	San Antonio Spurs	68	65	29.2	12.9	0.8	2.8	6.6	1.3	0.1	1.6	1.4
163	San Antonio Spurs	46	46	26.1	12.1	3.3	5.7	3.1	0.8	1.1	2.1	2.6
525	San Antonio Spurs	63	26	22.9	11.6	1.8	4.5	2.9	0.6	0.8	2.0	3.2
432	San Antonio Spurs	42	6	23.7	11.5	0.7	2.1	3.3	1.0	0.3	1.5	1.7
59	San Antonio Spurs	15	3	20.9	11.0	0.7	3.3	0.7	0.3	0.3	0.7	1.7
526	San Antonio Spurs	56	53	26.0	11.0	1.7	3.6	2.5	0.8	0.4	1.7	2.5
20	San Antonio Spurs	19	7	23.3	10.8	2.7	4.1	2.4	0.5	0.4	1.4	1.7
527	San Antonio Spurs	64	0	20.5	10.2	0.4	1.8	1.4	0.2	0.1	0.9	1.8
528	San Antonio Spurs	66	32	23.5	10.2	0.4	2.3	1.9	0.5	0.1	1.2	1.7
529	San Antonio Spurs	67	42	21.7	9.7	1.0	2.7	1.5	0.7	0.3	0.8	0.9
530	San Antonio Spurs	4	0	23.3	7.0	0.5	2.8	4.5	0.3	0.5	2.8	2.0
531	San Antonio Spurs	43	21	19.6	6.9	1.3	1.3	1.2	0.6	0.3	0.7	1.6
532	San Antonio Spurs	30	0	15.6	5.8	0.7	2.4	2.2	0.5	0.2	1.1	1.6
533	San Antonio Spurs	35	2	14.5	5.7	2.1	3.4	1.3	0.5	0.9	1.2	2.1
534	San Antonio Spurs	37	1	18.1	5.0	0.3	1.9	2.7	0.7	0.1	1.8	1.8
535	San Antonio Spurs	42	2	11.3	4.1	0.5	2.1	0.9	0.4	0.2	0.7	1.3
536	San Antonio Spurs	28	0	14.6	3.9	1.6	2.0	0.9	0.4	0.7	0.5	2.0
537	San Antonio Spurs	31	1	11.5	3.9	0.9	2.6	1.7	0.1	0.5	1.0	1.8
538	San Antonio Spurs	9	0	9.2	3.1	0.3	1.0	1.2	0.1	0.0	0.8	0.7
539	San Antonio Spurs	4	0	7.5	1.8	0.5	2.0	0.3	0.3	0.0	1.0	0.8
\.


--
-- Data for Name: team_matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_matches (matchday, matchdate, team1, court, team2, winner, score1, score2, overtime) FROM stdin;
Thursday	2022-10-20	Milwaukee Bucks	Team 2	Philadelphia 76ers	Milwaukee Bucks	90	88	f
Saturday	2022-10-22	Milwaukee Bucks	Team 1	Houston Rockets	Milwaukee Bucks	125	105	f
Wednesday	2022-10-26	Milwaukee Bucks	Team 1	Brooklyn Nets	Milwaukee Bucks	110	99	f
Friday	2022-10-28	Milwaukee Bucks	Team 1	New York Knicks	Milwaukee Bucks	119	108	f
Saturday	2022-10-29	Milwaukee Bucks	Team 1	Atlanta Hawks	Milwaukee Bucks	123	115	f
Monday	2022-10-31	Milwaukee Bucks	Team 1	Detroit Pistons	Milwaukee Bucks	110	108	f
Wednesday	2022-11-02	Milwaukee Bucks	Team 1	Detroit Pistons	Milwaukee Bucks	116	91	f
Friday	2022-11-04	Milwaukee Bucks	Team 2	Minnesota Timberwolves	Milwaukee Bucks	115	102	f
Saturday	2022-11-05	Milwaukee Bucks	Team 1	Oklahoma City Thunder	Milwaukee Bucks	108	94	f
Wednesday	2022-11-09	Milwaukee Bucks	Team 2	Oklahoma City Thunder	Milwaukee Bucks	136	132	t
Wednesday	2022-11-16	Milwaukee Bucks	Team 1	Cleveland Cavaliers	Milwaukee Bucks	113	98	f
Monday	2022-11-21	Milwaukee Bucks	Team 1	Portland Trail Blazers	Milwaukee Bucks	119	111	f
Friday	2022-11-25	Milwaukee Bucks	Team 1	Cleveland Cavaliers	Milwaukee Bucks	117	102	f
Sunday	2022-11-27	Milwaukee Bucks	Team 1	Dallas Mavericks	Milwaukee Bucks	124	115	f
Wednesday	2022-11-30	Milwaukee Bucks	Team 2	New York Knicks	Milwaukee Bucks	109	103	f
Saturday	2022-12-03	Milwaukee Bucks	Team 2	Charlotte Hornets	Milwaukee Bucks	105	96	f
Monday	2022-12-05	Milwaukee Bucks	Team 2	Orlando Magic	Milwaukee Bucks	109	102	f
Wednesday	2022-12-07	Milwaukee Bucks	Team 1	Sacramento Kings	Milwaukee Bucks	126	113	f
Friday	2022-12-09	Milwaukee Bucks	Team 2	Dallas Mavericks	Milwaukee Bucks	106	105	f
Tuesday	2022-12-13	Milwaukee Bucks	Team 1	Golden State Warriors	Milwaukee Bucks	128	111	f
Saturday	2022-12-17	Milwaukee Bucks	Team 1	Utah Jazz	Milwaukee Bucks	123	97	f
Monday	2022-12-19	Milwaukee Bucks	Team 2	New Orleans Pelicans	Milwaukee Bucks	128	119	f
Friday	2022-12-30	Milwaukee Bucks	Team 1	Minnesota Timberwolves	Milwaukee Bucks	123	114	f
Tuesday	2023-01-03	Milwaukee Bucks	Team 1	Washington Wizards	Milwaukee Bucks	123	113	f
Wednesday	2023-01-04	Milwaukee Bucks	Team 2	Toronto Raptors	Milwaukee Bucks	104	101	t
Monday	2023-01-09	Milwaukee Bucks	Team 2	New York Knicks	Milwaukee Bucks	111	107	f
Wednesday	2023-01-11	Milwaukee Bucks	Team 2	Atlanta Hawks	Milwaukee Bucks	114	105	f
Monday	2023-01-16	Milwaukee Bucks	Team 1	Indiana Pacers	Milwaukee Bucks	132	119	f
Tuesday	2023-01-17	Milwaukee Bucks	Team 1	Toronto Raptors	Milwaukee Bucks	130	122	f
Monday	2023-01-23	Milwaukee Bucks	Team 2	Detroit Pistons	Milwaukee Bucks	150	130	f
Wednesday	2023-01-25	Milwaukee Bucks	Team 1	Denver Nuggets	Milwaukee Bucks	107	99	f
Friday	2023-01-27	Milwaukee Bucks	Team 2	Indiana Pacers	Milwaukee Bucks	141	131	f
Sunday	2023-01-29	Milwaukee Bucks	Team 1	New Orleans Pelicans	Milwaukee Bucks	135	110	f
Tuesday	2023-01-31	Milwaukee Bucks	Team 1	Charlotte Hornets	Milwaukee Bucks	124	115	f
Thursday	2023-02-02	Milwaukee Bucks	Team 1	LA Clippers	Milwaukee Bucks	106	105	f
Saturday	2023-02-04	Milwaukee Bucks	Team 1	Miami Heat	Milwaukee Bucks	123	115	f
Monday	2023-02-06	Milwaukee Bucks	Team 2	Portland Trail Blazers	Milwaukee Bucks	127	108	f
Thursday	2023-02-09	Milwaukee Bucks	Team 2	Los Angeles Lakers	Milwaukee Bucks	115	106	f
Friday	2023-02-10	Milwaukee Bucks	Team 2	LA Clippers	Milwaukee Bucks	119	106	f
Tuesday	2023-02-14	Milwaukee Bucks	Team 1	Boston Celtics	Milwaukee Bucks	131	125	t
Thursday	2023-02-16	Milwaukee Bucks	Team 2	Chicago Bulls	Milwaukee Bucks	112	100	f
Friday	2023-02-24	Milwaukee Bucks	Team 1	Miami Heat	Milwaukee Bucks	128	99	f
Sunday	2023-02-26	Milwaukee Bucks	Team 1	Phoenix Suns	Milwaukee Bucks	104	101	f
Tuesday	2023-02-28	Milwaukee Bucks	Team 2	Brooklyn Nets	Milwaukee Bucks	118	104	f
Wednesday	2023-03-01	Milwaukee Bucks	Team 1	Orlando Magic	Milwaukee Bucks	139	117	f
Sunday	2023-03-05	Milwaukee Bucks	Team 2	Washington Wizards	Milwaukee Bucks	117	111	f
Tuesday	2023-03-07	Milwaukee Bucks	Team 2	Orlando Magic	Milwaukee Bucks	134	123	f
Thursday	2023-03-09	Milwaukee Bucks	Team 1	Brooklyn Nets	Milwaukee Bucks	118	113	f
Monday	2023-03-13	Milwaukee Bucks	Team 2	Sacramento Kings	Milwaukee Bucks	133	124	f
Tuesday	2023-03-14	Milwaukee Bucks	Team 2	Phoenix Suns	Milwaukee Bucks	116	104	f
Sunday	2023-03-19	Milwaukee Bucks	Team 1	Toronto Raptors	Milwaukee Bucks	118	111	f
Wednesday	2023-03-22	Milwaukee Bucks	Team 1	San Antonio Spurs	Milwaukee Bucks	130	94	f
Friday	2023-03-24	Milwaukee Bucks	Team 2	Utah Jazz	Milwaukee Bucks	144	116	f
Monday	2023-03-27	Milwaukee Bucks	Team 2	Detroit Pistons	Milwaukee Bucks	126	117	f
Wednesday	2023-03-29	Milwaukee Bucks	Team 2	Indiana Pacers	Milwaukee Bucks	149	136	f
Sunday	2023-04-02	Milwaukee Bucks	Team 1	Philadelphia 76ers	Milwaukee Bucks	117	104	f
Tuesday	2023-04-04	Milwaukee Bucks	Team 2	Washington Wizards	Milwaukee Bucks	140	128	f
Wednesday	2023-04-05	Milwaukee Bucks	Team 1	Chicago Bulls	Milwaukee Bucks	105	92	f
Tuesday	2022-10-18	Boston Celtics	Team 1	Philadelphia 76ers	Boston Celtics	126	117	f
Friday	2022-10-21	Boston Celtics	Team 2	Miami Heat	Boston Celtics	111	104	f
Saturday	2022-10-22	Boston Celtics	Team 2	Orlando Magic	Boston Celtics	126	120	f
Sunday	2022-10-30	Boston Celtics	Team 1	Washington Wizards	Boston Celtics	112	94	f
Friday	2022-11-04	Boston Celtics	Team 1	Chicago Bulls	Boston Celtics	123	119	f
Saturday	2022-11-05	Boston Celtics	Team 2	New York Knicks	Boston Celtics	133	118	f
Monday	2022-11-07	Boston Celtics	Team 2	Memphis Grizzlies	Boston Celtics	109	106	f
Wednesday	2022-11-09	Boston Celtics	Team 1	Detroit Pistons	Boston Celtics	128	112	f
Friday	2022-11-11	Boston Celtics	Team 1	Denver Nuggets	Boston Celtics	131	112	f
Saturday	2022-11-12	Boston Celtics	Team 2	Detroit Pistons	Boston Celtics	117	108	f
Monday	2022-11-14	Boston Celtics	Team 1	Oklahoma City Thunder	Boston Celtics	126	122	f
Wednesday	2022-11-16	Boston Celtics	Team 2	Atlanta Hawks	Boston Celtics	126	101	f
Friday	2022-11-18	Boston Celtics	Team 2	New Orleans Pelicans	Boston Celtics	117	109	f
Wednesday	2022-11-23	Boston Celtics	Team 1	Dallas Mavericks	Boston Celtics	125	112	f
Friday	2022-11-25	Boston Celtics	Team 1	Sacramento Kings	Boston Celtics	122	104	f
Sunday	2022-11-27	Boston Celtics	Team 1	Washington Wizards	Boston Celtics	130	121	f
Monday	2022-11-28	Boston Celtics	Team 1	Charlotte Hornets	Boston Celtics	140	105	f
Wednesday	2022-11-30	Boston Celtics	Team 1	Miami Heat	Boston Celtics	134	121	f
Sunday	2022-12-04	Boston Celtics	Team 2	Brooklyn Nets	Boston Celtics	103	92	f
Monday	2022-12-05	Boston Celtics	Team 2	Toronto Raptors	Boston Celtics	116	110	f
Wednesday	2022-12-07	Boston Celtics	Team 2	Phoenix Suns	Boston Celtics	125	98	f
Tuesday	2022-12-13	Boston Celtics	Team 2	Los Angeles Lakers	Boston Celtics	122	118	t
Friday	2022-12-23	Boston Celtics	Team 1	Minnesota Timberwolves	Boston Celtics	121	109	f
Sunday	2022-12-25	Boston Celtics	Team 1	Milwaukee Bucks	Boston Celtics	139	118	f
Tuesday	2022-12-27	Boston Celtics	Team 1	Houston Rockets	Boston Celtics	126	102	f
Thursday	2022-12-29	Boston Celtics	Team 1	LA Clippers	Boston Celtics	116	110	f
Thursday	2023-01-05	Boston Celtics	Team 2	Dallas Mavericks	Boston Celtics	124	95	f
Saturday	2023-01-07	Boston Celtics	Team 2	San Antonio Spurs	Boston Celtics	121	116	f
Monday	2023-01-09	Boston Celtics	Team 1	Chicago Bulls	Boston Celtics	107	99	f
Wednesday	2023-01-11	Boston Celtics	Team 1	New Orleans Pelicans	Boston Celtics	125	114	f
Thursday	2023-01-12	Boston Celtics	Team 2	Brooklyn Nets	Boston Celtics	109	98	f
Saturday	2023-01-14	Boston Celtics	Team 2	Charlotte Hornets	Boston Celtics	122	106	f
Monday	2023-01-16	Boston Celtics	Team 2	Charlotte Hornets	Boston Celtics	130	118	f
Thursday	2023-01-19	Boston Celtics	Team 1	Golden State Warriors	Boston Celtics	121	118	t
Saturday	2023-01-21	Boston Celtics	Team 2	Toronto Raptors	Boston Celtics	106	104	f
Saturday	2023-01-28	Boston Celtics	Team 1	Los Angeles Lakers	Boston Celtics	125	121	t
Wednesday	2023-02-01	Boston Celtics	Team 1	Brooklyn Nets	Boston Celtics	139	96	f
Monday	2023-02-06	Boston Celtics	Team 2	Detroit Pistons	Boston Celtics	111	99	f
Wednesday	2023-02-08	Boston Celtics	Team 1	Philadelphia 76ers	Boston Celtics	106	99	f
Friday	2023-02-10	Boston Celtics	Team 1	Charlotte Hornets	Boston Celtics	127	116	f
Sunday	2023-02-12	Boston Celtics	Team 1	Memphis Grizzlies	Boston Celtics	119	109	f
Wednesday	2023-02-15	Boston Celtics	Team 1	Detroit Pistons	Boston Celtics	127	109	f
Thursday	2023-02-23	Boston Celtics	Team 2	Indiana Pacers	Boston Celtics	142	138	t
Saturday	2023-02-25	Boston Celtics	Team 2	Philadelphia 76ers	Boston Celtics	110	107	f
Wednesday	2023-03-01	Boston Celtics	Team 1	Cleveland Cavaliers	Boston Celtics	117	113	f
Wednesday	2023-03-08	Boston Celtics	Team 1	Portland Trail Blazers	Boston Celtics	115	93	f
Saturday	2023-03-11	Boston Celtics	Team 2	Atlanta Hawks	Boston Celtics	134	125	f
Wednesday	2023-03-15	Boston Celtics	Team 2	Minnesota Timberwolves	Boston Celtics	104	102	f
Friday	2023-03-17	Boston Celtics	Team 2	Portland Trail Blazers	Boston Celtics	126	112	f
Tuesday	2023-03-21	Boston Celtics	Team 2	Sacramento Kings	Boston Celtics	132	109	f
Friday	2023-03-24	Boston Celtics	Team 1	Indiana Pacers	Boston Celtics	120	95	f
Sunday	2023-03-26	Boston Celtics	Team 1	San Antonio Spurs	Boston Celtics	137	93	f
Thursday	2023-03-30	Boston Celtics	Team 2	Milwaukee Bucks	Boston Celtics	140	99	f
Friday	2023-03-31	Boston Celtics	Team 1	Utah Jazz	Boston Celtics	122	114	f
Wednesday	2023-04-05	Boston Celtics	Team 1	Toronto Raptors	Boston Celtics	97	93	f
Friday	2023-04-07	Boston Celtics	Team 1	Toronto Raptors	Boston Celtics	121	102	f
Sunday	2023-04-09	Boston Celtics	Team 1	Atlanta Hawks	Boston Celtics	120	114	f
Monday	2022-10-24	Philadelphia 76ers	Team 1	Indiana Pacers	Philadelphia 76ers	120	106	f
Friday	2022-10-28	Philadelphia 76ers	Team 2	Toronto Raptors	Philadelphia 76ers	112	90	f
Saturday	2022-10-29	Philadelphia 76ers	Team 2	Chicago Bulls	Philadelphia 76ers	114	109	f
Monday	2022-10-31	Philadelphia 76ers	Team 2	Washington Wizards	Philadelphia 76ers	118	111	f
Monday	2022-11-07	Philadelphia 76ers	Team 1	Phoenix Suns	Philadelphia 76ers	100	88	f
Saturday	2022-11-12	Philadelphia 76ers	Team 1	Atlanta Hawks	Philadelphia 76ers	121	109	f
Sunday	2022-11-13	Philadelphia 76ers	Team 1	Utah Jazz	Philadelphia 76ers	105	98	f
Friday	2022-11-18	Philadelphia 76ers	Team 1	Milwaukee Bucks	Philadelphia 76ers	110	102	f
Tuesday	2022-11-22	Philadelphia 76ers	Team 1	Brooklyn Nets	Philadelphia 76ers	115	106	f
Friday	2022-11-25	Philadelphia 76ers	Team 2	Orlando Magic	Philadelphia 76ers	107	99	f
Sunday	2022-11-27	Philadelphia 76ers	Team 2	Orlando Magic	Philadelphia 76ers	133	103	f
Monday	2022-11-28	Philadelphia 76ers	Team 1	Atlanta Hawks	Philadelphia 76ers	104	101	f
Friday	2022-12-09	Philadelphia 76ers	Team 1	Los Angeles Lakers	Philadelphia 76ers	133	122	t
Sunday	2022-12-11	Philadelphia 76ers	Team 1	Charlotte Hornets	Philadelphia 76ers	131	113	f
Tuesday	2022-12-13	Philadelphia 76ers	Team 1	Sacramento Kings	Philadelphia 76ers	123	103	f
Friday	2022-12-16	Philadelphia 76ers	Team 1	Golden State Warriors	Philadelphia 76ers	118	106	f
Monday	2022-12-19	Philadelphia 76ers	Team 1	Toronto Raptors	Philadelphia 76ers	104	101	t
Wednesday	2022-12-21	Philadelphia 76ers	Team 1	Detroit Pistons	Philadelphia 76ers	113	93	f
Friday	2022-12-23	Philadelphia 76ers	Team 1	LA Clippers	Philadelphia 76ers	119	114	f
Sunday	2022-12-25	Philadelphia 76ers	Team 2	New York Knicks	Philadelphia 76ers	119	112	f
Saturday	2022-12-31	Philadelphia 76ers	Team 2	Oklahoma City Thunder	Philadelphia 76ers	115	96	f
Monday	2023-01-02	Philadelphia 76ers	Team 1	New Orleans Pelicans	Philadelphia 76ers	120	111	f
Wednesday	2023-01-04	Philadelphia 76ers	Team 1	Indiana Pacers	Philadelphia 76ers	129	126	t
Sunday	2023-01-08	Philadelphia 76ers	Team 2	Detroit Pistons	Philadelphia 76ers	123	111	f
Tuesday	2023-01-10	Philadelphia 76ers	Team 1	Detroit Pistons	Philadelphia 76ers	147	116	f
Saturday	2023-01-14	Philadelphia 76ers	Team 2	Utah Jazz	Philadelphia 76ers	118	117	f
Sunday	2023-01-15	Philadelphia 76ers	Team 2	Los Angeles Lakers	Philadelphia 76ers	113	112	f
Tuesday	2023-01-17	Philadelphia 76ers	Team 2	LA Clippers	Philadelphia 76ers	120	110	f
Thursday	2023-01-19	Philadelphia 76ers	Team 2	Portland Trail Blazers	Philadelphia 76ers	105	95	f
Saturday	2023-01-21	Philadelphia 76ers	Team 2	Sacramento Kings	Philadelphia 76ers	129	127	f
Wednesday	2023-01-25	Philadelphia 76ers	Team 1	Brooklyn Nets	Philadelphia 76ers	137	133	f
Saturday	2023-01-28	Philadelphia 76ers	Team 1	Denver Nuggets	Philadelphia 76ers	126	119	f
Wednesday	2023-02-01	Philadelphia 76ers	Team 1	Orlando Magic	Philadelphia 76ers	105	94	f
Friday	2023-02-03	Philadelphia 76ers	Team 2	San Antonio Spurs	Philadelphia 76ers	137	125	f
Friday	2023-02-10	Philadelphia 76ers	Team 1	New York Knicks	Philadelphia 76ers	119	108	f
Saturday	2023-02-11	Philadelphia 76ers	Team 2	Brooklyn Nets	Philadelphia 76ers	101	98	f
Monday	2023-02-13	Philadelphia 76ers	Team 1	Houston Rockets	Philadelphia 76ers	123	104	f
Wednesday	2023-02-15	Philadelphia 76ers	Team 1	Cleveland Cavaliers	Philadelphia 76ers	118	112	f
Thursday	2023-02-23	Philadelphia 76ers	Team 1	Memphis Grizzlies	Philadelphia 76ers	110	105	f
Wednesday	2023-03-01	Philadelphia 76ers	Team 2	Miami Heat	Philadelphia 76ers	119	96	f
Saturday	2023-03-04	Philadelphia 76ers	Team 2	Milwaukee Bucks	Philadelphia 76ers	133	130	f
Monday	2023-03-06	Philadelphia 76ers	Team 2	Indiana Pacers	Philadelphia 76ers	147	143	f
Tuesday	2023-03-07	Philadelphia 76ers	Team 2	Minnesota Timberwolves	Philadelphia 76ers	117	94	f
Friday	2023-03-10	Philadelphia 76ers	Team 1	Portland Trail Blazers	Philadelphia 76ers	120	119	f
Sunday	2023-03-12	Philadelphia 76ers	Team 1	Washington Wizards	Philadelphia 76ers	112	93	f
Wednesday	2023-03-15	Philadelphia 76ers	Team 2	Cleveland Cavaliers	Philadelphia 76ers	118	109	f
Friday	2023-03-17	Philadelphia 76ers	Team 2	Charlotte Hornets	Philadelphia 76ers	121	82	f
Saturday	2023-03-18	Philadelphia 76ers	Team 2	Indiana Pacers	Philadelphia 76ers	141	121	f
Wednesday	2023-03-22	Philadelphia 76ers	Team 2	Chicago Bulls	Philadelphia 76ers	116	91	f
Wednesday	2023-03-29	Philadelphia 76ers	Team 1	Dallas Mavericks	Philadelphia 76ers	116	108	f
Friday	2023-03-31	Philadelphia 76ers	Team 1	Toronto Raptors	Philadelphia 76ers	117	110	f
Tuesday	2023-04-04	Philadelphia 76ers	Team 1	Boston Celtics	Philadelphia 76ers	103	101	f
Friday	2023-04-07	Philadelphia 76ers	Team 2	Atlanta Hawks	Philadelphia 76ers	136	131	t
Sunday	2023-04-09	Philadelphia 76ers	Team 2	Brooklyn Nets	Philadelphia 76ers	134	105	f
Saturday	2022-10-22	Cleveland Cavaliers	Team 2	Chicago Bulls	Cleveland Cavaliers	128	96	f
Sunday	2022-10-23	Cleveland Cavaliers	Team 1	Washington Wizards	Cleveland Cavaliers	117	107	t
Wednesday	2022-10-26	Cleveland Cavaliers	Team 1	Orlando Magic	Cleveland Cavaliers	103	92	f
Friday	2022-10-28	Cleveland Cavaliers	Team 2	Boston Celtics	Cleveland Cavaliers	132	123	t
Sunday	2022-10-30	Cleveland Cavaliers	Team 1	New York Knicks	Cleveland Cavaliers	121	108	f
Wednesday	2022-11-02	Cleveland Cavaliers	Team 1	Boston Celtics	Cleveland Cavaliers	114	113	t
Friday	2022-11-04	Cleveland Cavaliers	Team 2	Detroit Pistons	Cleveland Cavaliers	112	88	f
Sunday	2022-11-06	Cleveland Cavaliers	Team 2	Los Angeles Lakers	Cleveland Cavaliers	114	100	f
Friday	2022-11-18	Cleveland Cavaliers	Team 1	Charlotte Hornets	Cleveland Cavaliers	132	122	t
Sunday	2022-11-20	Cleveland Cavaliers	Team 1	Miami Heat	Cleveland Cavaliers	113	87	f
Monday	2022-11-21	Cleveland Cavaliers	Team 1	Atlanta Hawks	Cleveland Cavaliers	114	102	f
Wednesday	2022-11-23	Cleveland Cavaliers	Team 1	Portland Trail Blazers	Cleveland Cavaliers	114	96	f
Sunday	2022-11-27	Cleveland Cavaliers	Team 2	Detroit Pistons	Cleveland Cavaliers	102	94	f
Wednesday	2022-11-30	Cleveland Cavaliers	Team 1	Philadelphia 76ers	Cleveland Cavaliers	113	85	f
Friday	2022-12-02	Cleveland Cavaliers	Team 1	Orlando Magic	Cleveland Cavaliers	107	96	f
Tuesday	2022-12-06	Cleveland Cavaliers	Team 1	Los Angeles Lakers	Cleveland Cavaliers	116	102	f
Saturday	2022-12-10	Cleveland Cavaliers	Team 1	Oklahoma City Thunder	Cleveland Cavaliers	110	102	f
Wednesday	2022-12-14	Cleveland Cavaliers	Team 2	Dallas Mavericks	Cleveland Cavaliers	105	90	f
Friday	2022-12-16	Cleveland Cavaliers	Team 1	Indiana Pacers	Cleveland Cavaliers	118	112	f
Saturday	2022-12-17	Cleveland Cavaliers	Team 1	Dallas Mavericks	Cleveland Cavaliers	100	99	t
Monday	2022-12-19	Cleveland Cavaliers	Team 1	Utah Jazz	Cleveland Cavaliers	122	99	f
Wednesday	2022-12-21	Cleveland Cavaliers	Team 1	Milwaukee Bucks	Cleveland Cavaliers	114	106	f
Saturday	2022-12-31	Cleveland Cavaliers	Team 2	Chicago Bulls	Cleveland Cavaliers	103	102	f
Monday	2023-01-02	Cleveland Cavaliers	Team 1	Chicago Bulls	Cleveland Cavaliers	145	134	t
Wednesday	2023-01-04	Cleveland Cavaliers	Team 1	Phoenix Suns	Cleveland Cavaliers	90	88	f
Sunday	2023-01-08	Cleveland Cavaliers	Team 2	Phoenix Suns	Cleveland Cavaliers	112	98	f
Thursday	2023-01-12	Cleveland Cavaliers	Team 2	Portland Trail Blazers	Cleveland Cavaliers	119	113	f
Monday	2023-01-16	Cleveland Cavaliers	Team 1	New Orleans Pelicans	Cleveland Cavaliers	113	103	f
Saturday	2023-01-21	Cleveland Cavaliers	Team 1	Milwaukee Bucks	Cleveland Cavaliers	114	102	f
Thursday	2023-01-26	Cleveland Cavaliers	Team 2	Houston Rockets	Cleveland Cavaliers	113	95	f
Sunday	2023-01-29	Cleveland Cavaliers	Team 1	LA Clippers	Cleveland Cavaliers	122	99	f
Thursday	2023-02-02	Cleveland Cavaliers	Team 1	Memphis Grizzlies	Cleveland Cavaliers	128	113	f
Sunday	2023-02-05	Cleveland Cavaliers	Team 2	Indiana Pacers	Cleveland Cavaliers	122	103	f
Monday	2023-02-06	Cleveland Cavaliers	Team 2	Washington Wizards	Cleveland Cavaliers	114	91	f
Wednesday	2023-02-08	Cleveland Cavaliers	Team 1	Detroit Pistons	Cleveland Cavaliers	113	85	f
Friday	2023-02-10	Cleveland Cavaliers	Team 2	New Orleans Pelicans	Cleveland Cavaliers	118	107	f
Saturday	2023-02-11	Cleveland Cavaliers	Team 1	Chicago Bulls	Cleveland Cavaliers	97	89	f
Monday	2023-02-13	Cleveland Cavaliers	Team 1	San Antonio Spurs	Cleveland Cavaliers	117	109	f
Sunday	2023-02-26	Cleveland Cavaliers	Team 1	Toronto Raptors	Cleveland Cavaliers	118	93	f
Saturday	2023-03-04	Cleveland Cavaliers	Team 1	Detroit Pistons	Cleveland Cavaliers	114	90	f
Monday	2023-03-06	Cleveland Cavaliers	Team 1	Boston Celtics	Cleveland Cavaliers	118	114	t
Wednesday	2023-03-08	Cleveland Cavaliers	Team 2	Miami Heat	Cleveland Cavaliers	104	100	f
Sunday	2023-03-12	Cleveland Cavaliers	Team 2	Charlotte Hornets	Cleveland Cavaliers	114	108	f
Tuesday	2023-03-14	Cleveland Cavaliers	Team 2	Charlotte Hornets	Cleveland Cavaliers	120	104	f
Friday	2023-03-17	Cleveland Cavaliers	Team 1	Washington Wizards	Cleveland Cavaliers	117	94	f
Tuesday	2023-03-21	Cleveland Cavaliers	Team 2	Brooklyn Nets	Cleveland Cavaliers	115	109	f
Thursday	2023-03-23	Cleveland Cavaliers	Team 2	Brooklyn Nets	Cleveland Cavaliers	116	114	f
Sunday	2023-03-26	Cleveland Cavaliers	Team 1	Houston Rockets	Cleveland Cavaliers	108	91	f
Sunday	2023-04-02	Cleveland Cavaliers	Team 1	Indiana Pacers	Cleveland Cavaliers	115	105	f
Tuesday	2023-04-04	Cleveland Cavaliers	Team 2	Orlando Magic	Cleveland Cavaliers	117	113	f
Thursday	2023-04-06	Cleveland Cavaliers	Team 2	Orlando Magic	Cleveland Cavaliers	118	94	f
Friday	2022-10-21	New York Knicks	Team 1	Detroit Pistons	New York Knicks	130	106	f
Monday	2022-10-24	New York Knicks	Team 1	Orlando Magic	New York Knicks	115	102	f
Wednesday	2022-10-26	New York Knicks	Team 1	Charlotte Hornets	New York Knicks	134	131	t
Friday	2022-11-04	New York Knicks	Team 2	Philadelphia 76ers	New York Knicks	106	104	f
Monday	2022-11-07	New York Knicks	Team 2	Minnesota Timberwolves	New York Knicks	120	107	f
Friday	2022-11-11	New York Knicks	Team 1	Detroit Pistons	New York Knicks	121	112	f
Tuesday	2022-11-15	New York Knicks	Team 2	Utah Jazz	New York Knicks	118	111	f
Wednesday	2022-11-16	New York Knicks	Team 2	Denver Nuggets	New York Knicks	106	103	f
Monday	2022-11-21	New York Knicks	Team 2	Oklahoma City Thunder	New York Knicks	129	119	f
Tuesday	2022-11-29	New York Knicks	Team 2	Detroit Pistons	New York Knicks	140	110	f
Sunday	2022-12-04	New York Knicks	Team 1	Cleveland Cavaliers	New York Knicks	92	81	f
Wednesday	2022-12-07	New York Knicks	Team 1	Atlanta Hawks	New York Knicks	113	89	f
Friday	2022-12-09	New York Knicks	Team 2	Charlotte Hornets	New York Knicks	121	102	f
Sunday	2022-12-11	New York Knicks	Team 1	Sacramento Kings	New York Knicks	112	99	f
Wednesday	2022-12-14	New York Knicks	Team 2	Chicago Bulls	New York Knicks	128	120	t
Friday	2022-12-16	New York Knicks	Team 2	Chicago Bulls	New York Knicks	114	91	f
Sunday	2022-12-18	New York Knicks	Team 2	Indiana Pacers	New York Knicks	109	106	f
Tuesday	2022-12-20	New York Knicks	Team 1	Golden State Warriors	New York Knicks	132	94	f
Saturday	2022-12-31	New York Knicks	Team 2	Houston Rockets	New York Knicks	108	88	f
Monday	2023-01-02	New York Knicks	Team 1	Phoenix Suns	New York Knicks	102	83	f
Wednesday	2023-01-04	New York Knicks	Team 1	San Antonio Spurs	New York Knicks	117	114	f
Friday	2023-01-06	New York Knicks	Team 2	Toronto Raptors	New York Knicks	112	108	f
Wednesday	2023-01-11	New York Knicks	Team 1	Indiana Pacers	New York Knicks	119	113	f
Friday	2023-01-13	New York Knicks	Team 2	Washington Wizards	New York Knicks	112	108	f
Sunday	2023-01-15	New York Knicks	Team 2	Detroit Pistons	New York Knicks	117	104	f
Tuesday	2023-01-24	New York Knicks	Team 1	Cleveland Cavaliers	New York Knicks	105	103	f
Thursday	2023-01-26	New York Knicks	Team 2	Boston Celtics	New York Knicks	120	117	t
Thursday	2023-02-02	New York Knicks	Team 1	Miami Heat	New York Knicks	106	104	f
Sunday	2023-02-05	New York Knicks	Team 1	Philadelphia 76ers	New York Knicks	108	97	f
Tuesday	2023-02-07	New York Knicks	Team 2	Orlando Magic	New York Knicks	102	98	f
Saturday	2023-02-11	New York Knicks	Team 1	Utah Jazz	New York Knicks	126	120	f
Monday	2023-02-13	New York Knicks	Team 1	Brooklyn Nets	New York Knicks	124	106	f
Wednesday	2023-02-15	New York Knicks	Team 2	Atlanta Hawks	New York Knicks	122	101	f
Friday	2023-02-24	New York Knicks	Team 2	Washington Wizards	New York Knicks	115	109	f
Saturday	2023-02-25	New York Knicks	Team 1	New Orleans Pelicans	New York Knicks	128	106	f
Monday	2023-02-27	New York Knicks	Team 1	Boston Celtics	New York Knicks	109	94	f
Wednesday	2023-03-01	New York Knicks	Team 1	Brooklyn Nets	New York Knicks	142	118	f
Friday	2023-03-03	New York Knicks	Team 2	Miami Heat	New York Knicks	122	120	f
Sunday	2023-03-05	New York Knicks	Team 2	Boston Celtics	New York Knicks	131	129	t
Sunday	2023-03-12	New York Knicks	Team 2	Los Angeles Lakers	New York Knicks	112	108	f
Tuesday	2023-03-14	New York Knicks	Team 2	Portland Trail Blazers	New York Knicks	123	107	f
Saturday	2023-03-18	New York Knicks	Team 1	Denver Nuggets	New York Knicks	116	110	f
Monday	2023-03-27	New York Knicks	Team 1	Houston Rockets	New York Knicks	137	115	f
Wednesday	2023-03-29	New York Knicks	Team 1	Miami Heat	New York Knicks	101	92	f
Friday	2023-03-31	New York Knicks	Team 2	Cleveland Cavaliers	New York Knicks	130	116	f
Sunday	2023-04-02	New York Knicks	Team 1	Washington Wizards	New York Knicks	118	109	f
Wednesday	2023-04-05	New York Knicks	Team 2	Indiana Pacers	New York Knicks	138	129	f
Friday	2022-10-21	Brooklyn Nets	Team 1	Toronto Raptors	Brooklyn Nets	109	105	f
Monday	2022-10-31	Brooklyn Nets	Team 1	Indiana Pacers	Brooklyn Nets	116	109	f
Friday	2022-11-04	Brooklyn Nets	Team 2	Washington Wizards	Brooklyn Nets	128	86	f
Saturday	2022-11-05	Brooklyn Nets	Team 2	Charlotte Hornets	Brooklyn Nets	98	94	f
Wednesday	2022-11-09	Brooklyn Nets	Team 1	New York Knicks	Brooklyn Nets	112	85	f
Saturday	2022-11-12	Brooklyn Nets	Team 2	LA Clippers	Brooklyn Nets	110	95	f
Thursday	2022-11-17	Brooklyn Nets	Team 2	Portland Trail Blazers	Brooklyn Nets	109	107	f
Sunday	2022-11-20	Brooklyn Nets	Team 1	Memphis Grizzlies	Brooklyn Nets	127	115	f
Wednesday	2022-11-23	Brooklyn Nets	Team 2	Toronto Raptors	Brooklyn Nets	112	98	f
Sunday	2022-11-27	Brooklyn Nets	Team 1	Portland Trail Blazers	Brooklyn Nets	111	97	f
Monday	2022-11-28	Brooklyn Nets	Team 1	Orlando Magic	Brooklyn Nets	109	102	f
Wednesday	2022-11-30	Brooklyn Nets	Team 1	Washington Wizards	Brooklyn Nets	113	107	f
Friday	2022-12-02	Brooklyn Nets	Team 1	Toronto Raptors	Brooklyn Nets	114	105	f
Wednesday	2022-12-07	Brooklyn Nets	Team 1	Charlotte Hornets	Brooklyn Nets	122	116	f
Friday	2022-12-09	Brooklyn Nets	Team 1	Atlanta Hawks	Brooklyn Nets	120	116	f
Saturday	2022-12-10	Brooklyn Nets	Team 2	Indiana Pacers	Brooklyn Nets	136	133	f
Monday	2022-12-12	Brooklyn Nets	Team 2	Washington Wizards	Brooklyn Nets	112	100	f
Friday	2022-12-16	Brooklyn Nets	Team 2	Toronto Raptors	Brooklyn Nets	119	116	f
Sunday	2022-12-18	Brooklyn Nets	Team 2	Detroit Pistons	Brooklyn Nets	124	121	f
Wednesday	2022-12-21	Brooklyn Nets	Team 1	Golden State Warriors	Brooklyn Nets	143	113	f
Friday	2022-12-23	Brooklyn Nets	Team 1	Milwaukee Bucks	Brooklyn Nets	118	100	f
Monday	2022-12-26	Brooklyn Nets	Team 2	Cleveland Cavaliers	Brooklyn Nets	125	117	f
Wednesday	2022-12-28	Brooklyn Nets	Team 2	Atlanta Hawks	Brooklyn Nets	108	107	f
Saturday	2022-12-31	Brooklyn Nets	Team 2	Charlotte Hornets	Brooklyn Nets	123	106	f
Monday	2023-01-02	Brooklyn Nets	Team 1	San Antonio Spurs	Brooklyn Nets	139	103	f
Friday	2023-01-06	Brooklyn Nets	Team 2	New Orleans Pelicans	Brooklyn Nets	108	102	f
Sunday	2023-01-08	Brooklyn Nets	Team 2	Miami Heat	Brooklyn Nets	102	101	f
Friday	2023-01-20	Brooklyn Nets	Team 2	Utah Jazz	Brooklyn Nets	117	106	f
Sunday	2023-01-22	Brooklyn Nets	Team 2	Golden State Warriors	Brooklyn Nets	120	116	f
Saturday	2023-01-28	Brooklyn Nets	Team 1	New York Knicks	Brooklyn Nets	122	115	f
Monday	2023-01-30	Brooklyn Nets	Team 1	Los Angeles Lakers	Brooklyn Nets	121	104	f
Saturday	2023-02-04	Brooklyn Nets	Team 1	Washington Wizards	Brooklyn Nets	125	123	f
Thursday	2023-02-09	Brooklyn Nets	Team 1	Chicago Bulls	Brooklyn Nets	116	105	f
Wednesday	2023-02-15	Brooklyn Nets	Team 1	Miami Heat	Brooklyn Nets	116	105	f
Friday	2023-03-03	Brooklyn Nets	Team 2	Boston Celtics	Brooklyn Nets	115	105	f
Sunday	2023-03-05	Brooklyn Nets	Team 1	Charlotte Hornets	Brooklyn Nets	102	86	f
Tuesday	2023-03-07	Brooklyn Nets	Team 2	Houston Rockets	Brooklyn Nets	118	96	f
Friday	2023-03-10	Brooklyn Nets	Team 2	Minnesota Timberwolves	Brooklyn Nets	124	123	t
Sunday	2023-03-12	Brooklyn Nets	Team 2	Denver Nuggets	Brooklyn Nets	122	120	f
Saturday	2023-03-25	Brooklyn Nets	Team 2	Miami Heat	Brooklyn Nets	129	100	f
Wednesday	2023-03-29	Brooklyn Nets	Team 1	Houston Rockets	Brooklyn Nets	123	114	f
Friday	2023-03-31	Brooklyn Nets	Team 1	Atlanta Hawks	Brooklyn Nets	124	107	f
Sunday	2023-04-02	Brooklyn Nets	Team 1	Utah Jazz	Brooklyn Nets	111	110	f
Wednesday	2023-04-05	Brooklyn Nets	Team 2	Detroit Pistons	Brooklyn Nets	123	108	f
Friday	2023-04-07	Brooklyn Nets	Team 1	Orlando Magic	Brooklyn Nets	101	84	f
Saturday	2022-10-22	Miami Heat	Team 1	Toronto Raptors	Miami Heat	112	109	f
Wednesday	2022-10-26	Miami Heat	Team 2	Portland Trail Blazers	Miami Heat	119	98	f
Tuesday	2022-11-01	Miami Heat	Team 1	Golden State Warriors	Miami Heat	116	109	f
Wednesday	2022-11-02	Miami Heat	Team 1	Sacramento Kings	Miami Heat	110	107	f
Thursday	2022-11-10	Miami Heat	Team 1	Charlotte Hornets	Miami Heat	117	112	t
Saturday	2022-11-12	Miami Heat	Team 1	Charlotte Hornets	Miami Heat	132	115	f
Monday	2022-11-14	Miami Heat	Team 1	Phoenix Suns	Miami Heat	113	112	f
Wednesday	2022-11-23	Miami Heat	Team 1	Washington Wizards	Miami Heat	113	105	f
Friday	2022-11-25	Miami Heat	Team 1	Washington Wizards	Miami Heat	110	107	f
Sunday	2022-11-27	Miami Heat	Team 2	Atlanta Hawks	Miami Heat	106	98	f
Friday	2022-12-02	Miami Heat	Team 2	Boston Celtics	Miami Heat	120	116	t
Thursday	2022-12-08	Miami Heat	Team 1	LA Clippers	Miami Heat	115	110	f
Monday	2022-12-12	Miami Heat	Team 2	Indiana Pacers	Miami Heat	87	82	f
Wednesday	2022-12-14	Miami Heat	Team 2	Oklahoma City Thunder	Miami Heat	110	108	f
Thursday	2022-12-15	Miami Heat	Team 2	Houston Rockets	Miami Heat	111	108	f
Saturday	2022-12-17	Miami Heat	Team 2	San Antonio Spurs	Miami Heat	111	101	f
Monday	2022-12-26	Miami Heat	Team 1	Minnesota Timberwolves	Miami Heat	113	110	f
Wednesday	2022-12-28	Miami Heat	Team 1	Los Angeles Lakers	Miami Heat	112	98	f
Saturday	2022-12-31	Miami Heat	Team 2	Utah Jazz	Miami Heat	126	123	f
Monday	2023-01-02	Miami Heat	Team 2	LA Clippers	Miami Heat	110	100	f
Friday	2023-01-06	Miami Heat	Team 2	Phoenix Suns	Miami Heat	104	96	f
Tuesday	2023-01-10	Miami Heat	Team 1	Oklahoma City Thunder	Miami Heat	112	111	f
Thursday	2023-01-12	Miami Heat	Team 1	Milwaukee Bucks	Miami Heat	108	102	f
Saturday	2023-01-14	Miami Heat	Team 1	Milwaukee Bucks	Miami Heat	111	95	f
Wednesday	2023-01-18	Miami Heat	Team 2	New Orleans Pelicans	Miami Heat	124	98	f
Sunday	2023-01-22	Miami Heat	Team 1	New Orleans Pelicans	Miami Heat	100	96	f
Tuesday	2023-01-24	Miami Heat	Team 1	Boston Celtics	Miami Heat	98	95	f
Friday	2023-01-27	Miami Heat	Team 1	Orlando Magic	Miami Heat	110	105	f
Tuesday	2023-01-31	Miami Heat	Team 2	Cleveland Cavaliers	Miami Heat	100	97	f
Wednesday	2023-02-08	Miami Heat	Team 1	Indiana Pacers	Miami Heat	116	111	f
Friday	2023-02-10	Miami Heat	Team 1	Houston Rockets	Miami Heat	97	95	f
Saturday	2023-02-11	Miami Heat	Team 2	Orlando Magic	Miami Heat	107	103	t
Monday	2023-02-27	Miami Heat	Team 2	Philadelphia 76ers	Miami Heat	101	99	f
Saturday	2023-03-04	Miami Heat	Team 1	Atlanta Hawks	Miami Heat	117	109	f
Monday	2023-03-06	Miami Heat	Team 1	Atlanta Hawks	Miami Heat	130	128	f
Friday	2023-03-10	Miami Heat	Team 1	Cleveland Cavaliers	Miami Heat	119	115	f
Monday	2023-03-13	Miami Heat	Team 1	Utah Jazz	Miami Heat	119	115	f
Wednesday	2023-03-15	Miami Heat	Team 1	Memphis Grizzlies	Miami Heat	138	119	f
Sunday	2023-03-19	Miami Heat	Team 2	Detroit Pistons	Miami Heat	112	100	f
Wednesday	2023-03-22	Miami Heat	Team 1	New York Knicks	Miami Heat	127	120	f
Saturday	2023-04-01	Miami Heat	Team 1	Dallas Mavericks	Miami Heat	129	122	f
Tuesday	2023-04-04	Miami Heat	Team 2	Detroit Pistons	Miami Heat	118	105	f
Thursday	2023-04-06	Miami Heat	Team 2	Philadelphia 76ers	Miami Heat	129	101	f
Sunday	2023-04-09	Miami Heat	Team 1	Orlando Magic	Miami Heat	123	110	f
Wednesday	2022-10-19	Atlanta Hawks	Team 1	Houston Rockets	Atlanta Hawks	117	107	f
Friday	2022-10-21	Atlanta Hawks	Team 1	Orlando Magic	Atlanta Hawks	108	98	f
Wednesday	2022-10-26	Atlanta Hawks	Team 2	Detroit Pistons	Atlanta Hawks	118	113	f
Friday	2022-10-28	Atlanta Hawks	Team 2	Detroit Pistons	Atlanta Hawks	136	112	f
Wednesday	2022-11-02	Atlanta Hawks	Team 2	New York Knicks	Atlanta Hawks	112	99	f
Saturday	2022-11-05	Atlanta Hawks	Team 1	New Orleans Pelicans	Atlanta Hawks	124	121	t
Monday	2022-11-07	Atlanta Hawks	Team 1	Milwaukee Bucks	Atlanta Hawks	117	98	f
Thursday	2022-11-10	Atlanta Hawks	Team 1	Philadelphia 76ers	Atlanta Hawks	104	95	f
Monday	2022-11-14	Atlanta Hawks	Team 2	Milwaukee Bucks	Atlanta Hawks	121	106	f
Saturday	2022-11-19	Atlanta Hawks	Team 1	Toronto Raptors	Atlanta Hawks	124	122	t
Wednesday	2022-11-23	Atlanta Hawks	Team 1	Sacramento Kings	Atlanta Hawks	115	106	f
Wednesday	2022-11-30	Atlanta Hawks	Team 2	Orlando Magic	Atlanta Hawks	125	108	f
Friday	2022-12-02	Atlanta Hawks	Team 1	Denver Nuggets	Atlanta Hawks	117	109	f
Sunday	2022-12-11	Atlanta Hawks	Team 1	Chicago Bulls	Atlanta Hawks	123	122	t
Friday	2022-12-16	Atlanta Hawks	Team 2	Charlotte Hornets	Atlanta Hawks	125	106	f
Monday	2022-12-19	Atlanta Hawks	Team 1	Orlando Magic	Atlanta Hawks	126	125	f
Friday	2022-12-23	Atlanta Hawks	Team 1	Detroit Pistons	Atlanta Hawks	130	105	f
Wednesday	2023-01-04	Atlanta Hawks	Team 2	Sacramento Kings	Atlanta Hawks	120	117	f
Sunday	2023-01-08	Atlanta Hawks	Team 2	LA Clippers	Atlanta Hawks	112	108	f
Friday	2023-01-13	Atlanta Hawks	Team 2	Indiana Pacers	Atlanta Hawks	113	111	f
Saturday	2023-01-14	Atlanta Hawks	Team 2	Toronto Raptors	Atlanta Hawks	114	103	f
Monday	2023-01-16	Atlanta Hawks	Team 1	Miami Heat	Atlanta Hawks	121	113	f
Wednesday	2023-01-18	Atlanta Hawks	Team 2	Dallas Mavericks	Atlanta Hawks	130	122	f
Friday	2023-01-20	Atlanta Hawks	Team 1	New York Knicks	Atlanta Hawks	139	124	f
Wednesday	2023-01-25	Atlanta Hawks	Team 2	Oklahoma City Thunder	Atlanta Hawks	137	132	f
Wednesday	2023-02-01	Atlanta Hawks	Team 2	Phoenix Suns	Atlanta Hawks	132	100	f
Friday	2023-02-03	Atlanta Hawks	Team 2	Utah Jazz	Atlanta Hawks	115	108	f
Thursday	2023-02-09	Atlanta Hawks	Team 1	Phoenix Suns	Atlanta Hawks	116	107	f
Saturday	2023-02-11	Atlanta Hawks	Team 1	San Antonio Spurs	Atlanta Hawks	125	106	f
Friday	2023-02-24	Atlanta Hawks	Team 1	Cleveland Cavaliers	Atlanta Hawks	136	119	f
Sunday	2023-02-26	Atlanta Hawks	Team 1	Brooklyn Nets	Atlanta Hawks	129	127	f
Friday	2023-03-03	Atlanta Hawks	Team 1	Portland Trail Blazers	Atlanta Hawks	129	111	f
Wednesday	2023-03-08	Atlanta Hawks	Team 2	Washington Wizards	Atlanta Hawks	122	120	f
Friday	2023-03-10	Atlanta Hawks	Team 2	Washington Wizards	Atlanta Hawks	114	107	f
Friday	2023-03-17	Atlanta Hawks	Team 1	Golden State Warriors	Atlanta Hawks	127	119	f
Tuesday	2023-03-21	Atlanta Hawks	Team 1	Detroit Pistons	Atlanta Hawks	129	107	f
Saturday	2023-03-25	Atlanta Hawks	Team 1	Indiana Pacers	Atlanta Hawks	143	130	f
Tuesday	2023-03-28	Atlanta Hawks	Team 1	Cleveland Cavaliers	Atlanta Hawks	120	118	f
Sunday	2023-04-02	Atlanta Hawks	Team 1	Dallas Mavericks	Atlanta Hawks	132	130	t
Tuesday	2023-04-04	Atlanta Hawks	Team 2	Chicago Bulls	Atlanta Hawks	123	105	f
Wednesday	2023-04-05	Atlanta Hawks	Team 1	Washington Wizards	Atlanta Hawks	134	116	f
Wednesday	2022-10-19	Toronto Raptors	Team 1	Cleveland Cavaliers	Toronto Raptors	108	105	f
Monday	2022-10-24	Toronto Raptors	Team 2	Miami Heat	Toronto Raptors	98	90	f
Wednesday	2022-10-26	Toronto Raptors	Team 1	Philadelphia 76ers	Toronto Raptors	119	109	f
Monday	2022-10-31	Toronto Raptors	Team 1	Atlanta Hawks	Toronto Raptors	139	109	f
Wednesday	2022-11-02	Toronto Raptors	Team 2	San Antonio Spurs	Toronto Raptors	143	100	f
Sunday	2022-11-06	Toronto Raptors	Team 1	Chicago Bulls	Toronto Raptors	113	104	f
Wednesday	2022-11-09	Toronto Raptors	Team 1	Houston Rockets	Toronto Raptors	116	109	f
Monday	2022-11-14	Toronto Raptors	Team 2	Detroit Pistons	Toronto Raptors	115	111	f
Wednesday	2022-11-16	Toronto Raptors	Team 1	Miami Heat	Toronto Raptors	112	104	f
Saturday	2022-11-26	Toronto Raptors	Team 1	Dallas Mavericks	Toronto Raptors	105	100	f
Monday	2022-11-28	Toronto Raptors	Team 1	Cleveland Cavaliers	Toronto Raptors	100	88	f
Saturday	2022-12-03	Toronto Raptors	Team 1	Orlando Magic	Toronto Raptors	121	108	f
Wednesday	2022-12-07	Toronto Raptors	Team 1	Los Angeles Lakers	Toronto Raptors	126	113	f
Wednesday	2022-12-21	Toronto Raptors	Team 2	New York Knicks	Toronto Raptors	113	106	f
Friday	2022-12-23	Toronto Raptors	Team 2	Cleveland Cavaliers	Toronto Raptors	118	107	f
Friday	2022-12-30	Toronto Raptors	Team 1	Phoenix Suns	Toronto Raptors	113	104	f
Sunday	2023-01-08	Toronto Raptors	Team 1	Portland Trail Blazers	Toronto Raptors	117	105	f
Tuesday	2023-01-10	Toronto Raptors	Team 1	Charlotte Hornets	Toronto Raptors	132	120	f
Thursday	2023-01-12	Toronto Raptors	Team 1	Charlotte Hornets	Toronto Raptors	124	114	f
Monday	2023-01-16	Toronto Raptors	Team 2	New York Knicks	Toronto Raptors	123	121	t
Sunday	2023-01-22	Toronto Raptors	Team 1	New York Knicks	Toronto Raptors	125	116	f
Wednesday	2023-01-25	Toronto Raptors	Team 2	Sacramento Kings	Toronto Raptors	113	95	f
Saturday	2023-01-28	Toronto Raptors	Team 2	Portland Trail Blazers	Toronto Raptors	123	105	f
Friday	2023-02-03	Toronto Raptors	Team 2	Houston Rockets	Toronto Raptors	117	111	f
Sunday	2023-02-05	Toronto Raptors	Team 2	Memphis Grizzlies	Toronto Raptors	106	103	f
Wednesday	2023-02-08	Toronto Raptors	Team 1	San Antonio Spurs	Toronto Raptors	112	98	f
Sunday	2023-02-12	Toronto Raptors	Team 1	Detroit Pistons	Toronto Raptors	119	118	f
Tuesday	2023-02-14	Toronto Raptors	Team 1	Orlando Magic	Toronto Raptors	123	113	f
Thursday	2023-02-23	Toronto Raptors	Team 1	New Orleans Pelicans	Toronto Raptors	115	110	f
Saturday	2023-02-25	Toronto Raptors	Team 2	Detroit Pistons	Toronto Raptors	95	91	f
Tuesday	2023-02-28	Toronto Raptors	Team 1	Chicago Bulls	Toronto Raptors	104	98	f
Saturday	2023-03-04	Toronto Raptors	Team 2	Washington Wizards	Toronto Raptors	116	109	t
Tuesday	2023-03-14	Toronto Raptors	Team 1	Denver Nuggets	Toronto Raptors	125	110	f
Thursday	2023-03-16	Toronto Raptors	Team 1	Oklahoma City Thunder	Toronto Raptors	128	111	f
Saturday	2023-03-18	Toronto Raptors	Team 1	Minnesota Timberwolves	Toronto Raptors	122	107	f
Friday	2023-03-24	Toronto Raptors	Team 1	Detroit Pistons	Toronto Raptors	118	97	f
Sunday	2023-03-26	Toronto Raptors	Team 1	Washington Wizards	Toronto Raptors	114	104	f
Tuesday	2023-03-28	Toronto Raptors	Team 1	Miami Heat	Toronto Raptors	106	92	f
Sunday	2023-04-02	Toronto Raptors	Team 2	Charlotte Hornets	Toronto Raptors	128	108	f
Tuesday	2023-04-04	Toronto Raptors	Team 2	Charlotte Hornets	Toronto Raptors	120	100	f
Sunday	2023-04-09	Toronto Raptors	Team 1	Milwaukee Bucks	Toronto Raptors	121	105	f
Wednesday	2022-10-19	Chicago Bulls	Team 2	Miami Heat	Chicago Bulls	116	108	f
Monday	2022-10-24	Chicago Bulls	Team 1	Boston Celtics	Chicago Bulls	120	102	f
Wednesday	2022-10-26	Chicago Bulls	Team 1	Indiana Pacers	Chicago Bulls	124	109	f
Tuesday	2022-11-01	Chicago Bulls	Team 2	Brooklyn Nets	Chicago Bulls	108	99	f
Wednesday	2022-11-02	Chicago Bulls	Team 1	Charlotte Hornets	Chicago Bulls	106	88	f
Monday	2022-11-07	Chicago Bulls	Team 1	Toronto Raptors	Chicago Bulls	111	97	f
Monday	2022-11-21	Chicago Bulls	Team 1	Boston Celtics	Chicago Bulls	121	107	f
Wednesday	2022-11-23	Chicago Bulls	Team 2	Milwaukee Bucks	Chicago Bulls	118	113	f
Monday	2022-11-28	Chicago Bulls	Team 2	Utah Jazz	Chicago Bulls	114	107	f
Wednesday	2022-12-07	Chicago Bulls	Team 1	Washington Wizards	Chicago Bulls	115	111	f
Saturday	2022-12-10	Chicago Bulls	Team 1	Dallas Mavericks	Chicago Bulls	144	115	f
Tuesday	2022-12-20	Chicago Bulls	Team 2	Miami Heat	Chicago Bulls	113	103	f
Wednesday	2022-12-21	Chicago Bulls	Team 2	Atlanta Hawks	Chicago Bulls	110	108	f
Friday	2022-12-23	Chicago Bulls	Team 2	New York Knicks	Chicago Bulls	118	117	f
Wednesday	2022-12-28	Chicago Bulls	Team 1	Milwaukee Bucks	Chicago Bulls	119	113	t
Friday	2022-12-30	Chicago Bulls	Team 1	Detroit Pistons	Chicago Bulls	132	118	f
Wednesday	2023-01-04	Chicago Bulls	Team 1	Brooklyn Nets	Chicago Bulls	121	112	f
Friday	2023-01-06	Chicago Bulls	Team 2	Philadelphia 76ers	Chicago Bulls	126	112	f
Saturday	2023-01-07	Chicago Bulls	Team 1	Utah Jazz	Chicago Bulls	126	118	f
Sunday	2023-01-15	Chicago Bulls	Team 1	Golden State Warriors	Chicago Bulls	132	118	f
Thursday	2023-01-19	Chicago Bulls	Team 1	\N	Chicago Bulls	126	108	f
Monday	2023-01-23	Chicago Bulls	Team 1	Atlanta Hawks	Chicago Bulls	111	100	f
Saturday	2023-01-28	Chicago Bulls	Team 2	Orlando Magic	Chicago Bulls	128	109	f
Thursday	2023-02-02	Chicago Bulls	Team 1	Charlotte Hornets	Chicago Bulls	114	98	f
Saturday	2023-02-04	Chicago Bulls	Team 1	Portland Trail Blazers	Chicago Bulls	129	121	f
Monday	2023-02-06	Chicago Bulls	Team 1	San Antonio Spurs	Chicago Bulls	128	104	f
Friday	2023-02-24	Chicago Bulls	Team 1	Brooklyn Nets	Chicago Bulls	131	87	f
Sunday	2023-02-26	Chicago Bulls	Team 1	Washington Wizards	Chicago Bulls	102	82	f
Wednesday	2023-03-01	Chicago Bulls	Team 2	Detroit Pistons	Chicago Bulls	117	115	f
Wednesday	2023-03-08	Chicago Bulls	Team 2	Denver Nuggets	Chicago Bulls	117	96	f
Saturday	2023-03-11	Chicago Bulls	Team 2	Houston Rockets	Chicago Bulls	119	111	f
Friday	2023-03-17	Chicago Bulls	Team 1	Minnesota Timberwolves	Chicago Bulls	139	131	t
Saturday	2023-03-18	Chicago Bulls	Team 1	Miami Heat	Chicago Bulls	113	99	f
Monday	2023-03-20	Chicago Bulls	Team 2	Philadelphia 76ers	Chicago Bulls	109	105	t
Friday	2023-03-24	Chicago Bulls	Team 2	Portland Trail Blazers	Chicago Bulls	124	96	f
Sunday	2023-03-26	Chicago Bulls	Team 2	Los Angeles Lakers	Chicago Bulls	118	108	f
Friday	2023-03-31	Chicago Bulls	Team 2	Charlotte Hornets	Chicago Bulls	121	91	f
Sunday	2023-04-02	Chicago Bulls	Team 1	Memphis Grizzlies	Chicago Bulls	128	107	f
Friday	2023-04-07	Chicago Bulls	Team 2	Dallas Mavericks	Chicago Bulls	115	112	f
Sunday	2023-04-09	Chicago Bulls	Team 1	Detroit Pistons	Chicago Bulls	103	81	f
Saturday	2022-10-22	Indiana Pacers	Team 1	Detroit Pistons	Indiana Pacers	124	115	f
Friday	2022-10-28	Indiana Pacers	Team 2	Washington Wizards	Indiana Pacers	127	117	f
Saturday	2022-10-29	Indiana Pacers	Team 2	Brooklyn Nets	Indiana Pacers	125	116	f
Friday	2022-11-04	Indiana Pacers	Team 1	Miami Heat	Indiana Pacers	101	99	f
Monday	2022-11-07	Indiana Pacers	Team 1	New Orleans Pelicans	Indiana Pacers	129	122	f
Saturday	2022-11-12	Indiana Pacers	Team 1	Toronto Raptors	Indiana Pacers	118	104	f
Wednesday	2022-11-16	Indiana Pacers	Team 2	Charlotte Hornets	Indiana Pacers	125	113	f
Friday	2022-11-18	Indiana Pacers	Team 2	Houston Rockets	Indiana Pacers	99	91	f
Saturday	2022-11-19	Indiana Pacers	Team 1	Orlando Magic	Indiana Pacers	114	113	f
Monday	2022-11-21	Indiana Pacers	Team 1	Orlando Magic	Indiana Pacers	123	102	f
Friday	2022-11-25	Indiana Pacers	Team 1	Brooklyn Nets	Indiana Pacers	128	117	f
Monday	2022-11-28	Indiana Pacers	Team 2	Los Angeles Lakers	Indiana Pacers	116	115	f
Monday	2022-12-05	Indiana Pacers	Team 2	Golden State Warriors	Indiana Pacers	112	104	f
Friday	2022-12-09	Indiana Pacers	Team 1	Washington Wizards	Indiana Pacers	121	111	f
Wednesday	2022-12-14	Indiana Pacers	Team 1	Golden State Warriors	Indiana Pacers	125	119	f
Wednesday	2022-12-21	Indiana Pacers	Team 2	Boston Celtics	Indiana Pacers	117	112	f
Friday	2022-12-23	Indiana Pacers	Team 2	Miami Heat	Indiana Pacers	111	108	f
Tuesday	2022-12-27	Indiana Pacers	Team 1	Atlanta Hawks	Indiana Pacers	129	114	f
Thursday	2022-12-29	Indiana Pacers	Team 1	Cleveland Cavaliers	Indiana Pacers	135	126	f
Saturday	2022-12-31	Indiana Pacers	Team 1	LA Clippers	Indiana Pacers	131	130	f
Monday	2023-01-02	Indiana Pacers	Team 1	Toronto Raptors	Indiana Pacers	122	114	f
Friday	2023-01-06	Indiana Pacers	Team 1	Portland Trail Blazers	Indiana Pacers	108	99	f
Sunday	2023-01-08	Indiana Pacers	Team 1	Charlotte Hornets	Indiana Pacers	116	111	f
Tuesday	2023-01-24	Indiana Pacers	Team 1	Chicago Bulls	Indiana Pacers	116	110	f
Friday	2023-02-03	Indiana Pacers	Team 1	Sacramento Kings	Indiana Pacers	107	104	f
Wednesday	2023-02-15	Indiana Pacers	Team 1	Chicago Bulls	Indiana Pacers	117	113	f
Saturday	2023-02-25	Indiana Pacers	Team 2	Orlando Magic	Indiana Pacers	121	108	f
Tuesday	2023-02-28	Indiana Pacers	Team 2	Dallas Mavericks	Indiana Pacers	124	122	f
Sunday	2023-03-05	Indiana Pacers	Team 2	Chicago Bulls	Indiana Pacers	125	122	f
Thursday	2023-03-09	Indiana Pacers	Team 1	Houston Rockets	Indiana Pacers	134	125	t
Saturday	2023-03-11	Indiana Pacers	Team 2	Detroit Pistons	Indiana Pacers	121	115	f
Thursday	2023-03-16	Indiana Pacers	Team 2	Milwaukee Bucks	Indiana Pacers	139	123	f
Wednesday	2023-03-22	Indiana Pacers	Team 2	Toronto Raptors	Indiana Pacers	118	114	f
Friday	2023-03-31	Indiana Pacers	Team 1	Oklahoma City Thunder	Indiana Pacers	121	117	f
Sunday	2023-04-09	Indiana Pacers	Team 2	New York Knicks	Indiana Pacers	141	136	f
Wednesday	2022-10-19	Washington Wizards	Team 2	Indiana Pacers	Washington Wizards	114	107	f
Friday	2022-10-21	Washington Wizards	Team 1	Chicago Bulls	Washington Wizards	102	100	f
Tuesday	2022-10-25	Washington Wizards	Team 1	Detroit Pistons	Washington Wizards	120	99	f
Wednesday	2022-11-02	Washington Wizards	Team 2	Philadelphia 76ers	Washington Wizards	121	111	f
Monday	2022-11-07	Washington Wizards	Team 2	Charlotte Hornets	Washington Wizards	108	100	f
Thursday	2022-11-10	Washington Wizards	Team 1	Dallas Mavericks	Washington Wizards	113	105	f
Saturday	2022-11-12	Washington Wizards	Team 1	Utah Jazz	Washington Wizards	121	112	f
Sunday	2022-11-13	Washington Wizards	Team 1	Memphis Grizzlies	Washington Wizards	102	92	f
Friday	2022-11-18	Washington Wizards	Team 1	Miami Heat	Washington Wizards	107	106	t
Sunday	2022-11-20	Washington Wizards	Team 1	Charlotte Hornets	Washington Wizards	106	102	f
Monday	2022-11-28	Washington Wizards	Team 1	Minnesota Timberwolves	Washington Wizards	142	127	f
Tuesday	2022-12-20	Washington Wizards	Team 2	Phoenix Suns	Washington Wizards	113	110	f
Friday	2022-12-23	Washington Wizards	Team 2	Sacramento Kings	Washington Wizards	125	111	f
Tuesday	2022-12-27	Washington Wizards	Team 1	Philadelphia 76ers	Washington Wizards	116	111	f
Wednesday	2022-12-28	Washington Wizards	Team 1	Phoenix Suns	Washington Wizards	127	102	f
Friday	2022-12-30	Washington Wizards	Team 2	Orlando Magic	Washington Wizards	119	100	f
Sunday	2023-01-01	Washington Wizards	Team 2	Milwaukee Bucks	Washington Wizards	118	95	f
Wednesday	2023-01-11	Washington Wizards	Team 1	Chicago Bulls	Washington Wizards	100	97	f
Wednesday	2023-01-18	Washington Wizards	Team 2	New York Knicks	Washington Wizards	116	105	f
Saturday	2023-01-21	Washington Wizards	Team 1	Orlando Magic	Washington Wizards	138	118	f
Tuesday	2023-01-24	Washington Wizards	Team 2	Dallas Mavericks	Washington Wizards	127	126	f
Wednesday	2023-01-25	Washington Wizards	Team 2	Houston Rockets	Washington Wizards	108	103	f
Saturday	2023-01-28	Washington Wizards	Team 2	New Orleans Pelicans	Washington Wizards	113	103	f
Monday	2023-01-30	Washington Wizards	Team 2	San Antonio Spurs	Washington Wizards	127	106	f
Wednesday	2023-02-08	Washington Wizards	Team 1	Charlotte Hornets	Washington Wizards	118	104	f
Saturday	2023-02-11	Washington Wizards	Team 1	Indiana Pacers	Washington Wizards	127	113	f
Tuesday	2023-02-14	Washington Wizards	Team 2	Portland Trail Blazers	Washington Wizards	126	101	f
Thursday	2023-02-16	Washington Wizards	Team 2	Minnesota Timberwolves	Washington Wizards	114	106	f
Tuesday	2023-02-28	Washington Wizards	Team 2	Atlanta Hawks	Washington Wizards	119	116	f
Thursday	2023-03-02	Washington Wizards	Team 1	Toronto Raptors	Washington Wizards	119	108	f
Tuesday	2023-03-07	Washington Wizards	Team 2	Detroit Pistons	Washington Wizards	119	117	f
Tuesday	2023-03-14	Washington Wizards	Team 1	Detroit Pistons	Washington Wizards	117	97	f
Friday	2023-03-24	Washington Wizards	Team 1	San Antonio Spurs	Washington Wizards	136	124	f
Tuesday	2023-03-28	Washington Wizards	Team 1	Boston Celtics	Washington Wizards	130	111	f
Friday	2023-04-07	Washington Wizards	Team 1	Miami Heat	Washington Wizards	114	108	f
Friday	2022-10-28	Orlando Magic	Team 1	Charlotte Hornets	Orlando Magic	113	93	f
Thursday	2022-11-03	Orlando Magic	Team 1	Golden State Warriors	Orlando Magic	130	129	f
Wednesday	2022-11-09	Orlando Magic	Team 1	Dallas Mavericks	Orlando Magic	94	87	f
Friday	2022-11-11	Orlando Magic	Team 1	Phoenix Suns	Orlando Magic	114	97	f
Friday	2022-11-18	Orlando Magic	Team 2	Chicago Bulls	Orlando Magic	108	107	f
Wednesday	2022-12-07	Orlando Magic	Team 1	LA Clippers	Orlando Magic	116	111	t
Friday	2022-12-09	Orlando Magic	Team 1	Toronto Raptors	Orlando Magic	113	109	f
Sunday	2022-12-11	Orlando Magic	Team 1	Toronto Raptors	Orlando Magic	111	99	f
Wednesday	2022-12-14	Orlando Magic	Team 1	Atlanta Hawks	Orlando Magic	135	124	f
Friday	2022-12-16	Orlando Magic	Team 2	Boston Celtics	Orlando Magic	117	109	f
Sunday	2022-12-18	Orlando Magic	Team 2	Boston Celtics	Orlando Magic	95	92	f
Wednesday	2022-12-21	Orlando Magic	Team 2	Houston Rockets	Orlando Magic	116	110	f
Friday	2022-12-23	Orlando Magic	Team 1	San Antonio Spurs	Orlando Magic	133	113	f
Wednesday	2023-01-04	Orlando Magic	Team 1	Oklahoma City Thunder	Orlando Magic	126	115	f
Saturday	2023-01-07	Orlando Magic	Team 2	Golden State Warriors	Orlando Magic	115	101	f
Tuesday	2023-01-10	Orlando Magic	Team 2	Portland Trail Blazers	Orlando Magic	109	106	f
Friday	2023-01-20	Orlando Magic	Team 1	New Orleans Pelicans	Orlando Magic	123	110	f
Monday	2023-01-23	Orlando Magic	Team 1	Boston Celtics	Orlando Magic	113	98	f
Wednesday	2023-01-25	Orlando Magic	Team 1	Indiana Pacers	Orlando Magic	126	120	f
Monday	2023-01-30	Orlando Magic	Team 2	Philadelphia 76ers	Orlando Magic	119	109	f
Friday	2023-02-03	Orlando Magic	Team 2	Minnesota Timberwolves	Orlando Magic	127	120	f
Sunday	2023-02-05	Orlando Magic	Team 2	Charlotte Hornets	Orlando Magic	119	113	f
Thursday	2023-02-09	Orlando Magic	Team 1	Denver Nuggets	Orlando Magic	115	104	f
Monday	2023-02-13	Orlando Magic	Team 2	Chicago Bulls	Orlando Magic	100	91	f
Thursday	2023-02-23	Orlando Magic	Team 1	Detroit Pistons	Orlando Magic	108	106	f
Monday	2023-02-27	Orlando Magic	Team 2	New Orleans Pelicans	Orlando Magic	101	93	f
Friday	2023-03-03	Orlando Magic	Team 2	Charlotte Hornets	Orlando Magic	117	106	f
Saturday	2023-03-11	Orlando Magic	Team 1	Miami Heat	Orlando Magic	126	114	t
Saturday	2023-03-18	Orlando Magic	Team 2	LA Clippers	Orlando Magic	113	108	f
Tuesday	2023-03-21	Orlando Magic	Team 1	Washington Wizards	Orlando Magic	122	112	f
Thursday	2023-03-23	Orlando Magic	Team 1	New York Knicks	Orlando Magic	111	106	f
Sunday	2023-03-26	Orlando Magic	Team 1	Brooklyn Nets	Orlando Magic	119	106	f
Friday	2023-03-31	Orlando Magic	Team 2	Washington Wizards	Orlando Magic	116	109	f
Sunday	2023-04-02	Orlando Magic	Team 1	Detroit Pistons	Orlando Magic	128	102	f
Wednesday	2022-10-19	Charlotte Hornets	Team 2	San Antonio Spurs	Charlotte Hornets	129	102	f
Sunday	2022-10-23	Charlotte Hornets	Team 2	Atlanta Hawks	Charlotte Hornets	126	109	f
Saturday	2022-10-29	Charlotte Hornets	Team 1	Golden State Warriors	Charlotte Hornets	120	113	t
Monday	2022-11-14	Charlotte Hornets	Team 2	Orlando Magic	Charlotte Hornets	112	105	f
Wednesday	2022-11-23	Charlotte Hornets	Team 1	Philadelphia 76ers	Charlotte Hornets	107	101	f
Friday	2022-11-25	Charlotte Hornets	Team 1	Minnesota Timberwolves	Charlotte Hornets	110	108	f
Friday	2022-12-02	Charlotte Hornets	Team 1	Washington Wizards	Charlotte Hornets	117	116	f
Monday	2022-12-19	Charlotte Hornets	Team 2	Sacramento Kings	Charlotte Hornets	125	119	f
Friday	2022-12-23	Charlotte Hornets	Team 2	Los Angeles Lakers	Charlotte Hornets	134	130	f
Thursday	2022-12-29	Charlotte Hornets	Team 1	Oklahoma City Thunder	Charlotte Hornets	121	113	f
Friday	2023-01-06	Charlotte Hornets	Team 2	Milwaukee Bucks	Charlotte Hornets	138	109	f
Wednesday	2023-01-18	Charlotte Hornets	Team 2	Houston Rockets	Charlotte Hornets	122	117	f
Saturday	2023-01-21	Charlotte Hornets	Team 2	Atlanta Hawks	Charlotte Hornets	122	118	f
Thursday	2023-01-26	Charlotte Hornets	Team 1	Chicago Bulls	Charlotte Hornets	111	96	f
Sunday	2023-01-29	Charlotte Hornets	Team 1	Miami Heat	Charlotte Hornets	122	117	f
Monday	2023-02-13	Charlotte Hornets	Team 1	Atlanta Hawks	Charlotte Hornets	144	138	f
Wednesday	2023-02-15	Charlotte Hornets	Team 1	San Antonio Spurs	Charlotte Hornets	120	110	f
Friday	2023-02-24	Charlotte Hornets	Team 2	Minnesota Timberwolves	Charlotte Hornets	121	113	f
Saturday	2023-02-25	Charlotte Hornets	Team 1	Miami Heat	Charlotte Hornets	108	103	f
Monday	2023-02-27	Charlotte Hornets	Team 1	Detroit Pistons	Charlotte Hornets	117	106	f
Tuesday	2023-03-07	Charlotte Hornets	Team 2	New York Knicks	Charlotte Hornets	112	105	f
Thursday	2023-03-09	Charlotte Hornets	Team 2	Detroit Pistons	Charlotte Hornets	113	103	f
Monday	2023-03-20	Charlotte Hornets	Team 1	Indiana Pacers	Charlotte Hornets	115	109	f
Friday	2023-03-24	Charlotte Hornets	Team 2	Dallas Mavericks	Charlotte Hornets	117	109	f
Sunday	2023-03-26	Charlotte Hornets	Team 1	Dallas Mavericks	Charlotte Hornets	110	104	f
Tuesday	2023-03-28	Charlotte Hornets	Team 2	Oklahoma City Thunder	Charlotte Hornets	137	134	f
Sunday	2023-04-09	Charlotte Hornets	Team 2	Cleveland Cavaliers	Charlotte Hornets	106	95	f
Wednesday	2022-10-19	Detroit Pistons	Team 1	Orlando Magic	Detroit Pistons	113	109	f
Sunday	2022-10-30	Detroit Pistons	Team 1	Golden State Warriors	Detroit Pistons	128	114	f
Monday	2022-11-07	Detroit Pistons	Team 1	Oklahoma City Thunder	Detroit Pistons	112	103	f
Tuesday	2022-11-22	Detroit Pistons	Team 2	Denver Nuggets	Detroit Pistons	110	108	f
Wednesday	2022-11-23	Detroit Pistons	Team 2	Utah Jazz	Detroit Pistons	125	116	f
Thursday	2022-12-01	Detroit Pistons	Team 1	Dallas Mavericks	Detroit Pistons	131	125	t
Tuesday	2022-12-06	Detroit Pistons	Team 2	Miami Heat	Detroit Pistons	116	96	f
Wednesday	2022-12-14	Detroit Pistons	Team 2	Charlotte Hornets	Detroit Pistons	141	134	t
Wednesday	2022-12-28	Detroit Pistons	Team 1	Orlando Magic	Detroit Pistons	121	101	f
Saturday	2022-12-31	Detroit Pistons	Team 2	Minnesota Timberwolves	Detroit Pistons	116	104	f
Wednesday	2023-01-04	Detroit Pistons	Team 2	Golden State Warriors	Detroit Pistons	122	119	f
Wednesday	2023-01-11	Detroit Pistons	Team 1	Minnesota Timberwolves	Detroit Pistons	135	118	f
Thursday	2023-01-26	Detroit Pistons	Team 2	Brooklyn Nets	Detroit Pistons	130	122	f
Friday	2023-02-03	Detroit Pistons	Team 1	Charlotte Hornets	Detroit Pistons	118	112	f
Friday	2023-02-10	Detroit Pistons	Team 1	San Antonio Spurs	Detroit Pistons	138	131	t
Monday	2023-03-13	Detroit Pistons	Team 1	Indiana Pacers	Detroit Pistons	117	97	f
Friday	2023-04-07	Detroit Pistons	Team 2	Indiana Pacers	Detroit Pistons	122	115	f
Friday	2022-10-21	Denver Nuggets	Team 2	Golden State Warriors	Denver Nuggets	128	123	f
Saturday	2022-10-22	Denver Nuggets	Team 1	Oklahoma City Thunder	Denver Nuggets	122	117	f
Wednesday	2022-10-26	Denver Nuggets	Team 1	Los Angeles Lakers	Denver Nuggets	110	99	f
Friday	2022-10-28	Denver Nuggets	Team 1	Utah Jazz	Denver Nuggets	117	101	f
Thursday	2022-11-03	Denver Nuggets	Team 2	Oklahoma City Thunder	Denver Nuggets	122	110	f
Saturday	2022-11-05	Denver Nuggets	Team 1	San Antonio Spurs	Denver Nuggets	126	101	f
Monday	2022-11-07	Denver Nuggets	Team 2	San Antonio Spurs	Denver Nuggets	115	109	f
Wednesday	2022-11-09	Denver Nuggets	Team 2	Indiana Pacers	Denver Nuggets	122	119	f
Sunday	2022-11-13	Denver Nuggets	Team 2	Chicago Bulls	Denver Nuggets	126	103	f
Sunday	2022-11-20	Denver Nuggets	Team 2	Dallas Mavericks	Denver Nuggets	98	97	f
Wednesday	2022-11-23	Denver Nuggets	Team 2	Oklahoma City Thunder	Denver Nuggets	131	126	t
Friday	2022-11-25	Denver Nuggets	Team 2	LA Clippers	Denver Nuggets	114	104	f
Monday	2022-11-28	Denver Nuggets	Team 1	Houston Rockets	Denver Nuggets	129	113	f
Wednesday	2022-11-30	Denver Nuggets	Team 1	Houston Rockets	Denver Nuggets	120	100	f
Thursday	2022-12-08	Denver Nuggets	Team 2	Portland Trail Blazers	Denver Nuggets	121	120	f
Saturday	2022-12-10	Denver Nuggets	Team 1	Utah Jazz	Denver Nuggets	115	110	f
Wednesday	2022-12-14	Denver Nuggets	Team 1	Washington Wizards	Denver Nuggets	141	128	f
Sunday	2022-12-18	Denver Nuggets	Team 1	Charlotte Hornets	Denver Nuggets	119	115	f
Tuesday	2022-12-20	Denver Nuggets	Team 1	Memphis Grizzlies	Denver Nuggets	105	91	f
Friday	2022-12-23	Denver Nuggets	Team 1	Portland Trail Blazers	Denver Nuggets	120	107	f
Sunday	2022-12-25	Denver Nuggets	Team 1	Phoenix Suns	Denver Nuggets	128	125	t
Tuesday	2022-12-27	Denver Nuggets	Team 2	Sacramento Kings	Denver Nuggets	113	106	f
Friday	2022-12-30	Denver Nuggets	Team 1	Miami Heat	Denver Nuggets	124	119	f
Sunday	2023-01-01	Denver Nuggets	Team 1	Boston Celtics	Denver Nuggets	123	111	f
Thursday	2023-01-05	Denver Nuggets	Team 1	LA Clippers	Denver Nuggets	122	91	f
Friday	2023-01-06	Denver Nuggets	Team 1	Cleveland Cavaliers	Denver Nuggets	121	108	f
Monday	2023-01-09	Denver Nuggets	Team 1	Los Angeles Lakers	Denver Nuggets	122	109	f
Wednesday	2023-01-11	Denver Nuggets	Team 1	Phoenix Suns	Denver Nuggets	126	97	f
Friday	2023-01-13	Denver Nuggets	Team 2	LA Clippers	Denver Nuggets	115	103	f
Sunday	2023-01-15	Denver Nuggets	Team 1	Orlando Magic	Denver Nuggets	119	116	f
Tuesday	2023-01-17	Denver Nuggets	Team 1	Portland Trail Blazers	Denver Nuggets	122	113	f
Wednesday	2023-01-18	Denver Nuggets	Team 1	Minnesota Timberwolves	Denver Nuggets	122	118	f
Friday	2023-01-20	Denver Nuggets	Team 1	Indiana Pacers	Denver Nuggets	134	111	f
Tuesday	2023-01-24	Denver Nuggets	Team 2	New Orleans Pelicans	Denver Nuggets	99	98	f
Tuesday	2023-01-31	Denver Nuggets	Team 1	New Orleans Pelicans	Denver Nuggets	122	113	f
Thursday	2023-02-02	Denver Nuggets	Team 1	Golden State Warriors	Denver Nuggets	134	117	f
Saturday	2023-02-04	Denver Nuggets	Team 1	Atlanta Hawks	Denver Nuggets	128	108	f
Tuesday	2023-02-07	Denver Nuggets	Team 1	Minnesota Timberwolves	Denver Nuggets	146	112	f
Saturday	2023-02-11	Denver Nuggets	Team 2	Charlotte Hornets	Denver Nuggets	119	105	f
Monday	2023-02-13	Denver Nuggets	Team 2	Miami Heat	Denver Nuggets	112	108	f
Wednesday	2023-02-15	Denver Nuggets	Team 1	Dallas Mavericks	Denver Nuggets	118	109	f
Thursday	2023-02-23	Denver Nuggets	Team 2	Cleveland Cavaliers	Denver Nuggets	115	109	f
Sunday	2023-02-26	Denver Nuggets	Team 1	LA Clippers	Denver Nuggets	134	124	t
Tuesday	2023-02-28	Denver Nuggets	Team 2	Houston Rockets	Denver Nuggets	133	112	f
Friday	2023-03-03	Denver Nuggets	Team 1	Memphis Grizzlies	Denver Nuggets	113	97	f
Monday	2023-03-06	Denver Nuggets	Team 1	Toronto Raptors	Denver Nuggets	118	113	f
Thursday	2023-03-16	Denver Nuggets	Team 2	Detroit Pistons	Denver Nuggets	119	100	f
Sunday	2023-03-19	Denver Nuggets	Team 2	Brooklyn Nets	Denver Nuggets	108	102	f
Wednesday	2023-03-22	Denver Nuggets	Team 2	Washington Wizards	Denver Nuggets	118	104	f
Saturday	2023-03-25	Denver Nuggets	Team 1	Milwaukee Bucks	Denver Nuggets	129	106	f
Monday	2023-03-27	Denver Nuggets	Team 1	Philadelphia 76ers	Denver Nuggets	116	111	f
Sunday	2023-04-02	Denver Nuggets	Team 1	Golden State Warriors	Denver Nuggets	112	110	f
Sunday	2023-04-09	Denver Nuggets	Team 1	Sacramento Kings	Denver Nuggets	109	95	f
Wednesday	2022-10-19	Memphis Grizzlies	Team 1	New York Knicks	Memphis Grizzlies	115	112	t
Friday	2022-10-21	Memphis Grizzlies	Team 2	Houston Rockets	Memphis Grizzlies	129	122	f
Monday	2022-10-24	Memphis Grizzlies	Team 1	Brooklyn Nets	Memphis Grizzlies	134	124	f
Thursday	2022-10-27	Memphis Grizzlies	Team 2	Sacramento Kings	Memphis Grizzlies	125	110	f
Wednesday	2022-11-02	Memphis Grizzlies	Team 2	Portland Trail Blazers	Memphis Grizzlies	111	106	f
Friday	2022-11-04	Memphis Grizzlies	Team 1	Charlotte Hornets	Memphis Grizzlies	130	99	f
Sunday	2022-11-06	Memphis Grizzlies	Team 1	Washington Wizards	Memphis Grizzlies	103	97	f
Wednesday	2022-11-09	Memphis Grizzlies	Team 2	San Antonio Spurs	Memphis Grizzlies	124	122	t
Friday	2022-11-11	Memphis Grizzlies	Team 1	Minnesota Timberwolves	Memphis Grizzlies	114	103	f
Friday	2022-11-18	Memphis Grizzlies	Team 1	Oklahoma City Thunder	Memphis Grizzlies	121	110	f
Friday	2022-11-25	Memphis Grizzlies	Team 1	New Orleans Pelicans	Memphis Grizzlies	132	111	f
Sunday	2022-11-27	Memphis Grizzlies	Team 2	New York Knicks	Memphis Grizzlies	127	123	f
Friday	2022-12-02	Memphis Grizzlies	Team 1	Philadelphia 76ers	Memphis Grizzlies	117	109	f
Sunday	2022-12-04	Memphis Grizzlies	Team 2	Detroit Pistons	Memphis Grizzlies	122	112	f
Monday	2022-12-05	Memphis Grizzlies	Team 1	Miami Heat	Memphis Grizzlies	101	93	f
Wednesday	2022-12-07	Memphis Grizzlies	Team 1	Oklahoma City Thunder	Memphis Grizzlies	123	102	f
Friday	2022-12-09	Memphis Grizzlies	Team 1	Detroit Pistons	Memphis Grizzlies	114	103	f
Monday	2022-12-12	Memphis Grizzlies	Team 1	Atlanta Hawks	Memphis Grizzlies	128	103	f
Thursday	2022-12-15	Memphis Grizzlies	Team 1	Milwaukee Bucks	Memphis Grizzlies	142	101	f
Friday	2022-12-23	Memphis Grizzlies	Team 2	Phoenix Suns	Memphis Grizzlies	125	100	f
Thursday	2022-12-29	Memphis Grizzlies	Team 2	Toronto Raptors	Memphis Grizzlies	119	106	f
Saturday	2022-12-31	Memphis Grizzlies	Team 1	New Orleans Pelicans	Memphis Grizzlies	116	101	f
Sunday	2023-01-01	Memphis Grizzlies	Team 1	Sacramento Kings	Memphis Grizzlies	118	108	f
Wednesday	2023-01-04	Memphis Grizzlies	Team 2	Charlotte Hornets	Memphis Grizzlies	131	107	f
Thursday	2023-01-05	Memphis Grizzlies	Team 2	Orlando Magic	Memphis Grizzlies	123	115	f
Sunday	2023-01-08	Memphis Grizzlies	Team 1	Utah Jazz	Memphis Grizzlies	123	118	f
Monday	2023-01-09	Memphis Grizzlies	Team 1	San Antonio Spurs	Memphis Grizzlies	121	113	f
Wednesday	2023-01-11	Memphis Grizzlies	Team 1	San Antonio Spurs	Memphis Grizzlies	135	129	f
Saturday	2023-01-14	Memphis Grizzlies	Team 2	Indiana Pacers	Memphis Grizzlies	130	112	f
Monday	2023-01-16	Memphis Grizzlies	Team 1	Phoenix Suns	Memphis Grizzlies	136	106	f
Wednesday	2023-01-18	Memphis Grizzlies	Team 1	Cleveland Cavaliers	Memphis Grizzlies	115	114	f
Sunday	2023-01-29	Memphis Grizzlies	Team 1	Indiana Pacers	Memphis Grizzlies	112	100	f
Tuesday	2023-02-07	Memphis Grizzlies	Team 1	Chicago Bulls	Memphis Grizzlies	104	89	f
Friday	2023-02-10	Memphis Grizzlies	Team 1	Minnesota Timberwolves	Memphis Grizzlies	128	107	f
Wednesday	2023-02-15	Memphis Grizzlies	Team 1	Utah Jazz	Memphis Grizzlies	117	111	f
Saturday	2023-02-25	Memphis Grizzlies	Team 1	Denver Nuggets	Memphis Grizzlies	112	94	f
Tuesday	2023-02-28	Memphis Grizzlies	Team 1	Los Angeles Lakers	Memphis Grizzlies	121	109	f
Wednesday	2023-03-01	Memphis Grizzlies	Team 2	Houston Rockets	Memphis Grizzlies	113	99	f
Thursday	2023-03-09	Memphis Grizzlies	Team 1	Golden State Warriors	Memphis Grizzlies	131	110	f
Saturday	2023-03-11	Memphis Grizzlies	Team 1	Dallas Mavericks	Memphis Grizzlies	112	108	f
Monday	2023-03-13	Memphis Grizzlies	Team 2	Dallas Mavericks	Memphis Grizzlies	104	88	f
Friday	2023-03-17	Memphis Grizzlies	Team 2	San Antonio Spurs	Memphis Grizzlies	126	120	t
Saturday	2023-03-18	Memphis Grizzlies	Team 1	Golden State Warriors	Memphis Grizzlies	133	119	f
Monday	2023-03-20	Memphis Grizzlies	Team 1	Dallas Mavericks	Memphis Grizzlies	112	108	f
Wednesday	2023-03-22	Memphis Grizzlies	Team 1	Houston Rockets	Memphis Grizzlies	130	125	f
Friday	2023-03-24	Memphis Grizzlies	Team 1	Houston Rockets	Memphis Grizzlies	151	114	f
Sunday	2023-03-26	Memphis Grizzlies	Team 2	Atlanta Hawks	Memphis Grizzlies	123	119	f
Tuesday	2023-03-28	Memphis Grizzlies	Team 1	Orlando Magic	Memphis Grizzlies	113	108	f
Friday	2023-03-31	Memphis Grizzlies	Team 1	LA Clippers	Memphis Grizzlies	108	94	f
Tuesday	2023-04-04	Memphis Grizzlies	Team 1	Portland Trail Blazers	Memphis Grizzlies	119	109	f
Friday	2023-04-07	Memphis Grizzlies	Team 2	Milwaukee Bucks	Memphis Grizzlies	137	114	f
Saturday	2022-10-29	Sacramento Kings	Team 1	Miami Heat	Sacramento Kings	119	113	f
Monday	2022-10-31	Sacramento Kings	Team 2	Charlotte Hornets	Sacramento Kings	115	108	f
Saturday	2022-11-05	Sacramento Kings	Team 2	Orlando Magic	Sacramento Kings	126	123	t
Wednesday	2022-11-09	Sacramento Kings	Team 1	Cleveland Cavaliers	Sacramento Kings	127	120	f
Friday	2022-11-11	Sacramento Kings	Team 2	Los Angeles Lakers	Sacramento Kings	120	114	f
Sunday	2022-11-13	Sacramento Kings	Team 1	Golden State Warriors	Sacramento Kings	122	115	f
Tuesday	2022-11-15	Sacramento Kings	Team 1	Brooklyn Nets	Sacramento Kings	153	121	f
Thursday	2022-11-17	Sacramento Kings	Team 1	San Antonio Spurs	Sacramento Kings	130	112	f
Sunday	2022-11-20	Sacramento Kings	Team 1	Detroit Pistons	Sacramento Kings	137	129	f
Tuesday	2022-11-22	Sacramento Kings	Team 2	Memphis Grizzlies	Sacramento Kings	113	109	f
Wednesday	2022-11-30	Sacramento Kings	Team 1	Indiana Pacers	Sacramento Kings	137	114	f
Saturday	2022-12-03	Sacramento Kings	Team 2	LA Clippers	Sacramento Kings	123	96	f
Sunday	2022-12-04	Sacramento Kings	Team 1	Chicago Bulls	Sacramento Kings	110	101	f
Friday	2022-12-09	Sacramento Kings	Team 2	Cleveland Cavaliers	Sacramento Kings	106	95	f
Wednesday	2022-12-14	Sacramento Kings	Team 2	Toronto Raptors	Sacramento Kings	124	123	f
Friday	2022-12-16	Sacramento Kings	Team 2	Detroit Pistons	Sacramento Kings	122	113	f
Wednesday	2022-12-21	Sacramento Kings	Team 1	Los Angeles Lakers	Sacramento Kings	134	120	f
Wednesday	2022-12-28	Sacramento Kings	Team 1	Denver Nuggets	Sacramento Kings	127	126	f
Friday	2022-12-30	Sacramento Kings	Team 1	Utah Jazz	Sacramento Kings	126	125	f
Tuesday	2023-01-03	Sacramento Kings	Team 2	Utah Jazz	Sacramento Kings	117	115	f
Monday	2023-01-09	Sacramento Kings	Team 1	Orlando Magic	Sacramento Kings	136	111	f
Wednesday	2023-01-11	Sacramento Kings	Team 1	Houston Rockets	Sacramento Kings	135	115	f
Friday	2023-01-13	Sacramento Kings	Team 1	Houston Rockets	Sacramento Kings	139	114	f
Sunday	2023-01-15	Sacramento Kings	Team 2	San Antonio Spurs	Sacramento Kings	132	119	f
Wednesday	2023-01-18	Sacramento Kings	Team 2	Los Angeles Lakers	Sacramento Kings	116	111	f
Friday	2023-01-20	Sacramento Kings	Team 1	Oklahoma City Thunder	Sacramento Kings	118	113	f
Monday	2023-01-23	Sacramento Kings	Team 1	Memphis Grizzlies	Sacramento Kings	133	100	f
Monday	2023-01-30	Sacramento Kings	Team 2	Minnesota Timberwolves	Sacramento Kings	118	111	t
Wednesday	2023-02-01	Sacramento Kings	Team 2	San Antonio Spurs	Sacramento Kings	119	109	f
Monday	2023-02-06	Sacramento Kings	Team 2	Houston Rockets	Sacramento Kings	140	120	f
Wednesday	2023-02-08	Sacramento Kings	Team 2	Houston Rockets	Sacramento Kings	130	128	f
Saturday	2023-02-11	Sacramento Kings	Team 1	Dallas Mavericks	Sacramento Kings	133	128	t
Thursday	2023-02-23	Sacramento Kings	Team 1	Portland Trail Blazers	Sacramento Kings	133	116	f
Friday	2023-02-24	Sacramento Kings	Team 2	LA Clippers	Sacramento Kings	176	175	t
Sunday	2023-02-26	Sacramento Kings	Team 2	Oklahoma City Thunder	Sacramento Kings	124	115	f
Tuesday	2023-02-28	Sacramento Kings	Team 2	Oklahoma City Thunder	Sacramento Kings	123	117	f
Friday	2023-03-03	Sacramento Kings	Team 1	LA Clippers	Sacramento Kings	128	127	f
Monday	2023-03-06	Sacramento Kings	Team 1	New Orleans Pelicans	Sacramento Kings	123	108	f
Thursday	2023-03-09	Sacramento Kings	Team 1	New York Knicks	Sacramento Kings	122	117	f
Saturday	2023-03-11	Sacramento Kings	Team 2	Phoenix Suns	Sacramento Kings	128	119	f
Wednesday	2023-03-15	Sacramento Kings	Team 2	Chicago Bulls	Sacramento Kings	117	114	f
Thursday	2023-03-16	Sacramento Kings	Team 2	Brooklyn Nets	Sacramento Kings	101	96	f
Saturday	2023-03-18	Sacramento Kings	Team 2	Washington Wizards	Sacramento Kings	132	118	f
Friday	2023-03-24	Sacramento Kings	Team 1	Phoenix Suns	Sacramento Kings	135	127	f
Saturday	2023-03-25	Sacramento Kings	Team 1	Utah Jazz	Sacramento Kings	121	113	f
Wednesday	2023-03-29	Sacramento Kings	Team 2	Portland Trail Blazers	Sacramento Kings	120	80	f
Friday	2023-03-31	Sacramento Kings	Team 2	Portland Trail Blazers	Sacramento Kings	138	114	f
Tuesday	2023-04-04	Sacramento Kings	Team 2	New Orleans Pelicans	Sacramento Kings	121	103	f
Wednesday	2022-10-19	Phoenix Suns	Team 1	Dallas Mavericks	Phoenix Suns	107	105	f
Sunday	2022-10-23	Phoenix Suns	Team 2	LA Clippers	Phoenix Suns	112	95	f
Tuesday	2022-10-25	Phoenix Suns	Team 1	Golden State Warriors	Phoenix Suns	134	105	f
Friday	2022-10-28	Phoenix Suns	Team 1	New Orleans Pelicans	Phoenix Suns	124	111	f
Sunday	2022-10-30	Phoenix Suns	Team 1	Houston Rockets	Phoenix Suns	124	109	f
Tuesday	2022-11-01	Phoenix Suns	Team 1	Minnesota Timberwolves	Phoenix Suns	116	107	f
Saturday	2022-11-05	Phoenix Suns	Team 1	Portland Trail Blazers	Phoenix Suns	102	82	f
Wednesday	2022-11-09	Phoenix Suns	Team 2	Minnesota Timberwolves	Phoenix Suns	129	117	f
Wednesday	2022-11-16	Phoenix Suns	Team 1	Golden State Warriors	Phoenix Suns	130	119	f
Sunday	2022-11-20	Phoenix Suns	Team 1	New York Knicks	Phoenix Suns	116	95	f
Tuesday	2022-11-22	Phoenix Suns	Team 1	Los Angeles Lakers	Phoenix Suns	115	105	f
Friday	2022-11-25	Phoenix Suns	Team 1	Detroit Pistons	Phoenix Suns	108	102	f
Saturday	2022-11-26	Phoenix Suns	Team 1	Utah Jazz	Phoenix Suns	113	112	f
Monday	2022-11-28	Phoenix Suns	Team 2	Sacramento Kings	Phoenix Suns	122	117	f
Wednesday	2022-11-30	Phoenix Suns	Team 1	Chicago Bulls	Phoenix Suns	132	113	f
Sunday	2022-12-04	Phoenix Suns	Team 2	San Antonio Spurs	Phoenix Suns	133	95	f
Thursday	2022-12-15	Phoenix Suns	Team 2	LA Clippers	Phoenix Suns	111	95	f
Saturday	2022-12-17	Phoenix Suns	Team 1	New Orleans Pelicans	Phoenix Suns	118	114	f
Monday	2022-12-19	Phoenix Suns	Team 1	Los Angeles Lakers	Phoenix Suns	130	104	f
Tuesday	2022-12-27	Phoenix Suns	Team 2	Memphis Grizzlies	Phoenix Suns	125	108	f
Tuesday	2023-01-10	Phoenix Suns	Team 2	Golden State Warriors	Phoenix Suns	125	113	f
Thursday	2023-01-19	Phoenix Suns	Team 1	Brooklyn Nets	Phoenix Suns	117	112	f
Saturday	2023-01-21	Phoenix Suns	Team 1	Indiana Pacers	Phoenix Suns	112	107	f
Sunday	2023-01-22	Phoenix Suns	Team 1	Memphis Grizzlies	Phoenix Suns	112	110	f
Tuesday	2023-01-24	Phoenix Suns	Team 1	Charlotte Hornets	Phoenix Suns	128	97	f
Saturday	2023-01-28	Phoenix Suns	Team 2	San Antonio Spurs	Phoenix Suns	128	118	t
Monday	2023-01-30	Phoenix Suns	Team 1	Toronto Raptors	Phoenix Suns	114	106	f
Friday	2023-02-03	Phoenix Suns	Team 2	Boston Celtics	Phoenix Suns	106	94	f
Saturday	2023-02-04	Phoenix Suns	Team 2	Detroit Pistons	Phoenix Suns	116	100	f
Tuesday	2023-02-07	Phoenix Suns	Team 2	Brooklyn Nets	Phoenix Suns	116	112	f
Friday	2023-02-10	Phoenix Suns	Team 2	Indiana Pacers	Phoenix Suns	117	104	f
Tuesday	2023-02-14	Phoenix Suns	Team 1	Sacramento Kings	Phoenix Suns	120	109	f
Friday	2023-02-24	Phoenix Suns	Team 1	Oklahoma City Thunder	Phoenix Suns	124	115	f
Wednesday	2023-03-01	Phoenix Suns	Team 2	Charlotte Hornets	Phoenix Suns	105	91	f
Friday	2023-03-03	Phoenix Suns	Team 2	Chicago Bulls	Phoenix Suns	125	104	f
Sunday	2023-03-05	Phoenix Suns	Team 2	Dallas Mavericks	Phoenix Suns	130	126	f
Wednesday	2023-03-08	Phoenix Suns	Team 1	Oklahoma City Thunder	Phoenix Suns	132	101	f
Thursday	2023-03-16	Phoenix Suns	Team 1	Orlando Magic	Phoenix Suns	116	113	f
Saturday	2023-03-25	Phoenix Suns	Team 1	Philadelphia 76ers	Phoenix Suns	125	105	f
Monday	2023-03-27	Phoenix Suns	Team 2	Utah Jazz	Phoenix Suns	117	103	f
Wednesday	2023-03-29	Phoenix Suns	Team 1	Minnesota Timberwolves	Phoenix Suns	107	100	f
Friday	2023-03-31	Phoenix Suns	Team 1	Denver Nuggets	Phoenix Suns	100	93	f
Sunday	2023-04-02	Phoenix Suns	Team 2	Oklahoma City Thunder	Phoenix Suns	128	118	f
Tuesday	2023-04-04	Phoenix Suns	Team 1	San Antonio Spurs	Phoenix Suns	115	94	f
Thursday	2023-04-06	Phoenix Suns	Team 1	Denver Nuggets	Phoenix Suns	119	115	f
Thursday	2022-10-20	LA Clippers	Team 2	Los Angeles Lakers	LA Clippers	103	97	f
Saturday	2022-10-22	LA Clippers	Team 2	Sacramento Kings	LA Clippers	111	109	f
Monday	2022-10-31	LA Clippers	Team 1	Houston Rockets	LA Clippers	95	93	f
Wednesday	2022-11-02	LA Clippers	Team 2	Houston Rockets	LA Clippers	109	101	f
Friday	2022-11-04	LA Clippers	Team 2	San Antonio Spurs	LA Clippers	113	106	f
Monday	2022-11-07	LA Clippers	Team 1	Cleveland Cavaliers	LA Clippers	119	117	f
Wednesday	2022-11-09	LA Clippers	Team 1	Los Angeles Lakers	LA Clippers	114	101	f
Monday	2022-11-14	LA Clippers	Team 2	Houston Rockets	LA Clippers	122	106	f
Thursday	2022-11-17	LA Clippers	Team 1	Detroit Pistons	LA Clippers	96	91	f
Saturday	2022-11-19	LA Clippers	Team 1	San Antonio Spurs	LA Clippers	119	97	f
Monday	2022-11-21	LA Clippers	Team 1	Utah Jazz	LA Clippers	121	114	f
Sunday	2022-11-27	LA Clippers	Team 1	Indiana Pacers	LA Clippers	114	100	f
Tuesday	2022-11-29	LA Clippers	Team 2	Portland Trail Blazers	LA Clippers	118	112	f
Monday	2022-12-05	LA Clippers	Team 2	Charlotte Hornets	LA Clippers	119	117	f
Saturday	2022-12-10	LA Clippers	Team 2	Washington Wizards	LA Clippers	114	107	f
Monday	2022-12-12	LA Clippers	Team 1	Boston Celtics	LA Clippers	113	93	f
Wednesday	2022-12-14	LA Clippers	Team 1	Minnesota Timberwolves	LA Clippers	99	88	f
Saturday	2022-12-17	LA Clippers	Team 1	Washington Wizards	LA Clippers	102	93	f
Wednesday	2022-12-21	LA Clippers	Team 1	Charlotte Hornets	LA Clippers	126	105	f
Monday	2022-12-26	LA Clippers	Team 2	Detroit Pistons	LA Clippers	142	131	t
Tuesday	2022-12-27	LA Clippers	Team 2	Toronto Raptors	LA Clippers	124	113	f
Tuesday	2023-01-10	LA Clippers	Team 1	Dallas Mavericks	LA Clippers	113	101	f
Sunday	2023-01-15	LA Clippers	Team 1	Houston Rockets	LA Clippers	121	100	f
Friday	2023-01-20	LA Clippers	Team 2	San Antonio Spurs	LA Clippers	131	126	f
Sunday	2023-01-22	LA Clippers	Team 2	Dallas Mavericks	LA Clippers	112	98	f
Tuesday	2023-01-24	LA Clippers	Team 2	Los Angeles Lakers	LA Clippers	133	115	f
Thursday	2023-01-26	LA Clippers	Team 1	San Antonio Spurs	LA Clippers	138	100	f
Saturday	2023-01-28	LA Clippers	Team 2	Atlanta Hawks	LA Clippers	120	113	f
Tuesday	2023-01-31	LA Clippers	Team 2	Chicago Bulls	LA Clippers	108	103	f
Saturday	2023-02-04	LA Clippers	Team 2	New York Knicks	LA Clippers	134	128	t
Monday	2023-02-06	LA Clippers	Team 2	Brooklyn Nets	LA Clippers	124	116	f
Tuesday	2023-02-14	LA Clippers	Team 1	Golden State Warriors	LA Clippers	134	124	f
Thursday	2023-02-16	LA Clippers	Team 2	Phoenix Suns	LA Clippers	116	107	f
Sunday	2023-03-05	LA Clippers	Team 1	Memphis Grizzlies	LA Clippers	135	129	f
Wednesday	2023-03-08	LA Clippers	Team 1	Toronto Raptors	LA Clippers	108	100	f
Saturday	2023-03-11	LA Clippers	Team 1	New York Knicks	LA Clippers	106	95	f
Wednesday	2023-03-15	LA Clippers	Team 1	Golden State Warriors	LA Clippers	134	126	f
Sunday	2023-03-19	LA Clippers	Team 2	Portland Trail Blazers	LA Clippers	117	102	f
Thursday	2023-03-23	LA Clippers	Team 1	Oklahoma City Thunder	LA Clippers	127	105	f
Monday	2023-03-27	LA Clippers	Team 1	Chicago Bulls	LA Clippers	124	112	f
Wednesday	2023-03-29	LA Clippers	Team 2	Memphis Grizzlies	LA Clippers	141	132	f
Wednesday	2023-04-05	LA Clippers	Team 1	Los Angeles Lakers	LA Clippers	125	118	f
Saturday	2023-04-08	LA Clippers	Team 1	Portland Trail Blazers	LA Clippers	136	125	f
Sunday	2023-04-09	LA Clippers	Team 2	Phoenix Suns	LA Clippers	119	114	f
Tuesday	2022-10-18	Golden State Warriors	Team 1	Los Angeles Lakers	Golden State Warriors	123	109	f
Sunday	2022-10-23	Golden State Warriors	Team 1	Sacramento Kings	Golden State Warriors	130	125	f
Thursday	2022-10-27	Golden State Warriors	Team 1	Miami Heat	Golden State Warriors	123	110	f
Monday	2022-11-07	Golden State Warriors	Team 1	Sacramento Kings	Golden State Warriors	116	113	f
Friday	2022-11-11	Golden State Warriors	Team 1	Cleveland Cavaliers	Golden State Warriors	106	101	f
Monday	2022-11-14	Golden State Warriors	Team 1	San Antonio Spurs	Golden State Warriors	132	95	f
Friday	2022-11-18	Golden State Warriors	Team 1	New York Knicks	Golden State Warriors	111	101	f
Sunday	2022-11-20	Golden State Warriors	Team 2	Houston Rockets	Golden State Warriors	127	120	f
Wednesday	2022-11-23	Golden State Warriors	Team 1	LA Clippers	Golden State Warriors	124	107	f
Friday	2022-11-25	Golden State Warriors	Team 1	Utah Jazz	Golden State Warriors	129	118	f
Sunday	2022-11-27	Golden State Warriors	Team 2	Minnesota Timberwolves	Golden State Warriors	137	114	f
Friday	2022-12-02	Golden State Warriors	Team 1	Chicago Bulls	Golden State Warriors	119	111	f
Saturday	2022-12-03	Golden State Warriors	Team 1	Houston Rockets	Golden State Warriors	120	101	f
Saturday	2022-12-10	Golden State Warriors	Team 1	Boston Celtics	Golden State Warriors	123	107	f
Sunday	2022-12-18	Golden State Warriors	Team 2	Toronto Raptors	Golden State Warriors	126	110	f
Sunday	2022-12-25	Golden State Warriors	Team 1	Memphis Grizzlies	Golden State Warriors	123	109	f
Tuesday	2022-12-27	Golden State Warriors	Team 1	Charlotte Hornets	Golden State Warriors	110	105	f
Wednesday	2022-12-28	Golden State Warriors	Team 1	Utah Jazz	Golden State Warriors	112	107	f
Friday	2022-12-30	Golden State Warriors	Team 1	Portland Trail Blazers	Golden State Warriors	118	112	f
Monday	2023-01-02	Golden State Warriors	Team 1	Atlanta Hawks	Golden State Warriors	143	141	t
Friday	2023-01-13	Golden State Warriors	Team 2	San Antonio Spurs	Golden State Warriors	144	113	f
Monday	2023-01-16	Golden State Warriors	Team 2	Washington Wizards	Golden State Warriors	127	118	f
Friday	2023-01-20	Golden State Warriors	Team 2	Cleveland Cavaliers	Golden State Warriors	120	114	f
Wednesday	2023-01-25	Golden State Warriors	Team 1	Memphis Grizzlies	Golden State Warriors	122	120	f
Friday	2023-01-27	Golden State Warriors	Team 1	Toronto Raptors	Golden State Warriors	129	117	f
Monday	2023-01-30	Golden State Warriors	Team 2	Oklahoma City Thunder	Golden State Warriors	128	120	f
Saturday	2023-02-04	Golden State Warriors	Team 1	Dallas Mavericks	Golden State Warriors	119	113	f
Monday	2023-02-06	Golden State Warriors	Team 1	Oklahoma City Thunder	Golden State Warriors	141	114	f
Monday	2023-02-13	Golden State Warriors	Team 1	Washington Wizards	Golden State Warriors	135	126	f
Friday	2023-02-24	Golden State Warriors	Team 1	Houston Rockets	Golden State Warriors	116	101	f
Sunday	2023-02-26	Golden State Warriors	Team 1	Minnesota Timberwolves	Golden State Warriors	109	104	f
Tuesday	2023-02-28	Golden State Warriors	Team 1	Portland Trail Blazers	Golden State Warriors	123	105	f
Thursday	2023-03-02	Golden State Warriors	Team 1	LA Clippers	Golden State Warriors	115	91	f
Friday	2023-03-03	Golden State Warriors	Team 1	New Orleans Pelicans	Golden State Warriors	108	99	f
Saturday	2023-03-11	Golden State Warriors	Team 1	Milwaukee Bucks	Golden State Warriors	125	116	t
Monday	2023-03-13	Golden State Warriors	Team 1	Phoenix Suns	Golden State Warriors	123	112	f
Monday	2023-03-20	Golden State Warriors	Team 2	Houston Rockets	Golden State Warriors	121	108	f
Wednesday	2023-03-22	Golden State Warriors	Team 2	Dallas Mavericks	Golden State Warriors	127	125	f
Friday	2023-03-24	Golden State Warriors	Team 1	Philadelphia 76ers	Golden State Warriors	120	112	f
Tuesday	2023-03-28	Golden State Warriors	Team 1	New Orleans Pelicans	Golden State Warriors	120	109	f
Friday	2023-03-31	Golden State Warriors	Team 1	San Antonio Spurs	Golden State Warriors	130	115	f
Tuesday	2023-04-04	Golden State Warriors	Team 1	Oklahoma City Thunder	Golden State Warriors	136	125	f
Friday	2023-04-07	Golden State Warriors	Team 2	Sacramento Kings	Golden State Warriors	119	97	f
Sunday	2023-04-09	Golden State Warriors	Team 2	Portland Trail Blazers	Golden State Warriors	157	101	f
Sunday	2022-10-30	Los Angeles Lakers	Team 1	Denver Nuggets	Los Angeles Lakers	121	110	f
Wednesday	2022-11-02	Los Angeles Lakers	Team 1	New Orleans Pelicans	Los Angeles Lakers	120	117	t
Sunday	2022-11-13	Los Angeles Lakers	Team 1	Brooklyn Nets	Los Angeles Lakers	116	103	f
Friday	2022-11-18	Los Angeles Lakers	Team 1	Detroit Pistons	Los Angeles Lakers	128	121	f
Sunday	2022-11-20	Los Angeles Lakers	Team 1	San Antonio Spurs	Los Angeles Lakers	123	92	f
Friday	2022-11-25	Los Angeles Lakers	Team 2	San Antonio Spurs	Los Angeles Lakers	105	94	f
Saturday	2022-11-26	Los Angeles Lakers	Team 2	San Antonio Spurs	Los Angeles Lakers	143	138	f
Wednesday	2022-11-30	Los Angeles Lakers	Team 1	Portland Trail Blazers	Los Angeles Lakers	128	109	f
Friday	2022-12-02	Los Angeles Lakers	Team 2	Milwaukee Bucks	Los Angeles Lakers	133	129	f
Sunday	2022-12-04	Los Angeles Lakers	Team 2	Washington Wizards	Los Angeles Lakers	130	119	f
Sunday	2022-12-11	Los Angeles Lakers	Team 2	Detroit Pistons	Los Angeles Lakers	124	117	f
Friday	2022-12-16	Los Angeles Lakers	Team 1	Denver Nuggets	Los Angeles Lakers	126	108	f
Sunday	2022-12-18	Los Angeles Lakers	Team 1	Washington Wizards	Los Angeles Lakers	119	117	f
Tuesday	2022-12-27	Los Angeles Lakers	Team 2	Orlando Magic	Los Angeles Lakers	129	110	f
Friday	2022-12-30	Los Angeles Lakers	Team 2	Atlanta Hawks	Los Angeles Lakers	130	121	f
Monday	2023-01-02	Los Angeles Lakers	Team 2	Charlotte Hornets	Los Angeles Lakers	121	115	f
Wednesday	2023-01-04	Los Angeles Lakers	Team 1	Miami Heat	Los Angeles Lakers	112	109	f
Friday	2023-01-06	Los Angeles Lakers	Team 1	Atlanta Hawks	Los Angeles Lakers	130	114	f
Saturday	2023-01-07	Los Angeles Lakers	Team 2	Sacramento Kings	Los Angeles Lakers	136	134	f
Monday	2023-01-16	Los Angeles Lakers	Team 1	Houston Rockets	Los Angeles Lakers	140	132	f
Friday	2023-01-20	Los Angeles Lakers	Team 1	Memphis Grizzlies	Los Angeles Lakers	122	121	f
Sunday	2023-01-22	Los Angeles Lakers	Team 2	Portland Trail Blazers	Los Angeles Lakers	121	112	f
Wednesday	2023-01-25	Los Angeles Lakers	Team 1	San Antonio Spurs	Los Angeles Lakers	113	104	f
Tuesday	2023-01-31	Los Angeles Lakers	Team 2	New York Knicks	Los Angeles Lakers	129	123	t
Thursday	2023-02-02	Los Angeles Lakers	Team 2	Indiana Pacers	Los Angeles Lakers	112	111	f
Saturday	2023-02-11	Los Angeles Lakers	Team 2	Golden State Warriors	Los Angeles Lakers	109	103	f
Wednesday	2023-02-15	Los Angeles Lakers	Team 1	New Orleans Pelicans	Los Angeles Lakers	120	102	f
Thursday	2023-02-23	Los Angeles Lakers	Team 1	Golden State Warriors	Los Angeles Lakers	124	111	f
Sunday	2023-02-26	Los Angeles Lakers	Team 2	Dallas Mavericks	Los Angeles Lakers	111	108	f
Wednesday	2023-03-01	Los Angeles Lakers	Team 2	Oklahoma City Thunder	Los Angeles Lakers	123	117	f
Sunday	2023-03-05	Los Angeles Lakers	Team 1	Golden State Warriors	Los Angeles Lakers	113	105	f
Tuesday	2023-03-07	Los Angeles Lakers	Team 1	Memphis Grizzlies	Los Angeles Lakers	112	103	f
Friday	2023-03-10	Los Angeles Lakers	Team 1	Toronto Raptors	Los Angeles Lakers	122	112	f
Tuesday	2023-03-14	Los Angeles Lakers	Team 2	New Orleans Pelicans	Los Angeles Lakers	123	108	f
Sunday	2023-03-19	Los Angeles Lakers	Team 1	Orlando Magic	Los Angeles Lakers	111	105	f
Wednesday	2023-03-22	Los Angeles Lakers	Team 1	Phoenix Suns	Los Angeles Lakers	122	111	f
Friday	2023-03-24	Los Angeles Lakers	Team 1	Oklahoma City Thunder	Los Angeles Lakers	116	111	f
Wednesday	2023-03-29	Los Angeles Lakers	Team 2	Chicago Bulls	Los Angeles Lakers	121	110	f
Friday	2023-03-31	Los Angeles Lakers	Team 2	Minnesota Timberwolves	Los Angeles Lakers	123	111	f
Sunday	2023-04-02	Los Angeles Lakers	Team 2	Houston Rockets	Los Angeles Lakers	134	109	f
Tuesday	2023-04-04	Los Angeles Lakers	Team 2	Utah Jazz	Los Angeles Lakers	135	133	t
Friday	2023-04-07	Los Angeles Lakers	Team 1	Phoenix Suns	Los Angeles Lakers	121	107	f
Sunday	2023-04-09	Los Angeles Lakers	Team 1	Utah Jazz	Los Angeles Lakers	128	117	f
Wednesday	2022-10-19	Minnesota Timberwolves	Team 1	Oklahoma City Thunder	Minnesota Timberwolves	115	108	f
Sunday	2022-10-23	Minnesota Timberwolves	Team 2	Oklahoma City Thunder	Minnesota Timberwolves	116	106	f
Wednesday	2022-10-26	Minnesota Timberwolves	Team 1	San Antonio Spurs	Minnesota Timberwolves	134	122	f
Friday	2022-10-28	Minnesota Timberwolves	Team 1	Los Angeles Lakers	Minnesota Timberwolves	111	102	f
Saturday	2022-11-05	Minnesota Timberwolves	Team 1	Houston Rockets	Minnesota Timberwolves	129	117	f
Sunday	2022-11-13	Minnesota Timberwolves	Team 2	Cleveland Cavaliers	Minnesota Timberwolves	129	124	f
Wednesday	2022-11-16	Minnesota Timberwolves	Team 2	Orlando Magic	Minnesota Timberwolves	126	108	f
Saturday	2022-11-19	Minnesota Timberwolves	Team 2	Philadelphia 76ers	Minnesota Timberwolves	112	109	f
Monday	2022-11-21	Minnesota Timberwolves	Team 1	Miami Heat	Minnesota Timberwolves	105	101	f
Wednesday	2022-11-23	Minnesota Timberwolves	Team 2	Indiana Pacers	Minnesota Timberwolves	115	101	f
Wednesday	2022-11-30	Minnesota Timberwolves	Team 1	Memphis Grizzlies	Minnesota Timberwolves	109	101	f
Wednesday	2022-12-07	Minnesota Timberwolves	Team 1	Indiana Pacers	Minnesota Timberwolves	121	115	f
Friday	2022-12-09	Minnesota Timberwolves	Team 2	Utah Jazz	Minnesota Timberwolves	118	108	f
Friday	2022-12-16	Minnesota Timberwolves	Team 2	Oklahoma City Thunder	Minnesota Timberwolves	112	110	f
Sunday	2022-12-18	Minnesota Timberwolves	Team 1	Chicago Bulls	Minnesota Timberwolves	150	126	f
Monday	2022-12-19	Minnesota Timberwolves	Team 1	Dallas Mavericks	Minnesota Timberwolves	116	106	f
Monday	2023-01-02	Minnesota Timberwolves	Team 1	Denver Nuggets	Minnesota Timberwolves	124	111	f
Wednesday	2023-01-04	Minnesota Timberwolves	Team 1	Portland Trail Blazers	Minnesota Timberwolves	113	106	f
Friday	2023-01-06	Minnesota Timberwolves	Team 1	LA Clippers	Minnesota Timberwolves	128	115	f
Sunday	2023-01-08	Minnesota Timberwolves	Team 2	Houston Rockets	Minnesota Timberwolves	104	96	f
Friday	2023-01-13	Minnesota Timberwolves	Team 1	Phoenix Suns	Minnesota Timberwolves	121	116	f
Saturday	2023-01-14	Minnesota Timberwolves	Team 1	Cleveland Cavaliers	Minnesota Timberwolves	110	102	f
Thursday	2023-01-19	Minnesota Timberwolves	Team 1	Toronto Raptors	Minnesota Timberwolves	128	126	f
Saturday	2023-01-21	Minnesota Timberwolves	Team 1	Houston Rockets	Minnesota Timberwolves	113	104	f
Wednesday	2023-01-25	Minnesota Timberwolves	Team 2	New Orleans Pelicans	Minnesota Timberwolves	111	102	f
Friday	2023-01-27	Minnesota Timberwolves	Team 1	Memphis Grizzlies	Minnesota Timberwolves	111	100	f
Saturday	2023-01-28	Minnesota Timberwolves	Team 1	Sacramento Kings	Minnesota Timberwolves	117	110	f
Wednesday	2023-02-01	Minnesota Timberwolves	Team 1	Golden State Warriors	Minnesota Timberwolves	119	114	t
Sunday	2023-02-05	Minnesota Timberwolves	Team 1	Denver Nuggets	Minnesota Timberwolves	128	98	f
Wednesday	2023-02-08	Minnesota Timberwolves	Team 2	Utah Jazz	Minnesota Timberwolves	143	118	f
Monday	2023-02-13	Minnesota Timberwolves	Team 2	Dallas Mavericks	Minnesota Timberwolves	124	121	f
Tuesday	2023-02-28	Minnesota Timberwolves	Team 2	LA Clippers	Minnesota Timberwolves	108	101	f
Friday	2023-03-03	Minnesota Timberwolves	Team 2	Los Angeles Lakers	Minnesota Timberwolves	110	102	f
Saturday	2023-03-04	Minnesota Timberwolves	Team 2	Sacramento Kings	Minnesota Timberwolves	138	134	f
Monday	2023-03-13	Minnesota Timberwolves	Team 2	Atlanta Hawks	Minnesota Timberwolves	136	115	f
Monday	2023-03-20	Minnesota Timberwolves	Team 2	New York Knicks	Minnesota Timberwolves	140	134	f
Wednesday	2023-03-22	Minnesota Timberwolves	Team 1	Atlanta Hawks	Minnesota Timberwolves	125	124	f
Sunday	2023-03-26	Minnesota Timberwolves	Team 2	Golden State Warriors	Minnesota Timberwolves	99	96	f
Monday	2023-03-27	Minnesota Timberwolves	Team 2	Sacramento Kings	Minnesota Timberwolves	119	115	f
Tuesday	2023-04-04	Minnesota Timberwolves	Team 2	Brooklyn Nets	Minnesota Timberwolves	107	102	f
Saturday	2023-04-08	Minnesota Timberwolves	Team 2	San Antonio Spurs	Minnesota Timberwolves	151	131	f
Sunday	2023-04-09	Minnesota Timberwolves	Team 1	New Orleans Pelicans	Minnesota Timberwolves	113	108	f
Wednesday	2022-10-19	New Orleans Pelicans	Team 2	Brooklyn Nets	New Orleans Pelicans	130	108	f
Friday	2022-10-21	New Orleans Pelicans	Team 2	Charlotte Hornets	New Orleans Pelicans	124	112	f
Tuesday	2022-10-25	New Orleans Pelicans	Team 1	Dallas Mavericks	New Orleans Pelicans	113	111	f
Sunday	2022-10-30	New Orleans Pelicans	Team 2	LA Clippers	New Orleans Pelicans	112	91	f
Friday	2022-11-04	New Orleans Pelicans	Team 1	Golden State Warriors	New Orleans Pelicans	114	105	f
Wednesday	2022-11-09	New Orleans Pelicans	Team 2	Chicago Bulls	New Orleans Pelicans	115	111	f
Saturday	2022-11-12	New Orleans Pelicans	Team 1	Houston Rockets	New Orleans Pelicans	119	106	f
Tuesday	2022-11-15	New Orleans Pelicans	Team 1	Memphis Grizzlies	New Orleans Pelicans	113	102	f
Wednesday	2022-11-16	New Orleans Pelicans	Team 1	Chicago Bulls	New Orleans Pelicans	124	110	f
Monday	2022-11-21	New Orleans Pelicans	Team 1	Golden State Warriors	New Orleans Pelicans	128	83	f
Wednesday	2022-11-23	New Orleans Pelicans	Team 2	San Antonio Spurs	New Orleans Pelicans	129	110	f
Monday	2022-11-28	New Orleans Pelicans	Team 1	Oklahoma City Thunder	New Orleans Pelicans	105	101	f
Wednesday	2022-11-30	New Orleans Pelicans	Team 1	Toronto Raptors	New Orleans Pelicans	126	108	f
Friday	2022-12-02	New Orleans Pelicans	Team 2	San Antonio Spurs	New Orleans Pelicans	117	99	f
Sunday	2022-12-04	New Orleans Pelicans	Team 1	Denver Nuggets	New Orleans Pelicans	121	106	f
Wednesday	2022-12-07	New Orleans Pelicans	Team 1	Detroit Pistons	New Orleans Pelicans	104	98	f
Friday	2022-12-09	New Orleans Pelicans	Team 1	Phoenix Suns	New Orleans Pelicans	128	117	f
Sunday	2022-12-11	New Orleans Pelicans	Team 1	Phoenix Suns	New Orleans Pelicans	129	124	t
Thursday	2022-12-22	New Orleans Pelicans	Team 1	San Antonio Spurs	New Orleans Pelicans	126	117	f
Friday	2022-12-23	New Orleans Pelicans	Team 2	Oklahoma City Thunder	New Orleans Pelicans	128	125	t
Monday	2022-12-26	New Orleans Pelicans	Team 1	Indiana Pacers	New Orleans Pelicans	113	93	f
Wednesday	2022-12-28	New Orleans Pelicans	Team 1	Minnesota Timberwolves	New Orleans Pelicans	119	118	f
Friday	2022-12-30	New Orleans Pelicans	Team 1	Philadelphia 76ers	New Orleans Pelicans	127	116	f
Wednesday	2023-01-04	New Orleans Pelicans	Team 1	Houston Rockets	New Orleans Pelicans	119	108	f
Monday	2023-01-09	New Orleans Pelicans	Team 2	Washington Wizards	New Orleans Pelicans	132	112	f
Friday	2023-01-13	New Orleans Pelicans	Team 2	Detroit Pistons	New Orleans Pelicans	116	110	f
Saturday	2023-02-04	New Orleans Pelicans	Team 1	Los Angeles Lakers	New Orleans Pelicans	131	126	f
Sunday	2023-02-05	New Orleans Pelicans	Team 1	Sacramento Kings	New Orleans Pelicans	136	104	f
Tuesday	2023-02-07	New Orleans Pelicans	Team 1	Atlanta Hawks	New Orleans Pelicans	116	107	f
Monday	2023-02-13	New Orleans Pelicans	Team 2	Oklahoma City Thunder	New Orleans Pelicans	103	100	f
Wednesday	2023-03-01	New Orleans Pelicans	Team 2	Portland Trail Blazers	New Orleans Pelicans	121	110	f
Wednesday	2023-03-08	New Orleans Pelicans	Team 1	Dallas Mavericks	New Orleans Pelicans	113	106	f
Sunday	2023-03-12	New Orleans Pelicans	Team 1	Portland Trail Blazers	New Orleans Pelicans	127	110	f
Sunday	2023-03-19	New Orleans Pelicans	Team 2	Houston Rockets	New Orleans Pelicans	117	107	f
Tuesday	2023-03-21	New Orleans Pelicans	Team 1	San Antonio Spurs	New Orleans Pelicans	119	84	f
Thursday	2023-03-23	New Orleans Pelicans	Team 1	Charlotte Hornets	New Orleans Pelicans	115	96	f
Saturday	2023-03-25	New Orleans Pelicans	Team 2	LA Clippers	New Orleans Pelicans	131	110	f
Monday	2023-03-27	New Orleans Pelicans	Team 2	Portland Trail Blazers	New Orleans Pelicans	124	90	f
Thursday	2023-03-30	New Orleans Pelicans	Team 2	Denver Nuggets	New Orleans Pelicans	107	88	f
Saturday	2023-04-01	New Orleans Pelicans	Team 1	LA Clippers	New Orleans Pelicans	122	114	f
Wednesday	2023-04-05	New Orleans Pelicans	Team 1	Memphis Grizzlies	New Orleans Pelicans	138	131	t
Friday	2023-04-07	New Orleans Pelicans	Team 1	New York Knicks	New Orleans Pelicans	113	105	f
Tuesday	2022-10-25	Oklahoma City Thunder	Team 1	LA Clippers	Oklahoma City Thunder	108	94	f
Thursday	2022-10-27	Oklahoma City Thunder	Team 1	LA Clippers	Oklahoma City Thunder	118	110	f
Saturday	2022-10-29	Oklahoma City Thunder	Team 2	Dallas Mavericks	Oklahoma City Thunder	117	111	t
Tuesday	2022-11-01	Oklahoma City Thunder	Team 1	Orlando Magic	Oklahoma City Thunder	116	108	f
Friday	2022-11-11	Oklahoma City Thunder	Team 1	Toronto Raptors	Oklahoma City Thunder	132	113	f
Sunday	2022-11-13	Oklahoma City Thunder	Team 2	New York Knicks	Oklahoma City Thunder	145	135	f
Wednesday	2022-11-16	Oklahoma City Thunder	Team 2	Washington Wizards	Oklahoma City Thunder	121	120	f
Friday	2022-11-25	Oklahoma City Thunder	Team 1	Chicago Bulls	Oklahoma City Thunder	123	119	t
Wednesday	2022-11-30	Oklahoma City Thunder	Team 1	San Antonio Spurs	Oklahoma City Thunder	119	111	f
Saturday	2022-12-03	Oklahoma City Thunder	Team 2	Minnesota Timberwolves	Oklahoma City Thunder	135	128	f
Monday	2022-12-05	Oklahoma City Thunder	Team 2	Atlanta Hawks	Oklahoma City Thunder	121	114	f
Saturday	2022-12-17	Oklahoma City Thunder	Team 1	Memphis Grizzlies	Oklahoma City Thunder	115	109	f
Monday	2022-12-19	Oklahoma City Thunder	Team 1	Portland Trail Blazers	Oklahoma City Thunder	123	121	f
Wednesday	2022-12-21	Oklahoma City Thunder	Team 1	Portland Trail Blazers	Oklahoma City Thunder	101	98	f
Tuesday	2022-12-27	Oklahoma City Thunder	Team 1	San Antonio Spurs	Oklahoma City Thunder	130	114	f
Tuesday	2023-01-03	Oklahoma City Thunder	Team 1	Boston Celtics	Oklahoma City Thunder	150	117	f
Friday	2023-01-06	Oklahoma City Thunder	Team 1	Washington Wizards	Oklahoma City Thunder	127	110	f
Sunday	2023-01-08	Oklahoma City Thunder	Team 1	Dallas Mavericks	Oklahoma City Thunder	120	109	f
Thursday	2023-01-12	Oklahoma City Thunder	Team 2	Philadelphia 76ers	Oklahoma City Thunder	133	114	f
Friday	2023-01-13	Oklahoma City Thunder	Team 2	Chicago Bulls	Oklahoma City Thunder	124	110	f
Sunday	2023-01-15	Oklahoma City Thunder	Team 2	Brooklyn Nets	Oklahoma City Thunder	112	102	f
Wednesday	2023-01-18	Oklahoma City Thunder	Team 1	Indiana Pacers	Oklahoma City Thunder	126	106	f
Sunday	2023-01-22	Oklahoma City Thunder	Team 2	Denver Nuggets	Oklahoma City Thunder	101	99	f
Friday	2023-01-27	Oklahoma City Thunder	Team 1	Cleveland Cavaliers	Oklahoma City Thunder	112	100	f
Saturday	2023-02-04	Oklahoma City Thunder	Team 1	Houston Rockets	Oklahoma City Thunder	153	121	f
Tuesday	2023-02-07	Oklahoma City Thunder	Team 2	Los Angeles Lakers	Oklahoma City Thunder	133	130	f
Friday	2023-02-10	Oklahoma City Thunder	Team 2	Portland Trail Blazers	Oklahoma City Thunder	138	129	f
Wednesday	2023-02-15	Oklahoma City Thunder	Team 1	Houston Rockets	Oklahoma City Thunder	133	96	f
Friday	2023-03-03	Oklahoma City Thunder	Team 1	Utah Jazz	Oklahoma City Thunder	130	103	f
Sunday	2023-03-05	Oklahoma City Thunder	Team 1	Utah Jazz	Oklahoma City Thunder	129	119	f
Tuesday	2023-03-07	Oklahoma City Thunder	Team 1	Golden State Warriors	Oklahoma City Thunder	137	128	f
Saturday	2023-03-11	Oklahoma City Thunder	Team 2	New Orleans Pelicans	Oklahoma City Thunder	110	96	f
Sunday	2023-03-12	Oklahoma City Thunder	Team 2	San Antonio Spurs	Oklahoma City Thunder	102	90	f
Tuesday	2023-03-14	Oklahoma City Thunder	Team 1	Brooklyn Nets	Oklahoma City Thunder	121	107	f
Sunday	2023-03-19	Oklahoma City Thunder	Team 1	Phoenix Suns	Oklahoma City Thunder	124	120	f
Tuesday	2023-03-21	Oklahoma City Thunder	Team 2	LA Clippers	Oklahoma City Thunder	101	100	f
Sunday	2023-03-26	Oklahoma City Thunder	Team 2	Portland Trail Blazers	Oklahoma City Thunder	118	112	f
Wednesday	2023-03-29	Oklahoma City Thunder	Team 1	Detroit Pistons	Oklahoma City Thunder	107	106	f
Thursday	2023-04-06	Oklahoma City Thunder	Team 2	Utah Jazz	Oklahoma City Thunder	114	98	f
Sunday	2023-04-09	Oklahoma City Thunder	Team 1	Memphis Grizzlies	Oklahoma City Thunder	115	100	f
Saturday	2022-10-22	Dallas Mavericks	Team 1	Memphis Grizzlies	Dallas Mavericks	137	96	f
Thursday	2022-10-27	Dallas Mavericks	Team 2	Brooklyn Nets	Dallas Mavericks	129	125	t
Sunday	2022-10-30	Dallas Mavericks	Team 1	Orlando Magic	Dallas Mavericks	114	105	f
Wednesday	2022-11-02	Dallas Mavericks	Team 1	Utah Jazz	Dallas Mavericks	103	100	f
Friday	2022-11-04	Dallas Mavericks	Team 1	Toronto Raptors	Dallas Mavericks	111	110	f
Monday	2022-11-07	Dallas Mavericks	Team 1	Brooklyn Nets	Dallas Mavericks	96	94	f
Saturday	2022-11-12	Dallas Mavericks	Team 1	Portland Trail Blazers	Dallas Mavericks	117	112	f
Tuesday	2022-11-15	Dallas Mavericks	Team 1	LA Clippers	Dallas Mavericks	103	101	f
Friday	2022-11-18	Dallas Mavericks	Team 1	Denver Nuggets	Dallas Mavericks	127	99	f
Tuesday	2022-11-29	Dallas Mavericks	Team 1	Golden State Warriors	Dallas Mavericks	116	113	f
Saturday	2022-12-03	Dallas Mavericks	Team 2	New York Knicks	Dallas Mavericks	121	100	f
Monday	2022-12-05	Dallas Mavericks	Team 1	Phoenix Suns	Dallas Mavericks	130	111	f
Tuesday	2022-12-06	Dallas Mavericks	Team 2	Denver Nuggets	Dallas Mavericks	116	115	f
Monday	2022-12-12	Dallas Mavericks	Team 1	Oklahoma City Thunder	Dallas Mavericks	121	114	f
Friday	2022-12-16	Dallas Mavericks	Team 1	Portland Trail Blazers	Dallas Mavericks	130	110	f
Wednesday	2022-12-21	Dallas Mavericks	Team 2	Minnesota Timberwolves	Dallas Mavericks	104	99	f
Friday	2022-12-23	Dallas Mavericks	Team 2	Houston Rockets	Dallas Mavericks	112	106	f
Sunday	2022-12-25	Dallas Mavericks	Team 1	Los Angeles Lakers	Dallas Mavericks	124	115	f
Tuesday	2022-12-27	Dallas Mavericks	Team 1	New York Knicks	Dallas Mavericks	126	121	t
Thursday	2022-12-29	Dallas Mavericks	Team 1	Houston Rockets	Dallas Mavericks	129	114	f
Saturday	2022-12-31	Dallas Mavericks	Team 2	San Antonio Spurs	Dallas Mavericks	126	125	f
Monday	2023-01-02	Dallas Mavericks	Team 2	Houston Rockets	Dallas Mavericks	111	106	f
Saturday	2023-01-07	Dallas Mavericks	Team 1	New Orleans Pelicans	Dallas Mavericks	127	117	f
Thursday	2023-01-12	Dallas Mavericks	Team 2	Los Angeles Lakers	Dallas Mavericks	119	115	t
Friday	2023-01-20	Dallas Mavericks	Team 1	Miami Heat	Dallas Mavericks	115	90	f
Thursday	2023-01-26	Dallas Mavericks	Team 2	Phoenix Suns	Dallas Mavericks	99	95	f
Monday	2023-01-30	Dallas Mavericks	Team 1	Detroit Pistons	Dallas Mavericks	111	105	f
Thursday	2023-02-02	Dallas Mavericks	Team 1	New Orleans Pelicans	Dallas Mavericks	111	106	f
Monday	2023-02-06	Dallas Mavericks	Team 2	Utah Jazz	Dallas Mavericks	124	111	f
Wednesday	2023-02-08	Dallas Mavericks	Team 2	LA Clippers	Dallas Mavericks	110	104	f
Friday	2023-02-10	Dallas Mavericks	Team 2	Sacramento Kings	Dallas Mavericks	122	114	f
Thursday	2023-02-23	Dallas Mavericks	Team 1	San Antonio Spurs	Dallas Mavericks	142	116	f
Thursday	2023-03-02	Dallas Mavericks	Team 1	Philadelphia 76ers	Dallas Mavericks	133	126	f
Tuesday	2023-03-07	Dallas Mavericks	Team 1	Utah Jazz	Dallas Mavericks	120	116	f
Wednesday	2023-03-15	Dallas Mavericks	Team 2	San Antonio Spurs	Dallas Mavericks	137	128	t
Friday	2023-03-17	Dallas Mavericks	Team 2	Los Angeles Lakers	Dallas Mavericks	111	110	f
Monday	2023-03-27	Dallas Mavericks	Team 2	Indiana Pacers	Dallas Mavericks	127	104	f
Wednesday	2023-04-05	Dallas Mavericks	Team 1	Sacramento Kings	Dallas Mavericks	123	119	f
Wednesday	2022-10-19	Utah Jazz	Team 1	Denver Nuggets	Utah Jazz	123	102	f
Friday	2022-10-21	Utah Jazz	Team 2	Minnesota Timberwolves	Utah Jazz	132	126	t
Sunday	2022-10-23	Utah Jazz	Team 2	New Orleans Pelicans	Utah Jazz	122	121	t
Wednesday	2022-10-26	Utah Jazz	Team 1	Houston Rockets	Utah Jazz	109	101	f
Saturday	2022-10-29	Utah Jazz	Team 1	Memphis Grizzlies	Utah Jazz	124	123	f
Monday	2022-10-31	Utah Jazz	Team 1	Memphis Grizzlies	Utah Jazz	121	105	f
Friday	2022-11-04	Utah Jazz	Team 2	Los Angeles Lakers	Utah Jazz	130	116	f
Sunday	2022-11-06	Utah Jazz	Team 2	LA Clippers	Utah Jazz	110	102	f
Monday	2022-11-07	Utah Jazz	Team 1	Los Angeles Lakers	Utah Jazz	139	116	f
Wednesday	2022-11-09	Utah Jazz	Team 2	Atlanta Hawks	Utah Jazz	125	119	f
Friday	2022-11-18	Utah Jazz	Team 1	Phoenix Suns	Utah Jazz	134	133	f
Saturday	2022-11-19	Utah Jazz	Team 2	Portland Trail Blazers	Utah Jazz	118	113	f
Wednesday	2022-11-30	Utah Jazz	Team 1	LA Clippers	Utah Jazz	125	112	f
Friday	2022-12-02	Utah Jazz	Team 1	Indiana Pacers	Utah Jazz	139	119	f
Wednesday	2022-12-07	Utah Jazz	Team 1	Golden State Warriors	Utah Jazz	124	123	f
Tuesday	2022-12-13	Utah Jazz	Team 1	New Orleans Pelicans	Utah Jazz	121	100	f
Thursday	2022-12-15	Utah Jazz	Team 1	New Orleans Pelicans	Utah Jazz	132	129	t
Tuesday	2022-12-20	Utah Jazz	Team 2	Detroit Pistons	Utah Jazz	126	111	f
Thursday	2022-12-22	Utah Jazz	Team 1	Washington Wizards	Utah Jazz	120	112	f
Thursday	2023-01-05	Utah Jazz	Team 2	Houston Rockets	Utah Jazz	131	114	f
Tuesday	2023-01-10	Utah Jazz	Team 1	Cleveland Cavaliers	Utah Jazz	116	114	f
Friday	2023-01-13	Utah Jazz	Team 1	Orlando Magic	Utah Jazz	112	108	f
Monday	2023-01-16	Utah Jazz	Team 2	Minnesota Timberwolves	Utah Jazz	126	125	f
Wednesday	2023-01-18	Utah Jazz	Team 1	LA Clippers	Utah Jazz	126	103	f
Monday	2023-01-23	Utah Jazz	Team 1	Charlotte Hornets	Utah Jazz	120	102	f
Saturday	2023-01-28	Utah Jazz	Team 1	Dallas Mavericks	Utah Jazz	108	100	f
Wednesday	2023-02-01	Utah Jazz	Team 1	Toronto Raptors	Utah Jazz	131	128	f
Friday	2023-02-10	Utah Jazz	Team 2	Toronto Raptors	Utah Jazz	122	116	f
Monday	2023-02-13	Utah Jazz	Team 2	Indiana Pacers	Utah Jazz	123	117	f
Thursday	2023-02-23	Utah Jazz	Team 1	Oklahoma City Thunder	Utah Jazz	120	119	t
Saturday	2023-02-25	Utah Jazz	Team 1	San Antonio Spurs	Utah Jazz	118	102	f
Thursday	2023-03-09	Utah Jazz	Team 2	Orlando Magic	Utah Jazz	131	124	f
Saturday	2023-03-11	Utah Jazz	Team 2	Charlotte Hornets	Utah Jazz	119	111	f
Saturday	2023-03-18	Utah Jazz	Team 1	Boston Celtics	Utah Jazz	118	117	f
Monday	2023-03-20	Utah Jazz	Team 1	Sacramento Kings	Utah Jazz	128	120	f
Wednesday	2023-03-29	Utah Jazz	Team 2	San Antonio Spurs	Utah Jazz	128	117	f
Saturday	2023-04-08	Utah Jazz	Team 1	Denver Nuggets	Utah Jazz	118	114	f
Wednesday	2022-10-19	Portland Trail Blazers	Team 2	Sacramento Kings	Portland Trail Blazers	115	108	f
Friday	2022-10-21	Portland Trail Blazers	Team 1	Phoenix Suns	Portland Trail Blazers	113	111	t
Sunday	2022-10-23	Portland Trail Blazers	Team 2	Los Angeles Lakers	Portland Trail Blazers	106	104	f
Monday	2022-10-24	Portland Trail Blazers	Team 1	Denver Nuggets	Portland Trail Blazers	135	110	f
Friday	2022-10-28	Portland Trail Blazers	Team 1	Houston Rockets	Portland Trail Blazers	125	111	f
Friday	2022-11-04	Portland Trail Blazers	Team 2	Phoenix Suns	Portland Trail Blazers	108	106	f
Monday	2022-11-07	Portland Trail Blazers	Team 2	Miami Heat	Portland Trail Blazers	110	107	f
Wednesday	2022-11-09	Portland Trail Blazers	Team 2	Charlotte Hornets	Portland Trail Blazers	105	95	f
Thursday	2022-11-10	Portland Trail Blazers	Team 2	New Orleans Pelicans	Portland Trail Blazers	106	95	f
Tuesday	2022-11-15	Portland Trail Blazers	Team 1	San Antonio Spurs	Portland Trail Blazers	117	110	f
Friday	2022-11-25	Portland Trail Blazers	Team 2	New York Knicks	Portland Trail Blazers	132	129	t
Saturday	2022-12-03	Portland Trail Blazers	Team 2	Utah Jazz	Portland Trail Blazers	116	111	f
Sunday	2022-12-04	Portland Trail Blazers	Team 1	Indiana Pacers	Portland Trail Blazers	116	100	f
Saturday	2022-12-10	Portland Trail Blazers	Team 1	Minnesota Timberwolves	Portland Trail Blazers	124	118	f
Monday	2022-12-12	Portland Trail Blazers	Team 1	Minnesota Timberwolves	Portland Trail Blazers	133	112	f
Wednesday	2022-12-14	Portland Trail Blazers	Team 2	San Antonio Spurs	Portland Trail Blazers	128	112	f
Saturday	2022-12-17	Portland Trail Blazers	Team 2	Houston Rockets	Portland Trail Blazers	107	95	f
Monday	2022-12-26	Portland Trail Blazers	Team 1	Charlotte Hornets	Portland Trail Blazers	124	113	f
Monday	2023-01-02	Portland Trail Blazers	Team 1	Detroit Pistons	Portland Trail Blazers	135	106	f
Saturday	2023-01-14	Portland Trail Blazers	Team 1	Dallas Mavericks	Portland Trail Blazers	136	119	f
Sunday	2023-01-15	Portland Trail Blazers	Team 1	Dallas Mavericks	Portland Trail Blazers	140	123	f
Monday	2023-01-23	Portland Trail Blazers	Team 1	San Antonio Spurs	Portland Trail Blazers	147	127	f
Wednesday	2023-01-25	Portland Trail Blazers	Team 1	Utah Jazz	Portland Trail Blazers	134	124	f
Monday	2023-01-30	Portland Trail Blazers	Team 1	Atlanta Hawks	Portland Trail Blazers	129	125	f
Wednesday	2023-02-01	Portland Trail Blazers	Team 2	Memphis Grizzlies	Portland Trail Blazers	122	112	f
Friday	2023-02-03	Portland Trail Blazers	Team 2	Washington Wizards	Portland Trail Blazers	124	116	f
Wednesday	2023-02-08	Portland Trail Blazers	Team 1	Golden State Warriors	Portland Trail Blazers	125	122	f
Monday	2023-02-13	Portland Trail Blazers	Team 1	Los Angeles Lakers	Portland Trail Blazers	127	115	f
Sunday	2023-02-26	Portland Trail Blazers	Team 1	Houston Rockets	Portland Trail Blazers	131	114	f
Sunday	2023-03-05	Portland Trail Blazers	Team 2	Orlando Magic	Portland Trail Blazers	122	119	f
Monday	2023-03-06	Portland Trail Blazers	Team 2	Detroit Pistons	Portland Trail Blazers	110	104	f
Wednesday	2023-03-22	Portland Trail Blazers	Team 2	Utah Jazz	Portland Trail Blazers	127	115	f
Sunday	2023-04-02	Portland Trail Blazers	Team 2	Minnesota Timberwolves	Portland Trail Blazers	107	105	f
Monday	2022-10-24	Houston Rockets	Team 1	Utah Jazz	Houston Rockets	114	108	f
Monday	2022-11-07	Houston Rockets	Team 2	Orlando Magic	Houston Rockets	134	127	f
Wednesday	2022-11-16	Houston Rockets	Team 2	Dallas Mavericks	Houston Rockets	101	92	f
Friday	2022-11-25	Houston Rockets	Team 1	Atlanta Hawks	Houston Rockets	128	122	f
Saturday	2022-11-26	Houston Rockets	Team 1	Oklahoma City Thunder	Houston Rockets	118	105	f
Friday	2022-12-02	Houston Rockets	Team 2	Phoenix Suns	Houston Rockets	122	121	f
Monday	2022-12-05	Houston Rockets	Team 1	Philadelphia 76ers	Houston Rockets	132	123	t
Sunday	2022-12-11	Houston Rockets	Team 1	Milwaukee Bucks	Houston Rockets	97	92	f
Tuesday	2022-12-13	Houston Rockets	Team 1	Phoenix Suns	Houston Rockets	111	97	f
Monday	2022-12-26	Houston Rockets	Team 2	Chicago Bulls	Houston Rockets	133	118	f
Monday	2023-01-23	Houston Rockets	Team 1	Minnesota Timberwolves	Houston Rockets	119	114	f
Saturday	2023-01-28	Houston Rockets	Team 2	Detroit Pistons	Houston Rockets	117	114	f
Wednesday	2023-02-01	Houston Rockets	Team 1	Oklahoma City Thunder	Houston Rockets	112	106	f
Saturday	2023-03-04	Houston Rockets	Team 2	San Antonio Spurs	Houston Rockets	122	110	f
Sunday	2023-03-05	Houston Rockets	Team 1	San Antonio Spurs	Houston Rockets	142	110	f
Monday	2023-03-13	Houston Rockets	Team 1	Boston Celtics	Houston Rockets	111	109	f
Wednesday	2023-03-15	Houston Rockets	Team 1	Los Angeles Lakers	Houston Rockets	114	110	f
Friday	2023-03-17	Houston Rockets	Team 1	New Orleans Pelicans	Houston Rockets	114	112	f
Friday	2023-03-31	Houston Rockets	Team 1	Detroit Pistons	Houston Rockets	121	115	f
Tuesday	2023-04-04	Houston Rockets	Team 1	Denver Nuggets	Houston Rockets	124	103	f
Friday	2023-04-07	Houston Rockets	Team 2	Charlotte Hornets	Houston Rockets	112	109	f
Sunday	2023-04-09	Houston Rockets	Team 2	Washington Wizards	Houston Rockets	114	109	f
Friday	2022-10-21	San Antonio Spurs	Team 2	Indiana Pacers	San Antonio Spurs	137	134	f
Saturday	2022-10-22	San Antonio Spurs	Team 2	Philadelphia 76ers	San Antonio Spurs	114	105	f
Monday	2022-10-24	San Antonio Spurs	Team 2	Minnesota Timberwolves	San Antonio Spurs	115	106	f
Friday	2022-10-28	San Antonio Spurs	Team 1	Chicago Bulls	San Antonio Spurs	129	124	f
Sunday	2022-10-30	San Antonio Spurs	Team 1	Minnesota Timberwolves	San Antonio Spurs	107	98	f
Friday	2022-11-11	San Antonio Spurs	Team 1	Milwaukee Bucks	San Antonio Spurs	111	93	f
Thursday	2022-12-08	San Antonio Spurs	Team 1	Houston Rockets	San Antonio Spurs	118	109	f
Saturday	2022-12-10	San Antonio Spurs	Team 2	Miami Heat	San Antonio Spurs	115	111	f
Monday	2022-12-12	San Antonio Spurs	Team 1	Cleveland Cavaliers	San Antonio Spurs	112	111	f
Monday	2022-12-19	San Antonio Spurs	Team 2	Houston Rockets	San Antonio Spurs	124	105	f
Monday	2022-12-26	San Antonio Spurs	Team 1	Utah Jazz	San Antonio Spurs	126	122	f
Thursday	2022-12-29	San Antonio Spurs	Team 1	New York Knicks	San Antonio Spurs	122	115	f
Friday	2023-01-06	San Antonio Spurs	Team 1	Detroit Pistons	San Antonio Spurs	121	109	f
Tuesday	2023-01-17	San Antonio Spurs	Team 1	Brooklyn Nets	San Antonio Spurs	106	98	f
Tuesday	2023-02-28	San Antonio Spurs	Team 2	Utah Jazz	San Antonio Spurs	102	94	f
Thursday	2023-03-02	San Antonio Spurs	Team 1	Indiana Pacers	San Antonio Spurs	110	99	f
Friday	2023-03-10	San Antonio Spurs	Team 1	Denver Nuggets	San Antonio Spurs	128	120	f
Tuesday	2023-03-14	San Antonio Spurs	Team 1	Orlando Magic	San Antonio Spurs	132	114	f
Sunday	2023-03-19	San Antonio Spurs	Team 1	Atlanta Hawks	San Antonio Spurs	126	118	f
Sunday	2023-04-02	San Antonio Spurs	Team 2	Sacramento Kings	San Antonio Spurs	142	134	t
Thursday	2023-04-06	San Antonio Spurs	Team 1	Portland Trail Blazers	San Antonio Spurs	129	127	f
Sunday	2023-04-09	San Antonio Spurs	Team 2	Dallas Mavericks	San Antonio Spurs	138	117	f
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (standing, city, name, conference, pct, ppg, oppppg, coach) FROM stdin;
1	MIL	Milwaukee Bucks	Eastern Conference	70.7	116.9	113.3	Adrian Griffin
2	BOS	Boston Celtics	Eastern Conference	69.5	117.9	111.4	Joe Mazzulla
3	PHI	Philadelphia 76ers	Eastern Conference	65.9	115.2	110.9	Nick Nurse
4	CLE	Cleveland Cavaliers	Eastern Conference	62.2	112.3	106.9	J.B. Bickerstaff
5	NY	New York Knicks	Eastern Conference	57.3	116.0	113.1	Tom Thibodeau
6	BKN	Brooklyn Nets	Eastern Conference	54.9	113.4	112.5	Jacque Vaughn
7	MIA	Miami Heat	Eastern Conference	53.7	109.5	109.8	Erik Spoelstra
8	ATL	Atlanta Hawks	Eastern Conference	50.0	118.4	118.1	Quin Snyder
9	TOR	Toronto Raptors	Eastern Conference	50.0	112.9	111.4	Darko Rajakovic
10	CHI	Chicago Bulls	Eastern Conference	48.8	113.1	111.8	\N
11	IND	Indiana Pacers	Eastern Conference	42.7	116.3	119.5	Rick Carlisle
12	WSH	Washington Wizards	Eastern Conference	42.7	113.2	114.4	Wes Unseld Jr.
13	ORL	Orlando Magic	Eastern Conference	41.5	111.4	114.0	Jamahl Mosley
14	CHA	Charlotte Hornets	Eastern Conference	32.9	111.0	117.2	Steve Clifford
15	DET	Detroit Pistons	Eastern Conference	20.7	110.3	118.5	Monty Williams
1	DEN	Denver Nuggets	Western Conference	64.6	115.8	112.5	Michael Malone
2	MEM	Memphis Grizzlies	Western Conference	62.2	116.9	113.0	Taylor Jenkins
3	SAC	Sacramento Kings	Western Conference	58.5	120.7	118.1	Mike Brown
4	PHX	Phoenix Suns	Western Conference	54.9	113.6	111.6	Frank Vogel
5	LAC	LA Clippers	Western Conference	53.7	113.6	113.1	Tyronn Lue
6	GS	Golden State Warriors	Western Conference	53.7	118.9	117.1	Steve Kerr
7	LAL	Los Angeles Lakers	Western Conference	52.4	117.2	116.6	Darvin Ham
8	MIN	Minnesota Timberwolves	Western Conference	51.2	115.8	115.8	Chris Finch
9	NO	New Orleans Pelicans	Western Conference	51.2	114.4	112.5	Willie Green
10	OKC	Oklahoma City Thunder	Western Conference	48.8	117.5	116.4	Mark Daigneault
11	DAL	Dallas Mavericks	Western Conference	46.3	114.2	114.1	Jason Kidd
12	UTAH	Utah Jazz	Western Conference	45.1	117.1	118.0	Will Hardy
13	POR	Portland Trail Blazers	Western Conference	40.2	113.4	117.4	Chauncey Billups
14	HOU	Houston Rockets	Western Conference	26.8	110.7	118.6	Ime Udoka
15	SA	San Antonio Spurs	Western Conference	26.8	113.0	123.1	Gregg Popovich
\.


--
-- Name: player_bio_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_bio_player_id_seq', 540, false);


--
-- Name: team_matches match2_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT match2_constraint UNIQUE (matchdate, team1);


--
-- Name: team_matches match3_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT match3_constraint UNIQUE (matchdate, team2);


--
-- Name: player_bio player_bio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_bio
    ADD CONSTRAINT player_bio_pkey PRIMARY KEY (playerid);


--
-- Name: player_stats player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_pkey PRIMARY KEY (playerid, team);


--
-- Name: teams standing_constraint_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT standing_constraint_2 UNIQUE (standing, conference);


--
-- Name: team_matches team_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_pkey PRIMARY KEY (matchdate, team1);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (name);


--
-- Name: team_matches prevent_team_per_day; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER prevent_team_per_day BEFORE INSERT ON public.team_matches FOR EACH ROW EXECUTE FUNCTION public.check_team_per_day();


--
-- Name: player_stats player_id_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_id_constraint FOREIGN KEY (playerid) REFERENCES public.player_bio(playerid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team_matches team1_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team1_constraint FOREIGN KEY (team1) REFERENCES public.teams(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team_matches team2_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team2_constraint FOREIGN KEY (team2) REFERENCES public.teams(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: player_stats team_name_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT team_name_constraint FOREIGN KEY (team) REFERENCES public.teams(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

