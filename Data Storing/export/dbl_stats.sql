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
-- Name: match_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_info (
    date_time character varying(30) NOT NULL,
    type character varying(5) NOT NULL,
    venue character varying(20) NOT NULL,
    winner character varying(50) NOT NULL
);


ALTER TABLE public.match_info OWNER TO postgres;

--
-- Name: official; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.official (
    name character varying(50) NOT NULL,
    school character varying(50) NOT NULL,
    gender character varying(6),
    age character varying(2)
);


ALTER TABLE public.official OWNER TO postgres;

--
-- Name: official_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.official_role (
    name character varying(50) NOT NULL,
    job_type character varying(5) NOT NULL,
    job_role character varying(15) NOT NULL
);


ALTER TABLE public.official_role OWNER TO postgres;

--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    name character varying(50) NOT NULL,
    school character varying(50) NOT NULL,
    gender character varying(6),
    age character varying(2)
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_stats (
    date_time character varying(30) NOT NULL,
    name character varying(50) NOT NULL,
    "position" character varying(7),
    minute character varying(5),
    points character varying(2),
    assists character varying(2),
    rebound character varying(2)
);


ALTER TABLE public.player_stats OWNER TO postgres;

--
-- Name: school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school (
    name character varying(50) NOT NULL,
    address_street character varying(70) NOT NULL,
    address_subdistrict character varying(20),
    address_city character varying(20) NOT NULL
);


ALTER TABLE public.school OWNER TO postgres;

--
-- Name: team_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_stats (
    date_time character varying(30) NOT NULL,
    name character varying(50) NOT NULL,
    score integer,
    field_goal character varying(5),
    field_goal_pct character varying(5),
    two_pts character varying(5),
    two_pts_pct character varying(5),
    three_pts character varying(5),
    three_pts_pct character varying(5),
    free_throw character varying(5),
    free_throw_pct character varying(5),
    rebound_od character varying(5),
    assist integer,
    steal integer,
    block integer,
    turnover integer,
    foul integer,
    pts_off_turnover integer
);


ALTER TABLE public.team_stats OWNER TO postgres;

--
-- Data for Name: match_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_info (date_time, type, venue, winner) FROM stdin;
10 Sep 2022 11:00 WIB	Boys	DBL Arena Surabaya	SMA GLORIA 1 SURABAYA
10 Sep 2022 12:40 WIB	Boys	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
10 Sep 2022 14:20 WIB	Boys	DBL Arena Surabaya	SMAN 3 SIDOARJO
10 Sep 2022 16:00 WIB	Boys	DBL Arena Surabaya	SMA CIPUTRA SURABAYA
10 Sep 2022 17:40 WIB	Boys	DBL Arena Surabaya	SMAN 16 SURABAYA
10 Sep 2022 19:20 WIB	Boys	DBL Arena Surabaya	SMA CITA HATI EAST SURABAYA
11 Sep 2022 10:30 WIB	Boys	DBL Arena Surabaya	SMA SANTO HENDRIKUS SURABAYA
11 Sep 2022 12:10 WIB	Boys	DBL Arena Surabaya	SMAN 20 SURABAYA
11 Sep 2022 13:50 WIB	Boys	DBL Arena Surabaya	SMAN 1 PURI MOJOKERTO
11 Sep 2022 15:30 WIB	Boys	DBL Arena Surabaya	SMA FRATERAN SURABAYA
11 Sep 2022 17:10 WIB	Boys	DBL Arena Surabaya	SMAN 9 SURABAYA
11 Sep 2022 18:50 WIB	Boys	DBL Arena Surabaya	SMAN 1 WARU
12 Sep 2022 10:30 WIB	Boys	DBL Arena Surabaya	SMA PETRA 1 SURABAYA
12 Sep 2022 12:10 WIB	Girls	DBL Arena Surabaya	SMA GLORIA 1 SURABAYA
12 Sep 2022 13:50 WIB	Girls	DBL Arena Surabaya	SMA GLORIA 2 SURABAYA
12 Sep 2022 15:30 WIB	Boys	DBL Arena Surabaya	SMAN 1 SURABAYA
12 Sep 2022 17:10 WIB	Boys	DBL Arena Surabaya	SMAN 1 GRESIK
12 Sep 2022 18:50 WIB	Boys	DBL Arena Surabaya	SMAN 2 SURABAYA
13 Sep 2022 10:30 WIB	Boys	DBL Arena Surabaya	SMA FRATERAN SURABAYA
13 Sep 2022 12:10 WIB	Girls	DBL Arena Surabaya	SMAN 1 PURI MOJOKERTO
13 Sep 2022 13:50 WIB	Girls	DBL Arena Surabaya	SMAN 16 SURABAYA
13 Sep 2022 15:30 WIB	Boys	DBL Arena Surabaya	SMA CITA HATI EAST SURABAYA
13 Sep 2022 17:10 WIB	Boys	DBL Arena Surabaya	SMAN 9 SURABAYA
13 Sep 2022 18:50 WIB	Boys	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
14 Sep 2022 13:30 WIB	Girls	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
14 Sep 2022 15:10 WIB	Boys	DBL Arena Surabaya	SMA CIPUTRA SURABAYA
14 Sep 2022 16:50 WIB	Girls	DBL Arena Surabaya	SMAN 1 WARU
14 Sep 2022 18:30 WIB	Boys	DBL Arena Surabaya	SMAN 1 WARU
15 Sep 2022 13:30 WIB	Girls	DBL Arena Surabaya	SMA NATION STAR ACADEMY SURABAYA
15 Sep 2022 15:10 WIB	Boys	DBL Arena Surabaya	SMA PETRA 1 SURABAYA
15 Sep 2022 16:50 WIB	Boys	DBL Arena Surabaya	SMAN 2 SURABAYA
15 Sep 2022 18:30 WIB	Girls	DBL Arena Surabaya	SMAN 19 SURABAYA
16 Sep 2022 14:00 WIB	Girls	DBL Arena Surabaya	SMAN 16 SURABAYA
16 Sep 2022 15:40 WIB	Boys	DBL Arena Surabaya	SMA FRATERAN SURABAYA
16 Sep 2022 17:20 WIB	Girls	DBL Arena Surabaya	SMA GLORIA 1 SURABAYA
16 Sep 2022 19:00 WIB	Boys	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
17 Sep 2022 13:30 WIB	Girls	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
17 Sep 2022 15:10 WIB	Boys	DBL Arena Surabaya	SMAN 1 WARU
17 Sep 2022 16:50 WIB	Girls	DBL Arena Surabaya	SMA NATION STAR ACADEMY SURABAYA
17 Sep 2022 18:30 WIB	Boys	DBL Arena Surabaya	SMAN 2 SURABAYA
18 Sep 2022 11:00 WIB	Girls	DBL Arena Surabaya	SMA GLORIA 1 SURABAYA
18 Sep 2022 13:30 WIB	Girls	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
18 Sep 2022 16:00 WIB	Boys	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
18 Sep 2022 18:00 WIB	Boys	DBL Arena Surabaya	SMAN 2 SURABAYA
20 Sep 2022 14:00 WIB	Girls	DBL Arena Surabaya	SMA GLORIA 1 SURABAYA
20 Sep 2022 17:00 WIB	Boys	DBL Arena Surabaya	SMA ST LOUIS 1 SURABAYA
\.


--
-- Data for Name: official; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.official (name, school, gender, age) FROM stdin;
Nandesha Nensia D.c	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Aries Herman	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Otniel Nugroho	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Catur Budiono	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Desandrew Pudyo Tinoto Adiwidjaja	SMA GLORIA 1 SURABAYA	\N	\N
Erlina Christiana	SMA GLORIA 1 SURABAYA	\N	\N
Yogi Dian Kurniawan	SMA GLORIA 1 SURABAYA	\N	\N
Thasya Hery Saputera	SMA GLORIA 1 SURABAYA	\N	\N
Ivan Widianto	SMA ST LOUIS 1 SURABAYA	\N	\N
Lena Anel	SMA ST LOUIS 1 SURABAYA	\N	\N
Novan Ali	SMA ST LOUIS 1 SURABAYA	\N	\N
Paulus Dwintarto	SMA ST LOUIS 1 SURABAYA	\N	\N
Ateng Sugijanto	SMA CITA HATI WEST SURABAYA	\N	\N
Budi Santoso	SMA CITA HATI WEST SURABAYA	\N	\N
Stevanus Findi Arianto	SMA CITA HATI WEST SURABAYA	\N	\N
Kristianto Panjaitan	SMA CITA HATI WEST SURABAYA	\N	\N
Dhimas Fitriasmara	SMAN 3 SIDOARJO	\N	\N
Rafdi Ghazi	SMAN 3 SIDOARJO	\N	\N
Susilawati Endang	SMAN 3 SIDOARJO	\N	\N
Satria Nauval	SMAN 3 SIDOARJO	\N	\N
Fandi Haliem	SMA PETRA 5 SURABAYA	\N	\N
Ave Graceota, M.pd.	SMA PETRA 5 SURABAYA	\N	\N
Yohanes Febrianto Bagas Wicaksono	SMA PETRA 5 SURABAYA	\N	\N
Dave Handoko	SMA PETRA 5 SURABAYA	\N	\N
Soewondo	SMA CIPUTRA SURABAYA	\N	\N
Henricus Hari Santoso	SMA CIPUTRA SURABAYA	\N	\N
Dedy Sulistyo	SMA CIPUTRA SURABAYA	\N	\N
Anik Windi Daryani	SMA CIPUTRA SURABAYA	\N	\N
Sofyan Ramdhan	SMAN 10 SURABAYA	\N	\N
Kresna Gemilang Rahardiansyah	SMAN 10 SURABAYA	\N	\N
Sentot Sugihartono	SMAN 10 SURABAYA	\N	\N
Mohammad Rayhan Rafif Sirajuddin	SMAN 10 SURABAYA	\N	\N
Sagita Marianto, S.pd.	SMAN 16 SURABAYA	\N	\N
Alfian Rachmat Fathoni	SMAN 16 SURABAYA	\N	\N
Arrofiu Putra	SMAN 16 SURABAYA	\N	\N
D.dananjaya	SMAN 16 SURABAYA	\N	\N
Yeti Marisa Pramulia	SMAN 4 SURABAYA	\N	\N
Reinaldo Dwiga Islamey	SMAN 4 SURABAYA	\N	\N
Fariestetra	SMAN 4 SURABAYA	\N	\N
Adhin	SMAN 4 SURABAYA	\N	\N
Troiza Panahwan	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Droleo B	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Arizal Fitra Firdaus	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Muhammad Renaldy Erirsalda	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Ernest	SMA CITA HATI EAST SURABAYA	\N	\N
Dony Nanda Saputra	SMA CITA HATI EAST SURABAYA	\N	\N
Christina Lukman	SMA CITA HATI EAST SURABAYA	\N	\N
Trifena Debora R	SMA CITA HATI EAST SURABAYA	\N	\N
Decky	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Felix Ligan	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Martinus Ana Sega	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Eva	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Kamal Ruchiyat	SMA ITP SURABAYA	\N	\N
Abidin	SMA ITP SURABAYA	\N	\N
Mas Ishaq Rizal	SMA ITP SURABAYA	\N	\N
Martondo Soekito	SMA ITP SURABAYA	\N	\N
Septian Rizky Saputra	SMAN 20 SURABAYA	\N	\N
M Haidar Azizi	SMAN 20 SURABAYA	\N	\N
Faris Afrianto	SMAN 20 SURABAYA	\N	\N
Fadhil Bahri	SMAN 20 SURABAYA	\N	\N
Ristogerol Foekh	SMA GLORIA 2 SURABAYA	\N	\N
Brigita Gloria	SMA GLORIA 2 SURABAYA	\N	\N
Robi Dharmawan	SMA GLORIA 2 SURABAYA	\N	\N
Natha Bella Angella	SMA GLORIA 2 SURABAYA	\N	\N
Mukhammad Al Amin	SMAN 1 PURI MOJOKERTO	\N	\N
Ony Octariza Purnama Putra	SMAN 1 PURI MOJOKERTO	\N	\N
Muhammmad Riyanto	SMAN 1 PURI MOJOKERTO	\N	\N
Sugiarto Cahya	SMAN 1 PURI MOJOKERTO	\N	\N
Waseto	SMAN 3 SURABAYA	\N	\N
Fathurrozi Suryana	SMAN 3 SURABAYA	\N	\N
Bambangbreta Ekasetyawan	SMAN 3 SURABAYA	\N	\N
Lidia Marganingtyas	SMAN 3 SURABAYA	\N	\N
Kencana Wukir	SMA FRATERAN SURABAYA	\N	\N
Endro Hudarwanto	SMA FRATERAN SURABAYA	\N	\N
Ricky Yansen	SMA FRATERAN SURABAYA	\N	\N
Catur Hery	SMA FRATERAN SURABAYA	\N	\N
Barikh Bill Kautsar	SMAN 15 SURABAYA	\N	\N
Savero Seisa Mubin	SMAN 15 SURABAYA	\N	\N
Bima Tri Pradicta	SMAN 15 SURABAYA	\N	\N
Iqsal Yanuar Dwi Fianda	SMAN 15 SURABAYA	\N	\N
David Adiwardhana	SMA VITA SURABAYA	\N	\N
Eko Wahyu Priyanto	SMA VITA SURABAYA	\N	\N
Michael Mustamu	SMA VITA SURABAYA	\N	\N
Lia Puspita Sari	SMA VITA SURABAYA	\N	\N
Hardrianto	SMAN 9 SURABAYA	\N	\N
Hisaym Rahmansyah Abiyyu	SMAN 9 SURABAYA	\N	\N
Siti A'isyah	SMAN 9 SURABAYA	\N	\N
Fariz Purnama Aji	SMAN 9 SURABAYA	\N	\N
Thomas Christian	SMAN 1 WARU	\N	\N
Ellanggono Eka Putra	SMAN 1 WARU	\N	\N
Yudi Nurfianto Mr Rewel'z	SMAN 1 WARU	\N	\N
Refiana Ainnayyah	SMAN 1 WARU	\N	\N
Wahyudi Yunarto	SMA IPH EAST SURABAYA	\N	\N
Lydia Kris Handini	SMA IPH EAST SURABAYA	\N	\N
Agung Setiawan	SMA IPH EAST SURABAYA	\N	\N
Matraisa Baraasie	SMA IPH EAST SURABAYA	\N	\N
Liem Filixs	SMA PETRA 1 SURABAYA	\N	\N
Bagus Maulana	SMA PETRA 1 SURABAYA	\N	\N
Eko Firmantyo	SMA PETRA 1 SURABAYA	\N	\N
Hery Adiwasono	SMA PETRA 1 SURABAYA	\N	\N
Rainer Anggakara	SMA PETRA 2 SURABAYA	\N	\N
Sutanto	SMA PETRA 2 SURABAYA	\N	\N
Dri Andik Aria	SMA PETRA 2 SURABAYA	\N	\N
Yulianus Jeri Parung, S.pd.	SMA PETRA 2 SURABAYA	\N	\N
Argo Pamungkas	SMAN 2 MOJOKERTO	\N	\N
Akbar Yogi Nugroho	SMAN 2 MOJOKERTO	\N	\N
Endie Nurwantono	SMAN 2 MOJOKERTO	\N	\N
Riski Agustian	SMAN 2 MOJOKERTO	\N	\N
Jeremy Melvin	SMA GLORIA 2 SURABAYA	\N	\N
Galih Jimmy Lay	SMA GLORIA 2 SURABAYA	\N	\N
Joullius Christian Iroth	SMAN 5 SURABAYA	\N	\N
Andre Gunawan	SMAN 5 SURABAYA	\N	\N
Moh. Hayyun Satar	SMAN 5 SURABAYA	\N	\N
Mia Puspitasari	SMAN 5 SURABAYA	\N	\N
Farid Setiawan	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Ade Fitrianto	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Mhasanmahrobi	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Nuhairul Hikam	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Ragil Ar Rasyid	SMAN 1 SURABAYA	\N	\N
Nalson Tansu K	SMAN 1 SURABAYA	\N	\N
Reza Aditya Putra	SMAN 1 SURABAYA	\N	\N
Sharla Martiza H	SMAN 1 SURABAYA	\N	\N
Novan Dwi Erwanto, S.psi	SMAN 22 SURABAYA	\N	\N
Muhammad Wildan Ramadhani	SMAN 22 SURABAYA	\N	\N
Jan Aryaputra Agan	SMAN 22 SURABAYA	\N	\N
Adib Habibi	SMAN 22 SURABAYA	\N	\N
Muchsin 15	SMAN 1 GRESIK	\N	\N
Alvaro	SMAN 1 GRESIK	\N	\N
Fazar Arianto	SMAN 1 GRESIK	\N	\N
Akbar Karunia Putra	SMAN 1 GRESIK	\N	\N
Mauliddiyah	SMAN 5 SURABAYA	\N	\N
Koo Sri Padma Olanda	SMAN 5 SURABAYA	\N	\N
Drs Soedirman	SMAN 5 SURABAYA	\N	\N
Dhimas Aniz	SMAN 2 SURABAYA	\N	\N
Brahmanda	SMAN 2 SURABAYA	\N	\N
Hery Soelistijono	SMAN 2 SURABAYA	\N	\N
Rafly Putra Tritasyah	SMAN 2 SURABAYA	\N	\N
Candra Eka Putra	SMA PETRA 5 SURABAYA	\N	\N
Satria Bayu Aji, S.pd	SMA PETRA 5 SURABAYA	\N	\N
Rio Hardiansyah Pasaribu	SMA PETRA 5 SURABAYA	\N	\N
Bhisma Bomantara	SMAN 1 PURI MOJOKERTO	\N	\N
Sylvia Octavia Hidayati, S.iip	SMAN 1 PURI MOJOKERTO	\N	\N
David Tjahayadi	SMA ST LOUIS 1 SURABAYA	\N	\N
Hartono	SMAN 1 MOJOKERTO	\N	\N
Fitri Ratnasari	SMAN 1 MOJOKERTO	\N	\N
Erik Efendi	SMAN 1 MOJOKERTO	\N	\N
Lidya Kusuma Rahmadani	SMAN 1 MOJOKERTO	\N	\N
Andri Danarto	SMAN 1 WARU	\N	\N
Karina Salma Rizkita	SMAN 1 WARU	\N	\N
Neza Breliana	SMAN 1 WARU	\N	\N
Ridolof S Mamarodi	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Kintan Dyah Puspa	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Dhanendra Kusuma Wardhana	SMAN 19 SURABAYA	\N	\N
Ronald Pattiasina	SMAN 19 SURABAYA	\N	\N
Wahyu Nursasi	SMAN 19 SURABAYA	\N	\N
Vimamas Ainurrillah	SMAN 19 SURABAYA	\N	\N
Agung Setyo	SMAN 2 SIDOARJO	\N	\N
Setyo Ari Ramadhan	SMAN 2 SIDOARJO	\N	\N
Verry Kristian Ananta	SMAN 2 SIDOARJO	\N	\N
Ferdhinanto Galeh	SMAN 2 SIDOARJO	\N	\N
\.


