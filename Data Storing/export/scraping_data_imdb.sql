--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
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
-- Name: actor; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.actor (
    id character varying(3) NOT NULL,
    char_name character varying(100) NOT NULL
);


ALTER TABLE public.actor OWNER TO josuaadrielsinabutar;

--
-- Name: award; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.award (
    id character varying(3) NOT NULL,
    award_name character varying(100),
    category character varying(100),
    year_awarded character varying(4)
);


ALTER TABLE public.award OWNER TO josuaadrielsinabutar;

--
-- Name: director; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.director (
    id character varying(3) NOT NULL,
    year_experience character varying(3)
);


ALTER TABLE public.director OWNER TO josuaadrielsinabutar;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.genre (
    id character varying(3) NOT NULL,
    genre_name character varying(100)
);


ALTER TABLE public.genre OWNER TO josuaadrielsinabutar;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie (
    rank character varying(3) NOT NULL,
    title character varying(100) NOT NULL,
    year_created integer NOT NULL,
    duration character varying(100) NOT NULL,
    classification character varying(100) NOT NULL,
    overall_rating numeric(3,1)
);


ALTER TABLE public.movie OWNER TO josuaadrielsinabutar;

--
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie_actor (
    movie_id character varying(3) NOT NULL,
    actor_id character varying(3) NOT NULL,
    char_name character varying(100) NOT NULL
);


ALTER TABLE public.movie_actor OWNER TO josuaadrielsinabutar;

--
-- Name: movie_award; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie_award (
    movie_id character varying(3) NOT NULL,
    award_id character varying(3) NOT NULL
);


ALTER TABLE public.movie_award OWNER TO josuaadrielsinabutar;

--
-- Name: movie_director; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie_director (
    movie_id character varying(3) NOT NULL,
    director_id character varying(3) NOT NULL
);


ALTER TABLE public.movie_director OWNER TO josuaadrielsinabutar;

--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie_genre (
    movie_id character varying(3) NOT NULL,
    genre_id character varying(3) NOT NULL
);


ALTER TABLE public.movie_genre OWNER TO josuaadrielsinabutar;

--
-- Name: movie_ph; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.movie_ph (
    movie_id character varying(3) NOT NULL,
    ph_name character varying(100) NOT NULL
);


ALTER TABLE public.movie_ph OWNER TO josuaadrielsinabutar;

--
-- Name: person; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.person (
    id character varying(3) NOT NULL,
    name character varying(100),
    nationality character varying(100),
    gender character varying(100)
);


ALTER TABLE public.person OWNER TO josuaadrielsinabutar;

--
-- Name: production_house; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.production_house (
    name character varying(100) NOT NULL,
    street_number character varying(100),
    street_name character varying(100),
    city character varying(100),
    state character varying(100),
    zip character varying(100),
    email character varying(100)
);


ALTER TABLE public.production_house OWNER TO josuaadrielsinabutar;

--
-- Name: production_house_phone; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.production_house_phone (
    name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL
);


ALTER TABLE public.production_house_phone OWNER TO josuaadrielsinabutar;

--
-- Name: rating_input; Type: TABLE; Schema: public; Owner: josuaadrielsinabutar
--

CREATE TABLE public.rating_input (
    movie_id character varying(3) NOT NULL,
    rating_id character varying(50) NOT NULL,
    rating_value integer
);


ALTER TABLE public.rating_input OWNER TO josuaadrielsinabutar;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.actor (id, char_name) FROM stdin;
\.


