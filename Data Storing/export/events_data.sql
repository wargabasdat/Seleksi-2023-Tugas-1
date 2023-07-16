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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id_category character varying(3) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id_event integer NOT NULL,
    name character varying(200) NOT NULL,
    price numeric(10,2) NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    duration integer,
    order_link character varying(150) NOT NULL,
    address character varying(200) NOT NULL,
    organizer character varying(200) NOT NULL,
    category character varying(3) NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    address character varying(200) NOT NULL,
    longitude numeric(11,8),
    latitude numeric(11,8)
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: organizer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizer (
    name character varying(100) NOT NULL,
    total_followers integer,
    organizer_page character varying(200) NOT NULL
);


ALTER TABLE public.organizer OWNER TO postgres;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id_category, name) FROM stdin;
B	business events
FD	food and drink events
H	health events
M	music events
ABA	auto boat and air events
CC	charity and causes events
C	community events
FE	family and education events
F	fashion events
FM	film and media events
Ho	hobbies events
HL	home and lifestyle events
A	arts events
G	government events
S	spirituality events
SA	school activities events
ST	science and tech events
Hl	holiday events
SF	sports and fitness events
TO	travel and outdoor events
O	other events
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id_event, name, price, date, start_time, duration, order_link, address, organizer, category) FROM stdin;
1	BLOCK71 Meet The VC	0.00	2023-07-17	14:30:00	72	https://www.eventbrite.com/e/block71-meet-the-vc-tickets-660935484827?aff=ebdssbdestsearch	Ariobimo Sentral, Lantai 8, South Jakarta., Setiabudi, Jakarta 12950	https://www.eventbrite.com/o/block71-jakarta-13293943731	B
2	Indonesia 4.0 Conference & Expo 2023	0.00	2023-08-23	09:00:00	24	https://www.eventbrite.com/e/indonesia-40-conference-expo-2023-tickets-654656464107?aff=ebdssbdestsearch	Jl. H. Benyamin Suaeb, Jakarta, Indonesia, Central Jakarta, Jakarta 14410	https://www.eventbrite.com/o/naganaya-in-collaboration-with-ministry-of-industry-and-wantrii-67064487093	B
3	Webinar INTERNET MARKETING REVOLUTION	0.00	2023-07-25	19:00:00	24	https://www.eventbrite.com/e/webinar-internet-marketing-revolution-tickets-351962598607?aff=ebdssbdestsearch	Jalan Daan Mogot No.63 Tj. Duren Utara, Kec. Grogol petamburan, Daerah Khusus Ibukota Jakarta 11470	https://www.eventbrite.com/o/kwet-liung-082260779360-23215568323	B
4	WEBINAR RAHASIA PIPA DUIT 24/7	0.00	2023-07-24	19:30:00	24	https://www.eventbrite.com/e/webinar-rahasia-pipa-duit-247-tickets-113067734638?aff=ebdssbdestsearch	Jalan Daan Mogot No.63 Tj. Duren Utara, Kec. Grogol petamburan, Daerah Khusus Ibukota Jakarta 11470	https://www.eventbrite.com/o/kwet-liung-082260779360-23215568323	B
5	INDONESIA DIGITAL TECHNOLOGY EXPO (INDITEX 2023)	0.00	2023-08-23	10:00:00	24	https://www.eventbrite.sg/e/indonesia-digital-technology-expo-inditex-2023-tickets-579719094417?aff=ebdssbdestsearch	Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Kabupaten Bekasi, Jawa Barat 17530	https://www.eventbrite.sg/o/tpmi-group-37828346723	B
6	Professional Course: Agile Corporate Leadership	0.00	2023-07-20	19:00:00	24	https://www.eventbrite.com/e/professional-course-agile-corporate-leadership-tickets-672966991387?aff=ebdssbdestsearch	No.7 Jalan Arteri Pondok Indah, Kec. Kby. Lama, Daerah Khusus Ibukota Jakarta 12240	https://www.eventbrite.com/o/hacktiv8-indonesia-61105252423	B
7	HALAL EXPO INDONESIA (HEI)	0.00	2023-10-25	10:00:00	96	https://www.eventbrite.com/e/halal-expo-indonesia-hei-tickets-528016089337?aff=ebdssbdestsearch	1 Jalan Gatot Subroto, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.com/o/pt-halal-expo-indonesia-59988449143	B
8	STARTALK “Shifting of The Startup Journey”	0.00	2023-07-21	15:00:00	24	https://www.eventbrite.com/e/startalk-shifting-of-the-startup-journey-tickets-675759533957?aff=ebdssbdestsearch	Jalan Gading Serpong Boulevard, Kec. Klp. Dua, Banten 15810	https://www.eventbrite.com/o/skystar-ventures-umn-59202475573	B
9	Indonesia Smart Industrial Expo (ISIEX 2023)	0.00	2023-08-23	10:00:00	24	https://www.eventbrite.sg/e/indonesia-smart-industrial-expo-isiex-2023-tickets-469772852247?aff=ebdssbdestsearch	Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Kabupaten Bekasi, Jawa Barat 17530	https://www.eventbrite.sg/o/tpmi-group-37828346723	B
10	Green Drinks #11 - Slow & Sustainable Fashion - Why, What, and How with LCA	0.00	2023-07-20	18:30:00	48	https://www.eventbrite.com/e/green-drinks-11-slow-sustainable-fashion-why-what-and-how-with-lca-tickets-676602445127?aff=ebdssbdestsearch	18 Jalan Haji R. Rasuna Said #Lt.11, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	https://www.eventbrite.com/o/green-drinks-jakarta-23204690709	B
11	CEO Speaks on Leadership : Fintopia (Dr. Jonathan Chang)	0.00	2023-07-20	18:30:00	48	https://www.eventbrite.com/e/ceo-speaks-on-leadership-fintopia-dr-jonathan-chang-tickets-675059700737?aff=ebdssbdestsearch	Jalan Hang Lekir I No. 6 Senayan, DKI Jakarta, 10270	https://www.eventbrite.com/o/binus-business-school-8532663450	B
12	OffChain Jakarta	0.00	2023-07-26	18:30:00	48	https://www.eventbrite.hk/e/offchain-jakarta-tickets-670559751267?aff=ebdssbdestsearch	8 Jalan Professor Doktor Satrio #14, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	https://www.eventbrite.hk/o/offchain-global-55459859373	B
13	CIKARANG INDUSTRIAL EXPO (CIE 2023)	0.00	2023-08-23	10:00:00	24	https://www.eventbrite.sg/e/cikarang-industrial-expo-cie-2023-tickets-585625430427?aff=ebdssbdestsearch	Cikarang, Kec. Cikarang Utara, Jawa Barat 17530	https://www.eventbrite.sg/o/tpmi-group-62432095763	B
14	The Art of Marketing Research : Crafting Winning Strategies	0.00	2023-07-26	15:00:00	72	https://www.eventbrite.com/e/the-art-of-marketing-research-crafting-winning-strategies-tickets-671386704707?aff=ebdssbdestsearch	108 Jalan Ir. H. Juanda, Kecamatan Coblong, Jawa Barat 40132	https://www.eventbrite.com/o/hidupforcompany-51117755933	B
15	BINUS BUSINESS SCHOOL Coffee Talk : Managing Supply Chain Risk & Disruption	0.00	2023-07-26	14:00:00	48	https://www.eventbrite.com/e/binus-business-school-coffee-talk-managing-supply-chain-risk-disruption-tickets-675087503897?aff=ebdssbdestsearch	Lingkar Boulevard Blok WA no 1, Kec. Bekasi Utara, Jawa Barat 17142	https://www.eventbrite.com/o/binus-business-school-8532663450	B
16	Indonesia Smart Property Expo (ISPEX 2023)	0.00	2023-08-23	10:00:00	24	https://www.eventbrite.sg/e/indonesia-smart-property-expo-ispex-2023-tickets-208280591857?aff=ebdssbdestsearch	Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Jawa Barat 17530	https://www.eventbrite.sg/o/tpmi-group-28741132401	B
17	Accelerating Asia Pitch Night: Bali Edition	0.00	2023-07-21	17:00:00	\N	https://www.eventbrite.com/e/accelerating-asia-pitch-night-bali-edition-tickets-673500346667?aff=ebdssbdestsearch	Bali, Bali, Bali 80361	https://www.eventbrite.com/o/accelerating-asia-20194512938	B
18	Accelerating Asia Investor Happy Hour: Bali Edition	0.00	2023-07-21	16:00:00	48	https://www.eventbrite.com/e/accelerating-asia-investor-happy-hour-bali-edition-tickets-675818630717?aff=ebdssbdestsearch	55-57 Jalan Tanah Barak, Kec. Kuta Utara, Bali 80351	https://www.eventbrite.com/o/accelerating-asia-20194512938	B
19	Indonesia Smart Travel Technology Expo (ISTEX 2023)	0.00	2023-08-23	10:00:00	24	https://www.eventbrite.sg/e/indonesia-smart-travel-technology-expo-istex-2023-tickets-208370671287?aff=ebdssbdestsearch	Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Jawa Barat 17530	https://www.eventbrite.sg/o/tpmi-group-28741132401	B
20	Delegation & Finding Talent for Entrepreneurs in Bali	0.00	2023-07-20	16:30:00	24	https://www.eventbrite.com/e/delegation-finding-talent-for-entrepreneurs-in-bali-tickets-672818998737?aff=ebdssbdestsearch	No. 6 Jalan Bumi Ayu, Sanur, Bali 80228	https://www.eventbrite.com/o/livit-hub-bali-18136240183	B
21	13th CS Connect Jakarta, Indonesia	0.00	2023-07-28	18:00:00	96	https://www.eventbrite.com/e/13th-cs-connect-jakarta-indonesia-tickets-677922914687?aff=ebdssbdestsearch	14 Jalan Cikajang #6, Kec. Kby. Baru, Daerah Khusus Ibukota Jakarta 12170	https://www.eventbrite.com/o/coinstorecom-56909466083	B
22	Free Career Empowerment & Meditation Class - Jakarta	0.00	2023-07-19	07:30:00	24	https://www.eventbrite.com/e/free-career-empowerment-meditation-class-jakarta-tickets-558392485957?aff=ebdssbdestsearch	See Confirmation Email for Zoom Link, Jakarta, Jakarta 10110	https://www.eventbrite.com/o/career-bliss-academy-34346634153	B
23	Pabrik Tas Yogyakarta	0.00	2023-08-01	19:00:00	72	https://www.eventbrite.com/e/pabrik-tas-yogyakarta-tickets-664326507467?aff=ebdssbdestsearch	Hayam Wuruk No.10, Yogyakarta, Yogyakarta 52111	https://www.eventbrite.com/o/karya-bintang-abadi-67625033643	B
24	Develop and Grow a Successful Virtual Reality Tech Startup Business Today!	105.33	2023-07-19	13:00:00	96	https://www.eventbrite.com/e/develop-and-grow-a-successful-virtual-reality-tech-startup-business-today-tickets-500563889067?aff=ebdssbdestsearch	Virtual Workshop, Jakarta, Jakarta	https://www.eventbrite.com/o/atechupcom-15646132597	B
25	Feeding the Mind: Workshop & Networking Event	0.00	2023-08-11	16:00:00	96	https://www.eventbrite.com/e/feeding-the-mind-workshop-networking-event-tickets-665013512317?aff=ebdssbdestsearch	No.2 Jalan Subak Canggu, Kec. Kuta Utara, Bali 80361	https://www.eventbrite.com/o/scholars-of-sustenance-sos-indonesia-67674960703	B
26	Jakarta Leadership: Delegation Skills for Busy Leaders - Why & How	19.00	2023-07-17	12:00:00	24	https://www.eventbrite.com/e/jakarta-leadership-delegation-skills-for-busy-leaders-why-how-tickets-449153639627?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
27	Jakarta Leadership: 7 Secrets for Your Success They Wont Teach You!	19.00	2023-07-17	07:00:00	720	https://www.eventbrite.com/e/jakarta-leadership-7-secrets-for-your-success-they-wont-teach-you-tickets-449135274697?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
28	MINDSHOP™️|Build Scalable Products using Information Architecture	57.00	2023-07-25	18:00:00	48	https://www.eventbrite.com/e/mindshoptmbuild-scalable-products-using-information-architecture-tickets-660805064737?aff=ebdssbdestsearch	., Jakarta, 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	B
29	BuPol Bali 2023– ICBELLP 22-23 July	165.64	2023-07-22	09:00:00	24	https://www.eventbrite.com/e/bupol-bali-2023-icbellp-22-23-july-tickets-524323053367?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/eurasia-research-16310610610	B
30	Jakarta Leadership Secret: How To Motivate & Inspire Your Employees?	19.00	2023-07-17	08:00:00	24	https://www.eventbrite.com/e/jakarta-leadership-secret-how-to-motivate-inspire-your-employees-tickets-449139005857?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
31	Konsultasi Google Ads - Surabaya	288.00	2023-07-17	09:00:00	168	https://www.eventbrite.com/e/konsultasi-google-ads-surabaya-tickets-654687837947?aff=ebdssbdestsearch	Zoom Video Conference, Surabaya, East Java	https://www.eventbrite.com/o/erudite-training-10016177864	B
32	Startups: Develop Innovative Product with Minimum Viable Thinking	77.00	2023-07-19	19:00:00	72	https://www.eventbrite.com/e/startups-develop-innovative-product-with-minimum-viable-thinking-tickets-652991504167?aff=ebdssbdestsearch	. ., Jakarta, 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	B
33	KLINIKUM| Healthcare Innovation Trends	77.00	2023-07-19	19:00:00	72	https://www.eventbrite.com/e/klinikum-healthcare-innovation-trends-tickets-611587262967?aff=ebdssbdestsearch	. ., Jakarta, 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	B
34	ALGORYTHM™️| Gamifying AI Systems in The Age of AI	250.00	2023-07-20	19:00:00	72	https://www.eventbrite.com/e/algorythmtm-gamifying-ai-systems-in-the-age-of-ai-tickets-635065166007?aff=ebdssbdestsearch	. ., Jakarta, 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	B
35	Jakarta Leadership: How to Overcome Employees Resistance To Change?	19.00	2023-07-17	16:00:00	720	https://www.eventbrite.com/e/jakarta-leadership-how-to-overcome-employees-resistance-to-change-tickets-449168233277?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
36	Jakarta Leaders: How To Get Best Employees To Stay As Long As Possible?	19.00	2023-07-17	10:00:00	720	https://www.eventbrite.com/e/jakarta-leaders-how-to-get-best-employees-to-stay-as-long-as-possible-tickets-449146287637?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
37	Jakarta Leadership: Overcome Anxiety with Discipline and Termination!	19.00	2023-07-17	15:00:00	720	https://www.eventbrite.com/e/jakarta-leadership-overcome-anxiety-with-discipline-and-termination-tickets-449164592387?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
38	Jakarta Leadership Secret: How To Avoid Costly Hiring Mistakes?	19.00	2023-07-17	14:00:00	720	https://www.eventbrite.com/e/jakarta-leadership-secret-how-to-avoid-costly-hiring-mistakes-tickets-449160941467?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
39	Jakarta Leadership Secrets: How To Successfully Coach Your Employees?	19.00	2023-07-17	13:00:00	24	https://www.eventbrite.com/e/jakarta-leadership-secrets-how-to-successfully-coach-your-employees-tickets-449157290547?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
40	Jakarta Leaders: How to Manage the 4 Different Types of Young Employees	19.00	2023-07-17	11:00:00	24	https://www.eventbrite.com/e/jakarta-leaders-how-to-manage-the-4-different-types-of-young-employees-tickets-449149978677?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
41	Jakarta Leadership: How to Create Genuine and Sincere Employee Loyalty?	19.00	2023-07-17	09:00:00	720	https://www.eventbrite.com/e/jakarta-leadership-how-to-create-genuine-and-sincere-employee-loyalty-tickets-449142646747?aff=ebdssbdestsearch	Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	https://www.eventbrite.com/o/coach-michael-lin-30392569100	B
42	Pelatihan Google Ads di Bali	287.00	2023-07-17	09:00:00	168	https://www.eventbrite.com/e/pelatihan-google-ads-di-bali-tickets-654692421657?aff=ebdssbdestsearch	Zoom Video Conference, Bali, Bali	https://www.eventbrite.com/o/erudite-training-10016177864	B
43	Lunch session: Unlock Career Growth with Proven Strategies	0.00	2023-08-28	12:00:00	24	https://www.eventbrite.com.au/e/lunch-session-unlock-career-growth-with-proven-strategies-tickets-674529023467?aff=ebdssbdestsearch	Sopo Del Tower A 18th floor. Jl Mega Kuningan Barat III, Mega Kuningan, Jakarta 12950 Indonesia, Jakarta, 12950	https://www.eventbrite.com.au/o/cquniversity-indonesia-office-66836250543	B
44	Camp Hustle Asia 2023	999.00	2023-09-18	17:00:00	552	https://www.eventbrite.com/e/camp-hustle-asia-2023-tickets-596185445717?aff=ebdssbdestsearch	Lot N5 Itdc Tourism Complex, Nusa Dua, Nusa Dua, South Kuta, Badung Regency, Bali, 80363	https://www.eventbrite.com/o/hustle-fund-vc-28736780147	B
45	QS Connect & Discover Masters & MBA in Jakarta	0.00	2023-11-11	11:30:00	144	https://www.eventbrite.co.uk/e/qs-connect-discover-masters-mba-in-jakarta-tickets-662272814817?aff=ebdssbdestsearch	17-19 Jalan Kebon Sirih, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10340	https://www.eventbrite.co.uk/o/qs-topuniversities-2916031327	B
46	Learning Management Conference - Jakarta	299.00	2023-10-13	08:30:00	24	https://www.eventbrite.com/e/learning-management-conference-jakarta-tickets-602306012497?aff=ebdssbdestsearch	2500 Jalan Boulevard Palem Raya, Kec. Klp. Dua, Banten 15810	https://www.eventbrite.com/o/faria-education-group-18083812742	B
47	4th GPF Exe Prog on Global Ports Adv Mgt, 16-25Oct23 + Visits, Jakarta,IND	16388.00	2023-10-16	09:00:00	216	https://www.eventbrite.sg/e/4th-gpf-exe-prog-on-global-ports-adv-mgt-16-25oct23-visits-jakartaind-tickets-330587475037?aff=ebdssbdestsearch	Kav. 1 Jalan Jenderal Sudirman, Jakarta, Daerah Khusus Ibukota Jakarta 10220	https://www.eventbrite.sg/o/global-ports-forum-pte-ltd-10929257995	B
48	6th GPF Executive Prog on Global Ports Mgt, Oct 16-20, 2023   Jakarta	8298.00	2023-10-16	09:00:00	96	https://www.eventbrite.sg/e/6th-gpf-executive-prog-on-global-ports-mgt-oct-16-20-2023-jakarta-tickets-330570965657?aff=ebdssbdestsearch	Kav. 1 Jalan Jenderal Sudirman, Jakarta, Daerah Khusus Ibukota Jakarta 10220	https://www.eventbrite.sg/o/global-ports-forum-pte-ltd-10929257995	B
49	ASEAN Flexible Packaging Summit 2023	1768.00	2023-10-24	06:00:00	24	https://www.eventbrite.com/e/asean-flexible-packaging-summit-2023-tickets-666600689607?aff=ebdssbdestsearch	No.1 Jalan Griya Utama B, Kec. Tj. Priok, Daerah Khusus Ibukota Jakarta 14350	https://www.eventbrite.com/o/apex-international-67767040783	B
50	MANUFACTURE IN NIGERIA EXPO	0.00	2023-11-27	09:00:00	48	https://www.eventbrite.com/e/manufacture-in-nigeria-expo-tickets-674238263797?aff=ebdssbdestsearch	No.1 Raya, Kec. Pagedangan, Banten 15339	https://www.eventbrite.com/o/enyimba-economic-city-68293450033	B
51	Indonesia PE-VC Summit 2024	299.00	2024-01-25	08:30:00	240	https://www.eventbrite.sg/e/indonesia-pe-vc-summit-2024-tickets-483682185437?aff=ebdssbdestsearch	TBC, Jakarta, TBC	https://www.eventbrite.sg/o/dealstreetasia-13071268842	B
52	MBP 2023 Bangkok International Conference on Management & Business Practice	165.00	2023-12-18	09:00:00	24	https://www.eventbrite.com/e/mbp-2023-bangkok-international-conference-on-management-business-practice-tickets-669268198197?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/social-science-and-humanities-research-association-16308691268	B
53	2030APOG	0.00	2030-10-29	08:30:00	\N	https://www.eventbrite.com/e/2030apog-tickets-65676099983?aff=ebdssbdestsearch	., Kec. Kuta Sel., Bali 80363	https://www.eventbrite.com/o/apog-25234917507	B
54	Strategic Success Program	0.00	2023-08-25	09:00:00	\N	https://www.eventbrite.com/e/strategic-success-program-tickets-623580374687?aff=ebdssbdestsearch	Jalan Bypass Ngurah Rai, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/life-impact-ministries-64882005923	B
55	INDO PACIFIC Circular Plastics Summit 2023	1768.00	2023-10-26	09:00:00	24	https://www.eventbrite.com/e/indo-pacific-circular-plastics-summit-2023-tickets-666606837997?aff=ebdssbdestsearch	No.1 Jalan Griya Utama B, Kec. Tj. Priok, Daerah Khusus Ibukota Jakarta 14350	https://www.eventbrite.com/o/apex-international-67767040783	B
56	Accelerating Asia Pitch Night: Jakarta Edition	0.00	2023-07-20	16:00:00	\N	https://www.eventbrite.com/e/accelerating-asia-pitch-night-jakarta-edition-tickets-671259654697?aff=ebdssbdestsearch	jakarta, Jakarta, Jakarta 1010110	https://www.eventbrite.com/o/accelerating-asia-20194512938	B
57	Indonesia Maritime Expo (IME)	0.00	2023-10-17	10:00:00	\N	https://www.eventbrite.com/e/indonesia-maritime-expo-ime-tickets-633904464317?aff=ebdssbdestsearch	JIEXPO Kemayoran, Jakarta, Jakarta 10620	https://www.eventbrite.com/o/rx-44705089303	B
58	Enit Asia 2023	0.00	2023-11-14	19:00:00	\N	https://www.eventbrite.com/e/enit-asia-2023-tickets-641179163137?aff=ebdssbdestsearch	Jl. BSD Grand Boulevard Raya No.1 BSD City, Tangerang, 15339	https://www.eventbrite.com/o/clarion-events-66124090073	B
59	PASARASA VOL. 3 : TASTING MARKET	0.00	2023-07-18	18:00:00	96	https://www.eventbrite.com/e/pasarasa-vol-3-tasting-market-tickets-675723706797?aff=ebdssbdestsearch	No.17 Jalan Kemang Raya #10, Kec. Mampang Prpt., Daerah Khusus Ibukota Jakarta 12730	https://www.eventbrite.com/o/ramuraga-and-denyut-bumi-66278634363	FD
60	INAFOOD EXPO & FORUM	0.00	2023-09-29	10:00:00	216	https://www.eventbrite.com/e/inafood-expo-forum-tickets-651537304617?aff=ebdssbdestsearch	1 Jalan Gatot Subroto, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.com/o/royalindo-expo-duta-66894132903	FD
61	Rooftop Sunset Soiree	0.00	2023-07-20	17:00:00	48	https://www.eventbrite.com/e/rooftop-sunset-soiree-tickets-666571081047?aff=ebdssbdestsearch	Jalan Penestanan, Kecamatan Ubud, Bali 80571	https://www.eventbrite.com/o/outpost-bali-64931771863	FD
62	The 5th International Conference on Food, Nutrition, Health & Lifestyle 202	437.00	2023-08-03	08:30:00	24	https://www.eventbrite.com/e/the-5th-international-conference-on-food-nutrition-health-lifestyle-202-tickets-567421170997?aff=ebdssbdestsearch	Jakarta, Indonesia, Jakarta, Jakarta 10110	https://www.eventbrite.com/o/tiikm-conferences-17149949138	FD
63	Digital Transformation Indonesia Conference	0.00	2023-07-26	09:00:00	24	https://www.eventbrite.com/e/digital-transformation-indonesia-conference-tickets-510386940077?aff=ebdssbdestsearch	Jl. Benyamin Suaeb, RW.7, Gn. Sahari Utara, Kecamatan Sawah Besar, Jkt Utara, Kecamatan Sawah Besar, Daerah Khusus Ibukota Jakarta 10720	https://www.eventbrite.com/o/adhouse-clarion-events-59094494963	FD
64	IndoSec 2023	0.00	2023-08-29	08:00:00	48	https://www.eventbrite.com/e/indosec-2023-tickets-668633409527?aff=ebdssbdestsearch	Jalan Jendral sudirman kav 52-53, Kec. Kby. Baru, Daerah Khusus Ibukota Jakarta 12190	https://www.eventbrite.com/o/tradepass-60212244823	FD
65	How to Ace International Expansion at Series A and Beyond	0.00	2023-08-07	15:00:00	48	https://www.eventbrite.com/e/how-to-ace-international-expansion-at-series-a-and-beyond-tickets-662771717047?aff=ebdssbdestsearch	No.52-53 Jalan Jenderal Sudirman #5, Jakarta, Daerah Khusus Ibukota Jakarta 12190	https://www.eventbrite.com/o/vertex-ventures-southeast-asia-india-51921049903	FD
66	Mindfulness Meditation: Wednesday Pause - Indonesia	0.00	2023-07-19	20:00:00	480	https://www.eventbrite.sg/e/mindfulness-meditation-wednesday-pause-indonesia-tickets-502912343357?aff=ebdssbdestsearch	Jakarta, Jakarta	https://www.eventbrite.sg/o/noelle-lim-30099465638	H
67	Jakarta Meditation Free Introductory Seminar(1:1 Consultation)	0.00	2023-07-17	20:00:00	24	https://www.eventbrite.com/e/jakarta-meditation-free-introductory-seminar11-consultation-tickets-639949836187?aff=ebdssbdestsearch	Apartemen Ambasador 1, Lantai 28 , unit 28 B Jln.Prof. Dr. satrio Kuningan, Jakarta Selatan, DKI Jakarta 12940	https://www.eventbrite.com/o/jakarta-meditation-12763156045	H
68	Joy of Inner peace through meditation :  Live healthy Jakarta	0.00	2023-07-23	08:45:00	24	https://www.eventbrite.com.au/e/joy-of-inner-peace-through-meditation-live-healthy-jakarta-tickets-166776720661?aff=ebdssbdestsearch	https://zoom.us/j/9181716151, jakarta, Jakarta 10220	https://www.eventbrite.com.au/o/free-meditation-32468869169	H
69	Sunrise & Energise	0.00	2023-07-21	06:30:00	24	https://www.eventbrite.co.uk/e/sunrise-energise-tickets-672973922117?aff=ebdssbdestsearch	Canggu Beach, Canggu, Bali 80361	https://www.eventbrite.co.uk/o/bpm-method-61895777633	H
70	Workshop: Habits to Increase High Performance	0.00	2023-07-18	17:00:00	24	https://www.eventbrite.com/e/workshop-habits-to-increase-high-performance-tickets-666571793177?aff=ebdssbdestsearch	Jalan Penestanan, Kecamatan Ubud, Bali 80571	https://www.eventbrite.com/o/outpost-bali-64931771863	H
71	Tangerang Meditation Introduction Lecture (online)	0.00	2023-07-18	20:00:00	24	https://www.eventbrite.com/e/tangerang-meditation-introduction-lecture-online-tickets-504180345987?aff=ebdssbdestsearch	Apartemen Amartapura  Tower B , Unit 8D Jl.Sutan Syahrir #50, Lippo Karawaci, Tangerang, Banten 15810	https://www.eventbrite.com/o/tangerang-meditation-9002363495	H
72	Therapeutic Breathwork	31.00	2023-07-27	13:00:00	48	https://www.eventbrite.com/e/therapeutic-breathwork-tickets-676411183057?aff=ebdssbdestsearch	No.8 Jalan Pantai Berawa, Kec. Kuta Utara, Bali 80361	https://www.eventbrite.com/o/nirvana-health-and-lifestyle-complex-65269892253	H
73	Full Moon Sound Healing	22.00	2023-08-02	18:00:00	24	https://www.eventbrite.com/e/full-moon-sound-healing-tickets-674951186167?aff=ebdssbdestsearch	No.8 Jalan Pantai Berawa, Kec. Kuta Utara, Bali 80361	https://www.eventbrite.com/o/nirvana-health-and-lifestyle-complex-65269892253	H
74	PsyCon Bali–ICPP, 24-25 July 2023	165.00	2023-07-24	09:00:00	24	https://www.eventbrite.com/e/psycon-baliicpp-24-25-july-2023-tickets-524342290907?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/eurasia-research-16310610610	H
75	Jakarta: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/jakarta-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-640078811957?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, 11110	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
76	Medan: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/medan-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658523289887?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Medan	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
77	Palembang: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/palembang-lets-change-in-3-week-with-free-guided-meditation-tickets-675185155977?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Palembang	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
78	Balikpapan: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/balikpapan-lets-change-in-3-week-with-free-guided-meditation-tickets-675180471967?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Balikpapan	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
79	Manado: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/manado-lets-change-in-3-week-with-free-guided-meditation-tickets-675180712687?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Manado	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
80	Jakarta: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/jakarta-lets-change-in-3-week-with-free-guided-meditation-tickets-675187392667?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, West Java	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
81	Makassar: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/makassar-lets-change-in-3-week-with-free-guided-meditation-tickets-675180662537?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Makassar	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
82	Medan: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/medan-lets-change-in-3-week-with-free-guided-meditation-tickets-675185125887?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Medan	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
83	Surabaya: Lets change in 3 week with Free Guided Meditation	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/surabaya-lets-change-in-3-week-with-free-guided-meditation-tickets-675185176037?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443	H
84	Makassar: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/makassar-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658519418307?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Makassar	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
85	Surabaya: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/surabaya-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658523510547?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
86	The Self-Renewal Summit: Unf*ck Your Conditioning + Uncover Your True Self	0.00	2023-07-24	17:00:00	72	https://www.eventbrite.com/e/the-self-renewal-summit-unfck-your-conditioning-uncover-your-true-self-tickets-672784776377?aff=ebdssbdestsearch	Online	https://www.eventbrite.com/o/omnia-network-68186577123	H
87	Balikpapan: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/balikpapan-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658519227737?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Balikpapan	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
88	Manado: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/manado-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658519518607?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Manado	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
89	Palembang: Free Guided Meditation for 21 days for Freedom from Thoughts!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/palembang-free-guided-meditation-for-21-days-for-freedom-from-thoughts-tickets-658523400217?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Palembang	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243	H
90	Bali Yoga Wellness Retreat l Balance in Bali	250.00	2024-04-14	16:00:00	168	https://www.eventbrite.com/e/bali-yoga-wellness-retreat-l-balance-in-bali-tickets-637905631917?aff=ebdssbdestsearch	Bali, Ubud, Bali 80571	https://www.eventbrite.com/o/yogitherapi-38512260843	H
91	"Healing holiday" Exclusive Retreat on Bali island	0.00	2023-09-15	10:00:00	\N	https://www.eventbrite.co.uk/e/healing-holiday-exclusive-retreat-on-bali-island-tickets-571215068647?aff=ebdssbdestsearch	Komala Homestay Canggu Bali Komala Homestay Canggu Bali, Kec. Kuta Utara, Bali 80361	https://www.eventbrite.co.uk/o/lesia-s-mindset-energy-mentor-59304706213	H
92	BIRTHDAY DINDIV	0.00	2023-07-24	19:00:00	72	https://www.eventbrite.com/e/birthday-dindiv-tickets-658167465607?aff=ebdssbdestsearch	Jalan BSD Green Office Park, Kec. Cisauk, Banten 15345	https://www.eventbrite.com/o/eventbrite-67073781703	M
93	Afro Loco	0.00	2023-07-22	17:00:00	72	https://www.eventbrite.com/e/afro-loco-tickets-616242837917?aff=ebdssbdestsearch	Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413	M
94	Saxofoam	0.00	2023-07-23	17:00:00	72	https://www.eventbrite.com/e/saxofoam-tickets-616251142757?aff=ebdssbdestsearch	Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413	M
95	Soul n Cream	0.00	2023-07-19	17:00:00	72	https://www.eventbrite.com/e/soul-n-cream-tickets-632533343257?aff=ebdssbdestsearch	Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413	M
96	Sea and She	0.00	2023-07-21	17:00:00	72	https://www.eventbrite.com/e/sea-and-she-tickets-618838230807?aff=ebdssbdestsearch	Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413	M
97	Balifornia	0.00	2023-07-20	17:00:00	72	https://www.eventbrite.com/e/balifornia-tickets-618839063297?aff=ebdssbdestsearch	Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413	M
98	TXT ACT SWEET MIRAGE in Jakarta Concert & Fandom Gathering	203.52	2023-08-09	16:00:00	120	https://www.eventbrite.sg/e/txt-act-sweet-mirage-in-jakarta-concert-fandom-gathering-tickets-669790951767?aff=ebdssbdestsearch	Jalan Kawasan Wisata Ancol, Kec. Pademangan, Daerah Khusus Ibukota Jakarta 14430	https://www.eventbrite.sg/o/moa-indonesia-68007703713	M
99	FATE IN SEOUL by @engene.lombok	0.00	2023-07-30	15:00:00	\N	https://www.eventbrite.com/e/fate-in-seoul-by-engenelombok-tickets-670698676797?aff=ebdssbdestsearch	No. 8 Jalan Pejanggik, Kec. Cakranegara, Nusa Tenggara Bar. 83231	unknown-page	M
100	Unlock Your Mindset for Financial Wellness	0.00	2023-07-27	13:30:00	24	https://www.eventbrite.com/e/unlock-your-mindset-for-financial-wellness-tickets-662172043407?aff=ebdssbdestsearch	Jl Jendral Sudirman No.71, Jakarta, Daerah Khusus Ibukota Jakarta 12190	https://www.eventbrite.com/o/mipower-20176162377	CC
101	Primal Gentrification	0.00	2027-08-12	16:53:00	144	https://www.eventbrite.com/e/primal-gentrification-tickets-145975066353?aff=ebdssbdestsearch	Where the Orangutang lived, Penanggalan, Aceh 0000	https://www.eventbrite.com/o/endota-32134651911	CC
102	Congress of Indonesian Diaspora 7 (CID-7)	0.00	2023-08-12	09:00:00	192	https://www.eventbrite.com/e/congress-of-indonesian-diaspora-7-cid-7-tickets-672604447007?aff=ebdssbdestsearch	Lot 19 No, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.com/o/indonesian-diaspora-network-idn-global-68152661363	C
103	Sunset & Bitcoin Bali	0.00	2023-07-21	16:30:00	72	https://www.eventbrite.com/e/sunset-bitcoin-bali-tickets-472994799177?aff=ebdssbdestsearch	Jalan Batu Mejan Canggu, Kec. Kuta Utara, Bali 80361	https://www.eventbrite.com/o/indonesia-bitcoin-community-33116404407	C
104	Gursa Raya	0.00	2023-08-19	06:00:00	216	https://www.eventbrite.com/e/gursa-raya-tickets-607814418287?aff=ebdssbdestsearch	137 Jalan Raya Cibungbulang - Bogor, Kec. Dramaga, Jawa Barat 16680	https://www.eventbrite.com/o/himateta-62332876053	C
105	Grand Launching Bali Agri Park, Tourism and Agri Education	0.00	2023-07-22	08:00:00	144	https://www.eventbrite.sg/e/grand-launching-bali-agri-park-tourism-and-agri-education-tickets-676472305877?aff=ebdssbdestsearch	Jalan Raya Tegal Suci, Kec. Tegallalang, Bali 80561	https://www.eventbrite.sg/o/rumah-tani-68454056463	C
106	Rihlah #1 Family Gathering	0.00	2023-07-19	07:45:25	96	https://www.eventbrite.com/e/rihlah-1-family-gathering-tickets-675068115907?aff=ebdssbdestsearch	Jawa Tengah 51383	https://www.eventbrite.com/o/unnamed-organizer-25485610157	C
107	Free Transformational Energy Healing Bali	0.00	2023-08-09	16:00:02	48	https://www.eventbrite.com/e/free-transformational-energy-healing-bali-tickets-667732254147?aff=ebdssbdestsearch	Jalan Raya Ubud, Bali 80571	https://www.eventbrite.com/o/vasiliki-areti-67851326683	C
108	Bali – ICSSH, 21-22 July 2023	165.00	2023-07-21	09:00:00	24	https://www.eventbrite.com/e/bali-icssh-21-22-july-2023-tickets-524311047457?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/eurasia-research-16310610610	C
109	Surabaya : Socials, Peace and Community Joy in 21 Days!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/surabaya-socials-peace-and-community-joy-in-21-days-tickets-677895522757?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.ca/o/social-meditation-for-peace-joy-67546215753	C
110	Denpasar City : Socials, Peace and Community Joy in 21 Days!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/denpasar-city-socials-peace-and-community-joy-in-21-days-tickets-677895613027?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Denpasar City, Bali 80117	https://www.eventbrite.ca/o/social-meditation-for-peace-joy-67546215753	C
111	Jakarta : Socials, Peace and Community Joy in 21 Days!	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/jakarta-socials-peace-and-community-joy-in-21-days-tickets-677895462577?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, West Java	https://www.eventbrite.ca/o/social-meditation-for-peace-joy-67546215753	C
112	Boys Night at Belle	0.00	2023-08-10	19:00:00	72	https://www.eventbrite.com/e/boys-night-at-belle-tickets-669796347907?aff=ebdssbdestsearch	Jalan Monkey Forest, Kecamatan Ubud, Bali 80571	https://www.eventbrite.com/o/belle-wine-bar-grazing-boards-68008297843	C
113	“The Life Experience” Bali Indonesia Retreat	535.00	2023-10-20	08:00:00	168	https://www.eventbrite.com/e/the-life-experience-bali-indonesia-retreat-tickets-596885399297?aff=ebdssbdestsearch	Jalan Raya Gusti Ngurah Rai, Kec. Kuta, Bali 80362	https://www.eventbrite.com/o/tracye-hamler-10977260678	C
114	#KopdarstageID	0.00	2023-07-24	19:30:23	\N	https://www.eventbrite.com/e/kopdarstageid-tickets-676560479607?aff=ebdssbdestsearch	31 Jalan Raya Pejaten, Ps. Minggu, DKI Jakarta 12540	https://www.eventbrite.com/o/stageid-18713881565	C
115	INTERNATIONAL EDUCATION EXPO 2023	0.00	2023-07-23	13:00:00	96	https://www.eventbrite.com.au/e/international-education-expo-2023-tickets-661546171407?aff=ebdssbdestsearch	No 80 Jalan Laksda Adisucipto, Sleman, Jogja 55281	https://www.eventbrite.com.au/o/cie-central-international-education-yogyakarta-31416952941	FE
116	ANU OPEN DAY	0.00	2023-07-29	12:00:00	120	https://www.eventbrite.com/e/anu-open-day-tickets-668111739197?aff=ebdssbdestsearch	Kav.C-22A Jalan Haji R. Rasuna Said, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	https://www.eventbrite.com/o/aug-student-services-16456092907	FE
117	How to Improve Your Memory - Jakarta	0.00	2023-07-19	22:00:00	24	https://www.eventbrite.com/e/how-to-improve-your-memory-jakarta-tickets-487972046527?aff=ebdssbdestsearch	[ONLINE EVENT], Jakarta, Jakarta 10350	https://www.eventbrite.com/o/iris-reading-58158045383	FE
118	The 6th Extensive Reading World Congress	25.00	2023-08-09	19:00:00	72	https://www.eventbrite.com/e/the-6th-extensive-reading-world-congress-tickets-440265404677?aff=ebdssbdestsearch	Street Number, 283 Jl. Gatot Subroto Barat, Denpasar, Bali 80111	https://www.eventbrite.com/o/the-extensive-reading-foundation-861429087	FE
119	Ke Jerman Senggol Dong!	0.00	2023-08-05	10:00:00	96	https://www.eventbrite.com/e/ke-jerman-senggol-dong-tickets-674957545187?aff=ebdssbdestsearch	No.48 Jalan L. L. R.E. Martadinata, Kec. Bandung Wetan, Jawa Barat 40115	https://www.eventbrite.com/o/goethe-institut-indonesien-24215795241	FE
120	Effective Note-Taking- Jakarta	0.00	2023-07-20	21:00:00	24	https://www.eventbrite.com/e/effective-note-taking-jakarta-tickets-488860032517?aff=ebdssbdestsearch	[ONLINE EVENT], Jakarta, Jakarta E1 1DU	https://www.eventbrite.com/o/iris-reading-58158045383	FE
121	SEMINAR EDUKASI EMAS	0.00	2023-07-22	11:00:00	72	https://www.eventbrite.hk/e/seminar-edukasi-emas-tickets-672482933557?aff=ebdssbdestsearch	14 Jalan Laksda Adisucipto, Kec. Gondokusuman, Jogja 55221	https://www.eventbrite.hk/o/public-gold-indonesia-29089848445	FE
122	Speed Reading Crash Course - Jakarta	0.00	2023-07-18	22:00:00	24	https://www.eventbrite.com/e/speed-reading-crash-course-jakarta-tickets-487236305907?aff=ebdssbdestsearch	[ONLINE EVENT], Jakarta, Jakarta E1 1DU	https://www.eventbrite.com/o/iris-reading-58158045383	FE
123	Copy of How to Improve Your Memory - Bandung	0.00	2023-07-19	22:00:00	24	https://www.eventbrite.com/e/copy-of-how-to-improve-your-memory-bandung-tickets-488102306137?aff=ebdssbdestsearch	[ONLINE EVENT], Bandung, West Java 40115	https://www.eventbrite.com/o/iris-reading-58158045383	FE
124	Effective Note-Taking- Bandung	0.00	2023-07-20	21:00:00	24	https://www.eventbrite.com/e/effective-note-taking-bandung-tickets-488967213097?aff=ebdssbdestsearch	[ONLINE EVENT], Bandung, West Java 54600	https://www.eventbrite.com/o/iris-reading-58158045383	FE
125	Reading Comprehension Strategies - Surabaya	0.00	2023-07-21	21:00:00	24	https://www.eventbrite.com/e/reading-comprehension-strategies-surabaya-tickets-615615120397?aff=ebdssbdestsearch	[ONLINE EVENT], Surabaya, East Java M5V1J9	https://www.eventbrite.com/o/iris-reading-58158045383	FE
126	Effective Note-Taking- Surabaya	0.00	2023-07-20	21:00:00	24	https://www.eventbrite.com/e/effective-note-taking-surabaya-tickets-488958807957?aff=ebdssbdestsearch	[ONLINE EVENT], Surabaya, East Java 54600	https://www.eventbrite.com/o/iris-reading-58158045383	FE
127	Makassar Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/makassar-education-course-self-empowerment-in-21-days-for-life-tickets-670497043707?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Makassar	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
128	Jakarta Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/jakarta-education-course-self-empowerment-in-21-days-for-life-tickets-668643198807?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, 10350	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
129	2023 EdTec – ICTEL, 20-21 July, Bali	165.00	2023-07-20	09:00:00	24	https://www.eventbrite.com/e/2023-edtec-ictel-20-21-july-bali-tickets-524285862127?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/eurasia-research-16310610610	FE
130	Surabaya Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/surabaya-education-course-self-empowerment-in-21-days-for-life-tickets-670499119917?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
131	Manado Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/manado-education-course-self-empowerment-in-21-days-for-life-tickets-670497093857?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Manado	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
132	Medan Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/medan-education-course-self-empowerment-in-21-days-for-life-tickets-670498628447?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Medan	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
133	Balikpapan Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/balikpapan-education-course-self-empowerment-in-21-days-for-life-tickets-670497013617?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Balikpapan	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
134	Palembang Education Course- Self Empowerment in 21 Days for Life	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/palembang-education-course-self-empowerment-in-21-days-for-life-tickets-670498658537?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Palembang	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963	FE
135	Begin Edu Fair Jakarta (Indonesia)	0.00	2023-11-18	13:00:00	96	https://www.eventbrite.co.uk/e/begin-edu-fair-jakarta-indonesia-tickets-666772212637?aff=ebdssbdestsearch	Kav 10-11 Jalan Jenderal Sudirman, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10220	https://www.eventbrite.co.uk/o/begin-group-18297097356	FE
136	Begin Edu Fair Surabaya (Indonesia)	0.00	2023-11-19	13:00:00	96	https://www.eventbrite.co.uk/e/begin-edu-fair-surabaya-indonesia-tickets-666773747227?aff=ebdssbdestsearch	85-89 Jalan Embong Malang, Kec. Tegalsari, Jawa Timur 60261	https://www.eventbrite.co.uk/o/begin-group-18297097356	FE
137	International Beauty Contest Fashion Casting	0.00	2023-08-01	16:00:00	48	https://www.eventbrite.fr/e/international-beauty-contest-fashion-casting-tickets-677927448247?aff=ebdssbdestsearch	18 Jalan Gatot Subroto, Kec. Mampang Prpt., Daerah Khusus Ibukota Jakarta 12710	https://www.eventbrite.fr/o/km-universe-44787925123	F
138	Short Film Screenings: Tech Tales	0.00	2023-08-03	17:30:00	24	https://www.eventbrite.com/e/short-film-screenings-tech-tales-tickets-669158650537?aff=ebdssbdestsearch	No.9 Jalan Dr. GSSJ Ratulangi #15, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10350	https://www.eventbrite.com/o/goethe-institut-indonesien-24215795241	FM
139	Ciné LIP: "Little Tickles"	0.00	2023-07-20	19:00:00	48	https://www.eventbrite.com/e/cine-lip-little-tickles-tickets-675087313327?aff=ebdssbdestsearch	No.3 Jalan Sagan, Kec. Gondokusuman, Jogja 55223	https://www.eventbrite.com/o/institut-francais-yogyakarta-48967508833	FM
140	CINÉ LIP: “Remi, Nobodys Boy”	0.00	2023-07-27	19:00:00	\N	https://www.eventbrite.com/e/cine-lip-remi-nobodys-boy-tickets-676410119877?aff=ebdssbdestsearch	No.3 Jalan Sagan, Kec. Gondokusuman, Jogja 55223	https://www.eventbrite.com/o/institut-francais-yogyakarta-48967508833	FM
141	CINÉ LIP: “In Bed with Victoria”	0.00	2023-08-03	19:00:00	\N	https://www.eventbrite.com/e/cine-lip-in-bed-with-victoria-tickets-676427160847?aff=ebdssbdestsearch	No.3 Jalan Sagan, Kec. Gondokusuman, Jogja 55223	https://www.eventbrite.com/o/institut-francais-yogyakarta-48967508833	FM
142	The Powder Room Afternoon Tea Series #04	76.00	2023-07-29	14:00:00	96	https://www.eventbrite.com/e/the-powder-room-afternoon-tea-series-04-tickets-676506468057?aff=ebdssbdestsearch	Jalan Raya Sanggingan, Kecamatan Ubud, Bali 80561	https://www.eventbrite.com/o/room4dessert-65332849893	Ho
143	DIY Ceramic Class	13.58	2023-07-23	10:00:00	168	https://www.eventbrite.com/e/diy-ceramic-class-tickets-660988021967?aff=ebdssbdestsearch	Tirto, Bangunjiwo, Kabupaten Bantul, Kabupaten Bantul, 55184	https://www.eventbrite.com/o/nonton-bareng-indonesia-67384300223	Ho
144	Jakarta Surface Show -  3rd International Natural Stones and Coverings Show	0.00	2023-07-17	19:00:00	72	https://www.eventbrite.com/e/jakarta-surface-show-3rd-international-natural-stones-and-coverings-show-tickets-653765649657?aff=ebdssbdestsearch	1 Jalan BSD Grand Boulevard, Kec. Pagedangan, Banten 15339	https://www.eventbrite.com/o/tg-expo-65910817543	HL
145	MEGABUILD Indonesia (MBI)	0.00	2024-05-09	10:00:00	\N	https://www.eventbrite.sg/e/megabuild-indonesia-mbi-tickets-653742741137?aff=ebdssbdestsearch	1 Jalan Gatot Subroto, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.sg/o/panorama-media-panorama-masa-kini-18440113510	HL
146	KERAMIKA Indonesia (KMI)	0.00	2024-05-09	10:00:00	\N	https://www.eventbrite.sg/e/keramika-indonesia-kmi-tickets-653747304787?aff=ebdssbdestsearch	1 Jalan Gatot Subroto, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.sg/o/panorama-media-panorama-masa-kini-18440113510	HL
147	Ramayana Ballet Purawisata	11.50	2023-07-17	19:30:00	24	https://www.eventbrite.com/e/ramayana-ballet-purawisata-tickets-637256149297?aff=ebdssbdestsearch	Jalan Brigjen Katamso, Mergangsan, Jogja 55152	https://www.eventbrite.com/o/mandira-baruga-purawisata-yogyakarta-8493506255	A
148	CLAYSTAGE: Prehistoric Body Theater	10.00	2023-07-23	19:00:00	72	https://www.eventbrite.com/e/claystage-prehistoric-body-theater-tickets-677940186347?aff=ebdssbdestsearch	Kajen, Bangunjiwo, Kec. Kasihan, Kabupaten Bantul, Daerah Istimewa Yogyakarta, Kab. Bantul, 5 55184	https://www.eventbrite.com/o/nonton-bareng-indonesia-67388962633	A
149	Ancestral Impending • Art Exhibition	0.00	2023-12-16	09:00:00	\N	https://www.eventbrite.com/e/ancestral-impending-art-exhibition-tickets-531459408397?aff=ebdssbdestsearch	Jl. Wijaya Timur Raya no 12, Kebayoran Baru, Daerah Khusus Ibukota Jakarta 12170	https://www.eventbrite.com/o/tim-ai-60145923803	A
150	[Free Seminar] Bedah Peluang Cuan dari Trading Emas	0.00	2023-07-28	19:00:00	24	https://www.eventbrite.com/e/free-seminar-bedah-peluang-cuan-dari-trading-emas-tickets-675854026587?aff=ebdssbdestsearch	No.79 Jalan Letjen Sutoyo, Kec. Lowokwaru, Jawa Timur 65141	https://www.eventbrite.com/o/phillip-futures-29228707703	G
151	Praise Worship Night	0.00	2023-07-22	19:30:00	48	https://www.eventbrite.com/e/praise-worship-night-tickets-662665709977?aff=ebdssbdestsearch	Jl. Ruko Poris Indah Blok CP IV No.18 , Kel. Cipondoh Indah, Kec Cipondoh, Tangerang, Banten 15148	https://www.eventbrite.com/o/generasi-bts-67513518463	S
152	Jakarta: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/jakarta-free-kundalini-inner-energy-awakening-meditation-course-tickets-654252285197?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, 10110	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
153	NOTIFICATION - Pray Praise Worship Session	0.00	2023-07-29	15:00:00	72	https://www.eventbrite.com/e/notification-pray-praise-worship-session-tickets-676687138447?aff=ebdssbdestsearch	5 Jalan HR Rasuna Said Kavling A5 No, Tangerang Selatan, Banten 15220	https://www.eventbrite.com/o/generasi-muda-berdoa-66633903963	S
154	Makassar: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	18:45:00	\N	https://www.eventbrite.com.au/e/makassar-free-kundalini-inner-energy-awakening-meditation-course-tickets-655331884307?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Makassar	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
155	Surabaya: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/surabaya-free-kundalini-inner-energy-awakening-meditation-course-tickets-655831127557?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
156	SEE THE LIGHT Worship Night SAMARINDA 2023	0.00	2023-08-24	18:30:59	48	https://www.eventbrite.com/e/see-the-light-worship-night-samarinda-2023-tickets-678389981697?aff=ebdssbdestsearch	Jl Gerilya Samarinda, Samarinda, East Kalimantan	https://www.eventbrite.com/o/kelir-x-acs-68597322353	S
157	I want spiritual awakening, just not alone in Manado! 21 Day Meditation	0.00	2023-08-05	18:45:00	24	https://www.eventbrite.com.au/e/i-want-spiritual-awakening-just-not-alone-in-manado-21-day-meditation-tickets-669092693257?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Manado	https://www.eventbrite.com.au/o/spiritual-awakening-just-not-alone-meditation-61314124363	S
158	Jakarta- Free Moksha Enlightenment with Purity and Penance Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/jakarta-free-moksha-enlightenment-with-purity-and-penance-course-tickets-676948821147?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, West Java	https://www.eventbrite.ca/o/moksha-and-meditation-68072081223	S
159	Surabaya- Free Moksha Enlightenment with Purity and Penance Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/surabaya-free-moksha-enlightenment-with-purity-and-penance-course-tickets-676948851237?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.ca/o/moksha-and-meditation-68072081223	S
160	Denpasar City- Free Moksha Enlightenment with Purity and Penance Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.ca/e/denpasar-city-free-moksha-enlightenment-with-purity-and-penance-course-tickets-676948891357?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Denpasar City, Bali 80117	https://www.eventbrite.ca/o/moksha-and-meditation-68072081223	S
161	Balikpapan: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	18:45:00	\N	https://www.eventbrite.com.au/e/balikpapan-free-kundalini-inner-energy-awakening-meditation-course-tickets-655331844187?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Balikpapan	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
162	Manado: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	18:45:00	\N	https://www.eventbrite.com.au/e/manado-free-kundalini-inner-energy-awakening-meditation-course-tickets-655331924427?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Manado	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
163	Medan: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/medan-free-kundalini-inner-energy-awakening-meditation-course-tickets-655831087437?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Medan	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
164	Palembang: Free Kundalini Inner Energy Awakening Meditation Course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/palembang-free-kundalini-inner-energy-awakening-meditation-course-tickets-655831107497?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Palembang	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273	S
165	(Offline Meetup) DevOps Indonesia x Inovasi Informatika Indonesia (i3)	0.00	2023-07-26	19:00:00	48	https://www.eventbrite.com/e/offline-meetup-devops-indonesia-x-inovasi-informatika-indonesia-i3-tickets-675032368987?aff=ebdssbdestsearch	No.25 Jalan Jenderal Sudirman, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.com/o/devops-indonesia-28693559707	ST
166	Sparksquad feat. Couchbase : The Journey towards Database Modernisation	0.00	2023-07-20	18:45:00	48	https://www.eventbrite.com/e/sparksquad-feat-couchbase-the-journey-towards-database-modernisation-tickets-673046870307?aff=ebdssbdestsearch	No.25 Jalan Jenderal Sudirman, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	https://www.eventbrite.com/o/pt-solusi-tangkas-bijaksana-68206042433	ST
167	Microsoft Build After Party Indonesia 2023	0.00	2023-07-29	08:30:00	96	https://www.eventbrite.com/e/microsoft-build-after-party-indonesia-2023-tickets-668538856717?aff=ebdssbdestsearch	Jalan Raya Dukuhwaluh, Kec. Kembaran, Jawa Tengah 53182	https://www.eventbrite.com/o/agus-suparno-leader-of-microsoft-user-group-indonesia-mugi-purwokerto-10608154898	ST
168	Maritime Safety and Weather Technology	0.00	2023-08-08	17:00:00	24	https://www.eventbrite.com/e/maritime-safety-and-weather-technology-tickets-645742381847?aff=ebdssbdestsearch	PQ9V+2V9, Keputih,, Sukolilo, East Java 60117	https://www.eventbrite.com/o/the-worldwide-ferry-safety-association-37719852543	ST
169	Seminar: Data Leak Protection and Mobile Application Development	0.00	2023-07-22	09:00:00	72	https://www.eventbrite.com/e/seminar-data-leak-protection-and-mobile-application-development-tickets-677161126157?aff=ebdssbdestsearch	JL. RAYA PLALANGAN PLOSOWAHYU KM 02 LAMONGAN, Kec. Lamongan, Jawa Timur 62218	https://www.eventbrite.com/o/lamongan-dev-55731064613	ST
170	Indonesia NXT Gen Cloud Summit 2023	0.00	2023-08-28	08:00:00	216	https://www.eventbrite.com/e/indonesia-nxt-gen-cloud-summit-2023-tickets-676507370757?aff=ebdssbdestsearch	Le Meridien Jakarta, Karet Tengsin, Central Jakarta City, Jakarta, Indonesia, Tanah Abang, Jakarta	https://www.eventbrite.com/o/scribe-minds-media-68457732013	ST
171	Seminar ITOM Day Indonesia Prodata ManageEngine 2023	0.00	2023-08-08	08:30:00	120	https://www.eventbrite.com/e/seminar-itom-day-indonesia-prodata-manageengine-2023-tickets-677225699297?aff=ebdssbdestsearch	Jalan Dr Ide Anak Agung Gde Agung Kav E.1.2 No 1&2, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12950	https://www.eventbrite.com/o/pt-prodata-sistem-teknologi-51109971823	ST
172	7th Annual Indonesia OpenGov Leadership Forum 2023	995.00	2023-08-03	08:05:00	192	https://www.eventbrite.sg/e/7th-annual-indonesia-opengov-leadership-forum-2023-tickets-484248519357?aff=ebdssbdestsearch	Kav.C-22A Jalan Haji R. Rasuna Said, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	https://www.eventbrite.sg/o/opengov-asia-9779221701	ST
173	ALGORYTHM™️| Artificial Intelligence 101: From Sci-Fi to Reality	39.00	2023-07-27	18:00:00	48	https://www.eventbrite.com/e/algorythmtm-artificial-intelligence-101-from-sci-fi-to-reality-tickets-667983124507?aff=ebdssbdestsearch	. ., Jakarta, 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	ST
174	Algorythm™️| Intro to Machine Learning	98.00	2023-07-16	19:00:00	\N	https://www.eventbrite.com/e/algorythmtm-intro-to-machine-learning-tickets-417320907067?aff=ebdssbdestsearch	. ., JAKARTA, WA 00000	https://www.eventbrite.com/o/kat-usop-mshi-17526467445	ST
175	International Conference on Science & Technology 23-24 July 2023, Bali	165.00	2023-07-23	09:00:00	24	https://www.eventbrite.com/e/international-conference-on-science-technology-23-24-july-2023-bali-tickets-524332973037?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/eurasia-research-16310610610	ST
176	STRA International Conference on Engineering & Technology, 19-20 December	274.00	2023-12-19	09:00:00	24	https://www.eventbrite.com/e/stra-international-conference-on-engineering-technology-19-20-december-tickets-669277897207?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/scientific-and-technical-research-association-16309849318	ST
177	BioClina 2023 – International Conference on Biological & Clinical Studies,	328.00	2023-12-20	09:00:00	24	https://www.eventbrite.com/e/bioclina-2023-international-conference-on-biological-clinical-studies-tickets-669278629397?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/healthcare-biological-sciences-research-association-16308507994	ST
178	ATOM Bali by Cosmoverse	0.00	2023-07-19	17:00:00	\N	https://www.eventbrite.com/e/atom-bali-by-cosmoverse-tickets-676509868227?aff=ebdssbdestsearch	2 Jalan Pantai Batu Mejan, Kec. Kuta Utara, Bali	https://www.eventbrite.com/o/cosmoverse-the-annual-conference-of-the-cosmos-ecosystem-62335786283	ST
179	Paten Examiners Go to Campus	0.00	2023-07-06	09:00:00	\N	https://www.eventbrite.com/e/paten-examiners-go-to-campus-tickets-663377809887?aff=ebdssbdestsearch	Jl Mulyorejo, Kec. Mulyorejo, Jawa Timur 60115	https://www.eventbrite.com/o/lipjphki-universitas-airlangga-57195071423	ST
180	BAMBU SPORT CLUB (SPORTAINMENT) ADU TEPUK BULU & ADU TENDANG BOLA	0.00	2023-08-26	07:00:00	24	https://www.eventbrite.com/e/bambu-sport-club-sportainment-adu-tepuk-bulu-adu-tendang-bola-tickets-660965574827?aff=ebdssbdestsearch	No.35 Jalan Balap Sepeda, Kec. Pulo Gadung, Daerah Khusus Ibukota Jakarta 13220	https://www.eventbrite.com/o/bambu-sport-club-67380826073	SF
181	Retreat with Virgile in Bali	4500.00	2023-07-23	14:00:00	144	https://www.eventbrite.com/e/retreat-with-virgile-in-bali-tickets-664652181567?aff=ebdssbdestsearch	Banjar Batur Rening Mambal, Abiansemal, Bali 80352	https://www.eventbrite.com/o/les-etoiles-67647811983	SF
182	Surabaya : Free Fitness for Mind and Soul in 3 weeks course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/surabaya-free-fitness-for-mind-and-soul-in-3-weeks-course-tickets-677466499537?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Surabaya	https://www.eventbrite.com.au/o/meditate-to-regenerate-33712455763	SF
183	Jakarta : Free Fitness for Mind and Soul in 3 weeks course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/jakarta-free-fitness-for-mind-and-soul-in-3-weeks-course-tickets-677466419297?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Jakarta, West Java	https://www.eventbrite.com.au/o/meditate-to-regenerate-33712455763	SF
184	Denpasar City : Free Fitness for Mind and Soul in 3 weeks course	0.00	2023-08-05	17:45:00	24	https://www.eventbrite.com.au/e/denpasar-city-free-fitness-for-mind-and-soul-in-3-weeks-course-tickets-677466539657?aff=ebdssbdestsearch	Zoom link emailed & displayed after registration, Denpasar City, Bali 80117	https://www.eventbrite.com.au/o/meditate-to-regenerate-33712455763	SF
185	Sailing Komodo Labuan Bajo 3 Day 2 Night (2023) with Alfathran Deluxe Boat	0.00	2023-07-21	10:00:00	\N	https://www.eventbrite.sg/e/sailing-komodo-labuan-bajo-3-day-2-night-2023-with-alfathran-deluxe-boat-tickets-565817353937?aff=ebdssbdestsearch	Labuan Bajo Airport, Komodo, Nusa Tenggara Tim. 86711	https://www.eventbrite.sg/o/doyan-jalan-18070274634	TO
186	Sailing Komodo Arround in 3 Days 2 Night, 2023 With Almadira Superior Boat	0.00	2023-07-21	10:30:00	72	https://www.eventbrite.sg/e/sailing-komodo-arround-in-3-days-2-night-2023-with-almadira-superior-boat-tickets-564178682627?aff=ebdssbdestsearch	Labuan Bajo Airport, Komodo, Nusa Tenggara Tim. 86711	https://www.eventbrite.sg/o/doyan-jalan-18070274634	TO
187	ASITA TOUR TRAVEL FAIR 2023	0.00	2023-08-18	10:00:00	48	https://www.eventbrite.com/e/asita-tour-travel-fair-2023-tickets-651550514127?aff=ebdssbdestsearch	1 Jalan Kartika Utama, Kec. Kby. Lama, Daerah Khusus Ibukota Jakarta 12310	https://www.eventbrite.com/o/asita-pariwisata-66896761173	TO
188	Open Trip Labuan Bajo 2023 (3 Day 2 Night) with Lamborajo 1 Superior Boat	0.00	2023-07-21	10:00:00	\N	https://www.eventbrite.sg/e/open-trip-labuan-bajo-2023-3-day-2-night-with-lamborajo-1-superior-boat-tickets-564117609957?aff=ebdssbdestsearch	Komodo National Park Mo, Kec. Komodo, Nusa Tenggara Tim. 86711	https://www.eventbrite.sg/o/doyan-jalan-18070274634	TO
189	RINCA ISLAND SHORE EXCURSIONS	0.00	2023-07-17	08:30:00	192	https://www.eventbrite.com/e/rinca-island-shore-excursions-tickets-469639362977?aff=ebdssbdestsearch	Rinca  Island Komodo National Park, Kec. Komodo, Nusa Tenggara Tim. 86754	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219	TO
190	Open Trip Labuan Bajo 3 Hari 2 Malam - Lamborajo 2 Luxury Tahun 2023	0.00	2023-07-21	10:00:00	\N	https://www.eventbrite.sg/e/open-trip-labuan-bajo-3-hari-2-malam-lamborajo-2-luxury-tahun-2023-tickets-565866400637?aff=ebdssbdestsearch	Labuan Bajo Airport, Komodo, Nusa Tenggara Tim. 86711	https://www.eventbrite.sg/o/doyan-jalan-18070274634	TO
191	Fascinating Bali Trip 2023	0.00	2023-08-30	07:00:00	\N	https://www.eventbrite.com/e/fascinating-bali-trip-2023-tickets-422310611407?aff=ebdssbdestsearch	123 DREAM DESTINATION, BALI, Indonesia 00000	https://www.eventbrite.com/o/jawanatravelcom-17209870673	TO
192	Pendakian Umum STAPALA 2023	0.00	2023-09-22	07:00:00	24	https://www.eventbrite.com/e/pendakian-umum-stapala-2023-tickets-670577434157?aff=ebdssbdestsearch	Jl. Gn. Putri, Sukatani, Kec. Pacet, Kabupaten Cianjur, Jawa Barat 43253	https://www.eventbrite.com/o/panitia-pendakian-umum-stapala-2023-68059292323	TO
193	KOMODO ISLAND  & PINK BEACH TOURS - SHORE EXCURSIONS - KOMODO MAS TOUR	0.00	2023-11-14	08:30:00	168	https://www.eventbrite.com/e/komodo-island-pink-beach-tours-shore-excursions-komodo-mas-tour-tickets-349961754027?aff=ebdssbdestsearch	Jl. Soekarno Hatta Labuan Bajo, Labuan Bajo, West Manggarai Regency 8	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219	TO
194	KOMODO ISLAND TOUR FROM CRUISE SHIP - BEST 2022 /23 SHORE EXCURSIONS	0.00	2023-11-14	08:30:00	168	https://www.eventbrite.com/e/komodo-island-tour-from-cruise-ship-best-2022-23-shore-excursions-tickets-349955655787?aff=ebdssbdestsearch	Loh Liang, Komodo Island Komodo Island Village, Komodo, West Manggarai Regency 86754	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219	TO
195	KOMODO ISLAND SHORE EXCURSION FROM CRUISE SHIP PORT	0.00	2023-11-14	08:30:00	168	https://www.eventbrite.com/e/komodo-island-shore-excursion-from-cruise-ship-port-tickets-349964983687?aff=ebdssbdestsearch	Jl. Pede Kecil Dusun II, Desa Gorontalo, Labuan Bajo Kecamatan Komodo, Labuan Bajo, East Nusa Tenggara 86754	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219	TO
196	oh Baby we Taking Bali	108.00	2024-08-07	15:30:00	120	https://www.eventbrite.com/e/oh-baby-we-taking-bali-tickets-511557340777?aff=ebdssbdestsearch	112345 tj street, uber, Bali 80571	https://www.eventbrite.com/o/jewel-princess-johnson-27986822939	TO
197	Beautiful Bali 2024	0.00	2024-09-14	00:00:00	120	https://www.eventbrite.com/e/beautiful-bali-2024-tickets-661517676177?aff=ebdssbdestsearch	Jalan A.A. Gede Rai, Ubud, Bali 80571	https://www.eventbrite.com/o/euphoric-travel-destinations-llc-58586644723	TO
198	Spectacular Bali Lux 2024	0.00	2024-06-20	12:00:00	96	https://www.eventbrite.com/e/spectacular-bali-lux-2024-tickets-644712501447?aff=ebdssbdestsearch	Bali, Bali, Bali 80361	https://www.eventbrite.com/o/touch-of-royalty-events-travel-llc-57175304013	TO
199	Bali Girls Trip 2024	0.00	2024-10-12	07:00:00	72	https://www.eventbrite.com/e/bali-girls-trip-2024-tickets-677894178737?aff=ebdssbdestsearch	DREAM DESTINATION, BALI, Indonesia 00000	https://www.eventbrite.com/o/jawanatravelcom-17209870673	TO
200	Girls Trip Getaway to Bali	0.00	2024-05-13	16:00:00	\N	https://www.eventbrite.com/e/girls-trip-getaway-to-bali-tickets-668545657057?aff=ebdssbdestsearch	Bali, Bali, Bali 99999	https://www.eventbrite.com/o/travel-in-tranquility-59843491493	TO
201	One Day Trip to Komodo Island from Labuan Bajo: An Unforgettable Adventure!	0.00	2023-07-17	06:00:00	\N	https://www.eventbrite.com/e/one-day-trip-to-komodo-island-from-labuan-bajo-an-unforgettable-adventure-tickets-500572344357?aff=ebdssbdestsearch	Jl. Soekarno Hatta Labuan Bajo, Labuan Bajo, West Manggarai Regency 8	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219	TO
202	Bali Takeover - The Melanated Bali Experience	268.00	2023-08-12	19:00:00	\N	https://www.eventbrite.com/e/bali-takeover-the-melanated-bali-experience-tickets-510755703057?aff=ebdssbdestsearch	Bali, Seminyak, Bali 80361	https://www.eventbrite.com/o/the-alumni-group-10693880808	TO
203	Social inclusion and development outcomes in caste-based societies	0.00	2023-07-20	13:30:00	24	https://www.eventbrite.com/e/social-inclusion-and-development-outcomes-in-caste-based-societies-tickets-677154125217?aff=ebdssbdestsearch	No.10A Jalan Cikini Raya #13, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10330	https://www.eventbrite.com/o/forum-kajian-pembangunan-dengan-tuan-rumah-lembaga-penelitian-smeru-15305978067	O
204	Azila Villa Open House 2023 - Sesi 3	0.00	2023-07-19	15:00:26	48	https://www.eventbrite.com/e/azila-villa-open-house-2023-sesi-3-tickets-676877608147?aff=ebdssbdestsearch	No. 2A Jalan Damai PBSI, Daerah Khusus Ibukota Jakarta 13840	https://www.eventbrite.com/o/azila-villa-20065974423	O
205	The 10th International Conference On Fisheries And Aquaculture 2023	478.00	2023-09-21	19:00:00	24	https://www.eventbrite.com/e/the-10th-international-conference-on-fisheries-and-aquaculture-2023-tickets-567438061517?aff=ebdssbdestsearch	Jakarta, Indonesia, Jakarta, Jakarta 10110	https://www.eventbrite.com/o/tiikm-conferences-17149949138	O
206	HuSoc Bali – Humanities & Social Sciences International Conference, 17-18 D	165.00	2023-12-17	09:00:00	24	https://www.eventbrite.com/e/husoc-bali-humanities-social-sciences-international-conference-17-18-d-tickets-669264166137?aff=ebdssbdestsearch	No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	https://www.eventbrite.com/o/social-science-and-humanities-research-association-16308691268	O
207	DMA x SEONGCHAN Dance Workshop 2.0	0.00	2023-07-30	15:30:00	\N	https://www.eventbrite.com/e/dma-x-seongchan-dance-workshop-20-tickets-653725509597?aff=ebdssbdestsearch	Jalan BSD Raya Utama #Lt. 1, Kec. Pagedangan, Banten 15331	https://www.eventbrite.com/o/dma-duomamaarmy-67014328423	O
208	[Offline] UNAIR MENULIS Batch 9	0.00	2023-07-17	09:00:00	\N	https://www.eventbrite.com/e/offline-unair-menulis-batch-9-tickets-672881856747?aff=ebdssbdestsearch	Jl Mulyorejo, Kec. Mulyorejo, Jawa Timur 60115	https://www.eventbrite.com/o/lipjphki-universitas-airlangga-57195071423	O
209	Modern Shamanism for Women in Bali	73.00	2023-07-22	10:30:00	\N	https://www.eventbrite.co.uk/e/modern-shamanism-for-women-in-bali-tickets-666307763457?aff=ebdssbdestsearch	Meeting point will be informed after registration., Tampaksiring, Bali	https://www.eventbrite.co.uk/o/suzana-by-luna-retreats-29764069183	O
210	Tudus Bali Bachelorette	0.00	2023-07-14	14:00:00	\N	https://www.eventbrite.com/e/tudus-bali-bachelorette-tickets-381626504147?aff=ebdssbdestsearch	Jalan Labuansait, Kec. Kuta Sel., 0000 80361	unknown-page	O
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (address, longitude, latitude) FROM stdin;
Ariobimo Sentral, Lantai 8, South Jakarta., Setiabudi, Jakarta 12950	106.83340070	-6.22725690
Jl. H. Benyamin Suaeb, Jakarta, Indonesia, Central Jakarta, Jakarta 14410	106.84603170	-6.12917010
Jalan Daan Mogot No.63 Tj. Duren Utara, Kec. Grogol petamburan, Daerah Khusus Ibukota Jakarta 11470	106.78173140	-6.16568130
Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Kabupaten Bekasi, Jawa Barat 17530	107.17093310	-6.29405530
No.7 Jalan Arteri Pondok Indah, Kec. Kby. Lama, Daerah Khusus Ibukota Jakarta 12240	106.78170450	-6.26067970
1 Jalan Gatot Subroto, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	106.80720550	-6.21430890
Jalan Gading Serpong Boulevard, Kec. Klp. Dua, Banten 15810	106.62834780	-6.24079950
18 Jalan Haji R. Rasuna Said #Lt.11, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	106.83171610	-6.21881640
Jalan Hang Lekir I No. 6 Senayan, DKI Jakarta, 10270	106.79679680	-6.22888680
8 Jalan Professor Doktor Satrio #14, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	106.82953480	-6.22447550
Cikarang, Kec. Cikarang Utara, Jawa Barat 17530	107.14512800	-6.25533250
108 Jalan Ir. H. Juanda, Kecamatan Coblong, Jawa Barat 40132	107.61342240	-6.89248880
Lingkar Boulevard Blok WA no 1, Kec. Bekasi Utara, Jawa Barat 17142	107.01671140	-6.20699020
Jalan Haji Usmar Ismail Blok D No. 7, Mekarmukti, Kec. Cikarang Utara, Jawa Barat 17530	107.17093310	-6.29405530
55-57 Jalan Tanah Barak, Kec. Kuta Utara, Bali 80351	115.13109060	-8.65184460
No. 6 Jalan Bumi Ayu, Sanur, Bali 80228	115.26237740	-8.68993070
14 Jalan Cikajang #6, Kec. Kby. Baru, Daerah Khusus Ibukota Jakarta 12170	106.81034900	-6.24018250
See Confirmation Email for Zoom Link, Jakarta, Jakarta 10110	106.84559900	-6.20876340
Hayam Wuruk No.10, Yogyakarta, Yogyakarta 52111	110.37288840	-7.79628190
Virtual Workshop, Jakarta, Jakarta	106.84559900	-6.20876340
No.2 Jalan Subak Canggu, Kec. Kuta Utara, Bali 80361	115.13802910	-8.65255681
Online Webinar Link To Webinar In Email, Central Jakarta, Jakarta Webinar	106.82838310	-6.18051130
., Jakarta, 00000	106.84559900	-6.20876340
No 77 Jalan Raya Kuta, Kec. Kuta, Bali 80361	115.17748760	-8.73376190
Zoom Video Conference, Surabaya, East Java	112.75208830	-7.25747190
. ., Jakarta, 00000	106.84559900	-6.20876340
Zoom Video Conference, Bali, Bali	115.09195090	-8.34053890
Sopo Del Tower A 18th floor. Jl Mega Kuningan Barat III, Mega Kuningan, Jakarta 12950 Indonesia, Jakarta, 12950	106.82389120	-6.23049260
Lot N5 Itdc Tourism Complex, Nusa Dua, Nusa Dua, South Kuta, Badung Regency, Bali, 80363	115.22313080	-8.81622620
17-19 Jalan Kebon Sirih, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10340	106.83043730	-6.18491250
2500 Jalan Boulevard Palem Raya, Kec. Klp. Dua, Banten 15810	106.60570220	-6.24087441
Kav. 1 Jalan Jenderal Sudirman, Jakarta, Daerah Khusus Ibukota Jakarta 10220	106.81445290	-6.21936829
No.1 Jalan Griya Utama B, Kec. Tj. Priok, Daerah Khusus Ibukota Jakarta 14350	106.85410730	-6.14098300
No.1 Raya, Kec. Pagedangan, Banten 15339	106.63744560	-6.29821190
TBC, Jakarta, TBC	106.84559900	-6.20876340
., Kec. Kuta Sel., Bali 80363	115.15334259	-8.80632520
Jalan Bypass Ngurah Rai, Kec. Kuta, Bali 80361	115.18639190	-8.72306959
jakarta, Jakarta, Jakarta 1010110	106.84559900	-6.20876340
JIEXPO Kemayoran, Jakarta, Jakarta 10620	106.84855140	-6.16329410
Jl. BSD Grand Boulevard Raya No.1 BSD City, Tangerang, 15339	106.63624180	-6.30022610
No.17 Jalan Kemang Raya #10, Kec. Mampang Prpt., Daerah Khusus Ibukota Jakarta 12730	106.81484710	-6.25821390
Jalan Penestanan, Kecamatan Ubud, Bali 80571	115.25178650	-8.50649230
Jakarta, Indonesia, Jakarta, Jakarta 10110	106.82668730	-6.17379960
Jl. Benyamin Suaeb, RW.7, Gn. Sahari Utara, Kecamatan Sawah Besar, Jkt Utara, Kecamatan Sawah Besar, Daerah Khusus Ibukota Jakarta 10720	106.84932960	-6.14758350
Jalan Jendral sudirman kav 52-53, Kec. Kby. Baru, Daerah Khusus Ibukota Jakarta 12190	106.80971590	-6.22352890
No.52-53 Jalan Jenderal Sudirman #5, Jakarta, Daerah Khusus Ibukota Jakarta 12190	106.80757600	-6.22752130
Jakarta, Jakarta	106.84559900	-6.20876340
Apartemen Ambasador 1, Lantai 28 , unit 28 B Jln.Prof. Dr. satrio Kuningan, Jakarta Selatan, DKI Jakarta 12940	106.82787320	-6.22437420
https://zoom.us/j/9181716151, jakarta, Jakarta 10220	106.81948060	-6.20638690
Canggu Beach, Canggu, Bali 80361	115.13212650	-8.66099330
Apartemen Amartapura  Tower B , Unit 8D Jl.Sutan Syahrir #50, Lippo Karawaci, Tangerang, Banten 15810	106.61012500	-6.23325480
No.8 Jalan Pantai Berawa, Kec. Kuta Utara, Bali 80361	115.14678840	-8.66361530
Zoom link emailed & displayed after registration, Jakarta, 11110	106.81341300	-6.13212600
Zoom link emailed & displayed after registration, Medan	98.67222270	3.59519560
Zoom link emailed & displayed after registration, Palembang	104.77543070	-2.97607350
Zoom link emailed & displayed after registration, Balikpapan	116.85285260	-1.23792740
Zoom link emailed & displayed after registration, Manado	124.84207940	1.47483050
Zoom link emailed & displayed after registration, Jakarta, West Java	106.84559900	-6.20876340
Zoom link emailed & displayed after registration, Makassar	119.43592810	-5.16158280
Zoom link emailed & displayed after registration, Surabaya	112.75208830	-7.25747190
Online	\N	\N
Bali, Ubud, Bali 80571	115.26247780	-8.50685360
Komala Homestay Canggu Bali Komala Homestay Canggu Bali, Kec. Kuta Utara, Bali 80361	115.13710890	-8.64960040
Jalan BSD Green Office Park, Kec. Cisauk, Banten 15345	106.65281900	-6.30318380
Melasti Beach No 88, Kec. Kuta Sel., Bali 80361	115.16316970	-8.84829350
Jalan Kawasan Wisata Ancol, Kec. Pademangan, Daerah Khusus Ibukota Jakarta 14430	106.85781540	-6.11758360
No. 8 Jalan Pejanggik, Kec. Cakranegara, Nusa Tenggara Bar. 83231	116.12876550	-8.58695520
Jl Jendral Sudirman No.71, Jakarta, Daerah Khusus Ibukota Jakarta 12190	106.80651683	-6.22463328
Where the Orangutang lived, Penanggalan, Aceh 0000	98.05742990	2.74074080
Lot 19 No, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	106.79718670	-6.22731160
Jalan Batu Mejan Canggu, Kec. Kuta Utara, Bali 80361	115.12923390	-8.65163350
137 Jalan Raya Cibungbulang - Bogor, Kec. Dramaga, Jawa Barat 16680	106.72788920	-6.56400410
Jalan Raya Tegal Suci, Kec. Tegallalang, Bali 80561	115.31966400	-8.33702180
Jawa Tengah 51383	110.14025940	-7.15097500
Jalan Raya Ubud, Bali 80571	115.26032990	-8.50596530
Zoom link emailed & displayed after registration, Denpasar City, Bali 80117	115.21262930	-8.67045820
Jalan Monkey Forest, Kecamatan Ubud, Bali 80571	115.26077760	-8.51355150
Jalan Raya Gusti Ngurah Rai, Kec. Kuta, Bali 80362	115.16678700	-8.74671720
31 Jalan Raya Pejaten, Ps. Minggu, DKI Jakarta 12540	106.83538810	-6.28004910
No 80 Jalan Laksda Adisucipto, Sleman, Jogja 55281	110.39239810	-7.78371590
Kav.C-22A Jalan Haji R. Rasuna Said, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12940	106.83386070	-6.22375010
[ONLINE EVENT], Jakarta, Jakarta 10350	106.83111220	-6.19280220
Street Number, 283 Jl. Gatot Subroto Barat, Denpasar, Bali 80111	115.20628430	-8.63956840
No.48 Jalan L. L. R.E. Martadinata, Kec. Bandung Wetan, Jawa Barat 40115	107.61799170	-6.90637370
[ONLINE EVENT], Jakarta, Jakarta E1 1DU	106.84559900	-6.20876340
14 Jalan Laksda Adisucipto, Kec. Gondokusuman, Jogja 55221	110.38885390	-7.78338720
[ONLINE EVENT], Bandung, West Java 40115	107.61709300	-6.90348460
[ONLINE EVENT], Bandung, West Java 54600	107.61912280	-6.91746390
[ONLINE EVENT], Surabaya, East Java M5V1J9	112.75208830	-7.25747190
[ONLINE EVENT], Surabaya, East Java 54600	112.75208830	-7.25747190
Zoom link emailed & displayed after registration, Jakarta, 10350	106.83111220	-6.19280220
Kav 10-11 Jalan Jenderal Sudirman, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10220	106.81971100	-6.20902410
85-89 Jalan Embong Malang, Kec. Tegalsari, Jawa Timur 60261	112.73454840	-7.25939750
18 Jalan Gatot Subroto, Kec. Mampang Prpt., Daerah Khusus Ibukota Jakarta 12710	106.81965860	-6.23251200
No.9 Jalan Dr. GSSJ Ratulangi #15, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10350	106.83118010	-6.19001500
No.3 Jalan Sagan, Kec. Gondokusuman, Jogja 55223	110.37755410	-7.78096050
Jalan Raya Sanggingan, Kecamatan Ubud, Bali 80561	115.25318090	-8.49301640
Tirto, Bangunjiwo, Kabupaten Bantul, Kabupaten Bantul, 55184	110.33609440	-7.84193800
1 Jalan BSD Grand Boulevard, Kec. Pagedangan, Banten 15339	106.63645170	-6.30042020
Jalan Brigjen Katamso, Mergangsan, Jogja 55152	110.36983960	-7.80861880
Kajen, Bangunjiwo, Kec. Kasihan, Kabupaten Bantul, Daerah Istimewa Yogyakarta, Kab. Bantul, 5 55184	110.33313520	-7.84489130
Jl. Wijaya Timur Raya no 12, Kebayoran Baru, Daerah Khusus Ibukota Jakarta 12170	106.81548610	-6.24093300
No.79 Jalan Letjen Sutoyo, Kec. Lowokwaru, Jawa Timur 65141	112.63698000	-7.95816550
Jl. Ruko Poris Indah Blok CP IV No.18 , Kel. Cipondoh Indah, Kec Cipondoh, Tangerang, Banten 15148	106.68796890	-6.17629160
Zoom link emailed & displayed after registration, Jakarta, 10110	106.82668730	-6.17379960
5 Jalan HR Rasuna Said Kavling A5 No, Tangerang Selatan, Banten 15220	106.71940220	-6.27758060
Jl Gerilya Samarinda, Samarinda, East Kalimantan	117.17959609	-0.48078636
No.25 Jalan Jenderal Sudirman, Kecamatan Tanah Abang, Daerah Khusus Ibukota Jakarta 10270	106.80384300	-6.22467560
Jalan Raya Dukuhwaluh, Kec. Kembaran, Jawa Tengah 53182	109.27231710	-7.41132280
PQ9V+2V9, Keputih,, Sukolilo, East Java 60117	112.79473440	-7.28246250
JL. RAYA PLALANGAN PLOSOWAHYU KM 02 LAMONGAN, Kec. Lamongan, Jawa Timur 62218	112.39035000	-7.10797900
Le Meridien Jakarta, Karet Tengsin, Central Jakarta City, Jakarta, Indonesia, Tanah Abang, Jakarta	106.81822000	-6.21317000
Jalan Dr Ide Anak Agung Gde Agung Kav E.1.2 No 1&2, Kecamatan Setiabudi, Daerah Khusus Ibukota Jakarta 12950	106.82769350	-6.22852480
. ., JAKARTA, WA 00000	106.84559900	-6.20876340
2 Jalan Pantai Batu Mejan, Kec. Kuta Utara, Bali	115.12703350	-8.65398700
Jl Mulyorejo, Kec. Mulyorejo, Jawa Timur 60115	112.78153920	-7.26423430
No.35 Jalan Balap Sepeda, Kec. Pulo Gadung, Daerah Khusus Ibukota Jakarta 13220	106.89072480	-6.19160110
Banjar Batur Rening Mambal, Abiansemal, Bali 80352	115.21896310	-8.54177470
Labuan Bajo Airport, Komodo, Nusa Tenggara Tim. 86711	119.88730200	-8.48869940
1 Jalan Kartika Utama, Kec. Kby. Lama, Daerah Khusus Ibukota Jakarta 12310	106.78225160	-6.26393840
Komodo National Park Mo, Kec. Komodo, Nusa Tenggara Tim. 86711	119.48331980	-8.52771600
Rinca  Island Komodo National Park, Kec. Komodo, Nusa Tenggara Tim. 86754	119.66150550	-8.73290760
123 DREAM DESTINATION, BALI, Indonesia 00000	115.18891600	-8.40951780
Jl. Gn. Putri, Sukatani, Kec. Pacet, Kabupaten Cianjur, Jawa Barat 43253	107.02405250	-6.75115330
Jl. Soekarno Hatta Labuan Bajo, Labuan Bajo, West Manggarai Regency 8	119.87953240	-8.49330740
Loh Liang, Komodo Island Komodo Island Village, Komodo, West Manggarai Regency 86754	119.50060000	-8.56950000
Jl. Pede Kecil Dusun II, Desa Gorontalo, Labuan Bajo Kecamatan Komodo, Labuan Bajo, East Nusa Tenggara 86754	119.50065610	-8.56946090
112345 tj street, uber, Bali 80571	115.24819590	-8.51640720
Jalan A.A. Gede Rai, Ubud, Bali 80571	115.26205190	-8.54819100
Bali, Bali, Bali 80361	115.16520080	-8.79534310
DREAM DESTINATION, BALI, Indonesia 00000	115.18891600	-8.40951780
Bali, Bali, Bali 99999	115.18891600	-8.40951780
Bali, Seminyak, Bali 80361	115.16816530	-8.69128940
No.10A Jalan Cikini Raya #13, Kec. Menteng, Daerah Khusus Ibukota Jakarta 10330	106.83701200	-6.18860190
No. 2A Jalan Damai PBSI, Daerah Khusus Ibukota Jakarta 13840	106.89219080	-6.33591070
Jalan BSD Raya Utama #Lt. 1, Kec. Pagedangan, Banten 15331	106.63984910	-6.29099870
Meeting point will be informed after registration., Tampaksiring, Bali	115.31042770	-8.43900820
Jalan Labuansait, Kec. Kuta Sel., 0000 80361	115.11246770	-8.81645300
\.


