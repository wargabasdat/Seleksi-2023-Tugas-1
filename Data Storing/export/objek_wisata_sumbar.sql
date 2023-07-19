--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-13 00:22:27

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
-- TOC entry 214 (class 1259 OID 24799)
-- Name: daerah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daerah (
    nama_daerah character varying(100) NOT NULL,
    jumlah_objek_sedaerah integer
);


ALTER TABLE public.daerah OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24819)
-- Name: jenis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jenis (
    peringkat integer NOT NULL,
    nama_jenis character varying(100) NOT NULL
);


ALTER TABLE public.jenis OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24804)
-- Name: objek_wisata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.objek_wisata (
    peringkat integer NOT NULL,
    nama_objek character varying(100) NOT NULL,
    nama_daerah character varying(50) NOT NULL,
    rata_rata_rating double precision,
    jumlah_rating_5 integer,
    jumlah_rating_4 integer,
    jumlah_rating_3 integer,
    jumlah_rating_2 integer,
    jumlah_rating_1 integer,
    jumlah_ulasan integer,
    nama_pengelola character varying(50),
    kode_operasional character(10)
);


ALTER TABLE public.objek_wisata OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24829)
-- Name: operasional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operasional (
    kode_operasional character(10) NOT NULL,
    jam_buka time without time zone,
    jam_tutup time without time zone,
    hari_operasional character varying(50)
);


ALTER TABLE public.operasional OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24814)
-- Name: pengelola; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengelola (
    nama_pengelola character varying(50) NOT NULL,
    kontak_pengelola character varying(12) NOT NULL
);


ALTER TABLE public.pengelola OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24856)
-- Name: ulasan_teratas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulasan_teratas (
    peringkat integer NOT NULL,
    nama_akun_pengunjung character varying(100) NOT NULL,
    asal_pengunjung character varying(50),
    rating_pengunjung double precision,
    waktu_berkunjung character varying(20),
    tipe_kunjungan character varying(20)
);


ALTER TABLE public.ulasan_teratas OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 24799)
-- Dependencies: 214
-- Data for Name: daerah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daerah (nama_daerah, jumlah_objek_sedaerah) FROM stdin;
Bukittinggi	32
Padang	55
Payakumbuh	8
Mandeh	1
Solok	10
Painan	4
West Sumatra	2
Batusangkar	3
Bungus	1
Palupuh	2
Pariaman	10
Sawahlunto	12
Padang Pariaman	2
Padang Panjang	4
Siberut	5
Agam	8
Maninjau	1
South Pesisir	3
Nagari Sungai Pinang	1
Pagai Utara	2
Bonjol	1
Silabu	0
Kepulauan Mentawai	0
Muarasiberut	0
\.


--
-- TOC entry 3354 (class 0 OID 24819)
-- Dependencies: 217
-- Data for Name: jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jenis (peringkat, nama_jenis) FROM stdin;
1	Bangunan Arsitektur
2	Monumen & Patung
3	Air Terjun
4	Ngarai
5	Pulau
6	Perairan
7	Tempat Menarik & Tengara
7	Area Pengamatan
8	Tempat Menarik & Tengara
9	Gunung Berapi
10	Ngarai
11	Bangunan Arsitektur
11	Tempat Keagamaan
12	Pulau
13	Gua Bawah Tanah& Gua
14	Pantai
15	Perairan
16	Pulau
17	Pantai
18	Museum Benda Khusus
19	Pulau
20	Tempat Menarik & Tengara
21	Pulau
22	Pantai
23	Tempat Menarik & Tengara
24	Taman Nasional
24	Taman
25	Perairan
26	Tempat Menarik & Tengara
27	Acara Budaya
28	Pantai
29	Peternakan
30	Tempat Menarik & Tengara
31	Pantai
32	Gua Bawah Tanah& Gua
33	Perairan
34	Pulau
35	Museum Benda Khusus
36	Marina
36	Pulau
37	Pertanian
38	Pelabuhan & Jalan Kayu
39	Daerah Sekitar
40	Area Wisata Alam& Taman Margasatwa
41	Museum Benda Khusus
42	Perairan
43	Jembatan
44	Pulau
44	Pantai
45	Pantai
46	Tempat Menarik & Tengara
47	Tempat Keagamaan
48	Tempat Menarik & Tengara
49	Pantai
50	Tempat Menarik & Tengara
50	Taman
51	Pantai
52	Museum Benda Khusus
53	Kompleks Olahraga
54	Taman Hiburan
54	Taman Air
55	Pegunungan
56	Taman Nasional
57	Museum Benda Khusus
58	Tempat Menarik & Tengara
59	Air Terjun
60	Kompleks Olahraga
61	Area Bersejarah untuk Pejalan Kaki
62	Tempat Menarik & Tengara
63	Wisata Mobil
64	Area Pengamatan
65	Taman
66	Pertanian
67	Tempat Menarik & Tengara
67	Jembatan
68	Perairan
69	Area Wisata Alam& Taman Margasatwa
70	Museum Benda Khusus
71	Museum Kesenian
72	Tempat Belanja
73	Museum Sejarah
74	Tempat Menarik & Tengara
74	Tempat Misterius
75	Air Terjun
76	Perairan
77	Museum Benda Khusus
78	Kebun Binatang
79	Area Pengamatan
80	Air Terjun
81	Tempat Menarik & Tengara
81	Monumen & Patung
82	Pantai
83	Tempat Menarik & Tengara
83	Bangunan Arsitektur
84	Tempat Menarik & Tengara
85	Pemakaman
86	Bendungan
87	Daerah Sekitar
87	Tempat Menarik & Tengara
88	Museum Benda Khusus
89	Perairan
90	Pantai
91	Pegunungan
92	Tempat Menarik & Tengara
93	Tempat Menarik & Tengara
94	Area Wisata Alam& Taman Margasatwa
95	Perairan
96	Area Wisata Alam& Taman Margasatwa
97	Area Pengamatan
97	Jalur Lintas Alam
98	Area Pengamatan
98	Area Indah Pejalan Kaki
99	Pegunungan
100	Air Terjun
101	Tempat Menarik & Tengara
102	Perairan
103	Pantai
104	Tempat Menarik & Tengara
105	Pulau
106	Pulau
106	Pantai
107	Area Wisata Alam& Taman Margasatwa
108	Tempat Menarik & Tengara
109	Air Terjun
110	Kompleks Olahraga
111	Sistem Transportasi Umum
112	Air Terjun
113	Pantai
114	Tempat Bersejarah
115	Ngarai
115	Area Pengamatan
116	Tur Budaya
116	Tur Ekologi
117	Pulau
118	Monumen & Patung
119	Perairan
120	Tur Mandiri & Penyewaan Kendaraan
121	Perairan
121	Hutan
122	Tempat Menarik & Tengara
123	Jalur Lintas Alam
123	Area Indah Pejalan Kaki
124	Area Pengamatan
124	Jalur Lintas Alam
125	Tempat Menarik & Tengara
126	Pertanian
127	Pantai
128	Air Terjun
129	Pulau
129	Pantai
130	Perairan
131	Air Terjun
132	Museum Benda Khusus
133	Toko Barang Khusus & Suvenir
134	Perairan
135	Tur Kota
135	Tur Budaya
136	Tur Beberapa Hari
136	Tur Budaya
137	Tur Budaya
137	Tur Tempat Bersejarah & Situs Warisan
138	Pusat Permainan & Hiburan
139	Toko Barang Khusus & Suvenir
140	Spa Air Panas
141	Toko Barang Khusus & Suvenir
142	Spa
143	Spa
144	Spa Air Panas
145	Pusat Permainan & Hiburan
146	Toko Barang Khusus & Suvenir
147	Tur Kota
147	Tur Budaya
148	Tur Kota
148	Tur Beberapa Hari
149	Spa
150	Toko Barang Khusus & Suvenir
151	Scuba & Snorkelling
151	Taksi & Layanan Antar Jemput
152	Tur Budaya
152	Tur Ekologi
153	Parasailing & Paralayang
153	Tur Budaya
154	Tur Kota
154	Tur Beberapa Hari
155	Tur Budaya
155	Tur Tamasya
156	Scuba & Snorkelling
156	Selancar & Selancar Angin
157	Selancar & Selancar Angin
157	Tur Panjat Tebing
158	Tur Beberapa Hari
158	Taksi & Layanan Antar Jemput
159	Scuba & Snorkelling
160	Tur Beberapa Hari
160	Tur Pribadi
161	Tur Pribadi
162	Tur Kapal
162	Menyewa Peralatan & Tur Memancing
163	Flying Fox & Taman Petualangan Atas Pohon
164	Tur Beberapa Hari
164	Taksi & Layanan Antar Jemput
165	Tur Budaya
165	Tur Panjat Tebing
166	Tur Kota
166	Tur Budaya
167	Penyewaan Kapal
\.