--
-- Data for Name: award; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.award (id, award_name, category, year_awarded) FROM stdin;
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.director (id, year_experience) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.genre (id, genre_name) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie (rank, title, year_created, duration, classification, overall_rating) FROM stdin;
137	Ran	1985	2h 42m	R	8.2
1	The Shawshank Redemption	1994	2h 22m	18+	9.3
2	The Godfather	1972	2h 55m	18+	9.2
3	The Dark Knight	2008	2h 32m	R	9.0
4	The Godfather: Part II	1974	3h 22m	18+	9.0
5	12 Angry Men	1957	1h 36m	SU	9.0
6	Schindler's List	1993	3h 15m	A	9.0
7	The Lord of the Rings: The Return of the King	2003	3h 21m	A	9.0
8	Pulp Fiction	1994	2h 34m	17+	8.9
9	The Lord of the Rings: The Fellowship of the Ring	2001	2h 58m	R	8.8
10	The Good, the Bad and the Ugly	1966	2h 41m	D	8.8
11	Forrest Gump	1994	2h 22m	21	8.8
12	Spider-Man: Across the Spider-Verse	2023	2h 20m	SU	8.9
13	Fight Club	1999	2h 19m	21	8.8
14	The Lord of the Rings: The Two Towers	2002	2h 59m	A	8.8
15	Inception	2010	2h 28m	D	8.8
16	Star Wars: Episode V - The Empire Strikes Back	1980	2h 4m	PG	8.7
17	The Matrix	1999	2h 16m	18+	8.7
18	GoodFellas	1990	2h 25m	17+	8.7
19	One Flew Over the Cuckoo's Nest	1975	2h 13m	R	8.7
20	Se7en	1995	2h 7m	21	8.6
21	It's a Wonderful Life	1946	2h 10m	13+	8.6
22	Shichinin no samurai	1954	3h 27m	Not Rated	8.6
23	The Silence of the Lambs	1991	1h 58m	D	8.6
24	Saving Private Ryan	1998	2h 49m	18+	8.6
25	City of God	2002	2h 10m	R	8.6
26	Interstellar	2014	2h 49m	R	8.7
27	Life Is Beautiful	1997	1h 56m	21	8.6
28	The Green Mile	1999	3h 9m	18+	8.6
29	Star Wars	1977	2h 1m	13+	8.6
30	Terminator 2: Judgment Day	1991	2h 17m	13+	8.6
31	Back to the Future	1985	1h 56m	13+	8.5
32	Spirited Away	2001	2h 5m	13+	8.6
33	The Pianist	2002	2h 30m	R	8.5
34	Psycho	1960	1h 49m	R	8.5
35	Parasite	2019	2h 12m	17+	8.5
36	Leon	1994	1h 50m	R	8.5
37	The Lion King	1994	1h 28m	PG	8.5
38	Gladiator	2000	2h 35m	16+	8.5
39	American History X	1998	1h 59m	R	8.5
40	The Departed	2006	2h 31m	R	8.5
41	Whiplash	2014	1h 46m	16+	8.5
42	The Prestige	2006	2h 10m	17+	8.5
43	The Usual Suspects	1995	1h 46m	R	8.5
44	Casablanca	1942	1h 42m	PG	8.5
45	Hotaru no haka	1988	1h 29m	Not Rated	8.5
46	Seppuku	1962	2h 13m	Not Rated	8.6
47	Intouchables	2011	1h 52m	R	8.5
48	Modern Times	1936	1h 27m	G	8.5
49	Once Upon a Time in the West	1968	2h 45m	PG-13	8.5
50	Nuovo Cinema Paradiso	1988	2h 35m	PG	8.5
51	Rear Window	1954	1h 52m	PG	8.5
52	Alien	1979	1h 57m	17+	8.5
53	City Lights	1931	1h 27m	G	8.5
54	Apocalypse Now	1979	2h 27m	R	8.4
55	Memento	2000	1h 53m	R	8.4
56	Django Unchained	2012	2h 45m	21+	8.4
57	Raiders of the Lost Ark	1981	1h 55m	PG	8.4
58	WALLE	2008	1h 38m	SU	8.4
59	Das Leben der Anderen	2006	2h 17m	R	8.4
60	Sunset Blvd	1950	1h 50m	Passed	8.4
61	Paths of Glory	1957	1h 28m	Approved	8.4
62	Avengers: Infinity War	2018	2h 29m	13+	8.4
63	The Shining	1980	2h 26m	21	8.4
64	The Great Dictator	1940	2h 5m	G	8.4
65	Witness for the Prosecution	1957	1h 56m	Approved	8.4
66	Spider-Man: Into the Spider-Verse	2018	1h 57m	SU	8.4
67	Aliens	1986	2h 17m	17+	8.4
68	American Beauty	1999	2h 2m	21	8.3
69	The Dark Knight Rises	2012	2h 44m	R	8.4
70	Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb	1964	1h 35m	PG	8.4
71	Inglourious Basterds	2009	2h 33m	17+	8.3
72	Oldboy	2003	2h	17+	8.4
73	Coco	2017	1h 45m	SU	8.4
74	Amadeus	1984	2h 40m	PG	8.4
75	Toy Story	1995	1h 21m	SU	8.3
76	Braveheart	1995	2h 58m	21	8.3
77	Das Boot	1981	2h 29m	18+	8.4
78	Joker	2019	2h 2m	17+	8.4
79	Avengers: Endgame	2019	3h 1m	13+	8.4
80	Princess Mononoke	1997	2h 14m	13+	8.3
81	Good Will Hunting	1997	2h 6m	17+	8.3
82	Once Upon a Time in America	1984	3h 49m	R	8.3
83	Kimi no na wa	2016	1h 46m	13+	8.4
84	3 Idiots	2009	2h 50m	13+	8.4
85	Singin' in the Rain	1952	1h 43m	R	8.3
86	Tengoku to Jigoku	1963	2h 23m	Not Rated	8.4
87	Requiem for a Dream	2000	1h 42m	17+	8.3
88	Capernaum	2018	2h 6m	13+	8.4
89	Toy Story 3	2010	1h 43m	SU	8.3
90	Star Wars: Episode VI - Return of the Jedi	1983	2h 11m	PG	8.3
91	Come and See	1985	2h 22m	Not Rated	8.4
92	Eternal Sunshine of the Spotless Mind	2004	1h 48m	16+	8.3
93	2001: A Space Odyssey	1968	2h 29m	R	8.3
94	Jagten	2012	1h 55m	R	8.3
95	Reservoir Dogs	1992	1h 39m	D	8.3
144	Jurassic Park	1993	2h 7m	16+	8.2
96	Lawrence of Arabia	1962	3h 38m	Approved	8.3
97	Citizen Kane	1941	1h 59m	A	8.3
98	Ikiru	1952	2h 23m	Not Rated	8.3
99	M	1931	1h 57m	Passed	8.3
100	North by Northwest	1959	2h 16m	Approved	8.3
101	The Apartment	1960	2h 5m	Approved	8.3
102	Vertigo	1958	2h 8m	PG	8.3
103	Amelie	2001	2h 2m	R	8.3
104	Double Indemnity	1944	1h 47m	Passed	8.3
105	A Clockwork Orange	1971	2h 16m	X	8.3
106	Full Metal Jacket	1987	1h 56m	D	8.3
107	Scarface	1983	2h 50m	18+	8.3
108	Hamilton	2020	2h 40m	17+	8.3
109	Incendies	2010	2h 11m	R	8.3
110	Heat	1995	2h 50m	21	8.3
111	Up	2009	1h 36m	SU	8.3
112	To Kill a Mockingbird	1962	2h 9m	Approved	8.3
113	The Sting	1973	2h 9m	PG	8.3
114	A Separation	2011	2h 3m	PG-13	8.3
115	Metropolis	1927	2h 33m	Not Rated	8.3
116	Indiana Jones and the Last Crusade	1989	2h 7m	PG-13	8.2
117	Die Hard	1988	2h 12m	20+	8.2
118	L.A. Confidential	1997	2h 18m	21	8.2
119	Snatch	2000	1h 44m	17+	8.2
120	Ladri di biciclette	1948	1h 29m	Not Rated	8.3
121	Taxi Driver	1976	1h 54m	21	8.2
122	Like Stars on Earth	2007	2h 45m	PG	8.3
123	1917	2019	1h 59m	13+	8.2
124	Dangal	2016	2h 41m	13+	8.3
125	Downfall	2004	2h 36m	R	8.2
126	Top Gun: Maverick	2022	2h 10m	SU	8.3
127	Per qualche dollaro in piu	1965	2h 12m	R	8.2
128	Batman Begins	2005	2h 20m	D	8.2
129	The Kid	1921	1h 8m	Passed	8.3
130	Some Like It Hot	1959	2h 1m	Passed	8.2
131	The Father	2020	1h 37m	13+	8.2
132	The Wolf of Wall Street	2013	3h	21+	8.2
133	All About Eve	1950	2h 18m	Passed	8.2
134	Green Book	2018	2h 10m	13+	8.2
135	Judgment at Nuremberg	1961	2h 59m	Approved	8.3
136	The Truman Show	1998	1h 43m	21	8.2
138	Casino	1995	2h 58m	21+	8.2
139	There Will Be Blood	2007	2h 38m	18+	8.2
140	Pan's Labyrinth	2006	1h 58m	R	8.2
141	Shutter Island	2010	2h 18m	21	8.2
142	Unforgiven	1992	2h 10m	R	8.2
143	The Sixth Sense	1999	1h 47m	17+	8.2
145	A Beautiful Mind	2001	2h 15m	17+	8.2
146	The Treasure of the Sierra Madre	1948	2h 6m	Passed	8.2
147	Yojinbo	1961	1h 50m	Not Rated	8.2
148	Monty Python and the Holy Grail	1975	1h 31m	PG	8.2
149	No Country for Old Men	2007	2h 2m	21	8.2
150	Kill Bill: Vol	2003	1h 51m	21+	8.2
151	The Great Escape	1963	2h 52m	Approved	8.2
152	The Thing	1982	1h 49m	D	8.2
153	Rashomon	1950	1h 28m	Not Rated	8.2
154	Finding Nemo	2003	1h 40m	SU	8.2
155	Spider-Man: No Way Home	2021	2h 28m	SU	8.2
156	The Elephant Man	1980	2h 4m	PG	8.2
157	Chinatown	1974	2h 10m	R	8.2
158	Raging Bull	1980	2h 9m	R	8.1
159	V for Vendetta	2005	2h 12m	D	8.2
160	Gone with the Wind	1939	3h 58m	Passed	8.2
161	Dial M for Murder	1954	1h 45m	PG	8.2
162	Howl's Moving Castle	2004	1h 59m	7+	8.2
163	Lock, Stock and Two Smoking Barrels	1998	1h 47m	R	8.1
164	Inside Out	2015	1h 35m	SU	8.1
165	El Secreto De Sus Ojos	2009	2h 9m	R	8.2
166	Three Billboards Outside Ebbing, Missouri	2017	1h 55m	21	8.1
167	Prisoners	2013	2h 33m	17+	8.1
168	Trainspotting	1996	1h 33m	21	8.1
169	The Bridge on the River Kwai	1957	2h 41m	PG	8.1
170	Guardians of the Galaxy Vol	2023	2h 30m	13+	8.2
171	Fargo	1996	1h 38m	R	8.1
172	Warrior	2011	2h 20m	13+	8.1
173	Gran Torino	2008	1h 56m	R	8.1
174	Catch Me If You Can	2002	2h 21m	17+	8.1
175	Tonari no Totoro	1988	1h 26m	SU	8.1
176	Million Dollar Baby	2004	2h 12m	PG-13	8.1
177	Bacheha-Ye aseman	1997	1h 29m	21	8.2
178	Klaus	2019	1h 36m	7+	8.2
179	Blade Runner	1982	1h 57m	R	8.1
180	Harry Potter and the Deathly Hallows: Part 2	2011	2h 10m	13+	8.1
181	The Gold Rush	1925	1h 35m	Passed	8.1
182	12 Years a Slave	2013	2h 14m	R	8.1
183	Before Sunrise	1995	1h 41m	R	8.1
184	The Grand Budapest Hotel	2014	1h 39m	17+	8.1
185	Ben-Hur	1959	3h 32m	G	8.1
186	Gone Girl	2014	2h 29m	R	8.1
187	On the Waterfront	1954	1h 48m	Approved	8.1
188	Barry Lyndon	1975	3h 5m	PG	8.1
189	The General	1926	1h 18m	Passed	8.1
190	Smultronstallet	1957	1h 31m	17+	8.1
191	In the Name of the Father	1993	2h 13m	R	8.1
192	The Deer Hunter	1978	3h 3m	D	8.1
193	Hacksaw Ridge	2016	2h 19m	18+	8.1
194	The Third Man	1949	1h 44m	Approved	8.1
195	Le salaire de la peur	1953	2h 11m	Not Rated	8.2
196	Memories of Murder	2003	2h 11m	Not Rated	8.1
197	Sherlock Jr	1924	45m	Passed	8.2
198	Relatos salvajes	2014	2h 2m	R	8.1
199	Mr. Smith Goes to Washington	1939	2h 9m	Passed	8.1
200	Mad Max: Fury Road	2015	2h	16+	8.1
201	Dead Poets Society	1989	2h 8m	13+	8.1
202	Mary and Max	2009	1h 32m	Not Rated	8.1
203	Monsters, Inc	2001	1h 32m	SU	8.1
204	How to Train Your Dragon	2010	1h 38m	R13+	8.1
205	Det sjunde inseglet	1957	1h 36m	17+	8.1
206	Jaws	1975	2h 4m	PG	8.1
207	Room	2015	1h 58m	13+	8.1
208	The Big Lebowski	1998	1h 57m	R	8.1
209	Tokyo monogatari	1953	2h 16m	Not Rated	8.2
210	Ford v Ferrari	2019	2h 32m	13+	8.1
211	La passion de Jeanne d'Arc	1928	1h 50m	Passed	8.2
212	Hotel Rwanda	2004	2h 1m	D	8.1
213	Ratatouille	2007	1h 51m	R	8.1
214	Rocky	1976	2h	PG	8.1
215	Platoon	1986	2h	D	8.1
216	Logan	2017	2h 17m	17+	8.1
217	Spotlight	2015	2h 9m	13+	8.1
218	Jai Bhim	2021	2h 44m	16+	8.8
219	The Terminator	1984	1h 47m	D	8.1
220	Rush	2013	2h 3m	R	8.1
221	Before Sunset	2004	1h 20m	R	8.1
222	Stand by Me	1986	1h 29m	17+	8.1
223	Network	1976	2h 1m	R	8.1
224	Into the Wild	2007	2h 28m	21	8.1
225	The Wizard of Oz	1939	1h 42m	13+	8.1
226	The Best Years of Our Lives	1946	2h 50m	Approved	8.1
227	La haine	1995	1h 38m	Not Rated	8.1
228	The Exorcist	1973	2h 2m	D	8.1
229	The Incredibles	2004	1h 55m	R	8.0
230	Pirates of the Caribbean: The Curse of the Black Pearl	2003	2h 23m	17+	8.1
231	To Be or Not to Be	1942	1h 39m	Passed	8.2
232	Groundhog Day	1993	1h 41m	17+	8.0
233	Babam ve Oglum	2005	1h 52m	Not Rated	8.2
234	The Grapes of Wrath	1940	2h 9m	Passed	8.1
235	La battaglia di Algeri	1966	2h 1m	Not Rated	8.1
236	Hachi: A Dog's Tale	2009	1h 33m	G	8.1
237	Ah-ga-ssi	2016	2h 25m	Not Rated	8.1
238	Pather Panchali	1955	2h 5m	Not Rated	8.2
239	Amores perros	2000	2h 34m	R	8.1
240	Rebecca	1940	2h 10m	Approved	8.1
241	Cool Hand Luke	1967	2h 7m	GP	8.1
242	The Sound of Music	1965	2h 52m	21	8.1
243	It Happened One Night	1934	1h 45m	Passed	8.1
244	Les quatre cents coups	1959	1h 39m	Not Rated	8.1
245	Persona	1966	1h 25m	Not Rated	8.1
246	The Help	2011	2h 26m	13+	8.1
247	The Iron Giant	1999	1h 26m	PG	8.1
248	Life of Brian	1979	1h 34m	D	8.0
249	Aladdin	1992	1h 30m	G	8.0
250	Dances with Wolves	1990	3h 1m	PG-13	8.0
\.


