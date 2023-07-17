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
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    bookid character varying(10) NOT NULL,
    author character varying(50) NOT NULL
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- Name: book_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_genre (
    bookid character varying(10) NOT NULL,
    genre character varying(20) NOT NULL
);


ALTER TABLE public.book_genre OWNER TO postgres;

--
-- Name: book_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_information (
    bookid character varying(10) NOT NULL,
    book_title character varying(50),
    price integer,
    isbn character varying(20)
);


ALTER TABLE public.book_information OWNER TO postgres;

--
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_author (bookid, author) FROM stdin;
BOOK001	Naila Aini Bahri
BOOK002	Patricia Ammabelle Derwanto
BOOK003	Faizah Adila Husna Dalimunthe
BOOK004	Fatimah Azzahra
BOOK005	Mutiara Sya'bani
BOOK006	Zazkiya Nurul Aini
BOOK007	Maryam Tazkia M.
BOOK008	Najla Nurdiany Putri
BOOK009	Acitya Resthimahening A.
BOOK010	Naila Wafa' Syakira
BOOK010	Hilya Faizzati M.
BOOK010	Fatimah Azzahra
BOOK010	Nafisa Mahdiya
BOOK010	dan Ayranee Deweey
BOOK011	Almira Annalia
BOOK012	Ahmad Zayd al-Malik
BOOK013	Syifa Tsabita Wiangga
BOOK014	Naura Athaya
BOOK015	Freya Alzena
BOOK016	Aysha Faustine Tirtayasa
BOOK017	Amallia Lovyna
BOOK018	Fariza Audree Kancana
BOOK019	Naura Nuraqila Hafidzah
BOOK020	Naura Nuraqila Hafidzah
BOOK021	Rayya Izarra Abqary
BOOK022	Arfan Syarif Prabowo
BOOK023	Syifa Tsabita Wiangga
BOOK025	Nafisa Mahdiya
BOOK025	Zahwa Fathiya Dini
BOOK025	Annara Salian Nanda Salombe
BOOK025	Faiza Karimatuz Zahida
BOOK025	Naila Wafa' Syakira
BOOK026	Kalila Tyara Semarang
BOOK027	Queennara Zahra S. J.
BOOK028	Mutiara Sya'bani
BOOK029	Naila Zhafira Prameswari
BOOK030	Dafa Pasya Khadafi
BOOK031	Dahayu Erinna W.
BOOK032	Ilma Ma'qul Istima
BOOK033	Khayla Nazwa
BOOK034	Naza Auly Nurrahman
BOOK035	Dimitria Nareswari
BOOK036	Rahmi Fitriyah
BOOK037	Syaira Rahma Fazila
BOOK039	Nafisa Mahdiya
BOOK040	Dieza Kayla Zivanka
BOOK041	Fariza Audree Kancana
BOOK042	Zharifah Zora
BOOK044	Nafisa Mahdiya
BOOK045	Nur Anisa Nidatul Haq
BOOK046	Dhiyaa Khaira Alisha
BOOK047	Hafizha Qoulan Tsaqila
BOOK048	Syifa Tsabita W.
BOOK048	Freya Alzena
BOOK048	Ruruh Naindra A.
BOOK048	Nafisa Mahdiya
BOOK048	dan Naila Wafa' Syakira
BOOK049	Quennarra Zahra
BOOK050	Mutiara Sya'bani
BOOK051	Hilya Faizzati Mardliyah
BOOK052	Aisya Najwa Kirana Alenty
BOOK053	Khanza Khairiyah Azahra
BOOK054	Zahra Luthfiya
BOOK055	Zaskia Talita Sasikirani
BOOK056	Hati Bening Asy-Syahiidah
BOOK057	Azka Rahilah
BOOK057	Nafisa Mahdiya
BOOK057	Faidza Alya
BOOK057	Rafisqy Abqory
BOOK057	dan Ghaissani Queenzabina
BOOK058	Kamila Dewi
BOOK058	Qinasti Annordia
BOOK058	Maritza Safira
BOOK058	Mahatma Ali
BOOK058	Nada Chavela
BOOK059	Naila Wafa' Syakira
BOOK060	Hana Fahiratul
BOOK062	Rayqha Lubna Z. S. A.
BOOK063	Zahra Luthfiya
BOOK065	Khansa Humaira Dyfka
BOOK066	Fildzah Hanifa Syukra
BOOK067	Meghan Alesha
BOOK068	Dhiyaa Khaira Alisha
BOOK069	Annisa Maharani
BOOK071	Nafisa Mahdiya
BOOK071	Faiza Karimatuz Z.
BOOK071	Freya Alzena P.
BOOK071	Aisha Ghaziya
BOOK071	Yudha Opri Yansyah
BOOK072	Najla Nurdiany
BOOK073	Dhifa Sephi Parameswari
BOOK074	Muthi'aturrochmah
BOOK075	Kaira Alisha
BOOK076	Mutiara Sya'bani
BOOK077	Jihan Lathifah
BOOK078	Rane Kiran Anjali
BOOK079	Zahwa Fathiya Dini
BOOK080	Princessa Carisma
BOOK081	Syifa Tsabita Wiangga
BOOK082	Naila Wafa' Syakira
BOOK083	Kirana Riris Santosa
BOOK084	Naura Nuraqila Nurhafidzah
BOOK085	Najwa Fitriani Dewi
\.