--
-- Data for Name: official_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.official_role (name, job_type, job_role) FROM stdin;
Nandesha Nensia D.c	Boys	Coach
Nandesha Nensia D.c	Girls	Assistant Coach
Aries Herman	Boys	Assistant Coach
Aries Herman	Girls	Coach
Otniel Nugroho	Boys	Manager
Catur Budiono	Boys	Medical Support
Desandrew Pudyo Tinoto Adiwidjaja	Boys	Coach
Desandrew Pudyo Tinoto Adiwidjaja	Girls	Coach
Erlina Christiana	Boys	Assistant Coach
Erlina Christiana	Girls	Assistant Coach
Yogi Dian Kurniawan	Boys	Manager
Yogi Dian Kurniawan	Girls	Manager
Thasya Hery Saputera	Boys	Medical Support
Thasya Hery Saputera	Girls	Medical Support
Ivan Widianto	Boys	Coach
Lena Anel	Boys	Assistant Coach
Lena Anel	Girls	Coach
Novan Ali	Boys	Manager
Novan Ali	Girls	Manager
Paulus Dwintarto	Boys	Medical Support
Paulus Dwintarto	Girls	Medical Support
Ateng Sugijanto	Boys	Coach
Budi Santoso	Boys	Assistant Coach
Stevanus Findi Arianto	Boys	Manager
Kristianto Panjaitan	Boys	Medical Support
Dhimas Fitriasmara	Boys	Coach
Rafdi Ghazi	Boys	Assistant Coach
Susilawati Endang	Boys	Manager
Satria Nauval	Boys	Medical Support
Fandi Haliem	Boys	Coach
Ave Graceota, M.pd.	Boys	Assistant Coach
Yohanes Febrianto Bagas Wicaksono	Boys	Manager
Yohanes Febrianto Bagas Wicaksono	Girls	Assistant Coach
Dave Handoko	Boys	Medical Support
Soewondo	Boys	Coach
Henricus Hari Santoso	Boys	Assistant Coach
Dedy Sulistyo	Boys	Manager
Anik Windi Daryani	Boys	Medical Support
Sofyan Ramdhan	Boys	Coach
Kresna Gemilang Rahardiansyah	Boys	Assistant Coach
Sentot Sugihartono	Boys	Manager
Mohammad Rayhan Rafif Sirajuddin	Boys	Medical Support
Sagita Marianto, S.pd.	Boys	Coach
Sagita Marianto, S.pd.	Girls	Coach
Alfian Rachmat Fathoni	Boys	Assistant Coach
Alfian Rachmat Fathoni	Girls	Assistant Coach
Arrofiu Putra	Boys	Manager
Arrofiu Putra	Girls	Manager
D.dananjaya	Boys	Medical Support
D.dananjaya	Girls	Medical Support
Yeti Marisa Pramulia	Boys	Coach
Reinaldo Dwiga Islamey	Boys	Assistant Coach
Fariestetra	Boys	Manager
Adhin	Boys	Medical Support
Troiza Panahwan	Boys	Coach
Droleo B	Boys	Assistant Coach
Arizal Fitra Firdaus	Boys	Manager
Muhammad Renaldy Erirsalda	Boys	Medical Support
Ernest	Boys	Coach
Dony Nanda Saputra	Boys	Assistant Coach
Christina Lukman	Boys	Manager
Trifena Debora R	Boys	Medical Support
Decky	Boys	Coach
Felix Ligan	Boys	Assistant Coach
Martinus Ana Sega	Boys	Manager
Eva	Boys	Medical Support
Kamal Ruchiyat	Boys	Coach
Abidin	Boys	Assistant Coach
Mas Ishaq Rizal	Boys	Manager
Martondo Soekito	Boys	Medical Support
Septian Rizky Saputra	Boys	Coach
M Haidar Azizi	Boys	Assistant Coach
Faris Afrianto	Boys	Manager
Fadhil Bahri	Boys	Medical Support
Ristogerol Foekh	Boys	Coach
Brigita Gloria	Boys	Assistant Coach
Robi Dharmawan	Boys	Manager
Robi Dharmawan	Girls	Medical Support
Natha Bella Angella	Boys	Medical Support
Natha Bella Angella	Girls	Manager
Mukhammad Al Amin	Boys	Coach
Mukhammad Al Amin	Girls	Manager
Ony Octariza Purnama Putra	Boys	Assistant Coach
Ony Octariza Purnama Putra	Girls	Coach
Muhammmad Riyanto	Boys	Manager
Sugiarto Cahya	Boys	Medical Support
Waseto	Boys	Coach
Fathurrozi Suryana	Boys	Assistant Coach
Bambangbreta Ekasetyawan	Boys	Manager
Lidia Marganingtyas	Boys	Medical Support
Kencana Wukir	Boys	Coach
Kencana Wukir	Girls	Assistant Coach
Endro Hudarwanto	Boys	Assistant Coach
Endro Hudarwanto	Girls	Coach
Ricky Yansen	Boys	Manager
Ricky Yansen	Girls	Manager
Catur Hery	Boys	Medical Support
Catur Hery	Girls	Medical Support
Barikh Bill Kautsar	Boys	Coach
Barikh Bill Kautsar	Girls	Assistant Coach
Savero Seisa Mubin	Boys	Assistant Coach
Savero Seisa Mubin	Girls	Coach
Bima Tri Pradicta	Boys	Manager
Bima Tri Pradicta	Girls	Manager
Iqsal Yanuar Dwi Fianda	Boys	Medical Support
Iqsal Yanuar Dwi Fianda	Girls	Medical Support
David Adiwardhana	Boys	Coach
Eko Wahyu Priyanto	Boys	Assistant Coach
Michael Mustamu	Boys	Manager
Lia Puspita Sari	Boys	Medical Support
Hardrianto	Boys	Coach
Hisaym Rahmansyah Abiyyu	Boys	Assistant Coach
Siti A'isyah	Boys	Manager
Fariz Purnama Aji	Boys	Medical Support
Thomas Christian	Boys	Coach
Ellanggono Eka Putra	Boys	Assistant Coach
Yudi Nurfianto Mr Rewel'z	Boys	Manager
Yudi Nurfianto Mr Rewel'z	Girls	Manager
Refiana Ainnayyah	Boys	Medical Support
Wahyudi Yunarto	Boys	Coach
Lydia Kris Handini	Boys	Assistant Coach
Agung Setiawan	Boys	Manager
Matraisa Baraasie	Boys	Medical Support
Liem Filixs	Boys	Coach
Liem Filixs	Girls	Coach
Bagus Maulana	Boys	Assistant Coach
Bagus Maulana	Girls	Assistant Coach
Eko Firmantyo	Boys	Manager
Eko Firmantyo	Girls	Manager
Hery Adiwasono	Boys	Medical Support
Hery Adiwasono	Girls	Medical Support
Rainer Anggakara	Boys	Coach
Sutanto	Boys	Assistant Coach
Dri Andik Aria	Boys	Manager
Yulianus Jeri Parung, S.pd.	Boys	Medical Support
Argo Pamungkas	Girls	Coach
Akbar Yogi Nugroho	Girls	Assistant Coach
Endie Nurwantono	Girls	Manager
Riski Agustian	Girls	Medical Support
Jeremy Melvin	Girls	Coach
Galih Jimmy Lay	Girls	Assistant Coach
Joullius Christian Iroth	Girls	Coach
Andre Gunawan	Girls	Assistant Coach
Moh. Hayyun Satar	Girls	Manager
Moh. Hayyun Satar	Boys	Manager
Mia Puspitasari	Girls	Medical Support
Farid Setiawan	Boys	Coach
Ade Fitrianto	Boys	Assistant Coach
Mhasanmahrobi	Boys	Manager
Nuhairul Hikam	Boys	Medical Support
Ragil Ar Rasyid	Boys	Coach
Nalson Tansu K	Boys	Assistant Coach
Reza Aditya Putra	Boys	Manager
Sharla Martiza H	Boys	Medical Support
Novan Dwi Erwanto, S.psi	Boys	Coach
Muhammad Wildan Ramadhani	Boys	Assistant Coach
Jan Aryaputra Agan	Boys	Manager
Adib Habibi	Boys	Medical Support
Muchsin 15	Boys	Coach
Alvaro	Boys	Assistant Coach
Fazar Arianto	Boys	Manager
Akbar Karunia Putra	Boys	Medical Support
Mauliddiyah	Boys	Coach
Koo Sri Padma Olanda	Boys	Assistant Coach
Drs Soedirman	Boys	Medical Support
Dhimas Aniz	Boys	Coach
Brahmanda	Boys	Assistant Coach
Hery Soelistijono	Boys	Manager
Rafly Putra Tritasyah	Boys	Medical Support
Candra Eka Putra	Girls	Coach
Satria Bayu Aji, S.pd	Girls	Manager
Rio Hardiansyah Pasaribu	Girls	Medical Support
Bhisma Bomantara	Girls	Assistant Coach
Sylvia Octavia Hidayati, S.iip	Girls	Medical Support
David Tjahayadi	Girls	Assistant Coach
Hartono	Girls	Coach
Fitri Ratnasari	Girls	Assistant Coach
Erik Efendi	Girls	Manager
Lidya Kusuma Rahmadani	Girls	Medical Support
Andri Danarto	Girls	Coach
Karina Salma Rizkita	Girls	Assistant Coach
Neza Breliana	Girls	Medical Support
Ridolof S Mamarodi	Girls	Manager
Kintan Dyah Puspa	Girls	Medical Support
Dhanendra Kusuma Wardhana	Girls	Coach
Ronald Pattiasina	Girls	Assistant Coach
Wahyu Nursasi	Girls	Manager
Vimamas Ainurrillah	Girls	Medical Support
Agung Setyo	Girls	Coach
Setyo Ari Ramadhan	Girls	Assistant Coach
Verry Kristian Ananta	Girls	Manager
Ferdhinanto Galeh	Girls	Medical Support
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (name, school, gender, age) FROM stdin;
Roben Sasmita	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Kevin	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Bryant Kioshi	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Aurelio Mahesa Dzaky	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Brandon Markus Utomo	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Gerard Aurelio Soewandi	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Vinsens Sandriawan	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Sabrang Rigel Sadewa	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Kevin Christian Prijanto	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Macxquel Rehan Thiemailattu	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Jonathan Gerrard	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Freno Nymmo Shakkawijaya	SMA GLORIA 1 SURABAYA	\N	\N
Criston Jonathan Hananto	SMA GLORIA 1 SURABAYA	\N	\N
Yogie Putra Darmawan	SMA GLORIA 1 SURABAYA	\N	\N
Michael Jason Christian Widya	SMA GLORIA 1 SURABAYA	\N	\N
Pedro Valencio Sudarto	SMA GLORIA 1 SURABAYA	\N	\N
Richie Bertrand Linardi	SMA GLORIA 1 SURABAYA	\N	\N
Kennie Elbert Kristanto	SMA GLORIA 1 SURABAYA	\N	\N
Kenas Lebtinneo	SMA GLORIA 1 SURABAYA	\N	\N
Romualdus Reno Santoso	SMA GLORIA 1 SURABAYA	\N	\N
Kennard Austin Sutanto	SMA GLORIA 1 SURABAYA	\N	\N
Brennen Edric Winoto	SMA GLORIA 1 SURABAYA	\N	\N
Cliff Louis	SMA ST LOUIS 1 SURABAYA	\N	\N
Darren Tan	SMA ST LOUIS 1 SURABAYA	\N	\N
Nicholas Demily	SMA ST LOUIS 1 SURABAYA	\N	\N
Raffael Panji Amadeus	SMA ST LOUIS 1 SURABAYA	\N	\N
Kenneth Chandradinata	SMA ST LOUIS 1 SURABAYA	\N	\N
Jansen Cahyadi	SMA ST LOUIS 1 SURABAYA	\N	\N
Daniel Nicholas Delin	SMA ST LOUIS 1 SURABAYA	\N	\N
Justin Patrick Alex	SMA ST LOUIS 1 SURABAYA	\N	\N
William Wongsoadi	SMA ST LOUIS 1 SURABAYA	\N	\N
Lourencio Dustin	SMA ST LOUIS 1 SURABAYA	\N	\N
Alfonsus Bernd	SMA ST LOUIS 1 SURABAYA	\N	\N
Kylen Bennett Singohardjo	SMA CITA HATI WEST SURABAYA	\N	\N
Victor Yu	SMA CITA HATI WEST SURABAYA	\N	\N
Russel Gavriel Nio	SMA CITA HATI WEST SURABAYA	\N	\N
Christian Matthew Wibowo	SMA CITA HATI WEST SURABAYA	\N	\N
Eugene Sulistyo	SMA CITA HATI WEST SURABAYA	\N	\N
Francicus Xaverius Kimi Tjahjono	SMA CITA HATI WEST SURABAYA	\N	\N
Aaron Imanuel Tako	SMA CITA HATI WEST SURABAYA	\N	\N
Jovenel Axel Priyono	SMA CITA HATI WEST SURABAYA	\N	\N
Vincent Joshien Chawindra	SMA CITA HATI WEST SURABAYA	\N	\N
Michael Tjandranaya Lesmana	SMA CITA HATI WEST SURABAYA	\N	\N
Christopher Shawn Tanaka	SMA CITA HATI WEST SURABAYA	\N	\N
Izal Adiara	SMAN 3 SIDOARJO	\N	\N
Ahmad Akmal Syafi'i	SMAN 3 SIDOARJO	\N	\N
Danendra Laskar	SMAN 3 SIDOARJO	\N	\N
Nuno Xabiel Alfayza	SMAN 3 SIDOARJO	\N	\N
Yeheskiel Kaat	SMAN 3 SIDOARJO	\N	\N
Muhammad Tsany Qadama	SMAN 3 SIDOARJO	\N	\N
Ismail Rizqi	SMAN 3 SIDOARJO	\N	\N
Muhammad Zakky Satria Darmawan	SMAN 3 SIDOARJO	\N	\N
Yaqzhan Qushay Z	SMAN 3 SIDOARJO	\N	\N
Ahmad Bagas Saputra	SMAN 3 SIDOARJO	\N	\N
Afif Muhammad Raihan	SMAN 3 SIDOARJO	\N	\N
Darren Samuel Cristofer Lumba	SMA PETRA 5 SURABAYA	\N	\N
Christopher William Susilo	SMA PETRA 5 SURABAYA	\N	\N
Raymond Nathanael	SMA PETRA 5 SURABAYA	\N	\N
Miguel Alexander Paulus Jr	SMA PETRA 5 SURABAYA	\N	\N
Hanzell Constantine	SMA PETRA 5 SURABAYA	\N	\N
Galen Maximilian	SMA PETRA 5 SURABAYA	\N	\N
Davin Joshua	SMA PETRA 5 SURABAYA	\N	\N
Geraldo Limantoro	SMA PETRA 5 SURABAYA	\N	\N
Wahyu Nugroho Winoto	SMA PETRA 5 SURABAYA	\N	\N
Brilliant Ezekiel Keefe Gunawan	SMA PETRA 5 SURABAYA	\N	\N
Thierry Dylan	SMA PETRA 5 SURABAYA	\N	\N
Bradley Nathaniel Wijaya	SMA CIPUTRA SURABAYA	\N	\N
Michael Ken Tansa	SMA CIPUTRA SURABAYA	\N	\N
Edward Hugo	SMA CIPUTRA SURABAYA	\N	\N
Jordan Winarta	SMA CIPUTRA SURABAYA	\N	\N
Glenn Geraldo	SMA CIPUTRA SURABAYA	\N	\N
Theodore Furui Widyatmoko	SMA CIPUTRA SURABAYA	\N	\N
Jason William	SMA CIPUTRA SURABAYA	\N	\N
Luke Taylor	SMA CIPUTRA SURABAYA	\N	\N
Jin Hyeok Kang	SMA CIPUTRA SURABAYA	\N	\N
Tom Aristo	SMA CIPUTRA SURABAYA	\N	\N
Rionel Laurence Effendi	SMA CIPUTRA SURABAYA	\N	\N
Dzaky Abdillah Noor Mohammad	SMAN 10 SURABAYA	\N	\N
Muhammad Zaki Akbar Torori Putro	SMAN 10 SURABAYA	\N	\N
M. Arya Putra Setyawan	SMAN 10 SURABAYA	\N	\N
Novriansyah Satria Anugraha	SMAN 10 SURABAYA	\N	\N
Adham Rainbow Fattahillah	SMAN 10 SURABAYA	\N	\N
Danang Adi Prasetyo	SMAN 10 SURABAYA	\N	\N
Naufal Ananta Ridho Hermawan	SMAN 10 SURABAYA	\N	\N
Rafli Irsyaddhin Ikhsan	SMAN 10 SURABAYA	\N	\N
Hashemi Aulia Rahman	SMAN 10 SURABAYA	\N	\N
Mauludiar Fathir Athalla	SMAN 10 SURABAYA	\N	\N
Ardi Putra Priatama	SMAN 10 SURABAYA	\N	\N
Jatayu Adiyaksa Negara	SMAN 16 SURABAYA	\N	\N
Ryan Fathurrahman	SMAN 16 SURABAYA	\N	\N
Moch. Gilang Saputra	SMAN 16 SURABAYA	\N	\N
Arif Dwi	SMAN 16 SURABAYA	\N	\N
Joseph Matthew Santoso	SMAN 16 SURABAYA	\N	\N
Raka Prakasita Ramadhani	SMAN 16 SURABAYA	\N	\N
Moch. Firsyahbani Erlangga	SMAN 16 SURABAYA	\N	\N
Fawwaz Bobsaid	SMAN 16 SURABAYA	\N	\N
Rajendra Ghafar Praptama	SMAN 16 SURABAYA	\N	\N
Nobel Fabian	SMAN 16 SURABAYA	\N	\N
Alhafiz Rz	SMAN 16 SURABAYA	\N	\N
Rayhan Febrian Syahputra	SMAN 4 SURABAYA	\N	\N
Moch Adrian Dewangga Putra	SMAN 4 SURABAYA	\N	\N
Achmad Shahzada S	SMAN 4 SURABAYA	\N	\N
Ikadek Agung Erliano	SMAN 4 SURABAYA	\N	\N
Harits Muhammad Abidzar	SMAN 4 SURABAYA	\N	\N
Ananda Rajendra Maulana	SMAN 4 SURABAYA	\N	\N
Nico Rifqi Ardiansyah	SMAN 4 SURABAYA	\N	\N
Ahmad Wildan Razaqi	SMAN 4 SURABAYA	\N	\N
Muchammad Syawqi Abdillah	SMAN 4 SURABAYA	\N	\N
Zhafran Ammar Rachman	SMAN 4 SURABAYA	\N	\N
Aulian Luhur	SMAN 4 SURABAYA	\N	\N
Ardra Raditya Abhinaya	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Saddam Adrian Hartanto	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Agam Yudha Pratama	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Yafi Muhammad Faldin	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Vincent Aurelius Sereno	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Ahnaf Bahasuan	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Ahmad Rizky Destriawan	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Muhammad Fitrah Ramadhan	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Mochammad Arya Yudhistira	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Maliq Garcia Hidayat	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Rasendriya Fauzan Widagdo	SMA MUHAMMADIYAH 2 SIDOARJO	\N	\N
Joeyson Salam	SMA CITA HATI EAST SURABAYA	\N	\N
Brian Robinson	SMA CITA HATI EAST SURABAYA	\N	\N
Elgine Theo Thamtoro	SMA CITA HATI EAST SURABAYA	\N	\N
Gerrie Brevitio	SMA CITA HATI EAST SURABAYA	\N	\N
Axel Braxton Sajogo	SMA CITA HATI EAST SURABAYA	\N	\N
Soedomo Henry Cahyono	SMA CITA HATI EAST SURABAYA	\N	\N
Lodewyk Jason	SMA CITA HATI EAST SURABAYA	\N	\N
Owen Guito	SMA CITA HATI EAST SURABAYA	\N	\N
Jeremiah Jason Chen	SMA CITA HATI EAST SURABAYA	\N	\N
Ingvar Rusli	SMA CITA HATI EAST SURABAYA	\N	\N
Shawn Michael Koeswandi	SMA CITA HATI EAST SURABAYA	\N	\N
N'golo Kante	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Raphael Wijanarko Wijono	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Richard Louis Widjaja	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Axelyno Welson	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Frederick Evan Salim	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Othniel Nakata Tatontos	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Fidelius William	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Alexander Wibisono	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Filbert Amerigo Ardenlie	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Michael Lawrence Arifin	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Marvel Suryanegara	SMA SANTO HENDRIKUS SURABAYA	\N	\N
Daffa Putra Fauzi	SMA ITP SURABAYA	\N	\N
Ghozi Naufal Ahmad	SMA ITP SURABAYA	\N	\N
Daffan Putra Pamungkas	SMA ITP SURABAYA	\N	\N
Rayhansyach Surya Wardana	SMA ITP SURABAYA	\N	\N
Auriel Balthazar Tabentane	SMA ITP SURABAYA	\N	\N
Nauval Septian Pw	SMA ITP SURABAYA	\N	\N
Fabian Torori	SMA ITP SURABAYA	\N	\N
M. Juliano Pratama Tista	SMA ITP SURABAYA	\N	\N
Novaldo Zawwa	SMA ITP SURABAYA	\N	\N
Abi Manyu	SMA ITP SURABAYA	\N	\N
Akbar Dwi Herwanto	SMA ITP SURABAYA	\N	\N
Rafly Raditya Rachman	SMAN 20 SURABAYA	\N	\N
Dhanis Handiyanto Tanudjaja	SMAN 20 SURABAYA	\N	\N
Reyhan Hafidz Nur Cahya	SMAN 20 SURABAYA	\N	\N
Danendra Ahnaf Athallah	SMAN 20 SURABAYA	\N	\N
Fikri Wahyu	SMAN 20 SURABAYA	\N	\N
Muhammad Faiz Dzinnuha	SMAN 20 SURABAYA	\N	\N
Pryandika Mahendra	SMAN 20 SURABAYA	\N	\N
Jibran Arrafi	SMAN 20 SURABAYA	\N	\N
Zaidan Fadlurrohman Syafiq	SMAN 20 SURABAYA	\N	\N
I Wayan Widhi Anggara	SMAN 20 SURABAYA	\N	\N
Christofer Theodore	SMAN 20 SURABAYA	\N	\N
George Wencesklaus Terence Chandra	SMA GLORIA 2 SURABAYA	\N	\N
Brendan Carlos Santoso	SMA GLORIA 2 SURABAYA	\N	\N
Kenneth Jodeista Selamat	SMA GLORIA 2 SURABAYA	\N	\N
Justin Alexandro	SMA GLORIA 2 SURABAYA	\N	\N
Jeremy Noel	SMA GLORIA 2 SURABAYA	\N	\N
Jason Tricahyo Suko	SMA GLORIA 2 SURABAYA	\N	\N
David Tristan Setiawan	SMA GLORIA 2 SURABAYA	\N	\N
Isaac Charis El Wonder	SMA GLORIA 2 SURABAYA	\N	\N
Reuben	SMA GLORIA 2 SURABAYA	\N	\N
Yoel Camilo Febriyanto	SMA GLORIA 2 SURABAYA	\N	\N
Glenn Christian Antoro	SMA GLORIA 2 SURABAYA	\N	\N
Josefano Adoniara Theofiga	SMAN 1 PURI MOJOKERTO	\N	\N
Abdurrahman Bayhaqi Choiri	SMAN 1 PURI MOJOKERTO	\N	\N
Razzan Manggala Putra Budiono	SMAN 1 PURI MOJOKERTO	\N	\N
Mochammad Dwi Bayu Setyawan	SMAN 1 PURI MOJOKERTO	\N	\N
Wahyu Eka Prasetyo	SMAN 1 PURI MOJOKERTO	\N	\N
Rayhan Primo Wahyudi	SMAN 1 PURI MOJOKERTO	\N	\N
Muhammad Hafizh Saripuddin	SMAN 1 PURI MOJOKERTO	\N	\N
Naufal Rafitama	SMAN 1 PURI MOJOKERTO	\N	\N
Farel Dwi Raditya	SMAN 1 PURI MOJOKERTO	\N	\N
Loishel Dago Tobogu	SMAN 1 PURI MOJOKERTO	\N	\N
Alexander Mahaviro	SMAN 1 PURI MOJOKERTO	\N	\N
Milhan Aulia Afandi	SMAN 3 SURABAYA	\N	\N
Edgar Adyatma	SMAN 3 SURABAYA	\N	\N
Abdullah Rino Ramadhani	SMAN 3 SURABAYA	\N	\N
Noveto Javier Ramadhani	SMAN 3 SURABAYA	\N	\N
Akbar Jarullah Fawwaz	SMAN 3 SURABAYA	\N	\N
Brilliant Yusuf	SMAN 3 SURABAYA	\N	\N
Achmad Fauzan Nur Firdaus	SMAN 3 SURABAYA	\N	\N
Muhammad Rafiyan Nugraha	SMAN 3 SURABAYA	\N	\N
Dhonan Mugi Al Ghifari	SMAN 3 SURABAYA	\N	\N
Michael Alonso Pandu Wicaksana	SMAN 3 SURABAYA	\N	\N
Agraha Pudyas Tungkoro	SMAN 3 SURABAYA	\N	\N
Ricky Joenathan	SMA FRATERAN SURABAYA	\N	\N
Alvin Abel Darmawan	SMA FRATERAN SURABAYA	\N	\N
Michael Henry Laksmana	SMA FRATERAN SURABAYA	\N	\N
Nelson Davio	SMA FRATERAN SURABAYA	\N	\N
Mauritius Kenneth T	SMA FRATERAN SURABAYA	\N	\N
Jordan Tanadi	SMA FRATERAN SURABAYA	\N	\N
Andrew Garcia Christianto	SMA FRATERAN SURABAYA	\N	\N
Matthew Jefferson Besouw	SMA FRATERAN SURABAYA	\N	\N
Jovannes Friendly Kurniawan	SMA FRATERAN SURABAYA	\N	\N
Daoshen Justin Felix Okawida	SMA FRATERAN SURABAYA	\N	\N
Vincentius Seconda Adrian	SMA FRATERAN SURABAYA	\N	\N
Naufaltian Ega Zakariyya	SMAN 15 SURABAYA	\N	\N
Yehezkiel Joel Prasetyo	SMAN 15 SURABAYA	\N	\N
Ahmad Syauqi Siddiq	SMAN 15 SURABAYA	\N	\N
Mirza Argya Wiratama	SMAN 15 SURABAYA	\N	\N
Devasya Anaga Yudhistira	SMAN 15 SURABAYA	\N	\N
Akhmad Razzan Rasyid	SMAN 15 SURABAYA	\N	\N
Rakhaa Sheva	SMAN 15 SURABAYA	\N	\N
Raafy Akbar Putra Pratama	SMAN 15 SURABAYA	\N	\N
Javier Ibra Raelfiyanto Ramadhan	SMAN 15 SURABAYA	\N	\N
Dhelano Xavindra Islami	SMAN 15 SURABAYA	\N	\N
Stevan Marvin	SMAN 15 SURABAYA	\N	\N
James Kenneth	SMA VITA SURABAYA	\N	\N
Gilbert Jonathan	SMA VITA SURABAYA	\N	\N
Winston Huang	SMA VITA SURABAYA	\N	\N
Alexander Betrand Foris	SMA VITA SURABAYA	\N	\N
James Adrian Suhardiman	SMA VITA SURABAYA	\N	\N
Darrell Raphael Putra	SMA VITA SURABAYA	\N	\N
Gerrard Wilson Setiawan	SMA VITA SURABAYA	\N	\N
Cliff Joseph	SMA VITA SURABAYA	\N	\N
Jordan Rumuy	SMA VITA SURABAYA	\N	\N
Christian Kenza Devven Goni	SMA VITA SURABAYA	\N	\N
Joshua Vincent	SMA VITA SURABAYA	\N	\N
Ferdinan Dwi Armando Meirangga Agung Saputra	SMAN 9 SURABAYA	\N	\N
Dany Firman Lazuardi	SMAN 9 SURABAYA	\N	\N
M.riyan Firmansyah	SMAN 9 SURABAYA	\N	\N
Mohammed Def Zinedine Fajrie	SMAN 9 SURABAYA	\N	\N
Athalla Tirta Wisesa	SMAN 9 SURABAYA	\N	\N
Jagad Lakon Sejati	SMAN 9 SURABAYA	\N	\N
Stanly Vian Pratama	SMAN 9 SURABAYA	\N	\N
Akmal Syauqi Ramadhan	SMAN 9 SURABAYA	\N	\N
Jerino Dzaky Priambodo	SMAN 9 SURABAYA	\N	\N
Aldi Darahtul Rohman	SMAN 9 SURABAYA	\N	\N
Muhammad Rohman Azizi	SMAN 9 SURABAYA	\N	\N
Valentino Natanael	SMAN 1 WARU	\N	\N
Muhammad Myzan Zhydan	SMAN 1 WARU	\N	\N
Rio Julian Ramadhani	SMAN 1 WARU	\N	\N
Rahmat Kurniawan	SMAN 1 WARU	\N	\N
Muhammad Ardiaz Maulana S	SMAN 1 WARU	\N	\N
Abyakta Prabowo	SMAN 1 WARU	\N	\N
Zidan Akbar Diansyah	SMAN 1 WARU	\N	\N
I Made Dhiyo S.a	SMAN 1 WARU	\N	\N
Satrio Wibisono	SMAN 1 WARU	\N	\N
Haidar Rafli	SMAN 1 WARU	\N	\N
Bagas Raditya	SMAN 1 WARU	\N	\N
Rafines Farrel Ismail	SMA IPH EAST SURABAYA	\N	\N
Federico Doxa Widiyanto	SMA IPH EAST SURABAYA	\N	\N
Edward Rivaldi Kosasih	SMA IPH EAST SURABAYA	\N	\N
Jason Wangsa	SMA IPH EAST SURABAYA	\N	\N
Nathanael Wilson Purnawan	SMA IPH EAST SURABAYA	\N	\N
Justin Wangsa	SMA IPH EAST SURABAYA	\N	\N
Meyer Chang	SMA IPH EAST SURABAYA	\N	\N
Akio Setiawan	SMA IPH EAST SURABAYA	\N	\N
Neilson Pranata	SMA IPH EAST SURABAYA	\N	\N
Nelson Cristiano	SMA IPH EAST SURABAYA	\N	\N
Bryer Steven Chang	SMA IPH EAST SURABAYA	\N	\N
Matthew Alonso Wibowo	SMA PETRA 1 SURABAYA	\N	\N
George Christiano	SMA PETRA 1 SURABAYA	\N	\N
Vito Camello Oscar Jatmiko	SMA PETRA 1 SURABAYA	\N	\N
Marco Clarence Purnomo	SMA PETRA 1 SURABAYA	\N	\N
Trevis Artagrantdy Kurniawan	SMA PETRA 1 SURABAYA	\N	\N
Alfredo Marcellino Kusuma	SMA PETRA 1 SURABAYA	\N	\N
Darren Grant Alexandre Wang	SMA PETRA 1 SURABAYA	\N	\N
Kevin De Brune	SMA PETRA 1 SURABAYA	\N	\N
Sebastian Reyhan Tanuwijaya	SMA PETRA 1 SURABAYA	\N	\N
Stanley Mulya Irawan	SMA PETRA 1 SURABAYA	\N	\N
Christopher Matthew Pranata	SMA PETRA 1 SURABAYA	\N	\N
Benedict Nathanael Nareswara	SMA PETRA 2 SURABAYA	\N	\N
Darian Joseph Setiabudi	SMA PETRA 2 SURABAYA	\N	\N
Michael Christian Jaya	SMA PETRA 2 SURABAYA	\N	\N
Juan Morello Gulo	SMA PETRA 2 SURABAYA	\N	\N
Fernando Wijaya	SMA PETRA 2 SURABAYA	\N	\N
Justin Hadinata	SMA PETRA 2 SURABAYA	\N	\N
Ian Philip Wijaksono	SMA PETRA 2 SURABAYA	\N	\N
Dillon Ivanandrew Prasetya	SMA PETRA 2 SURABAYA	\N	\N
Gregory Anderson	SMA PETRA 2 SURABAYA	\N	\N
Christophorus Leonard	SMA PETRA 2 SURABAYA	\N	\N
Michael Angelo	SMA PETRA 2 SURABAYA	\N	\N
Paula Pramita Sikwandy	SMA GLORIA 1 SURABAYA	\N	\N
Setio Giovanni	SMA GLORIA 1 SURABAYA	\N	\N
Cheryl	SMA GLORIA 1 SURABAYA	\N	\N
Michelle Angelina Abadi	SMA GLORIA 1 SURABAYA	\N	\N
Mayviana Lysandra Tandiono	SMA GLORIA 1 SURABAYA	\N	\N
Kayla Hananiah Fu	SMA GLORIA 1 SURABAYA	\N	\N
Komang Mariani Puteri Sekar Sari	SMA GLORIA 1 SURABAYA	\N	\N
Jane Lavinia Chiang	SMA GLORIA 1 SURABAYA	\N	\N
Aiko Femie Belle Wijaya	SMA GLORIA 1 SURABAYA	\N	\N
Putu Kezia Angelie Setiawan	SMA GLORIA 1 SURABAYA	\N	\N
Nathania Nicole Sasongko	SMA GLORIA 1 SURABAYA	\N	\N
Zalfa Widianti	SMAN 2 MOJOKERTO	\N	\N
Isyatir Rodiyah	SMAN 2 MOJOKERTO	\N	\N
Vanessia Adonia	SMAN 2 MOJOKERTO	\N	\N
Niadwi Mayangsari	SMAN 2 MOJOKERTO	\N	\N
Clara Sandrina	SMAN 2 MOJOKERTO	\N	\N
Shafira Azzahra Ramadhani	SMAN 2 MOJOKERTO	\N	\N
Salsabillah Fitria Wahyu Wardani	SMAN 2 MOJOKERTO	\N	\N
Indriya Rahmawati	SMAN 2 MOJOKERTO	\N	\N
Marzha Al Bhiant	SMAN 2 MOJOKERTO	\N	\N
Luna Maulitha	SMAN 2 MOJOKERTO	\N	\N
Khafifa Arda	SMAN 2 MOJOKERTO	\N	\N
Janice Patricia Laeman	SMA GLORIA 2 SURABAYA	\N	\N
Ailina Carin Huang	SMA GLORIA 2 SURABAYA	\N	\N
Ellen Natalia	SMA GLORIA 2 SURABAYA	\N	\N
Syleena Feodora	SMA GLORIA 2 SURABAYA	\N	\N
Celine Chandra	SMA GLORIA 2 SURABAYA	\N	\N
Ladysia Megane C	SMA GLORIA 2 SURABAYA	\N	\N
Jolin Isabel Santoso	SMA GLORIA 2 SURABAYA	\N	\N
Jeannice Laurensia Santoso	SMA GLORIA 2 SURABAYA	\N	\N
Chelsea Chandra	SMA GLORIA 2 SURABAYA	\N	\N
Amelia Zelda	SMA GLORIA 2 SURABAYA	\N	\N
Janice Tantojo	SMA GLORIA 2 SURABAYA	\N	\N
Kartika Putri	SMAN 5 SURABAYA	\N	\N
Irmalia Canasti	SMAN 5 SURABAYA	\N	\N
Shendy Aurelya C P	SMAN 5 SURABAYA	\N	\N
Leilani Najla Putri	SMAN 5 SURABAYA	\N	\N
Keysha Davina R	SMAN 5 SURABAYA	\N	\N
Safina Talitha	SMAN 5 SURABAYA	\N	\N
Nisrina Fitriyanti W	SMAN 5 SURABAYA	\N	\N
Hanina Yasmin	SMAN 5 SURABAYA	\N	\N
Naura Olivia Alghifary	SMAN 5 SURABAYA	\N	\N
Maghfira Ph	SMAN 5 SURABAYA	\N	\N
Alfanana Puteri	SMAN 5 SURABAYA	\N	\N
Muhammad Zaidan Nashrul Haq	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Seta Pragata Anak Agung Kayana	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Yanuar Firdausi	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Barra Chaezsar Poetra Viansyah	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Syauqi Mahbubi Al Adibi	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Daffa Athalla Defrianto	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Aqila Fayruz	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Ridhwan Ammar Hisyam	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Irgi Ardiansyah	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Moch. Dhofar Nadhmy Abu Antar	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Abimanyu Hanania Son’of Satriodono	SMA MUHAMMADIYAH 10 GKB GRESIK	\N	\N
Muhammad Wildan Ramadhan	SMAN 1 SURABAYA	\N	\N
Muchammad Bagus Aqhila	SMAN 1 SURABAYA	\N	\N
Rifqi Muzakki F.	SMAN 1 SURABAYA	\N	\N
Achmad Gandhi	SMAN 1 SURABAYA	\N	\N
Raditya Naufal Fauzan	SMAN 1 SURABAYA	\N	\N
Athallah Isnindra Lesmana	SMAN 1 SURABAYA	\N	\N
Brave Earnest Anindya Rizky	SMAN 1 SURABAYA	\N	\N
Muhammad Rafly Ardyan	SMAN 1 SURABAYA	\N	\N
Ananda Miftahul Falah	SMAN 1 SURABAYA	\N	\N
Radja Althav Pramudya	SMAN 1 SURABAYA	\N	\N
Muhammad Ar Rayyan	SMAN 1 SURABAYA	\N	\N
Sirius Dwi Cahaya Arylis	SMAN 22 SURABAYA	\N	\N
Giga Tarangga Yudha	SMAN 22 SURABAYA	\N	\N
Alaric Matalino Setiawan Putra	SMAN 22 SURABAYA	\N	\N
Rafi Firmansyah	SMAN 22 SURABAYA	\N	\N
Afriza Fernanda	SMAN 22 SURABAYA	\N	\N
Rahmat Hidayat	SMAN 22 SURABAYA	\N	\N
Valentino Imanuel Lekatompessy	SMAN 22 SURABAYA	\N	\N
I Nyoman Surya Desta Ariwibawa	SMAN 22 SURABAYA	\N	\N
Gentur Nur Ramadhani	SMAN 22 SURABAYA	\N	\N
Muhammad Naufal Nabil Firdaus	SMAN 22 SURABAYA	\N	\N
Reva Putra	SMAN 22 SURABAYA	\N	\N
Ahmad Mutawakkil Kurnia	SMAN 1 GRESIK	\N	\N
Muhammad Andrean Rizq Prasetio	SMAN 1 GRESIK	\N	\N
Raffino Razzandi	SMAN 1 GRESIK	\N	\N
Syahrir Ramadhan	SMAN 1 GRESIK	\N	\N
Novanda Nathanael Silaban	SMAN 1 GRESIK	\N	\N
Muhammad Iftikhaar Ramadhan	SMAN 1 GRESIK	\N	\N
Robintsany Javonda Ahmed	SMAN 1 GRESIK	\N	\N
Satrio Prayogo	SMAN 1 GRESIK	\N	\N
Effan Safaraz Adzikra	SMAN 1 GRESIK	\N	\N
Muhammad Hanif Karomi	SMAN 1 GRESIK	\N	\N
Arfel Faaza H	SMAN 1 GRESIK	\N	\N
Fathur Rahman Abidin	SMAN 5 SURABAYA	\N	\N
Danandaya Raditya Rozano Prakoeswa	SMAN 5 SURABAYA	\N	\N
Raditya Arya Daniswara	SMAN 5 SURABAYA	\N	\N
Atha Zaky Handika Putra	SMAN 5 SURABAYA	\N	\N
Ferdian Ardra Hafizhan	SMAN 5 SURABAYA	\N	\N
Muhammad Raffi Ariyanto	SMAN 5 SURABAYA	\N	\N
Izaz Faizah Calyadarma	SMAN 5 SURABAYA	\N	\N
Ahmad Tsaqif Najwan Nadhif	SMAN 5 SURABAYA	\N	\N
Alfaril Dzaky	SMAN 5 SURABAYA	\N	\N
Danu Sigit Pratama	SMAN 5 SURABAYA	\N	\N
Brian Arga	SMAN 5 SURABAYA	\N	\N
Radja Daniyal	SMAN 2 SURABAYA	\N	\N
Ronaldo Hamdika	SMAN 2 SURABAYA	\N	\N
Jason Ajisatrya Brian Putera	SMAN 2 SURABAYA	\N	\N
Muhammad Haikhal	SMAN 2 SURABAYA	\N	\N
Muhammad Zakky Dikmansyah	SMAN 2 SURABAYA	\N	\N
Davino Dafa Rafael	SMAN 2 SURABAYA	\N	\N
Diaz Ardianto Rizky	SMAN 2 SURABAYA	\N	\N
Satrio Bayu	SMAN 2 SURABAYA	\N	\N
Muhammad Alfareyno Ramadhan	SMAN 2 SURABAYA	\N	\N
Anggara Putra	SMAN 2 SURABAYA	\N	\N
Elang Satria Rajendra Dewanto	SMAN 2 SURABAYA	\N	\N
Nava Valida	SMA PETRA 5 SURABAYA	\N	\N
Jessica Shine Utomo	SMA PETRA 5 SURABAYA	\N	\N
Clementine Emely	SMA PETRA 5 SURABAYA	\N	\N
Avryll Adellaine	SMA PETRA 5 SURABAYA	\N	\N
Andrea Christy	SMA PETRA 5 SURABAYA	\N	\N
Katherine Jesselynn Wijaya	SMA PETRA 5 SURABAYA	\N	\N
Susan Anggara	SMA PETRA 5 SURABAYA	\N	\N
Reyna Felicia Mongkol	SMA PETRA 5 SURABAYA	\N	\N
Jennifer Prayogo	SMA PETRA 5 SURABAYA	\N	\N
Jennifer Patricia	SMA PETRA 5 SURABAYA	\N	\N
Jessica Cindrawati Oentario	SMA PETRA 5 SURABAYA	\N	\N
Deff Qanca Arma Frecadanda	SMAN 1 PURI MOJOKERTO	\N	\N
Aqilla Tasya Tabina Gaeisani	SMAN 1 PURI MOJOKERTO	\N	\N
Alievia Kartika Putri	SMAN 1 PURI MOJOKERTO	\N	\N
Afifah Putri Shabrina	SMAN 1 PURI MOJOKERTO	\N	\N
Reva Safrina Hans Wibisono	SMAN 1 PURI MOJOKERTO	\N	\N
Endilia Rochmala Devi	SMAN 1 PURI MOJOKERTO	\N	\N
Anabel Parama Putri	SMAN 1 PURI MOJOKERTO	\N	\N
Ayunda Charlestya	SMAN 1 PURI MOJOKERTO	\N	\N
Eva Yulia Rossa	SMAN 1 PURI MOJOKERTO	\N	\N
Anggy Gunawan	SMAN 1 PURI MOJOKERTO	\N	\N
Rahma Tsania Ramadhani	SMAN 1 PURI MOJOKERTO	\N	\N
Agnes Winata	SMA FRATERAN SURABAYA	\N	\N
Gracia Cathie Gunawan	SMA FRATERAN SURABAYA	\N	\N
Clarissa Hendrajaya	SMA FRATERAN SURABAYA	\N	\N
Eleonora Joycelyne	SMA FRATERAN SURABAYA	\N	\N
Vanessa Lie	SMA FRATERAN SURABAYA	\N	\N
Euginia Riviera	SMA FRATERAN SURABAYA	\N	\N
Shiera Agatha	SMA FRATERAN SURABAYA	\N	\N
Birgitta Arianto	SMA FRATERAN SURABAYA	\N	\N
Valerie Gabriela Kusuma	SMA FRATERAN SURABAYA	\N	\N
Nathaneyla Alicya Abraham	SMA FRATERAN SURABAYA	\N	\N
Eugenia Tejokusumo	SMA FRATERAN SURABAYA	\N	\N
Emelyn Joyvania Mardyanto	SMA FRATERAN SURABAYA	\N	\N
Nurhalizah	SMAN 16 SURABAYA	\N	\N
Desak Ayu Tiara Renata	SMAN 16 SURABAYA	\N	\N
Chelsea Aurelia Ramadhani	SMAN 16 SURABAYA	\N	\N
Maorin Alifia Azzahra	SMAN 16 SURABAYA	\N	\N
Cindy Claudia Aruan	SMAN 16 SURABAYA	\N	\N
Aliya Nabila	SMAN 16 SURABAYA	\N	\N
Olivia Aura Rachma Trufani	SMAN 16 SURABAYA	\N	\N
Aulia Nur Ramadani	SMAN 16 SURABAYA	\N	\N
Kiara Clarissa Farandy	SMAN 16 SURABAYA	\N	\N
Aqila Dewi Sayrindra	SMAN 16 SURABAYA	\N	\N
Zahra Cantika Boneta	SMAN 16 SURABAYA	\N	\N
Lynn Louise	SMA ST LOUIS 1 SURABAYA	\N	\N
Wineke	SMA ST LOUIS 1 SURABAYA	\N	\N
Stefani Helen	SMA ST LOUIS 1 SURABAYA	\N	\N
Ganeviene Brightly Huang	SMA ST LOUIS 1 SURABAYA	\N	\N
Charisma Dewi Sephira Harianto	SMA ST LOUIS 1 SURABAYA	\N	\N
Micheline Chiesa Wijanto	SMA ST LOUIS 1 SURABAYA	\N	\N
Sonia Darmawan	SMA ST LOUIS 1 SURABAYA	\N	\N
Gwyneth Marjorie Koo	SMA ST LOUIS 1 SURABAYA	\N	\N
Allyson Liem	SMA ST LOUIS 1 SURABAYA	\N	\N
Anastasia Nadia Lisian	SMA ST LOUIS 1 SURABAYA	\N	\N
Adeline Arella Louisa Wiranto	SMA ST LOUIS 1 SURABAYA	\N	\N
Angel Kristiani	SMAN 1 MOJOKERTO	\N	\N
Erni Juliandini	SMAN 1 MOJOKERTO	\N	\N
Ferlynda Devi	SMAN 1 MOJOKERTO	\N	\N
Rahma Izza Safira	SMAN 1 MOJOKERTO	\N	\N
Raudhotul Jannah	SMAN 1 MOJOKERTO	\N	\N
Sherli Putri Margareta	SMAN 1 MOJOKERTO	\N	\N
Fiatiana Aurora Putri	SMAN 1 MOJOKERTO	\N	\N
Refalina Nuryatmaja	SMAN 1 MOJOKERTO	\N	\N
Fifin Imelda	SMAN 1 MOJOKERTO	\N	\N
Syavira Dwi Kumala Putri	SMAN 1 MOJOKERTO	\N	\N
Tabita Wahyu Adelia Hidayat	SMAN 1 MOJOKERTO	\N	\N
Aukha Dwi Istiqhomah	SMAN 1 WARU	\N	\N
Annisa Rahmadania Muchlis	SMAN 1 WARU	\N	\N
Raras Puspa Sary	SMAN 1 WARU	\N	\N
Zaskya Rafana	SMAN 1 WARU	\N	\N
Zalsa Kirana Putri	SMAN 1 WARU	\N	\N
25. Rachmadya Eka Syarifah	SMAN 1 WARU	\N	\N
Kikan Putri Sabian	SMAN 1 WARU	\N	\N
Jasmine Az Zahra	SMAN 1 WARU	\N	\N
Tiara Putri Osmaliki	SMAN 1 WARU	\N	\N
Olivia Chintya Permatasari	SMAN 1 WARU	\N	\N
Angel J. Theodora	SMAN 1 WARU	\N	\N
Danisha Nayyara Shafiqa	SMAN 15 SURABAYA	\N	\N
Gabriela Angelyn Rodame Silitonga	SMAN 15 SURABAYA	\N	\N
Khalisha Salwa Dinata	SMAN 15 SURABAYA	\N	\N
Milahati Bintang S	SMAN 15 SURABAYA	\N	\N
Radinka Adyasmasari Bening Mahasa	SMAN 15 SURABAYA	\N	\N
Anggi Medina Salsabila	SMAN 15 SURABAYA	\N	\N
Raihanah Muthiah	SMAN 15 SURABAYA	\N	\N
Evelyn Putri Sepang	SMAN 15 SURABAYA	\N	\N
Aisyah Luna	SMAN 15 SURABAYA	\N	\N
Latasya Divca Aquirell	SMAN 15 SURABAYA	\N	\N
Firdania Salsabila Kirana	SMAN 15 SURABAYA	\N	\N
Michiella Angelina	SMA PETRA 1 SURABAYA	\N	\N
Jemima Dorothy Budiardjo	SMA PETRA 1 SURABAYA	\N	\N
Jocelyne Lizzie Purwanto	SMA PETRA 1 SURABAYA	\N	\N
Francesca Marcelina Clementine	SMA PETRA 1 SURABAYA	\N	\N
Chaleena Pramono	SMA PETRA 1 SURABAYA	\N	\N
Nelvina Sally Utomo	SMA PETRA 1 SURABAYA	\N	\N
Victoria Benedicta Joe	SMA PETRA 1 SURABAYA	\N	\N
Maydeline Lisell Gunawan	SMA PETRA 1 SURABAYA	\N	\N
Kaylin Marvella	SMA PETRA 1 SURABAYA	\N	\N
Yobela	SMA PETRA 1 SURABAYA	\N	\N
Jocelyn Ellen Chia	SMA PETRA 1 SURABAYA	\N	\N
Putri Zahra Ap'fatsah	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Aileen Winanda Gunawan	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Revina Permatasari	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Syheren Lorencya Hadi Sanjaya	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Citra Aftria Damayanti	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Catrine Annabel Tanuwijaya	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Nurul Nadia Aqilah Hasibuan	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Stella Gracia Sutanto	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Stefanie Angelin	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Kathleen Nethania Marciano	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Olga Aurora Linardi	SMA NATION STAR ACADEMY SURABAYA	\N	\N
Fitri Arisunah	SMAN 19 SURABAYA	\N	\N
Izzatu Lailatil Maghfiroh	SMAN 19 SURABAYA	\N	\N
Carissa Nabilah Kanani	SMAN 19 SURABAYA	\N	\N
Zumrotul Aisyah R	SMAN 19 SURABAYA	\N	\N
Poppy Ayu Pawitriningrum	SMAN 19 SURABAYA	\N	\N
Putri Maharani	SMAN 19 SURABAYA	\N	\N
Nadirah Aynur Rohmah	SMAN 19 SURABAYA	\N	\N
Rosa Anggelina	SMAN 19 SURABAYA	\N	\N
Rushofah Shofiyyah Salim	SMAN 19 SURABAYA	\N	\N
Wahyu Kusuma Ningrum	SMAN 19 SURABAYA	\N	\N
Dina Karen Daniella Rahakbauw	SMAN 19 SURABAYA	\N	\N
Zavira Jalasena Putri	SMAN 2 SIDOARJO	\N	\N
Devi Yulisya	SMAN 2 SIDOARJO	\N	\N
Rachmaniar Arindani Putri Filza	SMAN 2 SIDOARJO	\N	\N
Venny Zahra Syahfrilina	SMAN 2 SIDOARJO	\N	\N
Kayla Bazlyna	SMAN 2 SIDOARJO	\N	\N
Noor Fariha Rahmawaty	SMAN 2 SIDOARJO	\N	\N
Deva Natasya	SMAN 2 SIDOARJO	\N	\N
Frevy Aulia	SMAN 2 SIDOARJO	\N	\N
Amilatus Sholikhah	SMAN 2 SIDOARJO	\N	\N
Jingga Naura	SMAN 2 SIDOARJO	\N	\N
Yessa Rachma Nur Khalida Achmad	SMAN 2 SIDOARJO	\N	\N
\.