--
-- TOC entry 3352 (class 0 OID 24804)
-- Dependencies: 215
-- Data for Name: objek_wisata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.objek_wisata (peringkat, nama_objek, nama_daerah, rata_rata_rating, jumlah_rating_5, jumlah_rating_4, jumlah_rating_3, jumlah_rating_2, jumlah_rating_1, jumlah_ulasan, nama_pengelola, kode_operasional) FROM stdin;
1	Istana Pagaruyung	Bukittinggi	4.5	153	165	47	1	0	366	\N	\N
2	Jam Gadang Bukittinggi 	Bukittinggi	4	200	257	176	23	3	659	\N	\N
3	Air Terjun Lembah Anai	Padang	4	84	141	102	8	1	336	\N	\N
4	Lembah Harau	Payakumbuh	4.5	96	85	18	2	1	202	\N	\N
5	Wisata pulau pagang	Padang	4.5	57	50	11	0	2	120	\N	\N
6	Danau Meninjau	Bukittinggi	4	143	169	43	7	2	364	\N	\N
7	Puncak Lawang	Bukittinggi	4.5	37	37	2	2	0	78	\N	\N
8	Kelok Sembilan	Payakumbuh	4	47	50	22	0	0	119	\N	\N
9	Gunung Marapi	Bukittinggi	4.5	49	31	7	2	0	89	\N	\N
10	Ngarai Sianok	Bukittinggi	4	122	172	46	5	0	345	\N	\N
11	Masjid Raya Sumatera Barat	Padang	4.5	37	20	0	0	0	57	\N	\N
12	Pulau Mandeh	Mandeh	4.5	18	10	0	1	0	29	\N	\N
13	Goa Jepang	Bukittinggi	4	52	96	54	8	2	212	\N	\N
14	Pantai Air Manis	Padang	3.5	41	89	93	25	10	258	\N	\N
15	Danau Singkarak	Solok	3.5	17	44	39	4	0	104	\N	\N
16	Pulau Sikuai	Padang	4	26	20	8	2	4	60	\N	\N
17	Pantai Padang Taplau	Padang	3.5	38	80	89	8	5	220	\N	\N
18	Museum Adityawarman	Padang	4	29	44	33	2	2	110	\N	\N
19	Pulau Pasumpahan	Padang	4.5	24	27	5	0	0	56	\N	\N
20	Kampung Cina	Padang	4	16	33	11	2	1	63	\N	\N
21	Pulau Pamutusan	Padang	4.5	17	11	2	0	0	30	\N	\N
22	Pantai Carocok Painan	Painan	4	22	27	5	4	0	58	\N	\N
23	Koto Gadang	Bukittinggi	3.5	19	34	32	1	3	89	\N	\N
24	Taman  Nasional Kerinci Seblat	West Sumatra	4.5	10	7	0	1	0	18	\N	\N
25	Lubuk Nyarai	Padang	4.5	6	10	0	0	0	16	\N	\N
26	Nagari Tuo Pariangan	Batusangkar	4.5	10	6	1	0	0	17	\N	\N
27	Alek Pacu Jawi	Payakumbuh	4.5	4	4	0	0	0	8	\N	\N
28	Pantai Suwarnadwipa	Bungus	4	12	9	3	0	1	25	\N	\N
29	Padang Mengatas	Payakumbuh	4.5	9	4	0	0	0	13	\N	\N
30	Jenjang Seribu	Bukittinggi	4	8	15	9	1	0	33	\N	\N
31	Pantai Bungus	Padang	3.5	7	12	6	3	1	29	\N	\N
32	Ngalau Indah	Payakumbuh	4	7	9	3	0	0	19	\N	\N
33	Danau Diatas	Painan	4	4	14	3	0	0	21	\N	\N
34	Pulau Sirandah	Padang	4	3	4	1	1	0	9	\N	\N
35	Museum Rumah Kelahiran Bung Hatta	Bukittinggi	4	12	16	6	1	1	36	\N	\N
36	Mandeh Sea Park	West Sumatra	4.5	10	8	0	0	0	18	\N	\N
37	Kebun Teh Alahan Panjang	Solok	4	6	9	2	0	0	17	\N	\N
38	Teluk Bayur	Padang	4.5	4	3	1	0	0	8	\N	\N
39	Pandai Sikek	Bukittinggi	4.5	5	4	2	0	0	11	\N	\N
40	Pusat Konservasi Batang Palupuh Alami (Taman Rafflesia)	Palupuh	4.5	7	5	0	0	0	12	\N	\N
41	Pusat Dokumentasi dan Informasi Kebudayaan Minangkabau	Padang	4.5	10	5	1	0	0	16	\N	\N
42	Pelabuhan Muaro	Padang	3.5	5	24	24	7	1	61	\N	\N
43	Jembatan Limpapeh	Bukittinggi	4	6	17	9	1	0	33	\N	\N
44	Pulau Angso Duo	Pariaman	4	7	9	2	1	0	19	\N	\N
45	Pantai Carolina	Padang	3.5	7	7	15	3	0	32	\N	\N
46	Kepala Bandar	Payakumbuh	4	5	4	3	0	0	12	\N	\N
47	Masjid Raya Bukittinggi	Bukittinggi	4	4	11	2	0	0	17	\N	\N
48	Benteng Fort de Kock	Bukittinggi	3	14	33	46	18	29	140	\N	\N
49	Pantai Muaro Lasak	Padang	4	4	10	3	0	0	17	\N	\N
50	Puncak Anai	Pariaman	4	3	6	1	0	0	10	\N	\N
51	Pantai Tiram	Padang	4	3	7	4	1	0	15	\N	\N
52	Goedang Ransum	Sawahlunto	4	4	11	3	0	0	18	\N	\N
53	Pemandian Tirta Alami	Padang Pariaman	4	3	12	1	1	0	17	\N	\N
54	Mifan Water Park & Resort	Padang Panjang	4	3	7	3	0	0	13	\N	\N
55	Gunung Singgalang	Bukittinggi	4	4	5	2	0	1	12	\N	\N
56	Taman Nasional Siberut	Siberut	5	4	0	0	0	0	4	\N	\N
57	Hole Mine Site Museum Mbah Suro & Infobox	Sawahlunto	4	4	10	3	0	0	17	\N	\N
58	Masjid Ulakan	Padang	4.5	6	2	1	0	0	9	\N	\N
59	Air Terjun Sarasah Gadut	Padang	4.5	4	5	0	0	0	9	\N	\N
60	Kolam Renang Batang Tabik	Payakumbuh	4.5	3	2	0	0	0	5	\N	\N
61	Janjang Saribu	Agam	4	5	5	6	0	0	16	\N	\N
62	Masjid Taqwa Muhammadiyah	Padang	4	2	11	2	0	0	15	\N	\N
63	Kelok 44	Maninjau	4.5	6	3	1	0	0	10	\N	\N
64	Bukit Nobita	Padang	4	6	4	6	0	1	17	\N	\N
65	Taman Nirwana	Padang	3.5	1	7	6	2	0	16	\N	\N
66	Lubuk Minturun	Padang	4	1	4	2	0	0	7	\N	\N
67	Jembatan Siti Nurbaya	Padang	4	1	13	2	0	0	16	\N	\N
68	Sungai Kapalo Banda Taram	Payakumbuh	4	1	5	0	0	0	6	\N	\N
69	Hutan Lindung Bung Hatta	Padang	4	2	3	3	0	0	8	\N	\N
70	Pusat Dokumentasi dan Informasi Kebudayaan Minangkabau	Padang Panjang	4.5	2	2	0	0	0	4	\N	\N
71	Rumah Puisi Taufiq Ismail	Padang Panjang	4.5	2	4	0	0	0	6	\N	\N
72	Basko Grand Mall	Padang	3	1	5	8	5	0	19	\N	\N
73	Museum Perjuangan Tri Daya Eka Dharma	Bukittinggi	4.5	3	3	1	0	0	7	\N	\N
74	Air Terjun Kulu Kubuk	Siberut	5	3	0	0	0	0	3	\N	\N
75	Batu Malin Kundang	Padang	3.5	0	5	5	1	0	11	\N	\N
76	Danau Kandi	Sawahlunto	4.5	2	3	0	0	0	5	\N	\N
77	Museum Kereta Api Sawahlunto	Sawahlunto	3.5	1	9	5	0	0	15	\N	\N
78	Puncak Langkisau	Painan	4.5	3	3	0	0	0	6	\N	\N
79	Taman Marga Satwa Budaya Kinantan	Bukittinggi	3	2	8	20	1	8	39	\N	\N
80	Air Terjun Lubuk Hitam	Padang	4	3	2	0	0	1	6	\N	\N
81	Monumen Bung Hatta	Bukittinggi	4	0	8	2	0	0	10	\N	\N
82	Pantai Gandoriah	Pariaman	4.5	3	4	0	0	0	7	\N	\N
83	Jembatan Akar	South Pesisir	4.5	3	3	1	0	0	7	\N	\N
84	Batu Batikam	Batusangkar	4	3	1	2	0	0	6	\N	\N
85	Makam Muhammad Yamin	Sawahlunto	4	1	3	2	0	0	6	\N	\N
86	Lubuk Cimantung	Pariaman	4.5	3	1	1	0	0	5	\N	\N
87	Nagari 1000 Rumah Gadang	Solok	4.5	2	2	0	0	0	4	\N	\N
88	Museum Rumah Kelahiran Buya Hamka	Nagari Sungai Pinang	4.5	1	3	0	0	0	4	\N	\N
89	Tabek Gadang	Agam	4	0	5	1	0	0	6	\N	\N
90	Pantai Ketaping	Padang	4	1	3	1	0	0	5	\N	\N
91	Puncak Polan	Sawahlunto	4.5	2	3	0	0	0	5	\N	\N
92	Kincir Air Talawi	Sawahlunto	4.5	1	3	0	0	0	4	\N	\N
93	Masjid Raya Bayur	Agam	4.5	2	2	0	0	0	4	\N	\N
94	Lubuak Tempurung	Padang	4	0	4	0	0	0	4	\N	\N
95	Sungai Belimbing	Bukittinggi	3	0	0	1	0	0	1	\N	\N
96	Jambak Sea Turtle Camp	Padang	5	2	0	0	0	0	2	\N	\N
97	Bukit Cambai	Solok	4.5	1	1	0	0	0	2	\N	\N
98	Bukit Sirih	Pariaman	5	2	0	0	0	0	2	\N	\N
99	Gunung Tandikat	Bukittinggi	4	1	2	0	1	0	4	\N	\N
100	Air Terjun Batu Bersurat	Pariaman	4.5	1	2	0	0	0	3	\N	\N
101	Rumah Tuo Kampai Nan Panjang	Bukittinggi	3	0	0	1	0	0	1	\N	\N
102	Danau Tarusan Kamang	Agam	4	1	2	1	0	0	4	\N	\N
103	Pantai Kata	Pariaman	4	1	4	1	0	0	6	\N	\N
104	Kincir Air Tradisional	Sawahlunto	5	2	0	0	0	0	2	\N	\N
105	Pulau Sironjong	Padang	5	1	0	0	0	0	1	\N	\N
106	Konservasi Penyu Kota Pariaman	Pariaman	4.5	1	1	0	0	0	2	\N	\N
107	Pulau Karang	Pagai Utara	4	0	2	0	0	0	2	\N	\N
108	Gereja Katolik Santa Barbara Sawahlunto	Sawahlunto	3.5	0	2	1	0	0	3	\N	\N
109	Air Terjun Baburai	Padang	4	0	3	0	0	0	3	\N	\N
110	Shoot - Pool Lounge & Sport Bar	Pagai Utara	5	1	0	0	0	0	1	\N	\N
111	Airport Raillink Service	Padang	5	2	0	0	0	0	2	\N	\N
112	Air Terjun Ngungun Saok	Padang	5	1	0	0	0	0	1	\N	\N
113	Pantai Carocok	Painan	4	1	2	1	0	0	4	\N	\N
114	Rumah Gadang Tuanku Lareh St	Agam	5	1	0	0	0	0	1	\N	\N
115	Sandiang Gagoan	Solok	4	1	1	2	0	0	4	\N	\N
116	Mentawai Tribe Tour	Padang	5	80	1	0	0	0	81	\N	\N
117	Pulau kasiak	Pariaman	4	0	2	0	0	0	2	\N	\N
118	Monumen Merpati Perdamaian	Padang	5	1	0	0	0	0	1	\N	\N
119	Danau Biru Sawahlunto	Sawahlunto	4	0	1	0	0	0	1	\N	\N
120	Padang Private Driver	Padang	5	99	9	0	1	1	110	\N	\N
121	Air Terjun Titian Puti (Nyarai)	Pariaman	4	0	1	0	0	0	1	\N	\N
122	Taman Green Lezatta	Agam	4	0	2	0	0	0	2	\N	\N
123	Puncak Payo Rapuih	Padang Panjang	4	0	1	0	0	0	1	\N	\N
124	Puncak Happy	Solok	5	1	0	0	0	0	1	\N	\N
125	Masjid Agung Nurul Islam	Sawahlunto	4	0	2	0	0	0	2	\N	\N
126	Kebun Teh Mitra Kerinci	Solok	4	0	2	0	0	0	2	\N	\N
127	Pantai Labuang Baruak	South Pesisir	5	1	0	0	0	0	1	\N	\N
128	Sarasah Sungai Guntuang	Palupuh	4	0	1	0	0	0	1	\N	\N
129	Pulau Batu Nago	South Pesisir	4	0	1	0	0	0	1	\N	\N
130	Teluk Air Putih	Solok	4	0	1	0	0	0	1	\N	\N
131	Museum Tuanku Imam Bonjol	Bonjol	2.5	1	0	0	1	2	4	\N	\N
132	Pincuran Tujuh	Padang	3	0	0	1	0	0	1	\N	\N
133	Pasar Atas Bukittinggi	Bukittinggi	4	19	33	22	4	0	78	\N	\N
134	Danau Tomosu	Sawahlunto	4	0	1	0	0	0	1	\N	\N
135	Lite 'N' Easy Tour	Bukittinggi	5	113	8	2	0	0	123	\N	\N
136	Roni's Tours	Bukittinggi	5	112	17	1	0	0	130	\N	\N
137	Mentawai Experience Tour	Padang	5	49	1	0	0	0	50	\N	\N
138	Lawang Park	Agam	4.5	4	6	1	0	0	11	\N	\N
139	Kripik Balado Shirley	Padang	3.5	1	11	7	0	1	20	\N	\N
140	Aie Angek Bukik Gadang	Solok	5	3	0	0	0	0	3	\N	\N
141	Batik Tanah Liek Citra Monalisa	Padang	5	2	0	0	0	0	2	\N	\N
142	Kakiku Refleksi	Padang	3	2	0	0	1	2	5	\N	\N
143	Martha Tilaar Salon Day Spa	Padang	5	1	0	0	0	0	1	\N	\N
144	Aie Angek Bukik Kili	Solok	4.5	2	1	1	0	0	4	\N	\N
145	Komando Paintball & Cafe	Bukittinggi	4	0	1	0	0	0	1	\N	\N
146	Kopi Kiniko	Batusangkar	4	2	1	3	0	0	6	\N	\N
147	Minangkabau Adventures Tour	Bukittinggi	5	15	2	0	0	0	17	\N	\N
148	Samba Lado	Padang	5	11	1	0	0	0	12	\N	\N
149	House Of Beauty And Spa	Bukittinggi	3	0	1	0	1	0	2	\N	\N
150	Tungku Sanjai Amak Haji	Bukittinggi	5	1	0	0	0	0	1	\N	\N
151	PADANG DESTINATION	Padang	5	18	0	1	0	0	19	\N	\N
152	West Sumatra Traveler	Padang	5	5	1	0	0	0	6	\N	\N
153	Duta Pesona	Padang	4.5	9	5	0	0	0	14	\N	\N
154	Matonagari	Padang	5	4	0	0	0	0	4	\N	\N
155	Ricky Abdi Tour	Padang Pariaman	5	12	2	0	0	0	14	\N	\N
156	Discover Mentawais	Siberut	5	2	0	0	0	0	2	\N	\N
157	Sumatra Adventure	Bukittinggi	4.5	1	1	0	0	0	2	\N	\N
158	Habibie DelapanTour	Bukittinggi	5	5	0	0	0	0	5	\N	\N
159	Menyelam - Starocean	Padang	5	1	0	0	0	0	1	\N	\N
160	Mentawai Tribe Journey with Wetravelinc	Siberut	5	1	0	0	0	0	1	\N	\N
161	Platinum Holidays Indonesia	Bukittinggi	5	1	0	0	0	0	1	\N	\N
162	Surf in Mentawais	Siberut	5	1	0	0	0	0	1	\N	\N
163	Banto Royo	Agam	3.5	0	1	3	0	0	4	\N	\N
164	Rizal Tour	Bukittinggi	5	1	0	0	0	0	1	\N	\N
165	Al Wafa Adventure	Padang	5	1	0	0	0	0	1	\N	\N
166	Rianzha Holiday	Padang	5	1	0	0	0	0	1	\N	\N
167	Santa Lusia Boat	Padang	2	0	0	0	1	0	1	\N	\N
\.