--
-- Data for Name: organizer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizer (name, total_followers, organizer_page) FROM stdin;
BLOCK71 Jakarta	2200	https://www.eventbrite.com/o/block71-jakarta-13293943731
Naganaya in collaboration with Ministry of Industry and WANTRII	37	https://www.eventbrite.com/o/naganaya-in-collaboration-with-ministry-of-industry-and-wantrii-67064487093
Kwet Liung / 082260779360	1300	https://www.eventbrite.com/o/kwet-liung-082260779360-23215568323
TPMI GROUP	299	https://www.eventbrite.sg/o/tpmi-group-37828346723
Hacktiv8 Indonesia	26	https://www.eventbrite.com/o/hacktiv8-indonesia-61105252423
PT. Halal Expo Indonesia	102	https://www.eventbrite.com/o/pt-halal-expo-indonesia-59988449143
Skystar Ventures UMN	26	https://www.eventbrite.com/o/skystar-ventures-umn-59202475573
Green Drinks Jakarta	24	https://www.eventbrite.com/o/green-drinks-jakarta-23204690709
BINUS BUSINESS SCHOOL	604	https://www.eventbrite.com/o/binus-business-school-8532663450
OffChain Global	642	https://www.eventbrite.hk/o/offchain-global-55459859373
TPMI GROUP	27	https://www.eventbrite.sg/o/tpmi-group-62432095763
HidupforCompany	0	https://www.eventbrite.com/o/hidupforcompany-51117755933
TPMI GROUP	631	https://www.eventbrite.sg/o/tpmi-group-28741132401
Accelerating Asia	522	https://www.eventbrite.com/o/accelerating-asia-20194512938
Livit Hub Bali	53	https://www.eventbrite.com/o/livit-hub-bali-18136240183
Coinstore.com	128	https://www.eventbrite.com/o/coinstorecom-56909466083
Career Bliss Academy	5100	https://www.eventbrite.com/o/career-bliss-academy-34346634153
Karya Bintang Abadi	0	https://www.eventbrite.com/o/karya-bintang-abadi-67625033643
Atechup.com	19700	https://www.eventbrite.com/o/atechupcom-15646132597
Scholars of Sustenance (SOS) - Indonesia	0	https://www.eventbrite.com/o/scholars-of-sustenance-sos-indonesia-67674960703
Coach Michael Lin	5600	https://www.eventbrite.com/o/coach-michael-lin-30392569100
Kat Usop, MSHI	12500	https://www.eventbrite.com/o/kat-usop-mshi-17526467445
Erudite Training	1000	https://www.eventbrite.com/o/erudite-training-10016177864
CQUniversity, Indonesia office	0	https://www.eventbrite.com.au/o/cquniversity-indonesia-office-66836250543
Hustle Fund VC	21	https://www.eventbrite.com/o/hustle-fund-vc-28736780147
QS TopUniversities	1900	https://www.eventbrite.co.uk/o/qs-topuniversities-2916031327
Faria Education Group	1000	https://www.eventbrite.com/o/faria-education-group-18083812742
Global Ports Forum Pte Ltd	437	https://www.eventbrite.sg/o/global-ports-forum-pte-ltd-10929257995
APEX International	0	https://www.eventbrite.com/o/apex-international-67767040783
Enyimba Economic City	0	https://www.eventbrite.com/o/enyimba-economic-city-68293450033
DealStreetAsia	1600	https://www.eventbrite.sg/o/dealstreetasia-13071268842
SOCIAL SCIENCE AND HUMANITIES RESEARCH ASSOCIATION	788	https://www.eventbrite.com/o/social-science-and-humanities-research-association-16308691268
APOG	85	https://www.eventbrite.com/o/apog-25234917507
Life Impact Ministries	0	https://www.eventbrite.com/o/life-impact-ministries-64882005923
RX	86	https://www.eventbrite.com/o/rx-44705089303
Clarion Events	0	https://www.eventbrite.com/o/clarion-events-66124090073
Ramuraga and Denyut Bumi	13	https://www.eventbrite.com/o/ramuraga-and-denyut-bumi-66278634363
ROYALINDO EXPO DUTA	10	https://www.eventbrite.com/o/royalindo-expo-duta-66894132903
Outpost Bali	0	https://www.eventbrite.com/o/outpost-bali-64931771863
TIIKM Conferences	207	https://www.eventbrite.com/o/tiikm-conferences-17149949138
Adhouse Clarion Events	135	https://www.eventbrite.com/o/adhouse-clarion-events-59094494963
Tradepass	140	https://www.eventbrite.com/o/tradepass-60212244823
Vertex Ventures Southeast Asia & India	62	https://www.eventbrite.com/o/vertex-ventures-southeast-asia-india-51921049903
Noelle Lim	2900	https://www.eventbrite.sg/o/noelle-lim-30099465638
Jakarta Meditation	373	https://www.eventbrite.com/o/jakarta-meditation-12763156045
Free Meditation	1600	https://www.eventbrite.com.au/o/free-meditation-32468869169
BPM method	10	https://www.eventbrite.co.uk/o/bpm-method-61895777633
Tangerang Meditation	230	https://www.eventbrite.com/o/tangerang-meditation-9002363495
Nirvana Health and Lifestyle Complex	0	https://www.eventbrite.com/o/nirvana-health-and-lifestyle-complex-65269892253
Eurasia Research	308	https://www.eventbrite.com/o/eurasia-research-16310610610
Free Guided Meditation	284	https://www.eventbrite.com.au/o/free-guided-meditation-61347194243
Change Life with Free Guided Meditation	124	https://www.eventbrite.com.au/o/change-life-with-free-guided-meditation-61289392443
Omnia Network	16	https://www.eventbrite.com/o/omnia-network-68186577123
YogiTherapi	265	https://www.eventbrite.com/o/yogitherapi-38512260843
Lesia S | Mindset & Energy mentor	51	https://www.eventbrite.co.uk/o/lesia-s-mindset-energy-mentor-59304706213
eventbrite	40	https://www.eventbrite.com/o/eventbrite-67073781703
Tropical Temptation Beach Club	37	https://www.eventbrite.com/o/tropical-temptation-beach-club-58737362413
MOA Indonesia	11	https://www.eventbrite.sg/o/moa-indonesia-68007703713
unknown	0	unknown-page
MiPOWER	773	https://www.eventbrite.com/o/mipower-20176162377
ENDOTA	69	https://www.eventbrite.com/o/endota-32134651911
Indonesian Diaspora Network (IDN) Global	0	https://www.eventbrite.com/o/indonesian-diaspora-network-idn-global-68152661363
Indonesia Bitcoin Community	52	https://www.eventbrite.com/o/indonesia-bitcoin-community-33116404407
Himateta	13	https://www.eventbrite.com/o/himateta-62332876053
Rumah Tani	0	https://www.eventbrite.sg/o/rumah-tani-68454056463
Unnamed Organizer	0	https://www.eventbrite.com/o/unnamed-organizer-25485610157
Vasiliki Areti	0	https://www.eventbrite.com/o/vasiliki-areti-67851326683
Social Meditation for Peace & Joy	17	https://www.eventbrite.ca/o/social-meditation-for-peace-joy-67546215753
Belle Wine Bar & Grazing Boards	0	https://www.eventbrite.com/o/belle-wine-bar-grazing-boards-68008297843
Tracye Hamler	44	https://www.eventbrite.com/o/tracye-hamler-10977260678
StageID	82	https://www.eventbrite.com/o/stageid-18713881565
CIE Central International Education Yogyakarta	20	https://www.eventbrite.com.au/o/cie-central-international-education-yogyakarta-31416952941
AUG Student Services	983	https://www.eventbrite.com/o/aug-student-services-16456092907
Iris Reading	2300	https://www.eventbrite.com/o/iris-reading-58158045383
The Extensive Reading Foundation	181	https://www.eventbrite.com/o/the-extensive-reading-foundation-861429087
Goethe-Institut Indonesien	1700	https://www.eventbrite.com/o/goethe-institut-indonesien-24215795241
Public Gold Indonesia	103	https://www.eventbrite.hk/o/public-gold-indonesia-29089848445
Free Education Course for Empowerment	115	https://www.eventbrite.com.au/o/free-education-course-for-empowerment-60552630963
Begin Group	759	https://www.eventbrite.co.uk/o/begin-group-18297097356
KM Universe	169	https://www.eventbrite.fr/o/km-universe-44787925123
Institut français Yogyakarta	156	https://www.eventbrite.com/o/institut-francais-yogyakarta-48967508833
Room4Dessert	0	https://www.eventbrite.com/o/room4dessert-65332849893
Nonton Bareng Indonesia	0	https://www.eventbrite.com/o/nonton-bareng-indonesia-67384300223
TG Expo	30	https://www.eventbrite.com/o/tg-expo-65910817543
Panorama Media (Panorama Masa Kini)	0	https://www.eventbrite.sg/o/panorama-media-panorama-masa-kini-18440113510
Mandira Baruga (Purawisata) Yogyakarta	317	https://www.eventbrite.com/o/mandira-baruga-purawisata-yogyakarta-8493506255
Nonton Bareng Indonesia	0	https://www.eventbrite.com/o/nonton-bareng-indonesia-67388962633
Tim AI	99	https://www.eventbrite.com/o/tim-ai-60145923803
Phillip Futures	359	https://www.eventbrite.com/o/phillip-futures-29228707703
Generasi BTS	11	https://www.eventbrite.com/o/generasi-bts-67513518463
Kundalini Awakening Through Meditation	330	https://www.eventbrite.com.au/o/kundalini-awakening-through-meditation-61285052273
Generasi Muda Berdoa	17	https://www.eventbrite.com/o/generasi-muda-berdoa-66633903963
KelIR x ACS	0	https://www.eventbrite.com/o/kelir-x-acs-68597322353
Spiritual Awakening Just Not Alone Meditation	138	https://www.eventbrite.com.au/o/spiritual-awakening-just-not-alone-meditation-61314124363
Moksha and Meditation	11	https://www.eventbrite.ca/o/moksha-and-meditation-68072081223
DevOps Indonesia	589	https://www.eventbrite.com/o/devops-indonesia-28693559707
PT. Solusi Tangkas Bijaksana	0	https://www.eventbrite.com/o/pt-solusi-tangkas-bijaksana-68206042433
Agus Suparno (Leader of Microsoft User Group Indonesia (Mugi) Purwokerto)	349	https://www.eventbrite.com/o/agus-suparno-leader-of-microsoft-user-group-indonesia-mugi-purwokerto-10608154898
The Worldwide Ferry Safety Association	46	https://www.eventbrite.com/o/the-worldwide-ferry-safety-association-37719852543
Lamongan Dev	25	https://www.eventbrite.com/o/lamongan-dev-55731064613
Scribe Minds & Media	0	https://www.eventbrite.com/o/scribe-minds-media-68457732013
PT. Prodata Sistem Teknologi	11	https://www.eventbrite.com/o/pt-prodata-sistem-teknologi-51109971823
OpenGov Asia	1900	https://www.eventbrite.sg/o/opengov-asia-9779221701
SCIENTIFIC AND TECHNICAL RESEARCH ASSOCIATION	672	https://www.eventbrite.com/o/scientific-and-technical-research-association-16309849318
Healthcare & Biological Sciences Research Association	645	https://www.eventbrite.com/o/healthcare-biological-sciences-research-association-16308507994
Cosmoverse | The Annual Conference of the Cosmos Ecosystem  ⚛️	120	https://www.eventbrite.com/o/cosmoverse-the-annual-conference-of-the-cosmos-ecosystem-62335786283
LIPJPHKI Universitas Airlangga	121	https://www.eventbrite.com/o/lipjphki-universitas-airlangga-57195071423
BAMBU SPORT CLUB	0	https://www.eventbrite.com/o/bambu-sport-club-67380826073
Les Étoiles	0	https://www.eventbrite.com/o/les-etoiles-67647811983
Meditate to Regenerate	134	https://www.eventbrite.com.au/o/meditate-to-regenerate-33712455763
Doyan Jalan	0	https://www.eventbrite.sg/o/doyan-jalan-18070274634
ASITA Pariwisata	0	https://www.eventbrite.com/o/asita-pariwisata-66896761173
YOHANES ROMUALDUS (PT. KOMODO MAS WISATA)	31	https://www.eventbrite.com/o/yohanes-romualdus-pt-komodo-mas-wisata-9890066219
JaWanaTravel.com	153	https://www.eventbrite.com/o/jawanatravelcom-17209870673
Panitia Pendakian Umum STAPALA 2023	0	https://www.eventbrite.com/o/panitia-pendakian-umum-stapala-2023-68059292323
Jewel Princess Johnson	364	https://www.eventbrite.com/o/jewel-princess-johnson-27986822939
Euphoric Travel Destinations LLC	0	https://www.eventbrite.com/o/euphoric-travel-destinations-llc-58586644723
Touch of Royalty Events & Travel LLC	197	https://www.eventbrite.com/o/touch-of-royalty-events-travel-llc-57175304013
Travel in Tranquility	0	https://www.eventbrite.com/o/travel-in-tranquility-59843491493
The Alumni Group	6400	https://www.eventbrite.com/o/the-alumni-group-10693880808
Forum Kajian Pembangunan dengan tuan rumah Lembaga Penelitian SMERU	0	https://www.eventbrite.com/o/forum-kajian-pembangunan-dengan-tuan-rumah-lembaga-penelitian-smeru-15305978067
Azila Villa	0	https://www.eventbrite.com/o/azila-villa-20065974423
DMA duomamaarmy	0	https://www.eventbrite.com/o/dma-duomamaarmy-67014328423
Suzana by Luna Retreats	0	https://www.eventbrite.co.uk/o/suzana-by-luna-retreats-29764069183
\.


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id_event);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (address);


--
-- Name: organizer organizer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizer
    ADD CONSTRAINT organizer_pkey PRIMARY KEY (organizer_page);


--
-- Name: event fk_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT fk_address FOREIGN KEY (address) REFERENCES public.location(address);


--
-- Name: event fk_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT fk_category FOREIGN KEY (category) REFERENCES public.category(id_category);


--
-- Name: event fk_organizerpage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT fk_organizerpage FOREIGN KEY (organizer) REFERENCES public.organizer(organizer_page);


--
-- PostgreSQL database dump complete
--