--
-- Data for Name: player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_stats (date_time, name, "position", minute, points, assists, rebound) FROM stdin;
10 Sep 2022 11:00 WIB	Roben Sasmita	Forward	13:21	2	1	2
10 Sep 2022 11:00 WIB	Kevin	Forward	21:41	1	1	1
10 Sep 2022 11:00 WIB	Bryant Kioshi	Forward	27:42	13	0	6
10 Sep 2022 11:00 WIB	Aurelio Mahesa Dzaky	Guard	12:31	1	0	3
10 Sep 2022 11:00 WIB	Brandon Markus Utomo	Guard	09:00	0	0	1
10 Sep 2022 11:00 WIB	Gerard Aurelio Soewandi	Center	13:25	0	0	1
10 Sep 2022 11:00 WIB	Vinsens Sandriawan	Guard	02:46	0	0	0
10 Sep 2022 11:00 WIB	Sabrang Rigel Sadewa	Forward	29:55	4	0	5
10 Sep 2022 11:00 WIB	Kevin Christian Prijanto	Forward	26:14	2	0	4
10 Sep 2022 11:00 WIB	Macxquel Rehan Thiemailattu	Forward	29:44	6	1	2
10 Sep 2022 11:00 WIB	Jonathan Gerrard	Guard	-	0	0	0
10 Sep 2022 11:00 WIB	Freno Nymmo Shakkawijaya	Guard	25:27	15	1	8
10 Sep 2022 11:00 WIB	Criston Jonathan Hananto	Guard	11:14	3	1	0
10 Sep 2022 11:00 WIB	Yogie Putra Darmawan	Forward	-	0	0	0
10 Sep 2022 11:00 WIB	Michael Jason Christian Widya	Forward	21:26	10	1	1
10 Sep 2022 11:00 WIB	Pedro Valencio Sudarto	Guard	12:34	0	1	2
10 Sep 2022 11:00 WIB	Richie Bertrand Linardi	Forward	27:44	19	1	3
10 Sep 2022 11:00 WIB	Kennie Elbert Kristanto	Guard	28:36	8	1	4
10 Sep 2022 11:00 WIB	Kenas Lebtinneo	Forward	17:57	6	2	8
10 Sep 2022 11:00 WIB	Romualdus Reno Santoso	Guard	16:25	1	0	0
10 Sep 2022 11:00 WIB	Kennard Austin Sutanto	Forward	20:48	5	4	6
10 Sep 2022 11:00 WIB	Brennen Edric Winoto	Forward	06:59	0	0	1
10 Sep 2022 12:40 WIB	Cliff Louis	Forward	17:24	10	2	5
10 Sep 2022 12:40 WIB	Darren Tan	Guard	15:35	2	1	4
10 Sep 2022 12:40 WIB	Nicholas Demily	Guard	17:52	9	1	4
10 Sep 2022 12:40 WIB	Raffael Panji Amadeus	Forward	15:54	9	1	2
10 Sep 2022 12:40 WIB	Kenneth Chandradinata	Guard	16:26	0	4	2
10 Sep 2022 12:40 WIB	Jansen Cahyadi	Guard	15:31	8	1	3
10 Sep 2022 12:40 WIB	Daniel Nicholas Delin	Guard	17:21	12	2	5
10 Sep 2022 12:40 WIB	Justin Patrick Alex	Guard	17:44	7	1	2
10 Sep 2022 12:40 WIB	William Wongsoadi	Center	11:57	0	0	2
10 Sep 2022 12:40 WIB	Lourencio Dustin	Guard	16:31	2	4	2
10 Sep 2022 12:40 WIB	Alfonsus Bernd	Center	18:16	6	1	4
10 Sep 2022 12:40 WIB	Kylen Bennett Singohardjo	Forward	06:28	0	1	0
10 Sep 2022 12:40 WIB	Victor Yu	Forward	18:18	2	0	2
10 Sep 2022 12:40 WIB	Russel Gavriel Nio	Forward	-	0	0	0
10 Sep 2022 12:40 WIB	Christian Matthew Wibowo	Guard	06:28	0	0	0
10 Sep 2022 12:40 WIB	Eugene Sulistyo	Forward	30:57	4	0	2
10 Sep 2022 12:40 WIB	Francicus Xaverius Kimi Tjahjono	Center	14:23	2	0	3
10 Sep 2022 12:40 WIB	Aaron Imanuel Tako	Guard	19:03	0	0	1
10 Sep 2022 12:40 WIB	Jovenel Axel Priyono	Guard	17:09	0	0	3
10 Sep 2022 12:40 WIB	Vincent Joshien Chawindra	Forward	16:09	0	1	0
10 Sep 2022 12:40 WIB	Michael Tjandranaya Lesmana	Center	30:33	9	0	6
10 Sep 2022 12:40 WIB	Christopher Shawn Tanaka	Forward	07:52	0	0	1
10 Sep 2022 14:20 WIB	Izal Adiara	Center	14:45	3	0	7
10 Sep 2022 14:20 WIB	Ahmad Akmal Syafi'i	Forward	10:58	0	0	3
10 Sep 2022 14:20 WIB	Danendra Laskar	Center	33:40	5	0	10
10 Sep 2022 14:20 WIB	Nuno Xabiel Alfayza	Forward	25:13	7	0	4
10 Sep 2022 14:20 WIB	Yeheskiel Kaat	Guard	28:42	5	3	5
10 Sep 2022 14:20 WIB	Muhammad Tsany Qadama	Forward	26:39	6	1	0
10 Sep 2022 14:20 WIB	Ismail Rizqi	Center	00:42	0	0	0
10 Sep 2022 14:20 WIB	Muhammad Zakky Satria Darmawan	Forward	08:18	0	0	0
10 Sep 2022 14:20 WIB	Yaqzhan Qushay Z	Guard	08:09	0	0	1
10 Sep 2022 14:20 WIB	Ahmad Bagas Saputra	Guard	10:26	0	0	2
10 Sep 2022 14:20 WIB	Afif Muhammad Raihan	Center	07:22	0	0	1
10 Sep 2022 14:20 WIB	Darren Samuel Cristofer Lumba	Center	07:18	0	0	0
10 Sep 2022 14:20 WIB	Christopher William Susilo	Guard	10:47	0	0	2
10 Sep 2022 14:20 WIB	Raymond Nathanael	Forward	09:35	0	0	1
10 Sep 2022 14:20 WIB	Miguel Alexander Paulus Jr	Forward	11:18	0	0	0
10 Sep 2022 14:20 WIB	Hanzell Constantine	Guard	06:20	0	0	0
10 Sep 2022 14:20 WIB	Galen Maximilian	Guard	36:20	4	0	6
10 Sep 2022 14:20 WIB	Davin Joshua	Guard	20:31	0	0	5
10 Sep 2022 14:20 WIB	Geraldo Limantoro	Guard	24:38	3	0	4
10 Sep 2022 14:20 WIB	Wahyu Nugroho Winoto	Forward	07:40	2	1	0
10 Sep 2022 14:20 WIB	Brilliant Ezekiel Keefe Gunawan	Guard	31:09	6	0	4
10 Sep 2022 14:20 WIB	Thierry Dylan	Forward	26:40	8	1	6
10 Sep 2022 16:00 WIB	Bradley Nathaniel Wijaya	Guard	22:19	16	4	2
10 Sep 2022 16:00 WIB	Michael Ken Tansa	Guard	15:40	2	2	2
10 Sep 2022 16:00 WIB	Edward Hugo	Center	09:33	2	0	4
10 Sep 2022 16:00 WIB	Jordan Winarta	Guard	14:34	4	0	5
10 Sep 2022 16:00 WIB	Glenn Geraldo	Forward	24:19	6	3	7
10 Sep 2022 16:00 WIB	Theodore Furui Widyatmoko	Center	21:52	4	0	2
10 Sep 2022 16:00 WIB	Jason William	Forward	10:52	2	1	4
10 Sep 2022 16:00 WIB	Luke Taylor	Center	20:03	11	1	16
10 Sep 2022 16:00 WIB	Jin Hyeok Kang	Forward	09:58	3	0	1
10 Sep 2022 16:00 WIB	Tom Aristo	Forward	17:11	2	2	4
10 Sep 2022 16:00 WIB	Rionel Laurence Effendi	Guard	19:12	0	2	3
10 Sep 2022 16:00 WIB	Dzaky Abdillah Noor Mohammad	Center	13:44	2	0	1
10 Sep 2022 16:00 WIB	Muhammad Zaki Akbar Torori Putro	Guard	30:43	1	1	2
10 Sep 2022 16:00 WIB	M. Arya Putra Setyawan	Center	26:16	3	0	6
10 Sep 2022 16:00 WIB	Novriansyah Satria Anugraha	Guard	-	0	0	0
10 Sep 2022 16:00 WIB	Adham Rainbow Fattahillah	Forward	32:42	2	0	10
10 Sep 2022 16:00 WIB	Danang Adi Prasetyo	Guard	16:22	2	0	2
10 Sep 2022 16:00 WIB	Naufal Ananta Ridho Hermawan	Guard	07:18	0	0	1
10 Sep 2022 16:00 WIB	Rafli Irsyaddhin Ikhsan	Guard	06:47	2	0	1
10 Sep 2022 16:00 WIB	Hashemi Aulia Rahman	Forward	23:13	13	0	3
10 Sep 2022 16:00 WIB	Mauludiar Fathir Athalla	Forward	07:29	0	0	0
10 Sep 2022 16:00 WIB	Ardi Putra Priatama	Guard	07:18	0	0	3
10 Sep 2022 17:40 WIB	Jatayu Adiyaksa Negara	Forward	-	0	0	0
10 Sep 2022 17:40 WIB	Ryan Fathurrahman	Forward	21:23	2	4	2
10 Sep 2022 17:40 WIB	Moch. Gilang Saputra	Guard	17:24	9	2	6
10 Sep 2022 17:40 WIB	Arif Dwi	Guard	19:12	4	3	4
10 Sep 2022 17:40 WIB	Joseph Matthew Santoso	Guard	16:08	0	4	1
10 Sep 2022 17:40 WIB	Raka Prakasita Ramadhani	Forward	20:14	6	0	5
10 Sep 2022 17:40 WIB	Moch. Firsyahbani Erlangga	Forward	19:56	20	1	5
10 Sep 2022 17:40 WIB	Fawwaz Bobsaid	Guard	11:10	7	1	1
10 Sep 2022 17:40 WIB	Rajendra Ghafar Praptama	Forward	19:37	14	1	4
10 Sep 2022 17:40 WIB	Nobel Fabian	Forward	19:21	16	3	6
10 Sep 2022 17:40 WIB	Alhafiz Rz	Forward	19:27	10	0	6
10 Sep 2022 17:40 WIB	Rayhan Febrian Syahputra	Guard	28:49	1	0	3
10 Sep 2022 17:40 WIB	Moch Adrian Dewangga Putra	Guard	27:54	2	0	2
10 Sep 2022 17:40 WIB	Achmad Shahzada S	Forward	20:48	0	0	3
10 Sep 2022 17:40 WIB	Ikadek Agung Erliano	Guard	23:12	3	0	2
10 Sep 2022 17:40 WIB	Harits Muhammad Abidzar	Guard	16:44	0	0	2
10 Sep 2022 17:40 WIB	Ananda Rajendra Maulana	Guard	09:57	0	0	0
10 Sep 2022 17:40 WIB	Nico Rifqi Ardiansyah	Forward	14:24	0	0	0
10 Sep 2022 17:40 WIB	Ahmad Wildan Razaqi	Forward	09:16	0	0	0
10 Sep 2022 17:40 WIB	Muchammad Syawqi Abdillah	Forward	07:48	0	0	1
10 Sep 2022 17:40 WIB	Zhafran Ammar Rachman	Forward	10:17	0	0	0
10 Sep 2022 17:40 WIB	Aulian Luhur	Forward	18:16	2	0	2
10 Sep 2022 19:20 WIB	Ardra Raditya Abhinaya	Forward	30:16	13	2	6
10 Sep 2022 19:20 WIB	Saddam Adrian Hartanto	Guard	07:35	0	0	0
10 Sep 2022 19:20 WIB	Agam Yudha Pratama	Guard	13:26	4	0	2
10 Sep 2022 19:20 WIB	Yafi Muhammad Faldin	Guard	13:07	2	0	1
10 Sep 2022 19:20 WIB	Vincent Aurelius Sereno	Forward	09:14	0	1	1
10 Sep 2022 19:20 WIB	Ahnaf Bahasuan	Guard	31:50	0	0	6
10 Sep 2022 19:20 WIB	Ahmad Rizky Destriawan	Forward	28:02	10	0	4
10 Sep 2022 19:20 WIB	Muhammad Fitrah Ramadhan	Forward	22:55	3	0	3
10 Sep 2022 19:20 WIB	Mochammad Arya Yudhistira	Guard	06:15	0	0	0
10 Sep 2022 19:20 WIB	Maliq Garcia Hidayat	Forward	21:54	2	1	3
10 Sep 2022 19:20 WIB	Rasendriya Fauzan Widagdo	Center	05:43	0	0	1
10 Sep 2022 19:20 WIB	Joeyson Salam	Guard	17:04	0	1	2
10 Sep 2022 19:20 WIB	Brian Robinson	Forward	21:39	4	3	6
10 Sep 2022 19:20 WIB	Elgine Theo Thamtoro	Guard	21:11	12	3	10
10 Sep 2022 19:20 WIB	Gerrie Brevitio	Forward	14:40	8	2	7
10 Sep 2022 19:20 WIB	Axel Braxton Sajogo	Forward	16:59	4	0	2
10 Sep 2022 19:20 WIB	Soedomo Henry Cahyono	Forward	14:43	0	2	1
10 Sep 2022 19:20 WIB	Lodewyk Jason	Guard	19:53	5	2	0
10 Sep 2022 19:20 WIB	Owen Guito	Center	20:11	9	1	5
10 Sep 2022 19:20 WIB	Jeremiah Jason Chen	Forward	16:19	4	0	1
10 Sep 2022 19:20 WIB	Ingvar Rusli	Guard	20:55	9	1	5
10 Sep 2022 19:20 WIB	Shawn Michael Koeswandi	Guard	16:26	7	1	2
11 Sep 2022 10:30 WIB	N'golo Kante	Forward	15:02	2	0	3
11 Sep 2022 10:30 WIB	Raphael Wijanarko Wijono	Guard	12:57	2	0	2
11 Sep 2022 10:30 WIB	Richard Louis Widjaja	Guard	30:00	16	1	7
11 Sep 2022 10:30 WIB	Axelyno Welson	Center	05:57	0	0	1
11 Sep 2022 10:30 WIB	Frederick Evan Salim	Guard	17:53	0	5	4
11 Sep 2022 10:30 WIB	Othniel Nakata Tatontos	Center	10:19	3	0	2
11 Sep 2022 10:30 WIB	Fidelius William	Guard	14:54	1	0	2
11 Sep 2022 10:30 WIB	Alexander Wibisono	Forward	23:34	2	0	7
11 Sep 2022 10:30 WIB	Filbert Amerigo Ardenlie	Guard	08:28	0	0	1
11 Sep 2022 10:30 WIB	Michael Lawrence Arifin	Guard	33:35	38	2	4
11 Sep 2022 10:30 WIB	Marvel Suryanegara	Center	11:42	1	1	4
11 Sep 2022 10:30 WIB	Daffa Putra Fauzi	Center	07:43	0	0	3
11 Sep 2022 10:30 WIB	Ghozi Naufal Ahmad	Forward	03:52	0	0	1
11 Sep 2022 10:30 WIB	Daffan Putra Pamungkas	Forward	07:43	0	0	3
11 Sep 2022 10:30 WIB	Rayhansyach Surya Wardana	Guard	33:54	4	0	4
11 Sep 2022 10:30 WIB	Auriel Balthazar Tabentane	Guard	36:00	13	1	2
11 Sep 2022 10:30 WIB	Nauval Septian Pw	Guard	-	0	0	0
11 Sep 2022 10:30 WIB	Fabian Torori	Guard	23:56	4	1	1
11 Sep 2022 10:30 WIB	M. Juliano Pratama Tista	Center	11:07	0	0	1
11 Sep 2022 10:30 WIB	Novaldo Zawwa	Forward	34:47	4	1	8
11 Sep 2022 10:30 WIB	Abi Manyu	Guard	31:18	0	0	3
11 Sep 2022 10:30 WIB	Akbar Dwi Herwanto	Center	07:09	0	0	0
11 Sep 2022 12:10 WIB	Rafly Raditya Rachman	Forward	03:25	0	0	1
11 Sep 2022 12:10 WIB	Dhanis Handiyanto Tanudjaja	Guard	23:00	6	2	2
11 Sep 2022 12:10 WIB	Reyhan Hafidz Nur Cahya	Guard	13:53	0	1	0
11 Sep 2022 12:10 WIB	Danendra Ahnaf Athallah	Forward	19:09	6	0	2
11 Sep 2022 12:10 WIB	Fikri Wahyu	Center	16:21	8	0	6
11 Sep 2022 12:10 WIB	Muhammad Faiz Dzinnuha	Center	15:20	2	0	9
11 Sep 2022 12:10 WIB	Pryandika Mahendra	Forward	12:04	2	0	1
11 Sep 2022 12:10 WIB	Jibran Arrafi	Guard	24:30	6	3	2
11 Sep 2022 12:10 WIB	Zaidan Fadlurrohman Syafiq	Guard	12:23	2	1	1
11 Sep 2022 12:10 WIB	I Wayan Widhi Anggara	Forward	22:34	5	0	1
11 Sep 2022 12:10 WIB	Christofer Theodore	Guard	17:42	7	2	5
11 Sep 2022 12:10 WIB	George Wencesklaus Terence Chandra	Guard	18:29	2	0	1
11 Sep 2022 12:10 WIB	Brendan Carlos Santoso	Guard	-	0	0	0
11 Sep 2022 12:10 WIB	Kenneth Jodeista Selamat	Forward	17:59	0	0	2
11 Sep 2022 12:10 WIB	Justin Alexandro	Forward	20:38	0	0	1
11 Sep 2022 12:10 WIB	Jeremy Noel	Guard	28:41	4	0	4
11 Sep 2022 12:10 WIB	Jason Tricahyo Suko	Guard	18:26	0	0	1
11 Sep 2022 12:10 WIB	David Tristan Setiawan	Forward	06:11	0	0	0
11 Sep 2022 12:10 WIB	Isaac Charis El Wonder	Guard	-	0	0	0
11 Sep 2022 12:10 WIB	Reuben	Forward	06:11	0	0	0
11 Sep 2022 12:10 WIB	Yoel Camilo Febriyanto	Center	13:32	0	0	3
11 Sep 2022 12:10 WIB	Glenn Christian Antoro	Forward	26:20	0	0	3
11 Sep 2022 13:50 WIB	Josefano Adoniara Theofiga	Guard	16:40	6	1	0
11 Sep 2022 13:50 WIB	Abdurrahman Bayhaqi Choiri	Center	14:31	5	1	9
11 Sep 2022 13:50 WIB	Razzan Manggala Putra Budiono	Forward	21:24	4	3	1
11 Sep 2022 13:50 WIB	Mochammad Dwi Bayu Setyawan	Center	18:24	6	3	2
11 Sep 2022 13:50 WIB	Wahyu Eka Prasetyo	Guard	17:32	18	1	4
11 Sep 2022 13:50 WIB	Rayhan Primo Wahyudi	Forward	11:32	2	0	0
11 Sep 2022 13:50 WIB	Muhammad Hafizh Saripuddin	Forward	14:55	4	1	3
11 Sep 2022 13:50 WIB	Naufal Rafitama	Forward	11:32	1	0	1
11 Sep 2022 13:50 WIB	Farel Dwi Raditya	Guard	20:02	8	1	4
11 Sep 2022 13:50 WIB	Loishel Dago Tobogu	Guard	19:27	4	4	0
11 Sep 2022 13:50 WIB	Alexander Mahaviro	Center	13:33	0	1	4
11 Sep 2022 13:50 WIB	Milhan Aulia Afandi	Guard	09:10	0	0	0
11 Sep 2022 13:50 WIB	Edgar Adyatma	Center	30:32	5	1	11
11 Sep 2022 13:50 WIB	Abdullah Rino Ramadhani	Forward	23:25	3	0	4
11 Sep 2022 13:50 WIB	Noveto Javier Ramadhani	Forward	26:20	1	0	1
11 Sep 2022 13:50 WIB	Akbar Jarullah Fawwaz	Guard	20:16	1	2	6
11 Sep 2022 13:50 WIB	Brilliant Yusuf	Forward	32:43	16	0	1
11 Sep 2022 13:50 WIB	Achmad Fauzan Nur Firdaus	Forward	-	0	0	0
11 Sep 2022 13:50 WIB	Muhammad Rafiyan Nugraha	Center	08:42	5	0	4
11 Sep 2022 13:50 WIB	Dhonan Mugi Al Ghifari	Guard	20:03	2	1	1
11 Sep 2022 13:50 WIB	Michael Alonso Pandu Wicaksana	Guard	20:46	1	1	5
11 Sep 2022 13:50 WIB	Agraha Pudyas Tungkoro	Center	08:03	0	0	0
11 Sep 2022 15:30 WIB	Ricky Joenathan	Center	12:00	2	0	6
11 Sep 2022 15:30 WIB	Alvin Abel Darmawan	Forward	10:00	0	0	0
11 Sep 2022 15:30 WIB	Michael Henry Laksmana	Guard	24:46	6	1	5
11 Sep 2022 15:30 WIB	Nelson Davio	Guard	21:28	6	2	5
11 Sep 2022 15:30 WIB	Mauritius Kenneth T	Forward	25:58	7	0	4
11 Sep 2022 15:30 WIB	Jordan Tanadi	Guard	08:15	0	0	0
11 Sep 2022 15:30 WIB	Andrew Garcia Christianto	Guard	06:18	0	0	0
11 Sep 2022 15:30 WIB	Matthew Jefferson Besouw	Forward	07:15	2	0	3
11 Sep 2022 15:30 WIB	Jovannes Friendly Kurniawan	Guard	23:55	0	0	4
11 Sep 2022 15:30 WIB	Daoshen Justin Felix Okawida	Guard	15:00	0	1	1
11 Sep 2022 15:30 WIB	Vincentius Seconda Adrian	Guard	22:16	4	0	2
11 Sep 2022 15:30 WIB	Naufaltian Ega Zakariyya	Guard	34:24	5	0	5
11 Sep 2022 15:30 WIB	Yehezkiel Joel Prasetyo	Guard	36:32	12	0	4
11 Sep 2022 15:30 WIB	Ahmad Syauqi Siddiq	Forward	28:16	2	0	4
11 Sep 2022 15:30 WIB	Mirza Argya Wiratama	Forward	19:28	0	0	2
11 Sep 2022 15:30 WIB	Devasya Anaga Yudhistira	Guard	-	0	0	0
11 Sep 2022 15:30 WIB	Akhmad Razzan Rasyid	Guard	-	0	0	0
11 Sep 2022 15:30 WIB	Rakhaa Sheva	Guard	27:18	0	0	5
11 Sep 2022 15:30 WIB	Raafy Akbar Putra Pratama	Guard	-	0	0	0
11 Sep 2022 15:30 WIB	Javier Ibra Raelfiyanto Ramadhan	Center	-	0	0	0
11 Sep 2022 15:30 WIB	Dhelano Xavindra Islami	Center	06:14	1	0	2
11 Sep 2022 15:30 WIB	Stevan Marvin	Center	18:18	0	0	5
11 Sep 2022 17:10 WIB	James Kenneth	Guard	28:22	2	0	2
11 Sep 2022 17:10 WIB	Gilbert Jonathan	Forward	16:13	0	0	1
11 Sep 2022 17:10 WIB	Winston Huang	Center	27:46	2	0	8
11 Sep 2022 17:10 WIB	Alexander Betrand Foris	Forward	32:49	3	0	2
11 Sep 2022 17:10 WIB	James Adrian Suhardiman	Guard	19:14	0	0	1
11 Sep 2022 17:10 WIB	Darrell Raphael Putra	Forward	25:29	1	0	1
11 Sep 2022 17:10 WIB	Gerrard Wilson Setiawan	Center	28:00	0	0	3
11 Sep 2022 17:10 WIB	Cliff Joseph	Forward	-	0	0	0
11 Sep 2022 17:10 WIB	Jordan Rumuy	Guard	22:07	0	0	1
11 Sep 2022 17:10 WIB	Christian Kenza Devven Goni	Guard	25:29	1	0	1
11 Sep 2022 17:10 WIB	Joshua Vincent	Guard	-	0	0	0
11 Sep 2022 17:10 WIB	Ferdinan Dwi Armando Meirangga Agung Saputra	Forward	14:22	0	1	2
11 Sep 2022 17:10 WIB	Dany Firman Lazuardi	Guard	13:07	4	5	5
11 Sep 2022 17:10 WIB	M.riyan Firmansyah	Forward	25:39	4	4	1
11 Sep 2022 17:10 WIB	Mohammed Def Zinedine Fajrie	Forward	12:27	6	1	3
11 Sep 2022 17:10 WIB	Athalla Tirta Wisesa	Guard	19:01	4	0	2
11 Sep 2022 17:10 WIB	Jagad Lakon Sejati	Guard	18:00	17	2	5
11 Sep 2022 17:10 WIB	Stanly Vian Pratama	Guard	06:24	0	1	0
11 Sep 2022 17:10 WIB	Akmal Syauqi Ramadhan	Guard	20:00	11	2	8
11 Sep 2022 17:10 WIB	Jerino Dzaky Priambodo	Forward	15:37	4	2	2
11 Sep 2022 17:10 WIB	Aldi Darahtul Rohman	Forward	19:09	2	0	4
11 Sep 2022 17:10 WIB	Muhammad Rohman Azizi	Forward	22:00	8	2	5
11 Sep 2022 18:50 WIB	Valentino Natanael	Guard	17:50	10	0	0
11 Sep 2022 18:50 WIB	Muhammad Myzan Zhydan	Center	22:04	0	0	2
11 Sep 2022 18:50 WIB	Rio Julian Ramadhani	Guard	31:36	2	5	2
11 Sep 2022 18:50 WIB	Rahmat Kurniawan	Center	19:55	7	3	6
11 Sep 2022 18:50 WIB	Muhammad Ardiaz Maulana S	Guard	23:08	5	1	3
11 Sep 2022 18:50 WIB	Abyakta Prabowo	Guard	10:51	0	0	1
11 Sep 2022 18:50 WIB	Zidan Akbar Diansyah	Forward	16:53	6	0	3
11 Sep 2022 18:50 WIB	I Made Dhiyo S.a	Center	10:10	4	0	3
11 Sep 2022 18:50 WIB	Satrio Wibisono	Forward	07:43	0	0	1
11 Sep 2022 18:50 WIB	Haidar Rafli	Forward	25:30	9	1	4
11 Sep 2022 18:50 WIB	Bagas Raditya	Forward	07:10	0	1	1
11 Sep 2022 18:50 WIB	Rafines Farrel Ismail	Forward	06:53	0	0	0
11 Sep 2022 18:50 WIB	Federico Doxa Widiyanto	Guard	08:44	0	0	1
11 Sep 2022 18:50 WIB	Edward Rivaldi Kosasih	Center	21:02	4	0	12
11 Sep 2022 18:50 WIB	Jason Wangsa	Guard	36:30	9	0	6
11 Sep 2022 18:50 WIB	Nathanael Wilson Purnawan	Forward	08:33	2	0	3
11 Sep 2022 18:50 WIB	Justin Wangsa	Forward	31:58	6	1	1
11 Sep 2022 18:50 WIB	Meyer Chang	Forward	27:58	2	2	4
11 Sep 2022 18:50 WIB	Akio Setiawan	Guard	18:02	7	0	7
11 Sep 2022 18:50 WIB	Neilson Pranata	Forward	11:37	0	0	1
11 Sep 2022 18:50 WIB	Nelson Cristiano	Guard	08:48	0	0	2
11 Sep 2022 18:50 WIB	Bryer Steven Chang	Guard	19:55	4	0	2
12 Sep 2022 10:30 WIB	Matthew Alonso Wibowo	Forward	-	0	0	0
12 Sep 2022 10:30 WIB	George Christiano	Guard	34:03	13	4	10
12 Sep 2022 10:30 WIB	Vito Camello Oscar Jatmiko	Guard	28:02	13	4	5
12 Sep 2022 10:30 WIB	Marco Clarence Purnomo	Guard	18:25	5	2	4
12 Sep 2022 10:30 WIB	Trevis Artagrantdy Kurniawan	Forward	12:15	2	1	3
12 Sep 2022 10:30 WIB	Alfredo Marcellino Kusuma	Guard	23:01	5	1	5
12 Sep 2022 10:30 WIB	Darren Grant Alexandre Wang	Forward	09:58	2	1	0
12 Sep 2022 10:30 WIB	Kevin De Brune	Forward	06:44	3	0	0
12 Sep 2022 10:30 WIB	Sebastian Reyhan Tanuwijaya	Guard	25:02	3	0	1
12 Sep 2022 10:30 WIB	Stanley Mulya Irawan	Guard	16:57	0	2	2
12 Sep 2022 10:30 WIB	Christopher Matthew Pranata	Guard	11:48	4	1	0
12 Sep 2022 10:30 WIB	Benedict Nathanael Nareswara	Center	12:57	1	1	1
12 Sep 2022 10:30 WIB	Darian Joseph Setiabudi	Center	24:00	9	1	7
12 Sep 2022 10:30 WIB	Michael Christian Jaya	Guard	28:47	0	3	4
12 Sep 2022 10:30 WIB	Juan Morello Gulo	Forward	19:55	0	1	4
12 Sep 2022 10:30 WIB	Fernando Wijaya	Forward	14:00	6	2	0
12 Sep 2022 10:30 WIB	Justin Hadinata	Guard	23:56	4	0	8
12 Sep 2022 10:30 WIB	Ian Philip Wijaksono	Center	10:55	0	0	2
12 Sep 2022 10:30 WIB	Dillon Ivanandrew Prasetya	Guard	19:17	6	0	2
12 Sep 2022 10:30 WIB	Gregory Anderson	Center	06:45	0	0	2
12 Sep 2022 10:30 WIB	Christophorus Leonard	Guard	16:22	0	0	2
12 Sep 2022 10:30 WIB	Michael Angelo	Forward	06:35	0	0	0
12 Sep 2022 12:10 WIB	Paula Pramita Sikwandy	Guard	-	0	0	0
12 Sep 2022 12:10 WIB	Setio Giovanni	Guard	15:49	10	4	2
12 Sep 2022 12:10 WIB	Cheryl	Forward	13:53	10	2	0
12 Sep 2022 12:10 WIB	Michelle Angelina Abadi	Forward	26:07	6	3	3
12 Sep 2022 12:10 WIB	Mayviana Lysandra Tandiono	Guard	24:11	8	4	2
12 Sep 2022 12:10 WIB	Kayla Hananiah Fu	Guard	23:52	6	4	2
12 Sep 2022 12:10 WIB	Komang Mariani Puteri Sekar Sari	Forward	18:57	10	2	5
12 Sep 2022 12:10 WIB	Jane Lavinia Chiang	Guard	16:56	2	2	1
12 Sep 2022 12:10 WIB	Aiko Femie Belle Wijaya	Forward	23:46	8	0	2
12 Sep 2022 12:10 WIB	Putu Kezia Angelie Setiawan	Forward	20:40	11	2	3
12 Sep 2022 12:10 WIB	Nathania Nicole Sasongko	Center	-	0	0	0
12 Sep 2022 12:10 WIB	Zalfa Widianti	Forward	11:58	0	0	0
12 Sep 2022 12:10 WIB	Isyatir Rodiyah	Guard	29:32	8	0	6
12 Sep 2022 12:10 WIB	Vanessia Adonia	Forward	16:13	0	0	1
12 Sep 2022 12:10 WIB	Niadwi Mayangsari	Forward	17:05	0	0	3
12 Sep 2022 12:10 WIB	Clara Sandrina	Forward	30:09	4	1	5
12 Sep 2022 12:10 WIB	Shafira Azzahra Ramadhani	Guard	15:35	0	0	1
12 Sep 2022 12:10 WIB	Salsabillah Fitria Wahyu Wardani	Guard	10:43	0	0	0
12 Sep 2022 12:10 WIB	Indriya Rahmawati	Forward	23:02	0	0	4
12 Sep 2022 12:10 WIB	Marzha Al Bhiant	Forward	06:14	0	0	0
12 Sep 2022 12:10 WIB	Luna Maulitha	Guard	11:55	0	0	2
12 Sep 2022 12:10 WIB	Khafifa Arda	Center	09:32	0	0	0
12 Sep 2022 13:50 WIB	Janice Patricia Laeman	Guard	27:56	0	1	7
12 Sep 2022 13:50 WIB	Ailina Carin Huang	Guard	16:02	2	0	1
12 Sep 2022 13:50 WIB	Ellen Natalia	Forward	06:14	0	0	1
12 Sep 2022 13:50 WIB	Syleena Feodora	Forward	26:08	5	0	9
12 Sep 2022 13:50 WIB	Celine Chandra	Forward	35:48	3	4	4
12 Sep 2022 13:50 WIB	Ladysia Megane C	Forward	04:42	0	0	0
12 Sep 2022 13:50 WIB	Jolin Isabel Santoso	Forward	07:03	0	0	0
12 Sep 2022 13:50 WIB	Jeannice Laurensia Santoso	Guard	06:15	0	0	2
12 Sep 2022 13:50 WIB	Chelsea Chandra	Guard	35:48	3	4	4
12 Sep 2022 13:50 WIB	Amelia Zelda	Forward	08:20	0	0	1
12 Sep 2022 13:50 WIB	Janice Tantojo	Forward	26:14	4	0	4
12 Sep 2022 13:50 WIB	Kartika Putri	Forward	38:00	8	1	6
12 Sep 2022 13:50 WIB	Irmalia Canasti	Guard	39:28	8	1	7
12 Sep 2022 13:50 WIB	Shendy Aurelya C P	Center	14:11	4	0	3
12 Sep 2022 13:50 WIB	Leilani Najla Putri	Guard	36:28	0	0	1
12 Sep 2022 13:50 WIB	Keysha Davina R	Forward	08:03	0	0	0
12 Sep 2022 13:50 WIB	Safina Talitha	Guard	11:32	0	0	1
12 Sep 2022 13:50 WIB	Nisrina Fitriyanti W	Guard	21:40	0	0	3
12 Sep 2022 13:50 WIB	Hanina Yasmin	Forward	00:32	0	0	0
12 Sep 2022 13:50 WIB	Naura Olivia Alghifary	Forward	06:07	0	0	0
12 Sep 2022 13:50 WIB	Maghfira Ph	Guard	23:59	0	0	4
12 Sep 2022 13:50 WIB	Alfanana Puteri	Guard	-	0	0	0
12 Sep 2022 15:30 WIB	Muhammad Zaidan Nashrul Haq	Guard	29:00	7	3	3
12 Sep 2022 15:30 WIB	Seta Pragata Anak Agung Kayana	Forward	24:56	0	0	1
12 Sep 2022 15:30 WIB	Yanuar Firdausi	Guard	-	0	0	0
12 Sep 2022 15:30 WIB	Barra Chaezsar Poetra Viansyah	Guard	18:29	2	0	4
12 Sep 2022 15:30 WIB	Syauqi Mahbubi Al Adibi	Guard	10:51	0	0	0
12 Sep 2022 15:30 WIB	Daffa Athalla Defrianto	Guard	31:46	14	1	0
12 Sep 2022 15:30 WIB	Aqila Fayruz	Center	06:57	0	0	0
12 Sep 2022 15:30 WIB	Ridhwan Ammar Hisyam	Forward	18:35	0	0	3
12 Sep 2022 15:30 WIB	Irgi Ardiansyah	Center	33:03	6	0	7
12 Sep 2022 15:30 WIB	Moch. Dhofar Nadhmy Abu Antar	Forward	06:47	0	0	2
12 Sep 2022 15:30 WIB	Abimanyu Hanania Son’of Satriodono	Guard	08:23	0	0	1
12 Sep 2022 15:30 WIB	Muhammad Wildan Ramadhan	Guard	26:58	4	0	1
12 Sep 2022 15:30 WIB	Muchammad Bagus Aqhila	Forward	11:02	0	1	1
12 Sep 2022 15:30 WIB	Rifqi Muzakki F.	Center	26:06	5	2	16
12 Sep 2022 15:30 WIB	Achmad Gandhi	Guard	06:57	0	0	0
12 Sep 2022 15:30 WIB	Raditya Naufal Fauzan	Forward	24:57	4	1	4
12 Sep 2022 15:30 WIB	Athallah Isnindra Lesmana	Guard	17:32	1	1	3
12 Sep 2022 15:30 WIB	Brave Earnest Anindya Rizky	Forward	18:06	0	0	2
12 Sep 2022 15:30 WIB	Muhammad Rafly Ardyan	Forward	29:22	15	2	7
12 Sep 2022 15:30 WIB	Ananda Miftahul Falah	Center	13:19	4	1	2
12 Sep 2022 15:30 WIB	Radja Althav Pramudya	Guard	08:28	0	0	0
12 Sep 2022 15:30 WIB	Muhammad Ar Rayyan	Center	17:13	4	1	2
12 Sep 2022 17:10 WIB	Sirius Dwi Cahaya Arylis	Forward	19:06	0	0	7
12 Sep 2022 17:10 WIB	Giga Tarangga Yudha	Center	30:00	3	0	9
12 Sep 2022 17:10 WIB	Alaric Matalino Setiawan Putra	Forward	13:40	0	0	2
12 Sep 2022 17:10 WIB	Rafi Firmansyah	Guard	10:40	0	0	0
12 Sep 2022 17:10 WIB	Afriza Fernanda	Guard	10:36	0	0	0
12 Sep 2022 17:10 WIB	Rahmat Hidayat	Forward	08:46	2	0	0
12 Sep 2022 17:10 WIB	Valentino Imanuel Lekatompessy	Forward	12:13	0	0	1
12 Sep 2022 17:10 WIB	I Nyoman Surya Desta Ariwibawa	Forward	07:59	0	0	1
12 Sep 2022 17:10 WIB	Gentur Nur Ramadhani	Guard	32:54	3	2	0
12 Sep 2022 17:10 WIB	Muhammad Naufal Nabil Firdaus	Guard	18:33	0	0	3
12 Sep 2022 17:10 WIB	Reva Putra	Guard	10:24	0	0	1
12 Sep 2022 17:10 WIB	Ahmad Mutawakkil Kurnia	Guard	13:40	0	0	1
12 Sep 2022 17:10 WIB	Muhammad Andrean Rizq Prasetio	Guard	21:06	0	3	2
12 Sep 2022 17:10 WIB	Raffino Razzandi	Forward	16:51	4	3	3
12 Sep 2022 17:10 WIB	Syahrir Ramadhan	Guard	18:54	2	3	1
12 Sep 2022 17:10 WIB	Novanda Nathanael Silaban	Center	14:07	6	0	4
12 Sep 2022 17:10 WIB	Muhammad Iftikhaar Ramadhan	Forward	18:49	10	0	4
12 Sep 2022 17:10 WIB	Robintsany Javonda Ahmed	Forward	12:22	2	0	4
12 Sep 2022 17:10 WIB	Satrio Prayogo	Forward	17:51	4	1	4
12 Sep 2022 17:10 WIB	Effan Safaraz Adzikra	Guard	20:15	2	3	1
12 Sep 2022 17:10 WIB	Muhammad Hanif Karomi	Guard	19:13	9	1	4
12 Sep 2022 17:10 WIB	Arfel Faaza H	Guard	13:43	2	1	0
12 Sep 2022 18:50 WIB	Fathur Rahman Abidin	Guard	40:00	13	0	7
12 Sep 2022 18:50 WIB	Danandaya Raditya Rozano Prakoeswa	Guard	05:37	0	0	0
12 Sep 2022 18:50 WIB	Raditya Arya Daniswara	Forward	11:50	0	0	2
12 Sep 2022 18:50 WIB	Atha Zaky Handika Putra	Center	12:10	0	0	0
12 Sep 2022 18:50 WIB	Ferdian Ardra Hafizhan	Guard	31:40	1	0	4
12 Sep 2022 18:50 WIB	Muhammad Raffi Ariyanto	Center	08:17	0	0	0
12 Sep 2022 18:50 WIB	Izaz Faizah Calyadarma	Center	04:11	1	0	1
12 Sep 2022 18:50 WIB	Ahmad Tsaqif Najwan Nadhif	Guard	06:20	0	0	1
12 Sep 2022 18:50 WIB	Alfaril Dzaky	Guard	34:59	0	0	4
12 Sep 2022 18:50 WIB	Danu Sigit Pratama	Guard	14:12	0	0	1
12 Sep 2022 18:50 WIB	Brian Arga	Forward	-	0	0	0
12 Sep 2022 18:50 WIB	Radja Daniyal	Forward	16:47	2	1	2
12 Sep 2022 18:50 WIB	Ronaldo Hamdika	Forward	09:24	0	1	2
12 Sep 2022 18:50 WIB	Jason Ajisatrya Brian Putera	Guard	10:05	0	0	1
12 Sep 2022 18:50 WIB	Muhammad Haikhal	Guard	09:36	3	0	2
12 Sep 2022 18:50 WIB	Muhammad Zakky Dikmansyah	Center	33:34	7	1	17
12 Sep 2022 18:50 WIB	Davino Dafa Rafael	Guard	08:41	0	0	2
12 Sep 2022 18:50 WIB	Diaz Ardianto Rizky	Guard	09:08	0	0	2
12 Sep 2022 18:50 WIB	Satrio Bayu	Guard	-	0	0	0
12 Sep 2022 18:50 WIB	Muhammad Alfareyno Ramadhan	Guard	12:57	5	1	2
12 Sep 2022 18:50 WIB	Anggara Putra	Guard	35:22	10	5	3
12 Sep 2022 18:50 WIB	Elang Satria Rajendra Dewanto	Forward	29:30	13	3	11
13 Sep 2022 10:30 WIB	Josefano Adoniara Theofiga	Guard	23:04	6	2	2
13 Sep 2022 10:30 WIB	Abdurrahman Bayhaqi Choiri	Center	28:45	5	3	6
13 Sep 2022 10:30 WIB	Razzan Manggala Putra Budiono	Forward	12:35	5	0	1
13 Sep 2022 10:30 WIB	Mochammad Dwi Bayu Setyawan	Center	11:20	2	1	1
13 Sep 2022 10:30 WIB	Wahyu Eka Prasetyo	Guard	25:30	9	0	4
13 Sep 2022 10:30 WIB	Rayhan Primo Wahyudi	Forward	13:25	0	0	1
13 Sep 2022 10:30 WIB	Muhammad Hafizh Saripuddin	Forward	28:22	5	1	8
13 Sep 2022 10:30 WIB	Naufal Rafitama	Forward	06:58	0	0	0
13 Sep 2022 10:30 WIB	Farel Dwi Raditya	Guard	10:28	0	0	2
13 Sep 2022 10:30 WIB	Loishel Dago Tobogu	Guard	26:09	8	0	8
13 Sep 2022 10:30 WIB	Alexander Mahaviro	Center	06:56	0	0	1
13 Sep 2022 10:30 WIB	Ricky Joenathan	Center	11:33	3	0	4
13 Sep 2022 10:30 WIB	Alvin Abel Darmawan	Forward	07:30	0	0	1
13 Sep 2022 10:30 WIB	Michael Henry Laksmana	Guard	24:58	6	2	9
13 Sep 2022 10:30 WIB	Nelson Davio	Guard	30:57	9	2	5
13 Sep 2022 10:30 WIB	Mauritius Kenneth T	Forward	33:10	16	1	6
13 Sep 2022 10:30 WIB	Jordan Tanadi	Guard	03:02	0	0	3
13 Sep 2022 10:30 WIB	Andrew Garcia Christianto	Guard	07:51	0	0	0
13 Sep 2022 10:30 WIB	Matthew Jefferson Besouw	Forward	11:57	0	0	0
13 Sep 2022 10:30 WIB	Jovannes Friendly Kurniawan	Guard	15:32	3	1	1
13 Sep 2022 10:30 WIB	Daoshen Justin Felix Okawida	Guard	06:46	0	0	0
13 Sep 2022 10:30 WIB	Vincentius Seconda Adrian	Guard	19:03	0	0	4
13 Sep 2022 12:10 WIB	Nava Valida	Forward	06:54	0	0	1
13 Sep 2022 12:10 WIB	Jessica Shine Utomo	Center	12:00	0	0	1
13 Sep 2022 12:10 WIB	Clementine Emely	Center	10:06	2	0	1
13 Sep 2022 12:10 WIB	Avryll Adellaine	Forward	20:27	0	1	1
13 Sep 2022 12:10 WIB	Andrea Christy	Guard	33:36	0	4	6
13 Sep 2022 12:10 WIB	Katherine Jesselynn Wijaya	Forward	18:52	6	0	3
13 Sep 2022 12:10 WIB	Susan Anggara	Guard	23:51	2	1	2
13 Sep 2022 12:10 WIB	Reyna Felicia Mongkol	Guard	15:14	0	0	1
13 Sep 2022 12:10 WIB	Jennifer Prayogo	Guard	06:09	0	0	1
13 Sep 2022 12:10 WIB	Jennifer Patricia	Forward	05:57	0	0	2
13 Sep 2022 12:10 WIB	Jessica Cindrawati Oentario	Forward	06:54	0	0	0
13 Sep 2022 12:10 WIB	Deff Qanca Arma Frecadanda	Guard	09:10	0	0	2
13 Sep 2022 12:10 WIB	Aqilla Tasya Tabina Gaeisani	Guard	23:35	5	1	5
13 Sep 2022 12:10 WIB	Alievia Kartika Putri	Guard	06:21	0	0	1
13 Sep 2022 12:10 WIB	Afifah Putri Shabrina	Forward	10:18	0	0	6
13 Sep 2022 12:10 WIB	Reva Safrina Hans Wibisono	Forward	-	0	0	0
13 Sep 2022 12:10 WIB	Endilia Rochmala Devi	Guard	27:01	11	0	3
13 Sep 2022 12:10 WIB	Anabel Parama Putri	Guard	22:10	0	1	1
13 Sep 2022 12:10 WIB	Ayunda Charlestya	Forward	29:21	2	1	13
13 Sep 2022 12:10 WIB	Eva Yulia Rossa	Guard	24:27	2	1	2
13 Sep 2022 12:10 WIB	Anggy Gunawan	Guard	17:51	4	0	2
13 Sep 2022 12:10 WIB	Rahma Tsania Ramadhani	Forward	10:40	0	0	2
13 Sep 2022 13:50 WIB	Agnes Winata	Forward	25:22	2	0	7
13 Sep 2022 13:50 WIB	Gracia Cathie Gunawan	Center	14:56	0	0	1
13 Sep 2022 13:50 WIB	Clarissa Hendrajaya	Guard	40:00	8	1	9
13 Sep 2022 13:50 WIB	Eleonora Joycelyne	Guard	06:37	0	0	0
13 Sep 2022 13:50 WIB	Vanessa Lie	Guard	40:00	6	2	5
13 Sep 2022 13:50 WIB	Euginia Riviera	Center	15:40	0	1	4
13 Sep 2022 13:50 WIB	Shiera Agatha	Guard	17:38	0	0	2
13 Sep 2022 13:50 WIB	Birgitta Arianto	Forward	01:33	0	0	0
13 Sep 2022 13:50 WIB	Valerie Gabriela Kusuma	Center	-	0	0	0
13 Sep 2022 13:50 WIB	Nathaneyla Alicya Abraham	Forward	12:41	0	0	0
13 Sep 2022 13:50 WIB	Eugenia Tejokusumo	Forward	06:45	0	0	1
13 Sep 2022 13:50 WIB	Emelyn Joyvania Mardyanto	Guard	18:48	0	0	3
13 Sep 2022 13:50 WIB	Nurhalizah	Guard	15:31	6	0	2
13 Sep 2022 13:50 WIB	Desak Ayu Tiara Renata	Forward	16:08	4	0	0
13 Sep 2022 13:50 WIB	Chelsea Aurelia Ramadhani	Guard	26:37	4	4	8
13 Sep 2022 13:50 WIB	Maorin Alifia Azzahra	Forward	-	0	0	0
13 Sep 2022 13:50 WIB	Cindy Claudia Aruan	Guard	10:49	2	0	1
13 Sep 2022 13:50 WIB	Aliya Nabila	Forward	24:52	8	2	9
13 Sep 2022 13:50 WIB	Olivia Aura Rachma Trufani	Guard	12:28	0	0	3
13 Sep 2022 13:50 WIB	Aulia Nur Ramadani	Forward	24:28	5	0	0
13 Sep 2022 13:50 WIB	Kiara Clarissa Farandy	Forward	18:31	2	0	9
13 Sep 2022 13:50 WIB	Aqila Dewi Sayrindra	Guard	11:45	2	3	1
13 Sep 2022 13:50 WIB	Zahra Cantika Boneta	Forward	10:00	2	0	0
13 Sep 2022 15:30 WIB	Jatayu Adiyaksa Negara	Forward	-	0	0	0
13 Sep 2022 15:30 WIB	Ryan Fathurrahman	Forward	25:25	0	2	1
13 Sep 2022 15:30 WIB	Moch. Gilang Saputra	Guard	17:08	1	1	2
13 Sep 2022 15:30 WIB	Arif Dwi	Guard	21:35	7	0	3
13 Sep 2022 15:30 WIB	Joseph Matthew Santoso	Guard	09:52	0	0	0
13 Sep 2022 15:30 WIB	Raka Prakasita Ramadhani	Forward	07:01	0	0	1
13 Sep 2022 15:30 WIB	Moch. Firsyahbani Erlangga	Forward	27:51	7	0	3
13 Sep 2022 15:30 WIB	Fawwaz Bobsaid	Guard	-	0	0	0
13 Sep 2022 15:30 WIB	Rajendra Ghafar Praptama	Forward	39:24	13	0	6
13 Sep 2022 15:30 WIB	Nobel Fabian	Forward	40:28	7	1	8
13 Sep 2022 15:30 WIB	Alhafiz Rz	Forward	08:16	0	0	1
13 Sep 2022 15:30 WIB	Joeyson Salam	Guard	08:55	2	0	2
13 Sep 2022 15:30 WIB	Brian Robinson	Forward	17:05	1	1	6
13 Sep 2022 15:30 WIB	Elgine Theo Thamtoro	Guard	40:23	4	1	15
13 Sep 2022 15:30 WIB	Gerrie Brevitio	Forward	25:00	8	0	3
13 Sep 2022 15:30 WIB	Axel Braxton Sajogo	Forward	06:30	0	1	1
13 Sep 2022 15:30 WIB	Soedomo Henry Cahyono	Forward	07:40	2	0	0
13 Sep 2022 15:30 WIB	Lodewyk Jason	Guard	36:53	14	1	1
13 Sep 2022 15:30 WIB	Owen Guito	Center	27:43	1	0	5
13 Sep 2022 15:30 WIB	Jeremiah Jason Chen	Forward	09:32	2	0	0
13 Sep 2022 15:30 WIB	Ingvar Rusli	Guard	31:15	13	5	4
13 Sep 2022 15:30 WIB	Shawn Michael Koeswandi	Guard	07:33	1	0	0
13 Sep 2022 17:10 WIB	Ferdinan Dwi Armando Meirangga Agung Saputra	Forward	20:58	4	0	1
13 Sep 2022 17:10 WIB	Dany Firman Lazuardi	Guard	28:56	6	1	1
13 Sep 2022 17:10 WIB	M.riyan Firmansyah	Forward	08:52	0	0	0
13 Sep 2022 17:10 WIB	Mohammed Def Zinedine Fajrie	Forward	07:47	0	0	2
13 Sep 2022 17:10 WIB	Athalla Tirta Wisesa	Guard	10:00	0	0	1
13 Sep 2022 17:10 WIB	Jagad Lakon Sejati	Guard	30:38	17	0	4
13 Sep 2022 17:10 WIB	Stanly Vian Pratama	Guard	25:56	3	2	5
13 Sep 2022 17:10 WIB	Akmal Syauqi Ramadhan	Guard	06:24	0	0	2
13 Sep 2022 17:10 WIB	Jerino Dzaky Priambodo	Forward	13:48	0	0	6
13 Sep 2022 17:10 WIB	Aldi Darahtul Rohman	Forward	15:59	0	0	5
13 Sep 2022 17:10 WIB	Muhammad Rohman Azizi	Forward	08:41	2	0	0
13 Sep 2022 17:10 WIB	N'golo Kante	Forward	10:51	0	1	3
13 Sep 2022 17:10 WIB	Raphael Wijanarko Wijono	Guard	04:54	0	0	0
13 Sep 2022 17:10 WIB	Richard Louis Widjaja	Guard	29:31	8	3	4
13 Sep 2022 17:10 WIB	Axelyno Welson	Center	09:13	1	0	2
13 Sep 2022 17:10 WIB	Frederick Evan Salim	Guard	27:52	0	0	3
13 Sep 2022 17:10 WIB	Othniel Nakata Tatontos	Center	10:21	0	0	0
13 Sep 2022 17:10 WIB	Fidelius William	Guard	11:07	0	0	1
13 Sep 2022 17:10 WIB	Alexander Wibisono	Forward	26:01	2	0	8
13 Sep 2022 17:10 WIB	Filbert Amerigo Ardenlie	Guard	09:05	0	0	1
13 Sep 2022 17:10 WIB	Michael Lawrence Arifin	Guard	33:59	11	2	3
13 Sep 2022 17:10 WIB	Marvel Suryanegara	Center	09:39	0	0	1
13 Sep 2022 18:50 WIB	Cliff Louis	Forward	33:29	8	4	5
13 Sep 2022 18:50 WIB	Darren Tan	Guard	29:48	16	1	2
13 Sep 2022 18:50 WIB	Nicholas Demily	Guard	06:30	0	0	1
13 Sep 2022 18:50 WIB	Raffael Panji Amadeus	Forward	14:24	3	0	2
13 Sep 2022 18:50 WIB	Kenneth Chandradinata	Guard	11:37	0	0	0
13 Sep 2022 18:50 WIB	Jansen Cahyadi	Guard	-	0	0	0
13 Sep 2022 18:50 WIB	Daniel Nicholas Delin	Guard	24:06	6	3	0
13 Sep 2022 18:50 WIB	Justin Patrick Alex	Guard	26:09	6	4	3
13 Sep 2022 18:50 WIB	William Wongsoadi	Center	06:32	0	0	0
13 Sep 2022 18:50 WIB	Lourencio Dustin	Guard	07:26	0	0	0
13 Sep 2022 18:50 WIB	Alfonsus Bernd	Center	07:25	0	0	1
13 Sep 2022 18:50 WIB	Freno Nymmo Shakkawijaya	Guard	24:36	7	1	3
13 Sep 2022 18:50 WIB	Criston Jonathan Hananto	Guard	07:57	3	1	0
13 Sep 2022 18:50 WIB	Yogie Putra Darmawan	Forward	23:14	2	0	1
13 Sep 2022 18:50 WIB	Michael Jason Christian Widya	Forward	10:44	0	0	1
13 Sep 2022 18:50 WIB	Pedro Valencio Sudarto	Guard	07:54	0	0	1
13 Sep 2022 18:50 WIB	Richie Bertrand Linardi	Forward	35:18	12	4	6
13 Sep 2022 18:50 WIB	Kennie Elbert Kristanto	Guard	30:37	4	2	8
13 Sep 2022 18:50 WIB	Kenas Lebtinneo	Forward	10:21	4	1	1
13 Sep 2022 18:50 WIB	Romualdus Reno Santoso	Guard	07:20	3	0	2
13 Sep 2022 18:50 WIB	Kennard Austin Sutanto	Forward	28:35	11	1	4
13 Sep 2022 18:50 WIB	Brennen Edric Winoto	Forward	06:34	0	0	2
14 Sep 2022 13:30 WIB	Lynn Louise	Center	21:46	18	2	4
14 Sep 2022 13:30 WIB	Wineke	Forward	20:02	6	1	1
14 Sep 2022 13:30 WIB	Stefani Helen	Forward	21:19	2	3	7
14 Sep 2022 13:30 WIB	Ganeviene Brightly Huang	Guard	24:17	11	4	4
14 Sep 2022 13:30 WIB	Charisma Dewi Sephira Harianto	Center	08:11	0	0	3
14 Sep 2022 13:30 WIB	Micheline Chiesa Wijanto	Forward	-	0	0	0
14 Sep 2022 13:30 WIB	Sonia Darmawan	Center	09:39	2	0	2
14 Sep 2022 13:30 WIB	Gwyneth Marjorie Koo	Forward	21:49	16	1	3
14 Sep 2022 13:30 WIB	Allyson Liem	Guard	18:14	6	1	2
14 Sep 2022 13:30 WIB	Anastasia Nadia Lisian	Guard	18:31	0	0	9
14 Sep 2022 13:30 WIB	Adeline Arella Louisa Wiranto	Guard	27:52	6	5	1
14 Sep 2022 13:30 WIB	Angel Kristiani	Center	32:42	2	0	6
14 Sep 2022 13:30 WIB	Erni Juliandini	Center	24:27	1	0	6
14 Sep 2022 13:30 WIB	Ferlynda Devi	Guard	19:27	0	1	1
14 Sep 2022 13:30 WIB	Rahma Izza Safira	Guard	18:05	2	0	2
14 Sep 2022 13:30 WIB	Raudhotul Jannah	Forward	06:34	0	0	0
14 Sep 2022 13:30 WIB	Sherli Putri Margareta	Forward	16:32	0	0	0
14 Sep 2022 13:30 WIB	Fiatiana Aurora Putri	Guard	07:00	0	0	0
14 Sep 2022 13:30 WIB	Refalina Nuryatmaja	Center	14:32	0	0	2
14 Sep 2022 13:30 WIB	Fifin Imelda	Guard	07:01	0	0	0
14 Sep 2022 13:30 WIB	Syavira Dwi Kumala Putri	Guard	19:28	1	0	6
14 Sep 2022 13:30 WIB	Tabita Wahyu Adelia Hidayat	Guard	19:06	0	0	0
14 Sep 2022 15:10 WIB	Bradley Nathaniel Wijaya	Guard	32:17	12	3	3
14 Sep 2022 15:10 WIB	Michael Ken Tansa	Guard	08:33	0	0	1
14 Sep 2022 15:10 WIB	Edward Hugo	Center	11:34	2	0	2
14 Sep 2022 15:10 WIB	Jordan Winarta	Guard	12:36	0	0	5
14 Sep 2022 15:10 WIB	Glenn Geraldo	Forward	24:50	6	2	5
14 Sep 2022 15:10 WIB	Theodore Furui Widyatmoko	Center	07:51	2	1	0
14 Sep 2022 15:10 WIB	Jason William	Forward	10:31	0	0	1
14 Sep 2022 15:10 WIB	Luke Taylor	Center	21:07	12	0	11
14 Sep 2022 15:10 WIB	Jin Hyeok Kang	Forward	11:55	0	0	1
14 Sep 2022 15:10 WIB	Tom Aristo	Forward	09:42	2	0	2
14 Sep 2022 15:10 WIB	Rionel Laurence Effendi	Guard	18:31	3	0	5
14 Sep 2022 15:10 WIB	Izal Adiara	Center	15:04	0	0	2
14 Sep 2022 15:10 WIB	Ahmad Akmal Syafi'i	Forward	12:41	2	0	2
14 Sep 2022 15:10 WIB	Danendra Laskar	Center	33:15	11	0	11
14 Sep 2022 15:10 WIB	Nuno Xabiel Alfayza	Forward	12:43	4	0	5
14 Sep 2022 15:10 WIB	Yeheskiel Kaat	Guard	24:45	0	2	0
14 Sep 2022 15:10 WIB	Muhammad Tsany Qadama	Forward	25:34	1	0	7
14 Sep 2022 15:10 WIB	Ismail Rizqi	Center	-	0	0	0
14 Sep 2022 15:10 WIB	Muhammad Zakky Satria Darmawan	Forward	20:36	7	0	1
14 Sep 2022 15:10 WIB	Yaqzhan Qushay Z	Guard	13:35	0	0	1
14 Sep 2022 15:10 WIB	Ahmad Bagas Saputra	Guard	07:36	0	0	1
14 Sep 2022 15:10 WIB	Afif Muhammad Raihan	Center	08:00	0	0	3
14 Sep 2022 16:50 WIB	Aukha Dwi Istiqhomah	Guard	24:29	4	0	2
14 Sep 2022 16:50 WIB	Annisa Rahmadania Muchlis	Center	08:42	0	0	1
14 Sep 2022 16:50 WIB	Raras Puspa Sary	Center	08:42	0	0	0
14 Sep 2022 16:50 WIB	Zaskya Rafana	Forward	06:48	0	0	0
14 Sep 2022 16:50 WIB	Zalsa Kirana Putri	Forward	31:28	9	2	7
14 Sep 2022 16:50 WIB	25. Rachmadya Eka Syarifah	Forward	06:18	0	0	1
14 Sep 2022 16:50 WIB	Kikan Putri Sabian	Forward	33:22	0	1	3
14 Sep 2022 16:50 WIB	Jasmine Az Zahra	Guard	09:11	0	0	0
14 Sep 2022 16:50 WIB	Tiara Putri Osmaliki	Center	04:26	0	0	0
14 Sep 2022 16:50 WIB	Olivia Chintya Permatasari	Guard	09:27	0	0	1
14 Sep 2022 16:50 WIB	Angel J. Theodora	Center	24:59	1	0	10
14 Sep 2022 16:50 WIB	Danisha Nayyara Shafiqa	Center	25:37	2	0	4
14 Sep 2022 16:50 WIB	Gabriela Angelyn Rodame Silitonga	Center	11:05	0	0	1
14 Sep 2022 16:50 WIB	Khalisha Salwa Dinata	Center	15:31	0	2	2
14 Sep 2022 16:50 WIB	Milahati Bintang S	Guard	30:59	1	1	5
14 Sep 2022 16:50 WIB	Radinka Adyasmasari Bening Mahasa	Center	24:41	2	0	4
14 Sep 2022 16:50 WIB	Anggi Medina Salsabila	Forward	27:00	4	0	3
14 Sep 2022 16:50 WIB	Raihanah Muthiah	Guard	06:28	0	0	1
14 Sep 2022 16:50 WIB	Evelyn Putri Sepang	Guard	18:57	5	1	1
14 Sep 2022 16:50 WIB	Aisyah Luna	Guard	06:02	0	0	2
14 Sep 2022 16:50 WIB	Latasya Divca Aquirell	Guard	-	0	0	0
14 Sep 2022 16:50 WIB	Firdania Salsabila Kirana	Forward	-	0	0	0
14 Sep 2022 18:30 WIB	Valentino Natanael	Guard	22:22	2	0	2
14 Sep 2022 18:30 WIB	Muhammad Myzan Zhydan	Center	22:16	6	0	5
14 Sep 2022 18:30 WIB	Rio Julian Ramadhani	Guard	25:20	4	3	2
14 Sep 2022 18:30 WIB	Rahmat Kurniawan	Center	17:11	0	0	4
14 Sep 2022 18:30 WIB	Muhammad Ardiaz Maulana S	Guard	19:44	4	1	4
14 Sep 2022 18:30 WIB	Abyakta Prabowo	Guard	13:02	1	0	0
14 Sep 2022 18:30 WIB	Zidan Akbar Diansyah	Forward	20:29	3	1	5
14 Sep 2022 18:30 WIB	I Made Dhiyo S.a	Center	08:16	2	0	3
14 Sep 2022 18:30 WIB	Satrio Wibisono	Forward	05:43	0	0	2
14 Sep 2022 18:30 WIB	Haidar Rafli	Forward	23:10	6	0	3
14 Sep 2022 18:30 WIB	Bagas Raditya	Forward	12:33	5	0	3
14 Sep 2022 18:30 WIB	Rafly Raditya Rachman	Forward	-	0	0	0
14 Sep 2022 18:30 WIB	Dhanis Handiyanto Tanudjaja	Guard	28:21	0	1	1
14 Sep 2022 18:30 WIB	Reyhan Hafidz Nur Cahya	Guard	09:52	4	0	0
14 Sep 2022 18:30 WIB	Danendra Ahnaf Athallah	Forward	31:26	2	1	10
14 Sep 2022 18:30 WIB	Fikri Wahyu	Center	24:10	8	0	6
14 Sep 2022 18:30 WIB	Muhammad Faiz Dzinnuha	Center	06:43	0	0	0
14 Sep 2022 18:30 WIB	Pryandika Mahendra	Forward	07:45	0	0	0
14 Sep 2022 18:30 WIB	Jibran Arrafi	Guard	17:11	5	2	5
14 Sep 2022 18:30 WIB	Zaidan Fadlurrohman Syafiq	Guard	07:10	0	0	0
14 Sep 2022 18:30 WIB	I Wayan Widhi Anggara	Forward	32:53	6	0	4
14 Sep 2022 18:30 WIB	Christofer Theodore	Guard	07:37	0	0	0
15 Sep 2022 13:30 WIB	Michiella Angelina	Center	27:50	2	1	6
15 Sep 2022 13:30 WIB	Jemima Dorothy Budiardjo	Forward	11:36	2	1	0
15 Sep 2022 13:30 WIB	Jocelyne Lizzie Purwanto	Forward	05:43	0	0	1
15 Sep 2022 13:30 WIB	Francesca Marcelina Clementine	Forward	06:31	0	0	0
15 Sep 2022 13:30 WIB	Chaleena Pramono	Center	-	0	0	0
15 Sep 2022 13:30 WIB	Nelvina Sally Utomo	Guard	40:00	12	1	7
15 Sep 2022 13:30 WIB	Victoria Benedicta Joe	Forward	40:00	5	1	4
15 Sep 2022 13:30 WIB	Maydeline Lisell Gunawan	Forward	10:12	4	0	6
15 Sep 2022 13:30 WIB	Kaylin Marvella	Guard	-	0	0	0
15 Sep 2022 13:30 WIB	Yobela	Forward	08:15	0	0	0
15 Sep 2022 13:30 WIB	Jocelyn Ellen Chia	Guard	12:31	0	1	2
15 Sep 2022 13:30 WIB	Putri Zahra Ap'fatsah	Forward	21:02	11	2	5
15 Sep 2022 13:30 WIB	Aileen Winanda Gunawan	Forward	23:34	4	1	3
15 Sep 2022 13:30 WIB	Revina Permatasari	Guard	22:15	8	0	4
15 Sep 2022 13:30 WIB	Syheren Lorencya Hadi Sanjaya	Guard	03:18	0	0	0
15 Sep 2022 13:30 WIB	Citra Aftria Damayanti	Center	32:44	5	2	11
15 Sep 2022 13:30 WIB	Catrine Annabel Tanuwijaya	Guard	22:31	5	2	2
15 Sep 2022 13:30 WIB	Nurul Nadia Aqilah Hasibuan	Forward	29:37	6	0	10
15 Sep 2022 13:30 WIB	Stella Gracia Sutanto	Center	06:34	0	0	0
15 Sep 2022 13:30 WIB	Stefanie Angelin	Forward	16:02	3	0	5
15 Sep 2022 13:30 WIB	Kathleen Nethania Marciano	Center	10:10	0	0	0
15 Sep 2022 13:30 WIB	Olga Aurora Linardi	Forward	11:18	3	1	2
15 Sep 2022 15:10 WIB	Ahmad Mutawakkil Kurnia	Guard	24:21	3	2	3
15 Sep 2022 15:10 WIB	Muhammad Andrean Rizq Prasetio	Guard	13:36	0	1	1
15 Sep 2022 15:10 WIB	Raffino Razzandi	Forward	26:55	10	0	6
15 Sep 2022 15:10 WIB	Syahrir Ramadhan	Guard	26:24	5	1	9
15 Sep 2022 15:10 WIB	Novanda Nathanael Silaban	Center	13:36	0	1	4
15 Sep 2022 15:10 WIB	Muhammad Iftikhaar Ramadhan	Forward	13:36	2	2	0
15 Sep 2022 15:10 WIB	Robintsany Javonda Ahmed	Forward	13:05	2	0	2
15 Sep 2022 15:10 WIB	Satrio Prayogo	Forward	09:58	2	1	0
15 Sep 2022 15:10 WIB	Effan Safaraz Adzikra	Guard	10:44	0	0	0
15 Sep 2022 15:10 WIB	Muhammad Hanif Karomi	Guard	17:25	0	1	3
15 Sep 2022 15:10 WIB	Arfel Faaza H	Guard	13:29	0	0	1
15 Sep 2022 15:10 WIB	Matthew Alonso Wibowo	Forward	-	0	0	0
15 Sep 2022 15:10 WIB	George Christiano	Guard	24:04	6	1	3
15 Sep 2022 15:10 WIB	Vito Camello Oscar Jatmiko	Guard	25:56	17	5	4
15 Sep 2022 15:10 WIB	Marco Clarence Purnomo	Guard	17:09	2	0	1
15 Sep 2022 15:10 WIB	Trevis Artagrantdy Kurniawan	Forward	13:16	0	0	4
15 Sep 2022 15:10 WIB	Alfredo Marcellino Kusuma	Guard	26:44	10	0	4
15 Sep 2022 15:10 WIB	Darren Grant Alexandre Wang	Forward	15:52	0	1	6
15 Sep 2022 15:10 WIB	Kevin De Brune	Forward	11:06	2	1	4
15 Sep 2022 15:10 WIB	Sebastian Reyhan Tanuwijaya	Guard	16:02	6	2	2
15 Sep 2022 15:10 WIB	Stanley Mulya Irawan	Guard	17:14	0	0	1
15 Sep 2022 15:10 WIB	Christopher Matthew Pranata	Guard	15:39	4	0	2
15 Sep 2022 16:50 WIB	Muhammad Wildan Ramadhan	Guard	31:50	2	1	0
15 Sep 2022 16:50 WIB	Muchammad Bagus Aqhila	Forward	15:06	0	0	1
15 Sep 2022 16:50 WIB	Rifqi Muzakki F.	Center	24:03	7	0	4
15 Sep 2022 16:50 WIB	Achmad Gandhi	Guard	10:13	0	0	0
15 Sep 2022 16:50 WIB	Raditya Naufal Fauzan	Forward	01:44	0	0	0
15 Sep 2022 16:50 WIB	Athallah Isnindra Lesmana	Guard	21:17	2	0	4
15 Sep 2022 16:50 WIB	Brave Earnest Anindya Rizky	Forward	11:50	0	0	2
15 Sep 2022 16:50 WIB	Muhammad Rafly Ardyan	Forward	27:01	4	0	5
15 Sep 2022 16:50 WIB	Ananda Miftahul Falah	Center	09:41	0	0	1
15 Sep 2022 16:50 WIB	Radja Althav Pramudya	Guard	15:27	0	0	1
15 Sep 2022 16:50 WIB	Muhammad Ar Rayyan	Center	31:48	0	0	3
15 Sep 2022 16:50 WIB	Radja Daniyal	Forward	28:45	13	3	3
15 Sep 2022 16:50 WIB	Ronaldo Hamdika	Forward	08:42	2	1	2
15 Sep 2022 16:50 WIB	Jason Ajisatrya Brian Putera	Guard	08:31	4	1	0
15 Sep 2022 16:50 WIB	Muhammad Haikhal	Guard	12:28	6	0	0
15 Sep 2022 16:50 WIB	Muhammad Zakky Dikmansyah	Center	28:54	7	1	5
15 Sep 2022 16:50 WIB	Davino Dafa Rafael	Guard	06:39	0	0	1
15 Sep 2022 16:50 WIB	Diaz Ardianto Rizky	Guard	19:32	9	3	4
15 Sep 2022 16:50 WIB	Satrio Bayu	Guard	-	0	0	0
15 Sep 2022 16:50 WIB	Muhammad Alfareyno Ramadhan	Guard	17:36	3	2	0
15 Sep 2022 16:50 WIB	Anggara Putra	Guard	19:29	7	4	2
15 Sep 2022 16:50 WIB	Elang Satria Rajendra Dewanto	Forward	28:53	7	3	8
15 Sep 2022 18:30 WIB	Fitri Arisunah	Guard	15:22	0	1	3
15 Sep 2022 18:30 WIB	Izzatu Lailatil Maghfiroh	Guard	24:51	6	1	3
15 Sep 2022 18:30 WIB	Carissa Nabilah Kanani	Guard	25:06	2	1	1
15 Sep 2022 18:30 WIB	Zumrotul Aisyah R	Center	10:26	6	0	5
15 Sep 2022 18:30 WIB	Poppy Ayu Pawitriningrum	Center	24:47	3	1	7
15 Sep 2022 18:30 WIB	Putri Maharani	Guard	08:31	0	0	3
15 Sep 2022 18:30 WIB	Nadirah Aynur Rohmah	Guard	17:56	7	0	4
15 Sep 2022 18:30 WIB	Rosa Anggelina	Guard	14:39	0	0	1
15 Sep 2022 18:30 WIB	Rushofah Shofiyyah Salim	Center	08:16	0	0	1
15 Sep 2022 18:30 WIB	Wahyu Kusuma Ningrum	Center	10:40	2	0	2
15 Sep 2022 18:30 WIB	Dina Karen Daniella Rahakbauw	Forward	12:14	0	1	1
15 Sep 2022 18:30 WIB	Zavira Jalasena Putri	Forward	10:26	0	0	0
15 Sep 2022 18:30 WIB	Devi Yulisya	Guard	31:51	0	1	2
15 Sep 2022 18:30 WIB	Rachmaniar Arindani Putri Filza	Guard	09:40	0	1	2
15 Sep 2022 18:30 WIB	Venny Zahra Syahfrilina	Guard	07:35	0	0	1
15 Sep 2022 18:30 WIB	Kayla Bazlyna	Guard	26:05	5	0	8
15 Sep 2022 18:30 WIB	Noor Fariha Rahmawaty	Forward	28:40	0	0	3
15 Sep 2022 18:30 WIB	Deva Natasya	Forward	26:03	0	1	8
15 Sep 2022 18:30 WIB	Frevy Aulia	Guard	08:06	0	0	0
15 Sep 2022 18:30 WIB	Amilatus Sholikhah	Forward	08:33	0	0	0
15 Sep 2022 18:30 WIB	Jingga Naura	Forward	07:07	0	0	1
15 Sep 2022 18:30 WIB	Yessa Rachma Nur Khalida Achmad	Forward	07:07	0	0	1
16 Sep 2022 14:00 WIB	Nurhalizah	Guard	08:09	6	0	0
16 Sep 2022 14:00 WIB	Desak Ayu Tiara Renata	Forward	14:12	2	0	0
16 Sep 2022 14:00 WIB	Chelsea Aurelia Ramadhani	Guard	28:02	2	0	2
16 Sep 2022 14:00 WIB	Maorin Alifia Azzahra	Forward	37:07	7	3	12
16 Sep 2022 14:00 WIB	Cindy Claudia Aruan	Guard	06:13	0	0	2
16 Sep 2022 14:00 WIB	Aliya Nabila	Forward	37:01	2	0	7
16 Sep 2022 14:00 WIB	Olivia Aura Rachma Trufani	Guard	-	0	0	0
16 Sep 2022 14:00 WIB	Aulia Nur Ramadani	Forward	24:00	3	1	4
16 Sep 2022 14:00 WIB	Kiara Clarissa Farandy	Forward	08:35	0	0	1
16 Sep 2022 14:00 WIB	Aqila Dewi Sayrindra	Guard	06:24	0	0	1
16 Sep 2022 14:00 WIB	Zahra Cantika Boneta	Forward	-	0	0	0
16 Sep 2022 14:00 WIB	Deff Qanca Arma Frecadanda	Guard	13:38	5	1	3
16 Sep 2022 14:00 WIB	Aqilla Tasya Tabina Gaeisani	Guard	15:18	3	0	4
16 Sep 2022 14:00 WIB	Alievia Kartika Putri	Guard	06:49	0	0	3
16 Sep 2022 14:00 WIB	Afifah Putri Shabrina	Forward	00:58	0	0	0
16 Sep 2022 14:00 WIB	Reva Safrina Hans Wibisono	Forward	23:44	0	0	5
16 Sep 2022 14:00 WIB	Endilia Rochmala Devi	Guard	34:51	6	0	1
16 Sep 2022 14:00 WIB	Anabel Parama Putri	Guard	22:08	0	1	2
16 Sep 2022 14:00 WIB	Ayunda Charlestya	Forward	17:57	0	0	2
16 Sep 2022 14:00 WIB	Eva Yulia Rossa	Guard	25:30	1	0	3
16 Sep 2022 14:00 WIB	Anggy Gunawan	Guard	12:33	2	0	4
16 Sep 2022 14:00 WIB	Rahma Tsania Ramadhani	Forward	06:31	0	0	0
16 Sep 2022 15:40 WIB	Ferdinan Dwi Armando Meirangga Agung Saputra	Forward	19:04	2	0	2
16 Sep 2022 15:40 WIB	Dany Firman Lazuardi	Guard	23:47	0	0	1
16 Sep 2022 15:40 WIB	M.riyan Firmansyah	Forward	11:12	0	0	1
16 Sep 2022 15:40 WIB	Mohammed Def Zinedine Fajrie	Forward	06:51	0	1	0
16 Sep 2022 15:40 WIB	Athalla Tirta Wisesa	Guard	10:00	4	0	0
16 Sep 2022 15:40 WIB	Jagad Lakon Sejati	Guard	32:13	16	0	3
16 Sep 2022 15:40 WIB	Stanly Vian Pratama	Guard	26:56	5	1	10
16 Sep 2022 15:40 WIB	Akmal Syauqi Ramadhan	Guard	18:32	2	0	5
16 Sep 2022 15:40 WIB	Jerino Dzaky Priambodo	Forward	11:27	2	0	2
16 Sep 2022 15:40 WIB	Aldi Darahtul Rohman	Forward	07:53	0	1	1
16 Sep 2022 15:40 WIB	Muhammad Rohman Azizi	Forward	07:07	0	0	1
16 Sep 2022 15:40 WIB	Ricky Joenathan	Center	28:48	0	0	6
16 Sep 2022 15:40 WIB	Alvin Abel Darmawan	Forward	10:00	0	0	0
16 Sep 2022 15:40 WIB	Michael Henry Laksmana	Guard	36:10	9	1	6
16 Sep 2022 15:40 WIB	Nelson Davio	Guard	21:28	4	0	3
16 Sep 2022 15:40 WIB	Mauritius Kenneth T	Forward	-	0	0	0
16 Sep 2022 15:40 WIB	Jordan Tanadi	Guard	23:52	0	0	2
16 Sep 2022 15:40 WIB	Andrew Garcia Christianto	Guard	-	0	0	0
16 Sep 2022 15:40 WIB	Matthew Jefferson Besouw	Forward	16:49	0	0	3
16 Sep 2022 15:40 WIB	Jovannes Friendly Kurniawan	Guard	32:14	16	1	3
16 Sep 2022 15:40 WIB	Daoshen Justin Felix Okawida	Guard	07:03	0	0	0
16 Sep 2022 15:40 WIB	Vincentius Seconda Adrian	Guard	17:20	4	0	3
16 Sep 2022 17:20 WIB	Paula Pramita Sikwandy	Guard	-	0	0	0
16 Sep 2022 17:20 WIB	Setio Giovanni	Guard	22:15	7	5	2
16 Sep 2022 17:20 WIB	Cheryl	Forward	20:59	5	2	2
16 Sep 2022 17:20 WIB	Michelle Angelina Abadi	Forward	18:07	10	2	6
16 Sep 2022 17:20 WIB	Mayviana Lysandra Tandiono	Guard	19:01	8	2	1
16 Sep 2022 17:20 WIB	Kayla Hananiah Fu	Guard	17:40	2	1	1
16 Sep 2022 17:20 WIB	Komang Mariani Puteri Sekar Sari	Forward	18:07	7	3	5
16 Sep 2022 17:20 WIB	Jane Lavinia Chiang	Guard	19:51	4	0	1
16 Sep 2022 17:20 WIB	Aiko Femie Belle Wijaya	Forward	19:01	6	0	0
16 Sep 2022 17:20 WIB	Putu Kezia Angelie Setiawan	Forward	20:59	12	3	3
16 Sep 2022 17:20 WIB	Nathania Nicole Sasongko	Center	-	0	0	0
16 Sep 2022 17:20 WIB	Janice Patricia Laeman	Guard	19:16	0	0	3
16 Sep 2022 17:20 WIB	Ailina Carin Huang	Guard	26:39	2	0	2
16 Sep 2022 17:20 WIB	Ellen Natalia	Forward	08:24	0	0	0
16 Sep 2022 17:20 WIB	Syleena Feodora	Forward	21:53	4	1	3
16 Sep 2022 17:20 WIB	Celine Chandra	Forward	33:55	0	1	2
16 Sep 2022 17:20 WIB	Ladysia Megane C	Forward	06:50	0	0	1
16 Sep 2022 17:20 WIB	Jolin Isabel Santoso	Forward	09:33	0	0	0
16 Sep 2022 17:20 WIB	Jeannice Laurensia Santoso	Guard	09:34	0	0	3
16 Sep 2022 17:20 WIB	Chelsea Chandra	Guard	28:24	3	0	7
16 Sep 2022 17:20 WIB	Amelia Zelda	Forward	13:38	0	0	1
16 Sep 2022 17:20 WIB	Janice Tantojo	Forward	18:48	0	0	2
16 Sep 2022 19:00 WIB	Cliff Louis	Forward	22:03	10	1	4
16 Sep 2022 19:00 WIB	Darren Tan	Guard	20:42	3	3	5
16 Sep 2022 19:00 WIB	Nicholas Demily	Guard	17:22	6	1	3
16 Sep 2022 19:00 WIB	Raffael Panji Amadeus	Forward	23:57	10	1	2
16 Sep 2022 19:00 WIB	Kenneth Chandradinata	Guard	13:19	2	0	1
16 Sep 2022 19:00 WIB	Jansen Cahyadi	Guard	11:20	0	0	2
16 Sep 2022 19:00 WIB	Daniel Nicholas Delin	Guard	16:59	10	2	4
16 Sep 2022 19:00 WIB	Justin Patrick Alex	Guard	10:19	6	0	6
16 Sep 2022 19:00 WIB	William Wongsoadi	Center	12:08	0	1	0
16 Sep 2022 19:00 WIB	Lourencio Dustin	Guard	12:59	5	0	0
16 Sep 2022 19:00 WIB	Alfonsus Bernd	Center	25:27	2	1	3
16 Sep 2022 19:00 WIB	Joeyson Salam	Guard	06:35	3	0	1
16 Sep 2022 19:00 WIB	Brian Robinson	Forward	18:38	2	0	4
16 Sep 2022 19:00 WIB	Elgine Theo Thamtoro	Guard	30:54	5	1	3
16 Sep 2022 19:00 WIB	Gerrie Brevitio	Forward	20:26	5	0	0
16 Sep 2022 19:00 WIB	Axel Braxton Sajogo	Forward	07:14	0	0	0
16 Sep 2022 19:00 WIB	Soedomo Henry Cahyono	Forward	07:09	0	1	0
16 Sep 2022 19:00 WIB	Lodewyk Jason	Guard	28:12	2	1	1
16 Sep 2022 19:00 WIB	Owen Guito	Center	22:15	0	1	5
16 Sep 2022 19:00 WIB	Jeremiah Jason Chen	Forward	16:07	0	0	1
16 Sep 2022 19:00 WIB	Ingvar Rusli	Guard	21:18	5	1	2
16 Sep 2022 19:00 WIB	Shawn Michael Koeswandi	Guard	10:02	3	0	1
17 Sep 2022 13:30 WIB	Aukha Dwi Istiqhomah	Guard	21:34	2	0	1
17 Sep 2022 13:30 WIB	Annisa Rahmadania Muchlis	Center	07:20	0	0	1
17 Sep 2022 13:30 WIB	Raras Puspa Sary	Center	07:02	0	0	0
17 Sep 2022 13:30 WIB	Zaskya Rafana	Forward	06:34	0	0	1
17 Sep 2022 13:30 WIB	Zalsa Kirana Putri	Forward	33:35	5	2	5
17 Sep 2022 13:30 WIB	25. Rachmadya Eka Syarifah	Forward	06:24	0	0	0
17 Sep 2022 13:30 WIB	Kikan Putri Sabian	Forward	22:37	0	1	0
17 Sep 2022 13:30 WIB	Jasmine Az Zahra	Guard	12:41	2	1	2
17 Sep 2022 13:30 WIB	Tiara Putri Osmaliki	Center	07:31	0	0	1
17 Sep 2022 13:30 WIB	Olivia Chintya Permatasari	Guard	18:18	4	0	2
17 Sep 2022 13:30 WIB	Angel J. Theodora	Center	31:43	4	0	13
17 Sep 2022 13:30 WIB	Lynn Louise	Center	40:00	15	1	11
17 Sep 2022 13:30 WIB	Wineke	Forward	22:35	7	2	1
17 Sep 2022 13:30 WIB	Stefani Helen	Forward	26:00	4	0	4
17 Sep 2022 13:30 WIB	Ganeviene Brightly Huang	Guard	28:59	7	3	4
17 Sep 2022 13:30 WIB	Charisma Dewi Sephira Harianto	Center	06:20	0	0	1
17 Sep 2022 13:30 WIB	Micheline Chiesa Wijanto	Forward	-	0	0	0
17 Sep 2022 13:30 WIB	Sonia Darmawan	Center	07:10	0	0	2
17 Sep 2022 13:30 WIB	Gwyneth Marjorie Koo	Forward	19:07	4	0	4
17 Sep 2022 13:30 WIB	Allyson Liem	Guard	07:25	0	0	0
17 Sep 2022 13:30 WIB	Anastasia Nadia Lisian	Guard	08:58	2	0	0
17 Sep 2022 13:30 WIB	Adeline Arella Louisa Wiranto	Guard	33:26	0	0	2
17 Sep 2022 15:10 WIB	Bradley Nathaniel Wijaya	Guard	38:24	20	2	2
17 Sep 2022 15:10 WIB	Michael Ken Tansa	Guard	09:11	2	0	0
17 Sep 2022 15:10 WIB	Edward Hugo	Center	13:58	0	0	1
17 Sep 2022 15:10 WIB	Jordan Winarta	Guard	06:51	0	1	1
17 Sep 2022 15:10 WIB	Glenn Geraldo	Forward	12:51	0	0	4
17 Sep 2022 15:10 WIB	Theodore Furui Widyatmoko	Center	10:05	0	1	3
17 Sep 2022 15:10 WIB	Jason William	Forward	12:15	2	0	3
17 Sep 2022 15:10 WIB	Luke Taylor	Center	20:12	7	1	16
17 Sep 2022 15:10 WIB	Jin Hyeok Kang	Forward	08:39	2	0	1
17 Sep 2022 15:10 WIB	Tom Aristo	Forward	07:51	0	0	1
17 Sep 2022 15:10 WIB	Rionel Laurence Effendi	Guard	24:37	4	1	3
17 Sep 2022 15:10 WIB	Valentino Natanael	Guard	21:09	6	1	2
17 Sep 2022 15:10 WIB	Muhammad Myzan Zhydan	Center	22:13	6	1	4
17 Sep 2022 15:10 WIB	Rio Julian Ramadhani	Guard	33:48	8	5	2
17 Sep 2022 15:10 WIB	Rahmat Kurniawan	Center	16:36	5	0	4
17 Sep 2022 15:10 WIB	Muhammad Ardiaz Maulana S	Guard	29:22	2	0	3
17 Sep 2022 15:10 WIB	Abyakta Prabowo	Guard	09:53	0	1	2
17 Sep 2022 15:10 WIB	Zidan Akbar Diansyah	Forward	16:06	3	1	1
17 Sep 2022 15:10 WIB	I Made Dhiyo S.a	Center	06:12	2	0	1
17 Sep 2022 15:10 WIB	Satrio Wibisono	Forward	08:02	0	0	2
17 Sep 2022 15:10 WIB	Haidar Rafli	Forward	23:40	18	2	9
17 Sep 2022 15:10 WIB	Bagas Raditya	Forward	06:24	0	0	0
17 Sep 2022 16:50 WIB	Fitri Arisunah	Guard	26:52	11	1	4
17 Sep 2022 16:50 WIB	Izzatu Lailatil Maghfiroh	Guard	23:59	4	0	2
17 Sep 2022 16:50 WIB	Carissa Nabilah Kanani	Guard	25:27	0	0	2
17 Sep 2022 16:50 WIB	Zumrotul Aisyah R	Center	09:27	0	1	2
17 Sep 2022 16:50 WIB	Poppy Ayu Pawitriningrum	Center	30:56	2	1	8
17 Sep 2022 16:50 WIB	Putri Maharani	Guard	06:48	0	0	1
17 Sep 2022 16:50 WIB	Nadirah Aynur Rohmah	Guard	16:50	6	0	0
17 Sep 2022 16:50 WIB	Rosa Anggelina	Guard	06:38	0	0	0
17 Sep 2022 16:50 WIB	Rushofah Shofiyyah Salim	Center	06:14	0	0	0
17 Sep 2022 16:50 WIB	Wahyu Kusuma Ningrum	Center	09:04	0	0	2
17 Sep 2022 16:50 WIB	Dina Karen Daniella Rahakbauw	Forward	06:49	0	0	0
17 Sep 2022 16:50 WIB	Putri Zahra Ap'fatsah	Forward	21:19	5	1	1
17 Sep 2022 16:50 WIB	Aileen Winanda Gunawan	Forward	23:07	5	2	3
17 Sep 2022 16:50 WIB	Revina Permatasari	Guard	22:44	20	1	1
17 Sep 2022 16:50 WIB	Syheren Lorencya Hadi Sanjaya	Guard	07:35	0	0	0
17 Sep 2022 16:50 WIB	Citra Aftria Damayanti	Center	24:31	2	0	3
17 Sep 2022 16:50 WIB	Catrine Annabel Tanuwijaya	Guard	24:44	7	1	1
17 Sep 2022 16:50 WIB	Nurul Nadia Aqilah Hasibuan	Forward	30:37	2	2	8
17 Sep 2022 16:50 WIB	Stella Gracia Sutanto	Center	09:23	0	0	4
17 Sep 2022 16:50 WIB	Stefanie Angelin	Forward	07:49	3	0	1
17 Sep 2022 16:50 WIB	Kathleen Nethania Marciano	Center	10:43	2	1	1
17 Sep 2022 16:50 WIB	Olga Aurora Linardi	Forward	10:45	0	2	1
17 Sep 2022 18:30 WIB	Matthew Alonso Wibowo	Forward	06:25	0	0	0
17 Sep 2022 18:30 WIB	George Christiano	Guard	40:00	4	4	8
17 Sep 2022 18:30 WIB	Vito Camello Oscar Jatmiko	Guard	36:49	7	2	7
17 Sep 2022 18:30 WIB	Marco Clarence Purnomo	Guard	12:54	0	1	1
17 Sep 2022 18:30 WIB	Trevis Artagrantdy Kurniawan	Forward	06:51	0	0	0
17 Sep 2022 18:30 WIB	Alfredo Marcellino Kusuma	Guard	19:06	3	2	1
17 Sep 2022 18:30 WIB	Darren Grant Alexandre Wang	Forward	05:04	0	0	0
17 Sep 2022 18:30 WIB	Kevin De Brune	Forward	33:15	13	1	1
17 Sep 2022 18:30 WIB	Sebastian Reyhan Tanuwijaya	Guard	19:38	0	0	1
17 Sep 2022 18:30 WIB	Stanley Mulya Irawan	Guard	03:11	0	0	1
17 Sep 2022 18:30 WIB	Christopher Matthew Pranata	Guard	06:38	0	0	0
17 Sep 2022 18:30 WIB	Radja Daniyal	Forward	23:07	7	1	4
17 Sep 2022 18:30 WIB	Ronaldo Hamdika	Forward	07:35	0	0	2
17 Sep 2022 18:30 WIB	Jason Ajisatrya Brian Putera	Guard	22:44	3	0	1
17 Sep 2022 18:30 WIB	Muhammad Haikhal	Guard	06:43	1	0	0
17 Sep 2022 18:30 WIB	Muhammad Zakky Dikmansyah	Center	10:43	16	2	9
17 Sep 2022 18:30 WIB	Davino Dafa Rafael	Guard	24:44	2	2	1
17 Sep 2022 18:30 WIB	Diaz Ardianto Rizky	Guard	21:19	3	0	0
17 Sep 2022 18:30 WIB	Satrio Bayu	Guard	09:23	0	0	0
17 Sep 2022 18:30 WIB	Muhammad Alfareyno Ramadhan	Guard	30:37	2	1	1
17 Sep 2022 18:30 WIB	Anggara Putra	Guard	07:49	7	6	8
17 Sep 2022 18:30 WIB	Elang Satria Rajendra Dewanto	Forward	24:31	9	1	5
18 Sep 2022 11:00 WIB	Paula Pramita Sikwandy	Guard	-	0	0	0
18 Sep 2022 11:00 WIB	Setio Giovanni	Guard	23:26	6	9	9
18 Sep 2022 11:00 WIB	Cheryl	Forward	17:26	13	1	2
18 Sep 2022 11:00 WIB	Michelle Angelina Abadi	Forward	20:20	11	2	8
18 Sep 2022 11:00 WIB	Mayviana Lysandra Tandiono	Guard	22:34	6	4	4
18 Sep 2022 11:00 WIB	Kayla Hananiah Fu	Guard	18:48	5	1	3
18 Sep 2022 11:00 WIB	Komang Mariani Puteri Sekar Sari	Forward	16:34	13	3	4
18 Sep 2022 11:00 WIB	Jane Lavinia Chiang	Guard	23:26	2	1	3
18 Sep 2022 11:00 WIB	Aiko Femie Belle Wijaya	Forward	22:34	2	3	0
18 Sep 2022 11:00 WIB	Putu Kezia Angelie Setiawan	Forward	17:26	17	1	3
18 Sep 2022 11:00 WIB	Nathania Nicole Sasongko	Center	-	0	0	0
18 Sep 2022 11:00 WIB	Nurhalizah	Guard	12:34	2	0	0
18 Sep 2022 11:00 WIB	Desak Ayu Tiara Renata	Forward	10:25	0	0	0
18 Sep 2022 11:00 WIB	Chelsea Aurelia Ramadhani	Guard	20:12	3	2	2
18 Sep 2022 11:00 WIB	Maorin Alifia Azzahra	Forward	33:55	2	1	2
18 Sep 2022 11:00 WIB	Cindy Claudia Aruan	Guard	11:13	3	1	1
18 Sep 2022 11:00 WIB	Aliya Nabila	Forward	31:20	2	2	7
18 Sep 2022 11:00 WIB	Olivia Aura Rachma Trufani	Guard	03:15	0	1	1
18 Sep 2022 11:00 WIB	Aulia Nur Ramadani	Forward	33:06	16	0	4
18 Sep 2022 11:00 WIB	Kiara Clarissa Farandy	Forward	17:23	2	0	5
18 Sep 2022 11:00 WIB	Aqila Dewi Sayrindra	Guard	06:41	0	0	1
18 Sep 2022 11:00 WIB	Zahra Cantika Boneta	Forward	04:36	0	0	0
18 Sep 2022 13:30 WIB	Lynn Louise	Center	38:12	6	1	19
18 Sep 2022 13:30 WIB	Wineke	Forward	33:34	2	1	8
18 Sep 2022 13:30 WIB	Stefani Helen	Forward	15:33	0	0	3
18 Sep 2022 13:30 WIB	Ganeviene Brightly Huang	Guard	37:54	12	2	7
18 Sep 2022 13:30 WIB	Charisma Dewi Sephira Harianto	Center	-	0	0	0
18 Sep 2022 13:30 WIB	Micheline Chiesa Wijanto	Forward	-	0	0	0
18 Sep 2022 13:30 WIB	Sonia Darmawan	Center	06:15	0	0	1
18 Sep 2022 13:30 WIB	Gwyneth Marjorie Koo	Forward	21:15	11	1	9
18 Sep 2022 13:30 WIB	Allyson Liem	Guard	06:53	2	1	3
18 Sep 2022 13:30 WIB	Anastasia Nadia Lisian	Guard	08:04	2	0	2
18 Sep 2022 13:30 WIB	Adeline Arella Louisa Wiranto	Guard	30:16	6	0	4
18 Sep 2022 13:30 WIB	Putri Zahra Ap'fatsah	Forward	24:29	11	0	3
18 Sep 2022 13:30 WIB	Aileen Winanda Gunawan	Forward	19:34	2	0	1
18 Sep 2022 13:30 WIB	Revina Permatasari	Guard	19:12	6	0	4
18 Sep 2022 13:30 WIB	Syheren Lorencya Hadi Sanjaya	Guard	06:22	0	0	1
18 Sep 2022 13:30 WIB	Citra Aftria Damayanti	Center	29:13	0	0	10
18 Sep 2022 13:30 WIB	Catrine Annabel Tanuwijaya	Guard	27:41	9	3	6
18 Sep 2022 13:30 WIB	Nurul Nadia Aqilah Hasibuan	Forward	28:07	0	0	3
18 Sep 2022 13:30 WIB	Stella Gracia Sutanto	Center	06:08	0	0	0
18 Sep 2022 13:30 WIB	Stefanie Angelin	Forward	18:35	2	0	2
18 Sep 2022 13:30 WIB	Kathleen Nethania Marciano	Center	06:33	3	0	1
18 Sep 2022 13:30 WIB	Olga Aurora Linardi	Forward	11:53	3	0	2
18 Sep 2022 16:00 WIB	Cliff Louis	Forward	26:59	12	0	4
18 Sep 2022 16:00 WIB	Darren Tan	Guard	21:10	11	2	4
18 Sep 2022 16:00 WIB	Nicholas Demily	Guard	16:37	0	1	0
18 Sep 2022 16:00 WIB	Raffael Panji Amadeus	Forward	22:02	2	2	4
18 Sep 2022 16:00 WIB	Kenneth Chandradinata	Guard	11:56	0	0	1
18 Sep 2022 16:00 WIB	Jansen Cahyadi	Guard	16:27	4	1	3
18 Sep 2022 16:00 WIB	Daniel Nicholas Delin	Guard	26:17	13	2	6
18 Sep 2022 16:00 WIB	Justin Patrick Alex	Guard	19:49	6	2	5
18 Sep 2022 16:00 WIB	William Wongsoadi	Center	09:55	0	0	1
18 Sep 2022 16:00 WIB	Lourencio Dustin	Guard	12:18	2	0	5
18 Sep 2022 16:00 WIB	Alfonsus Bernd	Center	16:30	6	0	3
18 Sep 2022 16:00 WIB	Ricky Joenathan	Center	23:32	5	0	3
18 Sep 2022 16:00 WIB	Alvin Abel Darmawan	Forward	08:03	0	0	0
18 Sep 2022 16:00 WIB	Michael Henry Laksmana	Guard	26:46	4	2	5
18 Sep 2022 16:00 WIB	Nelson Davio	Guard	27:48	4	1	5
18 Sep 2022 16:00 WIB	Mauritius Kenneth T	Forward	37:03	8	0	4
18 Sep 2022 16:00 WIB	Jordan Tanadi	Guard	07:37	0	0	2
18 Sep 2022 16:00 WIB	Andrew Garcia Christianto	Guard	-	0	0	0
18 Sep 2022 16:00 WIB	Matthew Jefferson Besouw	Forward	08:25	0	0	3
18 Sep 2022 16:00 WIB	Jovannes Friendly Kurniawan	Guard	25:22	2	0	2
18 Sep 2022 16:00 WIB	Daoshen Justin Felix Okawida	Guard	09:56	0	0	0
18 Sep 2022 16:00 WIB	Vincentius Seconda Adrian	Guard	25:28	0	1	3
18 Sep 2022 18:00 WIB	Valentino Natanael	Guard	23:13	8	0	3
18 Sep 2022 18:00 WIB	Muhammad Myzan Zhydan	Center	12:36	4	0	1
18 Sep 2022 18:00 WIB	Rio Julian Ramadhani	Guard	30:45	10	3	5
18 Sep 2022 18:00 WIB	Rahmat Kurniawan	Center	17:38	3	0	6
18 Sep 2022 18:00 WIB	Muhammad Ardiaz Maulana S	Guard	27:11	6	1	11
18 Sep 2022 18:00 WIB	Abyakta Prabowo	Guard	08:35	1	0	1
18 Sep 2022 18:00 WIB	Zidan Akbar Diansyah	Forward	21:15	0	1	3
18 Sep 2022 18:00 WIB	I Made Dhiyo S.a	Center	14:30	2	0	0
18 Sep 2022 18:00 WIB	Satrio Wibisono	Forward	07:06	0	0	0
18 Sep 2022 18:00 WIB	Haidar Rafli	Forward	22:59	8	0	6
18 Sep 2022 18:00 WIB	Bagas Raditya	Forward	06:10	0	0	0
18 Sep 2022 18:00 WIB	Radja Daniyal	Forward	19:17	6	1	2
18 Sep 2022 18:00 WIB	Ronaldo Hamdika	Forward	13:09	2	0	2
18 Sep 2022 18:00 WIB	Jason Ajisatrya Brian Putera	Guard	13:30	8	0	3
18 Sep 2022 18:00 WIB	Muhammad Haikhal	Guard	06:24	0	0	1
18 Sep 2022 18:00 WIB	Muhammad Zakky Dikmansyah	Center	30:41	15	1	12
18 Sep 2022 18:00 WIB	Davino Dafa Rafael	Guard	08:14	4	0	1
18 Sep 2022 18:00 WIB	Diaz Ardianto Rizky	Guard	12:56	0	0	1
18 Sep 2022 18:00 WIB	Satrio Bayu	Guard	17:42	7	0	3
18 Sep 2022 18:00 WIB	Muhammad Alfareyno Ramadhan	Guard	08:30	0	1	0
18 Sep 2022 18:00 WIB	Anggara Putra	Guard	26:25	11	5	8
18 Sep 2022 18:00 WIB	Elang Satria Rajendra Dewanto	Forward	24:39	18	3	18
20 Sep 2022 14:00 WIB	Paula Pramita Sikwandy	Guard	-	0	0	0
20 Sep 2022 14:00 WIB	Setio Giovanni	Guard	24:14	8	8	2
20 Sep 2022 14:00 WIB	Cheryl	Forward	16:45	4	0	6
20 Sep 2022 14:00 WIB	Michelle Angelina Abadi	Forward	19:07	7	2	1
20 Sep 2022 14:00 WIB	Mayviana Lysandra Tandiono	Guard	17:01	4	5	5
20 Sep 2022 14:00 WIB	Kayla Hananiah Fu	Guard	13:07	8	1	1
20 Sep 2022 14:00 WIB	Komang Mariani Puteri Sekar Sari	Forward	17:16	2	3	2
20 Sep 2022 14:00 WIB	Jane Lavinia Chiang	Guard	17:16	1	1	3
20 Sep 2022 14:00 WIB	Aiko Femie Belle Wijaya	Forward	13:31	7	0	0
20 Sep 2022 14:00 WIB	Putu Kezia Angelie Setiawan	Forward	22:30	9	1	3
20 Sep 2022 14:00 WIB	Nathania Nicole Sasongko	Center	14:48	17	0	9
20 Sep 2022 14:00 WIB	Lynn Louise	Center	16:49	4	0	3
20 Sep 2022 14:00 WIB	Wineke	Forward	27:21	6	2	4
20 Sep 2022 14:00 WIB	Stefani Helen	Forward	23:04	1	0	4
20 Sep 2022 14:00 WIB	Ganeviene Brightly Huang	Guard	28:13	6	1	2
20 Sep 2022 14:00 WIB	Charisma Dewi Sephira Harianto	Center	02:35	0	0	1
20 Sep 2022 14:00 WIB	Micheline Chiesa Wijanto	Forward	-	0	0	0
20 Sep 2022 14:00 WIB	Sonia Darmawan	Center	12:09	0	0	5
20 Sep 2022 14:00 WIB	Gwyneth Marjorie Koo	Forward	37:43	15	3	7
20 Sep 2022 14:00 WIB	Allyson Liem	Guard	16:30	1	0	3
20 Sep 2022 14:00 WIB	Anastasia Nadia Lisian	Guard	13:19	2	0	3
20 Sep 2022 14:00 WIB	Adeline Arella Louisa Wiranto	Guard	21:29	0	0	2
20 Sep 2022 17:00 WIB	Cliff Louis	Forward	17:03	10	1	4
20 Sep 2022 17:00 WIB	Darren Tan	Guard	24:44	4	3	10
20 Sep 2022 17:00 WIB	Nicholas Demily	Guard	06:18	0	0	2
20 Sep 2022 17:00 WIB	Raffael Panji Amadeus	Forward	19:36	3	0	2
20 Sep 2022 17:00 WIB	Kenneth Chandradinata	Guard	06:15	0	0	1
20 Sep 2022 17:00 WIB	Jansen Cahyadi	Guard	06:11	0	0	1
20 Sep 2022 17:00 WIB	Daniel Nicholas Delin	Guard	30:17	13	3	10
20 Sep 2022 17:00 WIB	Justin Patrick Alex	Guard	31:20	14	2	4
20 Sep 2022 17:00 WIB	William Wongsoadi	Center	06:34	1	0	1
20 Sep 2022 17:00 WIB	Lourencio Dustin	Guard	06:09	0	1	0
20 Sep 2022 17:00 WIB	Alfonsus Bernd	Center	07:25	0	0	2
20 Sep 2022 17:00 WIB	Radja Daniyal	Forward	19:22	2	0	3
20 Sep 2022 17:00 WIB	Ronaldo Hamdika	Forward	07:14	3	1	0
20 Sep 2022 17:00 WIB	Jason Ajisatrya Brian Putera	Guard	06:45	0	0	1
20 Sep 2022 17:00 WIB	Muhammad Haikhal	Guard	06:11	0	0	0
20 Sep 2022 17:00 WIB	Muhammad Zakky Dikmansyah	Center	33:11	4	1	7
20 Sep 2022 17:00 WIB	Davino Dafa Rafael	Guard	06:58	2	0	1
20 Sep 2022 17:00 WIB	Diaz Ardianto Rizky	Guard	06:59	2	1	0
20 Sep 2022 17:00 WIB	Satrio Bayu	Guard	12:24	2	1	1
20 Sep 2022 17:00 WIB	Muhammad Alfareyno Ramadhan	Guard	06:31	2	0	1
20 Sep 2022 17:00 WIB	Anggara Putra	Guard	35:55	9	2	4
20 Sep 2022 17:00 WIB	Elang Satria Rajendra Dewanto	Forward	37:31	6	3	9
\.