--
-- Data for Name: book_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_genre (bookid, genre) FROM stdin;
BOOK001	Family
BOOK001	Friendship
BOOK001	Novel
BOOK002	Fantasy
BOOK002	Friendship
BOOK002	Novel
BOOK003	Friendship
BOOK003	Novel
BOOK004	Friendship
BOOK004	Novel
BOOK005	Family
BOOK005	Friendship
BOOK005	Novel
BOOK006	Family
BOOK006	Friendship
BOOK006	Frightening
BOOK006	Komik
BOOK007	Komik
BOOK008	Family
BOOK008	Novel
BOOK009	Novel
BOOK010	Friendship
BOOK010	Komik
BOOK011	Family
BOOK011	Friendship
BOOK011	Novel
BOOK012	Fantasy
BOOK012	Friendship
BOOK012	Novel
BOOK013	Family
BOOK014	Fantasy
BOOK014	Friendship
BOOK014	Novel
BOOK015	Family
BOOK015	Fantasy
BOOK015	Friendship
BOOK015	Komik
BOOK016	Friendship
BOOK016	Novel
BOOK017	Friendship
BOOK017	Novel
BOOK018	Fantasy
BOOK018	Friendship
BOOK018	Novel
BOOK019	Family
BOOK019	Friendship
BOOK019	Komik
BOOK020	Family
BOOK020	Food
BOOK020	Friendship
BOOK020	Komik
BOOK021	Family
BOOK021	Novel
BOOK022	Fantasy
BOOK022	Komik
BOOK023	Family
BOOK023	Fantasy
BOOK023	Friendship
BOOK023	Komik
BOOK024	Family
BOOK024	Frightening
BOOK024	Komik
BOOK025	Komik
BOOK026	Family
BOOK026	Novel
BOOK027	Fantasy
BOOK027	Novel
BOOK028	Family
BOOK028	Food
BOOK028	Friendship
BOOK028	Frightening
BOOK028	Komik
BOOK029	Family
BOOK029	Fantasy
BOOK029	Friendship
BOOK029	Frightening
BOOK029	Novel
BOOK030	Family
BOOK030	Friendship
BOOK030	Frightening
BOOK030	Komik
BOOK031	Friendship
BOOK031	Novel
BOOK032	Family
BOOK032	Fantasy
BOOK032	Food
BOOK032	Friendship
BOOK032	Komik
BOOK033	Frightening
BOOK033	Novel
BOOK034	Family
BOOK034	Fantasy
BOOK034	Food
BOOK034	Friendship
BOOK034	Frightening
BOOK034	Komik
BOOK035	Family
BOOK035	Friendship
BOOK035	Komik
BOOK036	Family
BOOK036	Friendship
BOOK036	Komik
BOOK037	Family
BOOK037	Food
BOOK037	Friendship
BOOK037	Komik
BOOK038	Food
BOOK038	Friendship
BOOK038	Komik
BOOK039	Komik
BOOK040	Friendship
BOOK040	Novel
BOOK041	Family
BOOK041	Fantasy
BOOK041	Food
BOOK041	Friendship
BOOK041	Frightening
BOOK041	Komik
BOOK042	Family
BOOK042	Friendship
BOOK042	Novel
BOOK043	Komik
BOOK044	Komik
BOOK045	Family
BOOK045	Fantasy
BOOK045	Friendship
BOOK045	Frightening
BOOK045	Novel
BOOK046	Komik
BOOK047	Fantasy
BOOK047	Friendship
BOOK047	Novel
BOOK048	Family
BOOK048	Friendship
BOOK048	Komik
BOOK049	Family
BOOK049	Fantasy
BOOK049	Friendship
BOOK049	Komik
BOOK050	Friendship
BOOK050	Novel
BOOK051	Friendship
BOOK051	Komik
BOOK052	Friendship
BOOK052	Novel
BOOK053	Friendship
BOOK053	Komik
BOOK054	Family
BOOK054	Friendship
BOOK054	Komik
BOOK055	Fantasy
BOOK055	Friendship
BOOK055	Komik
BOOK056	Family
BOOK056	Fantasy
BOOK056	Friendship
BOOK056	Novel
BOOK057	Fantasy
BOOK057	Friendship
BOOK057	Komik
BOOK058	Family
BOOK058	Komik
BOOK059	Komik
BOOK060	Fantasy
BOOK060	Friendship
BOOK060	Frightening
BOOK060	Komik
BOOK061	Family
BOOK061	Food
BOOK061	Komik
BOOK062	Family
BOOK062	Komik
BOOK063	Fantasy
BOOK063	Friendship
BOOK063	Frightening
BOOK063	Komik
BOOK064	Friendship
BOOK064	Novel
BOOK065	Family
BOOK065	Fantasy
BOOK065	Friendship
BOOK065	Novel
BOOK066	Fantasy
BOOK066	Friendship
BOOK066	Novel
BOOK067	Fantasy
BOOK067	Friendship
BOOK067	Novel
BOOK068	Komik
BOOK069	Family
BOOK069	Fantasy
BOOK069	Friendship
BOOK069	Novel
BOOK070	Fantasy
BOOK070	Komik
BOOK071	Fantasy
BOOK071	Friendship
BOOK071	Frightening
BOOK071	Komik
BOOK072	Fantasy
BOOK072	Friendship
BOOK072	Novel
BOOK073	Fantasy
BOOK073	Friendship
BOOK073	Novel
BOOK074	Family
BOOK074	Friendship
BOOK074	Novel
BOOK075	Fantasy
BOOK075	Friendship
BOOK075	Frightening
BOOK075	Novel
BOOK076	Fantasy
BOOK076	Friendship
BOOK076	Frightening
BOOK076	Novel
BOOK077	Fantasy
BOOK077	Friendship
BOOK077	Frightening
BOOK077	Novel
BOOK078	Family
BOOK078	Fantasy
BOOK078	Friendship
BOOK078	Novel
BOOK079	Family
BOOK079	Friendship
BOOK079	Novel
BOOK080	Family
BOOK080	Fantasy
BOOK080	Friendship
BOOK080	Novel
BOOK081	Fantasy
BOOK081	Food
BOOK081	Friendship
BOOK081	Komik
BOOK082	Family
BOOK082	Friendship
BOOK082	Komik
BOOK083	Family
BOOK083	Frightening
BOOK083	Novel
BOOK084	Fantasy
BOOK084	Friendship
BOOK084	Komik
BOOK085	Family
BOOK085	Friendship
BOOK085	Novel
BOOK086	Family
BOOK086	Fantasy
BOOK086	Friendship
BOOK086	Komik
\.