--
-- Data for Name: movie_actor; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie_actor (movie_id, actor_id, char_name) FROM stdin;
\.


--
-- Data for Name: movie_award; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie_award (movie_id, award_id) FROM stdin;
\.


--
-- Data for Name: movie_director; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie_director (movie_id, director_id) FROM stdin;
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie_genre (movie_id, genre_id) FROM stdin;
\.


--
-- Data for Name: movie_ph; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.movie_ph (movie_id, ph_name) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.person (id, name, nationality, gender) FROM stdin;
\.


--
-- Data for Name: production_house; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.production_house (name, street_number, street_name, city, state, zip, email) FROM stdin;
\.


--
-- Data for Name: production_house_phone; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.production_house_phone (name, phone_number) FROM stdin;
\.


--
-- Data for Name: rating_input; Type: TABLE DATA; Schema: public; Owner: josuaadrielsinabutar
--

COPY public.rating_input (movie_id, rating_id, rating_value) FROM stdin;
\.


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id, char_name);


--
-- Name: award award_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.award
    ADD CONSTRAINT award_pkey PRIMARY KEY (id);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: movie_actor movie_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_pkey PRIMARY KEY (movie_id, actor_id, char_name);


--
-- Name: movie_award movie_award_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_pkey PRIMARY KEY (movie_id, award_id);