--
-- TOC entry 3355 (class 0 OID 24829)
-- Dependencies: 218
-- Data for Name: operasional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operasional (kode_operasional, jam_buka, jam_tutup, hari_operasional) FROM stdin;
\.


--
-- TOC entry 3353 (class 0 OID 24814)
-- Dependencies: 216
-- Data for Name: pengelola; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengelola (nama_pengelola, kontak_pengelola) FROM stdin;
\.


--
-- TOC entry 3356 (class 0 OID 24856)
-- Dependencies: 219
-- Data for Name: ulasan_teratas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ulasan_teratas (peringkat, nama_akun_pengunjung, asal_pengunjung, rating_pengunjung, waktu_berkunjung, tipe_kunjungan) FROM stdin;
1	Sare B	Bandung	5	Feb 2021	Keluarga
1	April Kinana	Padang	4	Nov 2019	Teman
1	evi d	Pekanbaru	4	Des 2019	Keluarga
1	Ari Wirajaya	Denpasar	5	Okt 2019	Teman
1	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
1	Alfar	Tangerang	4	Apr 2019	Keluarga
1	Grasella	Medan	5	Apr 2018	Keluarga
1	Banissalam	Palembang	5	Mar 2019	Bisnis
1	Yoga Efendi (Tour Guide)	Yogyakarta	5	Jan 2019	Sendiri
1	Pramono	Padang	4	Des 2018	Keluarga
2	Fahdi	Jakarta	5	Jan 2023	Pasangan
2	Ade Mirwan	Pekanbaru	5	Mar 2021	Keluarga
2	April Kinana	Padang	5	Jan 2020	Keluarga
2	Dyandra66	Bandung	5	Mar 2020	Pasangan
2	anida krisstini	Padang	5	Nov 2019	Teman
2	M Richan	Padang	5	Jan 2020	Teman
2	Duan	Padang	5	Nov 2019	Teman
2	Ken Aditya	Padang	5	Nov 2019	Pasangan
2	aint marssy	Jakarta	5	Okt 2019	Bisnis
2	Mustakim Dr	Makassar	5	Okt 2019	Keluarga
3	Fahdi	Jakarta	5	Jan 2023	Pasangan
3	Dina	Padang	5	Jun 2022	Keluarga
3	rahmi	Padang	4	Des 2019	Keluarga
3	Forza	Padang	5	Des 2019	Keluarga
3	monika	Padang	4	Agt 2019	Teman
3	tHea_Mario	Pangkal Pinang	5	Des 2019	Bisnis
3	Ari Wirajaya	Denpasar	3	Okt 2019	Teman
3	putriariani	Padang	4	Jul 2019	Keluarga
3	putriamarisa	Padang	3	Okt 2019	Keluarga
3	BangNess	Padang	3	Des 2018	Keluarga
4	Haryono	Pekanbaru	5	Jan 2023	Keluarga
4	Sare B	Bandung	5	Feb 2021	Keluarga
4	prisil a	Jakarta	5	Des 2019	Keluarga
4	Sefanya travel	Padang	5	Nov 2019	Bisnis
4	yudhi k	Padang	5	Agt 2019	Teman
4	jack_parwanto	Jakarta	4	Jun 2019	Bisnis
4	Alfar	Tangerang	5	Apr 2019	Keluarga
4	Devwanto Dariel Nugroho	Bandung	5	Jun 2018	Keluarga
4	sabrina_ho88	Padang	5	Feb 2019	Teman
4	Indryechania	Payakumbuh	5	Feb 2019	Keluarga
5	Forza	Padang	4	Nov 2019	Keluarga
5	Zainalabidin	Jakarta	4	Sep 2019	Keluarga
5	anak rantau	Banda Aceh	5	Jun 2018	Bisnis
5	asman a	Padang	5	Okt 2018	Teman
5	Antohokkeh	Padang	4	Agt 2018	Teman
5	kk_funky	Jakarta	4	Des 2017	Sendiri
5	zain5urvey	Sentani	5	Jan 2017	Pasangan
5	Ewi D	Pekanbaru	4	Okt 2017	Bisnis
5	aferio y	Padang	4	Agt 2016	Keluarga
5	Deecy lauw	Padang	5	Des 2016	Keluarga
6	Forza	Padang	5	Agt 2019	Keluarga
6	iwanskomari	Jakarta	4	Nov 2019	Teman
6	Ahmad Fauzan	Padang Pariaman	4	Apr 2019	Pasangan
6	Rizky A	Jakarta	4	Mar 2019	Pasangan
6	Indri87	Padang	5	Mei 2019	Keluarga
6	anak rantau	Banda Aceh	5	Jun 2018	Keluarga
6	roby	Padang	4	Mei 2019	Keluarga
6	Alfar	Tangerang	4	Apr 2019	Keluarga
6	sabrina_ho88	Padang	5	Des 2018	Teman
6	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
7	Nanda	Padang	5	Mei 2022	Pasangan
7	Ahmad Fauzan	Padang Pariaman	4	Jan 2019	Pasangan
7	Banissalam	Palembang	5	Apr 2019	Bisnis
7	rifa'atul K	Agam	4	Mar 2018	Teman
7	hendysuherman86	Jakarta	4	Des 2018	Keluarga
7	fery79	Palu	4	Jan 2019	Keluarga
7	Dhany Alfaruq	Bukittinggi	4	Jan 2018	Keluarga
7	vella ovelia	Padang	5	Okt 2018	Teman
7	aefer	Padang	5	Agt 2018	Teman
7	pahlevi p	Padang	5	Sep 2018	Keluarga
8	Haryono	Pekanbaru	4	Jan 2023	Keluarga
8	Alfar	Tangerang	5	Apr 2019	Keluarga
8	Devwanto Dariel Nugroho	Bandung	5	Jun 2018	Keluarga
8	Sefanya travel	Padang	5	Feb 2018	Keluarga
8	Agusti Esden	Tangerang Selatan	4	Sep 2018	Keluarga
8	dendyfebdwiyana	Bandung	5	Nov 2018	Bisnis
8	Elfindra Aswin	Jakarta	4	Okt 2018	Keluarga
8	alnurdin	Jakarta	4	Feb 2018	Keluarga
8	Dilla R	Padang	5	Agt 2017	Keluarga
8	Bendriwijaya	Padang	4	Jun 2018	Keluarga
9	Yurisystem	Padang	5	Jun 2021	Sendiri
9	Frenji	Padang	5	Nov 2019	Teman
9	Ahmad Fauzan	Padang Pariaman	4	Des 2018	Pasangan
9	Agung Suria Darma	Sentul	5	Agt 2019	Bisnis
9	Djoko Roemantio	Padang	5	Jul 2019	Teman
9	anak rantau	Banda Aceh	5	Mei 2019	Teman
9	Fikri mufadhdhal	Jambi	5	Jan 2019	Teman
9	rumahambacang	Padang	5	Des 2017	Bisnis
9	NurJane11	Padang	5	Mar 2017	Keluarga
9	Kadarmanto B	Jakarta	4	Jul 2017	Keluarga
10	Kapatoman_Cafe	Bukittinggi	5	Sep 2020	Keluarga
10	Chiquita P	Padang	5	Jul 2019	Teman
10	Valiant Vemby	Bukittinggi	4	Mar 2019	Sendiri
10	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
10	Alfar	Tangerang	5	Apr 2019	Keluarga
10	differensiasi	Medan	5	Nov 2018	Teman
10	Dhany Alfaruq	Bukittinggi	5	Des 2018	Keluarga
10	Wihartanto	Tangerang Selatan	4	Okt 2017	Teman
10	an_victor	Jakarta	4	Agt 2018	Keluarga
11	Dina	Padang	5	Jun 2022	Keluarga
11	yudhi k	Padang	5	Feb 2020	Sendiri
11	rahmi	Padang	4	Okt 2019	Keluarga
11	Muhammad ardi	Palembang	5	Okt 2019	Sendiri
11	Forza	Padang	5	Agt 2019	Keluarga
11	iwanskomari	Jakarta	4	Nov 2019	Keluarga
11	rvsdi	Padang	5	Okt 2019	Sendiri
11	Halid T	Jakarta	5	Okt 2019	Keluarga
11	dendyfebdwiyana	Bandung	5	Nov 2018	Bisnis
11	Rizky A	Jakarta	5	Mar 2019	Pasangan
12	Forza	Padang	5	Mar 2020	Keluarga
12	Ken Aditya	Padang	5	Nov 2019	Keluarga
12	Ahmad Fauzan	Padang Pariaman	4	Des 2018	Pasangan
12	Erik_Ariyanto	Kalimantan Barat	4	Jun 2019	Keluarga
12	Denni Risman	Pekanbaru	5	Jun 2019	Keluarga
12	ate75	Pekanbaru	5	Feb 2019	Keluarga
12	Antohokkeh	Padang	5	Sep 2018	Teman
12	chuiichigo	Jakarta	5	Sep 2018	Teman
12	MaulidaSaktia	Padang	5	Mar 2018	Pasangan
12	hotelfoodreviewindonesia	Padang	5	Agt 2018	Keluarga
13	April Kinana	Padang	4	Sep 2020	Keluarga
13	Mom wafiy	Padang	3	Sep 2019	Keluarga
13	aint marssy	Jakarta	4	Okt 2019	Bisnis
13	Mustakim Dr	Makassar	4	Okt 2019	Sendiri
13	differensiasi	Medan	5	Nov 2018	Teman
13	Sefanya travel	Padang	5	Agt 2018	Keluarga
13	Dhany Alfaruq	Bukittinggi	5	Des 2018	Keluarga
13	Haris A	Padang	4	Nov 2018	Bisnis
13	Nurhalimah N	Jakarta	5	Okt 2017	Bisnis
13	an_victor	Jakarta	4	Agt 2018	Keluarga
14	widi irawati	Bogor	5	Feb 2020	Keluarga
14	Forza	Padang	4	Jul 2019	Keluarga
14	Sefanya travel	Padang	5	Des 2019	Teman
14	Halid T	Jakarta	2	Okt 2019	Keluarga
14	Amel	Banjarmasin	3	Okt 2019	Teman
14	aint marssy	Jakarta	5	Okt 2019	Bisnis
14	Ahmad Fauzan	Padang Pariaman	4	Jul 2019	Pasangan
14	siti jalan jalan	Padang	4	Agt 2019	Pasangan
14	Refandi Budi	Bekasi	4	Agt 2019	Teman
14	yudhi k	Padang	4	Jun 2018	Keluarga
15	Priojati A	Jakarta	3	Feb 2020	Keluarga
15	Ken Aditya	Padang	5	Nov 2019	Keluarga
15	makdangnisa	Padang	4	Nov 2019	Keluarga
15	Ahmad Fauzan	Padang Pariaman	4	Apr 2019	Pasangan
15	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
15	Pasya	Pekanbaru	4	Apr 2019	Keluarga
15	Agusti Esden	Tangerang Selatan	4	Jul 2018	Keluarga
15	jonialexanderheytsit	Solok	3	Des 2017	Keluarga
15	ArfiveGandhi	Bandung	5	Okt 2018	Keluarga
15	Wihartanto	Tangerang Selatan	3	Okt 2017	Teman
16	anak rantau	Banda Aceh	5	Jun 2019	Teman
16	sabrina_ho88	Padang	5	Mei 2018	Bisnis
16	Antohokkeh	Padang	4	Agt 2018	Sendiri
16	hendra_lokkasa	Medan	4	Okt 2016	Bisnis
16	Rahayus101	Padang	5	Jul 2017	Pasangan
16	winaldo	Palembang	3	Agt 2016	Pasangan
16	Anida_Krisstini	Padang	4	Okt 2015	Teman
16	andregiovando	Padang	5	Sep 2015	Teman
16	Oky A	Padang	5	Des 2015	Keluarga
16	ana2626	Pekanbaru	3	Jan 2016	Keluarga
17	Indri87	Padang	5	Sep 2021	Keluarga
17	Saipul Arifin	Padang	3	Nov 2019	Sendiri
17	anida krisstini	Padang	5	Nov 2019	Sendiri
17	Duan	Padang	3	Nov 2019	Teman
17	Sefanya travel	Padang	5	Nov 2019	Keluarga
17	fifi	Padang	4	Nov 2019	Teman
17	yudhi k	Padang	5	Jul 2019	Sendiri
17	Seaside55351852926	Padang	5	Jun 2019	Sendiri
17	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
18	rafid fernando	Padang	3	Jan 2021	Keluarga
18	Forza	Padang	5	Jun 2019	Keluarga
18	monika	Padang	3	Jun 2019	Teman
18	siti jalan jalan	Padang	3	Agt 2019	Pasangan
18	Erik_Ariyanto	Kalimantan Barat	3	Jun 2019	Keluarga
18	anak rantau	Banda Aceh	5	Jun 2019	Keluarga
18	Dizzman	Jakarta	4	Nov 2018	Keluarga
18	Ruth H	Pekanbaru	5	Jan 2019	Keluarga
18	DewiLes	Padang	5	Des 2018	Keluarga
18	Sefanya travel	Padang	5	Okt 2018	Keluarga
19	Hendra Yolanda Rangkuti	Pekanbaru	3	Okt 2018	Teman
19	Akmal	Padang	5	Apr 2018	Teman
19	Petualangbumi	Bandung	4	Sep 2018	Bisnis
19	Antohokkeh	Padang	4	Agt 2018	Teman
19	Shakila P	Bali	5	Jun 2018	Keluarga
19	DiyanFariha	Duri	5	Mei 2018	Keluarga
19	andregiovando	Padang	5	Feb 2018	Teman
19	Febri H	Padang	5	Jun 2017	Sendiri
19	Ahmad Wijaya	Padang	5	Des 2017	Teman
19	zain5urvey	Sentani	5	Jan 2017	Pasangan
20	monika	Padang	4	Okt 2019	Teman
20	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
20	sabrina_ho88	Padang	5	Mar 2019	Bisnis
20	asman a	Padang	4	Okt 2018	Teman
20	Antohokkeh	Padang	4	Agt 2018	Teman
20	andregiovando	Padang	5	Mar 2018	Teman
20	Mira Emirina	Padang	5	Mar 2018	Keluarga
20	kk_funky	Jakarta	4	Des 2017	Sendiri
20	Aris	Tangerang Selatan	4	Des 2017	Keluarga
20	iwan s	Jakarta	3	Jan 2017	Pasangan
21	Ruth H	Pekanbaru	5	Jan 2019	Keluarga
21	Petualangbumi	Bandung	4	Sep 2018	Bisnis
21	Antohokkeh	Padang	5	Sep 2018	Teman
21	MaulidaSaktia	Padang	5	Mar 2018	Pasangan
21	andregiovando	Padang	5	Mar 2018	Teman
21	Muhammad R	Padang	5	Des 2017	Teman
21	dionpratama	Padang	5	Nov 2016	Bisnis
21	winaldo	Palembang	4	Agt 2016	Keluarga
21	Bujang L	Pekanbaru	4	Des 2015	Keluarga
21	mirzaasril	Tegal	5	Agt 2016	Teman
22	Bumimi homestay	Painan	5	Sep 2019	Teman
22	rent car & tour jogja	Yogyakarta	5	Mar 2019	Bisnis
22	Dee Rahayu Sapta	Jakarta	5	Jan 2019	Keluarga
22	Sefanya travel	Padang	5	Jun 2018	Keluarga
22	dzdessy	Padang	5	Jul 2018	Keluarga
22	kk_funky	Jakarta	4	Des 2017	Sendiri
22	Anjar Normatasari	Banjarbaru	4	Des 2017	Keluarga
22	jawekmentour	Bekasi	5	Jul 2016	Teman
22	egha17	Palembang	4	Jul 2016	Keluarga
22	Ramadhan6297	Pekanbaru	5	Jan 2016	Teman
23	Valiant Vemby	Bukittinggi	4	Agt 2018	Teman
23	rigeladitya	Jakarta	4	Des 2018	Bisnis
23	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
23	langgeng14	Padang	5	Mei 2018	Keluarga
23	Ilham I	Padang	4	Feb 2017	Teman
23	Audreyqueen A	Padang	4	Okt 2017	Keluarga
23	megahariani29	Depok	3	Jul 2017	Pasangan
23	Fisra A	Jakarta	4	Jul 2016	Keluarga
23	meow_fransisca2006	Pematang Siantar	3	Apr 2017	Keluarga
23	Arifien	Jakarta	4	Apr 2017	Sendiri
24	JelajahKerinci	Padang	5	Mar 2018	Sendiri
24	andreas_kheneva	Padang	5	Agt 2017	Keluarga
24	Y Yaniari	Jakarta	5	Jan 2016	Pasangan
24	Rinchung	Abu Dhabi	4	Jul 2015	Pasangan
24	Sahat_art	Bogor	5	Jan 2023	Keluarga
24	DnaUSA	Berkeley	4	Sep 2019	Pasangan
24	Balira17	Padang	4	Jul 2019	Teman
24	jajavalB	Lampang	5	Okt 2016	Sendiri
24	aji suryanto	Jakarta	5	Sep 2015	Keluarga
24	korian89	Groningen	5	Sep 2014	Sendiri
25	Pasya	Pekanbaru	4	Okt 2018	Keluarga
25	Antohokkeh	Padang	4	Sep 2018	Bisnis
25	Dessy J	Bandung	5	Jul 2018	Pasangan
25	en2qm	Batam	5	Sep 2018	Keluarga
25	OkeTravel	Riau	4	Apr 2018	Keluarga
25	ate75	Pekanbaru	4	Sep 2015	Teman
25	ana2626	Pekanbaru	4	Okt 2015	Teman
25	noqeuy	Jakarta	5	Agt 2015	Keluarga
25	Aldi S	Bandung	4	Jul 2015	Teman
25	EFENDY_JAMES	Medan	4	Mei 2015	Teman
26	Fajrin	Batusangkar	5	Nov 2019	Keluarga
26	Rachella Homestay	Batusangkar	5	Agt 2019	Keluarga
26	rijalpurwailmiawan	Jakarta	5	Jan 2018	Teman
26	ekosapoetrasati	Batusangkar	5	Des 2017	Keluarga
26	kaumNUsantara	Jakarta	4	Mar 2018	Pasangan
26	Muhammad R	Padang	5	Jan 2018	Sendiri
26	fadilannisa a	Jakarta	3	Des 2017	Pasangan
26	fanimami	Pekanbaru	4	Jul 2017	Keluarga
26	Fisra A	Jakarta	4	Jul 2016	Keluarga
26	shafarul i	Bukittinggi	4	Agt 2015	Teman
27	Pasya	Pekanbaru	4	Apr 2019	Keluarga
27	Brigitta	Padang	5	Jul 2018	Keluarga
27	Coastal764018	Padang	5	Apr 2018	Bisnis
27	EKO-Y-PRAMONO	Denpasar	4	Des 2016	Sendiri
27	Agusti Esden	Tangerang Selatan	4	Nov 2012	Keluarga
27	carlbray	Wellington	5	Mei 2017	Teman
28	Hendra Yolanda Rangkuti	Pekanbaru	5	Des 2018	Pasangan
28	Brigitta	Padang	4	Mar 2019	Teman
28	Ruth H	Pekanbaru	4	Jan 2019	Keluarga
28	Antohokkeh	Padang	4	Sep 2018	Teman
28	dennygustiyandra	Bandar Lampung	4	Mar 2018	Teman
28	Ilham I	Padang	5	Agt 2017	Teman
28	ibnu reza s	Padang	5	Des 2017	Pasangan
28	pikhanza	Medan	5	Des 2017	Teman
28	Bujang L	Pekanbaru	3	Des 2015	Teman
28	mirzaasril	Tegal	4	Agt 2016	Bisnis
29	Indryechania	Payakumbuh	4	Jul 2019	Keluarga
29	Pasya	Pekanbaru	5	Des 2018	Keluarga
29	Sefanya travel	Padang	5	Jan 2018	Keluarga
29	Citra F	Jakarta	5	Agt 2017	Keluarga
29	rusiagus f	Padang	4	Sep 2017	Bisnis
29	Fisra A	Jakarta	4	Des 2016	Keluarga
29	salma615	Payakumbuh	5	Des 2016	Keluarga
29	tempat yang indah yang tertutup untuk umum	Padang	5	Okt 2016	Keluarga
29	shafarul i	Bukittinggi	4	Nov 2015	Teman
29	visitminangkabau	Jakarta	5	Sep 2016	Sendiri
30	Valiant Vemby	Bukittinggi	4	Mar 2019	Sendiri
30	mr. ari	Pekanbaru	3	Feb 2019	Keluarga
30	Ilham I	Padang	4	Nov 2017	Teman
30	Adiguna M	Padang	3	Jul 2016	Keluarga
30	langgeng14	Padang	5	Nov 2016	Pasangan
30	Hidayati D	Tangerang	4	Agt 2016	Teman
30	RerePutri	Jakarta	3	Mei 2016	Keluarga
30	KurniawanAdhi	Jakarta	5	Agt 2016	Sendiri
30	sabrina_ho88	Padang	5	Feb 2016	Pasangan
31	Ruth H	Pekanbaru	4	Jan 2019	Keluarga
31	Antohokkeh	Padang	3	Sep 2018	Teman
31	Ilham I	Padang	5	Feb 2018	Teman
31	tjutjukbs	Surabaya	4	Feb 2017	Teman
31	differensiasi	Medan	5	Nov 2016	Bisnis
31	Anida_Krisstini	Padang	3	Okt 2015	Teman
31	MairizaYulianti	Sumatera Utara	3	Des 2015	Keluarga
31	ana2626	Pekanbaru	3	Jan 2016	Keluarga
31	marioluigiyoshi	Jakarta	2	Mei 2015	Keluarga
31	dama0002	Singapura	4	Feb 2015	Teman
32	Pasya	Pekanbaru	4	Apr 2019	Keluarga
32	Fisra A	Jakarta	4	Des 2016	Keluarga
32	winaldo	Palembang	4	Agt 2016	Teman
32	PaxJef	Padang	4	Mei 2016	Keluarga
32	HermanWay	Tangerang	4	Agt 2016	Teman
32	sabrina_ho88	Padang	5	Jan 2016	Keluarga
32	Eddy1215	Padang	4	Agt 2015	Keluarga
32	andreas_ertanto	Padang	3	Okt 2014	Keluarga
32	Haikal1988	Payakumbuh	5	Mei 2015	Teman
32	hendysuherman	Jakarta	4	Nov 2014	Bisnis
33	Sefanya travel	Padang	5	Des 2018	Bisnis
33	Navigator729627	Padang	4	Sep 2017	Keluarga
33	Ichazizah	Jakarta	4	Okt 2016	Teman
33	erfi0012014	Tangerang	4	Agt 2016	Keluarga
33	wanay11	Jakarta	3	Agt 2016	Teman
33	Evinayaspi	Padang	3	Jul 2016	Teman
33	fajaradiartha	Jakarta	4	Mei 2016	Teman
33	rudi sutrisno ho	Jakarta	4	Mei 2016	Teman
33	Aldi S	Bandung	4	Jul 2015	Keluarga
34	Antohokkeh	Padang	5	Des 2018	Teman
34	mr. ari	Pekanbaru	5	Okt 2018	Teman
34	yoliyoliandra8	Padang	2	Mar 2018	Teman
34	rusiagus f	Padang	4	Sep 2017	Teman
34	fanimami	Pekanbaru	4	Jul 2017	Keluarga
34	Abdika Permana	Jakarta	4	Jul 2017	Keluarga
34	tanoe7788	Padang	4	Apr 2017	Pasangan
34	partnerst0ur	Padang	3	Apr 2017	Keluarga
35	Dizzman	Jakarta	5	Nov 2018	Keluarga
35	iwan_akraz	Tangerang	5	Mar 2018	Pasangan
35	imas u	Bogor	5	Apr 2018	Teman
35	iratsaihtum	Jakarta	4	Mei 2017	Keluarga
35	kk_funky	Jakarta	5	Des 2017	Sendiri
35	honestkaro	Kabanjahe	3	Jul 2017	Teman
35	ihsanadh	Makassar	5	Jul 2016	Keluarga
35	Feriandi	Serpong	4	Jan 2017	Keluarga
35	fajarsakti	Waikabubak	4	Des 2016	Teman
36	Pasya	Pekanbaru	4	Apr 2019	Keluarga
36	kk_funky	Jakarta	5	Des 2017	Sendiri
36	partnerst0ur	Padang	4	Mar 2017	Keluarga
36	Ridho S	Padang	5	Agt 2016	Teman
36	shafarul i	Bukittinggi	4	Mei 2016	Teman
36	Panduko_Sutan	Kajang	4	Des 2015	Keluarga
36	wulann2014	Padang	5	Mei 2015	Pasangan
36	Voleta_H	Jakarta	4	Des 2015	Keluarga
36	Haikal1988	Payakumbuh	5	Des 2015	Keluarga
36	Mahmud B	Palembang	5	Jun 2015	Sendiri
37	makdangnisa	Padang	4	Nov 2019	Keluarga
37	BangNess	Padang	4	Feb 2019	Teman
37	Pasya	Pekanbaru	4	Apr 2019	Keluarga
37	jonialexanderheytsit	Solok	4	Des 2017	Keluarga
37	kk_funky	Jakarta	5	Jun 2018	Keluarga
37	Annisa A	Padang	5	Okt 2017	Keluarga
37	ViNasution	Padang	4	Jan 2018	Keluarga
37	Rahmat R	Pekanbaru	4	Okt 2016	Keluarga
37	Tri Julian H	Padang	5	Jul 2017	Sendiri
37	endriano	Pekanbaru	4	Des 2016	Teman
38	Kasmadi Munthe	Malang	5	Jan 2022	Keluarga
38	kk_funky	Jakarta	5	Jun 2018	Keluarga
38	Ahmad Wijaya	Padang	5	Des 2017	Teman
38	irmadevita	Jakarta	3	Apr 2017	Keluarga
38	Alfalegro	Jakarta	4	Apr 2017	Teman
38	tjutjukbs	Surabaya	4	Feb 2017	Teman
38	CenturyAlpha	Yogyakarta	4	Feb 2017	Teman
39	hendysuherman86	Jakarta	5	Des 2018	Keluarga
39	RikhePurnamaSari	Padang	5	Jan 2018	Keluarga
39	Mira Emirina	Padang	4	Jul 2017	Keluarga
39	shafarul i	Bukittinggi	4	Agt 2016	Teman
39	Laksmi A	Depok	5	Jun 2019	Keluarga
39	Aang174	Padang	4	Apr 2018	Teman
39	RaiAriff	Kuala Lumpur	3	Des 2017	Sendiri
39	Eilyn M	Johor Bahru	5	Agt 2017	Keluarga
39	Boonlong	San Diego	4	Feb 2017	Teman
40	Didy Ardiano	Palupuh	4	Des 2019	Teman
40	herman p	Padang	5	Jul 2019	Keluarga
40	Alex S	Deventer	4	Mar 2019	Pasangan
41	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
41	Antohokkeh	Padang	5	Okt 2018	Bisnis
41	Alwin Assegaff	Bali	5	Apr 2018	Teman
41	NurJane11	Padang	5	Mar 2017	Keluarga
41	dewi_rizki	Makassar	4	Sep 2017	Bisnis
41	Fatimah A	Padang	5	Agt 2016	Keluarga
41	Amirashidah A	Padang	4	Okt 2019	Keluarga
41	DF-ADL	Glenelg	5	Des 2018	Bisnis
41	Dawannes	Hoogstraten	4	Feb 2018	Sendiri
41	Pesona Jejak Wisata	Bukittinggi	5	Jul 2018	Bisnis
42	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
42	Antohokkeh	Padang	3	Agt 2018	Teman
42	kk_funky	Jakarta	4	Jun 2018	Keluarga
42	Febri H	Padang	5	Jun 2017	Sendiri
42	Tri Julian H	Padang	4	Mar 2018	Bisnis
42	Devijoe	Padang	1	Jul 2017	Keluarga
42	iwan s	Jakarta	2	Jan 2017	Pasangan
42	Alfalegro	Jakarta	4	Apr 2017	Keluarga
42	tjutjukbs	Surabaya	3	Feb 2017	Teman
42	Ismaul H	Bandung	3	Jan 2017	Bisnis
43	Mom wafiy	Padang	4	Sep 2019	Keluarga
43	LENNI5y	Jakarta	4	Jun 2019	Sendiri
43	Dhany Alfaruq	Bukittinggi	4	Des 2018	Sendiri
43	Agusti Esden	Tangerang Selatan	4	Sep 2018	Keluarga
43	an_victor	Jakarta	4	Agt 2018	Keluarga
43	ViNasution	Padang	5	Jan 2018	Keluarga
43	Ahmad Wijaya	Padang	5	Des 2017	Keluarga
43	ihsanadh	Makassar	4	Jul 2016	Keluarga
43	iwan s	Jakarta	3	Jan 2017	Pasangan
43	Embara	Padang	4	Jan 2017	Pasangan
44	Duan	Padang	3	Nov 2019	Teman
44	Almadinah-Pariaman	Padang	5	Jul 2018	Keluarga
44	Looliequeen	Padang	4	Jun 2018	Keluarga
44	OkeTravel	Riau	5	Mar 2018	Keluarga
44	Abu U	Padang	5	Des 2017	Keluarga
44	Rozi Saputra U	Padang	5	Mar 2017	Keluarga
44	Agusti Esden	Tangerang Selatan	4	Jul 2016	Keluarga
44	M Richan	Padang	2	Okt 2016	Keluarga
44	Septy K	Padang	4	Sep 2016	Teman
44	eshaple	Medan	5	Jan 2016	Teman
45	NIA_MARPA	Medan	3	Nov 2018	Teman
45	Antohokkeh	Padang	5	Sep 2018	Teman
45	dewirof	Jakarta	3	Jun 2017	Keluarga
45	Andri K	Medan	3	Mar 2017	Teman
45	tjutjukbs	Surabaya	4	Feb 2017	Teman
45	pahlevi p	Padang	5	Okt 2016	Keluarga
45	Anida_Krisstini	Padang	3	Okt 2015	Bisnis
45	shafarul i	Bukittinggi	3	Agt 2015	Keluarga
45	Agusti Esden	Tangerang Selatan	3	Feb 2015	Keluarga
45	Bujang L	Pekanbaru	3	Sep 2015	Pasangan
46	yudhi k	Padang	5	Agt 2019	Teman
46	Pasya	Pekanbaru	4	Agt 2018	Keluarga
46	Citra F	Jakarta	3	Sep 2017	Keluarga
46	sabrina_ho88	Padang	5	Jan 2016	Keluarga
46	Andri Zainal Kari	Jakarta	5	Sep 2015	Keluarga
46	Riffno K	Padang	3	Agt 2015	Keluarga
46	mestikesini	West Sumatra	5	Agt 2014	Keluarga
46	virad2014	Padang	5	Jan 2023	Keluarga
46	Sophia_LSF	Kuala Lumpur	4	Okt 2015	Keluarga
46	Darnel-HDI	Jakarta	4	Des 2014	Keluarga
47	Valiant Vemby	Bukittinggi	4	Mar 2019	Teman
47	Pasya	Pekanbaru	4	Sep 2018	Keluarga
47	Dhany Alfaruq	Bukittinggi	5	Jul 2018	Sendiri
47	Sitti Nur Rachm... K	Padang	4	Mei 2018	Pasangan
47	becitirta	Bandung	4	Okt 2017	Keluarga
47	Adiguna M	Padang	3	Jul 2016	Keluarga
47	Perlengkapan B	Padang	4	Agt 2016	Keluarga
47	Anida_Krisstini	Padang	3	Nov 2015	Teman
47	Hidayati D	Tangerang	4	Agt 2016	Teman
47	ida_srini	Padang	4	Agt 2016	Sendiri
48	Dyandra66	Bandung	4	Mar 2020	Pasangan
48	anida krisstini	Padang	5	Nov 2019	Teman
48	hkrishna2014	Padang	3	Okt 2019	Pasangan
48	MyCiamik	Padang	4	Jan 2019	Keluarga
48	Dhany Alfaruq	Bukittinggi	4	Nov 2018	Sendiri
48	Emma R	Binjai	2	Sep 2017	Sendiri
48	Antohokkeh	Padang	4	Mar 2018	Teman
48	rahelsyanivia	Pekanbaru	5	Mar 2018	Pasangan
48	Malin U	Bukittinggi	5	Mar 2018	Keluarga
48	zain5urvey	Sentani	5	Jan 2017	Sendiri
49	Nasirullah Sitam	Yogyakarta	5	Okt 2018	Keluarga
49	Felia putri	Padang	4	Jun 2018	Keluarga
49	izzu-kun	Padang	3	Nov 2018	Pasangan
49	Agusti Esden	Tangerang Selatan	4	Sep 2018	Keluarga
49	Antohokkeh	Padang	5	Okt 2018	Teman
49	wanderlustid	Padang	3	Des 2017	Sendiri
49	kk_funky	Jakarta	4	Jun 2018	Keluarga
49	Supriyono S Prio	Tangerang Selatan	4	Okt 2017	Sendiri
49	dewi_rizki	Makassar	3	Sep 2017	Bisnis
49	Ummiaiz	Padang	5	Mar 2017	Keluarga
50	Malibou Organizer	Padang Pariaman	5	Des 2019	Bisnis
50	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
50	OkeTravel	Riau	5	Jun 2018	Keluarga
50	fanimami	Pekanbaru	4	Okt 2016	Keluarga
50	tjutjukbs	Surabaya	4	Feb 2017	Teman
50	sofian c	Padang	3	Jul 2016	Keluarga
50	Kermit Y	Padang	4	Jun 2016	Teman
50	shafarul i	Bukittinggi	4	Agt 2015	Teman
50	Puanmh2017	Kuala Lumpur	4	Jan 2020	Keluarga
51	anak rantau	Banda Aceh	5	Okt 2018	Pasangan
51	Antohokkeh	Padang	3	Sep 2018	Teman
51	tessarahmadani2	Pariaman	5	Apr 2018	Keluarga
51	tjutjukbs	Surabaya	4	Feb 2017	Teman
51	indraamir	Jakarta	4	Feb 2016	Keluarga
51	Dikki B.A.	Bogor	4	Agt 2016	Teman
51	shafarul i	Bukittinggi	4	Des 2015	Teman
51	Evinayaspi	Padang	3	Mar 2016	Keluarga
51	Haikal1988	Payakumbuh	5	Des 2015	Keluarga
51	Agusti Esden	Tangerang Selatan	4	Apr 2015	Keluarga
52	Rachella Homestay	Batusangkar	5	Jul 2019	Teman
52	Dizzman	Jakarta	4	Nov 2018	Keluarga
52	kk_funky	Jakarta	5	Des 2017	Sendiri
52	pLORAkeph	Jakarta	5	Des 2017	Bisnis
52	hiburansepi	Bandung	3	Sep 2016	Teman
52	ida_srini	Padang	4	Agt 2016	Teman
52	shafarul i	Bukittinggi	4	Des 2015	Teman
52	Ichazizah	Jakarta	3	Mei 2015	Teman
52	Laurent R	Singapura	3	Okt 2015	Pasangan
52	esubijono	Jakarta	4	Agt 2015	Keluarga
53	Shinta	Padang	3	Des 2019	Keluarga
53	Pasya	Pekanbaru	4	Agt 2018	Keluarga
53	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
53	vella ovelia	Padang	5	Okt 2018	Teman
53	OkeTravel	Riau	4	Jun 2018	Keluarga
53	yoliyoliandra8	Padang	4	Mei 2017	Teman
53	Alfalegro	Jakarta	4	Apr 2017	Keluarga
53	tjutjukbs	Surabaya	4	Feb 2017	Teman
53	Riana P	Padang	4	Jan 2016	Teman
53	eshaple	Medan	4	Jan 2016	Teman
54	Valiant Vemby	Bukittinggi	4	Jun 2019	Keluarga
54	Sefanya travel	Padang	5	Nov 2018	Bisnis
54	Hodril B	Padang	3	Agt 2018	Keluarga
54	Lidya J	Padang	5	Jan 2018	Keluarga
54	Dwi Panuntun	Tangerang Selatan	5	Okt 2017	Keluarga
54	Mira Emirina	Padang	4	Jul 2017	Keluarga
54	amell92	Padang	4	Agt 2016	Keluarga
54	shafarul i	Bukittinggi	4	Agt 2015	Keluarga
54	dendirahmat	Padang Panjang	4	Sep 2015	Teman
54	PoerJaya	Bekasi	4	Des 2015	Keluarga
55	Frenji	Padang	5	Nov 2019	Teman
55	Ahmad Fauzan	Padang Pariaman	4	Jan 2019	Teman
55	hendysuherman86	Jakarta	4	Des 2018	Keluarga
55	irmadevita	Jakarta	4	Apr 2017	Keluarga
55	shafarul i	Bukittinggi	4	Mar 2016	Teman
55	Nilah R	Provinsi Jambi	5	Jan 2015	Teman
55	santo_chua	Batam	5	Mar 2020	Teman
55	Fess S	Tucson	1	Mei 2019	Pasangan
55	Darnel-HDI	Jakarta	4	Jun 2014	Keluarga
56	zak T	San Diego	5	Apr 2015	Teman
57	Ewi D	Pekanbaru	4	Feb 2019	Keluarga
57	Dizzman	Jakarta	4	Nov 2018	Keluarga
57	kk_funky	Jakarta	5	Des 2017	Sendiri
57	pLORAkeph	Jakarta	5	Des 2017	Bisnis
57	helena y	Padang	4	Jun 2017	Keluarga
57	shafarul i	Bukittinggi	4	Nov 2015	Teman
57	Ichazizah	Jakarta	4	Mei 2015	Teman
57	Laurent R	Singapura	3	Okt 2015	Pasangan
57	esubijono	Jakarta	4	Agt 2015	Keluarga
57	andreas_ertanto	Padang	4	Jul 2015	Keluarga
58	Antohokkeh	Padang	5	Des 2018	Keluarga
58	Citra F	Jakarta	5	Jun 2018	Keluarga
58	Ilham I	Padang	5	Feb 2018	Teman
58	indraamir	Jakarta	5	Feb 2016	Keluarga
58	shafarul i	Bukittinggi	4	Mei 2016	Teman
58	AlvianIbr	Jakarta	3	Jun 2015	Pasangan
58	syafrizal_info	Jakarta	5	Jan 2014	Keluarga
58	Agusti Esden	Tangerang Selatan	4	Okt 2013	Keluarga
59	Erik_Ariyanto	Kalimantan Barat	4	Jun 2019	Keluarga
59	tjutjukbs	Surabaya	4	Feb 2017	Teman
59	rispertani	Depok	5	Jul 2016	Sendiri
59	Reki H	Padang	5	Mar 2016	Teman
59	MairizaYulianti	Sumatera Utara	4	Sep 2015	Pasangan
59	Oky A	Padang	5	Feb 2016	Keluarga
59	Lilik S	Padang	4	Sep 2014	Teman
59	Danny Too	Petaling Jaya	5	Sep 2017	Pasangan
60	Rahmadini	Bogor	4	Agt 2020	Pasangan
60	Pasya	Pekanbaru	5	Apr 2019	Keluarga
60	Sefanya travel	Padang	5	Nov 2018	Keluarga
60	winaldo	Palembang	5	Jul 2016	Keluarga
61	Pasya	Pekanbaru	4	Apr 2019	Keluarga
61	Forza	Padang	5	Okt 2018	Teman
61	Citra F	Jakarta	5	Jun 2018	Keluarga
61	Fisra A	Jakarta	4	Jun 2016	Teman
61	Iman Sadesmesli	Depok	3	Nov 2016	Keluarga
61	Anida_Krisstini	Padang	3	Okt 2015	Teman
61	Teguh H	Padang	5	Sep 2016	Teman
61	langgeng14	Padang	5	Mar 2016	Teman
61	shafarul i	Bukittinggi	4	Agt 2015	Teman
61	dendirahmat	Padang Panjang	3	Feb 2015	Teman
62	Antohokkeh	Padang	5	Sep 2018	Teman
62	Ilham I	Padang	5	Feb 2018	Teman
62	Alfalegro	Jakarta	4	Apr 2017	Teman
62	hkrishna2014	Padang	3	Jun 2016	Keluarga
62	fachrulrozy	Padang	3	Sep 2015	Sendiri
62	dkahmad1	Bandung	4	Mar 2016	Bisnis
62	MairizaYulianti	Sumatera Utara	4	Agt 2015	Keluarga
62	dendirahmat	Padang Panjang	4	Des 2015	Sendiri
62	Adek M	Padang	4	Mei 2015	Keluarga
62	aria h	Solok	4	Jan 2015	Teman
63	Citra F	Jakarta	5	Jun 2018	Pasangan
63	pipin p	Jakarta	4	Des 2017	Keluarga
63	Fauzan z	Padang	5	Feb 2017	Teman
63	Dody A	Padang	4	Mei 2017	Keluarga
63	Adiguna M	Padang	3	Jul 2016	Keluarga
63	Dikki B.A.	Bogor	5	Sep 2016	Teman
63	Ragu88	Kuala Lumpur	5	Apr 2019	Teman
63	inascully	Kuala Lumpur	4	Feb 2019	Keluarga
63	Darnel-HDI	Jakarta	5	Sep 2016	Keluarga
63	Elfina Z	Kuala Lumpur	5	Okt 2016	Keluarga
64	Antohokkeh	Padang	5	Sep 2018	Teman
64	tanoe7788	Padang	3	Apr 2017	Pasangan
64	tjutjukbs	Surabaya	4	Feb 2017	Teman
64	Riana P	Padang	3	Sep 2015	Teman
64	andregiovando	Padang	5	Apr 2015	Keluarga
64	PaxJef	Padang	1	Mei 2015	Keluarga
64	allovesmel	Pekanbaru	5	Sep 2015	Teman
64	Hidayat S	Kuala Lumpur	5	Agt 2015	Teman
64	Aldi S	Bandung	4	Jul 2015	Teman
64	Rustandi E	Padang	5	Jul 2015	Teman
65	Antohokkeh	Padang	3	Sep 2018	Teman
65	kk_funky	Jakarta	4	Jun 2018	Keluarga
65	tanoe7788	Padang	4	Apr 2017	Pasangan
65	tjutjukbs	Surabaya	4	Feb 2017	Teman
65	srizandra	Pekanbaru	2	Jul 2015	Keluarga
65	FerdyDenny_Tulong	Manado	3	Okt 2015	Keluarga
65	kualanyiur	Bandung	3	Mei 2015	Keluarga
65	sabrina_ho88	Padang	4	Feb 2016	Bisnis
65	SANAMO	Padang	4	Jul 2014	Keluarga
65	hkrishna2014	Padang	3	Nov 2014	Sendiri
66	Ruth H	Pekanbaru	4	Jan 2019	Keluarga
66	Rizki A	Padang	3	Jul 2015	Pasangan
66	hamdiirza	Padang	3	Feb 2015	Keluarga
66	Albert825	Padang	5	Apr 2014	Keluarga
66	ate75	Pekanbaru	4	Apr 2014	Teman
66	Switenana	Pekanbaru	4	Jul 2016	Keluarga
66	Jack F	Bandung	4	Jan 2023	Keluarga
67	iwanskomari	Jakarta	4	Nov 2019	Keluarga
67	Rizky A	Jakarta	4	Mar 2019	Pasangan
67	Alfar	Tangerang	3	Apr 2019	Keluarga
67	sucay	Padang	4	Jun 2018	Teman
67	Agusti Esden	Tangerang Selatan	4	Sep 2018	Keluarga
67	wanderlustid	Padang	3	Des 2017	Teman
67	karenovera	Purwokerto	4	Agt 2018	Keluarga
67	kk_funky	Jakarta	4	Jun 2018	Keluarga
67	balance0906	Jakarta	4	Jun 2018	Sendiri
67	Ilham I	Padang	5	Jun 2017	Teman
68	Doditata	Padang	4	Sep 2021	Keluarga
68	Indindmil	Jakarta	4	Jan 2017	Keluarga
68	shafarul i	Bukittinggi	4	Jul 2016	Teman
68	sabrina_ho88	Padang	5	Jan 2016	Keluarga
68	jxbars	Denpasar	4	Jan 2016	Pasangan
68	Darnel-HDI	Jakarta	4	Agt 2015	Keluarga
69	kk_funky	Jakarta	3	Jun 2018	Keluarga
69	Citra F	Jakarta	5	Jun 2018	Sendiri
69	erw@n	Serpong	4	Nov 2013	Teman
69	ferinovriyal	Gorontalo	3	Sep 2013	Teman
69	Agusti Esden	Tangerang Selatan	5	Mar 2014	Keluarga
69	karimpaputungan	Jakarta	3	Feb 2014	Pasangan
69	Darnel-HDI	Jakarta	4	Mar 2015	Teman
70	Valiant Vemby	Bukittinggi	5	Sep 2018	Keluarga
70	Ryan	Malang	5	Mei 2019	Keluarga
70	Fisra A	Jakarta	4	Jul 2016	Keluarga
70	Puanmh2017	Kuala Lumpur	4	Jan 2020	Keluarga
71	Fisra A	Jakarta	4	Jul 2016	Keluarga
71	Fatimah A	Padang	5	Agt 2016	Keluarga
71	ida_srini	Padang	4	Agt 2016	Sendiri
71	shafarul i	Bukittinggi	4	Agt 2015	Teman
71	Hellen L	Jakarta	5	Jun 2014	Keluarga
72	Ika J	Padang	4	Des 2019	Teman
72	Sefanya travel	Padang	5	Nov 2019	Keluarga
72	Antohokkeh	Padang	3	Sep 2018	Teman
72	kk_funky	Jakarta	2	Jun 2018	Keluarga
72	Aris	Tangerang Selatan	4	Des 2017	Keluarga
72	gerage	Jakarta	3	Agt 2017	Bisnis
72	Widya O	Padang	3	Jun 2017	Sendiri
72	Jktmale	Jakarta	3	Agt 2016	Teman
72	Riana P	Padang	2	Agt 2016	Sendiri
72	Ariesadhar	Tangerang Selatan	2	Mei 2016	Sendiri
73	anida krisstini	Padang	5	Nov 2019	Keluarga
73	honestkaro	Kabanjahe	3	Jul 2017	Teman
73	agus muslim	Depok	4	Apr 2017	Keluarga
73	sabrina_ho88	Padang	5	Jun 2015	Keluarga
73	shafarul i	Bukittinggi	4	Feb 2016	Teman
73	dendirahmat	Padang Panjang	4	Feb 2016	Teman
74	TobiTim	Velbert	5	Jun 2019	Sendiri
74	Raoan azevedo	Padang	5	Des 2018	Pasangan
74	Meet the mentawai	Kepulauan Mentawai	5	Agt 2018	Bisnis
75	siti jalan jalan	Padang	3	Agt 2019	Pasangan
75	Erik_Ariyanto	Kalimantan Barat	2	Jun 2019	Keluarga
75	Rizky A	Jakarta	4	Mar 2019	Pasangan
75	sucay	Padang	4	Jun 2018	Teman
75	hesasoujiro	Jakarta	4	Okt 2017	Keluarga
75	kk_funky	Jakarta	4	Jun 2018	Keluarga
75	balance0906	Jakarta	3	Jun 2018	Sendiri
75	Puanmh2017	Kuala Lumpur	3	Jan 2020	Keluarga
75	Hasnah1962	Singapura	4	Mar 2018	Teman
76	Sefanya travel	Padang	5	Jul 2018	Keluarga
76	tjutjukbs	Surabaya	4	Feb 2017	Teman
76	Agusti Esden	Tangerang Selatan	4	Agt 2016	Keluarga
76	dewi_naglilya	Sawahlunto	5	Apr 2014	Teman
77	Rachella Homestay	Batusangkar	5	Jul 2019	Teman
77	Dizzman	Jakarta	4	Nov 2018	Keluarga
77	kk_funky	Jakarta	4	Des 2017	Sendiri
77	pLORAkeph	Jakarta	4	Des 2017	Keluarga
77	I Made T	Palembang	3	Sep 2016	Bisnis
77	ida_srini	Padang	3	Agt 2016	Teman
77	shafarul i	Bukittinggi	4	Des 2015	Teman
77	Laurent R	Singapura	4	Okt 2015	Pasangan
77	esubijono	Jakarta	3	Agt 2015	Keluarga
77	Palangkaraya	Jakarta	3	Des 2014	Keluarga
78	kaumNUsantara	Jakarta	4	Okt 2017	Pasangan
78	Ilham I	Padang	5	Jul 2017	Teman
78	Tri Julian H	Padang	5	Apr 2017	Teman
78	jawekmentour	Bekasi	5	Agt 2016	Teman
78	edwardorusfid	Jakarta	4	Agt 2016	Keluarga
78	Fasta'Iza N	Padang	4	Mar 2016	Teman
79	Valiant Vemby	Bukittinggi	4	Agt 2018	Teman
79	Dhany Alfaruq	Bukittinggi	5	Mar 2018	Pasangan
79	an_victor	Jakarta	3	Agt 2018	Keluarga
79	Fisra A	Jakarta	3	Jul 2016	Keluarga
79	Adiguna M	Padang	3	Jul 2016	Keluarga
79	ida_srini	Padang	3	Agt 2016	Keluarga
79	yoserizaladha	Pulau Bangka	4	Agt 2016	Keluarga
79	shafarul i	Bukittinggi	3	Jul 2016	Keluarga
79	sabrina_ho88	Padang	5	Feb 2016	Teman
79	MairizaYulianti	Sumatera Utara	3	Feb 2016	Keluarga
80	FebruariCeria	Jakarta	5	Mar 2020	Keluarga
80	Brigitta	Padang	4	Sep 2018	Teman
80	tjutjukbs	Surabaya	4	Feb 2017	Teman
81	LENNI5y	Jakarta	4	Jun 2019	Sendiri
81	siti jalan jalan	Padang	3	Agt 2019	Pasangan
81	Valiant Vemby	Bukittinggi	4	Mar 2019	Teman
81	Halidya	Padang	4	Des 2017	Bisnis
81	Puanmh2017	Kuala Lumpur	4	Jan 2020	Keluarga
81	arminhari	Yogyakarta	3	Okt 2019	Keluarga
81	IftekharA-Sep2016	Padang	4	Sep 2018	Pasangan
81	Danny Too	Petaling Jaya	4	Sep 2017	Pasangan
81	Aang174	Padang	4	Apr 2018	Teman
82	Sefanya travel	Padang	5	Jun 2019	Bisnis
82	Ahmad Fauzan	Padang Pariaman	5	Agt 2019	Pasangan
82	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
82	MansyahTanjung	Batam	4	Sep 2018	Keluarga
82	OkeTravel	Riau	4	Mar 2018	Keluarga
83	Pasya	Pekanbaru	4	Apr 2019	Keluarga
83	rent car & tour jogja	Yogyakarta	5	Mar 2019	Bisnis
83	mealbatros B	Medan	3	Jul 2016	Keluarga
83	marioluigiyoshi	Jakarta	4	Mei 2015	Keluarga
83	Nila S	Padang	5	Jul 2014	Keluarga
83	Yrref W	Padang	4	Nov 2014	Teman
84	evi d	Pekanbaru	5	Des 2019	Keluarga
84	Rachella Homestay	Batusangkar	3	Nov 2018	Teman
84	Fatimah A	Padang	5	Agt 2016	Keluarga
84	shafarul i	Bukittinggi	3	Agt 2015	Teman
84	Agusti Esden	Tangerang Selatan	5	Mar 2014	Keluarga
84	Darnel-HDI	Jakarta	4	Jul 2017	Teman
85	Dizzman	Jakarta	4	Nov 2018	Keluarga
85	ida_srini	Padang	3	Agt 2016	Teman
85	shafarul i	Bukittinggi	4	Des 2015	Teman
85	hamdiirza	Padang	3	Agt 2014	Keluarga
85	Agusti Esden	Tangerang Selatan	4	Mar 2014	Keluarga
85	645khairula	Kuala Lumpur	5	Mei 2017	Bisnis
86	mr. ari	Pekanbaru	3	Feb 2019	Keluarga
86	tjutjukbs	Surabaya	4	Feb 2017	Teman
86	Indindmil	Jakarta	5	Mei 2016	Keluarga
86	jekysusandi	Kuta	5	Mar 2015	Teman
87	Pasya	Pekanbaru	4	Apr 2019	Keluarga
87	mr. ari	Pekanbaru	4	Sep 2018	Keluarga
87	Indra R	Sumenep	5	Mei 2018	Keluarga
87	Nuurma	Padang	5	Mei 2017	Teman
88	rifa'atul K	Agam	4	Mar 2018	Teman
88	Fatimah A	Padang	5	Agt 2016	Keluarga
88	Mochram	Balikpapan	4	Jan 2015	Keluarga
88	muliati	Seremban	4	Agt 2019	Keluarga
89	Valiant Vemby	Bukittinggi	4	Agt 2018	Keluarga
89	Fisra A	Jakarta	4	Jul 2016	Teman
89	Laut2015	Padang	4	Okt 2016	Keluarga
89	shafarul i	Bukittinggi	3	Des 2015	Teman
89	dendirahmat	Padang Panjang	4	Nov 2015	Sendiri
90	sabrina_ho88	Padang	4	Agt 2016	Teman
90	tjutjukbs	Surabaya	4	Feb 2017	Teman
90	indraamir	Jakarta	5	Okt 2016	Keluarga
90	Dikki B.A.	Bogor	4	Sep 2016	Teman
90	Fauzan Darmi	Jakarta	3	Jul 2016	Keluarga
91	kk_funky	Jakarta	5	Des 2017	Sendiri
91	tjutjukbs	Surabaya	4	Feb 2017	Teman
91	hiburansepi	Bandung	4	Sep 2016	Teman
91	shafarul i	Bukittinggi	4	Nov 2015	Teman
92	imgar	Jakarta	4	Feb 2020	Keluarga
92	Dizzman	Jakarta	4	Nov 2018	Keluarga
92	ida_srini	Padang	4	Agt 2016	Teman
92	sucyfebriningsih	Pekanbaru	5	Apr 2016	Teman
93	Citra F	Jakarta	5	Jun 2018	Sendiri
93	Fisra A	Jakarta	4	Jul 2016	Teman
93	Laut2015	Padang	4	Jun 2015	Keluarga
93	Agusti Esden	Tangerang Selatan	5	Mar 2014	Keluarga
94	Ryan O	Padang	4	Jan 2017	Teman
94	Kermit Y	Padang	4	Sep 2016	Teman
94	agam12014	Padang	4	Nov 2013	Pasangan
94	Agusti Esden	Tangerang Selatan	4	Mar 2014	Keluarga
95	MarvinSitorus	Denpasar	3	Jun 2015	Pasangan
96	Forza	Padang	5	Agt 2019	Keluarga
97	Fasta'Iza N	Padang	4	Feb 2017	Teman
98	OkeTravel	Riau	5	Jan 2018	Keluarga
98	Asrilwandi	Padang	5	Jun 2017	Bisnis
99	Ryan	Malang	4	Apr 2019	Keluarga
99	OkeTravel	Riau	2	Mar 2018	Keluarga
99	NurJane11	Padang	5	Mar 2017	Keluarga
99	becitirta	Bandung	4	Okt 2017	Teman
100	tjutjukbs	Surabaya	4	Feb 2017	Teman
100	Aswarizky A	Pariaman	5	Jan 2016	Teman
100	Asrilwandi	Padang	4	Feb 2016	Teman
101	Sabai-Nan-Aluih	Padang	3	Jan 2023	Keluarga
102	elvinadiah	Depok	5	Nov 2017	Keluarga
102	Fisra A	Jakarta	4	Jul 2016	Teman
102	shafarul i	Bukittinggi	4	Feb 2016	Teman
102	dendirahmat	Padang Panjang	3	Feb 2016	Teman
103	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
103	Aisah I	Padang	5	Jul 2017	Keluarga
103	Alfalegro	Jakarta	4	Apr 2017	Keluarga
103	tjutjukbs	Surabaya	4	Feb 2017	Teman
103	M Richan	Padang	3	Sep 2016	Pasangan
103	Dikki B.A.	Bogor	4	Agt 2016	Teman
104	sucyfebriningsih	Pekanbaru	5	Apr 2016	Teman
105	rispertani	Depok	5	Jul 2017	Keluarga
106	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
106	OkeTravel	Riau	5	Mei 2018	Keluarga
107	Listia Vidyawat... M	Bogor	4	Jul 2018	Keluarga
107	alghozi	Medan	4	Mar 2018	Keluarga
108	shafarul i	Bukittinggi	4	Des 2015	Teman
108	Laurent R	Singapura	3	Okt 2015	Pasangan
108	Agusti Esden	Tangerang Selatan	4	Mar 2014	Keluarga
109	tanoe7788	Padang	4	Apr 2017	Pasangan
109	tjutjukbs	Surabaya	4	Feb 2017	Teman
109	shafarul i	Bukittinggi	4	Jun 2016	Teman
110	Marcus_Me	Budapest	5	Nov 2011	Teman
111	sabrina_ho88	Padang	5	Jan 2019	Keluarga
112	Kermit Y	Padang	5	Des 2016	Teman
113	Rahayus101	Padang	5	Apr 2017	Keluarga
113	tjutjukbs	Surabaya	4	Feb 2017	Teman
113	eshaple	Medan	3	Jan 2016	Teman
113	shafarul i	Bukittinggi	4	Mei 2016	Teman
114	Dikki B.A.	Bogor	5	Sep 2016	Teman
115	Randi Novendra	Padang	3	Feb 2020	Sendiri
115	shafarul i	Bukittinggi	4	Feb 2016	Teman
115	Ganda S	Padang	3	Apr 2016	Teman
116	Singgah Sebentar Disini	Medan	5	Des 2021	Teman
116	Rahmaniah_Mardja	Padang	5	Des 2017	Sendiri
116	Raouldd	Madrid	5	Feb 2020	Sendiri
116	Csaba F	Budapest	5	Okt 2019	Keluarga
116	Simon	Montreal	5	Sep 2019	Pasangan
116	Monika	Padang	5	Sep 2019	Keluarga
116	Marie K	Padang	5	Agt 2019	Keluarga
116	Margo C	Padang	5	Jul 2019	Pasangan
116	Jan Dokulil	Padang	5	Jun 2019	Teman
117	mr. ari	Pekanbaru	4	Feb 2019	Keluarga
117	tessarahmadani2	Pariaman	4	Mar 2018	Teman
118	sabrina_ho88	Padang	5	Mar 2019	Keluarga
119	Ahmad Fauzan	Padang Pariaman	4	Apr 2019	Pasangan
120	Nomad628465	Padang	5	Nov 2019	Pasangan
120	Nur	Padang	5	Jul 2019	Keluarga
120	Hajimi Junsei	Padang	5	Mar 2019	Teman
120	Antohokkeh	Padang	5	Sep 2018	Teman
120	Emmi G	Padang	4	Apr 2015	Teman
120	ume	Padang	5	Mar 2020	Keluarga
120	Abdul K	Padang	5	Jan 2020	Keluarga
120	Sightseer462373	Padang	5	Jan 2020	Keluarga
120	Mohammad Alan Abdullah	Padang	5	Des 2019	Pasangan
120	Rahidah S	Singapura	5	Des 2019	Pasangan
121	endriano	Pekanbaru	4	Jan 2016	Teman
122	Valiant Vemby	Bukittinggi	4	Sep 2018	Keluarga
122	Looliequeen	Padang	4	Apr 2018	Keluarga
123	Aban Sheer	Benggala Barat	4	Mei 2019	Sendiri
124	Fasta'Iza N	Padang	5	Sep 2016	Teman
125	shafarul i	Bukittinggi	4	Des 2015	Teman
125	sylvandriaprianto	Palembang	4	Agt 2015	Bisnis
126	jonialexanderheytsit	Solok	4	Des 2017	Sendiri
126	ypudijanto	Jakarta	4	Okt 2017	Bisnis
127	rent car & tour jogja	Yogyakarta	5	Mar 2019	Bisnis
128	Didy Ardiano	Palupuh	4	Jun 2019	Keluarga
129	edwardorusfid	Jakarta	4	Agt 2016	Keluarga
130	Aban Sheer	Benggala Barat	4	Mei 2019	Sendiri
131	Citra F	Jakarta	5	Jun 2018	Keluarga
131	Ping L	Padang	1	Apr 2017	Sendiri
131	MarSya78	Padang	2	Mar 2016	Keluarga
132	Aban Sheer	Benggala Barat	3	Mei 2019	Sendiri
133	Tunas Karya Aluminium	Bukittinggi	4	Jul 2019	Keluarga
133	Chiquita P	Padang	4	Jul 2019	Teman
133	Sefanya travel	Padang	5	Okt 2018	Keluarga
133	Dhany Alfaruq	Bukittinggi	3	Des 2018	Sendiri
133	linda w	Padang	3	Nov 2017	Keluarga
133	Wihartanto	Tangerang Selatan	4	Okt 2017	Teman
133	YahyaHukmaShabyyan	Kuta	5	Apr 2018	Pasangan
133	ViNasution	Padang	5	Jan 2018	Keluarga
133	Ahmad Wijaya	Padang	5	Des 2017	Keluarga
133	Meyer75	Jakarta	3	Mar 2017	Teman
134	tjutjukbs	Surabaya	4	Feb 2017	Teman
135	Ozzi Rahmadeni	Bukittinggi	5	Mei 2018	Keluarga
135	Antohokkeh	Padang	4	Jan 2018	Teman
135	rasbens	Padang	5	Mei 2016	Pasangan
135	jxbars	Denpasar	4	Jan 2016	Pasangan
135	eastcoastrod0218	Singapura	5	Jan 2023	Keluarga
135	NickoSilfido	Jakarta	5	Agt 2014	Teman
135	senandoah	Padang	5	Mar 2014	Keluarga
135	Jon S	Jakarta	5	Jan 2020	Keluarga
135	danaJ41	Amersfoort	5	Agt 2019	Keluarga
135	Isaure D	Paris	5	Agt 2019	Keluarga
136	Ozzi Rahmadeni	Bukittinggi	5	Jul 2018	Keluarga
136	ronip2014	Padang	5	Jan 2023	Keluarga
136	Hana	Pulau Penang	5	Agt 2019	Pasangan
136	Kirstennfp	Grindsted	5	Mar 2019	Pasangan
136	Edita	Padang	5	Mar 2019	Teman
136	Nina Maria W	Kempten	5	Mar 2019	Teman
136	Fraser	Padang	5	Feb 2019	Teman
136	LoubLou21	Huddersfield	4	Jan 2019	Pasangan
136	mideboer03	Amsterdam	5	Sep 2018	Pasangan
136	Ceri-Cherry	Padang	5	Okt 2018	Sendiri
137	Antohokkeh	Padang	4	Sep 2018	Sendiri
137	Jantje1988	Padang	5	Nov 2019	Teman
137	cecile	Padang	5	Okt 2019	Keluarga
137	Safe and Healthy Travel	Hellendoorn	5	Okt 2019	Sendiri
137	Marion	Padang	5	Sep 2019	Keluarga
137	Kinga S	Padang	5	Jul 2019	Keluarga
137	Sara	Padang	5	Agt 2019	Keluarga
137	gladys160	Padang	5	Jul 2019	Teman
137	raksaka	Padang	5	Jun 2019	Teman
137	Chris	Padang	5	Mei 2019	Keluarga
138	Pasya	Pekanbaru	4	Apr 2019	Keluarga
138	Forza	Padang	4	Apr 2018	Keluarga
138	Anida_Krisstini	Padang	3	Sep 2016	Teman
138	Waskito T	Johor Bahru	5	Mar 2016	Keluarga
138	shafarul i	Bukittinggi	4	Mei 2015	Teman
138	dendirahmat	Padang Panjang	4	Mei 2015	Teman
138	Jacques V	Antwerpen	5	Nov 2019	Keluarga
138	TipsOfConcierge	Manila	5	Sep 2017	Pasangan
138	Elisse	Padang	4	Nov 2016	Teman
138	ASukadis	Jakarta	5	Des 2015	Keluarga
139	Lisbet_310183	Depok	4	Okt 2018	Sendiri
139	Antohokkeh	Padang	4	Sep 2018	Sendiri
139	Syifa F	Padang	1	Sep 2018	Keluarga
139	Excursion710027	Padang	3	Mei 2017	Sendiri
139	Meyer75	Jakarta	3	Mar 2017	Teman
139	Junidarmanto	Tangerang Selatan	4	Jul 2016	Sendiri
139	Y. Tri Herwanto	Jakarta	4	Sep 2016	Teman
139	huzaifi	Tangerang Selatan	3	Jul 2016	Bisnis
139	hendra	Palembang	3	Jul 2016	Keluarga
139	Basri Adhi	Bogor	4	Jul 2016	Keluarga
140	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
140	Kermit Y	Padang	5	Des 2016	Teman
140	Fasta'Iza N	Padang	5	Jul 2016	Teman
141	Vivyanti	Padang	5	Sep 2014	Teman
142	nina hasyim	Padang	1	Nov 2020	Sendiri
142	Sefanya travel	Padang	5	Nov 2019	Keluarga
142	Andri	Padang	1	Apr 2019	Bisnis
142	Racohel	Bellingen	2	Feb 2018	Keluarga
142	Kathleen C	Padang	5	Des 2017	Teman
143	Sefanya travel	Padang	5	Jul 2019	Sendiri
144	anak rantau	Banda Aceh	5	Mei 2019	Keluarga
144	Kermit Y	Padang	4	Jan 2017	Teman
144	mia permata	Jakarta	3	Jun 2018	Teman
144	Fasta'Iza N	Padang	5	Okt 2016	Sendiri
145	PoetZ	Padang	4	Agt 2016	Keluarga
146	irwan idris	Bukittinggi	3	Sep 2016	Keluarga
146	Satrio B	Padang	5	Mei 2016	Keluarga
146	BangkokLoft	Yeovil	3	Agt 2018	Pasangan
146	zarikh z	Padang	3	Feb 2017	Teman
146	David o	Padang	4	Des 2016	Keluarga
146	Fasta'Iza N	Padang	5	Okt 2016	Bisnis
147	Rini	Padang	5	Des 2019	Keluarga
147	Nanny V	Padang	4	Agt 2017	Teman
147	Sylvie D	Padang	5	Agt 2019	Keluarga
147	DamienLienART	Padang	5	Agt 2019	Keluarga
147	Marieke R	Arnhem	5	Jul 2019	Keluarga
147	Dreamer37651215239	Kuala Lumpur	5	Sep 2018	Pasangan
147	ZelManan	Padang	5	Feb 2019	Keluarga
147	MONNET S	Padang	5	Okt 2018	Keluarga
147	Torgane	Padang	5	Mar 2018	Teman
147	claire6	Padang	5	Mar 2018	Teman
148	Mike J	Padang	5	Jan 2023	Pasangan
148	Margaux M	Padang	5	Jul 2019	Keluarga
148	Sarah johns	Padang	5	Jul 2019	Teman
149	azah A	Padang	2	Agt 2017	Teman
150	70ava	Beijing	5	Jun 2023	Keluarga
151	Nofri delni	Padang	5	Nov 2021	Keluarga
151	Tio	Padang	5	Nov 2021	Teman
151	Zonel	Padang	5	Nov 2021	Pasangan
151	Ghiwen	Padang	5	Feb 2021	Pasangan
151	Putra	Padang	5	Jun 2021	Keluarga
151	Andre willy	Padang	3	Mei 2021	Keluarga
151	Reza Sri Wahyuni	Padang	5	Jun 2021	Keluarga
151	Syahju pandrizal	Padang	5	Jul 2020	Keluarga
151	Raif	Padang	5	Jun 2021	Pasangan
151	Arie Elang Lembah	Padang	5	Agt 2020	Keluarga
152	Travel771124	Payakumbuh	4	Mei 2018	Keluarga
152	David N	Padang	5	Nov 2017	Pasangan
152	kahfi f	Padang	5	Mei 2017	Bisnis
152	goodgrief1960	Bridgwater	5	Feb 2016	Pasangan
152	TessaB01	Padang	5	Okt 2016	Teman
153	Akiko N	Padang	5	Des 2021	Sendiri
153	Antohokkeh	Padang	4	Sep 2018	Bisnis
153	ritha s	Padang	5	Okt 2017	Teman
153	louisemr17	Jakarta	4	Okt 2017	Teman
153	wisnu f	Padang	5	Okt 2017	Bisnis
153	ojie l	Padang	5	Jul 2016	Keluarga
153	farta p	Padang	5	Mar 2017	Sendiri
153	Indah P	Padang	4	Jan 2017	Keluarga
153	Yuliza D	Padang	5	Mar 2017	Teman
153	indraamir	Jakarta	4	Apr 2016	Teman
154	Seon	Namyangju	5	Jan 2023	Keluarga
154	uta_germany	Padang	5	Mei 2019	Sendiri
154	Wahyu Bajok	Padang	5	Mei 2019	Sendiri
154	Nicholas	Padang	5	Sep 2019	Keluarga
155	Naim G	Padang	5	Mar 2022	Keluarga
155	Shamimi23	Singapura	5	Des 2019	Keluarga
155	Shamimi	Padang	5	Des 2019	Keluarga
155	LeendaKrill	Cyberjaya	5	Okt 2019	Teman
155	Azura I	Padang	5	Okt 2019	Teman
155	SitiMusa	Australia Barat	5	Sep 2019	Keluarga
155	Hana	Pulau Penang	5	Agt 2019	Pasangan
155	Vijay S	Padang	4	Agt 2019	Keluarga
155	Kai Qian	Padang	5	Agt 2019	Sendiri
155	Rita W	Padang	4	Agt 2019	Pasangan
156	Elizamurray92	Padang	5	Feb 2020	Keluarga
156	Coal Coast Movement	Thirroul	5	Apr 2020	Keluarga
157	Hatikasih	Padang	4	Des 2013	Sendiri
158	Easy Holiday Tour Travel Management	Bukittinggi	5	Jun 2022	Bisnis
158	Rahayu F	Padang	5	Jun 2022	Sendiri
158	Catherine Gallo	Padang	5	Feb 2020	Pasangan
158	Reka	Padang	5	Jul 2019	Sendiri
158	Monica A	Padang	5	Feb 2020	Sendiri
159	Claris Lee W	Padang	5	Jan 2023	Keluarga
160	Sella Chalia	Padang	5	Okt 2018	Keluarga
161	Janelle O	Padang	5	Jan 2023	Sendiri
162	nikki088	Thirroul	5	Mar 2019	Keluarga
163	roby	Padang	4	Jan 2019	Keluarga
163	Valiant Vemby	Bukittinggi	3	Apr 2019	Keluarga
163	Forza	Padang	3	Okt 2018	Teman
163	hkrishna2014	Padang	3	Des 2018	Teman
164	Fauziah Ibrahim	Kuala Lumpur	5	Mar 2020	Teman
165	Naufal	Padang	5	Jul 2019	Teman
166	imam	Padang	5	Mar 2022	Teman
167	Reily S	Padang	2	Okt 2018	Teman
\.