--
-- Data for Name: book_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_information (bookid, book_title, price, isbn) FROM stdin;
BOOK001	1001 Naskah Alesha	39000	978-623-254-317-1
BOOK002	Adventure in Kitty Kingdom	39000	\N
BOOK003	Aurora's Tales	39000	978-623-254-311-9
BOOK004	Besties Forever	39000	978-623-254-300-3
BOOK005	Bundaku Guruku	39000	978-623-254-284-6
BOOK006	Comic Fest Day	39000	978-623-254-223-5
BOOK007	DIAMOND GIRLS	39000	\N
BOOK008	Doa Untuk Mama	39000	978-623-254-231-0
BOOK009	FAIRYLAND ADVENTURE	39000	\N
BOOK010	Fake Account!	39000	\N
BOOK011	Gaun Kenangan Mama	39000	978-623-254-264-8
BOOK012	Glitchy World	39000	978-623-254-279-2
BOOK013	Hafalan Al-Quran Namira	39000	978-623-254-302-7
BOOK014	Happy Content Creator	39000	\N
BOOK015	Home Alone	39000	\N
BOOK016	It's a Channel	39000	978-623-254-255-6
BOOK017	It's Time to Sing	39000	978-623-254-200-6
BOOK018	Jam Penghenti Waktu	39000	978-623-254-241-9
BOOK019	K-Pop Fan Mail	39000	978-623-254-225-9
BOOK020	K-Pop Multifandom	39000	978-623-254-222-8
BOOK021	Kembar Tidak Akur	39000	978-623-254-268-6
BOOK022	Komikus Cilik	39000	978-623-254-280-8
BOOK023	Komikus Misterius	39000	\N
BOOK024	Let's Play with Teddy	39000	978-623-254-291-4
BOOK025	LITTLE PHOTOGRAPHER	39000	\N
BOOK026	ME VS MYSELF	39000	\N
BOOK027	Mirror, Mirror on the Wall	39000	978-623-254-248-8
BOOK028	Misteri Denting Jam Tua	39000	978-623-254-203-7
BOOK029	Misteri Kucing dalam Lukisan	39000	978-623-254-288-4
BOOK030	Misteri Malam Berkemah	39000	978-623-254-265-5
BOOK031	Misteri Pantai Buaya	39000	978-623-254-312-6
BOOK032	Misteri Rawon Setan	39000	978-623-254-298-3
BOOK033	Misteri Tangga Nada	39000	978-623-254-250-1
BOOK034	Mom_s Special Cupcake	39000	978-623-254-249-5
BOOK035	My Aesthetic Note	39000	978-623-254-283-9
BOOK036	My Cool Teacher	39000	978-623-254-297-6
BOOK037	My First Skincare	39000	\N
BOOK038	My Little Online Shop	39000	978-623-254-251-8
BOOK039	MY SPECIAL SISTER	39000	\N
BOOK040	My Twin, My Best Friend	39000	978-623-254-224-2
BOOK041	Mystery Funtime	39000	978-623-254-237-2
BOOK042	Our Little Brother	39000	\N
BOOK043	PARA PEMBURU HANTU	39000	\N
BOOK044	PETAKA JURIT MALAM	39000	\N
BOOK045	Rahasia Monalisa	39000	978-623-254-292-1
BOOK046	RAHASIA PENULIS CILIK	39000	\N
BOOK047	Rainbow Sparkle Adventure	39000	978-623-254-239-6
BOOK048	Ramadhan in Seoul	39000	\N
BOOK049	Reading Challenge	39000	978-623-254-290-7
BOOK050	Sahabat Beda Sifat	39000	978-623-254-080-4
BOOK051	Sahabat Juara	39000	978-623-254-315-7
BOOK052	Sahabat Pena Istimewa	39000	978-623-254-240-2
BOOK053	Sahabat Pengingat Shalat	39000	978-623-254-258-7
BOOK054	Sang Influencer	39000	\N
BOOK055	Science vs Art	39000	978-623-254-318-8
BOOK056	Seoul Mates	39000	978-623-254-204-4
BOOK057	Shena dan Lompatan Waktu	39000	\N
BOOK058	Si Paling Konten	39000	\N
BOOK059	SLEEPING CONTEST	39000	\N
BOOK060	Stargazer	39000	\N
BOOK061	Stroberi Pahit Mama	39000	978-623-254-267-9
BOOK062	Tabungan Amalku	39000	978-623-254-256-3
BOOK063	Tangisan MIsterius	39000	978-623-254-269-3
BOOK064	Teka-teki di Sekolah Baru	39000	978-623-254-262-4
BOOK065	The Archer Girl	39000	\N
BOOK066	The Brave Princess	39000	978-623-254-289-1
BOOK067	The Butterfly Garden	39000	978-623-254-266-2
BOOK068	THE EIGHT TIME	39000	\N
BOOK069	The Girls Beat	39000	978-623-254-219-8
BOOK070	THE HALLOWEEN CAFE	39000	\N
BOOK071	The Haunted House	39000	\N
BOOK072	The Huntsmen	39000	\N
BOOK073	The Incredible Six	39000	978-623-254-293-8
BOOK074	The Makeup Artist	39000	978-623-254-257-0
BOOK075	The Missing Pendant	39000	\N
BOOK076	The Mysterious Message	39000	978-623-254-230-3
BOOK077	The Mysterious Student	39000	978-623-254-316-4
BOOK078	The Rapper Girl	39000	978-623-254-199-3
BOOK079	Tiga Sahabat Pantun	39000	\N
BOOK080	Tugu Pahlawan	39000	\N
BOOK081	Unicorn Milkshake	39000	978-623-254-236-5
BOOK082	Virtual Best Friends	39000	978-623-254-310-2
BOOK083	Voice Note Terakhir Bunda	39000	978-623-254-263-1
BOOK084	Welcome to Unicorn World	39000	978-623-254-205-1
BOOK085	Winny Si Anak Mami	39000	\N
BOOK086	Writer vs Writer	39000	978-623-254-235-8
\.


--
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (bookid, author);


--
-- Name: book_genre book_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_pkey PRIMARY KEY (bookid, genre);


--
-- Name: book_information book_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_information
    ADD CONSTRAINT book_information_pkey PRIMARY KEY (bookid);


--
-- Name: book_author book_author_bookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.book_information(bookid);


--
-- Name: book_genre book_genre_bookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.book_information(bookid);


--
-- PostgreSQL database dump complete
--

