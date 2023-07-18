--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: box_office_gross; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.box_office_gross (
    index bigint,
    title text,
    worldwide_gross bigint,
    domestic_gross bigint,
    domestic_p double precision,
    foreign_gross bigint,
    foreign_p double precision,
    distributor text,
    budget bigint,
    domestic_opening bigint,
    running_time text,
    genres text,
    mpaa text,
    year bigint
);


ALTER TABLE public.box_office_gross OWNER TO postgres;

--
-- Name: gross; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gross (
    title character varying(255) NOT NULL,
    distributor character varying(100) NOT NULL,
    year bigint NOT NULL,
    total bigint,
    domestic_opening bigint,
    domestic_gross bigint,
    domestic_percentage real,
    foreign_gross bigint,
    foreign_percentage real
);


ALTER TABLE public.gross OWNER TO postgres;

--
-- Name: movie_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_details (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    distributor character varying(255) NOT NULL,
    running_time character varying(25),
    mpaa character varying(15),
    budget integer
);


ALTER TABLE public.movie_details OWNER TO postgres;

--
-- Data for Name: box_office_gross; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.box_office_gross (index, title, worldwide_gross, domestic_gross, domestic_p, foreign_gross, foreign_p, distributor, budget, domestic_opening, running_time, genres, mpaa, year) FROM stdin;
0	Avatar	2923706026	785221649	26.9	2138484377	73.1	Twentieth Century Fox	237000000	77025481	2 hr 42 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2009
1	Avengers: Endgame	2799439100	858373000	30.7	1941066100	69.3	Walt Disney Studios Motion Pictures	356000000	357115007	3 hr 1 min	Action            Adventure            Drama            Sci-Fi	PG-13	2019
2	Avatar: The Way of Water	2320250281	684075767	29.5	1636174514	70.5	20th Century Studios	0	134100226	3 hr 12 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2022
3	Titanic	2264743305	674292608	29.8	1590450697	70.2	Paramount Pictures	200000000	28638131	3 hr 14 min	Drama            Romance	PG-13	1997
4	Star Wars: Episode VII - The Force Awakens	2071310218	936662225	45.2	1134647993	54.8	Walt Disney Studios Motion Pictures	245000000	247966675	2 hr 18 min	Action            Adventure            Sci-Fi	PG-13	2015
5	Avengers: Infinity War	2052415039	678815482	33.1	1373599557	66.9	Walt Disney Studios Motion Pictures	0	257698183	2 hr 29 min	Action            Adventure            Sci-Fi	PG-13	2018
6	Spider-Man: No Way Home	1921847111	814115070	42.4	1107732041	57.6	Sony Pictures Entertainment (SPE)	0	260138569	2 hr 28 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2021
7	Jurassic World	1671537444	653406625	39.1	1018130819	60.9	Universal Pictures	150000000	208806270	2 hr 4 min	Action            Adventure            Sci-Fi	PG-13	2015
8	The Lion King	1663075401	543638043	32.7	1119437358	67.3	Walt Disney Studios Motion Pictures	260000000	191770759	1 hr 58 min	Adventure            Animation            Drama            Family            Musical	PG	2019
9	The Avengers	1520538536	623357910	41	897180626	59	Walt Disney Studios Motion Pictures	220000000	207438708	2 hr 23 min	Action            Sci-Fi	PG-13	2012
10	Furious 7	1515341399	353007020	23.3	1162334379	76.7	Universal Pictures	190000000	147187040	2 hr 17 min	Action            Crime            Thriller	PG-13	2015
11	Top Gun: Maverick	1495696292	718732821	48	776963471	52	Paramount Pictures	0	126707459	2 hr 10 min	Action            Drama	PG-13	2022
12	Frozen II	1453683476	477373578	32.8	976309898	67.2	Walt Disney Studios Motion Pictures	150000000	130263358	1 hr 43 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Musical	PG	2019
13	Avengers: Age of Ultron	1405018048	459005868	32.7	946012180	67.3	Walt Disney Studios Motion Pictures	250000000	191271109	2 hr 21 min	Action            Adventure            Sci-Fi	PG-13	2015
14	Black Panther	1349926083	700426566	51.9	649499517	48.1	Walt Disney Studios Motion Pictures	0	202003951	2 hr 14 min	Action            Adventure            Sci-Fi	PG-13	2018
15	The Super Mario Bros. Movie	1345699802	573918425	42.6	771781377	57.4	Universal Pictures	0	146361865	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2023
16	Harry Potter and the Deathly Hallows: Part 2	1342359942	381447587	28.4	960912355	71.6	Warner Bros.	0	169189427	2 hr 10 min	Adventure            Family            Fantasy            Mystery	PG-13	2011
17	Star Wars: Episode VIII - The Last Jedi	1334407706	620181382	46.5	714226324	53.5	Walt Disney Studios Motion Pictures	317000000	220009584	2 hr 32 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2017
18	Jurassic World: Fallen Kingdom	1310466296	417719760	31.9	892746536	68.1	Universal Pictures	170000000	148024610	2 hr 8 min	Action            Adventure            Sci-Fi	PG-13	2018
19	Frozen	1284540518	400953009	31.2	883587509	68.8	Walt Disney Studios Motion Pictures	150000000	243390	1 hr 42 min	Adventure            Animation            Comedy            Family            Fantasy            Musical	PG	2013
20	Beauty and the Beast	1266115964	504481165	39.8	761634799	60.2	Walt Disney Studios Motion Pictures	160000000	174750616	2 hr 9 min	Adventure            Family            Fantasy            Musical            Romance	PG	2017
21	Incredibles 2	1243225667	608581744	49	634643923	51	Walt Disney Studios Motion Pictures	0	182687905	1 hr 58 min	Action            Adventure            Animation            Comedy            Family            Sci-Fi	PG	2018
22	The Fate of the Furious	1236005118	226008385	18.3	1009996733	81.7	Universal Pictures	250000000	98786705	2 hr 16 min	Action            Crime            Thriller	PG-13	2017
23	Iron Man 3	1215577205	409013994	33.6	806563211	66.4	Walt Disney Studios Motion Pictures	200000000	174144585	2 hr 10 min	Action            Adventure            Sci-Fi	PG-13	2013
24	Minions	1159444662	336045770	29	823398892	71	Universal Pictures	74000000	115718405	1 hr 31 min	Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2015
25	Captain America: Civil War	1155046416	408084349	35.3	746962067	64.7	Walt Disney Studios Motion Pictures	250000000	179139142	2 hr 27 min	Action            Sci-Fi	PG-13	2016
26	Aquaman	1148528393	335104314	29.2	813424079	70.8	Warner Bros.	0	67873522	2 hr 23 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2018
27	The Lord of the Rings: The Return of the King	1147633833	379427292	33.1	768206541	66.9	New Line Cinema	94000000	72629713	3 hr 21 min	Action            Adventure            Drama            Fantasy	PG-13	2003
28	Skyfall	1142471295	304360277	26.6	838111018	73.4	Sony Pictures Entertainment (SPE)	200000000	88364714	2 hr 23 min	Action            Adventure            Thriller	PG-13	2012
29	Spider-Man: Far from Home	1131927996	390532085	34.5	741395911	65.5	Sony Pictures Entertainment (SPE)	160000000	92579212	2 hr 9 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2019
30	Captain Marvel	1131416446	426829839	37.7	704586607	62.3	Walt Disney Studios Motion Pictures	160000000	153433423	2 hr 3 min	Action            Adventure            Sci-Fi	PG-13	2019
31	Transformers: Dark of the Moon	1123794079	352390543	31.4	771403536	68.6	DreamWorks	195000000	97852865	2 hr 34 min	Action            Adventure            Sci-Fi	PG-13	2011
32	Jurassic Park	1109802321	404214720	36.4	705587601	63.6	Universal Pictures	63000000	47026828	2 hr 7 min	Action            Adventure            Sci-Fi            Thriller	PG-13	1993
33	Transformers: Age of Extinction	1104054072	245439076	22.2	858614996	77.8	Paramount Pictures	210000000	100038390	2 hr 45 min	Action            Adventure            Sci-Fi	PG-13	2014
312	My People, My Homeland	422390820	0	0	422390820	100	Unknown	0	0	2 hr 33 min	Drama	Not Rated	2020
34	The Dark Knight Rises	1081169825	448149584	41.4	633020241	58.6	Warner Bros.	250000000	160887295	2 hr 44 min	Action            Drama            Thriller	PG-13	2012
35	Star Wars: Episode IX - The Rise of Skywalker	1077022372	515202542	47.8	561819830	52.2	Walt Disney Studios Motion Pictures	275000000	177383864	2 hr 21 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2019
36	Joker	1074458282	335477657	31.2	738980625	68.8	Warner Bros.	55000000	96202337	2 hr 2 min	Crime            Drama            Thriller	R	2019
37	Toy Story 4	1073841394	434038008	40.4	639803386	59.6	Walt Disney Studios Motion Pictures	200000000	120908065	1 hr 40 min	Adventure            Animation            Comedy            Family            Fantasy	G	2019
38	Toy Story 3	1067316101	415004880	38.9	652311221	61.1	Walt Disney Studios Motion Pictures	200000000	110307189	1 hr 43 min	Adventure            Animation            Comedy            Family            Fantasy	Not Rated	2010
39	Pirates of the Caribbean: Dead Man's Chest	1066179747	423315812	39.7	642863935	60.3	Walt Disney Studios Motion Pictures	225000000	135634554	2 hr 31 min	Action            Adventure            Fantasy	PG-13	2006
40	Rogue One: A Star Wars Story	1058682142	533539991	50.4	525142151	49.6	Walt Disney Studios Motion Pictures	200000000	155081681	2 hr 13 min	Action            Adventure            Sci-Fi	PG-13	2016
41	Aladdin	1054304000	355559216	33.7	698744784	66.3	Walt Disney Studios Motion Pictures	183000000	91500929	2 hr 8 min	Adventure            Comedy            Family            Fantasy            Musical            Romance	PG	2019
42	Pirates of the Caribbean: On Stranger Tides	1046721266	241071802	23	805649464	77	Walt Disney Studios Motion Pictures	250000000	90151958	2 hr 17 min	Action            Adventure            Fantasy	PG-13	2011
43	Despicable Me 3	1034800131	264624300	25.6	770175831	74.4	Universal Pictures	80000000	72434025	1 hr 29 min	Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2017
44	Finding Dory	1029266989	486295561	47.2	542971428	52.8	Walt Disney Studios Motion Pictures	0	135060273	1 hr 37 min	Adventure            Animation            Comedy            Family	PG	2016
45	Star Wars: Episode I - The Phantom Menace	1027082707	474544677	46.2	552538030	53.8	Twentieth Century Fox	115000000	64820970	2 hr 16 min	Action            Adventure            Fantasy            Sci-Fi	PG	1999
46	Zootopia	1025521689	341268248	33.3	684253441	66.7	Walt Disney Studios Motion Pictures	0	75063401	1 hr 48 min	Adventure            Animation            Comedy            Crime            Family            Mystery	PG	2016
47	Alice in Wonderland	1025468216	334191110	32.6	691277106	67.4	Walt Disney Studios Motion Pictures	200000000	116101023	1 hr 48 min	Adventure            Family            Fantasy            Mystery	PG	2010
48	Harry Potter and the Sorcerer's Stone	1023842938	318886962	31.2	704955976	68.8	Warner Bros.	125000000	90294621	2 hr 32 min	Adventure            Family            Fantasy	PG	2001
49	The Hobbit: An Unexpected Journey	1017030651	303030651	29.8	714000000	70.2	Warner Bros.	0	84617303	2 hr 49 min	Adventure            Fantasy	PG-13	2012
50	The Dark Knight	1006234167	534987076	53.2	471247091	46.8	Warner Bros.	185000000	158411483	2 hr 32 min	Action            Crime            Drama            Thriller	PG-13	2008
51	Jurassic World Dominion	1001978080	376851080	37.6	625127000	62.4	Universal Pictures	0	145075625	2 hr 27 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2022
52	Jumanji: Welcome to the Jungle	995339117	404540171	40.6	590798946	59.4	Sony Pictures Entertainment (SPE)	90000000	36169328	1 hr 59 min	Action            Adventure            Comedy            Fantasy	PG-13	2017
53	Harry Potter and the Deathly Hallows: Part 1	977070383	296374621	30.3	680695762	69.7	Warner Bros.	0	125017372	2 hr 26 min	Adventure            Family            Fantasy            Mystery	PG-13	2010
54	Despicable Me 2	970766005	368065385	37.9	602700620	62.1	Universal Pictures	76000000	83517315	1 hr 38 min	Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2013
55	The Lion King	968511805	422783777	43.6	545728028	56.4	Walt Disney Studios Motion Pictures	45000000	1586753	1 hr 28 min	Adventure            Animation            Drama            Family            Musical	G	1994
56	The Jungle Book	967724775	364001123	37.6	603723652	62.4	Walt Disney Studios Motion Pictures	175000000	103261464	1 hr 46 min	Adventure            Drama            Family            Fantasy	PG	2016
57	The Hobbit: The Battle of the Five Armies	962201338	255138261	26.5	707063077	73.5	Warner Bros.	0	54724334	2 hr 24 min	Adventure            Fantasy	PG-13	2014
58	Pirates of the Caribbean: At World's End	961691209	309420425	32.2	652270784	67.8	Walt Disney Studios Motion Pictures	300000000	114732820	2 hr 49 min	Action            Adventure            Fantasy	PG-13	2007
59	The Hobbit: The Desolation of Smaug	959027992	258387334	26.9	700640658	73.1	Warner Bros.	0	73645197	2 hr 41 min	Fantasy	PG-13	2013
60	Doctor Strange in the Multiverse of Madness	955775804	411331607	43	544444197	57	Walt Disney Studios Motion Pictures	0	187420998	2 hr 6 min	Action            Adventure            Fantasy            Horror            Sci-Fi	PG-13	2022
61	The Lord of the Rings: The Two Towers	947944270	342952511	36.2	604991759	63.8	New Line Cinema	94000000	62007528	2 hr 59 min	Action            Adventure            Drama            Fantasy	PG-13	2002
62	Harry Potter and the Order of the Phoenix	942278045	292382727	31	649895318	69	Warner Bros.	150000000	77108414	2 hr 18 min	Action            Adventure            Family            Fantasy            Mystery	PG-13	2007
63	Finding Nemo	941637960	380843261	40.4	560794699	59.6	Walt Disney Studios Motion Pictures	94000000	70251710	1 hr 40 min	Adventure            Animation            Comedy            Family	Not Rated	2003
64	Minions: The Rise of Gru	939628210	369695210	39.3	569933000	60.7	Universal Pictures	0	107010140	1 hr 27 min	Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2022
65	Harry Potter and the Half-Blood Prince	934519387	302334374	32.4	632185013	67.6	Warner Bros.	250000000	77835727	2 hr 33 min	Action            Adventure            Family            Fantasy            Mystery	PG	2009
66	Shrek 2	928760770	441226247	47.5	487534523	52.5	DreamWorks Distribution	150000000	108037878	1 hr 33 min	Adventure            Animation            Comedy            Family            Fantasy            Romance	PG	2004
67	Harry Potter and the Chamber of Secrets	925668380	262641637	28.4	663026743	71.6	Warner Bros.	100000000	88357488	2 hr 41 min	Adventure            Family            Fantasy            Mystery	PG	2002
68	Bohemian Rhapsody	910809311	216668042	23.8	694141269	76.2	Twentieth Century Fox	52000000	51061119	2 hr 14 min	Biography            Drama            Music	PG-13	2018
69	The Battle at Lake Changjin	902548476	342411	0.1	902206065	100	CMC Pictures	0	105768	2 hr 56 min	Action            Drama            History            War	Not Rated	2021
70	The Lord of the Rings: The Fellowship of the Ring	898204420	316115420	35.2	582089000	64.8	New Line Cinema	93000000	47211490	2 hr 58 min	Action            Adventure            Drama            Fantasy	PG-13	2001
71	Harry Potter and the Goblet of Fire	896815106	290469928	32.4	606345178	67.6	Warner Bros.	150000000	102685961	2 hr 37 min	Adventure            Family            Fantasy            Mystery	PG-13	2005
72	Spider-Man 3	894983373	336530303	37.6	558453070	62.4	Sony Pictures Entertainment (SPE)	258000000	151116516	2 hr 19 min	Action            Adventure            Sci-Fi	PG-13	2007
73	The Secret Life of Pets	894328469	368384330	41.2	525944139	58.8	Universal Pictures	75000000	104352905	1 hr 27 min	Adventure            Animation            Comedy            Family	PG	2016
74	Ice Age: Dawn of the Dinosaurs	886686817	196573705	22.2	690113112	77.8	Twentieth Century Fox	90000000	41690382	1 hr 34 min	Adventure            Animation            Comedy            Family	PG	2009
75	Spectre	880705312	200074609	22.7	680630703	77.3	Sony Pictures Entertainment (SPE)	245000000	70403148	2 hr 28 min	Action            Adventure            Thriller	PG-13	2015
76	Spider-Man: Homecoming	880166924	334201140	38	545965784	62	Sony Pictures Entertainment (SPE)	175000000	117027503	2 hr 13 min	Action            Adventure            Sci-Fi	PG-13	2017
77	Ice Age: Continental Drift	877244782	161321843	18.4	715922939	81.6	Twentieth Century Fox	95000000	46629259	1 hr 28 min	Adventure            Animation            Comedy            Family	PG	2012
78	Batman v Superman: Dawn of Justice	873637528	330360194	37.8	543277334	62.2	Warner Bros.	250000000	166007347	2 hr 31 min	Action            Adventure            Sci-Fi	PG-13	2016
79	Inception	870792649	292587330	33.6	578205319	66.4	Warner Bros.	160000000	62785337	2 hr 28 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2010
80	Wolf Warrior 2	870325439	2721100	0.3	867604339	99.7	The H Collective	30100000	219022	2 hr 3 min	Action            Adventure            Drama            Thriller            War	Not Rated	2017
81	Star Wars: Episode III - Revenge of the Sith	868390560	380270577	43.8	488119983	56.2	Twentieth Century Fox	113000000	108435841	2 hr 20 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2005
82	The Hunger Games: Catching Fire	865011746	424668047	49.1	440343699	50.9	Lionsgate	130000000	158074286	2 hr 26 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2013
83	Guardians of the Galaxy Vol. 2	863756051	389813101	45.1	473942950	54.9	Walt Disney Studios Motion Pictures	200000000	146510104	2 hr 16 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2017
84	Black Panther: Wakanda Forever	859208836	453829060	52.8	405379776	47.2	Walt Disney Studios Motion Pictures	0	181339761	2 hr 41 min	Action            Adventure            Drama            Sci-Fi	PG-13	2022
85	Inside Out	858848019	356921711	41.6	501926308	58.4	Walt Disney Studios Motion Pictures	175000000	90440272	1 hr 35 min	Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2015
86	Venom	856085151	213515506	24.9	642569645	75.1	Sony Pictures Entertainment (SPE)	100000000	80255756	1 hr 52 min	Action            Adventure            Sci-Fi	PG-13	2018
87	Thor: Ragnarok	855301806	315058289	36.8	540243517	63.2	Walt Disney Studios Motion Pictures	180000000	122744989	2 hr 10 min	Action            Adventure            Comedy            Fantasy            Sci-Fi	PG-13	2017
88	The Twilight Saga: Breaking Dawn - Part 2	848593948	292324737	34.4	556269211	65.6	Lionsgate	120000000	141067634	1 hr 55 min	Adventure            Drama            Fantasy            Romance	PG-13	2012
89	Guardians of the Galaxy Vol. 3	843280349	358488599	42.5	484791750	57.5	Walt Disney Studios Motion Pictures	0	118414021	2 hr 30 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2023
90	Transformers: Revenge of the Fallen	836303693	402111870	48.1	434191823	51.9	DreamWorks	200000000	108966307	2 hr 29 min	Action            Adventure            Sci-Fi	PG-13	2009
91	Spider-Man	825025036	407022860	49.3	418002176	50.7	Sony Pictures Entertainment (SPE)	139000000	114844116	2 hr 1 min	Action            Adventure            Sci-Fi	PG-13	2002
92	Wonder Woman	822854286	412845172	50.2	410009114	49.8	Warner Bros.	149000000	103251471	2 hr 21 min	Action            Adventure            Fantasy            Sci-Fi            War	PG-13	2017
93	Hi, Mom	822009764	0	0	822009764	100	Unknown	0	0	2 hr 8 min	Comedy            Romance	Not Rated	2021
94	Independence Day	817400891	306169268	37.5	511231623	62.5	Twentieth Century Fox	75000000	50228264	2 hr 25 min	Action            Adventure            Sci-Fi	PG-13	1996
95	Coco	814337054	210460015	25.8	603877039	74.2	Walt Disney Studios Motion Pictures	0	50802605	1 hr 45 min	Adventure            Animation            Drama            Family            Fantasy            Music            Mystery	PG	2017
96	Fantastic Beasts and Where to Find Them	814044001	234037575	28.8	580006426	71.2	Warner Bros.	180000000	74403387	2 hr 12 min	Adventure            Family            Fantasy	PG-13	2016
97	Shrek the Third	813367380	322719944	39.7	490647436	60.3	DreamWorks	160000000	121629270	1 hr 33 min	Adventure            Animation            Comedy            Family            Fantasy            Romance	PG	2007
98	Jumanji: The Next Level	801693929	320314960	40	481378969	60	Sony Pictures Entertainment (SPE)	125000000	59251543	2 hr 3 min	Action            Adventure            Comedy            Fantasy	PG-13	2019
99	Harry Potter and the Prisoner of Azkaban	797660766	250105651	31.4	547555115	68.6	Warner Bros.	130000000	93687367	2 hr 22 min	Adventure            Family            Fantasy            Mystery	PG	2004
100	Pirates of the Caribbean: Dead Men Tell No Tales	795922298	172558876	21.7	623363422	78.3	Walt Disney Studios Motion Pictures	230000000	62983253	2 hr 9 min	Action            Adventure            Fantasy	PG-13	2017
101	E.T. the Extra-Terrestrial	792910554	437141279	55.1	355769275	44.9	Universal Pictures	10500000	11835389	1 hr 55 min	Adventure            Family            Sci-Fi	PG	1982
102	Mission: Impossible - Fallout	791657398	220159104	27.8	571498294	72.2	Paramount Pictures	178000000	61236534	2 hr 27 min	Action            Adventure            Thriller	PG-13	2018
103	2012	791217826	166112167	21	625105659	79	Sony Pictures Entertainment (SPE)	200000000	65237614	2 hr 38 min	Action            Adventure            Sci-Fi	PG-13	2009
104	Indiana Jones and the Kingdom of the Crystal Skull	790653942	317101119	40.1	473552823	59.9	Paramount Pictures	185000000	100137835	2 hr 2 min	Action            Adventure	PG-13	2008
105	Spider-Man 2	788976453	373585825	47.4	415390628	52.6	Sony Pictures Entertainment (SPE)	200000000	88156227	2 hr 7 min	Action            Adventure            Sci-Fi	PG-13	2004
106	Fast & Furious 6	788680968	238679850	30.3	550001118	69.7	Universal Pictures	160000000	97375245	2 hr 10 min	Action            Adventure            Crime            Thriller	PG-13	2013
107	Deadpool 2	785896609	324591735	41.3	461304874	58.7	Twentieth Century Fox	110000000	125507153	1 hr 59 min	Action            Adventure            Comedy            Sci-Fi	R	2018
108	Deadpool	782836791	363070709	46.4	419766082	53.6	Twentieth Century Fox	58000000	132434639	1 hr 48 min	Action            Comedy	R	2016
109	Star Wars: Episode IV - A New Hope	775398007	460998507	59.4	314399500	40.6	Twentieth Century Fox	11000000	1554475	2 hr 1 min	Action            Adventure            Fantasy            Sci-Fi	PG	1977
110	No Time to Die	774153007	160891007	20.8	613262000	79.2	Metro-Goldwyn-Mayer (MGM)	0	55225007	2 hr 43 min	Action            Adventure            Thriller	PG-13	2021
111	Interstellar	773430538	188020017	24.3	585410521	75.7	Paramount Pictures	165000000	47510360	2 hr 49 min	Adventure            Drama            Sci-Fi	PG-13	2014
112	Guardians of the Galaxy	773350147	333718600	43.2	439631547	56.8	Walt Disney Studios Motion Pictures	170000000	94320883	2 hr 1 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2014
113	The Batman	770962583	369345583	47.9	401617000	52.1	Warner Bros.	0	134008624	2 hr 56 min	Action            Crime            Drama            Thriller	PG-13	2022
114	Thor: Love and Thunder	760928081	343256830	45.1	417671251	54.9	Walt Disney Studios Motion Pictures	0	144165107	1 hr 58 min	Action            Adventure            Comedy            Fantasy            Romance            Sci-Fi	PG-13	2022
115	Fast & Furious Presents: Hobbs & Shaw	760732926	173956935	22.9	586775991	77.1	Universal Pictures	200000000	60038950	2 hr 17 min	Action            Adventure            Thriller	Not Rated	2019
116	The Da Vinci Code	760006945	217536138	28.6	542470807	71.4	Sony Pictures Entertainment (SPE)	125000000	77073388	2 hr 29 min	Mystery            Thriller	PG-13	2006
117	Maleficent	759853685	241410378	31.8	518443307	68.2	Walt Disney Studios Motion Pictures	180000000	69431298	1 hr 37 min	Adventure            Family            Fantasy            Romance	PG	2014
118	The Amazing Spider-Man	757930663	262030663	34.6	495900000	65.4	Sony Pictures Entertainment (SPE)	230000000	62004688	2 hr 16 min	Action            Adventure            Sci-Fi	PG-13	2012
119	The Hunger Games: Mockingjay - Part 1	755356711	337135885	44.6	418220826	55.4	Lionsgate	125000000	121897634	2 hr 3 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2014
120	Shrek Forever After	752600867	238736787	31.7	513864080	68.3	DreamWorks	165000000	70838207	1 hr 35 min	Adventure            Animation            Comedy            Family            Fantasy            Romance	PG	2010
121	Gravity	748049949	274092705	36.6	473957244	63.4	Warner Bros.	100000000	55785112	1 hr 31 min	Drama            Sci-Fi            Thriller	PG-13	2013
122	Madagascar 3: Europe's Most Wanted	746921274	216391482	29	530529792	71	DreamWorks	145000000	60316738	1 hr 35 min	Adventure            Animation            Comedy            Family	PG	2012
123	Suicide Squad	746846894	325100054	43.5	421746840	56.5	Warner Bros.	175000000	133682248	2 hr 3 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2016
124	X-Men: Days of Future Past	746045700	233921534	31.4	512124166	68.6	Twentieth Century Fox	200000000	90823660	2 hr 12 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2014
125	The Chronicles of Narnia: The Lion, the Witch and the Wardrobe	745013115	291710957	39.2	453302158	60.8	Walt Disney Studios Motion Pictures	180000000	65556312	2 hr 23 min	Adventure            Family            Fantasy	PG	2005
126	Monsters University	743559645	268492764	36.1	475066881	63.9	Walt Disney Studios Motion Pictures	0	82429469	1 hr 44 min	Adventure            Animation            Comedy            Family            Fantasy	G	2013
127	The Matrix Reloaded	741847937	281576461	38	460271476	62	Warner Bros.	150000000	91774413	2 hr 18 min	Action            Sci-Fi	R	2003
128	Up	735099102	293004164	39.9	442094938	60.1	Walt Disney Studios Motion Pictures	175000000	68108790	1 hr 36 min	Adventure            Animation            Comedy            Drama            Family	PG	2009
129	Ne Zha	726264074	3695533	0.5	722568541	99.5	Well Go USA Entertainment	0	1015755	1 hr 50 min	Action            Adventure            Animation            Family            Fantasy            Thriller	Not Rated	2019
130	F9: The Fast Saga	726229501	173005945	23.8	553223556	76.2	Universal Pictures	0	70043165	2 hr 23 min	Action            Crime            Thriller	PG-13	2021
131	Captain America: The Winter Soldier	714421503	259766572	36.4	454654931	63.6	Walt Disney Studios Motion Pictures	170000000	95023721	2 hr 16 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2014
132	The Twilight Saga: Breaking Dawn - Part 1	712205856	281287133	39.5	430918723	60.5	Summit Entertainment	110000000	138122261	1 hr 57 min	Adventure            Drama            Fantasy            Romance            Thriller	PG-13	2011
133	The Twilight Saga: New Moon	711025481	297816253	41.9	413209228	58.1	Summit Entertainment	50000000	142839137	2 hr 10 min	Adventure            Drama            Fantasy            Romance	PG-13	2009
134	Dawn of the Planet of the Apes	710644566	208545589	29.4	502098977	70.6	Twentieth Century Fox	170000000	72611427	2 hr 10 min	Action            Adventure            Drama            Sci-Fi            Thriller	PG-13	2014
135	Transformers	709709780	319246193	45	390463587	55	DreamWorks	150000000	70502384	2 hr 24 min	Action            Adventure            Sci-Fi	PG-13	2007
136	The Amazing Spider-Man 2	708982323	202853933	28.6	506128390	71.4	Sony Pictures Entertainment (SPE)	0	91608337	2 hr 22 min	Action            Adventure            Sci-Fi	PG-13	2014
137	Fast X	704709660	145960660	20.7	558749000	79.3	Universal Pictures	0	67017410	2 hr 21 min	Action            Adventure            Crime            Mystery            Thriller	PG-13	2023
138	It	701842551	328874981	46.9	372967570	53.1	Warner Bros.	35000000	123403419	2 hr 15 min	Horror	R	2017
139	The Wandering Earth	699992512	5971413	0.8	694021099	99.2		0	1685287	2 hr 5 min	Action            Adventure            Sci-Fi            Thriller	Not Rated	2019
140	The Twilight Saga: Eclipse	698509825	300531751	43	397978074	57	Summit Entertainment	68000000	64832191	2 hr 4 min	Action            Adventure            Drama            Fantasy            Romance            Thriller	PG-13	2010
141	Mission: Impossible - Ghost Protocol	694713380	209397903	30.1	485315477	69.9	Paramount Pictures	145000000	12785204	2 hr 12 min	Action            Adventure            Thriller	PG-13	2011
142	Mamma Mia!	694478392	144169664	20.8	550308728	79.2	Universal Pictures	52000000	27751240	1 hr 48 min	Comedy            Musical            Romance	PG-13	2008
143	The Hunger Games	694394724	408010692	58.8	286384032	41.2	Lionsgate	78000000	152535747	2 hr 22 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2012
144	Detective Chinatown 3	686257563	0	0	686257563	100	Warner Bros.	0	0	2 hr 16 min	Action            Adventure            Comedy            Mystery	R	2021
145	Mission: Impossible - Rogue Nation	682716636	195042377	28.6	487674259	71.4	Paramount Pictures	150000000	55520089	2 hr 11 min	Action            Adventure            Thriller	PG-13	2015
146	Moana	682685900	248757044	36.4	433928856	63.6	Walt Disney Studios Motion Pictures	0	56631401	1 hr 47 min	Adventure            Animation            Comedy            Family            Fantasy            Musical	PG	2016
147	Forrest Gump	678226465	330455270	48.7	347771195	51.3	Paramount Pictures	55000000	24450602	2 hr 22 min	Drama            Romance	PG-13	1994
148	Doctor Strange	677796076	232641920	34.3	445154156	65.7	Walt Disney Studios Motion Pictures	165000000	85058311	1 hr 55 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2016
149	The Sixth Sense	672806432	293506292	43.6	379300140	56.4	Walt Disney Studios Motion Pictures	40000000	26681262	1 hr 47 min	Drama            Mystery            Thriller	PG-13	1999
150	Man of Steel	668045518	291045518	43.6	377000000	56.4	Warner Bros.	225000000	116619362	2 hr 23 min	Action            Adventure            Sci-Fi	PG-13	2013
151	Ice Age: The Meltdown	667094506	195330621	29.3	471763885	70.7	Twentieth Century Fox	80000000	68033544	1 hr 31 min	Adventure            Animation            Comedy            Family	PG	2006
152	Kung Fu Panda 2	665692281	165249063	24.8	500443218	75.2	DreamWorks	150000000	47656302	1 hr 30 min	Action            Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2011
153	Spider-Man: Across the Spider-Verse	663500269	368800269	55.6	294700000	44.4	Columbia Pictures	0	120663589	2 hr 20 min	Action            Adventure            Animation            Family            Fantasy            Sci-Fi	PG	2023
154	Justice League	657926987	229024295	34.8	428902692	65.2	Warner Bros.	0	93842239	2 hr	Action            Adventure            Fantasy            Sci-Fi	PG-13	2017
155	Big Hero 6	657869686	222527828	33.8	435341858	66.2	Walt Disney Studios Motion Pictures	165000000	56215889	1 hr 42 min	Action            Adventure            Animation            Comedy            Crime            Family            Mystery            Sci-Fi	PG	2014
156	Fantastic Beasts: The Crimes of Grindelwald	654855901	159555901	24.4	495300000	75.6	Warner Bros.	200000000	62163104	2 hr 14 min	Adventure            Family            Fantasy	PG-13	2018
157	Pirates of the Caribbean: The Curse of the Black Pearl	654264015	305413918	46.7	348850097	53.3	Walt Disney Studios Motion Pictures	140000000	46630690	2 hr 23 min	Action            Adventure            Fantasy	PG-13	2003
158	Men in Black 3	654213485	179020854	27.4	475192631	72.6	Sony Pictures Entertainment (SPE)	225000000	54592779	1 hr 46 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2012
159	Star Wars: Episode II - Attack of the Clones	653779970	310676740	47.5	343103230	52.5	Twentieth Century Fox	115000000	80027814	2 hr 22 min	Action            Adventure            Fantasy            Sci-Fi	PG	2002
160	The Hunger Games: Mockingjay - Part 2	653428261	281723902	43.1	371704359	56.9	Lionsgate	160000000	102665981	2 hr 17 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2015
161	Thor: The Dark World	644783140	206362140	32	438421000	68	Walt Disney Studios Motion Pictures	170000000	85737841	1 hr 52 min	Action            Adventure            Fantasy	PG-13	2013
162	Sing	634338384	270578425	42.7	363759959	57.3	Universal Pictures	75000000	35258145	1 hr 48 min	Animation            Comedy            Family            Musical	PG	2016
163	Kung Fu Panda	632083197	215771591	34.1	416311606	65.9	DreamWorks	130000000	60239130	1 hr 32 min	Action            Adventure            Animation            Comedy            Family            Fantasy	PG	2008
164	The Incredibles	631607053	261441092	41.4	370165961	58.6	Walt Disney Studios Motion Pictures	92000000	70467623	1 hr 55 min	Action            Adventure            Animation            Family	PG	2004
165	The Martian	630620818	228433663	36.2	402187155	63.8	Twentieth Century Fox	108000000	54308575	2 hr 24 min	Adventure            Drama            Sci-Fi	PG-13	2015
166	Hancock	629443428	227946274	36.2	401497154	63.8	Sony Pictures Entertainment (SPE)	150000000	62603879	1 hr 32 min	Action            Comedy            Drama            Fantasy	PG-13	2008
167	Water Gate Bridge	626571697	117294	0.1	626454403	100	CMC Pictures	0	42707	2 hr 33 min	Action            Drama            History	Not Rated	2022
168	Fast Five	626137675	209837675	33.5	416300000	66.5	Universal Pictures	125000000	86198765	2 hr 10 min	Action            Crime            Thriller	PG-13	2011
169	Iron Man 2	623933331	312433331	50.1	311500000	49.9	Paramount Pictures	200000000	128122480	2 hr 4 min	Action            Sci-Fi	PG-13	2010
170	Ratatouille	623726085	206445654	33.1	417280431	66.9	Walt Disney Studios Motion Pictures	150000000	47027395	1 hr 51 min	Adventure            Animation            Comedy            Family            Fantasy	G	2007
171	Ant-Man and the Wasp	622674139	216648740	34.8	406025399	65.2	Walt Disney Studios Motion Pictures	0	75812205	1 hr 58 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2018
172	How to Train Your Dragon 2	621537519	177002924	28.5	444534595	71.5	Twentieth Century Fox	145000000	49451322	1 hr 42 min	Action            Adventure            Animation            Comedy            Family            Fantasy	PG	2014
173	Logan	619179950	226277068	36.5	392902882	63.5	Twentieth Century Fox	97000000	88411916	2 hr 17 min	Action            Drama            Sci-Fi            Thriller	R	2017
174	The Lost World: Jurassic Park	618638999	229086679	37	389552320	63	Universal Pictures	73000000	72132785	2 hr 9 min	Action            Adventure            Sci-Fi	PG-13	1997
175	Casino Royale	616505162	167445960	27.2	449059202	72.8	Sony Pictures Entertainment (SPE)	150000000	40833156	2 hr 24 min	Action            Adventure            Thriller	PG-13	2006
176	The Passion of the Christ	612054506	370782930	60.6	241271576	39.4	Newmarket Films	30000000	83848082	2 hr 7 min	Drama	R	2004
177	Life of Pi	609016565	124987023	20.5	484029542	79.5	Twentieth Century Fox	120000000	22451514	2 hr 7 min	Adventure            Drama            Fantasy	PG	2012
178	Ready Player One	607274134	137715350	22.7	469558784	77.3	Warner Bros.	175000000	41764050	2 hr 20 min	Action            Adventure            Sci-Fi	PG-13	2018
179	Transformers: The Last Knight	605425157	130168683	21.5	475256474	78.5	Paramount Pictures	217000000	44680073	2 hr 34 min	Action            Adventure            Sci-Fi	PG-13	2017
180	Madagascar: Escape 2 Africa	603900354	180010950	29.8	423889404	70.2	DreamWorks	150000000	63106589	1 hr 29 min	Adventure            Animation            Comedy            Family	PG	2008
181	War of the Worlds	603873119	234280354	38.8	369592765	61.2	Paramount Pictures	132000000	64878725	1 hr 56 min	Action            Adventure            Sci-Fi	PG-13	2005
182	Tangled	592462816	200821936	33.9	391640880	66.1	Walt Disney Studios Motion Pictures	260000000	48767052	1 hr 40 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	PG	2010
183	Quantum of Solace	589580482	168368427	28.6	421212055	71.4	Sony Pictures Entertainment (SPE)	200000000	67528882	1 hr 46 min	Action            Adventure            Mystery            Thriller	PG-13	2008
184	Men in Black	589390539	250690539	42.5	338700000	57.5	Sony Pictures Entertainment (SPE)	90000000	51068455	1 hr 38 min	Action            Adventure            Comedy            Sci-Fi	PG-13	1997
185	The Croods	587235983	187168425	31.9	400067558	68.1	Twentieth Century Fox	135000000	43639736	1 hr 38 min	Action            Adventure            Animation            Comedy            Family            Fantasy	PG	2013
186	The Hangover Part II	586764305	254464305	43.4	332300000	56.6	Warner Bros.	80000000	85946294	1 hr 42 min	Comedy	R	2011
187	Iron Man	585796247	319034126	54.5	266762121	45.5	Paramount Pictures	140000000	98618668	2 hr 6 min	Action            Adventure            Sci-Fi	PG-13	2008
188	I Am Legend	585410052	256393010	43.8	329017042	56.2	Warner Bros.	150000000	77211321	1 hr 41 min	Action            Drama            Horror            Sci-Fi            Thriller	PG-13	2007
189	Monsters, Inc.	579707738	290642256	50.1	289065482	49.9	Walt Disney Studios Motion Pictures	115000000	62577067	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy	G	2001
190	Operation Red Sea	579330426	1543547	0.3	577786879	99.7	Well Go USA Entertainment	0	436059	2 hr 22 min	Action            Drama            Thriller            War	Not Rated	2018
191	Night at the Museum	574481229	250863268	43.7	323617961	56.3	Twentieth Century Fox	0	30433781	1 hr 48 min	Adventure            Comedy            Family            Fantasy	PG	2006
192	Fifty Shades of Grey	569651467	166167230	29.2	403484237	70.8	Universal Pictures	40000000	85171450	2 hr 5 min	Drama            Romance            Thriller	R	2015
193	Kong: Skull Island	566652812	168052812	29.7	398600000	70.3	Warner Bros.	185000000	61025472	1 hr 58 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2017
194	The Smurfs	563749323	142614158	25.3	421135165	74.7	Sony Pictures Entertainment (SPE)	110000000	35611637	1 hr 43 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2011
195	Cars 2	559852396	191452396	34.2	368400000	65.8	Walt Disney Studios Motion Pictures	200000000	66135507	1 hr 46 min	Adventure            Animation            Comedy            Crime            Family            Mystery            Sci-Fi            Sport	G	2011
196	King Kong	556906378	218080025	39.2	338826353	60.8	Universal Pictures	207000000	50130145	3 hr 7 min	Action            Adventure            Romance	PG-13	2005
197	Puss in Boots	554987477	149260504	26.9	405726973	73.1	DreamWorks	130000000	34077439	1 hr 30 min	Adventure            Animation            Comedy            Family            Fantasy            Mystery            Romance	PG	2011
198	The Little Mermaid	554270735	293965993	53	260304742	47	Walt Disney Studios Motion Pictures	0	95578040	2 hr 15 min	Adventure            Family            Fantasy            Musical            Romance	PG	2023
199	The Mermaid	553810228	3232685	0.6	550577543	99.4	Sony Pictures Entertainment (SPE)	0	985052	1 hr 34 min	Comedy            Drama            Fantasy            Romance	R	2016
200	Armageddon	553709788	201578182	36.4	352131606	63.6	Walt Disney Studios Motion Pictures	140000000	36089972	2 hr 31 min	Action            Adventure            Sci-Fi            Thriller	PG-13	1998
201	The Day After Tomorrow	552639571	186740799	33.8	365898772	66.2	Twentieth Century Fox	125000000	68743584	2 hr 4 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2004
202	Ted	549368315	218815487	39.8	330552828	60.2	Universal Pictures	50000000	54415205	1 hr 46 min	Comedy	R	2012
203	American Sniper	547459020	350159020	64	197300000	36	Warner Bros.	58800000	633456	2 hr 13 min	Action            Biography            Drama            War	R	2014
204	Mission: Impossible II	546388108	215409889	39.4	330978219	60.6	Paramount Pictures	125000000	57845297	2 hr 3 min	Action            Adventure            Thriller	PG-13	2000
205	Detective Chinatown 2	544185156	1983984	0.4	542201172	99.6	Warner Bros.	0	704047	2 hr 1 min	Action            Comedy            Mystery	R	2018
206	X-Men: Apocalypse	543934105	155442489	28.6	388491616	71.4	Twentieth Century Fox	178000000	65769562	2 hr 24 min	Action            Adventure            Sci-Fi	PG-13	2016
207	Sherlock Holmes: A Game of Shadows	543848418	186848418	34.4	357000000	65.6	Warner Bros.	0	39637079	2 hr 9 min	Action            Adventure            Mystery	PG-13	2011
208	Despicable Me	543157985	251557985	46.3	291600000	53.7	Universal Pictures	69000000	56397125	1 hr 35 min	Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2010
209	Cinderella	542358331	201151353	37.1	341206978	62.9	Walt Disney Studios Motion Pictures	95000000	67877361	1 hr 45 min	Adventure            Drama            Family            Fantasy            Romance	PG	2015
210	Madagascar	542063846	193595521	35.7	348468325	64.3	DreamWorks Distribution	0	47224594	1 hr 26 min	Adventure            Animation            Comedy            Family	PG	2005
211	World War Z	540455876	202807711	37.5	337648165	62.5	Paramount Pictures	190000000	66411834	1 hr 56 min	Action            Adventure            Horror            Sci-Fi	PG-13	2013
212	Brave	538983207	237283207	44	301700000	56	Walt Disney Studios Motion Pictures	185000000	66323594	1 hr 33 min	Adventure            Animation            Comedy            Family            Fantasy            Mystery	PG	2012
213	Star Wars: Episode V - The Empire Strikes Back	538375067	292753960	54.4	245621107	45.6	Twentieth Century Fox	18000000	4910483	2 hr 4 min	Action            Adventure            Fantasy            Sci-Fi	PG	1980
214	The Simpsons Movie	536414293	183135014	34.1	353279279	65.9	Twentieth Century Fox	75000000	74036787	1 hr 27 min	Adventure            Animation            Comedy	PG-13	2007
215	The Revenant	532950503	183637894	34.5	349312609	65.5	Twentieth Century Fox	135000000	474560	2 hr 36 min	Action            Adventure            Drama            Western	R	2015
216	The Meg	530517320	145522784	27.4	384994536	72.6	Warner Bros.	130000000	45402195	1 hr 53 min	Action            Horror            Sci-Fi            Thriller	PG-13	2018
217	Ralph Breaks the Internet	529323962	201091711	38	328232251	62	Walt Disney Studios Motion Pictures	175000000	56237634	1 hr 52 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2018
218	Hotel Transylvania 3: Summer Vacation	528583774	167510016	31.7	361073758	68.3	Sony Pictures Entertainment (SPE)	80000000	44076225	1 hr 37 min	Adventure            Animation            Comedy            Family            Fantasy            Horror	PG	2018
219	The Boss Baby	527965936	175003033	33.2	352962903	66.8	Twentieth Century Fox	0	50198902	1 hr 37 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2017
220	Dunkirk	527016307	189740665	36	337275642	64	Warner Bros.	100000000	50513488	1 hr 46 min	Action            Drama            History            Thriller            War	PG-13	2017
221	The Grinch	526760632	271384731	51.5	255375901	48.5	Universal Pictures	75000000	67572855	1 hr 25 min	Animation            Comedy            Family            Fantasy            Musical	PG	2018
222	Godzilla	524976069	200676069	38.2	324300000	61.8	Warner Bros.	160000000	93188384	2 hr 3 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2014
223	How to Train Your Dragon: The Hidden World	524580592	160945505	30.7	363635087	69.3	Universal Pictures	129000000	55022245	1 hr 44 min	Action            Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2019
224	Sherlock Holmes	524028679	209028679	39.9	315000000	60.1	Warner Bros.	90000000	62304277	2 hr 8 min	Action            Adventure            Mystery	PG-13	2009
225	Meet the Fockers	522657936	279261160	53.4	243396776	46.6	Universal Pictures	80000000	46120980	1 hr 55 min	Comedy            Romance	PG-13	2004
226	WALL·E	521311890	223808164	42.9	297503726	57.1	Walt Disney Studios Motion Pictures	180000000	63087526	1 hr 38 min	Adventure            Animation            Family            Sci-Fi	Not Rated	2008
227	Kung Fu Panda 3	521170825	143528619	27.5	377642206	72.5	Twentieth Century Fox	145000000	41282042	1 hr 35 min	Action            Adventure            Animation            Comedy            Family            Fantasy	PG	2016
228	Terminator 2: Judgment Day	520881154	205881154	39.5	315000000	60.5	TriStar Pictures	102000000	31765506	2 hr 17 min	Action            Sci-Fi	R	1991
229	Ant-Man	519311965	180202163	34.7	339109802	65.3	Walt Disney Studios Motion Pictures	130000000	57225526	1 hr 57 min	Action            Comedy            Sci-Fi	PG-13	2015
230	Venom: Let There Be Carnage	506863592	213550366	42.1	293313226	57.9	Sony Pictures Entertainment (SPE)	0	90033210	1 hr 37 min	Action            Sci-Fi            Thriller	PG-13	2021
231	Ghost	505703557	217631306	43	288072251	57	Paramount Pictures	22000000	12191540	2 hr 7 min	Drama            Fantasy            Romance            Thriller	Not Rated	1990
232	Aladdin	504050219	217350219	43.1	286700000	56.9	Walt Disney Studios Motion Pictures	28000000	196664	1 hr 30 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	Not Rated	1992
233	Gladiator	503162313	187705427	37.3	315456886	62.7	DreamWorks Distribution	103000000	34819017	2 hr 35 min	Action            Adventure            Drama	R	2000
234	Rio 2	498781117	131538435	26.4	367242682	73.6	Twentieth Century Fox	103000000	39327869	1 hr 41 min	Adventure            Animation            Comedy            Family            Music            Musical	G	2014
235	Troy	497409852	133378256	26.8	364031596	73.2	Warner Bros.	175000000	46865412	2 hr 43 min	Drama	R	2004
236	Toy Story 2	497375381	245852179	49.4	251523202	50.6	Walt Disney Studios Motion Pictures	90000000	300163	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy	Not Rated	1999
237	How to Train Your Dragon	494879471	217581231	44	277298240	56	DreamWorks	165000000	43732319	1 hr 38 min	Action            Adventure            Animation            Comedy            Family            Fantasy	PG	2010
238	Twister	494580615	241830615	48.9	252750000	51.1	Warner Bros.	92000000	41059405	1 hr 53 min	Action            Adventure            Thriller	Not Rated	1996
239	Oz the Great and Powerful	493311825	234911825	47.6	258400000	52.4	Walt Disney Studios Motion Pictures	215000000	79110453	2 hr 10 min	Adventure            Family            Fantasy	PG	2013
240	Clash of the Titans	493214993	163214888	33.1	330000105	66.9	Warner Bros.	125000000	61235105	1 hr 46 min	Action            Adventure            Fantasy	PG-13	2010
241	Maleficent: Mistress of Evil	491730089	113929605	23.2	377800484	76.8	Walt Disney Studios Motion Pictures	185000000	36948713	1 hr 59 min	Adventure            Family            Fantasy            Romance	PG	2019
242	War for the Planet of the Apes	490719763	146880162	29.9	343839601	70.1	Twentieth Century Fox	150000000	56262929	2 hr 20 min	Action            Adventure            Drama            Sci-Fi            Thriller	PG-13	2017
243	Shrek	488441368	268163011	54.9	220278357	45.1	DreamWorks Distribution	60000000	42347760	1 hr 30 min	Adventure            Animation            Comedy            Family            Fantasy            Romance	PG	2001
244	Mr. & Mrs. Smith	487287646	186336279	38.2	300951367	61.8	Twentieth Century Fox	110000000	50342878	2 hr	Action            Comedy            Crime            Thriller	PG-13	2005
245	Angels & Demons	485930816	133375846	27.4	352554970	72.6	Sony Pictures Entertainment (SPE)	150000000	46204168	2 hr 18 min	Action            Mystery            Thriller	PG-13	2009
246	Teenage Mutant Ninja Turtles	485004754	191204754	39.4	293800000	60.6	Paramount Pictures	125000000	65575105	1 hr 41 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2014
247	Bruce Almighty	484592874	242829261	50.1	241763613	49.9	Universal Pictures	81000000	67953330	1 hr 41 min	Comedy            Fantasy	PG-13	2003
248	The King's Speech	484068861	138797449	28.7	345271412	71.3	The Weinstein Company	15000000	355450	1 hr 58 min	Biography            Drama            History	R	2010
249	Rio	483866772	143619809	29.7	340246963	70.3	Twentieth Century Fox	90000000	39225962	1 hr 36 min	Adventure            Animation            Comedy            Family            Music            Musical	PG	2011
250	Saving Private Ryan	482349603	217049603	45	265300000	55	DreamWorks Distribution	70000000	30576104	2 hr 49 min	Drama            War	R	1998
251	Rise of the Planet of the Apes	481800873	176760185	36.7	305040688	63.3	Twentieth Century Fox	93000000	54806191	1 hr 45 min	Action            Drama            Sci-Fi            Thriller	PG-13	2011
252	Puss in Boots: The Last Wish	480953264	185535345	38.6	295417919	61.4	Universal Pictures	0	12429515	1 hr 42 min	Adventure            Animation            Comedy            Family	PG	2022
253	Home Alone	476684675	285761243	60	190923432	40	Twentieth Century Fox	18000000	17081997	1 hr 43 min	Comedy            Family	Not Rated	1990
254	Jaws	476512065	265859065	55.8	210653000	44.2	Universal Pictures	7000000	7061513	2 hr 4 min	Adventure            Mystery            Thriller	Not Rated	1975
255	Ant-Man and the Wasp: Quantumania	476071180	214504909	45.1	261566271	54.9	Walt Disney Studios Motion Pictures	0	106109650	2 hr 4 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2023
256	Hotel Transylvania 2	475186706	169700110	35.7	305486596	64.3	Sony Pictures Entertainment (SPE)	80000000	48464322	1 hr 29 min	Adventure            Animation            Comedy            Family            Fantasy            Horror	PG	2015
257	Star Wars: Episode VI - Return of the Jedi	475106177	316566101	66.6	158540076	33.4	Twentieth Century Fox	32500000	23019618	2 hr 11 min	Action            Adventure            Fantasy            Sci-Fi	PG	1983
258	Charlie and the Chocolate Factory	474968763	206459076	43.5	268509687	56.5	Warner Bros.	150000000	56178450	1 hr 55 min	Adventure            Comedy            Family            Fantasy            Musical	PG	2005
259	Indiana Jones and the Last Crusade	474171806	197171806	41.6	277000000	58.4	Paramount Pictures	48000000	29355021	2 hr 7 min	Action            Adventure	PG-13	1989
260	San Andreas	474009154	155190832	32.7	318818322	67.3	Warner Bros.	110000000	54588173	1 hr 54 min	Action            Adventure            Thriller	PG-13	2015
261	It Chapter Two	473122525	211622525	44.7	261500000	55.3	Warner Bros.	79000000	91062152	2 hr 49 min	Drama            Fantasy            Horror	R	2019
262	La La Land	471974387	151101803	32	320872584	68	Lionsgate	30000000	881104	2 hr 8 min	Comedy            Drama            Music            Musical            Romance	PG-13	2016
263	Wreck-It Ralph	471222889	189422889	40.2	281800000	59.8	Walt Disney Studios Motion Pictures	165000000	49038712	1 hr 41 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2012
264	Godzilla vs. Kong	470116094	100916094	21.5	369200000	78.5	Warner Bros.	0	31625971	1 hr 53 min	Action            Sci-Fi            Thriller	PG-13	2021
265	The Hangover	469328079	277339746	59.1	191988333	40.9	Warner Bros.	35000000	44979319	1 hr 40 min	Comedy	R	2009
266	Lucy	469058574	126663600	27	342394974	73	Universal Pictures	40000000	43899340	1 hr 29 min	Action            Sci-Fi            Thriller	R	2014
267	The Lego Movie	468266122	257966122	55.1	210300000	44.9	Warner Bros.	60000000	69050279	1 hr 40 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2014
268	Bumblebee	467989645	127195589	27.2	340794056	72.8	Paramount Pictures	135000000	21654047	1 hr 54 min	Action            Adventure            Sci-Fi	PG-13	2018
269	Star Trek Into Darkness	467365246	228778661	49	238586585	51	Paramount Pictures	190000000	70165559	2 hr 12 min	Action            Adventure            Sci-Fi	PG-13	2013
270	The Matrix	467222728	172076928	36.8	295145800	63.2	Warner Bros.	63000000	27788331	2 hr 16 min	Action            Sci-Fi	R	1999
271	Pretty Woman	463406268	178406268	38.5	285000000	61.5	Walt Disney Studios Motion Pictures	14000000	11280591	1 hr 59 min	Comedy            Romance	R	1990
272	Cars	461991867	244082982	52.8	217908885	47.2	Walt Disney Studios Motion Pictures	120000000	60119509	1 hr 57 min	Adventure            Animation            Comedy            Family            Sport	Not Rated	2006
273	The Eight Hundred	461421559	372755	0.1	461048804	99.9	CMC Pictures	0	118161	2 hr 29 min	Action            Drama            History            War	Not Rated	2020
274	X-Men: The Last Stand	460435291	234362462	50.9	226072829	49.1	Twentieth Century Fox	210000000	102750665	1 hr 44 min	Action            Adventure            Sci-Fi	PG-13	2006
275	Moon Man	460237662	0	0	460237662	100	Unknown	0	0	2 hr 2 min	Comedy            Sci-Fi	Not Rated	2022
276	National Treasure: Book of Secrets	459242249	219964115	47.9	239278134	52.1	Walt Disney Studios Motion Pictures	0	44783772	2 hr 4 min	Action            Adventure            Mystery            Thriller	PG	2007
277	Mission: Impossible	457696391	180981856	39.5	276714535	60.5	Paramount Pictures	80000000	45436830	1 hr 50 min	Action            Adventure            Thriller	PG-13	1996
278	300	456082343	210629101	46.2	245453242	53.8	Warner Bros.	65000000	70885301	1 hr 57 min	Action            Drama	R	2007
279	The Last Samurai	454627263	111127263	24.4	343500000	75.6	Warner Bros.	140000000	24271354	2 hr 34 min	Action            Drama	R	2003
280	Demon Slayer the Movie: Mugen Train	453210959	49505008	10.9	403705951	89.1	FUNimation Entertainment	0	21234994	1 hr 57 min	Action            Adventure            Animation            Fantasy            Thriller	R	2020
281	Dying to Survive	451183391	6752	0	451176639	100	Unknown	0	0	1 hr 57 min	Comedy            Drama	Not Rated	2018
282	Ocean's Eleven	450717150	183417150	40.7	267300000	59.3	Warner Bros.	85000000	38107822	1 hr 56 min	Crime            Thriller	PG-13	2001
283	My People, My Country	450064993	2356683	0.5	447708310	99.5		0	876001	2 hr 34 min	Drama            History	Not Rated	2019
284	Pokémon: Detective Pikachu	449762638	144174568	32.1	305588070	67.9	Warner Bros.	150000000	54365242	1 hr 44 min	Action            Adventure            Comedy            Family            Mystery            Sci-Fi	PG	2019
285	Thor	449326618	181030624	40.3	268295994	59.7	Paramount Pictures	150000000	65723338	1 hr 55 min	Action            Fantasy	PG-13	2011
286	Pearl Harbor	449220945	198542554	44.2	250678391	55.8	Walt Disney Studios Motion Pictures	140000000	59078912	3 hr 3 min	Action            Drama            History            Romance            War	PG-13	2001
287	Tarzan	448191819	171091819	38.2	277100000	61.8	Walt Disney Studios Motion Pictures	130000000	34221968	1 hr 28 min	Adventure            Animation            Comedy            Drama            Family            Music	G	1999
288	Men in Black II	445135288	193735288	43.5	251400000	56.5	Sony Pictures Entertainment (SPE)	140000000	52148751	1 hr 28 min	Action            Adventure            Comedy            Mystery            Sci-Fi	PG-13	2002
289	The Bourne Ultimatum	444100035	227471070	51.2	216628965	48.8	Universal Pictures	110000000	69283690	1 hr 55 min	Action            Mystery            Thriller	PG-13	2007
290	The Mummy Returns	443280904	202019785	45.6	241261119	54.4	Universal Pictures	98000000	68139035	2 hr 10 min	Action            Adventure            Fantasy            Thriller	PG-13	2001
291	Alvin and the Chipmunks: The Squeakquel	443140005	219614612	49.6	223525393	50.4	Twentieth Century Fox	75000000	48875415	1 hr 28 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Music            Musical	PG	2009
292	Les Misérables	442299309	148809770	33.6	293489539	66.4	Universal Pictures	61000000	27281735	2 hr 38 min	Drama            Musical            Romance	PG-13	2012
293	The Exorcist	441306145	233005644	52.8	208300501	47.2	Warner Bros.	11000000	0	2 hr 2 min	Horror	R	1973
294	Mrs. Doubtfire	441286195	219195243	49.7	222090952	50.3	Twentieth Century Fox	25000000	20468847	2 hr 5 min	Comedy            Drama	PG-13	1993
295	Terminator Genisys	440603537	89760956	20.4	350842581	79.6	Paramount Pictures	155000000	27018486	2 hr 6 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2015
296	Warcraft	439048914	47365290	10.8	391683624	89.2	Universal Pictures	160000000	24166110	2 hr 3 min	Action            Adventure            Fantasy	PG-13	2016
297	A Star Is Born	436233122	215333122	49.4	220900000	50.6	Warner Bros.	36000000	42908051	2 hr 16 min	Drama            Music            Romance	R	2018
298	The Greatest Showman	435732529	174340174	40	261392355	60	Twentieth Century Fox	84000000	8805843	1 hr 45 min	Biography            Drama            Musical	PG	2017
299	Terminator 3: Rise of the Machines	433371112	150371112	34.7	283000000	65.3	Warner Bros.	200000000	44041440	1 hr 49 min	Action            Sci-Fi	R	2003
300	Shang-Chi and the Legend of the Ten Rings	432243292	224543292	52	207700000	48	Walt Disney Studios Motion Pictures	0	75388688	2 hr 12 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2021
301	Die Another Day	431971116	160942139	37.3	271028977	62.7	Metro-Goldwyn-Mayer (MGM)	142000000	47072040	2 hr 13 min	Action            Adventure            Thriller	PG-13	2002
302	The Secret Life of Pets 2	431058604	158874395	36.9	272184209	63.1	Universal Pictures	80000000	46652680	1 hr 26 min	Adventure            Animation            Comedy            Family	PG	2019
303	Cast Away	429632142	233632142	54.4	196000000	45.6	Twentieth Century Fox	90000000	28883406	2 hr 23 min	Adventure            Drama            Romance	PG-13	2000
304	Rampage	428028233	101028233	23.6	327000000	76.4	Warner Bros.	120000000	35753093	1 hr 47 min	Action            Adventure            Sci-Fi	PG-13	2018
305	The Matrix Revolutions	427344325	139313948	32.6	288030377	67.4	Warner Bros.	150000000	48475154	2 hr 9 min	Action            Sci-Fi	R	2003
306	John Wick: Chapter 4	426907099	187131806	43.8	239775293	56.2	Lionsgate	0	73817950	2 hr 49 min	Action            Crime            Thriller	R	2023
307	The Intouchables	426588510	10198820	2.4	416389690	97.6	The Weinstein Company	0	103507	1 hr 52 min	Biography            Comedy            Drama	R	2011
308	Bad Boys for Life	426505244	206305244	48.4	220200000	51.6	Sony Pictures Entertainment (SPE)	90000000	62504105	2 hr 4 min	Action            Comedy            Crime            Thriller	R	2020
309	Django Unchained	426074373	162805434	38.2	263268939	61.8	The Weinstein Company	100000000	30122888	2 hr 45 min	Drama            Western	R	2012
310	Beauty and the Beast	424967620	218967620	51.5	206000000	48.5	Walt Disney Studios Motion Pictures	25000000	162146	1 hr 24 min	Animation            Family            Fantasy            Musical            Romance	Not Rated	1991
311	Dances with Wolves	424208848	184208848	43.4	240000000	56.6	Orion Pictures	22000000	598257	3 hr 1 min	Adventure            Drama            Western	Not Rated	1990
313	Transformers: Rise of the Beasts	420985930	152785930	36.3	268200000	63.7	Paramount Pictures	0	61045464	2 hr 7 min	Action            Adventure            Sci-Fi	PG-13	2023
314	The Chronicles of Narnia: Prince Caspian	419665568	141621490	33.8	278044078	66.2	Walt Disney Studios Motion Pictures	225000000	55034805	2 hr 30 min	Action            Adventure            Family            Fantasy	PG	2008
315	Sex and the City	418765519	152647258	36.4	266118261	63.6	Warner Bros.	65000000	57038404	2 hr 25 min	Comedy            Drama            Romance	R	2008
316	The Captain	417282021	706572	0.2	416575449	99.8	Well Go USA Entertainment	0	324769	1 hr 51 min	Action            Adventure            Drama            Family            Thriller	Not Rated	2019
317	The Mummy	415933406	155385488	37.4	260547918	62.6	Universal Pictures	80000000	43369635	2 hr 4 min	Action            Adventure            Fantasy	PG-13	1999
318	The Chronicles of Narnia: The Voyage of the Dawn Treader	415686217	104386950	25.1	311299267	74.9	Twentieth Century Fox	155000000	24005069	1 hr 53 min	Adventure            Family            Fantasy	PG	2010
319	Jason Bourne	415484914	162434410	39.1	253050504	60.9	Universal Pictures	120000000	59215365	2 hr 3 min	Action            Thriller	PG-13	2016
320	The Wolverine	414828246	132556852	32	282271394	68	Twentieth Century Fox	120000000	53113752	2 hr 6 min	Action            Sci-Fi	PG-13	2013
321	Kingsman: The Secret Service	414351546	128261724	31	286089822	69	Twentieth Century Fox	81000000	36206331	2 hr 9 min	Action            Adventure            Comedy            Thriller	R	2015
322	Night at the Museum: Battle of the Smithsonian	413106170	177243721	42.9	235862449	57.1	Twentieth Century Fox	150000000	54173286	1 hr 45 min	Adventure            Comedy            Family            Fantasy	PG	2009
323	Batman	411569241	251409241	61.1	160160000	38.9	Warner Bros.	35000000	40489746	2 hr 6 min	Action            Adventure	Not Rated	1989
324	The Bodyguard	411046449	122046449	29.7	289000000	70.3	Warner Bros.	0	16611793	2 hr 9 min	Action            Drama            Music            Romance            Thriller	R	1992
325	Pacific Rim	411002906	101802906	24.8	309200000	75.2	Warner Bros.	190000000	37285325	2 hr 11 min	Action            Adventure            Sci-Fi	PG-13	2013
326	Kingsman: The Golden Circle	410902662	100234838	24.4	310667824	75.6	Twentieth Century Fox	104000000	39023010	2 hr 21 min	Action            Adventure            Comedy            Crime            Thriller	R	2017
327	The Mummy	409231607	80227895	19.6	329003712	80.4	Universal Pictures	125000000	31688375	1 hr 51 min	Action            Adventure            Fantasy            Horror            Thriller	PG-13	2017
328	Ice Age: Collision Course	408754975	64063008	15.7	344691967	84.3	Twentieth Century Fox	105000000	21373064	1 hr 34 min	Adventure            Animation            Comedy            Family            Sci-Fi	PG	2016
329	Twilight	408430415	193962473	47.5	214467942	52.5	Summit Entertainment	37000000	69637740	2 hr 2 min	Drama            Fantasy            Romance	PG-13	2008
330	Sing 2	408401214	162790990	39.9	245610224	60.1	Universal Pictures	0	22326230	1 hr 50 min	Adventure            Animation            Comedy            Family            Musical	PG	2021
331	Signs	408247917	227966634	55.8	180281283	44.2	Walt Disney Studios Motion Pictures	72000000	60117080	1 hr 46 min	Drama            Mystery            Sci-Fi            Thriller	PG-13	2002
332	X2: X-Men United	407711549	214949694	52.7	192761855	47.3	Twentieth Century Fox	110000000	85558731	2 hr 14 min	Action            Sci-Fi            Thriller	PG-13	2003
333	Fantastic Beasts: The Secrets of Dumbledore	407150844	95850844	23.5	311300000	76.5	Warner Bros.	0	42151256	2 hr 22 min	Adventure            Family            Fantasy	PG-13	2022
334	Uncharted	407141258	148648820	36.5	258492438	63.5	Sony Pictures Entertainment (SPE)	0	44010155	1 hr 56 min	Action            Adventure	PG-13	2022
335	The Wolf of Wall Street	406878233	116900694	28.7	289977539	71.3	Paramount Pictures	100000000	18361578	3 hr	Biography            Comedy            Crime            Drama	R	2013
336	Sonic the Hedgehog 2	405421518	190872904	47.1	214548614	52.9	Paramount Pictures	0	72105176	2 hr 2 min	Action            Adventure            Comedy            Family            Fantasy            Sci-Fi	PG	2022
337	Alita: Battle Angel	404980543	85838210	21.2	319142333	78.8	Twentieth Century Fox	170000000	28525613	2 hr 2 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2019
338	The Mummy: Tomb of the Dragon Emperor	403449830	102491776	25.4	300958054	74.6	Universal Pictures	145000000	40457770	1 hr 52 min	Action            Adventure            Fantasy            Horror	PG-13	2008
339	Prometheus	403354469	126477084	31.4	276877385	68.6	Twentieth Century Fox	130000000	51050101	2 hr 4 min	Adventure            Mystery            Sci-Fi	R	2012
340	Gone with the Wind	402382193	200882193	49.9	201500000	50.1	Metro-Goldwyn-Mayer (MGM)	0	0	3 hr 58 min	Drama            Romance            War	Not Rated	1939
341	Mamma Mia! Here We Go Again	402264843	120634935	30	281629908	70	Universal Pictures	75000000	34952180	1 hr 54 min	Comedy            Musical            Romance	PG-13	2018
342	Eternals	402064899	164870234	41	237194665	59	Walt Disney Studios Motion Pictures	0	71297219	2 hr 36 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2021
343	Dune	402027830	108327830	27	293700000	73	Warner Bros.	0	41011174	2 hr 35 min	Action            Adventure            Drama            Sci-Fi	PG-13	2021
344	TRON: Legacy	400063852	172062763	43	228001089	57	Walt Disney Studios Motion Pictures	170000000	44026211	2 hr 5 min	Action            Adventure            Sci-Fi	PG	2010
345	Mission: Impossible III	398479497	134029801	33.6	264449696	66.4	Paramount Pictures	150000000	47743273	2 hr 6 min	Action            Adventure            Thriller	PG-13	2006
346	Snow White and the Huntsman	396592829	155332381	39.2	241260448	60.8	Universal Pictures	170000000	56217700	2 hr 7 min	Action            Adventure            Drama            Fantasy	PG-13	2012
347	Grease	396271103	190071103	48	206200000	52	Paramount Pictures	6000000	8941717	1 hr 50 min	Comedy            Musical            Romance	PG	1978
384	Fifty Shades Freed	371985018	100407760	27	271577258	73	Universal Pictures	55000000	38560195	1 hr 45 min	Drama            Romance            Thriller	R	2018
348	Toy Story	394436586	223225679	56.6	171210907	43.4	Walt Disney Studios Motion Pictures	0	29140617	1 hr 21 min	Adventure            Animation            Comedy            Family            Fantasy	Not Rated	1995
349	Black Adam	393252111	168152111	42.8	225100000	57.2	Warner Bros.	0	67004323	2 hr 5 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2022
350	Solo: A Star Wars Story	392924807	213767512	54.4	179157295	45.6	Walt Disney Studios Motion Pictures	275000000	84420489	2 hr 15 min	Action            Adventure            Sci-Fi	PG-13	2018
351	Superman Returns	391081192	200081192	51.2	191000000	48.8	Warner Bros.	270000000	52535096	2 hr 34 min	Action            Adventure            Sci-Fi	PG-13	2006
352	Robin Hood: Prince of Thieves	390493908	165493908	42.4	225000000	57.6	Warner Bros.	48000000	25625602	2 hr 23 min	Action            Adventure            Drama            Romance	Not Rated	1991
353	Raiders of the Lost Ark	389925971	248159971	63.6	141766000	36.4	Paramount Pictures	18000000	8305823	1 hr 55 min	Action            Adventure	PG	1981
354	Independence Day: Resurgence	389681935	103144286	26.5	286537649	73.5	Twentieth Century Fox	165000000	41039944	2 hr	Action            Adventure            Sci-Fi	PG-13	2016
355	Live Free or Die Hard	388156011	134529403	34.7	253626608	65.3	Twentieth Century Fox	110000000	33369559	2 hr 8 min	Action            Thriller	PG-13	2007
356	Monster Hunt	387053506	32766	0.1	387020740	100	FilmRise	0	21074	1 hr 57 min	Adventure            Comedy            Fantasy	Not Rated	2015
357	Godzilla: King of the Monsters	386600138	110500138	28.6	276100000	71.4	Warner Bros.	170000000	47776293	2 hr 12 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2019
358	Home	386041607	177397510	46	208644097	54	Twentieth Century Fox	135000000	52107731	1 hr 34 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2015
359	Star Trek	385680446	257730019	66.8	127950427	33.2	Paramount Pictures	150000000	75204289	2 hr 7 min	Action            Adventure            Sci-Fi	PG-13	2009
360	1917	384579437	159227644	41.4	225351793	58.6	Universal Pictures	95000000	576216	1 hr 59 min	Action            Drama            War	R	2019
361	Happy Feet	384336108	198000317	51.5	186335791	48.5	Warner Bros.	100000000	41533432	1 hr 48 min	Adventure            Animation            Comedy            Family            Music            Musical            Romance	PG	2006
362	Spider-Man: Into the Spider-Verse	384256930	190241310	49.5	194015620	50.5	Sony Pictures Entertainment (SPE)	90000000	35363376	1 hr 57 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2018
363	Cars 3	383930656	152901115	39.8	231029541	60.2	Walt Disney Studios Motion Pictures	0	53688680	1 hr 42 min	Adventure            Animation            Comedy            Family            Sport	G	2017
364	Back to the Future	383336762	212836762	55.5	170500000	44.5	Universal Pictures	19000000	11152500	1 hr 56 min	Adventure            Comedy            Sci-Fi	Not Rated	1985
365	Ice Age	383257136	176387405	46	206869731	54	Twentieth Century Fox	59000000	46312454	1 hr 21 min	Adventure            Animation            Comedy            Family	PG	2002
366	Your Name.	382238181	5017246	1.3	377220935	98.7	FUNimation Entertainment	0	1813781	1 hr 46 min	Animation            Drama            Fantasy            Romance	PG	2016
367	Fifty Shades Darker	381545846	114581250	30	266964596	70	Universal Pictures	55000000	46607250	1 hr 58 min	Drama            Romance            Thriller	R	2017
368	Monsters vs. Aliens	381509870	198351526	52	183158344	48	DreamWorks	175000000	59321095	1 hr 34 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2009
369	Mad Max: Fury Road	380080290	154280290	40.6	225800000	59.4	Warner Bros.	150000000	45428128	2 hr	Action            Adventure            Sci-Fi            Thriller	R	2015
370	Black Widow	379751655	183651655	48.4	196100000	51.6	Walt Disney Studios Motion Pictures	0	80366312	2 hr 14 min	Action            Adventure            Sci-Fi	PG-13	2021
371	Godzilla	379014294	136314294	36	242700000	64	Sony Pictures Entertainment (SPE)	130000000	44047541	2 hr 19 min	Action            Sci-Fi            Thriller	PG-13	1998
372	True Lies	378882411	146282411	38.6	232600000	61.4	Twentieth Century Fox	115000000	25869770	2 hr 21 min	Action            Comedy            Thriller	R	1994
373	Slumdog Millionaire	378410542	141319928	37.4	237090614	62.6		15000000	360018	2 hr	Crime            Drama            Romance	R	2008
374	Once Upon a Time in Hollywood	377617598	142502728	37.7	235114870	62.3	Sony Pictures Entertainment (SPE)	90000000	41082018	2 hr 41 min	Comedy            Drama	R	2019
375	Taken 2	376152455	139854287	37.2	236298168	62.8	Twentieth Century Fox	45000000	49514769	1 hr 32 min	Action            Crime            Thriller	PG-13	2012
376	G.I. Joe: Retaliation	375740705	122523060	32.6	253217645	67.4	Paramount Pictures	130000000	40501814	1 hr 50 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2013
377	Shark Tale	374583879	160861908	42.9	213721971	57.1	DreamWorks Distribution	75000000	47604606	1 hr 30 min	Adventure            Animation            Comedy            Family            Thriller	PG	2004
378	What Women Want	374111707	182811707	48.9	191300000	51.1	Paramount Pictures	70000000	33614543	2 hr 7 min	Comedy            Fantasy            Romance	PG-13	2000
379	The Adventures of Tintin	373993951	77591831	20.8	296402120	79.2	Paramount Pictures	0	9720993	1 hr 47 min	Action            Adventure            Animation            Family            Mystery	PG	2011
380	Batman Begins	373672993	206863479	55.4	166809514	44.6	Warner Bros.	150000000	48745440	2 hr 20 min	Action            Crime            Drama	PG-13	2005
381	Penguins of Madagascar	373515621	83850911	22.4	289664710	77.6	Twentieth Century Fox	132000000	25447444	1 hr 32 min	Action            Adventure            Animation            Comedy            Crime            Family            Sci-Fi	PG	2014
382	X-Men Origins: Wolverine	373062864	179883157	48.2	193179707	51.8	Twentieth Century Fox	150000000	85058003	1 hr 47 min	Action            Sci-Fi	PG-13	2009
383	The Golden Compass	372234864	70107728	18.8	302127136	81.2	New Line Cinema	180000000	26125000	1 hr 53 min	Adventure            Family            Fantasy	PG-13	2007
385	Hitch	371594210	179495555	48.3	192098655	51.7	Sony Pictures Entertainment (SPE)	70000000	43142214	1 hr 58 min	Comedy            Romance	PG-13	2005
386	Terminator Salvation	371353001	125322469	33.8	246030532	66.2	Warner Bros.	200000000	42558390	1 hr 55 min	Action            Adventure            Sci-Fi	PG-13	2009
387	Captain America: The First Avenger	370569774	176654505	47.7	193915269	52.3	Paramount Pictures	140000000	65058524	2 hr 4 min	Action            Adventure            Sci-Fi	PG-13	2011
388	Edge of Tomorrow	370541256	100206256	27	270335000	73	Warner Bros.	178000000	28760246	1 hr 53 min	Action            Adventure            Sci-Fi	PG-13	2014
389	There's Something About Mary	369884651	176484651	47.7	193400000	52.3	Twentieth Century Fox	23000000	13740644	1 hr 59 min	Comedy            Romance	R	1998
390	Gone Girl	369330363	167767189	45.4	201563174	54.6	Twentieth Century Fox	61000000	37513109	2 hr 29 min	Drama            Mystery            Thriller	R	2014
391	The Fugitive	368875760	183875760	49.8	185000000	50.2	Warner Bros.	0	23758855	2 hr 10 min	Action            Crime            Drama            Mystery            Thriller	PG-13	1993
392	Jurassic Park III	368780809	181171875	49.1	187608934	50.9	Universal Pictures	93000000	50771645	1 hr 32 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2001
393	My Big Fat Greek Wedding	368744044	241438208	65.5	127305836	34.5	IFC Films	5000000	597362	1 hr 35 min	Comedy            Drama            Romance	PG	2002
394	Shazam!	367799011	140480049	38.2	227318962	61.8	Warner Bros.	100000000	53505326	2 hr 12 min	Action            Adventure            Comedy            Fantasy	PG-13	2019
395	Hello Mr. Billionaire	366961907	0	0	366961907	100	Unknown	0	0	1 hr 58 min	Comedy	Not Rated	2018
396	Die Hard with a Vengeance	366101666	100012499	27.3	266089167	72.7	Twentieth Century Fox	90000000	22162245	2 hr 8 min	Action            Adventure            Thriller	R	1995
397	The Nun	365582797	117481222	32.1	248101575	67.9	Warner Bros.	22000000	53807379	1 hr 36 min	Horror            Mystery            Thriller	R	2018
398	Alvin and the Chipmunks	365352546	217326974	59.5	148025572	40.5	Twentieth Century Fox	60000000	44307417	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy            Music            Musical	PG	2007
399	Tenet	365304105	58504105	16	306800000	84	Warner Bros.	0	9353090	2 hr 30 min	Action            Sci-Fi            Thriller	PG-13	2020
400	Notting Hill	363889678	116089678	31.9	247800000	68.1	Universal Pictures	42000000	21811180	2 hr 4 min	Comedy            Drama            Romance	PG-13	1999
401	A Bug's Life	363258859	162798565	44.8	200460294	55.2	Walt Disney Studios Motion Pictures	120000000	291121	1 hr 35 min	Adventure            Animation            Comedy            Family            Fantasy	Not Rated	1998
402	Night at the Museum: Secret of the Tomb	363204635	113746621	31.3	249458014	68.7	Twentieth Century Fox	127000000	17100520	1 hr 38 min	Adventure            Comedy            Family            Fantasy	PG	2014
403	Ocean's Twelve	362744280	125544280	34.6	237200000	65.4	Warner Bros.	110000000	39153380	2 hr 5 min	Crime            Thriller	PG-13	2004
404	Planet of the Apes	362211740	180011740	49.7	182200000	50.3	Twentieth Century Fox	100000000	68532960	1 hr 59 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2001
405	The Hangover Part III	362000072	112200072	31	249800000	69	Warner Bros.	103000000	41671198	1 hr 40 min	Comedy            Crime	R	2013
406	The World Is Not Enough	361832400	126943684	35.1	234888716	64.9	Metro-Goldwyn-Mayer (MGM)	135000000	35519007	2 hr 8 min	Action            Adventure            Thriller	PG-13	1999
407	Monster Hunt 2	361682618	706153	0.2	360976465	99.8	Lionsgate	0	341834	1 hr 50 min	Adventure            Comedy            Fantasy            Sci-Fi	Not Rated	2018
408	Fast & Furious	360366870	155064265	43	205302605	57	Universal Pictures	85000000	70950500	1 hr 47 min	Action            Crime            Thriller	PG-13	2009
409	Noah	359200044	101200044	28.2	258000000	71.8	Paramount Pictures	125000000	43720472	2 hr 18 min	Action            Adventure            Drama	PG-13	2014
410	The Karate Kid	359126022	176591618	49.2	182534404	50.8	Sony Pictures Entertainment (SPE)	40000000	55665805	2 hr 20 min	Action            Drama            Family            Sport	PG	2010
411	Home Alone 2: Lost in New York	358994850	173585516	48.4	185409334	51.6	Twentieth Century Fox	0	31126882	2 hr	Adventure            Comedy            Crime            Family	PG	1992
412	Hotel Transylvania	358375603	148313048	41.4	210062555	58.6	Sony Pictures Entertainment (SPE)	85000000	42522194	1 hr 31 min	Adventure            Animation            Comedy            Family            Fantasy            Horror            Romance	PG	2012
413	Minority Report	358372926	132072926	36.8	226300000	63.2	Twentieth Century Fox	102000000	35677125	2 hr 25 min	Action            Crime            Mystery            Sci-Fi            Thriller	PG-13	2002
414	Top Gun	357288178	180258178	50.4	177030000	49.6	Paramount Pictures	0	8193052	1 hr 49 min	Action            Drama	Not Rated	1986
415	Spirited Away	357277400	15205725	4.3	342071675	95.7	Walt Disney Studios Motion Pictures	0	449839	2 hr 5 min	Adventure            Animation            Family            Fantasy            Mystery	PG	2001
416	The Legend of Tarzan	356700357	126643061	35.5	230057296	64.5	Warner Bros.	180000000	38527856	1 hr 50 min	Action            Adventure            Drama            Fantasy            Romance	PG-13	2016
417	American Beauty	356296601	130096601	36.5	226200000	63.5	DreamWorks Distribution	15000000	861531	2 hr 2 min	Drama	R	1999
418	Apollo 13	355237933	173837933	48.9	181400000	51.1	Universal Pictures	0	25353380	2 hr 20 min	Adventure            Drama            History	PG	1995
419	Rain Man	354825435	172825435	48.7	182000000	51.3	Metro-Goldwyn-Mayer (MGM)	25000000	7005719	2 hr 13 min	Drama	Not Rated	1988
420	The Great Gatsby	353659851	144857996	41	208801855	59	Warner Bros.	105000000	50085185	2 hr 23 min	Drama            Romance	PG-13	2013
421	Dumbo	353284621	114766307	32.5	238518314	67.5	Walt Disney Studios Motion Pictures	170000000	45990748	1 hr 52 min	Adventure            Family            Fantasy	PG	2019
422	I, Robot	353133898	144801023	41	208332875	59	Twentieth Century Fox	120000000	52179887	1 hr 55 min	Action            Mystery            Sci-Fi            Thriller	PG-13	2004
423	Basic Instinct	352927224	117727224	33.4	235200000	66.6	TriStar Pictures	49000000	15129385	2 hr 7 min	Drama            Mystery            Thriller	R	1992
424	Murder on the Orient Express	352794081	102826543	29.2	249967538	70.8	Twentieth Century Fox	55000000	28681472	1 hr 54 min	Crime            Drama            Mystery	PG-13	2017
425	X-Men: First Class	352616690	146408305	41.5	206208385	58.5	Twentieth Century Fox	160000000	55101604	2 hr 11 min	Action            Sci-Fi	PG-13	2011
426	The Angry Birds Movie	352333929	107509366	30.5	244824563	69.5	Sony Pictures Entertainment (SPE)	73000000	38155177	1 hr 37 min	Action            Adventure            Animation            Comedy            Family	PG	2016
427	GoldenEye	352194034	106429941	30.2	245764093	69.8	Metro-Goldwyn-Mayer (MGM)	0	26205007	2 hr 10 min	Action            Adventure            Thriller	PG-13	1995
428	Catch Me If You Can	352114312	164615351	46.8	187498961	53.2	DreamWorks Distribution	52000000	30053627	2 hr 21 min	Biography            Crime            Drama	PG-13	2002
429	Now You See Me	351723989	117723989	33.5	234000000	66.5	Lionsgate	75000000	29350389	1 hr 55 min	Crime            Mystery            Thriller	PG-13	2013
430	Hannibal	351692268	165092268	46.9	186600000	53.1	Metro-Goldwyn-Mayer (MGM)	87000000	58003121	2 hr 11 min	Crime            Drama            Thriller	R	2001
431	The Mask	351583407	119938730	34.1	231644677	65.9	New Line Cinema	23000000	23117068	1 hr 41 min	Action            Comedy            Crime            Fantasy	PG-13	1994
432	Peter Rabbit	351496066	115253424	32.8	236242642	67.2	Sony Pictures Entertainment (SPE)	50000000	25010928	1 hr 35 min	Adventure            Comedy            Crime            Drama            Family            Fantasy	PG	2018
433	Speed	350448145	121248145	34.6	229200000	65.4	Twentieth Century Fox	30000000	14456194	1 hr 56 min	Action            Adventure            Thriller	R	1994
434	Dinosaur	349822765	137748063	39.4	212074702	60.6	Walt Disney Studios Motion Pictures	127500000	38854851	1 hr 22 min	Adventure            Animation            Drama            Family            Fantasy	PG	2000
435	Mary Poppins Returns	349546142	171958438	49.2	177587704	50.8	Walt Disney Studios Motion Pictures	130000000	23523121	2 hr 10 min	Adventure            Comedy            Family            Fantasy            Musical	PG	2018
436	Deep Impact	349464664	140464664	40.2	209000000	59.8	Paramount Pictures	0	41152375	2 hr	Action            Drama            Sci-Fi            Thriller	PG-13	1998
437	The Lorax	349183316	214373500	61.4	134809816	38.6	Universal Pictures	70000000	70217070	1 hr 26 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Musical	PG	2012
438	The Maze Runner	348319861	102427862	29.4	245891999	70.6	Twentieth Century Fox	34000000	32512804	1 hr 53 min	Action            Mystery            Sci-Fi            Thriller	PG-13	2014
439	The Smurfs 2	347545360	71017784	20.4	276527576	79.6	Sony Pictures Entertainment (SPE)	105000000	17548389	1 hr 45 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2013
440	National Treasure	347512318	173008894	49.8	174503424	50.2	Walt Disney Studios Motion Pictures	100000000	35142554	2 hr 11 min	Action            Adventure            Mystery            Thriller	PG	2004
441	Rush Hour 2	347325802	226164286	65.1	121161516	34.9	New Line Cinema	90000000	67408222	1 hr 30 min	Action            Comedy            Crime            Thriller	PG-13	2001
442	Trolls	347182886	154025064	44.4	193157822	55.6	Twentieth Century Fox	125000000	46581142	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy            Music            Musical	PG	2016
443	xXx: Return of Xander Cage	346118277	44898413	13	301219864	87	Paramount Pictures	85000000	20130142	1 hr 47 min	Action            Adventure            Thriller	PG-13	2017
444	Pocahontas	346079773	141579773	40.9	204500000	59.1	Walt Disney Studios Motion Pictures	0	2689714	1 hr 21 min	Adventure            Animation            Drama            Family            Musical            Romance	G	1995
445	How the Grinch Stole Christmas	345823032	260715005	75.4	85108027	24.6	Universal Pictures	123000000	55082330	1 hr 44 min	Comedy            Family            Fantasy	PG	2000
446	Star Trek Beyond	343471816	158848340	46.2	184623476	53.8	Paramount Pictures	185000000	59253211	2 hr 2 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2016
447	Alvin and the Chipmunks: Chipwrecked	342695435	133110742	38.8	209584693	61.2	Twentieth Century Fox	75000000	23244744	1 hr 27 min	Adventure            Animation            Comedy            Family            Fantasy            Music            Musical	G	2011
448	Wanted	342463063	134508551	39.3	207954512	60.7	Universal Pictures	75000000	50927085	1 hr 50 min	Action            Crime            Thriller	R	2008
449	The Flintstones	341631208	130531208	38.2	211100000	61.8	Universal Pictures	46000000	29688730	1 hr 31 min	Comedy            Family            Fantasy	PG	1994
450	A Quiet Place	340952971	188024361	55.2	152928610	44.8	Paramount Pictures	17000000	50203562	1 hr 30 min	Drama            Horror            Sci-Fi	PG-13	2018
451	Enchanted	340487862	127807262	37.5	212680600	62.5	Walt Disney Studios Motion Pictures	85000000	34440317	1 hr 47 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	PG	2007
452	Over the Hedge	339795890	155019340	45.6	184776550	54.4	DreamWorks	0	38457003	1 hr 23 min	Adventure            Animation            Comedy            Family	PG	2006
453	300: Rise of an Empire	337580051	106580051	31.6	231000000	68.4	Warner Bros.	110000000	45038460	1 hr 42 min	Action            Drama	R	2014
454	Batman Forever	336567158	184069126	54.7	152498032	45.3	Warner Bros.	100000000	52784433	2 hr 1 min	Action            Adventure	PG-13	1995
455	Prince of Persia: The Sands of Time	336365676	90759676	27	245606000	73	Walt Disney Studios Motion Pictures	200000000	30095259	1 hr 56 min	Action            Adventure            Fantasy	PG-13	2009
456	The Curious Case of Benjamin Button	335802786	127509326	38	208293460	62	Paramount Pictures	150000000	26853816	2 hr 46 min	Drama            Fantasy            Romance	PG-13	2008
457	Journey 2: The Mysterious Island	335287748	103887748	31	231400000	69	Warner Bros.	79000000	27335363	1 hr 34 min	Action            Adventure            Comedy            Family            Fantasy            Sci-Fi	PG	2012
458	The Rock	335062621	134069511	40	200993110	60	Walt Disney Studios Motion Pictures	75000000	25069525	2 hr 16 min	Action            Adventure            Thriller	R	1996
459	The Great Wall	334933831	45540830	13.6	289393001	86.4	Universal Pictures	150000000	18469620	1 hr 43 min	Action            Adventure            Fantasy            Thriller	PG-13	2016
460	Now You See Me 2	334897606	65075540	19.4	269822066	80.6	Lionsgate	0	22383146	2 hr 9 min	Action            Adventure            Comedy            Crime            Mystery            Thriller	PG-13	2016
461	Never Say Die	334530869	0	0	334530869	100	Unknown	0	0	1 hr 40 min	Comedy            Fantasy            Sport	Not Rated	2017
462	Bridget Jones's Diary	334272563	71543427	21.4	262729136	78.6	Miramax	25000000	10733933	1 hr 37 min	Comedy            Drama            Romance	R	2001
463	Fantastic Four	333535934	154696080	46.4	178839854	53.6	Twentieth Century Fox	100000000	56061504	1 hr 46 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2005
464	Indiana Jones and the Temple of Doom	333107271	179870271	54	153237000	46	Paramount Pictures	28000000	25337110	1 hr 58 min	Action            Adventure	Not Rated	1984
465	Tomorrow Never Dies	333011068	125304276	37.6	207706792	62.4	Metro-Goldwyn-Mayer (MGM)	0	25143007	1 hr 59 min	Action            Adventure            Thriller	PG-13	1997
466	Back to the Future Part II	332500002	119000002	35.8	213500000	64.2	Universal Pictures	40000000	27835125	1 hr 48 min	Adventure            Comedy            Sci-Fi	Not Rated	1989
467	The Good Dinosaur	332207671	123087120	37	209120551	63	Walt Disney Studios Motion Pictures	0	39155217	1 hr 33 min	Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2015
468	Free Guy	331526598	121626598	36.7	209900000	63.3	20th Century Studios	0	28365416	1 hr 55 min	Action            Adventure            Comedy            Fantasy            Sci-Fi	PG-13	2021
469	22 Jump Street	331333876	191719337	57.9	139614539	42.1	Sony Pictures Entertainment (SPE)	50000000	57071445	1 hr 52 min	Action            Comedy            Crime	R	2014
470	Meet the Parents	330444045	166244045	50.3	164200000	49.7	Universal Pictures	55000000	28623300	1 hr 48 min	Comedy            Romance	PG-13	2000
471	Who Framed Roger Rabbit	329803958	156452370	47.4	173351588	52.6	Walt Disney Studios Motion Pictures	70000000	11226239	1 hr 44 min	Adventure            Animation            Comedy            Crime            Family            Fantasy            Mystery	Not Rated	1988
472	Black Swan	329398046	106954678	32.5	222443368	67.5		13000000	1443809	1 hr 48 min	Drama            Thriller	R	2010
473	The Perfect Storm	328718434	182618434	55.6	146100000	44.4	Warner Bros.	140000000	41325042	2 hr 10 min	Action            Adventure            Drama            Thriller	PG-13	2000
474	John Wick: Chapter 3 - Parabellum	328349387	171015687	52.1	157333700	47.9	Lionsgate	75000000	56818067	2 hr 10 min	Action            Crime            Thriller	R	2019
475	Crocodile Dundee	328203506	174803506	53.3	153400000	46.7	Paramount Pictures	0	8038855	1 hr 37 min	Action            Adventure            Comedy	Not Rated	1986
476	Crazy Alien	327598891	0	0	327598891	100	Unknown	0	0	1 hr 56 min	Comedy            Sci-Fi	Not Rated	2019
477	Se7en	327333559	100125643	30.6	227207916	69.4	New Line Cinema	33000000	13949807	2 hr 7 min	Crime            Drama            Mystery            Thriller	R	1995
478	The Devil Wears Prada	326706115	124740460	38.2	201965655	61.8	Twentieth Century Fox	35000000	27537244	1 hr 49 min	Comedy            Drama	PG-13	2006
479	Taken 3	326479141	89256424	27.3	237222717	72.7	Twentieth Century Fox	48000000	39201657	1 hr 48 min	Action            Crime            Thriller	PG-13	2015
480	The Hunchback of Notre Dame	325338851	100138851	30.8	225200000	69.2	Walt Disney Studios Motion Pictures	100000000	21037414	1 hr 31 min	Animation            Drama            Family            Musical            Romance	Not Rated	1996
481	A Christmas Carol	325286646	137855863	42.4	187430783	57.6	Walt Disney Studios Motion Pictures	200000000	30051075	1 hr 36 min	Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2009
482	The SpongeBob Movie: Sponge Out of Water	325186032	162994032	50.1	162192000	49.9	Paramount Pictures	74000000	55365012	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2015
483	Schindler's List	322161245	96898818	30.1	225262427	69.9	Universal Pictures	22000000	656636	3 hr 15 min	Biography            Drama            History	R	1993
484	Megamind	321885765	148415853	46.1	173469912	53.9	DreamWorks	130000000	46016833	1 hr 35 min	Action            Animation            Comedy            Crime            Family            Mystery            Sci-Fi            Thriller	PG	2010
485	The Conjuring 2	321834351	102516140	31.8	219318211	68.2	Warner Bros.	40000000	40406314	2 hr 14 min	Horror            Mystery            Thriller	R	2016
486	Green Book	321752656	85080171	26.4	236672485	73.6	Universal Pictures	23000000	320429	2 hr 10 min	Biography            Comedy            Drama            Music	PG-13	2018
487	Lethal Weapon 3	321731527	144731527	45	177000000	55	Warner Bros.	35000000	33243086	1 hr 58 min	Action            Crime            Thriller	R	1992
488	Robin Hood	321669741	105269730	32.7	216400011	67.3	Universal Pictures	200000000	36063385	2 hr 20 min	Action            Adventure            Drama            History	PG-13	2010
489	Inglourious Basterds	321457747	120540719	37.5	200917028	62.5	The Weinstein Company	70000000	38054676	2 hr 33 min	Adventure            Drama            War	R	2009
490	101 Dalmatians	320689294	136189294	42.5	184500000	57.5	Walt Disney Studios Motion Pictures	0	33504025	1 hr 43 min	Adventure            Comedy            Crime            Family	Not Rated	1996
491	The Conjuring	320406242	137446368	42.9	182959874	57.1	Warner Bros.	20000000	41855326	1 hr 52 min	Horror            Mystery            Thriller	R	2013
492	Fatal Attraction	320145693	156645693	48.9	163500000	51.1	Paramount Pictures	0	7602740	1 hr 59 min	Drama            Thriller	Not Rated	1987
493	Sonic the Hedgehog	319715683	148974665	46.6	170741018	53.4	Paramount Pictures	85000000	58018348	1 hr 39 min	Action            Adventure            Comedy            Family            Fantasy            Sci-Fi	PG	2020
494	The Last Airbender	319713881	131772187	41.2	187941694	58.8	Paramount Pictures	150000000	40325019	1 hr 43 min	Action            Adventure            Family            Fantasy	PG	2010
495	The Proposal	317375031	163958031	51.7	153417000	48.3	Walt Disney Studios Motion Pictures	40000000	33627598	1 hr 48 min	Comedy            Drama            Romance	PG-13	2009
496	The Polar Express	316897787	189528738	59.8	127369049	40.2	Warner Bros.	165000000	23323463	1 hr 40 min	Adventure            Animation            Comedy            Family            Fantasy            Musical	Not Rated	2004
497	A Beautiful Mind	316791257	170742341	53.9	146048916	46.1	Universal Pictures	58000000	367151	2 hr 15 min	Biography            Drama	PG-13	2001
498	Beverly Hills Cop	316360478	234760478	74.2	81600000	25.8	Paramount Pictures	0	15214805	1 hr 45 min	Action            Comedy            Crime            Thriller	Not Rated	1984
499	Air Force One	315156409	172956409	54.9	142200000	45.1	Sony Pictures Entertainment (SPE)	85000000	37132505	2 hr 4 min	Action            Drama            Thriller	R	1997
500	Wonder	315025930	132422809	42	182603121	58	Lionsgate	0	27547866	1 hr 53 min	Drama            Family	PG	2017
501	The Expendables 2	314975955	85028192	27	229947763	73	Lionsgate	100000000	28591370	1 hr 43 min	Action            Adventure            Thriller	R	2012
502	Chicken Little	314432837	135386665	43.1	179046172	56.9	Walt Disney Studios Motion Pictures	150000000	40049778	1 hr 21 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	G	2005
503	As Good as It Gets	314178011	148478011	47.3	165700000	52.7	Sony Pictures Entertainment (SPE)	50000000	12606928	2 hr 19 min	Comedy            Drama            Romance	PG-13	1997
504	Elemental	313203146	125688508	40.1	187514638	59.9	Walt Disney Studios Motion Pictures	0	29602429	1 hr 41 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Sci-Fi	PG	2023
505	Knives Out	312897920	165363234	52.8	147534686	47.2	Lionsgate	40000000	26769548	2 hr 10 min	Comedy            Crime            Drama            Mystery            Thriller	PG-13	2019
506	Maze Runner: The Scorch Trials	312296056	81697192	26.2	230598864	73.8	Twentieth Century Fox	61000000	30316510	2 hr 11 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2015
507	Resident Evil: The Final Chapter	312242626	26830068	8.6	285412558	91.4	Screen Gems	40000000	13601682	1 hr 47 min	Action            Horror            Sci-Fi	R	2016
508	The Lego Batman Movie	312136671	175936671	56.4	136200000	43.6	Warner Bros.	80000000	53003468	1 hr 44 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2017
509	Austin Powers: The Spy Who Shagged Me	312016928	206040086	66	105976842	34	New Line Cinema	33000000	17981900	1 hr 35 min	Action            Adventure            Comedy            Crime	PG-13	1999
510	Ocean's Thirteen	311312624	117154724	37.6	194157900	62.4	Warner Bros.	0	36133403	2 hr 2 min	Crime            Thriller	PG-13	2007
511	Little Fockers	310650585	148438600	47.8	162211985	52.2	Universal Pictures	100000000	30833665	1 hr 38 min	Comedy            Romance	PG-13	2010
512	Bolt	309979994	114053579	36.8	195926415	63.2	Walt Disney Studios Motion Pictures	150000000	26223128	1 hr 36 min	Adventure            Animation            Comedy            Crime            Drama            Family            Sci-Fi	PG	2008
513	Ransom	309492681	136492681	44.1	173000000	55.9	Walt Disney Studios Motion Pictures	0	34216088	2 hr 1 min	Action            Crime            Thriller	R	1996
514	Runaway Bride	309460292	152257509	49.2	157202783	50.8	Paramount Pictures	70000000	35055556	1 hr 56 min	Comedy            Romance	PG	1999
515	The Blind Side	309231694	255982860	82.8	53248834	17.2	Warner Bros.	29000000	34119372	2 hr 9 min	Biography            Drama            Sport	PG-13	2009
516	The Ex-File 3: Return of the Exes	307592427	838959	0.3	306753468	99.7	China Lion Film Distribution	0	125291	2 hr	Comedy            Romance	Not Rated	2017
517	The Fault in Our Stars	307166834	124872350	40.6	182294484	59.4	Twentieth Century Fox	12000000	48002523	2 hr 6 min	Drama            Romance	PG-13	2014
518	The Pursuit of Happyness	307127625	163566459	53.3	143561166	46.7	Sony Pictures Entertainment (SPE)	55000000	26541709	1 hr 57 min	Biography            Drama	PG-13	2006
519	Rise of the Guardians	306941670	103412758	33.7	203528912	66.3	DreamWorks	145000000	23773465	1 hr 37 min	Action            Adventure            Animation            Comedy            Drama            Family            Fantasy	PG	2012
520	Close Encounters of the Third Kind	306889114	135189114	44	171700000	56	Columbia Pictures	20000000	0	2 hr 18 min	Drama            Sci-Fi	Not Rated	1977
521	Chicago	306776732	170687518	55.6	136089214	44.4	Miramax	45000000	2074929	1 hr 53 min	Comedy            Crime            Musical	PG-13	2002
522	Annabelle: Creation	306515884	102092201	33.3	204423683	66.7	Warner Bros.	15000000	35006404	1 hr 49 min	Horror            Mystery            Thriller	R	2017
523	Bridesmaids	306442085	169106725	55.2	137335360	44.8	Universal Pictures	32500000	26247410	2 hr 5 min	Comedy            Romance	R	2011
524	Skyscraper	304868961	68420120	22.4	236448841	77.6	Universal Pictures	125000000	24905015	1 hr 42 min	Action            Adventure            Thriller	PG-13	2018
525	A Good Day to Die Hard	304654182	67349198	22.1	237304984	77.9	Twentieth Century Fox	92000000	24834845	1 hr 38 min	Action            Thriller	R	2013
526	Mulan	304320254	120620254	39.6	183700000	60.4	Walt Disney Studios Motion Pictures	0	22745143	1 hr 27 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            War	Not Rated	1998
527	Dangal	303723636	12391761	4.1	291331875	95.9	UTV Motion Pictures	0	3248481	2 hr 41 min	Action            Biography            Drama            Sport	Not Rated	2016
528	Indiana Jones and the Dial of Destiny	303552422	145628290	48	157924132	52	Walt Disney Studios Motion Pictures	0	60368101	2 hr 34 min	Action            Adventure	PG-13	2023
529	Passengers	303144152	100014699	33	203129453	67	Sony Pictures Entertainment (SPE)	110000000	14869736	1 hr 56 min	Drama            Romance            Sci-Fi            Thriller	PG-13	2016
530	Battleship	303025485	65422625	21.6	237602860	78.4	Universal Pictures	209000000	25534825	2 hr 11 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2012
531	Liar Liar	302710615	181410615	59.9	121300000	40.1	Universal Pictures	0	31423025	1 hr 26 min	Comedy            Fantasy	PG-13	1997
532	G.I. Joe: The Rise of Cobra	302469017	150201498	49.7	152267519	50.3	Paramount Pictures	175000000	54713046	1 hr 58 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2009
533	Wrath of the Titans	301970083	83670083	27.7	218300000	72.3	Warner Bros.	150000000	33457188	1 hr 39 min	Action            Adventure            Fantasy	PG-13	2012
534	Fantastic Four: Rise of the Silver Surfer	301913131	131921738	43.7	169991393	56.3	Twentieth Century Fox	130000000	58051684	1 hr 32 min	Action            Adventure            Fantasy            Sci-Fi	PG	2007
535	Hook	300854823	119654823	39.8	181200000	60.2	TriStar Pictures	70000000	13522535	2 hr 22 min	Adventure            Comedy            Family            Fantasy	Not Rated	1991
536	Superman	300478449	134478449	44.8	166000000	55.2	Warner Bros.	55000000	7465343	2 hr 23 min	Action            Adventure            Sci-Fi	PG	1978
537	Rocky IV	300473716	127873716	42.6	172600000	57.4	United Artists	0	19991537	1 hr 31 min	Drama            Sport	PG	1985
538	Rambo: First Blood Part II	300400432	150415432	50.1	149985000	49.9	TriStar Pictures	0	20176217	1 hr 36 min	Action            Adventure            Thriller	Not Rated	1985
539	Resident Evil: Afterlife	300228084	60128566	20	240099518	80	Screen Gems	60000000	26650264	1 hr 36 min	Action            Horror            Sci-Fi	R	2010
540	Van Helsing	300157638	120177084	40	179980554	60	Universal Pictures	160000000	51748040	2 hr 11 min	Action            Adventure            Fantasy            Thriller	PG-13	2004
541	Stuart Little	300135367	140035367	46.7	160100000	53.3	Sony Pictures Entertainment (SPE)	133000000	15018223	1 hr 24 min	Adventure            Comedy            Family            Fantasy	PG	1999
542	Beverly Hills Cop II	299965036	153665036	51.2	146300000	48.8	Paramount Pictures	0	26348555	1 hr 40 min	Action            Comedy            Crime            Thriller	Not Rated	1987
543	Alice Through the Looking Glass	299820798	77041381	25.7	222779417	74.3	Walt Disney Studios Motion Pictures	170000000	26858726	1 hr 53 min	Adventure            Family            Fantasy            Mystery	PG	2016
544	My Best Friend's Wedding	299288605	127120029	42.5	172168576	57.5	Sony Pictures Entertainment (SPE)	38000000	21678377	1 hr 45 min	Comedy            Drama            Romance	PG-13	1997
545	Real Steel	299268508	85468508	28.6	213800000	71.4	Walt Disney Studios Motion Pictures	0	27319677	2 hr 7 min	Action            Drama            Sci-Fi            Sport	PG-13	2011
546	Horton Hears a Who!	298572799	154529439	51.8	144043360	48.2	Twentieth Century Fox	85000000	45012998	1 hr 26 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Music	Not Rated	2008
547	Ocean's Eight	297795726	140295726	47.1	157500000	52.9	Warner Bros.	70000000	41607378	1 hr 50 min	Action            Comedy            Crime	PG-13	2018
548	A Quiet Place Part II	297372261	160072261	53.8	137300000	46.2	Paramount Pictures	0	47547231	1 hr 37 min	Drama            Horror            Sci-Fi            Thriller	PG-13	2021
549	The Divergent Series: Insurgent	297002527	130179072	43.8	166823455	56.2	Lionsgate	110000000	52263680	1 hr 59 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2015
550	Look Who's Talking	296999813	140088813	47.2	156911000	52.8	TriStar Pictures	0	12107784	1 hr 33 min	Comedy	Not Rated	1989
551	Austin Powers in Goldmember	296938801	213307889	71.8	83630912	28.2	New Line Cinema	63000000	73071188	1 hr 34 min	Action            Adventure            Comedy            Crime	PG-13	2002
552	Ghostbusters	296578797	243578797	82.1	53000000	17.9	Columbia Pictures	30000000	13578151	1 hr 45 min	Action            Comedy            Fantasy            Sci-Fi	Not Rated	1984
553	Miss Peregrine's Home for Peculiar Children	296482446	87242834	29.4	209239612	70.6	Twentieth Century Fox	110000000	28871140	2 hr 7 min	Adventure            Drama            Family            Fantasy            Thriller	PG-13	2016
554	X-Men	296339528	157299718	53.1	139039810	46.9	Twentieth Century Fox	75000000	54471475	1 hr 44 min	Action            Adventure            Sci-Fi	PG-13	2000
555	Ferdinand	296069199	84410380	28.5	211658819	71.5	Twentieth Century Fox	111000000	13401586	1 hr 48 min	Adventure            Animation            Comedy            Drama            Family	PG	2017
556	Shutter Island	294805697	128012934	43.4	166792763	56.6	Paramount Pictures	80000000	41062440	2 hr 18 min	Mystery            Thriller	R	2010
557	Doctor Dolittle	294456605	144156605	49	150300000	51	Twentieth Century Fox	0	29014324	1 hr 25 min	Comedy            Family            Fantasy	PG-13	1998
558	Bee Movie	293514336	126631277	43.1	166883059	56.9	DreamWorks	150000000	38021044	1 hr 31 min	Adventure            Animation            Comedy            Drama            Family	PG	2007
559	Salt	293503354	118311368	40.3	175191986	59.7	Sony Pictures Entertainment (SPE)	110000000	36011243	1 hr 40 min	Action            Thriller	PG-13	2010
560	G-Force	292817898	119436770	40.8	173381128	59.2	Walt Disney Studios Motion Pictures	150000000	31706934	1 hr 28 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2009
561	The Departed	291480452	132399394	45.4	159081058	54.6	Warner Bros.	90000000	26887467	2 hr 31 min	Crime            Drama            Thriller	R	2006
562	What Lies Beneath	291420351	155464351	53.4	135956000	46.6	DreamWorks Distribution	100000000	29702959	2 hr 10 min	Drama            Horror            Mystery            Thriller	PG-13	2000
563	Pacific Rim: Uprising	290930148	59874525	20.6	231055623	79.4	Universal Pictures	150000000	28116535	1 hr 51 min	Action            Adventure            Fantasy            Horror            Sci-Fi            Thriller	PG-13	2018
788	Too Cool to Kill	217254604	185882	0.1	217068722	99.9	Well Go USA Entertainment	0	72432	1 hr 49 min	Comedy	Not Rated	2022
564	The Bourne Supremacy	290835269	176241941	60.6	114593328	39.4	Universal Pictures	75000000	52521865	1 hr 48 min	Action            Mystery            Thriller	PG-13	2004
565	Sex and the City 2	290745055	95347692	32.8	195397363	67.2	Warner Bros.	100000000	31001870	2 hr 26 min	Comedy            Drama            Romance	R	2010
566	Shakespeare in Love	289317794	100317794	34.7	189000000	65.3	Miramax	25000000	224012	2 hr 3 min	Comedy            Drama            History            Romance	R	1998
567	Divergent	288885818	150947895	52.2	137937923	47.8	Lionsgate	85000000	54607747	2 hr 19 min	Action            Adventure            Mystery            Sci-Fi	PG-13	2014
568	Coming to America	288752301	128152301	44.4	160600000	55.6	Paramount Pictures	0	21404420	1 hr 57 min	Comedy            Romance	Not Rated	1988
569	Elvis	288670284	151040048	52.3	137630236	47.7	Warner Bros.	0	31211579	2 hr 39 min	Biography            Drama            Music	PG-13	2022
570	Wedding Crashers	288485135	209273411	72.5	79211724	27.5	New Line Cinema	40000000	32200000	1 hr 59 min	Comedy            Romance	R	2005
571	Maze Runner: The Death Cure	288175335	58032443	20.1	230142892	79.9	Twentieth Century Fox	62000000	24167011	2 hr 23 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2018
572	Casper	287928194	100328194	34.8	187600000	65.2	Universal Pictures	0	16840385	1 hr 40 min	Comedy            Family            Fantasy	PG	1995
573	American Pie 2	287553595	145103595	50.5	142450000	49.5	Universal Pictures	30000000	45117985	1 hr 48 min	Comedy	R	2001
574	Pitch Perfect 2	287144079	184296230	64.2	102847849	35.8	Universal Pictures	29000000	69216890	1 hr 55 min	Comedy            Music	PG-13	2015
575	The Green Mile	286801374	136801374	47.7	150000000	52.3	Warner Bros.	60000000	18017152	3 hr 9 min	Crime            Drama            Fantasy            Mystery	R	1999
576	Oblivion	286168572	89107235	31.1	197061337	68.9	Universal Pictures	120000000	37054485	2 hr 4 min	Action            Adventure            Sci-Fi	PG-13	2013
577	Elysium	286140700	93050117	32.5	193090583	67.5	TriStar Pictures	115000000	29807393	1 hr 49 min	Action            Drama            Sci-Fi            Thriller	R	2013
578	Lethal Weapon 4	285444603	130444603	45.7	155000000	54.3	Warner Bros.	140000000	34048124	2 hr 7 min	Action            Crime            Thriller	R	1998
579	John Carter	284139100	73078100	25.7	211061000	74.3	Walt Disney Studios Motion Pictures	250000000	30180188	2 hr 12 min	Action            Adventure            Sci-Fi	PG-13	2012
580	Turbo	282570682	83028128	29.4	199542554	70.6	Twentieth Century Fox	135000000	21312625	1 hr 36 min	Adventure            Animation            Comedy            Family            Sport	PG	2013
581	Paddington	282422653	76271832	27	206150821	73		55000000	18966676	1 hr 35 min	Adventure            Comedy            Family            Fantasy	PG	2014
582	The Tourist	278780441	67631157	24.3	211149284	75.7	Sony Pictures Entertainment (SPE)	100000000	16472458	1 hr 43 min	Action            Thriller	PG-13	2010
583	Split	278454417	138291365	49.7	140163052	50.3	Universal Pictures	9000000	40010975	1 hr 57 min	Horror            Thriller	PG-13	2017
584	Scary Movie	278019771	157019771	56.5	121000000	43.5	Miramax	19000000	42346669	1 hr 28 min	Comedy	R	2000
585	xXx	277448382	142109382	51.2	135339000	48.8	Revolution Studios	70000000	44506103	2 hr 4 min	Action            Adventure            Thriller	PG-13	2002
586	The Bourne Legacy	276144750	113203870	41	162940880	59	Universal Pictures	125000000	38142825	2 hr 15 min	Action            Adventure            Thriller	PG-13	2012
587	Mr. Peabody & Sherman	275698039	111506430	40.4	164191609	59.6	Twentieth Century Fox	145000000	32207057	1 hr 32 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            History            Sci-Fi	PG	2014
588	Scooby-Doo	275678613	153322074	55.6	122356539	44.4	Warner Bros.	84000000	54155312	1 hr 29 min	Adventure            Comedy            Family            Fantasy            Mystery	PG	2002
589	Lincoln	275293450	182207973	66.2	93085477	33.8	Walt Disney Studios Motion Pictures	65000000	944308	2 hr 30 min	Biography            Drama            History            War	PG-13	2012
590	Creed III	275248615	156248615	56.8	119000000	43.2	United Artists Releasing	0	58370007	1 hr 56 min	Drama            Sport	PG-13	2023
591	Lara Croft: Tomb Raider	274703340	131168070	47.8	143535270	52.2	Paramount Pictures	115000000	47735743	1 hr 40 min	Action            Adventure            Fantasy            Thriller	PG-13	2001
592	Tomb Raider	274650803	58250803	21.2	216400000	78.8	Warner Bros.	94000000	23633317	1 hr 59 min	Action            Adventure            Fantasy            Thriller	PG-13	2018
593	The Expendables	274470394	103068524	37.6	171401870	62.4	Lionsgate	80000000	34825135	1 hr 43 min	Action            Adventure            Thriller	R	2010
594	Cloudy with a Chance of Meatballs 2	274325949	119793567	43.7	154532382	56.3	Sony Pictures Entertainment (SPE)	78000000	34017930	1 hr 35 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2013
595	The Nutty Professor	273961019	128814019	47	145147000	53	Universal Pictures	54000000	25411725	1 hr 35 min	Comedy            Romance            Sci-Fi	PG-13	1996
596	Jerry Maguire	273552592	153952592	56.3	119600000	43.7	Sony Pictures Entertainment (SPE)	50000000	17084296	2 hr 19 min	Comedy            Drama            Romance            Sport	R	1996
597	Bad Boys II	273339556	138608444	50.7	134731112	49.3	Sony Pictures Entertainment (SPE)	130000000	46522560	2 hr 27 min	Action            Comedy            Crime            Thriller	R	2003
598	Lilo & Stitch	273144151	145794338	53.4	127349813	46.6	Walt Disney Studios Motion Pictures	80000000	35260212	1 hr 25 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Sci-Fi	PG	2002
599	The Silence of the Lambs	272742922	130742922	47.9	142000000	52.1	Orion Pictures	19000000	13766814	1 hr 58 min	Crime            Drama            Thriller	Not Rated	1991
600	Grown Ups	271457301	162001186	59.7	109456115	40.3	Sony Pictures Entertainment (SPE)	80000000	40506562	1 hr 42 min	Comedy	PG-13	2010
601	Neighbors	270665134	150157400	55.5	120507734	44.5	Universal Pictures	18000000	49033915	1 hr 37 min	Comedy	R	2014
602	The Firm	270248367	158348367	58.6	111900000	41.4	Paramount Pictures	0	25400000	2 hr 34 min	Drama            Mystery            Thriller	R	1993
603	We're the Millers	269994119	150394119	55.7	119600000	44.3	Warner Bros.	37000000	26419396	1 hr 50 min	Comedy            Crime	R	2012
604	Gran Torino	269958228	148095302	54.9	121862926	45.1	Warner Bros.	33000000	271720	1 hr 56 min	Drama	R	2008
605	10,000 BC	269784201	94784201	35.1	175000000	64.9	Warner Bros.	105000000	35867488	1 hr 49 min	Action            Adventure            Drama            Fantasy            History	PG-13	2008
606	American Gangster	269755430	130164645	48.2	139590785	51.8	Universal Pictures	100000000	43565135	2 hr 37 min	Biography            Crime            Drama	R	2007
607	Epic	268426634	107518682	40.1	160907952	59.9	Twentieth Century Fox	100000000	33531068	1 hr 42 min	Action            Adventure            Animation            Family            Fantasy            Mystery	PG	2013
608	Exodus: Gods and Kings	268175631	65014513	24.2	203161118	75.8	Twentieth Century Fox	140000000	24115934	2 hr 30 min	Action            Adventure            Drama            Fantasy	PG-13	2014
609	Blade Runner 2049	267770708	92071675	34.4	175699033	65.6	Warner Bros.	150000000	32753122	2 hr 44 min	Action            Drama            Mystery            Sci-Fi            Thriller	R	2017
610	Bambi	267447150	102247150	38.2	165200000	61.8	RKO Radio Pictures	0	0	1 hr 9 min	Adventure            Animation            Drama            Family	G	1942
611	The Flash	267237037	106837037	40	160400000	60	Warner Bros.	0	55043679	2 hr 24 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2023
612	The Princess and the Frog	267045765	104400899	39.1	162644866	60.9	Walt Disney Studios Motion Pictures	105000000	786190	1 hr 37 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	Not Rated	2009
613	Batman Returns	266915287	162924631	61	103990656	39	Warner Bros.	80000000	45687711	2 hr 6 min	Action            Crime            Fantasy	PG-13	1992
614	Indecent Proposal	266614059	106614059	40	160000000	60	Paramount Pictures	0	18387632	1 hr 57 min	Drama            Romance	R	1993
615	Something's Gotta Give	265328738	124728738	47	140600000	53	Sony Pictures Entertainment (SPE)	80000000	16064723	2 hr 8 min	Comedy            Drama            Romance	PG-13	2003
616	Bridget Jones: The Edge of Reason	265126918	40226215	15.2	224900703	84.8	Universal Pictures	40000000	8684055	1 hr 48 min	Comedy            Drama            Romance	R	2004
617	The Incredible Hulk	264770996	134806913	50.9	129964083	49.1	Universal Pictures	150000000	55414050	1 hr 52 min	Action            Adventure            Sci-Fi	PG-13	2008
618	Waterworld	264218220	88246220	33.4	175972000	66.6	Universal Pictures	175000000	21171780	2 hr 15 min	Action            Adventure            Sci-Fi	PG-13	1995
619	The Truman Show	264118712	125618201	47.6	138500511	52.4	Paramount Pictures	0	31542121	1 hr 43 min	Comedy            Drama	PG	1998
620	Charlie's Angels	264105545	125305545	47.4	138800000	52.6	Sony Pictures Entertainment (SPE)	93000000	40128550	1 hr 38 min	Action            Adventure            Comedy            Crime            Thriller	PG-13	2000
621	The Fifth Element	263920180	63820180	24.2	200100000	75.8	Sony Pictures Entertainment (SPE)	0	17031345	2 hr 6 min	Action            Adventure            Sci-Fi	PG-13	1997
622	Jumanji	262821940	100499940	38.2	162322000	61.8	Sony Pictures Entertainment (SPE)	65000000	11084370	1 hr 44 min	Adventure            Comedy            Family            Fantasy	PG	1995
623	Parasite	262681282	53369749	20.3	209311533	79.7	Neon	11400000	393216	2 hr 12 min	Drama            Thriller	R	2019
624	Borat	262552893	128505958	48.9	134046935	51.1	Twentieth Century Fox	18000000	26455463	1 hr 24 min	Comedy	R	2006
625	Robots	262511490	128200012	48.8	134311478	51.2	Twentieth Century Fox	75000000	36045301	1 hr 31 min	Adventure            Animation            Comedy            Family            Romance            Sci-Fi	PG	2005
626	Knight and Day	261989769	76423035	29.2	185566734	70.8	Unknown	117000000	0	1 hr 49 min	Action            Adventure            Comedy	PG-13	2008
627	Total Recall	261317921	119412921	45.7	141905000	54.3	Sony Pictures Entertainment (SPE)	65000000	25533700	1 hr 53 min	Action            Adventure            Sci-Fi	Not Rated	1990
628	This Is It	261183588	72091016	27.6	189092572	72.4	Sony Pictures Entertainment (SPE)	0	23234394	1 hr 51 min	Documentary            Drama            Music	PG	2009
629	Terminator: Dark Fate	261119292	62253077	23.8	198866215	76.2	Paramount Pictures	185000000	29033832	2 hr 8 min	Action            Adventure            Sci-Fi	R	2019
630	The Lone Ranger	260502115	89302115	34.3	171200000	65.7	Walt Disney Studios Motion Pictures	215000000	29210849	2 hr 30 min	Action            Adventure            Western	PG-13	2013
631	Super 8	260095986	127004179	48.8	133091807	51.2	Paramount Pictures	50000000	35451168	1 hr 52 min	Action            Mystery            Sci-Fi            Thriller	PG-13	2011
632	Halloween	259939835	159342015	61.3	100597820	38.7	Universal Pictures	10000000	76221545	1 hr 46 min	Crime            Horror            Thriller	R	2018
633	Mojin: The Lost Legend	259368448	1243810	0.5	258124638	99.5	Well Go USA Entertainment	37000000	279974	2 hr 7 min	Action            Adventure            Drama            Fantasy            Horror            Mystery            Thriller	Not Rated	2015
634	Charlie's Angels: Full Throttle	259175788	100830111	38.9	158345677	61.1	Sony Pictures Entertainment (SPE)	120000000	37634221	1 hr 46 min	Action            Adventure            Comedy            Crime	PG-13	2003
635	Rush Hour 3	258097122	140125968	54.3	117971154	45.7	New Line Cinema	140000000	50237000	1 hr 31 min	Action            Comedy            Crime            Thriller	PG-13	2007
636	The Full Monty	257938649	45950122	17.8	211988527	82.2		3500000	176585	1 hr 31 min	Comedy            Drama	R	1997
637	Kung Fu Yoga	257753889	362657	0.1	257391232	99.9	Well Go USA Entertainment	65000000	111979	1 hr 47 min	Action            Adventure            Comedy            Family            Fantasy            Mystery	Not Rated	2017
638	Annabelle	257589721	84284252	32.7	173305469	67.3	Warner Bros.	6500000	37134255	1 hr 39 min	Horror            Mystery            Thriller	R	2014
639	Encanto	256786742	96093622	37.4	160693120	62.6	Walt Disney Studios Motion Pictures	0	27206494	1 hr 42 min	Animation            Comedy            Family            Fantasy            Musical	PG	2021
640	The Village	256697520	114197520	44.5	142500000	55.5	Walt Disney Studios Motion Pictures	60000000	50746142	1 hr 48 min	Drama            Mystery            Thriller	PG-13	2003
641	Lost in Hong Kong	256283912	1302281	0.5	254981631	99.5	Well Go USA Entertainment	0	537736	1 hr 54 min	Action            Adventure            Comedy            Crime            Family            Romance            Thriller	Not Rated	2015
642	Erin Brockovich	256271286	125595205	49	130676081	51	Universal Pictures	52000000	28138465	2 hr 11 min	Biography            Drama	R	2000
643	Us	256067149	175084580	68.4	80982569	31.6	Universal Pictures	20000000	71117625	1 hr 56 min	Horror            Mystery            Thriller	R	2019
644	Pegasus	255863112	0	0	255863112	100	Unknown	0	0	1 hr 38 min	Comedy            Sport	Not Rated	2019
645	Get Out	255745157	176196665	68.9	79548492	31.1	Unknown	4500000	0	1 hr 44 min	Horror            Mystery            Thriller	R	2016
646	Marley & Me	255743093	143153751	56	112589342	44	Twentieth Century Fox	0	36357586	1 hr 51 min	Drama            Family	PG	2008
647	Cliffhanger	255000211	84049211	33	170951000	67	TriStar Pictures	70000000	16176967	1 hr 53 min	Action            Adventure            Thriller	R	1993
648	Baahubali 2: The Conclusion	254158390	20186659	7.9	233971731	92.1	Great India Films	0	10430497	2 hr 47 min	Action            Drama	Not Rated	2017
649	Babe	254134910	63658910	25	190476000	75	Universal Pictures	0	8742545	1 hr 31 min	Comedy            Drama            Family	Not Rated	1995
650	Men in Black: International	253890701	80001807	31.5	173888894	68.5	Sony Pictures Entertainment (SPE)	110000000	30035838	1 hr 54 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2019
651	Wild Hogs	253625427	168273550	66.4	85351877	33.6	Walt Disney Studios Motion Pictures	0	39699023	1 hr 40 min	Action            Adventure            Comedy	PG-13	2007
652	High School Musical 3: Senior Year	252909177	90559416	35.8	162349761	64.2	Walt Disney Studios Motion Pictures	11000000	42030184	1 hr 52 min	Comedy            Drama            Family            Music            Musical            Romance	G	2008
653	Hercules	252712101	99112101	39.2	153600000	60.8	Walt Disney Studios Motion Pictures	85000000	249567	1 hr 33 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	Not Rated	1997
654	X-Men: Dark Phoenix	252442974	65845974	26.1	186597000	73.9	Twentieth Century Fox	200000000	32828348	1 hr 53 min	Action            Adventure            Sci-Fi	PG-13	2019
655	True Grit	252276927	171243005	67.9	81033922	32.1	Paramount Pictures	38000000	24830443	1 hr 50 min	Drama            Western	PG-13	2010
656	Dolittle	251410631	77047065	30.6	174363566	69.4	Universal Pictures	175000000	21844045	1 hr 41 min	Adventure            Comedy            Family            Fantasy	PG	2020
657	Bean	251212670	45319423	18	205893247	82	Gramercy Pictures (I)	18000000	2255233	1 hr 29 min	Adventure            Comedy            Family	PG-13	1997
658	American Hustle	251171807	150117807	59.8	101054000	40.2	Sony Pictures Entertainment (SPE)	40000000	740455	2 hr 18 min	Crime            Drama	R	2013
659	Enemy of the State	250849789	111549836	44.5	139299953	55.5	Walt Disney Studios Motion Pictures	90000000	20038573	2 hr 12 min	Action            Thriller	R	1998
660	You've Got Mail	250821495	115821495	46.2	135000000	53.8	Warner Bros.	65000000	18426749	1 hr 59 min	Comedy            Drama            Romance	PG	1998
661	Eragon	250425512	75030163	30	175395349	70	Twentieth Century Fox	100000000	23239907	1 hr 44 min	Action            Adventure            Family            Fantasy	PG	2006
662	Brother Bear	250397798	85336277	34.1	165061521	65.9	Walt Disney Studios Motion Pictures	0	291940	1 hr 25 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Musical	Not Rated	2003
663	The Godfather	250341816	136381073	54.5	113960743	45.5	Paramount Pictures	6000000	302393	2 hr 55 min	Crime            Drama	Not Rated	1972
664	The Mask of Zorro	250288523	94095523	37.6	156193000	62.4	Sony Pictures Entertainment (SPE)	95000000	22525855	2 hr 16 min	Action            Adventure            Comedy            Romance            Thriller            Western	PG-13	1998
665	The Bad Guys	250162278	97233630	38.9	152928648	61.1	Universal Pictures	0	23950245	1 hr 40 min	Adventure            Animation            Comedy            Crime            Family	PG	2022
666	The Ring	249348933	129128133	51.8	120220800	48.2	DreamWorks Distribution	48000000	15015393	1 hr 55 min	Horror            Mystery	PG-13	2002
667	The Blair Witch Project	248639099	140539099	56.5	108100000	43.5	Artisan Entertainment	60000	1512054	1 hr 21 min	Horror            Mystery	R	1999
668	Unbreakable	248118121	95011339	38.3	153106782	61.7	Walt Disney Studios Motion Pictures	75000000	30330771	1 hr 46 min	Drama            Mystery            Sci-Fi            Thriller	PG-13	2000
669	Love Actually	247933248	59696144	24.1	188237104	75.9	Universal Pictures	40000000	6886080	2 hr 15 min	Comedy            Drama            Romance	R	2003
670	Journey to the West: The Demons Strike Back	247585244	880346	0.4	246704898	99.6	Sony Pictures Entertainment (SPE)	0	463883	1 hr 49 min	Adventure            Comedy            Fantasy	PG-13	2017
671	Dumb and Dumber	247290327	127190327	51.4	120100000	48.6	New Line Cinema	17000000	16363442	1 hr 47 min	Comedy	Not Rated	1994
672	Glass	246999039	111048468	45	135950571	55	Universal Pictures	20000000	40328920	2 hr 9 min	Drama            Horror            Sci-Fi            Thriller	PG-13	2019
673	Grown Ups 2	246984278	133668525	54.1	113315753	45.9	Sony Pictures Entertainment (SPE)	80000000	41508572	1 hr 41 min	Comedy	PG-13	2013
674	The Peanuts Movie	246233113	130178411	52.9	116054702	47.1	Twentieth Century Fox	99000000	44213073	1 hr 28 min	Adventure            Animation            Comedy            Drama            Family	G	2015
712	2 Fast 2 Furious	236350661	127154901	53.8	109195760	46.2	Universal Pictures	76000000	50472480	1 hr 47 min	Action            Crime            Thriller	PG-13	2003
675	Rango	245724603	123477607	50.2	122246996	49.8	Paramount Pictures	135000000	38079323	1 hr 47 min	Action            Adventure            Animation            Comedy            Family            Western	PG	2011
676	Four Weddings and a Funeral	245700832	52700832	21.4	193000000	78.6	Gramercy Pictures (I)	4400000	138486	1 hr 57 min	Comedy            Drama            Romance	R	1994
677	Face/Off	245676146	112276146	45.7	133400000	54.3	Paramount Pictures	80000000	23387530	2 hr 18 min	Action            Crime            Sci-Fi            Thriller	R	1997
678	Teenage Mutant Ninja Turtles: Out of the Shadows	245623848	82051601	33.4	163572247	66.6	Paramount Pictures	135000000	35316382	1 hr 52 min	Action            Adventure            Comedy            Sci-Fi	PG-13	2016
679	Dark Shadows	245527149	79727149	32.5	165800000	67.5	Warner Bros.	150000000	29685274	1 hr 53 min	Comedy            Fantasy            Horror	PG-13	2012
680	Hulk	245285165	132177234	53.9	113107931	46.1	Universal Pictures	137000000	62128420	2 hr 18 min	Action            Sci-Fi	PG-13	2003
681	The Bravest	245179562	290217	0.1	244889345	99.9	Sony Pictures Entertainment (SPE)	0	110375	1 hr 58 min	Action            Drama	PG-13	2019
682	Welcome to the Sticks	245144417	0	0	245144417	100		0	0	1 hr 46 min	Comedy            Romance	Not Rated	2008
683	Back to the Future Part III	245077583	88277583	36	156800000	64	Universal Pictures	40000000	19089645	1 hr 58 min	Adventure            Comedy            Sci-Fi            Western	Not Rated	1990
684	Pixels	244874809	78747585	32.2	166127224	67.8	Sony Pictures Entertainment (SPE)	88000000	24011616	1 hr 45 min	Action            Comedy            Fantasy            Sci-Fi	PG-13	2015
685	Hercules	244819862	72688614	29.7	172131248	70.3	Paramount Pictures	100000000	29800263	1 hr 38 min	Action            Adventure            Fantasy	PG-13	2014
686	Rush Hour	244721064	141186864	57.7	103534200	42.3	New Line Cinema	33000000	33001803	1 hr 38 min	Action            Comedy            Crime            Thriller	PG-13	1998
687	Journey to the Center of the Earth	244232688	101704370	41.6	142528318	58.4	Warner Bros.	60000000	21018141	1 hr 33 min	Action            Adventure            Family            Fantasy            Sci-Fi	PG	2008
688	After Earth	243611982	60522097	24.8	183089885	75.2	Sony Pictures Entertainment (SPE)	130000000	27520040	1 hr 40 min	Action            Adventure            Sci-Fi	PG-13	2013
689	A Few Good Men	243240178	141340178	58.1	101900000	41.9	Columbia Pictures	41000000	15517468	2 hr 18 min	Drama            Thriller	R	1992
690	Cloudy with a Chance of Meatballs	243006126	124870275	51.4	118135851	48.6	Sony Pictures Entertainment (SPE)	100000000	30304648	1 hr 30 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2009
691	8 Mile	242875078	116750901	48.1	126124177	51.9	Universal Pictures	41000000	51240555	1 hr 50 min	Drama            Music	R	2002
692	Daddy's Home	242786137	150357137	61.9	92429000	38.1	Paramount Pictures	0	38740203	1 hr 36 min	Comedy            Family	PG-13	2015
693	RoboCop	242688965	58607007	24.2	184081958	75.8	Sony Pictures Entertainment (SPE)	100000000	21681430	1 hr 57 min	Action            Crime            Sci-Fi            Thriller	PG-13	2014
694	Eraser	242295562	101295562	41.8	141000000	58.2	Warner Bros.	100000000	24566446	1 hr 55 min	Action            Crime            Thriller	R	1996
695	Alien: Covenant	240891763	74262031	30.8	166629732	69.2	Twentieth Century Fox	97000000	36160621	2 hr 2 min	Horror            Sci-Fi            Thriller	R	2017
696	Sully	240797623	125070033	51.9	115727590	48.1	Warner Bros.	60000000	35028301	1 hr 36 min	Biography            Drama	PG-13	2016
697	Assassin's Creed	240697856	54647948	22.7	186049908	77.3	Twentieth Century Fox	125000000	10278225	1 hr 55 min	Action            Adventure            Sci-Fi	PG-13	2016
698	Click	240685326	137355633	57.1	103329693	42.9	Revolution Studios	82500000	40011365	1 hr 47 min	Comedy            Drama            Fantasy            Romance	PG-13	2006
699	Legend of Deification	240646355	214670	0.1	240431685	99.9	Well Go USA Entertainment	0	0	1 hr 50 min	Action            Adventure            Animation            Drama            Family            Fantasy	Not Rated	2020
700	Planes	240171783	90288712	37.6	149883071	62.4	Walt Disney Studios Motion Pictures	50000000	22232291	1 hr 31 min	Adventure            Animation            Comedy            Family            Sport	PG	2013
701	Resident Evil: Retribution	240159255	42345531	17.6	197813724	82.4	Screen Gems	65000000	21052227	1 hr 35 min	Action            Horror            Sci-Fi            Thriller	R	2012
702	Die Hard 2	240031274	117540947	49	122490327	51	Twentieth Century Fox	70000000	21744661	2 hr 4 min	Action            Thriller	Not Rated	1990
703	Crocodile Dundee II	239606210	109306210	45.6	130300000	54.4	Paramount Pictures	0	24462976	1 hr 48 min	Action            Adventure            Comedy	Not Rated	1988
704	Bullet Train	239268602	103368602	43.2	135900000	56.8	Sony Pictures Entertainment (SPE)	0	30030156	2 hr 7 min	Action            Comedy            Thriller	R	2022
705	Crazy Rich Asians	238843729	174837452	73.2	64006277	26.8	Warner Bros.	30000000	26510140	2 hr	Comedy            Drama            Romance	PG-13	2018
706	Batman & Robin	238235719	107353792	45.1	130881927	54.9	Warner Bros.	125000000	42872605	2 hr 5 min	Action            Sci-Fi	PG-13	1997
707	Howl's Moving Castle	237536126	6789268	2.9	230746858	97.1	Walt Disney Studios Motion Pictures	0	427987	1 hr 59 min	Adventure            Animation            Family            Fantasy	PG	2004
708	Gulliver's Travels	237382724	42779261	18	194603463	82	Twentieth Century Fox	112000000	6307691	1 hr 25 min	Adventure            Comedy            Family            Fantasy	PG	2010
709	Gone in 60 Seconds	237202299	101648571	42.8	135553728	57.2	Walt Disney Studios Motion Pictures	90000000	25336048	1 hr 58 min	Action            Crime            Thriller	PG-13	2000
710	Saturday Night Fever	237113184	94213184	39.7	142900000	60.3	Paramount Pictures	0	3878099	1 hr 58 min	Drama            Music	R	1977
711	Silver Linings Playbook	236412453	132092958	55.9	104319495	44.1	The Weinstein Company	21000000	443003	2 hr 2 min	Comedy            Drama            Romance	R	2012
713	Hidden Figures	235956898	169607287	71.9	66349611	28.1	Twentieth Century Fox	25000000	515499	2 hr 7 min	Biography            Drama            History	PG	2016
714	A.I. Artificial Intelligence	235926552	78616689	33.3	157309863	66.7	Warner Bros.	100000000	29352630	2 hr 26 min	Drama            Sci-Fi	PG-13	2001
715	Dead Poets Society	235860116	95860116	40.6	140000000	59.4	Walt Disney Studios Motion Pictures	0	340456	2 hr 8 min	Comedy            Drama	Not Rated	1989
716	Spy	235666219	110825712	47	124840507	53	Twentieth Century Fox	65000000	29085719	2 hr	Action            Comedy	R	2015
717	American Pie	235483004	102561004	43.6	132922000	56.4	Universal Pictures	11000000	18709680	1 hr 35 min	Comedy	R	1999
718	American Reunion	234989584	57011521	24.3	177978063	75.7	Universal Pictures	50000000	21514080	1 hr 53 min	Comedy	R	2012
719	Big Daddy	234801895	163479795	69.6	71322100	30.4	Sony Pictures Entertainment (SPE)	34200000	41536370	1 hr 33 min	Comedy            Drama	PG-13	1999
720	Alvin and the Chipmunks: The Road Chip	234798636	85886987	36.6	148911649	63.4	Twentieth Century Fox	0	14287159	1 hr 32 min	Adventure            Animation            Comedy            Family            Fantasy            Music            Musical	PG	2015
721	Mission: Impossible - Dead Reckoning Part One	234091897	78491897	33.5	155600000	66.5	Paramount Pictures	0	54688347	2 hr 43 min	Action            Adventure            Thriller	PG-13	2023
722	The Imitation Game	233555708	91125683	39	142430025	61	The Weinstein Company	0	479352	1 hr 54 min	Biography            Drama            Thriller            War	PG-13	2014
723	Cruella	233503234	86103234	36.9	147400000	63.1	Walt Disney Studios Motion Pictures	0	21496997	2 hr 14 min	Adventure            Comedy            Crime            Drama	PG-13	2021
724	The Day the Earth Stood Still	233093859	79366978	34	153726881	66	Twentieth Century Fox	80000000	30480153	1 hr 44 min	Adventure            Drama            Sci-Fi            Thriller	PG-13	2008
725	American Wedding	232722935	104565114	44.9	128157821	55.1	Universal Pictures	55000000	33369440	1 hr 36 min	Comedy	R	2003
726	The Girl with the Dragon Tattoo	232617430	102515793	44.1	130101637	55.9	Sony Pictures Entertainment (SPE)	90000000	12768604	2 hr 38 min	Crime            Drama            Mystery            Thriller	R	2011
727	Juno	232372681	143495265	61.8	88877416	38.2		7500000	413869	1 hr 36 min	Comedy            Drama	PG-13	2007
728	Argo	232325503	136025503	58.6	96300000	41.4	Warner Bros.	44500000	19458109	2 hr	Biography            Drama            Thriller	R	2012
729	Mr. Bean's Holiday	232225908	33302167	14.3	198923741	85.7	Universal Pictures	0	9889780	1 hr 30 min	Comedy            Family	G	2007
730	The English Patient	231976425	78676425	33.9	153300000	66.1	Miramax	27000000	278439	2 hr 42 min	Drama            Romance            War	R	1996
731	Sister Act	231605150	139605150	60.3	92000000	39.7	Walt Disney Studios Motion Pictures	0	11894587	1 hr 40 min	Comedy            Family            Music	PG	1992
732	Annabelle Comes Home	231252591	74152591	32.1	157100000	67.9	Warner Bros.	30000000	20269723	1 hr 46 min	Horror            Mystery            Thriller	R	2019
733	Constantine	230884728	75976178	32.9	154908550	67.1	Warner Bros.	100000000	29769098	2 hr 1 min	Action            Fantasy            Horror            Mystery	R	2005
734	Get Smart	230685453	130319208	56.5	100366245	43.5	Warner Bros.	80000000	38683480	1 hr 50 min	Action            Adventure            Comedy	PG-13	2008
735	Space Jam	230594962	90594962	39.3	140000000	60.7	Warner Bros.	0	27528529	1 hr 28 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi            Sport	PG	1996
736	Life Is Beautiful	230099013	57563264	25	172535749	75	Miramax	0	118920	1 hr 56 min	Comedy            Drama            Romance            War	PG-13	1998
737	The Heat	229930771	159582188	69.4	70348583	30.6	Twentieth Century Fox	43000000	39115043	1 hr 57 min	Action            Comedy            Crime	R	2013
738	Ghostbusters	229147509	128350574	56	100796935	44	Sony Pictures Entertainment (SPE)	144000000	46018755	1 hr 57 min	Action            Comedy            Fantasy            Sci-Fi	PG-13	2016
739	Ghost Rider	228738393	115802596	50.6	112935797	49.4	Sony Pictures Entertainment (SPE)	110000000	45388836	1 hr 50 min	Action            Fantasy            Thriller	PG-13	2007
740	Goodbye Mr. Loser	228122928	1293626	0.6	226829302	99.4	China Lion Film Distribution	0	363949	1 hr 44 min	Comedy            Drama            Fantasy            Romance	Not Rated	2015
741	Paddington 2	227994792	40907738	17.9	187087054	82.1	Warner Bros.	0	11001961	1 hr 43 min	Adventure            Comedy            Family            Fantasy	PG	2017
742	Sleepless in Seattle	227927165	126808165	55.6	101119000	44.4	TriStar Pictures	21000000	17253733	1 hr 45 min	Comedy            Drama            Romance	PG	1993
743	Lethal Weapon 2	227853986	147253986	64.6	80600000	35.4	Warner Bros.	0	20388800	1 hr 54 min	Action            Crime            Thriller	R	1989
744	The Green Hornet	227817248	98780042	43.4	129037206	56.6	Sony Pictures Entertainment (SPE)	120000000	33526876	1 hr 59 min	Action            Comedy            Crime	PG-13	2011
745	Out of Africa	227514205	87071205	38.3	140443000	61.7	Universal Pictures	0	3637290	2 hr 41 min	Biography            Drama            Romance	Not Rated	1985
746	Elf	227356156	178053220	78.3	49302936	21.7	New Line Cinema	33000000	32100000	1 hr 37 min	Adventure            Comedy            Family            Fantasy            Romance	PG	2003
747	Youth	227091290	1891956	0.8	225199334	99.2	China Lion Film Distribution	0	338604	2 hr 15 min	Drama            Romance            War	Not Rated	2017
748	Baby Driver	226945087	107825862	47.5	119119225	52.5	TriStar Pictures	34000000	20553320	1 hr 53 min	Action            Crime            Drama            Music	R	2017
749	Immortals	226904017	83504017	36.8	143400000	63.2	Relativity Media	75000000	32206425	1 hr 50 min	Action            Drama            Fantasy            Romance	R	2011
750	Taken	226837760	145000989	63.9	81836771	36.1	Twentieth Century Fox	25000000	24717037	1 hr 30 min	Action            Crime            Thriller	PG-13	2008
751	Percy Jackson & the Olympians: The Lightning Thief	226497209	88768303	39.2	137728906	60.8	Twentieth Century Fox	95000000	31236067	1 hr 58 min	Adventure            Family            Fantasy	PG	2010
752	Lightyear	226425420	118307188	52.2	108118232	47.8	Walt Disney Studios Motion Pictures	0	50577961	1 hr 45 min	Action            Adventure            Animation            Drama            Family            Sci-Fi	PG	2022
753	Hansel & Gretel: Witch Hunters	226349749	55703475	24.6	170646274	75.4	Paramount Pictures	50000000	19690956	1 hr 28 min	Action            Fantasy            Horror	R	2013
754	Valerian and the City of a Thousand Planets	225973340	41189488	18.2	184783852	81.8	STX Entertainment	177200000	17007624	2 hr 16 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2017
755	Good Will Hunting	225933435	138433435	61.3	87500000	38.7	Miramax	0	272912	2 hr 6 min	Drama            Romance	R	1997
756	Better Days	225918798	1921657	0.8	223997141	99.2	Well Go USA Entertainment	0	989536	2 hr 15 min	Crime            Drama            Romance            Thriller	Not Rated	2019
757	Ford v Ferrari	225508210	117624357	52.2	107883853	47.8	Twentieth Century Fox	97600000	31474958	2 hr 32 min	Action            Biography            Drama            Sport	PG-13	2019
758	Jumper	225132113	80172128	35.6	144959985	64.4	Twentieth Century Fox	85000000	27354808	1 hr 28 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2008
759	The Social Network	224920375	96962694	43.1	127957681	56.9	Sony Pictures Entertainment (SPE)	40000000	22445653	2 hr	Biography            Drama	PG-13	2010
760	Chicken Run	224874811	106834564	47.5	118040247	52.5	DreamWorks Distribution	45000000	17506162	1 hr 24 min	Adventure            Animation            Comedy            Drama            Family	Not Rated	2000
761	Con Air	224012234	101117573	45.1	122894661	54.9	Walt Disney Studios Motion Pictures	75000000	24131738	1 hr 55 min	Action            Crime            Thriller	R	1997
762	Interview with the Vampire: The Vampire Chronicles	223664608	105264608	47.1	118400000	52.9	Warner Bros.	60000000	36389705	2 hr 3 min	Drama            Fantasy            Horror	R	1994
763	Flightplan	223387299	89707299	40.2	133680000	59.8	Walt Disney Studios Motion Pictures	0	24629938	1 hr 38 min	Drama            Mystery            Thriller	PG-13	2005
764	Yes Man	223241637	97690976	43.8	125550661	56.2	Warner Bros.	70000000	18262471	1 hr 44 min	Comedy            Romance	PG-13	2008
765	Non-Stop	222809600	92168600	41.4	130641000	58.6	Universal Pictures	50000000	28875635	1 hr 46 min	Action            Mystery            Thriller	PG-13	2014
766	Honey, I Shrunk the Kids	222724172	130724172	58.7	92000000	41.3	Walt Disney Studios Motion Pictures	0	14262961	1 hr 33 min	Adventure            Comedy            Family            Sci-Fi	Not Rated	1989
767	Fahrenheit 9/11	222446882	119194771	53.6	103252111	46.4	Lionsgate	6000000	23920637	2 hr 2 min	Documentary            Drama            War	R	2004
768	Wild Wild West	222104681	113804681	51.2	108300000	48.8	Warner Bros.	170000000	27687484	1 hr 46 min	Action            Comedy            Sci-Fi            Western	PG-13	1999
769	My Country, My Parents	221831086	177133	0.1	221653953	99.9	CMC Pictures	0	75302	2 hr 37 min	Drama	Not Rated	2021
770	Geostorm	221600160	33700160	15.2	187900000	84.8	Warner Bros.	120000000	13707376	1 hr 49 min	Action            Sci-Fi            Thriller	PG-13	2017
771	Presumed Innocent	221303188	86303188	39	135000000	61	Warner Bros.	0	11718981	2 hr 7 min	Mystery            Thriller	Not Rated	1990
772	Jungle Cruise	220889446	116987516	53	103901930	47	Walt Disney Studios Motion Pictures	0	35018731	2 hr 7 min	Action            Adventure            Comedy            Fantasy	PG-13	2021
773	Scary Movie 3	220673217	110003217	49.8	110670000	50.2	Dimension Films	48000000	49700000	1 hr 24 min	Comedy	PG-13	2003
774	Collateral	220239925	101005703	45.9	119234222	54.1	DreamWorks Distribution	65000000	24701458	2 hr	Action            Crime            Drama            Thriller	R	2004
775	Inferno	220021259	34343574	15.6	185677685	84.4	Sony Pictures Entertainment (SPE)	75000000	14860425	2 hr 1 min	Action            Adventure            Crime            Drama            Mystery            Thriller	PG-13	2016
776	Knocked Up	219922417	148768917	67.6	71153500	32.4	Universal Pictures	30000000	30690990	2 hr 9 min	Comedy            Romance	R	2007
777	Green Lantern	219851172	116601172	53	103250000	47	Warner Bros.	200000000	53174303	1 hr 54 min	Action            Adventure            Sci-Fi	PG-13	2011
778	What Happens in Vegas	219375562	80277646	36.6	139097916	63.4	Twentieth Century Fox	35000000	20172474	1 hr 39 min	Comedy            Romance	PG-13	2008
779	It's Complicated	219103655	112735375	51.4	106368280	48.6	Universal Pictures	85000000	22100820	2 hr 1 min	Comedy            Drama            Romance	R	2009
780	The Terminal	219100084	77872883	35.5	141227201	64.5	DreamWorks Distribution	60000000	19053199	2 hr 8 min	Comedy            Drama            Romance	PG-13	2004
781	Little Women	218843645	108101214	49.4	110742431	50.6	Sony Pictures Entertainment (SPE)	40000000	16755310	2 hr 15 min	Drama            Romance	PG	2019
782	Captain Phillips	218791811	107100855	49	111690956	51	Sony Pictures Entertainment (SPE)	55000000	25718314	2 hr 14 min	Action            Biography            Crime            Drama            Thriller	PG-13	2013
783	The Prince of Egypt	218613188	101413188	46.4	117200000	53.6	DreamWorks Distribution	70000000	14524321	1 hr 39 min	Adventure            Animation            Drama            Family            Fantasy            Musical	PG	1998
784	Jack Reacher	218340595	80070736	36.7	138269859	63.3	Paramount Pictures	60000000	15210156	2 hr 10 min	Action            Mystery            Thriller	PG-13	2012
785	Kingdom of Heaven	218122627	47398413	21.7	170724214	78.3	Twentieth Century Fox	130000000	19635996	2 hr 24 min	Action            Adventure            Drama            History            War	R	2005
786	The Emoji Movie	217776646	86089513	39.5	131687133	60.5	Sony Pictures Entertainment (SPE)	50000000	24531923	1 hr 26 min	Adventure            Animation            Comedy            Family            Fantasy            Sci-Fi	PG	2017
787	Smile	217408513	105935048	48.7	111473465	51.3	Paramount Pictures	0	22609925	1 hr 55 min	Horror            Mystery            Thriller	R	2022
789	Dracula Untold	217124280	56280355	25.9	160843925	74.1	Universal Pictures	70000000	23514615	1 hr 32 min	Action            Drama            Fantasy            Horror	PG-13	2014
790	Central Intelligence	216972543	127440871	58.7	89531672	41.3	Warner Bros.	50000000	35535250	1 hr 47 min	Action            Comedy            Crime	PG-13	2016
791	Million Dollar Baby	216763646	100492203	46.4	116271443	53.6	Warner Bros.	30000000	179953	2 hr 12 min	Drama            Sport	PG-13	2004
792	The Help	216639112	169708112	78.3	46931000	21.7	Walt Disney Studios Motion Pictures	25000000	26044590	2 hr 26 min	Drama	PG-13	2011
793	Twins	216614388	111938388	51.7	104676000	48.3	Universal Pictures	15000000	11174980	1 hr 47 min	Comedy            Crime	Not Rated	1988
794	Valentine's Day	216528528	110528528	51	106000000	49	Warner Bros.	52000000	56260707	2 hr 5 min	Comedy            Romance	PG-13	2010
795	Bad Teacher	216197492	100292856	46.4	115904636	53.6	Sony Pictures Entertainment (SPE)	20000000	31603106	1 hr 32 min	Comedy            Romance	R	2011
796	A Little Red Flower	216000000	0	0	216000000	100	Unknown	0	0	2 hr 2 min	Drama            Family	Not Rated	2020
797	The Croods: A New Age	215905815	58568815	27.1	157337000	72.9	Universal Pictures	0	9724200	1 hr 35 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2020
798	Clear and Present Danger	215887717	122187717	56.6	93700000	43.4	Paramount Pictures	62000000	20348017	2 hr 21 min	Action            Crime            Drama            Thriller	PG-13	1994
799	One Hundred and One Dalmatians	215880014	144880014	67.1	71000000	32.9	Walt Disney Studios Motion Pictures	0	0	1 hr 19 min	Adventure            Animation            Comedy            Family	Not Rated	1961
800	Ted 2	215863606	81476385	37.7	134387221	62.3	Universal Pictures	68000000	33507870	1 hr 55 min	Comedy	R	2015
801	Bram Stoker's Dracula	215862692	82522790	38.2	133339902	61.8	Columbia Pictures	40000000	30521679	2 hr 8 min	Drama            Fantasy            Horror            Romance	R	1992
802	Vertical Limit	215663859	69243859	32.1	146420000	67.9	Sony Pictures Entertainment (SPE)	75000000	15507845	2 hr 4 min	Action            Adventure            Drama            Sport            Thriller	PG-13	2000
803	Ghostbusters II	215394738	112494738	52.2	102900000	47.8	Columbia Pictures	0	29472894	1 hr 48 min	Action            Comedy            Fantasy            Sci-Fi	Not Rated	1989
804	The Patriot	215294342	113330342	52.6	101964000	47.4	Sony Pictures Entertainment (SPE)	110000000	22413710	2 hr 45 min	Action            Drama            History            War	R	2000
805	The Sorcerer's Apprentice	215283742	63150991	29.3	152132751	70.7	Walt Disney Studios Motion Pictures	150000000	17619622	1 hr 49 min	Action            Adventure            Family            Fantasy	PG	2010
806	Just Go with It	214945591	103028109	47.9	111917482	52.1	Sony Pictures Entertainment (SPE)	80000000	30514732	1 hr 57 min	Comedy            Romance	PG-13	2011
807	The Expendables 3	214657577	39322544	18.3	175335033	81.7	Lionsgate	0	15879645	2 hr 6 min	Action            Adventure            Thriller	PG-13	2014
808	Dirty Dancing	214577242	64577242	30.1	150000000	69.9	Vestron Pictures	6000000	3900000	1 hr 40 min	Drama            Music            Romance	Not Rated	1987
809	Creed II	214215889	115715889	54	98500000	46	Metro-Goldwyn-Mayer (MGM)	50000000	35574710	2 hr 10 min	Action            Drama            Sport	PG-13	2018
810	Smallfoot	214115531	83315531	38.9	130800000	61.1	Warner Bros.	0	23045635	1 hr 36 min	Adventure            Animation            Comedy            Drama            Family            Fantasy            Musical	PG	2018
811	Public Enemies	214104620	97104620	45.4	117000000	54.6	Universal Pictures	100000000	25271675	2 hr 20 min	Action            Biography            Crime            Drama            History	R	2009
812	The Bourne Identity	214034224	121661683	56.8	92372541	43.2	Universal Pictures	60000000	27118640	1 hr 59 min	Action            Mystery            Thriller	PG-13	2002
813	Disclosure	214015089	83015089	38.8	131000000	61.2	Warner Bros.	55000000	10068126	2 hr 8 min	Drama            Thriller	R	1994
814	Crouching Tiger, Hidden Dragon	213977285	128530421	60.1	85446864	39.9	Sony Pictures Classics	17000000	663205	2 hr	Action            Adventure            Drama            Fantasy            Romance	PG-13	2000
815	Pulp Fiction	213928762	107928762	50.4	106000000	49.6	Miramax	8000000	9311882	2 hr 34 min	Crime            Drama	R	1994
816	The Aviator	213719942	102610330	48	111109612	52	Miramax	110000000	858021	2 hr 50 min	Biography            Drama	PG-13	2004
817	Braveheart	213216216	75609945	35.5	137606271	64.5	Paramount Pictures	72000000	9938276	2 hr 58 min	Biography            Drama            History            War	R	1995
818	Into the Woods	212902372	128002372	60.1	84900000	39.9	Walt Disney Studios Motion Pictures	50000000	31051923	2 hr 5 min	Adventure            Comedy            Drama            Fantasy            Musical	PG	2014
819	Bedtime Stories	212874864	110101975	51.7	102772889	48.3	Walt Disney Studios Motion Pictures	80000000	27450296	1 hr 39 min	Adventure            Comedy            Family            Fantasy            Romance            Sci-Fi	PG	2008
820	Miss Congeniality	212742720	106807667	50.2	105935053	49.8	Warner Bros.	45000000	10046534	1 hr 49 min	Action            Comedy            Crime            Romance	PG-13	2000
821	Entrapment	212404396	87704396	41.3	124700000	58.7	Twentieth Century Fox	66000000	20145595	1 hr 53 min	Action            Crime            Romance            Thriller	PG-13	1999
822	Ace Ventura: When Nature Calls	212385533	108385533	51	104000000	49	Warner Bros.	0	37804076	1 hr 30 min	Adventure            Comedy            Crime	PG-13	1995
823	End of Days	211989043	66889043	31.6	145100000	68.4	Universal Pictures	100000000	20523595	2 hr 2 min	Action            Fantasy            Horror            Thriller	R	1999
824	Bridget Jones's Baby	211952420	24252420	11.4	187700000	88.6	Universal Pictures	35000000	8571785	2 hr 3 min	Comedy            Drama            Romance	R	2016
825	Fury	211822697	85817906	40.5	126004791	59.5	Sony Pictures Entertainment (SPE)	68000000	23702421	2 hr 14 min	Action            Drama            War	R	2014
826	Battle Los Angeles	211819354	83552429	39.4	128266925	60.6	Sony Pictures Entertainment (SPE)	70000000	35573187	1 hr 56 min	Action            Adventure            Sci-Fi	PG-13	2011
827	Australia	211787511	49554002	23.4	162233509	76.6	Twentieth Century Fox	130000000	14800723	2 hr 45 min	Adventure            Drama            Romance            War            Western	PG-13	2008
828	Due Date	211780824	100539043	47.5	111241781	52.5	Warner Bros.	65000000	32689406	1 hr 35 min	Comedy            Drama	R	2010
829	Master and Commander: The Far Side of the World	211622535	93927920	44.4	117694615	55.6	Twentieth Century Fox	150000000	25105990	2 hr 18 min	Action            Adventure            Drama            War	PG-13	2003
830	A Series of Unfortunate Events	211468235	118634549	56.1	92833686	43.9	Paramount Pictures	140000000	30061756	1 hr 48 min	Adventure            Comedy            Family            Fantasy	PG	2004
831	The Little Mermaid	211343479	111543479	52.8	99800000	47.2	Walt Disney Studios Motion Pictures	0	6031914	1 hr 23 min	Adventure            Animation            Family            Fantasy            Musical            Romance	Not Rated	1989
832	Nice View	211019042	0	0	211019042	100	Unknown	0	0	1 hr 46 min	Comedy            Drama	Not Rated	2022
833	District 9	210888950	115646235	54.8	95242715	45.2	TriStar Pictures	30000000	37354308	1 hr 52 min	Action            Sci-Fi            Thriller	R	2009
834	Moonraker	210308099	70308099	33.4	140000000	66.6	Metro-Goldwyn-Mayer (MGM)	0	7108344	2 hr 6 min	Action            Adventure            Sci-Fi            Thriller	Not Rated	1979
835	The Others	209947037	96522687	46	113424350	54	Miramax	17000000	14089952	1 hr 41 min	Horror            Mystery            Thriller	PG-13	2001
836	Horrible Bosses	209838559	117538559	56	92300000	44	Warner Bros.	35000000	28302165	1 hr 38 min	Comedy            Crime	R	2011
837	Us and Them	209221380	0	0	209221380	100	Unknown	0	0	2 hr	Drama            Romance	Not Rated	2018
838	Red Dragon	209196298	93149898	44.5	116046400	55.5	Universal Pictures	78000000	36540945	2 hr 4 min	Crime            Drama            Thriller	R	2002
839	Tomorrowland	209035668	93436322	44.7	115599346	55.3	Walt Disney Studios Motion Pictures	190000000	33028165	2 hr 10 min	Action            Adventure            Family            Fantasy            Mystery            Sci-Fi	PG	2015
840	Me Before You	208314186	56245075	27	152069111	73	Warner Bros.	20000000	18723269	1 hr 46 min	Drama            Romance	PG-13	2016
841	Dungeons & Dragons: Honor Among Thieves	208177026	93277026	44.8	114900000	55.2	Paramount Pictures	0	37205784	2 hr 14 min	Action            Adventure            Comedy            Fantasy	PG-13	2023
842	Safe House	208076205	126373434	60.7	81702771	39.3	Universal Pictures	85000000	40172720	1 hr 55 min	Action            Thriller	R	2012
843	S.W.A.T.	207725639	116934650	56.3	90790989	43.7	Sony Pictures Entertainment (SPE)	80000000	37062535	1 hr 57 min	Action            Adventure            Crime            Thriller	PG-13	2003
844	DC League of Super-Pets	207557117	93657117	45.1	113900000	54.9	Warner Bros.	0	23003441	1 hr 45 min	Action            Adventure            Animation            Comedy            Crime            Family            Fantasy            Sci-Fi	PG	2022
845	The Fast and the Furious	207517509	144745925	69.8	62771584	30.2	Universal Pictures	38000000	40089015	1 hr 46 min	Action            Crime            Thriller	PG-13	2001
846	Traffic	207515725	124115725	59.8	83400000	40.2	USA Films	0	184725	2 hr 27 min	Crime            Drama            Thriller	R	2000
847	Paranormal Activity 3	207039844	104028807	50.2	103011037	49.8	Paramount Pictures	5000000	52568183	1 hr 23 min	Horror            Mystery	R	2011
848	Philadelphia	206678440	77446440	37.5	129232000	62.5	TriStar Pictures	26000000	143433	2 hr 5 min	Drama	PG-13	1993
849	The Conjuring: The Devil Made Me Do It	206431050	65631050	31.8	140800000	68.2	Warner Bros.	0	24104332	1 hr 52 min	Horror            Mystery            Thriller	R	2021
850	Sleepy Hollow	206071502	101071502	49	105000000	51	Paramount Pictures	100000000	30060467	1 hr 45 min	Fantasy            Horror            Mystery	R	1999
851	The Holiday	205850169	63224849	30.7	142625320	69.3	Sony Pictures Entertainment (SPE)	85000000	12778913	2 hr 16 min	Comedy            Romance	PG-13	2006
852	The Jungle Book	205843612	141843612	68.9	64000000	31.1	Walt Disney Studios Motion Pictures	0	0	1 hr 18 min	Adventure            Animation            Comedy            Family            Musical	G	1967
853	Raging Fire	205842393	385305	0.2	205457088	99.8	Well Go USA Entertainment	0	101926	2 hr 6 min	Action            Adventure            Crime            Mystery            Thriller	Not Rated	2021
854	London Has Fallen	205754447	62524260	30.4	143230187	69.6	Focus Features	60000000	21635601	1 hr 39 min	Action            Thriller	R	2016
855	The Break-Up	205668210	118703275	57.7	86964935	42.3	Universal Pictures	52000000	39172785	1 hr 46 min	Comedy            Drama            Romance	PG-13	2006
856	Journey to the West	205637183	18058	0.1	205619125	100	Magnolia Pictures	0	7456	1 hr 50 min	Action            Adventure            Comedy            Fantasy            Romance	PG-13	2013
857	The Ugly Truth	205599393	88915214	43.2	116684179	56.8	Sony Pictures Entertainment (SPE)	38000000	27605576	1 hr 36 min	Comedy            Romance	R	2009
858	JFK	205405498	70405498	34.3	135000000	65.7	Warner Bros.	0	5223658	3 hr 9 min	Drama            History            Thriller	R	1991
859	Birds of Prey	205372791	84172791	41	121200000	59	Warner Bros.	84500000	33010017	1 hr 49 min	Action            Comedy            Crime	R	2020
860	White House Down	205366737	73103784	35.6	132262953	64.4	Sony Pictures Entertainment (SPE)	150000000	24852258	2 hr 11 min	Action            Drama            Thriller	PG-13	2013
861	A Dog's Purpose	205035819	64508620	31.5	140527199	68.5	Universal Pictures	22000000	18222810	1 hr 40 min	Adventure            Comedy            Drama            Family            Fantasy	PG	2017
862	Ponyo	204920882	15743471	7.7	189177411	92.3	Walt Disney Studios Motion Pictures	0	3585852	1 hr 41 min	Adventure            Animation            Comedy            Family            Fantasy	Not Rated	2008
863	Fun with Dick and Jane	204681899	110332737	53.9	94349162	46.1	Sony Pictures Entertainment (SPE)	100000000	14383515	1 hr 30 min	Comedy            Crime	PG-13	2005
864	Eat Pray Love	204594016	80574010	39.4	124020006	60.6	Sony Pictures Entertainment (SPE)	60000000	23104523	2 hr 13 min	Biography            Drama            Romance	PG-13	2010
865	The Addams Family	204394183	100723831	49.3	103670352	50.7	United Artists Releasing	24000000	30300007	1 hr 26 min	Animation            Comedy            Family            Fantasy            Horror	PG	2019
866	Ghostbusters: Afterlife	204334455	129360575	63.3	74973880	36.7	Sony Pictures Entertainment (SPE)	0	44008406	2 hr 4 min	Adventure            Comedy            Fantasy            Sci-Fi	PG-13	2021
867	You Don't Mess with the Zohan	204313400	100018837	49	104294563	51	Sony Pictures Entertainment (SPE)	90000000	38531374	1 hr 53 min	Action            Comedy	PG-13	2008
868	Hairspray	203627753	118946291	58.4	84681462	41.6	New Line Cinema	0	27800000	1 hr 57 min	Comedy            Drama            Musical            Romance	PG	2007
869	King Arthur	203567857	51882244	25.5	151685613	74.5	Walt Disney Studios Motion Pictures	120000000	15193907	2 hr 6 min	Action            Adventure            Drama            History            War	PG-13	2004
870	Yogi Bear	203509374	100246011	49.3	103263363	50.7	Warner Bros.	80000000	16411322	1 hr 21 min	Adventure            Animation            Comedy            Family	PG	2010
871	Everest	203427584	43482270	21.4	159945314	78.6	Universal Pictures	55000000	7222035	2 hr 1 min	Action            Adventure            Biography            Drama            Thriller	PG-13	2015
872	Vanilla Sky	203388341	100618344	49.5	102769997	50.5	Paramount Pictures	68000000	25015518	2 hr 16 min	Fantasy            Mystery            Romance            Sci-Fi            Thriller	R	2001
873	Arrival	203388186	100546139	49.4	102842047	50.6	Paramount Pictures	47000000	24074047	1 hr 56 min	Drama            Mystery            Sci-Fi	PG-13	2016
874	Need for Speed	203277636	43577636	21.4	159700000	78.6	Walt Disney Studios Motion Pictures	66000000	17844939	2 hr 12 min	Action            Adventure            Crime            Thriller	PG-13	2014
875	Garfield	203172417	75369589	37.1	127802828	62.9	Twentieth Century Fox	50000000	21727611	1 hr 20 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2004
876	Patch Adams	202292902	135026902	66.8	67266000	33.2	Universal Pictures	90000000	25262280	1 hr 55 min	Biography            Comedy            Drama            Romance	PG-13	1998
877	Teenage Mutant Ninja Turtles	202084756	135384756	67	66700000	33	New Line Cinema	13500000	25398367	1 hr 33 min	Action            Adventure            Comedy            Family            Sci-Fi	Not Rated	1990
878	Kindergarten Cop	201957688	91457688	45.3	110500000	54.7	Universal Pictures	15000000	7918560	1 hr 51 min	Action            Comedy            Crime	Not Rated	1990
879	Straight Outta Compton	201634991	161197785	80	40437206	20	Universal Pictures	28000000	60200180	2 hr 27 min	Biography            Drama            History            Music	R	2015
880	21 Jump Street	201585328	138447667	68.7	63137661	31.3	Sony Pictures Entertainment (SPE)	42000000	36302612	1 hr 49 min	Action            Comedy            Crime	R	2012
881	Valkyrie	201545517	83077833	41.2	118467684	58.8	United Artists	75000000	21027007	2 hr 1 min	Drama            History            Thriller            War	PG-13	2008
882	Open Season	200811689	85105259	42.4	115706430	57.6	Sony Pictures Entertainment (SPE)	85000000	23624548	1 hr 26 min	Adventure            Animation            Comedy            Family	PG	2006
883	Cats & Dogs	200687492	93385515	46.5	107301977	53.5	Warner Bros.	60000000	21707617	1 hr 27 min	Action            Adventure            Comedy            Family            Fantasy	PG	2001
884	The Hunt for Red October	200512643	122012643	60.8	78500000	39.2	Paramount Pictures	30000000	17161835	2 hr 15 min	Action            Adventure            Thriller	Not Rated	1990
885	Percy Jackson: Sea of Monsters	199850315	68559554	34.3	131290761	65.7	Twentieth Century Fox	90000000	14401054	1 hr 46 min	Adventure            Family            Fantasy	PG	2013
886	The Lego Movie 2: The Second Part	199603202	105956290	53.1	93646912	46.9	Warner Bros.	99000000	34115335	1 hr 47 min	Action            Adventure            Animation            Comedy            Family            Fantasy            Musical            Sci-Fi	PG	2019
887	Two Weeks Notice	199043471	93354851	46.9	105688620	53.1	Warner Bros.	60000000	14328494	1 hr 41 min	Comedy            Romance	PG-13	2002
888	RED	199006387	90380162	45.4	108626225	54.6	Summit Entertainment	58000000	21761408	1 hr 51 min	Action            Comedy            Crime            Thriller	PG-13	2010
889	Shock Wave 2	198921659	0	0	198921659	100	Unknown	0	0	2 hr	Action            Crime            Thriller	Not Rated	2020
890	City of Angels	198685114	78685114	39.6	120000000	60.4	Warner Bros.	0	15369048	1 hr 54 min	Drama            Fantasy            Romance	PG-13	1998
891	The Pacifier	198636868	113086868	56.9	85550000	43.1	Walt Disney Studios Motion Pictures	56000000	30552694	1 hr 35 min	Action            Comedy            Drama            Family	PG	2005
892	50 First Dates	198520934	120908074	60.9	77612860	39.1	Sony Pictures Entertainment (SPE)	75000000	39852237	1 hr 39 min	Comedy            Drama            Romance	PG-13	2004
893	Total Recall	198467168	58877969	29.7	139589199	70.3	Sony Pictures Entertainment (SPE)	125000000	25577758	1 hr 58 min	Action            Adventure            Sci-Fi            Thriller	PG-13	2012
894	The Island	198326350	670883	0.3	197655467	99.7	Well Go USA Entertainment	0	263412	2 hr 14 min	Comedy            Drama	Not Rated	2018
895	The Impossible	198087212	19019882	9.6	179067330	90.4	Lionsgate	0	143818	1 hr 54 min	Adventure            Drama            History            Thriller	PG-13	2012
896	Lost in Thailand	197757387	57387	0.1	197700000	100		0	32206	1 hr 45 min	Adventure            Comedy            Drama	Not Rated	2012
897	Christopher Robin	197744377	99215042	50.2	98529335	49.8	Walt Disney Studios Motion Pictures	75000000	24585139	1 hr 44 min	Adventure            Comedy            Drama            Family            Fantasy            Musical	PG	2018
898	Jack the Giant Slayer	197687603	65187603	33	132500000	67	Warner Bros.	195000000	27202226	1 hr 54 min	Action            Adventure            Fantasy	PG-13	2013
899	Smurfs: The Lost Village	197183546	45020282	22.8	152163264	77.2	Sony Pictures Entertainment (SPE)	60000000	13210449	1 hr 30 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2017
900	Chinese Doctors	197143218	0	0	197143218	100	Unknown	0	0	2 hr 9 min	Drama	Not Rated	2021
901	Spy Kids 3: Game Over	197101678	111761982	56.7	85339696	43.3	Dimension Films	38000000	32500000	1 hr 24 min	Action            Adventure            Comedy            Family            Sci-Fi	PG	2003
902	Panic Room	197079546	96397334	48.9	100682212	51.1	Sony Pictures Entertainment (SPE)	48000000	30056751	1 hr 52 min	Crime            Drama            Thriller	R	2002
903	The Other Woman	196710396	83911193	42.7	112799203	57.3	Twentieth Century Fox	40000000	24763752	1 hr 49 min	Comedy            Romance	PG-13	2014
904	Stargate	196567262	71567262	36.4	125000000	63.6	Metro-Goldwyn-Mayer (MGM)	0	16651018	1 hr 56 min	Action            Adventure            Sci-Fi	PG-13	1994
905	Beowulf	196393745	82280579	41.9	114113166	58.1	Paramount Pictures	150000000	27515871	1 hr 55 min	Action            Adventure            Animation            Fantasy	PG-13	2007
906	The Vow	196114570	125014030	63.8	71100540	36.2	Screen Gems	30000000	41202458	1 hr 44 min	Drama            Romance	PG-13	2012
907	Anger Management	195745823	135645823	69.3	60100000	30.7	Revolution Studios	75000000	42220847	1 hr 46 min	Comedy	PG-13	2003
908	Tropic Thunder	195702963	110515313	56.5	85187650	43.5	DreamWorks	92000000	25812796	1 hr 47 min	Action            Comedy            War	R	2008
909	The Shape of Water	195333312	63859435	32.7	131473877	67.3		0	166564	2 hr 3 min	Drama            Fantasy            Romance	R	2017
910	Rocketman	195320400	96368160	49.3	98952240	50.7	Paramount Pictures	40000000	25725722	2 hr 1 min	Biography            Drama            Music	R	2019
911	The Pelican Brief	195268056	100768056	51.6	94500000	48.4	Warner Bros.	0	16864404	2 hr 21 min	Crime            Drama            Mystery            Thriller	PG-13	1993
912	The BFG	195243411	55483770	28.4	139759641	71.6	Walt Disney Studios Motion Pictures	140000000	18775350	1 hr 57 min	Adventure            Family            Fantasy	PG	2016
913	Downton Abbey	194694725	96853865	49.8	97840860	50.2	Focus Features	13000000	31033665	2 hr 2 min	Drama            Romance	PG	2019
914	The Intern	194564672	75764672	38.9	118800000	61.1	Warner Bros.	35000000	17728313	2 hr 1 min	Comedy            Drama	PG-13	2015
915	Wallace & Gromit: The Curse of the Were-Rabbit	194137295	56110897	28.9	138026398	71.1	DreamWorks Distribution	30000000	16025987	1 hr 25 min	Adventure            Animation            Comedy            Family            Fantasy            Mystery            Sci-Fi	Not Rated	2005
916	Gnomeo & Juliet	193967670	99967670	51.5	94000000	48.5	Walt Disney Studios Motion Pictures	0	25356909	1 hr 24 min	Adventure            Animation            Comedy            Family            Fantasy            Musical            Romance	Not Rated	2011
917	The Sum of All Fears	193921372	118907036	61.3	75014336	38.7	Paramount Pictures	68000000	31178526	2 hr 4 min	Action            Drama            Thriller            War	PG-13	2002
918	Gangs of New York	193772504	77812000	40.2	115960504	59.8	Miramax	100000000	9100000	2 hr 47 min	Crime            Drama	R	2002
919	The Post	193764664	81903458	42.3	111861206	57.7	Twentieth Century Fox	50000000	526011	1 hr 56 min	Biography            Drama            History            Thriller            War	PG-13	2017
920	The Monkey King 2	193678298	709982	0.4	192968316	99.6	China Lion Film Distribution	0	166391	1 hr 59 min	Action            Adventure            Fantasy	Not Rated	2016
921	Paranormal Activity	193355800	107918810	55.8	85436990	44.2	Paramount Pictures	15000	77873	1 hr 26 min	Horror            Mystery	R	2009
922	Weathering with You	192951441	8056636	4.2	184894805	95.8	GKIDS	0	1808533	1 hr 52 min	Animation            Drama            Fantasy            Romance	PG-13	2019
923	The Lost City	192907684	105344029	54.6	87563655	45.4	Paramount Pictures	0	30453269	1 hr 52 min	Action            Adventure            Comedy            Romance	PG-13	2022
924	The Equalizer	192330738	101530738	52.8	90800000	47.2	Sony Pictures Entertainment (SPE)	55000000	34137828	2 hr 12 min	Action            Crime            Thriller	R	2014
925	Sheep Without a Shepherd	191602146	0	0	191602146	100	Unknown	0	0	1 hr 52 min	Crime            Drama            Thriller	Not Rated	2019
926	The Addams Family	191502426	113502426	59.3	78000000	40.7	Paramount Pictures	30000000	24203754	1 hr 39 min	Comedy            Fantasy	Not Rated	1991
927	The Longest Yard	191466556	158119460	82.6	33347096	17.4	Paramount Pictures	82000000	47606480	1 hr 53 min	Comedy            Crime            Sport	PG-13	2005
928	The Santa Clause	190539357	145539357	76.4	45000000	23.6	Walt Disney Studios Motion Pictures	22000000	19321992	1 hr 37 min	Comedy            Drama            Family            Fantasy	PG	1994
929	Cheaper by the Dozen	190538630	138614544	72.8	51924086	27.2	Twentieth Century Fox	40000000	27557647	1 hr 38 min	Comedy            Family	PG	2003
930	The Equalizer 2	190400157	102084362	53.6	88315795	46.4	Sony Pictures Entertainment (SPE)	62000000	36011640	2 hr 1 min	Action            Crime            Thriller	R	2018
931	Abominable	190304772	61270390	32.2	129034382	67.8	Universal Pictures	75000000	20612100	1 hr 37 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2019
932	Hollow Man	190213455	73209340	38.5	117004115	61.5	Sony Pictures Entertainment (SPE)	95000000	26414386	1 hr 52 min	Action            Horror            Sci-Fi            Thriller	R	2000
933	Outbreak	189859560	67659560	35.6	122200000	64.4	Warner Bros.	0	13420387	2 hr 7 min	Action            Drama            Thriller	R	1995
934	The White Storm 2: Drug Lords	189396380	609461	0.3	188786919	99.7		0	244795	1 hr 39 min	Action            Crime	Not Rated	2019
935	The X Files	189176423	83898313	44.4	105278110	55.6	Twentieth Century Fox	0	30138758	2 hr 1 min	Drama            Mystery            Sci-Fi            Thriller	PG-13	1998
936	Breakup Buddies	189017596	777896	0.4	188239700	99.6	China Lion Film Distribution	0	230204	1 hr 56 min	Comedy            Drama            Romance	Not Rated	2014
937	Rambo III	189015611	53715611	28.4	135300000	71.6	TriStar Pictures	63000000	13034238	1 hr 42 min	Action            Adventure            Thriller	Not Rated	1988
938	The Secret Life of Walter Mitty	188133322	58236838	31	129896484	69	Twentieth Century Fox	90000000	12765508	1 hr 54 min	Adventure            Comedy            Drama            Fantasy            Romance	PG	2013
939	Project Gutenberg	188116796	0	0	188116796	100	Unknown	0	0	2 hr 10 min	Action            Crime            Mystery            Thriller	Not Rated	2018
940	Jaws 2	187884007	81766007	43.5	106118000	56.5	Universal Pictures	0	9866023	1 hr 56 min	Adventure            Horror            Thriller	Not Rated	1978
941	12 Years a Slave	187733202	56671993	30.2	131061209	69.8		20000000	923715	2 hr 14 min	Biography            Drama            History	R	2013
942	Heat	187436818	67436818	36	120000000	64	Warner Bros.	0	8445656	2 hr 50 min	Action            Crime            Drama	R	1995
943	Mr. Popper's Penguins	187361754	68224452	36.4	119137302	63.6	Twentieth Century Fox	55000000	18445355	1 hr 34 min	Comedy            Family            Fantasy	PG	2011
944	The Grudge	187281115	110359362	58.9	76921753	41.1	Sony Pictures Entertainment (SPE)	10000000	39128715	1 hr 31 min	Horror            Mystery            Thriller	PG-13	2004
945	One Piece Film: Red	187170704	12775324	6.8	174395380	93.2	Crunchyroll	0	9340245	1 hr 55 min	Action            Adventure            Animation            Fantasy	PG-13	2022
946	I Now Pronounce You Chuck & Larry	187134117	120059556	64.2	67074561	35.8	Universal Pictures	85000000	34233750	1 hr 55 min	Comedy            Romance	PG-13	2007
947	The Horse Whisperer	186883563	75383563	40.3	111500000	59.7	Walt Disney Studios Motion Pictures	0	13685488	2 hr 49 min	Drama            Romance            Western	PG-13	1998
948	Walk the Line	186797986	119519402	64	67278584	36	Twentieth Century Fox	28000000	22347341	2 hr 16 min	Biography            Drama            Music            Romance	PG-13	2005
949	Jian Bing Man	186699768	0	0	186699768	100	Unknown	0	0	1 hr 53 min	Comedy	Not Rated	2015
950	The Jungle Book 2	186303759	47901582	25.7	138402177	74.3	Walt Disney Studios Motion Pictures	20000000	11441733	1 hr 12 min	Adventure            Animation            Comedy            Family            Music            Musical	Not Rated	2003
951	The Final Destination	186167139	66477700	35.7	119689439	64.3	Warner Bros.	40000000	27408309	1 hr 22 min	Horror            Thriller	R	2009
952	Atlantis: The Lost Empire	186053725	84056472	45.2	101997253	54.8	Walt Disney Studios Motion Pictures	120000000	329011	1 hr 35 min	Action            Adventure            Animation            Family            Fantasy            Sci-Fi	PG	2001
953	Inside Man	186003591	88513495	47.6	97490096	52.4	Universal Pictures	45000000	28954945	2 hr 9 min	Crime            Drama            Mystery            Thriller	R	2006
954	The Waterboy	185991646	161491646	86.8	24500000	13.2	Walt Disney Studios Motion Pictures	23000000	39414071	1 hr 30 min	Comedy            Sport	PG-13	1998
955	Hugo	185770310	73864507	39.8	111905803	60.2	Paramount Pictures	0	11364505	2 hr 6 min	Adventure            Drama            Family            Fantasy            Mystery	PG	2011
956	Pitch Perfect 3	185400345	104897530	56.6	80502815	43.4	Universal Pictures	45000000	19928525	1 hr 33 min	Comedy            Music	PG-13	2017
957	Watchmen	185382813	107509799	58	77873014	42	Warner Bros.	130000000	55214334	2 hr 42 min	Action            Drama            Mystery            Sci-Fi	R	2009
958	The Birdcage	185260553	124060553	67	61200000	33	Metro-Goldwyn-Mayer (MGM)	0	18275828	1 hr 57 min	Comedy	R	1996
959	Moulin Rouge!	184928542	57386607	31	127541935	69	Twentieth Century Fox	50000000	167540	2 hr 7 min	Drama            Musical            Romance	PG-13	2001
960	Snow White and the Seven Dwarfs	184925486	184925486	100	0	0	Walt Disney Studios Motion Pictures	1499000	0	1 hr 23 min	Adventure            Animation            Family            Fantasy            Musical            Romance	Approved	1937
961	Ode to My Father	184827559	2300121	1.2	182527438	98.8	CJ Entertainment	0	33880	2 hr 6 min	Drama            War	Not Rated	2014
962	Hop	184367145	108498305	58.8	75868840	41.2	Universal Pictures	63000000	37543710	1 hr 35 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2011
963	Bad Moms	183936074	113257297	61.6	70678777	38.4	STX Entertainment	20000000	23817340	1 hr 40 min	Comedy	R	2016
964	Jupiter Ascending	183887723	47387723	25.8	136500000	74.2	Warner Bros.	176000000	18372372	2 hr 7 min	Action            Adventure            Sci-Fi	PG-13	2015
965	Knowing	183658498	79957634	43.5	103700864	56.5	Summit Entertainment	50000000	24604751	2 hr 1 min	Action            Mystery            Sci-Fi            Thriller	PG-13	2007
966	102 Dalmatians	183611771	66957026	36.5	116654745	63.5	Walt Disney Studios Motion Pictures	85000000	19883351	1 hr 40 min	Adventure            Comedy            Family	Not Rated	2000
967	Storks	183510278	72800603	39.7	110709675	60.3	Warner Bros.	70000000	21311407	1 hr 27 min	Adventure            Animation            Comedy            Family            Fantasy	PG	2016
968	Stand by Me Doraemon	183442714	0	0	183442714	100	Unknown	0	0	1 hr 35 min	Animation            Comedy            Drama            Family            Sci-Fi	Not Rated	2014
969	The Hitman's Bodyguard	183428689	75468583	41.1	107960106	58.9	Lionsgate	30000000	21384504	1 hr 58 min	Action            Comedy            Crime            Thriller	R	2017
970	Paul Blart: Mall Cop	183348429	146336178	79.8	37012251	20.2	Sony Pictures Entertainment (SPE)	26000000	31832636	1 hr 31 min	Action            Comedy            Crime            Family	PG	2009
971	Wayne's World	183097323	121697323	66.5	61400000	33.5	Paramount Pictures	20000000	18122710	1 hr 34 min	Comedy            Music	PG-13	1992
972	Maverick	183031272	101631272	55.5	81400000	44.5	Warner Bros.	0	17248545	2 hr 7 min	Action            Adventure            Comedy            Western	PG	1994
973	Mirror Mirror	183018522	64935167	35.5	118083355	64.5	Relativity Media	85000000	18132085	1 hr 46 min	Adventure            Comedy            Drama            Family            Fantasy	PG	2012
974	The Man in the Iron Mask	182968902	56968902	31.1	126000000	68.9	Metro-Goldwyn-Mayer (MGM)	0	17271450	2 hr 12 min	Action            Adventure            Drama	PG-13	1998
975	Cape Fear	182291969	79091969	43.4	103200000	56.6	Universal Pictures	0	10261025	2 hr 8 min	Crime            Thriller	R	1991
976	The Haunted Mansion	182290266	75847266	41.6	106443000	58.4	Walt Disney Studios Motion Pictures	90000000	24278410	1 hr 39 min	Comedy            Family            Fantasy            Horror            Mystery	PG	2003
977	The Monkey King: Havoc in Heaven's Palace	182206924	0	0	182206924	100	Unknown	0	0	1 hr 59 min	Action            Adventure            Family            Fantasy	Not Rated	2014
978	While You Were Sleeping	182057016	81057016	44.5	101000000	55.5	Walt Disney Studios Motion Pictures	17000000	9288915	1 hr 43 min	Comedy            Drama            Romance	PG	1995
979	The Bridges of Madison County	182016617	71516617	39.3	110500000	60.7	Warner Bros.	24000000	10519257	2 hr 15 min	Drama            Romance	PG-13	1995
980	From Vegas to Macau III	181732879	0	0	181732879	100	Unknown	0	0	1 hr 53 min	Comedy            Drama	Not Rated	2016
981	Poseidon	181674817	60674817	33.4	121000000	66.6	Warner Bros.	160000000	22155410	1 hr 38 min	Action            Adventure            Thriller	PG-13	2006
982	The First Wives Club	181489203	105489203	58.1	76000000	41.9	Paramount Pictures	0	18913411	1 hr 43 min	Comedy	PG	1996
983	Cliff Walkers	181325565	152972	0.1	181172593	99.9	CMC Pictures	0	53142	2 hr	Crime            Drama            Thriller	Not Rated	2021
984	Scooby-Doo 2: Monsters Unleashed	181239132	84239132	46.5	97000000	53.5	Warner Bros.	0	29438331	1 hr 33 min	Adventure            Comedy            Family            Fantasy            Horror            Mystery            Sci-Fi	PG	2004
985	Hot Shots!	181096164	69467617	38.4	111628547	61.6	Twentieth Century Fox	26000000	10848182	1 hr 24 min	Action            Comedy	Not Rated	1991
986	Road to Perdition	181001478	104454762	57.7	76546716	42.3	DreamWorks Distribution	80000000	22079481	1 hr 57 min	Crime            Drama            Thriller	R	2002
987	Kill Bill: Vol. 1	180906076	70099045	38.8	110807031	61.2	Miramax	30000000	22200000	1 hr 51 min	Action            Crime            Thriller	R	2003
988	The Scorpion King	180630907	91047077	50.4	89583830	49.6	Universal Pictures	60000000	36075875	1 hr 32 min	Action            Adventure            Fantasy	PG-13	2002
989	Sweet Home Alabama	180622424	127223418	70.4	53399006	29.6	Walt Disney Studios Motion Pictures	30000000	35648740	1 hr 48 min	Comedy            Romance	PG-13	2002
990	Daddy's Home 2	180613824	104029443	57.6	76584381	42.4	Paramount Pictures	69000000	29651193	1 hr 40 min	Comedy	PG-13	2017
991	Hacksaw Ridge	180563636	67209615	37.2	113354021	62.8	Lionsgate	40000000	15190758	2 hr 19 min	Biography            Drama            History            War	R	2016
992	Deja Vu	180557550	64038616	35.5	116518934	64.5	Walt Disney Studios Motion Pictures	75000000	20574802	2 hr 6 min	Action            Crime            Sci-Fi            Thriller	PG-13	2006
993	M3gan	179629435	95043350	52.9	84586085	47.1	Universal Pictures	0	30429860	1 hr 42 min	Horror            Sci-Fi            Thriller	PG-13	2022
994	Dangerous Minds	179519401	84919401	47.3	94600000	52.7	Walt Disney Studios Motion Pictures	0	14931503	1 hr 39 min	Biography            Drama	R	1995
995	The Dictator	179379533	59650222	33.2	119729311	66.8	Paramount Pictures	65000000	17435092	1 hr 23 min	Comedy	R	2012
996	The League of Extraordinary Gentlemen	179265204	66465204	37.1	112800000	62.9	Twentieth Century Fox	78000000	23075892	1 hr 50 min	Action            Adventure            Fantasy            Sci-Fi	PG-13	2003
997	Allegiant	179246868	66184051	36.9	113062817	63.1	Lionsgate	0	29027348	2 hr	Action            Adventure            Mystery            Sci-Fi            Thriller	PG-13	2016
998	Daredevil	179179718	102543518	57.2	76636200	42.8	Twentieth Century Fox	78000000	40310419	1 hr 43 min	Action            Crime	PG-13	2003
999	City Slickers	179033791	124033791	69.3	55000000	30.7	Columbia Pictures	27000000	13032121	1 hr 53 min	Comedy            Western	Not Rated	1991
\.


--
-- Data for Name: gross; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gross (title, distributor, year, total, domestic_opening, domestic_gross, domestic_percentage, foreign_gross, foreign_percentage) FROM stdin;
Avatar	Twentieth Century Fox	2009	2923706026	77025481	785221649	26.9	2138484377	73.1
Avengers: Endgame	Walt Disney Studios Motion Pictures	2019	2799439100	357115007	858373000	30.7	1941066100	69.3
Avatar: The Way of Water	20th Century Studios	2022	2320250281	134100226	684075767	29.5	1636174514	70.5
Titanic	Paramount Pictures	1997	2264743305	28638131	674292608	29.8	1590450697	70.2
Star Wars: Episode VII - The Force Awakens	Walt Disney Studios Motion Pictures	2015	2071310218	247966675	936662225	45.2	1134647993	54.8
Avengers: Infinity War	Walt Disney Studios Motion Pictures	2018	2052415039	257698183	678815482	33.1	1373599557	66.9
Spider-Man: No Way Home	Sony Pictures Entertainment (SPE)	2021	1921847111	260138569	814115070	42.4	1107732041	57.6
Jurassic World	Universal Pictures	2015	1671537444	208806270	653406625	39.1	1018130819	60.9
The Lion King	Walt Disney Studios Motion Pictures	2019	1663075401	191770759	543638043	32.7	1119437358	67.3
The Avengers	Walt Disney Studios Motion Pictures	2012	1520538536	207438708	623357910	41	897180626	59
Furious 7	Universal Pictures	2015	1515341399	147187040	353007020	23.3	1162334379	76.7
Top Gun: Maverick	Paramount Pictures	2022	1495696292	126707459	718732821	48	776963471	52
Frozen II	Walt Disney Studios Motion Pictures	2019	1453683476	130263358	477373578	32.8	976309898	67.2
Avengers: Age of Ultron	Walt Disney Studios Motion Pictures	2015	1405018048	191271109	459005868	32.7	946012180	67.3
Black Panther	Walt Disney Studios Motion Pictures	2018	1349926083	202003951	700426566	51.9	649499517	48.1
The Super Mario Bros. Movie	Universal Pictures	2023	1345699802	146361865	573918425	42.6	771781377	57.4
Harry Potter and the Deathly Hallows: Part 2	Warner Bros.	2011	1342359942	169189427	381447587	28.4	960912355	71.6
Star Wars: Episode VIII - The Last Jedi	Walt Disney Studios Motion Pictures	2017	1334407706	220009584	620181382	46.5	714226324	53.5
Jurassic World: Fallen Kingdom	Universal Pictures	2018	1310466296	148024610	417719760	31.9	892746536	68.1
Frozen	Walt Disney Studios Motion Pictures	2013	1284540518	243390	400953009	31.2	883587509	68.8
Beauty and the Beast	Walt Disney Studios Motion Pictures	2017	1266115964	174750616	504481165	39.8	761634799	60.2
Incredibles 2	Walt Disney Studios Motion Pictures	2018	1243225667	182687905	608581744	49	634643923	51
The Fate of the Furious	Universal Pictures	2017	1236005118	98786705	226008385	18.3	1009996733	81.7
Iron Man 3	Walt Disney Studios Motion Pictures	2013	1215577205	174144585	409013994	33.6	806563211	66.4
Minions	Universal Pictures	2015	1159444662	115718405	336045770	29	823398892	71
Captain America: Civil War	Walt Disney Studios Motion Pictures	2016	1155046416	179139142	408084349	35.3	746962067	64.7
Aquaman	Warner Bros.	2018	1148528393	67873522	335104314	29.2	813424079	70.8
The Lord of the Rings: The Return of the King	New Line Cinema	2003	1147633833	72629713	379427292	33.1	768206541	66.9
Skyfall	Sony Pictures Entertainment (SPE)	2012	1142471295	88364714	304360277	26.6	838111018	73.4
Spider-Man: Far from Home	Sony Pictures Entertainment (SPE)	2019	1131927996	92579212	390532085	34.5	741395911	65.5
Captain Marvel	Walt Disney Studios Motion Pictures	2019	1131416446	153433423	426829839	37.7	704586607	62.3
Transformers: Dark of the Moon	DreamWorks	2011	1123794079	97852865	352390543	31.4	771403536	68.6
Jurassic Park	Universal Pictures	1993	1109802321	47026828	404214720	36.4	705587601	63.6
Transformers: Age of Extinction	Paramount Pictures	2014	1104054072	100038390	245439076	22.2	858614996	77.8
My People, My Homeland	Unknown	2020	422390820	0	0	0	422390820	100
The Dark Knight Rises	Warner Bros.	2012	1081169825	160887295	448149584	41.4	633020241	58.6
Star Wars: Episode IX - The Rise of Skywalker	Walt Disney Studios Motion Pictures	2019	1077022372	177383864	515202542	47.8	561819830	52.2
Joker	Warner Bros.	2019	1074458282	96202337	335477657	31.2	738980625	68.8
Toy Story 4	Walt Disney Studios Motion Pictures	2019	1073841394	120908065	434038008	40.4	639803386	59.6
Toy Story 3	Walt Disney Studios Motion Pictures	2010	1067316101	110307189	415004880	38.9	652311221	61.1
Pirates of the Caribbean: Dead Man's Chest	Walt Disney Studios Motion Pictures	2006	1066179747	135634554	423315812	39.7	642863935	60.3
Rogue One: A Star Wars Story	Walt Disney Studios Motion Pictures	2016	1058682142	155081681	533539991	50.4	525142151	49.6
Aladdin	Walt Disney Studios Motion Pictures	2019	1054304000	91500929	355559216	33.7	698744784	66.3
Pirates of the Caribbean: On Stranger Tides	Walt Disney Studios Motion Pictures	2011	1046721266	90151958	241071802	23	805649464	77
Despicable Me 3	Universal Pictures	2017	1034800131	72434025	264624300	25.6	770175831	74.4
Finding Dory	Walt Disney Studios Motion Pictures	2016	1029266989	135060273	486295561	47.2	542971428	52.8
Star Wars: Episode I - The Phantom Menace	Twentieth Century Fox	1999	1027082707	64820970	474544677	46.2	552538030	53.8
Zootopia	Walt Disney Studios Motion Pictures	2016	1025521689	75063401	341268248	33.3	684253441	66.7
Alice in Wonderland	Walt Disney Studios Motion Pictures	2010	1025468216	116101023	334191110	32.6	691277106	67.4
Harry Potter and the Sorcerer's Stone	Warner Bros.	2001	1023842938	90294621	318886962	31.2	704955976	68.8
The Hobbit: An Unexpected Journey	Warner Bros.	2012	1017030651	84617303	303030651	29.8	714000000	70.2
The Dark Knight	Warner Bros.	2008	1006234167	158411483	534987076	53.2	471247091	46.8
Jurassic World Dominion	Universal Pictures	2022	1001978080	145075625	376851080	37.6	625127000	62.4
Jumanji: Welcome to the Jungle	Sony Pictures Entertainment (SPE)	2017	995339117	36169328	404540171	40.6	590798946	59.4
Harry Potter and the Deathly Hallows: Part 1	Warner Bros.	2010	977070383	125017372	296374621	30.3	680695762	69.7
Despicable Me 2	Universal Pictures	2013	970766005	83517315	368065385	37.9	602700620	62.1
The Lion King	Walt Disney Studios Motion Pictures	1994	968511805	1586753	422783777	43.6	545728028	56.4
The Jungle Book	Walt Disney Studios Motion Pictures	2016	967724775	103261464	364001123	37.6	603723652	62.4
The Hobbit: The Battle of the Five Armies	Warner Bros.	2014	962201338	54724334	255138261	26.5	707063077	73.5
Pirates of the Caribbean: At World's End	Walt Disney Studios Motion Pictures	2007	961691209	114732820	309420425	32.2	652270784	67.8
The Hobbit: The Desolation of Smaug	Warner Bros.	2013	959027992	73645197	258387334	26.9	700640658	73.1
Doctor Strange in the Multiverse of Madness	Walt Disney Studios Motion Pictures	2022	955775804	187420998	411331607	43	544444197	57
The Lord of the Rings: The Two Towers	New Line Cinema	2002	947944270	62007528	342952511	36.2	604991759	63.8
Harry Potter and the Order of the Phoenix	Warner Bros.	2007	942278045	77108414	292382727	31	649895318	69
Finding Nemo	Walt Disney Studios Motion Pictures	2003	941637960	70251710	380843261	40.4	560794699	59.6
Minions: The Rise of Gru	Universal Pictures	2022	939628210	107010140	369695210	39.3	569933000	60.7
Harry Potter and the Half-Blood Prince	Warner Bros.	2009	934519387	77835727	302334374	32.4	632185013	67.6
Shrek 2	DreamWorks Distribution	2004	928760770	108037878	441226247	47.5	487534523	52.5
Harry Potter and the Chamber of Secrets	Warner Bros.	2002	925668380	88357488	262641637	28.4	663026743	71.6
Bohemian Rhapsody	Twentieth Century Fox	2018	910809311	51061119	216668042	23.8	694141269	76.2
The Battle at Lake Changjin	CMC Pictures	2021	902548476	105768	342411	0.1	902206065	100
The Lord of the Rings: The Fellowship of the Ring	New Line Cinema	2001	898204420	47211490	316115420	35.2	582089000	64.8
Harry Potter and the Goblet of Fire	Warner Bros.	2005	896815106	102685961	290469928	32.4	606345178	67.6
Spider-Man 3	Sony Pictures Entertainment (SPE)	2007	894983373	151116516	336530303	37.6	558453070	62.4
The Secret Life of Pets	Universal Pictures	2016	894328469	104352905	368384330	41.2	525944139	58.8
Ice Age: Dawn of the Dinosaurs	Twentieth Century Fox	2009	886686817	41690382	196573705	22.2	690113112	77.8
Spectre	Sony Pictures Entertainment (SPE)	2015	880705312	70403148	200074609	22.7	680630703	77.3
Spider-Man: Homecoming	Sony Pictures Entertainment (SPE)	2017	880166924	117027503	334201140	38	545965784	62
Ice Age: Continental Drift	Twentieth Century Fox	2012	877244782	46629259	161321843	18.4	715922939	81.6
Batman v Superman: Dawn of Justice	Warner Bros.	2016	873637528	166007347	330360194	37.8	543277334	62.2
Inception	Warner Bros.	2010	870792649	62785337	292587330	33.6	578205319	66.4
Wolf Warrior 2	The H Collective	2017	870325439	219022	2721100	0.3	867604339	99.7
Star Wars: Episode III - Revenge of the Sith	Twentieth Century Fox	2005	868390560	108435841	380270577	43.8	488119983	56.2
The Hunger Games: Catching Fire	Lionsgate	2013	865011746	158074286	424668047	49.1	440343699	50.9
Guardians of the Galaxy Vol. 2	Walt Disney Studios Motion Pictures	2017	863756051	146510104	389813101	45.1	473942950	54.9
Black Panther: Wakanda Forever	Walt Disney Studios Motion Pictures	2022	859208836	181339761	453829060	52.8	405379776	47.2
Inside Out	Walt Disney Studios Motion Pictures	2015	858848019	90440272	356921711	41.6	501926308	58.4
Venom	Sony Pictures Entertainment (SPE)	2018	856085151	80255756	213515506	24.9	642569645	75.1
Thor: Ragnarok	Walt Disney Studios Motion Pictures	2017	855301806	122744989	315058289	36.8	540243517	63.2
The Twilight Saga: Breaking Dawn - Part 2	Lionsgate	2012	848593948	141067634	292324737	34.4	556269211	65.6
Guardians of the Galaxy Vol. 3	Walt Disney Studios Motion Pictures	2023	843280349	118414021	358488599	42.5	484791750	57.5
Transformers: Revenge of the Fallen	DreamWorks	2009	836303693	108966307	402111870	48.1	434191823	51.9
Spider-Man	Sony Pictures Entertainment (SPE)	2002	825025036	114844116	407022860	49.3	418002176	50.7
Wonder Woman	Warner Bros.	2017	822854286	103251471	412845172	50.2	410009114	49.8
Hi, Mom	Unknown	2021	822009764	0	0	0	822009764	100
Independence Day	Twentieth Century Fox	1996	817400891	50228264	306169268	37.5	511231623	62.5
Coco	Walt Disney Studios Motion Pictures	2017	814337054	50802605	210460015	25.8	603877039	74.2
Fantastic Beasts and Where to Find Them	Warner Bros.	2016	814044001	74403387	234037575	28.8	580006426	71.2
Shrek the Third	DreamWorks	2007	813367380	121629270	322719944	39.7	490647436	60.3
Jumanji: The Next Level	Sony Pictures Entertainment (SPE)	2019	801693929	59251543	320314960	40	481378969	60
Harry Potter and the Prisoner of Azkaban	Warner Bros.	2004	797660766	93687367	250105651	31.4	547555115	68.6
Pirates of the Caribbean: Dead Men Tell No Tales	Walt Disney Studios Motion Pictures	2017	795922298	62983253	172558876	21.7	623363422	78.3
E.T. the Extra-Terrestrial	Universal Pictures	1982	792910554	11835389	437141279	55.1	355769275	44.9
Mission: Impossible - Fallout	Paramount Pictures	2018	791657398	61236534	220159104	27.8	571498294	72.2
2012	Sony Pictures Entertainment (SPE)	2009	791217826	65237614	166112167	21	625105659	79
Indiana Jones and the Kingdom of the Crystal Skull	Paramount Pictures	2008	790653942	100137835	317101119	40.1	473552823	59.9
Spider-Man 2	Sony Pictures Entertainment (SPE)	2004	788976453	88156227	373585825	47.4	415390628	52.6
Fast & Furious 6	Universal Pictures	2013	788680968	97375245	238679850	30.3	550001118	69.7
Deadpool 2	Twentieth Century Fox	2018	785896609	125507153	324591735	41.3	461304874	58.7
Deadpool	Twentieth Century Fox	2016	782836791	132434639	363070709	46.4	419766082	53.6
Star Wars: Episode IV - A New Hope	Twentieth Century Fox	1977	775398007	1554475	460998507	59.4	314399500	40.6
No Time to Die	Metro-Goldwyn-Mayer (MGM)	2021	774153007	55225007	160891007	20.8	613262000	79.2
Interstellar	Paramount Pictures	2014	773430538	47510360	188020017	24.3	585410521	75.7
Guardians of the Galaxy	Walt Disney Studios Motion Pictures	2014	773350147	94320883	333718600	43.2	439631547	56.8
The Batman	Warner Bros.	2022	770962583	134008624	369345583	47.9	401617000	52.1
Thor: Love and Thunder	Walt Disney Studios Motion Pictures	2022	760928081	144165107	343256830	45.1	417671251	54.9
Fast & Furious Presents: Hobbs & Shaw	Universal Pictures	2019	760732926	60038950	173956935	22.9	586775991	77.1
The Da Vinci Code	Sony Pictures Entertainment (SPE)	2006	760006945	77073388	217536138	28.6	542470807	71.4
Maleficent	Walt Disney Studios Motion Pictures	2014	759853685	69431298	241410378	31.8	518443307	68.2
The Amazing Spider-Man	Sony Pictures Entertainment (SPE)	2012	757930663	62004688	262030663	34.6	495900000	65.4
The Hunger Games: Mockingjay - Part 1	Lionsgate	2014	755356711	121897634	337135885	44.6	418220826	55.4
Shrek Forever After	DreamWorks	2010	752600867	70838207	238736787	31.7	513864080	68.3
Gravity	Warner Bros.	2013	748049949	55785112	274092705	36.6	473957244	63.4
Madagascar 3: Europe's Most Wanted	DreamWorks	2012	746921274	60316738	216391482	29	530529792	71
Suicide Squad	Warner Bros.	2016	746846894	133682248	325100054	43.5	421746840	56.5
X-Men: Days of Future Past	Twentieth Century Fox	2014	746045700	90823660	233921534	31.4	512124166	68.6
The Chronicles of Narnia: The Lion, the Witch and the Wardrobe	Walt Disney Studios Motion Pictures	2005	745013115	65556312	291710957	39.2	453302158	60.8
Monsters University	Walt Disney Studios Motion Pictures	2013	743559645	82429469	268492764	36.1	475066881	63.9
The Matrix Reloaded	Warner Bros.	2003	741847937	91774413	281576461	38	460271476	62
Up	Walt Disney Studios Motion Pictures	2009	735099102	68108790	293004164	39.9	442094938	60.1
Ne Zha	Well Go USA Entertainment	2019	726264074	1015755	3695533	0.5	722568541	99.5
F9: The Fast Saga	Universal Pictures	2021	726229501	70043165	173005945	23.8	553223556	76.2
Captain America: The Winter Soldier	Walt Disney Studios Motion Pictures	2014	714421503	95023721	259766572	36.4	454654931	63.6
The Twilight Saga: Breaking Dawn - Part 1	Summit Entertainment	2011	712205856	138122261	281287133	39.5	430918723	60.5
The Twilight Saga: New Moon	Summit Entertainment	2009	711025481	142839137	297816253	41.9	413209228	58.1
Dawn of the Planet of the Apes	Twentieth Century Fox	2014	710644566	72611427	208545589	29.4	502098977	70.6
Transformers	DreamWorks	2007	709709780	70502384	319246193	45	390463587	55
The Amazing Spider-Man 2	Sony Pictures Entertainment (SPE)	2014	708982323	91608337	202853933	28.6	506128390	71.4
Fast X	Universal Pictures	2023	704709660	67017410	145960660	20.7	558749000	79.3
It	Warner Bros.	2017	701842551	123403419	328874981	46.9	372967570	53.1
The Wandering Earth		2019	699992512	1685287	5971413	0.8	694021099	99.2
The Twilight Saga: Eclipse	Summit Entertainment	2010	698509825	64832191	300531751	43	397978074	57
Mission: Impossible - Ghost Protocol	Paramount Pictures	2011	694713380	12785204	209397903	30.1	485315477	69.9
Mamma Mia!	Universal Pictures	2008	694478392	27751240	144169664	20.8	550308728	79.2
The Hunger Games	Lionsgate	2012	694394724	152535747	408010692	58.8	286384032	41.2
Detective Chinatown 3	Warner Bros.	2021	686257563	0	0	0	686257563	100
Mission: Impossible - Rogue Nation	Paramount Pictures	2015	682716636	55520089	195042377	28.6	487674259	71.4
Moana	Walt Disney Studios Motion Pictures	2016	682685900	56631401	248757044	36.4	433928856	63.6
Forrest Gump	Paramount Pictures	1994	678226465	24450602	330455270	48.7	347771195	51.3
Doctor Strange	Walt Disney Studios Motion Pictures	2016	677796076	85058311	232641920	34.3	445154156	65.7
The Sixth Sense	Walt Disney Studios Motion Pictures	1999	672806432	26681262	293506292	43.6	379300140	56.4
Man of Steel	Warner Bros.	2013	668045518	116619362	291045518	43.6	377000000	56.4
Ice Age: The Meltdown	Twentieth Century Fox	2006	667094506	68033544	195330621	29.3	471763885	70.7
Kung Fu Panda 2	DreamWorks	2011	665692281	47656302	165249063	24.8	500443218	75.2
Spider-Man: Across the Spider-Verse	Columbia Pictures	2023	663500269	120663589	368800269	55.6	294700000	44.4
Justice League	Warner Bros.	2017	657926987	93842239	229024295	34.8	428902692	65.2
Big Hero 6	Walt Disney Studios Motion Pictures	2014	657869686	56215889	222527828	33.8	435341858	66.2
Fantastic Beasts: The Crimes of Grindelwald	Warner Bros.	2018	654855901	62163104	159555901	24.4	495300000	75.6
Pirates of the Caribbean: The Curse of the Black Pearl	Walt Disney Studios Motion Pictures	2003	654264015	46630690	305413918	46.7	348850097	53.3
Men in Black 3	Sony Pictures Entertainment (SPE)	2012	654213485	54592779	179020854	27.4	475192631	72.6
Star Wars: Episode II - Attack of the Clones	Twentieth Century Fox	2002	653779970	80027814	310676740	47.5	343103230	52.5
The Hunger Games: Mockingjay - Part 2	Lionsgate	2015	653428261	102665981	281723902	43.1	371704359	56.9
Thor: The Dark World	Walt Disney Studios Motion Pictures	2013	644783140	85737841	206362140	32	438421000	68
Sing	Universal Pictures	2016	634338384	35258145	270578425	42.7	363759959	57.3
Kung Fu Panda	DreamWorks	2008	632083197	60239130	215771591	34.1	416311606	65.9
The Incredibles	Walt Disney Studios Motion Pictures	2004	631607053	70467623	261441092	41.4	370165961	58.6
The Martian	Twentieth Century Fox	2015	630620818	54308575	228433663	36.2	402187155	63.8
Hancock	Sony Pictures Entertainment (SPE)	2008	629443428	62603879	227946274	36.2	401497154	63.8
Water Gate Bridge	CMC Pictures	2022	626571697	42707	117294	0.1	626454403	100
Fast Five	Universal Pictures	2011	626137675	86198765	209837675	33.5	416300000	66.5
Iron Man 2	Paramount Pictures	2010	623933331	128122480	312433331	50.1	311500000	49.9
Ratatouille	Walt Disney Studios Motion Pictures	2007	623726085	47027395	206445654	33.1	417280431	66.9
Ant-Man and the Wasp	Walt Disney Studios Motion Pictures	2018	622674139	75812205	216648740	34.8	406025399	65.2
How to Train Your Dragon 2	Twentieth Century Fox	2014	621537519	49451322	177002924	28.5	444534595	71.5
Logan	Twentieth Century Fox	2017	619179950	88411916	226277068	36.5	392902882	63.5
The Lost World: Jurassic Park	Universal Pictures	1997	618638999	72132785	229086679	37	389552320	63
Casino Royale	Sony Pictures Entertainment (SPE)	2006	616505162	40833156	167445960	27.2	449059202	72.8
The Passion of the Christ	Newmarket Films	2004	612054506	83848082	370782930	60.6	241271576	39.4
Life of Pi	Twentieth Century Fox	2012	609016565	22451514	124987023	20.5	484029542	79.5
Ready Player One	Warner Bros.	2018	607274134	41764050	137715350	22.7	469558784	77.3
Transformers: The Last Knight	Paramount Pictures	2017	605425157	44680073	130168683	21.5	475256474	78.5
Madagascar: Escape 2 Africa	DreamWorks	2008	603900354	63106589	180010950	29.8	423889404	70.2
War of the Worlds	Paramount Pictures	2005	603873119	64878725	234280354	38.8	369592765	61.2
Tangled	Walt Disney Studios Motion Pictures	2010	592462816	48767052	200821936	33.9	391640880	66.1
Quantum of Solace	Sony Pictures Entertainment (SPE)	2008	589580482	67528882	168368427	28.6	421212055	71.4
Men in Black	Sony Pictures Entertainment (SPE)	1997	589390539	51068455	250690539	42.5	338700000	57.5
The Croods	Twentieth Century Fox	2013	587235983	43639736	187168425	31.9	400067558	68.1
The Hangover Part II	Warner Bros.	2011	586764305	85946294	254464305	43.4	332300000	56.6
Iron Man	Paramount Pictures	2008	585796247	98618668	319034126	54.5	266762121	45.5
I Am Legend	Warner Bros.	2007	585410052	77211321	256393010	43.8	329017042	56.2
Monsters, Inc.	Walt Disney Studios Motion Pictures	2001	579707738	62577067	290642256	50.1	289065482	49.9
Operation Red Sea	Well Go USA Entertainment	2018	579330426	436059	1543547	0.3	577786879	99.7
Night at the Museum	Twentieth Century Fox	2006	574481229	30433781	250863268	43.7	323617961	56.3
Fifty Shades of Grey	Universal Pictures	2015	569651467	85171450	166167230	29.2	403484237	70.8
Kong: Skull Island	Warner Bros.	2017	566652812	61025472	168052812	29.7	398600000	70.3
The Smurfs	Sony Pictures Entertainment (SPE)	2011	563749323	35611637	142614158	25.3	421135165	74.7
Cars 2	Walt Disney Studios Motion Pictures	2011	559852396	66135507	191452396	34.2	368400000	65.8
King Kong	Universal Pictures	2005	556906378	50130145	218080025	39.2	338826353	60.8
Puss in Boots	DreamWorks	2011	554987477	34077439	149260504	26.9	405726973	73.1
The Little Mermaid	Walt Disney Studios Motion Pictures	2023	554270735	95578040	293965993	53	260304742	47
The Mermaid	Sony Pictures Entertainment (SPE)	2016	553810228	985052	3232685	0.6	550577543	99.4
Armageddon	Walt Disney Studios Motion Pictures	1998	553709788	36089972	201578182	36.4	352131606	63.6
The Day After Tomorrow	Twentieth Century Fox	2004	552639571	68743584	186740799	33.8	365898772	66.2
Ted	Universal Pictures	2012	549368315	54415205	218815487	39.8	330552828	60.2
American Sniper	Warner Bros.	2014	547459020	633456	350159020	64	197300000	36
Mission: Impossible II	Paramount Pictures	2000	546388108	57845297	215409889	39.4	330978219	60.6
Detective Chinatown 2	Warner Bros.	2018	544185156	704047	1983984	0.4	542201172	99.6
X-Men: Apocalypse	Twentieth Century Fox	2016	543934105	65769562	155442489	28.6	388491616	71.4
Sherlock Holmes: A Game of Shadows	Warner Bros.	2011	543848418	39637079	186848418	34.4	357000000	65.6
Despicable Me	Universal Pictures	2010	543157985	56397125	251557985	46.3	291600000	53.7
Cinderella	Walt Disney Studios Motion Pictures	2015	542358331	67877361	201151353	37.1	341206978	62.9
Madagascar	DreamWorks Distribution	2005	542063846	47224594	193595521	35.7	348468325	64.3
World War Z	Paramount Pictures	2013	540455876	66411834	202807711	37.5	337648165	62.5
Brave	Walt Disney Studios Motion Pictures	2012	538983207	66323594	237283207	44	301700000	56
Star Wars: Episode V - The Empire Strikes Back	Twentieth Century Fox	1980	538375067	4910483	292753960	54.4	245621107	45.6
The Simpsons Movie	Twentieth Century Fox	2007	536414293	74036787	183135014	34.1	353279279	65.9
The Revenant	Twentieth Century Fox	2015	532950503	474560	183637894	34.5	349312609	65.5
The Meg	Warner Bros.	2018	530517320	45402195	145522784	27.4	384994536	72.6
Ralph Breaks the Internet	Walt Disney Studios Motion Pictures	2018	529323962	56237634	201091711	38	328232251	62
Hotel Transylvania 3: Summer Vacation	Sony Pictures Entertainment (SPE)	2018	528583774	44076225	167510016	31.7	361073758	68.3
The Boss Baby	Twentieth Century Fox	2017	527965936	50198902	175003033	33.2	352962903	66.8
Dunkirk	Warner Bros.	2017	527016307	50513488	189740665	36	337275642	64
The Grinch	Universal Pictures	2018	526760632	67572855	271384731	51.5	255375901	48.5
Godzilla	Warner Bros.	2014	524976069	93188384	200676069	38.2	324300000	61.8
How to Train Your Dragon: The Hidden World	Universal Pictures	2019	524580592	55022245	160945505	30.7	363635087	69.3
Sherlock Holmes	Warner Bros.	2009	524028679	62304277	209028679	39.9	315000000	60.1
Meet the Fockers	Universal Pictures	2004	522657936	46120980	279261160	53.4	243396776	46.6
WALL·E	Walt Disney Studios Motion Pictures	2008	521311890	63087526	223808164	42.9	297503726	57.1
Kung Fu Panda 3	Twentieth Century Fox	2016	521170825	41282042	143528619	27.5	377642206	72.5
Terminator 2: Judgment Day	TriStar Pictures	1991	520881154	31765506	205881154	39.5	315000000	60.5
Ant-Man	Walt Disney Studios Motion Pictures	2015	519311965	57225526	180202163	34.7	339109802	65.3
Venom: Let There Be Carnage	Sony Pictures Entertainment (SPE)	2021	506863592	90033210	213550366	42.1	293313226	57.9
Ghost	Paramount Pictures	1990	505703557	12191540	217631306	43	288072251	57
Aladdin	Walt Disney Studios Motion Pictures	1992	504050219	196664	217350219	43.1	286700000	56.9
Gladiator	DreamWorks Distribution	2000	503162313	34819017	187705427	37.3	315456886	62.7
Rio 2	Twentieth Century Fox	2014	498781117	39327869	131538435	26.4	367242682	73.6
Troy	Warner Bros.	2004	497409852	46865412	133378256	26.8	364031596	73.2
Toy Story 2	Walt Disney Studios Motion Pictures	1999	497375381	300163	245852179	49.4	251523202	50.6
How to Train Your Dragon	DreamWorks	2010	494879471	43732319	217581231	44	277298240	56
Twister	Warner Bros.	1996	494580615	41059405	241830615	48.9	252750000	51.1
Oz the Great and Powerful	Walt Disney Studios Motion Pictures	2013	493311825	79110453	234911825	47.6	258400000	52.4
Clash of the Titans	Warner Bros.	2010	493214993	61235105	163214888	33.1	330000105	66.9
Maleficent: Mistress of Evil	Walt Disney Studios Motion Pictures	2019	491730089	36948713	113929605	23.2	377800484	76.8
War for the Planet of the Apes	Twentieth Century Fox	2017	490719763	56262929	146880162	29.9	343839601	70.1
Shrek	DreamWorks Distribution	2001	488441368	42347760	268163011	54.9	220278357	45.1
Mr. & Mrs. Smith	Twentieth Century Fox	2005	487287646	50342878	186336279	38.2	300951367	61.8
Angels & Demons	Sony Pictures Entertainment (SPE)	2009	485930816	46204168	133375846	27.4	352554970	72.6
Teenage Mutant Ninja Turtles	Paramount Pictures	2014	485004754	65575105	191204754	39.4	293800000	60.6
Bruce Almighty	Universal Pictures	2003	484592874	67953330	242829261	50.1	241763613	49.9
The King's Speech	The Weinstein Company	2010	484068861	355450	138797449	28.7	345271412	71.3
Rio	Twentieth Century Fox	2011	483866772	39225962	143619809	29.7	340246963	70.3
Saving Private Ryan	DreamWorks Distribution	1998	482349603	30576104	217049603	45	265300000	55
Rise of the Planet of the Apes	Twentieth Century Fox	2011	481800873	54806191	176760185	36.7	305040688	63.3
Puss in Boots: The Last Wish	Universal Pictures	2022	480953264	12429515	185535345	38.6	295417919	61.4
Home Alone	Twentieth Century Fox	1990	476684675	17081997	285761243	60	190923432	40
Jaws	Universal Pictures	1975	476512065	7061513	265859065	55.8	210653000	44.2
Ant-Man and the Wasp: Quantumania	Walt Disney Studios Motion Pictures	2023	476071180	106109650	214504909	45.1	261566271	54.9
Hotel Transylvania 2	Sony Pictures Entertainment (SPE)	2015	475186706	48464322	169700110	35.7	305486596	64.3
Star Wars: Episode VI - Return of the Jedi	Twentieth Century Fox	1983	475106177	23019618	316566101	66.6	158540076	33.4
Charlie and the Chocolate Factory	Warner Bros.	2005	474968763	56178450	206459076	43.5	268509687	56.5
Indiana Jones and the Last Crusade	Paramount Pictures	1989	474171806	29355021	197171806	41.6	277000000	58.4
San Andreas	Warner Bros.	2015	474009154	54588173	155190832	32.7	318818322	67.3
It Chapter Two	Warner Bros.	2019	473122525	91062152	211622525	44.7	261500000	55.3
La La Land	Lionsgate	2016	471974387	881104	151101803	32	320872584	68
Wreck-It Ralph	Walt Disney Studios Motion Pictures	2012	471222889	49038712	189422889	40.2	281800000	59.8
Godzilla vs. Kong	Warner Bros.	2021	470116094	31625971	100916094	21.5	369200000	78.5
The Hangover	Warner Bros.	2009	469328079	44979319	277339746	59.1	191988333	40.9
Lucy	Universal Pictures	2014	469058574	43899340	126663600	27	342394974	73
The Lego Movie	Warner Bros.	2014	468266122	69050279	257966122	55.1	210300000	44.9
Bumblebee	Paramount Pictures	2018	467989645	21654047	127195589	27.2	340794056	72.8
Star Trek Into Darkness	Paramount Pictures	2013	467365246	70165559	228778661	49	238586585	51
The Matrix	Warner Bros.	1999	467222728	27788331	172076928	36.8	295145800	63.2
Pretty Woman	Walt Disney Studios Motion Pictures	1990	463406268	11280591	178406268	38.5	285000000	61.5
Cars	Walt Disney Studios Motion Pictures	2006	461991867	60119509	244082982	52.8	217908885	47.2
The Eight Hundred	CMC Pictures	2020	461421559	118161	372755	0.1	461048804	99.9
X-Men: The Last Stand	Twentieth Century Fox	2006	460435291	102750665	234362462	50.9	226072829	49.1
Moon Man	Unknown	2022	460237662	0	0	0	460237662	100
National Treasure: Book of Secrets	Walt Disney Studios Motion Pictures	2007	459242249	44783772	219964115	47.9	239278134	52.1
Mission: Impossible	Paramount Pictures	1996	457696391	45436830	180981856	39.5	276714535	60.5
300	Warner Bros.	2007	456082343	70885301	210629101	46.2	245453242	53.8
The Last Samurai	Warner Bros.	2003	454627263	24271354	111127263	24.4	343500000	75.6
Demon Slayer the Movie: Mugen Train	FUNimation Entertainment	2020	453210959	21234994	49505008	10.9	403705951	89.1
Dying to Survive	Unknown	2018	451183391	0	6752	0	451176639	100
Ocean's Eleven	Warner Bros.	2001	450717150	38107822	183417150	40.7	267300000	59.3
My People, My Country		2019	450064993	876001	2356683	0.5	447708310	99.5
Pokémon: Detective Pikachu	Warner Bros.	2019	449762638	54365242	144174568	32.1	305588070	67.9
Thor	Paramount Pictures	2011	449326618	65723338	181030624	40.3	268295994	59.7
Pearl Harbor	Walt Disney Studios Motion Pictures	2001	449220945	59078912	198542554	44.2	250678391	55.8
Tarzan	Walt Disney Studios Motion Pictures	1999	448191819	34221968	171091819	38.2	277100000	61.8
Men in Black II	Sony Pictures Entertainment (SPE)	2002	445135288	52148751	193735288	43.5	251400000	56.5
The Bourne Ultimatum	Universal Pictures	2007	444100035	69283690	227471070	51.2	216628965	48.8
The Mummy Returns	Universal Pictures	2001	443280904	68139035	202019785	45.6	241261119	54.4
Alvin and the Chipmunks: The Squeakquel	Twentieth Century Fox	2009	443140005	48875415	219614612	49.6	223525393	50.4
Les Misérables	Universal Pictures	2012	442299309	27281735	148809770	33.6	293489539	66.4
The Exorcist	Warner Bros.	1973	441306145	0	233005644	52.8	208300501	47.2
Mrs. Doubtfire	Twentieth Century Fox	1993	441286195	20468847	219195243	49.7	222090952	50.3
Terminator Genisys	Paramount Pictures	2015	440603537	27018486	89760956	20.4	350842581	79.6
Warcraft	Universal Pictures	2016	439048914	24166110	47365290	10.8	391683624	89.2
A Star Is Born	Warner Bros.	2018	436233122	42908051	215333122	49.4	220900000	50.6
The Greatest Showman	Twentieth Century Fox	2017	435732529	8805843	174340174	40	261392355	60
Terminator 3: Rise of the Machines	Warner Bros.	2003	433371112	44041440	150371112	34.7	283000000	65.3
Shang-Chi and the Legend of the Ten Rings	Walt Disney Studios Motion Pictures	2021	432243292	75388688	224543292	52	207700000	48
Die Another Day	Metro-Goldwyn-Mayer (MGM)	2002	431971116	47072040	160942139	37.3	271028977	62.7
The Secret Life of Pets 2	Universal Pictures	2019	431058604	46652680	158874395	36.9	272184209	63.1
Cast Away	Twentieth Century Fox	2000	429632142	28883406	233632142	54.4	196000000	45.6
Rampage	Warner Bros.	2018	428028233	35753093	101028233	23.6	327000000	76.4
The Matrix Revolutions	Warner Bros.	2003	427344325	48475154	139313948	32.6	288030377	67.4
John Wick: Chapter 4	Lionsgate	2023	426907099	73817950	187131806	43.8	239775293	56.2
The Intouchables	The Weinstein Company	2011	426588510	103507	10198820	2.4	416389690	97.6
Bad Boys for Life	Sony Pictures Entertainment (SPE)	2020	426505244	62504105	206305244	48.4	220200000	51.6
Django Unchained	The Weinstein Company	2012	426074373	30122888	162805434	38.2	263268939	61.8
Beauty and the Beast	Walt Disney Studios Motion Pictures	1991	424967620	162146	218967620	51.5	206000000	48.5
Dances with Wolves	Orion Pictures	1990	424208848	598257	184208848	43.4	240000000	56.6
Transformers: Rise of the Beasts	Paramount Pictures	2023	420985930	61045464	152785930	36.3	268200000	63.7
The Chronicles of Narnia: Prince Caspian	Walt Disney Studios Motion Pictures	2008	419665568	55034805	141621490	33.8	278044078	66.2
Sex and the City	Warner Bros.	2008	418765519	57038404	152647258	36.4	266118261	63.6
The Captain	Well Go USA Entertainment	2019	417282021	324769	706572	0.2	416575449	99.8
The Mummy	Universal Pictures	1999	415933406	43369635	155385488	37.4	260547918	62.6
The Chronicles of Narnia: The Voyage of the Dawn Treader	Twentieth Century Fox	2010	415686217	24005069	104386950	25.1	311299267	74.9
Jason Bourne	Universal Pictures	2016	415484914	59215365	162434410	39.1	253050504	60.9
The Wolverine	Twentieth Century Fox	2013	414828246	53113752	132556852	32	282271394	68
Kingsman: The Secret Service	Twentieth Century Fox	2015	414351546	36206331	128261724	31	286089822	69
Night at the Museum: Battle of the Smithsonian	Twentieth Century Fox	2009	413106170	54173286	177243721	42.9	235862449	57.1
Batman	Warner Bros.	1989	411569241	40489746	251409241	61.1	160160000	38.9
The Bodyguard	Warner Bros.	1992	411046449	16611793	122046449	29.7	289000000	70.3
Pacific Rim	Warner Bros.	2013	411002906	37285325	101802906	24.8	309200000	75.2
Kingsman: The Golden Circle	Twentieth Century Fox	2017	410902662	39023010	100234838	24.4	310667824	75.6
The Mummy	Universal Pictures	2017	409231607	31688375	80227895	19.6	329003712	80.4
Ice Age: Collision Course	Twentieth Century Fox	2016	408754975	21373064	64063008	15.7	344691967	84.3
Twilight	Summit Entertainment	2008	408430415	69637740	193962473	47.5	214467942	52.5
Sing 2	Universal Pictures	2021	408401214	22326230	162790990	39.9	245610224	60.1
Signs	Walt Disney Studios Motion Pictures	2002	408247917	60117080	227966634	55.8	180281283	44.2
X2: X-Men United	Twentieth Century Fox	2003	407711549	85558731	214949694	52.7	192761855	47.3
Fantastic Beasts: The Secrets of Dumbledore	Warner Bros.	2022	407150844	42151256	95850844	23.5	311300000	76.5
Uncharted	Sony Pictures Entertainment (SPE)	2022	407141258	44010155	148648820	36.5	258492438	63.5
The Wolf of Wall Street	Paramount Pictures	2013	406878233	18361578	116900694	28.7	289977539	71.3
Sonic the Hedgehog 2	Paramount Pictures	2022	405421518	72105176	190872904	47.1	214548614	52.9
Alita: Battle Angel	Twentieth Century Fox	2019	404980543	28525613	85838210	21.2	319142333	78.8
The Mummy: Tomb of the Dragon Emperor	Universal Pictures	2008	403449830	40457770	102491776	25.4	300958054	74.6
Prometheus	Twentieth Century Fox	2012	403354469	51050101	126477084	31.4	276877385	68.6
Gone with the Wind	Metro-Goldwyn-Mayer (MGM)	1939	402382193	0	200882193	49.9	201500000	50.1
Mamma Mia! Here We Go Again	Universal Pictures	2018	402264843	34952180	120634935	30	281629908	70
Eternals	Walt Disney Studios Motion Pictures	2021	402064899	71297219	164870234	41	237194665	59
Dune	Warner Bros.	2021	402027830	41011174	108327830	27	293700000	73
TRON: Legacy	Walt Disney Studios Motion Pictures	2010	400063852	44026211	172062763	43	228001089	57
Mission: Impossible III	Paramount Pictures	2006	398479497	47743273	134029801	33.6	264449696	66.4
Snow White and the Huntsman	Universal Pictures	2012	396592829	56217700	155332381	39.2	241260448	60.8
Grease	Paramount Pictures	1978	396271103	8941717	190071103	48	206200000	52
Fifty Shades Freed	Universal Pictures	2018	371985018	38560195	100407760	27	271577258	73
Toy Story	Walt Disney Studios Motion Pictures	1995	394436586	29140617	223225679	56.6	171210907	43.4
Black Adam	Warner Bros.	2022	393252111	67004323	168152111	42.8	225100000	57.2
Solo: A Star Wars Story	Walt Disney Studios Motion Pictures	2018	392924807	84420489	213767512	54.4	179157295	45.6
Superman Returns	Warner Bros.	2006	391081192	52535096	200081192	51.2	191000000	48.8
Robin Hood: Prince of Thieves	Warner Bros.	1991	390493908	25625602	165493908	42.4	225000000	57.6
Raiders of the Lost Ark	Paramount Pictures	1981	389925971	8305823	248159971	63.6	141766000	36.4
Independence Day: Resurgence	Twentieth Century Fox	2016	389681935	41039944	103144286	26.5	286537649	73.5
Live Free or Die Hard	Twentieth Century Fox	2007	388156011	33369559	134529403	34.7	253626608	65.3
Monster Hunt	FilmRise	2015	387053506	21074	32766	0.1	387020740	100
Godzilla: King of the Monsters	Warner Bros.	2019	386600138	47776293	110500138	28.6	276100000	71.4
Home	Twentieth Century Fox	2015	386041607	52107731	177397510	46	208644097	54
Star Trek	Paramount Pictures	2009	385680446	75204289	257730019	66.8	127950427	33.2
1917	Universal Pictures	2019	384579437	576216	159227644	41.4	225351793	58.6
Happy Feet	Warner Bros.	2006	384336108	41533432	198000317	51.5	186335791	48.5
Spider-Man: Into the Spider-Verse	Sony Pictures Entertainment (SPE)	2018	384256930	35363376	190241310	49.5	194015620	50.5
Cars 3	Walt Disney Studios Motion Pictures	2017	383930656	53688680	152901115	39.8	231029541	60.2
Back to the Future	Universal Pictures	1985	383336762	11152500	212836762	55.5	170500000	44.5
Ice Age	Twentieth Century Fox	2002	383257136	46312454	176387405	46	206869731	54
Your Name.	FUNimation Entertainment	2016	382238181	1813781	5017246	1.3	377220935	98.7
Fifty Shades Darker	Universal Pictures	2017	381545846	46607250	114581250	30	266964596	70
Monsters vs. Aliens	DreamWorks	2009	381509870	59321095	198351526	52	183158344	48
Mad Max: Fury Road	Warner Bros.	2015	380080290	45428128	154280290	40.6	225800000	59.4
Black Widow	Walt Disney Studios Motion Pictures	2021	379751655	80366312	183651655	48.4	196100000	51.6
Godzilla	Sony Pictures Entertainment (SPE)	1998	379014294	44047541	136314294	36	242700000	64
True Lies	Twentieth Century Fox	1994	378882411	25869770	146282411	38.6	232600000	61.4
Slumdog Millionaire		2008	378410542	360018	141319928	37.4	237090614	62.6
Once Upon a Time in Hollywood	Sony Pictures Entertainment (SPE)	2019	377617598	41082018	142502728	37.7	235114870	62.3
Taken 2	Twentieth Century Fox	2012	376152455	49514769	139854287	37.2	236298168	62.8
G.I. Joe: Retaliation	Paramount Pictures	2013	375740705	40501814	122523060	32.6	253217645	67.4
Shark Tale	DreamWorks Distribution	2004	374583879	47604606	160861908	42.9	213721971	57.1
What Women Want	Paramount Pictures	2000	374111707	33614543	182811707	48.9	191300000	51.1
The Adventures of Tintin	Paramount Pictures	2011	373993951	9720993	77591831	20.8	296402120	79.2
Batman Begins	Warner Bros.	2005	373672993	48745440	206863479	55.4	166809514	44.6
Penguins of Madagascar	Twentieth Century Fox	2014	373515621	25447444	83850911	22.4	289664710	77.6
X-Men Origins: Wolverine	Twentieth Century Fox	2009	373062864	85058003	179883157	48.2	193179707	51.8
The Golden Compass	New Line Cinema	2007	372234864	26125000	70107728	18.8	302127136	81.2
Hitch	Sony Pictures Entertainment (SPE)	2005	371594210	43142214	179495555	48.3	192098655	51.7
Terminator Salvation	Warner Bros.	2009	371353001	42558390	125322469	33.8	246030532	66.2
Captain America: The First Avenger	Paramount Pictures	2011	370569774	65058524	176654505	47.7	193915269	52.3
Edge of Tomorrow	Warner Bros.	2014	370541256	28760246	100206256	27	270335000	73
There's Something About Mary	Twentieth Century Fox	1998	369884651	13740644	176484651	47.7	193400000	52.3
Gone Girl	Twentieth Century Fox	2014	369330363	37513109	167767189	45.4	201563174	54.6
The Fugitive	Warner Bros.	1993	368875760	23758855	183875760	49.8	185000000	50.2
Jurassic Park III	Universal Pictures	2001	368780809	50771645	181171875	49.1	187608934	50.9
My Big Fat Greek Wedding	IFC Films	2002	368744044	597362	241438208	65.5	127305836	34.5
Shazam!	Warner Bros.	2019	367799011	53505326	140480049	38.2	227318962	61.8
Hello Mr. Billionaire	Unknown	2018	366961907	0	0	0	366961907	100
Die Hard with a Vengeance	Twentieth Century Fox	1995	366101666	22162245	100012499	27.3	266089167	72.7
The Nun	Warner Bros.	2018	365582797	53807379	117481222	32.1	248101575	67.9
Alvin and the Chipmunks	Twentieth Century Fox	2007	365352546	44307417	217326974	59.5	148025572	40.5
Tenet	Warner Bros.	2020	365304105	9353090	58504105	16	306800000	84
Notting Hill	Universal Pictures	1999	363889678	21811180	116089678	31.9	247800000	68.1
A Bug's Life	Walt Disney Studios Motion Pictures	1998	363258859	291121	162798565	44.8	200460294	55.2
Night at the Museum: Secret of the Tomb	Twentieth Century Fox	2014	363204635	17100520	113746621	31.3	249458014	68.7
Ocean's Twelve	Warner Bros.	2004	362744280	39153380	125544280	34.6	237200000	65.4
Planet of the Apes	Twentieth Century Fox	2001	362211740	68532960	180011740	49.7	182200000	50.3
The Hangover Part III	Warner Bros.	2013	362000072	41671198	112200072	31	249800000	69
The World Is Not Enough	Metro-Goldwyn-Mayer (MGM)	1999	361832400	35519007	126943684	35.1	234888716	64.9
Monster Hunt 2	Lionsgate	2018	361682618	341834	706153	0.2	360976465	99.8
Fast & Furious	Universal Pictures	2009	360366870	70950500	155064265	43	205302605	57
Noah	Paramount Pictures	2014	359200044	43720472	101200044	28.2	258000000	71.8
The Karate Kid	Sony Pictures Entertainment (SPE)	2010	359126022	55665805	176591618	49.2	182534404	50.8
Home Alone 2: Lost in New York	Twentieth Century Fox	1992	358994850	31126882	173585516	48.4	185409334	51.6
Hotel Transylvania	Sony Pictures Entertainment (SPE)	2012	358375603	42522194	148313048	41.4	210062555	58.6
Minority Report	Twentieth Century Fox	2002	358372926	35677125	132072926	36.8	226300000	63.2
Top Gun	Paramount Pictures	1986	357288178	8193052	180258178	50.4	177030000	49.6
Spirited Away	Walt Disney Studios Motion Pictures	2001	357277400	449839	15205725	4.3	342071675	95.7
The Legend of Tarzan	Warner Bros.	2016	356700357	38527856	126643061	35.5	230057296	64.5
American Beauty	DreamWorks Distribution	1999	356296601	861531	130096601	36.5	226200000	63.5
Apollo 13	Universal Pictures	1995	355237933	25353380	173837933	48.9	181400000	51.1
Rain Man	Metro-Goldwyn-Mayer (MGM)	1988	354825435	7005719	172825435	48.7	182000000	51.3
The Great Gatsby	Warner Bros.	2013	353659851	50085185	144857996	41	208801855	59
Dumbo	Walt Disney Studios Motion Pictures	2019	353284621	45990748	114766307	32.5	238518314	67.5
I, Robot	Twentieth Century Fox	2004	353133898	52179887	144801023	41	208332875	59
Basic Instinct	TriStar Pictures	1992	352927224	15129385	117727224	33.4	235200000	66.6
Murder on the Orient Express	Twentieth Century Fox	2017	352794081	28681472	102826543	29.2	249967538	70.8
X-Men: First Class	Twentieth Century Fox	2011	352616690	55101604	146408305	41.5	206208385	58.5
The Angry Birds Movie	Sony Pictures Entertainment (SPE)	2016	352333929	38155177	107509366	30.5	244824563	69.5
GoldenEye	Metro-Goldwyn-Mayer (MGM)	1995	352194034	26205007	106429941	30.2	245764093	69.8
Catch Me If You Can	DreamWorks Distribution	2002	352114312	30053627	164615351	46.8	187498961	53.2
Now You See Me	Lionsgate	2013	351723989	29350389	117723989	33.5	234000000	66.5
Hannibal	Metro-Goldwyn-Mayer (MGM)	2001	351692268	58003121	165092268	46.9	186600000	53.1
The Mask	New Line Cinema	1994	351583407	23117068	119938730	34.1	231644677	65.9
Peter Rabbit	Sony Pictures Entertainment (SPE)	2018	351496066	25010928	115253424	32.8	236242642	67.2
Speed	Twentieth Century Fox	1994	350448145	14456194	121248145	34.6	229200000	65.4
Dinosaur	Walt Disney Studios Motion Pictures	2000	349822765	38854851	137748063	39.4	212074702	60.6
Mary Poppins Returns	Walt Disney Studios Motion Pictures	2018	349546142	23523121	171958438	49.2	177587704	50.8
Deep Impact	Paramount Pictures	1998	349464664	41152375	140464664	40.2	209000000	59.8
The Lorax	Universal Pictures	2012	349183316	70217070	214373500	61.4	134809816	38.6
The Maze Runner	Twentieth Century Fox	2014	348319861	32512804	102427862	29.4	245891999	70.6
The Smurfs 2	Sony Pictures Entertainment (SPE)	2013	347545360	17548389	71017784	20.4	276527576	79.6
National Treasure	Walt Disney Studios Motion Pictures	2004	347512318	35142554	173008894	49.8	174503424	50.2
Rush Hour 2	New Line Cinema	2001	347325802	67408222	226164286	65.1	121161516	34.9
Trolls	Twentieth Century Fox	2016	347182886	46581142	154025064	44.4	193157822	55.6
xXx: Return of Xander Cage	Paramount Pictures	2017	346118277	20130142	44898413	13	301219864	87
Pocahontas	Walt Disney Studios Motion Pictures	1995	346079773	2689714	141579773	40.9	204500000	59.1
How the Grinch Stole Christmas	Universal Pictures	2000	345823032	55082330	260715005	75.4	85108027	24.6
Star Trek Beyond	Paramount Pictures	2016	343471816	59253211	158848340	46.2	184623476	53.8
Alvin and the Chipmunks: Chipwrecked	Twentieth Century Fox	2011	342695435	23244744	133110742	38.8	209584693	61.2
Wanted	Universal Pictures	2008	342463063	50927085	134508551	39.3	207954512	60.7
The Flintstones	Universal Pictures	1994	341631208	29688730	130531208	38.2	211100000	61.8
A Quiet Place	Paramount Pictures	2018	340952971	50203562	188024361	55.2	152928610	44.8
Enchanted	Walt Disney Studios Motion Pictures	2007	340487862	34440317	127807262	37.5	212680600	62.5
Over the Hedge	DreamWorks	2006	339795890	38457003	155019340	45.6	184776550	54.4
300: Rise of an Empire	Warner Bros.	2014	337580051	45038460	106580051	31.6	231000000	68.4
Batman Forever	Warner Bros.	1995	336567158	52784433	184069126	54.7	152498032	45.3
Prince of Persia: The Sands of Time	Walt Disney Studios Motion Pictures	2009	336365676	30095259	90759676	27	245606000	73
The Curious Case of Benjamin Button	Paramount Pictures	2008	335802786	26853816	127509326	38	208293460	62
Journey 2: The Mysterious Island	Warner Bros.	2012	335287748	27335363	103887748	31	231400000	69
The Rock	Walt Disney Studios Motion Pictures	1996	335062621	25069525	134069511	40	200993110	60
The Great Wall	Universal Pictures	2016	334933831	18469620	45540830	13.6	289393001	86.4
Now You See Me 2	Lionsgate	2016	334897606	22383146	65075540	19.4	269822066	80.6
Never Say Die	Unknown	2017	334530869	0	0	0	334530869	100
Bridget Jones's Diary	Miramax	2001	334272563	10733933	71543427	21.4	262729136	78.6
Fantastic Four	Twentieth Century Fox	2005	333535934	56061504	154696080	46.4	178839854	53.6
Indiana Jones and the Temple of Doom	Paramount Pictures	1984	333107271	25337110	179870271	54	153237000	46
Tomorrow Never Dies	Metro-Goldwyn-Mayer (MGM)	1997	333011068	25143007	125304276	37.6	207706792	62.4
Back to the Future Part II	Universal Pictures	1989	332500002	27835125	119000002	35.8	213500000	64.2
The Good Dinosaur	Walt Disney Studios Motion Pictures	2015	332207671	39155217	123087120	37	209120551	63
Free Guy	20th Century Studios	2021	331526598	28365416	121626598	36.7	209900000	63.3
22 Jump Street	Sony Pictures Entertainment (SPE)	2014	331333876	57071445	191719337	57.9	139614539	42.1
Meet the Parents	Universal Pictures	2000	330444045	28623300	166244045	50.3	164200000	49.7
Who Framed Roger Rabbit	Walt Disney Studios Motion Pictures	1988	329803958	11226239	156452370	47.4	173351588	52.6
Black Swan		2010	329398046	1443809	106954678	32.5	222443368	67.5
The Perfect Storm	Warner Bros.	2000	328718434	41325042	182618434	55.6	146100000	44.4
John Wick: Chapter 3 - Parabellum	Lionsgate	2019	328349387	56818067	171015687	52.1	157333700	47.9
Crocodile Dundee	Paramount Pictures	1986	328203506	8038855	174803506	53.3	153400000	46.7
Crazy Alien	Unknown	2019	327598891	0	0	0	327598891	100
Se7en	New Line Cinema	1995	327333559	13949807	100125643	30.6	227207916	69.4
The Devil Wears Prada	Twentieth Century Fox	2006	326706115	27537244	124740460	38.2	201965655	61.8
Taken 3	Twentieth Century Fox	2015	326479141	39201657	89256424	27.3	237222717	72.7
The Hunchback of Notre Dame	Walt Disney Studios Motion Pictures	1996	325338851	21037414	100138851	30.8	225200000	69.2
A Christmas Carol	Walt Disney Studios Motion Pictures	2009	325286646	30051075	137855863	42.4	187430783	57.6
The SpongeBob Movie: Sponge Out of Water	Paramount Pictures	2015	325186032	55365012	162994032	50.1	162192000	49.9
Schindler's List	Universal Pictures	1993	322161245	656636	96898818	30.1	225262427	69.9
Megamind	DreamWorks	2010	321885765	46016833	148415853	46.1	173469912	53.9
The Conjuring 2	Warner Bros.	2016	321834351	40406314	102516140	31.8	219318211	68.2
Green Book	Universal Pictures	2018	321752656	320429	85080171	26.4	236672485	73.6
Lethal Weapon 3	Warner Bros.	1992	321731527	33243086	144731527	45	177000000	55
Robin Hood	Universal Pictures	2010	321669741	36063385	105269730	32.7	216400011	67.3
Inglourious Basterds	The Weinstein Company	2009	321457747	38054676	120540719	37.5	200917028	62.5
101 Dalmatians	Walt Disney Studios Motion Pictures	1996	320689294	33504025	136189294	42.5	184500000	57.5
The Conjuring	Warner Bros.	2013	320406242	41855326	137446368	42.9	182959874	57.1
Fatal Attraction	Paramount Pictures	1987	320145693	7602740	156645693	48.9	163500000	51.1
Sonic the Hedgehog	Paramount Pictures	2020	319715683	58018348	148974665	46.6	170741018	53.4
The Last Airbender	Paramount Pictures	2010	319713881	40325019	131772187	41.2	187941694	58.8
The Proposal	Walt Disney Studios Motion Pictures	2009	317375031	33627598	163958031	51.7	153417000	48.3
The Polar Express	Warner Bros.	2004	316897787	23323463	189528738	59.8	127369049	40.2
A Beautiful Mind	Universal Pictures	2001	316791257	367151	170742341	53.9	146048916	46.1
Beverly Hills Cop	Paramount Pictures	1984	316360478	15214805	234760478	74.2	81600000	25.8
Air Force One	Sony Pictures Entertainment (SPE)	1997	315156409	37132505	172956409	54.9	142200000	45.1
Wonder	Lionsgate	2017	315025930	27547866	132422809	42	182603121	58
The Expendables 2	Lionsgate	2012	314975955	28591370	85028192	27	229947763	73
Chicken Little	Walt Disney Studios Motion Pictures	2005	314432837	40049778	135386665	43.1	179046172	56.9
As Good as It Gets	Sony Pictures Entertainment (SPE)	1997	314178011	12606928	148478011	47.3	165700000	52.7
Elemental	Walt Disney Studios Motion Pictures	2023	313203146	29602429	125688508	40.1	187514638	59.9
Knives Out	Lionsgate	2019	312897920	26769548	165363234	52.8	147534686	47.2
Maze Runner: The Scorch Trials	Twentieth Century Fox	2015	312296056	30316510	81697192	26.2	230598864	73.8
Resident Evil: The Final Chapter	Screen Gems	2016	312242626	13601682	26830068	8.6	285412558	91.4
The Lego Batman Movie	Warner Bros.	2017	312136671	53003468	175936671	56.4	136200000	43.6
Austin Powers: The Spy Who Shagged Me	New Line Cinema	1999	312016928	17981900	206040086	66	105976842	34
Ocean's Thirteen	Warner Bros.	2007	311312624	36133403	117154724	37.6	194157900	62.4
Little Fockers	Universal Pictures	2010	310650585	30833665	148438600	47.8	162211985	52.2
Bolt	Walt Disney Studios Motion Pictures	2008	309979994	26223128	114053579	36.8	195926415	63.2
Ransom	Walt Disney Studios Motion Pictures	1996	309492681	34216088	136492681	44.1	173000000	55.9
Runaway Bride	Paramount Pictures	1999	309460292	35055556	152257509	49.2	157202783	50.8
The Blind Side	Warner Bros.	2009	309231694	34119372	255982860	82.8	53248834	17.2
The Ex-File 3: Return of the Exes	China Lion Film Distribution	2017	307592427	125291	838959	0.3	306753468	99.7
The Fault in Our Stars	Twentieth Century Fox	2014	307166834	48002523	124872350	40.6	182294484	59.4
The Pursuit of Happyness	Sony Pictures Entertainment (SPE)	2006	307127625	26541709	163566459	53.3	143561166	46.7
Rise of the Guardians	DreamWorks	2012	306941670	23773465	103412758	33.7	203528912	66.3
Close Encounters of the Third Kind	Columbia Pictures	1977	306889114	0	135189114	44	171700000	56
Chicago	Miramax	2002	306776732	2074929	170687518	55.6	136089214	44.4
Annabelle: Creation	Warner Bros.	2017	306515884	35006404	102092201	33.3	204423683	66.7
Bridesmaids	Universal Pictures	2011	306442085	26247410	169106725	55.2	137335360	44.8
Skyscraper	Universal Pictures	2018	304868961	24905015	68420120	22.4	236448841	77.6
A Good Day to Die Hard	Twentieth Century Fox	2013	304654182	24834845	67349198	22.1	237304984	77.9
Mulan	Walt Disney Studios Motion Pictures	1998	304320254	22745143	120620254	39.6	183700000	60.4
Dangal	UTV Motion Pictures	2016	303723636	3248481	12391761	4.1	291331875	95.9
Indiana Jones and the Dial of Destiny	Walt Disney Studios Motion Pictures	2023	303552422	60368101	145628290	48	157924132	52
Passengers	Sony Pictures Entertainment (SPE)	2016	303144152	14869736	100014699	33	203129453	67
Battleship	Universal Pictures	2012	303025485	25534825	65422625	21.6	237602860	78.4
Liar Liar	Universal Pictures	1997	302710615	31423025	181410615	59.9	121300000	40.1
G.I. Joe: The Rise of Cobra	Paramount Pictures	2009	302469017	54713046	150201498	49.7	152267519	50.3
Wrath of the Titans	Warner Bros.	2012	301970083	33457188	83670083	27.7	218300000	72.3
Fantastic Four: Rise of the Silver Surfer	Twentieth Century Fox	2007	301913131	58051684	131921738	43.7	169991393	56.3
Hook	TriStar Pictures	1991	300854823	13522535	119654823	39.8	181200000	60.2
Superman	Warner Bros.	1978	300478449	7465343	134478449	44.8	166000000	55.2
Rocky IV	United Artists	1985	300473716	19991537	127873716	42.6	172600000	57.4
Rambo: First Blood Part II	TriStar Pictures	1985	300400432	20176217	150415432	50.1	149985000	49.9
Resident Evil: Afterlife	Screen Gems	2010	300228084	26650264	60128566	20	240099518	80
Van Helsing	Universal Pictures	2004	300157638	51748040	120177084	40	179980554	60
Stuart Little	Sony Pictures Entertainment (SPE)	1999	300135367	15018223	140035367	46.7	160100000	53.3
Beverly Hills Cop II	Paramount Pictures	1987	299965036	26348555	153665036	51.2	146300000	48.8
Alice Through the Looking Glass	Walt Disney Studios Motion Pictures	2016	299820798	26858726	77041381	25.7	222779417	74.3
My Best Friend's Wedding	Sony Pictures Entertainment (SPE)	1997	299288605	21678377	127120029	42.5	172168576	57.5
Real Steel	Walt Disney Studios Motion Pictures	2011	299268508	27319677	85468508	28.6	213800000	71.4
Horton Hears a Who!	Twentieth Century Fox	2008	298572799	45012998	154529439	51.8	144043360	48.2
Ocean's Eight	Warner Bros.	2018	297795726	41607378	140295726	47.1	157500000	52.9
A Quiet Place Part II	Paramount Pictures	2021	297372261	47547231	160072261	53.8	137300000	46.2
The Divergent Series: Insurgent	Lionsgate	2015	297002527	52263680	130179072	43.8	166823455	56.2
Look Who's Talking	TriStar Pictures	1989	296999813	12107784	140088813	47.2	156911000	52.8
Austin Powers in Goldmember	New Line Cinema	2002	296938801	73071188	213307889	71.8	83630912	28.2
Ghostbusters	Columbia Pictures	1984	296578797	13578151	243578797	82.1	53000000	17.9
Miss Peregrine's Home for Peculiar Children	Twentieth Century Fox	2016	296482446	28871140	87242834	29.4	209239612	70.6
X-Men	Twentieth Century Fox	2000	296339528	54471475	157299718	53.1	139039810	46.9
Ferdinand	Twentieth Century Fox	2017	296069199	13401586	84410380	28.5	211658819	71.5
Shutter Island	Paramount Pictures	2010	294805697	41062440	128012934	43.4	166792763	56.6
Doctor Dolittle	Twentieth Century Fox	1998	294456605	29014324	144156605	49	150300000	51
Bee Movie	DreamWorks	2007	293514336	38021044	126631277	43.1	166883059	56.9
Salt	Sony Pictures Entertainment (SPE)	2010	293503354	36011243	118311368	40.3	175191986	59.7
G-Force	Walt Disney Studios Motion Pictures	2009	292817898	31706934	119436770	40.8	173381128	59.2
The Departed	Warner Bros.	2006	291480452	26887467	132399394	45.4	159081058	54.6
What Lies Beneath	DreamWorks Distribution	2000	291420351	29702959	155464351	53.4	135956000	46.6
Pacific Rim: Uprising	Universal Pictures	2018	290930148	28116535	59874525	20.6	231055623	79.4
Too Cool to Kill	Well Go USA Entertainment	2022	217254604	72432	185882	0.1	217068722	99.9
The Bourne Supremacy	Universal Pictures	2004	290835269	52521865	176241941	60.6	114593328	39.4
Sex and the City 2	Warner Bros.	2010	290745055	31001870	95347692	32.8	195397363	67.2
Shakespeare in Love	Miramax	1998	289317794	224012	100317794	34.7	189000000	65.3
Divergent	Lionsgate	2014	288885818	54607747	150947895	52.2	137937923	47.8
Coming to America	Paramount Pictures	1988	288752301	21404420	128152301	44.4	160600000	55.6
Elvis	Warner Bros.	2022	288670284	31211579	151040048	52.3	137630236	47.7
Wedding Crashers	New Line Cinema	2005	288485135	32200000	209273411	72.5	79211724	27.5
Maze Runner: The Death Cure	Twentieth Century Fox	2018	288175335	24167011	58032443	20.1	230142892	79.9
Casper	Universal Pictures	1995	287928194	16840385	100328194	34.8	187600000	65.2
American Pie 2	Universal Pictures	2001	287553595	45117985	145103595	50.5	142450000	49.5
Pitch Perfect 2	Universal Pictures	2015	287144079	69216890	184296230	64.2	102847849	35.8
The Green Mile	Warner Bros.	1999	286801374	18017152	136801374	47.7	150000000	52.3
Oblivion	Universal Pictures	2013	286168572	37054485	89107235	31.1	197061337	68.9
Elysium	TriStar Pictures	2013	286140700	29807393	93050117	32.5	193090583	67.5
Lethal Weapon 4	Warner Bros.	1998	285444603	34048124	130444603	45.7	155000000	54.3
John Carter	Walt Disney Studios Motion Pictures	2012	284139100	30180188	73078100	25.7	211061000	74.3
Turbo	Twentieth Century Fox	2013	282570682	21312625	83028128	29.4	199542554	70.6
Paddington		2014	282422653	18966676	76271832	27	206150821	73
The Tourist	Sony Pictures Entertainment (SPE)	2010	278780441	16472458	67631157	24.3	211149284	75.7
Split	Universal Pictures	2017	278454417	40010975	138291365	49.7	140163052	50.3
Scary Movie	Miramax	2000	278019771	42346669	157019771	56.5	121000000	43.5
xXx	Revolution Studios	2002	277448382	44506103	142109382	51.2	135339000	48.8
The Bourne Legacy	Universal Pictures	2012	276144750	38142825	113203870	41	162940880	59
Mr. Peabody & Sherman	Twentieth Century Fox	2014	275698039	32207057	111506430	40.4	164191609	59.6
Scooby-Doo	Warner Bros.	2002	275678613	54155312	153322074	55.6	122356539	44.4
Lincoln	Walt Disney Studios Motion Pictures	2012	275293450	944308	182207973	66.2	93085477	33.8
Creed III	United Artists Releasing	2023	275248615	58370007	156248615	56.8	119000000	43.2
Lara Croft: Tomb Raider	Paramount Pictures	2001	274703340	47735743	131168070	47.8	143535270	52.2
Tomb Raider	Warner Bros.	2018	274650803	23633317	58250803	21.2	216400000	78.8
The Expendables	Lionsgate	2010	274470394	34825135	103068524	37.6	171401870	62.4
Cloudy with a Chance of Meatballs 2	Sony Pictures Entertainment (SPE)	2013	274325949	34017930	119793567	43.7	154532382	56.3
The Nutty Professor	Universal Pictures	1996	273961019	25411725	128814019	47	145147000	53
Jerry Maguire	Sony Pictures Entertainment (SPE)	1996	273552592	17084296	153952592	56.3	119600000	43.7
Bad Boys II	Sony Pictures Entertainment (SPE)	2003	273339556	46522560	138608444	50.7	134731112	49.3
Lilo & Stitch	Walt Disney Studios Motion Pictures	2002	273144151	35260212	145794338	53.4	127349813	46.6
The Silence of the Lambs	Orion Pictures	1991	272742922	13766814	130742922	47.9	142000000	52.1
Grown Ups	Sony Pictures Entertainment (SPE)	2010	271457301	40506562	162001186	59.7	109456115	40.3
Neighbors	Universal Pictures	2014	270665134	49033915	150157400	55.5	120507734	44.5
The Firm	Paramount Pictures	1993	270248367	25400000	158348367	58.6	111900000	41.4
We're the Millers	Warner Bros.	2012	269994119	26419396	150394119	55.7	119600000	44.3
Gran Torino	Warner Bros.	2008	269958228	271720	148095302	54.9	121862926	45.1
10,000 BC	Warner Bros.	2008	269784201	35867488	94784201	35.1	175000000	64.9
American Gangster	Universal Pictures	2007	269755430	43565135	130164645	48.2	139590785	51.8
Epic	Twentieth Century Fox	2013	268426634	33531068	107518682	40.1	160907952	59.9
Exodus: Gods and Kings	Twentieth Century Fox	2014	268175631	24115934	65014513	24.2	203161118	75.8
Blade Runner 2049	Warner Bros.	2017	267770708	32753122	92071675	34.4	175699033	65.6
Bambi	RKO Radio Pictures	1942	267447150	0	102247150	38.2	165200000	61.8
The Flash	Warner Bros.	2023	267237037	55043679	106837037	40	160400000	60
The Princess and the Frog	Walt Disney Studios Motion Pictures	2009	267045765	786190	104400899	39.1	162644866	60.9
Batman Returns	Warner Bros.	1992	266915287	45687711	162924631	61	103990656	39
Indecent Proposal	Paramount Pictures	1993	266614059	18387632	106614059	40	160000000	60
Something's Gotta Give	Sony Pictures Entertainment (SPE)	2003	265328738	16064723	124728738	47	140600000	53
Bridget Jones: The Edge of Reason	Universal Pictures	2004	265126918	8684055	40226215	15.2	224900703	84.8
The Incredible Hulk	Universal Pictures	2008	264770996	55414050	134806913	50.9	129964083	49.1
Waterworld	Universal Pictures	1995	264218220	21171780	88246220	33.4	175972000	66.6
The Truman Show	Paramount Pictures	1998	264118712	31542121	125618201	47.6	138500511	52.4
Charlie's Angels	Sony Pictures Entertainment (SPE)	2000	264105545	40128550	125305545	47.4	138800000	52.6
The Fifth Element	Sony Pictures Entertainment (SPE)	1997	263920180	17031345	63820180	24.2	200100000	75.8
Jumanji	Sony Pictures Entertainment (SPE)	1995	262821940	11084370	100499940	38.2	162322000	61.8
Parasite	Neon	2019	262681282	393216	53369749	20.3	209311533	79.7
Borat	Twentieth Century Fox	2006	262552893	26455463	128505958	48.9	134046935	51.1
Robots	Twentieth Century Fox	2005	262511490	36045301	128200012	48.8	134311478	51.2
Knight and Day	Unknown	2008	261989769	0	76423035	29.2	185566734	70.8
Total Recall	Sony Pictures Entertainment (SPE)	1990	261317921	25533700	119412921	45.7	141905000	54.3
This Is It	Sony Pictures Entertainment (SPE)	2009	261183588	23234394	72091016	27.6	189092572	72.4
Terminator: Dark Fate	Paramount Pictures	2019	261119292	29033832	62253077	23.8	198866215	76.2
The Lone Ranger	Walt Disney Studios Motion Pictures	2013	260502115	29210849	89302115	34.3	171200000	65.7
Super 8	Paramount Pictures	2011	260095986	35451168	127004179	48.8	133091807	51.2
Halloween	Universal Pictures	2018	259939835	76221545	159342015	61.3	100597820	38.7
Mojin: The Lost Legend	Well Go USA Entertainment	2015	259368448	279974	1243810	0.5	258124638	99.5
Charlie's Angels: Full Throttle	Sony Pictures Entertainment (SPE)	2003	259175788	37634221	100830111	38.9	158345677	61.1
Rush Hour 3	New Line Cinema	2007	258097122	50237000	140125968	54.3	117971154	45.7
The Full Monty		1997	257938649	176585	45950122	17.8	211988527	82.2
Kung Fu Yoga	Well Go USA Entertainment	2017	257753889	111979	362657	0.1	257391232	99.9
Annabelle	Warner Bros.	2014	257589721	37134255	84284252	32.7	173305469	67.3
Encanto	Walt Disney Studios Motion Pictures	2021	256786742	27206494	96093622	37.4	160693120	62.6
The Village	Walt Disney Studios Motion Pictures	2003	256697520	50746142	114197520	44.5	142500000	55.5
Lost in Hong Kong	Well Go USA Entertainment	2015	256283912	537736	1302281	0.5	254981631	99.5
Erin Brockovich	Universal Pictures	2000	256271286	28138465	125595205	49	130676081	51
Us	Universal Pictures	2019	256067149	71117625	175084580	68.4	80982569	31.6
Pegasus	Unknown	2019	255863112	0	0	0	255863112	100
Get Out	Unknown	2016	255745157	0	176196665	68.9	79548492	31.1
Marley & Me	Twentieth Century Fox	2008	255743093	36357586	143153751	56	112589342	44
Cliffhanger	TriStar Pictures	1993	255000211	16176967	84049211	33	170951000	67
Baahubali 2: The Conclusion	Great India Films	2017	254158390	10430497	20186659	7.9	233971731	92.1
Babe	Universal Pictures	1995	254134910	8742545	63658910	25	190476000	75
Men in Black: International	Sony Pictures Entertainment (SPE)	2019	253890701	30035838	80001807	31.5	173888894	68.5
Wild Hogs	Walt Disney Studios Motion Pictures	2007	253625427	39699023	168273550	66.4	85351877	33.6
High School Musical 3: Senior Year	Walt Disney Studios Motion Pictures	2008	252909177	42030184	90559416	35.8	162349761	64.2
Hercules	Walt Disney Studios Motion Pictures	1997	252712101	249567	99112101	39.2	153600000	60.8
X-Men: Dark Phoenix	Twentieth Century Fox	2019	252442974	32828348	65845974	26.1	186597000	73.9
True Grit	Paramount Pictures	2010	252276927	24830443	171243005	67.9	81033922	32.1
Dolittle	Universal Pictures	2020	251410631	21844045	77047065	30.6	174363566	69.4
Bean	Gramercy Pictures (I)	1997	251212670	2255233	45319423	18	205893247	82
American Hustle	Sony Pictures Entertainment (SPE)	2013	251171807	740455	150117807	59.8	101054000	40.2
Enemy of the State	Walt Disney Studios Motion Pictures	1998	250849789	20038573	111549836	44.5	139299953	55.5
You've Got Mail	Warner Bros.	1998	250821495	18426749	115821495	46.2	135000000	53.8
Eragon	Twentieth Century Fox	2006	250425512	23239907	75030163	30	175395349	70
Brother Bear	Walt Disney Studios Motion Pictures	2003	250397798	291940	85336277	34.1	165061521	65.9
The Godfather	Paramount Pictures	1972	250341816	302393	136381073	54.5	113960743	45.5
The Mask of Zorro	Sony Pictures Entertainment (SPE)	1998	250288523	22525855	94095523	37.6	156193000	62.4
The Bad Guys	Universal Pictures	2022	250162278	23950245	97233630	38.9	152928648	61.1
The Ring	DreamWorks Distribution	2002	249348933	15015393	129128133	51.8	120220800	48.2
The Blair Witch Project	Artisan Entertainment	1999	248639099	1512054	140539099	56.5	108100000	43.5
Unbreakable	Walt Disney Studios Motion Pictures	2000	248118121	30330771	95011339	38.3	153106782	61.7
Love Actually	Universal Pictures	2003	247933248	6886080	59696144	24.1	188237104	75.9
Journey to the West: The Demons Strike Back	Sony Pictures Entertainment (SPE)	2017	247585244	463883	880346	0.4	246704898	99.6
Dumb and Dumber	New Line Cinema	1994	247290327	16363442	127190327	51.4	120100000	48.6
Glass	Universal Pictures	2019	246999039	40328920	111048468	45	135950571	55
Grown Ups 2	Sony Pictures Entertainment (SPE)	2013	246984278	41508572	133668525	54.1	113315753	45.9
The Peanuts Movie	Twentieth Century Fox	2015	246233113	44213073	130178411	52.9	116054702	47.1
2 Fast 2 Furious	Universal Pictures	2003	236350661	50472480	127154901	53.8	109195760	46.2
Rango	Paramount Pictures	2011	245724603	38079323	123477607	50.2	122246996	49.8
Four Weddings and a Funeral	Gramercy Pictures (I)	1994	245700832	138486	52700832	21.4	193000000	78.6
Face/Off	Paramount Pictures	1997	245676146	23387530	112276146	45.7	133400000	54.3
Teenage Mutant Ninja Turtles: Out of the Shadows	Paramount Pictures	2016	245623848	35316382	82051601	33.4	163572247	66.6
Dark Shadows	Warner Bros.	2012	245527149	29685274	79727149	32.5	165800000	67.5
Hulk	Universal Pictures	2003	245285165	62128420	132177234	53.9	113107931	46.1
The Bravest	Sony Pictures Entertainment (SPE)	2019	245179562	110375	290217	0.1	244889345	99.9
Welcome to the Sticks		2008	245144417	0	0	0	245144417	100
Back to the Future Part III	Universal Pictures	1990	245077583	19089645	88277583	36	156800000	64
Pixels	Sony Pictures Entertainment (SPE)	2015	244874809	24011616	78747585	32.2	166127224	67.8
Hercules	Paramount Pictures	2014	244819862	29800263	72688614	29.7	172131248	70.3
Rush Hour	New Line Cinema	1998	244721064	33001803	141186864	57.7	103534200	42.3
Journey to the Center of the Earth	Warner Bros.	2008	244232688	21018141	101704370	41.6	142528318	58.4
After Earth	Sony Pictures Entertainment (SPE)	2013	243611982	27520040	60522097	24.8	183089885	75.2
A Few Good Men	Columbia Pictures	1992	243240178	15517468	141340178	58.1	101900000	41.9
Cloudy with a Chance of Meatballs	Sony Pictures Entertainment (SPE)	2009	243006126	30304648	124870275	51.4	118135851	48.6
8 Mile	Universal Pictures	2002	242875078	51240555	116750901	48.1	126124177	51.9
Daddy's Home	Paramount Pictures	2015	242786137	38740203	150357137	61.9	92429000	38.1
RoboCop	Sony Pictures Entertainment (SPE)	2014	242688965	21681430	58607007	24.2	184081958	75.8
Eraser	Warner Bros.	1996	242295562	24566446	101295562	41.8	141000000	58.2
Alien: Covenant	Twentieth Century Fox	2017	240891763	36160621	74262031	30.8	166629732	69.2
Sully	Warner Bros.	2016	240797623	35028301	125070033	51.9	115727590	48.1
Assassin's Creed	Twentieth Century Fox	2016	240697856	10278225	54647948	22.7	186049908	77.3
Click	Revolution Studios	2006	240685326	40011365	137355633	57.1	103329693	42.9
Legend of Deification	Well Go USA Entertainment	2020	240646355	0	214670	0.1	240431685	99.9
Planes	Walt Disney Studios Motion Pictures	2013	240171783	22232291	90288712	37.6	149883071	62.4
Resident Evil: Retribution	Screen Gems	2012	240159255	21052227	42345531	17.6	197813724	82.4
Die Hard 2	Twentieth Century Fox	1990	240031274	21744661	117540947	49	122490327	51
Crocodile Dundee II	Paramount Pictures	1988	239606210	24462976	109306210	45.6	130300000	54.4
Bullet Train	Sony Pictures Entertainment (SPE)	2022	239268602	30030156	103368602	43.2	135900000	56.8
Crazy Rich Asians	Warner Bros.	2018	238843729	26510140	174837452	73.2	64006277	26.8
Batman & Robin	Warner Bros.	1997	238235719	42872605	107353792	45.1	130881927	54.9
Howl's Moving Castle	Walt Disney Studios Motion Pictures	2004	237536126	427987	6789268	2.9	230746858	97.1
Gulliver's Travels	Twentieth Century Fox	2010	237382724	6307691	42779261	18	194603463	82
Gone in 60 Seconds	Walt Disney Studios Motion Pictures	2000	237202299	25336048	101648571	42.8	135553728	57.2
Saturday Night Fever	Paramount Pictures	1977	237113184	3878099	94213184	39.7	142900000	60.3
Silver Linings Playbook	The Weinstein Company	2012	236412453	443003	132092958	55.9	104319495	44.1
Hidden Figures	Twentieth Century Fox	2016	235956898	515499	169607287	71.9	66349611	28.1
A.I. Artificial Intelligence	Warner Bros.	2001	235926552	29352630	78616689	33.3	157309863	66.7
Dead Poets Society	Walt Disney Studios Motion Pictures	1989	235860116	340456	95860116	40.6	140000000	59.4
Spy	Twentieth Century Fox	2015	235666219	29085719	110825712	47	124840507	53
American Pie	Universal Pictures	1999	235483004	18709680	102561004	43.6	132922000	56.4
American Reunion	Universal Pictures	2012	234989584	21514080	57011521	24.3	177978063	75.7
Big Daddy	Sony Pictures Entertainment (SPE)	1999	234801895	41536370	163479795	69.6	71322100	30.4
Alvin and the Chipmunks: The Road Chip	Twentieth Century Fox	2015	234798636	14287159	85886987	36.6	148911649	63.4
Mission: Impossible - Dead Reckoning Part One	Paramount Pictures	2023	234091897	54688347	78491897	33.5	155600000	66.5
The Imitation Game	The Weinstein Company	2014	233555708	479352	91125683	39	142430025	61
Cruella	Walt Disney Studios Motion Pictures	2021	233503234	21496997	86103234	36.9	147400000	63.1
The Day the Earth Stood Still	Twentieth Century Fox	2008	233093859	30480153	79366978	34	153726881	66
American Wedding	Universal Pictures	2003	232722935	33369440	104565114	44.9	128157821	55.1
The Girl with the Dragon Tattoo	Sony Pictures Entertainment (SPE)	2011	232617430	12768604	102515793	44.1	130101637	55.9
Juno		2007	232372681	413869	143495265	61.8	88877416	38.2
Argo	Warner Bros.	2012	232325503	19458109	136025503	58.6	96300000	41.4
Mr. Bean's Holiday	Universal Pictures	2007	232225908	9889780	33302167	14.3	198923741	85.7
The English Patient	Miramax	1996	231976425	278439	78676425	33.9	153300000	66.1
Sister Act	Walt Disney Studios Motion Pictures	1992	231605150	11894587	139605150	60.3	92000000	39.7
Annabelle Comes Home	Warner Bros.	2019	231252591	20269723	74152591	32.1	157100000	67.9
Constantine	Warner Bros.	2005	230884728	29769098	75976178	32.9	154908550	67.1
Get Smart	Warner Bros.	2008	230685453	38683480	130319208	56.5	100366245	43.5
Space Jam	Warner Bros.	1996	230594962	27528529	90594962	39.3	140000000	60.7
Life Is Beautiful	Miramax	1998	230099013	118920	57563264	25	172535749	75
The Heat	Twentieth Century Fox	2013	229930771	39115043	159582188	69.4	70348583	30.6
Ghostbusters	Sony Pictures Entertainment (SPE)	2016	229147509	46018755	128350574	56	100796935	44
Ghost Rider	Sony Pictures Entertainment (SPE)	2007	228738393	45388836	115802596	50.6	112935797	49.4
Goodbye Mr. Loser	China Lion Film Distribution	2015	228122928	363949	1293626	0.6	226829302	99.4
Paddington 2	Warner Bros.	2017	227994792	11001961	40907738	17.9	187087054	82.1
Sleepless in Seattle	TriStar Pictures	1993	227927165	17253733	126808165	55.6	101119000	44.4
Lethal Weapon 2	Warner Bros.	1989	227853986	20388800	147253986	64.6	80600000	35.4
The Green Hornet	Sony Pictures Entertainment (SPE)	2011	227817248	33526876	98780042	43.4	129037206	56.6
Out of Africa	Universal Pictures	1985	227514205	3637290	87071205	38.3	140443000	61.7
Elf	New Line Cinema	2003	227356156	32100000	178053220	78.3	49302936	21.7
Youth	China Lion Film Distribution	2017	227091290	338604	1891956	0.8	225199334	99.2
Baby Driver	TriStar Pictures	2017	226945087	20553320	107825862	47.5	119119225	52.5
Immortals	Relativity Media	2011	226904017	32206425	83504017	36.8	143400000	63.2
Taken	Twentieth Century Fox	2008	226837760	24717037	145000989	63.9	81836771	36.1
Percy Jackson & the Olympians: The Lightning Thief	Twentieth Century Fox	2010	226497209	31236067	88768303	39.2	137728906	60.8
Lightyear	Walt Disney Studios Motion Pictures	2022	226425420	50577961	118307188	52.2	108118232	47.8
Hansel & Gretel: Witch Hunters	Paramount Pictures	2013	226349749	19690956	55703475	24.6	170646274	75.4
Valerian and the City of a Thousand Planets	STX Entertainment	2017	225973340	17007624	41189488	18.2	184783852	81.8
Good Will Hunting	Miramax	1997	225933435	272912	138433435	61.3	87500000	38.7
Better Days	Well Go USA Entertainment	2019	225918798	989536	1921657	0.8	223997141	99.2
Ford v Ferrari	Twentieth Century Fox	2019	225508210	31474958	117624357	52.2	107883853	47.8
Jumper	Twentieth Century Fox	2008	225132113	27354808	80172128	35.6	144959985	64.4
The Social Network	Sony Pictures Entertainment (SPE)	2010	224920375	22445653	96962694	43.1	127957681	56.9
Chicken Run	DreamWorks Distribution	2000	224874811	17506162	106834564	47.5	118040247	52.5
Con Air	Walt Disney Studios Motion Pictures	1997	224012234	24131738	101117573	45.1	122894661	54.9
Interview with the Vampire: The Vampire Chronicles	Warner Bros.	1994	223664608	36389705	105264608	47.1	118400000	52.9
Flightplan	Walt Disney Studios Motion Pictures	2005	223387299	24629938	89707299	40.2	133680000	59.8
Yes Man	Warner Bros.	2008	223241637	18262471	97690976	43.8	125550661	56.2
Non-Stop	Universal Pictures	2014	222809600	28875635	92168600	41.4	130641000	58.6
Honey, I Shrunk the Kids	Walt Disney Studios Motion Pictures	1989	222724172	14262961	130724172	58.7	92000000	41.3
Fahrenheit 9/11	Lionsgate	2004	222446882	23920637	119194771	53.6	103252111	46.4
Wild Wild West	Warner Bros.	1999	222104681	27687484	113804681	51.2	108300000	48.8
My Country, My Parents	CMC Pictures	2021	221831086	75302	177133	0.1	221653953	99.9
Geostorm	Warner Bros.	2017	221600160	13707376	33700160	15.2	187900000	84.8
Presumed Innocent	Warner Bros.	1990	221303188	11718981	86303188	39	135000000	61
Jungle Cruise	Walt Disney Studios Motion Pictures	2021	220889446	35018731	116987516	53	103901930	47
Scary Movie 3	Dimension Films	2003	220673217	49700000	110003217	49.8	110670000	50.2
Collateral	DreamWorks Distribution	2004	220239925	24701458	101005703	45.9	119234222	54.1
Inferno	Sony Pictures Entertainment (SPE)	2016	220021259	14860425	34343574	15.6	185677685	84.4
Knocked Up	Universal Pictures	2007	219922417	30690990	148768917	67.6	71153500	32.4
Green Lantern	Warner Bros.	2011	219851172	53174303	116601172	53	103250000	47
What Happens in Vegas	Twentieth Century Fox	2008	219375562	20172474	80277646	36.6	139097916	63.4
It's Complicated	Universal Pictures	2009	219103655	22100820	112735375	51.4	106368280	48.6
The Terminal	DreamWorks Distribution	2004	219100084	19053199	77872883	35.5	141227201	64.5
Little Women	Sony Pictures Entertainment (SPE)	2019	218843645	16755310	108101214	49.4	110742431	50.6
Captain Phillips	Sony Pictures Entertainment (SPE)	2013	218791811	25718314	107100855	49	111690956	51
The Prince of Egypt	DreamWorks Distribution	1998	218613188	14524321	101413188	46.4	117200000	53.6
Jack Reacher	Paramount Pictures	2012	218340595	15210156	80070736	36.7	138269859	63.3
Kingdom of Heaven	Twentieth Century Fox	2005	218122627	19635996	47398413	21.7	170724214	78.3
The Emoji Movie	Sony Pictures Entertainment (SPE)	2017	217776646	24531923	86089513	39.5	131687133	60.5
Smile	Paramount Pictures	2022	217408513	22609925	105935048	48.7	111473465	51.3
Dracula Untold	Universal Pictures	2014	217124280	23514615	56280355	25.9	160843925	74.1
Central Intelligence	Warner Bros.	2016	216972543	35535250	127440871	58.7	89531672	41.3
Million Dollar Baby	Warner Bros.	2004	216763646	179953	100492203	46.4	116271443	53.6
The Help	Walt Disney Studios Motion Pictures	2011	216639112	26044590	169708112	78.3	46931000	21.7
Twins	Universal Pictures	1988	216614388	11174980	111938388	51.7	104676000	48.3
Valentine's Day	Warner Bros.	2010	216528528	56260707	110528528	51	106000000	49
Bad Teacher	Sony Pictures Entertainment (SPE)	2011	216197492	31603106	100292856	46.4	115904636	53.6
A Little Red Flower	Unknown	2020	216000000	0	0	0	216000000	100
The Croods: A New Age	Universal Pictures	2020	215905815	9724200	58568815	27.1	157337000	72.9
Clear and Present Danger	Paramount Pictures	1994	215887717	20348017	122187717	56.6	93700000	43.4
One Hundred and One Dalmatians	Walt Disney Studios Motion Pictures	1961	215880014	0	144880014	67.1	71000000	32.9
Ted 2	Universal Pictures	2015	215863606	33507870	81476385	37.7	134387221	62.3
Bram Stoker's Dracula	Columbia Pictures	1992	215862692	30521679	82522790	38.2	133339902	61.8
Vertical Limit	Sony Pictures Entertainment (SPE)	2000	215663859	15507845	69243859	32.1	146420000	67.9
Ghostbusters II	Columbia Pictures	1989	215394738	29472894	112494738	52.2	102900000	47.8
The Patriot	Sony Pictures Entertainment (SPE)	2000	215294342	22413710	113330342	52.6	101964000	47.4
The Sorcerer's Apprentice	Walt Disney Studios Motion Pictures	2010	215283742	17619622	63150991	29.3	152132751	70.7
Just Go with It	Sony Pictures Entertainment (SPE)	2011	214945591	30514732	103028109	47.9	111917482	52.1
The Expendables 3	Lionsgate	2014	214657577	15879645	39322544	18.3	175335033	81.7
Dirty Dancing	Vestron Pictures	1987	214577242	3900000	64577242	30.1	150000000	69.9
Creed II	Metro-Goldwyn-Mayer (MGM)	2018	214215889	35574710	115715889	54	98500000	46
Smallfoot	Warner Bros.	2018	214115531	23045635	83315531	38.9	130800000	61.1
Public Enemies	Universal Pictures	2009	214104620	25271675	97104620	45.4	117000000	54.6
The Bourne Identity	Universal Pictures	2002	214034224	27118640	121661683	56.8	92372541	43.2
Disclosure	Warner Bros.	1994	214015089	10068126	83015089	38.8	131000000	61.2
Crouching Tiger, Hidden Dragon	Sony Pictures Classics	2000	213977285	663205	128530421	60.1	85446864	39.9
Pulp Fiction	Miramax	1994	213928762	9311882	107928762	50.4	106000000	49.6
The Aviator	Miramax	2004	213719942	858021	102610330	48	111109612	52
Braveheart	Paramount Pictures	1995	213216216	9938276	75609945	35.5	137606271	64.5
Into the Woods	Walt Disney Studios Motion Pictures	2014	212902372	31051923	128002372	60.1	84900000	39.9
Bedtime Stories	Walt Disney Studios Motion Pictures	2008	212874864	27450296	110101975	51.7	102772889	48.3
Miss Congeniality	Warner Bros.	2000	212742720	10046534	106807667	50.2	105935053	49.8
Entrapment	Twentieth Century Fox	1999	212404396	20145595	87704396	41.3	124700000	58.7
Ace Ventura: When Nature Calls	Warner Bros.	1995	212385533	37804076	108385533	51	104000000	49
End of Days	Universal Pictures	1999	211989043	20523595	66889043	31.6	145100000	68.4
Bridget Jones's Baby	Universal Pictures	2016	211952420	8571785	24252420	11.4	187700000	88.6
Fury	Sony Pictures Entertainment (SPE)	2014	211822697	23702421	85817906	40.5	126004791	59.5
Battle Los Angeles	Sony Pictures Entertainment (SPE)	2011	211819354	35573187	83552429	39.4	128266925	60.6
Australia	Twentieth Century Fox	2008	211787511	14800723	49554002	23.4	162233509	76.6
Due Date	Warner Bros.	2010	211780824	32689406	100539043	47.5	111241781	52.5
Master and Commander: The Far Side of the World	Twentieth Century Fox	2003	211622535	25105990	93927920	44.4	117694615	55.6
A Series of Unfortunate Events	Paramount Pictures	2004	211468235	30061756	118634549	56.1	92833686	43.9
The Little Mermaid	Walt Disney Studios Motion Pictures	1989	211343479	6031914	111543479	52.8	99800000	47.2
Nice View	Unknown	2022	211019042	0	0	0	211019042	100
District 9	TriStar Pictures	2009	210888950	37354308	115646235	54.8	95242715	45.2
Moonraker	Metro-Goldwyn-Mayer (MGM)	1979	210308099	7108344	70308099	33.4	140000000	66.6
The Others	Miramax	2001	209947037	14089952	96522687	46	113424350	54
Horrible Bosses	Warner Bros.	2011	209838559	28302165	117538559	56	92300000	44
Us and Them	Unknown	2018	209221380	0	0	0	209221380	100
Red Dragon	Universal Pictures	2002	209196298	36540945	93149898	44.5	116046400	55.5
Tomorrowland	Walt Disney Studios Motion Pictures	2015	209035668	33028165	93436322	44.7	115599346	55.3
Me Before You	Warner Bros.	2016	208314186	18723269	56245075	27	152069111	73
Dungeons & Dragons: Honor Among Thieves	Paramount Pictures	2023	208177026	37205784	93277026	44.8	114900000	55.2
Safe House	Universal Pictures	2012	208076205	40172720	126373434	60.7	81702771	39.3
S.W.A.T.	Sony Pictures Entertainment (SPE)	2003	207725639	37062535	116934650	56.3	90790989	43.7
DC League of Super-Pets	Warner Bros.	2022	207557117	23003441	93657117	45.1	113900000	54.9
The Fast and the Furious	Universal Pictures	2001	207517509	40089015	144745925	69.8	62771584	30.2
Traffic	USA Films	2000	207515725	184725	124115725	59.8	83400000	40.2
Paranormal Activity 3	Paramount Pictures	2011	207039844	52568183	104028807	50.2	103011037	49.8
Philadelphia	TriStar Pictures	1993	206678440	143433	77446440	37.5	129232000	62.5
The Conjuring: The Devil Made Me Do It	Warner Bros.	2021	206431050	24104332	65631050	31.8	140800000	68.2
Sleepy Hollow	Paramount Pictures	1999	206071502	30060467	101071502	49	105000000	51
The Holiday	Sony Pictures Entertainment (SPE)	2006	205850169	12778913	63224849	30.7	142625320	69.3
The Jungle Book	Walt Disney Studios Motion Pictures	1967	205843612	0	141843612	68.9	64000000	31.1
Raging Fire	Well Go USA Entertainment	2021	205842393	101926	385305	0.2	205457088	99.8
London Has Fallen	Focus Features	2016	205754447	21635601	62524260	30.4	143230187	69.6
The Break-Up	Universal Pictures	2006	205668210	39172785	118703275	57.7	86964935	42.3
Journey to the West	Magnolia Pictures	2013	205637183	7456	18058	0.1	205619125	100
The Ugly Truth	Sony Pictures Entertainment (SPE)	2009	205599393	27605576	88915214	43.2	116684179	56.8
JFK	Warner Bros.	1991	205405498	5223658	70405498	34.3	135000000	65.7
Birds of Prey	Warner Bros.	2020	205372791	33010017	84172791	41	121200000	59
White House Down	Sony Pictures Entertainment (SPE)	2013	205366737	24852258	73103784	35.6	132262953	64.4
A Dog's Purpose	Universal Pictures	2017	205035819	18222810	64508620	31.5	140527199	68.5
Ponyo	Walt Disney Studios Motion Pictures	2008	204920882	3585852	15743471	7.7	189177411	92.3
Fun with Dick and Jane	Sony Pictures Entertainment (SPE)	2005	204681899	14383515	110332737	53.9	94349162	46.1
Eat Pray Love	Sony Pictures Entertainment (SPE)	2010	204594016	23104523	80574010	39.4	124020006	60.6
The Addams Family	United Artists Releasing	2019	204394183	30300007	100723831	49.3	103670352	50.7
Ghostbusters: Afterlife	Sony Pictures Entertainment (SPE)	2021	204334455	44008406	129360575	63.3	74973880	36.7
You Don't Mess with the Zohan	Sony Pictures Entertainment (SPE)	2008	204313400	38531374	100018837	49	104294563	51
Hairspray	New Line Cinema	2007	203627753	27800000	118946291	58.4	84681462	41.6
King Arthur	Walt Disney Studios Motion Pictures	2004	203567857	15193907	51882244	25.5	151685613	74.5
Yogi Bear	Warner Bros.	2010	203509374	16411322	100246011	49.3	103263363	50.7
Everest	Universal Pictures	2015	203427584	7222035	43482270	21.4	159945314	78.6
Vanilla Sky	Paramount Pictures	2001	203388341	25015518	100618344	49.5	102769997	50.5
Arrival	Paramount Pictures	2016	203388186	24074047	100546139	49.4	102842047	50.6
Need for Speed	Walt Disney Studios Motion Pictures	2014	203277636	17844939	43577636	21.4	159700000	78.6
Garfield	Twentieth Century Fox	2004	203172417	21727611	75369589	37.1	127802828	62.9
Patch Adams	Universal Pictures	1998	202292902	25262280	135026902	66.8	67266000	33.2
Teenage Mutant Ninja Turtles	New Line Cinema	1990	202084756	25398367	135384756	67	66700000	33
Kindergarten Cop	Universal Pictures	1990	201957688	7918560	91457688	45.3	110500000	54.7
Straight Outta Compton	Universal Pictures	2015	201634991	60200180	161197785	80	40437206	20
21 Jump Street	Sony Pictures Entertainment (SPE)	2012	201585328	36302612	138447667	68.7	63137661	31.3
Valkyrie	United Artists	2008	201545517	21027007	83077833	41.2	118467684	58.8
Open Season	Sony Pictures Entertainment (SPE)	2006	200811689	23624548	85105259	42.4	115706430	57.6
Cats & Dogs	Warner Bros.	2001	200687492	21707617	93385515	46.5	107301977	53.5
The Hunt for Red October	Paramount Pictures	1990	200512643	17161835	122012643	60.8	78500000	39.2
Percy Jackson: Sea of Monsters	Twentieth Century Fox	2013	199850315	14401054	68559554	34.3	131290761	65.7
The Lego Movie 2: The Second Part	Warner Bros.	2019	199603202	34115335	105956290	53.1	93646912	46.9
Two Weeks Notice	Warner Bros.	2002	199043471	14328494	93354851	46.9	105688620	53.1
RED	Summit Entertainment	2010	199006387	21761408	90380162	45.4	108626225	54.6
Shock Wave 2	Unknown	2020	198921659	0	0	0	198921659	100
City of Angels	Warner Bros.	1998	198685114	15369048	78685114	39.6	120000000	60.4
The Pacifier	Walt Disney Studios Motion Pictures	2005	198636868	30552694	113086868	56.9	85550000	43.1
50 First Dates	Sony Pictures Entertainment (SPE)	2004	198520934	39852237	120908074	60.9	77612860	39.1
Total Recall	Sony Pictures Entertainment (SPE)	2012	198467168	25577758	58877969	29.7	139589199	70.3
The Island	Well Go USA Entertainment	2018	198326350	263412	670883	0.3	197655467	99.7
The Impossible	Lionsgate	2012	198087212	143818	19019882	9.6	179067330	90.4
Lost in Thailand		2012	197757387	32206	57387	0.1	197700000	100
Christopher Robin	Walt Disney Studios Motion Pictures	2018	197744377	24585139	99215042	50.2	98529335	49.8
Jack the Giant Slayer	Warner Bros.	2013	197687603	27202226	65187603	33	132500000	67
Smurfs: The Lost Village	Sony Pictures Entertainment (SPE)	2017	197183546	13210449	45020282	22.8	152163264	77.2
Chinese Doctors	Unknown	2021	197143218	0	0	0	197143218	100
Spy Kids 3: Game Over	Dimension Films	2003	197101678	32500000	111761982	56.7	85339696	43.3
Panic Room	Sony Pictures Entertainment (SPE)	2002	197079546	30056751	96397334	48.9	100682212	51.1
The Other Woman	Twentieth Century Fox	2014	196710396	24763752	83911193	42.7	112799203	57.3
Stargate	Metro-Goldwyn-Mayer (MGM)	1994	196567262	16651018	71567262	36.4	125000000	63.6
Beowulf	Paramount Pictures	2007	196393745	27515871	82280579	41.9	114113166	58.1
The Vow	Screen Gems	2012	196114570	41202458	125014030	63.8	71100540	36.2
Anger Management	Revolution Studios	2003	195745823	42220847	135645823	69.3	60100000	30.7
Tropic Thunder	DreamWorks	2008	195702963	25812796	110515313	56.5	85187650	43.5
The Shape of Water		2017	195333312	166564	63859435	32.7	131473877	67.3
Rocketman	Paramount Pictures	2019	195320400	25725722	96368160	49.3	98952240	50.7
The Pelican Brief	Warner Bros.	1993	195268056	16864404	100768056	51.6	94500000	48.4
The BFG	Walt Disney Studios Motion Pictures	2016	195243411	18775350	55483770	28.4	139759641	71.6
Downton Abbey	Focus Features	2019	194694725	31033665	96853865	49.8	97840860	50.2
The Intern	Warner Bros.	2015	194564672	17728313	75764672	38.9	118800000	61.1
Wallace & Gromit: The Curse of the Were-Rabbit	DreamWorks Distribution	2005	194137295	16025987	56110897	28.9	138026398	71.1
Gnomeo & Juliet	Walt Disney Studios Motion Pictures	2011	193967670	25356909	99967670	51.5	94000000	48.5
The Sum of All Fears	Paramount Pictures	2002	193921372	31178526	118907036	61.3	75014336	38.7
Gangs of New York	Miramax	2002	193772504	9100000	77812000	40.2	115960504	59.8
The Post	Twentieth Century Fox	2017	193764664	526011	81903458	42.3	111861206	57.7
The Monkey King 2	China Lion Film Distribution	2016	193678298	166391	709982	0.4	192968316	99.6
Paranormal Activity	Paramount Pictures	2009	193355800	77873	107918810	55.8	85436990	44.2
Weathering with You	GKIDS	2019	192951441	1808533	8056636	4.2	184894805	95.8
The Lost City	Paramount Pictures	2022	192907684	30453269	105344029	54.6	87563655	45.4
The Equalizer	Sony Pictures Entertainment (SPE)	2014	192330738	34137828	101530738	52.8	90800000	47.2
Sheep Without a Shepherd	Unknown	2019	191602146	0	0	0	191602146	100
The Addams Family	Paramount Pictures	1991	191502426	24203754	113502426	59.3	78000000	40.7
The Longest Yard	Paramount Pictures	2005	191466556	47606480	158119460	82.6	33347096	17.4
The Santa Clause	Walt Disney Studios Motion Pictures	1994	190539357	19321992	145539357	76.4	45000000	23.6
Cheaper by the Dozen	Twentieth Century Fox	2003	190538630	27557647	138614544	72.8	51924086	27.2
The Equalizer 2	Sony Pictures Entertainment (SPE)	2018	190400157	36011640	102084362	53.6	88315795	46.4
Abominable	Universal Pictures	2019	190304772	20612100	61270390	32.2	129034382	67.8
Hollow Man	Sony Pictures Entertainment (SPE)	2000	190213455	26414386	73209340	38.5	117004115	61.5
Outbreak	Warner Bros.	1995	189859560	13420387	67659560	35.6	122200000	64.4
The White Storm 2: Drug Lords		2019	189396380	244795	609461	0.3	188786919	99.7
The X Files	Twentieth Century Fox	1998	189176423	30138758	83898313	44.4	105278110	55.6
Breakup Buddies	China Lion Film Distribution	2014	189017596	230204	777896	0.4	188239700	99.6
Rambo III	TriStar Pictures	1988	189015611	13034238	53715611	28.4	135300000	71.6
The Secret Life of Walter Mitty	Twentieth Century Fox	2013	188133322	12765508	58236838	31	129896484	69
Project Gutenberg	Unknown	2018	188116796	0	0	0	188116796	100
Jaws 2	Universal Pictures	1978	187884007	9866023	81766007	43.5	106118000	56.5
12 Years a Slave		2013	187733202	923715	56671993	30.2	131061209	69.8
Heat	Warner Bros.	1995	187436818	8445656	67436818	36	120000000	64
Mr. Popper's Penguins	Twentieth Century Fox	2011	187361754	18445355	68224452	36.4	119137302	63.6
The Grudge	Sony Pictures Entertainment (SPE)	2004	187281115	39128715	110359362	58.9	76921753	41.1
One Piece Film: Red	Crunchyroll	2022	187170704	9340245	12775324	6.8	174395380	93.2
I Now Pronounce You Chuck & Larry	Universal Pictures	2007	187134117	34233750	120059556	64.2	67074561	35.8
The Horse Whisperer	Walt Disney Studios Motion Pictures	1998	186883563	13685488	75383563	40.3	111500000	59.7
Walk the Line	Twentieth Century Fox	2005	186797986	22347341	119519402	64	67278584	36
Jian Bing Man	Unknown	2015	186699768	0	0	0	186699768	100
The Jungle Book 2	Walt Disney Studios Motion Pictures	2003	186303759	11441733	47901582	25.7	138402177	74.3
The Final Destination	Warner Bros.	2009	186167139	27408309	66477700	35.7	119689439	64.3
Atlantis: The Lost Empire	Walt Disney Studios Motion Pictures	2001	186053725	329011	84056472	45.2	101997253	54.8
Inside Man	Universal Pictures	2006	186003591	28954945	88513495	47.6	97490096	52.4
The Waterboy	Walt Disney Studios Motion Pictures	1998	185991646	39414071	161491646	86.8	24500000	13.2
Hugo	Paramount Pictures	2011	185770310	11364505	73864507	39.8	111905803	60.2
Pitch Perfect 3	Universal Pictures	2017	185400345	19928525	104897530	56.6	80502815	43.4
Watchmen	Warner Bros.	2009	185382813	55214334	107509799	58	77873014	42
The Birdcage	Metro-Goldwyn-Mayer (MGM)	1996	185260553	18275828	124060553	67	61200000	33
Moulin Rouge!	Twentieth Century Fox	2001	184928542	167540	57386607	31	127541935	69
Snow White and the Seven Dwarfs	Walt Disney Studios Motion Pictures	1937	184925486	0	184925486	100	0	0
Ode to My Father	CJ Entertainment	2014	184827559	33880	2300121	1.2	182527438	98.8
Hop	Universal Pictures	2011	184367145	37543710	108498305	58.8	75868840	41.2
Bad Moms	STX Entertainment	2016	183936074	23817340	113257297	61.6	70678777	38.4
Jupiter Ascending	Warner Bros.	2015	183887723	18372372	47387723	25.8	136500000	74.2
Knowing	Summit Entertainment	2007	183658498	24604751	79957634	43.5	103700864	56.5
102 Dalmatians	Walt Disney Studios Motion Pictures	2000	183611771	19883351	66957026	36.5	116654745	63.5
Storks	Warner Bros.	2016	183510278	21311407	72800603	39.7	110709675	60.3
Stand by Me Doraemon	Unknown	2014	183442714	0	0	0	183442714	100
The Hitman's Bodyguard	Lionsgate	2017	183428689	21384504	75468583	41.1	107960106	58.9
Paul Blart: Mall Cop	Sony Pictures Entertainment (SPE)	2009	183348429	31832636	146336178	79.8	37012251	20.2
Wayne's World	Paramount Pictures	1992	183097323	18122710	121697323	66.5	61400000	33.5
Maverick	Warner Bros.	1994	183031272	17248545	101631272	55.5	81400000	44.5
Mirror Mirror	Relativity Media	2012	183018522	18132085	64935167	35.5	118083355	64.5
The Man in the Iron Mask	Metro-Goldwyn-Mayer (MGM)	1998	182968902	17271450	56968902	31.1	126000000	68.9
Cape Fear	Universal Pictures	1991	182291969	10261025	79091969	43.4	103200000	56.6
The Haunted Mansion	Walt Disney Studios Motion Pictures	2003	182290266	24278410	75847266	41.6	106443000	58.4
The Monkey King: Havoc in Heaven's Palace	Unknown	2014	182206924	0	0	0	182206924	100
While You Were Sleeping	Walt Disney Studios Motion Pictures	1995	182057016	9288915	81057016	44.5	101000000	55.5
The Bridges of Madison County	Warner Bros.	1995	182016617	10519257	71516617	39.3	110500000	60.7
From Vegas to Macau III	Unknown	2016	181732879	0	0	0	181732879	100
Poseidon	Warner Bros.	2006	181674817	22155410	60674817	33.4	121000000	66.6
The First Wives Club	Paramount Pictures	1996	181489203	18913411	105489203	58.1	76000000	41.9
Cliff Walkers	CMC Pictures	2021	181325565	53142	152972	0.1	181172593	99.9
Scooby-Doo 2: Monsters Unleashed	Warner Bros.	2004	181239132	29438331	84239132	46.5	97000000	53.5
Hot Shots!	Twentieth Century Fox	1991	181096164	10848182	69467617	38.4	111628547	61.6
Road to Perdition	DreamWorks Distribution	2002	181001478	22079481	104454762	57.7	76546716	42.3
Kill Bill: Vol. 1	Miramax	2003	180906076	22200000	70099045	38.8	110807031	61.2
The Scorpion King	Universal Pictures	2002	180630907	36075875	91047077	50.4	89583830	49.6
Sweet Home Alabama	Walt Disney Studios Motion Pictures	2002	180622424	35648740	127223418	70.4	53399006	29.6
Daddy's Home 2	Paramount Pictures	2017	180613824	29651193	104029443	57.6	76584381	42.4
Hacksaw Ridge	Lionsgate	2016	180563636	15190758	67209615	37.2	113354021	62.8
Deja Vu	Walt Disney Studios Motion Pictures	2006	180557550	20574802	64038616	35.5	116518934	64.5
M3gan	Universal Pictures	2022	179629435	30429860	95043350	52.9	84586085	47.1
Dangerous Minds	Walt Disney Studios Motion Pictures	1995	179519401	14931503	84919401	47.3	94600000	52.7
The Dictator	Paramount Pictures	2012	179379533	17435092	59650222	33.2	119729311	66.8
The League of Extraordinary Gentlemen	Twentieth Century Fox	2003	179265204	23075892	66465204	37.1	112800000	62.9
Allegiant	Lionsgate	2016	179246868	29027348	66184051	36.9	113062817	63.1
Daredevil	Twentieth Century Fox	2003	179179718	40310419	102543518	57.2	76636200	42.8
City Slickers	Columbia Pictures	1991	179033791	13032121	124033791	69.3	55000000	30.7
\.


--
-- Data for Name: movie_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_details (title, year, distributor, running_time, mpaa, budget) FROM stdin;
Avatar	2009	Twentieth Century Fox	2 hr 42 min	PG-13	237000000
Avengers: Endgame	2019	Walt Disney Studios Motion Pictures	3 hr 1 min	PG-13	356000000
Avatar: The Way of Water	2022	20th Century Studios	3 hr 12 min	PG-13	0
Titanic	1997	Paramount Pictures	3 hr 14 min	PG-13	200000000
Star Wars: Episode VII - The Force Awakens	2015	Walt Disney Studios Motion Pictures	2 hr 18 min	PG-13	245000000
Avengers: Infinity War	2018	Walt Disney Studios Motion Pictures	2 hr 29 min	PG-13	0
Spider-Man: No Way Home	2021	Sony Pictures Entertainment (SPE)	2 hr 28 min	PG-13	0
Jurassic World	2015	Universal Pictures	2 hr 4 min	PG-13	150000000
The Lion King	2019	Walt Disney Studios Motion Pictures	1 hr 58 min	PG	260000000
The Avengers	2012	Walt Disney Studios Motion Pictures	2 hr 23 min	PG-13	220000000
Furious 7	2015	Universal Pictures	2 hr 17 min	PG-13	190000000
Top Gun: Maverick	2022	Paramount Pictures	2 hr 10 min	PG-13	0
Frozen II	2019	Walt Disney Studios Motion Pictures	1 hr 43 min	PG	150000000
Avengers: Age of Ultron	2015	Walt Disney Studios Motion Pictures	2 hr 21 min	PG-13	250000000
Black Panther	2018	Walt Disney Studios Motion Pictures	2 hr 14 min	PG-13	0
The Super Mario Bros. Movie	2023	Universal Pictures	1 hr 32 min	PG	0
Harry Potter and the Deathly Hallows: Part 2	2011	Warner Bros.	2 hr 10 min	PG-13	0
Star Wars: Episode VIII - The Last Jedi	2017	Walt Disney Studios Motion Pictures	2 hr 32 min	PG-13	317000000
Jurassic World: Fallen Kingdom	2018	Universal Pictures	2 hr 8 min	PG-13	170000000
Frozen	2013	Walt Disney Studios Motion Pictures	1 hr 42 min	PG	150000000
Beauty and the Beast	2017	Walt Disney Studios Motion Pictures	2 hr 9 min	PG	160000000
Incredibles 2	2018	Walt Disney Studios Motion Pictures	1 hr 58 min	PG	0
The Fate of the Furious	2017	Universal Pictures	2 hr 16 min	PG-13	250000000
Iron Man 3	2013	Walt Disney Studios Motion Pictures	2 hr 10 min	PG-13	200000000
Minions	2015	Universal Pictures	1 hr 31 min	PG	74000000
Captain America: Civil War	2016	Walt Disney Studios Motion Pictures	2 hr 27 min	PG-13	250000000
Aquaman	2018	Warner Bros.	2 hr 23 min	PG-13	0
The Lord of the Rings: The Return of the King	2003	New Line Cinema	3 hr 21 min	PG-13	94000000
Skyfall	2012	Sony Pictures Entertainment (SPE)	2 hr 23 min	PG-13	200000000
Spider-Man: Far from Home	2019	Sony Pictures Entertainment (SPE)	2 hr 9 min	PG-13	160000000
Captain Marvel	2019	Walt Disney Studios Motion Pictures	2 hr 3 min	PG-13	160000000
Transformers: Dark of the Moon	2011	DreamWorks	2 hr 34 min	PG-13	195000000
Jurassic Park	1993	Universal Pictures	2 hr 7 min	PG-13	63000000
Transformers: Age of Extinction	2014	Paramount Pictures	2 hr 45 min	PG-13	210000000
My People, My Homeland	2020	Unknown	2 hr 33 min	Not Rated	0
The Dark Knight Rises	2012	Warner Bros.	2 hr 44 min	PG-13	250000000
Star Wars: Episode IX - The Rise of Skywalker	2019	Walt Disney Studios Motion Pictures	2 hr 21 min	PG-13	275000000
Joker	2019	Warner Bros.	2 hr 2 min	R	55000000
Toy Story 4	2019	Walt Disney Studios Motion Pictures	1 hr 40 min	G	200000000
Toy Story 3	2010	Walt Disney Studios Motion Pictures	1 hr 43 min	Not Rated	200000000
Pirates of the Caribbean: Dead Man's Chest	2006	Walt Disney Studios Motion Pictures	2 hr 31 min	PG-13	225000000
Rogue One: A Star Wars Story	2016	Walt Disney Studios Motion Pictures	2 hr 13 min	PG-13	200000000
Aladdin	2019	Walt Disney Studios Motion Pictures	2 hr 8 min	PG	183000000
Pirates of the Caribbean: On Stranger Tides	2011	Walt Disney Studios Motion Pictures	2 hr 17 min	PG-13	250000000
Despicable Me 3	2017	Universal Pictures	1 hr 29 min	PG	80000000
Finding Dory	2016	Walt Disney Studios Motion Pictures	1 hr 37 min	PG	0
Star Wars: Episode I - The Phantom Menace	1999	Twentieth Century Fox	2 hr 16 min	PG	115000000
Zootopia	2016	Walt Disney Studios Motion Pictures	1 hr 48 min	PG	0
Alice in Wonderland	2010	Walt Disney Studios Motion Pictures	1 hr 48 min	PG	200000000
Harry Potter and the Sorcerer's Stone	2001	Warner Bros.	2 hr 32 min	PG	125000000
The Hobbit: An Unexpected Journey	2012	Warner Bros.	2 hr 49 min	PG-13	0
The Dark Knight	2008	Warner Bros.	2 hr 32 min	PG-13	185000000
Jurassic World Dominion	2022	Universal Pictures	2 hr 27 min	PG-13	0
Jumanji: Welcome to the Jungle	2017	Sony Pictures Entertainment (SPE)	1 hr 59 min	PG-13	90000000
Harry Potter and the Deathly Hallows: Part 1	2010	Warner Bros.	2 hr 26 min	PG-13	0
Despicable Me 2	2013	Universal Pictures	1 hr 38 min	PG	76000000
The Lion King	1994	Walt Disney Studios Motion Pictures	1 hr 28 min	G	45000000
The Jungle Book	2016	Walt Disney Studios Motion Pictures	1 hr 46 min	PG	175000000
The Hobbit: The Battle of the Five Armies	2014	Warner Bros.	2 hr 24 min	PG-13	0
Pirates of the Caribbean: At World's End	2007	Walt Disney Studios Motion Pictures	2 hr 49 min	PG-13	300000000
The Hobbit: The Desolation of Smaug	2013	Warner Bros.	2 hr 41 min	PG-13	0
Doctor Strange in the Multiverse of Madness	2022	Walt Disney Studios Motion Pictures	2 hr 6 min	PG-13	0
The Lord of the Rings: The Two Towers	2002	New Line Cinema	2 hr 59 min	PG-13	94000000
Harry Potter and the Order of the Phoenix	2007	Warner Bros.	2 hr 18 min	PG-13	150000000
Finding Nemo	2003	Walt Disney Studios Motion Pictures	1 hr 40 min	Not Rated	94000000
Minions: The Rise of Gru	2022	Universal Pictures	1 hr 27 min	PG	0
Harry Potter and the Half-Blood Prince	2009	Warner Bros.	2 hr 33 min	PG	250000000
Shrek 2	2004	DreamWorks Distribution	1 hr 33 min	PG	150000000
Harry Potter and the Chamber of Secrets	2002	Warner Bros.	2 hr 41 min	PG	100000000
Bohemian Rhapsody	2018	Twentieth Century Fox	2 hr 14 min	PG-13	52000000
The Battle at Lake Changjin	2021	CMC Pictures	2 hr 56 min	Not Rated	0
The Lord of the Rings: The Fellowship of the Ring	2001	New Line Cinema	2 hr 58 min	PG-13	93000000
Harry Potter and the Goblet of Fire	2005	Warner Bros.	2 hr 37 min	PG-13	150000000
Spider-Man 3	2007	Sony Pictures Entertainment (SPE)	2 hr 19 min	PG-13	258000000
The Secret Life of Pets	2016	Universal Pictures	1 hr 27 min	PG	75000000
Ice Age: Dawn of the Dinosaurs	2009	Twentieth Century Fox	1 hr 34 min	PG	90000000
Spectre	2015	Sony Pictures Entertainment (SPE)	2 hr 28 min	PG-13	245000000
Spider-Man: Homecoming	2017	Sony Pictures Entertainment (SPE)	2 hr 13 min	PG-13	175000000
Ice Age: Continental Drift	2012	Twentieth Century Fox	1 hr 28 min	PG	95000000
Batman v Superman: Dawn of Justice	2016	Warner Bros.	2 hr 31 min	PG-13	250000000
Inception	2010	Warner Bros.	2 hr 28 min	PG-13	160000000
Wolf Warrior 2	2017	The H Collective	2 hr 3 min	Not Rated	30100000
Star Wars: Episode III - Revenge of the Sith	2005	Twentieth Century Fox	2 hr 20 min	PG-13	113000000
The Hunger Games: Catching Fire	2013	Lionsgate	2 hr 26 min	PG-13	130000000
Guardians of the Galaxy Vol. 2	2017	Walt Disney Studios Motion Pictures	2 hr 16 min	PG-13	200000000
Black Panther: Wakanda Forever	2022	Walt Disney Studios Motion Pictures	2 hr 41 min	PG-13	0
Inside Out	2015	Walt Disney Studios Motion Pictures	1 hr 35 min	PG	175000000
Venom	2018	Sony Pictures Entertainment (SPE)	1 hr 52 min	PG-13	100000000
Thor: Ragnarok	2017	Walt Disney Studios Motion Pictures	2 hr 10 min	PG-13	180000000
The Twilight Saga: Breaking Dawn - Part 2	2012	Lionsgate	1 hr 55 min	PG-13	120000000
Guardians of the Galaxy Vol. 3	2023	Walt Disney Studios Motion Pictures	2 hr 30 min	PG-13	0
Transformers: Revenge of the Fallen	2009	DreamWorks	2 hr 29 min	PG-13	200000000
Spider-Man	2002	Sony Pictures Entertainment (SPE)	2 hr 1 min	PG-13	139000000
Wonder Woman	2017	Warner Bros.	2 hr 21 min	PG-13	149000000
Hi, Mom	2021	Unknown	2 hr 8 min	Not Rated	0
Independence Day	1996	Twentieth Century Fox	2 hr 25 min	PG-13	75000000
Coco	2017	Walt Disney Studios Motion Pictures	1 hr 45 min	PG	0
Fantastic Beasts and Where to Find Them	2016	Warner Bros.	2 hr 12 min	PG-13	180000000
Shrek the Third	2007	DreamWorks	1 hr 33 min	PG	160000000
Jumanji: The Next Level	2019	Sony Pictures Entertainment (SPE)	2 hr 3 min	PG-13	125000000
Harry Potter and the Prisoner of Azkaban	2004	Warner Bros.	2 hr 22 min	PG	130000000
Pirates of the Caribbean: Dead Men Tell No Tales	2017	Walt Disney Studios Motion Pictures	2 hr 9 min	PG-13	230000000
E.T. the Extra-Terrestrial	1982	Universal Pictures	1 hr 55 min	PG	10500000
Mission: Impossible - Fallout	2018	Paramount Pictures	2 hr 27 min	PG-13	178000000
2012	2009	Sony Pictures Entertainment (SPE)	2 hr 38 min	PG-13	200000000
Indiana Jones and the Kingdom of the Crystal Skull	2008	Paramount Pictures	2 hr 2 min	PG-13	185000000
Spider-Man 2	2004	Sony Pictures Entertainment (SPE)	2 hr 7 min	PG-13	200000000
Fast & Furious 6	2013	Universal Pictures	2 hr 10 min	PG-13	160000000
Deadpool 2	2018	Twentieth Century Fox	1 hr 59 min	R	110000000
Deadpool	2016	Twentieth Century Fox	1 hr 48 min	R	58000000
Star Wars: Episode IV - A New Hope	1977	Twentieth Century Fox	2 hr 1 min	PG	11000000
No Time to Die	2021	Metro-Goldwyn-Mayer (MGM)	2 hr 43 min	PG-13	0
Interstellar	2014	Paramount Pictures	2 hr 49 min	PG-13	165000000
Guardians of the Galaxy	2014	Walt Disney Studios Motion Pictures	2 hr 1 min	PG-13	170000000
The Batman	2022	Warner Bros.	2 hr 56 min	PG-13	0
Thor: Love and Thunder	2022	Walt Disney Studios Motion Pictures	1 hr 58 min	PG-13	0
Fast & Furious Presents: Hobbs & Shaw	2019	Universal Pictures	2 hr 17 min	Not Rated	200000000
The Da Vinci Code	2006	Sony Pictures Entertainment (SPE)	2 hr 29 min	PG-13	125000000
Maleficent	2014	Walt Disney Studios Motion Pictures	1 hr 37 min	PG	180000000
The Amazing Spider-Man	2012	Sony Pictures Entertainment (SPE)	2 hr 16 min	PG-13	230000000
The Hunger Games: Mockingjay - Part 1	2014	Lionsgate	2 hr 3 min	PG-13	125000000
Shrek Forever After	2010	DreamWorks	1 hr 35 min	PG	165000000
Gravity	2013	Warner Bros.	1 hr 31 min	PG-13	100000000
Madagascar 3: Europe's Most Wanted	2012	DreamWorks	1 hr 35 min	PG	145000000
Suicide Squad	2016	Warner Bros.	2 hr 3 min	PG-13	175000000
X-Men: Days of Future Past	2014	Twentieth Century Fox	2 hr 12 min	PG-13	200000000
The Chronicles of Narnia: The Lion, the Witch and the Wardrobe	2005	Walt Disney Studios Motion Pictures	2 hr 23 min	PG	180000000
Monsters University	2013	Walt Disney Studios Motion Pictures	1 hr 44 min	G	0
The Matrix Reloaded	2003	Warner Bros.	2 hr 18 min	R	150000000
Up	2009	Walt Disney Studios Motion Pictures	1 hr 36 min	PG	175000000
Ne Zha	2019	Well Go USA Entertainment	1 hr 50 min	Not Rated	0
F9: The Fast Saga	2021	Universal Pictures	2 hr 23 min	PG-13	0
Captain America: The Winter Soldier	2014	Walt Disney Studios Motion Pictures	2 hr 16 min	PG-13	170000000
The Twilight Saga: Breaking Dawn - Part 1	2011	Summit Entertainment	1 hr 57 min	PG-13	110000000
The Twilight Saga: New Moon	2009	Summit Entertainment	2 hr 10 min	PG-13	50000000
Dawn of the Planet of the Apes	2014	Twentieth Century Fox	2 hr 10 min	PG-13	170000000
Transformers	2007	DreamWorks	2 hr 24 min	PG-13	150000000
The Amazing Spider-Man 2	2014	Sony Pictures Entertainment (SPE)	2 hr 22 min	PG-13	0
Fast X	2023	Universal Pictures	2 hr 21 min	PG-13	0
It	2017	Warner Bros.	2 hr 15 min	R	35000000
The Wandering Earth	2019		2 hr 5 min	Not Rated	0
The Twilight Saga: Eclipse	2010	Summit Entertainment	2 hr 4 min	PG-13	68000000
Mission: Impossible - Ghost Protocol	2011	Paramount Pictures	2 hr 12 min	PG-13	145000000
Mamma Mia!	2008	Universal Pictures	1 hr 48 min	PG-13	52000000
The Hunger Games	2012	Lionsgate	2 hr 22 min	PG-13	78000000
Detective Chinatown 3	2021	Warner Bros.	2 hr 16 min	R	0
Mission: Impossible - Rogue Nation	2015	Paramount Pictures	2 hr 11 min	PG-13	150000000
Moana	2016	Walt Disney Studios Motion Pictures	1 hr 47 min	PG	0
Forrest Gump	1994	Paramount Pictures	2 hr 22 min	PG-13	55000000
Doctor Strange	2016	Walt Disney Studios Motion Pictures	1 hr 55 min	PG-13	165000000
The Sixth Sense	1999	Walt Disney Studios Motion Pictures	1 hr 47 min	PG-13	40000000
Man of Steel	2013	Warner Bros.	2 hr 23 min	PG-13	225000000
Ice Age: The Meltdown	2006	Twentieth Century Fox	1 hr 31 min	PG	80000000
Kung Fu Panda 2	2011	DreamWorks	1 hr 30 min	PG	150000000
Spider-Man: Across the Spider-Verse	2023	Columbia Pictures	2 hr 20 min	PG	0
Justice League	2017	Warner Bros.	2 hr	PG-13	0
Big Hero 6	2014	Walt Disney Studios Motion Pictures	1 hr 42 min	PG	165000000
Fantastic Beasts: The Crimes of Grindelwald	2018	Warner Bros.	2 hr 14 min	PG-13	200000000
Pirates of the Caribbean: The Curse of the Black Pearl	2003	Walt Disney Studios Motion Pictures	2 hr 23 min	PG-13	140000000
Men in Black 3	2012	Sony Pictures Entertainment (SPE)	1 hr 46 min	PG-13	225000000
Star Wars: Episode II - Attack of the Clones	2002	Twentieth Century Fox	2 hr 22 min	PG	115000000
The Hunger Games: Mockingjay - Part 2	2015	Lionsgate	2 hr 17 min	PG-13	160000000
Thor: The Dark World	2013	Walt Disney Studios Motion Pictures	1 hr 52 min	PG-13	170000000
Sing	2016	Universal Pictures	1 hr 48 min	PG	75000000
Kung Fu Panda	2008	DreamWorks	1 hr 32 min	PG	130000000
The Incredibles	2004	Walt Disney Studios Motion Pictures	1 hr 55 min	PG	92000000
The Martian	2015	Twentieth Century Fox	2 hr 24 min	PG-13	108000000
Hancock	2008	Sony Pictures Entertainment (SPE)	1 hr 32 min	PG-13	150000000
Water Gate Bridge	2022	CMC Pictures	2 hr 33 min	Not Rated	0
Fast Five	2011	Universal Pictures	2 hr 10 min	PG-13	125000000
Iron Man 2	2010	Paramount Pictures	2 hr 4 min	PG-13	200000000
Ratatouille	2007	Walt Disney Studios Motion Pictures	1 hr 51 min	G	150000000
Ant-Man and the Wasp	2018	Walt Disney Studios Motion Pictures	1 hr 58 min	PG-13	0
How to Train Your Dragon 2	2014	Twentieth Century Fox	1 hr 42 min	PG	145000000
Logan	2017	Twentieth Century Fox	2 hr 17 min	R	97000000
The Lost World: Jurassic Park	1997	Universal Pictures	2 hr 9 min	PG-13	73000000
Casino Royale	2006	Sony Pictures Entertainment (SPE)	2 hr 24 min	PG-13	150000000
The Passion of the Christ	2004	Newmarket Films	2 hr 7 min	R	30000000
Life of Pi	2012	Twentieth Century Fox	2 hr 7 min	PG	120000000
Ready Player One	2018	Warner Bros.	2 hr 20 min	PG-13	175000000
Transformers: The Last Knight	2017	Paramount Pictures	2 hr 34 min	PG-13	217000000
Madagascar: Escape 2 Africa	2008	DreamWorks	1 hr 29 min	PG	150000000
War of the Worlds	2005	Paramount Pictures	1 hr 56 min	PG-13	132000000
Tangled	2010	Walt Disney Studios Motion Pictures	1 hr 40 min	PG	260000000
Quantum of Solace	2008	Sony Pictures Entertainment (SPE)	1 hr 46 min	PG-13	200000000
Men in Black	1997	Sony Pictures Entertainment (SPE)	1 hr 38 min	PG-13	90000000
The Croods	2013	Twentieth Century Fox	1 hr 38 min	PG	135000000
The Hangover Part II	2011	Warner Bros.	1 hr 42 min	R	80000000
Iron Man	2008	Paramount Pictures	2 hr 6 min	PG-13	140000000
I Am Legend	2007	Warner Bros.	1 hr 41 min	PG-13	150000000
Monsters, Inc.	2001	Walt Disney Studios Motion Pictures	1 hr 32 min	G	115000000
Operation Red Sea	2018	Well Go USA Entertainment	2 hr 22 min	Not Rated	0
Night at the Museum	2006	Twentieth Century Fox	1 hr 48 min	PG	0
Fifty Shades of Grey	2015	Universal Pictures	2 hr 5 min	R	40000000
Kong: Skull Island	2017	Warner Bros.	1 hr 58 min	PG-13	185000000
The Smurfs	2011	Sony Pictures Entertainment (SPE)	1 hr 43 min	PG	110000000
Cars 2	2011	Walt Disney Studios Motion Pictures	1 hr 46 min	G	200000000
King Kong	2005	Universal Pictures	3 hr 7 min	PG-13	207000000
Puss in Boots	2011	DreamWorks	1 hr 30 min	PG	130000000
The Little Mermaid	2023	Walt Disney Studios Motion Pictures	2 hr 15 min	PG	0
The Mermaid	2016	Sony Pictures Entertainment (SPE)	1 hr 34 min	R	0
Armageddon	1998	Walt Disney Studios Motion Pictures	2 hr 31 min	PG-13	140000000
The Day After Tomorrow	2004	Twentieth Century Fox	2 hr 4 min	PG-13	125000000
Ted	2012	Universal Pictures	1 hr 46 min	R	50000000
American Sniper	2014	Warner Bros.	2 hr 13 min	R	58800000
Mission: Impossible II	2000	Paramount Pictures	2 hr 3 min	PG-13	125000000
Detective Chinatown 2	2018	Warner Bros.	2 hr 1 min	R	0
X-Men: Apocalypse	2016	Twentieth Century Fox	2 hr 24 min	PG-13	178000000
Sherlock Holmes: A Game of Shadows	2011	Warner Bros.	2 hr 9 min	PG-13	0
Despicable Me	2010	Universal Pictures	1 hr 35 min	PG	69000000
Cinderella	2015	Walt Disney Studios Motion Pictures	1 hr 45 min	PG	95000000
Madagascar	2005	DreamWorks Distribution	1 hr 26 min	PG	0
World War Z	2013	Paramount Pictures	1 hr 56 min	PG-13	190000000
Brave	2012	Walt Disney Studios Motion Pictures	1 hr 33 min	PG	185000000
Star Wars: Episode V - The Empire Strikes Back	1980	Twentieth Century Fox	2 hr 4 min	PG	18000000
The Simpsons Movie	2007	Twentieth Century Fox	1 hr 27 min	PG-13	75000000
The Revenant	2015	Twentieth Century Fox	2 hr 36 min	R	135000000
The Meg	2018	Warner Bros.	1 hr 53 min	PG-13	130000000
Ralph Breaks the Internet	2018	Walt Disney Studios Motion Pictures	1 hr 52 min	PG	175000000
Hotel Transylvania 3: Summer Vacation	2018	Sony Pictures Entertainment (SPE)	1 hr 37 min	PG	80000000
The Boss Baby	2017	Twentieth Century Fox	1 hr 37 min	PG	0
Dunkirk	2017	Warner Bros.	1 hr 46 min	PG-13	100000000
The Grinch	2018	Universal Pictures	1 hr 25 min	PG	75000000
Godzilla	2014	Warner Bros.	2 hr 3 min	PG-13	160000000
How to Train Your Dragon: The Hidden World	2019	Universal Pictures	1 hr 44 min	PG	129000000
Sherlock Holmes	2009	Warner Bros.	2 hr 8 min	PG-13	90000000
Meet the Fockers	2004	Universal Pictures	1 hr 55 min	PG-13	80000000
WALL·E	2008	Walt Disney Studios Motion Pictures	1 hr 38 min	Not Rated	180000000
Kung Fu Panda 3	2016	Twentieth Century Fox	1 hr 35 min	PG	145000000
Terminator 2: Judgment Day	1991	TriStar Pictures	2 hr 17 min	R	102000000
Ant-Man	2015	Walt Disney Studios Motion Pictures	1 hr 57 min	PG-13	130000000
Venom: Let There Be Carnage	2021	Sony Pictures Entertainment (SPE)	1 hr 37 min	PG-13	0
Ghost	1990	Paramount Pictures	2 hr 7 min	Not Rated	22000000
Aladdin	1992	Walt Disney Studios Motion Pictures	1 hr 30 min	Not Rated	28000000
Gladiator	2000	DreamWorks Distribution	2 hr 35 min	R	103000000
Rio 2	2014	Twentieth Century Fox	1 hr 41 min	G	103000000
Troy	2004	Warner Bros.	2 hr 43 min	R	175000000
Toy Story 2	1999	Walt Disney Studios Motion Pictures	1 hr 32 min	Not Rated	90000000
How to Train Your Dragon	2010	DreamWorks	1 hr 38 min	PG	165000000
Twister	1996	Warner Bros.	1 hr 53 min	Not Rated	92000000
Oz the Great and Powerful	2013	Walt Disney Studios Motion Pictures	2 hr 10 min	PG	215000000
Clash of the Titans	2010	Warner Bros.	1 hr 46 min	PG-13	125000000
Maleficent: Mistress of Evil	2019	Walt Disney Studios Motion Pictures	1 hr 59 min	PG	185000000
War for the Planet of the Apes	2017	Twentieth Century Fox	2 hr 20 min	PG-13	150000000
Shrek	2001	DreamWorks Distribution	1 hr 30 min	PG	60000000
Mr. & Mrs. Smith	2005	Twentieth Century Fox	2 hr	PG-13	110000000
Angels & Demons	2009	Sony Pictures Entertainment (SPE)	2 hr 18 min	PG-13	150000000
Teenage Mutant Ninja Turtles	2014	Paramount Pictures	1 hr 41 min	PG-13	125000000
Bruce Almighty	2003	Universal Pictures	1 hr 41 min	PG-13	81000000
The King's Speech	2010	The Weinstein Company	1 hr 58 min	R	15000000
Rio	2011	Twentieth Century Fox	1 hr 36 min	PG	90000000
Saving Private Ryan	1998	DreamWorks Distribution	2 hr 49 min	R	70000000
Rise of the Planet of the Apes	2011	Twentieth Century Fox	1 hr 45 min	PG-13	93000000
Puss in Boots: The Last Wish	2022	Universal Pictures	1 hr 42 min	PG	0
Home Alone	1990	Twentieth Century Fox	1 hr 43 min	Not Rated	18000000
Jaws	1975	Universal Pictures	2 hr 4 min	Not Rated	7000000
Ant-Man and the Wasp: Quantumania	2023	Walt Disney Studios Motion Pictures	2 hr 4 min	PG-13	0
Hotel Transylvania 2	2015	Sony Pictures Entertainment (SPE)	1 hr 29 min	PG	80000000
Star Wars: Episode VI - Return of the Jedi	1983	Twentieth Century Fox	2 hr 11 min	PG	32500000
Charlie and the Chocolate Factory	2005	Warner Bros.	1 hr 55 min	PG	150000000
Indiana Jones and the Last Crusade	1989	Paramount Pictures	2 hr 7 min	PG-13	48000000
San Andreas	2015	Warner Bros.	1 hr 54 min	PG-13	110000000
It Chapter Two	2019	Warner Bros.	2 hr 49 min	R	79000000
La La Land	2016	Lionsgate	2 hr 8 min	PG-13	30000000
Wreck-It Ralph	2012	Walt Disney Studios Motion Pictures	1 hr 41 min	PG	165000000
Godzilla vs. Kong	2021	Warner Bros.	1 hr 53 min	PG-13	0
The Hangover	2009	Warner Bros.	1 hr 40 min	R	35000000
Lucy	2014	Universal Pictures	1 hr 29 min	R	40000000
The Lego Movie	2014	Warner Bros.	1 hr 40 min	PG	60000000
Bumblebee	2018	Paramount Pictures	1 hr 54 min	PG-13	135000000
Star Trek Into Darkness	2013	Paramount Pictures	2 hr 12 min	PG-13	190000000
The Matrix	1999	Warner Bros.	2 hr 16 min	R	63000000
Pretty Woman	1990	Walt Disney Studios Motion Pictures	1 hr 59 min	R	14000000
Cars	2006	Walt Disney Studios Motion Pictures	1 hr 57 min	Not Rated	120000000
The Eight Hundred	2020	CMC Pictures	2 hr 29 min	Not Rated	0
X-Men: The Last Stand	2006	Twentieth Century Fox	1 hr 44 min	PG-13	210000000
Moon Man	2022	Unknown	2 hr 2 min	Not Rated	0
National Treasure: Book of Secrets	2007	Walt Disney Studios Motion Pictures	2 hr 4 min	PG	0
Mission: Impossible	1996	Paramount Pictures	1 hr 50 min	PG-13	80000000
300	2007	Warner Bros.	1 hr 57 min	R	65000000
The Last Samurai	2003	Warner Bros.	2 hr 34 min	R	140000000
Demon Slayer the Movie: Mugen Train	2020	FUNimation Entertainment	1 hr 57 min	R	0
Dying to Survive	2018	Unknown	1 hr 57 min	Not Rated	0
Ocean's Eleven	2001	Warner Bros.	1 hr 56 min	PG-13	85000000
My People, My Country	2019		2 hr 34 min	Not Rated	0
Pokémon: Detective Pikachu	2019	Warner Bros.	1 hr 44 min	PG	150000000
Thor	2011	Paramount Pictures	1 hr 55 min	PG-13	150000000
Pearl Harbor	2001	Walt Disney Studios Motion Pictures	3 hr 3 min	PG-13	140000000
Tarzan	1999	Walt Disney Studios Motion Pictures	1 hr 28 min	G	130000000
Men in Black II	2002	Sony Pictures Entertainment (SPE)	1 hr 28 min	PG-13	140000000
The Bourne Ultimatum	2007	Universal Pictures	1 hr 55 min	PG-13	110000000
The Mummy Returns	2001	Universal Pictures	2 hr 10 min	PG-13	98000000
Alvin and the Chipmunks: The Squeakquel	2009	Twentieth Century Fox	1 hr 28 min	PG	75000000
Les Misérables	2012	Universal Pictures	2 hr 38 min	PG-13	61000000
The Exorcist	1973	Warner Bros.	2 hr 2 min	R	11000000
Mrs. Doubtfire	1993	Twentieth Century Fox	2 hr 5 min	PG-13	25000000
Terminator Genisys	2015	Paramount Pictures	2 hr 6 min	PG-13	155000000
Warcraft	2016	Universal Pictures	2 hr 3 min	PG-13	160000000
A Star Is Born	2018	Warner Bros.	2 hr 16 min	R	36000000
The Greatest Showman	2017	Twentieth Century Fox	1 hr 45 min	PG	84000000
Terminator 3: Rise of the Machines	2003	Warner Bros.	1 hr 49 min	R	200000000
Shang-Chi and the Legend of the Ten Rings	2021	Walt Disney Studios Motion Pictures	2 hr 12 min	PG-13	0
Die Another Day	2002	Metro-Goldwyn-Mayer (MGM)	2 hr 13 min	PG-13	142000000
The Secret Life of Pets 2	2019	Universal Pictures	1 hr 26 min	PG	80000000
Cast Away	2000	Twentieth Century Fox	2 hr 23 min	PG-13	90000000
Rampage	2018	Warner Bros.	1 hr 47 min	PG-13	120000000
The Matrix Revolutions	2003	Warner Bros.	2 hr 9 min	R	150000000
John Wick: Chapter 4	2023	Lionsgate	2 hr 49 min	R	0
The Intouchables	2011	The Weinstein Company	1 hr 52 min	R	0
Bad Boys for Life	2020	Sony Pictures Entertainment (SPE)	2 hr 4 min	R	90000000
Django Unchained	2012	The Weinstein Company	2 hr 45 min	R	100000000
Beauty and the Beast	1991	Walt Disney Studios Motion Pictures	1 hr 24 min	Not Rated	25000000
Dances with Wolves	1990	Orion Pictures	3 hr 1 min	Not Rated	22000000
Transformers: Rise of the Beasts	2023	Paramount Pictures	2 hr 7 min	PG-13	0
The Chronicles of Narnia: Prince Caspian	2008	Walt Disney Studios Motion Pictures	2 hr 30 min	PG	225000000
Sex and the City	2008	Warner Bros.	2 hr 25 min	R	65000000
The Captain	2019	Well Go USA Entertainment	1 hr 51 min	Not Rated	0
The Mummy	1999	Universal Pictures	2 hr 4 min	PG-13	80000000
The Chronicles of Narnia: The Voyage of the Dawn Treader	2010	Twentieth Century Fox	1 hr 53 min	PG	155000000
Jason Bourne	2016	Universal Pictures	2 hr 3 min	PG-13	120000000
The Wolverine	2013	Twentieth Century Fox	2 hr 6 min	PG-13	120000000
Kingsman: The Secret Service	2015	Twentieth Century Fox	2 hr 9 min	R	81000000
Night at the Museum: Battle of the Smithsonian	2009	Twentieth Century Fox	1 hr 45 min	PG	150000000
Batman	1989	Warner Bros.	2 hr 6 min	Not Rated	35000000
The Bodyguard	1992	Warner Bros.	2 hr 9 min	R	0
Pacific Rim	2013	Warner Bros.	2 hr 11 min	PG-13	190000000
Kingsman: The Golden Circle	2017	Twentieth Century Fox	2 hr 21 min	R	104000000
The Mummy	2017	Universal Pictures	1 hr 51 min	PG-13	125000000
Ice Age: Collision Course	2016	Twentieth Century Fox	1 hr 34 min	PG	105000000
Twilight	2008	Summit Entertainment	2 hr 2 min	PG-13	37000000
Sing 2	2021	Universal Pictures	1 hr 50 min	PG	0
Signs	2002	Walt Disney Studios Motion Pictures	1 hr 46 min	PG-13	72000000
X2: X-Men United	2003	Twentieth Century Fox	2 hr 14 min	PG-13	110000000
Fantastic Beasts: The Secrets of Dumbledore	2022	Warner Bros.	2 hr 22 min	PG-13	0
Uncharted	2022	Sony Pictures Entertainment (SPE)	1 hr 56 min	PG-13	0
The Wolf of Wall Street	2013	Paramount Pictures	3 hr	R	100000000
Sonic the Hedgehog 2	2022	Paramount Pictures	2 hr 2 min	PG	0
Alita: Battle Angel	2019	Twentieth Century Fox	2 hr 2 min	PG-13	170000000
The Mummy: Tomb of the Dragon Emperor	2008	Universal Pictures	1 hr 52 min	PG-13	145000000
Prometheus	2012	Twentieth Century Fox	2 hr 4 min	R	130000000
Gone with the Wind	1939	Metro-Goldwyn-Mayer (MGM)	3 hr 58 min	Not Rated	0
Mamma Mia! Here We Go Again	2018	Universal Pictures	1 hr 54 min	PG-13	75000000
Eternals	2021	Walt Disney Studios Motion Pictures	2 hr 36 min	PG-13	0
Dune	2021	Warner Bros.	2 hr 35 min	PG-13	0
TRON: Legacy	2010	Walt Disney Studios Motion Pictures	2 hr 5 min	PG	170000000
Mission: Impossible III	2006	Paramount Pictures	2 hr 6 min	PG-13	150000000
Snow White and the Huntsman	2012	Universal Pictures	2 hr 7 min	PG-13	170000000
Grease	1978	Paramount Pictures	1 hr 50 min	PG	6000000
Fifty Shades Freed	2018	Universal Pictures	1 hr 45 min	R	55000000
Toy Story	1995	Walt Disney Studios Motion Pictures	1 hr 21 min	Not Rated	0
Black Adam	2022	Warner Bros.	2 hr 5 min	PG-13	0
Solo: A Star Wars Story	2018	Walt Disney Studios Motion Pictures	2 hr 15 min	PG-13	275000000
Superman Returns	2006	Warner Bros.	2 hr 34 min	PG-13	270000000
Robin Hood: Prince of Thieves	1991	Warner Bros.	2 hr 23 min	Not Rated	48000000
Raiders of the Lost Ark	1981	Paramount Pictures	1 hr 55 min	PG	18000000
Independence Day: Resurgence	2016	Twentieth Century Fox	2 hr	PG-13	165000000
Live Free or Die Hard	2007	Twentieth Century Fox	2 hr 8 min	PG-13	110000000
Monster Hunt	2015	FilmRise	1 hr 57 min	Not Rated	0
Godzilla: King of the Monsters	2019	Warner Bros.	2 hr 12 min	PG-13	170000000
Home	2015	Twentieth Century Fox	1 hr 34 min	PG	135000000
Star Trek	2009	Paramount Pictures	2 hr 7 min	PG-13	150000000
1917	2019	Universal Pictures	1 hr 59 min	R	95000000
Happy Feet	2006	Warner Bros.	1 hr 48 min	PG	100000000
Spider-Man: Into the Spider-Verse	2018	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG	90000000
Cars 3	2017	Walt Disney Studios Motion Pictures	1 hr 42 min	G	0
Back to the Future	1985	Universal Pictures	1 hr 56 min	Not Rated	19000000
Ice Age	2002	Twentieth Century Fox	1 hr 21 min	PG	59000000
Your Name.	2016	FUNimation Entertainment	1 hr 46 min	PG	0
Fifty Shades Darker	2017	Universal Pictures	1 hr 58 min	R	55000000
Monsters vs. Aliens	2009	DreamWorks	1 hr 34 min	PG	175000000
Mad Max: Fury Road	2015	Warner Bros.	2 hr	R	150000000
Black Widow	2021	Walt Disney Studios Motion Pictures	2 hr 14 min	PG-13	0
Godzilla	1998	Sony Pictures Entertainment (SPE)	2 hr 19 min	PG-13	130000000
True Lies	1994	Twentieth Century Fox	2 hr 21 min	R	115000000
Slumdog Millionaire	2008		2 hr	R	15000000
Once Upon a Time in Hollywood	2019	Sony Pictures Entertainment (SPE)	2 hr 41 min	R	90000000
Taken 2	2012	Twentieth Century Fox	1 hr 32 min	PG-13	45000000
G.I. Joe: Retaliation	2013	Paramount Pictures	1 hr 50 min	PG-13	130000000
Shark Tale	2004	DreamWorks Distribution	1 hr 30 min	PG	75000000
What Women Want	2000	Paramount Pictures	2 hr 7 min	PG-13	70000000
The Adventures of Tintin	2011	Paramount Pictures	1 hr 47 min	PG	0
Batman Begins	2005	Warner Bros.	2 hr 20 min	PG-13	150000000
Penguins of Madagascar	2014	Twentieth Century Fox	1 hr 32 min	PG	132000000
X-Men Origins: Wolverine	2009	Twentieth Century Fox	1 hr 47 min	PG-13	150000000
The Golden Compass	2007	New Line Cinema	1 hr 53 min	PG-13	180000000
Hitch	2005	Sony Pictures Entertainment (SPE)	1 hr 58 min	PG-13	70000000
Terminator Salvation	2009	Warner Bros.	1 hr 55 min	PG-13	200000000
Captain America: The First Avenger	2011	Paramount Pictures	2 hr 4 min	PG-13	140000000
Edge of Tomorrow	2014	Warner Bros.	1 hr 53 min	PG-13	178000000
There's Something About Mary	1998	Twentieth Century Fox	1 hr 59 min	R	23000000
Gone Girl	2014	Twentieth Century Fox	2 hr 29 min	R	61000000
The Fugitive	1993	Warner Bros.	2 hr 10 min	PG-13	0
Jurassic Park III	2001	Universal Pictures	1 hr 32 min	PG-13	93000000
My Big Fat Greek Wedding	2002	IFC Films	1 hr 35 min	PG	5000000
Shazam!	2019	Warner Bros.	2 hr 12 min	PG-13	100000000
Hello Mr. Billionaire	2018	Unknown	1 hr 58 min	Not Rated	0
Die Hard with a Vengeance	1995	Twentieth Century Fox	2 hr 8 min	R	90000000
The Nun	2018	Warner Bros.	1 hr 36 min	R	22000000
Alvin and the Chipmunks	2007	Twentieth Century Fox	1 hr 32 min	PG	60000000
Tenet	2020	Warner Bros.	2 hr 30 min	PG-13	0
Notting Hill	1999	Universal Pictures	2 hr 4 min	PG-13	42000000
A Bug's Life	1998	Walt Disney Studios Motion Pictures	1 hr 35 min	Not Rated	120000000
Night at the Museum: Secret of the Tomb	2014	Twentieth Century Fox	1 hr 38 min	PG	127000000
Ocean's Twelve	2004	Warner Bros.	2 hr 5 min	PG-13	110000000
Planet of the Apes	2001	Twentieth Century Fox	1 hr 59 min	PG-13	100000000
The Hangover Part III	2013	Warner Bros.	1 hr 40 min	R	103000000
The World Is Not Enough	1999	Metro-Goldwyn-Mayer (MGM)	2 hr 8 min	PG-13	135000000
Monster Hunt 2	2018	Lionsgate	1 hr 50 min	Not Rated	0
Fast & Furious	2009	Universal Pictures	1 hr 47 min	PG-13	85000000
Noah	2014	Paramount Pictures	2 hr 18 min	PG-13	125000000
The Karate Kid	2010	Sony Pictures Entertainment (SPE)	2 hr 20 min	PG	40000000
Home Alone 2: Lost in New York	1992	Twentieth Century Fox	2 hr	PG	0
Hotel Transylvania	2012	Sony Pictures Entertainment (SPE)	1 hr 31 min	PG	85000000
Minority Report	2002	Twentieth Century Fox	2 hr 25 min	PG-13	102000000
Top Gun	1986	Paramount Pictures	1 hr 49 min	Not Rated	0
Spirited Away	2001	Walt Disney Studios Motion Pictures	2 hr 5 min	PG	0
The Legend of Tarzan	2016	Warner Bros.	1 hr 50 min	PG-13	180000000
American Beauty	1999	DreamWorks Distribution	2 hr 2 min	R	15000000
Apollo 13	1995	Universal Pictures	2 hr 20 min	PG	0
Rain Man	1988	Metro-Goldwyn-Mayer (MGM)	2 hr 13 min	Not Rated	25000000
The Great Gatsby	2013	Warner Bros.	2 hr 23 min	PG-13	105000000
Dumbo	2019	Walt Disney Studios Motion Pictures	1 hr 52 min	PG	170000000
I, Robot	2004	Twentieth Century Fox	1 hr 55 min	PG-13	120000000
Basic Instinct	1992	TriStar Pictures	2 hr 7 min	R	49000000
Murder on the Orient Express	2017	Twentieth Century Fox	1 hr 54 min	PG-13	55000000
X-Men: First Class	2011	Twentieth Century Fox	2 hr 11 min	PG-13	160000000
The Angry Birds Movie	2016	Sony Pictures Entertainment (SPE)	1 hr 37 min	PG	73000000
GoldenEye	1995	Metro-Goldwyn-Mayer (MGM)	2 hr 10 min	PG-13	0
Catch Me If You Can	2002	DreamWorks Distribution	2 hr 21 min	PG-13	52000000
Now You See Me	2013	Lionsgate	1 hr 55 min	PG-13	75000000
Hannibal	2001	Metro-Goldwyn-Mayer (MGM)	2 hr 11 min	R	87000000
The Mask	1994	New Line Cinema	1 hr 41 min	PG-13	23000000
Peter Rabbit	2018	Sony Pictures Entertainment (SPE)	1 hr 35 min	PG	50000000
Speed	1994	Twentieth Century Fox	1 hr 56 min	R	30000000
Dinosaur	2000	Walt Disney Studios Motion Pictures	1 hr 22 min	PG	127500000
Mary Poppins Returns	2018	Walt Disney Studios Motion Pictures	2 hr 10 min	PG	130000000
Deep Impact	1998	Paramount Pictures	2 hr	PG-13	0
The Lorax	2012	Universal Pictures	1 hr 26 min	PG	70000000
The Maze Runner	2014	Twentieth Century Fox	1 hr 53 min	PG-13	34000000
The Smurfs 2	2013	Sony Pictures Entertainment (SPE)	1 hr 45 min	PG	105000000
National Treasure	2004	Walt Disney Studios Motion Pictures	2 hr 11 min	PG	100000000
Rush Hour 2	2001	New Line Cinema	1 hr 30 min	PG-13	90000000
Trolls	2016	Twentieth Century Fox	1 hr 32 min	PG	125000000
xXx: Return of Xander Cage	2017	Paramount Pictures	1 hr 47 min	PG-13	85000000
Pocahontas	1995	Walt Disney Studios Motion Pictures	1 hr 21 min	G	0
How the Grinch Stole Christmas	2000	Universal Pictures	1 hr 44 min	PG	123000000
Star Trek Beyond	2016	Paramount Pictures	2 hr 2 min	PG-13	185000000
Alvin and the Chipmunks: Chipwrecked	2011	Twentieth Century Fox	1 hr 27 min	G	75000000
Wanted	2008	Universal Pictures	1 hr 50 min	R	75000000
The Flintstones	1994	Universal Pictures	1 hr 31 min	PG	46000000
A Quiet Place	2018	Paramount Pictures	1 hr 30 min	PG-13	17000000
Enchanted	2007	Walt Disney Studios Motion Pictures	1 hr 47 min	PG	85000000
Over the Hedge	2006	DreamWorks	1 hr 23 min	PG	0
300: Rise of an Empire	2014	Warner Bros.	1 hr 42 min	R	110000000
Batman Forever	1995	Warner Bros.	2 hr 1 min	PG-13	100000000
Prince of Persia: The Sands of Time	2009	Walt Disney Studios Motion Pictures	1 hr 56 min	PG-13	200000000
The Curious Case of Benjamin Button	2008	Paramount Pictures	2 hr 46 min	PG-13	150000000
Journey 2: The Mysterious Island	2012	Warner Bros.	1 hr 34 min	PG	79000000
The Rock	1996	Walt Disney Studios Motion Pictures	2 hr 16 min	R	75000000
The Great Wall	2016	Universal Pictures	1 hr 43 min	PG-13	150000000
Now You See Me 2	2016	Lionsgate	2 hr 9 min	PG-13	0
Never Say Die	2017	Unknown	1 hr 40 min	Not Rated	0
Bridget Jones's Diary	2001	Miramax	1 hr 37 min	R	25000000
Fantastic Four	2005	Twentieth Century Fox	1 hr 46 min	PG-13	100000000
Indiana Jones and the Temple of Doom	1984	Paramount Pictures	1 hr 58 min	Not Rated	28000000
Tomorrow Never Dies	1997	Metro-Goldwyn-Mayer (MGM)	1 hr 59 min	PG-13	0
Back to the Future Part II	1989	Universal Pictures	1 hr 48 min	Not Rated	40000000
The Good Dinosaur	2015	Walt Disney Studios Motion Pictures	1 hr 33 min	PG	0
Free Guy	2021	20th Century Studios	1 hr 55 min	PG-13	0
22 Jump Street	2014	Sony Pictures Entertainment (SPE)	1 hr 52 min	R	50000000
Meet the Parents	2000	Universal Pictures	1 hr 48 min	PG-13	55000000
Who Framed Roger Rabbit	1988	Walt Disney Studios Motion Pictures	1 hr 44 min	Not Rated	70000000
Black Swan	2010		1 hr 48 min	R	13000000
The Perfect Storm	2000	Warner Bros.	2 hr 10 min	PG-13	140000000
John Wick: Chapter 3 - Parabellum	2019	Lionsgate	2 hr 10 min	R	75000000
Crocodile Dundee	1986	Paramount Pictures	1 hr 37 min	Not Rated	0
Crazy Alien	2019	Unknown	1 hr 56 min	Not Rated	0
Se7en	1995	New Line Cinema	2 hr 7 min	R	33000000
The Devil Wears Prada	2006	Twentieth Century Fox	1 hr 49 min	PG-13	35000000
Taken 3	2015	Twentieth Century Fox	1 hr 48 min	PG-13	48000000
The Hunchback of Notre Dame	1996	Walt Disney Studios Motion Pictures	1 hr 31 min	Not Rated	100000000
A Christmas Carol	2009	Walt Disney Studios Motion Pictures	1 hr 36 min	PG	200000000
The SpongeBob Movie: Sponge Out of Water	2015	Paramount Pictures	1 hr 32 min	PG	74000000
Schindler's List	1993	Universal Pictures	3 hr 15 min	R	22000000
Megamind	2010	DreamWorks	1 hr 35 min	PG	130000000
The Conjuring 2	2016	Warner Bros.	2 hr 14 min	R	40000000
Green Book	2018	Universal Pictures	2 hr 10 min	PG-13	23000000
Lethal Weapon 3	1992	Warner Bros.	1 hr 58 min	R	35000000
Robin Hood	2010	Universal Pictures	2 hr 20 min	PG-13	200000000
Inglourious Basterds	2009	The Weinstein Company	2 hr 33 min	R	70000000
101 Dalmatians	1996	Walt Disney Studios Motion Pictures	1 hr 43 min	Not Rated	0
The Conjuring	2013	Warner Bros.	1 hr 52 min	R	20000000
Fatal Attraction	1987	Paramount Pictures	1 hr 59 min	Not Rated	0
Sonic the Hedgehog	2020	Paramount Pictures	1 hr 39 min	PG	85000000
The Last Airbender	2010	Paramount Pictures	1 hr 43 min	PG	150000000
The Proposal	2009	Walt Disney Studios Motion Pictures	1 hr 48 min	PG-13	40000000
The Polar Express	2004	Warner Bros.	1 hr 40 min	Not Rated	165000000
A Beautiful Mind	2001	Universal Pictures	2 hr 15 min	PG-13	58000000
Beverly Hills Cop	1984	Paramount Pictures	1 hr 45 min	Not Rated	0
Air Force One	1997	Sony Pictures Entertainment (SPE)	2 hr 4 min	R	85000000
Wonder	2017	Lionsgate	1 hr 53 min	PG	0
The Expendables 2	2012	Lionsgate	1 hr 43 min	R	100000000
Chicken Little	2005	Walt Disney Studios Motion Pictures	1 hr 21 min	G	150000000
As Good as It Gets	1997	Sony Pictures Entertainment (SPE)	2 hr 19 min	PG-13	50000000
Elemental	2023	Walt Disney Studios Motion Pictures	1 hr 41 min	PG	0
Knives Out	2019	Lionsgate	2 hr 10 min	PG-13	40000000
Maze Runner: The Scorch Trials	2015	Twentieth Century Fox	2 hr 11 min	PG-13	61000000
Resident Evil: The Final Chapter	2016	Screen Gems	1 hr 47 min	R	40000000
The Lego Batman Movie	2017	Warner Bros.	1 hr 44 min	PG	80000000
Austin Powers: The Spy Who Shagged Me	1999	New Line Cinema	1 hr 35 min	PG-13	33000000
Ocean's Thirteen	2007	Warner Bros.	2 hr 2 min	PG-13	0
Little Fockers	2010	Universal Pictures	1 hr 38 min	PG-13	100000000
Bolt	2008	Walt Disney Studios Motion Pictures	1 hr 36 min	PG	150000000
Ransom	1996	Walt Disney Studios Motion Pictures	2 hr 1 min	R	0
Runaway Bride	1999	Paramount Pictures	1 hr 56 min	PG	70000000
The Blind Side	2009	Warner Bros.	2 hr 9 min	PG-13	29000000
The Ex-File 3: Return of the Exes	2017	China Lion Film Distribution	2 hr	Not Rated	0
The Fault in Our Stars	2014	Twentieth Century Fox	2 hr 6 min	PG-13	12000000
The Pursuit of Happyness	2006	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG-13	55000000
Rise of the Guardians	2012	DreamWorks	1 hr 37 min	PG	145000000
Close Encounters of the Third Kind	1977	Columbia Pictures	2 hr 18 min	Not Rated	20000000
Chicago	2002	Miramax	1 hr 53 min	PG-13	45000000
Annabelle: Creation	2017	Warner Bros.	1 hr 49 min	R	15000000
Bridesmaids	2011	Universal Pictures	2 hr 5 min	R	32500000
Skyscraper	2018	Universal Pictures	1 hr 42 min	PG-13	125000000
A Good Day to Die Hard	2013	Twentieth Century Fox	1 hr 38 min	R	92000000
Mulan	1998	Walt Disney Studios Motion Pictures	1 hr 27 min	Not Rated	0
Dangal	2016	UTV Motion Pictures	2 hr 41 min	Not Rated	0
Indiana Jones and the Dial of Destiny	2023	Walt Disney Studios Motion Pictures	2 hr 34 min	PG-13	0
Passengers	2016	Sony Pictures Entertainment (SPE)	1 hr 56 min	PG-13	110000000
Battleship	2012	Universal Pictures	2 hr 11 min	PG-13	209000000
Liar Liar	1997	Universal Pictures	1 hr 26 min	PG-13	0
G.I. Joe: The Rise of Cobra	2009	Paramount Pictures	1 hr 58 min	PG-13	175000000
Wrath of the Titans	2012	Warner Bros.	1 hr 39 min	PG-13	150000000
Fantastic Four: Rise of the Silver Surfer	2007	Twentieth Century Fox	1 hr 32 min	PG	130000000
Hook	1991	TriStar Pictures	2 hr 22 min	Not Rated	70000000
Superman	1978	Warner Bros.	2 hr 23 min	PG	55000000
Rocky IV	1985	United Artists	1 hr 31 min	PG	0
Rambo: First Blood Part II	1985	TriStar Pictures	1 hr 36 min	Not Rated	0
Resident Evil: Afterlife	2010	Screen Gems	1 hr 36 min	R	60000000
Van Helsing	2004	Universal Pictures	2 hr 11 min	PG-13	160000000
Stuart Little	1999	Sony Pictures Entertainment (SPE)	1 hr 24 min	PG	133000000
Beverly Hills Cop II	1987	Paramount Pictures	1 hr 40 min	Not Rated	0
Alice Through the Looking Glass	2016	Walt Disney Studios Motion Pictures	1 hr 53 min	PG	170000000
My Best Friend's Wedding	1997	Sony Pictures Entertainment (SPE)	1 hr 45 min	PG-13	38000000
Real Steel	2011	Walt Disney Studios Motion Pictures	2 hr 7 min	PG-13	0
Horton Hears a Who!	2008	Twentieth Century Fox	1 hr 26 min	Not Rated	85000000
Ocean's Eight	2018	Warner Bros.	1 hr 50 min	PG-13	70000000
A Quiet Place Part II	2021	Paramount Pictures	1 hr 37 min	PG-13	0
The Divergent Series: Insurgent	2015	Lionsgate	1 hr 59 min	PG-13	110000000
Look Who's Talking	1989	TriStar Pictures	1 hr 33 min	Not Rated	0
Austin Powers in Goldmember	2002	New Line Cinema	1 hr 34 min	PG-13	63000000
Ghostbusters	1984	Columbia Pictures	1 hr 45 min	Not Rated	30000000
Miss Peregrine's Home for Peculiar Children	2016	Twentieth Century Fox	2 hr 7 min	PG-13	110000000
X-Men	2000	Twentieth Century Fox	1 hr 44 min	PG-13	75000000
Ferdinand	2017	Twentieth Century Fox	1 hr 48 min	PG	111000000
Shutter Island	2010	Paramount Pictures	2 hr 18 min	R	80000000
Doctor Dolittle	1998	Twentieth Century Fox	1 hr 25 min	PG-13	0
Bee Movie	2007	DreamWorks	1 hr 31 min	PG	150000000
Salt	2010	Sony Pictures Entertainment (SPE)	1 hr 40 min	PG-13	110000000
G-Force	2009	Walt Disney Studios Motion Pictures	1 hr 28 min	PG	150000000
The Departed	2006	Warner Bros.	2 hr 31 min	R	90000000
What Lies Beneath	2000	DreamWorks Distribution	2 hr 10 min	PG-13	100000000
Pacific Rim: Uprising	2018	Universal Pictures	1 hr 51 min	PG-13	150000000
Too Cool to Kill	2022	Well Go USA Entertainment	1 hr 49 min	Not Rated	0
The Bourne Supremacy	2004	Universal Pictures	1 hr 48 min	PG-13	75000000
Sex and the City 2	2010	Warner Bros.	2 hr 26 min	R	100000000
Shakespeare in Love	1998	Miramax	2 hr 3 min	R	25000000
Divergent	2014	Lionsgate	2 hr 19 min	PG-13	85000000
Coming to America	1988	Paramount Pictures	1 hr 57 min	Not Rated	0
Elvis	2022	Warner Bros.	2 hr 39 min	PG-13	0
Wedding Crashers	2005	New Line Cinema	1 hr 59 min	R	40000000
American Hustle	2013	Sony Pictures Entertainment (SPE)	2 hr 18 min	R	40000000
Maze Runner: The Death Cure	2018	Twentieth Century Fox	2 hr 23 min	PG-13	62000000
Casper	1995	Universal Pictures	1 hr 40 min	PG	0
American Pie 2	2001	Universal Pictures	1 hr 48 min	R	30000000
Pitch Perfect 2	2015	Universal Pictures	1 hr 55 min	PG-13	29000000
The Green Mile	1999	Warner Bros.	3 hr 9 min	R	60000000
Oblivion	2013	Universal Pictures	2 hr 4 min	PG-13	120000000
Elysium	2013	TriStar Pictures	1 hr 49 min	R	115000000
Lethal Weapon 4	1998	Warner Bros.	2 hr 7 min	R	140000000
John Carter	2012	Walt Disney Studios Motion Pictures	2 hr 12 min	PG-13	250000000
Turbo	2013	Twentieth Century Fox	1 hr 36 min	PG	135000000
Paddington	2014		1 hr 35 min	PG	55000000
The Tourist	2010	Sony Pictures Entertainment (SPE)	1 hr 43 min	PG-13	100000000
Split	2017	Universal Pictures	1 hr 57 min	PG-13	9000000
Scary Movie	2000	Miramax	1 hr 28 min	R	19000000
xXx	2002	Revolution Studios	2 hr 4 min	PG-13	70000000
The Bourne Legacy	2012	Universal Pictures	2 hr 15 min	PG-13	125000000
Mr. Peabody & Sherman	2014	Twentieth Century Fox	1 hr 32 min	PG	145000000
Scooby-Doo	2002	Warner Bros.	1 hr 29 min	PG	84000000
Lincoln	2012	Walt Disney Studios Motion Pictures	2 hr 30 min	PG-13	65000000
Creed III	2023	United Artists Releasing	1 hr 56 min	PG-13	0
Lara Croft: Tomb Raider	2001	Paramount Pictures	1 hr 40 min	PG-13	115000000
Tomb Raider	2018	Warner Bros.	1 hr 59 min	PG-13	94000000
The Expendables	2010	Lionsgate	1 hr 43 min	R	80000000
Cloudy with a Chance of Meatballs 2	2013	Sony Pictures Entertainment (SPE)	1 hr 35 min	PG	78000000
The Nutty Professor	1996	Universal Pictures	1 hr 35 min	PG-13	54000000
Jerry Maguire	1996	Sony Pictures Entertainment (SPE)	2 hr 19 min	R	50000000
Bad Boys II	2003	Sony Pictures Entertainment (SPE)	2 hr 27 min	R	130000000
Lilo & Stitch	2002	Walt Disney Studios Motion Pictures	1 hr 25 min	PG	80000000
The Silence of the Lambs	1991	Orion Pictures	1 hr 58 min	Not Rated	19000000
Grown Ups	2010	Sony Pictures Entertainment (SPE)	1 hr 42 min	PG-13	80000000
Neighbors	2014	Universal Pictures	1 hr 37 min	R	18000000
The Firm	1993	Paramount Pictures	2 hr 34 min	R	0
We're the Millers	2012	Warner Bros.	1 hr 50 min	R	37000000
Gran Torino	2008	Warner Bros.	1 hr 56 min	R	33000000
10,000 BC	2008	Warner Bros.	1 hr 49 min	PG-13	105000000
American Gangster	2007	Universal Pictures	2 hr 37 min	R	100000000
Epic	2013	Twentieth Century Fox	1 hr 42 min	PG	100000000
Exodus: Gods and Kings	2014	Twentieth Century Fox	2 hr 30 min	PG-13	140000000
Blade Runner 2049	2017	Warner Bros.	2 hr 44 min	R	150000000
Bambi	1942	RKO Radio Pictures	1 hr 9 min	G	0
The Flash	2023	Warner Bros.	2 hr 24 min	PG-13	0
The Princess and the Frog	2009	Walt Disney Studios Motion Pictures	1 hr 37 min	Not Rated	105000000
Batman Returns	1992	Warner Bros.	2 hr 6 min	PG-13	80000000
Indecent Proposal	1993	Paramount Pictures	1 hr 57 min	R	0
Something's Gotta Give	2003	Sony Pictures Entertainment (SPE)	2 hr 8 min	PG-13	80000000
Bridget Jones: The Edge of Reason	2004	Universal Pictures	1 hr 48 min	R	40000000
The Incredible Hulk	2008	Universal Pictures	1 hr 52 min	PG-13	150000000
Waterworld	1995	Universal Pictures	2 hr 15 min	PG-13	175000000
The Truman Show	1998	Paramount Pictures	1 hr 43 min	PG	0
Charlie's Angels	2000	Sony Pictures Entertainment (SPE)	1 hr 38 min	PG-13	93000000
The Fifth Element	1997	Sony Pictures Entertainment (SPE)	2 hr 6 min	PG-13	0
Jumanji	1995	Sony Pictures Entertainment (SPE)	1 hr 44 min	PG	65000000
Parasite	2019	Neon	2 hr 12 min	R	11400000
Borat	2006	Twentieth Century Fox	1 hr 24 min	R	18000000
Robots	2005	Twentieth Century Fox	1 hr 31 min	PG	75000000
Knight and Day	2008	Unknown	1 hr 49 min	PG-13	117000000
Total Recall	1990	Sony Pictures Entertainment (SPE)	1 hr 53 min	Not Rated	65000000
This Is It	2009	Sony Pictures Entertainment (SPE)	1 hr 51 min	PG	0
Terminator: Dark Fate	2019	Paramount Pictures	2 hr 8 min	R	185000000
The Lone Ranger	2013	Walt Disney Studios Motion Pictures	2 hr 30 min	PG-13	215000000
Super 8	2011	Paramount Pictures	1 hr 52 min	PG-13	50000000
Halloween	2018	Universal Pictures	1 hr 46 min	R	10000000
Mojin: The Lost Legend	2015	Well Go USA Entertainment	2 hr 7 min	Not Rated	37000000
Charlie's Angels: Full Throttle	2003	Sony Pictures Entertainment (SPE)	1 hr 46 min	PG-13	120000000
Rush Hour 3	2007	New Line Cinema	1 hr 31 min	PG-13	140000000
The Full Monty	1997		1 hr 31 min	R	3500000
Kung Fu Yoga	2017	Well Go USA Entertainment	1 hr 47 min	Not Rated	65000000
Annabelle	2014	Warner Bros.	1 hr 39 min	R	6500000
Encanto	2021	Walt Disney Studios Motion Pictures	1 hr 42 min	PG	0
The Village	2003	Walt Disney Studios Motion Pictures	1 hr 48 min	PG-13	60000000
Lost in Hong Kong	2015	Well Go USA Entertainment	1 hr 54 min	Not Rated	0
Erin Brockovich	2000	Universal Pictures	2 hr 11 min	R	52000000
Us	2019	Universal Pictures	1 hr 56 min	R	20000000
Pegasus	2019	Unknown	1 hr 38 min	Not Rated	0
Get Out	2016	Unknown	1 hr 44 min	R	4500000
Marley & Me	2008	Twentieth Century Fox	1 hr 51 min	PG	0
Cliffhanger	1993	TriStar Pictures	1 hr 53 min	R	70000000
Baahubali 2: The Conclusion	2017	Great India Films	2 hr 47 min	Not Rated	0
Babe	1995	Universal Pictures	1 hr 31 min	Not Rated	0
Men in Black: International	2019	Sony Pictures Entertainment (SPE)	1 hr 54 min	PG-13	110000000
Wild Hogs	2007	Walt Disney Studios Motion Pictures	1 hr 40 min	PG-13	0
High School Musical 3: Senior Year	2008	Walt Disney Studios Motion Pictures	1 hr 52 min	G	11000000
Hercules	1997	Walt Disney Studios Motion Pictures	1 hr 33 min	Not Rated	85000000
X-Men: Dark Phoenix	2019	Twentieth Century Fox	1 hr 53 min	PG-13	200000000
True Grit	2010	Paramount Pictures	1 hr 50 min	PG-13	38000000
Dolittle	2020	Universal Pictures	1 hr 41 min	PG	175000000
Bean	1997	Gramercy Pictures (I)	1 hr 29 min	PG-13	18000000
Enemy of the State	1998	Walt Disney Studios Motion Pictures	2 hr 12 min	R	90000000
You've Got Mail	1998	Warner Bros.	1 hr 59 min	PG	65000000
Eragon	2006	Twentieth Century Fox	1 hr 44 min	PG	100000000
Brother Bear	2003	Walt Disney Studios Motion Pictures	1 hr 25 min	Not Rated	0
The Godfather	1972	Paramount Pictures	2 hr 55 min	Not Rated	6000000
The Mask of Zorro	1998	Sony Pictures Entertainment (SPE)	2 hr 16 min	PG-13	95000000
The Bad Guys	2022	Universal Pictures	1 hr 40 min	PG	0
The Ring	2002	DreamWorks Distribution	1 hr 55 min	PG-13	48000000
The Blair Witch Project	1999	Artisan Entertainment	1 hr 21 min	R	60000
Unbreakable	2000	Walt Disney Studios Motion Pictures	1 hr 46 min	PG-13	75000000
Love Actually	2003	Universal Pictures	2 hr 15 min	R	40000000
Journey to the West: The Demons Strike Back	2017	Sony Pictures Entertainment (SPE)	1 hr 49 min	PG-13	0
Dumb and Dumber	1994	New Line Cinema	1 hr 47 min	Not Rated	17000000
Glass	2019	Universal Pictures	2 hr 9 min	PG-13	20000000
Grown Ups 2	2013	Sony Pictures Entertainment (SPE)	1 hr 41 min	PG-13	80000000
The Peanuts Movie	2015	Twentieth Century Fox	1 hr 28 min	G	99000000
2 Fast 2 Furious	2003	Universal Pictures	1 hr 47 min	PG-13	76000000
Rango	2011	Paramount Pictures	1 hr 47 min	PG	135000000
Four Weddings and a Funeral	1994	Gramercy Pictures (I)	1 hr 57 min	R	4400000
Face/Off	1997	Paramount Pictures	2 hr 18 min	R	80000000
Teenage Mutant Ninja Turtles: Out of the Shadows	2016	Paramount Pictures	1 hr 52 min	PG-13	135000000
Dark Shadows	2012	Warner Bros.	1 hr 53 min	PG-13	150000000
Hulk	2003	Universal Pictures	2 hr 18 min	PG-13	137000000
The Bravest	2019	Sony Pictures Entertainment (SPE)	1 hr 58 min	PG-13	0
Welcome to the Sticks	2008		1 hr 46 min	Not Rated	0
Back to the Future Part III	1990	Universal Pictures	1 hr 58 min	Not Rated	40000000
Pixels	2015	Sony Pictures Entertainment (SPE)	1 hr 45 min	PG-13	88000000
Hercules	2014	Paramount Pictures	1 hr 38 min	PG-13	100000000
Rush Hour	1998	New Line Cinema	1 hr 38 min	PG-13	33000000
Journey to the Center of the Earth	2008	Warner Bros.	1 hr 33 min	PG	60000000
After Earth	2013	Sony Pictures Entertainment (SPE)	1 hr 40 min	PG-13	130000000
A Few Good Men	1992	Columbia Pictures	2 hr 18 min	R	41000000
Cloudy with a Chance of Meatballs	2009	Sony Pictures Entertainment (SPE)	1 hr 30 min	PG	100000000
8 Mile	2002	Universal Pictures	1 hr 50 min	R	41000000
Daddy's Home	2015	Paramount Pictures	1 hr 36 min	PG-13	0
RoboCop	2014	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG-13	100000000
Eraser	1996	Warner Bros.	1 hr 55 min	R	100000000
Alien: Covenant	2017	Twentieth Century Fox	2 hr 2 min	R	97000000
Sully	2016	Warner Bros.	1 hr 36 min	PG-13	60000000
Assassin's Creed	2016	Twentieth Century Fox	1 hr 55 min	PG-13	125000000
Click	2006	Revolution Studios	1 hr 47 min	PG-13	82500000
Legend of Deification	2020	Well Go USA Entertainment	1 hr 50 min	Not Rated	0
Planes	2013	Walt Disney Studios Motion Pictures	1 hr 31 min	PG	50000000
Resident Evil: Retribution	2012	Screen Gems	1 hr 35 min	R	65000000
Die Hard 2	1990	Twentieth Century Fox	2 hr 4 min	Not Rated	70000000
Crocodile Dundee II	1988	Paramount Pictures	1 hr 48 min	Not Rated	0
Bullet Train	2022	Sony Pictures Entertainment (SPE)	2 hr 7 min	R	0
Crazy Rich Asians	2018	Warner Bros.	2 hr	PG-13	30000000
Batman & Robin	1997	Warner Bros.	2 hr 5 min	PG-13	125000000
Howl's Moving Castle	2004	Walt Disney Studios Motion Pictures	1 hr 59 min	PG	0
Gulliver's Travels	2010	Twentieth Century Fox	1 hr 25 min	PG	112000000
Gone in 60 Seconds	2000	Walt Disney Studios Motion Pictures	1 hr 58 min	PG-13	90000000
Saturday Night Fever	1977	Paramount Pictures	1 hr 58 min	R	0
Silver Linings Playbook	2012	The Weinstein Company	2 hr 2 min	R	21000000
Hidden Figures	2016	Twentieth Century Fox	2 hr 7 min	PG	25000000
A.I. Artificial Intelligence	2001	Warner Bros.	2 hr 26 min	PG-13	100000000
Dead Poets Society	1989	Walt Disney Studios Motion Pictures	2 hr 8 min	Not Rated	0
Spy	2015	Twentieth Century Fox	2 hr	R	65000000
American Pie	1999	Universal Pictures	1 hr 35 min	R	11000000
American Reunion	2012	Universal Pictures	1 hr 53 min	R	50000000
Big Daddy	1999	Sony Pictures Entertainment (SPE)	1 hr 33 min	PG-13	34200000
Alvin and the Chipmunks: The Road Chip	2015	Twentieth Century Fox	1 hr 32 min	PG	0
Mission: Impossible - Dead Reckoning Part One	2023	Paramount Pictures	2 hr 43 min	PG-13	0
The Imitation Game	2014	The Weinstein Company	1 hr 54 min	PG-13	0
Cruella	2021	Walt Disney Studios Motion Pictures	2 hr 14 min	PG-13	0
The Day the Earth Stood Still	2008	Twentieth Century Fox	1 hr 44 min	PG-13	80000000
American Wedding	2003	Universal Pictures	1 hr 36 min	R	55000000
The Girl with the Dragon Tattoo	2011	Sony Pictures Entertainment (SPE)	2 hr 38 min	R	90000000
Juno	2007		1 hr 36 min	PG-13	7500000
Argo	2012	Warner Bros.	2 hr	R	44500000
Mr. Bean's Holiday	2007	Universal Pictures	1 hr 30 min	G	0
The English Patient	1996	Miramax	2 hr 42 min	R	27000000
Sister Act	1992	Walt Disney Studios Motion Pictures	1 hr 40 min	PG	0
Annabelle Comes Home	2019	Warner Bros.	1 hr 46 min	R	30000000
Constantine	2005	Warner Bros.	2 hr 1 min	R	100000000
Get Smart	2008	Warner Bros.	1 hr 50 min	PG-13	80000000
Space Jam	1996	Warner Bros.	1 hr 28 min	PG	0
Life Is Beautiful	1998	Miramax	1 hr 56 min	PG-13	0
The Heat	2013	Twentieth Century Fox	1 hr 57 min	R	43000000
Ghostbusters	2016	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG-13	144000000
Ghost Rider	2007	Sony Pictures Entertainment (SPE)	1 hr 50 min	PG-13	110000000
Goodbye Mr. Loser	2015	China Lion Film Distribution	1 hr 44 min	Not Rated	0
Paddington 2	2017	Warner Bros.	1 hr 43 min	PG	0
Sleepless in Seattle	1993	TriStar Pictures	1 hr 45 min	PG	21000000
Lethal Weapon 2	1989	Warner Bros.	1 hr 54 min	R	0
The Green Hornet	2011	Sony Pictures Entertainment (SPE)	1 hr 59 min	PG-13	120000000
Out of Africa	1985	Universal Pictures	2 hr 41 min	Not Rated	0
Elf	2003	New Line Cinema	1 hr 37 min	PG	33000000
Youth	2017	China Lion Film Distribution	2 hr 15 min	Not Rated	0
Baby Driver	2017	TriStar Pictures	1 hr 53 min	R	34000000
Immortals	2011	Relativity Media	1 hr 50 min	R	75000000
Taken	2008	Twentieth Century Fox	1 hr 30 min	PG-13	25000000
Percy Jackson & the Olympians: The Lightning Thief	2010	Twentieth Century Fox	1 hr 58 min	PG	95000000
Lightyear	2022	Walt Disney Studios Motion Pictures	1 hr 45 min	PG	0
Hansel & Gretel: Witch Hunters	2013	Paramount Pictures	1 hr 28 min	R	50000000
Valerian and the City of a Thousand Planets	2017	STX Entertainment	2 hr 16 min	PG-13	177200000
Good Will Hunting	1997	Miramax	2 hr 6 min	R	0
Better Days	2019	Well Go USA Entertainment	2 hr 15 min	Not Rated	0
Ford v Ferrari	2019	Twentieth Century Fox	2 hr 32 min	PG-13	97600000
Jumper	2008	Twentieth Century Fox	1 hr 28 min	PG-13	85000000
The Social Network	2010	Sony Pictures Entertainment (SPE)	2 hr	PG-13	40000000
Chicken Run	2000	DreamWorks Distribution	1 hr 24 min	Not Rated	45000000
Con Air	1997	Walt Disney Studios Motion Pictures	1 hr 55 min	R	75000000
Interview with the Vampire: The Vampire Chronicles	1994	Warner Bros.	2 hr 3 min	R	60000000
Flightplan	2005	Walt Disney Studios Motion Pictures	1 hr 38 min	PG-13	0
Yes Man	2008	Warner Bros.	1 hr 44 min	PG-13	70000000
Non-Stop	2014	Universal Pictures	1 hr 46 min	PG-13	50000000
Honey, I Shrunk the Kids	1989	Walt Disney Studios Motion Pictures	1 hr 33 min	Not Rated	0
Fahrenheit 9/11	2004	Lionsgate	2 hr 2 min	R	6000000
Wild Wild West	1999	Warner Bros.	1 hr 46 min	PG-13	170000000
My Country, My Parents	2021	CMC Pictures	2 hr 37 min	Not Rated	0
Geostorm	2017	Warner Bros.	1 hr 49 min	PG-13	120000000
Presumed Innocent	1990	Warner Bros.	2 hr 7 min	Not Rated	0
Jungle Cruise	2021	Walt Disney Studios Motion Pictures	2 hr 7 min	PG-13	0
Scary Movie 3	2003	Dimension Films	1 hr 24 min	PG-13	48000000
Collateral	2004	DreamWorks Distribution	2 hr	R	65000000
Inferno	2016	Sony Pictures Entertainment (SPE)	2 hr 1 min	PG-13	75000000
Knocked Up	2007	Universal Pictures	2 hr 9 min	R	30000000
Green Lantern	2011	Warner Bros.	1 hr 54 min	PG-13	200000000
What Happens in Vegas	2008	Twentieth Century Fox	1 hr 39 min	PG-13	35000000
It's Complicated	2009	Universal Pictures	2 hr 1 min	R	85000000
The Terminal	2004	DreamWorks Distribution	2 hr 8 min	PG-13	60000000
Little Women	2019	Sony Pictures Entertainment (SPE)	2 hr 15 min	PG	40000000
Captain Phillips	2013	Sony Pictures Entertainment (SPE)	2 hr 14 min	PG-13	55000000
The Prince of Egypt	1998	DreamWorks Distribution	1 hr 39 min	PG	70000000
Jack Reacher	2012	Paramount Pictures	2 hr 10 min	PG-13	60000000
Kingdom of Heaven	2005	Twentieth Century Fox	2 hr 24 min	R	130000000
The Emoji Movie	2017	Sony Pictures Entertainment (SPE)	1 hr 26 min	PG	50000000
Smile	2022	Paramount Pictures	1 hr 55 min	R	0
Dracula Untold	2014	Universal Pictures	1 hr 32 min	PG-13	70000000
Central Intelligence	2016	Warner Bros.	1 hr 47 min	PG-13	50000000
Million Dollar Baby	2004	Warner Bros.	2 hr 12 min	PG-13	30000000
The Help	2011	Walt Disney Studios Motion Pictures	2 hr 26 min	PG-13	25000000
Twins	1988	Universal Pictures	1 hr 47 min	Not Rated	15000000
Valentine's Day	2010	Warner Bros.	2 hr 5 min	PG-13	52000000
Bad Teacher	2011	Sony Pictures Entertainment (SPE)	1 hr 32 min	R	20000000
A Little Red Flower	2020	Unknown	2 hr 2 min	Not Rated	0
The Croods: A New Age	2020	Universal Pictures	1 hr 35 min	PG	0
Clear and Present Danger	1994	Paramount Pictures	2 hr 21 min	PG-13	62000000
One Hundred and One Dalmatians	1961	Walt Disney Studios Motion Pictures	1 hr 19 min	Not Rated	0
Ted 2	2015	Universal Pictures	1 hr 55 min	R	68000000
Bram Stoker's Dracula	1992	Columbia Pictures	2 hr 8 min	R	40000000
Vertical Limit	2000	Sony Pictures Entertainment (SPE)	2 hr 4 min	PG-13	75000000
Ghostbusters II	1989	Columbia Pictures	1 hr 48 min	Not Rated	0
The Patriot	2000	Sony Pictures Entertainment (SPE)	2 hr 45 min	R	110000000
The Sorcerer's Apprentice	2010	Walt Disney Studios Motion Pictures	1 hr 49 min	PG	150000000
Just Go with It	2011	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG-13	80000000
The Expendables 3	2014	Lionsgate	2 hr 6 min	PG-13	0
Dirty Dancing	1987	Vestron Pictures	1 hr 40 min	Not Rated	6000000
Creed II	2018	Metro-Goldwyn-Mayer (MGM)	2 hr 10 min	PG-13	50000000
Smallfoot	2018	Warner Bros.	1 hr 36 min	PG	0
Public Enemies	2009	Universal Pictures	2 hr 20 min	R	100000000
The Bourne Identity	2002	Universal Pictures	1 hr 59 min	PG-13	60000000
Disclosure	1994	Warner Bros.	2 hr 8 min	R	55000000
Crouching Tiger, Hidden Dragon	2000	Sony Pictures Classics	2 hr	PG-13	17000000
Pulp Fiction	1994	Miramax	2 hr 34 min	R	8000000
The Aviator	2004	Miramax	2 hr 50 min	PG-13	110000000
Braveheart	1995	Paramount Pictures	2 hr 58 min	R	72000000
Into the Woods	2014	Walt Disney Studios Motion Pictures	2 hr 5 min	PG	50000000
Bedtime Stories	2008	Walt Disney Studios Motion Pictures	1 hr 39 min	PG	80000000
Miss Congeniality	2000	Warner Bros.	1 hr 49 min	PG-13	45000000
Entrapment	1999	Twentieth Century Fox	1 hr 53 min	PG-13	66000000
Ace Ventura: When Nature Calls	1995	Warner Bros.	1 hr 30 min	PG-13	0
End of Days	1999	Universal Pictures	2 hr 2 min	R	100000000
Bridget Jones's Baby	2016	Universal Pictures	2 hr 3 min	R	35000000
Fury	2014	Sony Pictures Entertainment (SPE)	2 hr 14 min	R	68000000
Battle Los Angeles	2011	Sony Pictures Entertainment (SPE)	1 hr 56 min	PG-13	70000000
Australia	2008	Twentieth Century Fox	2 hr 45 min	PG-13	130000000
Due Date	2010	Warner Bros.	1 hr 35 min	R	65000000
Master and Commander: The Far Side of the World	2003	Twentieth Century Fox	2 hr 18 min	PG-13	150000000
A Series of Unfortunate Events	2004	Paramount Pictures	1 hr 48 min	PG	140000000
The Little Mermaid	1989	Walt Disney Studios Motion Pictures	1 hr 23 min	Not Rated	0
Nice View	2022	Unknown	1 hr 46 min	Not Rated	0
District 9	2009	TriStar Pictures	1 hr 52 min	R	30000000
Moonraker	1979	Metro-Goldwyn-Mayer (MGM)	2 hr 6 min	Not Rated	0
The Others	2001	Miramax	1 hr 41 min	PG-13	17000000
Horrible Bosses	2011	Warner Bros.	1 hr 38 min	R	35000000
Us and Them	2018	Unknown	2 hr	Not Rated	0
Red Dragon	2002	Universal Pictures	2 hr 4 min	R	78000000
Tomorrowland	2015	Walt Disney Studios Motion Pictures	2 hr 10 min	PG	190000000
Me Before You	2016	Warner Bros.	1 hr 46 min	PG-13	20000000
Dungeons & Dragons: Honor Among Thieves	2023	Paramount Pictures	2 hr 14 min	PG-13	0
Safe House	2012	Universal Pictures	1 hr 55 min	R	85000000
S.W.A.T.	2003	Sony Pictures Entertainment (SPE)	1 hr 57 min	PG-13	80000000
DC League of Super-Pets	2022	Warner Bros.	1 hr 45 min	PG	0
The Fast and the Furious	2001	Universal Pictures	1 hr 46 min	PG-13	38000000
Traffic	2000	USA Films	2 hr 27 min	R	0
Paranormal Activity 3	2011	Paramount Pictures	1 hr 23 min	R	5000000
Philadelphia	1993	TriStar Pictures	2 hr 5 min	PG-13	26000000
The Conjuring: The Devil Made Me Do It	2021	Warner Bros.	1 hr 52 min	R	0
Sleepy Hollow	1999	Paramount Pictures	1 hr 45 min	R	100000000
The Holiday	2006	Sony Pictures Entertainment (SPE)	2 hr 16 min	PG-13	85000000
The Jungle Book	1967	Walt Disney Studios Motion Pictures	1 hr 18 min	G	0
Raging Fire	2021	Well Go USA Entertainment	2 hr 6 min	Not Rated	0
London Has Fallen	2016	Focus Features	1 hr 39 min	R	60000000
The Break-Up	2006	Universal Pictures	1 hr 46 min	PG-13	52000000
Journey to the West	2013	Magnolia Pictures	1 hr 50 min	PG-13	0
The Ugly Truth	2009	Sony Pictures Entertainment (SPE)	1 hr 36 min	R	38000000
JFK	1991	Warner Bros.	3 hr 9 min	R	0
Birds of Prey	2020	Warner Bros.	1 hr 49 min	R	84500000
White House Down	2013	Sony Pictures Entertainment (SPE)	2 hr 11 min	PG-13	150000000
A Dog's Purpose	2017	Universal Pictures	1 hr 40 min	PG	22000000
Ponyo	2008	Walt Disney Studios Motion Pictures	1 hr 41 min	Not Rated	0
Fun with Dick and Jane	2005	Sony Pictures Entertainment (SPE)	1 hr 30 min	PG-13	100000000
Eat Pray Love	2010	Sony Pictures Entertainment (SPE)	2 hr 13 min	PG-13	60000000
The Addams Family	2019	United Artists Releasing	1 hr 26 min	PG	24000000
Ghostbusters: Afterlife	2021	Sony Pictures Entertainment (SPE)	2 hr 4 min	PG-13	0
You Don't Mess with the Zohan	2008	Sony Pictures Entertainment (SPE)	1 hr 53 min	PG-13	90000000
Hairspray	2007	New Line Cinema	1 hr 57 min	PG	0
King Arthur	2004	Walt Disney Studios Motion Pictures	2 hr 6 min	PG-13	120000000
Yogi Bear	2010	Warner Bros.	1 hr 21 min	PG	80000000
Everest	2015	Universal Pictures	2 hr 1 min	PG-13	55000000
Vanilla Sky	2001	Paramount Pictures	2 hr 16 min	R	68000000
Arrival	2016	Paramount Pictures	1 hr 56 min	PG-13	47000000
Need for Speed	2014	Walt Disney Studios Motion Pictures	2 hr 12 min	PG-13	66000000
Garfield	2004	Twentieth Century Fox	1 hr 20 min	PG	50000000
Patch Adams	1998	Universal Pictures	1 hr 55 min	PG-13	90000000
Teenage Mutant Ninja Turtles	1990	New Line Cinema	1 hr 33 min	Not Rated	13500000
Kindergarten Cop	1990	Universal Pictures	1 hr 51 min	Not Rated	15000000
Straight Outta Compton	2015	Universal Pictures	2 hr 27 min	R	28000000
21 Jump Street	2012	Sony Pictures Entertainment (SPE)	1 hr 49 min	R	42000000
Valkyrie	2008	United Artists	2 hr 1 min	PG-13	75000000
Open Season	2006	Sony Pictures Entertainment (SPE)	1 hr 26 min	PG	85000000
Cats & Dogs	2001	Warner Bros.	1 hr 27 min	PG	60000000
The Hunt for Red October	1990	Paramount Pictures	2 hr 15 min	Not Rated	30000000
Percy Jackson: Sea of Monsters	2013	Twentieth Century Fox	1 hr 46 min	PG	90000000
The Lego Movie 2: The Second Part	2019	Warner Bros.	1 hr 47 min	PG	99000000
Two Weeks Notice	2002	Warner Bros.	1 hr 41 min	PG-13	60000000
RED	2010	Summit Entertainment	1 hr 51 min	PG-13	58000000
Shock Wave 2	2020	Unknown	2 hr	Not Rated	0
City of Angels	1998	Warner Bros.	1 hr 54 min	PG-13	0
The Pacifier	2005	Walt Disney Studios Motion Pictures	1 hr 35 min	PG	56000000
50 First Dates	2004	Sony Pictures Entertainment (SPE)	1 hr 39 min	PG-13	75000000
Total Recall	2012	Sony Pictures Entertainment (SPE)	1 hr 58 min	PG-13	125000000
The Island	2018	Well Go USA Entertainment	2 hr 14 min	Not Rated	0
The Impossible	2012	Lionsgate	1 hr 54 min	PG-13	0
Lost in Thailand	2012		1 hr 45 min	Not Rated	0
Christopher Robin	2018	Walt Disney Studios Motion Pictures	1 hr 44 min	PG	75000000
Jack the Giant Slayer	2013	Warner Bros.	1 hr 54 min	PG-13	195000000
Smurfs: The Lost Village	2017	Sony Pictures Entertainment (SPE)	1 hr 30 min	PG	60000000
Chinese Doctors	2021	Unknown	2 hr 9 min	Not Rated	0
Spy Kids 3: Game Over	2003	Dimension Films	1 hr 24 min	PG	38000000
Panic Room	2002	Sony Pictures Entertainment (SPE)	1 hr 52 min	R	48000000
The Other Woman	2014	Twentieth Century Fox	1 hr 49 min	PG-13	40000000
Stargate	1994	Metro-Goldwyn-Mayer (MGM)	1 hr 56 min	PG-13	0
Beowulf	2007	Paramount Pictures	1 hr 55 min	PG-13	150000000
The Vow	2012	Screen Gems	1 hr 44 min	PG-13	30000000
Anger Management	2003	Revolution Studios	1 hr 46 min	PG-13	75000000
Tropic Thunder	2008	DreamWorks	1 hr 47 min	R	92000000
The Shape of Water	2017		2 hr 3 min	R	0
Rocketman	2019	Paramount Pictures	2 hr 1 min	R	40000000
The Pelican Brief	1993	Warner Bros.	2 hr 21 min	PG-13	0
The BFG	2016	Walt Disney Studios Motion Pictures	1 hr 57 min	PG	140000000
Downton Abbey	2019	Focus Features	2 hr 2 min	PG	13000000
The Intern	2015	Warner Bros.	2 hr 1 min	PG-13	35000000
Wallace & Gromit: The Curse of the Were-Rabbit	2005	DreamWorks Distribution	1 hr 25 min	Not Rated	30000000
Gnomeo & Juliet	2011	Walt Disney Studios Motion Pictures	1 hr 24 min	Not Rated	0
The Sum of All Fears	2002	Paramount Pictures	2 hr 4 min	PG-13	68000000
Gangs of New York	2002	Miramax	2 hr 47 min	R	100000000
The Post	2017	Twentieth Century Fox	1 hr 56 min	PG-13	50000000
The Monkey King 2	2016	China Lion Film Distribution	1 hr 59 min	Not Rated	0
Paranormal Activity	2009	Paramount Pictures	1 hr 26 min	R	15000
Weathering with You	2019	GKIDS	1 hr 52 min	PG-13	0
The Lost City	2022	Paramount Pictures	1 hr 52 min	PG-13	0
The Equalizer	2014	Sony Pictures Entertainment (SPE)	2 hr 12 min	R	55000000
Sheep Without a Shepherd	2019	Unknown	1 hr 52 min	Not Rated	0
The Addams Family	1991	Paramount Pictures	1 hr 39 min	Not Rated	30000000
The Longest Yard	2005	Paramount Pictures	1 hr 53 min	PG-13	82000000
The Santa Clause	1994	Walt Disney Studios Motion Pictures	1 hr 37 min	PG	22000000
Cheaper by the Dozen	2003	Twentieth Century Fox	1 hr 38 min	PG	40000000
The Equalizer 2	2018	Sony Pictures Entertainment (SPE)	2 hr 1 min	R	62000000
Abominable	2019	Universal Pictures	1 hr 37 min	PG	75000000
Hollow Man	2000	Sony Pictures Entertainment (SPE)	1 hr 52 min	R	95000000
Outbreak	1995	Warner Bros.	2 hr 7 min	R	0
The White Storm 2: Drug Lords	2019		1 hr 39 min	Not Rated	0
The X Files	1998	Twentieth Century Fox	2 hr 1 min	PG-13	0
Breakup Buddies	2014	China Lion Film Distribution	1 hr 56 min	Not Rated	0
Rambo III	1988	TriStar Pictures	1 hr 42 min	Not Rated	63000000
The Secret Life of Walter Mitty	2013	Twentieth Century Fox	1 hr 54 min	PG	90000000
Project Gutenberg	2018	Unknown	2 hr 10 min	Not Rated	0
Jaws 2	1978	Universal Pictures	1 hr 56 min	Not Rated	0
12 Years a Slave	2013		2 hr 14 min	R	20000000
Heat	1995	Warner Bros.	2 hr 50 min	R	0
Mr. Popper's Penguins	2011	Twentieth Century Fox	1 hr 34 min	PG	55000000
The Grudge	2004	Sony Pictures Entertainment (SPE)	1 hr 31 min	PG-13	10000000
One Piece Film: Red	2022	Crunchyroll	1 hr 55 min	PG-13	0
I Now Pronounce You Chuck & Larry	2007	Universal Pictures	1 hr 55 min	PG-13	85000000
The Horse Whisperer	1998	Walt Disney Studios Motion Pictures	2 hr 49 min	PG-13	0
Walk the Line	2005	Twentieth Century Fox	2 hr 16 min	PG-13	28000000
Jian Bing Man	2015	Unknown	1 hr 53 min	Not Rated	0
The Jungle Book 2	2003	Walt Disney Studios Motion Pictures	1 hr 12 min	Not Rated	20000000
The Final Destination	2009	Warner Bros.	1 hr 22 min	R	40000000
Atlantis: The Lost Empire	2001	Walt Disney Studios Motion Pictures	1 hr 35 min	PG	120000000
Inside Man	2006	Universal Pictures	2 hr 9 min	R	45000000
The Waterboy	1998	Walt Disney Studios Motion Pictures	1 hr 30 min	PG-13	23000000
Hugo	2011	Paramount Pictures	2 hr 6 min	PG	0
Pitch Perfect 3	2017	Universal Pictures	1 hr 33 min	PG-13	45000000
Watchmen	2009	Warner Bros.	2 hr 42 min	R	130000000
The Birdcage	1996	Metro-Goldwyn-Mayer (MGM)	1 hr 57 min	R	0
Moulin Rouge!	2001	Twentieth Century Fox	2 hr 7 min	PG-13	50000000
Snow White and the Seven Dwarfs	1937	Walt Disney Studios Motion Pictures	1 hr 23 min	Approved	1499000
Ode to My Father	2014	CJ Entertainment	2 hr 6 min	Not Rated	0
Hop	2011	Universal Pictures	1 hr 35 min	PG	63000000
Bad Moms	2016	STX Entertainment	1 hr 40 min	R	20000000
Jupiter Ascending	2015	Warner Bros.	2 hr 7 min	PG-13	176000000
Knowing	2007	Summit Entertainment	2 hr 1 min	PG-13	50000000
102 Dalmatians	2000	Walt Disney Studios Motion Pictures	1 hr 40 min	Not Rated	85000000
Storks	2016	Warner Bros.	1 hr 27 min	PG	70000000
Stand by Me Doraemon	2014	Unknown	1 hr 35 min	Not Rated	0
The Hitman's Bodyguard	2017	Lionsgate	1 hr 58 min	R	30000000
Paul Blart: Mall Cop	2009	Sony Pictures Entertainment (SPE)	1 hr 31 min	PG	26000000
Wayne's World	1992	Paramount Pictures	1 hr 34 min	PG-13	20000000
Maverick	1994	Warner Bros.	2 hr 7 min	PG	0
Mirror Mirror	2012	Relativity Media	1 hr 46 min	PG	85000000
The Man in the Iron Mask	1998	Metro-Goldwyn-Mayer (MGM)	2 hr 12 min	PG-13	0
Cape Fear	1991	Universal Pictures	2 hr 8 min	R	0
The Haunted Mansion	2003	Walt Disney Studios Motion Pictures	1 hr 39 min	PG	90000000
The Monkey King: Havoc in Heaven's Palace	2014	Unknown	1 hr 59 min	Not Rated	0
While You Were Sleeping	1995	Walt Disney Studios Motion Pictures	1 hr 43 min	PG	17000000
The Bridges of Madison County	1995	Warner Bros.	2 hr 15 min	PG-13	24000000
From Vegas to Macau III	2016	Unknown	1 hr 53 min	Not Rated	0
Poseidon	2006	Warner Bros.	1 hr 38 min	PG-13	160000000
The First Wives Club	1996	Paramount Pictures	1 hr 43 min	PG	0
Cliff Walkers	2021	CMC Pictures	2 hr	Not Rated	0
Scooby-Doo 2: Monsters Unleashed	2004	Warner Bros.	1 hr 33 min	PG	0
Hot Shots!	1991	Twentieth Century Fox	1 hr 24 min	Not Rated	26000000
Road to Perdition	2002	DreamWorks Distribution	1 hr 57 min	R	80000000
Kill Bill: Vol. 1	2003	Miramax	1 hr 51 min	R	30000000
The Scorpion King	2002	Universal Pictures	1 hr 32 min	PG-13	60000000
Sweet Home Alabama	2002	Walt Disney Studios Motion Pictures	1 hr 48 min	PG-13	30000000
Daddy's Home 2	2017	Paramount Pictures	1 hr 40 min	PG-13	69000000
Hacksaw Ridge	2016	Lionsgate	2 hr 19 min	R	40000000
Deja Vu	2006	Walt Disney Studios Motion Pictures	2 hr 6 min	PG-13	75000000
M3gan	2022	Universal Pictures	1 hr 42 min	PG-13	0
Dangerous Minds	1995	Walt Disney Studios Motion Pictures	1 hr 39 min	R	0
The Dictator	2012	Paramount Pictures	1 hr 23 min	R	65000000
The League of Extraordinary Gentlemen	2003	Twentieth Century Fox	1 hr 50 min	PG-13	78000000
Allegiant	2016	Lionsgate	2 hr	PG-13	0
Daredevil	2003	Twentieth Century Fox	1 hr 43 min	PG-13	78000000
City Slickers	1991	Columbia Pictures	1 hr 53 min	Not Rated	27000000
\.


--
-- Name: gross gross_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gross
    ADD CONSTRAINT gross_pkey PRIMARY KEY (title, year, distributor);


--
-- Name: movie_details movie_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_details
    ADD CONSTRAINT movie_details_pkey PRIMARY KEY (title, year, distributor);


--
-- Name: ix_box_office_gross_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_box_office_gross_index ON public.box_office_gross USING btree (index);


--
-- Name: gross gross_title_year_distributor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gross
    ADD CONSTRAINT gross_title_year_distributor_fkey FOREIGN KEY (title, year, distributor) REFERENCES public.movie_details(title, year, distributor);


--
-- PostgreSQL database dump complete
--