--
-- TOC entry 3193 (class 2606 OID 24803)
-- Name: daerah daerah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daerah
    ADD CONSTRAINT daerah_pkey PRIMARY KEY (nama_daerah);


--
-- TOC entry 3199 (class 2606 OID 24823)
-- Name: jenis jenis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis
    ADD CONSTRAINT jenis_pkey PRIMARY KEY (peringkat, nama_jenis);


--
-- TOC entry 3195 (class 2606 OID 24808)
-- Name: objek_wisata objek_wisata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objek_wisata
    ADD CONSTRAINT objek_wisata_pkey PRIMARY KEY (peringkat);


--
-- TOC entry 3201 (class 2606 OID 24833)
-- Name: operasional operasional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operasional
    ADD CONSTRAINT operasional_pkey PRIMARY KEY (kode_operasional);


--
-- TOC entry 3197 (class 2606 OID 24818)
-- Name: pengelola pengelola_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengelola
    ADD CONSTRAINT pengelola_pkey PRIMARY KEY (nama_pengelola);


--
-- TOC entry 3203 (class 2606 OID 24860)
-- Name: ulasan_teratas ulasan_teratas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan_teratas
    ADD CONSTRAINT ulasan_teratas_pkey PRIMARY KEY (peringkat, nama_akun_pengunjung);