--
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school (name, address_street, address_subdistrict, address_city) FROM stdin;
SMA NATION STAR ACADEMY SURABAYA	Jl. Dharmahusada Indah Barat Vi / I	Gubeng	Kota Surabaya
SMA GLORIA 1 SURABAYA	Jl. Raya Sukomanunggal Jaya 25a	Sukomanunggal	Kota Surabaya
SMA ST LOUIS 1 SURABAYA	Jl. Polisi Istimewa No.7	Tegal Sari	Kota Surabaya
SMA CITA HATI WEST SURABAYA	Jl. Bukit Golf L2 / 1, Citraland	Lakarsantri	Kota Surabaya
SMAN 3 SIDOARJO	Jl. Dr. Wahidin No. 130	Sidoarjo	Kab. Sidoarjo
SMA PETRA 5 SURABAYA	Jl. Jemur Andayani Xvii / 2	Wonocolo	Kota Surabaya
SMA CIPUTRA SURABAYA	Jl. Puri Widya Kencana Citraland	Lakarsantri	Kota Surabaya
SMAN 10 SURABAYA	Jl. Jemur Sari I / 28	Wonocolo	Kota Surabaya
SMAN 16 SURABAYA	Jl. Prapen	Tenggilis Mejoyo	Kota Surabaya
SMAN 4 SURABAYA	Jl. Mayjen Prof. Dr. Moestopo No. 04	Tambaksari	Kota Surabaya
SMA MUHAMMADIYAH 2 SIDOARJO	Jl. Mojopahit No. 666 B	Sidoarjo	Kab. Sidoarjo
SMA CITA HATI EAST SURABAYA	Jl. Bukit Golf L2 / 1, Citraland	Mulyorejo	Kota Surabaya
SMA SANTO HENDRIKUS SURABAYA	Jl. Arief Rahman Hakim 40-44	Sukolilo	Kota Surabaya
SMA ITP SURABAYA	Jl. Dukuh Menanggal Xii / 4	-	Kota Surabaya
SMAN 20 SURABAYA	Jl. Medokan Semampir	Sukolilo	Kota Surabaya
SMA GLORIA 2 SURABAYA	Jl. Kalisari Selatan 1 No. 3 Pakuwon City Surabaya	Mulyorejo	Kota Surabaya
SMAN 1 PURI MOJOKERTO	Jl. Jayanegara No.2	Puri	Kab. Mojokerto
SMAN 3 SURABAYA	Jl. Memet Sastrowiryo Komplek Tni Al, Kenjeran	Bulak	Kota Surabaya
SMA FRATERAN SURABAYA	Jl. Kepanjen No. 8	Krembangan	Kota Surabaya
SMAN 15 SURABAYA	Jl. Menanggal Selatan No. 103	Gayungan	Kota Surabaya
SMA VITA SURABAYA	Jl. Arif Rahman Hakim 189-191	Sukolilo	Kota Surabaya
SMAN 9 SURABAYA	Jl. Wijaya Kusuma 48	Genteng	Kota Surabaya
SMAN 1 WARU	Jl. Brantas Barito Wistrop	Waru	Kab. Sidoarjo
SMA IPH EAST SURABAYA	Jl Raya Kedung Baruk 114, Surabaya, Indonesia 60296	-	Kota Surabaya
SMA PETRA 1 SURABAYA	Jl. Lingkar Dalam Barat Perum Graha Famili Surabaya	Dukuh Pakis	Kota Surabaya
SMA PETRA 2 SURABAYA	Jl. Manyar Tirtoasri Raya 1 - 3	Mulyorejo	Kota Surabaya
SMAN 2 MOJOKERTO	Jl. Raya Ijen No. 09	Magersari	Kota Mojokerto
SMAN 5 SURABAYA	Jl. Kusuma Bangsa 21	Genteng	Kota Surabaya
SMA MUHAMMADIYAH 10 GKB GRESIK	Jl. Raya Mutiara No 95 Pps	-	Kab. Gresik
SMAN 1 SURABAYA	Jl. Wijayakusuma 48	Genteng	Kota Surabaya
SMAN 22 SURABAYA	Jl. Balas Klumprik Wiyung	Wiyung	Kota Surabaya
SMAN 1 GRESIK	Jl. Arif Rahman Hakim No. 1 Gresik	Gresik	Kab. Gresik
SMAN 2 SURABAYA	Jl. Wijayakusuma 48	Genteng	Kota Surabaya
SMAN 1 MOJOKERTO	Jl. Irian Jaya No. 1	Prajurit Kulon	Kota Mojokerto
SMAN 19 SURABAYA	Jl. Kedung Cowek No. 390	Kenjeran	Kota Surabaya
SMAN 2 SIDOARJO	Jl. Lingkar Barat Gading Fajar 2	Sidoarjo	Kab. Sidoarjo
\.


