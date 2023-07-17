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
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    hotel_id integer NOT NULL,
    hotel_name character varying(59) NOT NULL,
    address character varying(109) NOT NULL,
    point numeric(3,1)
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- Name: hotels_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotels_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotels_hotel_id_seq OWNER TO postgres;

--
-- Name: hotels_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotels_hotel_id_seq OWNED BY public.hotels.hotel_id;


--
-- Name: id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id OWNER TO postgres;

--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    hotel_id integer NOT NULL,
    price integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    hotel_id integer NOT NULL,
    review numeric(3,1) NOT NULL,
    location numeric(3,1) NOT NULL,
    cleanliness numeric(3,1) NOT NULL,
    service numeric(3,1) NOT NULL,
    value numeric(3,1) NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: hotels hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotels_hotel_id_seq'::regclass);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (hotel_id, hotel_name, address, point) FROM stdin;
1	The Papandayan	Jl. Gatot Subroto 83, Bandung 40262 Indonesia	66.0
2	The Gaia Hotel Bandung	No. 430 Jl. Dr. Setiabudi, Bandung 40143 Indonesia	45.0
3	Janevalla Bandung	Jalan Aceh No. 65, Jawa Barat, Bandung 40115 Indonesia	57.0
4	Grand Tjokro Premiere Bandung	Jl. Cihampelas no. 211-217, Bandung 40131 Indonesia	69.0
5	Swiss-Belresort Dago Heritage	Lapangan Golf Dago Atas No. 78 Dago Heritage Golf Complex, Bandung 40135 Indonesia	69.0
6	Hotel Savoy Homann	Jl. Asia Afrika, No. 112, Bandung 40261 Indonesia	76.0
7	Belviu Hotel	Jl. Dr Setiabudhi no. 35 Sukajadi, Bandung 40161 Indonesia	74.0
8	Shakti Hotel Bandung	Jl. Soekarno Hatta No. 735 Gede Bage, Bandung 40294 Indonesia	82.0
9	The Trans Luxury Hotel	Jl. Jenderal Gatot Subroto no. 289, Bandung 40273 Indonesia	36.0
10	HARRIS Hotel & Conventions Festival CityLink	Jl. Peta no. 241 Kopo, Bandung 40323 Indonesia	74.0
11	de JAVA Hotel	Jl. Sukajadi no. 148-150, Bandung 40161 Indonesia	88.0
12	THE 1O1 Bandung Dago	Jl. Ir H Djuanda no. 3 Dago Bawah, Bandung 40115 Indonesia	65.0
13	Tebu Hotel Bandung	Jl. L.L.R.E Martadinata no. 62, Bandung 40115 Indonesia	83.0
14	The Cherry Homes Hotel and Residence	Jl. Babakan Jeruk IV No.37-39, Bandung 40163 Indonesia	83.0
15	Vue Palace Hotel	Jalan Otto Iskandar Dinata No 3, Bandung 40117 Indonesia	74.0
16	Hotel Daily Inn Bandung	Jalan. Dalem Kaum No.36 Kec. Regol Kel. Balonggede. Alun-alun Kota Bandung, Bandung 40251 Indonesia	92.0
17	The Jayakarta Suites Bandung, Boutique Suites, Hotel & Spa	Jl. Ir. H Juanda no. 381A, Bandung 40135 Indonesia	55.0
18	Fabu Hotel Bandung	Jl. Kebon Jati no. 32, Bandung 40181 Indonesia	77.0
19	West Point Hotel Bandung	Jln. Garuda No. 63 Near from Husein Sastranegara International Airport, Bandung 40183 Indonesia	76.0
20	Collection O 25 Hotel Baltika	No. 42, Jl Gatot Subroto, Bandung 40262 Indonesia	78.0
21	Grand Sovia Hotel	Jl. Kebon Kawung no. 16, Bandung 40171 Indonesia	71.0
22	Meize Hotel	Jl. Sumbawa no. 7, Bandung 40113 Indonesia	73.0
54	Atlantic City Hotel	Jl. Pasirkaliki no. 126, Bandung 40171 Indonesia	74.0
23	Clove Garden Hotel & Residence	Jl. Awiligar Raya II 2 Cimenyan, Bandung 40191 Indonesia	88.0
24	Grand Asrilia Hotel Convention & Restaurant	Jl. Pelajar Pejuang 45 no. 108A Lengkong, Bandung 40264 Indonesia	65.0
25	Kedaton Hotel	Jl. Suniaraja no. 14, Bandung 40111 Indonesia	69.0
26	HOUSE Sangkuriang - Bandung	Jln. Sangkuriang No. 1, Dago, Bandung 40135 Indonesia	71.0
27	Maison Teraskita Bandung by The Gala Hotels Group	55 Jalan Asia Afrika, Bandung 40251 Indonesia	81.0
28	Kytos Hotel	Jl. Setiabudhi no. 153, Bandung 40153 Indonesia	67.0
29	Collection O 22 Hotel Pasar Baru Heritage	No. 84-92, Jl Otto Iskandar Dinata, Bandung 40181 Indonesia	81.0
30	POP! Hotel Festival Citylink	Pasir Koja Jln. Peta 241, Bandung 40323 Indonesia	80.0
31	YELLO Hotel Paskal	Jl. Pasir Kaliki No.25 Komplek Paskal Hyper Square, Bandung 40181 Indonesia	71.0
32	Hotel ibis Bandung Trans Studio	Jl. Sumatra no. 51 Kelurahan Citarum, Bandung 40115 Indonesia	82.0
33	Serela Waringin Bandung	Jl Kelenteng No 30-31, Bandung 40181 Indonesia	89.0
34	HARRIS Hotel & Conventions Ciumbuleuit	Jl. Ciumbuleuit no. 50-58, Bandung 40141 Indonesia	73.0
35	Grand Tebu Hotel	LLRE Martadinata St. no. 207, Bandung 40115 Indonesia	72.0
36	Sukajadi Hotel	Jl. Sukajadi no. 176, Bandung 40161 Indonesia	80.0
37	Grand Hotel Preanger	Jln. Asia Afrika 81, Bandung 40111 Indonesia	60.0
38	Puteri Gunung Hotel	Jl. Raya Tangkuban Perahu Km. 16-17, Bandung Indonesia	75.0
39	The Luxton Bandung Hotel	Jln. Ir. H Juanda No. 18, Bandung 40115 Indonesia	57.0
40	Kimaya Braga Bandung By Harris	Jln. Braga 8, Bandung 40111 Indonesia	65.0
41	Sari Ater Hot Springs Ciater	Jl. Raya Ciater Subang, Bandung 41281 Indonesia	62.0
42	Amaroossa Bandung	Jl. Aceh no. 71A, Bandung 40115 Indonesia	77.0
43	Hotel Promenade Cihampelas	Jl. Cihampelas No. 119 - 121, Bandung 40131 Indonesia	73.0
44	Yokotel Hotel	Jl. Kebon Jati No.17 & 19, Bandung 40181 Indonesia	83.0
45	favehotel Hyper Square	Jl. Pasirkaliki no. 25-27 Paskal Hyper Square, Bandung 40181 Indonesia	84.0
46	Ivory Hotel Bandung	Jl. Bahureksa no. 3, Bandung 40115 Indonesia	71.0
47	Grand Viveana Hotel	Jl. Pajajaran no. 73 Ciceando, Bandung 40172 Indonesia	76.0
48	De'Rain Hotel Bandung	Jl. Lengkong Kecil 76-80, Bandung 40261 Indonesia	72.0
49	Verona Palace Hotel	Jl. Surya Sumantri No.36, Bandung 40164 Indonesia	79.0
50	The Cipaku Garden Hotel	Jl. Cipaku Indah X No.2-4, Bandung 40143 Indonesia	71.0
51	Favehotel Braga	Jl. Braga no. 99-101 Braga City Walk Entertainment Complex, Bandung 40111 Indonesia	65.0
52	Park View Hotel Bandung	Jl. Sukajadi no. 153, Bandung 40162 Indonesia	84.0
53	Lembang Asri	Km 4 Jl Kolonel Masturi Lembang, Bandung Indonesia	66.0
55	Yokotel City	Jl. Dr. Rajiman No.3 Pasir Kaliki, Cicendo, Bandung 40171 Indonesia	86.0
56	Cihampelas Hotel 2 RedPartner	Jl. Cihampelas No. 222, Coblong, Bandung 40131 Indonesia	81.0
57	OYO 342 De'kayakini Hotel	Jl. Cipamokolan Komp. Rancaloa Regency Ii No.7 Cipamokolan, Rancasari, Riung Bandung, Bandung 40292 Indonesia	80.0
58	Travello Hotel Bandung	Jl. Dr Setiabudhi no. 268, Bandung 40143 Indonesia	75.0
59	ibis Styles Bandung Grand Central	Jl. Diponegoro 27, Bandung 40115 Indonesia	43.0
60	Grand Dafam Braga Bandung	Jalan Braga No. 99-101, Bandung 40111 Indonesia	75.0
61	Gino Feruci Braga Hotel	Jln. Braga no. 67, Bandung 40111 Indonesia	75.0
62	Serela Cihampelas Hotel Bandung	Jl. Cihampelas no. 147, Bandung 40131 Indonesia	81.0
63	Zest Hotel Sukajadi	Jl. Sukajadi no. 16, Bandung 40161 Indonesia	71.0
64	Hilton Bandung	H.O.S. Tjokroaminoto no 41 - 43, Bandung 40172 Indonesia	30.0
65	ASTON Pasteur	Jl. Dr. Djundjunan no. 162, Bandung 40162 Indonesia	65.0
66	Panen Hotel Bandung	100 Jalan L. L. R.E. Martadinata, Bandung 40113 Indonesia	95.0
67	GH Universal Hotel	Jl. Dr Setiabudhi 376, Bandung 40143 Indonesia	75.0
68	Arion Suites Hotel	Jl. Otto Iskandardinata No. 16 Bandung City Center, Bandung 40171 Indonesia	87.0
69	Gumilang Regency Hotel	Jl. Setiabudi no. 323-325, Bandung 40154 Indonesia	63.0
70	Hotel Santika Pasir Koja	Jl. Peta No.176, Bandung 40231 Indonesia	78.0
71	Art Deco Luxury Hotel & Residence	Jl. Rancabentang No. 2, Bandung 40142 Indonesia	45.0
72	Kollektiv Hotel	Jl. Prof. Insinyur Doktor Sutami No. 62, Bandung 40152 Indonesia	76.0
73	Horison Green Forest Resort	Jl. Sersan Bajuri No.102 Cihideung, Bandung 40559 Indonesia	57.0
74	Sandalwood Boutique Hotel	Jalan Seskoau No 1, Bandung 40791 Indonesia	57.0
75	Oasis Siliwangi Hotel Bandung	Jl. Lombok No.10, Bandung 40113 Indonesia	65.0
76	PRIME PARK Hotel Bandung	Jl. P.H.H. Mustofa no. 47/57, Bandung 40124 Indonesia	71.0
77	Hotel Citradream Bandung	Jl. Pasirkaliki no. 36-42, Bandung 40171 Indonesia	78.0
78	V Hotel & Residence	Jl. Terusan Sutami III Terusan Setrawangi Raya, Bandung Indonesia	80.0
79	The Silk At Dago	Jl. Ir. H.Djuanda No.392 - 394, Bandung 40135 Indonesia	69.0
80	Nindya Biodistrict Hotel	Jl. Phh. Mustofa, No. 57 Perempatan Cikutra, Bandung 40124 Indonesia	97.0
81	Vio Cihampelas Hotel	Jl. Cihampelas no. 108, Bandung 40116 Indonesia	73.0
82	Bali World Hotel	Jl. Soekarno-Hatta no. 713 By-Pass Timur, Bandung 40286 Indonesia	66.0
83	HAY Bandung	Jl. Trunojoyo no. 19, Bandung 40115 Indonesia	62.0
84	De Batara Hotel	Jl. Cihampelas no. 112, Bandung 40116 Indonesia	74.0
85	Grand Aquila Hotel Bandung	Jl. DR Djundjunan 116, Bandung 40163 Indonesia	50.0
86	Green Batara Hotel	Jln. Cihampelas no 145, Bandung 40131 Indonesia	74.0
87	Vio Hotel Pasteur	Jl. Dr Jungjunan no. 154 Pasteur, Bandung 40163 Indonesia	66.0
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (hotel_id, price, date) FROM stdin;
1	661922	2023-07-17
2	1110455	2023-07-17
3	758694	2023-07-17
4	505393	2023-07-17
5	619111	2023-07-17
6	272805	2023-07-17
7	519328	2023-07-17
8	249041	2023-07-17
9	1182664	2023-07-17
10	401525	2023-07-17
11	136845	2023-07-17
12	496698	2023-07-17
13	238969	2023-07-17
14	125272	2023-07-17
15	402488	2023-07-17
16	143153	2023-07-17
17	588182	2023-07-17
18	145947	2023-07-17
19	364042	2023-07-17
20	34251	2023-07-17
21	260706	2023-07-17
22	231667	2023-07-17
23	122341	2023-07-17
24	297652	2023-07-17
25	301421	2023-07-17
26	363363	2023-07-17
27	165634	2023-07-17
28	344586	2023-07-17
29	79766	2023-07-17
30	190300	2023-07-17
31	475802	2023-07-17
32	247934	2023-07-17
33	102644	2023-07-17
34	427213	2023-07-17
35	444136	2023-07-17
36	82785	2023-07-17
37	596018	2023-07-17
38	383218	2023-07-17
39	640085	2023-07-17
40	497245	2023-07-17
41	549276	2023-07-17
42	347683	2023-07-17
43	225048	2023-07-17
44	126025	2023-07-17
45	117271	2023-07-17
46	476388	2023-07-17
47	273017	2023-07-17
48	254989	2023-07-17
49	218500	2023-07-17
50	370513	2023-07-17
51	396001	2023-07-17
52	102454	2023-07-17
53	462289	2023-07-17
54	307323	2023-07-17
55	270816	2023-07-17
56	61053	2023-07-17
57	97517	2023-07-17
58	489395	2023-07-17
59	1157025	2023-07-17
60	494886	2023-07-17
61	383881	2023-07-17
62	276930	2023-07-17
63	360857	2023-07-17
64	1300000	2023-07-17
65	597417	2023-07-17
66	92107	2023-07-17
67	484468	2023-07-17
68	257607	2023-07-17
69	439939	2023-07-17
70	435168	2023-07-17
71	881381	2023-07-17
72	378746	2023-07-17
73	654874	2023-07-17
74	747358	2023-07-17
75	495014	2023-07-17
76	375879	2023-07-17
77	233209	2023-07-17
78	184157	2023-07-17
79	306053	2023-07-17
80	55321	2023-07-17
81	223275	2023-07-17
82	260991	2023-07-17
83	552251	2023-07-17
84	214904	2023-07-17
85	685736	2023-07-17
86	217762	2023-07-17
87	369427	2023-07-17
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (hotel_id, review, location, cleanliness, service, value) FROM stdin;
1	5.0	4.5	4.5	4.7	4.6
2	5.0	4.9	4.8	4.9	4.9
3	4.5	4.7	4.6	4.6	4.5
4	4.5	4.5	4.4	4.4	4.4
5	5.0	4.8	4.3	4.6	4.6
6	4.0	4.3	4.0	4.1	3.9
7	5.0	4.9	4.6	4.7	4.8
8	4.5	4.2	4.0	4.3	4.3
9	4.5	4.3	4.7	4.6	4.4
10	4.5	4.3	4.3	4.3	4.3
11	4.5	4.8	4.1	4.5	4.5
12	4.0	4.4	3.9	3.9	3.8
13	4.5	4.4	4.0	3.9	4.3
14	4.0	3.6	4.2	4.2	4.1
15	4.5	4.8	4.7	4.7	0.0
16	5.0	5.0	5.0	0.0	0.0
17	3.5	3.8	3.8	3.8	3.8
18	3.5	4.0	3.7	4.0	3.6
19	4.5	4.2	4.4	4.4	4.0
20	3.0	4.0	3.3	3.3	3.8
21	3.5	4.3	3.8	3.6	3.6
22	3.5	4.2	3.9	3.8	3.8
23	4.5	3.2	3.5	3.5	3.8
24	3.0	4.2	3.6	3.5	3.4
25	3.5	4.2	3.4	3.9	3.8
26	4.0	4.3	3.9	4.1	3.8
27	4.0	0.0	0.0	0.0	0.0
28	3.5	4.5	4.4	4.1	4.0
29	3.5	0.0	0.0	0.0	0.0
30	4.0	4.1	3.8	3.9	4.1
31	4.5	4.7	4.4	4.5	4.4
32	4.5	4.4	4.1	4.1	4.1
33	4.5	4.3	3.9	4.2	4.4
34	4.5	4.4	4.3	4.4	4.3
35	4.5	4.5	4.1	4.0	4.1
36	3.5	4.0	3.6	3.7	3.5
37	4.0	4.3	4.1	4.3	4.0
38	4.5	4.0	3.5	3.9	3.4
39	4.0	4.6	4.1	4.2	4.1
40	4.0	4.5	4.1	4.0	4.1
41	4.0	3.9	3.4	3.7	3.4
42	4.5	4.2	4.1	4.1	4.0
43	3.5	4.5	3.1	3.4	3.4
44	4.0	4.0	3.6	4.2	3.3
45	4.0	4.3	3.9	4.0	3.9
46	4.5	4.4	4.4	4.3	4.4
47	4.0	4.0	5.0	4.0	3.5
48	3.5	4.1	3.9	3.7	3.8
49	4.0	3.6	4.3	4.0	4.1
50	4.0	3.3	3.7	3.6	3.7
51	3.5	4.4	3.7	3.8	3.7
52	4.0	4.6	4.4	4.3	4.3
53	4.0	3.8	3.9	3.9	4.0
54	4.0	4.3	4.4	4.1	3.6
55	5.0	0.0	0.0	0.0	0.0
56	3.5	4.1	3.0	3.8	3.7
57	3.5	2.0	3.0	0.0	0.0
58	5.0	4.7	4.3	4.7	4.8
59	5.0	5.0	4.4	4.9	4.9
60	5.0	4.9	4.1	4.9	4.8
61	4.5	4.5	4.0	4.1	4.0
62	4.5	4.9	4.3	4.5	4.5
63	4.0	4.3	4.3	4.3	4.2
64	4.5	4.3	4.5	4.5	4.3
65	4.5	4.4	4.3	4.3	4.2
66	5.0	4.9	5.0	4.9	4.9
67	5.0	4.6	3.9	4.6	4.6
68	5.0	5.0	5.0	4.9	0.0
69	3.5	3.6	3.7	3.7	3.5
70	5.0	4.8	4.9	4.9	0.0
71	4.0	4.1	4.1	4.1	3.9
72	4.5	4.0	4.8	4.3	4.3
73	4.0	4.0	3.3	3.7	3.9
74	4.5	4.2	4.4	4.3	4.1
75	4.0	3.8	3.7	3.2	3.5
76	4.0	3.9	4.2	4.2	4.3
77	4.0	4.4	4.1	4.0	4.0
78	4.0	3.4	3.9	3.6	3.7
79	3.5	3.9	3.8	3.7	3.4
80	5.0	0.0	0.0	0.0	0.0
81	3.5	4.3	3.4	3.3	3.3
82	3.0	2.9	3.4	3.2	3.0
83	4.0	5.0	4.2	4.0	4.3
84	3.5	4.4	3.9	3.9	3.6
85	3.5	3.9	3.3	3.7	3.2
86	3.5	4.5	3.7	3.7	4.1
87	3.5	3.7	3.4	3.3	3.3
\.


--
-- Name: hotels_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_hotel_id_seq', 87, true);


--
-- Name: id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id', 1, false);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);


--
-- Name: prices id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT id_pkey PRIMARY KEY (hotel_id, date);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (hotel_id);


--
-- Name: prices hotel_price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT hotel_price FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id);


--
-- Name: reviews hotel_reviews; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT hotel_reviews FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id);


--
-- PostgreSQL database dump complete
--

