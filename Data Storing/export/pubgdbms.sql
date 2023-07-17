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
-- Name: kda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kda (
    damage integer NOT NULL,
    assists integer,
    "rescueTimes" integer,
    "killNumByGrenade" integer,
    "Death" integer,
    headshot_num integer,
    kd real,
    in_damage integer,
    max_kill_distance integer,
    teams_id integer
);


ALTER TABLE public.kda OWNER TO postgres;

--
-- Name: roaming; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roaming (
    "MovingDistance" integer NOT NULL,
    drive_distance integer,
    march_distance integer,
    teams_id integer
);


ALTER TABLE public.roaming OWNER TO postgres;

--
-- Name: survive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survive (
    survival_time integer NOT NULL,
    health integer,
    heal integer,
    teams_id integer
);


ALTER TABLE public.survive OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    teams_id integer NOT NULL,
    pic character varying,
    name character varying,
    placement integer,
    kill_num integer,
    wwcd integer,
    nomp integer,
    total integer,
    rank_total integer
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: util; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.util (
    "useSmokeGrenadeNum" integer NOT NULL,
    "useFragGrenadeNum" integer,
    air_drop integer,
    teams_id integer
);


ALTER TABLE public.util OWNER TO postgres;

--
-- Data for Name: kda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kda (damage, assists, "rescueTimes", "killNumByGrenade", "Death", headshot_num, kd, in_damage, max_kill_distance, teams_id) FROM stdin;
33741	85	29	18	19	27	6.46	22737	406	1553
29452	91	37	15	20	17	5.25	23440	384	2232
23325	46	22	11	21	18	4.79	19232	404	1545
27543	73	26	17	22	16	4.5	22433	349	1558
21741	62	38	14	22	15	3.96	22482	335	62
22481	57	29	9	23	17	3.54	21369	349	2237
19296	59	36	9	23	24	4.04	21942	356	838
22271	52	46	13	24	14	3.54	22726	303	1554
24425	61	32	12	23	10	4	21903	346	1822
16720	56	28	7	23	11	3.5	19306	397	2229
18876	55	32	8	24	7	3.21	21938	352	2235
17420	29	27	2	24	14	2.83	19814	264	1773
17514	46	25	4	23	10	3	19377	345	442
13375	25	14	6	23	13	2.13	17617	329	443
15417	34	30	5	24	11	2.46	21413	369	439
12994	35	21	6	24	6	1.75	18798	403	2213
\.


--
-- Data for Name: roaming; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roaming ("MovingDistance", drive_distance, march_distance, teams_id) FROM stdin;
662798	465193	197605	1553
703061	478153	224908	2232
594522	406556	187966	1545
701445	524061	177384	1558
782585	611153	171432	62
563892	389513	174379	2237
599792	428346	171446	838
676342	487826	188516	1554
612031	440063	171968	1822
573729	371749	201980	2229
563268	393431	169837	2235
644076	488777	155299	1773
749303	606947	142356	442
655323	483935	171388	443
500017	331543	168474	439
509504	363612	145892	2213
\.