--
-- Data for Name: team_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_stats (date_time, name, score, field_goal, field_goal_pct, two_pts, two_pts_pct, three_pts, three_pts_pct, free_throw, free_throw_pct, rebound_od, assist, steal, block, turnover, foul, pts_off_turnover) FROM stdin;
10 Sep 2022 11:00 WIB	SMA NATION STAR ACADEMY SURABAYA	32	10/43	23.3	8/28	28.6	2/15	13.3	10/24	41.7	10/16	4	6	1	18	13	12
10 Sep 2022 11:00 WIB	SMA GLORIA 1 SURABAYA	67	27/58	46.6	24/40	60	3/18	16.7	10/13	76.9	14/23	12	14	0	16	20	29
10 Sep 2022 12:40 WIB	SMA ST LOUIS 1 SURABAYA	75	36/80	45	34/61	55.7	2/19	10.5	1/6	16.7	23/15	19	38	5	14	15	63
10 Sep 2022 12:40 WIB	SMA CITA HATI WEST SURABAYA	19	7/27	25.9	7/22	31.8	0/5	0	5/9	55.6	6/19	3	5	1	46	4	4
10 Sep 2022 14:20 WIB	SMAN 3 SIDOARJO	30	12/42	28.6	10/36	27.8	2/6	33.3	4/18	22.2	11/28	9	11	3	24	9	13
10 Sep 2022 14:20 WIB	SMA PETRA 5 SURABAYA	23	11/50	22	11/45	24.4	0/5	0	1/6	16.7	8/22	2	12	5	20	17	12
10 Sep 2022 16:00 WIB	SMA CIPUTRA SURABAYA	58	26/62	41.9	24/51	47.1	2/11	18.2	4/12	33.3	18/35	18	19	6	23	12	24
10 Sep 2022 16:00 WIB	SMAN 10 SURABAYA	25	9/59	15.3	4/35	11.4	5/24	20.8	2/12	16.7	14/16	1	13	0	23	10	9
10 Sep 2022 17:40 WIB	SMAN 16 SURABAYA	90	42/77	54.5	40/69	58	2/8	25	4/15	26.7	28/17	19	25	2	5	18	54
10 Sep 2022 17:40 WIB	SMAN 4 SURABAYA	8	1/21	4.8	1/16	6.3	0/5	0	6/15	40	6/10	0	4	1	37	13	0
10 Sep 2022 19:20 WIB	SMA MUHAMMADIYAH 2 SIDOARJO	34	13/39	33.3	11/31	35.5	2/8	25	6/17	35.3	6/22	5	16	3	27	9	22
10 Sep 2022 19:20 WIB	SMA CITA HATI EAST SURABAYA	62	27/69	39.1	23/55	41.8	4/14	28.6	4/12	33.3	20/21	16	22	1	22	13	31
11 Sep 2022 10:30 WIB	SMA SANTO HENDRIKUS SURABAYA	65	23/57	40.4	20/42	47.6	3/15	20	16/29	55.2	18/25	9	13	5	19	28	20
11 Sep 2022 10:30 WIB	SMA ITP SURABAYA	27	7/43	16.3	7/37	18.9	0/6	0	13/34	38.2	15/15	4	6	0	21	21	7
11 Sep 2022 12:10 WIB	SMAN 20 SURABAYA	46	22/61	36.1	21/54	38.9	1/7	14.3	1/4	25	25/8	11	23	3	17	17	28
11 Sep 2022 12:10 WIB	SMA GLORIA 2 SURABAYA	13	4/16	25	4/10	40	0/6	0	5/10	50	3/12	1	11	0	27	3	4
11 Sep 2022 13:50 WIB	SMAN 1 PURI MOJOKERTO	60	27/58	46.6	27/55	49.1	0/3	0	6/15	40	15/18	17	31	3	24	29	37
11 Sep 2022 13:50 WIB	SMAN 3 SURABAYA	34	9/41	22	9/39	23.1	0/2	0	16/33	48.5	15/18	5	14	2	35	12	12
11 Sep 2022 15:30 WIB	SMA FRATERAN SURABAYA	38	17/53	32.1	16/41	39	1/12	8.3	3/7	42.9	14/21	4	7	2	13	13	16
11 Sep 2022 15:30 WIB	SMAN 15 SURABAYA	20	8/37	21.6	6/18	33.3	2/19	10.5	2/13	15.4	8/21	2	4	0	14	8	8
11 Sep 2022 17:10 WIB	SMA VITA SURABAYA	8	3/21	14.3	3/12	25	0/9	0	3/19	15.8	5/15	0	2	3	50	1	1
11 Sep 2022 17:10 WIB	SMAN 9 SURABAYA	68	33/71	46.5	32/70	45.7	1/1	100	1/1	100	23/16	22	36	1	14	15	46
11 Sep 2022 18:50 WIB	SMAN 1 WARU	47	17/38	44.7	15/28	53.6	2/10	20	11/22	50	8/18	11	12	1	25	19	16
11 Sep 2022 18:50 WIB	SMA IPH EAST SURABAYA	34	10/49	20.4	7/30	23.3	3/19	15.8	11/28	39.3	24/15	3	14	1	22	19	18
12 Sep 2022 10:30 WIB	SMA PETRA 1 SURABAYA	53	21/53	39.6	18/39	46.2	3/14	21.4	8/14	57.1	13/22	16	29	6	28	10	26
12 Sep 2022 10:30 WIB	SMA PETRA 2 SURABAYA	26	10/42	23.8	10/33	30.3	0/9	0	6/14	42.9	9/23	8	15	1	37	12	14
12 Sep 2022 12:10 WIB	SMA GLORIA 1 SURABAYA	81	35/70	50	31/53	58.5	4/17	23.5	7/14	50	14/8	25	32	0	6	12	64
12 Sep 2022 12:10 WIB	SMAN 2 MOJOKERTO	12	5/16	31.3	5/13	38.5	0/3	0	2/10	20	6/16	1	4	1	43	9	0
12 Sep 2022 13:50 WIB	SMA GLORIA 2 SURABAYA	25	10/41	24.4	9/37	24.3	1/4	25	7/24	29.2	10/29	10	18	3	32	23	10
12 Sep 2022 13:50 WIB	SMAN 5 SURABAYA	20	6/34	17.6	5/28	17.9	1/6	16.7	7/28	25	8/17	2	16	1	24	22	12
12 Sep 2022 15:30 WIB	SMA MUHAMMADIYAH 10 GKB GRESIK	29	10/40	25	7/24	29.2	3/16	18.8	6/24	25	9/13	4	12	0	14	22	13
12 Sep 2022 15:30 WIB	SMAN 1 SURABAYA	37	12/39	30.8	11/31	35.5	1/8	12.5	12/25	48	17/21	9	9	5	25	20	8
12 Sep 2022 17:10 WIB	SMAN 22 SURABAYA	13	4/28	14.3	3/23	13	1/5	20	4/17	23.5	6/24	2	4	3	26	7	2
12 Sep 2022 17:10 WIB	SMAN 1 GRESIK	43	20/59	33.9	18/44	40.9	2/15	13.3	1/6	16.7	15/17	17	17	1	11	15	21
12 Sep 2022 18:50 WIB	SMAN 5 SURABAYA	15	4/32	12.5	4/18	22.2	0/14	0	7/17	41.2	6/17	0	7	0	20	26	6
12 Sep 2022 18:50 WIB	SMAN 2 SURABAYA	51	14/47	29.8	9/25	36	5/22	22.7	18/37	48.6	22/23	13	17	4	15	19	23
13 Sep 2022 10:30 WIB	SMAN 1 PURI MOJOKERTO	40	13/45	28.9	12/33	36.4	1/12	8.3	13/31	41.9	13/22	7	15	7	20	28	15
13 Sep 2022 10:30 WIB	SMA FRATERAN SURABAYA	41	13/54	24.1	10/36	27.8	3/18	16.7	12/27	44.4	21/21	8	10	1	19	19	17
13 Sep 2022 12:10 WIB	SMA PETRA 5 SURABAYA	13	4/16	25	4/16	25	0/0	0	5/14	35.7	7/18	6	12	3	35	18	5
13 Sep 2022 12:10 WIB	SMAN 1 PURI MOJOKERTO	25	10/52	19.2	10/43	23.3	0/9	0	5/21	23.8	31/9	4	24	1	24	18	15
13 Sep 2022 13:50 WIB	SMA FRATERAN SURABAYA	16	4/31	12.9	4/28	14.3	0/3	0	8/14	57.1	7/25	4	4	0	23	15	5
13 Sep 2022 13:50 WIB	SMAN 16 SURABAYA	40	17/55	30.9	16/47	34	1/8	12.5	5/21	23.8	20/16	11	13	3	9	15	20
13 Sep 2022 15:30 WIB	SMAN 16 SURABAYA	38	14/41	34.1	12/36	33.3	2/5	40	8/29	27.6	8/22	4	14	0	29	18	15
13 Sep 2022 15:30 WIB	SMA CITA HATI EAST SURABAYA	48	14/54	25.9	12/37	32.4	2/17	11.8	18/28	64.3	16/22	9	15	3	25	18	16
13 Sep 2022 17:10 WIB	SMAN 9 SURABAYA	34	11/40	27.5	9/33	27.3	2/7	28.6	10/27	37	15/19	3	16	1	20	12	14
13 Sep 2022 17:10 WIB	SMA SANTO HENDRIKUS SURABAYA	28	11/44	25	10/33	30.3	1/11	9.1	5/9	55.6	9/19	6	11	3	20	19	9
13 Sep 2022 18:50 WIB	SMA ST LOUIS 1 SURABAYA	47	17/44	38.6	14/34	41.2	3/10	30	10/13	76.9	4/14	14	11	4	12	22	26
13 Sep 2022 18:50 WIB	SMA GLORIA 1 SURABAYA	46	14/37	37.8	9/19	47.4	5/18	27.8	13/22	59.1	8/23	10	4	0	20	13	9
14 Sep 2022 13:30 WIB	SMA ST LOUIS 1 SURABAYA	69	31/62	50	30/54	55.6	1/8	12.5	6/17	35.3	16/21	18	30	4	10	14	48
14 Sep 2022 13:30 WIB	SMAN 1 MOJOKERTO	7	2/28	7.1	2/22	9.1	0/6	0	3/11	27.3	7/18	1	5	1	36	11	1
14 Sep 2022 15:10 WIB	SMA CIPUTRA SURABAYA	48	19/54	35.2	16/43	37.2	3/11	27.3	7/15	46.7	15/22	8	10	4	11	15	16
14 Sep 2022 15:10 WIB	SMAN 3 SIDOARJO	31	12/51	23.5	10/41	24.4	2/10	20	5/11	45.5	14/21	3	5	0	17	12	3
14 Sep 2022 16:50 WIB	SMAN 1 WARU	31	8/32	25	7/25	28	1/7	14.3	14/30	46.7	10/20	5	18	3	23	15	23
14 Sep 2022 16:50 WIB	SMAN 15 SURABAYA	14	4/35	11.4	3/27	11.1	1/8	12.5	5/16	31.3	9/19	4	14	0	29	27	7
14 Sep 2022 18:30 WIB	SMAN 1 WARU	33	13/49	26.5	12/37	32.4	1/12	8.3	6/12	50	16/17	5	13	1	13	19	13
14 Sep 2022 18:30 WIB	SMAN 20 SURABAYA	26	6/32	18.8	5/22	22.7	1/10	10	13/29	44.8	13/18	4	8	2	20	11	6
15 Sep 2022 13:30 WIB	SMA PETRA 1 SURABAYA	31	12/50	24	12/37	32.4	0/13	0	7/12	58.3	11/26	8	7	1	18	14	6
15 Sep 2022 13:30 WIB	SMA NATION STAR ACADEMY SURABAYA	45	16/64	25	12/38	31.6	4/26	15.4	9/13	69.2	20/22	8	15	2	12	14	12
15 Sep 2022 15:10 WIB	SMAN 1 GRESIK	25	10/44	22.7	8/30	26.7	2/14	14.3	3/10	30	10/21	10	4	5	20	10	7
15 Sep 2022 15:10 WIB	SMA PETRA 1 SURABAYA	52	22/62	35.5	18/44	40.9	4/18	22.2	4/7	57.1	15/22	10	12	0	11	10	15
15 Sep 2022 16:50 WIB	SMAN 1 SURABAYA	15	6/22	27.3	6/16	37.5	0/6	0	3/8	37.5	5/16	1	4	0	35	16	0
15 Sep 2022 16:50 WIB	SMAN 2 SURABAYA	63	25/51	49	21/40	52.5	4/11	36.4	9/21	42.9	14/12	19	28	2	10	16	34
15 Sep 2022 18:30 WIB	SMAN 19 SURABAYA	41	16/55	29.1	14/46	30.4	2/9	22.2	7/19	36.8	17/19	5	15	4	15	22	19
15 Sep 2022 18:30 WIB	SMAN 2 SIDOARJO	27	10/44	22.7	10/32	31.3	0/12	0	7/21	33.3	19/20	3	9	1	24	12	9
16 Sep 2022 14:00 WIB	SMAN 16 SURABAYA	26	8/40	20	8/37	21.6	0/3	0	10/34	29.4	16/20	5	17	4	24	17	18
16 Sep 2022 14:00 WIB	SMAN 1 PURI MOJOKERTO	17	7/36	19.4	7/33	21.2	0/3	0	3/20	15	13/19	3	17	3	30	26	5
16 Sep 2022 15:40 WIB	SMAN 9 SURABAYA	31	12/32	37.5	11/25	44	1/7	14.3	6/20	30	9/20	3	6	2	19	15	6
16 Sep 2022 15:40 WIB	SMA FRATERAN SURABAYA	35	11/44	25	8/41	19.5	3/3	100	8/14	57.1	10/16	3	11	5	11	24	14
16 Sep 2022 17:20 WIB	SMA GLORIA 1 SURABAYA	63	26/68	38.2	20/54	37	6/14	42.9	5/16	31.3	22/9	19	40	0	9	14	50
16 Sep 2022 17:20 WIB	SMA GLORIA 2 SURABAYA	9	2/9	22.2	1/6	16.7	1/3	33.3	4/12	33.3	1/23	2	3	2	46	14	1
16 Sep 2022 19:00 WIB	SMA ST LOUIS 1 SURABAYA	56	22/54	40.7	17/40	42.5	5/14	35.7	7/14	50	17/16	10	21	4	13	25	29
16 Sep 2022 19:00 WIB	SMA CITA HATI EAST SURABAYA	28	4/25	16	1/11	9.1	3/14	21.4	17/22	77.3	3/15	5	7	0	26	13	10
17 Sep 2022 13:30 WIB	SMAN 1 WARU	28	12/39	30.8	10/30	33.3	2/9	22.2	2/15	13.3	11/18	6	9	2	18	13	7
17 Sep 2022 13:30 WIB	SMA ST LOUIS 1 SURABAYA	39	18/44	40.9	18/41	43.9	0/3	0	3/12	25	9/20	6	10	1	17	17	15
17 Sep 2022 15:10 WIB	SMA CIPUTRA SURABAYA	48	15/44	34.1	10/30	33.3	5/14	35.7	13/30	43.3	13/27	10	15	2	36	15	14
17 Sep 2022 15:10 WIB	SMAN 1 WARU	50	20/57	35.1	19/48	39.6	1/9	11.1	9/18	50	12/18	11	22	2	23	23	30
17 Sep 2022 16:50 WIB	SMAN 19 SURABAYA	40	16/45	35.6	16/42	38.1	0/3	0	8/21	38.1	13/19	4	12	1	24	20	17
17 Sep 2022 16:50 WIB	SMA NATION STAR ACADEMY SURABAYA	46	17/44	38.6	14/33	42.4	3/11	27.3	9/24	37.5	12/13	11	11	0	18	20	17
17 Sep 2022 18:30 WIB	SMA PETRA 1 SURABAYA	35	11/39	28.2	8/19	42.1	3/20	15	10/16	62.5	5/20	10	5	2	17	17	2
17 Sep 2022 18:30 WIB	SMAN 2 SURABAYA	59	21/60	35	15/31	48.4	6/29	20.7	11/16	68.8	13/20	15	15	1	8	13	12
18 Sep 2022 11:00 WIB	SMA GLORIA 1 SURABAYA	85	38/82	46.3	36/63	57.1	2/19	10.5	7/12	58.3	19/23	26	27	0	10	13	47
18 Sep 2022 11:00 WIB	SMAN 16 SURABAYA	30	11/38	28.9	7/27	25.9	4/11	36.4	4/12	33.3	5/18	7	6	4	35	16	5
18 Sep 2022 13:30 WIB	SMA ST LOUIS 1 SURABAYA	41	14/53	26.4	13/45	28.9	1/8	12.5	12/24	50	21/36	6	10	6	29	16	10
18 Sep 2022 13:30 WIB	SMA NATION STAR ACADEMY SURABAYA	36	13/69	18.8	9/41	22	4/28	14.3	6/15	40	15/19	3	13	2	15	21	21
18 Sep 2022 16:00 WIB	SMA ST LOUIS 1 SURABAYA	56	21/64	32.8	17/45	37.8	4/19	21.1	10/15	66.7	17/19	10	21	6	19	16	36
18 Sep 2022 16:00 WIB	SMA FRATERAN SURABAYA	23	8/40	20	6/33	18.2	2/7	28.6	5/6	83.3	4/23	4	8	0	37	12	4
18 Sep 2022 18:00 WIB	SMAN 1 WARU	42	15/50	30	15/41	36.6	0/9	0	12/22	54.5	4/33	5	5	2	29	11	2
18 Sep 2022 18:00 WIB	SMAN 2 SURABAYA	79	35/92	38	30/59	50.8	5/33	15.2	4/13	30.8	22/31	12	20	5	8	16	33
20 Sep 2022 14:00 WIB	SMA GLORIA 1 SURABAYA	79	34/82	41.5	29/63	46	5/19	26.3	6/10	60	15/27	23	29	2	14	29	45
20 Sep 2022 14:00 WIB	SMA ST LOUIS 1 SURABAYA	35	11/43	25.6	11/39	28.2	0/4	0	13/27	48.1	8/26	6	9	3	35	10	6
20 Sep 2022 17:00 WIB	SMA ST LOUIS 1 SURABAYA	58	21/65	32.3	19/48	39.6	2/17	11.8	14/22	63.6	16/29	13	13	9	23	24	26
20 Sep 2022 17:00 WIB	SMAN 2 SURABAYA	40	12/49	24.5	10/30	33.3	2/19	10.5	14/23	60.9	6/22	9	6	2	26	15	14
\.