--
-- TOC entry 3207 (class 2606 OID 24824)
-- Name: jenis jenis_peringkat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis
    ADD CONSTRAINT jenis_peringkat_fkey FOREIGN KEY (peringkat) REFERENCES public.objek_wisata(peringkat);


--
-- TOC entry 3204 (class 2606 OID 24851)
-- Name: objek_wisata objek_wisata_kode_operasional_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objek_wisata
    ADD CONSTRAINT objek_wisata_kode_operasional_fkey FOREIGN KEY (kode_operasional) REFERENCES public.operasional(kode_operasional);


--
-- TOC entry 3205 (class 2606 OID 24809)
-- Name: objek_wisata objek_wisata_nama_daerah_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objek_wisata
    ADD CONSTRAINT objek_wisata_nama_daerah_fkey FOREIGN KEY (nama_daerah) REFERENCES public.daerah(nama_daerah);


--
-- TOC entry 3206 (class 2606 OID 24846)
-- Name: objek_wisata objek_wisata_nama_pengelola_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objek_wisata
    ADD CONSTRAINT objek_wisata_nama_pengelola_fkey FOREIGN KEY (nama_pengelola) REFERENCES public.pengelola(nama_pengelola);


--
-- TOC entry 3208 (class 2606 OID 24861)
-- Name: ulasan_teratas ulasan_teratas_peringkat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan_teratas
    ADD CONSTRAINT ulasan_teratas_peringkat_fkey FOREIGN KEY (peringkat) REFERENCES public.objek_wisata(peringkat);


-- Completed on 2023-07-13 00:22:28

--
-- PostgreSQL database dump complete
--