--
-- Name: movie_director movie_director_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_pkey PRIMARY KEY (movie_id, director_id);


--
-- Name: movie_genre movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (movie_id, genre_id);


--
-- Name: movie_ph movie_ph_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_ph
    ADD CONSTRAINT movie_ph_pkey PRIMARY KEY (movie_id, ph_name);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (rank);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: rating_input pk_rating_input; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.rating_input
    ADD CONSTRAINT pk_rating_input PRIMARY KEY (movie_id, rating_id);


--
-- Name: production_house_phone production_house_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.production_house_phone
    ADD CONSTRAINT production_house_phone_pkey PRIMARY KEY (name, phone_number);


--
-- Name: production_house production_house_pkey; Type: CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.production_house
    ADD CONSTRAINT production_house_pkey PRIMARY KEY (name);


--
-- Name: actor fk_act_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT fk_act_id FOREIGN KEY (id) REFERENCES public.person(id);


--
-- Name: movie_award fk_award_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT fk_award_id FOREIGN KEY (award_id) REFERENCES public.award(id);


--
-- Name: director fk_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT fk_dir_id FOREIGN KEY (id) REFERENCES public.person(id);


--
-- Name: movie_genre fk_gen_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fk_gen_id FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: movie_ph fk_id_movie; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_ph
    ADD CONSTRAINT fk_id_movie FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: movie_actor fk_mov_act_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT fk_mov_act_id FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: movie_director fk_mov_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT fk_mov_dir_id FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: movie_award fk_mov_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT fk_mov_id FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: movie_genre fk_mov_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fk_mov_id FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: movie_actor fk_person_act_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT fk_person_act_id FOREIGN KEY (actor_id) REFERENCES public.person(id);


--
-- Name: movie_director fk_person_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT fk_person_dir_id FOREIGN KEY (director_id) REFERENCES public.person(id);


--
-- Name: movie_ph fk_ph_name; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.movie_ph
    ADD CONSTRAINT fk_ph_name FOREIGN KEY (ph_name) REFERENCES public.production_house(name);


--
-- Name: rating_input fk_rating_input; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.rating_input
    ADD CONSTRAINT fk_rating_input FOREIGN KEY (movie_id) REFERENCES public.movie(rank);


--
-- Name: production_house_phone ph_phone; Type: FK CONSTRAINT; Schema: public; Owner: josuaadrielsinabutar
--

ALTER TABLE ONLY public.production_house_phone
    ADD CONSTRAINT ph_phone FOREIGN KEY (name) REFERENCES public.production_house(name);


--
-- PostgreSQL database dump complete
--