--
-- Data for Name: survive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survive (survival_time, health, heal, teams_id) FROM stdin;
111727	1244	14650	1553
117753	1054	12696	2232
107186	855	11677	1545
107438	422	14090	1558
105892	343	14163	62
104417	85	9830	2237
97004	309	11907	838
100960	0	16173	1554
95054	174	12842	1822
96220	285	9847	2229
96097	0	8958	2235
96328	0	14273	1773
94621	244	12669	442
96473	259	9592	443
86805	0	9514	439
78651	0	8134	2213
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (teams_id, pic, name, placement, kill_num, wwcd, nomp, total, rank_total) FROM stdin;
1553	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/F6975F83-B43E-404A-BE22-C1ADD5E86063%20-%20Zeyan%20Shafiq.png20230320152501-4740	Stalwart Esports	104	155	7	24	259	1
2232	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/4Merical%20Vibes.png20230320152204-2977	4Merical Vibes	83	126	4	24	209	2
1545	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/066850C3-4BC4-45EB-9345-EEE3FCD7DA1E%20-%20Sang%20Een.png20230320153517-5569	DRS GAMING	62	115	3	24	177	3
1558	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/T2KESPORTS%20-%20SOLO%20QUEEN.png20230320152229-2512	T2K Esports	47	108	2	24	155	4
62	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/7EF3AC6E-2300-427A-83B3-D1AEB7CD876E%20-%20Enhee%20Enhvvsh.jpeg20230320153355-1779	MABETEX eSPORTS	58	95	2	24	153	5
2237	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/AC07196B-8821-401C-9145-F95BFA0FEC7A%20-%20Prochyo%20YT.png20230320153420-1809	LEO ESPORTS	56	85	1	24	141	6
838	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/Agonxi8.png20230320154100-3932	Agonxi8	42	97	1	24	139	7
1554	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/Copy%20of%20NBesports%20-%20munna%20mun.png20230320153137-1885	NB eSports	53	85	0	24	138	8
1822	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/logo%20-%20IHC%20ESPORTS.png20230320153207-7421	IHC ESPORTS	37	96	1	24	133	9
2229	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/NEW-VP%20-%20accounts%20Virtus.pro.png20230320151736-3443	Highvoltage DC	30	84	1	24	114	10
2235	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/7AFBD9D6-1AA5-479F-836C-D6985D5CBE71%20-%20i8%20ACE.png20230320152642-5961	iLLUMiN8 CREW	37	77	0	24	114	11
1773	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/Quantum%20Rage.png20230320154428-2761	Quantum Rage	45	68	0	24	113	12
442	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/R3GICIDE.png20230320154834-9409	R3GICIDE	35	72	1	24	107	13
443	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/IMG_1716%20-%20new%20one12.PNG20220407202613-3075	Team TUF	46	51	1	24	97	14
439	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/Asset%205%408x-8%20-%20Taimoor%20Khan.png20220407202916-6218	Magnus Esports	11	59	0	24	70	15
2213	http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/SEVENTH%20ELEMENT.png20230320154926-1578	SEVENTH ELEMENT	22	42	0	24	64	16
\.


--
-- Data for Name: util; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.util ("useSmokeGrenadeNum", "useFragGrenadeNum", air_drop, teams_id) FROM stdin;
296	268	2	1553
250	221	9	2232
251	154	2	1545
247	170	3	1558
212	139	6	62
210	153	4	2237
189	128	2	838
174	160	2	1554
255	195	7	1822
196	109	3	2229
280	153	0	2235
236	111	3	1773
130	83	1	442
201	95	5	443
215	84	2	439
97	71	0	2213
\.


--
-- Name: team Team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (teams_id);


--
-- Name: kda kda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kda
    ADD CONSTRAINT kda_pkey PRIMARY KEY (damage);


--
-- Name: roaming roaming_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roaming
    ADD CONSTRAINT roaming_pkey PRIMARY KEY ("MovingDistance");


--
-- Name: survive survive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survive
    ADD CONSTRAINT survive_pkey PRIMARY KEY (survival_time);


--
-- Name: util util_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.util
    ADD CONSTRAINT util_pkey PRIMARY KEY ("useSmokeGrenadeNum");


--
-- Name: roaming teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roaming
    ADD CONSTRAINT teams_id FOREIGN KEY (teams_id) REFERENCES public.team(teams_id);


--
-- Name: util teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.util
    ADD CONSTRAINT teams_id FOREIGN KEY (teams_id) REFERENCES public.team(teams_id) NOT VALID;


--
-- Name: kda teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kda
    ADD CONSTRAINT teams_id FOREIGN KEY (teams_id) REFERENCES public.team(teams_id);


--
-- Name: survive teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survive
    ADD CONSTRAINT teams_id FOREIGN KEY (teams_id) REFERENCES public.team(teams_id);


--
-- PostgreSQL database dump complete
--