--
-- Name: match_info match_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_info
    ADD CONSTRAINT match_info_pkey PRIMARY KEY (date_time);


--
-- Name: official official_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official
    ADD CONSTRAINT official_pkey PRIMARY KEY (name);


--
-- Name: official_role official_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official_role
    ADD CONSTRAINT official_role_pkey PRIMARY KEY (name, job_type, job_role);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (name);


--
-- Name: player_stats player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_pkey PRIMARY KEY (date_time, name);


--
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (name);


--
-- Name: team_stats team_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_pkey PRIMARY KEY (date_time, name);


--
-- Name: match_info match_info_winner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_info
    ADD CONSTRAINT match_info_winner_fkey FOREIGN KEY (winner) REFERENCES public.school(name);


--
-- Name: official_role official_role_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official_role
    ADD CONSTRAINT official_role_name_fkey FOREIGN KEY (name) REFERENCES public.official(name);


--
-- Name: official official_school_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official
    ADD CONSTRAINT official_school_fkey FOREIGN KEY (school) REFERENCES public.school(name);


--
-- Name: player player_school_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_school_fkey FOREIGN KEY (school) REFERENCES public.school(name);


--
-- Name: player_stats player_stats_date_time_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_date_time_fkey FOREIGN KEY (date_time) REFERENCES public.match_info(date_time);


--
-- Name: player_stats player_stats_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_name_fkey FOREIGN KEY (name) REFERENCES public.player(name);


--
-- Name: team_stats team_stats_date_time_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_date_time_fkey FOREIGN KEY (date_time) REFERENCES public.match_info(date_time);


--
-- Name: team_stats team_stats_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_name_fkey FOREIGN KEY (name) REFERENCES public.school(name);


--
-- PostgreSQL database dump complete
--

