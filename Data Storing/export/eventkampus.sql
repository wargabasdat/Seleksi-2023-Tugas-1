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
-- Name: event; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.event (
    id_event character varying NOT NULL,
    event character varying,
    kategori character varying,
    tanggal character varying,
    jam character varying,
    tempat character varying,
    id_kota integer,
    id_profil character varying
);


ALTER TABLE public.event OWNER TO marchelinefannihp;

--
-- Name: kota; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.kota (
    id_kota integer NOT NULL,
    kota character varying
);


ALTER TABLE public.kota OWNER TO marchelinefannihp;

--
-- Name: pembelian; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.pembelian (
    id_order character varying NOT NULL,
    status character varying,
    id_tiket character varying NOT NULL,
    id_profil character varying NOT NULL
);


ALTER TABLE public.pembelian OWNER TO marchelinefannihp;

--
-- Name: pengguna; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.pengguna (
    id_pengguna character varying NOT NULL,
    email character varying NOT NULL,
    katasandi character varying NOT NULL
);


ALTER TABLE public.pengguna OWNER TO marchelinefannihp;

--
-- Name: profil; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.profil (
    id_profil character varying NOT NULL,
    nama character varying,
    email character varying NOT NULL,
    no_telp character varying,
    alamat text,
    jenis_kelamin character varying,
    pendidikan_terakhir character varying,
    sekolah_kampus character varying,
    jurusan character varying,
    biodata text,
    id_pengguna character varying NOT NULL
);


ALTER TABLE public.profil OWNER TO marchelinefannihp;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.tag (
    id_event character varying NOT NULL,
    tag character varying NOT NULL
);


ALTER TABLE public.tag OWNER TO marchelinefannihp;

--
-- Name: tiket; Type: TABLE; Schema: public; Owner: marchelinefannihp
--

CREATE TABLE public.tiket (
    id_event character varying NOT NULL,
    id_tiket character varying NOT NULL,
    jenis_tiket character varying,
    harga_tiket integer
);


ALTER TABLE public.tiket OWNER TO marchelinefannihp;

--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.event (id_event, event, kategori, tanggal, jam, tempat, id_kota, id_profil) FROM stdin;
4438	 JOB FAIR BERSAMA PUSAT KARIR PERGURUAN TINGGI  SOLORAYA 2023 	Bursa Kerja	14  - 15 Peb 2023	09:00 - 15:00	Gedung Grha Soloraya (Eks Gedung Bakorwil) Surakarta	\N	\N
4421	 JELAJAHI BUMI PARA PETINGGI - SEHARI di KARANGANYAR 	Lain-lain	24  - 24 Nov 2022	08:00 - 21:00	Kemuning, Ngargoyoso	\N	\N
4454	 FUN WALK 90's 	Sport	06  - 06 Agu 2023	06:00 - 12:00	Kampus STIE Totalwin	\N	\N
4444	 OPICH - TASBIH CINTA RAMADHAN 	Musik	19  - 19 Apr 2023	15:00 - 19:00	Dusun Semilir	\N	\N
4442	 WEBINAR NASIONAL EKSPEDISI SERIBU PULAU #4 2023 	Seminar	01  - 01 Apr 2023	07:30 - 16:00	Zoom	\N	\N
4437	 USB JOB FAIR 2023 	Bursa Kerja	24  - 25 Jan 2023	09:00 - 16:00	Gedung A1 Universitas Setia Budi	\N	\N
4432	 WEBINAR KESENIAN DAN KESEHATAN ENDORFIN 	Seminar	11  - 11 Des 2022	08:45 - 16:00	Zoom meeting	\N	\N
4431	 Chemistry Fair 1.0 	Expo	01  - 17 Des 2022	08:00 - 16:00	Gedung Fakultas MIPA	\N	\N
4430	 UPACARA PENUTUPAN PORSENIGAMA 2022 	Pensi	03  - 03 Des 2022	16:00 - 22:00	Lapangan Pancasila GSP UGM	\N	\N
4429	 Devfest Bogor 2022 “Move Together for Further” 	Seminar	03  - 03 Des 2022	07:00 - 16:00	GD, Poetri Ballroom, Bogor	\N	\N
4426	 PELATGIS UAV BOOTCAMP 	Lain-lain	10  - 11 Des 2022	08:30 - 16:00	UI	\N	\N
4425	 The Art of Arranging Music with 	Seminar	19  - 19 Nov 2022	11:00 - 14:00	Zoom Meeting	\N	\N
4424	 estival Budaya Nusantara 2022 	Expo	21  - 23 Nov 2022	08:00 - 16:00	UMN	\N	\N
4419	 SEMINAR NASIONAL FISIOTERAPI UNIVERSITAS AIRLANGGA 2022 	Seminar	13  - 13 Nov 2022	07:30 - 12:00	Ruang Auditorium Gedung Kuliah Bersama (GKB) Kampus C Universitas Airlangga	\N	\N
4418	 The 72nd MarkPlus Goes to Campus 	Seminar	29  - 29 Okt 2022	10:00 - 11:30	Zoom Meeting / Live Youtube	\N	\N
4416	 Donor Darah Charity Children Camp 2022 	Lain-lain	05  - 05 Nov 2022	09:00 - 12:00	Gedung Lukas Lt 1 (L101), Unika Atma Jaya	\N	\N
4415	 Visit Dentistry 	Lain-lain	01  - 01 Jan 1970	07:00 - 07:00	Fakultas Kedokteran Gigi, Trisakti Kampus B	\N	\N
4414	 Go Scholarship 2022 	Seminar	05  - 05 Nov 2022	09:00 - 12:00	Zoom Meeting	\N	\N
4413	 The 71st MarkPlus Goes to Campus 	Lain-lain	22  - 22 Okt 2022	10:00 - 11:30	Zoom Meeting / Live Youtube	\N	\N
4410	 RUN ORIENTEERING CHAMPIONSHIP 	Sport	29  - 29 Okt 2022	20:00 - 23:00	Balai Kota Medan	\N	\N
4408	 Indonesia Education Fair 	Expo	22  - 23 Okt 2022	14:30 - 18:00	Pullman Jakarta Central Park	\N	\N
4407	 FESTIVAL LITERASI KARANGANYAR 2022 	Expo	31 Okt 2022 - 06 Nov 2022	09:00 - 21:00	DINAS ARSIP DAN PERPUSTAKAAN KARANGANYAR	\N	\N
4406	 SOLORAYA JOBFAIR 2022 	Bursa Kerja	26  - 27 Okt 2022	09:00 - 16:00	Palur Plasa	\N	\N
4405	 The 7th Annual International Conference and Exhibition on Indonesian Medical Education and Research Institute 	Seminar	05  - 13 Nov 2022	08:00 - 16:00	online & offline	\N	\N
4404	 MEGA CAREER EXPO 2022 	Lain-lain	19  - 20 Okt 2022	10:00 - 17:00	SMESCO Exhibition Hall	\N	\N
4403	 EXCEED 2022 	Lain-lain	12 Sep 2022 - 11 Nov 2022	08:00 - 16:00	Online	\N	\N
4402	 ACCOUNTING WEEK 2022 	Lain-lain	01  - 23 Okt 2022	08:00 - 16:00	Online	\N	\N
4400	 6th DENTISTRY SPORT LEAGUE (DSL) FKG UB 2022 	Lain-lain	03  - 15 Okt 2022	08:00 - 16:00	Online	\N	\N
4399	 ILSA Connect 2022 	Seminar	15  - 15 Okt 2022	12:00 - 14:30	Zoom Meeting	\N	\N
4398	 OPEN RECRUITMENT VOLUNTEER GAM 2022 	Lain-lain	29 Sep 2022 - 06 Okt 2022	08:00 - 16:00	Online	\N	\N
4397	 The 69th MarkPlus Goes to Campus 	Seminar	01  - 01 Okt 2022	10:00 - 11:30	ZOOM & Youtube MarkPlus Channel	\N	\N
4396	 Pameran Foto Calon Anggota Unsada Photography Club (UPC) Angkatan 24 	Expo	30 Sep 2022 - 02 Okt 2022	14:00 - 16:00	Colaca Coffee	\N	\N
4395	 SEMINAR NASIONAL TL EXPO 2022 	Seminar	15  - 15 Okt 2022	07:30 - 12:00	Engineering Hall Dekanat Fakultas Teknik Universitas Diponegoro	\N	\N
4394	 National Accounting Olympiad 	Lain-lain	07 Agu 2022 - 13 Okt 2022	08:00 - 16:00	Online	\N	\N
4393	 GAMAFEST 	Musik	22  - 22 Okt 2022	15:00 - 22:00	Cinere Bellevue Mall	\N	\N
4392	 68th MarkPlus Goes to Campus 	Seminar	24  - 24 Sep 2022	10:00 - 11:30	Zoom Meeting / Live Youtube	\N	\N
4391	 AP FESTIVAL 2022 	Lain-lain	19 Sep 2022 - 05 Okt 2022	08:00 - 16:00	Online	\N	\N
4390	 𝐌𝐀𝐍𝐀𝐆𝐄𝐌𝐄𝐍𝐓 𝐍𝐀𝐓𝐈𝐎𝐍𝐀𝐋 𝐄𝐍𝐓𝐑𝐄𝐏𝐑𝐄𝐍𝐄𝐔𝐑 𝐓𝐀𝐋𝐊 𝟐𝟎𝟐𝟐 	Seminar	30  - 30 Okt 2022	09:00 - 12:00	Cisco Webex Meetings	\N	\N
4387	 VIRTUAL JOB FAIR JOGJA 2022 	Bursa Kerja	03  - 04 Okt 2022	08:00 - 16:00	Website Cariloker.id	\N	\N
4386	 WEBINAR KOMUNIKASI JURNALISTIK: Tantangan Jurnalis Perempuan dalam Mengawal Isu Isu Perempuan 	Pensi	20  - 20 Sep 2022	13:00 - 15:30	Online & Universitas Bakrie, Kampus Plaza Festival Ruang 1 dan 2.	\N	\N
4385	 Pekan Raya Biologi 2022 	Seminar	17  - 17 Sep 2022	08:00 - 12:00	Zoom Meeting & Teatrikal Lt.1 FST	\N	\N
4384	 Innovillage 2022 	Lain-lain	01 Agu 2022 - 10 Des 2022	08:00 - 16:00	Online	\N	\N
4383	 Lomba Poster SBMP 2022 	Lain-lain	08 Agu 2022 - 13 Nov 2022	08:00 - 16:00	Online	\N	\N
4382	 Lomba Esai SBMP 2022 	Lain-lain	08 Agu 2022 - 13 Nov 2022	08:00 - 16:00	Online	\N	\N
4381	 AMSW FK UNAIR 2022 	Lain-lain	21 Jul 2022 - 27 Nov 2022	08:00 - 16:00	Online	\N	\N
4380	 UMKM FEST 2022 	Lain-lain	24  - 25 Sep 2022	08:00 - 16:00	Aula Masjid At-Taqwa Universitas Pancasila	\N	\N
4379	 Creativity Event 2022 	Lain-lain	20 Agu 2022 - 30 Sep 2022	08:00 - 16:00	Online	\N	\N
4378	 CBCC 2022 	Expo	29 Agu 2022 - 29 Okt 2022	08:00 - 16:00	Online	\N	\N
4377	 BRAWIJAYA LAW FAIR XIII 2022: SEMINAR HUKUM NASIONAL 	Seminar	03  - 03 Sep 2022	09:00 - 12:00	Zoom Meeting	\N	\N
4376	 The 3rd Sociology and Anthropology National Essay Competition 	Lain-lain	05 Jul 2022 - 02 Okt 2022	08:00 - 16:00	Online	\N	\N
4375	 Pekan Raya Budaya 10.0 SOARCOFIES 	Lain-lain	12 Agu 2022 - 28 Sep 2022	08:00 - 16:00	Online	\N	\N
4374	 TAX COMPETITION THE 12TH TAX INTERCOLLEGIATE FORUM 	Lain-lain	01 Agu 2022 - 03 Okt 2022	08:00 - 16:00	Online	\N	\N
4372	 OLIMPIADE ZOOLOGI NASIONAL (OZON) 2022 	Lain-lain	14 Agu 2022 - 27 Nov 2022	08:00 - 16:00	UGM	\N	\N
4371	 The 64th MarkPlus Goes to Campus 	Seminar	20  - 20 Agu 2022	10:00 - 11:30	Zoom Meeting / Live Youtube	\N	\N
4370	 IBM 2022 	Lain-lain	15 Agu 2022 - 05 Nov 2022	08:00 - 16:00	Online	\N	\N
4369	 GELANGGANG EXPO 2022 	Expo	18  - 20 Agu 2022	15:30 - 21:30	Lapangan Pancasila UGM	\N	\N
4368	 ROAD TO ANTHROCREATIVE 2022 	Lain-lain	15 Agu 2022 - 11 Sep 2022	08:00 - 16:00	Online	\N	\N
4366	 The 63rd MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	13  - 13 Agu 2022	10:00 - 11:30	Zoom Meeting / Live Youtube	\N	\N
4365	 STARMEET 	Lain-lain	08 Agu 2022 - 15 Okt 2022	08:00 - 16:00	Online	\N	\N
4363	 Webinar Nasional 	Seminar	14  - 14 Agu 2022	08:30 - 12:00	Zoom Meeting	\N	\N
4361	 SPEXPERIENCE II 	Seminar	07  - 07 Agu 2022	10:40 - 12:00	Zoom Meeting	\N	\N
4360	 The 62nd MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	06  - 06 Agu 2022	10:00 - 11:30	Zoom & Youtube	\N	\N
4359	 Lomba Nasional HMJ PAI UIN WALISONGO 	Lain-lain	15 Jul 2022 - 30 Sep 2022	08:00 - 16:00	Online	\N	\N
4358	 LAWFERENCE 	Seminar	11  - 11 Agu 2022	09:30 - 12:00	Zoom Meeting / Live Youtube	\N	\N
4356	 Brawijaya Entrepreneurship in Advanced Competition (BRAVO) 2022 	Lain-lain	04 Agu 2022 - 14 Sep 2022	08:00 - 16:00	Universitas Brawijaya	\N	\N
4355	 𝗖𝗼𝗺𝗦𝗲𝗾𝘂𝗲𝗻𝗰𝗲 𝟮𝟬𝟮𝟮, 𝗜𝗻𝘁𝗲𝗿𝗻𝗮𝘁𝗶𝗼𝗻𝗮𝗹 𝗖𝗼𝗺𝗶𝗰 𝗮𝗻𝗱 𝗦𝗲𝗾𝘂𝗲𝗻𝘁𝗶𝗮𝗹 𝗔𝗿𝘁𝘀 𝗙𝗲𝘀𝘁𝗶𝘃𝗮𝗹 	Lain-lain	19  - 26 Sep 2022	07:00 - 07:00	Galeri R.J. Katamsi, ISI Yogyakarta	\N	\N
4354	 𝗮𝗿𝗴𝗨𝗠𝗲𝗻𝘁 𝗗𝗲𝗯𝗮𝘁𝗶𝗻𝗴 𝗖𝗵𝗮𝗺𝗽𝗶𝗼𝗻𝘀𝗵𝗶𝗽 𝟮𝟬𝟮𝟮 	Lain-lain	05  - 07 Agu 2022	09:00 - 16:00	Online	\N	\N
4353	 INDEYOU 2022: INDEPENDENCE BY YOU 	Lain-lain	20 Jul 2022 - 25 Agu 2022	08:00 - 16:00	Online	\N	\N
4351	 Mega Career Expo 	Bursa Kerja	20  - 21 Jul 2022	10:00 - 17:00	SMESCO Exhibition Hall	\N	\N
4350	 HR Competency Regular Class Batch 38 	Lain-lain	15  - 17 Jul 2022	08:00 - 16:00	Online	\N	\N
4349	 Speedhunt 2022 	Lain-lain	30 Jul 2022 - 01 Jan 1970	08:00 - 16:00	Online	\N	\N
4348	 Biology Event 2022 	Lain-lain	27  - 28 Agu 2022	08:00 - 16:00	Universitas Hasanuddin	\N	\N
4347	 Festival Jurnalistik Nasional 	Lain-lain	01  - 31 Jul 2022	08:00 - 16:00	Online	\N	\N
4346	 JOB FAIR SEMARANG 2022 	Bursa Kerja	23  - 24 Agu 2022	09:00 - 15:00	SEMARANG	\N	\N
4345	 WIDYATAMA ESPORT CHAMPIONSHIP 2022 	Lain-lain	20  - 28 Jul 2022	08:00 - 16:00	Online	\N	\N
4341	 DINAMIKA XXIII 	Lain-lain	23 Mei 2022 - 24 Jul 2022	08:00 - 16:00	FMIPA Universitas Lampung	\N	\N
4340	 TALKSHOW FOURTYFIVE STATION 2022 	Seminar	16  - 16 Jul 2022	08:30 - 11:00	UPN Veteran Jakarta	\N	\N
4338	 Concept 2022 	Lain-lain	25 Jun 2022 - 26 Nov 2022	08:00 - 16:00	Online	\N	\N
4337	 HR Competency Regular Class Batch 37 	Lain-lain	01  - 03 Jul 2022	08:00 - 12:00	Zoom & Ruko Safira Garden	\N	\N
4336	 The 58th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	25  - 25 Jun 2022	10:00 - 11:30	Zoom Meeting	\N	\N
4333	 RY OUT UKAI HMF FK UB 2022 	Lain-lain	18  - 18 Jun 2022	08:00 - 12:00	Zoom Meeting	\N	\N
4332	 LOMBA BUSINESS MODEL CANVAS 	Lain-lain	18 Mei 2022 - 29 Jun 2022	08:00 - 16:00	Online	\N	\N
4331	 Webinar Personal Branding VS Career 	Lain-lain	25  - 25 Jun 2022	14:00 - 15:30	Zoom Meeting	\N	\N
4330	 ALSA LC UI for Society 2022 	Seminar	15  - 15 Jun 2022	13:00 - 15:00	Zoom Meeting	\N	\N
4329	 Charity and Cultural Night AMSA-UGM 2022 	Pensi	25 Jun 2022 - 01 Jul 2022	18:00 - 22:00	Zoom Meeting	\N	\N
4327	 The 56th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	11  - 11 Jun 2022	10:00 - 11:30	Zoom Meeting	\N	\N
4324	 ACTS (A Collection of Teen Stories) 	Seminar	11  - 11 Jun 2022	09:00 - 13:00	Zoom Meeting	\N	\N
4323	 Webinar KNOCK OUT! 	Seminar	04  - 04 Jun 2022	13:00 - 15:00	Zoom Meeting	\N	\N
4322	 White Paper Competition Industrial Workshop 2022 	Lain-lain	23 Mei 2022 - 03 Sep 2022	08:00 - 16:00	Online	\N	\N
4321	 Creative seminar C.L.I.C 2022 “Encapsulate Your Personage” 	Seminar	09  - 09 Jun 2022	19:00 - 21:00	Zoom Meeting	\N	\N
4320	 Udayana Accounting Days 2022 	Lain-lain	20 Mei 2022 - 07 Agu 2022	08:00 - 16:00	Online	\N	\N
4319	 Podcast HTTS 2022 	Seminar	31  - 31 Mei 2022	19:00 - 21:00	Youtube	\N	\N
4318	 Pasarind Talks Pentingnya Customer Retention Untuk Bisnis 	Seminar	31  - 31 Mei 2022	15:00 - 16:30	Zoom Meeting	\N	\N
4317	 Digital Literacy Talkshow: Keeping Up with Digital Transformation, WHY NOT? 	Seminar	05  - 05 Jun 2022	13:00 - 15:00	Zoom Meeting	\N	\N
4316	 Digital Office Activity Contest 	Lain-lain	04  - 04 Jun 2022	08:00 - 17:00	Online	\N	\N
4315	 UBIQUINON 2022 	Lain-lain	16 Mei 2022 - 29 Okt 2022	08:00 - 16:00	Online	\N	\N
4314	 DEVASANA ASKARA SANTARA 2022 	Expo	28  - 28 Mei 2022	19:30 - 21:00	Online	\N	\N
4312	 Bazar KWU 2022 	Expo	17  - 20 Mei 2022	09:00 - 15:00	Lapangan Utama UIN Surakarta	\N	\N
4311	 IPB Virtual Fair 2022 	Bursa Kerja	17 Mei 2022 - 19 Jun 2022	08:00 - 16:00	Online	\N	\N
4310	 SMK N 1 Sragen Job Fair Virtual 2022 	Bursa Kerja	24  - 25 Mei 2022	09:00 - 15:30	SMK N 1 Sragen	\N	\N
4309	 ANAFARMA NATIONAL POSTER COMPETITION (ANION) 	Lain-lain	16 Mei 2022 - 18 Jun 2022	08:00 - 16:00	Online	\N	\N
4308	 WEBINAR NASIONAL ACCER X E-SUMMIT: Green Lifestyle 	Seminar	05  - 05 Jun 2022	09:00 - 16:00	Zoom Meeting	\N	\N
4307	 ADKESMA-TALK SERIES II 	Seminar	21  - 21 Mei 2022	08:00 - 16:00	Zoom Meeting	\N	\N
4306	 HR Competency Regular Class Batch 34 	Lain-lain	27  - 29 Mei 2022	08:00 - 16:00	Zoom Meeting	\N	\N
4305	 PIALA JUSTICIA 	Lain-lain	27  - 29 Mei 2022	08:00 - 16:00	Online	\N	\N
4304	 THE 6TH CREATIVE INDUSTRY 	Lain-lain	18  - 19 Mei 2022	13:00 - 16:30	Zoom Meeting	\N	\N
4303	 KOMPETISI PAPER MATEMATIKA TINGKAT NASIONAL 2022 	Lain-lain	05 Mei 2022 - 16 Sep 2022	08:00 - 16:00	Online	\N	\N
4302	 ENJOY 11 iGENERATION 2022 	Lain-lain	15  - 31 Mei 2022	08:00 - 16:00	Online	\N	\N
4301	 Webinar HIMDI 0.1 “Compact Living” 	Seminar	21  - 21 Mei 2022	13:00 - 15:30	Zoom Meeting	\N	\N
4300	 FESTIVAL QURANI 2022 	Lain-lain	25 Apr 2022 - 12 Jun 2022	08:00 - 16:00	Surabaya	\N	\N
4299	 SEMINAR NASIONAL APOTEKER UHAMKA XXXVI 	Seminar	29  - 29 Mei 2022	08:00 - 12:00	Online	\N	\N
4298	 Digital Experts Talks #10 CfDS UGM 	Lain-lain	18  - 18 Mei 2022	13:00 - 17:00	Grha Sabha Pramana	\N	\N
4297	 The 53rd MarkPlus Goes to Campus “Entrepreneurial Marketing 	Lain-lain	14  - 14 Mei 2022	10:00 - 11:30	Online	\N	\N
4296	 Seharusnya / Sepantasnya A Showcase from Normatif 	Pensi	14  - 14 Mei 2022	17:30 - 21:00	Salihara Art Center	\N	\N
4295	 BUSINESS PLAN COMPETITION - PERMIB ECONOMY PROJECT 	Lain-lain	15  - 21 Mei 2022	10:00 - 17:00	Online	\N	\N
4294	 Fresto 2022 	Expo	12  - 15 Mei 2022	17:00 - 21:00	Jalan Jawa, Surabaya (Area Depan Gsuites Hotel)	\N	\N
4292	 HR Competency Regular Class 2022 	Bursa Kerja	13  - 29 Mei 2022	08:00 - 13:00	Zoom	\N	\N
4291	 🗂️ [Online Accounting Competition] 🗂️ “Peran Teknologi di Bidang Akuntansi Guna Kembangkan Potensi Diri” 	Lain-lain	25 Apr 2022 - 28 Mei 2022	08:00 - 13:00	Online	\N	\N
4290	 ✨ALETTA ARCADIA 2022 PROUDLY PRESENT ✨ 	Lain-lain	26 Apr 2022 - 01 Mei 2022	08:00 - 00:00	Online	\N	\N
4289	 Webinar #PasarindTalks 	Seminar	26  - 26 Apr 2022	15:00 - 16:30	Zoom	\N	\N
4288	 [[OPEN RECRUITMENT DELEGASI ULF 2022]] 	Lain-lain	05 Apr 2022 - 15 Mei 2022	08:00 - 13:00	Online	\N	\N
4287	 ✨ PEPRO mempersembahkan PERMIB ECONOMY PROJECT “Menuju Indonesia Emas 2024: Empowering Youth Generation” 	Lain-lain	15 Apr 2022 - 22 Mei 2022	08:00 - 16:00	Online	\N	\N
4286	 HR Competency Regular Class 2022 	Bursa Kerja	23  - 30 Apr 2022	08:00 - 21:00	Zoom	\N	\N
4285	 The 52nd MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	23  - 23 Apr 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4284	 📣HIMATEMIA FT UNILA PROUDLY PRESENT📣    🔥EXCESS 2022🔥 	Seminar	29  - 29 Mei 2022	08:00 - 12:00	Dekanat A. Fakultas Teknik Universitas Lampung	\N	\N
4283	 [HIMATEMIA FT UNILA PROUDLY PRESENT]    📢ISO TRAINING MANAGEMENT SYSTEM📢 	Lain-lain	27  - 27 Mei 2022	08:00 - 13:00	Offline	\N	\N
4282	 ✨️A NEW COMERS' CONCERT✨️  ASCENDIO 	Musik	30  - 30 Apr 2022	19:30 - 21:30	Youtube	\N	\N
4281	 🌏ECO NOT EGO 🌏  Lomba Karya Tulis Ilmiah 	Lain-lain	26 Apr 2022 - 26 Jun 2022	08:00 - 16:00	Online	\N	\N
4280	 HR Competency Regular Class 2022 	Bursa Kerja	22  - 24 Apr 2022	08:00 - 17:00	Zoom	\N	\N
4279	 [OPEN REGIST INDUSTRIAL SPIRIT OF CARING - INSPIRING HMTI UPNVJ 2022] 	Seminar	22  - 22 Apr 2022	14:30 - 17:30	Zoom Meeting	\N	\N
4277	 [ IDEA 2022 ] dengan tema “Generasi Muda Islami yang Berakhlak Mulia, Cerdas dan Berkualitas”. 	Lain-lain	23  - 24 Apr 2022	08:23 - 13:00	Zoom Meeting	\N	\N
4276	 HR Competency Regular Class 2022 	Bursa Kerja	10  - 21 Apr 2022	08:00 - 21:00	Zoom Meeting	\N	\N
4275	 The 6th IROFONIC 2022 	Seminar	05  - 05 Jul 2022	08:00 - 13:00	Hybrid (Offline dan Online via Zoom)	\N	\N
4274	 HR Competency Regular Class 2022 	Bursa Kerja	15  - 17 Apr 2022	08:00 - 17:00	Zoom	\N	\N
4272	 🎨 [KOMPETISI UI/UX DESAIN WEB] 🎨  “Impact Your UI/UX Design For The Future” 	Lain-lain	11  - 25 Apr 2022	08:00 - 13:00	Online	\N	\N
4271	 [DIVISI LANGUAGE AND LITERATURE HIMHI UNPAS PROUDLY PRESENT INTERNATIONAL MULTI LANGUAGE TOEFL] 	Lain-lain	23  - 24 Apr 2022	08:00 - 13:00	Online	\N	\N
4270	 WEBINAR MEMULAI PERSONAL BRANDING DI LINKEDIN ~ YOUR LINKEDIN YOUR FUTURE POWER 	Seminar	08  - 08 Apr 2022	13:00 - 15:00	Zoom	\N	\N
4269	 SMART WAY TOEFL HAS ARRIVED! 	Lain-lain	09  - 10 Apr 2022	08:00 - 13:00	Zoom	\N	\N
4268	 ✨ SEMINAR NASIONAL SAINS DAN TEKNOLOGI INFORMASI ✨ 	Seminar	10  - 10 Apr 2022	09:00 - 13:00	Zoom	\N	\N
4267	 The 51st MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	09  - 09 Apr 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4266	 SEMINAR NASIONAL  Mewujudkan Kampus yang Bersih dari Kekerasan Seksual dengan NGOJEK  	Seminar	23  - 23 Apr 2022	08:30 - 13:00	Aula Taman Asoka Universitas Hindu Indonesia 	\N	\N
4265	 Pekan Milenial Naik Kelas 	Seminar	05  - 07 Apr 2022	09:00 - 12:00	\N	\N	\N
4264	 The 50th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	02  - 02 Apr 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4261	 HR Competency Regular Class 2022 	Bursa Kerja	01  - 16 Apr 2022	08:00 - 21:00	Zoom	\N	\N
4260	 Kompetisi Fotografi 	Lain-lain	15 Mar 2022 - 15 Apr 2022	08:00 - 16:00	Online	\N	\N
4259	 PASARIND TALK 2022 	Seminar	31  - 31 Mar 2022	15:00 - 16:30	Zoom	\N	\N
4258	 HR Competency Regular Class 2022 	Bursa Kerja	01  - 10 Apr 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4257	 HR Competency Regular Class 	Bursa Kerja	01  - 15 Apr 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4256	 Open donasi Abdi Utama 2022 untuk Desa Cupunagara, Kabupaten Subang. 	Donasi	24  - 27 Mar 2022	07:00 - 17:00	Online	\N	\N
4255	 The 49th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	26  - 26 Mar 2022	10:00 - 11:30	\N	\N	\N
4254	 CARYA CLASS 2022 	Lain-lain	01  - 23 Apr 2022	11:00 - 13:40	Zoom Meeting	\N	\N
4253	 VIRTUAL JOB FAIR JOGJA 2022 	Bursa Kerja	18  - 19 Mei 2022	08:00 - 15:00	Website Cariloker.id	\N	\N
4252	 HR Competency Regular Class 	Bursa Kerja	01  - 16 Apr 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4251	 ✨AMIKOM VIDEO COMPETITION (Tingkat Nasional)✨ 	Lain-lain	06 Mar 2022 - 27 Jun 2022	08:00 - 16:00	Online	\N	\N
4250	 HR Competency Regular Class 	Seminar	18  - 20 Mar 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4249	 HR Competency Regular Class 	Bursa Kerja	18  - 20 Mar 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4248	 Webinar Nasional Artificial Intelligence 	Seminar	31  - 31 Mar 2022	09:00 - 12:00	Zoom Meeting	\N	\N
4247	 HR Competency Regular Class 	Bursa Kerja	09  - 09 Apr 2022	08:00 - 17:00	Zoom Meeting	\N	\N
4246	 The 48th MarkPlus Goes to Campus “Entrepreneurial Marketing. 	Seminar	19  - 19 Mar 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4245	 HR Competency Regular Class 	Bursa Kerja	18  - 20 Mar 2022	09:00 - 17:00	Zoom Meeting	\N	\N
4244	 Kognisi Youth Learning Festival 2022 	Seminar	12  - 12 Mar 2022	08:00 - 17:00	Virtual Land Kumospace	\N	\N
4243	 [KOMPETISI MEMBUAT CAPTION 2022] 	Lain-lain	20  - 25 Mar 2022	08:00 - 10:56	Online	\N	\N
4242	 Kognisi Youth Learning Festival 2022 	Seminar	11  - 13 Mar 2022	09:00 - 17:00	Virtual Land Kumospace	\N	\N
4241	 CONVEY DAY 2022 IS COMING YOUR WAY! 	Lain-lain	12  - 12 Mar 2022	19:00 - 21:30	Youtube	\N	\N
4240	 [METAFEST 2022: Got in Your Melody Bring in Your Journey] 	Pensi	12  - 12 Mar 2022	19:15 - 21:30	Zoom Meeting & Youtube	\N	\N
4239	 The 47th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	12  - 12 Mar 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4238	 🌸HARUMATSURI 16🌸 	Lain-lain	06  - 08 Mei 2022	08:00 - 13:00	Online & Youtube	\N	\N
4237	 ✨FINDER 4TH : MATA AKSA✨ 	Lain-lain	12  - 14 Mar 2022	08:00 - 13:00	Online & Offline	\N	\N
4236	 HR Competency Regular Class 	Bursa Kerja	13  - 13 Mar 2022	08:00 - 21:00	Zoom	\N	\N
4235	 The 46th MarkPlus Goes to Campus “Entrepreneurial Marketing 	Seminar	05  - 05 Mar 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4234	 🔥BIWARA UNSOED PROUDLY PRESENT 🔥 	Lain-lain	05  - 15 Mar 2022	08:00 - 13:00	Online	\N	\N
4233	 [WEBINAR MENTAL HEALTH] 	Seminar	19  - 19 Mar 2022	09:30 - 13:30	Zoom Meeting	\N	\N
4232	 HR Competency Regular Class 2022 	Bursa Kerja	13  - 13 Mar 2022	08:00 - 21:00	Zoom	\N	\N
4231	 ✨ DEPARTEMENT PENDIDIKAN KESEHATAN DAN ILMU PERILAKU PROUDLY PRESENTS :📣🎉🎉  SEMINAR NASIONAL (ONLINE) 	Seminar	05  - 05 Mar 2022	08:00 - 13:00	Zoom Meeting	\N	\N
4228	 Marketeers Goes to Campus Episode 45 - Special Launch Edition  	Seminar	26  - 26 Peb 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4227	 HR Competency Regular Class 	Bursa Kerja	13 Mar 2022 - 13 Peb 2022	08:00 - 21:00	Zoom Meeting & Offline	\N	\N
4226	 National Accounting Competition (NAC) 2022 	Lain-lain	23 Mar 2022 - 18 Apr 2022	08:00 - 12:00	Online & Offline	\N	\N
4224	 Aarde Golven Webinar Series: Jenjang Karir dan Pengembangan Riset Bagi Geoscientist 	Lain-lain	26  - 26 Peb 2022	08:00 - 12:30	Zoom Meeting	\N	\N
4223	 Virtual Ireland Education Fair!🎉 	Seminar	20  - 20 Peb 2022	15:00 - 17:00	Zoom	\N	\N
4221	 TALKSHOW ADRENALINE 2022 	Lain-lain	26  - 26 Peb 2022	08:00 - 12:00	\N	\N	\N
4220	 📣 PERMISI.TEL-U 2022 PROUDLY PRESENT 📣  🌊 FREE WEBINAR NAVY TEL-U 2022 🌊 	Seminar	19  - 19 Peb 2022	12:30 - 15:30	VIDEO CONVERECE	\N	\N
4219	 NEXT GENERATION BROADCASTAR 2k22 	Lain-lain	10 Jan 2022 - 20 Mar 2022	08:00 - 13:00	Online	\N	\N
4218	 STOP‼️ Sex Talk Out of Prejudice 	Seminar	19  - 19 Peb 2022	09:00 - 13:00	Zoom Meeting	\N	\N
4217	 [ The Technological War Finally Begins ] 	Lain-lain	07 Peb 2022 - 28 Apr 2022	08:00 - 12:00	\N	\N	\N
4216	 ‼️𝐅𝐈𝐑𝐒𝐓 𝐍𝐀𝐓𝐈𝐎𝐍𝐀𝐋 𝐁𝐑𝐀𝐍𝐃𝐈𝐍𝐆 𝐂𝐎𝐌𝐏𝐄𝐓𝐈𝐓𝐈𝐎𝐍, 𝐖𝐎𝐑𝐊𝐒𝐇𝐎𝐏, 𝐀𝐍𝐃 𝐍𝐄𝐓𝐖𝐎𝐑𝐊𝐈𝐍𝐆‼️ 	Lain-lain	06  - 06 Mar 2022	08:00 - 12:00	Zoom Meeting & Youtube	\N	\N
4215	 The Essential Knowledge to Maximize Innovation. 🎉 	Lain-lain	19 Mar 2022 - 20 Peb 2022	08:00 - 13:00	Zoom	\N	\N
4214	 🍫🍫 Time to Share Coklat Festival 2022 🍫🍫 	Seminar	13  - 13 Peb 2022	08:30 - 11:30	Zoom Meeting	\N	\N
4213	   🔖 WEBINAR NASIONAL 🔖      Berpijak pada Motivasi                 Meraih Beasiswa         dan Prestasi 	Seminar	13  - 13 Peb 2022	08:00 - 14:00	Zoom Meeting	\N	\N
4212	 💫CHEMISTRY FAIR BORN FOR NATIONALISM💫 HIMPUNAN MAHASIWA KIMIA FAKULTAS SAINS DAN TEKNOLOGI UNIVERSITAS JAMBI 	Lain-lain	24 Jan 2022 - 13 Mar 2022	08:00 - 13:00	\N	\N	\N
4211	 The 43rd MarkPlus Goes to Campus “Entrepreneurial Marketing. 	Seminar	12  - 12 Peb 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4210	 MANAGEMENT COMPETITION IN BUSINESS CASE 2022 With Theme : “Increasing the Development of Creativity and Innovation As a Strategic Solution in Business through Digital Transformation 	Lain-lain	25 Jan 2022 - 25 Peb 2022	08:00 - 14:00	\N	\N	\N
4209	 The 42nd MarkPlus Goes to Campus Entrepreneurial Marketing 	Seminar	05  - 05 Peb 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4207	 Olimpiade Pendidikan Pancasila dan Kewarganegaraan (OLPEK) ke-VII tingkat Nasional 	Lain-lain	17  - 19 Peb 2022	00:00 - 00:00	Zoom Meeting	\N	\N
4206	 WEBINAR SERIES KEYFEST 2022 Safe Financially Smooth Career 	Seminar	05  - 19 Peb 2022	08:30 - 12:00	Via Zoom Meeting	\N	\N
4205	 [𝗕𝗨𝗦𝗜𝗡𝗘𝗦𝗦 𝗧𝗔𝗟𝗞𝗦 : 𝗛𝗢𝗪 𝗧𝗢 𝗕𝗨𝗜𝗟𝗗 𝗬𝗢𝗨𝗥 𝗢𝗪𝗡 𝗕𝗨𝗦𝗜𝗡𝗘𝗦𝗦] 	Seminar	04  - 04 Peb 2022	16:00 - 17:30	Zoom Meeting	\N	\N
4204	 [SCRIPT 2022 PROUDLY PRESENT] 	Seminar	16 Jan 2022 - 06 Peb 2022	08:00 - 11:00	Online	\N	\N
4201	 KANA KALA 	Lain-lain	05  - 05 Peb 2022	08:00 - 15:00	Museum Seni Rupa dan Keramik, Jakarta	\N	\N
4200	 COKFEST 2022 WEBINAR NASIONAL Self Improvement : Penguatan Kompetensi Diri dalam Menciptakan Goals Realistis dan Rasional 	Seminar	13  - 13 Peb 2022	08:30 - 11:00	Via Zoom Meeting	\N	\N
4199	 INVESTMENT SUMMIT PROJECT 2022 : INVESTMENT RESEARCH COMPETITION 	Lain-lain	12 Jan 2022 - 19 Peb 2022	08:00 - 17:00	Online	\N	\N
4198	 WEBINAR NASIONAL INSPECT 2022 “Pemulihan Ekonomi Pasca Pandemi: Sebagai Upaya Menarik Milenial untuk Berinvestasi 	Seminar	26  - 27 Peb 2022	13:00 - 17:00	Online	\N	\N
4196	 [ELECTRICAL AND COMPUTER COMPETITION 2022] 	Lain-lain	11 Jan 2022 - 14 Peb 2022	08:00 - 17:00	Online	\N	\N
4192	 [DOLC 2022: THE BIGGEST LAW JOB FAIR IN INDONESIA] 	Lain-lain	07  - 19 Peb 2022	08:00 - 17:00	Online	\N	\N
4191	 GANESION 2022 	Seminar	05  - 05 Peb 2022	07:30 - 13:00	Zoom Meeting	\N	\N
4189	 MA Teknologi Informasi BERLIAN   ✨ Proudly Presents ✨   ONLINE ENGLISH CONTEST 2022: Start Dreaming, Start Doing 	Lain-lain	15 Jan 2022 - 14 Mar 2022	08:00 - 12:00	Online	\N	\N
4188	 Diploma Civil Scientific Competition Proudly Present DISCO 5th 	Lain-lain	15 Jan 2022 - 19 Peb 2022	08:00 - 12:00	Online	\N	\N
4181	 WEBINAR GIZI Dampak Gadget dan Media Sosial di Era Digital terhadap Pola Makan Masa Kini 	Seminar	05  - 05 Peb 2022	13:00 - 15:00	Via Zoom Meeting	\N	\N
4177	 🏆Soegijapranata Accounting Competition 2022🏆 	Lain-lain	30 Nov 2021 - 05 Mar 2022	08:00 - 12:00	Online	\N	\N
4168	 Open Collaboration for Sponsorship 	Bursa Kerja	31 Des 2021 - 28 Peb 2022	08:00 - 17:00	Online	\N	\N
4166	 DJOANG FEST 	Expo	05  - 05 Peb 2022	15:00 - 19:30	Museum Joang 45, Menteng	\N	\N
4163	 ELECTRA 	Lain-lain	29 Jan 2022 - 06 Peb 2022	08:00 - 17:00	Online	\N	\N
4161	 SMECOMP 2022 	Lain-lain	18 Des 2021 - 14 Mar 2022	07:00 - 00:00	Via Zoom Meeting	\N	\N
4155	 [GET READY TO CHALLENGE YOURSELF] 	Lain-lain	03 Nov 2021 - 12 Mar 2022	08:00 - 17:00	Online	\N	\N
4126	 [OPEN REGISTRATION: YOUNG ENTREPRENEURS SUMMIT] 	Seminar	18 Okt 2021 - 05 Peb 2022	08:00 - 11:00	Online	\N	\N
4106	 ✨Accounting Movie Award 2021✨ 🎞NATIONAL SHORT MOVIE COMPETITION 🎞 	Lain-lain	08 Nov 2021 - 26 Peb 2022	08:00 - 17:00	Online	\N	\N
4015	 HERE’S SOMETHING BIG FOR YOU: LIGA RUANGGURU! ✨ 	Lain-lain	01 Okt 2021 - 28 Peb 2022	08:00 - 11:00	Online	\N	\N
3990	 [🌱OKTAN ITB 2022🌱] 	Lain-lain	03 Okt 2021 - 19 Peb 2022	08:00 - 11:00	Online	\N	\N
3841	 KSBA SQUARE 2021 COMPETITIONS 	Lain-lain	15 Agu 2021 - 01 Jan 1970	00:00 - 00:00	Online	\N	\N
3839	 EDUKASI PENCEGAHAN PENYEBARAN COVID 19 	Lain-lain	01  - 01 Jan 1970	00:00 - 00:00	Online	\N	\N
3371	 Webinar Creativepreneur Kewirausahaan Pertanian 	Seminar	24 Okt 2020 - 01 Jan 1970	09:00 - 00:00	Zoom Meeting	\N	\N
4203	 HR Competency Regular Class 2022 	Bursa Kerja	04  - 06 Jan 2022	08:00 - 11:00	Zoom	\N	\N
4202	 Simmons University Scholarship Info session 	Lain-lain	03  - 03 Peb 2022	19:00 - 21:00	Zoom	\N	\N
4197	 The 41st Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	29  - 29 Jan 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4195	 Inspiring Webinar Muda Berkarya Untuk UMKM Indonesia 	Seminar	26  - 26 Jan 2022	14:00 - 17:00	Zoom	\N	\N
4194	 Training Legislative UDINUS 2022 	Seminar	29  - 30 Jan 2022	07:30 - 13:40	Zoom Meeting	\N	\N
4193	 The 40th  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	22  - 22 Jan 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4190	 [P2M FOSMAKU UPI 2022] 	Lain-lain	18  - 22 Jan 2022	08:00 - 17:00	Desa Jalatrang, Kecamatan Cilebak	\N	\N
4187	 webinar Pirion Show Vol. 5 	Seminar	20  - 20 Jan 2022	19:00 - 20:30	Zoom Meeting	\N	\N
3913	 [PARADIGM 2021: Pre-Event 3] 	Seminar	02  - 02 Okt 2021	10:00 - 12:00	Zoom	\N	\N
4186	 TEMAN ANTUSIAS PROUDLY PRESENT🤩A FREE GRANDWEBINAR ABOUT ✨PASSION✨! 	Seminar	22  - 22 Jan 2022	10:00 - 12:00	Zoom Meeting	\N	\N
4185	 Beauty Class and Fashion Show with Wardah 	Seminar	29  - 29 Jan 2022	08:30 - 17:00	Politeknik LP3I Bandung, Jln. Pahlawan No. 59, Bandung	\N	\N
4183	 [UI FASHION WEEK'S SHOW RUNDOWN] 	Lain-lain	15  - 15 Jan 2022	13:00 - 20:00	Neo Soho	\N	\N
4182	 📣 Archivolks Event 📣 	Lain-lain	18 Okt 2021 - 13 Jan 2022	08:00 - 12:00	Online	\N	\N
4180	 [BEM FISIP UNPAS MLBB CHAMPIONSHIP] 	Lain-lain	11  - 23 Jan 2022	08:00 - 12:00	Online	\N	\N
4179	 ✨MAIN EVENT ASEAN TRIBUTE CULTURE✨ 	Lain-lain	15  - 15 Jan 2022	13:00 - 16:00	Youtube channel Atribute Culture	\N	\N
4178	 AwareSetter.id 	Seminar	14  - 14 Jan 2022	14:00 - 15:30	Zoom Meeting	\N	\N
4175	 “Metta Day XXVII” 	Donasi	15  - 23 Jan 2022	08:00 - 23:55	Online	\N	\N
4174	 KARANGANYAR THRIFT DAY #1 	Lain-lain	28  - 31 Jan 2022	10:00 - 21:00	Café New Normal Karanganyar	\N	\N
4173	 TOEFL Akbar Online 	Lain-lain	29  - 30 Jan 2022	13:00 - 15:00	Online	\N	\N
4172	 The 38th  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	08  - 08 Jan 2022	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4170	 Webinar INCREASE 3.0 (Innovative and Creation of Psychopreneur in Society) 	Seminar	29  - 29 Jan 2022	12:30 - 15:00	Via Zoom Meeting	\N	\N
4169	 ✨Accounting Fair 2022✨ 	Lain-lain	23 Des 2021 - 31 Jan 2022	08:00 - 12:00	Online	\N	\N
4167	 Short Movie Competition Online Lampung 	Lain-lain	02  - 26 Jan 2022	12:00 - 12:00	Online	\N	\N
4165	 ✨[POSTER-SCIENCE RESEARCH-RIZA AMRI AZIZAH]✨ 	Lain-lain	28  - 31 Des 2021	00:00 - 23:55	Online	\N	\N
4164	 FOCUS : Finance On Discuss 	Seminar	28  - 28 Jan 2022	13:00 - 16:30	Via Zoom Meeting	\N	\N
4162	 WEBINAR Series 2 KEF22 dengan tema Know Your Worth: Pengembangan dan Optimalisasi Pemanfaatan Potensi Diri Selama Pembelajaran Jarak Jauh 	Seminar	02  - 02 Jan 2022	09:00 - 11:30	Via Zoom Meeting	\N	\N
4160	 [ PWK'21 Proudly Present: Poster Tayuban Perencana 2022 ] 	Lain-lain	19  - 21 Jan 2022	08:00 - 17:00	Zoom	\N	\N
4159	 LEOIWID 2022 [Let’s Embrace Our Introvertness World Introvert Day 2022] by Intrvrt.me 	Seminar	01  - 02 Jan 2022	11:00 - 18:00	Via Zoom Meeting	\N	\N
4158	 📣✨𝘕𝘦𝘸 𝘙𝘦𝘴𝘰𝘭𝘶𝘵𝘪𝘰𝘯 𝘉𝘦𝘵𝘵𝘦𝘳 𝘠𝘰𝘶: 𝘗𝘶𝘣𝘭𝘪𝘤 𝘚𝘱𝘦𝘢𝘬𝘪𝘯𝘨 𝘢𝘯𝘥 𝘗𝘦𝘳𝘴𝘰𝘯𝘢𝘭 𝘉𝘳𝘢𝘯𝘥𝘪𝘯𝘨 𝘚𝘦𝘴𝘴𝘪𝘰𝘯✨📣 	Seminar	05  - 05 Des 2021	14:45 - 17:00	Zoom Cloud Meetings	\N	\N
4157	 [CONSTRAIN 2022] 	Lain-lain	07 Des 2021 - 30 Jan 2022	08:00 - 17:00	Online	\N	\N
4156	 𝐊𝐨𝐦𝐩𝐞𝐭𝐢𝐬𝐢 𝐄𝐤𝐨𝐧𝐨𝐦𝐢 𝐅𝐚𝐤𝐮𝐥𝐭𝐚𝐬 𝐄𝐤𝐨𝐧𝐨𝐦𝐢 𝐝𝐚𝐧 𝐁𝐢𝐬𝐧𝐢𝐬 𝐔𝐧𝐢𝐯𝐞𝐫𝐬𝐢𝐭𝐚𝐬 𝐈𝐧𝐝𝐨𝐧𝐞𝐬𝐢𝐚 (𝐊𝐎𝐌𝐏𝐞𝐊 𝐅𝐄𝐁 𝐔𝐈) 	Lain-lain	04 Okt 2021 - 02 Jan 2022	08:00 - 17:00	Online	\N	\N
4154	 Webinar Series : SELF IMPROVEMENT 	Seminar	08 Jan 2022 - 19 Peb 2022	15:15 - 16:50	Via Zoom Meeting	\N	\N
4153	 LigaRuangguru 	Lain-lain	17 Des 2021 - 16 Jan 2022	08:00 - 17:00	Online	\N	\N
4152	 PERISAI ( Pengajian risalah insan beriman) 2022 	Seminar	09  - 09 Jan 2022	09:00 - 11:30	Zoom	\N	\N
4151	 𝗪𝗢𝗥𝗟𝗗 𝗦𝗜𝗚𝗛𝗧 𝗗𝗔𝗬 𝟮𝟬𝟮𝟭⁣⁣⁣⁣⁣⁣⁣ 	Seminar	26  - 26 Des 2021	08:00 - 13:00	Zoom	\N	\N
4150	 HIMMCOMM 13TH ANNIVERSARY  ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ Aging Through Action 💫 Embrace Your Authenticity 💫 	Pensi	21  - 21 Des 2021	19:00 - 21:00	LOKET.COM	\N	\N
4149	 The 37th  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	18  - 18 Des 2021	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4148	 HR Competency Regular Class sudah memasuki Batch 23 loh! 	Bursa Kerja	17 Des 2021 - 15 Jan 2022	08:00 - 21:00	Zoom Meeting	\N	\N
4147	 🧅BERUBAH🧅  Bersama Unggulkan Bawang Merah 	Seminar	17  - 17 Des 2021	13:30 - 15:00	Zoom Meeting	\N	\N
4146	 [SANSIRO PLAY 2021] 	Pensi	18  - 18 Des 2021	13:00 - 15:00	Pakis Yogyakarta (@pakisjogja)	\N	\N
4144	 ✨𝐆𝐞𝐧𝐁𝐈 – 𝐔𝐀𝐉 𝐅𝐞𝐬𝐭𝐢𝐯𝐚𝐥 𝟐𝟎𝟐𝟏 (𝐆𝐞𝐧𝐅𝐞𝐬𝐭)✨ 𝘚𝘵𝘢𝘳𝘵𝘦𝘳 𝘗𝘢𝘤𝘬 𝘵𝘰 𝘣𝘦 𝘢 𝘍𝘳𝘰𝘯𝘵𝘭𝘪𝘯𝘦𝘳 𝘧𝘰𝘳 𝘢 𝘉𝘦𝘵𝘵𝘦𝘳 𝘐𝘯𝘥𝘰𝘯𝘦𝘴𝘪𝘢” 	Seminar	09  - 19 Des 2021	10:30 - 16:00	Zoom Meeting	\N	\N
4143	 🧅𝐁𝐄𝐑𝐔𝐁𝐀𝐇🧅 𝐁𝐞𝐫𝐬𝐚𝐦𝐚 𝐔𝐧𝐠𝐠𝐮𝐥𝐤𝐚𝐧 𝐁𝐚𝐰𝐚𝐧𝐠 𝐌𝐞𝐫𝐚𝐡 	Seminar	17  - 17 Des 2021	13:30 - 15:00	Zoom Meeting	\N	\N
4142	 Seminar;Trainerpreneur Rahasia Menghasilkan 1 Milyar Dari Bisnis Training 	Seminar	18  - 18 Des 2021	14:00 - 16:00	Via Zoom Meeting	\N	\N
4141	 [ KARAWANG EDU FAIR 2021 ]  Know Your Limit: Penerimaan Diri dan Pengelolaan Stres dengan Menerapkan Strategi Koping di Masa Pandemi 	Seminar	19  - 19 Des 2021	09:00 - 11:30	Via Zoom Meeting	\N	\N
4140	 [LEOIWID 2022] 	Seminar	27 Nov 2021 - 02 Jan 2022	09:00 - 12:00	Online	\N	\N
4139	 Workshop HR Series When Traditional Values Meet Modern Technologies 	Seminar	16  - 16 Des 2021	14:00 - 16:00	Via Zoom Meeting	\N	\N
4138	 𝐓𝐡𝐞 𝐂𝐫𝐞𝐚𝐭𝐢𝐯𝐞 𝐏𝐫𝐨𝐜𝐞𝐬𝐬 𝐨𝐟 𝐓𝐫𝐚𝐧𝐬𝐛𝐨𝐮𝐧𝐝𝐚𝐫𝐲 𝐅𝐚𝐬𝐡𝐢𝐨𝐧 bersama 𝐉𝐚𝐬𝐨𝐧 𝐏𝐮𝐭𝐫𝐚 	Seminar	18  - 18 Des 2021	13:30 - 13:30	Online	\N	\N
4137	 BERPRESTASI LEWAT KARYA SENI?🎨 	Lain-lain	11  - 15 Des 2021	08:00 - 17:00	Online	\N	\N
4136	 The 36th  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	11  - 11 Des 2021	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4135	 📢✨Toxic Relationship: HOW TOXIC RELATIONSHIPS AFFECT YOUR PRODUCTIVITY✨📢 	Seminar	07  - 07 Jan 2022	10:00 - 12:00	Zoom Meeting	\N	\N
4134	 SEMUSIM 2021 	Seminar	19  - 19 Des 2021	08:00 - 11:00	Zoom Meeting	\N	\N
4133	 ✨IKATAN PENULIS MAHASISWA HUKUM INDONESIA PROUDLY PRESENT: WEB SEMINAR 16HAKTP IPMHI✨ 	Seminar	10  - 10 Des 2021	09:00 - 11:00	Zoom Meeting	\N	\N
4132	 COACHELA 	Seminar	11  - 11 Des 2021	13:00 - 15:00	Zoom Meeting	\N	\N
4130	 [PLEGACY LEGAL LEXICON: Meaningful Participation dan Inkonstitusionalitas Undang-Undang Cipta Kerja] 	Seminar	10  - 10 Des 2021	13:30 - 15:00	Zoom Meeting	\N	\N
4127	 Seminar Public Speaking For Personal Branding 	Seminar	16  - 16 Des 2021	09:00 - 11:30	Via Zoom Meeting	\N	\N
4125	 HRD TALKS Tips CV Kamu Dilirik HRD untuk Job Seeker 	Seminar	12  - 12 Des 2021	10:00 - 12:00	Zoom Meeting	\N	\N
4124	 ✨PENERBITAN POLIMEDIA - KAYA GEMA 3.0✨ 	Lain-lain	09  - 10 Des 2021	09:00 - 17:00	Hall Tower E Politeknik Negeri Media Kreatif	\N	\N
4123	 Seminar Nasional Economics Planning for Indonesian Creative 2021 Nationwide Fundamental future 	Seminar	11  - 11 Des 2021	09:30 - 11:30	Zoom Meeting	\N	\N
4122	 [Webinar Sustainable Movement: Membangun Bisnis Berkelanjutan dan Gaya Hidup Minimalis] 	Seminar	10  - 10 Des 2021	09:00 - 11:30	Zoom Meeting	\N	\N
4121	 [BIOTECHFAIR 2021🌏] 	Seminar	04  - 04 Des 2021	13:00 - 15:00	Zoom Meeting dan Live Youtube	\N	\N
4120	 [HARMONI DIPONEGORO 2021] 	Musik	04  - 04 Des 2021	16:00 - 18:00	UndipTV Official on Youtube	\N	\N
4119	 PPM Virtual Talent Fair (PPM VTF) 	Lain-lain	09  - 11 Des 2021	08:00 - 16:00	Kumospace & Zoom	\N	\N
4118	 Webinar Public Speaking Be A Good Speaker For Better Future 	Seminar	18  - 18 Des 2021	16:00 - 18:35	Platform zoom	\N	\N
4117	 Widyatama International Innovation & Academic Competitions (Wi-Can) 2021 	Lain-lain	05  - 16 Des 2021	08:00 - 17:00	Online	\N	\N
4116	 Webinar Mental Health : Taking Care of Burnout While Pandemic 	Seminar	11  - 11 Des 2021	08:00 - 11:00	Via Zoom Meeting	\N	\N
4115	 MenTalks: “Hustle Culture: Is over productivity good? or is it toxic?” 	Seminar	11  - 11 Des 2021	09:30 - 11:30	Via Zoom Meeting	\N	\N
4114	 Webinar Tips and Trick to be Outstanding Student 	Seminar	11  - 11 Des 2021	10:00 - 12:00	Via Zoom Meeting	\N	\N
4113	 StudentsxCEOs Jakarta Apprentice Program : LEVELING UP BY MAXIMIZING YOUR COLLEGE PLAN 	Seminar	04  - 04 Des 2021	19:00 - 20:00	@studentsxceosjkt Instagram Live	\N	\N
4112	 Webinar Beginner's FinplanBudgeting for First Timer by Oscar Christi 	Seminar	11  - 11 Des 2021	13:00 - 14:30	Zoom Meeting	\N	\N
4111	 Performing Arts Festival 2021 	Lain-lain	18  - 18 Des 2021	13:00 - 15:00	Zoom Meeting	\N	\N
4109	 Digitalpreneur : Actionable Tips and Smart Way to Grow Your Business 	Seminar	11  - 11 Des 2021	13:00 - 15:00	Zoom Meeting	\N	\N
4108	 #MercubitionVol3 	Lain-lain	01  - 04 Des 2021	08:00 - 17:00	Zoom Meeting dan Website	\N	\N
4107	 “Pastry class for fun and competition”✨ 	Lain-lain	16 Nov 2021 - 05 Des 2021	08:00 - 12:00	Online	\N	\N
4105	 ✨LAST PROJECT 2021: Action to Raise Awareness and Tackle the Climate Crisis✨ 	Lain-lain	02  - 05 Des 2021	08:00 - 17:00	Online	\N	\N
4104	 Lomba Karya Tulis Ilmiah Nasional 2021 ✨Tema : “Bisnis dan Ekonomi Indonesia Sebelum dan Sesudah Pandemi Covid-19”✨ 	Lain-lain	01 Okt 2021 - 20 Des 2021	08:00 - 17:00	Online	\N	\N
4103	 ✨Webinar Personal Branding Your Future Created By You ✨ 	Seminar	11  - 11 Des 2021	13:00 - 15:00	Zoom Meeting	\N	\N
4102	 ✨FESTIVAL KARYA 2021 ✨ 	Seminar	27  - 28 Nov 2021	08:00 - 11:00	Zoom dan Youtube	\N	\N
4100	 HERO FOR INDONESIA 2021 ✨Rise Up Against All Odds✨ 	Musik	27  - 27 Nov 2021	19:00 - 23:00	Youtube	\N	\N
4099	 OHANA 	Musik	27  - 27 Nov 2021	19:00 - 21:00	Youtube	\N	\N
4098	 [SEMINAR NASIONAL HARI GURU] 	Seminar	28  - 28 Nov 2021	08:30 - 11:00	Zoom Meeting	\N	\N
4097	 𝐀𝐫𝐜𝐡𝐚𝐞𝐨𝐥𝐨𝐠𝐲 𝐔𝐈 '𝟐𝟏 𝐏𝐫𝐨𝐮𝐝𝐥𝐲 𝐏𝐫𝐞𝐬𝐞𝐧𝐭 🪶  𝙎𝙠𝙚𝙢𝙖 𝘼𝙣𝙖𝙜𝙖𝙩𝙖: 𝙈𝙚𝙣𝙜𝙞𝙣𝙜𝙖𝙩 𝙪𝙣𝙩𝙪𝙠 𝙈𝙚𝙢𝙗𝙖𝙣𝙜𝙪𝙣! 	Seminar	23 Nov 2021 - 04 Des 2021	13:00 - 16:00	Zoom Meeting	\N	\N
4093	 📣 WEBINAR MURAL ART - ROAD TO CEO 2021 📣 	Seminar	25  - 25 Nov 2021	19:30 - 21:00	Online	\N	\N
4092	 ✨MATH REVOLUTION 2021✨ Moving Towards Society 	Lain-lain	14  - 29 Nov 2021	08:00 - 17:00	Online	\N	\N
4091	 [ WEBINAR MANAJEMEN PELAYANAN KESEHATAN👨🏽‍⚕️👩🏽‍⚕️ ] 	Seminar	05  - 05 Des 2021	08:00 - 11:00	Zoom dan Youtube	\N	\N
4090	 CREATALKS Vol. 4 	Seminar	10  - 27 Nov 2021	14:00 - 15:30	Zoom Meeting	\N	\N
4087	 🌟SEMINAR NASIONAL 2021 “INDUSTRI START-UP: PENDUKUNG EKONOMI KREATIF DI ERA DIGITAL”🌟 	Seminar	19  - 27 Nov 2021	12:50 - 15:00	Zoom	\N	\N
4086	 [⚕️WEBINAR MEDICAL HEALTH CONCERN #1 ⚕️] 	Seminar	27  - 27 Nov 2021	08:45 - 11:45	Zoom Meeting	\N	\N
4085	 [WEBINAR AGRARIA : REFORMA AGRARIA DALAM PRIORITAS KEBIJAKAN ATAS TANAH DI INDONESIA] 	Seminar	08  - 08 Des 2021	08:45 - 12:20	Zoom Meeting	\N	\N
4084	 SEMINAR NASIONAL & CALL FOR PAPER BEM-FT 2021 	Seminar	04  - 10 Des 2021	08:00 - 12:00	Auditorium Grha Tanoto Universitas Bhayangkara Jakarta Raya	\N	\N
4083	 📢 Economic Sport And Arts📢 	Lain-lain	01 Nov 2021 - 20 Des 2021	08:00 - 17:00	Online	\N	\N
4082	 [[ECONOMIC BUSINESS COMPETITION 2021]] 	Lain-lain	01 Sep 2021 - 20 Des 2021	08:00 - 15:00	Online	\N	\N
4079	 💥Grand Opening PPI Tiongkok Edu Expo 2021💥 	Expo	20  - 21 Nov 2021	10:30 - 15:10	Zoom Meeting & Youtube	\N	\N
4078	 The 33rd  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	20  - 20 Nov 2021	10:00 - 11:30	ZOOM & Youtube MarketeersTV	\N	\N
4077	 [CHARITY TOGETHER WITH DIESNATALIS FASILKOM] 	Donasi	06  - 20 Nov 2021	07:00 - 23:00	Online	\N	\N
4076	 🔥LAST SALE CHARITY CONCERT & WEBINAR PSYCHOLAND 2021🔥 	Lain-lain	16  - 26 Nov 2021	08:00 - 17:00	Online	\N	\N
4074	 ☄️ Closing Ceremony Farmasi Cup 2021 ☄️ 	Musik	19  - 19 Nov 2021	19:00 - 21:00	Youtube	\N	\N
4073	 SEMINAR NASIONAL 	Seminar	21  - 21 Nov 2021	08:00 - 11:00	Zoom Meeting	\N	\N
4072	 IMAGO VI 	Lain-lain	15  - 20 Nov 2021	08:00 - 17:00	Zoom	\N	\N
4071	 Elins Esport Competition and Expo atau EECO 	Lain-lain	10  - 28 Nov 2021	09:00 - 17:00	Online	\N	\N
4069	 HIMAGUSEDA PROUDLY PRESENT ✨WEBINAR NASIONAL 2021✨ 	Seminar	21  - 21 Nov 2021	08:00 - 13:00	Zoom Meeting	\N	\N
4068	 [FREE INFO SESSION] NATIONAL UNIVERSITY OF SINGAPORE  #1 in Asia #11 Global 	Lain-lain	17  - 17 Nov 2021	19:30 - 20:00	Online	\N	\N
4067	 💫Public Poster Competition TBM Goes To School (GTS) 2021💫 	Lain-lain	20 Okt 2021 - 19 Nov 2021	08:00 - 16:00	Online	\N	\N
4066	 Seminar Upgrade Your Personality 	Seminar	27  - 27 Nov 2021	12:30 - 15:00	Alana Hotel Yogyakarta	\N	\N
4065	 ✨Webinar dan Workshop “IT CLASS 2021: Creativity Knows No Limit”✨ dengan topik “Mobile Videography for Educational Video” 	Seminar	20  - 20 Nov 2021	08:30 - 14:00	Zoom Meeting	\N	\N
4064	 Lembaga Eksekutif Mahasiswa FMIPA UII   📍Proudly present📍     📢 Ineffable Competition of Science 2021 📢 	Lain-lain	21 Okt 2021 - 19 Nov 2021	09:00 - 17:00	Online	\N	\N
4063	 “How to Exercise Your Body & Mind” 	Seminar	20  - 20 Nov 2021	16:00 - 20:00	Zoom	\N	\N
4062	 Program Persiapan Kerja dari @karier.mu! 	Lain-lain	01  - 17 Nov 2021	08:00 - 16:00	Online	\N	\N
4061	 Berkolaborasi dengan Novia Bachmid 	Musik	20  - 20 Nov 2021	19:00 - 23:00	Youtube	\N	\N
4060	 HIMPUNAN MAHASISWA TEKNIK INFORMATIKA (HIMTI) UNIVERSITAS BUDI LUHUR. 💥PROUDLY PRESENT!!!💥 	Seminar	22  - 26 Nov 2021	09:00 - 15:00	Zoom	\N	\N
3911	 ✨THE 8TH PPM ACCOUNTING COMPETITION✨ 	Lain-lain	06  - 13 Nov 2021	07:00 - 11:00	Online	\N	\N
4059	 ✨ Proudly Present✨ ‼️FESTIVAL BUDAYA 2021‼️ 	Lain-lain	17  - 25 Nov 2021	08:00 - 15:00	Online	\N	\N
4058	 [ WEBINAR DAN TALKSHOW FORTEX 4.0 ] 	Seminar	20  - 20 Nov 2021	08:30 - 15:00	Zoom Meeting	\N	\N
4056	 ✨HIMAZI UNTIRTA✨Proudly Presents📢 🦋Sultan Nutrition Fest (SNF 2021)🦋 	Lain-lain	08 Okt 2021 - 15 Nov 2021	08:00 - 17:00	Online	\N	\N
4054	 WORTHIEST SEMINAR IN 2021‼️✨ “𝐓𝐡𝐞 𝐂𝐨𝐧𝐪𝐮𝐞𝐫𝐞𝐫: 𝐀𝐧𝐬𝐰𝐞𝐫 𝐭𝐨 𝐒𝐮𝐫𝐯𝐢𝐯𝐚𝐥” 	Seminar	18  - 18 Nov 2021	19:00 - 21:00	Zoom	\N	\N
4053	 💫ASSOCIATION OF ECONOMIC EDUCATION STUDENT💫 [ASSETS 2021]🎓 	Seminar	14  - 14 Nov 2021	08:00 - 11:00	Zoom Meeting	\N	\N
4052	 UI Battlegrounds 2021 	Sport	08 Nov 2021 - 12 Des 2021	08:00 - 15:00	Online	\N	\N
4051	 The Bridge Conference 2021 - RUN For a Sustainable Future 	Seminar	13  - 13 Nov 2021	09:00 - 17:00	Zoom Meeting	\N	\N
4050	 [ School of Business 2021 ] 	Seminar	20  - 20 Nov 2021	12:00 - 15:00	Zoom Meeting	\N	\N
4049	 Geographic National Society Summit (GNSS) 	Seminar	30 Okt 2021 - 27 Nov 2021	09:00 - 13:00	Online	\N	\N
4047	 [STEREO: Sound of Travel to 90's  Radio] 	Musik	13  - 13 Nov 2021	19:15 - 21:00	Youtube	\N	\N
4046	 “Löst in Åncieñt Grėėcė” 	Musik	13  - 13 Nov 2021	09:00 - 12:00	InspiraHub	\N	\N
4045	 ✨Webinar DEVELOP YOURSELF: OPTIMALISASI CV✨ 	Seminar	18  - 18 Des 2021	09:30 - 11:00	Online	\N	\N
4044	 “SHOW ME YOUR TONE” 	Musik	12  - 12 Nov 2021	19:00 - 21:00	Youtube	\N	\N
4043	 🚀 [PADJADJARAN OPEN 2021] 🚀 	Lain-lain	27 Okt 2021 - 30 Nov 2021	08:00 - 11:00	Online	\N	\N
4041	 WEBINAR NASIONAL 🖊️ How To Improve Your Skill To Be a Good Speaker. ~ Dare to Speak, Dare to Action ~ 	Seminar	13  - 13 Nov 2021	09:00 - 11:00	Zoom Meeting	\N	\N
4040	 Neospace Movie Parody Competition 	Lain-lain	08 Okt 2021 - 12 Nov 2021	08:00 - 11:00	Online	\N	\N
4039	 📣✨ INFORMATIONALL 2021 ✨📣 	Lain-lain	01  - 28 Nov 2021	08:00 - 11:00	Online	\N	\N
4038	 Talkshow Muda Berdaya Series #4 	Seminar	10  - 10 Nov 2021	19:00 - 21:00	Online	\N	\N
4036	 ✨SOIL VETERAN COMPETITION 2021✨ 	Lain-lain	20 Okt 2021 - 10 Nov 2021	08:00 - 11:00	Online	\N	\N
4035	 Business VS The Nonconformities: Persevering Business amidst Dynamic Market Shift 	Seminar	13  - 14 Nov 2021	11:30 - 16:40	Zoom dan Youtube	\N	\N
4032	 Influencing People through Digital Marketing in the Distruptive Technology Era 	Seminar	05  - 07 Nov 2021	12:00 - 15:30	Zoom Meeting	\N	\N
4031	 Kursus Bahasa Inggris Online Lengkap dan Murah HEY ENGLISH SPEAKING FOR DIALY COMMUNICATION 	Lain-lain	07 Nov 2021 - 10 Des 2021	19:30 - 21:30	Online	\N	\N
4030	 Kursus Bahasa Inggris Online Lengkap dan Murah HEY ENGLISH IELTS PREPARATION CLASS 	Lain-lain	13 Nov 2021 - 05 Des 2021	09:00 - 10:30	Online	\N	\N
4029	 Kursus Bahasa Inggris Online Lengkap dan Murah HEY ENGLISH TOEFL ITP COMPLETE SKILLS 	Lain-lain	15 Nov 2021 - 10 Des 2021	19:30 - 21:30	Online	\N	\N
4027	 💫 TRAINER MUDA TICMI💫 	Seminar	07  - 07 Nov 2021	09:00 - 11:00	Zoom	\N	\N
4025	 National Seminar Invest Your Income, Ensure Your Future 	Seminar	20  - 20 Nov 2021	13:00 - 17:00	Online	\N	\N
4024	 SUSTAINABILITY TRADE-OFF: THE LOCAL’S PERSPECTIVE 	Seminar	06  - 06 Nov 2021	10:00 - 14:30	Zoom Meeting	\N	\N
4023	 [WEBINAR NASIONAL ACTIVATION 2021]✨ 	Seminar	06  - 06 Nov 2021	08:30 - 11:00	Zoom Meeting	\N	\N
4021	 [🌱OKTAN ITB 2022🌱] 	Lain-lain	03 Okt 2021 - 06 Nov 2021	08:00 - 11:00	Online	\N	\N
4020	 🎪FSM MUSIC FESTIVAL 2021🎪 	Musik	06  - 06 Nov 2021	09:00 - 12:00	Youtube FSM Music Festival	\N	\N
4019	 Driving Sustainable Growth with Collaboration and Adaptability” 	Seminar	04  - 04 Nov 2021	13:00 - 15:00	Online	\N	\N
4018	 [WEBINAR ACT FOR AIDS 2021] 	Seminar	06  - 06 Nov 2021	09:20 - 11:00	Zoom Meeting	\N	\N
4017	 PREPARATION TO THE BONE OF DIGITALIZATION WORLD 	Seminar	13 Okt 2021 - 05 Nov 2021	09:00 - 18:00	Zoom	\N	\N
4016	 [MATHTALKS: PREPARE YOURSELF FOR YOUR BRIGHT FUTURE] 	Lain-lain	13  - 13 Nov 2021	08:30 - 12:00	Zoom Meeting	\N	\N
4014	 ✨CREATION✨ 	Lain-lain	28 Okt 2021 - 10 Nov 2021	08:00 - 13:00	Online	\N	\N
4013	 [ PENGABDIAN MASYARAKAT 2021 ] 	Donasi	28 Okt 2021 - 15 Nov 2021	08:00 - 22:00	Online	\N	\N
4012	 [💊 𝐏𝐡𝐚𝐫𝐦𝐚𝐧𝐨𝐯𝐚 𝐈𝐓𝐁 𝟐𝟎𝟐𝟐 💊] 	Lain-lain	04 Okt 2021 - 27 Nov 2021	08:00 - 11:00	Online	\N	\N
4010	 [Webinar EXCITE 2021] 	Seminar	30  - 30 Okt 2021	09:00 - 13:30	Zoom	\N	\N
4009	 DIES NATALIS HIMAMETA Ke-35 	Lain-lain	16  - 30 Okt 2021	08:00 - 10:00	Online	\N	\N
4008	 [Transformers 9.0: Extended Late Registration] 	Seminar	06  - 07 Nov 2021	08:00 - 11:00	Zoom Meeting	\N	\N
4007	 [ISO TRAINING 2 BEM IM FKM UI 2021]⁣⁣ 	Seminar	30  - 31 Okt 2021	09:00 - 15:00	Zoom Meeting	\N	\N
4006	 [OPEN REGISTRATION DENTISTRY QURANIC COMPETITION 2021] 	Lain-lain	18 Okt 2021 - 02 Nov 2021	08:00 - 11:00	Online	\N	\N
4004	 [BUSINESS EVENT COMPETITION] 	Lain-lain	01  - 30 Okt 2021	08:00 - 11:00	Online	\N	\N
4003	 [OPEN REGISTRATION TALKSHOW RHC UI 2021] 	Seminar	30  - 30 Okt 2021	13:00 - 15:00	Zoom Meeting	\N	\N
4002	 [WEBINAR ACE ART : A RESTFUL THERAPY] 	Seminar	30  - 30 Okt 2021	08:30 - 11:00	Zoom Meeting	\N	\N
4001	 HR Competency Regular Class 	Lain-lain	05  - 07 Nov 2021	08:00 - 11:00	Zoom	\N	\N
3999	 🎥FESTIVAL DOKUMENTER BUDI LUHUR 2021 TELAH DIBUKA!🎥 	Lain-lain	26 Okt 2021 - 03 Des 2021	08:00 - 11:00	Online	\N	\N
3997	 PADJADJARAN ACCOUNTING WEEK 2021]  CALLING OUT ALL ACCOUNTING AND BUSINESS ENTHUSIASTS 	Seminar	01  - 01 Nov 2021	08:40 - 13:55	Zoom	\N	\N
3996	 SEMINAR NASIONAL K3 BEM FT UNTIDAR 2021  Mewujudkan Zero Accident dengan Sistem Manajemen Resiko yang Baik 	Seminar	30  - 30 Okt 2021	09:00 - 11:00	Zoom	\N	\N
3995	 📢SAYEMBARA CAMPURSARI BAGASKARA HAPSARI📢 	Lain-lain	26  - 26 Okt 2021	08:00 - 11:00	Online	\N	\N
3994	 BYOB: Be Your Own Boss 	Lain-lain	31  - 31 Okt 2021	13:00 - 15:00	Zoom	\N	\N
3993	 [TONE UP YOUR OCTOBER WITH HAPPINESS] 	Seminar	30  - 30 Okt 2021	18:00 - 22:00	Youtube	\N	\N
3992	 RISE WITH INARA 	Lain-lain	25  - 25 Okt 2021	17:00 - 20:00	Zoom	\N	\N
3991	 The 29th  Marketeers Goes to Campus 	Seminar	23  - 23 Okt 2021	10:00 - 11:30	Zoom Meeting	\N	\N
3989	 💰 [WEBINAR : BUSINESS R&D 101] 💰 	Seminar	30  - 30 Okt 2021	09:00 - 11:00	Zoom Meeting	\N	\N
3988	 HIMATIKA PERBANAS proudly present: 💫✨ TECHNOWADAYS  2021 💫✨ 	Seminar	23  - 23 Okt 2021	07:30 - 11:00	Zoom	\N	\N
3987	 Talkshow InTips Karier Vol. 4 Mendobrak Stereotip Gender di Dunia Kerja 	Seminar	22  - 22 Okt 2021	19:00 - 21:00	Zoom	\N	\N
3986	 THE 5TH NEMO FEM IPB PROUDLY PRESENT 	Seminar	24  - 24 Okt 2021	08:00 - 11:00	Zoom Meeting	\N	\N
3985	 “Expand Your Taste Buds Through Local Food” 	Lain-lain	14 Okt 2021 - 05 Nov 2021	08:00 - 11:00	Online	\N	\N
3983	 ✨[WEBINAR UASTEC 2021]✨ 	Seminar	22  - 22 Okt 2021	13:00 - 15:00	Zoom Meeting	\N	\N
3982	 [ ULTIGRAPH 2021 : KARA ANAGATA IS HERE ] 	Seminar	23 Okt 2021 - 01 Nov 2021	10:00 - 17:00	Zoom Meeting	\N	\N
3981	 🛸𝗦𝗖𝗜𝗘𝗡𝗖𝗘𝗦𝗢𝗠𝗡𝗜𝗔 𝗙𝗘𝗦𝗧𝗜𝗩𝗔𝗟 𝟮𝟬𝟮𝟭🛸 𝗗𝗥𝗘𝗔𝗠𝗪𝗢𝗥𝗟𝗗 : 𝗗𝗲𝗹𝘂𝘀𝗶𝗼𝗻𝗮𝗹 𝗥𝗲𝗮𝗹𝗺 𝗼𝗳 𝗪𝗼𝗻𝗱𝗲𝗿𝗹𝗮𝗻𝗱 	Lain-lain	19 Sep 2021 - 10 Des 2021	08:00 - 11:00	Online	\N	\N
3980	 Kelas Kesehatan Sexsual Pada Remaja 	Seminar	24  - 24 Okt 2021	13:00 - 15:00	Zoom Meeting	\N	\N
3979	 Enterprise Resource Planning Competition 	Lain-lain	20 Okt 2021 - 14 Nov 2021	08:00 - 11:00	Zoom Meeting	\N	\N
3978	 [SEKOLAH LEGISLATIF UGM 2021] dengan tema “Membentuk Karakter Calon Legislator yang Membela Rakyat” 	Seminar	23  - 30 Okt 2021	09:30 - 14:15	Online	\N	\N
3977	 How Education Supports Industry in Pandemic Multidimensional Disruption 	Seminar	21  - 21 Okt 2021	10:00 - 12:00	Online	\N	\N
3976	 [FREE-TRIAL KULIAH DI FASILKOM UI?!!!] 	Lain-lain	02 Okt 2021 - 30 Nov 2021	08:00 - 11:00	Online	\N	\N
3975	 📢 DEPARTEMEN EKONOMI KREATIF DEMA-F PSIKOLOGI UIN JAKARTA📢 	Seminar	22  - 22 Okt 2021	13:00 - 17:00	Zoom	\N	\N
3974	 HR Competency Regular Class 	Bursa Kerja	18 Okt 2021 - 07 Nov 2021	08:00 - 21:00	Zoom	\N	\N
3973	 [MAIN POSTER UABT GREAT EVENT 2021] 	Lain-lain	23  - 23 Okt 2021	13:00 - 15:00	Zoom	\N	\N
3972	 ❗Lomba Debat Nasional Psycholand❗ 	Lain-lain	18 Sep 2021 - 28 Nov 2021	08:00 - 11:00	Online	\N	\N
3971	 [PUBLIC HEALTH FESTIVAL 2021 x Dies Natalis FKM Unmul] 	Lain-lain	01  - 24 Okt 2021	08:00 - 11:00	Online	\N	\N
3970	 🗺SEMINAR NASIONAL AKUNTANSI 2021🗺 	Seminar	23  - 23 Okt 2021	09:15 - 11:00	Zoom & Live YouTube HMAk Unikom	\N	\N
3969	 ✨CLUB K Competition✨ 	Lain-lain	01  - 28 Okt 2021	08:00 - 12:00	Online	\N	\N
3968	 🥇SMATCO 2021’s NATIONAL WEBINAR & ENGLISH ESSAY COMPETITION FOR SCHOOL AND COLLEGE STUDENTS 🥇 	Lain-lain	13 Sep 2021 - 31 Okt 2021	08:00 - 11:00	Online	\N	\N
3967	 [Kenali Dirimu Bersama Menggapai Asa] 	Seminar	17  - 17 Okt 2021	09:00 - 11:00	Zoom Meeting	\N	\N
3966	 [ PELATIHAN & SERTIFIKASI AHLI K3 MUDA ] 	Lain-lain	30 Okt 2021 - 13 Nov 2021	08:00 - 11:00	Zoom Meeting	\N	\N
3965	 [PREPARE YOUR CAREER, BUILD YOUR FUTURE] 	Seminar	25 Sep 2021 - 16 Okt 2021	09:00 - 11:00	Online	\N	\N
3964	 ✨ MAPALA UNAND MOUNTAIN RUNNING COMPETITION ✨ 	Lain-lain	16 Agu 2021 - 31 Okt 2021	06:00 - 15:00	Gunung Talang Via Arosuka Kab.Solok, Sumatera Barat	\N	\N
3963	 [INTEREST AND TALENT FESTIVAL  2021] 	Lain-lain	10  - 17 Okt 2021	07:00 - 11:00	Online	\N	\N
3960	 🎉 [GEBYAR BULAN BAHASA DAN SASTRA INDONESIA] 🎉 	Lain-lain	24 Agu 2021 - 25 Okt 2021	07:00 - 11:00	Online	\N	\N
3959	 🚨Webinar Bedah Beasiswa🚨  Raih Masa Depanmu dengan Beasiswa Impian  	Seminar	23  - 23 Okt 2021	13:00 - 16:00	Zoom	\N	\N
3958	 [TUNAS WORKSHOP EXTENDED] 	Seminar	12 Okt 2021 - 06 Nov 2021	10:00 - 14:30	Online	\N	\N
3957	 ⚠️ OPEN REGISTRATION VIRTUAL RUN ⚠️ 	Sport	01  - 13 Okt 2021	06:00 - 11:00	Online	\N	\N
3956	 [RAPMAFEST#8] 	Lain-lain	23  - 23 Okt 2021	08:30 - 11:00	Zoom	\N	\N
3955	 ⚓💫𝐒𝐎𝐔𝐋 𝐎𝐅 𝐍𝐀𝐓𝐈𝐎𝐍 𝟐𝟎𝟐𝟏💫⚓ 	Lain-lain	04 Okt 2021 - 02 Nov 2021	08:00 - 11:00	Online	\N	\N
3954	 ❄ Manawa Festival ❄ 	Lain-lain	11  - 24 Okt 2021	08:00 - 11:00	Youtube, Instagram, TikTok, Zoom	\N	\N
3953	 🔥[WEBINAR & DOORPRIZE] 	Seminar	15  - 15 Okt 2021	14:30 - 16:00	Zoom	\N	\N
3950	 [OPEN REGISTRATION SEMINAR NASIONAL YYSF'21] Halo Sobat generasi muda Indonesia! 	Seminar	16  - 17 Okt 2021	07:30 - 10:00	Online	\N	\N
3949	 The 27th  Marketeers Goes to Campus 	Seminar	09  - 09 Okt 2021	10:00 - 11:30	Zoom & Youtube	\N	\N
3948	 🗣️TALKSHOW: MEMBANGUN KEAMANAN INFORMASI DAN MANAJEMEN PRIVASI DI ERA DIGITAL. 	Seminar	11  - 11 Okt 2021	09:00 - 11:30	Zoom	\N	\N
3947	 ✨[OPEN REGISTRATION MARKETING PLAN COMPETITION 2021]✨ 	Lain-lain	09 Agu 2021 - 06 Nov 2021	07:00 - 11:00	Online	\N	\N
3946	 EDUCATIONAL COMPETITION 2021 	Lain-lain	19 Sep 2021 - 09 Okt 2021	08:00 - 11:30	Online	\N	\N
3945	 Medical English Competition 	Lain-lain	30  - 31 Okt 2021	08:00 - 12:00	Online	\N	\N
3944	 WEBINAR ELECTRICAL ENGINEERING EXPO 2021 	Seminar	09  - 09 Okt 2021	13:00 - 16:50	Zoom	\N	\N
3942	 REVIVE 	Seminar	16  - 16 Okt 2021	17:00 - 00:00	Online	\N	\N
3941	 Korean Festival 	Seminar	09  - 09 Okt 2021	08:00 - 11:30	Online	\N	\N
3940	 COPS 2021 	Seminar	09  - 09 Okt 2021	08:00 - 11:30	Zoom	\N	\N
3939	 ACCOUNTING COMPETITION 	Expo	06  - 13 Nov 2021	08:00 - 10:00	Online	\N	\N
3938	 WEBINAR Dunia Kerja 	Seminar	11  - 12 Okt 2021	10:00 - 12:00	Zoom	\N	\N
3937	 [ISO TRAINING 2 BEM IM FKM UI 2021]⁣ 	Seminar	01  - 31 Okt 2021	09:00 - 15:00	Zoom	\N	\N
3936	 [LOMBA POSTER DIGITAL HISTORIA 2021 PROUDLY PRESENT] 	Lain-lain	13 Sep 2021 - 23 Okt 2021	08:00 - 11:00	Online	\N	\N
3935	 CALL for PAPER SNITT 4th 2021 University [Politeknik Negeri Balikpapan] 	Seminar	10 Okt 2021 - 16 Nov 2021	08:00 - 11:00	Zoom	\N	\N
3934	 WEBINAR NASIONAL KILAS PERINTIS #35 	Seminar	16  - 16 Okt 2021	10:00 - 12:00	Online	\N	\N
3933	 EoS x Englishvit TOEFL 	Seminar	23 Agu 2021 - 24 Okt 2021	08:00 - 11:00	Online	\N	\N
3930	 PERTOLONGAN PERTAMA PADA KEGAWATAN JANTUNG 	Seminar	08 Nov 2021 - 08 Okt 2021	12:00 - 14:00	Zoom	\N	\N
3928	 [OPEN REGISTRATION STATISTICS TEAM COMPETITION LOGIKA UI 2022] 	Lain-lain	18 Sep 2021 - 16 Okt 2021	07:00 - 17:00	Online	\N	\N
3925	 [OPEN DONASI SRAWUNG DESA 2021] 	Donasi	10 Sep 2021 - 31 Okt 2021	07:00 - 22:00	Online	\N	\N
3924	 [WIN A TOTAL PRIZE OF MORE THAN IDR 69,000,000] 	Lain-lain	19 Sep 2021 - 07 Nov 2021	08:00 - 11:00	Online	\N	\N
3922	 [IKM GOES TO SCHOOL 2021] 	Lain-lain	03  - 03 Okt 2021	13:00 - 15:00	Zoom	\N	\N
3921	 ✨[CLOSING CEREMONY OMVI 2021]✨ 	Lain-lain	03  - 03 Okt 2021	12:30 - 17:30	Zoom	\N	\N
3920	 WEBINAR BATIK NASIONAL Eksistensi Batik di Kalangan Remaja Indonesia 	Seminar	02  - 02 Okt 2021	14:00 - 17:00	Zoom	\N	\N
3919	 [Webinar Go Scholarship 2021] 	Seminar	02  - 02 Okt 2021	09:00 - 11:00	Zoom	\N	\N
3918	 [GRAND SEMINAR IESC 2021] 	Seminar	03  - 03 Okt 2021	09:00 - 15:00	Zoom	\N	\N
3916	 KAHF ACADEMY: CREATIVE MARKETING IN DIGITAL ERA 4.0 	Seminar	02  - 02 Okt 2021	15:00 - 17:00	Zoom	\N	\N
3915	 The 26th  Marketeers Goes to Campus 	Seminar	02  - 02 Okt 2021	10:00 - 11:30	Zoom	\N	\N
3914	 📣DIGICASH PENSI FEST 2021📣 	Lain-lain	17 Sep 2021 - 24 Okt 2021	07:00 - 15:00	Online	\N	\N
3910	 ☄️IDEATALKS 2021 IS COMING☄️ 	Seminar	02  - 02 Okt 2021	10:00 - 14:00	Zoom	\N	\N
3908	 ------------STAR FEST-------------  ✨Cover Song Competition✨ 	Lain-lain	01  - 30 Sep 2021	07:00 - 17:00	Online	\N	\N
3907	 [PARAHYANGAN MARKETIVE 2021 X BLU BY BCA DIGITAL WEBINAR] 	Seminar	02  - 02 Okt 2021	09:00 - 12:00	Zoom	\N	\N
3906	 [CHILLTALKS INTECH FEST 2021] 	Seminar	03  - 03 Okt 2021	09:00 - 11:00	Zoom	\N	\N
3905	 🔔𝗟𝗜𝗡𝗚𝗨𝗔 𝗙𝗘𝗦𝗧 𝟮𝟬𝟮𝟭🔔 The New New Normal: 𝘍𝘢𝘯𝘵𝘢𝘴𝘵𝘪𝘤 𝘍𝘶𝘵𝘶𝘳𝘦 𝘸𝘪𝘵𝘩 𝘍𝘶𝘵𝘶𝘳𝘪𝘴𝘵𝘪𝘤 𝘞𝘪𝘴𝘩𝘦𝘴 	Seminar	02 Okt 2021 - 02 Sep 2021	08:15 - 10:45	Zoom	\N	\N
3903	 [𝐎𝐏𝐄𝐍 𝐑𝐄𝐆𝐈𝐒𝐓𝐑𝐀𝐓𝐈𝐎𝐍 𝐎𝐅 𝐎𝐔𝐑 𝐂𝐎𝐌𝐏𝐄𝐓𝐈𝐓𝐈𝐎𝐍 𝐀𝐓 𝐏𝐄𝐒𝐓𝐀 𝐑𝐀𝐊𝐘𝐀𝐓 𝟐𝟎𝟐𝟏] 	Lain-lain	10 Sep 2021 - 25 Okt 2021	08:00 - 12:00	Online	\N	\N
3901	 SEMINAR IT 	Seminar	26  - 26 Sep 2021	08:30 - 11:30	Zoom	\N	\N
3900	 BIRTHDAY MINI CONCERT Kilau: Rekah Fajar Lantunan Asa Sehangat Mentari 	Lain-lain	25  - 25 Sep 2021	19:00 - 21:00	Youtube	\N	\N
3899	 Pengabdian Masyarakat untuk Desa (PEMUDA) “Muda Berdedikasi, Muda Menginspirasi” 	Lain-lain	25  - 25 Sep 2021	08:00 - 12:00	Kampung Pelangi 200	\N	\N
3898	 The 25th  Marketeers Goes to Campus “Entrepreneurial Marketing 	Seminar	25  - 25 Sep 2021	10:00 - 11:30	Zoom dan Youtube MarketeersTV	\N	\N
3897	 Financial Planning 	Seminar	02  - 02 Okt 2021	09:30 - 14:00	Zoom	\N	\N
3895	 𝑺𝒄𝒉𝒐𝒐𝒍 𝒐𝒇 𝑲𝒂𝒔𝒕𝒓𝒂𝒕 2021 𝑴𝒊𝒍𝒍𝒆𝒏𝒏𝒊𝒂𝒍𝒔 𝑻𝒂𝒍𝒌 🗣 	Seminar	20 Sep 2021 - 03 Okt 2021	08:30 - 11:30	Online	\N	\N
3894	 🌹🇺🇦 MUDA BESOLIDARITAS X PMII KOMFAPSI 🇺🇦🌹 	Seminar	19  - 19 Sep 2021	13:00 - 15:00	Zoom	\N	\N
3893	 CALL for PAPER SNITT 4th 2021 University [Politeknik Negeri Balikpapan 	Seminar	10 Okt 2021 - 06 Nov 2021	08:00 - 12:00	Zoom	\N	\N
3892	 OPEN REGISTRATION & DONATION BFM FKG UB 2021 	Seminar	25  - 25 Sep 2021	08:35 - 11:00	Zoom	\N	\N
3891	 LOMBA DESAIN POSTER 2021 	Lain-lain	15 Sep 2021 - 02 Okt 2021	08:00 - 12:00	Online	\N	\N
3890	 Soundquriang 8: Reminiscence of Nusantara 	Donasi	25  - 25 Sep 2021	16:00 - 19:00	Youtube	\N	\N
3889	 Univet Job Fair Virtual  2021 	Bursa Kerja	13  - 14 Okt 2021	09:00 - 15:00	Online	\N	\N
3888	 USB Job Fair Virtual  2021 	Bursa Kerja	06  - 07 Okt 2021	09:00 - 15:00	Online	\N	\N
3887	 Malam Keakraban Manajemen (MAKMA) 2020  MECHTOPIA 	Lain-lain	25  - 26 Sep 2021	16:00 - 12:00	\N	\N	\N
3886	 Turnamen Sains Data Nasional 2021 	Lain-lain	10  - 23 Sep 2021	00:00 - 00:00	\N	\N	\N
3885	 🎉✨PESTA KARYA UMKT 2021✨🎉             Rise From Pandemic  	Lain-lain	14 Sep 2021 - 04 Okt 2021	09:00 - 12:00	\N	\N	\N
3884	 EXPO BISNIS DIGITAL 2021 	Expo	16 Agu 2021 - 28 Okt 2021	09:00 - 12:00	\N	\N	\N
3882	 LOMBA INOVASI TEKNOLOGI LINGKUNGAN 	Lain-lain	01 Sep 2021 - 31 Okt 2021	09:00 - 13:00	\N	\N	\N
3881	 TURNAMEN SAINS DATA NASIONAL 2021 	Lain-lain	10  - 23 Sep 2021	00:00 - 00:00	\N	\N	\N
3880	 CIVIL INNOVATION FEST 2021 	Lain-lain	01 Sep 2021 - 18 Nov 2021	00:00 - 00:00	\N	\N	\N
3879	 SUPERCONTINENTGAIA2021 	Seminar	20  - 20 Sep 2021	09:00 - 12:00	Zoom	\N	\N
3878	 5TH ADMINISTRATION FESTIVAL WEBINAR 	Seminar	18  - 18 Sep 2021	12:45 - 15:05	Zoom	\N	\N
3877	 [PEKAN ILMIAH FISIKA HADIR KEMBALI] 	Lain-lain	14  - 18 Sep 2021	00:00 - 00:00	\N	\N	\N
3876	 TURNAMEN SAINS DATA NASIONAL 2021 	Lain-lain	10  - 23 Sep 2021	09:00 - 12:00	\N	\N	\N
3875	 Indonesian Business Carnival 2021 	Seminar	25  - 26 Sep 2021	15:00 - 20:50	\N	\N	\N
3874	 NATIONAL SEMINAR IT TODAY 2021 	Seminar	18  - 18 Sep 2021	13:00 - 16:00	IPB	\N	\N
3873	 READY TO FACE THE FUTURE 1.O 	Seminar	17  - 19 Sep 2021	19:30 - 21:00	\N	\N	\N
3872	 Malam Keakraban Manajemen (MAKMA) 2020 	Lain-lain	25  - 26 Sep 2021	16:00 - 12:00	\N	\N	\N
3871	 SP Jain Career Readiness Series 	Bursa Kerja	18  - 18 Sep 2021	11:00 - 14:00	DKI Jakarta	\N	\N
3870	 WEBINAR NASIONAL KESEHATAN 2021 	Seminar	02  - 02 Sep 2021	08:45 - 12:45	z	\N	\N
3869	 [HMJ PAI UIN WALISONGO PROUDLY PRESENT] 	Lain-lain	03  - 30 Sep 2021	10:00 - 16:00	online	\N	\N
3868	 𝐋𝐈𝐒𝐓𝐑𝐀 𝐔𝐍𝐏𝐀𝐑 𝐩𝐫𝐨𝐮𝐝𝐥𝐲 𝐩𝐫𝐞𝐬𝐞𝐧𝐭 𝐅𝐞𝐬𝐭𝐢𝐯𝐚𝐥 𝐓𝐫𝐚𝐝𝐢𝐬𝐢𝐨𝐧𝐚𝐥 𝟐𝟎𝟐𝟏 🎉 	Sport	15 Agu 2021 - 15 Sep 2021	08:00 - 16:00	online	\N	\N
3867	 [ OPEN HOUSE FF UI VOL.II ] 	Seminar	09  - 30 Sep 2021	00:00 - 00:00	online	\N	\N
3866	 WEBINAR BUDIDAYA MAGGOT BSF 	Seminar	25  - 25 Sep 2021	09:00 - 11:00	zoom meeting	\N	\N
3865	 [DIPORANSA] 	Lain-lain	02  - 02 Okt 2021	19:30 - 21:25	online	\N	\N
3864	 HR Competency Regular Class 2021 	Seminar	16  - 17 Sep 2021	08:00 - 16:00	zoom meeting	\N	\N
3863	 [KMF KALACITRA PROUDLY PRESENT]  	Expo	08  - 11 Sep 2021	13:00 - 19:00	zoom meeting	\N	\N
3862	 Talkshow Digitalization for Youth: 'Kaum Muda Berdaya'_Plan Indonesia 	Seminar	09  - 09 Sep 2021	10:00 - 12:00	online	\N	\N
3861	 FARMASI CUP 2021 : DANCE AND BAND COMPETITION 	Expo	07  - 19 Sep 2021	00:00 - 23:58	UGM	\N	\N
3860	 BERANDA INTERIOR EXHIBITION 	Expo	09  - 09 Sep 2021	00:00 - 23:58	Online	\N	\N
3859	 SEMNAS KEWIRAUSAHAAN FPIK UNDIP 2021 	Seminar	25  - 25 Sep 2021	08:00 - 15:00	Online	\N	\N
3858	 ECOFAIR 2021 	Expo	07  - 18 Sep 2021	00:00 - 23:58	Online	\N	\N
3857	 SINORA OCE II 	Expo	07  - 18 Sep 2021	00:00 - 23:58	Online	\N	\N
3856	 Pharmacy Care FF UI 2021 	Seminar	25  - 25 Sep 2021	13:00 - 23:58	Zoom Meeting	\N	\N
3855	 NATIONAL SPEECH COMPETITION 2021 	Expo	07 Sep 2021 - 14 Okt 2021	00:00 - 23:58	Online	\N	\N
3854	 KULTURFEST UI 2021 	Expo	07 Sep 2021 - 24 Okt 2021	00:00 - 23:58	Online	\N	\N
3853	 Online Test of English Proficiency/ TOEFL AKBAR 	Lain-lain	11  - 17 Sep 2021	00:00 - 23:58	Online	\N	\N
3852	 How to Improve Your Confidence in Public Speaking 	Seminar	11  - 11 Sep 2021	13:00 - 16:00	Zoom Meeting	\N	\N
3850	 [GRAND OPENING RUMAH BELAJAR MATALANGI 2021] 	Seminar	04  - 04 Sep 2021	13:30 - 15:30	zoom meeting	\N	\N
3849	 [ OPEN SUBMISSION FOR SCIENTIFIC ABSTRACT ] 	Seminar	05  - 30 Sep 2021	08:00 - 16:00	online	\N	\N
3848	 [OPENING GEBYAR NUSANTARA 2021] 	Pensi	11  - 11 Sep 2021	19:00 - 22:00	Live Youtube BEM KM IPB Official (acara terbuka untuk umum)	\N	\N
3847	 [OPEN REGISTRATION & OPEN SUBMISSION CORE FESTIVALÈ 2021]  	Sport	01  - 15 Sep 2021	08:00 - 16:00	online	\N	\N
3846	 HIMPROAGRI UNPAD 2021 MEMPERSEMBAHKAN 	Seminar	11  - 11 Sep 2021	13:00 - 15:00	online	\N	\N
3845	 Inovasi Investasi Surat Berharga (SurGa) & Emas untuk Keuangan Haji di Indonesia 	Lain-lain	30 Agu 2021 - 25 Sep 2021	08:00 - 16:00	online	\N	\N
3844	 DIPORUN 3.0 	Lain-lain	25  - 30 Sep 2021	00:00 - 00:00	Online	\N	\N
3843	 Marine Cup 2021 	Expo	17 Agu 2021 - 17 Sep 2021	00:00 - 23:58	Online	\N	\N
3842	 Vetepreneur 101: How to Start Your Business as A Beginner (Webinar) 	Seminar	12  - 12 Sep 2021	13:00 - 15:00	Zoom Meeting	\N	\N
3840	 Technopreneurship Competition 	Expo	21 Agu 2021 - 14 Sep 2021	00:00 - 23:59	Online	\N	\N
3838	 Seminar Nasional & Workshop Interactive 	Seminar	27  - 27 Sep 2021	09:00 - 15:00	Zoom Meeting	\N	\N
3837	 TALK  2 EDUPRENEUR  KUPAS TUNTAS TANTANGAN PENDIDIKAN DIFABEL DI ERA DIGITALISASI  	Seminar	12  - 12 Sep 2021	13:00 - 00:00	Zoom Meeting	\N	\N
3836	 DIESPOR XXVII :  NATIONAL POSTER COMPETITION 	Expo	26 Agu 2021 - 08 Sep 2021	00:00 - 23:58	Online	\N	\N
3835	 LOMBA POSTER SOCIAL CAMPAIGN 	Lain-lain	21 Agu 2021 - 14 Sep 2021	00:00 - 00:00	Online	\N	\N
3834	 OPEN DONASI BAKTI SOSIAL COMMUNICATION VAGANZA 2021 	Donasi	27 Agu 2021 - 18 Sep 2021	00:00 - 23:58	Online	\N	\N
3833	 INSPIRING CHEMISTRY TALK 2021 	Seminar	29  - 30 Agu 2021	09:30 - 15:00	Online	\N	\N
3832	 PENDIDIKAN KEKERASAN SEKSUAL: Kaum Milenial Lawan Kekerasan Seksual di Media Sosial 	Seminar	28  - 28 Agu 2021	13:00 - 16:00	Online	\N	\N
3831	 [ISO TRAINING 1 BEM IM FKM UI 2021] 	Seminar	25  - 26 Sep 2021	09:00 - 15:00	zoom meeting	\N	\N
3830	 MEMBUMIKAN FILSAFAT DALAM BERETORIKA 	Seminar	28  - 29 Agu 2021	09:30 - 15:00	Online	\N	\N
3829	 OPEN FOR LATE REGISTRATION 	Sport	21 Agu 2021 - 10 Sep 2021	00:00 - 00:00	online	\N	\N
3828	 National Statistics Challenge 2021 	Expo	16 Agu 2021 - 03 Sep 2021	00:00 - 23:59	Online	\N	\N
3827	 OPEN REGISTRATION SEMINAR K3 NASIONAL 	Seminar	21 Agu 2021 - 10 Sep 2021	08:00 - 12:00	zoom meeting	\N	\N
3826	 SUSTAINABLE AGRIFOOD MANAGEMENT IN INDONESIA 	Seminar	14  - 24 Sep 2021	00:00 - 23:59	Online	\N	\N
3825	 Upgrade Your Personal Branding In Digital Era 	Seminar	25  - 25 Agu 2021	13:00 - 15:00	Zoom Meeting	\N	\N
3824	 Dealing with Toxic Family: When Home Doesn't Feel Like Home 	Seminar	28  - 28 Agu 2021	13:00 - 15:00	Zoom Meeting	\N	\N
3823	 Kelas Excel for Basic 	Seminar	05  - 05 Sep 2021	10:00 - 15:30	Online	\N	\N
3822	 PUBLIC TRAINING DAY 	Seminar	29  - 29 Agu 2021	13:00 - 14:45	Zoom Meeting	\N	\N
3821	 National Mathematics Essay Competition 2021 	Expo	02 Agu 2021 - 05 Sep 2021	00:00 - 23:59	Online	\N	\N
3818	 𝗣𝗦𝗬𝗙𝗘𝗦𝗧 𝟮𝟬𝟮𝟭 	Sport	24  - 24 Agu 2021	08:00 - 16:00	Jakarta Barat	\N	\N
3817	 🦋 𝐄𝐌𝐁𝐑𝐀𝐂𝐄 𝐘𝐎𝐔𝐑𝐒𝐄𝐋𝐅 🦋 	Seminar	27  - 27 Agu 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3816	 𝐍𝐚𝐭𝐢𝐨𝐧𝐚𝐥 𝐁𝐢𝐨𝐥𝐨𝐠𝐲 𝐂𝐨𝐦𝐩𝐞𝐭𝐢𝐭𝐢𝐨𝐧 (𝐁’𝐂𝐎𝐌𝐄) 𝟐𝟎𝟐𝟏 	Lain-lain	17 Agu 2021 - 26 Sep 2021	00:00 - 00:00	Online	\N	\N
3815	 PERAYAAN PUNCAK #RAGAMGELORA 	Expo	22  - 22 Agu 2021	19:00 - 00:00	Online	\N	\N
3814	 Pekan Raya Manajemen 2021 	Lain-lain	01  - 29 Agu 2021	00:00 - 00:00	Online	\N	\N
3813	 GELAR JEPANG UI 27 Mugenchi: Journey Into the World Of Dreams 	Expo	20  - 22 Agu 2021	00:00 - 00:00	Online	\N	\N
3812	 International Competition of ICoSITeR 2021 	Lain-lain	31 Agu 2021 - 15 Sep 2021	00:00 - 00:00	Online	\N	\N
3811	 SPIN : STARTUP PITCHING COMPETITION 	Lain-lain	01 Agu 2021 - 16 Okt 2021	00:00 - 00:00	Online	\N	\N
3810	 Mobile Legends Tournament 	Lain-lain	09 Agu 2021 - 17 Sep 2021	00:00 - 00:00	Online	\N	\N
3809	 Fintech Summer Course 2021 	Seminar	23  - 28 Agu 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3808	 SEMINAR ONLINE NASIONAL PEMIMPIN YANG MENDUNIA 	Seminar	20  - 20 Agu 2021	07:00 - 11:00	Zoom Meeting	\N	\N
3807	 INFORMATICS FESTIVAL 2021 	Lain-lain	18 Jul 2021 - 21 Agu 2021	00:00 - 00:00	Online	\N	\N
3806	 INTERIOR DESIGN ONLINE EXHIBITION 	Seminar	16  - 21 Agu 2021	00:00 - 00:00	www.index.petra.ac.id	\N	\N
3805	 WEBINAR NASIONAL PHARMATALK Self-Love to Building Self Confidence 	Seminar	21  - 22 Agu 2021	09:00 - 00:00	Zoom Meeting	\N	\N
3804	 OPEN REGISTRATION GEAR 2021 	Lain-lain	12 Jul 2021 - 13 Nov 2021	00:00 - 00:00	Online	\N	\N
3803	 OPEN REGISTRATION MAIN EVENT 	Seminar	23  - 26 Agu 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3802	 Marketing Competition Registration: Open 	Lain-lain	26 Jul 2021 - 14 Nov 2021	00:00 - 00:00	Online	\N	\N
3801	 PEMBUKAAN PENDAFTARAN CHEMISTRY CHALLENGE 2021 	Lain-lain	01 Agu 2021 - 24 Okt 2021	00:00 - 00:00	Online	\N	\N
3800	 [SHOOTER 2021] 	Seminar	21  - 21 Agu 2021	14:00 - 17:00	zoom meeting	\N	\N
3799	 [IBSC 2021 BUSINESS CASE COMPETITION] 	Sport	08  - 19 Agu 2021	00:00 - 00:00	online	\N	\N
3798	 [LET'S TALK BUSINESS : Instagram Marketing yang Efektif] 	Seminar	15  - 15 Agu 2021	09:00 - 12:25	online	\N	\N
3797	 DENTISTRY ISLAMIC INSPIRATION 	Seminar	21  - 21 Agu 2021	09:00 - 11:30	zoom meeting	\N	\N
3796	 [International Design Challenge 2021: Solving Digital Problems Through Digital Design Creativity] 	Sport	01  - 30 Agu 2021	08:00 - 16:00	online	\N	\N
3795	 [INTRODUCING: FISCAL CAREER WEEK 2021] 	Bursa Kerja	06  - 23 Agu 2021	10:00 - 16:00	online	\N	\N
3794	 	Lain-lain	07  - 11 Agu 2021	00:00 - 00:00	online	\N	\N
3793	 Pentingnya Perencanaan Keuangan dalam Mengembangkan Wirausaha Mandiri Dimasa Kini 	Seminar	14  - 14 Agu 2021	09:00 - 11:30	online	\N	\N
3792	 OLIMPIADE ZOOLOGI NASIONAL (OZON) 2021 	Lain-lain	01 Agu 2021 - 26 Sep 2021	08:00 - 16:00	online	\N	\N
3791	 HMPS Pendidikan Matematika UIN Syarif Hidayatullah Jakarta 	Lain-lain	31 Jul 2021 - 13 Sep 2021	08:00 - 16:00	online	\N	\N
3790	 CALLING ALL SMALL BUSINESS OWNERS AND DIGITAL MARKETING ENTHUSIASM! 	Lain-lain	13  - 13 Agu 2021	18:30 - 21:00	zoom meeting	\N	\N
3789	 LOMBA HARI KESEHATAN NASIONAL FKM UNDIP 2021 	Lain-lain	02  - 31 Agu 2021	00:00 - 00:00	online	\N	\N
3788	 HMIJ STBA JIA PRESENTS 	Sport	15 Jul 2021 - 15 Agu 2021	00:00 - 00:00	online	\N	\N
3787	 MINTREEZ 	Sport	01  - 30 Agu 2021	08:00 - 16:00	online	\N	\N
3786	 OKI (OLIMPIADE KIMIA INDONESIA) 2021 	Sport	26 Jul 2021 - 05 Okt 2021	08:30 - 16:00	online	\N	\N
3785	 	Seminar	14  - 14 Agu 2021	14:00 - 15:30	zoom meeting	\N	\N
3784	 LOMBA MENULIS PUISI TINGKAT INTERNASIONAL  	Lain-lain	20 Jul 2021 - 20 Agu 2021	08:00 - 16:00	online	\N	\N
3783	 VIRTUAL RUN SPARE XV : aims to raise diabetes awareness 	Lain-lain	01 Agu 2021 - 09 Okt 2021	00:00 - 00:00	Online	\N	\N
3782	 NEXT x I-Growth Webinar IKAMMA FEB UGM 	Seminar	14  - 14 Agu 2021	14:00 - 15:30	Zoom Meeting	\N	\N
3781	 EMBRACE YOURSELF (Quarter life crisis: find the real you!) 	Seminar	27  - 27 Agu 2021	00:00 - 23:59	Zoom Meeting	\N	\N
3780	 ✨LOMBA ESSAY NASIONAL✨ 	Lain-lain	19 Jul 2021 - 27 Agu 2021	00:00 - 00:00	Online	\N	\N
3779	 ✨Pendaftaran Gelombang I✨ LOPOGRAF (Lomba Poster dan Fotografi) 2021 	Lain-lain	03 Jul 2021 - 06 Nov 2021	00:00 - 00:00	Online	\N	\N
3778	 SYIAR MENGAJAR ISLAM (SMI) : Merdeka Pendidikan Merdeka Pendidiknya 	Seminar	18  - 20 Agu 2021	00:00 - 23:59	Zoom Meeting	\N	\N
3777	 Equilibrium National Talk 2021: Start an Action to Realize Your Vision 	Seminar	15  - 15 Agu 2021	09:30 - 00:00	Webex Meetings	\N	\N
3776	 NATIONAL ESSAY COMPETITION! 	Lain-lain	01 Agu 2021 - 01 Okt 2021	00:00 - 00:00	Online	\N	\N
3775	 [BEMANISRA ESSAY NATIONAL COMPETITION 2021] 	Lain-lain	18  - 31 Jul 2021	08:00 - 16:00	online	\N	\N
3774	 [DEPARTEMEN OLAHRAGA PEMERINTAHAN MAHASISWA UNIVERSITAS WIDYATAMA MEMPERSEMBAHKAN WEST 2021] 	Sport	25 Jul 2021 - 01 Agu 2021	08:00 - 16:00	online	\N	\N
3773	 [PENGABDIAN MASYARAKAT BONUS DEMOGRAFI UNPAD JULI-AGUSTUS 2021] 	Seminar	31  - 01 Jul 2021	09:00 - 12:00	zoom meeting	\N	\N
3772	 “BUILD YOUR BUSINESS SKILL WITH DIGITAL TRANSFORMATION TO BE A GREAT ENTERPRENUER”  	Seminar	31  - 31 Jul 2021	09:00 - 15:00	zoom meeting	\N	\N
3771	 WEBINAR KEPENULISAN ILMIAH 	Seminar	01  - 01 Agu 2021	08:00 - 11:00	online	\N	\N
3770	 START 6.0 	Lain-lain	31 Jul 2021 - 01 Agu 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3769	 WEBINAR IRIS 2021 	Seminar	01  - 01 Agu 2021	13:00 - 00:00	Zoom Meeting	\N	\N
3767	 WEBINAR BEAUTY CLASS 2021 ✨Care about beauty, care about healthy✨ 	Seminar	22  - 22 Agu 2021	09:00 - 11:30	Zoom Meeting	\N	\N
3766	 COMMUNICATION JOURNALISM COMPETITION #2 : Kemerdekaan di Masa Pandemi. 	Lain-lain	25 Jul 2021 - 23 Agu 2021	00:00 - 00:00	Online	\N	\N
3765	 RELATIONSICK : Cinta boleh, Buta jangan! 	Seminar	31  - 31 Jul 2021	18:30 - 21:00	Online	\N	\N
3764	 INDONESIA MALAYSIA CULTURAL EVENTS 2021 	Lain-lain	17  - 31 Jul 2021	00:00 - 00:00	Online	\N	\N
3763	 JAKARTA ICON 	Seminar	23  - 25 Jul 2021	13:00 - 17:00	zoom meeting	\N	\N
3762	 ”Take Unparian Out” 2021 	Lain-lain	24  - 24 Jul 2021	13:00 - 16:00	YouTube	\N	\N
3761	 [OMITS 14th 2021] 	Lain-lain	10 Jul 2021 - 20 Agu 2021	08:00 - 16:00	online	\N	\N
3760	 CREATIFEST 2021 	Seminar	23  - 23 Jul 2021	08:00 - 16:00	𝙇𝙄𝙑𝙀 𝙈𝙐𝙆𝘽𝘼𝙉𝙂, 𝙄𝙉𝙁𝙇𝙐𝙀𝙉𝘾𝙀𝙍𝙎 𝙍𝙀𝙑𝙄𝙀𝙒, 𝘽𝙐𝙎𝙄𝙉𝙀𝙎𝙎 𝙏𝘼𝙇𝙆 𝙎𝙃𝙊𝙒𝙎, 𝙒𝙊𝙍𝙆𝙎𝙃𝙊𝙋, & 𝙁𝙍𝙀𝙀𝙀-𝘾𝙀𝙍𝙏𝙄𝙁𝙄𝘾𝘼𝙏𝙀 ?❗ALL IN ONE & 	\N	\N
3759	 [WEBINAR PUMA IR X AIRA: “EXPLORING CAREER AND EDUCATION IN GLOBAL OPPORTUNITIES”] 	Seminar	24  - 24 Jul 2021	13:00 - 15:30	zoom meeting	\N	\N
3758	 WORKSHOP SENI 2021 	Seminar	21  - 27 Jul 2021	08:00 - 19:00	online	\N	\N
3757	 PER SCALAS 2021🎉 	Lain-lain	21  - 27 Jul 2021	08:01 - 16:01	online	\N	\N
3756	 [OPEN REGISTRATION IPB E-SPORTS CHAMPIONSHIP 2021] 	Lain-lain	01  - 25 Jul 2021	08:00 - 19:00	online	\N	\N
3755	 [TreasureQuesTST Open Registration] 	Lain-lain	04  - 25 Agu 2021	08:00 - 18:00	online	\N	\N
3754	 📚WEBINAR KARYA TULIS ILMIAH📚 	Seminar	15  - 22 Jul 2021	08:30 - 12:00	zoom meeting	\N	\N
3753	 Workshop Recruitment Spesialist 	Seminar	24  - 24 Jul 2021	08:00 - 21:00	zoom meeting	\N	\N
3752	 Ubah Mindset Soal Isu Sosial 	Seminar	17  - 24 Jul 2021	15:00 - 17:00	online	\N	\N
3751	 📣[Webinar Personal Branding: Strengthen Your Skill For a Better Career]📣 	Seminar	17  - 17 Jul 2021	10:00 - 14:00	online	\N	\N
3750	 [KOMPETISI HUKUM BRAWIJAYA LAW FAIR XII] 	Lain-lain	01 Jul 2021 - 09 Agu 2021	08:00 - 16:00	online	\N	\N
3749	 CARILOKER VIRTUAL JOB FAIR JAWA TENGAH 2021 	Bursa Kerja	04  - 05 Agu 2021	08:00 - 16:00	Jobfair.cariloker.id	\N	\N
3748	 [GADJAH MADA ACCOUNTING DAYS 2021] 	Lain-lain	15 Jul 2021 - 21 Agu 2021	10:00 - 16:00	online	\N	\N
3747	 LOMBA DAUR ULANG LIMBAH 2021 	Lain-lain	10 Jul 2021 - 01 Agu 2021	10:00 - 19:00	online	\N	\N
3746	 𝘉𝘦 𝘊𝘳𝘦𝘢𝘵𝘪𝘷𝘦, 𝘉𝘦 𝘌𝘯𝘵𝘳𝘦𝘱𝘳𝘦𝘯𝘦𝘶𝘳 	Seminar	15  - 30 Jul 2021	10:00 - 12:00	zoom meeting	\N	\N
3745	 [MnMs' COMPETITION IS NOW OPEN!] 	Lain-lain	02 Jul 2021 - 15 Agu 2021	00:00 - 19:00	online	\N	\N
3743	 Science Expo and Competition (SECt) 2021 	Lain-lain	24 Jun 2021 - 14 Agu 2021	00:00 - 00:00	Online	\N	\N
3742	 CERITA WAKTU 2021 : MEMORA 	Lain-lain	21  - 25 Jul 2021	00:00 - 00:00	Online	\N	\N
3741	 TOMPS BLOG COMPETITION 	Lain-lain	14 Jun 2021 - 01 Agu 2021	00:00 - 00:00	Online	\N	\N
3740	 NYC 2021 : a path to empowerment 	Lain-lain	13  - 21 Agu 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3739	 WARMADEWA AESCULAPIUS SCIENTIFIC COMPETITION 2021 	Lain-lain	25 Jun 2021 - 25 Jul 2021	00:00 - 00:00	Online	\N	\N
3738	 Webinar Creation 2021 : Public Speaking Opportunities In Digital Era 	Seminar	10  - 10 Jul 2021	13:00 - 00:00	Zoom Meeting	\N	\N
3737	 Perintis Class: Kenalan dengan Saham dan Saham Syariah 	Seminar	11  - 11 Jul 2021	10:00 - 11:30	Zoom Meeting	\N	\N
3736	 Webinar Grand Launching LEX VOL : Understanding Telematics Law as a Compass in Our Activities in The Cyber World 	Seminar	10  - 10 Jul 2021	09:15 - 15:35	Zoom Meeting	\N	\N
3735	 CEO Talk : Unconventional Strategi Guerilla Marketing 	Seminar	10  - 10 Jul 2021	10:00 - 11:30	Zoom Meeting	\N	\N
3734	 BEM FEB USAHID X EMAS INSTITUTE 	Lain-lain	08 Jul 2021 - 22 Agu 2021	09:00 - 15:00	online	\N	\N
3733	 [EPIDEMIOLOGIST IN ACTION (EPIDEMIC) 2021] 	Seminar	03  - 03 Jul 2021	08:00 - 13:00	online	\N	\N
3731	 OPEN REGISTRATION CUBE 2021 	Lain-lain	05 Apr 2021 - 20 Jun 2021	00:00 - 00:00	\N	\N	\N
3730	 Seminar Nasional Creative Entrepreneurship 	Seminar	24  - 24 Jun 2021	08:00 - 00:00	Zoom	\N	\N
3729	 ICOMITEE 2021 	Lain-lain	27  - 28 Okt 2021	00:00 - 00:00	El Hotel Royale Banyuwangi & Online	\N	\N
3728	 ICOMITEE 2021: Workshop Bedah Artikel Ilmiah 	Lain-lain	23  - 23 Jun 2021	09:00 - 00:00	Zoom	\N	\N
3727	 Open Campus Tanri Abeng University 	Lain-lain	17  - 20 Jun 2021	09:00 - 15:00	Kampus Tanri Abeng University	\N	\N
3724	 BINUS Virtual Job Expo 	Expo	21  - 27 Jun 2021	09:00 - 16:00	Online	\N	\N
3723	 Webinar: Entrepreneur in Action 	Seminar	20  - 20 Jun 2021	00:00 - 00:00	Zoom Meeting	\N	\N
3722	 Webinar #Unlocking Potential: One Step Closer to Your Dream Job Through Internship 	Seminar	19  - 19 Jun 2021	13:00 - 00:00	Zoom Meeting	\N	\N
3721	 Radio On Air 2021 Future Radio Digital 	Seminar	18  - 18 Jun 2021	13:30 - 00:00	Zoom Meeting	\N	\N
3720	 AORTA 2021 	Seminar	27  - 27 Jun 2021	08:30 - 12:00	Zoom	\N	\N
3719	 ONLINE TEST OF ENGLISH PROFICIENCY/ TOEFL ITP PREDICTION 	Lain-lain	03  - 04 Jul 2021	09:00 - 18:00	Online	\N	\N
3718	 Support Group Batch 4 	Seminar	19  - 26 Jun 2021	09:00 - 11:30	Online	\N	\N
3717	 Rich Talk How to Increase Your Wealth With Stock Investment 	Seminar	19  - 19 Jun 2021	10:00 - 11:00	Zoom	\N	\N
3716	 PASTA LA COSA NOSTRA 	Musik	10  - 10 Jul 2021	18:00 - 00:00	Loket.com & Goplay	\N	\N
3715	 Webinar Kewirausahaan 2021 	Seminar	26  - 26 Jun 2021	10:00 - 00:00	Zoom	\N	\N
3714	 TOEFL AKBAR ONLINE 2021 	Lain-lain	19  - 20 Jun 2021	00:00 - 00:00	Online	\N	\N
3713	 Seminar Online FKM UI Seri 24 	Seminar	30  - 30 Jun 2021	09:00 - 13:00	Zoom	\N	\N
3712	 Re-imagining Urban Refugee Management in Indonesia: A Simulation Workshop 	Lain-lain	23  - 24 Jul 2021	00:00 - 00:00	Online	\N	\N
3711	 JOINMUN X IS OPEN FOR REGISTRATION 	Lain-lain	22  - 24 Okt 2021	00:00 - 00:00	\N	\N	\N
3710	 OPEN RECRUITMENT VOLUNTEER CARILOKER VIRTUAL JOB FAIR 2021 	Bursa Kerja	15  - 30 Jun 2021	08:00 - 16:00	online	\N	\N
3708	 [Mindfulness Meditation] 	Seminar	19  - 19 Jun 2021	15:00 - 17:00	zoom meeting	\N	\N
3707	 Forced Displacement and Urban Management Conference 2021 	Sport	10  - 11 Jun 2021	09:30 - 21:30	online	\N	\N
3706	 ℙ𝔼𝕂𝔸ℕ ℝ𝔸𝕐𝔸 𝕀𝕃𝕄𝕀𝔸ℍ 𝟚𝟘𝟚𝟙 	Lain-lain	01 Mei 2021 - 24 Sep 2021	00:00 - 23:00	online	\N	\N
3705	 SOSACT 2021 : Open Donation (Let's Support Children With Cancer) 	Donasi	01 Jun 2021 - 10 Jul 2021	09:00 - 23:00	Online	\N	\N
3704	 KSATRIA CENDEKIA IV TAHUN 2021 	Lain-lain	07 Jun 2021 - 05 Agu 2021	00:00 - 01:00	online	\N	\N
3703	 DIAPHRAGMATICUS FESTIVAL 2021 	Expo	01 Jun 2021 - 07 Jul 2021	00:00 - 01:00	online	\N	\N
3702	 ENTREFEST 2021 	Seminar	13  - 13 Jun 2021	12:35 - 00:00	Zoom Meeting	\N	\N
3701	 ✨GREMOF TALENT SHOW✨ GENERASI MUDA CINTA BANGSA 	Pensi	01 Jun 2021 - 03 Jul 2021	00:00 - 00:00	\N	\N	\N
3700	 WEBINAR HIMNI 2.0 	Seminar	05  - 05 Jun 2021	09:00 - 00:00	Zoom Meeting	\N	\N
3699	 [National Technopreneur Webinar] 	Seminar	19  - 19 Jun 2021	09:00 - 12:00	zoom meeting	\N	\N
3698	 𝐕𝐈𝐑𝐓𝐔𝐀𝐋 𝐓𝐎𝐔𝐑 𝐏𝐀𝐋𝐄𝐒𝐓𝐈𝐍𝐀 	Seminar	04  - 04 Jun 2021	15:30 - 17:30	online	\N	\N
3697	 [KOMPAS OA ES x PENA x SAMPAN Universitas Brawijaya] 	Seminar	05  - 05 Jun 2021	10:00 - 13:00	online	\N	\N
3696	 ᴘᴘɪ ᴜᴜᴍ ᴘʀᴏᴜᴅʟʏ ᴘʀᴇꜱᴇɴᴛ 	Sport	28 Mei 2021 - 13 Jun 2021	00:00 - 23:00	online	\N	\N
3695	 [OPEN REGISTRATION CUBE 2021] 	Expo	15 Mei 2021 - 20 Jun 2021	00:00 - 23:50	online	\N	\N
3694	 BEM FAKULTAS EKONOMI DAN BISNIS UNIVERSITAS WIJAYA PUTRA 	Seminar	02  - 13 Jun 2021	09:00 - 12:00	online	\N	\N
3693	 World Environment Day Competition 2021 	Lain-lain	22 Mei 2021 - 21 Jun 2021	00:00 - 00:00	Indonesia	\N	\N
3692	 WEBINAR: 𝑺𝑻𝑹𝑨𝑻𝑬𝑮𝑰 𝑼𝑴𝑲𝑴 𝑩𝑨𝑵𝑮𝑲𝑰𝑻 𝑫𝑰 𝑬𝑹𝑨 𝑷𝑨𝑵𝑫𝑬𝑴𝑰 𝑴𝑬𝑳𝑨𝑳𝑼𝑰 𝑫𝑰𝑮𝑰𝑻𝑨𝑳 𝑴𝑨𝑹𝑲𝑬𝑻𝑰𝑵𝑮 	Seminar	12  - 12 Jun 2021	09:00 - 14:30	Indonesia	\N	\N
3691	 U-Talk “Career Starter Pack: How to Build Your Career As a Management Trainee 	Seminar	29  - 29 Mei 2021	14:00 - 16:30	Indonesia	\N	\N
3690	 WEBINAR ARTSPACE 2021 	Seminar	06  - 06 Jun 2021	00:00 - 00:00	Indonesia	\N	\N
3689	 [GROW WITH GOOGLE] 	Lain-lain	28  - 28 Mei 2021	00:00 - 00:00	Indonesia	\N	\N
3688	 Virtual Mega Career Expo 	Expo	24  - 28 Mei 2021	00:00 - 00:00	Indonesia	\N	\N
3687	 LOUDER THAN WORDS 2021 	Seminar	29  - 30 Mei 2021	00:00 - 00:00	Indonesia	\N	\N
3686	 EDSA National Webinar Series 2021 	Seminar	02  - 03 Jun 2021	08:15 - 00:00	Indonesia	\N	\N
3685	 MAXperience : Maximizing The Use of PayLater Feature 	Seminar	04  - 04 Jun 2021	15:00 - 00:00	Indonesia	\N	\N
3684	 HTB CHARITY 2021 	Donasi	25 Mei 2021 - 18 Jun 2021	00:00 - 00:00	Indonesia	\N	\N
3683	 Forced Displacement and Urban Management Conference 	Seminar	07  - 09 Sep 2021	00:00 - 00:00	Indonesia	\N	\N
3682	 [TOSAN UI 2021] 	Seminar	28  - 29 Mei 2021	14:00 - 00:00	Indonesia	\N	\N
3681	 International Youth Conference 6.0 	Lain-lain	05 Mar 2021 - 08 Agu 2021	00:00 - 12:00	Zoom Meeting	\N	\N
3679	 WEBINAR DAN GRAND LAUNCHING SEMESTA 2021 	Seminar	21  - 21 Mei 2021	07:30 - 11:30	UNS	\N	\N
3678	 The Creative Era : Expansion of the Fashion Industry 	Seminar	21  - 22 Mei 2021	00:00 - 23:59	Virtual	\N	\N
3677	 WEBINAR NASIONAL KEWIRAUSAHAAN 	Seminar	29  - 29 Mei 2021	08:00 - 15:00	Virtual	\N	\N
3676	 KOMPETISI SENI BUDAYA NASIONAL 2021 	Expo	30 Mei 2021 - 02 Jun 2021	00:00 - 23:59	Universitas Pancasila	\N	\N
3675	 Exposure Yogyakarta 	Expo	21  - 23 Mei 2021	16:00 - 19:30	Yogyakarta	\N	\N
3674	 Seminar dan Workshop Patient Counseling Event (PCE) 2021 	Lain-lain	18  - 23 Mei 2021	00:00 - 23:59	Universitas Udayana	\N	\N
3673	 UKRIDA Virtual Singing Group Competition 	Expo	01  - 31 Mei 2021	00:00 - 23:59	UKRIDA	\N	\N
3672	 ENGLISH WEBINAR 2021 : “MAKE A GREAT IMPROVEMENT OF OUR ENGLISH SKILLS 	Seminar	10  - 22 Mei 2021	00:00 - 23:59	Universitas Trunojoyo Madura	\N	\N
3671	 Webinar x Lomba Essay Opini 	Seminar	20  - 27 Mei 2021	00:00 - 23:59	UHAMKA	\N	\N
3670	 Gapura Digital (a Grow with Google Program) 	Seminar	20  - 22 Mei 2021	10:00 - 11:30	Webinar	\N	\N
3669	 SWAG 2021 	Lain-lain	03 Mei 2021 - 18 Jun 2021	00:00 - 23:59	UGM	\N	\N
3668	 ENVIROMENTAL ACTION (E-CTION) 	Seminar	05  - 05 Jun 2021	13:00 - 15:50	Institut Pertanian Bogor	\N	\N
3667	 Nursing Festival 2021 	Expo	20  - 21 Mei 2021	09:00 - 12:00	Universitas Pelita Harapan	\N	\N
3666	 International Webinar : Responding Millennial's Challenges by Mastering the Languages 	Seminar	29  - 29 Mei 2021	09:00 - 12:00	UIN Sunan Ampel	\N	\N
3665	 ATMA JAYA COMMUNICATION WEEK 2021 	Expo	25 Apr 2021 - 15 Mei 2021	00:00 - 23:58	Universitas Atma Jaya	\N	\N
3664	 𝐌𝐈𝐎𝐒𝐂𝐎 (𝐌𝐈𝐋𝐄𝐍𝐈𝐀𝐋 𝐎𝐍𝐋𝐈𝐍𝐄 𝐒𝐇𝐎𝐏 𝐂𝐎𝐌𝐏𝐄𝐓𝐈𝐓𝐈𝐎𝐍) 	Expo	26 Apr 2021 - 04 Jun 2021	00:00 - 23:58	Universitas Dian Nuswantoro	\N	\N
3663	 Pelatihan Merancang Alat Permainan Edukatif bagi Anak 	Seminar	03  - 04 Jul 2021	09:00 - 15:30	Zoom Meeting	\N	\N
3662	 The Urgency Of Utilizing English To Survive In The Era Industry 4.0 	Seminar	06  - 06 Jun 2021	10:00 - 15:00	Zoom	\N	\N
3661	 NEW COMERS' CONCERT 	Expo	08  - 08 Mei 2021	00:00 - 23:58	UGM	\N	\N
3660	 FPCI Chapter UI Career Talk: “Devoting Our Values for the People and the Society” 	Seminar	07  - 07 Mei 2021	14:00 - 16:30	Universitas Indonesia	\N	\N
3659	 Webinar Fosmapet Essay Competition (FEC) 2021 	Seminar	08  - 08 Mei 2021	08:45 - 11:00	UGM	\N	\N
3658	 RUPA - RUPA VISUAL 	Expo	07  - 12 Mei 2021	00:00 - 23:59	Unika Soegijapranata	\N	\N
3657	 MENTAL HEALTH   TAKE DEPRESSION WITH POSITIVE COMMUNICATION 	Seminar	08  - 08 Mei 2021	10:00 - 12:00	UNISRI	\N	\N
3656	 YMCC 2021: INTERNATIONAL STUDENT PAPER COMPETITION 	Expo	20  - 26 Mei 2021	00:00 - 23:59	UPN Veteran Yogyakarta	\N	\N
3655	 YMCC 2021 ESSAY COMPETITION 	Expo	10 Mar 2021 - 27 Mei 2021	00:00 - 23:59	UPN Veteran Yogyakarta	\N	\N
3654	 FKMPI SUMSEL, Peduli Berbagi “Kobarkan Jiwa Muda Gemilangkan Jiwa Senja” 	Donasi	26 Apr 2021 - 26 Mei 2021	00:00 - 23:59	Palembang	\N	\N
3653	 ENVIROMENTAL ACTION (E-CTION) 	Expo	25 Apr 2021 - 08 Mei 2021	00:00 - 23:59	IPB	\N	\N
3652	 MAN IN THE MIRROR 	Seminar	08  - 08 Mei 2021	13:00 - 17:20	Universitas Prasetiya Mulya	\N	\N
3651	 - YMCC 2021 - 	Musik	10 Mar 2021 - 26 Jul 2021	10:00 - 23:00	online	\N	\N
3650	 VKC IS BACK 	Musik	24 Apr 2021 - 31 Mei 2021	09:00 - 15:30	online	\N	\N
3649	 Talkshow Kawan Bicara 	Seminar	27 Apr 2021 - 07 Mei 2021	12:00 - 16:00	online	\N	\N
3648	 [KEMENTERIAN PENDIDIKAN DAN KEBUDAYAAN BEM UMM PROUDLY PRESENT UNIVERSITY OPINION WRITING COMPETITION]  	Sport	22 Apr 2021 - 10 Mei 2021	00:00 - 22:00	online	\N	\N
3646	 SAVING [SAVE THE FUTURE WITH INVESTING] 	Seminar	08  - 08 Mei 2021	13:30 - 16:00	online	\N	\N
3645	 Career Hack 101 From Junior Staff to CEO 	Seminar	02  - 02 Mei 2021	10:00 - 12:00	online	\N	\N
3644	 DIES NATALIS FKIK UAJ 	Seminar	01  - 01 Mei 2021	14:30 - 17:00	meeting zoom	\N	\N
3643	 HANDFUL : BEHIND A PANDEMIC FULL LANDFILL 	Seminar	01  - 01 Mei 2021	13:00 - 16:00	online	\N	\N
3642	 [KOMPETISI PAPER MATEMATIKA TINGKAT NASIONAL]⁣ 	Lain-lain	26 Apr 2021 - 15 Sep 2021	00:00 - 00:00	online	\N	\N
3641	 [PREDICT YOUR TOEFL SCORE NOW] 	Lain-lain	01  - 01 Mei 2021	08:00 - 16:00	online	\N	\N
3640	 AGROCONTEST: AGRIVOICE 2021 	Sport	19 Apr 2021 - 30 Mei 2021	00:00 - 00:00	online	\N	\N
3639	 FAKULTAS ILMU SOSIAL | UNIVERSITAS NEGERI YOGYAKARTA PROUDLY PRESENT 	Expo	12 Apr 2021 - 26 Mei 2021	00:00 - 00:00	online	\N	\N
3638	 YOUTH TODAY 	Seminar	08  - 08 Mei 2021	13:00 - 16:00	online	\N	\N
3637	 Spectrum 	Seminar	08  - 08 Mei 2021	13:00 - 17:00	zoom meeting	\N	\N
3636	 [TUGEDER MAIN KE ROEMAH TAWON] 	Sport	02  - 02 Mei 2021	09:00 - 11:45	tangerang banten	\N	\N
3635	 TERAS KERJA #6 Tips Jitu Lolos Wawancara Kerja 	Seminar	29  - 29 Apr 2021	14:00 - 16:00	Online	\N	\N
3634	 Ramadan Kok Hedon ngOBRAL feat. Habib Husein Ja'far Al hadar 	Seminar	27  - 27 Apr 2021	13:00 - 00:00	Online	\N	\N
3633	 INSTITUT PEMBANGUNAN JAWA BARAT UNPAD 	Seminar	23  - 23 Apr 2021	13:00 - 16:00	meeting zoom	\N	\N
3632	 UKM PENALARAN DAN KEILMUAN UGJ Proudly Present 	Lain-lain	15 Apr 2021 - 30 Mei 2021	00:00 - 00:00	online	\N	\N
3631	 MUSIC FESTIVAL 	Musik	24  - 25 Apr 2021	09:00 - 20:00	online	\N	\N
3630	 [ Seminar Nasional]  	Seminar	24  - 24 Apr 2021	09:00 - 12:00	zoom meeting	\N	\N
3629	 [UKM BENGKEL SENI UNIVERSITAS TIDAR X LINTAS RUANG] 	Musik	19 Apr 2021 - 09 Mei 2021	08:00 - 19:00	online	\N	\N
3628	 [ENRICH YOUR KNOWLEDGE WITH TECHTALK] 	Seminar	24  - 25 Apr 2021	09:00 - 16:00	Zoom dan YouTube	\N	\N
3627	 WEBINAR NASIONAL HARI BUMI 2021 	Seminar	25  - 25 Apr 2021	09:00 - 11:00	zoom meeting	\N	\N
3626	 WORKSHOP⚡️KILAT STUDIO229 UPI 	Seminar	22  - 29 Apr 2021	13:00 - 15:00	online	\N	\N
3625	 Workshop Bahasa 	Seminar	01  - 01 Mei 2021	09:00 - 03:30	Platform Zoom	\N	\N
3624	 Lomba Cerdas Cermat SejutaCinta II 	Lain-lain	01 Apr 2021 - 20 Jun 2021	00:00 - 00:00	online	\N	\N
3623	 EKSPEDISI 	Sport	15 Apr 2021 - 14 Mei 2021	00:00 - 23:00	online	\N	\N
3622	 [YOUTHENTITY WEBINARS] 	Seminar	24  - 24 Apr 2021	10:00 - 12:00	zoom meeting	\N	\N
3621	 HIMAMA FEB UMY PROUDLY PRESENT 	Sport	10 Apr 2021 - 10 Jun 2021	00:30 - 00:30	online	\N	\N
3620	 WEBINAR WORLD VETERINARY DAY 2021 	Seminar	25  - 25 Apr 2021	08:30 - 11:00	online	\N	\N
3619	 MADITA 2021 	Lain-lain	28 Mar 2021 - 30 Apr 2021	00:00 - 01:00	online	\N	\N
3618	 Membangun Hubungan Biaik di Dunia Kerja 	Seminar	16  - 16 Apr 2021	14:00 - 16:00	online	\N	\N
3617	 MPC Film Festival 2021 	Expo	01  - 30 Apr 2021	00:00 - 01:00	online	\N	\N
3616	 [OHANA 2021] 	Seminar	16  - 17 Apr 2021	09:00 - 16:30	online	\N	\N
3615	 BAKTI SOSIAL 2021” 	Sport	28 Mar 2021 - 25 Apr 2021	00:00 - 22:00	online	\N	\N
3614	 TAXES 2021 	Seminar	09  - 11 Apr 2021	08:30 - 11:30	online	\N	\N
3613	 Persiapkan Karirmu, Kuasai Kompetensi Digital 	Seminar	12  - 12 Apr 2021	14:00 - 15:30	online	\N	\N
3612	 Teach Talk 	Seminar	09  - 30 Apr 2021	09:00 - 20:00	online	\N	\N
3611	 Youth Esports Tournament 2021 	Sport	16 Mar 2021 - 10 Apr 2021	08:00 - 23:00	online	\N	\N
3610	 Sosialisasi Literasi Keuangan Online 	Seminar	05  - 19 Apr 2021	08:00 - 10:00	online	\N	\N
3609	 YOUTHENTITY NATIONAL ESSAY COMPETITION 2021 	Sport	31 Mar 2021 - 24 Apr 2021	01:00 - 20:00	Indonesia	\N	\N
3608	 National Webinar HOW TO WIN MILLENNIAL MARKET 	Seminar	08  - 08 Apr 2021	20:00 - 21:30	Indonesia	\N	\N
3607	 EXPOSURE WEBINAR 2021 	Seminar	03  - 03 Apr 2021	10:00 - 12:00	\N	\N	\N
3606	 BINA NUSANTARA COMPUTER CLUB (@bnccbinus) PROUDLY PRESENT BNCC TECHNO TALK II 	Sport	04  - 04 Apr 2021	13:00 - 15:00	Zoom dan YouTube	\N	\N
3605	 MOESCULAR IX 	Sport	10  - 10 Apr 2021	00:39 - 23:00	indonesia	\N	\N
3604	 Awareness ISO 9001 & ISO 14001 Terintegras 	Seminar	03  - 03 Apr 2021	08:00 - 11:00	meeting zoom	\N	\N
3603	 TIPS AND TRICKS UTBK BERSAMA BIC 	Seminar	03  - 03 Apr 2021	08:00 - 11:00	online	\N	\N
3602	 AHA TALKS 	Seminar	17 Mar 2021 - 17 Apr 2021	14:00 - 17:00	meeting zoom	\N	\N
3601	 POLITEKNIK NEGERI BALI ROBOT COMPETITION 2021 	Expo	21 Mar 2021 - 23 Mei 2021	00:00 - 00:00	bali	\N	\N
3600	 Hello Creatif People! DVLOP INDONESIA 	Lain-lain	01 Mar 2021 - 02 Apr 2021	00:00 - 00:00	online	\N	\N
3599	 LOMBA DA'I 2021 	Sport	22  - 10 Mar 2021	00:00 - 00:00	online	\N	\N
3598	 [ACHMAD YANI MODEL UNITED NATIONS (AYMUN) 2021] 	Sport	20 Mar 2021 - 05 Apr 2021	00:00 - 00:00	online	\N	\N
3597	 SEMINAR NASIONAL #2 	Seminar	23  - 29 Mar 2021	09:00 - 15:00	meeting zoom	\N	\N
3596	 LOMBA DA'I 2021 	Musik	22 Mar 2021 - 10 Apr 2021	00:00 - 00:00	online	\N	\N
3595	 SMK N 1 Sragen Job Fair Virtual 2021 	Bursa Kerja	01 Mar 2021 - 08 Apr 2021	00:00 - 00:00	SMKN 1 SRAGEN	\N	\N
3594	 𝗧𝗘𝗖𝗛𝗡𝗢𝗖𝗢𝗥𝗡𝗘𝗥 𝟮𝟬𝟮𝟭 	Sport	14 Mar 2021 - 10 Apr 2021	08:00 - 20:30	online	\N	\N
3593	  EPIC 2021 PROUDLY PRESENT ONLINE  TOURNAMENT  	Sport	10  - 28 Mar 2021	09:00 - 20:00	online	\N	\N
3592	 SEMINAR NASIONAL PASAR MODAL 2021 	Seminar	26  - 26 Mar 2021	13:00 - 14:40	online	\N	\N
3591	 SejutaCita Youth Innovation Challenge 	Sport	05  - 28 Mar 2021	14:00 - 22:00	online	\N	\N
3590	 UI/UX COMPETITION 	Sport	10 Mar 2021 - 10 Apr 2021	00:00 - 00:00	Online	\N	\N
3589	 IYCV 2021 	Seminar	09  - 11 Apr 2021	13:00 - 16:00	Zoom meeting	\N	\N
3586	 Diesnatalis jurusan akuntansi 22 universitas Palangka Raya 	Lain-lain	14  - 27 Mar 2021	06:54 - 09:55	Via daring/Online	\N	\N
3584	 OPEN REGISTRATION REMIND 2021 	Lain-lain	22  - 28 Mar 2021	00:00 - 00:00	online	\N	\N
3583	 Webinar CREATION 2021 	Seminar	24  - 24 Mar 2021	10:59 - 13:00	zoom meeting	\N	\N
3582	 KOPMA FAIR 2021 	Expo	01 Mar 2021 - 07 Apr 2021	00:00 - 00:00	online	\N	\N
3581	 Gapura Digital Belajar Manfaat Teknologi Langsung Dari Para Pemilik Usaha 	Seminar	18  - 20 Mar 2021	10:00 - 15:30	Google	\N	\N
3580	 VIRTUAL MUSICAL THEATER 	Musik	15  - 31 Mar 2021	00:00 - 00:00	You Tube	\N	\N
3579	 TEDxSampoernaUniversity: PERSEVERANCE 	Seminar	20  - 21 Mar 2021	13:00 - 15:08	live	\N	\N
3578	 PAPER COMPETITION REGISTRATION IS NOW OPEN 	Lain-lain	15 Peb 2021 - 01 Mar 2021	00:00 - 00:00	online	\N	\N
3577	 COMMSTRIDE 2021 	Lain-lain	01  - 21 Mar 2021	00:00 - 00:00	Indonesia	\N	\N
3576	 INTERNATIONAL BUSINESS MODEL CANVAS COMPETITION 	Sport	22 Peb 2021 - 06 Apr 2021	00:00 - 00:00	Surakarta	\N	\N
3575	 𝗗𝗿. 𝗠𝗼𝗰𝗵𝘁𝗮𝗿 𝗥𝗶𝗮𝗱𝘆 𝗟𝗲𝗴𝗮𝗹 𝗪𝗲𝗲𝗸 𝟮𝟬𝟮𝟭 	Expo	21  - 31 Mei 2021	00:00 - 00:00	online	\N	\N
3573	 [MARKETING COMPETITION] 	Expo	01  - 22 Mar 2021	00:00 - 00:00	online	\N	\N
3572	 GEMPITA 6TH E-TIMES 	Lain-lain	09 Mar 2021 - 10 Apr 2021	00:00 - 00:00	online	\N	\N
3570	 UNISSULA LAW FAIR 2021 	Bursa Kerja	24 Peb 2021 - 24 Mar 2021	00:00 - 00:00	online	\N	\N
3569	 Pelatihan GRATIS Womenwill by Google Indonesia 	Seminar	04  - 06 Mar 2021	10:00 - 14:00	online	\N	\N
3568	 [iSPC 2021 : SCIENTIFIC POSTER COMPETITION] 	Sport	03  - 24 Mar 2021	00:00 - 00:00	online	\N	\N
3567	 SUPERIOR YOUTH IDEALISM 	Seminar	07  - 07 Mar 2021	13:00 - 16:00	zoom meeting	\N	\N
3566	 Essay Competition 	Lain-lain	01  - 25 Mar 2021	00:00 - 00:00	online	\N	\N
3565	 𝐄𝐯𝐞𝐧𝐢𝐧𝐠 𝐓𝐚𝐥𝐤 𝟒.𝟎 	Seminar	07  - 07 Mar 2021	16:00 - 18:10	zoom meeting	\N	\N
3564	 Kelas Online Gratis Gapura Digital 	Seminar	04  - 06 Mar 2021	10:00 - 15:30	You Tube	\N	\N
3563	 ACROMION 2021 (Academic Rally of Science and Medical Competition) 	Lain-lain	01 Mar 2021 - 11 Apr 2021	00:00 - 00:00	online	\N	\N
3562	 CALLING OUT OUR NEXT YOUNG ECONOMISTS 	Seminar	06  - 06 Mar 2021	13:00 - 16:00	zoom meeting	\N	\N
3561	 Digital Marketer 	Seminar	28  - 28 Peb 2021	00:00 - 00:00	online marketing	\N	\N
3560	 DIGITALKPRENEUR 	Seminar	27  - 27 Peb 2021	13:00 - 16:00	zoom meeting	\N	\N
3559	 The Magic Of Theatrical Makeup 	Seminar	27  - 27 Peb 2021	19:00 - 21:00	online	\N	\N
3556	 MEDJONSON 2021 	Lain-lain	10 Peb 2021 - 03 Mar 2021	00:00 - 00:00	online	\N	\N
3555	 Marketeers iClub [Marketing 5.0 in Practices ] 	Seminar	05 Mar 2021 - 05 Peb 2021	19:00 - 21:00	zoom meeting	\N	\N
3554	 Gapura digital 	Seminar	25  - 27 Peb 2021	10:00 - 12:00	Indonesia	\N	\N
3553	 [SAYEMBARA NAUNG 2021] 	Pensi	22 Peb 2021 - 08 Mei 2021	00:00 - 00:00	Indonesia	\N	\N
3552	 [National Water and Sanitation Festival Vol. 2] 	Seminar	20  - 20 Peb 2021	09:00 - 11:30	Zoom meeting	\N	\N
3551	 Corporate Legal Academy 	Seminar	20 Mar 2021 - 27 Peb 2021	13:00 - 16:00	online	\N	\N
3550	 Let's Join SHINE 5.0 	Seminar	21  - 21 Peb 2021	09:00 - 12:00	zoom meeting	\N	\N
3549	 SEMINAR DAN TALKSHOW KASTRATKU DAYS 2021 	Seminar	17  - 17 Mar 2021	08:00 - 11:00	zoom meeting	\N	\N
3548	 webinar marketing QuBisa 	Seminar	22  - 22 Peb 2021	16:00 - 17:30	zoom meeting	\N	\N
3547	 VIRTUAL EDUCATION EXPO 2021 	Expo	26  - 27 Peb 2021	13:00 - 17:00	ONLINE	\N	\N
3546	 Webinar Accelerating Reewable Energy In Indonesia: Solar PV and Bioenergy 	Seminar	24  - 24 Peb 2021	18:30 - 20:00	Online via Zoom	\N	\N
3545	 Kelas Online Gratis Gapura Digital 	Seminar	18  - 20 Peb 2021	10:59 - 15:30	live	\N	\N
3544	 Kakaban Goes to School and Try Out 	Lain-lain	20  - 20 Peb 2021	00:00 - 00:00	UNPAD	\N	\N
3543	 DOLC 2021: THE BIGGEST LAW JOB FAIR IN INDONESIA 	Bursa Kerja	15  - 22 Peb 2021	00:00 - 23:59	Universitas Indonesia	\N	\N
3542	 WEBINAR : Gateway Towards a More  Inclusive Society 	Seminar	13  - 19 Peb 2021	00:00 - 23:59	Indonesia	\N	\N
3541	 STUDY WITH FORUM 2021 	Expo	15  - 18 Peb 2021	00:00 - 23:59	Purwokerto	\N	\N
3540	 SEMINAR NASIONAL : “The Urgency of Air Pollution in Global Health Issues” 	Seminar	20  - 20 Mar 2021	08:00 - 12:00	Universitas Atma Jaya	\N	\N
3539	 HIPPOCRATES COMPETITIONS : “The Impact of Pandemic Towards Our Lifestyle Lenses” 	Expo	05  - 16 Peb 2021	00:00 - 23:59	Universitas Trisakti	\N	\N
3538	 🎖️[KONSTITUSI PKn 2021]🎖️ 	Lain-lain	07 Jan 2021 - 20 Peb 2021	00:00 - 00:00	Online	\N	\N
3537	 WEBINAR EDUPARM 2021 	Seminar	20  - 20 Peb 2021	13:00 - 23:58	STIFAR YAPHAR Semarang	\N	\N
3536	 🌏 OGG 2021, hadir bersama PRE EVENT?! 🌏 	Lain-lain	25 Jan 2021 - 10 Mar 2021	00:00 - 00:00	Online	\N	\N
3535	 Lomba Inovasi teknologi INCHER (ITELLECTUAL RESEARCH) 	Expo	01  - 21 Peb 2021	00:00 - 23:59	Institut TELKOM Surabaya	\N	\N
3534	 Try Out UTBK dan Webinar Nasional 	Seminar	13  - 14 Peb 2021	00:00 - 00:00	Online	\N	\N
3533	 WEBINAR PARENTING NASIONAL 	Seminar	20  - 20 Peb 2021	09:00 - 11:00	Zoom Meeting dan Channel Yout tube MIMPKTV	\N	\N
3531	 TRYOUT NASIONAL DAN SEMINAR MOTIVASI ABHINAYA ANANTA 	Seminar	07  - 07 Peb 2021	00:00 - 23:59	Indonesia	\N	\N
3530	 PEKAN MATEMATIKA REGIONAL SE-INDONESIA 2021 	Expo	22 Mar 2021 - 27 Peb 2021	00:00 - 23:59	Universitas Halu Oleo	\N	\N
3529	 Off the Court Talkshow 	Expo	29 Jan 2021 - 12 Peb 2021	00:00 - 00:00	Indonesia	\N	\N
3528	 FESTIVAL BULAN K3 NASIONAL UNUSA 2021 	Expo	01  - 25 Peb 2021	00:00 - 23:59	UNNUSA	\N	\N
3526	 YOUNG ENTREPRENEURS SUMMIT 	Seminar	02 Nov 2020 - 13 Peb 2021	00:00 - 23:59	Indonesia	\N	\N
3525	 KTR POSTER NATIONAL COMPETITION 	Lain-lain	20 Des 2020 - 02 Peb 2021	00:00 - 23:59	Universitas Dian Nuswantoro	\N	\N
3524	 IKATI PROUDLY PRESENT: Webinar Mengembangkan Potensi Diri untuk Meraih Kesuksesan Karir 	Seminar	30  - 30 Jan 2021	13:00 - 00:00	Zoom Meeting	\N	\N
3523	 TOSSAKA 17TH 	Lain-lain	30  - 30 Jan 2021	08:00 - 16:00	Online	\N	\N
3522	 ZenFest 2.0 	Seminar	13  - 14 Peb 2021	09:00 - 03:00	Zoom Meeting	\N	\N
3440	 [OPEN REGISTRATION OF EVENING TALK 2.0] 	Seminar	13  - 13 Nov 2020	15:30 - 18:00	VIA ZOOM	\N	\N
3521	 Free Webinar: Bingung Mau Bisnis Apa? Yuk Cari Tahu Lewat Psikologimu 	Seminar	29  - 29 Jan 2021	19:30 - 21:00	Webinar Zoom	\N	\N
3520	 YOUTHVERSE 2.0 	Seminar	23  - 23 Jan 2021	10:00 - 14:00	ONLINE	\N	\N
3519	 HMPS Akuntansi FEB UWK 	Lain-lain	25 Des 2020 - 28 Jan 2021	00:00 - 00:00	Indonesia	\N	\N
3518	 Artemis Community Challenge 	Lain-lain	19 Jan 2021 - 19 Peb 2021	00:00 - 00:50	Indonesia	\N	\N
3517	 Prepare Your Career For Your Best Future 	Seminar	23  - 23 Jan 2021	15:30 - 18:15	Via Zoom Meeting	\N	\N
3514	 Ma Chung Intelligence Battle 	Lain-lain	20  - 21 Mar 2021	07:00 - 15:00	Online	\N	\N
3513	 𝐌𝐀𝐈𝐍 𝐄𝐕𝐄𝐍𝐓 𝐁𝐁𝐔 𝐈𝐓𝐁 𝐗𝐕𝐈𝐈 	Seminar	16  - 17 Jan 2021	00:00 - 00:00	zoom meeting	\N	\N
3512	 KATULISTIWA 13 	Lain-lain	14 Des 2020 - 11 Apr 2021	00:00 - 00:00	Indonesia	\N	\N
3511	 QGIS COURSE GEOFISDAY 2.0 PERTAMINA UNIVERSITY 	Seminar	09  - 30 Jan 2021	07:00 - 12:00	Zoom Meeting	\N	\N
3510	 METTA DAY XXVI 	Lain-lain	18  - 24 Jan 2021	00:00 - 00:00	Jakarta Barat	\N	\N
3509	 WEBBINAR NASIONAL BIOLOGI EXPO 2020 	Seminar	10  - 10 Jan 2021	07:30 - 12:00	ZOOM	\N	\N
3508	 Webinar Nasional HIPMI PT POLITEKNIK POS INDONESIA 	Seminar	10  - 10 Jan 2021	13:00 - 16:30	Via zoom	\N	\N
3506	 irtual Beauty Class Daily Makeup Fresh & Glowing With Make Over 	Seminar	03  - 03 Jan 2021	15:00 - 17:00	Zoom Meeting	\N	\N
3505	 THE 20TH ATV'S AUDIT COMPETITION AND CONFERENCE 	Lain-lain	03 Des 2020 - 14 Jan 2021	00:00 - 00:00	Online	\N	\N
3504	 BREVET PAJAK ONLINE 	Lain-lain	30 Des 2020 - 31 Jan 2021	00:00 - 00:00	Online	\N	\N
3503	 Lika Liku 	Lain-lain	23 Des 2020 - 03 Jan 2021	00:00 - 00:00	Online	\N	\N
3501	 Membangun Kewirausahaan Melalui Public Speaking 	Seminar	16  - 16 Jan 2021	13:00 - 15:10	Via Zoom Meeting dan Youtube Live	\N	\N
3498	 ANANTARA 	Lain-lain	11  - 12 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3497	 Photocontest 	Lain-lain	11  - 31 Des 2020	00:01 - 00:00	INDONESIA	\N	\N
3495	 Webinar Revolusi Industry 4.0 Dimasa Pandemi 	Seminar	10  - 10 Des 2020	10:00 - 11:00	Zoom Meeting	\N	\N
3493	 Arkavidia Informatics & IT Festival 7.0 	Expo	05 Nov 2020 - 18 Des 2020	08:00 - 18:00	Online	\N	\N
3492	 [BIOTECHFAIR 2020🌎] 	Lain-lain	20  - 20 Des 2020	09:30 - 00:00	Via Zoom	\N	\N
3489	 SA NODE 2020 	Lain-lain	18  - 26 Des 2020	00:00 - 00:00	Online	\N	\N
3487	 “Tourism Youth Football League 2020” 	Sport	29 Nov 2020 - 02 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3486	 🔥WEBINAR NASIONAL HDI 2020🔥 	Seminar	20 Nov 2020 - 02 Des 2020	18:00 - 00:00	Via Zoom	\N	\N
3485	 ✨Wani Ora Wirausaha 2020✨ 	Seminar	29  - 29 Nov 2020	09:46 - 12:00	Via Zoom	\N	\N
3484	 🎙️[Lomba Podcast Dictio 1.0]🎙️ 	Lain-lain	18 Nov 2020 - 05 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3483	 ✨GEMINAR [GEMILANG SINDANGBARANG WEBINAR]✨ 	Lain-lain	23  - 23 Nov 2020	14:00 - 16:00	Via Zoom	\N	\N
3482	 LOWONGAN MAGANG MARKETING LAPANGAN 	Bursa Kerja	23  - 27 Nov 2020	08:00 - 17:00	PT Kusuma Kreasi Utama	\N	\N
3481	 WORKSHOP START UI/UX WITH FIGMA 2020 	Seminar	29 Nov 2020 - 06 Des 2020	09:00 - 00:00	Via Zoom	\N	\N
3480	 FPCI Chapter UI Diplomatic Organizational Forum 2020 	Lain-lain	21  - 21 Nov 2020	10:00 - 13:00	Via Zoom	\N	\N
3477	 [Departemen Pengembangan Karir BEM Vokasi UI 2020 Proudly Presents] 	Lain-lain	20  - 21 Nov 2020	00:00 - 00:00	Via Zoom	\N	\N
3476	 [PORSEMA PODCAST COMPETITION] 	Lain-lain	04 Nov 2020 - 10 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3475	 “Be YouGa: Peace of Mind is a Start for being Productive in the Pandemic” 	Lain-lain	12  - 12 Des 2020	08:00 - 10:25	Via Zoom	\N	\N
3474	 ✨[SEMINAR NASIONAL BUILDYEAR 5.0]✨ 	Seminar	05  - 05 Des 2020	08:36 - 00:00	Via Zoom	\N	\N
3473	 ✨[LOMBA PRAMUKA CIPTA KARYA TINGKAT NASIONAL TAHUN 2020 ]✨ 	Lain-lain	16 Nov 2020 - 14 Des 2020	00:00 - 00:00	Via Zoom	\N	\N
3472	 SPRUDEMINAR 	Seminar	20  - 20 Nov 2020	19:00 - 22:00	Via Zoom	\N	\N
3471	 ✨✨[NATIONAL CHARITY SEMINAR 2020]*✨✨ 	Seminar	21  - 21 Nov 2020	09:01 - 12:00	Via Zoom	\N	\N
3470	 Seminar 	Seminar	20  - 21 Nov 2020	10:00 - 15:00	Via Zoom	\N	\N
3469	 [SEMINAR NASIONAL KEARSIPAN MRA UI 2020] 	Lain-lain	21  - 21 Nov 2020	09:00 - 13:00	Via Zoom	\N	\N
3468	 [DLI VENTURE SHOWCASE 2020] 	Seminar	18  - 20 Nov 2020	00:00 - 00:00	Zoom Meeting	\N	\N
3467	 Purnama 	Lain-lain	20  - 21 Nov 2020	13:00 - 21:00	INDONESIA	\N	\N
3464	 📢Himakom Untag Surabaya Proudly Present📢 “NEGERI KOMUNIKASI 2020” 	Lain-lain	26  - 04 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3463	 Open Donation with UKM Gerakan Peduli Inklusi dan Disabilitas Universitas Negeri Malang 	Donasi	25 Okt 2020 - 29 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3461	 {Surat Cinta dari Posko Visual 2020} 	Lain-lain	16 Nov 2020 - 31 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3460	 {Surat Cinta dari Posko Visual 2020} 	Lain-lain	16 Nov 2020 - 31 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3459	 🎨 POSTER PUBLIK KOFEIN 2021 🎨 	Lain-lain	28 Nov 2020 - 07 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3458	 *Seminar Online Seri 33 FKM UI* 	Lain-lain	18  - 18 Nov 2020	13:00 - 16:00	Via Zoom Meeting & Live Youtube	\N	\N
3457	 WEBINAR & TALKSHOW NASIONAL 	Seminar	14  - 14 Nov 2020	08:30 - 00:00	Via Zoom Meeting & Live Youtube	\N	\N
3456	 [ Webinar Nasioanal Exortus 3.0 2020 ] 	Seminar	14  - 14 Nov 2020	08:00 - 12:00	Via Zoom Meeting & Live Youtube	\N	\N
3455	 d'YOUTHIZEN 	Lain-lain	15  - 16 Nov 2020	13:00 - 00:00	d'Youthizen Virtual Class.	\N	\N
3454	 ✨ [DEMA Justicia proudly present 75 Wajah Indonesia] ✨ 	Lain-lain	12  - 15 Nov 2020	00:00 - 00:00	Via Zoom Meeting & Live Youtube	\N	\N
3453	 [NATIONAL SEMINAR MEXPO 10] 	Seminar	15  - 15 Nov 2020	12:00 - 00:00	VIA ZOOM	\N	\N
3452	 📣Calling All Student to join our BINECA 2020!📣 	Lain-lain	06 Okt 2020 - 19 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3450	 MEDCOM Webinar Geothermal Summit 	Seminar	14  - 16 Nov 2020	08:00 - 10:00	Zoom	\N	\N
3447	 WEBINAR FKM UI PEDULI 16 	Seminar	14  - 14 Nov 2020	13:30 - 15:30	VIA ZOOM	\N	\N
3446	 [WEBINAR AMAL IDYF FKG UNEJ 2020] 💫 	Seminar	15  - 15 Nov 2020	18:30 - 00:00	VIA ZOOM	\N	\N
3445	 🌞 EDUYEAR FK UKI 2020🌞 	Lain-lain	05  - 20 Des 2020	00:00 - 00:00	INDONESIA	\N	\N
3444	 FUNSHOUSE 	Lain-lain	05  - 20 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3443	 ⭐⭐*Webinar Invesatasi*⭐⭐ 	Seminar	11  - 11 Nov 2020	08:00 - 10:00	VIA ZOOM	\N	\N
3442	 [WEBINAR NASIONAL KEFARMASIAN PHARMACIOUS 2020] 	Seminar	14  - 15 Nov 2020	00:00 - 00:00	VIA ZOOM	\N	\N
3441	 📢EXPRO 2.0 (EXTRA ORDINARY PROJECT 2020)📢 	Lain-lain	14  - 14 Nov 2020	12:30 - 00:00	VIA ZOOM	\N	\N
3439	 [BRAND UI 2020 WEBINAR] 	Seminar	13  - 15 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3438	 Ekspedisi XVI Mapala SPECTA Bumi Pasundan 	Lain-lain	06  - 17 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3437	 [IDEANATION TALKSHOW 2020] 	Seminar	07  - 07 Nov 2020	09:30 - 15:00	Via Zoom Meeting & Live Youtube	\N	\N
3436	 CREATIVE (Creating Millennials to Be More Innovative) 	Expo	25 Okt 2020 - 03 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3435	 WEBINAR BEAT POLLUTION 	Seminar	07  - 07 Nov 2020	13:00 - 00:00	VIA ZOOM	\N	\N
3434	 [Fire Fighting and Rescue Talk 2020] 	Seminar	07  - 07 Nov 2020	07:30 - 00:00	Via Zoom Meeting & Live Youtube	\N	\N
3433	 WEBINAR COMMUNICATION CAREER FAIR 2020 	Seminar	07  - 07 Nov 2020	10:00 - 12:45	Via Zoom Meeting & Live Youtube	\N	\N
3432	 ✨MAFIOSHOW 2020✨ 	Lain-lain	07  - 07 Nov 2020	13:00 - 00:00	VIA ZOOM	\N	\N
3431	 [CHANGE YOUR MIND WITH PARADIGMA IPB] 	Seminar	01  - 08 Nov 2020	00:00 - 00:00	Via Zoom Meeting & Live Youtube	\N	\N
3430	 SEMUSIM 	Sport	21  - 21 Nov 2020	08:30 - 00:00	VIA ZOOM	\N	\N
3429	 [WEBINAR ICEF 2020] 	Seminar	08  - 08 Nov 2020	08:00 - 00:00	VIA ZOOM	\N	\N
3428	 [ CALLING OUT MOBILE LEGEND ENTHUSIAST🎮🤺 ] 	Sport	25 Okt 2020 - 05 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3426	 SINGKAP RASA 2020 	Lain-lain	14  - 14 Nov 2020	15:30 - 18:00	VIA ZOOM	\N	\N
3425	 *🎇GEBYAR 2020🎇* 	Lain-lain	25 Okt 2020 - 06 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3424	 🎉The 7th PPM ACCOUNTING COMPETITION IS BACK🎉 	Lain-lain	05  - 14 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3423	 Kompetisi Freestyle Football 	Sport	19 Okt 2020 - 01 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3422	 The Earth is what we all have in common 	Seminar	31  - 31 Okt 2020	13:00 - 00:00	Zoom	\N	\N
3421	 ✨ POSKOLOGI 2020 PRESENTS✨ 	Seminar	01  - 01 Nov 2020	13:40 - 00:30	Zoom	\N	\N
3420	 AUTUMN FOLK FESTIVAL 	Lain-lain	30  - 30 Okt 2020	00:00 - 00:00	INDONESIA	\N	\N
3419	 [TOEFL AKBAR ONLINE UNS 2020] 	Seminar	20  - 22 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3418	 [ISO TRAINING BEM FKM UI 2020] 	Seminar	21 Nov 2020 - 22 Okt 2020	09:00 - 15:00	Zoom	\N	\N
3417	 FESTIVAL ILMIAH EKONOMI ISLAM 2020 	Lain-lain	14  - 20 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3416	 Singkap Rasa 	Seminar	14  - 14 Nov 2020	15:30 - 18:00	Zoom Meeting	\N	\N
3415	 [WEBINAR KOMIK SERIES KEHIDUPAN DITENGAH PANDEMI] 	Seminar	30 Okt 2020 - 01 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3413	 Pengembangan Karir BEM Vokasi Universitas Indonesia 	Seminar	30  - 30 Okt 2020	13:30 - 16:30	Zoom	\N	\N
3412	 Future Geoscientist! 	Lain-lain	01 Sep 2020 - 02 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3411	 Forum Film MMTC 	Pensi	30 Okt 2020 - 01 Nov 2020	19:00 - 00:00	Via Zoom Meeting & Live Youtube	\N	\N
3410	 Something On (The Other) Virtual Exhibition 	Seminar	26  - 31 Okt 2020	13:00 - 00:00	Instagram Live pada akun @akuiart.management	\N	\N
3409	 📣TOEFL AKBAR ONLINE STIFAR 2020📣 	Seminar	21  - 22 Nov 2020	00:01 - 00:00	INDONESIA	\N	\N
3408	 [ RUSH ] 	Seminar	31 Okt 2020 - 07 Nov 2020	00:00 - 00:00	INDONESIA	\N	\N
3407	 dyouthizen Virtual Class 	Seminar	30  - 31 Okt 2020	13:00 - 00:00	d'Youthizen Virtual Class.	\N	\N
3406	 [ ULYMPIC E-SPORTS ] 	Sport	02  - 06 Okt 2020	00:00 - 00:00	INDONESIA	\N	\N
3400	 Jelajah IPB 	Expo	07 Nov 2020 - 21 Okt 2020	08:14 - 15:14	Online Meeting	\N	\N
3399	 SEMINAR ARSOLOGY 2020 : REVITALISASI SENI MELALUI DIGITALISASI 	Seminar	23  - 23 Okt 2020	19:00 - 00:00	Dalam Jaringan	\N	\N
3398	 Lomba Artikel Accounting Writing Competition (ANTIC) 	Lain-lain	20 Sep 2020 - 28 Nov 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3397	 DBC ONLINE CHARITY CONCERT 	Lain-lain	14  - 14 Nov 2020	00:00 - 00:00	UNIKA ATMA JAYA	\N	\N
3396	 [WEBINAR : BATARA - Breast Cancer Talk With SCORA] Finding The Cure Starts With Hope 	Seminar	25  - 25 Okt 2020	13:00 - 15:30	Dalam Jaringan	\N	\N
3395	 Webinar HAUS 2020 	Seminar	31  - 31 Okt 2020	13:00 - 15:30	Zoom Meeting	\N	\N
3394	 MEANLINE 5.0 	Lain-lain	20  - 24 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3393	 INTRODUCTION TO PSYCHOLOGY UI 2020 	Seminar	24  - 24 Okt 2020	00:00 - 00:00	Universitas Indonesia	\N	\N
3392	 Competition UI Innovation War 	Lain-lain	11 Okt 2020 - 14 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3391	 BISNIS PLAN COMPETITION 	Expo	14  - 31 Okt 2020	00:00 - 00:00	UIN Jakarta	\N	\N
3389	 [WIN A TOTAL PRIZE OF MORE THAN IDR 100,000,000] 	Lain-lain	01 Jan 2021 - 31 Des 2021	00:00 - 00:00	Indonesia	\N	\N
3388	 Webinar Keuangan 	Seminar	17  - 17 Okt 2020	19:00 - 21:29	zoom meeting	\N	\N
3387	 SCHOLARSHIP FESTIVAL 2020 PROUDLY PRESENT 	Seminar	17  - 17 Okt 2020	14:00 - 16:00	zoom meeting	\N	\N
3386	 [PKMMTD FIS UNNES 2020] 	Expo	10 Okt 2020 - 01 Nov 2020	00:00 - 00:00	zoom meeting	\N	\N
3385	 Naung 2020 	Seminar	17  - 17 Okt 2020	13:30 - 16:00	zoom meeting	\N	\N
3384	 Webinar Nasional Fisika FPMIPA UPI 	Seminar	24  - 24 Okt 2020	13:00 - 16:00	Ruang Virtual Zoom Meeting	\N	\N
3383	 [ Entrepreneurs Zone 1.0] 	Seminar	17  - 17 Okt 2020	13:30 - 16:30	zoom meeting	\N	\N
3382	 [Kajian Akbar Rohis Qolbun Salim] 	Lain-lain	18  - 18 Okt 2020	08:00 - 11:30	zoom meeting	\N	\N
3381	 PESTA KARYA KOMUNIKASI 2020 	Lain-lain	03  - 18 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3380	 [ TES TOEFL AKBAR ONLINE BEM UNDIP X ZAMBERT ]⁣⁣⁣⁣ 	Lain-lain	10 Agu 2020 - 29 Okt 2020	00:59 - 00:00	semarang	\N	\N
3379	 HIMPUNAN MAHASISWA MANAJEMEN PROUDLY PRESENT 	Expo	01 Okt 2020 - 30 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3378	 EARLY BIRD PROMO ALERT 	Lain-lain	01 Okt 2020 - 31 Des 2020	00:00 - 00:00	Indonesia	\N	\N
3377	 [WEBINAR KEWIRAUSAHAAN] 	Seminar	08  - 08 Nov 2020	09:00 - 11:00	zoom meeting	\N	\N
3376	 [HEPOSPHOR COMPETITION] 	Lain-lain	07 Okt 2020 - 14 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3375	 Lomba Desain Poster “Creative On Pandemic” 	Lain-lain	01 Okt 2020 - 10 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3374	 Lomba Esai Nasional 	Lain-lain	18 Sep 2020 - 08 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3373	 EXPORT UNS 2020 ESCAPE TO THE MOON 	Expo	02 Sep 2020 - 15 Okt 2020	00:00 - 00:00	Surakarta	\N	\N
3372	 [BEM POLTEKKES KEMENKES SURAKARTA PROUDLY PRESENT] 	Seminar	18  - 18 Okt 2020	07:30 - 11:00	zoom meeting	\N	\N
3368	 Industrial Workshop 2020 	Seminar	07  - 08 Nov 2020	09:00 - 16:00	Zoom Meeting	\N	\N
3367	 GRAND LAUNCHING FUNCTION 2020 dengan Tema “Edukasi Pengolahan Limbah Plastik Berbasis Teknologi” 	Seminar	11  - 11 Okt 2020	15:45 - 17:30	Rumah Masing-Masing	\N	\N
3366	 FESTIVAL LAGU NUSANTARA UNTUK INDONESIA RAYA 	Lain-lain	01  - 31 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3365	 IEF (Islamic Education Fair) : LOMBA ESSAY DAN POSTER TINGKAT NASIONAL 	Lain-lain	05  - 31 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3364	 PMDK 2020 	Lain-lain	24  - 25 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3363	 [ISO TRAINING BEM FKM UI 2020]Upgrade Your Management System Skill to Increase Self Investment in The Massive Industry 	Seminar	24  - 25 Okt 2020	09:00 - 09:00	Via Zoom Cloud meeting	\N	\N
3362	 WEBINAR CIVIL EXPO ITSInovasi Industri Konstruksi di Era Pandemi COVID-19 	Seminar	06  - 09 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3361	 [EUREKA LEADER FEST 3.0 ESSAY COMPETITION 2020] 	Lain-lain	23 Sep 2020 - 30 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3360	 CAREERTALK WEBINAR SERIES 	Seminar	10  - 11 Okt 2020	13:00 - 15:00	Dalam Jaringan	\N	\N
3359	 CHARITY 2020 (Your Donation Make Their Happiness) 	Lain-lain	04  - 30 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3358	 RAPMAFEST#7 Push Your Passion During A Pandemic 	Seminar	24  - 24 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3357	 Indonesia Emas 2045: The Present Determines The Future 	Seminar	10  - 10 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3356	 SEMINAR NASIONAL MANAGEMENT NATIONAL ENTREPRENEUR TALK (MJ NET) 2020 	Seminar	25  - 25 Okt 2020	00:00 - 00:00	Dalam Jaringan	\N	\N
3355	 PUBLIC HEALTH AWARD COMPETITION 2020 	Lain-lain	01  - 30 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3354	 Mechanational Essay Competition 	Lain-lain	15 Sep 2020 - 18 Okt 2020	07:00 - 17:00	Jurusan Teknik Mesin Universitas Negeri Semarang	\N	\N
3353	 BRAWIJAYA TOURNAMENT 2020 	Lain-lain	14 Sep 2020 - 07 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3352	 [ MUN WORKSHOP 2020 ] 	Seminar	07  - 08 Nov 2020	08:00 - 20:00	Indonesia	\N	\N
3351	 BIOLOGY SCIENTIFIC COMPETITION 	Lain-lain	01 Okt 2020 - 28 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3350	 UNJ Short Movie Festival 2020 	Lain-lain	10 Sep 2020 - 16 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3349	 BRINGING JOY THROUGH ART DURING SOCIAL DISTANCING 	Expo	18 Sep 2020 - 10 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3348	 Program Studi Diploma 3 Akuntansi Fakultas Bisnis Universitas Bina Insani 	Lain-lain	14 Sep 2020 - 24 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3347	 Webinar “Breast Cancer: Raise Your Awareness 	Seminar	17  - 18 Okt 2020	09:00 - 13:00	Indonesia	\N	\N
3346	 Kompetisi Videografi 	Lain-lain	24 Agu 2020 - 28 Okt 2020	00:00 - 16:00	Indonesia	\N	\N
3345	 SEMINAR NASIONAL INFORMATIKA IFEST UNPAD 2020 	Seminar	10  - 11 Okt 2020	09:00 - 12:00	Indonesia	\N	\N
3344	 IELTS Prediction 	Lain-lain	01  - 31 Okt 2020	09:00 - 16:00	Indonesia	\N	\N
3343	 PAPER AND POSTER COMPETITION 	Lain-lain	02  - 23 Okt 2020	09:00 - 16:00	Indonesia	\N	\N
3342	 Lomba Cipta Puisi dan Lomba Poster Inspiratif 	Lain-lain	25 Sep 2020 - 31 Okt 2020	09:00 - 16:00	Indonesia	\N	\N
3341	 OPENING OLIVE 2020 Find your healthy lifestyle in new normal era 	Seminar	05  - 05 Okt 2020	20:00 - 22:00	Indonesia	\N	\N
3340	 HOMEBAND FEB UB PROUDLY PRESENT 	Musik	10  - 10 Okt 2020	07:00 - 10:00	zoom meeting	\N	\N
3339	 𝐓𝐀𝐋𝐊 𝐓𝐎 𝐕𝐈𝐑𝐀𝐋 𝐂𝐎𝐍𝐓𝐄𝐍𝐓 𝐂𝐑𝐄𝐀𝐓𝐎𝐑𝐒 𝐀𝐍𝐃 𝐈𝐍𝐃𝐔𝐒𝐓𝐑𝐘-𝐑𝐄𝐍𝐎𝐖𝐍𝐄𝐃 𝐏𝐑𝐎𝐅𝐄𝐒𝐒𝐈𝐎𝐍𝐀𝐋𝐒 	Seminar	02  - 03 Okt 2020	13:00 - 22:00	zoom meeting	\N	\N
3338	 Departemen Olahraga dan Seni BEM P PPKN FIS UNJ 	Lain-lain	03  - 25 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3337	 SUPERCONTINENTGAIA 	Lain-lain	02 Okt 2020 - 23 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3336	 SPARE XIV FKM UI Proudly Present 	Seminar	17  - 18 Sep 2020	00:00 - 23:09	zoom meeting	\N	\N
3334	 Seminar Nasional Kesehatan Masyarakat Series 2 HMKM UPNVJ 2020 	Seminar	03  - 04 Okt 2020	08:00 - 12:00	zoom meeting	\N	\N
3333	 HOMEBAND FEB UB PROUDLY PRESENT 	Pensi	10 Okt 2020 - 11 Sep 2020	13:00 - 22:00	zoom meeting	\N	\N
3332	 OPEN SUBMISSION: ONLINE BUSINESS PLAN COMPETITION 	Lain-lain	01 Sep 2020 - 31 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3331	 ROAD TO DIES NATALIS KE-7 STIMLOG 	Lain-lain	08 Sep 2020 - 08 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3329	 OPEN RECRUITMENT VOLUNTEER PURWOREJO JOBFAIR 2020 	Bursa Kerja	09  - 18 Nov 2020	09:00 - 16:00	Kab. Purworejo	\N	\N
3328	 CAREER STARTER PACK 	Seminar	26  - 26 Sep 2020	09:00 - 15:00	Indonesia	\N	\N
3327	 Ajang Kompetisi & Kreasi Muslimah - AKOSIMA 2020 	Expo	21  - 29 Sep 2020	00:00 - 00:00	Surabaya	\N	\N
3326	 Workshop Chromeleon Software 	Seminar	18  - 18 Okt 2020	09:00 - 15:00	Indonesia	\N	\N
3325	 HIMPUNAN MAHASISWA AKUNTANSI UNIVERSITAS UDAYANA 	Seminar	14 Sep 2020 - 01 Okt 2020	00:00 - 00:00	Kampus Udayana	\N	\N
3324	 ONLINE HSE TRAINING 	Expo	19  - 18 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3323	 PAMERAN MUSEUM SATU RUANG 	Expo	21  - 25 Sep 2020	00:00 - 00:00	Surabaya	\N	\N
3321	 KABIM FESTIVAL 2020 	Lain-lain	01 Okt 2020 - 10 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3319	 WEBINAR NASIONAL TEKNIK ELEKTRO 2020 	Seminar	11  - 11 Okt 2020	09:30 - 12:00	zoom meeting	\N	\N
3318	 [SOON!! GRAND EVENT POST COLLEGE WEEK 2020] 	Seminar	19  - 25 Sep 2020	15:00 - 21:00	zoom meeting	\N	\N
3317	 BRAND UI NATIONAL BUSINESS CASE COMPETITION IS OPEN 	Lain-lain	08 Sep 2020 - 21 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3316	 Webinar Nasional 	Seminar	26  - 26 Sep 2020	09:00 - 12:00	Google meeting room	\N	\N
3315	 Pelatihan Legislatif Fakultas Hukum Undip 2020 	Seminar	10  - 11 Okt 2020	09:00 - 21:00	zoom meeting	\N	\N
3314	 DIPLOMAT ENTREPRENEURIAL 	Seminar	17  - 17 Sep 2020	16:45 - 18:00	zoom meeting	\N	\N
3313	 National Mandarin Competition 2020 	Lain-lain	01 Agu 2020 - 30 Okt 2020	00:00 - 00:00	indonesia	\N	\N
3312	 BULAN BAKTI REGIO SURABAYA 2020 	Seminar	19  - 19 Sep 2020	18:30 - 21:30	zoom meeting	\N	\N
3311	 TALKSHOW YOUNG CREATIVE ENTREPRENEUR 	Seminar	20  - 20 Sep 2020	13:00 - 16:00	zoom meeting	\N	\N
3310	 Olimpiade Bidang Informatika 	Lain-lain	02 Sep 2020 - 18 Okt 2020	00:00 - 00:00	jawa timur	\N	\N
3309	 Naung 2020 	Seminar	19  - 19 Sep 2020	13:30 - 15:30	zoom meeting	\N	\N
3308	 SEMINAR NASIONAL “DAMPAK MEDIA TERHADAP POLITIK 	Lain-lain	19  - 19 Sep 2020	13:00 - 15:30	zoom meeting	\N	\N
3307	 CALL FOR ABSTRACTS 	Lain-lain	30 Agu 2020 - 06 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3306	 WEBINAR NASIONAL PSIKOLOGI 2020 	Seminar	19  - 19 Sep 2020	08:00 - 11:45	zoom meeting	\N	\N
3305	 I-STAR Challange Disnep Song Cover 	Lain-lain	03  - 16 Sep 2020	08:00 - 17:00	Indonesia	\N	\N
3304	 International Business Solution Competition (IBSC) 2020 	Expo	18 Agu 2020 - 18 Sep 2020	00:00 - 00:00	Bandung	\N	\N
3303	 ECONOMIC FAIR 2020 	Expo	15 Agu 2020 - 15 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3302	 TOEFL FISIP 	Lain-lain	19  - 20 Sep 2020	09:00 - 16:00	indonesia	\N	\N
3301	 WEBINAR NASIONAL SEVENTSEAS 2020 	Seminar	27  - 27 Sep 2020	08:30 - 11:30	indonesia	\N	\N
3300	 PLANT PROTECTION DAY 2020 	Expo	14 Sep 2020 - 14 Okt 2020	00:00 - 00:00	Bandung	\N	\N
3299	 SEPARATOR 1.0 “How to Get your Best at First Job Interview” 	Seminar	14  - 14 Sep 2020	19:00 - 22:00	Indonesia	\N	\N
3298	 CHERNIVAL 2020: Be a Powerful Millenial From Home 	Seminar	18  - 27 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3297	 Webinar Likista Series III 	Seminar	20  - 20 Sep 2020	10:00 - 16:00	Indonesia	\N	\N
3295	 PHARMACY FESTIVAL 2020 	Lain-lain	04 Sep 2020 - 30 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3293	 Webinar Nasional 2020Penanganan dan Pengolahan Limbah Sediaan Farmasi Dan Makanan di era New Normal 	Seminar	26  - 26 Sep 2020	08:00 - 16:00	Indonesia	\N	\N
3292	 OPEN HOUSE FKG UI 2020 	Lain-lain	12  - 13 Sep 2020	09:00 - 16:00	Indonesia	\N	\N
3291	 MADANI JURNALISTIK FAIR 2020 (MJF 2020) 	Seminar	28  - 28 Sep 2020	13:00 - 18:00	Indonesia	\N	\N
3290	 Management National Seminar 2020 	Seminar	12  - 12 Sep 2020	09:30 - 02:30	Zoom Meeting	\N	\N
3289	 Career Fest episode ke-02 	Lain-lain	01  - 30 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3288	 Photography Competition 2020 	Lain-lain	29 Agu 2020 - 15 Sep 2020	00:00 - 00:00	Yogyakarta	\N	\N
3287	 A ROADMAP FOR A BETTER INDONESIA 	Lain-lain	01  - 19 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3285	 PANCASILA FAIR 2020 	Expo	10  - 12 Sep 2020	13:00 - 20:00	Jl. Raya Lenteng Agung No.56-80, RT.1/RW.3, Srengseng Sawah, Jakarta, Kota Jakarta Selatan, Daerah K	\N	\N
3283	 SENAT MAHASISWA FAKULTAS FARMASI UNIVERSITAS PANCASILA PERIODE 2019/2020 	Lain-lain	20 Sep 2020 - 24 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3282	 2020[REFLEKSI TAHUNAN] 	Seminar	12  - 13 Sep 2020	10:00 - 17:30	Indonesia	\N	\N
3281	 LOMBA ESSAY NASIONAL PHARMACOPE UNS 2020 	Lain-lain	19 Agu 2020 - 27 Sep 2020	00:00 - 00:00	Surakarta	\N	\N
3280	 CIVIL EXPO 	Lain-lain	15 Jun 2020 - 10 Okt 2020	00:00 - 00:00	surabaya	\N	\N
3279	 FREE Voucher Diskon ni buat kalian yang Mau Liburan 	Lain-lain	05  - 25 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3277	 WORKSHOP EMPOWER YOURSELF WITH SPEECHPOWER: The Power in YOU 	Seminar	19  - 19 Sep 2020	09:00 - 17:00	Online (Virtual Meet-Up) : 80% Practice	\N	\N
3276	 Blak Blakan Bareng Bunda Rina 	Seminar	04  - 04 Sep 2020	19:00 - 21:30	Jl. Jend. Gatot Subroto No.RT.011, RW.006, Gaum, Kec. Tasikmadu, Kabupaten Karanganyar, Jawa Tengah	\N	\N
3275	 Be:ing, on being the advanced. 	Seminar	19  - 19 Sep 2020	13:00 - 16:00	Indonesia	\N	\N
3274	 Step One to Infinity in Digital Business 	Lain-lain	05  - 05 Sep 2020	13:00 - 15:00	Indonesia	\N	\N
3273	 Exclusive Customized Broadway Virtual Workshop Series 	Seminar	19 Sep 2020 - 17 Okt 2020	11:00 - 13:00	indonesia	\N	\N
3272	 RESWARA COMPETITION: VLOG & PHOTOGRAPHY 	Lain-lain	24 Agu 2020 - 10 Okt 2020	09:00 - 16:00	indonesia	\N	\N
3271	 INFOGRAFIS COMPETITION 	Lain-lain	01 Sep 2020 - 05 Des 2020	09:00 - 16:00	indonesia	\N	\N
3270	 Agro Festival 2020 	Lain-lain	20 Agu 2020 - 28 Sep 2020	09:00 - 16:00	indonesia	\N	\N
3269	 Chemistry Creative Contest 	Lain-lain	08 Agu 2020 - 07 Nov 2020	09:00 - 16:00	indonesia	\N	\N
3268	 SEMINAR NASIONAL KESEHATAN MASYARAKAT 	Seminar	20  - 20 Sep 2020	08:30 - 12:05	Dalam Jaringan (Online)	\N	\N
3266	 Exclusive Customized Broadway Virtual Workshop SeriesLed By Broadway Professional 	Lain-lain	18 Sep 2020 - 17 Okt 2020	10:00 - 12:00	Plaza Intercon	\N	\N
3265	 NATIONAL SEMINAR IS OPEN REGISTRATION 	Seminar	26 Sep 2020 - 27 Agu 2020	13:00 - 16:00	Jl. Prof. Sudarto No.13, Tembalang, Kec. Tembalang, Kota Semarang, Jawa Tengah 50275	\N	\N
3264	 [LOMBA ESSAY, DESAIN POSTER, STAND UP COMEDY DAN SEMINAR NASIONAL] 	Expo	20 Agu 2020 - 28 Sep 2020	00:00 - 00:00	Kampus IPB, Jl. Raya Dramaga, Babakan, Kec. Dramaga, Bogor, Jawa Barat 16680	\N	\N
3263	 PAMERAN FOTOGRAFI ONLINE 	Lain-lain	31 Agu 2020 - 06 Sep 2020	13:00 - 15:30	Dalam Jaringan	\N	\N
3261	 Lomba Vlog Kreatif 	Lain-lain	07 Agu 2020 - 18 Okt 2020	00:00 - 00:00	Jl. Ahmad Yani No.117, Jemur Wonosari, Kec. Wonocolo, Kota SBY, Jawa Timur 60237	\N	\N
3260	 PEKAN ILMIAH FISIKA XXXI TINGKAT NASIONAL TAHUN 2020 	Lain-lain	25 Agu 2020 - 24 Okt 2020	00:00 - 00:00	Sekaran, Kec. Gn. Pati, Kota Semarang, Jawa Tengah 50229	\N	\N
3259	 ABSTRACT SUBMISSION EXTENDED 	Lain-lain	15 Jul 2020 - 31 Okt 2020	00:00 - 00:00	Kampus IPB, Jl. Raya Dramaga, Babakan, Kec. Dramaga, Bogor, Jawa Barat 16680	\N	\N
3258	 CAREER TALK UI 2020 	Seminar	29 Agu 2020 - 26 Sep 2020	13:00 - 20:00	Indonesia	\N	\N
3256	 Visual Graphic Online Exhibition 	Expo	24 Agu 2020 - 07 Sep 2020	00:00 - 23:59	Indonesia	\N	\N
3255	 PRESIDENT UNIVERSITY STUDENT ORIENTATION 2020 	Expo	24 Agu 2020 - 25 Sep 2020	00:00 - 23:59	Jakarta	\N	\N
3254	 INFOGRAPHIC COMPETITION 	Lain-lain	15 Agu 2020 - 07 Nov 2020	09:00 - 16:00	Indonesia	\N	\N
3253	 MAPAGAMA MINI COMPETITION 2020 	Expo	25 Jul 2020 - 10 Sep 2020	00:00 - 23:59	UGM	\N	\N
3251	 FESTIVAL GIZI 2020 	Lain-lain	01 Agu 2020 - 13 Sep 2020	23:59 - 23:59	Dalam Jaringan	\N	\N
3250	 Bincang basket online UPGRADING KNOWLEDGE & SKILLS DURING PANDEMIC ERA 	Seminar	22  - 22 Agu 2020	13:00 - 16:00	Dalam Jaringan	\N	\N
3249	 Reservasi Seat New Normal Cafe 	Lain-lain	21  - 21 Agu 2020	18:20 - 21:00	New Normal Cafe	\N	\N
3248	 Islamic Administration Fair (ISLAF) 2020 	Seminar	18 Agu 2020 - 18 Sep 2020	08:00 - 12:00	Google Meet / Zoom	\N	\N
3247	 [OPEN REGISTRATION BAF 2020] 	Expo	03 Agu 2020 - 18 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3246	 Sharia Economic Smart Competition (SESO) 2020 	Lain-lain	07 Jul 2020 - 28 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3245	 KOMPETISI BANGUNAN AIR INDONESIA 2020 	Lain-lain	14 Agu 2020 - 28 Nov 2020	00:00 - 00:00	Indonesia	\N	\N
3244	 Workshop Seni Ars UI 2020 	Lain-lain	25  - 30 Agu 2020	13:00 - 16:00	Daring	\N	\N
3242	 LOMBA POSTER NASIONAL 	Lain-lain	10 Agu 2020 - 10 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3240	 Video Creative Competition 	Lain-lain	25 Jul 2020 - 08 Nov 2020	09:00 - 16:00	Dalam Jaringan (Online)	\N	\N
3239	 Dealing With Social Anxiety 	Seminar	15  - 15 Agu 2020	15:00 - 17:00	Dalam Jaringan (Via Zoom)	\N	\N
3238	 FESTIVAL HIMAISTRA PAPER COMPETITION 2020 	Lain-lain	04 Agu 2020 - 06 Sep 2020	00:00 - 12:00	[online]	\N	\N
3237	 IGREEC 2020 (Industrial Green Competition) 	Lain-lain	21  - 24 Sep 2020	00:00 - 00:00	Indonesia	\N	\N
3236	 CIVIL EXPO 2020 	Lain-lain	15 Jun 2020 - 10 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3235	 [ROADSHOW GIZI UI: INTUITION] 	Lain-lain	22  - 22 Agu 2020	13:00 - 16:00	Indonesia	\N	\N
3234	 LOMBA KARYA TULIS ILMIAH NASIONAL 	Lain-lain	15 Jul 2020 - 15 Okt 2020	00:00 - 00:00	Indonesia	\N	\N
3233	 LAND OF GEOSCIENCE 	Sport	21 Jul 2020 - 22 Nov 2020	00:00 - 00:00	Jl. SWK Jl. Ring Road Utara No.104, Ngropoh, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Isti	\N	\N
3232	 INTERIOR DESIGN WEEK 2.0: ONLINE EXHIBITION, BEDAH KARYA, TALK SHOW & SHARING SESSION 	Seminar	03  - 08 Agu 2020	09:00 - 13:00	Indonesia	\N	\N
3231	 PEMUDA SEMANGAT BANTU BANGSA 	Lain-lain	15 Jul 2020 - 08 Agu 2020	00:00 - 00:00	Indonesia	\N	\N
3230	 SEMINAR & CONFERENCE NASIONAL KEOLAHRAGAAN 	Sport	12 Sep 2020 - 26 Jul 2020	00:00 - 00:00	Jl. Semarang No.5, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145	\N	\N
3229	 Databoks Competition 	Sport	02 Jul 2020 - 14 Agu 2020	00:00 - 00:00	Indonesia	\N	\N
3228	 LOMBA MENULIS SKENARIO FILM 	Lain-lain	23 Jul 2020 - 15 Sep 2020	00:00 - 00:00	Jl. Walisongo No.3-5, Tambakaji, Kec. Ngaliyan, Kota Semarang, Jawa Tengah 50185	\N	\N
3227	 [International Organizations Studies Talkshow and Competition (IOSTC) 2020] 	Lain-lain	20 Jul 2020 - 04 Nov 2020	00:00 - 00:00	Hasil Telusur Jl. SWK Jl. Ring Road Utara No.104, Ngropoh, Condongcatur, Kec. Depok, Kabupaten Slema	\N	\N
3226	 MILLENNIAL PRENEUR BAZNAS 	Lain-lain	15  - 30 Jul 2020	09:00 - 16:00	Dalam Jaringan (Online)	\N	\N
3225	 HARI ANAK NASIONAL 2020 KOTA SEMARANG 	Pensi	23 Jul 2020 - 18 Agu 2020	07:30 - 20:30	Dalam Jaringan (Online)	\N	\N
3224	 Content Marketing Camp 	Lain-lain	01 Jul 2020 - 30 Sep 2020	09:00 - 16:00	Offline & Online Class	\N	\N
3223	 STUDENT LIFE UPH PRESENTS] 	Donasi	13  - 23 Jul 2020	00:00 - 00:00	Indonesia	\N	\N
3222	 INFEST TALK 	Seminar	25  - 25 Jul 2020	09:30 - 15:10	Via ZOOM	\N	\N
3221	 Proudly Present, Pet Care Day 2020 	Seminar	08  - 09 Agu 2020	00:00 - 00:00	Kampus IPB, Jl. Raya Dramaga, Babakan, Kec. Dramaga, Bogor, Jawa Barat 16680	\N	\N
3219	 START 	Seminar	25  - 26 Jul 2020	00:00 - 00:00	Hasil Telusur Jl. Menteng Raya No.13, RT.1/RW.10, Kb. Sirih, Jakarta, Kota Jakarta Pusat, Daerah Khu	\N	\N
3218	 OPEN REGISTRATION VETERAN BUSINESS CASE COMPETITION 	Sport	20 Jul 2020 - 26 Sep 2020	00:00 - 00:00	Hasil Telusur Jl. SWK Jl. Ring Road Utara No.104, Ngropoh, Condongcatur, Kec. Depok, Kabupaten Slema	\N	\N
3217	 NSPDC 2020 	Lain-lain	11 Jul 2020 - 11 Agu 2020	09:00 - 04:00	Dalam Jaringan (Online)	\N	\N
3215	 “Being an Eco Traveler” 	Seminar	17  - 17 Jul 2020	15:00 - 20:00	bekasi	\N	\N
3212	 PendaftaranMahasiswa Baru 	Lain-lain	01 Jul 2020 - 31 Agu 2020	00:00 - 00:00	Jln. Tanjung Duren Barat II No 1, Grogol Petamburan, Jakarta Barat	\N	\N
3211	 NutResearch 2020 	Lain-lain	18 Mei 2020 - 11 Jul 2020	00:00 - 00:00	Jl. Airlangga No.4 - 6, Airlangga, Kec. Gubeng, Kota SBY, Jawa Timur 60115	\N	\N
3210	 The Contribution of Millennials in response to Covid-19 	Seminar	10  - 10 Jul 2020	14:00 - 16:00	Jababeka Education Park, Jl. Ki Hajar Dewantara, RT.2/RW.4, Mekarmukti, North Cikarang, Bekasi, West	\N	\N
3209	 PMB Prodi Analisis Kimia FMIPA UII 	Lain-lain	20 Jun 2020 - 31 Jul 2020	08:00 - 17:00	Jln. Kaliurang km 14.5, Sleman, Yogyakarta 55584	\N	\N
3208	 PERMUTASI (Kompetisi Paper Matematika Tingkat Nasional) 2020 	Lain-lain	29 Jun 2020 - 23 Nov 2020	00:00 - 00:00	Bulaksumur, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281	\N	\N
3206	 [LEADERS TALK SERIES: SOCIAL RESPONSIBILITY IN THE AREA OF PHYSICAL DISTANCING 	Seminar	04  - 05 Jul 2020	10:00 - 14:00	Indonesia	\N	\N
3205	 Webinar Nasional Pentingnya Peran Farmasi di Era Tatanan New Normal Pandemi COVID-19 	Seminar	15  - 15 Jul 2020	08:00 - 16:00	Universitas Mathla’ul Anwar Banten	\N	\N
3204	 SCHOLARSHIP STARTS HERE 	Seminar	11  - 12 Jul 2020	13:00 - 16:30	Jalan Dr. T. Mansur No.9, Padang Bulan, Kec. Medan Baru, Kota Medan, Sumatera Utara 20222	\N	\N
3203	 KUESIONER BERHADIAH GOPAY 	Musik	30  - 14 Jun 2020	00:00 - 00:00	Jl. R.A.Kartini, RT.14/RW.6, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibuko	\N	\N
3202	 Program Pemagangan 	Lain-lain	26 Okt 2020 - 15 Nov 2020	09:00 - 21:00	SERBAPROMO MART  Jl. Gatot Subroto RT 011 RW 006, Kel. Gaum, Kec. Tasikmadu, Kab. Karanganyar	\N	\N
3201	 Perayaan Wisuda Juli 2020 	Lain-lain	17  - 18 Jul 2020	07:00 - 20:00	Dalam Jaringan (Online)	\N	\N
3200	 Live Try Out @detikcom 	Lain-lain	30  - 30 Jun 2020	13:00 - 15:00	Online	\N	\N
3199	 OPREC ANGGOTA IMAPELA 	Lain-lain	26  - 30 Jun 2020	00:00 - 00:00	Online	\N	\N
3198	 Dancestancing & Music Collaboration Challenge 	Lain-lain	06 Jun 2020 - 13 Jul 2020	08:00 - 00:00	Universitas Negeri Jakarta	\N	\N
3196	 Pelatihan Logistik UNS 	Lain-lain	17  - 19 Jun 2020	09:00 - 12:00	Online	\N	\N
3195	 Antara Kopi, Gaya Hidup, dan Kesehatan 	Seminar	28  - 28 Jun 2020	12:00 - 15:00	zoom meeting	\N	\N
3193	 Mampukah Indonesia Menghadapi New Normal? 	Seminar	13  - 13 Jun 2020	03:50 - 17:50	https://bit.ly/webinar-hmif02	\N	\N
3190	 PHYSICS FAIR 2020 LKTI 	Lain-lain	02 Jun 2020 - 11 Agu 2020	08:00 - 15:00	Gedung Rektorat Universitas Padjadjaran	\N	\N
3189	 Webinar Creative Talk - DKV IIB Darmajaya 	Seminar	13  - 20 Jun 2020	14:00 - 15:30	Bandar Lampung, Lampung	\N	\N
3187	 [PILLOW: PILAH PILIH TALKSHOW] 	Seminar	31  - 31 Mei 2020	14:00 - 16:30	Jl. Raya Bandung Sumedang KM.21, Hegarmanah, Kec. Jatinangor, Kabupaten Sumedang, Jawa Barat 45363	\N	\N
3186	 MUSIC FESTIVAL SURVEY 	Musik	29 Mei 2020 - 30 Jun 2020	00:00 - 00:00	Jl. Margonda Raya, Pondok Cina, Kecamatan Beji, Kota Depok, Jawa Barat 16424	\N	\N
3181	 Lomba Esai Nasional FOSIL (ESENSIAL) 2020 	Lain-lain	13 Mei 2020 - 17 Jun 2020	22:33 - 23:59	Secara daring	\N	\N
3180	 CERCo 2020 	Expo	02 Mei 2020 - 23 Okt 2020	00:00 - 00:00	Universitas Diponegoro	\N	\N
3179	 DSC TALK SERIES 	Seminar	10  - 10 Mei 2020	15:00 - 16:30	Youtube	\N	\N
3178	 Kartini Dewantara 2020: Belajar Dalam Keterbatasan 	Expo	01  - 14 Mei 2020	00:00 - 00:00	Universitas Sampoerna	\N	\N
3177	 Creative Youth Hidup Sehat #DiRumahAja 	Seminar	06  - 06 Mei 2020	15:00 - 17:20	Live Streaming Instagram	\N	\N
3174	 UIN Suska Riau Peduli Covid-19 	Donasi	17  - 26 Apr 2020	08:00 - 10:30	Kecamatan Tampan	\N	\N
3169	 Dyouthizen Virtual Class 	Seminar	14  - 15 Apr 2020	13:00 - 17:00	#darirumahsaja	\N	\N
3167	 Bersama Lawan Corona 	Donasi	01  - 30 Apr 2020	00:00 - 00:00	Surakarta	\N	\N
3166	 UMKM Lawan Corona 	Donasi	31 Mar 2020 - 30 Apr 2020	00:00 - 00:00	Indonesia	\N	\N
3162	 Bersama Lawan Corona 	Donasi	26 Mar 2020 - 05 Jun 2020	00:00 - 00:00	Indonesia	\N	\N
3161	 Gebyar Ilmiah Mahasiswa Nasional 2020 	Lain-lain	24  - 28 Jun 2020	07:30 - 18:00	Kampus II UIN Sumatera Utara Jln. William Iskandar Ps. V Medan Estate, Kec. Percut Sei Tuan	\N	\N
3158	 JOB FAIR USB 2020 	Bursa Kerja	10  - 11 Jun 2020	09:00 - 16:00	UNIVERSITAS SETIA BUDI (Jl. Letjen Sutoyo, Mojosongo)	\N	\N
3148	 ARKANANTA 2020 	Lain-lain	12  - 15 Mar 2020	08:00 - 17:00	Jl. Ir H. Juanda No.95, Cemp. Putih, Kec. Ciputat, Kota Tangerang Selatan, Banten 15412	\N	\N
3145	 OOTB.FESTIVAL 2020 	Lain-lain	04  - 04 Apr 2020	08:00 - 21:00	Kampus 1 Universitas PGRI Yogyakarta	\N	\N
3134	 SMK N 1 Sragen Job Fair 2020 	Bursa Kerja	09  - 10 Jun 2020	09:00 - 16:00	SMK N1 Sragen	\N	\N
3133	 EMBRACE 	Lain-lain	29  - 29 Mar 2020	07:00 - 12:00	FK-KMK UGM	\N	\N
3132	 Lowongan Pekerjaan 	Bursa Kerja	05  - 25 Mar 2020	10:00 - 14:00	Seluruh Indonesia	\N	\N
3130	 Public Expose 8.28 	Expo	16  - 21 Mar 2020	09:00 - 18:00	Jakarta Creative Hub	\N	\N
3128	 National Talk Day 2020 	Seminar	14  - 14 Apr 2020	07:30 - 13:00	Auditorium FTI Universitas Kristen Satya wacana	\N	\N
3125	 Musbaqah SSG 2020 	Lain-lain	11  - 19 Apr 2020	08:00 - 22:00	s	\N	\N
3124	 Sharing Time with Shifrunn 	Seminar	07  - 07 Mar 2020	08:00 - 12:00	aula kantor disnaker sumbar	\N	\N
3123	 The Role Of Anatomic Pathology In The Diagnosis Of Lung Cancer 	Seminar	15  - 15 Mar 2020	07:00 - 16:00	Hotel Grand.HAP, Jl.Slamet.Riyadi No.331 Purwosari,Laweyean Surakarta,Jawa Tengah,57142	\N	\N
3122	 hospitour 2020 EARTH 	Lain-lain	14  - 16 Apr 2020	07:00 - 17:31	universitas pelita harapan	\N	\N
3121	 Seminar Nasional dan Workshop Fisioterapi 2020 Pendekatan Komprehensif pada Cerebral Palsy 	Seminar	19  - 19 Apr 2020	06:45 - 16:50	Aula Kahuripan 303 Kampus C, Universitas Airlangga	\N	\N
3120	 Seminar Education talks (edutalks) 	Seminar	29  - 29 Peb 2020	08:00 - 14:45	Aula Gedung A FKM UI	\N	\N
3119	 TABLIGH AKBAR 2020 MI Muhammadiyah PK Kartasura 	Seminar	29  - 29 Peb 2020	07:30 - 11:30	Jl. Slamet Riyadi No.80 Kartasura, Sukoharjo	\N	\N
3118	 UNITY Competition 2020 #8 	Lain-lain	01 Peb 2020 - 04 Apr 2020	08:00 - 16:00	Universitas Negeri Yogyakarta	\N	\N
3117	 Accounting Competition JEANS 2020 	Lain-lain	23 Mar 2020 - 15 Apr 2020	07:30 - 05:00	Universitas Mercu Buana	\N	\N
3116	 Hima Cup 2020 	Sport	28  - 29 Mar 2020	07:30 - 15:20	Jogokaryan Futsal	\N	\N
3115	 FORSA (Manfaat AI untuk eksistensi manusia di bidang industry) 	Seminar	26  - 26 Mar 2020	13:00 - 16:00	universitas bakrie	\N	\N
3114	 FESTIVAL KAUM MUDA - BURSA KERJA INKLISIF KABUPATEN REMBANG 	Bursa Kerja	26  - 27 Peb 2020	09:00 - 16:00	GEDUNG HAJI (Jl. Pemuda KM.3, Rambutmalang, Kabongan Kidul, Kec. Rembang)	\N	\N
3113	 Workshop PERMIKOMNAS wil 4 Banten 	Lain-lain	07  - 07 Mar 2020	09:00 - 16:00	STMIK Insan Pembangunan, Bitung	\N	\N
3112	 START AND SCALE UP YOUR BUSINESS 	Seminar	13  - 13 Mar 2020	08:00 - 11:30	Hall Bukit Sekipan	\N	\N
3111	 Seminar Nasional Creativepreneur 	Seminar	26  - 26 Peb 2020	08:00 - 12:00	Graha Sarjana Universitas Sahid Surakarta	\N	\N
3110	 PEKAN LINTAS AGAMA 2020 	Pensi	15 Peb 2020 - 11 Apr 2020	08:00 - 23:00	UIN SUNAN AMPEL SURABAYA	\N	\N
3109	 PORSENI (pekan Olahraga dan Seni) 	Sport	18 Mar 2020 - 18 Apr 2020	14:00 - 17:00	Menyesuaikan	\N	\N
3108	 Beauty Class With Wardah X Wijaya Platinum Clinic 	Lain-lain	14  - 14 Mar 2020	13:00 - 15:00	Wijaya Platinum Clinic Pamulang	\N	\N
3107	 Techcomfest 2020 	Seminar	22  - 22 Peb 2020	08:00 - 11:30	Polines	\N	\N
3106	 Penyuluhan NO LGBT 	Lain-lain	06  - 06 Mar 2020	12:00 - 17:00	Gedung STIKes Jayakarta Lt.8	\N	\N
3105	 Sharia Economic Week 8 	Lain-lain	20  - 21 Mar 2020	07:00 - 17:00	Universitas Muhammadiyah Yogyakarta	\N	\N
3103	 Posh Fest #POSHTRICKSHOTCHALLENGE 	Sport	11  - 11 Peb 2020	00:00 - 00:00	JABODETABEK	\N	\N
3102	 NESCO 2020 	Seminar	08  - 08 Mar 2020	07:30 - 14:00	Hotel Crystal Lotus	\N	\N
3101	 Djota Games 2020 ( D'Journey Of The Accounting Games 2020 ) 	Lain-lain	19 Peb 2020 - 04 Apr 2020	11:00 - 11:00	Universitas Dinamika	\N	\N
3100	 DCMD 2020 	Lain-lain	21  - 27 Mar 2020	08:15 - 14:30	HALL gedung c FEB	\N	\N
3099	 Festival Manajemen 2020 	Pensi	21  - 21 Mar 2020	13:00 - 21:00	Sasana Tinju GOR Bulungan Jakarta	\N	\N
3098	 Festival of Engineering and Technology 3.0 	Lain-lain	04  - 04 Apr 2020	08:00 - 16:00	Sampoerna University, Jakarta Selatan	\N	\N
3097	 Sound Design & Music Production Short Course Program 2020 	Seminar	22 Peb 2020 - 21 Mar 2020	09:00 - 12:00	UPH Karawaci - Tangerang	\N	\N
3096	 BEAST 	Sport	17  - 21 Peb 2020	16:00 - 21:00	UPH Surabaya	\N	\N
3095	 IMM Akbar 	Lain-lain	08  - 28 Mar 2020	08:00 - 13:00	Fakultas teknik universitas Muhammadiyah Jakarta	\N	\N
3094	 BiemsRadio Podcast in Communication Summit 2020 	Lain-lain	09 Mar 2020 - 12 Apr 2020	08:00 - 17:00	Universitas Bunda Mulia, Ancol, Jakarta Utara	\N	\N
3093	 Festival of Engineering and Technology 3.0 	Lain-lain	04  - 04 Apr 2020	09:00 - 14:00	Sampoerna University, Jakarta Selatan	\N	\N
3092	 ALSTROMERIA 	Musik	29  - 29 Peb 2020	12:00 - 22:00	Gedung Sasana Krida (GSK) kampus UNJANI Cimahi jl. Terusan jendral sudirman, kota cimahi.	\N	\N
3091	 Open House campus KKG 	Lain-lain	16  - 16 Peb 2020	12:00 - 15:00	Kampus Kwik Kian Gie School of Business	\N	\N
3090	 Talk Show Kadin Karanganyar 	Seminar	22  - 22 Peb 2020	11:00 - 12:00	Pendopo Rumah Dinas Bupati Karanganyar	\N	\N
3089	 Lomba Inovasi Beton Nasional 	Lain-lain	03 Peb 2020 - 27 Mar 2020	07:30 - 15:30	Universitas Veteran Bangun Nusantara Sukoharjo	\N	\N
3088	 HARI AIR SEDUNIA 	Lain-lain	21  - 21 Mar 2020	08:00 - 17:00	Sungai Kalimas Surabaya	\N	\N
3087	 WIDYA MANDALA SPEAKS ON ACCOUNTING 	Seminar	16  - 18 Apr 2020	07:30 - 18:00	Kampus Dinoyo Universitas Katolik Widya Mandala Surabaya	\N	\N
3086	 Lomba Karya Tulis Ilmiah Nasional Mewujudkan Insfrastruktur Berkelanjutan di Ibu Kota Baru 	Lain-lain	25  - 28 Peb 2020	07:30 - 00:00	Universitas Veteran Bangun Nusantara Sukoharjo	\N	\N
3085	 Screen 9 	Lain-lain	17 Mar 2020 - 19 Apr 2020	07:30 - 12:00	Gedung Rekayasa Sistem Komputer FMIPA Untan Pontianak	\N	\N
3084	 Speak Out Competition 	Lain-lain	21  - 21 Mar 2020	08:00 - 01:00	Universitas Bina Insani	\N	\N
3083	 HI-TECHNOLOGY 2020 	Lain-lain	02  - 03 Mar 2020	07:00 - 17:00	UNIVERSITAS DIAN NUSWANTORO	\N	\N
3082	 Harlah Prodi Tadris Bahasa Indonesia 	Lain-lain	03  - 03 Mar 2020	07:30 - 03:30	IAIN MADURA	\N	\N
3081	 Seminar Nasional Expo Capus & Job Fair 2020 	Expo	22  - 22 Peb 2020	08:30 - 17:00	MAN 1 Malang	\N	\N
3079	 CEFEST 2020 	Seminar	14  - 16 Peb 2020	09:00 - 16:00	Institut Teknologi Indonesia, Jl. Raya Puspiptek, Setu, Kec. Serpong, Kota Tangerang Selatan, Banten	\N	\N
3078	 Beauty Class With Wardah X CGV 	Lain-lain	22  - 22 Peb 2020	13:00 - 15:00	CGV Transmart Graha Raya Bintaro	\N	\N
3077	 Call for paper 	Expo	21 Mar 2020 - 21 Peb 2020	08:30 - 14:25	UMY	\N	\N
3076	 MonsoonSIM ERP Competition 	Expo	20  - 21 Mar 2020	07:30 - 15:00	UMY	\N	\N
3075	 Accounting Olympiad 	Expo	20  - 21 Mar 2020	08:30 - 14:30	UMY	\N	\N
3074	 RAKERNAS ICSB Karanganyar 2020 	Lain-lain	13  - 15 Mar 2020	08:00 - 08:00	Bukit Sekipan, Tawangmangu, Karanganyar, Jawa Tengah	\N	\N
3073	 MPC Marketing Plan Competition 	Lain-lain	29  - 29 Mar 2020	07:00 - 14:00	Ruang Seminar Rektorat Lt IV Universitas Muria Kudus	\N	\N
3072	 PAGELARAN SASTRA 	Seminar	17  - 19 Mar 2020	08:00 - 18:01	Bangsal Pancasila, Uwks	\N	\N
3071	 Live Music Magnetic #2 Guyon Waton 	Musik	31  - 31 Mar 2020	17:00 - 22:00	Auditorium Universitas Muria Kudus	\N	\N
3070	 SEMINAR NASIONAL BEASISWA 	Seminar	16  - 16 Peb 2020	08:00 - 12:00	Aula Lantai 4 Pascasarjana UIN Malang	\N	\N
3069	 Lomba Essay Nasional tingkat Perguruan Tinggi se-Indonesia 	Lain-lain	01  - 22 Peb 2020	08:00 - 16:00	Kampus viktor. Lt.11 Universitas Pamulang	\N	\N
3068	 Sharing Technology 2020 	Seminar	14  - 14 Mar 2020	07:30 - 14:00	Gedung Balaikota Semarang	\N	\N
3067	 Quick English Club 	Lain-lain	10  - 10 Peb 2020	15:00 - 16:00	Waring Rojo Duren Karanganyar	\N	\N
3066	 Satya Wacana National Accounting Competition 2020 	Lain-lain	17  - 18 Apr 2020	12:00 - 12:00	Universitas Kristen Satya Wacana	\N	\N
3065	 International Volunteering Service  Break Your Limits Through International Volunteering Service 	Seminar	27  - 27 Peb 2020	08:30 - 12:05	Auditorium of Ahmad Dahlan Building Campus 3 IAIN SALATIGA	\N	\N
3064	 EXPO CAMPUS 	Expo	31 Jan 2020 - 01 Peb 2020	09:00 - 17:30	Gedung Wanita Karanganyar	\N	\N
3063	 Sudah Amankah Data Pribadi Anda? 	Seminar	23  - 23 Peb 2020	07:00 - 16:00	Aula Saba Karya Insan Pembangunan	\N	\N
3062	 UMN Korean Language Course Program 	Lain-lain	29 Peb 2020 - 14 Mar 2020	09:00 - 20:00	Universitas Multimedia Nusantara (UMN)	\N	\N
3059	 Pelatihan Pengolahan Data Penelitian Menggunakan Software SPSS. Kelas Fakultas Kedokteran, Kesehatan Masyarakat, Dokter Gigi dan sejenis. 	Seminar	15  - 15 Peb 2020	08:30 - 15:00	Wisma Menpora, Dilo Jakarta, Lt. 2, Jakarta.	\N	\N
3058	 SEMINAR NASIONAL BUMI DAN ATMOSFER 2020 	Seminar	13 Peb 2020 - 19 Mar 2020	07:00 - 15:00	TITAN CONVENTION CENTER jl. boulevard bintaro block B7/B1 no. 5 bintaro jaya, sektor 7, tangerang	\N	\N
3057	 ATMOSPHERIC SCIENCE OLYMPIADS 	Lain-lain	15 Peb 2020 - 18 Mar 2020	06:00 - 17:00	KAMPUS STMKG JL. PERHUBUNGAN 1 NO.5, PONDOK BETUNG, PONDOK AREN, TANGERANG SELATAN	\N	\N
3056	 Scale Up Your Local Brand Business In Efficient Way 	Seminar	30  - 30 Jan 2020	18:00 - 21:00	Estubizi Coworking Space Jl. Wolter Monginsidi 71, Kebayoran Baru - Jakarta Selatan	\N	\N
3055	 Video and Poster Competition NESCO 2020 	Lain-lain	26 Des 2019 - 07 Peb 2020	00:00 - 21:00	Universitas Gadjah Mada	\N	\N
3054	 WIMA CHAMPIONSHIP 	Sport	29  - 29 Peb 2020	07:00 - 18:00	Gor Budi Langgeng	\N	\N
3053	 Bimbingan Pasca Ujian Nasional (BPUN) 2020 	Expo	05  - 19 Apr 2020	08:00 - 19:00	Jakarta Barat	\N	\N
3052	 Diesnatalis'22 	Lain-lain	11 Jan 2020 - 06 Mar 2020	07:00 - 05:30	Aula Akper ps rebo	\N	\N
3051	 Donasi Beasiswa 	Donasi	01 Jan 2020 - 30 Apr 2020	00:00 - 23:59	Online Eventkampus	\N	\N
3049	 Lomba Essay Nasional tingkat Perguruan Tinggi se-Indonesia 	Lain-lain	22  - 22 Jan 2020	08:00 - 17:00	Kampus viktor. Lt.11 Universitas Pamulang	\N	\N
3048	 Lomba Matematika Tingkat SMA dan SMK ke-VIII se Jawa Barat, Banten dan DKI Jakarta 	Lain-lain	23  - 23 Jan 2020	08:00 - 17:00	Gedung viktor, Lt.8.  Universitas Pamulang	\N	\N
3047	 SEMUSIM 	Seminar	25  - 25 Jan 2020	08:00 - 12:00	Universitas Ibn Khaldun Bogor	\N	\N
3046	 SEMAR (Specta Seminar) 	Seminar	24  - 24 Jan 2020	13:00 - 16:30	Gedung Fakultas Adab dan Bahasa, Lantai 4, IAIN Surakarta, Jalan Pandawa, Pucangan, Kartasura, Sukoh	\N	\N
3045	 BUKUPEDIA 4-BEDAH BUKU ANAK RANTAU BERSAMA A FUADI 	Seminar	31  - 31 Jan 2020	08:00 - 12:00	PPM MBS PUTRI YOGYAKARTA JL PIYUNGAN KM 2 MARANGAN BOKOHARJO PRAMBANAN SLEMAN YOGYAKARTA	\N	\N
3043	 Tryout SBMPTN Saintek dan Soshum 	Lain-lain	29  - 29 Peb 2020	06:30 - 14:30	Gedung F FKIP Universitas Sebelas Maret	\N	\N
3042	 ECOSEO JILID II 	Lain-lain	27  - 29 Jan 2020	08:00 - 12:00	KAMPUS B FKIP UHAMKA	\N	\N
3041	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF SOLORAYA 2019 	Bursa Kerja	04  - 05 Des 2019	09:00 - 16:00	Gedung Grha Wisata Niaga	\N	\N
3040	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF KEBUMEN 2019 	Bursa Kerja	05  - 06 Nov 2019	09:00 - 16:00	Gedung Pertemuan Setda Kebumen	\N	\N
3039	 SINERGI YOUTH CAREER FEST 2018 	Bursa Kerja	13  - 14 Nov 2018	09:00 - 16:00	BBPLK Semarang	\N	\N
3038	 Trilogi Accounting Competition (3Action) Part XI for SMA/SMK 	Lain-lain	31  - 31 Mar 2020	08:00 - 15:00	Universitas Trilogi	\N	\N
3037	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF SOLORAYA 2019 	Bursa Kerja	04  - 05 Des 2019	09:00 - 16:00	Gedung Grha Wisata Niaga Kota Surakarta	\N	\N
3036	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF KEBUMEN 2019 	Bursa Kerja	05  - 06 Nov 2019	09:00 - 16:00	Gedung Pertemuan Setda Kabupaten Kebumen	\N	\N
3035	 SINERGI YOUTH CAREER FEST 2018 	Bursa Kerja	13  - 14 Nov 2018	09:00 - 16:00	BBPLK Semarang (Jl. Brigjen Sudiarto No.118, Palebon, Pedurungan, Kota Semarang, Jawa Tengah)	\N	\N
3034	 National Vlog Competition 	Lain-lain	12  - 20 Peb 2020	07:00 - 12:10	Grha Mahardika Bujana, Universitas Budi Luhur	\N	\N
3032	 Seminar nasional 	Seminar	15  - 15 Peb 2020	08:00 - 13:00	Auditorium UIN Sunan Ampel Surabaya	\N	\N
3031	 Desain Competition Descomfirst 	Expo	06  - 07 Jun 2020	06:30 - 05:00	The Alana Hotel Surakarta	\N	\N
3030	 National English Education Debate 7.0 2020 	Lain-lain	27  - 29 Mar 2020	07:00 - 17:00	Universitas Muhammadiyah Yogyakarta	\N	\N
3029	 MIPA ROAD TO SCIENTIFIC PAPER AND SEMINAR 7 (MARSS#7) 	Lain-lain	21 Des 2019 - 24 Peb 2020	00:00 - 23:59	Universitas Negeri Yogyakarta	\N	\N
3028	 Lomba Matematika Tingkat SMA dan SMK ke-VIII se Jawa Barat, Banten dan DKI Jakarta 	Lain-lain	16  - 16 Jan 2020	08:00 - 15:00	Gedung viktor, Lt.8.  Universitas Pamulang	\N	\N
3027	 Produk 	Expo	01  - 27 Jan 2020	06:00 - 15:14	Insyitus agama islam negeri jember	\N	\N
3025	 SEVENTSEAS UB 	Lain-lain	01  - 31 Jan 2020	00:00 - 00:02	Feb Universitas Brawijaya	\N	\N
3022	 Business Plan Competition - Festival Manajemen Institut Bisnis Nusantara 	Lain-lain	17  - 17 Mar 2020	09:00 - 18:00	Aula Graha Institut Bisnis Nusantara Lt.4	\N	\N
3021	 Lomba Fotografi Biocell 2020 	Lain-lain	01 Jan 2020 - 21 Peb 2020	01:37 - 01:38	UNIVERSITAS ISLAM NEGERI SUNAN AMPEL SURABAYA	\N	\N
3020	 Lomba Essay Tingkat SMA/Sederajat 2020 	Lain-lain	30 Des 2019 - 14 Peb 2020	01:25 - 01:26	UNIVERSITAS ISLAM NEGERI SUNAN AMPEL SURABAYA	\N	\N
3019	 UI Design Fundamental Training X Tiket.Com 	Seminar	01  - 02 Peb 2020	09:00 - 17:00	IBIS Menteng Jakarta	\N	\N
3018	 EKUITAS INTERNATIONAL SEMINAR 2020 	Seminar	07  - 07 Jan 2020	08:00 - 12:00	KAMPUS STIE EKUITAS BANDUNG	\N	\N
3017	 Mathematics Science Competition 2020 	Lain-lain	22  - 22 Peb 2020	07:00 - 17:00	Auditorium USU	\N	\N
3015	 Entrepreneur Festival II 	Expo	01  - 02 Peb 2020	08:00 - 18:00	Kampus 1 Politeknik Negeri Ujung Pandang	\N	\N
3014	 11K SOLO OPEN UNS 2020 	Sport	08  - 08 Mar 2020	05:30 - 12:00	Depan Danau Universitas Sebelas Maret Surakarta (UNS)  Jl. Ir. Sutami 36A, Kentingan, Jebres, Suraka	\N	\N
3013	 Awarding Night DOCX Kalbis Institute 	Musik	11  - 11 Jan 2020	18:00 - 22:00	Auditorium I3L Lt.7	\N	\N
3011	 Math Revolution 2020 	Lain-lain	16 Des 2019 - 22 Peb 2020	08:00 - 17:00	Universitas Pamulang	\N	\N
3010	 Lomba Matematika Tingkat SMA dan SMK ke-VIII se Jawa Barat, Banten dan DKI Jakarta 	Lain-lain	09 Des 2019 - 16 Jan 2019	08:00 - 17:00	Gedung viktor, Lt.8.  Universitas Pamulang	\N	\N
3009	 Lomba Essay Nasional tingkat Perguruan Tinggi se-Indonesia 	Lain-lain	11 Des 2019 - 22 Peb 2019	08:00 - 15:00	Kampus viktor. Lt.11 Universitas Pamulang	\N	\N
3008	 Malam Puisi Airlangga 	Pensi	21  - 21 Des 2019	18:00 - 22:00	Fakultas Ilmu Budaya Universitas Airlangga	\N	\N
3007	 Kompetisi Matematika (KOMET) XIX 	Lain-lain	15  - 16 Peb 2020	07:00 - 20:00	Universitas Islam Negeri Maulana Malik Ibrahim Malang	\N	\N
3006	 Pameran Susur Foto 	Lain-lain	17  - 21 Des 2019	15:00 - 21:00	Aula Student Center UIN Syarif Hidayatullah Jakarta	\N	\N
3004	 Seminar National dan Talkshow Ready For Financial Revolution 	Seminar	21  - 21 Des 2019	07:00 - 17:00	Politeknik Negeri Bandung	\N	\N
3003	 National Accounting and Tax Olimpiade 	Lain-lain	20  - 21 Des 2019	07:00 - 17:00	Politeknik Negeri Bandung	\N	\N
3002	 Tabligh Akbar 2019 	Lain-lain	21  - 21 Des 2019	07:00 - 11:00	Laboratorium Terpadu Poltekkes Kemenkes Surabaya	\N	\N
3000	 Kuliah Akbar | Millenial Digital Creativepreneur Festival 2019 	Seminar	15  - 15 Des 2019	07:00 - 12:00	Gedung Bundar Al Asy'ari  Jl. MT. Haryono No.193, Dinoyo, Kec. Lowokwaru  Universitas Islam Malang	\N	\N
2996	 Donor Darah 	Donasi	16  - 18 Des 2019	09:00 - 13:00	Universitas Pakuan, Jl. Pakuan, RT.02/RW.06, Tegallega, Kecamatan Bogor Tengah, Kota Bogor, Jawa Bar	\N	\N
2995	 Pelantikan Panitia dan Pengajar Gerakan UI Mengajar 9 	Seminar	07  - 07 Des 2019	10:00 - 15:00	Balai Sidang Universitas Indonesia	\N	\N
2993	 Sinema Akhir Tahun 	Lain-lain	06  - 07 Des 2019	12:30 - 00:00	Teater Besar ISI Surakarta, Jl. Ki Hajar Dewantara No. 19, Jebres, Kota Surakarta	\N	\N
2992	 Gebyar Kharisma XIX 	Musik	29  - 29 Des 2019	15:00 - 22:00	Graha UBHARA	\N	\N
2991	 Call for Paper & Seminar 	Seminar	04  - 04 Des 2019	12:00 - 16:00	Universitas Trilogi	\N	\N
2990	 IFEXAR 2019 - INTER-FEST TELKOM UNIVERSITY 	Seminar	05  - 05 Des 2019	09:00 - 18:00	Telkom University Convention Hall	\N	\N
2989	 Agrifest 4.0 	Pensi	14  - 14 Des 2019	16:00 - 23:00	Fakultas Pertanian USU	\N	\N
2987	 HIMIE ECONOMIC RESEARCH AND OLYMPIAD 8TH 	Lain-lain	01 Des 2019 - 20 Jan 2020	07:00 - 07:00	UNIVERSITAS MUHAMMADIYAH YOGGYAKARTA	\N	\N
2986	 ARTEFAC UNS 	Lain-lain	10  - 28 Mar 2020	09:00 - 21:00	Surakarta	\N	\N
2985	 Maulid Nabi Muhammad SAW 	Lain-lain	16  - 16 Des 2019	08:00 - 12:00	Universitas Negeri Jakarta	\N	\N
2984	 SEMINAR NASIONAL FINTECH 	Seminar	03  - 03 Des 2019	09:00 - 12:00	Perpustakaan Nasional Republik Indonesia	\N	\N
2983	 IISIP FOODSTIVAL USE PLASTIC WISELY 	Lain-lain	07  - 07 Des 2019	10:00 - 17:00	Institut Ilmu Sosial dan Ilmu Politik Jakarta	\N	\N
2982	 Mechanniversary 13 , Modification contest 2019 	Lain-lain	21  - 21 Des 2019	08:00 - 21:01	Universitas Nusa Putra jln.Cibolang Kaler no.12 Cisaat kab.Sukabumi 43152	\N	\N
2981	 Festival Kaum Muda Solo Raya 	Seminar	04  - 05 Des 2019	09:00 - 16:00	Gedung Grha Wisata Niaga Kota Surakarta	\N	\N
2980	 Workshop Fotografi 	Seminar	14  - 14 Des 2019	08:00 - 11:00	Gedung N Universitas Semarang	\N	\N
2978	 pambar 2019 	Seminar	03  - 05 Des 2019	10:00 - 19:00	Lobby Universitas Sahid Jakarta Selatan	\N	\N
2977	 seminar internasional 	Seminar	02  - 02 Des 2019	08:00 - 13:00	uin syarif hidayatullah Jakarta	\N	\N
2974	 Seminar Nasional Kupas Tuntas Penyakit Autoimun 	Seminar	15  - 15 Des 2019	07:00 - 17:00	Hotel Swiss Belinn	\N	\N
2973	 NESCO 2020 	Lain-lain	08  - 08 Mar 2020	07:30 - 17:00	Yogyakarta	\N	\N
2972	 IKOR FUN RUN 	Sport	01  - 01 Nov 2019	06:00 - 11:00	Pelataran lab. Soegijono FIK UNNES	\N	\N
2970	 Gerakan Paskibra Semangat II ( GERANAT ) 	Lain-lain	21  - 22 Des 2019	06:00 - 18:00	Kampus A Universitas Negeri Jakarta	\N	\N
2969	 DINAMIKA FUTSAL CHAMPIONSHIPINTEGER 2019 	Sport	25  - 07 Nov 2019	09:06 - 10:20	Universitas Dinamika Lt 9	\N	\N
2968	 GREAT 6th ( Grand EconoChannel ) 	Seminar	27  - 27 Nov 2019	10:30 - 17:00	Aula Bung Hatta Gd. Pascasarjana Lt. 2 Kampus A UNJ	\N	\N
2967	 Seminar Nasional 	Seminar	30  - 30 Nov 2019	07:00 - 12:00	Gedung Serba Guna Politeknik Negeri Lampung	\N	\N
2966	 ASIG 13 [Area Science of IT and Games] 	Lain-lain	17  - 20 Des 2019	08:00 - 20:00	Universitas Paramadina	\N	\N
2963	 X Competition Of Stikja 2020 	Expo	18  - 18 Jan 2020	08:00 - 16:00	STIKes Jayakarta PKP	\N	\N
2959	 Seminar Financial Planning 2019 	Seminar	23  - 23 Nov 2019	08:00 - 13:00	Aula Ki Hajar Dewantara Lt.9, Gd. Ki Hajar Dewantara, Kampus A UNJ	\N	\N
2958	 Ahmad Dahlan Robotic Competition 2019 	Lain-lain	21  - 22 Des 2019	08:00 - 20:00	Technical Meeting (21 Desember 2019) - Ruang Serbaguna Lantai 10, Kampus 4 Gedung Utama Universitas 	\N	\N
2956	 COMFEST 2019 	Seminar	28 Nov 2019 - 14 Des 2019	08:30 - 01:00	Auditorium 1 Kampus 1	\N	\N
2955	 ON AIR Television Community Awards 2019 MMTC TV 	Pensi	23  - 23 Nov 2019	19:00 - 22:00	Auditorium STMM MMTC Yogyakarta	\N	\N
2954	 W&G (WEATHER ANDROMEDALY) 	Musik	14  - 14 Des 2019	08:00 - 23:00	Stikes jenderal achmad yani cimahi	\N	\N
2953	 FUD Expo 	Musik	04  - 04 Nov 2019	19:00 - 22:00	Hall FIT IAIN Surakarta	\N	\N
2952	 ELCCO ELECTRICAL AND COMPUTER COMPETITION 2020 	Lain-lain	07  - 08 Peb 2020	08:00 - 05:00	Aula Wiswakarma Fakultas Teknik Universitas Udayana & Gedung Agrokomplek Lt.4 Kampus Sudirman	\N	\N
2951	 SEMINAR NASIONAL SEKOLAH PECINTA INDONESIA #6 	Seminar	22  - 22 Nov 2019	13:00 - 17:30	Aula Lt. 3 Gedung KPLT Fakultas Teknik Universitas Negeri Yogyakarta	\N	\N
2950	 X Competition Of Stikja 2020 	Lain-lain	18  - 18 Jan 2020	08:00 - 17:00	Stikes Jayakarta PKP	\N	\N
2948	 The 9th UI Studentpreneurs 	Lain-lain	11  - 14 Peb 2020	09:00 - 15:00	Fakultas Ekonomi dan Bisnis, Universitas Indonesia	\N	\N
2947	 Blazture 2019 	Pensi	30  - 30 Nov 2019	16:00 - 22:00	Universitas Padjadjaran Jatinangor	\N	\N
2946	 THE 14TH EKUITAS CAREER EXPO 	Bursa Kerja	21  - 21 Nov 2019	08:30 - 16:00	KAMPUS STIE EKUITAS BANDUNG	\N	\N
2944	 OPEN RECRUITMENT VOLUNTEER FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF SOLORAYA 2019 	Bursa Kerja	04  - 05 Des 2019	09:00 - 16:00	Grha Wisata Niaga Surakarta	\N	\N
2943	 Atma Expression Music 3.0. ATLANTIS 	Musik	16  - 16 Nov 2019	16:00 - 21:30	UNIKA Atma Jaya Kampus 3 BSD	\N	\N
2941	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF SOLORAYA 2019 	Bursa Kerja	04  - 05 Des 2019	09:00 - 16:00	Gedung Grha Wisata Niaga Kota Surakarta	\N	\N
2939	 Festival Nasional Wirausaha Muda Udayana 	Lain-lain	01  - 02 Peb 2020	06:00 - 15:30	Ruang Nusantara, Gedung Agrokomplek lt. 4, Kampus Sudirman, Universitas Udayana	\N	\N
2938	 Lomba Rebana Umum Se Jawa Raya 	Musik	05  - 06 Des 2019	08:00 - 00:00	Auditorium Universitas Muria Kudus Gondang Manis, Bae, Kudus, Jawa Tengah	\N	\N
2936	 weshare 	Lain-lain	04  - 06 Des 2019	08:00 - 16:00	UIN SYARIF HIDAYATULLAH JAKARTA	\N	\N
2935	 FESTIVAL BUKU KARANGANYAR 2019 	Expo	07  - 13 Nov 2019	09:00 - 21:00	Gedung Perpustakaan Kab. Karanganyar	\N	\N
2934	 Dimensi Journalistic Fair 2019 Seminar Nasional Jurnalistik 	Seminar	23  - 23 Nov 2019	07:00 - 14:00	Ruang Auditorium, Politeknik Negeri Semarang	\N	\N
2933	 Dimensi Journalistic Fair 2019 Lomba Fotografi dan Poster 	Lain-lain	19 Agu 2019 - 10 Nov 2019	06:00 - 23:59	Politeknik Negeri Semarang	\N	\N
2932	 Perbanas Banking Competition 2019 	Seminar	07  - 07 Des 2019	08:30 - 12:00	Auditorium Hall A Kampus 1 STIE Perbanas Surabaya, Jalan Nginden Semolo 34-36 Surabaya 60118	\N	\N
2930	 Lomba Karya Tulis Ilmiah Perbanas Banking Competition 2019 	Lain-lain	01  - 01 Mar 2020	08:00 - 17:00	Auditorium Hall A Kampus 1 STIE Perbanas Surabaya, Jalan Nginden Semolo 34-36 Surabaya 60118	\N	\N
2929	 Gebyar PIAUD 	Lain-lain	25  - 25 Nov 2019	08:00 - 16:00	Audit II dan Amcor UIN Walisongo Semarang	\N	\N
2928	 GESIT 4.0 	Musik	30  - 30 Nov 2019	18:15 - 23:00	Gedung B6 FBS Universitas Negeri Semarang	\N	\N
2925	 Parade Beasiswa 2019 	Seminar	16  - 17 Nov 2019	09:00 - 15:00	Samantha Krida Universitas Brawijaya, Malang	\N	\N
2924	 MAGNIFICHOR 4th Annual Concert Korean Sonata (Miracle in November) 	Musik	16  - 16 Nov 2019	14:30 - 17:45	De Majestic Braga	\N	\N
2923	 HEPOSPHOR 1.0 	Pensi	06  - 06 Nov 2019	17:59 - 23:00	Kampus 1 Poltekkes Kemenkes Semarang	\N	\N
2922	 CESA (Community Sport and Art) 	Musik	15  - 17 Nov 2019	08:00 - 11:00	aula univ.singaperbangsa	\N	\N
2921	 PEKAN BUDAYA JAWA 2019 	Pensi	07  - 08 Nov 2019	08:00 - 23:00	Fakultas Ilmu Budaya UI, Depok	\N	\N
2920	 Seminar Nasional Diplonary HMD FISIP UNS 	Seminar	01  - 01 Des 2019	08:00 - 13:00	Auditorium UNS	\N	\N
2918	 Documentary Expo (DOCX) 2020 - Festival Film Dokumenter Kalbis Institute 	Lain-lain	17 Okt 2019 - 10 Des 2019	06:00 - 00:00	Kalbis Institute	\N	\N
2916	 Seminar Nasional Electro Day 	Seminar	07  - 07 Nov 2019	08:00 - 15:00	Adam Kurniawan Library President University	\N	\N
2915	 Seminar Hacking and Digital Forensics Exposed (Hadfex) 	Seminar	07  - 07 Nov 2019	08:00 - 16:00	Santika Premiere Hotel Yogya	\N	\N
2914	 HIMAFAR CARE 	Donasi	19  - 24 Nov 2019	07:30 - 17:00	Universitas Pakuan dan Desa Leuwisadang	\N	\N
2913	 Human Development Training 	Seminar	03  - 03 Nov 2019	09:00 - 15:00	Gedung koordinasi pemerintahan dan pembangunan wilayah 1 (BAKORWIL) Jalan Ir. H. djuanda No. 4Kota B	\N	\N
2912	 The Role of Islamic Finance in Achieving Sustainable Development 	Seminar	03  - 03 Nov 2019	08:00 - 13:00	Gedung Aula Al-Amanah Lt.5 Pusat Pemerintahan Kota Tangerang	\N	\N
2911	 EXPO FIP English Club UNJ (National English Debate and Speech Competition) 	Expo	15  - 17 Nov 2019	08:00 - 15:00	Kampus A Universitas Negeri Jakarta	\N	\N
2910	 Gema Mahasiswa Matematika 	Lain-lain	09  - 24 Nov 2019	07:30 - 01:00	Gd. FPMIPA A Universitas Pendidikan Indonesia	\N	\N
2906	 ANNIVERSAEED 2019 	Musik	02  - 02 Nov 2019	17:45 - 22:00	IFI BANDUNG, Jl. Purnawarman No.32, Babakan Ciamis, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 401	\N	\N
2905	 Diesnatalis Himpunan Mahasiswa Pendidikan Guru Sekolah Dasar 	Musik	17  - 17 Nov 2019	07:00 - 18:00	Karawang	\N	\N
2904	 Piala Atma XIX 	Sport	18  - 29 Nov 2019	10:00 - 21:00	Sport Hall Unika Atma Jaya, Semanggi	\N	\N
2902	 Seminar Nasional Statistika VIII 	Seminar	02  - 02 Nov 2019	07:00 - 16:00	Universitas Padjadjaran	\N	\N
2900	 Management Expo 	Expo	04  - 08 Nov 2019	08:00 - 16:30	UNIKA Atma Jaya Jakarta	\N	\N
2899	 International Scholarship Expo 	Seminar	02  - 02 Nov 2019	07:30 - 12:30	Aula Gedung F Lantai 7 Fakultas Ekonomi dan Bisnis Universitas Brawijaya	\N	\N
2898	 MANAGEMENT WEEK 4.0 	Lain-lain	11  - 22 Nov 2019	08:00 - 05:00	UNIVERSITAS MUHAMMADIYAH JAKARTA	\N	\N
2897	 ARRIVAL 1.0 ARCHITECTURE CARNIVAL 1.0 	Seminar	26  - 26 Okt 2019	08:30 - 15:57	UIN MAULANA MALIK IBRAHIM MALANG	\N	\N
2896	 Konser Milad - Gasduasatu Golden Age 	Musik	29  - 29 Okt 2019	13:00 - 23:00	Lapangan Utama Kampus IAIN Surakarta	\N	\N
2892	 ANNIVERSARY SOCIOLOGY 	Musik	01 Nov 2019 - 01 Okt 2019	16:00 - 22:00	OURA Cafe Ijen	\N	\N
2891	 INDEX 	Expo	11  - 29 Nov 2019	09:00 - 23:30	Kampus UNTIRTA FAKULTAS TEKNIK	\N	\N
2890	 SINERGI Youth Festifal (Job Fair Kebumen) 	Bursa Kerja	05  - 06 Nov 2019	09:00 - 16:00	Gedung Pertemuan SETDA Kab. Kebumen	\N	\N
2889	 UNIVERSE CUP 2019 	Sport	05  - 13 Nov 2019	07:00 - 14:30	Lapangan Bale Santika, Universitas Padjadjaran Jatinangor	\N	\N
2887	 Seminar Nasional Islamic Youngpreneur in Milenial Era 	Seminar	15  - 15 Nov 2019	07:30 - 12:00	Graha IAIN Surakarta	\N	\N
2886	 AIC FTI - Artificial Intelligence Competition 2019 	Lain-lain	11 Okt 2019 - 21 Des 2019	08:00 - 15:00	Auditorium Kampus 3 Universitas Mercu Buana Yogyakarya, Jl. Ring Road Utara, Condongcatur	\N	\N
2885	 Cerita Keren of The Day Dopamination 	Seminar	26  - 26 Okt 2019	08:30 - 12:30	Auditorium MM UGM Yogyakarta	\N	\N
2884	 Seminar Digital Marketing ANBTION 3.0 	Seminar	03  - 03 Nov 2019	09:00 - 21:00	Pendopo Politeknik Negeri Bandung	\N	\N
2883	 DSC PENS INTRODUCTION & CLOUD STUDY JAM 	Seminar	26  - 26 Okt 2019	08:00 - 15:00	POLITEKNIK ELEKTRONIKA NEGERI SURABAYA	\N	\N
2881	 Expressive Sound of Petroleum 	Musik	26  - 26 Okt 2019	18:00 - 23:00	Lapangan Parkir Stadion Mandala Krida	\N	\N
2880	 AQUAFEST 	Lain-lain	19  - 20 Okt 2019	10:00 - 18:00	Botani Square Mall	\N	\N
2879	 E-SPARC 	Musik	19  - 19 Okt 2019	08:30 - 23:00	Universitas Muhammadiyah Surakarta	\N	\N
2878	 Anforcom 	Seminar	19  - 19 Okt 2019	08:00 - 15:00	Universitas Diponegoro	\N	\N
2876	 FESTIVAL KAUM MUDA – BURSA KERJA INKLUSIF KEBUMEN 2019 	Bursa Kerja	05  - 06 Nov 2019	09:00 - 16:00	Gedung Pertemuan Setda Kebumen	\N	\N
2875	 Bulan Jurnalistik 2019 	Lain-lain	01  - 27 Okt 2019	10:00 - 22:00	Universitas Islam Bandung	\N	\N
2874	 ABASCHAMP FACULTY 2019 	Sport	14  - 25 Okt 2019	08:00 - 21:00	SPORTHALL UNIKA ATMA JAYA SEMANGGI	\N	\N
2873	 Seminar Nasional Dikmen Nasional Kopma UNS 	Seminar	01  - 01 Nov 2019	13:00 - 16:00	Perpustakaan Lt. 2 Universitas Sebelas Maret	\N	\N
2871	 Introduction to Psychology UI 2019 	Lain-lain	26  - 27 Okt 2019	08:00 - 16:00	Fakultas Psikologi UI	\N	\N
2870	 English Debating Workshop 	Seminar	26  - 26 Okt 2019	08:00 - 15:00	Ruang Seminar Lt. 2 Gedung UPT Perpustakaan Rumah Ilmu Universitas Negeri Semarang	\N	\N
2869	 Festival Pelajar Sholeh 	Lain-lain	19  - 19 Okt 2019	07:30 - 14:30	Kampus KENDENG UNIVERSITAS STIKUBANK SEMARANG	\N	\N
2868	 SEMINAR NASIONAL 	Seminar	23  - 23 Okt 2019	13:00 - 17:00	Universitas Serang Raya	\N	\N
2867	 ACCOUNTING CHALLENGE SE-BANTEN 	Lain-lain	24  - 26 Okt 2019	08:00 - 17:25	Universitas Serang Raya	\N	\N
2866	 ALSA ENGLISH COMPETITION 2019 	Lain-lain	17  - 20 Okt 2019	09:00 - 17:00	Fakultas Hukum Universitas Hasanuddin	\N	\N
2864	 Chinese Culture Games 	Lain-lain	01  - 02 Nov 2019	11:00 - 16:30	Universitas Widya Kartika	\N	\N
2863	 Polite 2019 	Lain-lain	18  - 20 Okt 2019	15:00 - 18:00	Universitas Brawijaya	\N	\N
2862	 Polite 2019 	Lain-lain	18  - 20 Okt 2019	15:00 - 18:00	Universitas Brawijaya	\N	\N
2861	 Semicolon 	Seminar	14  - 14 Okt 2019	10:00 - 15:00	UNIKA Atma Jaya Semanggi, Aula Y14.	\N	\N
2858	 KOMEN ( Kompetisi Media Pembelajaran) 	Lain-lain	07  - 30 Okt 2019	06:00 - 23:00	Fakultas Ilmu Pendidikan Universitas Negeri Semarang	\N	\N
2857	 Pameran Arsip Kereta Api : Jejak Kereta Api Jawa Trein Spoor op Java 	Lain-lain	18  - 20 Okt 2019	09:00 - 21:00	Sasana Hinggil Dwi Abad Yogyakarta	\N	\N
2856	 1st Great Muslimah Training 2019 	Seminar	19  - 19 Okt 2019	07:30 - 12:00	RUANG AUDITORIUM	\N	\N
2855	 Seminar & Talkshow Warta 	Seminar	22  - 22 Okt 2019	08:30 - 12:30	Universitas Trilogi	\N	\N
2853	 CANISIUS COLLEGE CUP 	Musik	19  - 19 Okt 2019	14:30 - 23:59	Jalan menteng raya no. 64, Jakarta Pusat	\N	\N
2852	 Creative Communication Festival 	Seminar	15  - 16 Okt 2019	13:00 - 16:00	Universitas Prof.Dr.Moestopo (Beragama)	\N	\N
2851	 KOMUSIKASI 2019 	Musik	01  - 01 Nov 2019	16:00 - 21:00	Semarang	\N	\N
2849	 Duta Wacana Project 	Donasi	27  - 27 Okt 2019	07:00 - 11:30	Universitas Kristen Duta Wacana	\N	\N
2848	 BERCERITA MELALU VISUAL 	Seminar	22  - 22 Okt 2019	09:00 - 16:00	Perpustakaan Nasional	\N	\N
2847	 SEMINAR NASIONAL DENCOFE 2019 	Seminar	25  - 25 Okt 2019	08:00 - 08:00	Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2846	 Grand EconoChannel Event 6th 	Expo	26 Sep 2019 - 26 Okt 2019	08:00 - 16:00	Kampus A Universitas Negeri Jakarta, Jakarta Timur	\N	\N
2845	 PRAKARSA 2019 	Lain-lain	02  - 03 Nov 2019	08:00 - 10:00	fisipol ugm	\N	\N
2844	 CINEPEX (Celebration Night of Pendidikan Ekonomi) 	Musik	16  - 16 Nov 2019	19:00 - 22:00	Gedung B6 FBS Unnes	\N	\N
2843	 Brawijaya University Karate Championship 	Sport	01  - 03 Nov 2019	07:00 - 21:00	Universitas Brawijaya	\N	\N
2842	 IM FEST (IMTII FESTIFAL) 	Lain-lain	13  - 20 Okt 2019	08:00 - 20:00	Universitas Bhayangkara Jakarta raya	\N	\N
2841	 IM'FEST 2.0 (IMTII FESTIFAL) 	Lain-lain	13  - 20 Okt 2019	08:00 - 23:00	Universitas bhayangkara Jakarta raya	\N	\N
2840	 Diponegoro University Entrepreneur Award 2019 	Seminar	19  - 19 Okt 2019	08:00 - 13:00	Laboratorium Kewirausahaan FEB Univeristas Diponegoro	\N	\N
2838	 MARG (Management Accounting Rally Games) 	Lain-lain	16  - 16 Nov 2019	08:00 - 17:00	Hall Universitas Widya Kartika Surabaya	\N	\N
2837	 Seminar Nasional Art-Preneur: Eksplorasi Kreativitas Menyongsong Industri Kreatif 	Seminar	07  - 07 Okt 2019	07:30 - 12:30	Gedung Teater Besar ISI Surakarta	\N	\N
2836	 SEMINAR MULTIMEDIA DAN ARTIFICIAL INTELLIGENCE 2019 Artificial Intelligence & IT Security on Industry Revolution 4.0 	Seminar	30  - 30 Nov 2019	08:00 - 15:00	Auditorium Kampus III Universitas Mercu Buana Yogyakarta Jl. RIng Road Utara, Depok, Sleman, Yogyaka	\N	\N
2834	 IT Festival 2019 	Seminar	10  - 29 Okt 2019	08:00 - 16:00	Politeknik Negeri Sriwijaya	\N	\N
2829	 Accounting Festival Bina Insani #3 	Seminar	25  - 25 Okt 2019	08:00 - 11:00	Perguruan Tinggi Bina Insani Bekasi	\N	\N
2828	 Cakrawala Budaya 	Lain-lain	12  - 12 Okt 2019	07:00 - 15:30	Fakultas Ilmu Pengetahuan Budaya (FIB) UI	\N	\N
2827	 Dies Natalis Fupi 	Lain-lain	05 Okt 2019 - 07 Nov 2019	01:00 - 00:00	Fakultas Ushuluddin	\N	\N
2826	 Seminar Nasional dan Temu Alumni 	Seminar	12 Okt 2019 - 12 Sep 2019	07:30 - 16:00	Lab Ilmu Sosial Terpadu FIS UNY	\N	\N
2823	 Talkshow Nasional Plano In Action 10 - Sustainable Transport to Support Resilient City 	Seminar	05 Okt 2019 - 05 Sep 2019	10:00 - 14:00	Hotel Megaland Solo, Jl. Slamet Riyadi No.351, Purwosari, Kec. Laweyan, Kota Surakarta, Jawa Tengah	\N	\N
2822	 Alive 5.0 	Lain-lain	22 Nov 2019 - 24 Sep 2019	14:00 - 17:00	Universitas Multimedia Nusantara	\N	\N
2821	 PSYTALK 2019 	Lain-lain	12  - 12 Okt 2019	13:00 - 18:00	GAP Lantai 8, Universitas Kristen Maranatha	\N	\N
2819	 SEMINAR NASIONAL 	Seminar	17  - 17 Okt 2019	07:30 - 15:00	Ruang Sidang Utama Rektorat, UNY	\N	\N
2817	 The 8th IPB Mathematics Challenge (IMC) 2019 	Seminar	19  - 20 Okt 2019	08:00 - 16:00	Auditorium Toyyib Hadiwijaya, IPB Dramaga	\N	\N
2795	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2796	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2792	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2793	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2794	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2789	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2790	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2791	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2786	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2787	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2788	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2785	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2784	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2781	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2782	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2783	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2778	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2779	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2780	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2775	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2776	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2777	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2774	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2771	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2772	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2773	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2767	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2768	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2769	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2770	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2765	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2766	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2763	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2764	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2760	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2761	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2762	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2757	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2758	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2759	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2755	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2756	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2754	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2751	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2752	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2753	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2748	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2749	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2750	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2746	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2747	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2745	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2743	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2744	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2740	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2741	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2742	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2737	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2738	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2739	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2735	 Seminar Nasional Dencofe 2019 	Seminar	23  - 23 Sep 2019	10:00 - 11:30	Gedung Auditorium Universitas Islam Negeri Sunan Ampel Surabaya\r\nJl. Ahmad Yani No. 117 Surabaya	\N	\N
2734	 SEMINAR NASIONAL KEWIRAUSAHAAN 2019 CREATING YOUR START UP FOR A BETTER FUTURE 	Seminar	05  - 05 Okt 2019	08:00 - 15:00	Ruang Seminar Lt. 1, Gedung Graha Pakuan Siliwangi, Universitas Pakuan	\N	\N
2732	 Acoustic and Dance Competition (Accent 2019) 	Musik	16  - 16 Nov 2019	08:00 - 22:00	Taman Indonesia Kaya, Semarang	\N	\N
2731	 Acoustic and Dance Competition (Accent 2019) 	Musik	16  - 16 Nov 2019	08:00 - 22:00	Taman Indonesia Kaya, Semarang	\N	\N
2730	 Kejuaraan Taekwondo Antar Fakultas 2019 UIN Sunan Kalijaga 	Lain-lain	29  - 29 Sep 2019	07:00 - 16:00	Gelanggang Mahasiswa UIN Sunan Kalijaga	\N	\N
2729	 Futura 2019 : Seminar Nasional, LKTI Nasional dan Lomba Robot Sumo Nasional 	Seminar	02  - 30 Nov 2019	10:00 - 16:00	Grha Sanusi Unpad Dipatikukur (Seminar Nasional), Bale santika Unpad Jatinangor (Robot Sumo Nasional	\N	\N
2728	 Lomba Karya Tulis Ilmiah Perbanas Banking Competition 2019 	Lain-lain	08  - 08 Des 2019	08:00 - 17:00	Hall A Kampus 1 STIE Perbanas Surabaya, Jalan Nginden Semolo 34-36 Surabaya 60118	\N	\N
2726	 ELEKTRONICS OPEN ROBOTIC 	Lain-lain	03  - 05 Okt 2019	07:00 - 17:00	Kampus A Universitas Negeri Jakarta, Jl. Daksinapati, RT.11/RW.14, Rawamangun, Pulo Gadung, East Jak	\N	\N
2725	 Student Cooperative Fair 2019 	Lain-lain	07  - 09 Nov 2019	07:00 - 05:00	Kampus A UNTIRTA	\N	\N
2724	 National Essay Competition 	Lain-lain	05 Sep 2019 - 10 Okt 2019	00:00 - 00:00	Indonesia	\N	\N
2723	 Ushuluddin Futsal Competition 	Sport	19  - 20 Okt 2019	08:00 - 16:00	GOR FUTSAL UIN SUNAN KALIJAGA	\N	\N
2722	 SEMINAR Internet Of Things & Technopreneurship 	Seminar	01  - 01 Okt 2019	10:00 - 15:00	Ballroom Kemala , Universitas Esa Unggul , Jakarta	\N	\N
2721	 Spectrum5.0 	Musik	26  - 26 Okt 2019	16:00 - 23:00	Stadion diponegoro	\N	\N
2717	 Seminar IT 2019 	Seminar	28  - 28 Sep 2019	08:00 - 15:30	Universitas Negeri Jakarta Aula Ki Hajar Dewantara Lt 9	\N	\N
2715	 United Youth Assembly 2019 	Seminar	15  - 17 Nov 2019	08:00 - 19:00	Universitas Tarumanagara	\N	\N
2711	 MOTION (Media Poster Competition) 	Lain-lain	10 Sep 2019 - 10 Okt 2019	06:00 - 00:00	Fakultas Ilmu Pendidikan Universitas Negeri Semarang	\N	\N
2710	 PETRONATION PGD UI 2020 	Lain-lain	05  - 07 Mar 2020	08:00 - 21:00	Fakultas Teknik Universitas Indonesia & The Margo Hotel	\N	\N
2709	 MARKETPRENEUR #6 	Seminar	10  - 12 Okt 2019	08:00 - 12:00	Universitas Trilogi	\N	\N
2708	 MAC (Majapahit Art Competition ) 	Pensi	06  - 06 Okt 2019	06:00 - 05:00	STIKES BINA SEHAT PPNI MOJOKERTO	\N	\N
2705	 Seminar Nasional Membangun Bisnis Transportasi Kreatif dengan memanfaatkan Tingginya Pasar E-Commerce di Indonesia 	Seminar	12  - 12 Okt 2019	08:00 - 15:30	Auditorium STIMLOG, Jl. Sariasih No. 54	\N	\N
2702	 SEMINAR NASIONAL & TALKSHOW Business Innovation In The Digital Era 	Seminar	21  - 21 Sep 2019	07:30 - 13:00	Megaland Hotel Solo	\N	\N
2701	 Dialog Pasca Kampus 	Seminar	11  - 30 Sep 2019	13:00 - 17:00	Ruang Sidang Utama Rektorat ITS Lt.1	\N	\N
2700	 LKTIN SPACE UP 2019 	Lain-lain	07  - 08 Nov 2019	08:00 - 18:00	Jl. Teuku Nyak Arief, RT.7/RW.8, Simprug, Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukot	\N	\N
2699	 SEMINAR DAN TALKSHOW NASIONAL   OPTIMALISASI EKONOMI SYARIAH DI ERA REVOLUSI INDUSTRI 4.0 0 	Seminar	14  - 14 Sep 2019	06:30 - 12:00	Aula GD 3 FEB UNS	\N	\N
2698	 Nutrifest 2019 	Seminar	13 Sep 2019 - 13 Okt 2019	08:00 - 16:00	Fakultas Kedokteran UNDIP	\N	\N
2697	 Grand Opening Gerakan UI Mengajar (GUIM 9) 	Seminar	11  - 11 Sep 2019	13:30 - 17:00	Aula Juwono Sudarsono, FISIP UI	\N	\N
2696	 SEMINAR NASIONAL PSIKOLOGI 	Seminar	03  - 03 Okt 2019	07:00 - 12:00	UIN WALISONGO	\N	\N
2695	 IOSH SUMMIT 2019 	Seminar	06  - 06 Okt 2019	08:00 - 15:00	Ballroom Swiss Bellin Surakarta	\N	\N
2694	 T.E.D (Tech Enthusiast Day) 	Lain-lain	16  - 17 Nov 2019	08:00 - 17:00	sekolah vokasi, universitas gadjah mada	\N	\N
2693	 Mr. & Ms. UMN 2019 	Lain-lain	20  - 20 Sep 2019	18:00 - 21:00	Function Hall Universitas Multimedia Nusantara	\N	\N
2692	  ONE DAY WORKSHOP NEXT GENERATION CISCO IPV6 NETWORK  	Seminar	21  - 21 Sep 2019	09:00 - 09:00	AULA KAMPUS B STIE & STMIK JAYAKARTA	\N	\N
2691	 SEMINAR NASIONAL 	Seminar	06  - 30 Sep 2019	07:30 - 12:00	Universitas Negeri Jakarta /  Jl. Rawamangun Muka, RT.11/RW.14, Rawamangun, Kec. Pulo Gadung, Kota J	\N	\N
2690	 UMN FESTIVAL 2019 [ULYMPIC] 	Sport	09 Sep 2019 - 25 Okt 2019	17:00 - 21:00	Universitas Multimedia Nusantara, Gading Serpong	\N	\N
2688	 GEBYAR UMKM JUARA DAN AGRIBUSINESS FESTIVAL 2019 	Seminar	28  - 29 Sep 2019	08:00 - 21:00	IPB Baranangsiang	\N	\N
2686	 PEKAN ILMIAH MANAJEMEN 	Lain-lain	14  - 19 Okt 2019	08:00 - 16:00	FAKULTAS EKONOMI UNIVERSITAS PAKUAN	\N	\N
2685	 EDSA Festival 2019 	Lain-lain	11  - 17 Nov 2019	08:00 - 06:46	Gd. Mandala Universitas Siliwangi Tasikmalaya	\N	\N
2684	  ONE DAY WORKSHOP NEXT GENERATION CISCO IPV6 NETWORK  	Seminar	21  - 21 Sep 2019	08:00 - 15:00	AULA KAMPUS B STIE%STMIK JAYAKARTA	\N	\N
2682	 SEMINAR NASIONAL 2019 	Seminar	25  - 25 Okt 2019	07:59 - 15:59	Aula Falultas Vokasi Universitas Airlangga	\N	\N
2681	 National Seminar 	Seminar	16  - 16 Nov 2019	08:00 - 16:00	Kota Semarang	\N	\N
2680	 Padjadjaran Fest & Conference 	Lain-lain	11  - 13 Nov 2019	08:30 - 07:00	Fisip Unpad, Jalan Bukit Dago	\N	\N
2678	 FESTIVAL BAZAR MAHASISWA 	Lain-lain	03  - 05 Okt 2019	08:00 - 16:00	FAKULTAS EKONOMI UNIVERSITAS PAKUAN	\N	\N
2677	 MOLARS 2019 	Lain-lain	09  - 10 Nov 2019	08:00 - 14:00	UNIVERSITAS JEMBER	\N	\N
2676	 Partition 2019 (Pasar Seni dan Art Competition) 	Pensi	28  - 28 Sep 2019	06:30 - 19:30	Fakultas peternakan dan pertanian universitas Diponegoro	\N	\N
2675	 Kompetisi Akuntansi Airlangga 2019 	Lain-lain	26  - 27 Okt 2019	07:00 - 17:59	Fakultas Vokasi Universitas Airlangga	\N	\N
2674	 Elday (Electro Day) 2019 	Musik	13  - 13 Sep 2019	08:00 - 22:00	parking area institut teknologi nasional bandung	\N	\N
2673	 ESSAY COMPETITION HIMADIKTAR 2019 TINGKAT NASIONAL 	Lain-lain	20 Jul 2019 - 02 Nov 2019	00:00 - 23:55	Universitas Tidar	\N	\N
2671	 Festival musik 2019 	Musik	28  - 28 Sep 2019	16:00 - 21:30	Politeknik enjinering indorama.(Kembangkuning, Kec. Jatiluhur, Kabupaten Purwakarta, Jawa Barat 4115	\N	\N
2670	 DV CUP 2019 	Sport	29 Sep 2019 - 13 Okt 2019	08:00 - 18:00	GOR Grogol, GOR Talenta, Elang Futsal	\N	\N
2667	 Seminar Nasional Pendidikan 2019 	Seminar	14  - 14 Sep 2019	07:00 - 14:30	Aula TB Suwandi Serang, banten	\N	\N
2664	 Pharmaceutical Seminar UI 88 	Seminar	07  - 15 Sep 2019	08:00 - 16:00	Balai Sidang UI & Rumpun Ilmu Kesehatan UI	\N	\N
2662	 Seminar dan Multimedia Festival Peran Matematika Dalam Usaha 	Seminar	28  - 28 Sep 2019	08:00 - 12:00	Ruang Seminar Kampus 1, Universitas Mercu Buana Yogyakarta. Jalan Wates Km. 10, Argomulyo, Sedayu	\N	\N
2661	 Jambore Bakti Sosial FKG UI 2019 	Lain-lain	30 Agu 2019 - 01 Sep 2019	08:00 - 16:00	Desa Majasih, Kecamatan Sliyeg, Indramayu	\N	\N
2660	 UNISSULA CAREER DAY 2019 	Bursa Kerja	09  - 10 Okt 2020	09:00 - 16:00	Auditorium UNISSULA Semarang	\N	\N
2659	 UNIMUS Job Fair 2019 	Bursa Kerja	17  - 18 Sep 2019	09:00 - 16:00	Universitas Muhammadiyah Semarang	\N	\N
2658	 The 15th Padjadjaran Accounting Week 	Lain-lain	19  - 22 Nov 2019	07:00 - 19:00	Kampus Universitas Padjadjaran, Dipatiukur, Bandung, Jawa Barat	\N	\N
2657	 OLIMPIADE BIOLOGI NASIONAL 	Lain-lain	05  - 13 Sep 2019	07:00 - 15:00	Universitas Negeri Jakarta /  Jl. Rawamangun Muka, RT.11/RW.14, Rawamangun, Kec. Pulo Gadung, Kota J	\N	\N
2656	 BIO EXHIBITION 	Expo	05 Sep 2019 - 06 Okt 2019	07:00 - 15:00	Universitas Negeri Jakarta /  Jl. Rawamangun Muka, RT.11/RW.14, Rawamangun, Kec. Pulo Gadung, Kota J	\N	\N
2654	 Lomba Esai Nasional Plano In Action 10 	Lain-lain	10 Agu 2019 - 07 Sep 2019	00:00 - 23:58	Perencanaan Wilayah dan Kota, Fakultas Teknik, Universitas Sebelas Maret	\N	\N
2653	 Lomba Fotografi Plano In Action 10 	Lain-lain	10 Agu 2019 - 05 Okt 2019	00:00 - 23:59	Perencanaan Wilayah dan Kota, Fakultas Teknik, Universitas Sebelas Maret	\N	\N
2649	 Pentas Produksi Teater Kidung Nenek Tercinta 	Pensi	29  - 29 Agu 2019	19:30 - 22:00	Teater Arena Taman Budaya Jawa Tengah	\N	\N
2648	 INFORMATION TECHNOLOGY CREATIVE COMPETITION 2019 	Lain-lain	31 Okt 2019 - 01 Nov 2019	08:00 - 16:00	Gedung Teknologi Informasi, Fakultas Teknik, Universitas Udayana	\N	\N
2647	 Seminar Nasional PENA 2019 	Seminar	29  - 29 Sep 2019	08:00 - 13:30	Auditorium Moh.Djazman Universitas Muhammadiyah Surakarta	\N	\N
2646	 National Paper Competition 2019 	Lain-lain	19 Agu 2019 - 17 Nov 2019	00:00 - 17:00	Gedung Aula FIB A Universitas Brawijaya	\N	\N
2645	 YES-C youth economics science competition 	Lain-lain	28  - 29 Sep 2019	07:30 - 04:30	Fakultas Ekonomi Universitas Negri Padang	\N	\N
2643	 Seminar Nasional Cinta 	Seminar	21  - 21 Sep 2019	08:00 - 12:00	Auditorium E1 lt. 3 Fakultas Teknik Universitas Negeri Surabaya Kampus Ketintang	\N	\N
2642	 CODE (Competition of Innovation and Creation) 	Lain-lain	13  - 13 Okt 2019	08:00 - 14:00	Jalan veteran utama nomor 1	\N	\N
2639	 The 3rd Faculty of Public Health Universitas Indonesia Science Festival 	Lain-lain	19  - 21 Agu 2019	22:04 - 00:00	Fakultas Kesehatan Masyarakat Universitas Indonesia	\N	\N
2638	 Kapal Baja Climbing Competion II 	Sport	12  - 14 Sep 2019	06:00 - 22:00	Bhayangkara Jakarta raya kampus II bekasi	\N	\N
2637	 UMK Job Fair 	Bursa Kerja	22  - 23 Okt 2019	09:00 - 16:00	Auditorium Universitas Muria Kudus	\N	\N
2636	 Management Festival 2019 	Lain-lain	16  - 19 Sep 2019	13:30 - 20:00	ITB AHMAD DAHLAN JAKARTA	\N	\N
2635	 P+ FEB UNPAD 	Lain-lain	22  - 23 Agu 2019	07:30 - 16:00	Kampus UNPAD Dipatiukur dan Kampus UNPAD Jatinangor	\N	\N
2634	 Miracle 	Seminar	21  - 21 Sep 2019	08:00 - 17:00	Gedung RIK UI	\N	\N
2633	 EKSEN 	Lain-lain	26  - 27 Sep 2019	15:00 - 22:00	Gedung Soetardjo	\N	\N
2632	 AGUS & SEPTI CHALLENGE 	Lain-lain	15  - 31 Agu 2019	22:42 - 22:42	Online	\N	\N
2630	 Pekan Raya Ilmiah 2019 	Lain-lain	22 Jul 2019 - 15 Okt 2019	07:00 - 14:00	Fakultas Ilmu Tarbiyah Dan Keguruan UIN Syarif Hidayatullah Jakarta	\N	\N
2628	 AORTA RUN 2019 	Sport	01  - 01 Sep 2019	05:00 - 12:00	Fakultas Kedokteran dan Ilmu Kesehatan Unika Atma Jaya	\N	\N
2626	 9th Pharmacy Expo 	Expo	13  - 27 Okt 2019	07:00 - 07:00	FIKES UIN Syarif Hidayatullah Jakarta	\N	\N
2625	 Training on the Law of Energy and Mineral Resources (TERM) 2019 	Seminar	26  - 29 Agu 2019	08:00 - 16:00	Universitas Indonesia	\N	\N
2624	 Lomba Short Movie Nasional OCEAN BPPI FEB Universitas Sebelas Maret 	Lain-lain	01 Agu 2019 - 14 Sep 2019	00:00 - 00:00	UNIVERSITAS SEBELAS MARET	\N	\N
2623	 Lomba Esai Nasional OCEAN BPPI FEB Universitas Sebelas Maret 	Lain-lain	05 Agu 2019 - 14 Sep 2019	00:00 - 00:00	UNIVERSITAS SEBELAS MARET	\N	\N
2622	 Lomba Poster Nasional OCEAN BPPI FEB Universitas Sebelas Maret 	Lain-lain	05 Agu 2019 - 13 Sep 2019	00:00 - 00:00	UNIVERSITAS SEBELAS MARET	\N	\N
2621	 SEMINAR NASIONAL 	Seminar	27  - 27 Okt 2019	08:00 - 15:00	AULA GEDUNG C FMIPA UNS	\N	\N
2620	 TRAINING DIGITAL & PENDATAAN ANGGOTA ICSB TASIKMADU 	Lain-lain	14  - 17 Agu 2019	11:42 - 11:42	SerbaPromo Camp Jl. Jend. Gatot Subroto RT 011 RW 006, Maguan, Gaum, Tasikmadu Karanganyar.	\N	\N
2619	 Gebyar Budaya Dan Kirab Jeruk 	Pensi	15  - 15 Agu 2019	14:00 - 02:00	Dusun Borotretes, Desa Donowarih Kecamatan Karangploso, Kab. Malang	\N	\N
2617	 Love Story 	Musik	18  - 18 Agu 2019	18:00 - 21:00	Miss Tjitjih	\N	\N
2615	 Traditional Dance Competition 2019 	Lain-lain	19  - 31 Agu 2019	07:00 - 04:00	Universitas Al Azhar Indonesia	\N	\N
2614	 Elday (Electro Day) 2019 	Seminar	13  - 13 Sep 2019	08:00 - 14:00	gedung 14 ruang 14301 Institut Teknologi Nasional Bandung	\N	\N
2613	 Engineers Nite 	Lain-lain	24  - 24 Agu 2019	18:30 - 21:00	UNIVERSITAS MUHAMMADIYAH JAKARTA	\N	\N
2610	 Accounting Skill and English Competition 2019 	Lain-lain	26  - 26 Okt 2019	07:00 - 17:00	Aula Pertamina Politeknik Negeri Malang	\N	\N
2609	 LOMBA KARYA TULIS ILMIAH NASIONAL 	Lain-lain	15 Agu 2019 - 13 Nov 2019	07:00 - 17:00	UNIVERSITAS SILIWANGI TASIKMALAYA	\N	\N
2608	 Futsal Physio Cup 	Sport	14  - 14 Sep 2019	09:00 - 16:15	GOR Kampus 3 UIN Walisongo, Semarang	\N	\N
2607	 CERDAS CERMAT BIOLOGI TINGKAT SMA/MA SEDERAJAT 	Lain-lain	16 Agu 2019 - 13 Nov 2019	07:00 - 17:00	Universita Siliwangi, Tasikmalaya	\N	\N
2606	 World Physical Therapy Day 	Musik	14  - 14 Sep 2019	18:00 - 22:00	GOR Kampus 3 UIN Walisongo, Semarang	\N	\N
2604	 Public Health Expo 12 (Open House FKM UI) 	Expo	07  - 07 Sep 2019	08:00 - 15:00	Fakultas Kesehatan Masyarakat Universitas Indonesia	\N	\N
2603	 Reuni Akbar 	Lain-lain	07 Sep 2019 - 07 Agu 2019	08:00 - 03:00	Aula Al-Kautsar, PKP. Ciracas	\N	\N
2602	 Achmad Yani Model United Nation 2019 	Lain-lain	29 Nov 2019 - 02 Agu 2019	15:00 - 21:00	Ibis Bandung Trans Studio Hotel, Jl. Gatot Subroto No.289 Cibangkong, Kec. Batununggal Kota Bandung,	\N	\N
2601	 DOTA 2 COMPETITION 	Lain-lain	20 Jul 2019 - 21 Sep 2019	00:00 - 00:00	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2600	 Simbion Art Exhibition 	Expo	22  - 24 Agu 2019	19:00 - 22:00	Galeri Dks surabaya. Komplek balai pemuda	\N	\N
2599	 [VISION 2019] SMART IT FEST WEB PROGRAMMING COMPETITION 2019 	Lain-lain	21 Jul 2019 - 19 Sep 2019	00:00 - 00:00	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2598	 Seminar IT Nasional 	Seminar	19  - 21 Sep 2019	09:00 - 21:00	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2597	 Commitech 	Lain-lain	24  - 24 Agu 2019	07:00 - 13:00	Kampus Mugas UNISBANK	\N	\N
2596	 Seminar IT Nasional Tentang Security 	Seminar	19  - 19 Sep 2019	13:30 - 15:30	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2595	 Seminar IT Nasional Tentang IoT(Internet Of Things) 	Seminar	20  - 20 Sep 2019	19:00 - 21:00	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2594	 Seminar IT Nasional Tentang Startup 	Seminar	21  - 21 Sep 2019	15:30 - 17:30	Hartono Mall Solo Baru (Jalan Ir. Soekarno, Madegondo, Grogol, Kabupaten Sukoharjo, Jawa Tengah).	\N	\N
2591	 PsyGeneration 2.0 	Lain-lain	20 Jul 2019 - 26 Okt 2019	08:00 - 12:00	Fakultas Psikologi Universitas Sumatera Utara	\N	\N
2589	 NATIONAL OCEANOGRAPHIC PAPER COMPETITION AND SEMINAR (ATLANTA) 	Lain-lain	31 Jul 2019 - 17 Nov 2019	10:00 - 17:00	Fakultas Perikanan dan Ilmu Kelautan Universitas Diponegoro	\N	\N
2588	 SlashRoot CTF 4.0 	Lain-lain	12  - 12 Okt 2019	08:00 - 18:00	Online, Jl. Raya Kampus Udayana No.20, Jimbaran, Badung, Kabupaten Badung, Bali 80361	\N	\N
2587	 INDONESIAN POWER BOAT HTMB SERIES#4 	Lain-lain	14  - 15 Sep 2019	07:00 - 17:00	Jalan Arief Rachman Hakim No.150, Keputih, Sukolilo, Keputih, Kec. Sukolilo, Kota SBY, Jawa Timur 60	\N	\N
2586	 UI Career and Scholarship Expo XXVIII 2019 	Expo	03  - 05 Okt 2019	08:00 - 17:00	Balairung Universitas Indonesia, Kampus UI Depok	\N	\N
2583	 Distafest broadcasting competition 	Lain-lain	09  - 09 Sep 2019	08:00 - 12:00	PASCASARJANA LT. 4	\N	\N
2582	 Distafest music 	Musik	19  - 19 Sep 2019	19:00 - 23:00	HALL FITK IAIN SURAKARTA	\N	\N
2581	 Distafest seminar creative 	Seminar	09  - 09 Sep 2019	13:00 - 16:00	GRAHA IAIN SURAKARTA	\N	\N
2580	 Apply Kerja Anti Ribet 	Lain-lain	30  - 30 Jul 2019	14:00 - 00:00	\N	\N	\N
2578	 LOMBA KARYA TULIS ILMIAH (LKTI) NASIONAL ACTIVE HMJ AKUNTANSI FEB UNS 	Lain-lain	16 Jun 2019 - 04 Nov 2019	00:00 - 00:00	UNIVERSITAS SEBELAS MARET	\N	\N
2577	 Global Village Summer 2019 	Lain-lain	03  - 03 Agu 2019	16:00 - 21:30	Taman Indonesia Kaya, Jl. Menteri Supeno No.11 A, Mugassari	\N	\N
2574	 International Education Expo 	Expo	03  - 04 Agu 2019	13:00 - 18:00	Mercure Alam Sutera	\N	\N
2572	 Essay Competition Himadiktar Nasional 2019 	Lain-lain	20 Jul 2019 - 12 Okt 2019	00:00 - 00:00	Universitas Tidar	\N	\N
2571	 IEEE Fusion 	Seminar	24 Agu 2019 - 31 Okt 2019	00:00 - 23:59	Jl. Ganesha No.10, Lb. Siliwangi, Kecamatan Coblong, Kota Bandung, Jawa Barat 40132	\N	\N
2564	 MECHATRONICS FESTIVAL 2019 	Lain-lain	24  - 31 Agu 2019	07:30 - 17:00	Politeknik enjinering indorama.(Kembangkuning, Kec. Jatiluhur, Kabupaten Purwakarta, Jawa Barat 4115	\N	\N
2559	 Open House Institut Bisnis Nusantara 	Seminar	31  - 31 Jul 2019	13:00 - 16:30	Institut Bisnis Nusantara Jl. Mayjen D.I Panjaitan Kav. 24 Jakarta Timur	\N	\N
2558	 Manifesto 3.0 2019 	Musik	19  - 19 Nov 2019	17:00 - 22:45	Balairung Universitas PGRI Semarang	\N	\N
2557	 PISTON CUP 	Sport	21  - 22 Sep 2019	09:00 - 17:00	SINGOPURAN FUTSAL CENTER SUKOHARJO	\N	\N
2556	 3rd Administration Festival 	Lain-lain	18  - 20 Okt 2019	08:00 - 17:00	Gedung M dan G Fakultas Ilmu Administrasi Universitas Indonesia	\N	\N
2555	 Distafest music 	Musik	19  - 19 Sep 2019	19:00 - 22:00	HALL FITK IAIN SURAKARTA	\N	\N
2553	 CATALYST OF MINDS 	Seminar	26  - 26 Jul 2019	18:30 - 21:00	JSCHive by Cohive Kuningan, Jakarta Selatan	\N	\N
2551	 e-ACCOUNT 1.0 	Lain-lain	06  - 13 Okt 2019	09:00 - 19:00	UNIVERSITAS PGRI ADI BUANA SURABAYA	\N	\N
2548	 PICOMETER 	Lain-lain	26  - 26 Okt 2019	08:00 - 17:00	Gedung C FMIPA Universitas Sebelas Maret	\N	\N
2546	 Love Story 	Musik	18  - 18 Agu 2019	19:00 - 21:00	Miss Tjitjih	\N	\N
2545	 Seminar Nasional Revolusi Industri 4.0 	Seminar	19 Jul 2019 - 02 Agu 2019	07:00 - 02:00	Auditorium slamet dajono FMIPA Unesa	\N	\N
2544	 MANDALA CAMP 2019 	Donasi	20 Sep 2019 - 22 Jul 2019	09:00 - 07:04	Universiti Teknologi Malaysia,Skudai,Johor Bahru,Malaysia	\N	\N
2543	 Jabar Fest 2019 	Musik	19  - 20 Okt 2019	14:00 - 22:00	Lapangan Parkir Stadion Mandala Krida	\N	\N
2542	 LOMBA DEBAT KEWARGANEGARAAN TINGKAT NASIONAL HIMA PKNH UNY 2019 	Lain-lain	01 Jul 2019 - 22 Sep 2019	14:57 - 14:57	FAKULTAS ILMU SOSIAL UNY	\N	\N
2541	 BUILDING EFFECTIVE DIGITAL MARKETING STRATEGY 	Seminar	20  - 20 Jul 2019	13:00 - 15:00	Lobby Kampus Universitas Sahid Jakarta Jl. Prof. Dr. Soepomo No. 84, Pancoran, Tebet Jakarta Selatan	\N	\N
2540	 Seminar Nasional Introduction For Big Data 	Seminar	30  - 30 Jul 2019	08:00 - 14:00	Aula Blok 1 Lantai 4, Universitas Nasional	\N	\N
2539	 CIVIL EXPO ITS 2019 	Expo	03 Jun 2019 - 06 Okt 2019	09:00 - 17:30	Institut Teknologi Sepuluh Nopember	\N	\N
2538	 CENTRAL INFORMATION AGENCY Chapter 2 : Unlimited 	Lain-lain	22  - 26 Jul 2019	09:00 - 16:00	Kampus A, Universitas Negeri Jakarta	\N	\N
2537	 Photography Workshop di UMN 	Lain-lain	31  - 31 Agu 2019	09:00 - 15:00	Universitas Multimedia Nusantara	\N	\N
2536	 OASIS (Obrolan Asik Seputar Bisnis) 	Seminar	20  - 20 Jul 2019	08:30 - 17:00	Hotel Horison, Ciledug	\N	\N
2535	 ESA COMPETITION 6 	Lain-lain	24 Jul 2019 - 24 Sep 2019	07:00 - 05:15	Qualification : SMA Muhammadiyah 3 Jember, Final : FKIP GEDUNG 3 Universitas Jember	\N	\N
2534	 ENGLISH DAYS UGM 2019 	Lain-lain	20  - 20 Jul 2019	08:30 - 14:30	FAKULTAS ILMU BUDAYA UGM	\N	\N
2533	 STORIA ANTICA 	Musik	27  - 27 Sep 2019	07:00 - 07:00	Lap. Utama Kampus 3 UIN Semarang	\N	\N
2532	 Promise 2019 	Lain-lain	07 Jul 2019 - 05 Agu 2019	00:00 - 23:59	Kampus B Universitas Airlangga, Jl Dharmawangsa Dalam Selatan Surabaya	\N	\N
2531	 EFEST (ENGLISH FESTIVAL) 	Lain-lain	12  - 14 Sep 2019	07:00 - 15:00	UNIVERSITAS DIPONEGORO	\N	\N
2530	 TIMPINAS 	Lain-lain	24  - 27 Okt 2019	07:00 - 16:00	Fakultas peternakan dan pertanian universitas diponegoro	\N	\N
2529	 Global Village Summer 2019 	Lain-lain	14  - 14 Jul 2019	12:30 - 19:00	Trans Studio Mall, Bandung	\N	\N
2528	 POLINEMA BASKETBALL COMPETITION 2019 	Sport	19  - 28 Jul 2019	10:00 - 22:00	GRAHA POLINEMA	\N	\N
2527	 Teknik Pancasila Bangun Desa Jilid III 	Lain-lain	15  - 28 Jul 2019	06:00 - 22:00	Kampung Legok Muncang, Desa Leuwisadeng, Bogor, Jawa Barat	\N	\N
2526	 Seminar Nasional 	Seminar	25  - 25 Agu 2019	07:00 - 14:00	Balai krida husada poltekkes surakarta	\N	\N
2525	 GEMPITA 2019 	Expo	06  - 09 Agu 2019	08:00 - 17:00	Universitas Lampung	\N	\N
2524	 GEMPITA 2019 	Expo	06  - 09 Agu 2019	08:00 - 17:00	Universitas Lampung	\N	\N
2523	 IBN OPEN HOUSE 2019 	Seminar	23  - 23 Jul 2019	18:00 - 21:00	Gedung GS FAME Institute of Business Jl. Pulo Mas Timur 3A Blok A No. 2, Kayu Putih	\N	\N
2521	 Veteran Business Case Competition VUSION 	Lain-lain	01  - 02 Nov 2019	08:00 - 17:00	UPN Veteran Yogyakarta	\N	\N
2520	 Stovit League 	Pensi	21  - 21 Sep 2019	17:00 - 20:00	Fakultas Kedokteran Gigi Universitas Airlangga	\N	\N
2519	 Unair Open 2019 	Sport	22  - 29 Sep 2019	09:00 - 18:00	Airlangga Convention Center (ACC)	\N	\N
2516	 Lomba Karya Tulis Ilmiah UNTIRTA 2019 	Lain-lain	24  - 26 Okt 2019	16:53 - 16:54	Universitas sultan ageng tirtayasa	\N	\N
2514	 JALAN SEHAT CFD HARKOPNAS KARANGANYAR 	Sport	21  - 21 Jul 2019	06:00 - 06:00	Alun Alun Kabupaten Karanganyar	\N	\N
2512	 Call For Paper Attraction 2019 	Lain-lain	20 Jun 2019 - 20 Jul 2019	00:00 - 23:59	Fakultas Ilmu Administrasi, Universitas Brawijaya, Malang.	\N	\N
2511	 MPKMB SV IPB 56 	Lain-lain	08  - 09 Agu 2019	05:00 - 17:00	Lapangan Lodaya jln. Lodaya 2 kec.Bogor Tengah Kel.Babakan Kota Bogor	\N	\N
2510	 Fisip Week 	Seminar	13  - 13 Jul 2019	10:30 - 04:00	Auditorium Arifin Panigoro, Universitas Al Azhar	\N	\N
2509	 LOMBA CERPEN NASIONAL 	Lain-lain	25 Jun 2019 - 19 Jul 2019	06:00 - 00:00	SELURUH INDONESIA	\N	\N
2508	 Pentas perdana 	Lain-lain	05  - 05 Jul 2019	18:30 - 22:00	Auditorium teater isi yogyakarta	\N	\N
2505	 Talkshow Citizen Journalism di Era Sosial Media 	Seminar	10  - 10 Jul 2019	09:00 - 12:00	Aula Ida Farida Kampus 2 Universitas Islam As-Syafi'iyah	\N	\N
2504	 Talkshow Citizen Journalism di Era Sosial Media 	Seminar	10  - 10 Jul 2019	09:00 - 12:00	Aula Ida Farida Kampus 2 Universitas Islam As-Syafi'iyah	\N	\N
2503	 Chemical Engineering Research Competition 	Lain-lain	09 Mei 2019 - 07 Jul 2019	06:00 - 06:00	UNIVERSITAS DIPONEGORO	\N	\N
2502	 SEMINAR WE CARE 2019 	Seminar	05  - 05 Jul 2019	13:40 - 16:00	Aula gedung utama lt 8, universitas esa unggul	\N	\N
2501	 Lomba Cipta Puisi Nasional 2 	Lain-lain	31  - 31 Agu 2019	01:00 - 23:00	Ikut Lomba	\N	\N
2500	 Harkopnas Karanganyar 2019 (Jalan Sehat) 	Lain-lain	21  - 21 Jul 2019	06:00 - 22:00	Alun Alun Karanganyar	\N	\N
2499	 Seminar & Lomba Usaha Mikro Kecil Menengah 	Seminar	06  - 06 Jul 2019	10:00 - 15:00	Universitas Satya Negara Indonesia Kampus B Bekasi	\N	\N
2495	 Modern Wound Dressing: An Art Of Medicine For Better Healthcare 	Seminar	31  - 31 Agu 2019	07:30 - 15:00	Ruang Pertemuan Dr. A.A. Made Djelantik, Lantai 4 Gedung Barat FK Universitas Udayana	\N	\N
2493	 POLPOS TALKSHOW 	Seminar	06  - 06 Jul 2019	07:00 - 12:00	Auditorium Politeknik Pos Indonesia Bandung	\N	\N
2492	 Soil Festival 	Seminar	20  - 20 Okt 2019	07:30 - 12:00	Auditorium Toyib Hadiwidjaya Faperta IPB	\N	\N
2491	 HIMAWARI BASKETBALL CHAMPIONSHIP 2019 	Sport	26 Jul 2019 - 04 Agu 2019	08:00 - 21:00	PERBASPA, KEC. PARE, KAB. KEDIRI	\N	\N
2490	 Festival of Agroindustri 	Lain-lain	25 Jun 2019 - 18 Agu 2019	00:01 - 23:59	Institur Pertanian Bogor	\N	\N
2489	 CULTURISTIK 2019 	Seminar	02  - 02 Jul 2019	08:00 - 14:00	Auditorium Ir Widjatmoko Universitas Semarang	\N	\N
2488	 ARCCO 	Lain-lain	29 Jun 2019 - 17 Jul 2019	00:00 - 23:59	Universitas Negeri Jakarta	\N	\N
2487	 Drama Tari Jaka Tarub 	Pensi	08  - 08 Jul 2019	19:30 - 22:00	Teater Arena Taman Budaya Jawa Tengah	\N	\N
2486	 Ibc7 	Lain-lain	13  - 15 Sep 2019	14:00 - 22:00	Amongraga.yogyakarta	\N	\N
2485	 Entrepreneur university 	Bursa Kerja	30  - 29 Jun 2019	05:10 - 00:21	Hotel harper	\N	\N
2484	 Lomba Baris Berbaris 9 SMAN 1 Bekasi 	Lain-lain	18  - 18 Agu 2019	08:00 - 15:00	SMAN 1 Bekasi	\N	\N
2483	 Talkshow Potensi Kekayaan Dari Laut Indonesia 	Seminar	26  - 26 Jun 2019	14:00 - 16:38	Solo Paragon Mall	\N	\N
2480	 Mathematics ITS Calculus Competition 	Lain-lain	24 Jun 2019 - 27 Jul 2019	07:30 - 12:30	Departemen Matematika ITS	\N	\N
2479	 Olimpiade Matematika ITS 2019 	Lain-lain	24 Jun 2019 - 27 Jul 2019	08:45 - 12:30	Departemen Matematika ITS	\N	\N
2478	 Competition I-FEST 2019 Innovated with Technology in Industry Creative 	Lain-lain	06  - 06 Jul 2019	08:00 - 15:30	Fakultas Teknik Uhamka, Jl. Tanah Merdeka No.6, RT.10/RW.3, Rambutan, Kec. Ps. Rebo, Kota Jakarta Ti	\N	\N
2477	 Workshop I-FEST 2019 Improve The Experience with Data Science 	Seminar	05  - 05 Jul 2019	08:00 - 15:30	Fakultas Teknik Uhamka, Jl. Tanah Merdeka No.6, RT.10/RW.3, Rambutan, Kec. Ps. Rebo, Kota Jakarta Ti	\N	\N
2476	 Company Visit 	Lain-lain	18  - 18 Jul 2019	08:00 - 20:00	Bank Indonesia & Kementrian BUMN	\N	\N
2475	 Training And Certification Zahir 	Lain-lain	16  - 17 Jul 2019	07:00 - 13:00	Universitas Trilogi	\N	\N
2474	 Fisip Week 	Lain-lain	12  - 12 Jul 2019	09:30 - 12:00	Universitas Al Azhar	\N	\N
2473	 IOSH SUMMIT 2019 	Lain-lain	24 Jun 2019 - 06 Okt 2019	08:00 - 15:00	Fakultas Kedokteran Universitas Sebelas Maret Jl. Ir. Sutami 36 A Kentingan, Surakarta	\N	\N
2470	 I-FEST 2019 	Seminar	05 Jul 2019 - 13 Jun 2019	08:00 - 15:30	Jl. Tanah Merdeka No.6, RT.10/RW.3, Rambutan, Kec. Ps. Rebo, Kota Jakarta Timur, Daerah Khusus Ibuko	\N	\N
2469	 Seminar Pintar Ilmu Teknologi Machine Learning for Machine on the Future 	Seminar	13  - 13 Jul 2019	08:00 - 15:30	Aula Ahmad Dahlan FKIP UHAMKA, Jl. Tanah Merdeka No.20, RT.11/RW.2, Rambutan, Kec. Ciracas, Kota Jak	\N	\N
2468	 Gebyar Bamboo Lira Liru 	Lain-lain	23  - 23 Jun 2019	08:00 - 13:00	Sanankerto, Turen, Kabupaten Malang	\N	\N
2467	 SEMINAR NASIONAL 2019 	Seminar	27  - 27 Jun 2019	07:30 - 13:00	Auditorium Ir. Widjatmoko universitas Semarang jl.soekarno Hatta, Tlogosari, Semarang	\N	\N
2466	 Futsal Competition 	Sport	27  - 29 Jun 2019	13:00 - 21:00	Universitas Trilogi	\N	\N
2465	 Ninja Squad Entrepreneur Day 	Lain-lain	22  - 22 Jun 2019	12:30 - 17:00	Yello Hotel, Manggarai	\N	\N
2464	 Festival KomEd 	Seminar	26  - 26 Jun 2019	09:00 - 22:00	Auditorium Ir Widjatmoko Universitas Semarang	\N	\N
2463	 Seminar Nasional Karya Tulis Ilmiah Populer 	Seminar	27  - 27 Jun 2019	08:00 - 15:00	Aula Bung Hatta, Gedung Pascasarjana, Kampus A Universitas Negeri Jakarta	\N	\N
2462	 Creatalk 2.0 	Lain-lain	25 Jun 2019 - 14 Sep 2019	19:00 - 19:00	Jakarta	\N	\N
2461	 GEBYAR BAMBOO LIRA LIRU 	Lain-lain	23  - 23 Jun 2019	07:30 - 13:15	Ekowisata Boonpring, andeman, sanankerto, turen.	\N	\N
2460	 UTP JOB FAIR 2019 	Bursa Kerja	06  - 07 Agu 2019	09:00 - 16:00	Universitas Tunas Pembangunan Suarakarta	\N	\N
2459	 SEMINAR NASIONAL IOT WITH ONNO W PURBO 	Seminar	07  - 07 Jul 2019	08:00 - 14:30	Aula Fakultas Teknologi Industri UNISSULA Semarang	\N	\N
2457	 Pameran Buku Jateng Fair 2019 	Expo	28 Jun 2019 - 14 Jul 2019	16:00 - 16:00	PRPP Semarang	\N	\N
2455	 Seminar Hari Susu Nusantara Undip 	Seminar	19  - 19 Jun 2019	08:00 - 08:00	Fakultas Peternakan dan Pertanian Universitas Diponegoro Semarang	\N	\N
2454	 BATTLE OF BRAIN (BOB) CONSTITUTIONAL LAW FESTIVAL 2019 	Lain-lain	04  - 06 Okt 2019	06:00 - 06:00	Universitas Brawijaya	\N	\N
2453	 Teenager English Competition in SMANSASI (TENSES) 	Lain-lain	20  - 20 Jul 2019	08:00 - 17:00	SMAN 1 Bekasi	\N	\N
2452	 UNJ Fashion Event 2019 	Lain-lain	22  - 22 Jun 2019	12:00 - 04:15	Museum Mandiri	\N	\N
2451	 RECOFA 	Lain-lain	07 Jul 2019 - 20 Okt 2019	18:10 - 00:00	Universitas Islam Negeri Alauddin Makassar	\N	\N
2450	 Futsal Competition 	Sport	27  - 29 Jun 2019	13:00 - 21:00	Universitas Trilogi	\N	\N
2449	 Beauty Euphoria 	Lain-lain	16  - 16 Jun 2019	08:02 - 15:30	Auditorium Politeknik Negeri Semarang	\N	\N
2448	 Precompetition Concert PSM ITS goes to 3rd Leonardo da Vinci International Choral Festival 	Musik	30  - 30 Jun 2019	18:30 - 21:30	Gedung Kesenian Cak Duraism, Jl. Genteng Kali No.85, Surabaya	\N	\N
2447	 Family Business Talk 2019 - Universitas Prasetiya Mulya 	Seminar	25  - 25 Jul 2019	08:30 - 16:30	Universitas Prasetiya Mulya - Kampus Cilandak	\N	\N
2446	 4th Annual Concert ‘RUANG MIMPI’ and Precompetition Concert Towards Taipei International Choral Competition (TICC) 2019 	Musik	20  - 20 Jul 2019	19:30 - 22:00	Auditorium Graha Swara - Universitas Tarumanagara Lantai 8, Gedung M, Kampus 1 Jl. Letjen S. Parman,	\N	\N
2445	 The 6th Indonesia Foreign Policy Review Journal Competition 	Lain-lain	31 Mei 2019 - 05 Jul 2019	19:00 - 22:00	Fakultas Ilmu Sosial dan Ilmu Politik Universitas Indonesia (FISIP UI) Jl. Prof. DR. Selo Soemardjan	\N	\N
2444	 IBN Campus Fair 2019 	Seminar	25  - 25 Jun 2019	08:00 - 14:30	GS FAME Institut of Business, JL. Pulomas Timur 3A Blok A No. 2	\N	\N
2443	 UHAMKA CHOIR 12th ANNUAL CONCERT 2019 	Musik	14  - 14 Jul 2019	18:30 - 20:30	auditorium sekolah tiara bangsa (acs international jakarta)	\N	\N
2442	 DASH DIPONEGORO 2019 	Lain-lain	26 Sep 2019 - 28 Jun 2019	08:00 - 16:00	Universitas Diponegoro	\N	\N
2441	 Business Plan Competition 	Lain-lain	29  - 30 Jul 2019	10:00 - 18:00	Politeknik STMi Jakarta	\N	\N
2440	 The 6th Gunadarma Choir Festival 	Lain-lain	14  - 14 Sep 2019	09:00 - 17:00	Jl. Margonda Raya No.100, Pondok Cina, Kec. Beji (Universitas Gunadarma Kampus D)	\N	\N
2439	 Seminar dan Talkshow Menghadapi Revolusi Teknologi di Indonesia 	Seminar	19  - 19 Jun 2019	09:00 - 15:15	Universitas Esa Unggul	\N	\N
2437	 NAFIGATION 	Lain-lain	31  - 31 Agu 2019	08:00 - 20:01	Grha Sabha Pramana	\N	\N
2434	 Short Film Competition 	Lain-lain	20 Mei 2019 - 26 Jul 2019	06:30 - 18:00	Bandar Lampung	\N	\N
2433	 CHEETAH 	Lain-lain	14 Mei 2019 - 05 Agu 2019	08:00 - 14:00	UNIVERSITAS MUHAMMADIYAH JAKARTA	\N	\N
2424	 Seminar Nasional Inovasi Pendidikan Berkarakter Menciptakan Generasi Emas 2045 	Seminar	06  - 06 Jul 2019	08:00 - 14:00	Gedung Rektorat Kampus 1 Universitas Mercu Buana Yogyakarta. Jl. Wates, KM.10, Sedayu, Bantul, Daera	\N	\N
2423	 Call for Paper - 7th International Conference (RIEE) 	Seminar	24 Mei 2019 - 24 Jul 2019	09:00 - 18:00	Universitas Prasetiya Mulya - Kampus BSD	\N	\N
2422	 UMN Animation & Film Making Camp 2019 	Lain-lain	08  - 13 Jul 2019	09:00 - 11:27	Universitas Multimedia Nusantara (UMN)	\N	\N
2421	 Ninja OASIS vol. 11 	Lain-lain	25  - 25 Mei 2019	08:30 - 19:00	Hotel Santika Premiere Bintaro	\N	\N
2420	 Hari Susu Nusantara 	Seminar	19  - 19 Jun 2019	08:00 - 13:00	Audotorium FPIK Universitas Diponegoro	\N	\N
2419	 JAP FUTSAL CUP II 2019 	Sport	24  - 28 Jul 2019	13:00 - 21:00	Gor Bima Universitas Negeri Surabaya Lidah Wetan	\N	\N
2418	 Lomba Karya Tulis Ilmiah Nasional SPEAR MSC 2019 	Lain-lain	03  - 03 Nov 2019	08:00 - 15:00	Universitas Jember	\N	\N
2304	 Festival Film Fitrans 	Lain-lain	29  - 30 Okt 2018	07:00 - 07:00	UPN Veteran Jakarta	\N	\N
2305	 Seminar Nasional Collutrium 	Seminar	28  - 28 Okt 2018	07:00 - 07:00	Hotel Megaland	\N	\N
2306	 Olimpiade Budaya Fib Ui 	Lain-lain	13  - 13 Sep 2018	07:00 - 07:00	Auditorium Gedung FIB UI	\N	\N
2309	 Lexicon 2018 	Lain-lain	02  - 04 Nov 2018	07:00 - 07:00	Universitas Airlangga	\N	\N
2310	 Semnas Fsm Undip 2018 	Seminar	09  - 09 Sep 2018	07:00 - 07:00	Aula Dekanat Lt 3 FSM UNDIP	\N	\N
2312	 Samudra Suara 9 	Musik	10  - 10 Sep 2018	07:00 - 07:00	Halaman GOR Kampus 2 Universitas Muhammadiyah Surakarta	\N	\N
2313	 The Grand Launching Binus Bekasi 	Lain-lain	06  - 06 Okt 2018	07:00 - 07:00	Jl. Bulevar Utara Raya, Summarecon Bekasi (BINUS)	\N	\N
2314	 Iodin Inkulturasi Olahraga Dan Seni 	Lain-lain	15  - 21 Okt 2018	07:00 - 07:00	UIN JAKARTA	\N	\N
2315	 Seminar Beasiswa Dan Motivasi Sebemo 	Seminar	19  - 19 Sep 2018	07:00 - 07:00	Aula Maftuchah Yusuf, Gd. Dewi Sartika lt. 2, Kampus A UNJ	\N	\N
2316	 Manajemen Expo 14 	Lain-lain	04  - 06 Okt 2018	07:00 - 07:00	Universitas Islam 45 Bekasi	\N	\N
2319	 Turnamen Bola Volly Antar Sma Smk Ma Se Derajat Se Malang Raya Tahun 2018 	Sport	15  - 15 Nov 2018	07:00 - 07:00	GKB FIP Universitas Negeri Malang	\N	\N
2322	 Psychoscience18 Lomba Essay Nasional 	Lain-lain	03  - 03 Okt 2018	07:00 - 07:00	Universitas Trunojoyo Madura	\N	\N
2323	 Informatics Innovation Festival Invfest 	Lain-lain	16  - 16 Des 2018	07:00 - 07:00	IT Telkom Purwokerto	\N	\N
2325	 Futsal 	Sport	06  - 07 Okt 2018	07:00 - 07:00	GOR UIN Sunan Kalijaga	\N	\N
2326	 Public Health Cup 	Sport	12  - 14 Okt 2018	07:00 - 07:00	Gor Patriot	\N	\N
2328	 Himmas Cup 2018 Hmj Ilmu Komunikasi Humas Sportmanship Can Be Solidariy 	Sport	14  - 16 Sep 2018	07:00 - 07:00	Lapangan Progresif Futsal Soekarno Hata	\N	\N
2329	 Simposium Nasional Fantasy 2018 	Seminar	20  - 20 Okt 2018	07:00 - 07:00	Auditorium Abdul Muis Nasution Institut Pertanian Bogor	\N	\N
2330	 Seminar Nasional 	Seminar	29  - 29 Sep 2018	07:00 - 07:00	Hotel Mercure Karawang	\N	\N
2332	 Trikabta Islamic Fair 2018 	Lain-lain	17  - 17 Sep 2018	07:00 - 07:00	SMA N 3 Tangerang	\N	\N
2333	 Epim Expo Dan Pekan Ilmiah Mahasiswa Nasional 2018 	Lain-lain	02  - 02 Nov 2018	07:00 - 07:00	Politeknik Negeri Jember	\N	\N
2334	 English Festival 	Lain-lain	02  - 10 Okt 2018	07:00 - 07:00	UIN Jakarta	\N	\N
2335	 Kajian Kemuslimahan 	Lain-lain	15  - 15 Sep 2018	07:00 - 07:00	Mushola Al-Muhandis UPN Veteran Jawa Timur	\N	\N
2336	 Pepc Expo 	Expo	17  - 17 Sep 2018	07:00 - 07:00	Taman Fakultas Ekonomi dan Bisnis Universitas Pancasila	\N	\N
2337	 Lkti A Nasional 	Lain-lain	21  - 21 Okt 2018	07:00 - 07:00	Universitas Lampung	\N	\N
2338	 Simposium Pengaruh Media Sosial Terhadap Aktualisasi Diri Generasi Milenial 	Seminar	03  - 03 Okt 2018	07:00 - 07:00	Aula Bung Hatta, Kampus Pascasarjana, Universitas Negeri Jakarta	\N	\N
2339	 Pameran Arsip Kopi Ugm 	Expo	14  - 16 Sep 2018	07:00 - 07:00	English Ivy Coffee	\N	\N
2345	 Kompetisi Pasar Modal Now And Never 	Lain-lain	31  - 31 Okt 2018	07:00 - 07:00	Universitas Kristen Satya Wacana	\N	\N
2346	 International Workshop Of Business 	Seminar	29 Nov 2018 - 20 Okt 2019	07:00 - 07:00	 Auditorium G2 FE UNESA, Ketintang, Surabaya, East Java	\N	\N
2347	 Seminar Perberdayaan Perempuan 	Seminar	14  - 14 Sep 2018	07:00 - 07:00	Aula STIE EKUITAS	\N	\N
2350	 Ufonity Photo Video Competition 2018 	Lain-lain	13  - 13 Sep 2018	07:00 - 07:00	Universitas Udayana	\N	\N
2352	 Seminar Motivation 	Seminar	03  - 03 Okt 2018	07:00 - 07:00	Auditorium Grha Wira Bakti Universitas Darma Persada	\N	\N
2353	 Management Days 2018 Expo Bazar And Talk Show 	Lain-lain	29  - 29 Sep 2018	07:00 - 07:00	Universitas Sanata Dharma	\N	\N
2354	 Seminar Nasional Festival Mipa Unj 	Seminar	27  - 27 Okt 2018	07:00 - 07:00	Aula Sertifikasi Guru Lt. 9 UNJ	\N	\N
2359	 Unair Open 	Sport	24  - 29 Sep 2018	07:00 - 07:00	Aula Student Center Kampus C Universitas Airlangga, Surabaya	\N	\N
2360	 Accrual Band Competition 	Lain-lain	06  - 06 Okt 2018	07:00 - 07:00	Epiwalk, Taman Rasuna Kuningan	\N	\N
2361	 Testale Interest Talent 	Lain-lain	27  - 27 Sep 2018	07:00 - 07:00	Aula Brigjen Latief Hendraningrat, Gedung Dewi Sartika Lt 2, Universitas Negeri Jakarta	\N	\N
2363	 Takjub Karya Literasi Anak Bangsa 	Lain-lain	13  - 29 Sep 2018	07:00 - 07:00	Universitas Airlangga	\N	\N
2364	 Takjub Karya Literasi Anak Bangsa 	Lain-lain	13 Agu 2018 - 29 Sep 2018	07:00 - 07:00	Online	\N	\N
2365	 Takjub Karya Literasi Anak Bangsa 	Lain-lain	12 Agu 2018 - 27 Sep 2018	07:00 - 07:00	Online	\N	\N
2367	 Jambore Perlindungan Tanaman Indonesia 	Lain-lain	07  - 10 Okt 2018	07:00 - 07:00	Institut Pertanian Bogor	\N	\N
2371	 Interact Interactive Communication Training 	Seminar	15  - 15 Sep 2018	07:00 - 07:00	Jalan Niaga utara kav. 1-2 jababeka II Cikarang Mekarmukti, Bekasi, Jawa Barat	\N	\N
2372	 Shooting 4 	Seminar	22  - 22 Sep 2018	07:00 - 07:00	Gedung Serbaguna FIB  Undip	\N	\N
2373	 Kita Pulang Conference 	Lain-lain	02  - 04 Nov 2018	07:00 - 07:00	Universitas Diponegoro	\N	\N
2374	 Seminar Nasional 	Seminar	16  - 16 Sep 2018	07:00 - 07:00	Direktorat Lt 3 PPNS, Surabaya	\N	\N
2376	 Think Feel Do Post Millennials 	Expo	13  - 15 Sep 2018	07:00 - 07:00	@theparlor.bdg Jl. Raya Rancakendal Luhur no.9 -	\N	\N
2378	 Reef Check Dan Pulau Air 	Lain-lain	26  - 28 Okt 2018	07:00 - 07:00	\N	\N	\N
2380	 Epim Expo Dan Pekan Ilmiah Mahasiswa Nasional 2018 	Expo	11 Sep 2018 - 06 Okt 2018	07:00 - 07:00	Politeknik Negeri Jember	\N	\N
2382	 Rumah Pengembangan Charity 2018 	Lain-lain	20  - 21 Sep 2018	07:00 - 07:00	Sekolah Master Indonesia	\N	\N
2383	 Seminar Nasional Islamic Law Fair 2018 	Seminar	22  - 22 Sep 2018	07:00 - 07:00	Ruang Seminar Gedung Litigasi Fakultas Hukum Universitas Diponegoro	\N	\N
2385	 Pkmtm Pekan Kreatifitas Mahasiswa Teknik Mesin 2018 	Lain-lain	25 Nov 2018 - 02 Des 2018	07:00 - 07:00	Universitas Sultan Ageng Tirtayasa	\N	\N
2386	 Technoblast First Sensation 	Lain-lain	24  - 24 Nov 2018	07:00 - 07:00	stadion Diponegoro Semarang	\N	\N
2388	 Seminar Conference K3 2018 	Seminar	22  - 22 Sep 2019	07:00 - 07:00	Gedung Grha Dewa Ruci	\N	\N
2390	 Lomba Karya Tulis Ilmiah Tingkat Universitas Se Jateng Diy 	Lain-lain	10 Agu 2018 - 11 Nov 2018	07:00 - 07:00	\N	\N	\N
2393	 Seminar Nasional K3 	Seminar	24  - 24 Nov 2018	07:00 - 07:00	Ballroom Hotel Solo Paragon	\N	\N
2394	 History Fair Ui 	Lain-lain	01 Agu 2108 - 04 Okt 2018	07:00 - 07:00	\N	\N	\N
2395	 History Fair Ui 	Lain-lain	01 Agu 2018 - 04 Okt 2019	07:00 - 07:00	\N	\N	\N
2397	 Consen 2018 	Seminar	14  - 14 Okt 2018	07:00 - 07:00	Dominic Hotel Purwokerto	\N	\N
2398	 Seminar Nasional Kecantikan 	Lain-lain	06  - 06 Okt 2018	07:00 - 07:00	Ruang Drost, Universitas Sanata Dharma Kampus III, Paingan, Yogyakarta	\N	\N
2399	 Seminar Nasional Kecantikan 	Lain-lain	06  - 06 Okt 2018	07:00 - 07:00	uang Drost, Universitas Sanata Dharma Kampus III, Paingan, Yogyakarta	\N	\N
2400	 Rasa Cipta Karsa 	Lain-lain	17  - 19 Sep 2018	07:00 - 07:00	Hall FEB, Kampus II UMS	\N	\N
2401	 Lktin Kimia Unesa 2018 	Lain-lain	24 Jul 2018 - 18 Sep 2018	07:00 - 07:00	universitas surabaya	\N	\N
2402	 Olimpiade Ppkn 30 	Lain-lain	12  - 14 Nov 2018	07:00 - 07:00	Aula Latif Hendradiningrat, Gedung Dewi Sartika lt 2. Universitas Negeri Jakarta	\N	\N
2404	 Seminar Nasional Diplonary Diploma Visionary 	Lain-lain	11 Nov 2019 - 11 Nov 2018	07:00 - 07:00	aula gedung f fkip universitas sebelas maret	\N	\N
2405	 Seminar Nasional Kesehatan Masyarakat 	Lain-lain	30  - 30 Sep 2018	07:00 - 07:00	Auditorium Lt.4 Fakultas Kedokteran dan Kesehatan Universitas Muhammadiyah Jakarta	\N	\N
2406	 Kompromi Kuda Indonesia 	Seminar	29  - 29 Sep 2018	07:00 - 07:00	BALE SAWALA UNIVERSITAS PADJADJARAN	\N	\N
2407	 Communication Fair 2018 	Lain-lain	06  - 12 Okt 2018	07:00 - 07:00	universitas pancasila	\N	\N
2408	 Ceds Talk 2018 	Seminar	21  - 21 Sep 2018	07:00 - 07:00	Student Center Fakultas Ekonomi dan Bisnis Universitas Indonesia	\N	\N
2409	 Heal Earth Heal Our Future 	Lain-lain	21  - 21 Sep 2018	07:00 - 07:00	SD N Bulusan Tembalang, Semarang	\N	\N
2410	 Seminar Nasional Optimalisasi Sumber Daya Lokal Dalam Mewujudkan Kedaulatan Pangan 	Seminar	20  - 20 Okt 2018	07:00 - 07:00	Gedung Teknologi Tepat Guna UPN Veteran Jatim	\N	\N
2413	 Accounting Tournament In Accrual 	Lain-lain	05  - 07 Nov 2018	07:00 - 07:00	UPN Veteran Jakarta	\N	\N
2414	 Intechnoculture30 	Seminar	19  - 19 Sep 2018	07:00 - 07:00	Bale Santika Universitas Padjadjaran	\N	\N
2292	 Seek By Ricma 	Expo	19 Agu 2018 - 15 Sep 2018	07:00 - 07:00	Masjid Cut Meutia	\N	\N
2293	 Bakti Masyarakat Ksr Pmi Unit Uin Syarif Hidayatullah Jakarta 	Lain-lain	14  - 16 Sep 2018	07:00 - 07:00	Desa Sobang	\N	\N
2113	 Lomba MI Se-Jawa Timur 	Lain-lain	25  - 25 Agu 2018	07:00 - 00:00	Universitas Islam Malang	\N	\N
2294	 Family And Consumer Sciences National Competition And Syposium Fantasy 2018 	Seminar	20  - 20 Okt 2018	07:00 - 07:00	Auditorium Abdul Muis Nasution Institut Pertanian Bogor	\N	\N
2296	 Solo Health Festival 	Musik	09  - 09 Sep 2018	07:00 - 07:00	Balekambang	\N	\N
2298	 Pengabdian Masyarakat Nasional 	Lain-lain	21  - 23 Sep 2018	07:00 - 07:00	Dusun Kasah	\N	\N
2301	 Binawan Festival 	Seminar	15  - 15 Sep 2018	07:00 - 07:00	Auditorium STIKes Binawan, Kalibata Jakarta Timur.	\N	\N
2302	 Binawan Festival 	Lain-lain	25  - 25 Sep 2018	07:00 - 07:00	Aula STIKes Binawan, Jakarta Timur	\N	\N
2303	 Binawan Festival 	Sport	24  - 30 Sep 2018	07:00 - 07:00	STIKes Binawan, Jakarta Timur	\N	\N
2416	 Niskala Parahyangan 	Lain-lain	25  - 25 Mei 2019	10:00 - 15:30	Aula Barat ITB	\N	\N
2415	 Lomba Cipta Puisi 	Lain-lain	06 Mar 2019 - 25 Apr 2019	08:00 - 00:00	Lomba Nasional	\N	\N
2425	 Berbagi Senyuman 	Donasi	27 Peb 2019 - 17 Mar 2019	12:00 - 12:00	SLB Karanganyar	\N	\N
2288	 Management Case Analysis Competition 2018 	Lain-lain	05  - 08 Nov 2018	07:30 - 15:00	Purwokerto	\N	\N
2287	 Multimedia And Game Event 4 	Lain-lain	11  - 18 Nov 2018	07:00 - 20:00	Departemen Teknik Komputer - ITS Surabaya	\N	\N
2286	 Information Technology Creative Competition (ITCC) 2018 	Lain-lain	15  - 16 Nov 2018	09:00 - 15:00	Kampus Teknologi Informasi, Fakultas Teknik, Universitas Udayana, Bukit Jimbaran - Badung Bali	\N	\N
2285	 SEMINAR INSPIRATIF 2018 	Seminar	22  - 22 Sep 2018	07:30 - 14:00	GRAHA BIK IPTEK-DOK UNAIR	\N	\N
2284	 Open Rekruitmen YOT Tangerang 	Lain-lain	03  - 16 Sep 2018	06:00 - 00:00	Tangerang Raya	\N	\N
2283	 Olimpiade Ekonomi 15th 	Lain-lain	16  - 16 Sep 2018	07:00 - 15:00	Fakultas Ekonomi dan Bisnis Universitas Airlangga	\N	\N
2282	 Olimpiade Biologi Nasional BIOLEAF UNJ 2018 	Lain-lain	06  - 06 Okt 2018	07:00 - 12:00	Universitas Negeri Jakarta	\N	\N
2281	 Hulu Migas Goes To Campus - Oil and Gas Legal Workshop 	Seminar	06  - 06 Okt 2018	09:00 - 15:00	Gedung Litigasi FH UNDIP	\N	\N
2280	 PETAK 99 Universitas Negeri Jakarta 	Lain-lain	08  - 08 Okt 2018	07:00 - 15:00	UNIVERSITAS NEGERI JAKARTA , Jl. Rawamangun Muka, RT.11/RW.14, Rawamangun, RT.11/RW.14, Rawamangun, 	\N	\N
2279	 CROSS CULTURE FESTIVAL 	Lain-lain	23  - 23 Sep 2018	07:00 - 20:00	Universitas 17 Agustus 1945 Surabaya	\N	\N
2278	 Kompetisi Matematika 3.0  	Lain-lain	17  - 17 Nov 2018	07:00 - 18:00	Kampus 1 Universitas Tarumanegara Jl. Kyai Tapa no.1	\N	\N
2277	 Beasiswa S2 di China dari Schwarzman Scholars deadline 27 September 2018 	Lain-lain	01 Apr 2018 - 27 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2276	 Beasiswa LPDP Tahap II, Kejar S2 dan S3 di Luar Negeri 	Lain-lain	09 Jul 2018 - 21 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2275	 BEASISWA S1, S2 DAN S3 DI ETSU, AMERIKA SERIKAT 	Lain-lain	15 Jul 2019 - 15 Okt 2019	00:00 - 00:00	Indonesia	\N	\N
2274	 MEDSMOTION 2108 	Lain-lain	28 Agu 2018 - 09 Nov 2018	07:00 - 15:00	Fakultas Kedokteran Universitas Sebelas Maret	\N	\N
2273	 Seminar Nasional Kemuslimahan 	Seminar	27  - 27 Okt 2018	08:00 - 12:00	Auditorium G2 Fakultas Ekonomi UNESA	\N	\N
2272	 ESA Competition 5 	Lain-lain	29 Sep 2018 - 06 Okt 2018	07:30 - 14:00	SMA Muhammadiyah 3 Jember (29 September 2018) dan FKIP 3rd Building Jember University (6 Okt 2018)	\N	\N
2271	 Talk Show Berbagi Kekuatan Melawan Kanker 	Seminar	07  - 07 Sep 2018	14:00 - 16:30	Aula Student Center UIN Jakarta	\N	\N
2270	 EPIM (Expo dan Pekan ilmiah mahasiswa Nasional) 2018 	Lain-lain	02  - 03 Nov 2018	07:00 - 15:00	Gor perjuangan 45	\N	\N
2269	 UI CAREER & SCHOLARSHIP EXPO XXVI 2018 In Collaboration With NAMA Foundation 	Expo	20  - 22 Sep 2018	09:00 - 17:00	Balairung â€“ UI, Kampus UI Depok	\N	\N
2268	 Knowledge of Cave dan Konservasi PETA BUMI 2018 	Lain-lain	23  - 23 Sep 2018	07:00 - 16:00	Purbalingga dan Kebumen	\N	\N
2267	 Seminar Nasional PETA BUMI 2018 	Seminar	22  - 22 Sep 2018	08:00 - 15:00	Purwokerto	\N	\N
2266	 Brawijaya Essay Competition 	Lain-lain	01 Sep 2018 - 10 Nov 2018	00:00 - 00:00	Malang	\N	\N
2265	 Beasiswa Bidikmisi â€“ Universitas Gadjah Mada (UGM) 	Lain-lain	27 Agu 2018 - 03 Sep 2018	00:00 - 00:00	Bulaksumur, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281	\N	\N
2264	 Management Event 2018 	Lain-lain	08 Okt 2018 - 02 Nov 2018	08:00 - 19:00	Universitas Negeri Jakarta Kampus A	\N	\N
2263	 Management Event 2018 	Lain-lain	08 Okt 2018 - 02 Nov 2018	07:00 - 18:00	Universitas Negeri Jakarta Kampus A	\N	\N
2262	 IT-Venture XI 	Lain-lain	04  - 11 Nov 2018	09:00 - 17:00	Universitas Sebelas Maret	\N	\N
2261	 SIAPA SURUH PARTEEEH 	Musik	31 Agu 2018 - 01 Sep 2018	20:00 - 01:00	Reborn Cafe Malang	\N	\N
2260	 AGRIDATION PHOTOGRAPHY COMPETITION 	Lain-lain	18 Jul 2018 - 20 Sep 2018	08:00 - 16:00	SEKOLAH VOKASI IPB	\N	\N
2259	 Seminar Nasional Public Speaking 	Seminar	03  - 03 Sep 2018	07:30 - 12:30	Ged. Graha IAIN Surakarta	\N	\N
2258	 National Seminar and Inspiring Talkshow STE 2018 	Seminar	23  - 23 Sep 2018	07:00 - 15:00	Airlangga Convention Center , Kampus C Unair	\N	\N
2257	 WARNA TANI 	Seminar	14  - 21 Okt 2018	08:00 - 20:00	Universitas Sumatera Utara Jln. Dr. T. Mansur No 9, Padang Bulan, Medan	\N	\N
2256	 SEMINAR PENGABDIAN PADA MASYARAKAT 	Seminar	06  - 06 Sep 2018	08:00 - 16:00	AULA STIE EKUITAS 	\N	\N
2255	 BEASISWA S1 ONLINE SCHOLARSHIP COMPETITION (OSC) 	Lain-lain	30 Agu 2018 - 02 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2254	 HN EXPO 2018 	Lain-lain	23  - 24 Nov 2018	09:00 - 14:00	Fakultas Pertanian USU	\N	\N
2253	 MACFEST 4.0 	Musik	31 Agu 2018 - 02 Sep 2018	02:00 - 10:00	Politeknik APP Jakarta 	\N	\N
2252	 Hi-BB 2018 Lomba Tingkat Nasional 	Lain-lain	14  - 14 Agu 2018	07:00 - 14:00	STKIP Al Hikmah Surabaya	\N	\N
2251	 Hi-BB 2018 bersama Habiburrahman El Shirazy 	Seminar	20  - 20 Okt 2018	07:00 - 13:00	STKIP Al Hikmah Surabaya	\N	\N
2250	 Beasiswa OSC (Online Scholarship Competition) 2018 	Lain-lain	30 Agu 2018 - 02 Nov 2018	00:00 - 00:00	Universitas Islam Malang	\N	\N
2249	 HYSTERIC 2018 	Expo	26  - 27 Sep 2018	07:00 - 18:00	Kampus A UNJ , jln Rawamangun muka rt 11 rw14 , Rawamangun , Jakarta timur	\N	\N
2248	 ENGLISH FESTIVAL IV 	Lain-lain	14  - 21 Okt 2018	07:30 - 01:30	Sekolah Vokasi IPB	\N	\N
2247	 NUTRIFEST 2018 NUTRITION CONFERENCE 	Seminar	16  - 16 Sep 2018	07:00 - 15:00	Hotel Grasia Jl. Letnan Jendral S.Parman No. 29 Semarang	\N	\N
2246	 LKTI LOGIKA UI 2019 	Lain-lain	02 Jul 2018 - 10 Sep 2018	00:00 - 00:00	FMIPA UI, Depok	\N	\N
2245	 PhD Keahlian, Departemen Fisika & Astronomi, Universitas Sussex, Inggris 	Lain-lain	01 Jul 2018 - 01 Okt 2018	00:00 - 00:00	Indonesia	\N	\N
2244	 Beauty Class with WARDAH x Kolary Coffee 	Seminar	08  - 08 Sep 2018	11:00 - 16:00	Kolary Coffee Kemanggisan	\N	\N
2243	 Beasiswa Mahaghora untuk Kuliah Diploma atau Sarjana 	Lain-lain	01 Sep 2018 - 13 Okt 2018	00:00 - 00:00	surabaya	\N	\N
2242	 Beasiswa PhD Sepenuhnya Didanai dalam Ekonomi, CERGE-EI, Republik Ceko 	Lain-lain	28 Agu 2018 - 31 Mar 2019	00:00 - 00:00	Indonesia	\N	\N
2241	 Beasiswa MA dalam Perlindungan Pengungsi dan Studi Migrasi Paksa, Universitas London, Inggris 	Lain-lain	28  - 15 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2240	 Penuh Biaya + Tunjangan Beasiswa Sarjana, Korea Advanced Institut Sains dan Teknologi (KAIST), Korea 	Lain-lain	26 Jul 2018 - 26 Okt 2018	00:00 - 00:00	Indonesia	\N	\N
2239	 Lomba Karya Tulis Ilmiah Mahasiswa  	Lain-lain	26 Agu 2018 - 23 Des 2018	07:00 - 16:00	PT Badak LNG	\N	\N
2238	 SOVITESTALE 	Lain-lain	17 Agu 2018 - 27 Sep 2018	00:00 - 17:00	AULA BRIGJEN LATIEF HENDRADININGRAT, GEDUNG DEWI SARTIKA LANTAI 2, UNIVERSITAS NEGERI JAKARTA	\N	\N
2235	 Djakarta Elektro Project 	Lain-lain	13  - 15 Sep 2018	08:00 - 23:00	Fakultas Teknik Universitas Muhammadiyah Jakarta	\N	\N
2234	 BEASISWA S1 SEA DI UNIVERSITAS DALAM NEGERI 	Lain-lain	01 Jun 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2233	 Tax Planning Competition 2018 	Lain-lain	27  - 29 Sep 2018	08:00 - 14:00	Fakultas Ilmu Administrasi	\N	\N
2232	 WORKSHOP DAY 	Seminar	05  - 05 Sep 2018	13:00 - 16:00	GS FAME Institute of Business/IBN Jl. Pulo Mas Timur 3A Blok A No. 2 Kayu Putih, Jakarta Timur	\N	\N
2231	 Sovitestale 	Seminar	27  - 27 Sep 2018	08:00 - 12:00	Aula Brigjen Latief Hendradiningrat , Gedung Dewi Sartika Lantai 2,  Universitas Negeri Jakar	\N	\N
2220	 eCOM 2018: Innovation Generation 	Lain-lain	12 Okt 2018 - 14 Sep 2018	07:00 - 18:00	The Joseph Wibowo Center (JWC) Binus International Campus, South Jakarta & Fx Campus	\N	\N
2219	 BEASISWA S2 DI LEIDEN UNIVERSITY, BELANDA 	Lain-lain	01 Mar 2019 - 30 Apr 2019	00:00 - 00:00	Indonesia	\N	\N
2218	 BEASISWA S2 INTERNASIONAL ENS DE LYON 	Lain-lain	18 Sep 2018 - 31 Okt 2018	00:00 - 00:00	Indonesia	\N	\N
2217	 Seminar Nasional 	Seminar	15  - 15 Sep 2018	07:00 - 01:30	Politeknik Negeri Semarang	\N	\N
2215	 Tutnamen ML D4 Cup 	Lain-lain	06  - 08 Sep 2018	09:00 - 17:00	Online & Offline (Universitas Trisakti)	\N	\N
2214	 Seminar Nasional SANSKERTA 2018 	Seminar	05  - 05 Sep 2018	07:30 - 12:00	Ruang Seminar, Gedung 3, Fakultas Ilmu Budaya, Universitas Sebelas Maret	\N	\N
2213	 The Future is Yours 	Seminar	05  - 05 Sep 2018	13:00 - 16:00	Kampus 3 Unika Atama Jaya BSD	\N	\N
2212	 Polymer Days 	Seminar	30  - 30 Agu 2018	07:00 - 16:00	Aula lt.7 Politeknik STMI Jakarta	\N	\N
2210	 Seminar Nasional Keprofesian Matematika & LKTI 	Seminar	03  - 03 Nov 2018	08:30 - 16:00	Auditorium Bale Sawala Universitas Padjadjaran (Rektorat)	\N	\N
2209	 Addictive  	Seminar	14  - 14 Sep 2018	17:00 - 21:00	Telkom University Convention Hall	\N	\N
2208	 Perspektif 	Lain-lain	26 Agu 2018 - 28 Okt 2018	11:00 - 17:00	Surakarta	\N	\N
2207	 Pendaftaran Stand Bazar PPNS EXPO 2018 	Lain-lain	30  - 30 Nov -1	08:00 - 15:00	Politeknik Perkapalan Negeri Surabaya	\N	\N
2206	 National Business Solution Competition 	Lain-lain	17 Sep 2018 - 25 Nov 2018	08:00 - 16:00	Clove Garden Hotel, Bandung	\N	\N
2197	 Chemistry Festival 2018 	Lain-lain	15 Jul 2018 - 10 Nov 2018	07:00 - 11:00	Gedung Daerah Provinsi Kepulauan Riau	\N	\N
2196	 Pengenalan Studi Mahasiswa Baru Fakultas Ekonomi dan Bisnis Universitas Muhammadiyah Malang 2018 	Lain-lain	03  - 06 Sep 2018	07:00 - 16:00	DOME Universitas Muhammadiyah Malang	\N	\N
2195	 Bazar Ice Festival 2 	Lain-lain	13  - 16 Sep 2018	08:00 - 12:00	Kampus E Uhamka FEB Jl.Raya Bogor No.2, Ciracas, Jakarta Timur	\N	\N
2194	 Istanbuk (Istana Buku) 	Lain-lain	15  - 16 Sep 2018	08:00 - 01:00	Panti asuhan Taqwa Al qolbi	\N	\N
2193	 Beasiswa Pelajar SD Tahun 2019 dari Pandan College 	Lain-lain	24 Agu 2018 - 31 Mar 2019	00:00 - 00:00	Jl. Cok Agung Tresna No.15 Griya Alamanda No.7, Renon, Denpasar	\N	\N
2192	 Beasiswa Pelajar SMP SMU oleh Yayasan K-Link Care 	Lain-lain	20  - 10 Sep 2018	00:00 - 00:00	Jl. Gatot Subroto Kav. 59A, Jakarta Selatan 12950	\N	\N
2191	 BEASISWA S2 DI UNIVERSITY OF LAUSANNE, SWISS 	Lain-lain	01 Jul 2018 - 01 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2190	 'ASTERIC' (Asterisma's Chemical Product Innovation Contest) 	Lain-lain	27 Sep 2018 - 08 Des 2018	09:00 - 15:00	Kampus Institut Teknologi National	\N	\N
2188	 TRYOUT & OPEN HOUSE FKUI 2018 	Seminar	21  - 28 Okt 2018	08:00 - 16:00	SMAN 39 Jakarta dan Universitas Indonesia, Depok	\N	\N
2187	 BEASISWA PANDAN COLLAGE UNTUK PELAJAR SD 	Lain-lain	24 Agu 2018 - 31 Mar 2019	00:00 - 00:00	Indonesia	\N	\N
2186	 PARADIGM 2018 	Lain-lain	12  - 15 Nov 2018	08:00 - 20:00	Jl. Raya Bandung Sumedang KM.21, Hegarmanah, Jatinangor, Kabupaten Sumedang, Jawa Barat 45363	\N	\N
2185	 BEASISWA S2 DI CHULABHORN GRADUATE INSTITUTE, THAILAND 	Lain-lain	01 Agu 2018 - 30 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2184	 CALL FOR PAPER PIF XXI UNY 	Seminar	24  - 25 Agu 2018	16:00 - 00:00	Ruang Seminar FMIPA UNY	\N	\N
2183	 OLIMPIADE FISIKA TINGKAT SMA/MA dan SMP/MTs NASIONAL PIF XXI HIMAFI UNY 	Lain-lain	31 Agu 2018 - 06 Okt 2018	00:00 - 00:00	Fakultas MIPA UNY	\N	\N
2182	 ICE Festival 2 	Lain-lain	13  - 16 Sep 2018	08:00 - 12:00	Kampus E Uhamka FEB Jl. Raya Bogor Nomor 2 jakarta timur	\N	\N
2181	 BEASISWA S1 DI VIETNAM MARITIME UNIVERSITY 	Lain-lain	01 Jun 2018 - 30 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2180	 BEASISWA S2 DI UNIVERSITY OF GRONINGEN, BELANDA 	Lain-lain	24 Agu 2018 - 01 Des 2018	00:00 - 00:00	Indonesia	\N	\N
2179	 BEASISWA S2 DAN S3 HEINRICH BOLL DI JERMAN 	Lain-lain	24 Agu 2018 - 01 Mar 2019	00:00 - 00:00	Indonesia	\N	\N
2178	 Proceeding Annual National Conferencefor Economics and Education Research  	Seminar	17  - 18 Okt 2018	07:00 - 05:00	Kampus STKIP PGRI Sumatera Barat Aula Gedung B Lantai 2	\N	\N
2177	 Beasiswa Tahfidz Qurâ€™an For Leaders 2018 Di 24 PTN 	Lain-lain	15 Jul 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2176	 Gelombang Beasiswa BINUS Dibuka, Dapatkan Bebas Biaya Masuk Hingga 100% 	Lain-lain	21 Agu 2018 - 20 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2175	 BAZAR ICE FESTIVAL 2 	Lain-lain	13  - 16 Sep 2018	08:00 - 12:00	Kampus E UHAMKA FEB. Jl. Raya Bogor No. 2 Ciracas, Jakarta Timur	\N	\N
2174	 Seminar Ilmiah A Clinical Approach for The Diagnosis of Diabetes Melitus 	Seminar	30  - 30 Sep 2018	07:00 - 14:00	Aula K.H Ahmad Dahlan Lt.7 Gd. E FEB Universitas Muhammadiyah Sidoarjo	\N	\N
2173	 Kalbis In Action 2018 	Lain-lain	08 Okt 2018 - 30 Nov -1	06:00 - 03:00	Kalbis Institute	\N	\N
2172	 BAZAR BUKU 2018  	Lain-lain	28 Agu 2018 - 08 Sep 2018	08:30 - 16:00	Showroom UGM Press, Jalan Grafika no.1 Kampus UGM Bulaksumur Yoigyakarta (Fakultas Teknik UGM)	\N	\N
2171	 MEENOLOGY 2018 : Lomba Karya Tulis Ilmiah Nasional (LKTIN)  2018 	Lain-lain	03  - 04 Nov 2018	07:00 - 18:00	Politeknik Negeri Semarang	\N	\N
2170	 TAlKSHOW NASIONAL  THINK OUT OF THE BOX FOR SUCCES 	Seminar	24  - 24 Nov 2018	08:00 - 12:00	Universitas Mercu Buana Yogyakarta	\N	\N
2168	 BEASISWA GENERASI HARAPAN  UNTUK MAHASISWA SUMATERA SELATAN 	Lain-lain	23  - 29 Agu 2018	00:00 - 00:00	Jl. Jendral Sudirman no 1892/22  RT 25 RW 09 Kel. 20 Ilir, Kec.  Ilir Timur I Kota Palembang, Sumate	\N	\N
2167	 MUSAVIR Local Sound Vol. 2 	Musik	24  - 24 Agu 2018	10:00 - 17:00	Lapangan Rektorat UPN 	\N	\N
2166	 Bvoice  21th Anniversary 	Pensi	25  - 25 Agu 2018	13:00 - 22:00	La Piazza, Gandaria city	\N	\N
2165	 Collutrium Competition essay competition 	Lain-lain	10 Jul 2018 - 28 Agu 2018	00:00 - 23:59	Fmipa uns	\N	\N
2164	 Collutrium Competition losartan manual 	Lain-lain	10 Jul 2018 - 09 Sep 2018	00:00 - 23:56	Fmipa uns	\N	\N
2163	 Collutrium Competition Losartan digital 	Lain-lain	10 Jul 2018 - 31 Agu 2018	00:00 - 23:57	Fmipa uns	\N	\N
2162	 Seminar Nasional Invofest 2018 (Informatics Vocational Festival) 	Seminar	27  - 27 Okt 2018	08:00 - 12:00	Jl. Mataram No.9, Kel. pesurungan lor, Kel. Pesurungan Lor, Pesurungan Lor, Margadana	\N	\N
2161	 Workshop IF 2018 	Lain-lain	12  - 13 Okt 2018	08:00 - 12:00	Universitas Al Azhar Indonesia	\N	\N
2160	 Seminar Internasional : Opportunities and Challenges of Photovoltaics Energy in Indonesia 	Seminar	04  - 04 Sep 2018	08:30 - 15:00	Auditorium Musik Gereja (AMG) Universitas Kristen Immanuel	\N	\N
2159	 Seminar COMPFEST X 	Expo	22  - 30 Sep 2018	00:00 - 23:55	Universitas Indonesia	\N	\N
2157	 Beasiswa S2 Hubungan International di Australia Full 	Lain-lain	01 Agu 2018 - 31 Okt 2018	00:00 - 00:00	Indonesia	\N	\N
2156	 Beasiswa S2 â€“ S3 Full di University of Adelaide 	Lain-lain	31 Jan 2019 - 30 Apr 2019	00:00 - 00:00	Indonesia	\N	\N
2155	 Seminar Ekonomi Islam 	Seminar	25  - 25 Agu 2018	07:30 - 12:00	Aula E3 Fakultas Ekonomi Universitas Negeri Malang	\N	\N
2154	 Hari Pers Kampus 2018 	Lain-lain	25  - 26 Sep 2018	08:00 - 18:00	Kampus Universitas Serang Raya	\N	\N
2153	 Workshop on Geophysical Method 2018 	Lain-lain	10  - 14 Sep 2018	07:00 - 11:00	Universitas Brawijaya dan Cangar, Kota Batu	\N	\N
2152	 12th DENTISTRY SCIENTIFIC MEETING UNIVERSITAS INDONESIA 	Seminar	13  - 14 Okt 2018	08:00 - 16:00	Gedung LIPI Jakarta	\N	\N
2151	 BEASISWA ELFI PROJECT BAGI MAHASISWI INDONESIA 	Lain-lain	06 Agu 2018 - 01 Nov 2018	00:00 - 00:00	Jl. Elang Malindo 1 A1/4 Komp. Curug Indah	\N	\N
2150	 BEASISWA DATAPRINT UNTUK PELAJAR SMP, SMA DAN MAHASISWA D3, D4, S1 	Lain-lain	05 Jul 2018 - 16 Des 2018	00:00 - 00:00	Jakarta	\N	\N
2149	 BEASISWA S2 HUBUNGAN INTERNATIONAL DI AUSTRALIA 	Lain-lain	10 Agu 2018 - 31 Okt 2018	00:00 - 00:00	Jakarta	\N	\N
2148	 Beasiswa S2 di Jepang 2019 dari INPEX 	Lain-lain	20 Agu 2018 - 15 Nov 2018	00:00 - 00:00	Akasaka 5-3-1, Minato-Ku, Tokyo 107-6332 Japan	\N	\N
2147	 Beasiswa MBA Said Business School di University of Oxford 	Lain-lain	20 Agu 2018 - 11 Jan 2019	00:00 - 00:00	Indonesia	\N	\N
2146	 Beasiswa Full di Singapore University of Technology and Design (SUTD) 	Lain-lain	01 Agu 2018 - 15 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2145	 Beasiswa Doktor 2019 - 2020 University of Warwick, UK 	Lain-lain	01 Agu 2018 - 18 Jan 2019	00:00 - 00:00	Indonesia	\N	\N
2142	 Beasiwa S2 Kesehatan Full dari Wellcome di Dalam dan Luar Negeri 	Lain-lain	30 Jun 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2141	 Pendaftaran Beasiswa Pemprov Jabar 2018 â€“ 2019 (D3, S1, S2, dan S3) 	Lain-lain	01 Mei 2018 - 31 Des 2018	00:00 - 00:00	Jawa Barat	\N	\N
2140	 Seminar nasional 	Seminar	08  - 08 Sep 2018	07:00 - 03:00	Auditorium Lt.7 gedung stikes rs anwar medika. Jl. Bypass Krian KM.33. Balongbendo - Sidoarjo 	\N	\N
2139	 Beasiswa Kuliah S1 - S2 2018 - 2019 di SHU, UK 	Lain-lain	01 Agu 2018 - 01 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2138	 Beasiswa Sarjana Sea Full Jenjang S1 di Universitas Dalam Negeri 	Lain-lain	01 Jan 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2137	 Beasiswa Bali WISE untuk Lulusan SMA/SMK/Sederajat 	Lain-lain	01 Jan 2018 - 31 Okt 2018	07:00 - 17:00	Jl. Siligita no. 22, Nusa Dua, Bali, Indonesia.	\N	\N
2136	 Beasiswa Pemerintah Swiss 2019 â€“ 2020 	Lain-lain	03 Agu 2018 - 11 Des 2018	00:00 - 00:00	Indonesia	\N	\N
2135	 Beasiswa S1 di Kanada - Humber College 	Lain-lain	20 Agu 2018 - 28 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2134	 GPFest Lintastika 2018 	Lain-lain	12  - 14 Sep 2018	09:30 - 17:00	Politeknik Negeri Jakarta	\N	\N
2133	 Accounting competition for Collage Students (ACCESS)  	Lain-lain	03  - 05 Nov 2018	12:45 - 16:00	Hotel Lor in	\N	\N
2132	 SCIENTIST 8 	Seminar	15  - 15 Sep 2018	07:00 - 17:00	Auditorium Yos Sudarso SESKOAL, Cipulir	\N	\N
2131	 P+ FEB UNPAD 2018 	Lain-lain	30  - 31 Agu 2018	07:00 - 18:00	Kampus UNPAD Jatinangor	\N	\N
2130	 UNIVERSIADE UI 	Sport	25 Sep 2018 - 05 Okt 2018	07:00 - 17:00	UNIVERSITAS INDONESIA	\N	\N
2129	 National English Exhibition and Contest 2018 	Lain-lain	20  - 23 Sep 2018	07:30 - 17:00	Politeknik Keuangan Negara STAN	\N	\N
2127	 Communication Avenue 2018 	Lain-lain	03  - 08 Sep 2018	08:00 - 17:00	Universitas Pelita Harapan dan Summarecon Mall Serpong	\N	\N
2126	 Lomba Essay dan Poster, Workshop Nasional, Musyawarah Daerah Lampung Rakerwil dan Pelantikan IMABKIN 	Lain-lain	03  - 05 Sep 2018	09:00 - 12:00	Gedung Serba Guna (GSG) UIN Raden Intan Lampung	\N	\N
2125	 Call for Essays The Transformative Power of FinTech 	Seminar	28  - 29 Sep 2018	08:00 - 15:00	Magister Akuntansi FEB Universitas Gadjah Mada	\N	\N
2124	 MAKSI UGM Accounting Competition (MACC) 	Seminar	28 Sep 2018 - 29 Agu 2018	08:00 - 15:00	Magister Akuntansi Fakultas Ekonomika dan Bisnis Universitas Gadjah Mada	\N	\N
2123	 Workshop Website Penetration and Security 	Lain-lain	23  - 23 Sep 2018	08:00 - 16:30	Coneco Coworking Space - Jl. Ratna, Ngagel, Wonokromo, Surabaya	\N	\N
2122	 BEST SOLUTION COMPETITION 	Lain-lain	15  - 15 Okt 2018	08:00 - 05:00	Fakultas Pertanian, USU Jl. Dr. A. Sofian No.3, Padang Bulan, Medan Baru, Kota Medan	\N	\N
2121	 Management Days 2018 (Innovation Scientific Competition) 	Lain-lain	20  - 20 Sep 2018	06:00 - 16:00	Ruang Koendjono, Kampus II Universitas Sanata Dharma	\N	\N
2119	 Line Tracer Design and Contest  	Lain-lain	03  - 04 Okt 2018	08:00 - 17:00	Sasana budaya Universitas Negeri Malang 	\N	\N
2118	 Peace Fest Competition 2018 	Lain-lain	14 Agu 2018 - 17 Sep 2018	00:00 - 23:59	Karya dikirim ke email wmichapterjakarta@gmail.com	\N	\N
2117	 Seminar Nasional Kebidanan More Knowledge More Ability! 	Seminar	08  - 08 Sep 2018	07:00 - 13:15	Poltekkes Kemenkes Jakarta I	\N	\N
2116	 IBS Fun Run 2018 	Sport	22  - 22 Sep 2018	16:00 - 23:00	pasar seni ancol	\N	\N
2115	 Unleash Potensials Of The Disabled 	Lain-lain	01  - 25 Agu 2018	00:00 - 23:55	Umum	\N	\N
2114	 THE GRAND LAUNCHING BINUS @BEKASI 	Seminar	30  - 30 Nov -1	08:00 - 17:00	Main Campus BINUS@Bekasi	\N	\N
2112	 Beasiswa Politeknik LPP Yogyakarta dan PTPN III untuk Masyarakat Kab. Labuhanbatu Selatan 	Lain-lain	10 Mar 2018 - 23 Agu 2018	07:00 - 17:00	Jl. LPP No. 1A, Yogyakarta 55222	\N	\N
2111	 Beasiswa Pelajar SMP dan SMU Indonesia berupa Bantuan Dana Pendidikan 	Lain-lain	10  - 28 Sep 2018	07:00 - 17:00	Jl. Gatot Subroto Kav. 59A, Jakarta Selatan 12950	\N	\N
2110	 International Microeconomics Competition  	Lain-lain	21  - 23 Sep 2018	07:00 - 17:00	Kampus Universitas Padjajaran Bandung dan Hotel Citarum Bandung	\N	\N
2109	 Beasiswa Doktor yang Didanai Penuh di bidang Teknik, Universitas Teknologi Kochi, Jepang 2019 	Lain-lain	30 Nov -1 - 14 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2108	 Beasiswa bagi Dosen & Mahasiswa untuk Mengikuti Kelas Menjadi Android Developer Expert 	Lain-lain	14 Apr 2018 - 31 Agu 2018	07:00 - 17:00	Pacific Century Place Tower Level 45 SCBD Lot 10, Jl. Jend. Sudirman No.53, RT.5/RW.3, Senayan, Kby.	\N	\N
2107	 Beasiswa Master untuk Siswa Internasional, Ã–rebro University, Swedia 	Lain-lain	01 Jan 2018 - 31 Agu 2019	00:00 - 00:00	Indonesia	\N	\N
2106	 Beasiswa Unggulan Dosen Indonesia (BUDI) - Program Doktoral di Luar Negeri 	Lain-lain	01 Jul 2018 - 21 Agu 2018	07:00 - 17:00	Jakarta	\N	\N
2105	 Beasiswa Biaya Pendidikan Penuh untuk Siswa Internasional, Universitas Barat Inggris, Inggris 	Lain-lain	01 Sep 2018 - 01 Jan 2019	00:00 - 00:00	Indonesia	\N	\N
2104	 Padjadjaran Accounting Week 2018 	Seminar	13  - 16 Nov 2018	06:00 - 18:00	Fakultas Ekonomi & Bisnis Universitas Padjadjaran	\N	\N
2103	  Beasiswa Dahuni Foundation Indonesia bagi Mahasiswa S1 	Lain-lain	02 Agu 2018 - 30 Sep 2018	07:00 - 17:00	Jl. Hang Lekir I No.8, RT.1/RW.3, Gelora, RT.1/RW.3, Gelora, Kota Jakarta Pusat	\N	\N
2102	 Beasiswa Studi Luar Angkasa, Universitas Luar Angkasa Internasional, Perancis 	Lain-lain	15 Mar 2018 - 31 Jan 2019	00:00 - 00:00	Indonesia	\N	\N
2101	 Beasiswa Bakti BCA â€“ Institut Pertanian Bogor (IPB) 	Lain-lain	01 Jan 2018 - 24 Agu 2018	00:00 - 00:00	Bogor	\N	\N
2100	 Beasiswa Musik, Musisi Institute, di Amerika Serikat 	Lain-lain	20 Mar 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2099	 Beasiswa Fulbright Sepenuhnya Didanai untuk Pelajar Indonesia, AS (AMINEF) 	Lain-lain	16 Agu 2018 - 15 Peb 2019	00:00 - 00:00	Indonesia	\N	\N
2098	 SEMINAR NASIONAL HANI (HARI ANTI NARKOTIKA INTERNASIONAL) 	Seminar	15  - 15 Sep 2018	07:00 - 13:00	Aula A3 Universitas Negeri Malang	\N	\N
2097	 Beasiswa PhD, Sepenuhnya Didanai  Nanyang Technological University singapura 	Lain-lain	16 Agu 2018 - 30 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2096	 Beasiswa Tahfidz Qurâ€™an For Leaders 2018 Di 24 PTN 	Lain-lain	15 Jul 2018 - 31 Agu 2018	07:00 - 17:00	Universitas Gajah Mada	\N	\N
2095	 Beasiswa yang Didanai Penuh, Universitas Bond, Australia 	Lain-lain	01 Agu 2018 - 28 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2094	 UIN Sunan Ampel Surabaya Buka Pendaftaran Beasiswa Tahfidh 2018 	Lain-lain	02 Jun 2018 - 31 Des 2018	00:00 - 00:00	Surabaya	\N	\N
2093	 Economics Competition 3 	Lain-lain	14  - 14 Okt 2018	07:00 - 16:00	Gedung Balai Kota Bogor	\N	\N
2092	 NATIONAL ECONOMICS CREATIVE COMPETITION (NECC) 2018 	Lain-lain	27  - 29 Sep 2018	08:00 - 17:00	Universitas Islam Negeri Alauddin Makassar	\N	\N
2091	 Diskusi Publik Dan Pelantikkan Dewan Pimpinan Cabang Periode 2018 -  2019 	Seminar	25  - 25 Agu 2018	13:30 - 21:00	Wisma Santo Albertus, Pahoman, Bandar Lampung	\N	\N
2088	 LOMBA ESAI UNTUK SMA/SEDERAJAT (PUBLIKISME 2018) 	Lain-lain	22 Jul 2018 - 30 Agu 2018	08:00 - 14:00	FAKULTAS ILMU SOSIAL DAN ILMU POLITIK FISIP UNDIP	\N	\N
2087	 MAC (Majapahit Art Competition) 	Pensi	28  - 28 Okt 2018	07:00 - 21:00	STIKes Bina Sehat PPNI Kab. Mojokerto	\N	\N
2086	 Travel Industri Student Forum 2018 	Seminar	15  - 16 Nov 2018	08:00 - 17:00	Sekolah Tinggi Pariwisata NHI Bandung	\N	\N
2085	 DIV 4th Cup & Festival 	Lain-lain	19  - 19 Agu 2018	08:01 - 18:00	Rental Susilo jakbar	\N	\N
2077	 Beasiswa di Amerika khusus Wanita Indonesia dari AAUW Program S2, S3.  	Lain-lain	11 Agu 2018 - 15 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2076	 Beasiswa S2 dan S3 di Jerman dari Heinrich Boll Foundation deadline 1 Maret 2019 	Lain-lain	23 Jul 2018 - 01 Mar 2019	00:00 - 00:00	Indonesia	\N	\N
2075	 Beasiswa Pertukaran Pelajar S1 Jurusan Komunikasi Di Thailand 	Lain-lain	02 Jul 2018 - 30 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2074	 Edukasi Pasar Modal & Beauty Class 	Seminar	30  - 30 Agu 2018	12:00 - 16:00	Ruang Penida Noor Lt. 1 FISIP 1, UPN Veteran Jatim, Surabaya, Jawa Timur 	\N	\N
2073	 SEMINAR NASIONAL SHOW YOUR LIFESTYLE BY INVESTMENT 	Seminar	12  - 12 Sep 2018	08:00 - 12:45	Gedung Graha Pena (Pena Room), Jl. Frontage Sisi Barat Ahmad Yani, Surabaya, Jawa Timur.	\N	\N
2072	 seminar nasional ' Get started with Kotlin on Android ' 	Seminar	02  - 02 Sep 2018	10:00 - 14:00	DILo Surabaya Jalan Ketintang No. 156 Ketintang Gayungan, Surabaya	\N	\N
2070	 Program PPA BCA dan PPTI BCA Langsung Kerja 2018 - 2019 	Lain-lain	01 Jan 2018 - 31 Agu 2018	00:00 - 00:00	Indonesia	\N	\N
2068	 UNPAR CAREER EXPO & SEMINAR 7 	Expo	17  - 23 Sep 2018	09:00 - 05:00	Harris Hotel & Conventions	\N	\N
2067	  Beasiswa Bidikmisi Dari Kemenristekdikti 2018 untuk S1, D3, D2 dan D1 	Lain-lain	15 Jan 2018 - 18 Sep 2018	00:00 - 00:00	Indonesia	\N	\N
2066	 Yuk Daftar Beasiswa Stimulan Kota Balikpapan Tahun 2018! 	Lain-lain	16 Agu 2018 - 14 Sep 2018	00:00 - 00:00	BalikPapan	\N	\N
2065	 Beasiswa Hafidz UNISA Yogya Masih Dibuka Hingga September 2018! 	Lain-lain	01 Mei 2018 - 01 Sep 2018	00:00 - 00:00	Yogyakarta	\N	\N
2064	 ARTEKTO - TRY OUT SBMPTN 	Lain-lain	16  - 16 Sep 2018	07:00 - 15:30	Gedung 2 Fakultas Teknik Universitas Sebelas Maret, Jl. Ir. Sutami No. 36A, Jebres, Kota Surakarta	\N	\N
2063	 LOMBA FOTOGRAFI NASIONAL 2018  	Lain-lain	14  - 28 Agu 2018	00:00 - 00:00	Hubungi CP	\N	\N
2062	 Building Entrepreneurship and Leadership Spirit in Youth for Sustainable Development 	Seminar	20  - 20 Agu 2018	08:00 - 13:00	Teater 2 Fakultas Ekonomi dan Bisnis UIN Syarif Hidayatullah Jakarta	\N	\N
2061	 INHESION 2018 NUTRITION IN DEGENERATIVE DISEASE 	Seminar	03 Nov 2018 - 30 Nov -1	07:30 - 15:05	Jogja Plaza Hotel, Yogyakarta, Indonesia	\N	\N
2060	 Beasiswa Pelatihan Perhotelan di Bali 	Lain-lain	01 Okt 2018 - 30 Apr 2019	07:00 - 17:00	bali	\N	\N
2059	  Beasiswa Penuh S2 di UK 	Lain-lain	06 Agu 2018 - 06 Nov 2018	07:00 - 19:00	Jakarta	\N	\N
2058	 Dahuni Foundation Indonesia Bagi Mahasiswa S1 	Musik	02 Agu 2018 - 30 Sep 2018	07:00 - 19:00	Jakarta	\N	\N
2057	 Kedutaan Besar Republik Indonesia di Hanoi Vietnam 	Lain-lain	01 Apr 2018 - 30 Agu 2018	08:00 - 17:00	Room 105, A5 Building, 484 Lach Tray Street, Hai Phong City, Vietnam	\N	\N
2056	 Beasiswa LPDP S2 dan S3 ke Luar Negeri. 	Lain-lain	02 Jul 2018 - 21 Sep 2018	07:00 - 17:00	Jakarta	\N	\N
2055	 TALKSHOW 'Sing What You Love, Love What You Sing'  	Seminar	14  - 16 Agu 2018	07:00 - 08:00	SMAK Frateran Surabaya	\N	\N
2054	 oilmpiade ekonomisma tingkat nasional alcofe 12 	Lain-lain	01 Agu 2018 - 30 Sep 2018	00:00 - 00:00	fakultas ekonomi dan bisnis UNS	\N	\N
2053	 International Concrete Competition 	Lain-lain	05  - 07 Nov 2018	07:00 - 15:00	Gedung V Fakultas Teknik Universitas Sebelas Maret	\N	\N
2052	 National Paper Competition 	Lain-lain	07  - 07 Nov 2018	07:00 - 12:00	Ruang Sidang Utama Gedung III FT Universitas Sebelas Maret	\N	\N
2051	 Lomba Rancang Bangun Jembatan 	Lain-lain	04  - 04 Nov 2018	07:00 - 15:00	Student Center Universitas Sebelas Maret	\N	\N
2050	 Lomba Rancang Gambar Bangunan 	Lain-lain	03  - 03 Nov 2018	07:00 - 12:00	Gedung IV Fakultas Teknik Universitas Sebelas Maret	\N	\N
2049	 Anforcom 2018 	Lain-lain	29 Jul 2018 - 20 Sep 2018	06:00 - 00:00	Universitas Diponegoro	\N	\N
2048	 BEASISWA KULIAH S1 KE OXFORD & CAMBRIDGE 	Lain-lain	01 Agu 2018 - 01 Jan 2019	00:00 - 00:00	Indonesia	\N	\N
2047	 Beasiswa Chevening 2019-2020 Kuliah S2 di Inggris FULL 	Lain-lain	01 Jan 2018 - 06 Nov 2018	00:00 - 00:00	Indonesia	\N	\N
2046	 Beasiswa Pramugari Gratis dan Ikatan Dinas oleh PT Citilink 	Lain-lain	01  - 31 Des 2018	00:00 - 00:00	Surabaya	\N	\N
2042	 SEMINAR NASIONAL BADAN EKSEKUTIF MAHASISWA FAKULTAS EKONOMI DAN BISNIS UNIVERSITAS UDAYANA 2018 	Seminar	02  - 02 Sep 2018	07:00 - 15:00	Auditorium Widya Sabha Universitas Udayana, Jimbaran, Bali.	\N	\N
2040	 Call for Essay Competition 	Lain-lain	13 Agu 2018 - 30 Sep 2018	00:00 - 23:55	Fakultas Ekonomi Universitas Negeri Surabaya	\N	\N
2039	 Bursa Kerja Medan 	Bursa Kerja	15  - 16 Agu 2018	10:00 - 16:00	Pendoppo USU, Jl. Dr.Mansyur no. 9, Padang Bulan - Medan	\N	\N
2037	 Startup digital 	Seminar	13  - 13 Sep 2018	08:00 - 13:00	Ruang d.62 kampus kendeng unisbank semarang	\N	\N
2036	 TRUNOJOYO ACCOUNTING CHALLENGE 2018 	Lain-lain	28 Okt 2018 - 10 Nov 2018	07:00 - 11:30	Rayon masing masing sementara untuk semifinal dilaksanakan di Universitas Trunojoyo Madura	\N	\N
2035	 EDUCREATION : LOMBA ESAI NASIONAL 2018 	Lain-lain	01  - 26 Agu 2018	09:00 - 10:00	Universitas Negeri Yogyakarta	\N	\N
2034	 Comptech Hmei 	Lain-lain	01  - 02 Sep 2018	07:00 - 18:00	Institut Teknologi Sumatera	\N	\N
2033	 JESSUP WORKSHOP ILSA UNHAS 2018 	Seminar	25  - 25 Agu 2018	07:30 - 17:00	GEDUNG IPTEKS, UNIVERSITAS HASANUDDIN	\N	\N
2032	 GLOBAL VILLAGE 	Expo	12  - 12 Agu 2018	08:00 - 16:00	SMAN 3 Semarang	\N	\N
2031	 English Expo 2018 	Expo	23  - 30 Sep 2018	08:00 - 17:00	Universitas Halu Oleo	\N	\N
2030	 LKTI NASIONAL ALCOFE XII 	Lain-lain	16 Nov 2018 - 18 Agu 2018	08:00 - 20:00	Universitas Sebelas Maret Surakarta	\N	\N
2029	 SENJA 2018 	Lain-lain	13  - 15 Sep 2018	08:00 - 17:00	FE Ruang Aboesono UPN Veteran Jawa Timur dan Royal Paza Surabaya	\N	\N
2028	 MECHATRONICS ROBOTIC COMPETITION (MRC) IV 2018 	Lain-lain	03  - 04 Nov 2018	07:00 - 18:00	GEDUNG CAKRA- UNIVERSITAS TRUNOJOYO MADURA	\N	\N
2027	 SIPA GOES TO CAMPUS 	Musik	05 Sep 2018 - 31 Mar 2020	00:00 - 00:00	Auditorium Universitas Sebelas Maret	\N	\N
2026	 CHEMICAL ENGINEERING PAPER COMPETITION 2018 	Lain-lain	05 Agu 2018 - 30 Sep 2018	00:00 - 00:00	universitas negeri semarang	\N	\N
2025	 Learning Exhibition and Competition 	Seminar	18  - 11 Okt 2018	09:00 - 18:00	Anggrek Campus BINUS University, Jl. Kebon Jeruk Raya No. 27. Kebon Jeruk Jakarta Barat 	\N	\N
2024	 ENGLISH FESTIVAL IV 	Lain-lain	14  - 21 Okt 2018	07:00 - 14:00	Sekolah Vokasi IPB	\N	\N
2023	 Talkshow Nasional 	Seminar	29  - 29 Sep 2018	07:30 - 13:00	Lt.9 sasana kridangga kampus unisbank kendeng	\N	\N
2022	 SEMINAR KARIR 2018 	Seminar	15  - 15 Agu 2018	08:30 - 12:00	Aula Lt. 4 Kampus STIE EKUITAS	\N	\N
2021	 Kuliah Intensif Ekonomi Islam Batch 21 	Lain-lain	06 Nov 2018 - 01 Des 2018	09:00 - 03:00	Fakultas Ekonomi dan Bisnis, Universitas Indonesia	\N	\N
2020	 Sparkling Ecora 2018 	Pensi	30  - 30 Sep 2018	09:00 - 12:00	Aula Skodam V Brawijaya	\N	\N
2019	 Festival Film Sosiologi 	Seminar	11 Agu 2018 - 24 Nov 2018	10:00 - 17:00	Universitas Negeri Jakarta	\N	\N
2018	 Seminar Nasional 2018 	Seminar	21  - 21 Sep 2018	07:00 - 15:00	Graha Sawunggaling (Jalan Jimerto 10, Ketabang, Genteng, Surabaya)	\N	\N
2017	 Visit Dentistry 2018 	Seminar	15  - 15 Sep 2018	08:00 - 15:00	Universitas Trisakti Kampus B , Grogol petamburan, Jakarta Barat 	\N	\N
2016	 O Sapientia 	Musik	25  - 25 Agu 2018	16:00 - 18:00	Usmar Ismail Hall (Jln. H.R. Rasuna Said Blok C No.22, Kuningan)	\N	\N
2015	 Fisip Berbakti 	Lain-lain	10  - 12 Agu 2018	07:00 - 15:00	Desa Karang Tengah Bogor	\N	\N
2014	 Sharing For Caring 	Lain-lain	11  - 11 Agu 2018	07:00 - 16:00	Panti asuhan putra utama 1 klender, jakarta timur	\N	\N
2013	 Talkshow Inspiratif Pijar Sukses Menebar Makna 'Dahulu Kala' Langitkan Motivasi Sukses Mengantri 	Seminar	04  - 04 Sep 2018	08:00 - 13:00	Auditorium Universitas Islam Negri Sunan Ampel Surabaya	\N	\N
2012	 Seminar Nasional Kimia 	Seminar	22  - 22 Sep 2018	12:00 - 03:00	UIN SUNAN KALIJAGA	\N	\N
2011	 Collutrium Competition ( lomba essay tiungkat nasional) 	Lain-lain	10 Jul 2018 - 13 Agu 2018	00:01 - 23:59	Aula lt 5 gd. C  FMIPA UNS	\N	\N
2010	 Collutrium Competition ( Losartan manual) 	Lain-lain	10 Jul 2018 - 09 Sep 2018	07:00 - 23:00	Aula lt 5 gd. C  FMIPA UNS	\N	\N
2009	 Collutrium Competition ( Losartan Digital) 	Lain-lain	10 Jul 2018 - 13 Agu 2018	00:00 - 23:58	Aula lt 5 gd. C  FMIPA UNS	\N	\N
2008	 AGRIDATION 2018 	Lain-lain	18 Jul 2018 - 23 Sep 2018	07:00 - 16:00	Institut Pertanian Bogor	\N	\N
2007	 Herbal Cosmetic Competition 	Expo	01 Jul 2018 - 06 Okt 2018	07:00 - 13:55	Universitas Sanata Dharma	\N	\N
2006	 (OPEN RECRUITMENT) Dana Cita Campus Ambassador 2.0 	Lain-lain	07  - 27 Agu 2018	00:00 - 12:00	Indonesia	\N	\N
2005	 BIOLOGY LEARNING FESTIVAL 	Expo	11  - 16 Nov 2018	07:00 - 16:00	UNIVERSITAS SILIWANGI TASIKMALAYA	\N	\N
2004	 BIOLOGY LEARNING FESTIVAL 	Expo	11  - 16 Nov 2018	07:00 - 16:00	UNIVERSITAS SILIWANGI TASIKMALAYA	\N	\N
2003	 OMN (Olimpiade Manajemen Nasional) 	Lain-lain	12  - 14 Okt 2018	07:00 - 16:00	Gedung FE Universitas Negeri Malang	\N	\N
2002	 International Student Conference on Asia Africa Studies (ISCAAS) 2018 	Lain-lain	03  - 04 Nov 2018	13:00 - 20:00	Hotel Prama Grand Preanger	\N	\N
2001	 BIOSPHERE #1 	Lain-lain	18 Agu 2018 - 20 Okt 2018	08:00 - 00:00	Fakultas Biologi UGM	\N	\N
2000	 Agriventure 2018 	Seminar	22  - 23 Sep 2018	09:00 - 15:00	Jl. Jalur Sutera Bar. No.Alam Sutera, Panunggangan Tim., Pinang, Kota Tangerang, Banten 15143	\N	\N
1999	 Full Strategi Workshop  Facebook Marketing + Chatbot 	Seminar	29  - 29 Agu 2018	13:00 - 17:00	Jl. Tanjung Duren Utara III E No.334 A, Tanjung Duren Utara, Grogol - Jakarta Barat, DKI Jakarta (11	\N	\N
1998	 Administration Festival 2018 	Lain-lain	03  - 04 Nov 2018	08:00 - 17:00	Gd. M Fakultas Ilmu Administrasi, Universitas Indonesia	\N	\N
1997	 Event Of Agroindustrial Technology (ENOTECH) 2018 	Lain-lain	24 Jul 2018 - 19 Agu 2018	00:00 - 00:00	UNIVERSITAS JEMBER	\N	\N
1996	 Economic Solutions 2018 	Lain-lain	03  - 06 Okt 2018	07:00 - 17:20	Fakultas Ekonomi dan Bisnis ULM Banjarmasin	\N	\N
1995	 LKTI Nasional LOGIKA UI 2019 	Lain-lain	05  - 27 Agu 2018	00:00 - 00:00	FMIPA UI	\N	\N
1994	 MIC dan MTC LOGIKA UI 2019 	Lain-lain	05 Agu 2018 - 16 Sep 2019	00:00 - 00:00	FMIPA UI	\N	\N
1989	 Orientasi Diponegoro Muda 	Lain-lain	12  - 12 Agu 2018	06:00 - 11:00	Stadion Universitas Diponegoro Semarang	\N	\N
1988	 Lomba Cerpen dan Fotografi Pekan Raya AKK 6 FKM UI 	Lain-lain	01  - 31 Agu 2018	00:00 - 00:00	Universitas Indonesia	\N	\N
1987	 GEBYAR SEKARTADJI 2018 	Lain-lain	17 Sep 2018 - 11 Nov 2018	00:00 - 00:00	Parkir Gedung i7 Fakultas Ilmu Sosial dan Hukum Universitas Negeri Surabaya	\N	\N
1986	 Sebelas Maret Statistics Writing Competition 2018 	Lain-lain	19  - 20 Okt 2018	08:00 - 21:00	Universitas Sebelas Maret	\N	\N
1985	 Sebelas Maret Statistics Infographic Competition 2018 	Lain-lain	19  - 20 Okt 2018	08:00 - 21:00	Universitas Sebelas Maret	\N	\N
1984	 Sebelas Maret Statistics Olympiad 2018 	Lain-lain	19  - 20 Okt 2018	08:00 - 21:00	Universitas Sebelas Maret	\N	\N
1983	 Pameran Pendidikan Tinggi Taiwan 2018 	Lain-lain	10  - 13 Agu 2018	09:00 - 18:00	JABABEKA-JAKARTA-MEDAN	\N	\N
1982	 ðŸ“ NUCLEON PAPER COMPETITIONðŸ“  	Lain-lain	08 Agu 2018 - 28 Okt 2018	00:00 - 00:00	Universitas negeri malang	\N	\N
1981	 Mathside Futsal Competition 	Sport	25  - 26 Agu 2018	07:00 - 18:00	GOR Budi Langgeng Boyolali	\N	\N
1980	 UFONITY PHOTO & VIDEO COMPETITION 2018 	Lain-lain	01 Agu 2018 - 09 Sep 2018	00:00 - 23:55	Universitas Udayana	\N	\N
1979	 Padjadjaran Debate Championship 2018 	Lain-lain	29 Sep 2018 - 01 Okt 2018	10:00 - 05:00	Fakultas Ekonomi dan Bisnis, Universitas Padjadjaran	\N	\N
1978	 Festival Elektronika Instrumentasi 	Seminar	25  - 25 Agu 2018	07:30 - 01:05	Auditorium FMIPA UGM	\N	\N
1977	 Kompetisi Akuntansi Airlangga 2018 	Lain-lain	22  - 23 Sep 2018	07:00 - 17:00	Graha Sawunggaling (Jalan Jimerto 10, Ketabang, Genteng, Surabaya)	\N	\N
1976	 TASA Global Village 	Pensi	11  - 11 Agu 2018	08:30 - 16:00	Kolam Renang TASA Jl. Salak Pd. Benda, Pamulang.	\N	\N
1975	 IPB ARCHERY OPEN 2018 	Sport	07  - 11 Sep 2018	18:57 - 00:00	IPB DRAMAGA 	\N	\N
1974	 UNAC  2018 	Lain-lain	05  - 07 Sep 2018	07:00 - 17:00	Kampus 1 UKRIDA Auditorium Ged. E Lt 7, Jl. Tanjung Barat Raya No.4  Jakarta Barat 11470	\N	\N
1973	 Lomba Cerdas Cermat  	Seminar	16 Jul 2018 - 13 Okt 2018	07:00 - 16:00	Fakultas Kedokteran Universitas Sebelas Maret	\N	\N
1972	 Kaidah (Kajian Islam Nan Indah) 	Seminar	25  - 25 Agu 2018	07:00 - 12:00	Auditorium O5 lantai 3, Fakultas Ilmu Pendidikan, Universitas Negeri Surabaya 	\N	\N
1971	 International Development Student Conference 2018  	Seminar	29 Okt 2018 - 01 Nov 2018	08:00 - 14:00	Universitas Airlangga	\N	\N
1969	 Pharmaceutical Seminar 86 	Lain-lain	04  - 05 Agu 2018	07:30 - 17:00	Gedung Rumpun Ilmu Kesehatan Universitas Indonesia	\N	\N
1968	 Pharmaceutical Seminar 86 	Lain-lain	04  - 05 Agu 2018	07:30 - 17:00	Gedung Rumpun Ilmu Kesehatan Universitas Indonesia	\N	\N
1967	 Pharmaceutical Seminar 86 	Seminar	11  - 11 Agu 2018	07:30 - 17:00	Gedung Auditorium Vokasi Universitas Indonesia	\N	\N
1966	 LEN Mahasiswa 2018 (Lomba Essai Nasional) 	Lain-lain	13  - 13 Okt 2018	07:00 - 16:00	Gedung O5 Fakultas Ilmu Pendidikan, Unesa Kampus Lidah Wetan	\N	\N
1964	 10th Annual Geography Days 	Seminar	10  - 13 Okt 2018	08:00 - 17:00	Universitas Indonesia	\N	\N
1963	 Gracheta 2018 	Pensi	04 Agu 2018 - 30 Nov -1	15:30 - 22:00	Epicentrum elite club, kuningan	\N	\N
1962	 Bulan Bahasa dan Sastra 2018 	Lain-lain	24 Sep 2018 - 29 Okt 2018	00:00 - 00:00	Universitas Negeri Malang	\N	\N
1961	 BERAKSI 2018 	Lain-lain	11  - 18 Agu 2018	08:00 - 17:00	Kampung Mulyasari, kecamatan Sukamakmur, kabupaten Bogor, Jawa barat	\N	\N
1960	 ðŸŽ‰RADIO ANNOUNCING COMPETITIONðŸŽ‰ 	Lain-lain	30 Nov -1 - 22 Sep 2018	00:00 - 00:00	UPN Veteran Jakarta	\N	\N
1958	 DIPONEGORO LAW FAIR 2018 	Lain-lain	26  - 28 Okt 2018	07:00 - 12:00	Fakultas Hukum Universitas Diponegoro Semarang	\N	\N
1957	 Bidikmisi Essay Competition 	Lain-lain	28  - 30 Sep 2018	13:00 - 15:30	Universitas Sebelas Maret	\N	\N
1951	 ARKAMAYA 2018: Mengedukasi Masyarakat Mengenai Kesehatan Mental Melalui Pagelaran Tari  	Lain-lain	02  - 02 Agu 2018	19:00 - 21:00	Graha Bakti Budaya, Taman Ismail Marzuki	\N	\N
1950	 Nanny McPhee The Musical 	Musik	08  - 09 Agu 2018	19:00 - 21:00	Prof. Dr. Djajusman Auditorium & Performance Hall, LSPR	\N	\N
1949	 IPB National Cup 	Sport	17  - 23 Sep 2018	08:00 - 20:00	Institut Pertanian Bogor	\N	\N
1948	 ESFEST2018 	Lain-lain	24  - 26 Agu 2018	09:00 - 22:00	Universitas Esa Unggul Kampus II Citra Raya Tangerang	\N	\N
1947	 ORTHOFEST 2018 	Musik	20  - 20 Okt 2018	04:00 - 23:00	Halaman Lokananta	\N	\N
1946	 STOCK ZONE 	Lain-lain	26  - 27 Sep 2018	07:00 - 17:00	STIE Indonesia Banking School	\N	\N
1945	 EXPLOSION 2018 	Seminar	01  - 01 Sep 2018	08:00 - 17:00	Gedung Prof. Soedarto, Undip, Tembalang	\N	\N
1944	 LEON (Lomba Esai Nasional) 2018 	Lain-lain	19  - 21 Okt 2018	00:00 - 00:00	FISIP Universitas Brawijaya Malang	\N	\N
1943	 Soil Festival 	Lain-lain	17 Sep 2018 - 14 Okt 2018	08:15 - 14:30	Ruang Sidang Departemen Ilmu Tanah dan Sumberdaya Lahan, Kampus Institut Pertanian Bogor	\N	\N
1941	 Soil Festival 	Lain-lain	23 Agu 2018 - 14 Okt 2018	08:00 - 14:50	Ruang Sidang Departemen Ilmu Tanah dan Sumberdaya Lahan, Kampus Institut Pertanian Bogor	\N	\N
1940	 SCIENCE SAURUS 2018 	Lain-lain	29  - 30 Sep 2018	08:00 - 22:00	MIPA CENTER  Universitas Brawijaya	\N	\N
1934	 SCIENCE SAURUS 2018 	Lain-lain	29  - 30 Sep 2018	08:00 - 22:00	MIPA CENTER  Universitas Brawijaya	\N	\N
1933	 PHYSPHORIA 2018 Together in Harmony 	Musik	06  - 06 Okt 2018	19:00 - 22:00	PG De Tjoelomadoe, Colomadu, Karanganyar	\N	\N
1932	 Kejuaraan nasional karate open tournament unsada cup v 	Sport	10  - 12 Agu 2018	08:00 - 20:00	Univeristas darma persada	\N	\N
1931	 Sertifikasi Profesi Public Relations (Humas) Di UMN 	Lain-lain	06  - 13 Okt 2018	08:00 - 17:00	Universitas Multimedia Nusantara	\N	\N
1930	 Bakti Negeri IYOIN X PPI Wuhan,Tiongkok 	Lain-lain	04  - 04 Agu 2018	13:00 - 15:30	Digital Innovation Lounge, Pancoran Mas, DEPOK	\N	\N
1929	 PREKUEL Pameran Studio Dasar Mahasiswa ITENAS Jurusan Desain Produk'17 	Expo	04  - 07 Sep 2018	10:00 - 18:00	Student Centre (S.C) Institut Teknologi Nasional (ITENAS) Bandung	\N	\N
1928	 IPB NATIONAL ESSAY COMPETITION 	Lain-lain	06 Jun 2018 - 31 Jul 2018	10:00 - 23:59	Sekolah vokasi ipb	\N	\N
1927	 Henryâ€™s Law Theatre 	Lain-lain	29  - 29 Jul 2018	18:30 - 19:30	Prof . DR Djajusman auditorium & hall - LSPR JAKARTA	\N	\N
1926	 Perlombaan Debat Nasional 	Lain-lain	05  - 07 Sep 2018	07:00 - 17:00	Gedung Dekanat lt.3 FIP UNNES	\N	\N
1925	 TBIG CreatiON 	Lain-lain	25 Jun 2018 - 08 Nov 2018	00:00 - 00:00	PT. Tower Bersama (online)	\N	\N
1924	 Chinese Paradise 6 	Lain-lain	27  - 27 Okt 2018	07:00 - 21:00	Gedung FIB A UNIVERSITAS BRAWIJAYA MALANG	\N	\N
1923	 8th Sharia Economics Triumph Activities (8th SETiA)  	Lain-lain	23  - 25 Nov 2018	07:30 - 16:30	Ruang Sidang 2 FEB UNS	\N	\N
1921	 Jambore Bakti Sosial FKG UI 2018 	Lain-lain	03  - 05 Agu 2018	08:00 - 16:00	Desa Setu, Kecamatan Jasinga	\N	\N
1920	 LKTIN FIP On October (FIPER) 	Lain-lain	18  - 19 Okt 2018	14:00 - 20:00	Fakultas Ilmu Pendidikan UNESA	\N	\N
1919	 Seminar Kesehatan Nasional 	Seminar	28  - 28 Jul 2018	07:00 - 15:00	Gedung Auditorium UNPAD Lantai 6 Jl. Eyckman No. 38	\N	\N
1918	 Marketpreneur #5 	Seminar	18  - 20 Okt 2018	00:00 - 06:00	Universitas Trilogi	\N	\N
1917	 International Student Conference on Asia Africa Studies (ISCAAS) 2018 	Lain-lain	13 Jun 2018 - 13 Agu 2018	00:00 - 00:00	Hotel Prama Grand Preanger	\N	\N
1915	 OMN (Olimpiade Manajemen Nasional) 	Lain-lain	12  - 14 Okt 2018	08:00 - 16:00	Fakultas Ekonomi Universitas Negeri Malang	\N	\N
1907	 Seminar Nasional Matematika XII 2018 | Jurusan Matematika FMIPA Universitas Negeri Semarang 	Seminar	20  - 20 Okt 2018	07:30 - 16:00	Aula Dekanat FMIPA Universitas Negeri Semarang, Gedung D12 Lantai 3	\N	\N
1906	 UMN Membuka Kelas Bahasa Jepang Batch II 2018 	Lain-lain	27 Jul 2018 - 27 Okt 2018	17:15 - 18:45	Universitas Multimedia Nusantara	\N	\N
1905	 ECA Batch II 	Lain-lain	14  - 16 Sep 2018	12:00 - 15:30	Fakultas Peternakan Unsoed	\N	\N
1904	 Ratu Sekartaji Theatre 	Lain-lain	02  - 02 Agu 2018	18:30 - 19:30	Prof. Dr. Djajusman Auditorium & Performance Hall LSPR Campus B Jakarta	\N	\N
1903	 Olimpiade Ekonomi Nasional 	Lain-lain	16 Jul 2018 - 04 Nov 2018	00:00 - 21:00	Gedung Fakultas Ekonomi Universitas Negeri Malang	\N	\N
1902	 Orientasi Diponegoro Muda Sekolah Vokasi Universitas Diponegoro 	Lain-lain	07  - 11 Agu 2018	06:00 - 12:15	Parkiran atas Sekolah Vokasi Universitas Diponegoro	\N	\N
1901	 NEO - NATIONAL ENGLISH OLYMPIAD 2018 	Lain-lain	07  - 07 Okt 2018	07:00 - 16:00	UNS	\N	\N
1900	 Majors Solidarity Games 2018 	Sport	03  - 16 Sep 2018	16:00 - 22:00	Gor Futsal Internasional Unesa	\N	\N
1899	 Jakarta Model United Nations 2018 	Lain-lain	09  - 12 Agu 2018	12:00 - 19:00	Universitas Pertamina	\N	\N
1898	 CHESPECTION (Chemical Engineering Scientific Paper Competition) 	Lain-lain	12  - 13 Okt 2018	09:00 - 17:00	Universitas Muhammadiyah Surakarta	\N	\N
1897	 International Relations Championship (IRON) 2018 	Lain-lain	14  - 18 Sep 2018	08:00 - 17:00	FISIP UIN Syarif Hidayatullah Jakarta	\N	\N
1896	 One Day Design Training 	Lain-lain	27  - 27 Jul 2018	08:00 - 16:00	Universitas Esa Unggul, Jakarta Barat	\N	\N
1895	 NATIONAL BUSINESS CASE COMPETITION 	Lain-lain	20  - 21 Okt 2018	08:00 - 22:00	Universitas Airlangga 	\N	\N
1894	 National Economic and Management Olympiad (NEMO) 	Seminar	28 Sep 2018 - 30 Jul 2018	08:00 - 18:00	Institut Pertanian Bogor	\N	\N
1893	 Youth Adventure Day 	Lain-lain	05  - 07 Okt 2018	09:00 - 12:00	Mangunan, Yogyakarta	\N	\N
1891	 Semarang Hallyu Festifal 2018 	Lain-lain	25  - 25 Agu 2018	11:00 - 22:00	Gedung Prof. Soedarto Undip Semarang	\N	\N
1889	 Seminar Nasional Kefarmasian Islam 	Seminar	09  - 09 Agu 2018	07:00 - 15:00	Aula utama kampus UNISBA (Gedung Hj. Kartimikridoharsojo)  	\N	\N
1888	 Sub Start Up Parade 	Lain-lain	04 Agu 2018 - 01 Sep 2018	10:00 - 10:00	Satu Atap Co-work & Food St.	\N	\N
1887	 Sub Start Up Parade 	Lain-lain	04 Agu 2018 - 01 Sep 2018	10:00 - 10:00	Satu Atap Co-work & Food St.	\N	\N
1886	 Sub Start Up Parade 	Lain-lain	04 Agu 2018 - 01 Sep 2018	10:00 - 10:00	Satu Atap Co-work & Food St	\N	\N
1885	 Seminar Public Relations Digital Zaman Now 	Seminar	28  - 28 Jul 2018	13:00 - 16:00	Qubicle Center, Senopati 79 Jakarta Selatan	\N	\N
1884	 Information Technology Creative Competition (ITCC) 2018 	Lain-lain	01  - 02 Nov 2018	08:00 - 16:00	Kampus Teknologi Informasi, Fakultas Teknik, Universitas Udayana, Bukit Jimbaran - Bali	\N	\N
1883	 GALAKSI (Gelaran Aksi Abid dan Silaturahmi Keluarga FPPI) 2018 	Lain-lain	28  - 29 Jul 2018	08:00 - 16:00	FKIP Universitas Lampung	\N	\N
1882	 Pesta Karya Mahasiswa 	Lain-lain	19  - 21 Okt 2018	08:00 - 16:00	Universitas Bengkulu	\N	\N
1881	 POSTER TGPE 4 (The Great Population Event) 	Lain-lain	21  - 21 Okt 2018	07:00 - 17:00	Gedung I6 Fakultas Ilmu Sosial dan Hukum Universitas Negeri Surabaya	\N	\N
1880	 PIBT XXIV 	Lain-lain	22 Sep 2018 - 04 Nov 2018	07:00 - 17:00	SEMARANG	\N	\N
1878	 JEMBER LINE TRACER VIII (JLT VIII) Infinity Race 	Lain-lain	03  - 04 Nov 2018	07:00 - 21:00	Gedung Soetardjo Universitas Jember, Jawa Timur	\N	\N
1877	 UI CAREER & SCHOLARSHIP EXPO XXVI 2018 In Collaboration With NAMA Foundation 	Expo	20  - 22 Sep 2018	09:00 - 17:00	Balairung â€“ UI, Kampus UI Depok	\N	\N
1876	 ACTIVE(Accounting Society In Versality) 2018 	Lain-lain	03  - 05 Nov 2018	08:00 - 17:00	HOTEL LORIN SURAKARTA	\N	\N
1875	 Lomba Karya Tulis Ilmiah Nasional N-compASE  	Lain-lain	11 Jul 2018 - 25 Nov 2018	07:00 - 15:00	FKIP Universitas Jember	\N	\N
1874	 pameran seni rupa 	Pensi	13  - 15 Agu 2018	10:00 - 16:00	Galeri 2 B9 Fakultas Bahasa dan Seni Universitas Negeri Semarang	\N	\N
1872	 DISTAFEST #4 2018  	Pensi	01  - 01 Sep 2018	16:00 - 22:00	IAIN SURAKARTA	\N	\N
1871	 Gelar Karya Mahasiswa Arsitektur ke-13 (GKMA) 	Expo	26  - 29 Jul 2018	10:00 - 21:00	Mall ciputra seraya pekanbaru	\N	\N
1867	 GEBYAR MAHASISWA PENDIDIKAN EKSAKTA 	Expo	31 Jul 2018 - 03 Agu 2018	08:00 - 16:30	FKIP Universitas Lampung	\N	\N
1865	 Seminar Nasional Kimia 2018 	Seminar	09  - 10 Nov 2018	07:30 - 16:30	Gedung Pascasarjana FMIPA UGM	\N	\N
1864	 LKTIN SPEAR MSC 2018 	Lain-lain	12 Mei 2018 - 04 Nov 2018	07:00 - 14:00	Aula Gedung Rektorat Lantai 3 Universitas Jember	\N	\N
1863	 SSC CUP  VIII 2018 	Sport	01  - 02 Sep 2018	08:00 - 17:00	CENTRO FUTSAL STADIUM SALATIGA	\N	\N
1862	 WORKSHOP DAY 	Seminar	01  - 01 Agu 2018	13:00 - 16:00	GS FAME Institute of Business Jl. Pulo Mas Timur 3A Blok A No. 2 Kayu Putih, Jakarta Timur	\N	\N
1861	 ESFEST (Esa Unggul Festival) 	Lain-lain	24  - 26 Agu 2018	09:00 - 22:00	Kampus Universitas Esa Unggul Citra Raya	\N	\N
1860	 National Data Science and Data Analytics Lustrum DTETI XI 	Lain-lain	29  - 29 Sep 2018	07:00 - 17:00	Fakultas Teknik Universitas Gadjah Mada	\N	\N
1859	 Pelatihan Public Speaking & Public Relation  	Lain-lain	28  - 28 Jul 2018	09:30 - 02:00	Unisbank Kendeng Ruang D6.1 Lt.6. Jl. Kendeng V Bendan Ngisor Sampangan Semarang	\N	\N
1858	 Information System Case Competition 	Lain-lain	03  - 05 Okt 2018	07:00 - 18:00	fX Sudirman	\N	\N
1857	 Makna Karya 	Seminar	25  - 25 Jul 2018	08:00 - 06:00	Universitas Negeri Jakarta	\N	\N
1856	 Millennial Generation Makeover 	Seminar	28  - 28 Jul 2018	13:00 - 20:00	Blu plaza  bekasi mall 	\N	\N
1854	 Olimpiade Kimia 	Lain-lain	15  - 20 Sep 2018	00:00 - 00:00	UIN SUNAN KALIJAGA	\N	\N
1853	 Kerja Sosial FKG UI 2018 	Lain-lain	21  - 28 Jul 2018	07:00 - 20:00	 Desa Nangalili & Desa Kempo di Kab. Manggarai Barat,  Desa Ketang & Desa Nao di Kab. Manggarai	\N	\N
1852	 Brawijaya Movie Exhibition 	Lain-lain	15 Jul 2018 - 20 Agu 2018	00:00 - 23:55	Universitas Brawijaya	\N	\N
1851	 BIOLOGY EDUCATION EXPO 4 	Expo	23  - 25 Sep 2018	08:00 - 16:00	Universitas Islam Negeri Syarif Hidayatullah Jakarta 	\N	\N
1849	 Physics Expo 2018 	Lain-lain	15  - 16 Sep 2018	07:00 - 16:00	IPB Dramaga	\N	\N
1847	 ALPRO 2018 	Lain-lain	13 Jul 2018 - 30 Okt 2018	13:00 - 13:00	Universitas Airlangga	\N	\N
1846	 Dana Cita Inspiring Forum: Exclusive Sharing Session with H.E. Ms. Judit Pach 	Lain-lain	25  - 25 Jul 2018	14:30 - 16:00	Menteng	\N	\N
1845	 PUMUN SOCIAL PROJECT 2018 	Lain-lain	12  - 12 Jul 2018	07:00 - 17:00	Pulau Bitung, Muara Gombong District, Bekasi regency	\N	\N
1844	 Olimpiade Pendidikan Agama Islam (OLPAI XXIV) tingkat SMP/MTs dan SMA/MA se-Jatim 	Lain-lain	16 Jul 2018 - 16 Okt 2018	01:30 - 21:00	UIN Sunan Ampel Surabaya	\N	\N
1840	 Lomba Karya Tulis Ilmiah Nasional Chemistry In Festival (Chem1st) 2018 	Lain-lain	11  - 14 Okt 2018	20:00 - 12:00	Fakultas MIPA Universitas Mataram, Lombok	\N	\N
1839	 INSTINCT II 	Lain-lain	19  - 21 Okt 2018	08:00 - 22:00	fakultas ekonomi dan bisnis universitas riau	\N	\N
1838	 RADIOACTIVE 2018 	Lain-lain	07  - 29 Sep 2018	00:00 - 00:00	Universitas Multimedia Nusantara	\N	\N
1837	 Seminar Nasional Pendekatan Pencegahan Gangguan Penglihatan Akibat Kelainan Refraksi 	Seminar	14  - 14 Okt 2018	07:00 - 15:00	Aula Graha Husada STIKes Bakti Tunas Husada	\N	\N
1836	 Call For Paper Seminar Nasional K3 	Seminar	24  - 24 Nov 2018	07:00 - 19:00	Hotel Solo Paragon Surakarta	\N	\N
1835	 LOMBA TARI KREASI TINGKAT SD/MI SE-JATIM 2018 	Lain-lain	04  - 04 Agu 2018	07:00 - 18:00	Auditorium 05 FIP UNESA Lidah Wetan	\N	\N
1833	 Seminar Nasional & Call For Paper 	Seminar	30 Sep 2018 - 01 Okt 2018	08:00 - 12:00	Aula A3 Universitas Negeri Malang	\N	\N
1830	 Seminar Nasional Kewirausahaan 2018 	Seminar	14  - 14 Jul 2018	07:30 - 16:30	Aula Utama Universitas Islam Bandung	\N	\N
1829	 Pharmacovent Uhamka  	Lain-lain	18  - 19 Jul 2018	08:00 - 06:00	Fakultas farmasi dan sains Uhamka 	\N	\N
1828	 ECOFEST Vol. 3 	Musik	29  - 29 Jul 2018	07:00 - 22:00	Lapangan Utama Universitas Siliwangi Tasikmalaya	\N	\N
1827	 Pekan Jepang ITI 	Musik	15  - 15 Jul 2018	08:00 - 18:00	Institut Teknologi Indonesia Serpong	\N	\N
1816	 JAP FUTSAL CUP 	Sport	31 Jul 2018 - 04 Agu 2018	00:00 - 00:00	 Gor Futsal Internasional Universitas Negeri Surabaya (Lidah Wetan)	\N	\N
1815	 Gebyar Seni Maha Kreasi 2018 	Pensi	15  - 15 Jul 2018	13:00 - 22:30	Gedung Kesenian Miss TjihTjih Jakarta Pusat	\N	\N
1813	 I Dare Going To Be An Influencer (#IDGF2018) 	Seminar	14  - 14 Jul 2018	09:00 - 13:00	Aula Rektorat, Universitas Mercu Buana Meruya	\N	\N
1812	 Youth Debate Competition IV 	Lain-lain	29  - 22 Sep 2018	07:00 - 17:00	Gedung I6  Fakultas FISH, Universitas Negeri Surabaya 	\N	\N
1811	 Technology Euphoria 2018 	Seminar	13  - 13 Okt 2018	08:00 - 03:05	Grand Atayasa Palembang	\N	\N
1810	 Batik In Campus 	Lain-lain	14 Jul 2018 - 30 Agu 2018	10:00 - 00:00	Semarang, Undip	\N	\N
1809	 Pesta Sains Nasional 	Lain-lain	24  - 25 Nov 2018	08:00 - 18:00	Institut Pertanian Bogor	\N	\N
1808	 UNKRIS OPEN  2018 	Sport	11  - 12 Agu 2018	07:30 - 17:00	Gor PrimaJaya 	\N	\N
1806	 Anniversary UKM Musik Unitomo #5th Kreasi Tanpa Batas 	Musik	12  - 12 Jul 2018	15:00 - 22:30	Universitas Dr. Soetomo	\N	\N
1805	 WORKSHOP PROGRAMING WITH CAKEPHP  	Lain-lain	15  - 15 Jul 2018	08:00 - 16:30	AULA SABA KARYA KAMPUS STIE-STMIK INSAN PEMBANGUNAN 	\N	\N
1804	 SIRTOE EXHIBITION 	Lain-lain	13  - 15 Jul 2018	09:00 - 22:00	Gedung Oudetrap, Kawasan Kota Lama	\N	\N
1802	 MYC (Music Youngster Competition) 2018 	Musik	26  - 26 Jul 2018	09:00 - 21:00	Hall 2 STIESIA Surabaya	\N	\N
1801	 Makna Karya 	Lain-lain	25  - 25 Jul 2018	07:00 - 18:00	Universitas Negeri Jakarta	\N	\N
1800	 Festival Sholawat Al-Banjari (FESBAN) se-Jawa Timur 	Lain-lain	12  - 13 Agu 2018	08:00 - 03:00	Auditorium Universitas Islam Negri Sunan Ampel Surabaya	\N	\N
1799	 STBA LIA Bunka no Hi 2018 	Lain-lain	28  - 28 Jul 2018	10:00 - 19:00	Pelantaran parkir STBA LIA	\N	\N
1798	 Lomba Karya Tulis Nasional 	Lain-lain	14  - 15 Sep 2018	09:00 - 12:00	Fakultas Farmasi, Universitas Pancasila	\N	\N
1797	 ðŸ“£ðŸ“£ *ANDALAS NATIONAL SOCIOLOGY DEBATE COMPETITION*ðŸ“£ðŸ“£ 	Lain-lain	19 Sep 2018 - 22 Jul 2018	08:00 - 15:00	Gedung jurusan sosiologi FISIP universitas andalas 	\N	\N
1796	 ðŸ“¢ðŸ“¢ *ANDALAS SOCIAL ESSAY COMPETITION*ðŸ“¢ðŸ“¢ 	Lain-lain	18 Sep 2018 - 19 Agu 2018	08:00 - 13:00	Gedung jurusan sosiologi FISIP universitas andalas 	\N	\N
1795	 Pameran Foto 	Lain-lain	16  - 21 Jul 2018	09:00 - 20:00	Universitas Nasional	\N	\N
1794	 Olimpiade Matematika  	Lain-lain	15 Sep 2018 - 15 Jul 2018	06:00 - 17:00	UIN Sunan Ampel Surabaya	\N	\N
1793	 OPEN RECRUITMENT INOVATOR NUSANTARA REGIONAL LAMPUNG 	Lain-lain	05  - 17 Jul 2018	00:00 - 22:00	Online (Daring)	\N	\N
1792	 Debating and Writing Competition 	Lain-lain	08  - 09 Sep 2018	07:00 - 16:00	Ruang seminar GK 1 lantai 2 Fakultas Bahasa dan Seni, Universitas Negeri Yogyakarta	\N	\N
1790	 Kompetisi Public Speaking 	Lain-lain	21  - 21 Jul 2018	12:00 - 14:00	Universitas Nasional	\N	\N
1789	 Arkamaya Pre Event Talkshow : Expediency of Arts in Dealing with Nowadays Stressors  	Seminar	14  - 14 Jul 2018	13:00 - 15:40	Auditorium Gedung H lt.4, Fakultas Psikologi Universitas Indonesia, Depok 	\N	\N
1784	 Awarding Night CHRONICLE 2018 	Musik	13  - 13 Jul 2018	15:30 - 23:00	Student Center, Politeknik Keuangan Negara STAN	\N	\N
1783	 Seminar Technopreneurship  	Seminar	14  - 14 Jul 2018	08:00 - 16:00	Auditorium Perpustakaan Nasional, Lantai 2, Jl. Medan Merdeka Selatan No.11, Jakarta	\N	\N
1782	 [CETAKU : CARA ENAK CETAK GRATIS DOKUMENKU] 	Lain-lain	05 Jul 2018 - 31 Agu 2018	00:00 - 23:59	Jalan Danau Toba Blok G2 No.149, Tanah Abang	\N	\N
1781	 SEMINAR KESEHATAN LINGKUNGAN  	Seminar	25  - 25 Agu 2018	07:30 - 12:00	Hotel Bentani & Residence	\N	\N
1780	 Pameran Foto 	Lain-lain	16  - 21 Jul 2018	09:00 - 17:00	Selasar Universitas Nasional	\N	\N
1779	 12th DENTISTRY SCIENTIFIC MEETING UNIVERSITAS INDONESIA - NATIONAL DENTAL SCIENCE OLYMPIAD 	Lain-lain	27  - 27 Sep 2018	14:00 - 16:00	Gedung Rumpun Ilmu Kesehatan, UI Depok	\N	\N
1778	 Parade Wisuda Juli ITB 2018 	Lain-lain	21  - 21 Jul 2018	09:00 - 18:00	Kampus ITB Ganesha, Jl. Ganesha No. 10	\N	\N
1777	 Festival Elektronika Instrumentasi 	Lain-lain	01  - 01 Sep 2018	07:00 - 17:00	Taman pintar yogyakarta	\N	\N
1776	 Annual Language Competition 2018 	Lain-lain	01  - 02 Agu 2018	08:00 - 17:00	Gedung O dan Aula UPT Perpustakaan Universitas Neger Jakarta	\N	\N
1775	 MUSIKOLOGI 	Musik	23  - 23 Nov 2018	19:30 - 22:30	Hall Senayan	\N	\N
1773	 Gita Teladan Concert Series 5 	Musik	14  - 15 Jul 2018	08:00 - 21:00	Gedung Kesenian Jakarta	\N	\N
1772	 BRANDING UPDATE â€œThe Future of Retailâ€ 	Seminar	18  - 18 Jul 2018	12:00 - 18:00	Financial Club, CIMB Niaga,  Jl. Jend. Sudirman No.Kav 58, Jakarta Selatan	\N	\N
1771	 E-manifest Dance Competition 	Pensi	26  - 26 Agu 2018	08:00 - 15:00	Gedung Auditorium O5 lt. 3 FIP Unesa, Lidah Wetan	\N	\N
1770	 Management In Business 	Lain-lain	07  - 07 Jul 2018	08:00 - 17:00	Gedung Kantor JNE Pusat Jl. Kumudasmoro Tengah Semarang	\N	\N
1769	 Olimpiade Akuntansi Nasional XX 	Lain-lain	26  - 26 Agu 2018	07:00 - 18:30	Kampus Departemen Ekonomika&Bisnis Sekolah Vokasi UGM, Jln. Prof. Drs. Notonegoro No. 1 Bulaksumur	\N	\N
1768	 PIASE 2018 	Musik	07  - 07 Jul 2018	03:00 - 12:00	Rooftop ITC Depok	\N	\N
1767	 NASA (National Scientific Days) 	Lain-lain	18 Jul 2018 - 10 Okt 2018	07:00 - 18:00	Politeknik Negeri Sriwijaya	\N	\N
1765	 Photon (Physics Competition) 	Lain-lain	28 Okt 2018 - 18 Nov 2018	06:30 - 17:00	Gedung C3 Jurusan Fisika, FMIPA UNESA	\N	\N
1764	 Unair National Accounting Competition 	Lain-lain	17  - 20 Sep 2018	00:00 - 00:00	Universitas Airlangga, Surabaya	\N	\N
1763	 KOBARAN (Kolaborasi Band Tradisional) 	Musik	07  - 07 Jul 2018	19:00 - 22:00	GOR KAMPUS 2 UMS	\N	\N
1762	 Provel Concerns 2018 	Lain-lain	31 Mei 2018 - 07 Jul 2018	00:00 - 00:00	Semarang	\N	\N
1760	 Art Fest X 	Musik	11  - 11 Agu 2018	08:00 - 18:00	Gedung Pertemuan 45 Unisma Bekasi	\N	\N
1759	 DIPONEGORO BUSINESS CASE COMPETITION 	Lain-lain	01 Mei 2018 - 30 Jun 2018	00:00 - 00:00	FAKULTAS EKONOMIKA DAN BISNIS  UNIVERSITAS DIPONEGORO	\N	\N
1758	 Sociotraveling in Lombok 2018 	Lain-lain	25  - 30 Agu 2018	04:00 - 21:00	Desa Setanggor	\N	\N
1757	 International Business Plan Competition  	Lain-lain	10 Jun 2018 - 10 Jul 2018	00:00 - 00:00	Jakarta	\N	\N
1756	 Talkshow  Be success with your social media 	Seminar	10  - 10 Jul 2018	12:00 - 16:00	Gedung Auditorium Hj Darlina Lt 10 Fakultas Psikologi Universitas Persada Indonesia YAI	\N	\N
1754	 Unity Cup KMTI UMS 	Sport	01  - 01 Sep 2018	08:00 - 16:00	Lapangan Budi Langgeng 	\N	\N
1753	 Kuliah Kerja Nyata  	Lain-lain	20 Jul 2018 - 20 Agu 2018	08:00 - 17:00	Desa Tanjung Anom Kecamatan Mauk Kabupaten Tangerang	\N	\N
1752	 Let's Speak Up On The Radio ! 	Lain-lain	10 Agu 2018 - 10 Jun 2018	13:00 - 21:00	Craft Center Royal Plaza Surabaya	\N	\N
1751	 Pilihan Da'i Remaja (PILDARAJA) se-Jawa Timur 	Lain-lain	11  - 11 Agu 2018	08:00 - 20:00	Auditorium Universitas Islam Negri Sunan Ampel Surabaya	\N	\N
1750	 Musabaqoh Tilawatil Qur'an Tingkat Nasional 	Lain-lain	12  - 12 Agu 2018	07:00 - 21:00	Masjid Ulul Albab Universitas Islam Negri Sunan Ampel Surabaya	\N	\N
1749	 Musabaqoh Khattir Riq'ah Nasional (Mengirim Karya) 	Lain-lain	26 Jun 2018 - 04 Agu 2018	06:00 - 21:00	Ruang Sidang Rektorat Lama lantai 2 UIN Sunan Ampel Surabaya	\N	\N
1748	 MOSTART 2018 REGGEA FEST! 	Musik	04  - 04 Jul 2018	16:00 - 23:30	Rooftop ITC Depok	\N	\N
1747	 Network Engineering Talk 	Seminar	01  - 01 Jul 2018	08:00 - 12:00	STMIK Bumigora	\N	\N
1746	 SCHOLARSHIP WARRIOR CAMP 	Seminar	03  - 04 Jul 2018	00:00 - 23:00	Jakarta	\N	\N
1745	 Representation: The Art of Signifier 	Lain-lain	23  - 25 Jul 2018	13:00 - 19:40	Cinemaxx, Maxxboxx, Lippo Village. Lantai 2 Jl. Boulevard Jend. Sudirman No. 1110, Kelapa Dua, Tange	\N	\N
1744	 Mega Career Expo-Jakarta 	Bursa Kerja	06  - 07 Jul 2018	10:00 - 17:00	Gd. SMESCO Exhibition Hall	\N	\N
1743	 INFORMASI PEMBUKAAN KELAS BAHASA JEPANG DI KAMPUS UMN 	Lain-lain	09 Jul 2018 - 30 Sep 2018	17:15 - 19:00	Universitas Multimedia Nusantara	\N	\N
1742	 Padjadjaran Debate Championship (PDC 2018) 	Lain-lain	29 Sep 2018 - 01 Okt 2018	08:00 - 05:00	Fakultas Ekonomi dan Bisnis, Universitas Padjadjaran Jatinangor	\N	\N
1741	 Seminar Nasional 	Seminar	30  - 30 Jun 2018	08:00 - 15:00	Ar.Fachruddin Lt.2 Kampus E FEB UHAMKA	\N	\N
1740	 SENJA 2018 	Lain-lain	13  - 15 Sep 2018	08:00 - 16:00	Ruang Aboesono, FEB UPN VeteranJawa Timur dan Mustafa Center, Mall Royal Plaza	\N	\N
1739	 ADS Meeting (Airlangga Dentistry Scientific meeting) 	Lain-lain	20 Mei 2018 - 06 Okt 2018	07:00 - 16:00	Fakultas Kedokteran Gigi Airlangga	\N	\N
1738	 KOSMIK DAY! 2018 	Musik	28  - 28 Jun 2018	16:00 - 00:00	Universitas Prof. Dr. Moestopo (Beragama)	\N	\N
1737	 Seminar IYOIN: Muda, Beda, Kaya 	Seminar	07  - 07 Jul 2018	09:00 - 13:00	Perpustakaan Balai Kota Depok	\N	\N
1736	 Seminar Nasional SEHAT DI DUNIA NYATA BIJAK DI DUNIA MAYA 	Seminar	02  - 02 Jul 2018	08:30 - 12:10	Auditorium Arifin Panigoro, lantai 3, Universitas Al Azhar Indonesia	\N	\N
1735	 CERCo 2018 (Chemical Engineering Research Competition) : PAPER COMPETITION 	Lain-lain	07  - 25 Jun 2018	00:00 - 00:00	semarang	\N	\N
1734	  LKTIN Uwest 3 	Lain-lain	04  - 07 Okt 2018	08:00 - 12:00	Universitas Pendidikan Ganesha	\N	\N
1733	 CYRO Talks #1 - ALL ABOUT CYRONIUM 	Seminar	24  - 24 Jun 2018	11:00 - 17:00	Jakarta Desain Center, Slipi	\N	\N
1732	 Seminar Nasional Meningkatkan Kemampuan & Animo RISET Mahasiswa 	Seminar	13  - 13 Jul 2018	13:00 - 17:30	Auditorium Universitas MercuBuana Jakarta	\N	\N
1731	 [PERPANJAAAAAANG] DIPONEGORO SCIENCE COMPETITION (DSC) 2018 	Lain-lain	15  - 30 Jun 2018	00:00 - 23:59	Universitas Diponegoro	\N	\N
1730	 Call For Paper 2018 	Lain-lain	12  - 13 Jul 2018	08:00 - 17:00	Gedung Tower Universitas Mercu Buana Lt 3 & 4	\N	\N
1729	 Himpunan mahasiswa mesin Univ. Darma Persada proudly present Machine power IV 	Pensi	03  - 04 Jul 2018	08:00 - 22:00	Univ. Darma Persada	\N	\N
1728	 Lomba Karya Tulis Ilmiah Nasional Ansira 2018 	Lain-lain	22 Jun 2018 - 24 Okt 2019	13:00 - 23:55	Universitas Pendidikan Indonesia	\N	\N
1727	 Lomba Poster Nasional  Kesaktian Ideologi Pancasila dalam Menghadapi Aksi Terorisme dan Radikalisme  	Lain-lain	10  - 30 Jun 2018	00:00 - 00:00	Online	\N	\N
1726	 Diklat Pembelajaran 2018 	Lain-lain	02  - 02 Sep 2018	07:00 - 15:00	F.MIPA UNESA KETINTANG,SURABAYA	\N	\N
1725	 Seminar nasional Dan mechanical expo II TEKNIK MESIN UKI 	Seminar	17  - 17 Okt 2018	08:00 - 16:00	Audiotorium Graha William Soeryadjya FK UKI Lantai 1 Jl. Mayjen Soetoyo No.2 Cawang-Jakarta Timur	\N	\N
1724	 National Scientific Writing Competition Lustrum DTETI XI 	Lain-lain	29  - 29 Sep 2018	07:00 - 17:00	Fakultas Teknik Universitas Gadjah Mada	\N	\N
1723	 National Software Development Competition Lustrum DTETI XI 	Lain-lain	29  - 29 Sep 2018	07:00 - 17:00	Fakultas Teknik Universitas Gadjah Mada	\N	\N
1722	 PROMISE FIB 2018 	Lain-lain	25 Jun 2018 - 14 Sep 2018	08:00 - 17:00	Fakultas Ilmu Budaya Universitas Airlangga	\N	\N
1721	 LEON (Lomba Esai Nasional) 2018 	Lain-lain	19  - 21 Okt 2018	00:00 - 00:00	FISIP Universitas Brawijaya Malang	\N	\N
1720	 Ratoh Jaroe Festival II  	Lain-lain	28  - 28 Jul 2018	09:00 - 16:00	Universitas Trilogi	\N	\N
1719	 Seminar Entrepreneur 2018 The Next Jongpreneur 	Seminar	07  - 07 Jul 2018	09:00 - 12:30	Aula Ki Hajar Dewantara Lantai 9, Kampus A, Universitas Negeri Jakarta	\N	\N
1717	 Cite-UP (Computer and IT Event of Universitas Pertamina) 2 	Lain-lain	27 Okt 2018 - 11 Nov 2018	08:00 - 15:00	Online. (Untuk Final di Universitas Pertamina)	\N	\N
1716	 Pafesta (Pai Festival) 	Lain-lain	16  - 17 Jul 2018	07:30 - 17:00	Kampus A, Lantai 6 UHAMKA Limau	\N	\N
1715	 A Charity Concert Spirit Of Youth 	Lain-lain	26  - 26 Jun 2018	15:00 - 16:45	Gedung Olah Raga Universitas Tribhuwana Tunggadewi Malang Jalan Telaga Warna Blok C	\N	\N
1714	 TRIMASKETER 	Musik	30  - 30 Jun 2018	10:00 - 20:30	Auditorium Sekolah Tinggi Pariwisata Trisakti	\N	\N
1713	 Lomba Karya Tulis Ilmiah Nasional Uwest 3 	Lain-lain	04  - 07 Okt 2018	08:00 - 12:00	Universitas Pendidikan Ganesha	\N	\N
1712	  MANAJEMEN FESTIVAL 2018 	Expo	02  - 07 Jul 2018	13:00 - 19:00	STIE Ahmad Dahlan Jakarta 	\N	\N
1711	 IELTS Class 	Lain-lain	07 Jul 2018 - 22 Sep 2018	09:00 - 12:00	Artivator Jl Pemuda Depok	\N	\N
1709	 Hiperkes Cup VIII 	Sport	07  - 09 Sep 2018	08:00 - 17:00	Budi Langgeng Griya Futsal	\N	\N
1708	 12th DENTISTRY SCIENTIFIC MEETING UNIVERSITAS INDONESIA - POSTER COMPETITION 	Lain-lain	15 Mei 2018 - 27 Agu 2018	08:00 - 12:00	Rumpun Ilmu Kesehatan, UI Depok	\N	\N
1707	 12th DENTISTRY SCIENTIFIC MEETING UNIVERSITAS INDONESIA - NATIONAL LITERATURE REVIEW COMPETITION 	Lain-lain	15 Mei 2018 - 20 Jul 2018	08:00 - 12:00	Rumpun Ilmu Kesehatan, UI Depok	\N	\N
1706	 GTX 2018 : Evolve 	Expo	25  - 27 Jun 2018	08:00 - 15:00	Auditorium Sekolah Tinggi Multi Media Yogyakarta	\N	\N
1705	 Seminar Nasional Aplikasi Sains & Teknologi (SNAST) 2018 	Seminar	15  - 15 Sep 2018	08:00 - 16:00	Kampus 1, Institut Sains & Teknologi AKPRIND Yogyakarta, Jl. Kalisahak No.28 Kompleks Balapan,	\N	\N
1704	 Strategi Penerapan Manajemen Resiko dan SMK3 di Pelayanan Kesehatan dan Non Pelayanan Kesehatan 	Seminar	06  - 06 Jul 2018	13:30 - 18:00	Lt 8 Ruang 811, Gedung utama Universitas Esa Unggul	\N	\N
1703	 MOTO CONTEST #2 	Lain-lain	27  - 28 Jul 2018	21:00 - 05:00	UNIVERSITAS MUHAMMADIYAH MAGELANG KAMPUS II	\N	\N
1702	 Workshop International Khat Kaligrafi dengan Tema: Khat disiplin ilmu dan seni 	Seminar	09  - 09 Agu 2018	08:00 - 02:00	Ruang Amphiteather Twin Tower UIN Sunan Ampel Surabaya	\N	\N
1701	 Comptech 2018 	Lain-lain	01 Sep 2018 - 02 Jun 2018	08:00 - 17:00	Jalan Terusan Ryacudu, Way Hui, Jati Agung, Way Huwi, Jati Agung, Kabupaten Lampung Selatan, Lampung	\N	\N
1700	 Ipb National Essay Competition 	Lain-lain	06 Jun 2018 - 03 Agu 2018	00:00 - 23:59	Bogor	\N	\N
1699	 Essay Nasional 	Lain-lain	08 Jun 2018 - 18 Jul 2018	00:00 - 00:00	Universitas Bengkulu 	\N	\N
1698	 Science Project Competition Persembahan Oseanografi ITB untuk Indonesia (POSEIDON) 2018 	Lain-lain	07 Mei 2018 - 04 Nov 2018	00:00 - 18:00	Jl. Ganesha no. 10, Kampus ITB Ganesha, Aula Barat.	\N	\N
1697	 SEMINAR NASIONAL, STRATEGI TEMBUS BEASISWA LUAR NEGERI 	Seminar	07  - 07 Jul 2018	08:00 - 11:00	Ruang Citra 2, Unit 2, Universitas AMIKOM Yogyakarta	\N	\N
1696	 Warna-Warni Ramadhan 	Lain-lain	08  - 08 Jun 2018	15:00 - 21:00	Graha Aula Nusantara lt.4 Institut Bisnis Nusantara	\N	\N
1694	 PELATIHAN SEM 	Lain-lain	14  - 14 Jul 2018	06:00 - 17:00	Gd. Sardjijo lt 3 Kampus II Universitas PGRI Adi Buana Sby. Jl. Dukuh Menanggal XII	\N	\N
1693	 FORMASI (Festival Olahraga dan Malam Aksi) 2018 	Sport	24 Jun 2018 - 07 Jul 2018	06:00 - 23:00	Universitas PGRI Adi Buana Surabaya, kampus 2, jl Dukuh Menanggal XII	\N	\N
1692	 PROMO BERKAH RAMADHAN UMN ANIMATION CAMP & UMN FILM MAKING CAMP FOR BEGINNER  	Lain-lain	09  - 14 Jul 2018	09:00 - 19:00	Universitas Multimedia Nusantara	\N	\N
1691	 Lomba Fotografi Nasional #2 	Lain-lain	20 Mei 2018 - 25 Jun 2018	00:00 - 00:00	Indonesia	\N	\N
1690	 GEMA SWARA PESONA ANNUAL CONCERT : VÅ’U 	Musik	30  - 30 Jun 2018	19:00 - 21:00	Gedung Kesenian Jakarta	\N	\N
1686	 English Contest Of Animal Science Batch II 	Lain-lain	06  - 09 Sep 2018	12:00 - 12:00	Fakultas Peternakan Universitas Jenderal Soedirman Purwokerto 	\N	\N
1685	 PIASE 2018 	Musik	07  - 07 Jul 2018	16:00 - 22:30	Rooftop ITC Depok	\N	\N
1684	 WORKSHOP PROGRAMING WITH CAKEPHP  	Lain-lain	15  - 15 Jul 2018	08:00 - 15:30	Aula Saba Karya STIE-STMIK INSAN PEMBANGUNAN 	\N	\N
1683	 Lomba debat ekonomi ukdc 	Lain-lain	30  - 30 Jun 2018	08:00 - 16:00	Universitas katolik darma cendika	\N	\N
1682	 SPICER [Social Project in Computer Engineering Ramadhan] 	Lain-lain	05  - 05 Jun 2018	15:30 - 18:30	Amphi Teather Kampus Politeknik Elektronika Negeri Surabaya	\N	\N
1681	 Model AIPA 2018 	Seminar	06  - 08 Agu 2018	08:00 - 05:00	Aryaduta Jakarta Hotel	\N	\N
1680	 SlashRoot CTF 3.0 	Lain-lain	23 Jun 2018 - 28 Jul 2018	11:00 - 20:10	Online, STMIK STIKOM BALI Kampus II Jimbaran 	\N	\N
1679	 DIPONEGORO SCIENCE COMPETITION 2018 	Lain-lain	19 Mei 2018 - 08 Sep 2018	07:00 - 17:00	Universitas Diponegoro	\N	\N
1677	 SHIFT (Sharia Innovation Paper Competition) 	Lain-lain	21  - 22 Jul 2018	07:00 - 13:00	UNNES	\N	\N
1676	 Liga Futsal Airlangga 2018 	Sport	29 Jul 2018 - 04 Agu 2018	09:00 - 05:00	GOR Futsal Mangga Dua Surabaya	\N	\N
1674	 Pajamas Music Festival 	Musik	30  - 30 Jun 2018	15:00 - 23:00	South City, Pondok Cabe	\N	\N
1671	 Nostalgia 	Musik	07  - 07 Jun 2018	16:15 - 20:00	Universitas Pelita Harapan	\N	\N
1670	 Meetup #9 AndroidDev Surabaya 	Seminar	02  - 02 Jun 2018	15:30 - 17:00	Ruang Kelas lf-105a & lf-105b (Departemen Informatika ITS Surabaya)	\N	\N
1669	 Lomba Penulisan Esai Mahasiswa DIY dan Jawa Tengah 	Lain-lain	22 Apr 2018 - 31 Jul 2018	00:00 - 00:00	DIY dan Jawa Tengah	\N	\N
1668	 Lomba Karya tulis ilmiah Nasional siswa  	Lain-lain	04  - 07 Okt 2018	00:00 - 00:00	Universitas Negeri Padang 	\N	\N
1667	 Lomba Karya tulis ilmiah Nasional Mahasiswa  	Lain-lain	04  - 07 Okt 2018	00:00 - 00:00	Universitas Negeri Padang 	\N	\N
1666	 YORECO (Young Researcher Competition)  	Lain-lain	04  - 07 Okt 2018	00:00 - 13:01	Universitas Negeri Padang 	\N	\N
1665	 Seminar Nasional Media dan Politik Jelang Pilpres 2019 	Seminar	10  - 10 Jul 2018	08:30 - 12:00	Aula Lt. 8 Gedung Alawiyah Universitas Islam As-Syafi'iyah, Pondok Gede, Jakarta Timur	\N	\N
1664	 Accounting Revolution Time 3 (ART 3) College Students 	Lain-lain	28  - 29 Jun 2018	08:00 - 18:00	Kampus E FEB UHAMKA, JL. Raya Bogor KM 23 No 99 Flyover Pasar Rebo, Jakarta Timur	\N	\N
1663	 Festival Euphorbio 3 	Lain-lain	08 Sep 2018 - 13 Mei 2018	07:02 - 16:30	Universitas mulawarman	\N	\N
1662	 Accounting Revolution Time 3 (ART 3) VHS/SHS Students 	Lain-lain	25  - 26 Jun 2018	08:00 - 18:00	Kampus E FEB UHAMKA, JL. Raya Bogor KM 23 No 99 Flyover Pasar Rebo, Jakarta Timur	\N	\N
1661	 Pementasan Teater Adimanusia 	Lain-lain	20  - 20 Jul 2018	17:00 - 22:00	Gedung Kesenian (Cak Durasim) Jl. Genteng Kali No 85 Surabaya	\N	\N
1660	 Ramadhan fair 	Lain-lain	02  - 02 Jun 2018	10:00 - 18:30	Islamic Center, Bekasi barat, Jawa barat	\N	\N
1659	 NATIONAL DESIGN POSTER COMPETITION 	Lain-lain	12 Mei 2018 - 01 Jul 2018	00:00 - 00:00	Universitas Mataram	\N	\N
1658	 PHI ke XVII (paket hari ilmiah) OLIMPIADE MATEMATIKA se Jawa Bali 	Lain-lain	26  - 26 Agu 2018	07:30 - 14:00	23 rayon se Jawa Bali	\N	\N
1657	 Pekan Ilmiah Akuntansi 2018 	Lain-lain	29 Agu 2018 - 01 Sep 2018	08:00 - 05:00	Universitas Lambung Mangkurat	\N	\N
1656	 Indonesia International Week Registration 	Lain-lain	05  - 10 Agu 2018	00:00 - 08:01	Jakarta	\N	\N
1655	 Gemaste (Gebyar Mahasiswa Teknik Elektro) 	Lain-lain	24  - 26 Agu 2018	07:00 - 17:00	Gedung BPMPK(Badan Pengembangan Multimedia Pendidikan dan Kebudayaan) Semarang	\N	\N
1654	 Gemaste (Gebyar Mahasiswa Teknik Elektro) 	Expo	24  - 26 Agu 2018	07:30 - 17:45	Gedung BPMPK (Badan Pengembangan Multimedia Pendidikan dan Kebudayaan)	\N	\N
1653	 Open House + Buka Puasa Tanri Abeng University: Jurusan Kuliah Sesuai Kepribadian 	Seminar	03  - 03 Jun 2018	14:00 - 19:00	Tanri Abeng University	\N	\N
1652	 Lomba Poster dan Video 	Lain-lain	25  - 31 Mei 2018	00:00 - 12:00	Jakarta	\N	\N
1651	 iGreen 1st Wave Project 	Lain-lain	18 Jun 2018 - 31 Jul 2018	09:00 - 03:00	Desa Gempolsari, SMA 2 Pasundan Kota Cimahi, SMA 2 Pasundan Bandung, CFD Bandung	\N	\N
1650	 Lomba Karya Tulis Ilmiah CFC 2018 	Lain-lain	01 Jun 2018 - 22 Sep 2018	07:00 - 12:00	UIN SUNAN KALIJAGA	\N	\N
1649	 Senandung Arsitektur 2.0 	Expo	01  - 03 Jun 2018	15:00 - 21:00	Plaza Indonesia	\N	\N
1648	 Lentera 2018 	Lain-lain	25  - 25 Mei 2018	15:00 - 18:29	Masjid daim pnj	\N	\N
1647	 #YukBicara Vol. 7: Merebut Hati Pemilih 	Seminar	26  - 26 Mei 2018	14:30 - 19:00	Rumah Kebangsaan, Jl. Pattimura No. 9	\N	\N
1646	 SHARIA SESSION 	Lain-lain	02  - 02 Jun 2018	14:00 - 18:30	Aula E3 lantai 2 Fakultas Ekonomi Universitas Negeri Malang	\N	\N
1645	 RICMA CAMP 	Lain-lain	03 Jun 2018 - 03 Mei 2018	18:00 - 18:55	Masjid Cut Meutia	\N	\N
1644	 Berbagi Mushaf 1000 Al Quran 	Lain-lain	05  - 05 Mei 2018	07:25 - 18:30	Masjid Cut Meutia	\N	\N
1643	 Berbagi Mushaf 1000 Al Quran 	Lain-lain	05  - 05 Mei 2018	07:25 - 18:30	Masjid Cut Meutia	\N	\N
1642	 Festival Arsitektur Parahyangan 2018 	Lain-lain	21  - 26 Mei 2018	15:00 - 00:00	Jalan Braga Pendek & De Vries OCBC	\N	\N
1641	 Simposiun Nasional Inderaja 2018 	Seminar	30  - 30 Agu 2018	08:00 - 17:00	Aula Gedung LPPM, Institut Teknologi Sumatera	\N	\N
1640	 Mobile legends Usni competition 	Lain-lain	23  - 23 Mei 2018	13:00 - 23:00	universitas satya negara indonesia	\N	\N
1638	 ISO Training UI 2018 	Seminar	06  - 13 Okt 2018	09:00 - 04:00	Aula Terapung, Perpustakaan Pusat, Universitas Indonesia, Depok	\N	\N
1637	 National economic events 2018 (Nets) 	Lain-lain	23 Apr 2018 - 19 Sep 2018	08:00 - 16:00	Fakultas ekonomi dan bisnis unsoed	\N	\N
1636	 Pameran Calon Anggota UPC 20 â€œANATOMI XXâ€ 	Lain-lain	04  - 06 Jun 2018	09:00 - 16:00	Graha Wira Bakti Universitas Dharma Persada	\N	\N
1635	 Gelar Cipta Karya Boga 2018 	Seminar	07  - 07 Jul 2018	08:00 - 13:00	Fave Hotel Mex Surabaya	\N	\N
1634	 Pekan Ilmiah Nasional 2018 	Lain-lain	18 Apr 2018 - 23 Sep 2018	07:30 - 16:30	Universitas Lampung	\N	\N
1632	 Festival seni silat 2018 	Lain-lain	02  - 02 Jul 2018	07:30 - 16:30	Politeknik negeri semarang 	\N	\N
1631	 DIponegoro Financial National Competition (DEFINE) 5th 	Lain-lain	01 Mei 2018 - 06 Jul 2018	00:00 - 00:00	Fakultas Ekonomika dan Bisnis UNDIP	\N	\N
1630	 Smart and Creative Business of Traveling 	Seminar	02  - 02 Jun 2018	09:00 - 14:30	Gedung theater Thomas Aquinas, Unika Soegijapranata Semarang	\N	\N
1629	 Milk in Clip 	Lain-lain	01 Jun 2018 - 01 Mei 2018	16:00 - 18:00	Cikini	\N	\N
1628	 Say No To Junk Food dengan Berbagi Takjil Gratis bersama Kelas 2C Ilmu Komunikasi'17 Unsika 	Lain-lain	22  - 22 Mei 2018	16:00 - 18:00	Universitas Singaperbangsa Karawang	\N	\N
1626	 Ricma Fair 	Lain-lain	24 Mar 2018 - 23 Mei 2018	00:00 - 12:00	Masjid Cut Meutia	\N	\N
1625	 SEMINAR NASIONAL KEWIRAUSAHAAN 	Seminar	02  - 02 Jun 2018	08:00 - 13:00	Aula gedung C7 lantai 3 FIS Universitas Negeri Semarang	\N	\N
1624	 Looking at Blockchain Potential : A Way to a Secure and Transparent Financial System 	Seminar	05  - 05 Jun 2018	16:00 - 18:00	MYC Multipurpose Room Pelita Harapan University	\N	\N
1623	 Technopreneur 	Seminar	08  - 09 Jun 2018	09:00 - 16:00	Kalbis Institute	\N	\N
1622	 CERCo 2018 : PAPER COMPETITION 	Lain-lain	07 Mei 2018 - 30 Nov -1	00:00 - 00:00	-	\N	\N
1621	 Goresan Pena Sosial 	Lain-lain	10 Mei 2018 - 23 Sep 2018	19:00 - 00:00	Universitas Brawijaya, Malang	\N	\N
1619	 PROFIL EVENTKAMPUS.COM 	Lain-lain	09 Apr 2018 - 25 Mei 2018	00:00 - 00:00	PT. Kusuma Kreasi Utama	\N	\N
1618	 BEASt (Business Enterpreneurship and Advertising strategy) 	Seminar	26  - 26 Mei 2018	14:30 - 17:30	Perpustakaan lantai 5 ( Universitas Surabaya Tenggilis )	\N	\N
1614	 SEMINAR PROPERTI SYARIAH 	Seminar	18  - 18 Mei 2018	08:30 - 14:00	Universitas Yarsi - Lt. 12 Ar-Rahim	\N	\N
1613	 UWP CUP 2018, turnamen futsal antar universitas putra putri se jawa timur 2018 	Sport	15  - 22 Jul 2018	07:00 - 22:00	Lapangan futsal universitas wijya putra surabaya	\N	\N
1612	 INISIASI STILL LIFE DRAWING NGABUBUART 	Seminar	18  - 18 Mei 2018	15:30 - 17:00	Galeri Dewan Kesenian Surabaya Jalan Gubernur Suryo No. 15 	\N	\N
1611	 Hari Seni Rupa 	Lain-lain	15  - 18 Mei 2018	09:00 - 18:00	Perpusat UI	\N	\N
1610	 INISIASI WORKFLOW AND DESIGN TREND 2018 	Seminar	18  - 18 Mei 2018	13:00 - 15:00	Galeri Dewan Kesenian Surabaya Jalan Gubernur Suryo No. 15 	\N	\N
1608	 Talkshow Airlangga Indonesia Denali Expedition 	Seminar	17  - 17 Mei 2018	12:00 - 17:00	Aula Kahuripan Lt. 3 Kampus C Universitas Airlangga Surabaya	\N	\N
1607	 Seminar Legislatif  	Seminar	14  - 14 Mei 2018	09:00 - 15:30	Bale Sawala, Kampus Unpad Jatinangor 	\N	\N
1606	 HISTORY WEEK 2018, Panel Diskusi: 20 Tahun Pasca Reformasi 	Seminar	09  - 11 Mei 2018	08:30 - 16:00	Aula Pusat Studi Bahasa Jepang (PSBJ), Fakultas Ilmu Budaya, Universitas Padjadjaran	\N	\N
1605	 Pelatihan Standarisasi Guru Al-Qur'an metode Tilawati 	Seminar	12  - 13 Mei 2018	07:00 - 16:00	Masjid Ulul Albab Universitas Islam Negri Sunan Ampel Surabaya	\N	\N
1604	 Lomba Karya Tulis Ilmiah Tingkat Nasional 	Lain-lain	29 Jun 2018 - 30 Nov -1	06:00 - 00:00	Kampus FEB UHAMKA	\N	\N
1603	 LOMBA CIPTA PUISI EVENT HUNTER INDONESIA 	Lain-lain	08 Mei 2018 - 08 Jun 2018	00:00 - 00:55	Jakarta	\N	\N
1602	 Pameran Fotografi JOGJAPOLITAN 	Lain-lain	11  - 13 Mei 2018	10:00 - 21:00	Donga Coffee, Jl.Menukan 239A Brontokusuman, Mergangsan, Yogyakarta	\N	\N
1601	 DKVACT 4 ( ISI SURAKARTA ) 	Lain-lain	12  - 13 Mei 2018	10:00 - 22:00	Gelanggang Pemuda Bung Karno Manahan	\N	\N
1600	 DESPOSITA (Desain Poster Himpunan Mahasiswa Teknologi Industri Pertanian) 	Lain-lain	09 Mei 2018 - 11 Sep 2018	00:00 - 00:00	INSTITUT TEKNOLOGI INDONESIA	\N	\N
1599	 creativlognation 	Lain-lain	12  - 12 Mei 2018	10:30 - 16:30	iisip jakarta	\N	\N
1598	 Mobile Legend Tournament Big Versus 	Lain-lain	10  - 12 Mei 2018	14:00 - 20:00	Coffee Toffee Grogol, Coffee Toffee Margonda, Coffee Toffee Kota Wisata	\N	\N
1597	 Pelatihan & Pendalaman Pengolahan Analisis Data Statistika Menggunakan SPSS 	Lain-lain	14 Mei 2018 - 04 Jun 2018	13:00 - 17:00	Universitas Multimedia Nusantara	\N	\N
1596	 Social On Symphonesia 2018 	Pensi	12  - 12 Mei 2018	18:30 - 22:00	Taman Tirto Agung	\N	\N
1595	 Seminar Nasional Pasar Modal Syariah 	Seminar	15  - 15 Mei 2018	07:30 - 12:00	Gedung KH Ibrahim E7 Lantai 5, Universitas Muhammadiyah Yogyakarta	\N	\N
1594	 Seminar Nasional Metamorphosa 9 	Seminar	13  - 13 Mei 2018	07:00 - 15:00	Auditorium UNS	\N	\N
1593	 Electro Day 	Lain-lain	09  - 09 Mei 2018	08:00 - 22:00	Kampus Institut Teknologi Nasional, Jl. PKH. Mustopha No.23, Bandung 40124, Indonesia	\N	\N
1592	 Seminar Nasional 2018  Artificial Intelligence  	Seminar	05  - 05 Jun 2018	08:00 - 13:00	(ruang cinema) Universitas Amikom Yk	\N	\N
1591	 TRY OUT UMPN 2018 BEST PREPARATION TO SUCCESS UMPN 2018 	Lain-lain	17 Apr 2018 - 13 Mei 2018	06:30 - 17:00	POLITEKNIK NEGERI MALANG	\N	\N
1590	 Pendaftaran EXPRONAS (Exchange Program Nasional) 	Lain-lain	05 Apr 2018 - 10 Mei 2018	00:00 - 00:00	Bogor (Kampus IPB)	\N	\N
1589	 ARISE (Administration Impacts Society)Â  National Panel Discussion 2018  	Seminar	12  - 12 Mei 2018	07:00 - 14:00	Gedung Widyaloka, Universitas Brawijaya 	\N	\N
1588	 Communication On Self Development 	Seminar	09  - 09 Mei 2018	09:00 - 14:00	Gramedia world Galuh mas Karawang 	\N	\N
1584	 Seminar  Peran Audit Forensik Dalam Mendeteksi Dan Mengungkap Fraud  	Seminar	12  - 12 Mei 2018	10:00 - 16:00	Auditorium STIE Pasundan Bandung	\N	\N
1583	 SEMINAR UMUM Sisi Feminisme Buku Cantik Itu Luka dalam Perspektif Agama dan Psikologi 	Seminar	13  - 13 Mei 2018	07:30 - 13:00	Gedung Pasca Sarjana Lt.2 (Auditorium) Universitas Trunojoyo Madura	\N	\N
1582	 PESTA PENDIDIKAN INDONESIA 	Lain-lain	11  - 16 Mei 2018	08:00 - 17:00	KAMPUS STIE AHMAD DAHLAN JAKARTA	\N	\N
1581	 SEMUSIM (Seminar Muslim Muslimah) 	Seminar	13  - 13 Mei 2018	08:00 - 13:30	Graha Medika lt.2 Fakultas Kedokteran Univ. Brawijaya	\N	\N
1580	 PSYCHOFFEBREAK 	Musik	12  - 12 Mei 2018	15:00 - 18:00	Backyard	\N	\N
1579	 Release Party TeaLinuxOS X 	Seminar	12  - 12 Mei 2018	08:00 - 13:00	Aula Gedung E Lantai 3 Universitas Dian Nuswantoro Semarang	\N	\N
1577	 LOMBA FOTO & SEMINAR ANTI PLAGIASI 	Seminar	27 Apr 2018 - 15 Mei 2018	00:00 - 08:00	Aula Utama IAIN Tulungagung	\N	\N
1576	 Talkshow Super Accounting Program 8  	Lain-lain	12  - 12 Mei 2018	08:00 - 13:00	Gedung Wanitatama	\N	\N
1575	 Festival Teater Pelajar 2018 tingkat Nasional 	Lain-lain	16 Okt 2018 - 26 Mei 2018	08:00 - 21:00	Dalam konfirmasi	\N	\N
1574	 Meetup 8 AndroidDev Surabaya 	Lain-lain	12  - 12 Mei 2018	09:00 - 13:00	Aula (Gedung F Lantai 5) Universitas Dr. Soetomo Surabaya	\N	\N
1573	 JOB FAIR BEM FIA UNKRIS x KEMNAKER 	Lain-lain	11  - 12 Mei 2018	09:00 - 16:00	Universitas Krisnadwipayana	\N	\N
1572	 Seminar Nasional 	Seminar	07  - 07 Mei 2018	07:30 - 14:00	Graha IAIN Surakarta	\N	\N
1571	 1.\tPELATIHAN & PENDALAMAN PENGOLAHAN ANALISIS DATA STATISTIKA MENGGUNAKAN SPSS & EXCEL â€“ Open For Pu 	Lain-lain	04 Mei 2018 - 04 Jun 2018	13:00 - 17:00	Universitas Multimedia Nusantara	\N	\N
1568	 Program ANIMATION & FILM MAKING CAMP Di Kampus UMN 	Lain-lain	09  - 14 Jul 2018	09:00 - 19:00	Universitas Multimedia Nusantara	\N	\N
1567	 I'am Interpreneur And You? 	Seminar	14  - 14 Mei 2018	08:00 - 12:00	Auditorium Ir. Widjatmoko Universitas Semarang	\N	\N
1566	 Hifasco 2018 	Seminar	22  - 24 Mei 2018	08:00 - 16:00	Auditorium grha  wira bhakti,Dan Lab Komputer Lt 3 Universitas darma persada,jakarta timur	\N	\N
1564	 SEMINAR NASIONAL MACHINE LEARNING 	Seminar	13  - 13 Mei 2018	08:00 - 12:00	AULA FAKULTAS TEKNOLOGI INDUSTRI UNISSULA SEMARANG	\N	\N
1563	 Travelicious 	Expo	04  - 06 Mei 2018	11:00 - 21:00	Teras Kota BSD	\N	\N
1562	 Nongski: Bukan Cuma Pinter, Tapi Juga Terampil - Kenalan Sama Pendidikan Berbasis Keterampilan 	Seminar	05  - 05 Mei 2018	12:30 - 15:00	HUB2U Coworking Space, Jl. Boulevard Raya Kelapa Gading Blok TT2 No. 17	\N	\N
1561	 SEMINAR NASIONAL KEFARMASIAN DAN WORKSHOP HANDSANITIZER 	Seminar	13  - 13 Mei 2018	08:00 - 16:00	Fakultas farmasi dan sains Uhamka 	\N	\N
1560	 Niti Karyo#2 	Pensi	03  - 10 Mei 2018	00:00 - 22:00	Argobudoyo UNS	\N	\N
1559	 SEMINAR GIZI NASIONAL 2018 	Seminar	09  - 09 Mei 2018	07:00 - 01:15	Aula lt. 1 Jurusan Gizi poltekkes kemenkes Surabaya	\N	\N
1558	 TO SBMPTN 2018 	Lain-lain	05  - 05 Mei 2018	08:00 - 14:00	Universitas Nasional Pejaten Barat	\N	\N
1557	 Seminar Street Fotography 	Seminar	05  - 05 Mei 2018	09:00 - 13:00	Aula Ged A , Polimedia Jakarta	\N	\N
1556	 Economic Talk and Discussion Kanopi FEB UI 2018 	Seminar	12  - 12 Mei 2018	09:30 - 13:30	Student Center FEB UI	\N	\N
1555	 bla bla bla 	Expo	10  - 09 Mei 2018	00:00 - 13:00	bla bla bla	\N	\N
1554	 Islamic Edu Trip 	Lain-lain	05  - 05 Mei 2018	06:30 - 16:00	Monas - Masjid Istiqlal	\N	\N
1553	 Seminar nasional 	Seminar	07  - 07 Mei 2018	09:00 - 14:00	Graha bhayangkara	\N	\N
1552	 Gerakan Protein Sehat 	Seminar	06  - 06 Mei 2018	08:00 - 11:00	Auditorium Janes Hummuntal Sutasoit, Fakultas Peternakan IPB	\N	\N
1551	 KEPORIOR 3 	Expo	05  - 06 Mei 2018	09:01 - 22:00	Lt 2 Pasar Gedhe	\N	\N
1550	 Ukrida Job Fair 2018 	Bursa Kerja	08  - 09 Mei 2018	09:00 - 16:00	Auditorium Gedung E lantai 7 Kampus 1 UKRIDA, Jl. Tanjung Duren Raya No. 4 Jakarta Barat	\N	\N
1549	 Splash Run 2018 	Sport	06  - 06 Mei 2018	07:00 - 14:00	Perumahan Vida Bekasi	\N	\N
1548	 Kejuaaraan Antar Fakultas Uin Suka 	Lain-lain	06  - 06 Mei 2018	07:00 - 17:30	Gelanggang Mahasiswa Uin Suka	\N	\N
1544	 FTP CONFERENCE 	Seminar	06  - 06 Mei 2018	08:00 - 13:00	Gedung Theater PENS	\N	\N
1543	 Kelas Bahasa Korea di Kampus UMN Serpong Batch III Agustus 2018 	Lain-lain	06 Agu 2018 - 31 Okt 2018	17:00 - 20:00	Universitas Multimedia Nusantara	\N	\N
1542	 ECONOWEEKS 2018 	Pensi	04  - 06 Mei 2018	10:00 - 22:00	Tribeca Central Park	\N	\N
1541	 Pelatihan Huawei Certified Network Associate (HCNA) Di UMN 04-08 Juni 2018 	Lain-lain	04  - 08 Jun 2018	09:00 - 15:00	Universitas Multimedia Nusantara	\N	\N
1540	 Kopi Kampus : Cangkir#1-MayDay 	Musik	05  - 05 Mei 2018	18:30 - 00:00	Universitas Subang	\N	\N
1539	 KEJUARAAN ANTAR FAKULTAS (KEJURTAS) TAEKWONDO 2018 	Lain-lain	05  - 05 Mei 2018	09:00 - 03:00	Gelanggang Mahasiswa UIN Yogyakarta	\N	\N
1538	 Talkshow Media BK 	Seminar	05  - 05 Mei 2018	07:00 - 12:00	GKB Fakultas Ilmu Pendidikan Universitas Negeri Malang	\N	\N
1537	 Ecw (enterpreneur and career workshop) 	Seminar	04  - 05 Mei 2018	08:00 - 17:00	Fakultas ekonomi dan bisnis universitas airlangga	\N	\N
1536	 ASEAN Youth Expo 2018 	Seminar	03  - 04 Mei 2018	10:00 - 16:00	Hotel Grand Sahid Jaya	\N	\N
1535	 Business and Budgeting Plan 	Seminar	13  - 13 Mei 2018	07:00 - 13:00	Ballroom Hotel Amaris Padjajaran, Kota Bogor	\N	\N
1534	 Presentation Workshop 	Seminar	05  - 05 Mei 2018	08:00 - 15:20	Ruang Sidang 1 DTMI Universitas Gadjah Mada	\N	\N
1533	 PROJECT X  	Musik	29  - 29 Apr 2018	13:30 - 21:30	STIE Ekuitas Bandung	\N	\N
1532	 Workshop Lingkungan 	Seminar	12  - 12 Mei 2018	08:00 - 13:00	Auditorium FMIPA UGM	\N	\N
1531	 INFORMASI PEMBUKAAN KELAS BAHASA JEPANG DI KAMPUS UMN 	Lain-lain	09 Jul 2018 - 17 Sep 2018	17:15 - 18:44	Universitas Multimedia Nusantara	\N	\N
1530	 Vocational Airlangga Festival 	Lain-lain	18  - 18 Mei 2018	14:00 - 00:00	Lapangan Magister Managemen Kampus B UNAIR	\N	\N
1529	 ARTVOLUSI 2018 	Pensi	23  - 24 Mei 2018	10:00 - 17:30	Jurusan Pendidikan Seni Rupa dan Kerajinan, UNIMA	\N	\N
1527	 Business Plan Competition 	Lain-lain	13 Apr 2018 - 03 Mei 2018	00:00 - 22:00	Universitas Jenderal Soedirman	\N	\N
1526	 Harmonesta 	Lain-lain	07  - 12 Mei 2018	08:00 - 18:00	Universitas Islam Negeri Imam Bonjol Padang	\N	\N
1524	 Dedication  	Lain-lain	29  - 29 Apr 2018	08:00 - 13:00	Di bawah jembatan baru UGM	\N	\N
1518	 International Guest Lecture by Mr.Sharif banna 	Seminar	03  - 03 Mei 2018	10:00 - 12:00	Gedung PSJ - Universitas Indonesia	\N	\N
1517	 SOUNDSPEAK 2018 	Seminar	03  - 03 Mei 2018	09:30 - 01:00	Politeknik Negeri Jakarta	\N	\N
1516	 Perbanas Career Fair 	Bursa Kerja	04  - 05 Mei 2018	10:00 - 16:00	Perbanas Institute	\N	\N
1514	 Accounting Festival 2018 	Seminar	07  - 07 Mei 2018	08:30 - 13:00	Universitas Tarumanagara kampus II	\N	\N
1513	 AGRITALK 2018 	Seminar	06  - 06 Mei 2018	08:00 - 12:00	Ruang B01-B06 lt.2 Kampus IPB Baranangsiang	\N	\N
1506	 Seminar ICMA 2018 	Seminar	07  - 07 Mei 2018	08:00 - 16:30	Auditorium of Mercu Buana University Jakarta	\N	\N
1505	 Wardah Bright Days 	Seminar	29  - 29 Apr 2018	08:00 - 15:00	Auditorium GMSK IPB	\N	\N
1504	 islamic and culture exibition 	Lain-lain	10  - 11 Mei 2018	10:00 - 21:00	Hartono Mall	\N	\N
1503	 Mahakarya Cipta seni 2018 	Pensi	21  - 24 Mei 2018	19:00 - 22:00	Gedung Pertunjukan Sawunggaling UNESA	\N	\N
1502	 Islamic Young Counselor Camp 2018 	Lain-lain	05  - 06 Mei 2018	07:00 - 13:00	Asrama Ijo	\N	\N
1501	 EDSART #6 FESTALES DREAM NIGHT 	Lain-lain	27 Apr 2018 - 19 Mei 2018	18:00 - 22:00	FBS UNY	\N	\N
1500	 Food Roulette 	Lain-lain	13  - 13 Mei 2018	07:00 - 23:00	Surabaya Townsquare	\N	\N
1499	 English Contest of Adisutjipto 	Lain-lain	13  - 13 Mei 2018	08:00 - 03:00	Sekolah Tinggi Teknologi Adisutjipto Yogyakarta	\N	\N
1498	 GTX 2018 : Evolve 	Expo	30 Apr 2018 - 02 Mei 2018	08:00 - 16:00	Auditorium Sekolah Tinggi Multi Media Yogyakarta	\N	\N
1497	 Gerakan Masyarakat Mencegah daripada Mengobati (GEMA) Indonesia Sehat 2018: Gaya Hidupmu Masa Depan  	Seminar	28  - 28 Apr 2018	07:00 - 14:00	Gedung PT Erlangga, Ciracas Jakarta Timur	\N	\N
1496	 Sepekan Keakraban Psikologi 2018 	Sport	22  - 29 Apr 2018	08:00 - 09:00	Gor DISJAS AD Baros	\N	\N
1495	 SEMINAR NASIONAL 2018 HMPE 	Seminar	28  - 28 Apr 2018	08:00 - 00:00	Auditorium Fakultas Ekonomi UNY	\N	\N
1494	 SPACE (Sharia Paper Competition) 	Lain-lain	30  - 31 Agu 2018	08:00 - 17:00	FEB UNDIP	\N	\N
1493	 SHIFT (Sharia Innovation Paper Competition) 	Lain-lain	21  - 22 Jul 2018	08:00 - 14:00	Semarang	\N	\N
1492	 SMART EDUCATION FOR INDONSIA 	Seminar	25  - 25 Apr 2018	07:30 - 15:00	Aula Gedung Q Lantai 3, Politeknik Negeri Jakarta	\N	\N
1491	 SEMINAR HASIL DAN TALKSHOW: EKSPLORASI BATURRADEN 2018 	Seminar	28  - 28 Apr 2018	08:00 - 15:00	Auditorium Fakultas Kehutanan UGM	\N	\N
1490	 OPEN HOUSE EKSTENSI FKM UI 	Lain-lain	28  - 28 Apr 2018	03:00 - 15:00	Ruang promosi doktor gedung G FKM UI	\N	\N
1489	 SEMINAR NASIONAL KEWIRAUSAHAAN 	Seminar	05  - 05 Mei 2018	10:00 - 01:00	Hotel Megaland / Jalan Brigjend Slamet Riyadi No.351, Purwosari, Laweyan, Kabupaten Sukoharjo, Jawa 	\N	\N
1488	 Islamic Economics Event 	Seminar	28  - 28 Apr 2018	08:00 - 12:30	Ruang Auditorium A. R. Fahruddin Lantai 2, Kampus E UHAMKA (Fakultas Ekonomi dan Bisnis)	\N	\N
1487	 Festival Teater  UHAMKA Program Studi Pendidikan Bahasa dan Sastra Indonesia  	Lain-lain	12  - 12 Mei 2018	18:30 - 22:00	Gedung Pertunjukan Bulungan 	\N	\N
1486	 Landscape Industri Komunikasi di Era Digital 	Seminar	02  - 02 Mei 2018	08:00 - 04:00	Jln KH Ahmad Dahlan Cirendeu Ciputat Tangerang Selatan Fakultas Ilmu Sosial dan Ilmu Politik UMJ	\N	\N
1485	 Pesona Dilan 	Seminar	13 Mei 2018 - 30 Nov -1	07:00 - 17:10	Gedung Islamic Center Pamekasan	\N	\N
1484	 Marketing Plan Competition 	Lain-lain	26  - 28 Jul 2018	07:00 - 15:00	Fakultas Ekonomi, UNNES	\N	\N
1483	 ANESTHESIA 2018 	Pensi	04  - 04 Mei 2018	16:00 - 00:00	Dyandra Convention Center	\N	\N
1482	 KIOS CORNER (Kime on English Scientific Corner) 	Seminar	29  - 29 Apr 2018	08:00 - 12:00	Auditorium of Economics Faculty, UNNES (L1 Building - 3rd floor)	\N	\N
1481	 Japanese Culture Festival 	Pensi	05  - 06 Mei 2018	09:00 - 21:00	Gedung G Udinus Semarang Jl. Imam Bonjol 205-207	\N	\N
1480	 Pekan Apresiasi Seni 2018  	Lain-lain	29  - 29 Apr 2018	08:00 - 14:00	Universitas Muhammadiyah Surakarta 	\N	\N
1479	 Japanese Culture Festival 	Pensi	05  - 06 Mei 2018	09:00 - 21:00	Gedung G Udinus Semarang Jl. Imam Bonjol 205-207	\N	\N
1478	 FESTIVAL FIKES UHAMKA 2018 	Seminar	21  - 21 Apr 2018	12:00 - 20:00	Auditorium lantai 4 Kampus A UHAMKA Limau (Jalan Limau II Kebayoran Baru, Jakarta Selatan)	\N	\N
1477	 Workshop Public Speaking 	Lain-lain	25 Apr 2018 - 30 Nov -1	08:00 - 13:00	Kampus UPN Veteran Jakarta, Kampus Pondok Labu	\N	\N
1476	 [UBS STKS BDG] [27th UBS Anniversary] ~ Storyphoria  	Musik	29  - 29 Apr 2018	13:00 - 10:00	STKS BANDUNG DAGO, 367	\N	\N
1475	 SCHOLARSHIP TALKSHOW AND IELTS WORKSHOP 	Seminar	05  - 05 Mei 2018	09:00 - 17:00	Auditorium Al-Jibra Universitas Muslim Indonesia Jalan Urip Sumharjo KM.5	\N	\N
1474	 SEMINAR NASIONAL RISET DAN INOVASI 	Seminar	28  - 28 Apr 2018	07:30 - 15:00	Gedung Prof. Soedarto Universitas Diponegoro	\N	\N
1473	 SENSASI 2018 	Seminar	01  - 01 Mei 2018	08:00 - 13:30	Aula Gedung E Lantai 3 Universitas Dian Nuswantoro	\N	\N
1472	 Lawphoria #2 Forest for the future  	Musik	07  - 07 Mei 2018	16:00 - 23:00	Lapangan parkir Sportorium UMY 	\N	\N
1471	 Peringatan Isra' Mi'raj 1439 H 	Lain-lain	21  - 21 Apr 2018	08:00 - 12:00	Musholla Teknik Universitas Gadjah Mada	\N	\N
1470	 Mechanical Stock 2018  	Pensi	28  - 28 Apr 2018	16:00 - 12:00	Sam Poo Kong 	\N	\N
1469	 Career Coaching 	Seminar	28  - 28 Apr 2018	08:00 - 17:00	Gedung Rumpun Ilmu Kesehatan Universitas Indonesia	\N	\N
1468	 Woman is WOW Man 	Seminar	21  - 21 Apr 2018	13:00 - 16:00	Kolega Antasari	\N	\N
1467	 Festival BAF 2018 	Expo	23  - 25 Apr 2018	09:00 - 17:00	Parkiran Pudir Politeknik Negeri Jakarta	\N	\N
1466	 EXPRESI BUDAYA NUSANTARA IX 	Pensi	04  - 04 Mei 2018	17:00 - 21:00	GOR HASTA BRATA KAMPUS II UNIPA SURABAYA	\N	\N
1465	 BIG M DAY 2018 	Lain-lain	21  - 21 Apr 2018	13:00 - 22:00	Kampus IV Universitas Pasundan 	\N	\N
1464	 MUSIC HALL 	Musik	21  - 21 Apr 2018	10:00 - 17:00	Politeknik STMI Jakarta Gedung A Aula Lantai 7,  Cempaka Putih, Jakarta Pusat.	\N	\N
1463	 Seminar Nasional Dakwah 	Seminar	03  - 03 Mei 2018	12:30 - 16:00	Serang, Banten	\N	\N
1462	 How to Manage Personal Monthly Budget X FemaleTalks 	Lain-lain	10  - 10 Mei 2018	15:00 - 16:00	Kakota Cafe and Resto (Jl. Jeld Sudirman No. 116 Purwakarta)	\N	\N
1461	 Joglo Art Collaboration 	Pensi	07  - 07 Mei 2018	19:00 - 22:00	Lapangan Desa Tiyaran, Kecamatan Bulu, Sukoharjo	\N	\N
1460	 NGOBRAS CIMI (ngobrol Santai di Cerita Inspirator Masa Kini)  	Seminar	29  - 29 Apr 2018	11:00 - 15:00	EATOPIA CAFE Jl Setiabudi II No.1 Kuningan Setiabudi, Jakarta Selatan	\N	\N
1459	 ARKAMAYA 	Lain-lain	19  - 21 Apr 2018	15:00 - 22:00	BANDUNG CREATIF HUB	\N	\N
1458	 HARI ULANG TAHUN SMA NEGERI 1 SIMO KE 34  	Pensi	26  - 27 Apr 2018	07:00 - 11:00	SMA NEGERI 1 SIMO	\N	\N
1457	 Kajian Akbar 	Lain-lain	05  - 05 Mei 2018	07:00 - 11:00	Gedung Teknik Sipil Unesa	\N	\N
1456	 Seminar Nasional The Rise and Rise of Bitcoin 	Seminar	19  - 19 Mei 2018	16:00 - 21:00	Auditorium  kampus 3 lt. 4 gedung  Bonaventura Universitas Atma Jaya Yogyakarta 	\N	\N
1455	 Pagelaran Tari Rantau 2018 	Lain-lain	13  - 13 Mei 2018	19:00 - 21:00	Graha Bhakti Budaya, TIM	\N	\N
1445	 KD E-Sport Mobile Legends Competition 	Lain-lain	12  - 13 Mei 2018	08:00 - 18:00	Gedung Pertemuan Kelurahan Bulusan Tembalang, Semarang	\N	\N
1444	 IT fest ITI 2018 	Lain-lain	30 Apr 2018 - 09 Mei 2018	07:00 - 16:00	Institut teknologi indonesia	\N	\N
1443	 Chemistry Fun Days 2018 	Lain-lain	22 Apr 2018 - 13 Mei 2018	07:00 - 12:00	Universitas Padjajaran	\N	\N
1442	 Economy Festival 2018 UIKA BOGOR 	Lain-lain	23 Apr 2018 - 08 Mei 2018	08:00 - 18:00	Fakultas Ekonomi Universitas Ibn Khaldun Bogor	\N	\N
1441	 Seminar Nasional dan Workshop Explore Your Code Deeply 	Seminar	07  - 08 Mei 2018	08:00 - 12:00	Ruang Seminar Pasca Sarjana Gedung Psikologi lt. 5 Universitas Muhammadiyah Surakarta	\N	\N
1440	 Mobile Apps for Bussines 	Seminar	05  - 05 Mei 2018	08:00 - 13:00	Ruang 304, Kampus 3 Universitas Mercu Buana Yogyakarta	\N	\N
1439	 PENDAFTARAN SCE 2018 	Expo	28  - 28 Apr 2018	09:00 - 23:00	Gor Sritex Arena Solo, Surakarta	\N	\N
1437	 Pergelaran Sastra PBSI A 2015 	Lain-lain	11  - 11 Mei 2018	18:00 - 22:00	Aula Kampus 1 Mrican Universitas Sanata Dharma	\N	\N
1436	 Kalbis Investment Day  	Lain-lain	09  - 09 Mei 2018	07:00 - 17:00	KALBIS Institute   Jl. Pulomas Selatan Kav. 22  Pulogadung 	\N	\N
1435	 Exhibition Of Nutrition 2018 	Expo	05  - 05 Mei 2018	13:00 - 20:31	Royal Craft Center, Surabaya	\N	\N
1434	 Fisiprogresif 2018 	Lain-lain	12  - 12 Mei 2018	13:30 - 16:00	Aula Lantai.4 universitas satya negara indonesia	\N	\N
1432	 Seminar Nasional Pharmapreneur 	Seminar	05  - 05 Mei 2018	08:00 - 12:00	Ballroom hotel golden tulip	\N	\N
1431	 UMY Creative Student Festival 	Seminar	28  - 28 Apr 2018	07:00 - 16:00	Sportorium Universitas Muhammadiyah Yogyakarta	\N	\N
1430	 Bk Fair Seninar Nasional  	Seminar	14 Apr 2018 - 04 Mei 2018	08:00 - 13:00	Universitas islam as-syafi'iyah	\N	\N
1427	 Talkshow dan Seminar KOMPAK (Komunikasi Peka Aktif dan Kreatif) 	Seminar	26  - 26 Apr 2018	10:00 - 17:30	Kampus A UHAMKA Limau, Kebayoran Baru, Jakarta Selatan	\N	\N
1426	 PEKAN IX MALIMPA UMS (Pendidikan Konservasi dan Advokasi Lingkungan) 	Seminar	28  - 28 Apr 2018	07:30 - 15:00	Ruang seminar, Gedung Siti walidah, Universitas Muhammadiyah Surakarta	\N	\N
1425	 Seminar Nasional  	Seminar	12  - 12 Mei 2018	08:00 - 16:00	Aula Ibnu Khaldun Fakultas Ekonomi Universitas Islam Sultan Agung Semarang Jl Kaligawe Raya KM 4	\N	\N
1424	 Tabligh Akbar 1439H 	Lain-lain	20  - 20 Apr 2018	13:00 - 17:00	Ruang Auditorium Sekolah Tinggi Pariwisata Trisakti	\N	\N
1423	 Accounting Exhibition and Discussion (ACSI) XIV 	Seminar	02  - 03 Mei 2018	08:00 - 17:00	Perbanas Institute jakarta	\N	\N
1422	 Incretions 2018 	Lain-lain	04  - 06 Mei 2018	08:00 - 17:00	Fisip, Universitas Diponegoro	\N	\N
1421	 Workshop Nasional Cyber Crime and Digital Forensic 	Lain-lain	05  - 05 Mei 2018	08:00 - 15:00	Kampus 3 Gedung Bonaventura Universitas Atma Jaya Yogyakarta, Jalan Babarsari No.43	\N	\N
1420	 Seminar Nasional & Workshop Dies Natalis STT PLN 2018 	Seminar	23  - 24 Apr 2018	08:00 - 15:00	Kampus STT PLN	\N	\N
1419	 seminar nasional ki hajar dewantara chapter 4  	Seminar	28  - 28 Apr 2018	08:00 - 15:00	universitas pgri adibuana surabaya kampus 2 jln dukuh menanggal surabaya	\N	\N
1418	 Pekan Arsitektur 2018 	Seminar	02 Mei 2018 - 06 Apr 2018	09:00 - 18:00	Indonesia convention exhibition (ICE), BSD City	\N	\N
1417	 Pekan Arsitektur 2018 	Lain-lain	02 Mei 2018 - 06 Apr 2018	09:00 - 18:00	Indonesia convention exhibition (ICE), BSD City	\N	\N
1416	 Pekan Arsitektur 2018 	Lain-lain	02  - 06 Mei 2018	09:00 - 18:00	Indonesia convention exhibition (ICE), BSD City	\N	\N
1415	 Pekan Arsitektur 2018 	Lain-lain	02  - 06 Mei 2018	10:00 - 18:00	Indonesia convention exhibition (ICE), BSD City	\N	\N
1414	 I-FEST 2018 SUPERNOVA - TALKSHOW & SEMINAR 	Seminar	07  - 07 Mei 2018	08:00 - 12:00	Sport Center UINSBY	\N	\N
1413	 Seminar nasional AEC 5 	Seminar	29  - 29 Apr 2018	08:00 - 13:00	Puspem	\N	\N
1412	 FABULOUS 1.0 	Musik	29  - 29 Apr 2018	17:00 - 23:55	Universitas Muria Kudus	\N	\N
1411	 SEMINAR NASIONAL GIZI 2018 	Seminar	09  - 09 Mei 2018	07:00 - 14:00	Aula Jurusan Gizi Poltekkes Kemenkes Surabaya	\N	\N
1410	 Andalas International Relations Fair UNAND 2018  	Lain-lain	16  - 21 Apr 2018	08:00 - 22:00	Universitas Andalas 	\N	\N
1409	 Widyatama Business & Journalism Festival 	Seminar	23  - 23 Apr 2018	13:00 - 17:00	GSG Universitas Widyatama (Jl.cikutra 204 , Bandung)	\N	\N
1408	 Beauty class 	Lain-lain	21  - 21 Apr 2018	08:00 - 15:15	FAKULTAS PETERNAKAN DAN PERTANIAN UNDIP TEMBALANG 	\N	\N
1407	 Management Festival 2018 	Expo	23 Apr 2018 - 05 Mei 2018	08:00 - 16:00	Halaman Gedung Dosen Fakultas Ekonomi dan Bisnis	\N	\N
1406	 Talkshow carier mau jadi apa? 	Seminar	29  - 29 Apr 2018	08:00 - 13:00	Gedung D12 lantai 3 (DEKANAT) FMIPA UNNES	\N	\N
1405	 TRY OUT UJIAN MASUK POLITEKNIK NEGERI 2018 	Lain-lain	30  - 30 Nov -1	00:00 - 00:00	POLITEKNIK NEGERI MALANG	\N	\N
1404	 Seminar Nasional 	Seminar	07  - 07 Mei 2018	08:00 - 14:00	Universitas Pembangunan Panca Budi Medan	\N	\N
1403	  THE 16th FEB UI CUP RUN TO RAISE  	Sport	15  - 15 Apr 2018	06:00 - 10:00	Universitas Indonesia 	\N	\N
1402	 Brandialogue: Why Branding? 	Seminar	21  - 21 Apr 2018	09:00 - 13:00	Edu Town Kavling Edu I No. 1, Serpong, Jalan BSD Raya Utama, Pagedangan, Tangerang, Banten 15339	\N	\N
1400	 BIOFEST 2018 	Seminar	21  - 21 Apr 2018	08:00 - 14:00	Auditorium Universitas Surya	\N	\N
1399	 Seminar dan Workshop [Game dari Hobi jadi Profesi] 	Seminar	18  - 18 Apr 2018	12:00 - 17:00	Universitas Esa Unggul R811	\N	\N
1398	 BAZAR BUKU ONLINE UGM PRESS 	Lain-lain	09  - 21 Apr 2018	08:00 - 23:55	Klik http://ugmpress.ugm.ac.id	\N	\N
1397	 SEMINAR BUSINESS INTELLIGENCE 	Seminar	30  - 30 Apr 2018	08:00 - 16:00	Ruang Sidang Lantai 3, Gedung Utara, Kampus 1 Universitas Teknologi Yogyakarta	\N	\N
1396	 YSPC (Youth Science paper competition) 	Lain-lain	09 Apr 2018 - 10 Jul 2018	07:00 - 02:00	Psdku universitas airlangga banyuwangi	\N	\N
1395	 Informatics Festival :  	Lain-lain	27  - 29 Apr 2018	10:00 - 20:00	Pluit Village	\N	\N
1394	 SEMINAR NASIONAL PENGUATAN NILAI-NILAI KEBANGSAAN MELALUI PENDIDIKAN KEWARGANEGARAAN PERSEKOLAHAN DA 	Seminar	07  - 07 Jul 2018	08:00 - 15:00	Aula Gedung F, FKIP Universitas Sebelas Maret	\N	\N
1393	 UNS Market Festival 2018 	Lain-lain	03  - 06 Mei 2018	13:00 - 19:00	Grand Atrium Hartono Mall	\N	\N
1391	 National Learning Media Competition 	Lain-lain	09  - 09 Mei 2018	07:00 - 17:00	Aula FE Gedung L2 Lantai 3 Universitas Negeri Semarang	\N	\N
1390	 PELATIHAN AUDIT 2018 	Seminar	28  - 28 Apr 2018	07:00 - 16:00	Hall GP Sekolah Vokasi UGM	\N	\N
1389	 Lomba baca sajak puisi seleksi tingkat kota Magelang dalam rangka hari Sastra 	Pensi	20  - 22 Apr 2018	07:00 - 17:10	Universitas Tidar Magelang	\N	\N
1388	 Seminar & Workshop Secure Coding 	Lain-lain	05  - 05 Mei 2018	08:00 - 17:00	Universitas Dr. Soetomo Jl. Semolowaru No.84 Surabaya(Gedung A lt.3 RM.Soemantri)	\N	\N
1384	 Dr. Mochtar Riady Legal Fair 2018 	Lain-lain	23  - 25 Mei 2018	08:00 - 16:00	Universitas Pelita Harapan, Karawaci	\N	\N
1382	 [ECC UGM x Wardah] Be Elegant Through Beauty Class And Grab Free Voucher! 	Lain-lain	17  - 17 Apr 2018	09:00 - 13:00	Graha Karir ECC UGM Jl. Krasak Barat No. 20 Kotabaru Yogyakarta	\N	\N
1381	 Pekan Seni Tiga 2018 Universitas Indonesia 	Lain-lain	24 Apr 2018 - 04 Mei 2018	17:00 - 19:00	Fakultas Matematika dan Ilmu Pengetahuan Alam	\N	\N
1380	 Teater Lena  	Lain-lain	09  - 09 Mei 2018	18:00 - 21:00	Auditorium Driyarkara Universitas Sanata Dharma	\N	\N
1378	 Lomba Debat Nasional Pendidikan 	Lain-lain	27  - 29 Apr 2018	07:00 - 05:00	Dekanat fip Unnes	\N	\N
1377	 EXPRESSIVE SOUND OF PETROLEUM 	Musik	14  - 14 Apr 2018	18:00 - 23:00	JEC PARKING LOT	\N	\N
1376	 GemetaRun 2018 	Lain-lain	05  - 05 Mei 2018	15:30 - 21:00	Universitas Katolik Indonesia Atma Jaya Kampus BSD	\N	\N
1375	 The Joyfull Of Business 	Seminar	20  - 20 Apr 2018	10:20 - 19:00	Gedung Serba Guna Universitas Widyatama	\N	\N
1374	 Inspirational Conference  	Seminar	22  - 22 Apr 2018	07:00 - 17:00	3rd Floor SAC,  UINSA,  SBY	\N	\N
1373	 Ekuitas Fun Day 	Musik	15  - 15 Apr 2018	15:30 - 22:00	Aula STIE EKUITAS LT.4	\N	\N
1372	 CTF GATOTKACA CYBER COMPETITION 	Lain-lain	12  - 12 Mei 2018	07:00 - 12:30	Citra 1 Universitas AMIKOM Yogyakarta	\N	\N
1370	 Pekan Keilmuan Sosial dan Politik ( PKSP) 	Seminar	12  - 12 Apr 2018	07:00 - 13:30	Amphitheater Gedung KH.Ibrahim Lantai 5, Universitas Muhammadiyah Yogyakarta	\N	\N
1369	 Portofolio coffe 	Lain-lain	19  - 19 Apr 2018	12:30 - 18:00	STP Sahid Jakarta	\N	\N
1368	 MFR (Medical First Responder) 	Lain-lain	24  - 24 Apr 2018	08:00 - 17:00	Jalan Cabe Raya, Pondok Cabe, Pamulang, Pd. Cabe Udik, Pamulang, Kota Tangerang Selatan, Banten 1541	\N	\N
1367	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1366	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1365	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1364	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1363	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1362	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1361	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1360	 Lomba Ketrampilan Baris-Berbaris (KOMPATEK) Universitas Muhammadiyah Sidoarjo 	Lain-lain	29 Apr 2018 - 30 Nov -1	07:00 - 17:30	Kampus II : Jl. Raya Gelam 250 Candi Sidoarjo, Telp : 031-8921938	\N	\N
1359	 Seminar wilayah 	Seminar	18  - 18 Apr 2018	08:00 - 12:00	Auditorium Univet	\N	\N
1358	 Seminar Pengembangan Wawasan Industri UI 2018 	Seminar	07  - 15 Apr 2018	10:00 - 03:00	Universitas Indonesia	\N	\N
1357	 PETRA CHESS COMPETITION 	Sport	27  - 29 Apr 2018	10:00 - 22:00	Pakuwon Trade Center	\N	\N
1356	 DISCOTIK 2018 (Discovery x OTENTIK 2.0) 	Lain-lain	07  - 08 Mei 2018	08:00 - 22:00	Sportorium Universitas Muhammadiyah Yogyakarta	\N	\N
1355	 ETALASE#2 Arsitektur Universitas Negeri Semarang 	Seminar	07  - 07 Apr 2018	08:00 - 17:00	Hall lantai 2 Hotel UTC, Jalan Kelud Raya, Semarang	\N	\N
1354	 Trilogi Accounting Competition 	Seminar	17  - 17 Apr 2018	07:00 - 15:00	Universitas Trilogi	\N	\N
1353	 HSN DAN LNC  	Lain-lain	28  - 28 Apr 2018	08:00 - 17:00	FAKULTAS PETERNAKAN DAN PERTANIAN UNDIP TEMBALANG 	\N	\N
1352	 Pentas Teater Genosida Rakarana Jhon Mati Hati 	Pensi	07  - 07 Apr 2018	19:30 - 22:30	Concert Hall Taman Budaya jalan sriwedani no.1 yogyakarta	\N	\N
1350	 TALKSHOW GENDER 	Lain-lain	21  - 21 Apr 2018	07:30 - 13:30	Aula lantai 5 Kampus C FFS UHAMKA, Klender, Jakarta Timur	\N	\N
1349	 GAMA ISO Training 	Seminar	28  - 29 Apr 2018	07:00 - 17:00	Hotel Grand Serela Yogyakarta Jl. Magelang KM.4 No.145, Sinduadi, Mlati	\N	\N
1348	 Seminar Nasional 	Seminar	12  - 12 Mei 2018	08:00 - 14:00	C7 FIS UNNES	\N	\N
1347	 PHARMASHOCK -Sterne Von April- 	Musik	29  - 29 Apr 2018	17:00 - 20:00	Taman Balekambang, Surakarta	\N	\N
1346	 LOMBA POSTER EXON 2018 	Expo	01 Apr 2018 - 01 Mei 2018	00:00 - 23:00	Craft center, Royal plaza	\N	\N
1345	 Seminar Umum 	Seminar	14  - 14 Apr 2018	08:00 - 13:00	Universitas Amikom Yogyakarta	\N	\N
1344	 FITOFEST HARYONO SEMANGUN AWARD 2018 	Musik	05  - 05 Mei 2018	16:00 - 23:59	Jogja Expo Center	\N	\N
1343	 festival of geography 	Lain-lain	23  - 23 Apr 2018	07:00 - 18:00	fkip uhamka	\N	\N
1342	 Bonjour fotografi maraton 	Lain-lain	12  - 12 Mei 2018	07:00 - 15:00	Kembang sok, jati mulyo, kulon progo / 12 Mei 2018	\N	\N
1341	 OPTIMALISASI PANGAN FUNGSIONAL UNTUK KETAHANAN PANGAN YANG BERKELANJUTAN 	Seminar	28  - 28 Apr 2018	08:00 - 12:30	Gedung V. Fakultas Kedokteeran Lt. 6 Universitas Semarang	\N	\N
1339	 TENSES (Teenager English Competition in Smansasi) 6 	Lain-lain	28  - 28 Apr 2018	08:30 - 17:30	SMAN 1 Bekasi	\N	\N
1338	 SEMINAR NASIONAL SMART GLOBAL 	Seminar	07  - 07 Apr 2018	08:00 - 15:00	Pendopo kabupaten Tangerang Jl kisamaun No. 1 Tangerang Banten	\N	\N
1337	 SEMINAR NASIONAL 	Seminar	08  - 08 Apr 2018	07:31 - 04:00	Pose in hotel	\N	\N
1336	 SEMNASTI 2018 	Seminar	10  - 10 Apr 2018	07:00 - 14:00	Aula Gedung E lantai 3 Universitas Dian Nuswantoro Semarang, Jalan Nakula 1 no 1 - 5 Semarang	\N	\N
1335	 PORTION â€œpresenter workshop & competitionâ€ 	Lain-lain	21  - 22 Apr 2018	09:00 - 17:00	UPN VETERAN YOGYAKARTA	\N	\N
1334	 INVITASI 2018 	Lain-lain	12  - 12 Mei 2018	08:00 - 16:00	Hall A kampus 1 STIE PERBANAS SURABAYA	\N	\N
1332	 Social Media Influencer 	Seminar	01  - 01 Mei 2018	08:00 - 12:00	Balairung Universitas PGRI Semarang	\N	\N
1331	 Try Out SBMPTN dan Seminar Bedah Jurusan Berani Kuliah 	Seminar	24  - 25 Apr 2018	08:00 - 17:00	Pusat Studi Jepang, UI	\N	\N
1330	 Toefl Uin Sunan Ampel 	Lain-lain	05  - 06 Mei 2018	08:00 - 17:00	Uin Sunan Ampel Surabaya	\N	\N
1329	 Lomba Mewarnai 	Pensi	05  - 05 Mei 2018	13:00 - 16:00	Craft Center Royal Plaza	\N	\N
1328	 SOFT SKILL DAY eclipse 	Lain-lain	07  - 07 Apr 2018	09:00 - 10:00	Auditorium Gedung Thoma Aquinas Universitas Atma Jaya Yogyakarta	\N	\N
1327	 The 19th Tax Seminar and Training Talkshow 	Seminar	10  - 10 Apr 2018	10:00 - 15:30	Auditorium R. Soeria Atmadja Fakultas Ekonomi dan Bisnis Universitas Indonesia	\N	\N
1326	 Try Out SBMPTN 2018 	Lain-lain	15  - 15 Apr 2018	08:00 - 15:30	Gedung Graha Sainta Lantai 3 Universitas Brawijaya	\N	\N
1325	 Accounting Competition (ACTION) 2018 	Lain-lain	05  - 06 Mei 2018	07:00 - 18:00	STIESIA Surabaya	\N	\N
1324	 SEA-STAR COMPETITION  	Lain-lain	30  - 30 Nov -1	07:00 - 12:00	Unnes 	\N	\N
1323	 TRY OUT SBMPTN KSE NUSANTARA (TOKSEN) IPB 2018 	Expo	21  - 21 Apr 2018	06:45 - 13:00	Kampus Institut Pertanian Bogor (IPB) Dramaga	\N	\N
1322	 I-FEST 2018 SUPERNOVA - LOMBA FILM PENDEK  	Lain-lain	25 Mar 2018 - 08 Mei 2018	09:00 - 15:00	Sport Center UINSBY	\N	\N
1321	 I-FEST 2018 SUPERNOVA - LOMBA FOTOGRAFI  	Lain-lain	25 Mar 2018 - 08 Mei 2018	09:00 - 15:00	Sport Center UINSBY	\N	\N
1320	 SEBO FEST 2018 	Musik	31  - 31 Mar 2018	15:00 - 22:00	Rooftop Mall Dinoyo	\N	\N
1319	 I-FEST 2018 SUPERNOVA - TOURNAMENT MOBILE LEGENDS 	Lain-lain	25 Mar 2018 - 08 Mei 2018	09:00 - 15:00	Sport Center UINSBY	\N	\N
1318	 ROADSHOW & WORKSHOP Canon Semarang Photo Marathon IV 2018 bersama UKM FOTOGRAFI CLIC UNNESðŸ“¸ 	Seminar	08  - 08 Apr 2018	08:00 - 01:00	Dekanat Fakultas Teknik LT3, Universitas Negeri Semarang	\N	\N
1317	 I-FEST 2018 SUPERNOVA -  LOMBA E S A I  	Lain-lain	25 Mar 2018 - 08 Mei 2018	13:00 - 15:00	Sport Center UINSBY	\N	\N
1316	 I-FEST 2018 SUPERNOVA - LOMBA VLOG  	Lain-lain	25 Mar 2018 - 08 Mei 2018	09:00 - 15:00	sport center uinsby	\N	\N
1315	 IMAKSI AHMAD DAHLAN COMPETITION (INCOME) 2018 	Lain-lain	16  - 19 Apr 2018	08:00 - 17:00	STIE AHMAD DAHLAN JAKARTA	\N	\N
1314	 Mini Seminar Huawei Certification Network Academy 	Seminar	25  - 25 Apr 2018	14:00 - 16:00	UNIVERSITAS MULTIMEDIA NUSANTARA	\N	\N
1313	 Toefl prediction test and preparation 	Lain-lain	02  - 05 Apr 2018	16:00 - 18:00	Universitas Mercu Buana Yogyakarta, Kampus 3	\N	\N
1312	 himage competition 	Sport	28  - 29 Apr 2018	08:00 - 17:00	gor punokawan	\N	\N
1311	 Pelatihan Kewirausahaan ( sold out ) 	Lain-lain	31  - 31 Mar 2018	09:00 - 13:00	Universitas Mercu Buana Yogyakarta, Kampus III	\N	\N
1310	 Pentas perdana teater avatar jurusan teater angkatan 2017 fakultas seni pertunjukan isi yogyakarta 	Lain-lain	08  - 08 Apr 2018	19:00 - 22:00	Auditorium jurusan teater fakultas seni pertunjukan isi yogyakarta	\N	\N
1309	 Temptation  	Seminar	07 Mei 2018 - 30 Nov -1	09:00 - 12:59	Stp Sahid Sudirman (Sahid Sudirman residence Lt.5) DKI JAKARTA	\N	\N
1308	 StudentsXCEOs Future Leader Academy 	Seminar	14  - 15 Apr 2018	08:00 - 17:00	IPMI Business School, Pancoran, Jakarta Selatan	\N	\N
1306	 PUBLIC HEALTH EVENT COMPETITION INDONESIA 	Lain-lain	29  - 29 Apr 2018	07:00 - 17:00	Aula Gedung E Udinus	\N	\N
1305	 SOFT SKILL DAY 	Lain-lain	07  - 07 Apr 2018	09:00 - 10:00	Auditorium Gedung Thomas Aquinas Universitas Atma Jaya Yogyakarta	\N	\N
1304	 Heroes Cup Mobile Legend Looking For The Champion 	Lain-lain	23  - 23 Mei 2018	13:30 - 19:30	Kwik Kian Gie School Of Business Lt.4	\N	\N
1303	 YOT Class Public Speaking Vol. 3 	Seminar	31  - 31 Mar 2018	08:00 - 14:00	Ruang Teratai Balai Kota Depok	\N	\N
1302	 GEMASIN Gerakan Muda Masa Kini 	Seminar	07  - 07 Apr 2018	08:00 - 15:00	Universitas YARSI	\N	\N
1301	 KARTESIUS 2018 	Lain-lain	26  - 26 Apr 2018	07:30 - 17:30	Kampus UNISSULA	\N	\N
1300	 KARTINI FUN FESTIVAL, BEAUTY CLASS WITH WARDAH AND VIONITTA WIJAYA 	Lain-lain	21  - 21 Apr 2018	08:00 - 17:00	Jalan seteran dalam 09, kampus fakultas bahasa dan budaya universitas 17 agustus 1945 semarang	\N	\N
1299	 SEMINAR NASIONAL DIGITALISASI 	Seminar	12  - 12 Apr 2018	08:00 - 12:00	AULA GEDUNG KH SAIFUDDIN ZUHRI	\N	\N
1298	 MACARONY FESTIVAL 2018 	Seminar	07  - 07 Apr 2018	08:30 - 18:00	Universitas Kristen Maranatha	\N	\N
1297	 SEMNASTI 2018 	Seminar	10  - 10 Apr 2018	07:00 - 14:00	Aula Gedung E lantai 3 Universitas Dian Nuswantoro, Jalan Nakula 1 No 1 - 5, Semaang 	\N	\N
1296	 Econimics nite 	Musik	23  - 23 Apr 2018	18:00 - 22:00	Universitas Muhammadiyah Yogyakarta ( Sportorium UMY )	\N	\N
1295	 FESTIVAL FAKULTAS EKONOMI DAN BISNIS JILID III  	Pensi	10  - 13 Apr 2018	09:00 - 21:00	Universitas Islam Syekh-Yusuf Tangerang (UNIS Tangerang)	\N	\N
1294	 Festival Basmala 	Lain-lain	28  - 29 Apr 2018	07:00 - 17:00	Universitas Bakrie	\N	\N
1293	 Seminar Nasional Great Muslimah Training Asmanadia 	Seminar	15  - 15 Apr 2018	08:00 - 12:00	Samarinda	\N	\N
1292	 SERTIFIKASI DAN UJI KOMPETENSI AHLI K3 MUDA 	Lain-lain	28 Apr 2018 - 30 Nov -1	09:00 - 19:00	Gedung Universitas Pancasila (Lenteng Agung, Jakarta Selatan)	\N	\N
1291	 Kuliah sehari bisnis pertanian  	Seminar	26  - 27 Mar 2018	08:00 - 14:00	Universitas trilogi 	\N	\N
1290	 GLUKOSA 2018 	Seminar	05  - 05 Mei 2018	07:00 - 15:00	Lor In Solo Hotel Jl. Adisucipto no.47 Blulukan, Colomadu	\N	\N
1289	 TECHNOFEST 2018 	Lain-lain	14  - 19 Apr 2018	08:00 - 21:00	Universitas 17 Agustus 1945 Surabaya	\N	\N
1288	 Travel Mart â€œUnexpected Treasure of Indonesiaâ€ 	Expo	26  - 26 Apr 2018	09:00 - 17:00	Dome Malabar STP NHI Bandung	\N	\N
1287	 Seminar nasional 	Seminar	12  - 12 Mei 2018	08:00 - 17:00	Universitas 17 Agustus 1945 Jakarta 	\N	\N
1286	 Art and Sport Competition for Psychology Students 	Sport	12  - 21 Apr 2018	07:00 - 00:00	Gor Ciracas, Jakarta Timur	\N	\N
1285	 PETROFORIA 2018  	Lain-lain	28  - 29 Apr 2018	08:00 - 10:00	BALIKPAPAN 	\N	\N
1284	 Workshop TECHNOFEST 2018 	Lain-lain	19  - 19 Apr 2018	08:00 - 21:00	Universitas 17 Agustus 1945 Surabaya	\N	\N
1283	 Seminar & Kompetisi TECHNOFEST 2018 	Lain-lain	16  - 17 Apr 2018	08:00 - 15:00	Universitas 17 Agustus 1945 Surabaya	\N	\N
1282	 Seminar TECHNOFEST 2018 	Lain-lain	14  - 14 Apr 2018	08:00 - 12:00	Universitas 17 Agustus 1945	\N	\N
1281	 Business Plan National Competition 	Expo	20 Peb 2018 - 19 Apr 2018	00:00 - 00:00	Fakultas Ekonomi dan Bisnis Universitas Lampung	\N	\N
1274	 ITATS EAST JAVA ENGLISH COMPETITION 2018 	Lain-lain	28  - 28 Apr 2018	07:00 - 17:30	Institut teknologi Adhi Tama Surabaya , Jl. Arif Rahman Hakim No.100 Surabaya	\N	\N
1273	 FORCE ( FESTIVAL OLAHRAGA, CERDAS CERMAT, DAN SENI) 	Lain-lain	28  - 29 Apr 2018	08:00 - 17:00	Kampus II UNIVERSITAS PGRI ADI BUANA SURABAYA	\N	\N
1271	 Seminar Nasional Smart Global 	Seminar	07  - 07 Apr 2018	08:00 - 16:00	pendopo kabupaten tangerang	\N	\N
1270	 ECOFEB  	Lain-lain	29  - 29 Apr 2018	07:00 - 17:00	Kampus I Universitas Wijaya Putra Surabaya, Jl. Raya Benowo no 1 - 3 Surabaya 	\N	\N
1269	 ART FESTIVAL 2018 	Musik	10  - 10 Mei 2018	13:00 - 22:00	Kampus II Universitas PGRI Adi Buana Surabaya (GOR Hastrabrata)	\N	\N
1268	 Seminar Nasional Laboratory Update of Helicobacter pylori : Recent and Beyond 	Seminar	13  - 13 Mei 2018	08:00 - 17:00	ORIENT International Restaurant and Convention Hall, Hartono Mall Lantai 1, Solo Baru, Sukoharjo	\N	\N
1267	 Lomba Boardgame GTX 2018 	Expo	20 Mar 2018 - 19 Apr 2018	00:00 - 00:00	Sekolah Tinggi Multi Media MMTC Yogyakarta	\N	\N
1266	 PENGUMUMAN UNDIAN BEASISWA  EVENTKAMPUS.COM 	Lain-lain	19  - 24 Mar 2018	00:00 - 00:00	eventkampus.com	\N	\N
1265	 PETROFORIA 2018  	Lain-lain	28  - 29 Apr 2018	08:00 - 10:00	BALIKPAPAN 	\N	\N
1264	 BUNGKESMAS FUN RUN 2018 	Sport	22  - 22 Apr 2018	06:30 - 11:00	Kampus 2, UIN Syarif Hidayatullah Jakarta	\N	\N
1263	 SEMINAR NASIONAL 	Seminar	24  - 24 Mar 2018	08:00 - 14:00	Aula Fakultas Teknik Universitas Pancasila	\N	\N
1262	 Business Week UPH 2018  	Seminar	02  - 06 Apr 2018	13:00 - 00:00	Universitas Pelita Harapan, Lippo Karawaci	\N	\N
1261	 Business Week UPH 2018 Imagine The Unimaginable 	Lain-lain	02  - 06 Apr 2018	00:00 - 00:00	Universitas Pelita Harapan, Lippo Karawaci	\N	\N
1260	 Business Week UPH 2018 Imagine The Unimaginable 	Lain-lain	02  - 06 Apr 2018	15:55 - 00:00	Universitas Pelita Harapan, Lippo Karawaci	\N	\N
1259	 Workshop BAF 2018 	Seminar	21  - 21 Mar 2018	09:00 - 13:00	Gedung serba guna, Politeknik Negeri Jakarta	\N	\N
1258	 Jaladra (Jawara Lakon dan Drama) 	Lain-lain	23  - 24 Apr 2018	09:00 - 15:00	Gedung GSG Universitas Hang Tuah Surabaya	\N	\N
1257	 ESA ENGLISH COMPETITION 	Lain-lain	05  - 05 Mei 2018	08:00 - 19:00	Universitas Muria Kudus	\N	\N
1256	 The Largest ASEAN Business Model Competition Espriex 5.0 	Lain-lain	05 Mar 2018 - 09 Apr 2018	00:00 - 00:00	Universitas Brawijaya, Malang Indonesia	\N	\N
1255	 Communication Festival UNRIYO 2018 	Seminar	11  - 11 Apr 2018	08:00 - 12:00	Kampus 1 Universitas Respati Yogyakarta , Jl. Laksda Adisucipto, km. 6,5 depok, caturtunggal, sleman	\N	\N
1254	 5K Charity Color Run 	Sport	13  - 13 Mei 2018	05:00 - 10:00	Synergy Building, Alam Sutera, Tangerang	\N	\N
1253	 5 Day Challenge: Capture Your Journey with Open Trip 	Lain-lain	27  - 29 Mar 2018	00:00 - 00:00	INSTAGRAM (Seluruh Wilayah Indonesia)	\N	\N
1252	 Dokter Data 2018 	Lain-lain	31 Mar 2018 - 28 Apr 2018	08:00 - 16:00	Universitas Diponegoro	\N	\N
1251	 ECOVOLUTION  	Musik	17  - 17 Apr 2018	12:00 - 00:00	Universitas Stikubank (UNISBANK) Kampus Kendeng	\N	\N
1250	 Gelar Wicara 	Seminar	15  - 15 Apr 2018	13:00 - 17:00	Gedung aula PGRI, universitas indraprasta PGRI, kampus A, ranco Jakarta selatan	\N	\N
1249	 ACE (Art Competition and Exhibition) 	Lain-lain	25  - 25 Mar 2018	07:30 - 17:00	President University/Cikarang	\N	\N
1248	 Cross Cultural Party 	Pensi	24  - 24 Mar 2018	10:00 - 21:00	Gedung G Universitas Dian Nuswantoro	\N	\N
1247	 Seminar Startup Digital 2018 dengan tema Create your masterpiece 	Seminar	09  - 09 Apr 2018	08:00 - 01:00	Sekolah Tinggi Teknologi Adisutjipto	\N	\N
1246	 CAPTIVATE X FINAL PROJECT D'VILLAGE 8TH EDITION 	Lain-lain	25  - 25 Mar 2018	10:00 - 00:00	Townsquare Surabaya	\N	\N
1245	 SEMINAR SIPIL EXPO 2018 	Seminar	28 Mar 2018 - 04 Apr 2018	08:00 - 05:00	universitas mercu buana	\N	\N
1244	 SEMINAR SIPIL EXPO 2018 	Seminar	27 Mar 2018 - 11 Apr 2018	08:00 - 05:00	universitas mercu buana	\N	\N
1243	  Training Leadership Sharia Economics Advancement  	Lain-lain	07  - 07 Apr 2018	07:00 - 11:00	2nd Floor Convention Hall UIN Sunan Kalijaga Yogyakarta 	\N	\N
1242	 DISKUSI PUBLIK 	Lain-lain	06 Apr 2018 - 06 Mar 2018	13:00 - 17:00	Convention Hall UIN Sunan Kalijaga	\N	\N
1241	 Seminar Internasional Sea -Suka 2018 	Seminar	05 Apr 2018 - 05 Mar 2018	08:00 - 12:00	Convention Hall UIN Sunan Kalijaga	\N	\N
1240	 SIPIL EXPO 2018 	Seminar	27 Mar 2018 - 04 Apr 2018	08:00 - 01:00	universitas mercu buana	\N	\N
1239	 Lomba Fotografi Nasional 2018 	Lain-lain	12 Mar 2018 - 12 Apr 2018	00:00 - 00:00	Seluruh Indonesia	\N	\N
1238	 Khatulistiwa Mining Fair 2018 	Lain-lain	13 Mar 2018 - 05 Apr 2018	00:00 - 23:55	Fakultas Teknik Untan	\N	\N
1237	 Musyawarah Wilayah Bidikmisi Jateng-DIY 2018 	Lain-lain	30 Mar 2018 - 01 Apr 2018	07:00 - 15:00	IAIN PURWOKERTO	\N	\N
1236	 Bangkit dan Bertahan 8 (BDB8) 	Musik	18  - 18 Mar 2018	09:00 - 10:00	STIE EKUITAS BANDUNG	\N	\N
1235	 There's Always Opportunity To Succes 	Seminar	11  - 11 Apr 2018	13:00 - 16:00	Universitas Esa Unggul Kebon Jeruk	\N	\N
1234	 Music Cover Competition 	Musik	27  - 28 Apr 2018	08:00 - 00:00	Auditorium UMK	\N	\N
1233	 Training ISO/IEC 17025:2017 	Lain-lain	27  - 27 Mar 2018	08:30 - 16:00	Auditorium Balitro	\N	\N
1232	 Bazaar Accounting Fair 2018 	Lain-lain	22  - 24 Mar 2018	10:00 - 18:00	Landmark Politeknik Negeri Jakarta	\N	\N
1231	 Book Fair Accounting Fair 2018 	Lain-lain	19  - 23 Mar 2018	09:00 - 17:00	Gedung Serba Guna Politeknik Negeri Jakarta 	\N	\N
1230	 Electro Charity Concert 	Pensi	24  - 24 Mar 2018	15:00 - 23:00	Lapangan Hitam Politeknik Negeri Semarang	\N	\N
1228	 Public Speaking Training 	Seminar	08  - 08 Apr 2018	08:00 - 12:00	Ruang Serba Guna Polines	\N	\N
1227	 service jimat motor 2018 	Lain-lain	26  - 27 Mar 2018	09:00 - 12:00	sekitar simpang 7 unnes gunungpati semarang	\N	\N
1226	 National Symposium 2018 	Seminar	25  - 25 Mar 2018	08:30 - 12:00	Gedung Robotika, Institut Teknologi Sepuluh Nopember (ITS), Surabaya	\N	\N
1225	 STAGE OF ARCHITECTURE - SEPEKAN ARSITEKTUR 2018 	Musik	21  - 21 Apr 2018	16:00 - 22:00	Kampus 2 UAJY 	\N	\N
1224	 GREATNESS!!! 	Lain-lain	17 Peb 2018 - 17 Mar 2018	19:00 - 19:00	Malang	\N	\N
1223	 FKIP DAYS 2018 SEMINAR ANTI KORUPSI DAN LOMBA AKUSTIK 	Seminar	06  - 07 Apr 2018	08:00 - 16:00	Lantai 8, Gedung Alawiyah Kampus Utama Universitas Islam As-syafi'iyah Jl. Raya Jatiwaringin No.12	\N	\N
1222	 Kapal Selam 2018 	Lain-lain	10  - 23 Mar 2018	00:00 - 00:00	Politeknik Negeri Jakarta	\N	\N
1221	 E - FEST 2018 (ENTREPRENEURSHIP FESTIVAL) 	Seminar	28  - 28 Mar 2018	08:00 - 01:00	Ruang E126 UKSW , Salatiga 	\N	\N
1219	 SILATURUPA (satukan aksentuasi budaya indonesia)  	Pensi	17 Apr 2018 - 19 Mar 2018	10:00 - 22:00	Universitas Esa Unggul	\N	\N
1218	 Festival Anak Sholeh #3 	Lain-lain	29  - 29 Apr 2018	07:00 - 18:00	Auditorium dan Masjid Universitas Slamet Riyadi	\N	\N
1216	 TRAINING LEGISLATIF 2018 	Seminar	21  - 21 Mar 2018	07:30 - 17:15	Ballroom Kemala Universitas Esa Unggul, Duri Kepa, Jakarta Barat.	\N	\N
1215	 Kesatuan Talkshow The Ethics 	Seminar	10  - 10 Mar 2018	08:00 - 11:00	STIE Kesatuan Bogor	\N	\N
1214	 Pharmaceutical Seminar UI 85 	Seminar	07  - 08 Apr 2018	07:00 - 17:30	Universitas Indonesia	\N	\N
1213	 Book Fair 2018 	Lain-lain	09  - 13 Apr 2018	08:00 - 16:00	Sasana Kreasi Universitas Mercu Buana	\N	\N
1212	 Pementasan Teater GEER 	Pensi	05  - 08 Apr 2018	19:30 - 23:00	Aula Madya Lt.2 UIN Syarif Hidayatullah Jakarta	\N	\N
1211	 SEADC 2018 (Student English Activity Debate Competition) 	Lain-lain	27  - 29 Apr 2018	07:30 - 17:00	Universitas Muhammadiyah Yogyakarta	\N	\N
1210	 KALAKELANA 	Lain-lain	12  - 14 Mar 2018	10:00 - 22:00	Mall Solo Paragon	\N	\N
1209	 Seminar Jeans 	Seminar	02  - 02 Apr 2018	07:30 - 13:00	Auditorium Lantai 7 Universitas Mercu Buana	\N	\N
1208	 Expressional  	Seminar	28  - 28 Apr 2018	10:00 - 14:00	kampus kwik kian gie school of Business 	\N	\N
1207	 INFORMATICS EVENT 2018 	Lain-lain	25  - 25 Mar 2018	07:00 - 12:00	Kampus Unissula Semarang 	\N	\N
1206	 Seminar Nasional Peluang Berkarir di Pasar Modal 	Seminar	20  - 20 Mar 2018	08:00 - 12:00	Auditorium Universitas Islam Negeri Sunan Ampel Surabaya	\N	\N
1205	 Entrepreneur Festival 2018 	Expo	27  - 28 Mar 2018	09:00 - 15:00	Parkir area perpustakaan UKSW	\N	\N
1204	 OCEANO 2018 	Lain-lain	24 Mar 2018 - 09 Apr 2018	07:00 - 20:00	DEPARTEMEN TEKNIK KELAUTAN INSTITUT TEKNOLOGI SEPULUH NOPEMBER	\N	\N
1203	 SEMINAR NASIONAL 	Seminar	23  - 23 Mar 2018	08:00 - 11:45	Auditorium Arifin Panigoro, Universitas Al-Azhar Indonesia.	\N	\N
1202	 seminar nasional 2018 	Seminar	24  - 24 Mar 2018	08:30 - 17:00	fave hotel MEX jalan pregolan No.1,3,5 Tegalsari Surabaya 	\N	\N
1201	 Inovasi Teknologi Membangun Mahasiswa Berkemajuan 	Seminar	25  - 25 Mar 2018	08:00 - 12:00	Jl. HM.Ridwan Gelam No.250, Gelam, Candi, Kabupaten Sidoarjo, Jawa Timur 61271 	\N	\N
1200	 Ecoweek 2018 	Lain-lain	07  - 09 Mei 2018	07:00 - 05:00	Fakultas Ekonomi Unissula	\N	\N
1198	 RUN FOR CANCER 2018 	Sport	08  - 08 Apr 2018	05:00 - 11:00	PARK RIDE 10 THAMRIN	\N	\N
1197	 Techno Fair 2018 	Seminar	20  - 23 Mar 2018	08:00 - 04:00	Universitas Gunadarma 	\N	\N
1196	 Relawan Social Designee April 2018 	Lain-lain	07  - 28 Apr 2018	12:00 - 17:00	Kampung Carang Pulang 1, Medang, Bojong Gintung dan lain-lain	\N	\N
1195	 Parahyangan National Accounting Challenge (PNAC) 2018 	Lain-lain	09  - 11 Apr 2018	07:00 - 16:00	Aula Fakultas Ekonomi Universitas Katolik Parahyangan	\N	\N
1194	 Closing Ceremony 	Musik	24  - 24 Mar 2018	00:00 - 00:00	Parikir Selatan, St Manahan	\N	\N
1193	 Perbanas Innovative Seminar 2018 	Seminar	07  - 07 Mar 2018	09:00 - 16:00	Auditorium Unit 3 Perbanas Institute, Lt 1 Unit 3.	\N	\N
1192	 SPARTA LEAGUE 	Sport	27 Apr 2018 - 21 Mei 2018	14:00 - 22:00	GOR Bima Sakti	\N	\N
1191	 REPLAY - Reuni Akbar Desain Interior ISI Yogyakarta 	Seminar	24  - 24 Mar 2018	08:00 - 04:30	Gedung Serbaguna ISI Yogyakarta	\N	\N
1190	 Lomba Fotografi 2018 	Lain-lain	28 Jan 2018 - 21 Mar 2018	07:00 - 17:00	Universitas Islam Sultan Agung	\N	\N
1189	 National Business Plan Competition 	Lain-lain	26 Jan 2018 - 29 Mar 2018	07:00 - 17:00	Universitas Islam Sultan Agung	\N	\N
1188	 LA SEMAINE FRANÃ‡AISE 	Pensi	12  - 16 Mar 2018	09:00 - 16:00	Kampus A Universitas Negeri Jakarta	\N	\N
1185	 NEON (National English Competition) 2018 	Lain-lain	27  - 29 Apr 2018	08:00 - 16:00	Universitas Tarumanagara Kampus 1	\N	\N
1184	 SEMINAR NASIONAL GEMA TEKNOLOGI 2018 	Seminar	05  - 05 Apr 2018	08:00 - 13:00	AUDITORIUM MOH. DJAZMAN (KAMPUS 1 UNIVERSITAS MUHAMMADIYAH SURAKARTA)	\N	\N
1183	 Pekan Raya Akuntansi 	Lain-lain	29  - 29 Mar 2018	08:00 - 00:00	Lapangan Hitam TN Polines	\N	\N
1182	 Festival puisi dan tari kreasi 	Lain-lain	22  - 23 Mar 2018	07:00 - 15:00	Auditorium UIN Sunan Ampel Surabaya	\N	\N
1181	 BEASISWA SMA/ SMK 2018 	Lain-lain	01  - 31 Mar 2018	00:00 - 00:00	Indonesia	\N	\N
1180	 Vlog Competition 	Lain-lain	01  - 31 Mar 2018	20:00 - 23:55	Universitas Bakrie, Kuningan	\N	\N
1179	 Lomba Esai Online Nasional 	Lain-lain	01 Mar 2018 - 01 Apr 2018	00:00 - 00:00	Online	\N	\N
1178	 Seminar nasional gizi 2018 	Seminar	14  - 14 Apr 2018	07:00 - 14:00	Hotel santika cirebon	\N	\N
1177	 ETICS (Ekuitas Creative Economics Week) 	Seminar	22  - 22 Mar 2018	08:00 - 15:00	Kampus Ekuitas Bandung	\N	\N
1176	 D'Jota Games 2018 	Lain-lain	01 Mar 2018 - 25 Apr 2018	00:00 - 00:58	Institut Bisnis dan Informatika Stikom Surabaya	\N	\N
1175	 ðŸ“£CIVIL EXPO 2018 : SEMINAR NASIONAL 	Seminar	24  - 24 Mar 2018	08:00 - 14:00	Aula Fakultas Teknik Universitas Pancasila	\N	\N
1173	 Spectaxcular color run 	Lain-lain	04  - 04 Mar 2018	06:00 - 00:00	CFD ALAM SUTERA	\N	\N
1172	 Seminar Kesehatan dan Keselamatan Kerja 	Seminar	09  - 09 Mar 2018	01:00 - 17:00	Ruang 811, Universitas Esa Unggul	\N	\N
1171	 BOREYES International Energy Fair 2018 	Seminar	08  - 08 Mar 2018	08:30 - 15:00	Graha Sanusi Hardjadinata, Universitas Padjadjaran Dipatiukur	\N	\N
1170	 NATIONAL ESSAY COMPETITION (NEC) 2018 	Lain-lain	13  - 15 Apr 2018	07:00 - 16:00	Universitas Mataram	\N	\N
1169	 Accounting Competition Jeans 2018 	Lain-lain	11  - 11 Apr 2018	07:00 - 16:00	Aula Rektorat Universitas Mercu Buana	\N	\N
1168	 Seminar Kesehatan Nasional 	Seminar	08  - 08 Apr 2018	07:00 - 15:00	Hotel The Royale Krakatau	\N	\N
1167	 Seminar Keprofesian dan Nutritionist Talk 	Seminar	18  - 18 Mar 2018	07:30 - 13:00	Auditorium GMSK, Institut Pertanian Bogor	\N	\N
1166	 SEMINAR NASIONAL AGROEKOTEKNOLOGI 2018 	Seminar	07  - 07 Apr 2018	08:00 - 17:30	FAKULTAS PERTANIAN UNIVERSITAS LAMBUNG MANGKURAT	\N	\N
1165	 Gita Narapraya: Pre-Competition Concert  The 54th Montreux Choral Festival 	Musik	18 Mar 2018 - 18 Peb 2018	19:00 - 21:30	Gedung Aula Simfonia Jakarta	\N	\N
1164	 Maven 2018 	Lain-lain	07  - 07 Apr 2018	07:30 - 16:10	Universitas Katolik Widya Mandala Surabaya, Jl. Dinoyo 42-44 Surabaya (di ruangan 	\N	\N
1163	 Masoem University Cup 	Sport	21 Apr 2018 - 12 Mei 2018	07:00 - 17:00	Kampus STKOM-STIBANKS Al Masoem	\N	\N
1162	 Expo Pandawa  	Expo	25 Mar 2018 - 26 Des 2017	08:00 - 10:00	Politeknik Negeri Semarang	\N	\N
1161	 Workshop Videography 	Lain-lain	24  - 24 Mar 2018	08:00 - 16:00	Ruang Teater Barat Lt. 1, Kampus Pakuwon City Universitas Widya Mandala Surabaya	\N	\N
1160	 Bangkit dan Bertahan 8 (BDB8) 	Musik	18 Mar 2018 - 18 Peb 2018	09:00 - 23:00	Jl PHH Mustofa No 31 Bandung	\N	\N
1159	 FESTIVAL KAMPOENG 64 	Pensi	21  - 21 Apr 2018	14:00 - 22:00	Museum Purna Bhakti - TMII	\N	\N
1158	 Perbanas Cooperative Fair XVII (PCF XVII) 	Lain-lain	26 Peb 2018 - 04 Mar 2018	09:00 - 17:00	Perbanas Institute	\N	\N
1157	 UPI CHALLENGE National Taekwondo Tournament 	Sport	04  - 06 Mei 2018	08:00 - 17:00	Gymnasium, UPI Bandung.	\N	\N
1149	 11 MARET GLOW RUN (disc 10%) 	Sport	10  - 10 Mar 2018	19:00 - 22:00	Halaman Rektorat UNS	\N	\N
1148	 Sosialisasi dan Debat Terbuka Pilgub Jawa Barat 2018 	Lain-lain	26  - 26 Des 2017	13:00 - 18:00	Gedung Ahmad Sanusi (BPU) Universitas Pendidikan Indonesia	\N	\N
1147	 ITS OPEN 2018 	Sport	16  - 20 Apr 2018	18:30 - 22:30	GOR Bulu Tangkis ITS 	\N	\N
1146	 Lomba Kabaret Coolture - Psyfest 	Pensi	06  - 06 Mei 2018	15:00 - 21:00	Teater Tertutup Dago Tea House	\N	\N
1145	 Lomba Film Pendek Coolture - Psyfest 	Lain-lain	06  - 06 Mei 2018	15:00 - 21:00	Teater Tertutup Dago Tea House	\N	\N
1144	 Lomba Band Coolture - Psyfest 	Musik	06  - 06 Mei 2018	15:00 - 21:00	Teater Tertutup Dago Tea House	\N	\N
1143	 Festival Engineering and Technology 1.0 ( FETO 1.0) 	Lain-lain	14  - 14 Apr 2018	08:00 - 15:30	Sampoerna University, L'avenue	\N	\N
1142	 Tabligh Akbar 1439H 	Lain-lain	20  - 20 Apr 2018	12:00 - 17:30	Ruang Auditorium Sekolah Tinggi Pariwisata Trisakti	\N	\N
1141	 UGM PRESS HADIR DI PESTA BUKU BANDUNG 2018 	Lain-lain	01  - 07 Mar 2018	09:00 - 21:00	Landmark Convention Hall, Jalan Braga 129 Bandung. Stand no. 25-26.	\N	\N
1140	 AGORAPHOBIA : FRIGHTMARE RUN 	Sport	24  - 24 Mar 2018	16:00 - 22:00	Fakultas Kedokteran Universitas Airlangga ( Kampus A ) Jalan Mayjend Prof. Dr. Moestopo no.47	\N	\N
1139	 The 5th Seismograf 	Lain-lain	07  - 07 Apr 2018	08:00 - 18:00	UIN SYARIF HIDAYATULLAH JAKARTA 	\N	\N
1138	 Enjoy 8 Art Of Business 	Seminar	28 Peb 2018 - 01 Mar 2018	09:30 - 12:00	Gedung Serba Guna Universitas Widyatama	\N	\N
1137	 Sipil Expo 2018 	Expo	28 Mar 2018 - 05 Apr 2018	08:00 - 18:00	Universitas Mercu Buana	\N	\N
1136	 SCHOLARSHIP CAMPUS EXPO 2018 	Expo	28  - 28 Apr 2018	09:00 - 23:00	Gor Sritex Arena Solo	\N	\N
1135	 Education & Training Expo 2018 	Expo	22  - 25 Des 2017	09:00 - 19:00	Jakarta Convention Center, Senayan	\N	\N
1134	 DISKUSI BULANAN : MEMBANGUN GENERASI TOLERAN RAHMATAN LIL 'ALAMAIN 	Seminar	27  - 27 Des 2017	08:00 - 12:00	UNI Club UIN Syarif Hidayatullah Jakarta	\N	\N
1133	 Kajian Bersama Ustadz Hanan Attaki 	Seminar	05  - 05 Mar 2018	07:00 - 12:00	auditorium universitas negeri semarang	\N	\N
1132	 Forum Silaturahmi dan Seminar Motivasi 2018 	Seminar	24  - 24 Peb 2018	08:00 - 18:00	RKU 2 Universitas Syiah Kuala	\N	\N
1131	 GS FAME IELTS Preparation Program 	Lain-lain	12 Mar 2018 - 13 Apr 2018	19:00 - 21:00	GS FAME Campus, Jl. Pulo Mas Timur 3A Blok A No. 2, Kayu Putih - Jakarta Timur	\N	\N
1130	 Education & Training Expo 2018 	Expo	22  - 25 Des 2017	09:00 - 19:00	Jakarta Convention Center, Senayan	\N	\N
1129	 Ganesha Film Festival 2018 	Lain-lain	23  - 25 Peb 2018	09:00 - 22:00	Kampus ITB - Bandung Creative Hub - Alun-Alun Cicendo	\N	\N
1128	 GALAKSIAR 2018 	Seminar	31 Mar 2018 - 01 Apr 2018	07:00 - 03:00	Ruang Serba Guna Politeknik Negeri Semarang	\N	\N
1127	 NATIONAL TALK DAY 2018 	Seminar	01  - 01 Mar 2018	08:30 - 14:00	BALAIRUNG UKSW	\N	\N
1126	 lomba robotik se jawa barat 	Lain-lain	28  - 29 Apr 2018	19:00 - 17:00	kampus universitas nusa putra sukabumi	\N	\N
1125	 LOMBA RANCANG JEMBATAN 	Expo	28 Mar 2018 - 06 Apr 2018	08:00 - 17:00	universitas mercu buana	\N	\N
1124	 LOMBA INOVASI BETON 	Expo	28 Mar 2018 - 06 Apr 2018	08:00 - 17:00	universitas mercu buana	\N	\N
1123	 SEMINAR NASIONAL ART OF CINEMATOGRAPHY 	Seminar	04  - 04 Mar 2018	08:00 - 01:00	Hotel apita grand tower 	\N	\N
1122	 Informatic Festival and Competition (INVENTION) 2018 	Lain-lain	11  - 11 Mei 2018	09:00 - 16:00	Institute for Peace and Democracy (IPD) Universitas Udayana, Jl. Prabu Udayana No.100 Jimbaran, Bali	\N	\N
1121	 Management Fair 2018 	Sport	05  - 23 Mar 2018	07:00 - 21:00	Universitas Pancasila	\N	\N
1120	 INDUSTRIAL SCIENCE ART AND TALENT ( I-SAT ) VII - LOMBA FOTOGRAFI 	Lain-lain	08 Des 2017 - 01 Mar 2018	00:00 - 00:00	Banda Aceh	\N	\N
1119	 Industrial Science Art and Talent ( I-SAT ) VII - Lomba Menulis Opini (Essay) 	Lain-lain	08 Des 2017 - 01 Mar 2018	00:00 - 00:00	Pelajar / Mahasiswa di Seluruh Indonesia	\N	\N
1118	 LOKAPARMA II KSR PMI UNIT IX UMY 	Lain-lain	18  - 18 Mar 2018	05:00 - 18:00	Kampus Terpadu UMY	\N	\N
1117	 Kompetisi Matematika MAN 1 Makassar (KOM1K) Vol. II 	Lain-lain	24  - 25 Des 2017	08:00 - 15:00	Kampus MAN 1 Makassar	\N	\N
1116	 Widyatama Informatics Festival (WIFi) 2018  Ubiquitous Computing 	Seminar	03  - 03 Mar 2018	08:00 - 17:00	Gedung Serba Guna Universitas Widyatama	\N	\N
1115	 SEMINAR NASIONAL BAHASA ARAB MAHASISWA II 	Seminar	28  - 28 Apr 2018	07:00 - 05:00	Gedung AVA e6, Lantai 2, Fakultas Sastra Universitas Negeri Malang	\N	\N
1114	 SemNas & Workshop Big Data 2018  	Seminar	10  - 10 Mar 2018	08:00 - 03:00	Hotel Gowongan Inn, Yogyakarta	\N	\N
1113	 Profit 2k18 	Seminar	24  - 24 Peb 2018	08:00 - 14:00	Auditorium Ar-Rahiim Lt.12 Universitas YARSI	\N	\N
1112	 KALBIS ISLAMIC FESTIVAL 	Lain-lain	12  - 14 Mar 2018	08:00 - 14:00	KALBIS Institute	\N	\N
1111	 TE AMO Seminar and Talkshow 	Seminar	23  - 23 Des 2017	13:00 - 17:00	Universitas Katolik Atma Jaya Indonesia Kampus 3 BSD. Aula Lt. 8	\N	\N
1110	 ChEERS 2018 	Lain-lain	04  - 06 Apr 2018	07:00 - 21:00	FT Universitas Riau 	\N	\N
1109	 FESTIVAL KARMANY SMANSA X 	Pensi	23  - 24 Des 2017	04:00 - 22:00	SMA NEGERI 1 DENPASAR	\N	\N
1108	 Closing Ceremony 	Musik	24  - 24 Mar 2018	00:00 - 00:00	Parikir Selatan, St Manahan	\N	\N
1107	 Create Your Own E-Commerce and How To Protect IT From Cybercrime 	Seminar	24  - 24 Mar 2018	08:00 - 01:30	Jl. Jenderal Sudirman, Babakan, Kec. Tangerang, Kota Tangerang, Banten 15117	\N	\N
1106	 Ma Chung English Week 	Lain-lain	06  - 08 Apr 2018	13:00 - 19:00	Ma Chung University (Villa Puncak Tidar N-01, Malang 65151, East Java, Indonesia)	\N	\N
1105	 Lomba Baris Berbaris Putra Dirgantara  	Lain-lain	01  - 01 Apr 2018	07:00 - 01:00	Landasan Pacu Jupiter Lanud Adisutjipto Yogyakarta	\N	\N
1104	 NATIONAL MANAGEMENT CONFERENCE 	Seminar	23  - 23 Peb 2018	14:00 - 17:00	Hotel Laras Asri	\N	\N
1102	 Kompetisi Esai IMABI 2018 	Lain-lain	09 Des 2017 - 05 Mar 2018	00:00 - 00:00	Universitas 17 Agustus 1945 surabaya	\N	\N
1101	 Seminar BUILD YOUR FUTURE WITH IT 	Seminar	07  - 10 Peb 2018	09:00 - 12:00	Universitas Gunadarma Depok (Kampus D), Kalimalang (Kampus J1), dan Cengkareng (Kampus L2)	\N	\N
1100	 DUBAFEST 2018 	Musik	15  - 15 Apr 2018	08:00 - 12:00	Sentra Niaga Kawasan The Park Mall	\N	\N
1099	 Pekan Seni Matematika XV se-Indonesia 	Lain-lain	25 Peb 2018 - 05 Mar 2018	08:00 - 17:00	Universitas Andalas	\N	\N
1098	 GS FAME Valentine's Give Away 	Lain-lain	14  - 18 Peb 2018	12:00 - 00:00	GS FAME Campus, Jl. Pulo Mas Timur 3A Blok A No. 2, Kayu Putih - Jakarta Timur	\N	\N
1097	 BARONAS (Lomba Robot Nasional) 	Lain-lain	31 Mar 2018 - 01 Apr 2018	08:00 - 17:00	Gedung Robotika ITS	\N	\N
1096	 JOBFAIR UAJY 2018 	Bursa Kerja	09  - 10 Mar 2018	08:00 - 16:00	Auditorium Kampus 2 Universitas Atma Jaya Yogyakarta, Lt.3 Gedung St. Thomas Aquinas, Babarsari	\N	\N
1095	 Seminar 2018 	Seminar	24  - 24 Mar 2018	09:00 - 13:30	Ruang Serbaguna Hidrolika Kampus 1 ITN Malang	\N	\N
1094	 Civin National Expo 2018 	Lain-lain	14 Peb 2018 - 10 Mar 2018	00:00 - 13:01	Universitas Tarumanagra	\N	\N
1093	 National Seminar 2018 	Seminar	01  - 01 Mar 2018	08:45 - 17:30	Harris Hotel & Conventions Ciumbuleuit	\N	\N
1092	 Magha Puja 2561 B.E. / 2018 	Lain-lain	11  - 11 Mar 2018	13:00 - 18:00	Auditorium Lantai 4, Kampus Anggrek, BINUS University	\N	\N
1091	 Lomba dan Seminar Matematika ke-26 	Seminar	17  - 17 Peb 2018	07:30 - 03:30	Ruang Sidang Utama Universitas Negeri Yogyakarta	\N	\N
1090	 KOMPETISI DEBAT EKONOMI 	Lain-lain	24  - 24 Peb 2018	08:00 - 16:00	Universitas Setia Budi	\N	\N
1089	 SEMINAR NASIONAL MULTIMEDIA ARTS OF CINEMATOGRAPHY 	Seminar	04  - 04 Mar 2018	09:00 - 13:00	Apita grand hotel tower	\N	\N
1088	 RWrC#5 2018 	Lain-lain	03 Peb 2018 - 29 Apr 2018	00:00 - 17:00	Universitas Negeri Yogyakarta	\N	\N
1087	 Kelas Sertifikasi Nasional NeoNLP Practitioner 	Seminar	16  - 17 Des 2017	08:30 - 17:00	Pose In Hotel Surakarta	\N	\N
1086	 Workshop NeoNLP Practitioner 	Seminar	16  - 17 Des 2017	08:30 - 17:00	Pose In Hotel Surakarta	\N	\N
1085	 Methamorfosa23 	Seminar	03  - 03 Mar 2018	07:30 - 12:00	Gedung Mandala Bhakti Wanitatama	\N	\N
1083	 JINGLE COMPETITION 	Musik	22  - 24 Peb 2018	08:00 - 17:00	Fakultas Teknik gedung B, Universitas Dian Nuswantoro.	\N	\N
1082	 Lomba Fotografi dan Poster 	Lain-lain	29 Jan 2018 - 10 Mar 2018	00:00 - 23:55	Universitas Negeri Yogyakarta	\N	\N
1081	 sipil expo 2018 	Sport	28 Mar 2018 - 06 Apr 2018	08:00 - 17:00	universitas mercu buana	\N	\N
1080	 Lomba Cerdas Cermat Psikologi SMA/SMK Sederajat 	Lain-lain	17  - 17 Mar 2018	07:00 - 16:00	Universitas Negeri Yogyakarta	\N	\N
1079	 NICE of RICE 2018 (National Conference of Research and Innovation Call for Paper) 	Lain-lain	03  - 06 Mei 2018	07:00 - 21:00	Universitas Muhammadiyah Malang	\N	\N
1078	 Training Public Speaking 2018 	Seminar	10  - 11 Des 2017	09:00 - 16:00	Aula Otto Iskandar Dinata Kampus IV UNPAS Bandung	\N	\N
1077	 Scifi neutron 2018 	Seminar	11 Mar 2018 - 11 Peb 2018	07:00 - 16:00	Universitas terbuka convention center	\N	\N
1076	 Industrial Futsal Competition 	Sport	15  - 17 Mar 2018	09:00 - 17:00	Institut Teknologi Indonesia	\N	\N
1075	 Industrial Band Competition 	Musik	17  - 17 Mar 2018	09:00 - 17:00	Institut Teknologi Indonesia	\N	\N
1074	 Workshop & Competition CAPSIM ( CAPABILITY SIMULATION) 	Seminar	15  - 16 Mar 2018	08:30 - 15:00	Institut Teknologi Indonesia	\N	\N
1073	 Industrial Expo 	Expo	22  - 24 Mar 2018	08:00 - 17:00	Institut Teknologi Indonesia	\N	\N
1072	 Talkshow Entrepreneurship 	Lain-lain	24  - 24 Peb 2018	07:00 - 13:00	Auditorium lantai 4, Kampus A UHAMKA Limau	\N	\N
1071	 LAWFEST JOURNEY 	Musik	21  - 21 Apr 2018	16:00 - 22:00	South Parking Area Of Manahan, Solo	\N	\N
1070	 English Festifal 	Lain-lain	24  - 25 Peb 2018	08:00 - 15:00	Universitas Muhammdiyah Surabaya jl.Sutorejo no.59 Surabaya	\N	\N
1068	 Seminar Kewirausahaan dan Koperasi 	Seminar	24  - 24 Peb 2018	08:00 - 13:00	Universitas Ma Chung (Villa Puncak Tidar N-01)	\N	\N
1067	 Relawan Social Designee Maret 2018 	Lain-lain	02  - 31 Mar 2018	12:00 - 05:00	Kampung Carang Pulang 1, Rawa Buaya, Medang, dan lain-lain	\N	\N
1063	 DENTAL PROJECT 2018 : RUNNATION 	Sport	11  - 11 Mar 2018	06:00 - 12:00	Km 0 Yogyakarta	\N	\N
1062	 SAATNYA JADI PENGUSAHA 	Seminar	10  - 10 Peb 2018	08:00 - 12:00	Gedung Sasana Krida (Mangkubumen)	\N	\N
1061	 Mesin Bersatu 14 (MB XIV) 	Lain-lain	22  - 24 Mar 2018	08:00 - 22:00	Universitas islam 45 bekasi	\N	\N
1060	 RNC (Robovaganza National Competition) 2018 	Lain-lain	23  - 24 Mar 2018	08:00 - 16:00	Selasar Gd. Thomas Aquinas Universitas Katolik Soegijaparanata Semarang	\N	\N
1058	 Seminar Nasional dan Workshop 	Seminar	25  - 25 Peb 2017	07:00 - 17:00	Hotel Red Chilies Solo	\N	\N
1057	 Student accounting competition 	Lain-lain	23  - 24 Peb 2018	15:00 - 16:00	Politeknik Wilmar Bisnis Indonesia	\N	\N
1056	 Student Entrepreneurship Award 	Lain-lain	16  - 19 Apr 2018	08:00 - 15:00	Universitas Andalas	\N	\N
1055	 Indonesian Student Entrepreneurship Award 	Lain-lain	09  - 12 Apr 2018	08:00 - 15:00	Universitas Andalas	\N	\N
1054	 Industrial Engineering on Action 	Lain-lain	23  - 26 Apr 2018	08:00 - 15:00	Universitas Andalas	\N	\N
1053	 FIA UNKRIS MENGABDI 	Lain-lain	12  - 14 Peb 2018	08:00 - 00:00	Klari	\N	\N
1052	 Design Competition 	Lain-lain	01  - 01 Mar 2018	08:00 - 14:30	Kampus 1 Univeritas Respati Yogyakarta	\N	\N
1051	 Fasih Law Fair 2018 	Lain-lain	24  - 24 Mar 2018	07:00 - 16:00	IAIN Tulungagung	\N	\N
1050	 NETWORK 2018 	Lain-lain	28  - 28 Peb 2018	08:00 - 14:00	Balairung Utama Universitas Kristen Satya Wacana	\N	\N
1049	 STPI AVIATION RUN 	Sport	07  - 07 Apr 2018	05:00 - 10:00	Sekolah Tinggi Penerbangan Indonesia	\N	\N
1048	 Green Scientific Competition 2018 	Lain-lain	11  - 20 Mei 2018	19:00 - 22:00	Universitas Negeri Semarang	\N	\N
1047	 The 16th FEB UI CUP  	Sport	14  - 28 Apr 2018	08:00 - 19:00	GOR Ciracas 	\N	\N
1046	 WORKSHOP ROAD TO JRC 9 	Lain-lain	24  - 25 Des 2017	08:00 - 17:00	Politeknik Elektronika Negeri Surabaya	\N	\N
1045	 SEMINAR PROFESI AKUNTANSI  	Seminar	24  - 24 Peb 2018	07:30 - 13:00	STIE AUB SURAKARTA 	\N	\N
1044	 MANAGEMENT COMPETITION 2018 	Lain-lain	05 Peb 2018 - 12 Apr 2018	07:00 - 17:00	Auditorium Prof. Harun Zein Universitas Mercu Buana	\N	\N
1042	 Java Robot Contest IX 	Lain-lain	24  - 25 Mar 2018	08:00 - 18:00	Politeknik Elektronika Negeri Surabaya	\N	\N
1041	 nusantara festival manajemen 	Seminar	21  - 22 Mar 2018	10:00 - 22:00	Institut bisnis nusantara	\N	\N
1040	 WISE Widyatama 2018  	Seminar	29 Jan 2018 - 17 Peb 2017	08:00 - 15:30	GSG Universitas Widyatama	\N	\N
1039	 D'COMFAIR 2018(FAM) 	Lain-lain	17  - 17 Peb 2017	07:00 - 12:00	SMA N 8 YOGYAKARTA	\N	\N
1038	 D'COMFAIR 2018(KAB) 	Lain-lain	03  - 04 Peb 2018	07:00 - 15:30	SMA N 8 YOGYAKARTA	\N	\N
1037	 Kalijaga Inovation and Research Competitions 3 	Seminar	25  - 25 Des 2017	07:00 - 13:00	Gedung Prof. RHA. Seonarjo (Lantai 1 Convention Hall) UIN Sunan Kalijaga  	\N	\N
1036	 Lomba Jingle 	Expo	11  - 15 Peb 2018	06:30 - 18:00	Universitas Dian Nuswantoro	\N	\N
1035	 Seminar Nasional Rebranding Usaha - Membangun Usaha dengan Konsep Kekinian di Era Digital 	Seminar	24  - 24 Peb 2018	08:00 - 12:30	Gedung F - FKIP UNS	\N	\N
1034	 Video Competition 	Lain-lain	17  - 21 Apr 2018	08:00 - 16:00	Universitas Gunadarma	\N	\N
1033	 National Islamic Economic Olympiad 	Lain-lain	17  - 21 Apr 2018	08:00 - 16:00	Universitas Gunadarma	\N	\N
1032	 La Petite France 2018 	Lain-lain	07  - 08 Peb 2018	09:00 - 17:00	Lantai Merah Kampus STBA YAPARI-ABA Bandung	\N	\N
1031	 Magelang Education Fair 	Expo	28  - 28 Jan 2018	08:00 - 15:00	Gor Gemilang	\N	\N
1030	 Kompetisi KOMPAK (Komunikasi, Peka, Aktif, & Kreatif) 	Seminar	29 Jan 2018 - 09 Mar 2018	08:00 - 16:00	Kampus A UHAMKA, Jl.Limau II Kebayoran Baru, Jakarta Selatan	\N	\N
1029	 Youth Futsal League (YFL) Competition 	Sport	16  - 24 Apr 2018	08:00 - 21:00	GOR Internasional Futsal UNESA	\N	\N
1028	 Konservasi Mangrove 	Lain-lain	04  - 04 Mar 2017	08:00 - 01:00	Pantai Baros	\N	\N
1027	 THE 3rd NATIONAL BUSINESS PLAN COMPETITION (NBPC 2018) 	Expo	04  - 05 Apr 2018	08:00 - 15:00	Universitas Muhammadiyah Yogyakarta	\N	\N
1026	 ðŸŽ“The 2nd International Student Conference on Management and Business Studies (ISCOMBUS 2018) 	Seminar	29  - 30 Mar 2018	08:00 - 17:00	Universitas Muhammadiyah Yogyakarta	\N	\N
1025	 LOMBA ESAI NASIONAL KPM UNJ 2018 	Lain-lain	20 Jan 2018 - 20 Peb 2018	00:00 - 00:00	Jakarta	\N	\N
1024	 SEMINAR NASIONAL FARMAKOSENA 2018  	Seminar	20 Jan 2018 - 20 Mar 2018	07:00 - 13:45	Ballroom Hotel Asri Plaza	\N	\N
1023	 BINA SEKOLAH INDONESIA 	Lain-lain	25 Peb 2018 - 04 Mar 2018	06:00 - 17:00	SDN Santang.dsn.galian,patimban,pusakanagara	\N	\N
1022	 Soccer Robot Competition 	Lain-lain	04  - 10 Mar 2018	00:00 - 00:00	UGM	\N	\N
1021	 Rescue Robot Competition 	Lain-lain	04  - 11 Mar 2018	00:00 - 00:00	UGM	\N	\N
1020	 Internet Of Things Development Competition 	Lain-lain	04 Peb 2018 - 01 Mar 2018	00:00 - 00:00	UGM	\N	\N
1019	 Speed Has Limits, But Being A Winner Never Be Limited 	Lain-lain	11  - 11 Mar 2018	00:00 - 00:00	AULA Teknik GKB 3	\N	\N
1018	 SEISHUN MATSURI 2018 	Musik	11  - 11 Peb 2018	00:00 - 00:00	Kampus B Unindra Gedong	\N	\N
1017	 RUN IT by Prasmul Olympics 	Sport	18  - 18 Mar 2018	06:00 - 08:30	Universitas Prasetiya Mulya, BSD Campus	\N	\N
1016	 Focus Group Discussion  â€œKompetensi Mahasiswa Hukum Universitas Terbuka Dalam Era Kebangkitan Hukum 	Seminar	25  - 25 Peb 2018	08:00 - 13:00	Ruang Auditorium ( Serba Guna ) FMIPA  UT, Jalan Cabe Raya, Pondok Cabe Pamulang Tangerang 	\N	\N
1015	 Seminar Nasional Teknik Mesin 2018 ( STT Texmaco Subang Dan IKAME POLMAN PMS-ITB ) Link Pendaftaran : bit.ly/2BbOKac 	Seminar	28  - 28 Apr 2018	09:00 - 16:00	Prime Plaza Hotel Purwakarta	\N	\N
1014	 Beatles and Rock n Roll - Memorable music festivals of the 60s and 70s! 	Musik	26  - 26 Jan 2018	20:00 - 23:00	Panglima Polim IX No.93 Jaksel	\N	\N
1013	 PRASASTI (Prepare With Sebelas Maret University) Try Out SBMPTN & Festival Seni dan Budaya Sukoharjo 	Lain-lain	11  - 11 Peb 2018	07:00 - 16:00	Sekolah Menengah Atas Negeri 3 Sukoharjo	\N	\N
1012	 PRASASTI #2 (Prepare With Sebelas Maret University) Futsal Competition 	Sport	02  - 04 Peb 2018	09:00 - 16:00	Gelanggang Olahraga (GOR) Giri Mandala Wonogiri	\N	\N
1011	 Management Competition in Tourism 2018 	Lain-lain	20  - 21 Apr 2018	11:00 - 21:00	Universitas Sanata Dharma	\N	\N
1010	 AN Masuk Desa Chapter 2 	Lain-lain	27 Jan 2018 - 05 Des 2017	06:00 - 00:00	Desa Sukaresmi	\N	\N
1009	 WE Culture Festival 	Lain-lain	03  - 03 Des 2017	09:00 - 17:00	STISIP Widuri Jl. Palmerah Barat No.353, RT.3/RW.5, Grogol Utara, Kebayoran Lama	\N	\N
1007	 Seminar Nasional Pertemuan Ilmiah Tahunan II Kesehatan Masyarakat 	Seminar	03  - 03 Peb 2018	08:00 - 16:00	Fakultas Kedokteran dan Kesehatan Universitas Muhammadiyah	\N	\N
1006	 English School Competition 9 	Lain-lain	18  - 18 Des 2017	07:00 - 13:00	Jl. Sersan Suharmadji No. 38, Kediri. UNISKA KEDIRI	\N	\N
1005	 Gelar Karya Simulasi Angkatan 13 STMM MMTC Airo Media 	Lain-lain	23  - 25 Jan 2018	12:00 - 16:00	STMM MMTC	\N	\N
1004	 TECHNO SPORT CUP 2018 	Sport	12  - 16 Mar 2018	15:00 - 19:00	Lapaangan Lt.5 Universitas YARSI	\N	\N
1003	 COLORFUL MUSIC (FESTIVAL BAND PELAJAR)  	Musik	28  - 28 Des 2017	07:30 - 17:00	Auditorium Universitas Bangun Nusantara Sukoharjo 	\N	\N
1002	 Islamic Education Fair 	Lain-lain	01  - 04 Mar 2018	08:00 - 03:00	Universitas Pendidikan Indonesia	\N	\N
1001	 GemetaRun 	Lain-lain	05  - 05 Mei 2018	15:30 - 21:00	Universitas Katolik Indonesia Atma Jaya Kampus BSD	\N	\N
1000	 Seminar Nasional Kesehatan Masyarakat 	Seminar	03  - 03 Des 2017	08:00 - 13:00	Auditorium FKK Univ. Muhammadiyah Jakarta	\N	\N
999	 Ekuitas Accounting Day (Accounting Competition) 	Lain-lain	10  - 10 Peb 2018	07:30 - 17:00	Aula STIE EKUITAS BANDUNG	\N	\N
998	 TECHNO SPORT CUP 2018 	Sport	12  - 16 Mar 2018	15:00 - 19:00	Lapangan lt.5 Universitas YARSI  	\N	\N
997	 FORMAKA EXPO CAMPUS 2018 	Expo	03  - 04 Peb 2018	09:00 - 15:00	Gor Nyi Ageng Karang (Gor Mini Karanganyar)	\N	\N
995	 INDUSTRIAL CAD COMPETITION 	Lain-lain	22  - 24 Des 2017	08:00 - 16:00	UNIVERSITAS DIAN NUSWANTORO	\N	\N
994	 NESCO 2018 (National Electrical Power System Competition) 	Lain-lain	05  - 06 Mei 2018	06:30 - 15:30	Ruang Sekarjagad Hotel MM UGM	\N	\N
993	 Pekan Raya Sejarah (Olimpiade Sejarah) 	Lain-lain	14  - 15 Mar 2018	08:09 - 16:00	Universitas Pendidikan Indonesia	\N	\N
992	 LKTIN 2018 	Lain-lain	08  - 24 Jan 2018	08:00 - 14:00	Universitas Internasional Semen Indonesia 	\N	\N
989	 Business Administration Festival 	Lain-lain	23  - 25 Apr 2018	08:00 - 18:00	Parkiran Umum, Politeknik Negeri Jakarta	\N	\N
988	 2nd SUMC UPH 2018 	Lain-lain	05  - 08 Peb 2018	13:00 - 20:00	Main Campus of Pelita Harapan University (UPH), Lippo Village - Karawaci, Tangerang	\N	\N
987	 Seminar Hacking is not always crime 	Seminar	03  - 03 Peb 2018	13:00 - 05:00	Universitas satya negara Indonesia bekasi	\N	\N
985	 SMANSASIBOY CHAMPIONSHIP 2018 KEJUARAAN PENCAK SILAT SD/MI SEDERAJAT DAN SMP/MTS  SEDERAJAT SEKABUPATEN BOYOLALI 	Sport	27  - 28 Jan 2018	07:00 - 17:00	SMA N 1 SIMO	\N	\N
984	 Coaching Clinic Futsal 2018 	Sport	24  - 24 Peb 2018	08:00 - 17:00	GOR Universitas PGRI Semarang	\N	\N
983	 UPGRIS Futsal League (UFL) 2018 	Sport	03  - 25 Mar 2018	08:05 - 05:30	GOR Universitas PGRI Semarang	\N	\N
982	 Lomba dan Seminar Nasional Matematika ke-26 	Seminar	17  - 17 Des 2017	07:30 - 03:00	Ruang Sidang Utama Universitas Negeri Yogyakarta	\N	\N
981	 IMSS 6th Scientific Project Competition  	Lain-lain	14 Des 2017 - 20 Jan 2018	00:00 - 23:55	Universitas YARSI	\N	\N
980	 OASIS Chapter 4 	Lain-lain	08 Jan 2018 - 27 Des 2017	09:00 - 15:00	Universitas Bakrie, Kawasan Rasuna Epicentrum, Jl. H.R.Rasuna Said Kav. C-22, Jakarta Selatan.	\N	\N
979	 Sebelas Maret Investment Championship 	Lain-lain	02  - 26 Des 2017	08:01 - 16:00	Surakarta	\N	\N
978	 TECHCOMFEST (TECHNOLOGY COMPUTER FESTIVAL) 2018 	Seminar	17  - 18 Mar 2018	07:00 - 22:00	POLITEKNIK NEGERI SEMARANG	\N	\N
977	 RAFFLESIA 2018 	Lain-lain	16  - 26 Jan 2018	02:00 - 13:00	Geopark Ciletuh	\N	\N
976	 Seminar, Talkshow, and Workshop SOFT SKILL AWARENESS 	Seminar	24  - 24 Peb 2018	09:00 - 15:00	Aula STIEPAR YAPARI AKTRIPA	\N	\N
975	 Alphaseismic 2018 	Lain-lain	19  - 24 Peb 2018	08:00 - 18:00	Al Kausar Boarding School, Jl. Habib, Babakan Jaya, Parung Kuda, Babakanjaya, Parung Kuda, Sukabumi,	\N	\N
973	 TENDER CUP 	Lain-lain	24  - 24 Mar 2018	07:00 - 12:00	Kampus ITS Manyar Jl. Menur no. 127 Surabaya 	\N	\N
972	 CINNERTION  	Lain-lain	24  - 24 Mar 2018	07:00 - 12:00	Kampus ITS Manyar Jl. Menur no. 127 Surabaya 	\N	\N
971	 Information Technology Competition 	Lain-lain	25  - 25 Jan 2018	07:00 - 15:00	Universitas Dian Nuswantoro Semarang	\N	\N
970	 LSPR PAC FESTIVAL 	Lain-lain	05  - 05 Peb 2018	18:00 - 22:00	Kampus LSPR jakarta/ sudirman park	\N	\N
969	 We care we share 	Seminar	18  - 18 Jan 2018	13:00 - 15:00	Marvell City lt 3 (Depan CGV)	\N	\N
968	 Anniversary Popeys ke 8th 	Lain-lain	20  - 20 Jan 2018	19:00 - 23:00	Auditorium Politeknik Pos Indonesia	\N	\N
967	 Artech - Future Art & Technology for Sustaining Smart Cities 	Expo	26 Des 2017 - 02 Mar 2018	08:00 - 17:00	Jl. Cendrawasih, Kel. Sawah Baru, Kec. Ciputat, Tangerang Selatan 15413, Banten, Indonesia	\N	\N
966	 FESTIVAL LITERASI NUSANTARA 	Lain-lain	11 Jan 2018 - 05 Mar 2018	08:00 - 17:00	Madiun	\N	\N
962	 Dentistry Scientific fEstival x TEMILNAS 2018 	Lain-lain	08 Des 2017 - 11 Peb 2018	18:30 - 16:00	Fakultas Kedokteran Gigi UB	\N	\N
961	 RUN FOR CANCER 2018 	Sport	08  - 08 Apr 2018	05:00 - 08:00	Park Ride Thamrin 10	\N	\N
960	 E-Commerce Zaman Now 	Seminar	27  - 27 Jan 2018	13:00 - 17:00	Aula Institut Bisnis Nusantara, Jl Mayjend. D.I Panjaitan Kav.24 by-pass	\N	\N
956	 SUNDAPOERA 	Musik	13  - 13 Jan 2018	16:00 - 22:00	UNIVERSITAS PENDIDIKAN INDONESIA	\N	\N
953	 EXCEL'S 2017 	Expo	27 Nov 2017 - 23 Jan 2017	00:00 - 00:30	Online 	\N	\N
952	 Beasiswa D1, D3, D4, dan S1 segala jurusan untuk PTN & PTS seluruh Indonesia 	Lain-lain	17 Jan 2018 - 17 Mar 2018	00:00 - 00:00	ONLINE	\N	\N
951	 Business Launching #10 	Pensi	12  - 14 Jan 2018	10:00 - 10:00	Grand Galaxy Park Bekasi	\N	\N
950	 SIMBIZ ASIA 2018 	Lain-lain	12  - 14 Jan 2018	07:00 - 16:00	BINUS International University The Joseph Wibowo Center, Jl. Hang Lekir I No. 6, Senayan, Jakarta Se	\N	\N
949	 KOMPASKARIER.COMÂ GOES TO UI 	Bursa Kerja	12  - 13 Jan 2018	09:00 - 16:00	Balairung UI, Depok 	\N	\N
948	 MAGE (Multimedia and Game Event) 2018 	Lain-lain	04  - 18 Jan 2018	08:00 - 00:00	Departement Teknik Komputer, FTE-ITS	\N	\N
945	 Studium General Studi Agama-Agama Universitas Negeri Jakarta 	Seminar	09  - 09 Jan 2018	08:00 - 12:00	Gd. Ki Hajar Dewantara (Sertifikasi Guru), Kampus A UNJ, Rawamangun, Jakarta Timur	\N	\N
944	 MISSION 3.0 	Lain-lain	27  - 27 Jan 2018	07:00 - 14:00	6 region indonesia	\N	\N
943	 OMITS 2018 	Lain-lain	28  - 28 Jan 2018	07:00 - 17:00	30 region Indonesia	\N	\N
942	 E-TIME 2018 	Lain-lain	25 Des 2017 - 23 Peb 2018	07:30 - 16:30	Politeknik Negeri Jakarta	\N	\N
940	 MANIFEST 2018 	Lain-lain	22  - 24 Mar 2018	07:00 - 00:00	Manajemen Bisnis ITS	\N	\N
937	 Specta Sport Climbing Competition 3 Se-Jawa 	Sport	11  - 14 Jan 2018	16:00 - 19:00	Wall Climbing Mapala Specta, Kampus IAIN Surakarta, Jl. Pandawa, Pucangan, Kartasura, 57168.	\N	\N
936	 Simposium Kepemudaan 	Seminar	06  - 06 Jan 2018	08:00 - 01:00	Auditorium lantai 4 Kampus A UHAMKA Limau (Jalan Limau II Kebayoran Baru, Jakarta Selatan)	\N	\N
934	 Lomba Cerdas Cermat dan Debat SMA/SMK se-Jawa Tengah 	Lain-lain	21  - 21 Des 2017	07:00 - 16:00	Auditorium Ir. Widjatmoko	\N	\N
933	 RENASCIDO BAZAR Let's Sell Let's Buy 	Lain-lain	06  - 06 Jan 2018	09:00 - 17:00	Universitas Muhammadiyah Jakarta, Area Depan Gedung FISIP 	\N	\N
932	 Workshop Desain Grafis 	Lain-lain	06  - 06 Jan 2018	08:00 - 16:00	Room Meeting Bebek Pak Ndut Balikpapan Permai 	\N	\N
931	 BEAT UBAYA 2018 	Lain-lain	02  - 04 Peb 2018	08:00 - 17:00	Universitas Surabaya kampus 2 tenggilis	\N	\N
930	 BEASISWA SMA/ SMK 2018 	Lain-lain	01 Jan 2018 - 28 Peb 2018	00:00 - 12:00	SMA/ SMK seluruh wilayah Indonesia	\N	\N
929	 ACADEMIC SCHOLARSHIP PROGRAM 2018/2019 	Lain-lain	28 Des 2017 - 30 Mar 2018	09:00 - 17:00	GS FAME Campus, Jl. Pulo Mas Timur 3A Blok A No. 2, Kayu Putih - Jakarta Timur	\N	\N
927	 SEMINAR DAN UMKM EXPO UNIVERSITAS SEMARANG 	Expo	15  - 15 Jan 2018	08:00 - 13:00	Auditorium Universitas Semarang	\N	\N
926	 CULTURACTION  	Expo	27  - 28 Jan 2018	09:00 - 23:00	WONDERIA SEMARANG 	\N	\N
925	 INCHALL 2018 	Lain-lain	22 Jan 2018 - 03 Mar 2018	07:00 - 22:00	Institut Teknologi Sepuluh Nopember	\N	\N
923	 Gebyar Matematika ke-33 	Lain-lain	21 Jan 2018 - 03 Peb 2018	00:00 - 00:00	Kampus Unswagati Cirebon	\N	\N
921	 EURECA 2018 	Lain-lain	26 Peb 2018 - 03 Mar 2018	07:00 - 00:00	UNIVERSITAS PRASETIYA MULYA BSD	\N	\N
920	 Advancing Indonesia's Energy with Geophysics 	Seminar	11  - 11 Des 2017	08:00 - 15:30	Pusat Studi Jepang, Fakultas Ilmu Budaya Universitas Indonesia	\N	\N
919	 IE GAMES 13TH EDITION 	Lain-lain	21  - 21 Jan 2018	09:00 - 11:00	surabaya,jakarta,jember,jogja,banten,padang,pekanbaru,malang, madiun, tuban, kediri, gresik +online	\N	\N
918	 Build What You Love Main Event 	Lain-lain	22  - 30 Des 2017	00:00 - 00:00	Bandung	\N	\N
917	 FISIPROGRESIF 2018 	Seminar	06  - 06 Jan 2018	13:00 - 17:00	AULA UNIVERSITAS SATYA NEGARA INDONESIA	\N	\N
916	 Khitanan massal 	Lain-lain	23  - 23 Des 2017	08:30 - 12:00	Madrasah Ibtidaiyah Assu'ada, Kp. Lio RW 020, Kota Depok	\N	\N
915	 GANGSTARASTA ANNIVERSARY 16TH 	Musik	24  - 24 Des 2017	00:00 - 00:00	I-SIX Bar & Lounge, Kemang, Jakarta Selatan	\N	\N
914	 IMPACT 7TH TIME MACHINE 	Lain-lain	20 Des 2017 - 10 Jan 2018	06:30 - 17:00	SMAN 39 JAKARTA 	\N	\N
912	 Seminar Viral Inspire 2017 	Seminar	23  - 23 Des 2017	10:00 - 02:00	Yellow Truck Caffe	\N	\N
910	 Build What You Love 	Lain-lain	30 Des 2017 - 15 Apr 2018	00:00 - 00:00	Bandung	\N	\N
909	 School of Digital PR Series One #SchoolofDigitalPR 	Seminar	05  - 05 Jan 2018	13:30 - 16:30	Tendean Square, Jalan Woltermonginsidi No. 122-124 Kav. 19, Petogogan, Kebayoran Baru. 12170	\N	\N
906	 Akuntansi Peduli 2018 	Lain-lain	19 Des 2017 - 27 Jan 2018	08:00 - 13:00	Terlampir	\N	\N
903	 PAGELARAN DRAMA ANGKATAN 2015 Apresiasi Drama Panca Hasta 	Lain-lain	03  - 07 Jan 2018	19:00 - 22:00	Teater Arena, Taman Budaya Jawa Tengah (TBJT), Surakarta	\N	\N
902	 Clinical Updates 2018: Emergency medicine in General Practice 	Seminar	10  - 11 Mar 2018	08:00 - 16:00	Eastparc Hotel	\N	\N
901	 MUSLIMAH REVOLUSIONER 	Seminar	15  - 15 Des 2017	12:30 - 17:00	FIB UI	\N	\N
899	 Citizen Journalism Workshop Photography for Public Relations (Jakarta-Malaysia-Singapore-Thailand) 	Lain-lain	17 Peb 2018 - 25 Peb 2017	09:00 - 08:00	Jalan Srengseng Sawah, Jagakarsa	\N	\N
897	 INSOMNIART 3 	Lain-lain	16  - 17 Des 2017	10:00 - 21:00	Braga City Walk	\N	\N
894	 CULTURAL LITERATION. MALAM PUNCAK MILAD 20th FSBK 	Pensi	16  - 16 Des 2017	16:00 - 22:00	PLASA PASAR NGASEM	\N	\N
893	 Gunadarma Hoop Summit 	Sport	10 Jan 2018 - 20 Des 2017	09:00 - 21:00	Sport Center Universitas Gunadarma Kampus H	\N	\N
892	 Essam (Lomba Essai Mahasiswa) 	Lain-lain	02 Des 2017 - 22 Peb 2018	00:00 - 00:00	Universitas Lambung Mangkurat	\N	\N
891	 Management Day #7 (New)  	Pensi	13  - 13 Des 2017	08:30 - 22:00	Kampus Universitas Stikubank Semarang	\N	\N
890	 ITFest 2018 	Lain-lain	14 Nov 2017 - 31 Des 2017	00:00 - 23:59	FASILKOM-TI, Universitas Sumatera Utara	\N	\N
889	 Hi-Talk & Expo 	Seminar	28  - 28 Des 2017	08:00 - 12:30	Auditorium Grha Wira Bakti Universitas Darma Persada	\N	\N
888	 INTENTION 2018 	Lain-lain	21 Nov 2017 - 04 Peb 2018	08:00 - 16:00	Kampus A Gedung F&G Universitas Trisaki	\N	\N
887	 WANITA MUDA SOLO BERKARYA 	Seminar	22  - 22 Des 2017	08:00 - 12:00	Megaland Hotel Solo	\N	\N
886	 Viral Inspire 2017 	Seminar	23  - 23 Des 2017	09:00 - 15:00	Eduplex 	\N	\N
885	 Kompetisi Mobile legend 	Expo	23 Des 2017 - 04 Jan 2018	01:00 - 08:00	Kampus Uhamka Limau, Kebayoran Baru, Jakarta Selatan	\N	\N
884	 M-Talks (Millennials Talks) 	Seminar	09  - 09 Des 2017	09:00 - 15:00	Galeri Smartfren, Sabang 	\N	\N
883	 Tax Grand Seminar 2017 â€œTaxation For E-commerceâ€™â€ 	Seminar	12  - 12 Des 2017	08:00 - 13:30	Graha Sanusi, Universitas Padjadjaran Jalan Dipati ukur No.35.Bandung (40132)	\N	\N
880	 Pagelaran seni tari dan drama Rama shinta 	Lain-lain	23  - 23 Des 2017	08:00 - 10:00	Aula ypsa sumedang	\N	\N
879	 Talkshow: Globalization X Millenials 	Seminar	16  - 16 Des 2017	08:00 - 15:00	Auditorium Gedung IX Fakultas Ilmu Pengetahuan Budaya Universitas Indonesia	\N	\N
878	 PRINGGANDANA 2017 	Pensi	10  - 10 Des 2017	18:00 - 22:00	Gedung G Politeknik Keuangan Negara STAN	\N	\N
877	 Turnamen Online Mobile Legend Condet 	Lain-lain	29  - 31 Des 2017	19:30 - 00:00	Institut Bisnis Nusantara	\N	\N
876	 FALAK EXPO 2017 	Expo	24 Nov 2017 - 28 Des 2017	08:00 - 16:00	UIN Walisongo Semarang	\N	\N
875	 CUCI GUDANG BUKU ONLINE 2017 	Lain-lain	08  - 22 Des 2017	00:00 - 00:00	BELANJA ONLINE di ugmpress.ugm.ac.id	\N	\N
874	 M-Talks (Millennials Talks) 	Seminar	09  - 09 Des 2017	09:00 - 15:00	Galeri Smartfren, Sabang 	\N	\N
872	 7th Neonatal Emergency Management 	Seminar	28  - 30 Jan 2018	07:00 - 18:00	Gedung A RSCM	\N	\N
870	 Seminar Nasional Investasi 	Seminar	09  - 09 Des 2017	08:00 - 01:00	Rektorat Lama, Lantai III, Kubang Putih, Kampus II IAIN Bukittinggi	\N	\N
869	 GBIC ESFRA 2018 	Lain-lain	11 Nov 2017 - 18 Jan 2018	00:00 - 00:00	Fakultas Teknik Unissula	\N	\N
868	 IMCB Day II - Brand Transformation Towards Digital Era 	Lain-lain	11  - 13 Des 2017	09:00 - 19:00	Kemanggisan dan alam sutra campus, Binus University	\N	\N
867	 creative festival - IMCB Day II (Brand Transformation Towards Digital Era) 	Lain-lain	11  - 13 Des 2017	09:00 - 19:00	Foodhall, anggrek campus Binus University.	\N	\N
866	 Technopreneur 	Seminar	21  - 21 Des 2017	13:00 - 17:00	universitas esa unggul 	\N	\N
863	 H16URSCHE LOGOS 	Musik	15  - 15 Des 2017	18:00 - 12:00	Auditorium Politeknik Pos Indonesia 	\N	\N
862	 Beauty Class with QL cosmetic 	Lain-lain	18  - 18 Des 2017	08:00 - 12:00	Auditorium  Prof.Dr.Harun Zein Gedung BD Lt.3 Universitas Mercu Buana , Meruya Selatan	\N	\N
861	 Seminar Nasional dan Trend-B 2017 	Seminar	02  - 03 Des 2017	07:00 - 15:00	Auditorium STAIN Pamekasan	\N	\N
860	 This Is Millennial Era, It Is Your Time 	Seminar	04  - 04 Des 2017	19:00 - 21:00	Kampus Anggrek, BINUS University R.400 	\N	\N
859	 Beauty Class shine out your Beauty 	Seminar	18  - 18 Des 2017	08:00 - 12:00	Gedung BD Harun ersitas Mercu Buana meruya selatan	\N	\N
858	 SMILEMOTION 2017 	Musik	09  - 09 Des 2017	14:00 - 22:00	SASANA BUDAYA GANESHA (SABUGA)	\N	\N
857	 Indonesian Race Conference 5 	Seminar	09  - 09 Des 2017	07:00 - 15:40	Conference Room P2T Politeknik Negeri Bandung	\N	\N
856	 Latihan  Keterampilan Manajemen Mahasiswa Pra Tingkat Dasar Teknik Informatika 2017 STT-PLN Jakarta 	Lain-lain	05 Nov 2017 - 17 Des 2017	06:00 - 17:00	Sekolah Tinggi Teknik PLN Jakarta	\N	\N
855	 KONSER BEBAS BEBAS AJA 	Musik	02  - 02 Des 2017	16:00 - 22:00	Rolling Stone Headquarter, Kemang, Jakarta Selatan	\N	\N
854	 SEMINAR FOODNATIC 	Seminar	07  - 07 Des 2017	09:00 - 14:00	Jakarta International Hotels School (SCBD), Kav. 52-53 Lot. 21, Senayan	\N	\N
853	 POPULATION Blood Donation 	Lain-lain	07  - 07 Des 2017	12:00 - 15:00	Main Atrium, Green Pramuka Square (LG floor)	\N	\N
852	 Explosion of Chemical Engineering Study Activities (EXCESS) 	Lain-lain	13  - 15 Apr 2018	08:00 - 15:00	Universitas Lampung	\N	\N
851	 International Difable day 	Lain-lain	03  - 03 Des 2017	06:15 - 11:00	Car free day hotel indonesia 	\N	\N
850	 Be creativepreneur with social media power's 	Seminar	06  - 06 Des 2017	08:00 - 12:00	Aula gedung Rektorat UMJ Lt.4	\N	\N
849	 EXOTIC 3.0 	Pensi	30  - 30 Nov 2017	18:00 - 22:00	Lapangan A2 FIP UNNES 	\N	\N
848	 Open Recruitment Pengurus GPAN Malang 2017-2018 	Lain-lain	25 Nov 2017 - 05 Des 2017	00:01 - 23:59	Kota Malang	\N	\N
847	 SEMINAR: Convince Investors Within The First 3 Minutes 	Seminar	14  - 14 Des 2017	17:00 - 21:00	JSC HIVE Coworking Space Jakarta	\N	\N
846	 ART COLLABORATION AND REVOLUTIONARY ACTION 	Musik	02  - 02 Nov 2017	17:00 - 23:00	GEDUNG GRAHA WIDYA WISUDA KAMPUS IPB DRAMAGA	\N	\N
845	 Kampung Tatar Padjadjaran  	Pensi	26  - 26 Nov 2017	13:00 - 21:00	Universitas Padjadjaran Dipatiukur	\N	\N
844	 PRA Pekan DAS Brantas XI 	Lain-lain	28 Okt 2017 - 14 Des 2017	00:00 - 00:00	Universitas Brawijaya, Malang	\N	\N
843	 Job Fair Tangerang Selatan 	Bursa Kerja	25  - 27 Nov 2017	08:00 - 17:00	Lapangan SUNBURST BSD Samping Giant	\N	\N
842	 Seminar nasional bem fakultas farmasi universitas setiabudi surakarta 	Seminar	17  - 17 Des 2017	07:00 - 18:00	Hotel megaland solo	\N	\N
841	 ARTSHOW#6 SOFT NIGHT ON THE ROAD 	Musik	25  - 25 Nov 2017	18:00 - 22:00	Pasar Triwindu, Ngarsopuro,Surakarta	\N	\N
840	 Harmoni Untuk Rakyat 	Musik	30  - 30 Nov 2017	19:25 - 21:30	Concert hall ISI Yogyakarta	\N	\N
839	 TECHNOWARS 5 	Lain-lain	06  - 10 Des 2017	07:00 - 20:00	UNIVERSITAS KANJURUHAN MALANG	\N	\N
838	 Seminar Entrepreneur 	Seminar	25  - 25 Nov 2017	08:00 - 15:30	Aula Maftuchah Lt 2. Gedung Dewi Sartika Universitas Negeri Jakarta	\N	\N
837	 MINI SEMINAR BERSAMA GAMELOFT INDONESIA 	Seminar	02  - 02 Des 2017	00:00 - 00:00	Ruang Teater FT UNY	\N	\N
836	 GARDA PECINTA INDONESIA 	Seminar	01  - 01 Des 2017	13:00 - 00:00	KPLT Fakultas Teknik UNY lantai 3	\N	\N
835	 Photography Farmtastic UNS 	Lain-lain	09 Nov 2017 - 02 Des 2017	00:00 - 00:00	online	\N	\N
834	 Pergelaran Dramatari CANDRABIRAWA 	Lain-lain	28  - 29 Nov 2017	19:00 - 00:00	 Halaman depan Gedung Isola (Rektorat Universitas Pendidikan Indonesia)	\N	\N
833	 SEMINAR NASIONAL 2018 'Boost Your Confidence to Break Your Limit' 	Seminar	07  - 30 Nov 2017	09:00 - 16:00	-Lobby kampus 1 FH UAJY 	\N	\N
832	 *Band, Dance Competition and Bazaar* 	Pensi	10  - 10 Des 2017	08:00 - 21:00	Gedung Laboratorium Karawitan Fakultas Bahasa dan Seni, UNY	\N	\N
831	 PENANAMAN 1001 pohon 	Lain-lain	02  - 03 Des 2017	00:00 - 00:00	desa tlogodlingo kec, tawangmangu, kab karanganyar	\N	\N
830	 BEAT (Be Entrepenuer Academic Tournament) 	Lain-lain	02  - 04 Peb 2018	08:00 - 16:00	Universitas Surabaya tenggilis	\N	\N
829	 CAREER SNAPSHOT 2017: Seminar & Talkshow 	Seminar	28  - 28 Nov 2017	08:00 - 15:00	Student Center Fakultas Ekonomi dan Bisnis Universitas Indonesia	\N	\N
828	 Millennial Movement 	Seminar	25  - 25 Nov 2017	15:00 - 17:05	PIK Avanue, Kamal Muara, Penjaring, Jakarta Utara	\N	\N
827	 Tarumanagara English Club present: Social Act 2017 - CARE (Create hAppiness thRough lovE) 	Lain-lain	19  - 19 Des 2017	10:00 - 18:00	Panti Asuhan Kasih Anugerah Rumah Pemulihan	\N	\N
826	 Seminar Nasional Teknik Elektro 2017 	Seminar	16  - 16 Des 2017	08:00 - 12:00	Anwar Musaddad UIN BANDUNG	\N	\N
825	 Seminar & Talkshow Youth Without HIV 	Seminar	04  - 04 Des 2017	08:00 - 12:00	R.811 Gedung Utama Universitas Esa Unggul Kebon Jeruk	\N	\N
824	 Tekno Musik  	Musik	17  - 17 Des 2017	12:00 - 18:00	Anwar Musaddad UIN BANDUNG	\N	\N
823	 Youlec Essay Competition 	Lain-lain	01  - 30 Nov 2017	00:00 - 23:59	Jakarta	\N	\N
822	 MINIATURE 2017 	Lain-lain	23  - 23 Nov 2017	08:00 - 11:00	Aula Bung Hatta Lt.2, Gd.Pascasarjana, UNJ.	\N	\N
821	 M-Talks (Millennials Talks) 	Seminar	09  - 09 Des 2017	09:00 - 15:00	Galeri Smartfren, Sabang (Jakarta Pusat)	\N	\N
820	 Investsmart 	Seminar	09  - 09 Des 2017	07:30 - 03:00	MaxOne Hotel	\N	\N
819	 CONTECH ( Connection Technology ) 	Seminar	25  - 25 Nov 2017	08:00 - 04:00	Gedung PWK ( Perencanaan Wilayah Kota ) Fakultas Teknik - Universitas Diponegoro	\N	\N
815	 Pelatihan Automasi Mesin Industri 	Lain-lain	25  - 25 Nov 2017	09:00 - 15:00	Kampus STT Muhammadiyah Cileungsi	\N	\N
814	 TOEFL Training and Simulation 	Seminar	25  - 25 Nov 2017	08:00 - 15:00	Fakultas Teknik Mesin UNDIP, Tembalang	\N	\N
813	 MmWave Simulation Using Network Simulator 3 Training 	Lain-lain	02  - 02 Des 2017	07:30 - 16:00	O 204 Building, Electrical Engineering Faculty, Telkom University.	\N	\N
812	 Seminar Umum Agroekoteknologi 	Seminar	26  - 26 Nov 2017	08:00 - 02:00	Ruang Hasan Basry Fakultas Pertanian UNLAM	\N	\N
811	 Seminar Umum dan Talk Show 	Seminar	26 Nov 2017 - 30 Nov -1	07:30 - 12:00	Aula Hasan Basri Fakultas Pertanian Universitas Lambung Mangkurat	\N	\N
810	 Seminar & Talkshow Youth Without HIV 	Seminar	04  - 04 Des 2017	08:00 - 12:00	R.811 Gedung Utama Universitas Esa Unggul Kebon Jeruk	\N	\N
809	 Seminar nasional 	Seminar	25  - 25 Nov 2017	08:00 - 16:00	Auditorium Politeknik Pos Indonesia	\N	\N
808	 MINIATURE (MILLENNIALS, CREATOR OF THE FUTURE) 	Seminar	23  - 23 Nov 2017	08:00 - 16:00	Aula Bung Hatta Lt.2, Gedung Pascasarjana, Universitas Negeri Jakarta	\N	\N
807	 Seminar Kesehatan Kebidanan 2017 Kenali, Cegah dan Tangani Cacat Janin (Measles Rubella)  	Seminar	17  - 17 Des 2017	08:00 - 14:00	Gedung Pusat Diagnostik Terpadu lantai 7 RSUD Dr. Soetomo Jl. Prof. Dr. Moestopo No. 6-8 Surabaya.	\N	\N
806	 SI FEST 2017 (Sistem Informasi Festival) 	Seminar	27  - 29 Nov 2017	09:00 - 17:30	Gedung Auditorium Universitas Budi Luhur Jakarta	\N	\N
805	 Respect Cup 	Sport	11  - 12 Des 2017	08:00 - 17:00	Lapangan futsal, Universitas Mercu Buana, Meruya Selatan	\N	\N
804	 Revolution 2 	Lain-lain	27  - 30 Nov 2017	09:00 - 16:00	Universitas Multimedia Nusantara	\N	\N
802	 SEMINAR DAN WORKSHOP PERSONAL BRANDING 	Seminar	16  - 16 Des 2017	07:00 - 17:00	AULA HOTEL SERNU RAYA SUMBAWA BESAR, NTB	\N	\N
800	 The 40th Jazz Goes To Campus 	Musik	26  - 26 Nov 2017	11:00 - 00:00	Fakultas Ekonomi dan Bisnis, Universitas Indonesia	\N	\N
799	 Seminar Nasional Public Speaking and Self Development for Millennial Generation 	Seminar	26  - 26 Nov 2017	08:00 - 15:30	Auditorium Bale Santika Universiitas Padjadjaran Jatinangor	\N	\N
798	 Closing Ceremony & Charity Night with ATC 	Musik	18  - 18 Nov 2017	17:00 - 23:00	HALL STUDENT CENTRE UIN JAKARTA	\N	\N
797	 Class of Development 2017 	Seminar	25  - 25 Nov 2017	07:30 - 01:00	Universitas Jenderal Soedirman Fak. Ekonomi dan Bisnis	\N	\N
795	 APP FAIR 2017 	Lain-lain	22  - 23 Nov 2017	08:00 - 17:00	Jl. Timbul No. 34, Cipedak, Jagakarsa, Jakarta Selatan	\N	\N
793	 GEOTRAP 2017  Geotrek 	Lain-lain	30  - 30 Nov 2017	08:00 - 04:00	Karst Citatah, Padalarang	\N	\N
792	 KOMUS CARNIVAL 	Musik	24  - 24 Nov 2017	09:00 - 09:00	Kampus STT-PLN Jakarta	\N	\N
791	 Andalas Accounting National Events 	Seminar	13 Nov 2017 - 01 Apr 2018	08:00 - 17:00	Universitas Andalas	\N	\N
790	 Seminar Nasional dan Talkhsow Qur'ani (Ust. Muzammil Hasballah dan Archie Wirija) 	Seminar	07  - 07 Des 2017	12:30 - 18:30	UIN Syarif Hidayatullah Jakarta di Auditorium Harun Nasution	\N	\N
789	 MAHABARATA 	Musik	18 Des 2017 - 19 Nov 2017	07:00 - 18:00	SMAN Karangpandan, Karanganyar	\N	\N
788	 Pameran Fotografi TranSisi 	Lain-lain	20  - 25 Nov 2017	13:00 - 00:00	Aula Student Center (SC)Kampus UIN Jakarta	\N	\N
787	 Seminar Profesi Gizi  	Seminar	27  - 27 Nov 2017	07:00 - 12:00	Auditorium Fakultas Kedokteran dan Ilmu Kesehatan UIN Jakarta	\N	\N
786	 XT Square Job Fair 2017 	Bursa Kerja	24  - 26 Nov 2017	09:00 - 21:00	Jl. Veteran No.150-151 Pandeyan, Umbulharjo, Yogyakarta Â 082225250123	\N	\N
785	 Job Fair Akbar Blok M Square 	Bursa Kerja	28  - 29 Nov 2017	10:00 - 15:00	â€‹â€‹Mall â€‹Blok M Square Lantaiâ€‹1â€‹, â€‹Jl. â€‹â€‹Melawai V, Jakarta Selatan (terminal Bus Blo	\N	\N
784	 Go Wet 2017 (Water Rescue Training) 	Lain-lain	21  - 22 Nov 2017	07:00 - 16:00	Day 1: ruang rapat ILRC Lantai 2 (Perpustakaan lama UI), Day 2: Wisma makara UI & Danau Salam UI	\N	\N
783	 Face Of Management #4 	Lain-lain	15 Des 2017 - 17 Nov 2017	08:00 - 22:00	Kampus Universitas Fajar	\N	\N
782	 TALKING ABOUT PROFESSION 	Seminar	09  - 09 Des 2017	07:30 - 13:00	AUDITORIUM FE UNY	\N	\N
781	 CUCI GUDANG BUKU 2017 	Expo	20  - 30 Nov 2017	08:00 - 16:00	howroom UGM Press, Jl. Grafika No.1 Kampus UGM, Bulaksumur, Yogyakarta (Fakultas Teknik UGM)	\N	\N
780	 Konser Teknik Satu 2017 	Musik	02  - 02 Des 2017	14:30 - 22:00	Kantor Pusat Fakultas Teknik (KPFT) UGM 	\N	\N
779	 Gamosphere 2017 	Seminar	02  - 02 Des 2017	07:30 - 14:00	Auditorium Poltekkes Kemenkes Malang (POLKESMA) , Jl. Besar Ijen No.77C,Oro-oro Dowo, Klojen, Kota M	\N	\N
778	 SoloRayaÂ Job Fair 2017 	Bursa Kerja	19  - 20 Des 2017	09:00 - 16:00	Palur Plasa (Jl. Raya Solo-Sragen KM 1, Palur, Karanganyar)	\N	\N
777	 Job Fair Disnaker Surabaya 2017 	Bursa Kerja	21  - 22 Nov 2017	08:00 - 16:00	Gedung Wanita Candra Kencana, Jl. Kalibokor Selatan No. 2 Surabaya	\N	\N
776	 Unika Job Fair XXVI â€“ November 2017 	Bursa Kerja	16  - 17 Nov 2017	09:00 - 15:00	Auditorium Gedung Albertus Lt. 3, Unika Soegijapranata, Semarang	\N	\N
775	 Bogor JOBEXPO 2017 	Bursa Kerja	05  - 06 Des 2017	09:00 - 16:00	Politeknik AKA Bogor	\N	\N
774	 Job Fair Mikroskil 2017 	Bursa Kerja	24  - 25 Nov 2017	10:00 - 16:00	Hall Kampus C Lt.5 STMIK â€“ STIE Mikroskil, Medan	\N	\N
773	 Job Fair Universitas Simalungun Pematangsiantar 	Bursa Kerja	17  - 18 Nov 2017	00:00 - 00:00	Auditorium Radjamin Poerba, SH, Kampus Universitas Simalungun, Jl. Sisingamangaraja Barat, Pematangs	\N	\N
772	 Job Fair GRAGE CITY MALL 	Bursa Kerja	29  - 30 Nov 2017	00:00 - 00:00	GRAGE CITY MALL LANTAI DASAR LOBBY 3 JL Jend Ahmad Yani Pegambiran Kota Cirebon	\N	\N
771	 Kompetisi Keterampilan Instruktur Nasional (KKIN Ke-VI 2017) 	Bursa Kerja	21  - 25 Nov 2017	00:00 - 00:00	 BBPLK Semarang, jl. Brigjen Sudiarto Pedurungan Semarang	\N	\N
770	 SARASEHAN: Bersama Jodhi Yudono (Ketua Umum Ikatan Wartawan Online) Menangkal Hoax di Media Sosial 	Seminar	22  - 22 Nov 2017	09:00 - 12:00	UIN Club UIN Syarif Hidayatullah Jakarta	\N	\N
769	 Job Fair 19 UDINUS 	Bursa Kerja	09  - 10 Des 2017	08:30 - 16:00	aula Udinus gedung E Lt.3 Jl. NAKULA 1 No. 5-11 SEMARANG	\N	\N
768	 World Animal Weeks FestivalðŸŽ† ROAR (Raise Our Animal Rights) 	Musik	25  - 25 Nov 2017	00:00 - 00:00	Lap. Parikr timur GOR AMONGROGO	\N	\N
761	 Pagelaran Budaya UGM 	Musik	25 Nov 2017 - 30 Nov -1	14:45 - 00:00	Lapangan Pancasila Universitas Gadjah Mada	\N	\N
760	 SEMINAR NASIONAL TEKNOLOGI INFORMASI 	Seminar	25  - 25 Nov 2017	08:00 - 15:00	Gedung Research Center Universitas Tadulako	\N	\N
759	 MÃšSE Festival 2017 	Musik	19  - 19 Nov 2017	16:00 - 22:00	GOR Bulungan, Outdoor Tinju	\N	\N
758	 Milad Pekan 12 	Pensi	12  - 12 Des 2017	07:00 - 12:00	Gedung Kuliah Bersama Lantai 10 UNISSULA	\N	\N
757	 Dentistry Perforation 7 	Musik	25  - 25 Nov 2017	16:30 - 23:00	Auditorium Graha Widyatama Unsoed	\N	\N
755	 LOMBA KARYA TULIS ILMIAH TINGKAT NASIONAL 	Lain-lain	20 Okt 2017 - 26 Nov 2017	00:00 - 00:00	perguruan tinggi bina insani	\N	\N
754	 Gebyar Psikologi 	Pensi	17  - 17 Nov 2017	18:00 - 00:40	Lapangan A2 FIP Universitas Negeri Semarang	\N	\N
753	 International Seminar 4th SEVENTSEAS 2017 	Seminar	18  - 18 Nov 2017	07:00 - 16:00	Widyaloka Building,Brawijaya University	\N	\N
752	 EXPLORE 2018 	Musik	13  - 13 Jan 2018	10:00 - 22:00	Kampus III BSD UNIKA AtmaJaya 	\N	\N
751	 Mahakarya 2017 	Pensi	18  - 18 Nov 2017	13:00 - 23:00	Fakultas Ilmu Budaya Universitas Diponegoro Semarang	\N	\N
750	 AN EXPO 2017 	Expo	13  - 17 Nov 2017	08:00 - 05:00	Lapangan utama Politeknik Negeri Jakarta	\N	\N
749	 GEOTRAP 2017 GEOPHYSICS WORKSHOP 	Seminar	27  - 28 Nov 2017	08:00 - 16:00	Universitas Padjadjaran dan Aston Hotel, Pasteur Bandung	\N	\N
748	 Journalistic Photography Fair & Competition 	Lain-lain	14  - 16 Des 2017	09:00 - 22:00	Hall FEB UMS (Kampus 2)	\N	\N
747	 PRE EVENT ACRA 2017 	Musik	18  - 18 Nov 2017	13:00 - 21:00	Botani Square Mall	\N	\N
746	 Semarak Agroteknologi Festival 11 (SATIVA 11) 	Musik	03  - 03 Des 2017	10:00 - 16:00	Universitas Islam Negeri Sunan Gunung Djati	\N	\N
745	  GEOTRAP 2017   Indonesian Geoscience Grand Seminar 	Seminar	29  - 29 Nov 2017	01:00 - 05:00	Aston Hotel Pasteur, Bandung	\N	\N
744	 INAUGURATION NIGHT :  	Pensi	25  - 25 Nov 2017	15:00 - 22:00	GOR PAJAJARAN BOGOR	\N	\N
742	 Millennial Movement 	Seminar	25  - 25 Nov 2017	15:00 - 17:05	PIK Avanue, Kamal Muara, Penjaring, Jakarta Utara	\N	\N
741	 Hafiefest 	Lain-lain	08  - 15 Nov 2017	19:00 - 22:00	Gor kampus 2 FEB UMS	\N	\N
740	 The East (Generation of Change)  	Musik	15  - 15 Nov 2017	19:00 - 22:00	Gor kampus 2 universitas muhammadiyah surakarta 	\N	\N
739	 Seminar nasional #confident 4 	Seminar	11  - 11 Nov 2017	08:00 - 12:00	Gedung induk siti walidah universitas muhammadiyah surakarta	\N	\N
737	 Talk Show Marcomm Vol.2 	Seminar	21  - 21 Nov 2017	10:00 - 15:00	Ballroom Kemala, Universitas Esa Unggul	\N	\N
736	 ETERNITY (Entrepreneurship Through Creativity) 	Seminar	17  - 17 Nov 2017	08:30 - 00:00	President University Auditorium	\N	\N
735	 JOBFAIR SMK CINERE DEPOK 	Bursa Kerja	10  - 10 Nov 2017	10:00 - 15:00	smk cinere depok	\N	\N
734	 Tadaima ( anata dai Matsuri ) 2017 	Pensi	03  - 03 Des 2017	09:00 - 18:00	aman Kuliner Condong Catur,  Jl. Angga Jaya 3, Condong Catur, Depok,, Sleman, Yogyakarta,	\N	\N
733	 JOB FAIR Universitas Pelita Harapan Surabaya!!! 	Bursa Kerja	17  - 18 Nov 2017	08:00 - 16:00	Student Lounge, 1st floor. Tokyo Tower Universitas Pelita Harapan Surabaya	\N	\N
732	 SPORT SCIENCE DEVELOPMENT SEMINAR 	Seminar	29  - 29 Nov 2017	09:00 - 14:00	at Auditorium FIK UNESA, 3rd floor	\N	\N
731	 Seminar Nasional Kertakasi III 	Seminar	25  - 25 Nov 2017	07:30 - 12:00	Auditorium Fakultas Teknik Universitas Jember	\N	\N
730	 Cemara Cheerleading competition  	Lain-lain	17  - 17 Nov 2017	11:00 - 21:00	Hall 2 STIESIA Surabaya 	\N	\N
728	 SOPOHOMORE FEB UNDIP 	Pensi	11  - 11 Nov 2017	16:00 - 20:00	Halaman Ged C FEB UNDIP Tembalang	\N	\N
727	 Pameran Besar Fotografi Prisma Undip Angkatan 28 Destiny 	Lain-lain	17  - 24 Nov 2017	16:00 - 22:00	Gedung Monod Dephuis, Kota Lama Semarang	\N	\N
724	 workshop, coaching clinic, and contest photography 	Seminar	16  - 16 Des 2017	13:00 - 17:00	kedai kopi djembar bogor	\N	\N
721	 HEST (HIMEDIA E-Sport Tournament ) 	Sport	13  - 17 Nov 2017	15:00 - 21:00	Hall Politeknik Negeri Media Kreatif Jakarta 	\N	\N
720	 Event Menulis Antologi 	Lain-lain	08  - 20 Nov 2017	08:00 - 00:00	Online submit 	\N	\N
717	 National Data Days 2017 	Seminar	22  - 22 Nov 2017	12:30 - 17:00	Aula Dekanat lantai 1 Telkom University, Bandung	\N	\N
714	 Young Entrepreneurs Show 	Seminar	18  - 18 Nov 2017	07:30 - 15:00	Mataram International Convention Centre, Allana Hotel, Jogjakarta	\N	\N
713	 Social Culture 	Musik	24  - 24 Nov 2017	13:00 - 18:00	Universitas Negeri Jakarta	\N	\N
712	 Airlangga Book Sale 	Lain-lain	06  - 11 Nov 2017	09:00 - 21:00	Depan Rektorat Kampus C Universitas Airlangga	\N	\N
711	 Festival Seni dan Budaya Sulawesi 2017 	Lain-lain	10  - 10 Nov 2017	18:00 - 23:00	Telkom University Convention Hall	\N	\N
710	 TIRTANIUM 2017 	Musik	17  - 17 Nov 2017	11:00 - 23:00	Roti Bakar 88 Legok, Serang	\N	\N
709	 KOPDAR YOUNGPRENEUR 2017 	Seminar	25  - 25 Nov 2017	07:00 - 15:00	Kampus STEI SEBI. Jl. Raya Bojongsari, Pondok Rangga, Curug, Bojongsari	\N	\N
708	 Eresha Fest 2017 	Lain-lain	23 Nov 2017 - 06 Des 2017	09:00 - 17:00	Kampus STMIK Eresha Viktor	\N	\N
707	 Seminar Kebangsaan 	Seminar	13  - 13 Nov 2017	08:00 - 13:00	Graha Wiyata lantai 9 Universitas 17 Agustus 1945 Surabaya	\N	\N
706	 CUTTHECRAP 	Musik	11  - 11 Nov 2017	00:00 - 00:00	Rolling Stone Headquarter â€“ Jl. Ampera Raya No. 16, Kemang, Jakarta Selatan	\N	\N
705	 INDEX 2017 	Expo	08  - 08 Des 2017	17:00 - 00:00	FT Untirta's Ball's Field	\N	\N
704	 ELCCO 2018 	Lain-lain	09  - 11 Peb 2018	08:00 - 16:00	Gedung Agrokomplek Universitas Udayana, Jl. P.B. Sudirman, Denpasar, Bali	\N	\N
703	 Seminar Nasional Kewirausahaan 	Seminar	17  - 17 Nov 2017	16:00 - 19:30	Auditorium Kampus II Gedung Thomas Aquinas Universitas Atma Jaya Yogyakarta	\N	\N
702	 Charity Concert Health and Art Festival 2017 	Pensi	11  - 11 Nov 2017	09:00 - 02:00	Gedung Teater Indoor Bulungan, Blok M	\N	\N
701	 LEADTALK and Job Fair 2017 	Bursa Kerja	09  - 10 Nov 2017	10:00 - 17:00	Balairung Universitas Indonesia	\N	\N
699	 Seminar Nasional Teknologi Industri 	Seminar	18  - 18 Nov 2017	08:00 - 12:00	Aula Fakultas Ekonomi lt 3 UNISSULA	\N	\N
698	 USMFIESTA2017 	Musik	09  - 11 Nov 2017	00:00 - 00:00	Universitas Semarang	\N	\N
697	 Tarbiyah Sport Competition 	Sport	11  - 19 Nov 2017	07:00 - 22:00	UIN Syarif Hidayatullah Jakarta	\N	\N
696	 Seminar Nasional dan Talkshow 	Seminar	16  - 16 Nov 2017	08:00 - 12:00	Institut Agama Islam Negeri Tulungagung, Gd Syaifudin Zuhri lt 6	\N	\N
695	 Seminar Nasional Enterpreneur  	Seminar	19  - 19 Nov 2017	09:00 - 01:00	Universitas Stikubank Semarang Jl.Kendeng V Bendan Ngisor Gajah Mungkur Semarang Jawa Tengah	\N	\N
694	 National Choir Competition untuk SMA/sederajat 	Musik	12  - 12 Nov 2017	07:00 - 17:00	Auditorium Toyyib Hadiwijaya, Kampus IPB Dramaga, Bogor	\N	\N
693	 Seminar Nasional Lingkungan Hiduo 	Seminar	26  - 26 Nov 2017	09:00 - 13:00	Ruang seminar lantai 7, Gedung induk siti walidah. Universitas Muhammadiyah Surakarta	\N	\N
692	 TALKSHOW NASIONAL 2017 Creative Content in Digital Era 	Seminar	19  - 19 Nov 2017	08:00 - 13:00	Auditorium O5 lantai 3, Fakultas Ilmu Pendidikan, Universitas Negeri Surabaya, Kampus Lidah Wetan	\N	\N
691	 JAKARTA PEACE CONCERT 	Musik	18  - 18 Nov 2017	13:00 - 00:00	Allianz Ecopark Ancol	\N	\N
690	 ECOVOLUTION KE-6 (ELEVEN CONCERT FOR REVOLUTION)  	Musik	18  - 18 Nov 2017	18:15 - 23:25	PKKH (Pusat Kebudayaan Koesnadi Hardjasoemantri)  UGM	\N	\N
689	 Industrial Event of Innovation (INDTENTION) 2017 	Lain-lain	27 Okt 2017 - 08 Des 2017	09:00 - 18:00	Jln. Jendral Sudirman Km. 3, Kampus FT UNTIRTA	\N	\N
683	 Faustfest Fikom Unpad 	Musik	11  - 11 Nov 2017	08:00 - 21:00	Arboretum Unpad Jatinangor	\N	\N
682	 National Welfare Competition II: Lomba Essay Nasional 	Lain-lain	25 Sep 2017 - 08 Nov 2017	00:00 - 00:00	FAKULTAS ILMU SOSIAL DAN ILMU POLITIK, UNIVERSITAS JEMBER	\N	\N
681	 National Welfare Competition II: Lomba Essay Nasional 	Lain-lain	25 Sep 2017 - 08 Nov 2017	00:00 - 00:00	FAKULTAS ILMU SOSIAL DAN ILMU POLITIK, UNIVERSITAS JEMBER	\N	\N
680	 Psikologi Olahraga 	Seminar	12  - 12 Nov 2017	08:00 - 03:00	Psikoilogi Universitas Airlangga	\N	\N
679	 Amorphous 2017 	Lain-lain	03  - 04 Nov 2017	12:00 - 23:00	Taman Budaya Raden Saleh Semarang ( TBRS )	\N	\N
678	 [PELATIHAN] QHSE Training Awareness 	Lain-lain	11 Nov 2017 - 30 Nov -1	08:00 - 17:00	Ruang Diskusi Perpustakaan Universitas Airlangga (UNAIR) Kampus B	\N	\N
677	 Seminar Nasional Strategi Bisnis Syariah dalam Meningkatkan Ketahanan Nasional 	Seminar	18  - 18 Nov 2017	07:30 - 11:00	Gedung TechnoPark UPN Veteran Jawa Timur Jl. Raya Rungkut Madya, Gunung Anyar	\N	\N
676	 Education Trip 	Lain-lain	05  - 05 Nov 2017	07:30 - 15:30	Museum Kebangkitan Nasional	\N	\N
675	 Amorphous 2017 	Lain-lain	03  - 04 Okt 2017	12:00 - 23:00	Taman Budaya Raden Saleh (TBRS) Semarang 	\N	\N
674	 workshop, coaching clinic, and contest photography 	Seminar	16  - 16 Des 2017	13:00 - 17:00	kedai kopi djembar bogor	\N	\N
672	 Future Leader Camp Batik Festival 2018 	Seminar	21  - 25 Jan 2018	07:00 - 00:00	Kyoto, Jepang	\N	\N
671	 Seminar Nasional Alcofe XI 	Seminar	11 Nov 2017 - 30 Nov -1	08:00 - 15:00	Auditorium Universitas Sebelas Maret Surakarta	\N	\N
670	 Pelatihan Komunikasi 	Seminar	12  - 12 Nov 2017	07:30 - 14:00	Auditorium FE UNESA (Jl. Ketintang, Surabaya)	\N	\N
669	 S'PATSA FEST 2017 	Pensi	25  - 25 Nov 2017	12:30 - 20:00	SMA Negeri 41 Jakarta	\N	\N
668	 Accounting Ledger Festival 8th 	Seminar	10  - 11 Nov 2017	08:00 - 04:00	Pendopo Tonny Soewandito Politeknik Negeri Bandung	\N	\N
667	 ECW 6th UNAIR (Talkshow Entrepreneur and Career Workshop in Digital Economy Era) 	Seminar	18  - 18 Nov 2017	07:00 - 13:00	Aula Fadjar Notonagoro Fakultas Ekonomi dan Bisnis	\N	\N
666	 Scholarship and Job Festival UNJ 	Bursa Kerja	30 Nov 2017 - 01 Des 2017	07:30 - 17:30	Aula Latieg Hendradiningrat, kampus A UNJ	\N	\N
665	 Seminar Nasional 	Seminar	09  - 09 Nov 2017	13:00 - 16:30	Institut Bisnis Nusantara	\N	\N
664	 Mathematics Champions Cup 	Sport	19  - 30 Okt 2017	00:00 - 00:00	Universitas Negeri Surabaya	\N	\N
663	 Warna Warni Festival vol. 3 	Lain-lain	26  - 27 Okt 2017	13:00 - 22:00	Institut Bisnis Nusantara	\N	\N
662	 Festival Seni dan Budaya Sulawesi 2017 	Lain-lain	10  - 10 Nov 2017	18:00 - 23:00	Telkom University Convention Hall	\N	\N
641	 Mechanical Education Fair 2017 	Seminar	04 Nov 2017 - 30 Nov -1	08:00 - 14:00	Gedung Pasca Sarjana Undip Pleburan Lt6	\N	\N
640	 Economic Challange Competition 	Lain-lain	18 Nov 2017 - 30 Nov -1	07:00 - 18:00	Aula Fakultas Ekonomi dan Bisnis Usu	\N	\N
639	 SMITE 2017(SEMINAR NASIONAL IT CAREER BUILDING 2017) 	Seminar	09  - 09 Nov 2017	10:00 - 16:00	Ruang Seminar Lt. 2 Gedung Teknologi Tepat Guna UPN Veteran Jawa Timur	\N	\N
638	 Kuliah Intensif Ekonomi Islam 	Seminar	06 Nov 2017 - 02 Des 2017	09:00 - 15:30	Fakultas Ekonomi dan Bisnis, Universitas Indonesia, Depok	\N	\N
637	 Pelatihan Jurnalistik Dasar 2017 	Seminar	11  - 11 Nov 2017	08:30 - 17:00	Aula STAI Publisistik Thawalib Jakarta (Jl. Kramat II Kwitang Senen Jakarta Pusat)	\N	\N
636	 SEMINAR TEKNIK INFORMATIKA  	Seminar	18  - 18 Nov 2017	12:30 - 17:30	PERPUSTAKAAN SEKOLAH TINGGI TEKNOLOGI MUHAMMADIYAH CILEUNGSI - BOGOR	\N	\N
635	 Festival Padmawidya (FESPA) 	Musik	09  - 09 Des 2017	05:00 - 23:00	PKKH UGM	\N	\N
634	 Seminar Nasional Jurusan Psikologi ''Parenting Di Era Digital'' Universitas Negeri Semarang 	Seminar	06 Nov 2017 - 06 Okt 2017	08:00 - 14:00	Gedung Dekanat FMIPA lantai 3 UNNES	\N	\N
633	 Pekan Raya Saintek 	Musik	24  - 24 Des 2017	01:00 - 05:00	Kampus UIN Sunan Gunung Djati Bandung	\N	\N
632	 CANDY 2017 	Seminar	25  - 26 Nov 2017	08:00 - 16:00	South Quarter Tower B Lantai 18, Jalan RA. Kartini Kav. 8, Cilandak Barat	\N	\N
631	 U-Tron by Himatika dan UKM Musik Universitas Widya Kartika 	Lain-lain	22  - 25 Nov 2017	08:00 - 09:00	Universitas Widya Kartika	\N	\N
630	 ECUTION (Engllish Cultural Exhibitions) 	Lain-lain	18  - 18 Nov 2017	08:00 - 22:00	FIB Universitas Brawijaya gedung A	\N	\N
629	 Seminar Kesehatan Nasional 2017 	Seminar	28  - 28 Okt 2017	08:00 - 16:00	Auditorium Badan Pengkajian dan Penerapan Teknologi (BPPT) Lt. 3 Menteng	\N	\N
628	 Seminar Nasional Teknologi Build A Great Country with Sustainable Technology 	Seminar	11  - 11 Nov 2017	07:00 - 14:00	Ballroom Hotel Saptanawa 	\N	\N
627	 LINE FOLLOWER COMPETITION #5 	Lain-lain	11  - 12 Nov 2017	07:00 - 04:00	AUDITORIUM STTN-BATAN 	\N	\N
626	 SEMINAR NASIONAL KEWIRAUSAHAAN 	Seminar	04  - 04 Nov 2017	07:00 - 14:00	AUDITORIUM STTN-BATAN YOGYAKARTA	\N	\N
625	 Accounting Gathering 	Lain-lain	27  - 27 Okt 2017	15:30 - 21:00	Fakultas Ekonomi dan Bisnis, Universitas Brawijaya	\N	\N
624	 HUVENATION 	Pensi	28 Okt 2017 - 04 Nov 2017	04:00 - 10:00	JL. Boulevard Timur Kelapa Gading	\N	\N
623	 3rd Global Fashion Mentorship 	Seminar	24  - 24 Okt 2017	10:00 - 12:00	Grand Mahakam Hotel 	\N	\N
622	 Seminar Bulan Bahasa UGM Menyingkap Asa Menuju Bulan Kolaborasi Dua Semesta 	Seminar	11  - 11 Nov 2017	09:00 - 13:00	Auditorium FIB UGM	\N	\N
621	 GEMU (Gebyar Edukasi Matematika UNSIKA) 	Seminar	11  - 11 Nov 2017	07:00 - 16:00	Aula Universitas Singaperbangsa Karawang ( UNSIKA )	\N	\N
619	 Seminar Nasional 7th Airlangga Ideas Competition 	Seminar	05  - 05 Nov 2017	07:00 - 15:00	Aula Fadjar Notonegoro, Lantai 2 Fakultas Ekonomi dan Bisnis Universitas Airlangga Surabaya	\N	\N
618	 HEST (HIMEDIA E-Sport Tournament) 	Lain-lain	13  - 17 Nov 2017	15:00 - 21:00	Politeknik Negeri Media Kreatif Jakarta	\N	\N
616	 Seminar Nasional Web Application and Digital Marketing 	Seminar	26  - 26 Nov 2017	08:00 - 15:00	Balroom Grand Lingga @Hotel Mercure	\N	\N
615	 WORKSHOP METODOLOGI DALAM PENELITIAN PSIKOLOGI SOSIAL 	Seminar	28  - 28 Okt 2017	08:00 - 00:00	Universitas Airlangga	\N	\N
614	 WORKSHOP DAY 	Seminar	18  - 18 Nov 2017	09:00 - 14:00	GS FAME Institute of Business	\N	\N
612	 DISKUSI BULANAN: SARASEHAN BERSAMA TOMY HENDRAJATI (Program Director at The Humanitarian Foundation PKPU) 	Lain-lain	25  - 25 Okt 2017	09:00 - 12:00	DIORAMA HARUN NASUTION UIN SYARIFHIDAYATULLAH JAKARTA	\N	\N
611	 [SEMNAS] Pendidikan Islam 	Seminar	11  - 11 Okt 2017	07:30 - 12:00	C7 FIS UNNES	\N	\N
610	 ORENJI 2017 	Lain-lain	29  - 29 Okt 2017	08:30 - 19:30	Gedung Fakultas Ilmu Budaya Undip Tembalang	\N	\N
609	 Himalogista Great Event 	Lain-lain	22  - 22 Okt 2017	07:00 - 15:00	Alun-Alun Kota Malang	\N	\N
608	 Chemical Engineering week 3rd 	Lain-lain	10  - 13 Jan 2018	08:00 - 13:00	jl veteran kompleks pt semen indonesia gresik jawa timur 	\N	\N
607	 GEOPHORIA 2017 	Pensi	18  - 18 Nov 2017	17:00 - 00:00	STADION KRIDOSONO YOGYAKARTA	\N	\N
606	 Dies Natalis PKnH  	Musik	14  - 14 Des 2017	18:00 - 22:30	Auditorium UNY	\N	\N
605	 Introduction To Psychology: Fulfilling Your Curiosity 	Lain-lain	28  - 29 Okt 2017	08:00 - 16:30	Fakultas Psikologi Universitas Indonesia	\N	\N
604	 DENSCUP XVIII 	Sport	23 Okt 2017 - 04 Nov 2017	16:00 - 22:00	GOR Seskoal, Kebayoran Lama, Jakarta Selatan	\N	\N
603	 SMAPA WONDERLAND 	Musik	29  - 29 Okt 2017	13:00 - 23:00	Tirtyasa Park	\N	\N
602	 Diskusi Kebudayan 	Seminar	16 Okt 2017 - 08 Nov 2017	07:00 - 12:00	Gedung Pertemuan Universitas Trunojoyo Madura	\N	\N
601	 Donasi Bakti Sosial IKM FIB UI 2017 	Lain-lain	10  - 12 Nov 2017	00:00 - 00:00	Kampung Baru	\N	\N
599	 Kriminologi Fair 2017 	Lain-lain	30 Okt 2017 - 02 Nov 2017	07:00 - 18:00	Universitas Budi Luhur	\N	\N
598	 Calling For Tenant! Business Day #2 Reach The Future 	Lain-lain	03  - 03 Nov 2017	14:00 - 22:00	GSG Giri Loka UPN Veteran Jawa Timur	\N	\N
597	 Business Day #2 Reach The Future 	Musik	03  - 03 Nov 2017	14:00 - 23:00	GSG Giri Loka UPN Veteran Jawa Timur	\N	\N
595	 Seminar Nasional Kewirausahaan 	Seminar	19  - 19 Nov 2017	07:30 - 13:00	Gedung Serba Guna UNESA Ketintang	\N	\N
594	 Healthy Festival 2017 	Lain-lain	01 Okt 2017 - 11 Nov 2017	08:30 - 15:00	Fakultas Kedokteran dan Ilmu Kesehatan UIN Syarif Hidayatullah Jakarta 	\N	\N
591	 Seminar Jurnalistik 	Seminar	18  - 18 Okt 2017	08:00 - 13:00	Universitas Trilogi Auditorium Lt 2	\N	\N
590	 HIMASI Fest 	Seminar	22  - 22 Okt 2017	07:30 - 16:00	AMEC Fakultas Kedokteran Kampus A, Universitas Airlangga	\N	\N
589	 Haflah Miladiyah PAI ke 24 UIN SUNAN AMPEL SURABAYA 	Lain-lain	11 Agu 2017 - 05 Nov 2017	00:00 - 00:00	UIN SUNAN AMPEL SURABAYA	\N	\N
588	 KALEIDOSCOPE : Pre Event 2 - From 2 With Love 	Pensi	21  - 21 Okt 2017	10:00 - 18:00	SMA Negeri 2 Bandung Jl.Cihampelas No.137	\N	\N
587	 NATIONAL SEMINAR GREEN TECHNOLOGY CREATION UNDIP 2017 	Seminar	04  - 04 Nov 2017	08:00 - 14:00	DIKLAT PROVINSI JATENG	\N	\N
586	 SIMULASI BURSA SAHAM XX 	Seminar	23  - 26 Okt 2017	08:00 - 17:00	Kampus II Universitas Tarumanagara	\N	\N
585	 Business Plan Competition The 12th Management e[X]posed FEB UI 	Lain-lain	28 Agu 2017 - 29 Okt 2017	09:00 - 17:00	Fakultas Ekonomi dan Bisnis Universitas Indonesia	\N	\N
584	 Business Day #2 Reach The Future 	Pensi	03  - 03 Nov 2017	14:00 - 23:00	GSG Giri Loka UPN Veteran Jawa Timur	\N	\N
583	 National Welfare Competition II: Lomba Poster Infographics Nasional 	Lain-lain	23 Sep 2017 - 25 Okt 2017	00:00 - 00:00	ONLINE	\N	\N
582	 National Welfare Competition II: Lomba Essay Nasional 	Lain-lain	23 Sep 2017 - 25 Okt 2017	00:00 - 00:00	FAKULTAS ILMU SOSIAL DAN ILMU POLITIK, UNIVERSITAS JEMBER	\N	\N
581	 Himatif UNPAD - INFORMATICS FESTIVAL 2017 : Inscape 2017 	Musik	22  - 22 Okt 2017	14:00 - 22:00	Lapangan PPBS, UNIVERSITAS PADJADJARAN, JATINANGOR	\N	\N
579	 SEMINAR NASIONAL SOCIOPRENEUR 	Seminar	29  - 29 Okt 2017	07:00 - 13:00	Ruang Borobudur Gedung LP2M, Universitas Negeri Semarang	\N	\N
578	 Fisiphoria Festival 2017 	Musik	22  - 22 Okt 2017	16:00 - 23:00	Areal FISIP Kampus Sudirman	\N	\N
577	 CREMONA (CIVIL' CREATIVITY AND CEREMONIA) 	Musik	27  - 27 Okt 2017	15:00 - 00:00	TUNJUNGAN CONVENTION HALL	\N	\N
576	 Pelatihan HOW TO BE A GREAT PUBLIC SPEAKER 	Lain-lain	14  - 14 Okt 2017	08:00 - 17:00	Sekolah Tinggi Teknologi Muhammadiyah Cileungsi	\N	\N
575	 Kompetisi Video Promosi Kesehatan 	Lain-lain	27  - 03 Okt 2017	00:00 - 00:00	Politeknik Kesehatan Kemenkes Malang (Online)	\N	\N
574	 Smanda Metamorphosis 2017 	Pensi	07  - 07 Okt 2017	04:00 - 00:00	SMA Negeri 2 Semarang	\N	\N
572	 National Essay Competition Universitas Negeri Semarang 	Lain-lain	11 Sep 2017 - 02 Nov 2017	00:00 - 00:00	Universitas Negeri Semarang	\N	\N
571	 National Video and Essay Competition UKM Penelitian 2017 	Lain-lain	10 Sep 2017 - 10 Nov 2017	08:00 - 06:00	Balai Penelitian Teknologi Mineral	\N	\N
570	 Donor Darah Bakti Sosial IKM FIB UI 2017 	Lain-lain	10  - 10 Okt 2017	10:00 - 13:00	Kulkas Auditorium Gedung IX Fakultas Ilmu Pengetahuan Budaya Universitas Indonesia (FIB UI)	\N	\N
568	 Diesntalis Fakultas Vokasi 	Expo	12  - 12 Nov 2017	15:00 - 23:30	Convention Hall Tunjungan Plaza Surabaya	\N	\N
567	 Women Hero 2.0 	Lain-lain	02  - 21 Okt 2017	00:00 - 00:00	Universitas Airlangga	\N	\N
566	 DEUTSCHE WOCHE XXI 	Lain-lain	21  - 21 Okt 2017	06:00 - 17:00	Fakultas Bahasa dan Seni Universitas Negeri Surabaya Kampus Lidah Wetan, Surabaya	\N	\N
565	 DEUTSCHE WOCHE XXI 	Lain-lain	21  - 21 Okt 2017	06:00 - 17:00	Fakultas Bahasa dan Seni Universitas Negeri Surabaya Kampus Lidah Wetan	\N	\N
564	 Seminar Nasional The Secret of Mindshet 	Seminar	26  - 26 Okt 2017	08:00 - 12:00	Auditorium lt 6 Gedung Syaifudin Zuhri, IAIN Tulungagung	\N	\N
562	 OLIMPIADE KIMIA dan PCl5 (KEF VII) 	Lain-lain	21  - 21 Okt 2017	00:00 - 00:00	Gedung D FKIP UNS	\N	\N
561	 SEMINAR NASIONAL (KEF VII) 	Seminar	21  - 21 Okt 2017	08:00 - 12:00	Aula Pascasarjana Lantai 3 FKIP UNS	\N	\N
560	 Disk-On! IYD Jabodetabek 	Seminar	07  - 07 Okt 2017	19:00 - 21:00	Jakarta	\N	\N
559	 Workshop Geofisika 2k17 	Lain-lain	20 Nov 2017 - 28 Sep 2017	05:00 - 06:00	Desa kasinan , dan songgoriti	\N	\N
558	 CANDY (Current Management of Disease in Pregnancy) 	Seminar	25  - 26 Nov 2017	08:00 - 16:00	South Quarter Tower B Lantai 18, Jalan RA. Kartini Kav. 8, Cilandak Barat	\N	\N
557	 REEF CHECK MADURA dan PULAU AIR 	Sport	19  - 22 Okt 2017	13:00 - 18:00	Pulau Talango-Gili Labak	\N	\N
556	 OrangUtan Competition 2017 	Sport	23  - 28 Okt 2017	15:30 - 21:30	score futsal Yogyakarta, academy futsal and basketball, SMP N 1 Yogyakarta	\N	\N
555	 Haflah Miladiyah PAI ke 24 	Lain-lain	11 Agu 2017 - 05 Okt 2017	00:00 - 00:00	UIN SUNAN AMPEL SURABAYA	\N	\N
554	 Jogjajanan 	Musik	14  - 15 Okt 2017	10:30 - 11:00	PKKH UGM	\N	\N
553	 LKTI VI NASIONAL FKM UNAND 	Lain-lain	27 Sep 2017 - 19 Nov 2017	00:00 - 23:55	UNIVERSITAS ANDALAS	\N	\N
551	 Pemuda Mendunia Chapter Korea Selatan 	Seminar	24  - 29 Nov 2017	20:55 - 21:40	Jakarta dan Seoul	\N	\N
548	 SEMINAR NASIONAL 2017 SENAT MAHASISWA FAKULTAS ILMU BUDAYA UNUD 	Seminar	21  - 21 Okt 2017	08:00 - 03:00	Auditorium Widya Sabha Mandala, Fakultas Ilmu Budaya, Universitas Udayana, Sanglah-Denpasar.	\N	\N
547	 Solo Glow Run Heritage 	Expo	26  - 28 Okt 2017	13:00 - 22:00	Benteng Vastenburg	\N	\N
546	 &quot;GRAND SEMINAR&quot; The 4th Padjadjaran Financial Festival   	Seminar	03  - 03 Okt 2017	08:00 - 15:00	Graha Sanusi Hardjadinata, Kampus Unpad Dipatiukur	\N	\N
544	 SEMINAR DAN TALKSHOW NASIONAL THE TALK 	Seminar	28  - 28 Okt 2017	10:00 - 16:30	AUDITORIUM UNIVERSITAS SEBELAS MARET 	\N	\N
543	 SNKM I (Seminar Nasional Kesehatan Masyarakat) 	Seminar	02  - 02 Okt 2017	09:00 - 13:00	Ballroom Kemala Universitas Esa Unggul Kebon Jeruk	\N	\N
542	 Tazkia Accounting Competition (TAC 2107) 	Lain-lain	05  - 05 Nov 2017	07:00 - 14:00	Kampus STEI TAZKIA	\N	\N
540	 Hifsal Competition ( Hifdzil Quran 5 juz dan Futsal Competition) 	Lain-lain	25  - 26 Nov 2017	08:00 - 17:00	Futsal : Gool Mangga Dua dan lomba Hifdzil 5juz : kafe Fastron Unusa kampus B jemursari	\N	\N
539	 Internet Of Thing 	Lain-lain	21  - 25 Sep 2017	08:00 - 08:00	Universitas Jenderal Soedirman	\N	\N
538	 Line Tracer Soedirman 	Lain-lain	14  - 14 Okt 2017	07:00 - 13:58	AUDITORIUM GRAHA WIDYATAMA UNIVERSITAS JENDERAL SOEDIRMAN	\N	\N
537	 CBC BMC 2017 	Lain-lain	01  - 01 Sep 2017	07:00 - 15:00	UNIVERSITAS NEGERI SURABAYA	\N	\N
536	 Sayembara Pena Kita 2017 	Lain-lain	10 Agu 2017 - 10 Okt 2017	00:00 - 00:00	eventkampus.com	\N	\N
535	 Spiritual and Motivation Training 	Seminar	17  - 17 Sep 2017	07:00 - 16:00	Audit JICA Universitas Pendidikan Indonesia	\N	\N
534	 INFORMATICS FESTIVAL 2017 - Inscape 2017 	Musik	22  - 22 Okt 2017	14:00 - 21:00	Lapangan PPBS , UNIVERSITAS PADJADJARAN, JATINANGOR	\N	\N
533	 Trend Manufacturing di Indonesia 	Seminar	30  - 30 Sep 2017	12:30 - 17:30	Sekolah Tinggi Teknologi Muhammadiyah Cileungsi	\N	\N
532	 KULIAH UMUM STIE KESATUAN BOGOR 2017 	Seminar	18  - 18 Sep 2017	08:00 - 18:00	STIE KESATUAN BOGOR	\N	\N
531	 Pharmacy Festival 2017 	Seminar	25  - 25 Nov 2017	08:00 - 16:00	Universitas Indonesia	\N	\N
530	 Laut cup 2017 	Sport	09  - 13 Okt 2017	14:00 - 20:00	Lapangan UPT Universitas Negeri Jakarta	\N	\N
529	 IDEACON 2017 	Seminar	23  - 23 Sep 2017	08:00 - 12:00	HOTEL AMARIS Jl. Diponegoro	\N	\N
528	 ROBOLINE CONTEST 	Lain-lain	18  - 19 Nov 2017	13:00 - 17:00	Auditorium Unniversitas Negeri Semarang	\N	\N
527	 FESTIVAL KESEHATAN DAN DONOR DARAH KSR PMI UNIT UIN SYARIF HIDAYATULLAH JAKARTA 	Seminar	19  - 21 Sep 2017	08:00 - 16:00	Kampus 1 UIN SYARIF HIDAYATULLAH JAKARTA	\N	\N
526	 INETOR 2017 	Lain-lain	10  - 11 Nov 2017	08:00 - 17:00	President University, Jababeka, Cikarang	\N	\N
525	 MEDITATION 2017 	Seminar	13  - 15 Okt 2017	11:00 - 17:00	Hotel MM UGM dan Auditorium MM UGM	\N	\N
524	 Bandung Melody 	Musik	28  - 28 Okt 2017	10:00 - 10:00	Sasana Budaya Ganesha (SABUGA)	\N	\N
523	 SEMINAR NASIONAL &amp;amp;amp;amp;amp;amp; BUSINESS INOVATION  	Seminar	30  - 30 Sep 2017	07:00 - 15:00	Ballroom Hotel Alana	\N	\N
522	 Indonesian Youth Dream Camp 2017 	Lain-lain	23  - 26 Nov 2017	08:00 - 14:00	Gedung LPMP D.I. Yogyakarta	\N	\N
521	 Seminar Leadership  	Seminar	23  - 23 Sep 2017	09:00 - 12:00	Viglosia Building, Jl Yos Sudarso No.21, kotabaru, Gondokusuman, kota Yogyakarta	\N	\N
520	 Workshop Falah 2017 	Seminar	30  - 30 Nov -1	00:00 - 08:00	FEB Unair	\N	\N
516	 Lawbillity#2 	Musik	03  - 03 Nov 2017	16:00 - 23:00	Stadion Diponegoro Semarang	\N	\N
515	 UI Career & Scholarship Expo XXIV 2017 	Expo	14  - 16 Sep 2017	09:00 - 17:00	Balairung UI Depok	\N	\N
514	 Seminar Nasional Hari Kesehatan Nasional FKM UNAIR 2017 	Seminar	11  - 11 Nov 2017	07:00 - 12:00	Gedung AMEC Fakultas Kedokteran Kampus A UNAIR Surabaya	\N	\N
513	 ARTHADEMENTIA EXHIBITION.Â  	Lain-lain	05  - 08 Sep 2017	00:00 - 00:00	Gedung Bale Dayang Sumbi  Institut Teknologi Nasional (ITENAS).	\N	\N
512	 SEMINAR NASIONAL SSC 2017 	Seminar	29  - 29 Okt 2017	07:30 - 12:30	UNIVERSITAS NEGERI SEMARANG	\N	\N
511	 Olimpiade Manajemen Nasional 2017 	Expo	27  - 29 Okt 2017	00:00 - 00:00	Fakultas Ekonomi Universitas Negeri Malang	\N	\N
510	 SEMINAR NASIONAL ALAM PSIKOLOGI KEWIRAUSAHAAN 	Seminar	09  - 09 Sep 2017	09:00 - 16:00	HUTAN PINUS IMOGIRI YOGYAKARYA	\N	\N
509	 VLOG COMPETITION TECHNO PRESENT 2017 	Lain-lain	22 Agu 2017 - 23 Sep 2017	00:00 - 23:00	Fakultas Teknologi Pertanian Universitas Brawijaya (Online)	\N	\N
508	 RK Mentee 2018 	Seminar	07  - 21 Jan 2018	07:00 - 12:00	Rumah Perubahan	\N	\N
507	 Kiat Menjadi Pengusaha Muslim Sukses 	Seminar	24  - 24 Sep 2017	13:00 - 14:30	Bg. Junction, Lt. L2 Star 3, Jl. Kranggan No. 8A, bubutan, Surabaya	\N	\N
506	 Trunojoyo Accounting Challenge (TAC) 	Lain-lain	29 Okt 2017 - 12 Nov 2017	07:00 - 00:00	Rayon dan Universitas Trunojoyo Madura, Surabaya	\N	\N
505	 SEMINAR NASIONAL KOMUNITAS @JAGOAKUNTANSI INDONESIA 	Seminar	07  - 08 Agu 2017	07:30 - 17:30	Hotel Sahid Bandar Lampung Jl. Yos Sudarso No.294, Sukaraja, Bumi Waras	\N	\N
503	 Stikom Futsal Championship 	Sport	25 Sep 2017 - 10 Okt 2017	15:00 - 08:00	Stikom surabaya lt 9 arena prestasi	\N	\N
501	 Mechanical Education Fair 	Seminar	05 Jul 2017 - 04 Nov 2017	07:00 - 12:00	Universitas Diponegoro	\N	\N
500	 Career Fair LokerLink  	Bursa Kerja	12  - 13 Sep 2017	09:00 - 17:00	Gedung Graha Cakrawala â€“ Universitas Negeri Malang. Jl. Semarang no. 5 Lowokwaru â€“ Malang	\N	\N
499	 Indonesia Career Expo 	Bursa Kerja	08  - 09 Sep 2017	09:00 - 17:00	Indonesia Convention Exhibition (ICE) BSD City, Tangerang	\N	\N
498	 Job Fair DMall Depok 	Bursa Kerja	06  - 07 Sep 2017	10:00 - 15:00	Dmall Lantai 2, Jl. Margonda Raya No.88, Kemiri Muka, Beji Kota Depok Jawa Barat 16423	\N	\N
497	 National Event Compeetition  Mewujudkan Indonesia Madani Melalui Peran Kesehatan Jiwa Masyarakat 	Lain-lain	06  - 08 Okt 2017	07:30 - 18:00	Universitas Islam Negeri Sultan Syarif Kasim Riau	\N	\N
496	 President Youth Leadership Camp 	Seminar	14  - 17 Sep 2017	07:00 - 15:00	Graha Ragunan Jakarta	\N	\N
495	 INFORMATICS FESTIVAL 2017 - Calling All Food Tenant for INSCAPE 2017 	Lain-lain	15 Agu 2017 - 01 Okt 2017	16:00 - 23:30	Lapangan PPBS D Universitas Padjadjaran, Jatinangor	\N	\N
494	 Senja (Seni Jurnalistik) 	Pensi	12  - 12 Okt 2017	08:00 - 18:00	GSG Giri Loka UPN Veteran Jawa Timur	\N	\N
493	 Pharmacy Expo UIN Jakarta 	Expo	15  - 22 Okt 2017	07:00 - 14:00	Ruang Auditorium Fakultas Kedokteran dan Ilmu Kesehatan UIN Jakarta	\N	\N
492	 LCF ASIA PACIFIC INTERNATIONAL MOOT COURT COMPETITION 	Lain-lain	27  - 29 Okt 2017	00:00 - 00:00	Badung	\N	\N
491	 LKTIN KEMAREHABNAS 2017 	Lain-lain	13 Jul 2017 - 31 Agu 2017	06:00 - 12:00	Pulau Pari, Kepualauan Seribu	\N	\N
490	 KATHINA PUJA 2561 BE / 2017 	Lain-lain	22  - 22 Okt 2017	17:00 - 21:00	AUDITORIUM LT.4 KAMPUS ANGGREK, BINUS UNIVERSITY	\N	\N
489	 CERCo 2017 : POSTER COMPETITION 	Lain-lain	15 Agu 2017 - 05 Sep 2017	00:00 - 00:00	Departemen Teknik Kimia, Fakultas Teknik, Universitas Diponegoro , Semarang	\N	\N
488	 MEDITATION 2017 	Seminar	13  - 15 Okt 2017	08:00 - 15:00	WISMA MM UGM DAN AUDITORIUM MM UGM	\N	\N
487	 IT's Journalist Fest 	Seminar	17  - 24 Sep 2017	08:00 - 14:00	Workshop: Kampus Diploma IPB     Seminar: Gedung Kemuning Gading	\N	\N
486	 EXPLOSION 2017 	Seminar	26 Agu 2017 - 30 Nov -1	08:00 - 00:00	Lab Kewirausahaan Fakultas Ekonomika dan Bisnis UNDIP Tembalang	\N	\N
485	 PEPC EXPO 2017 	Seminar	20  - 20 Sep 2017	08:00 - 16:00	Fakultas Ekonomi dan Bisnis Universitas Pancasila	\N	\N
484	 Seminar Nasional Be A Citizen Journalism, Say No To HOAX!!! 	Seminar	19  - 19 Sep 2017	08:00 - 13:00	Sasana Kridangga Kampus Kendeng Lantai 9 Universitas Stikubank Semarang	\N	\N
483	 INFORMATICS FESTIVAL 2017 - Band Audition Inscape 2017 	Lain-lain	14 Agu 2017 - 01 Okt 2017	08:00 - 16:00	Universitas Padjadjaran, Jatinangor	\N	\N
482	 UKM EXPO 2K17 	Expo	26  - 27 Agu 2017	14:00 - 00:00	Taman Alumni ITS	\N	\N
480	 The 17th Audit Conference (ATV) Fakultas Ekonomi dan Bisnis Universitas Indonesia 	Lain-lain	20  - 22 Nov 2017	09:00 - 17:00	Fakultas Ekonomi dan Bisnis Universitas Indonesia, Depok	\N	\N
479	 The 17th Audit Competition (ATV) Fakultas Ekonomi dan Bisnis Universitas Indonesia 	Seminar	20  - 22 Nov 2017	09:00 - 17:00	Fakultas Ekonomi dan Bisnis Universitas Indonesia, Depok	\N	\N
478	 SEMINAR BEASISWA STUDI LUAR NEGERI 	Seminar	09  - 09 Sep 2017	08:00 - 12:00	Digital Library Universitas Negeri Medan	\N	\N
476	 ESA Week 2017 	Lain-lain	14  - 15 Okt 2017	07:00 - 12:00	Fakultas Bahasa dan Seni, Unnes	\N	\N
475	 CAPSULE 2017 	Seminar	21  - 21 Okt 2017	08:00 - 17:00	Lumire Hotel and Convention Center	\N	\N
474	 LOMBA KARYA TULIS ILMIAH NASIONAL MATHEMATICS STUDENTS CLUB (MSC) 2017 	Lain-lain	30  - 30 Nov -1	07:00 - 00:00	FKIP UNIVERSITAS JEMBER	\N	\N
473	 International Development Student Conference (IDSC) 2017 	Lain-lain	08  - 11 Nov 2017	07:00 - 15:00	Universitas Airlangga	\N	\N
472	 Musyawarah Nasional (MUNAS) ke 5 Komunitas @JagoAkuntansi Indonesia 	Lain-lain	07  - 10 Sep 2017	06:00 - 18:30	Hotel Sahid Bandar Lampung Jl. Yos Sudarso No.294, Sukaraja, Bumi Waras	\N	\N
471	 OLIMPIADE SOSIOLOGI SE-INDONESIA 	Lain-lain	15  - 16 Nov 2017	06:30 - 16:15	UNIVERSITAS PENDIDIKAN INDONESIA	\N	\N
470	 PICMAN Color Run 2017 	Musik	17  - 17 Sep 2017	06:00 - 11:00	The Park Mall Solo Baru, Surakarta	\N	\N
469	 Lomba Cepat Tepat Ilmu Pangan (LCTIP) XXV 	Lain-lain	18 Jul 2017 - 03 Sep 2017	08:00 - 00:00	Kampus Institut Pertanian Bogor, Dramaga.	\N	\N
468	 INFORMATICS FESTIVAL 2017 - Seminar Nasional 	Seminar	21  - 21 Sep 2017	08:00 - 16:00	Graha Sanusi, Universitas Padjadjaran, Bandung	\N	\N
467	 Highlights of Pediatric Emergency (HOPE) 2017 	Seminar	07  - 08 Okt 2017	07:00 - 16:30	Mercure Hotel Jakarta, Cikini	\N	\N
466	 Solo Health Festival 	Lain-lain	27  - 27 Agu 2017	07:00 - 22:00	Balaikambang Surakarta	\N	\N
465	 National Business Case & Web Design Competition 	Lain-lain	01 Agu 2017 - 17 Sep 2017	00:00 - 00:00	Binus University Jakarta	\N	\N
464	 Debat Hukum Mahasiswa Nasional ULF 2017 	Lain-lain	10  - 12 Nov 2017	08:00 - 17:00	Fakultas Hukum Universitas Surabaya	\N	\N
463	 National Law Debate Competition Ubaya Law Fair 2017 	Lain-lain	03  - 05 Nov 2017	08:00 - 17:00	Fakultas Hukum Universitas Surabaya	\N	\N
462	 PICMAN Band Competition 	Musik	03  - 04 Sep 2017	10:00 - 15:00	The Park Mall Solo Baru	\N	\N
460	 SEMINAR NASIONAL 	Seminar	30  - 30 Agu 2017	07:00 - 17:00	GEDUNG GIRI PASCA UPN VETERAN JAWA TIMUR	\N	\N
459	 ENGLISH STORYTELLING COMPETITION 	Seminar	12  - 12 Agu 2017	08:00 - 16:00	Univet/Sukoharjo	\N	\N
458	 UKRIDA National Accounting Challenge 2017 (UNAC 2017) 	Lain-lain	06  - 08 Sep 2017	07:00 - 17:00	Kampus I UKRIDA, Jl. Tanjung Duren Raya No. 4	\N	\N
457	 ICC (INNOVACTION CONCRETE COMPETITION) 	Lain-lain	01 Jul 2017 - 17 Okt 2017	08:00 - 17:00	UPN VETERAN JAWA TIMUR	\N	\N
456	 RIDESCO (BRIDGE DESIGN COMPETITION) 	Lain-lain	01 Jul 2017 - 20 Sep 2017	08:00 - 17:00	UPN VETERAN JAWA TIMUR	\N	\N
455	 NATURAL  SCIENCE OLYMPIAD VII 	Lain-lain	16 Sep 2017 - 14 Okt 2017	00:00 - 00:00	Semarang, Â Purwokerto, Â Pekalongan, Â  Kudus, Â Surakarta, Â Magelang, Â dan YogyakartaÂ 	\N	\N
454	 LOMBA ESAI NASIONAL 	Seminar	10 Jul 2017 - 09 Sep 2017	00:00 - 00:00	UNIVERSITAS NEGERI MEDAN	\N	\N
453	 Psyculture 2017 	Lain-lain	16  - 16 Sep 2017	08:00 - 17:30	Student Center UIN Syarif Hidayatullah Jakarta (Kampus 1) 	\N	\N
452	 CUPID (Common Urologic Problems in Daily Primary Practice) 2017 	Seminar	30 Sep 2017 - 01 Okt 2017	07:00 - 16:00	Auditorium RSCM Kirana lt. 6	\N	\N
451	 Geoexpedition 	Sport	08  - 10 Sep 2017	09:00 - 17:00	Welirang Mountain	\N	\N
450	 CROWN CUP 2017 	Sport	12  - 26 Agu 2017	08:00 - 20:00	Lapangan Futsal dan GOR Kampus C Universitas Airlangga	\N	\N
449	 YOT Green 2017 #SaveMuaraGembong 	Lain-lain	22  - 22 Jul 2017	10:00 - 16:00	Pantai Bahagia, Muara Gembong	\N	\N
448	 UMS Solo - Job Fair 2017 	Bursa Kerja	18  - 19 Jul 2017	09:00 - 16:00	GOR UMS Kampus 2	\N	\N
447	 Art for Culture 	Musik	16  - 16 Sep 2017	13:00 - 23:00	Stadion 45 Karanganyar	\N	\N
445	 The 16th Symposium in Clinical Cardiology and ECG Course (SYMCARD) 	Seminar	02  - 10 Sep 2017	08:00 - 16:00	RS PJN Harapan Kita	\N	\N
444	 Kejuaraan karate antar Pelajar se-Jawa Bali FIK UNESA th. 2017 	Sport	23  - 24 Sep 2017	08:00 - 21:00	GOR Bima kampus UNESA lidah wetan	\N	\N
441	 [SPORT] PENDAFTARAN SPARE XI (SPORT &amp; ART EVENT XI) 	Sport	01 Mei 2017 - 23 Jul 2017	00:00 - 00:00	Fakultas Kesehatan Masyarakat Universitas Indonesia	\N	\N
440	 National Business Case Competition 2017 Universitas Airlangga 	Lain-lain	20  - 22 Okt 2017	08:00 - 16:00	Universitas Airlangga	\N	\N
439	 [ART] PENDAFTARAN SPARE XI (SPORT &amp; ART EVENT XI) 	Musik	01 Mei 2017 - 23 Jul 2017	00:00 - 00:00	Fakultas Kesehatan Masyarakat Universitas Indonesia	\N	\N
436	 Civil Days 2017 - Seminar Nasional Teknik Sipil dan Call For Paper 	Seminar	13  - 13 Sep 2017	07:00 - 12:00	Gedung Sasana Budaya, Universitas Negeri Malang (UM)	\N	\N
435	 Information Technology Creative Competition 2017 	Lain-lain	12  - 13 Okt 2017	07:30 - 05:00	Kampus Teknologi Informasi, Fakultas Teknik, Bukit Jimbaran 	\N	\N
434	 Lomba Karya Tulis Ilmiah Nasional dan Seminar Nasional IDE XIV 2017 	Lain-lain	05 Jul 2017 - 14 Okt 2017	08:00 - 17:00	Fakultas Ekonomi dan Bisnis Universitas Brawijaya	\N	\N
433	 Seminar Nasional Pendidikan IPA Pascasarjana UM Tahun 2017 	Seminar	30  - 30 Sep 2017	08:00 - 17:00	Gedung Pascasarjana Universitas Negeri Malang	\N	\N
432	 Business Plan Competition SHARIA ECONOMIC EVENT SOUTH EAST ASIA 2017 	Lain-lain	16  - 17 Nov 2017	13:00 - 20:00	Fakultas Ekonomi dan Bisnis Universitas Brawijaya	\N	\N
431	 Call For Paper SHARIA ECONOMIC EVENT SOUTH EAST ASIA 2017 	Lain-lain	16  - 17 Nov 2017	13:00 - 20:00	Fakultas Ekonomi dan Bisnis Universitas Brawijaya	\N	\N
430	 Grand Launching Rumah Millennials 	Seminar	22  - 22 Jul 2017	09:30 - 17:00	Auditorium lt 3 Galeri Smartfren Sabang Jl. H. Agus Salim No.45 - Jakarta Pusat	\N	\N
429	 Workshop Farmasi PHARMTASTIC 2017  	Seminar	15  - 15 Jul 2017	07:00 - 17:00	Universitas Ma Chung	\N	\N
428	 Simposium dan Workshop Alveoli 	Seminar	16  - 16 Jul 2017	07:00 - 18:00	Emerald Grand Ballroom Solo Paragon Hotel	\N	\N
427	 Festival Teater Pelajar #5 	Lain-lain	23  - 28 Okt 2017	00:00 - 00:00	Gd. pertunjukan Sawunggaling UNESA Surabaya	\N	\N
426	 Olimpiade Pasar Modal 2017 (Tingkat SMA/SMK/MA Sederajat Nasional) 	Lain-lain	17  - 17 Sep 2017	06:00 - 16:30	Fakultas Ekonomi Universitas Negeri Malang	\N	\N
425	 Java Bali IT Competition 2017(JB-ITC 2017) 	Lain-lain	19  - 20 Sep 2017	07:00 - 15:00	Universitas Negeri Malang	\N	\N
424	 Seminar Nasional Pasar Modal  	Seminar	22 Jul 2017 - 30 Nov -1	07:30 - 15:00	Gedung E lantai 3 Universitas Dian Nuswantoro	\N	\N
423	 ACSENT ( Accounting Society Event ) 	Seminar	30  - 30 Sep 2017	07:00 - 15:00	Gedung Wanita Jalan Sriwijaya No.29 Kota Semarang	\N	\N
422	 History Week  	Lain-lain	01 Jun 2017 - 20 Agu 2017	23:59 - 23:59	Online	\N	\N
421	 COMMUNICATION WEEK 2017 THE ART OF COMMUNICATION 	Seminar	19  - 22 Jun 2017	15:30 - 00:00	EMPORIUM PLUIT MALL (main atrium)	\N	\N
420	 NACTEF 2017 (National Conference of Teacher Training and Education Faculty) 	Seminar	02  - 03 Sep 2017	07:00 - 14:00	Gedung Soetardjo Universitas Jember	\N	\N
419	 HRMotion (Human Resource Management On Competition) 	Lain-lain	16  - 17 Sep 2017	06:30 - 15:30	Aula Gedung L Fakultas Ekonomi Universitas Negeri Semarang, Semarang	\N	\N
418	 Competition of National Economic Research and Innovation Paper (CONCERNS) 	Lain-lain	05 Jun 2017 - 09 Jul 2017	00:00 - 00:00	Fakultas Ekonomika dan Bisnis Universitas Diponegoro	\N	\N
417	 Seminar Keprofesian  	Seminar	15 Jun 2017 - 15 Jul 2017	00:00 - 00:00	universitas padjadjaran	\N	\N
416	 Seminar Pendidikan Karakter  	Seminar	14  - 14 Jun 2017	07:00 - 12:00	AULA SMAN 1 NGANTANG	\N	\N
415	 History Week 	Seminar	26  - 26 Agu 2017	08:00 - 12:00	Auditorium FIB UGM	\N	\N
413	 BUMN JOB FAIR 2017 Depok  	Bursa Kerja	11  - 12 Okt 2017	10:00 - 15:00	HOTEL BUMI WIYATA â€“ DEPOK	\N	\N
412	 JOBFAIR BANDUNG 	Bursa Kerja	25  - 26 Jul 2017	10:00 - 15:00	BTC Fashion Mall Lantai P1 (Balarea Convention Hall), Jl.Dr.Djunjunan No.143-149,Kota Bandung	\N	\N
411	 Mega Career Expo Bandung  	Bursa Kerja	18  - 19 Jul 2017	10:00 - 18:00	Gedung Sabuga Convention Hall, Jl Tamansari No 73, Bandung	\N	\N
410	 Job Fair â€‹Robinson Cibinong 	Bursa Kerja	18  - 19 Jul 2017	10:00 - 16:00	Robinson Cibinong City Point Lantai Dasar, Jl. HR. Lukman No.17, Cirimekar, Cibinong, Bogor, Jawa Ba	\N	\N
409	 Career Carnival Jakarta  	Bursa Kerja	13  - 14 Jul 2017	10:00 - 15:00	Gedung Nyi Ageng Serang, HR Rasuna Said, Kuningan Jakarta Selatan (GOR Soemantri Brojonegoro â€“ Epi	\N	\N
408	 Indonesia Career Expo Bandung 	Bursa Kerja	12  - 13 Jul 2017	09:00 - 17:00	Sabuga ITB Bandung	\N	\N
407	 Mega Career Expo Jakarta 	Bursa Kerja	12  - 13 Jul 2017	10:00 - 17:00	Gedung Smesco Exhibition Hall, Jl. Jend. Gatot Subroto Kav 94, Jakarta Selatan	\N	\N
406	 Job Fair Kota Bekasi  	Bursa Kerja	11  - 12 Jul 2017	10:00 - 15:00	GRAND MALL BEKASI LT.03, Jl.Jend.Sudirman No.01,Kranji,Kota Bekasi	\N	\N
405	 SMARTEC #1 Seminar Nasional - Pengembangan Infrastruktur dalam Mewujudkan Pembangunan Kota Pintar 	Seminar	26  - 26 Jul 2017	08:00 - 04:00	Hotel Pesona Semarang	\N	\N
404	 SHARIA FAIR 	Expo	23  - 29 Okt 2017	10:00 - 20:30	Center Point Royal Plaza	\N	\N
403	 Seminar Nasional 	Seminar	22  - 22 Jul 2017	07:00 - 12:00	Ex. Gedung Siola LT 4, Tunjungan Sby	\N	\N
402	 Focus Group Discussion dengan tema â€œ Kompetensi Mahasiswa Hukum Universitas Terbuka Dalam Era Kebangkitan Hukum dan Era Digitalisasi Hukum Indonesia â€. 	Lain-lain	25 Peb 2018 - 25 Des 2017	08:00 - 13:00	 Ruang Auditorium ( Serba Guna ) FMIPA  Jalan Cabe Raya, Pondok Cabe Pamulang Tangerang 	\N	\N
401	 English Contest UNSIKA Se-Jawa Barat 	Lain-lain	07  - 08 Agu 2017	07:00 - 04:00	Universitas Singaperbangsa Karawang	\N	\N
400	 Seminar Cara Memulai Dropship Dari Nol Sampai Jutaan 	Seminar	17  - 17 Jun 2017	16:00 - 08:00	Nelongso Dieng, Jalan Dieng No. 27 Malang	\N	\N
399	 *SEMINAR AKSARA* 	Seminar	12  - 12 Jun 2017	08:00 - 16:00	Aula Maftuchah Yusuf, Gd. Dewi Sartika Lantai II, Kampus A Universitas Negeri Jakarta	\N	\N
398	 ðŸŽ¬Seminar Perfilman PendidikanðŸŽ“ 	Seminar	14  - 14 Jun 2017	08:00 - 15:00	 Aula Maftuhah Yusuf, Gd. Dewi Sartika lantai 2, Universitas Negeri Jakarta	\N	\N
397	 Seminar Kewirausahaan 2017 	Seminar	17  - 17 Jun 2017	08:00 - 12:00	Gor Unitri 	\N	\N
396	 CompFest 9  	Seminar	18 Mei 2017 - 18 Jun 2017	08:00 - 23:55	Universitas Indonesia, Depok	\N	\N
395	 Talkshow &quot;Sastra dalam Layar Kaca&quot; 	Seminar	20  - 20 Mei 2017	08:00 - 13:00	Ruang Seminar Gd. 3 Lt.2 FIB UNS	\N	\N
394	  ðŸŽª *SEMINAR NASIONAL DAN PAMERAN*ðŸŽª 	Seminar	20  - 20 Mei 2017	08:00 - 13:00	Ruang Seminar Gd.1 lt. 3 FIB UNS	\N	\N
393	 Talkshow  &quot;Berkomunitas Sosial Bersama Lentera&quot; 	Seminar	18  - 18 Mei 2017	14:00 - 16:00	Ruang Seminar, Gedung 1 Lantai 2 FISIP UNS	\N	\N
391	 SEMINAR NASIONAL&quot;PSIKOLOGI MENJAWAB FENOMENA TERKINI DALAM DUNIA PENDIDIKAN DI INDONESIA&quot; 	Seminar	18  - 18 Mar 2017	07:00 - 12:00	Auditorium O5 Fakultas Ilmu Pendidikan UNESA	\N	\N
390	 &quot;Green Building Seminar&quot; 	Seminar	23  - 23 Apr 2017	11:30 - 14:30	Galaxy Exhibition Center, Galaxy Mall lt. 6	\N	\N
389	 Seminar Nasional Interpersonal &amp; Life Skill 2017 	Seminar	19  - 19 Jan 2017	08:00 - 13:00	Gedung Agrokomplek Lt.4, Aula Nusantara, Kampus UNUD Sudirman, Jl. PB Sudirman Denpasar	\N	\N
388	 &quot;Believe in Yourself to be A Smart and Innovate Entrepreneur&quot; 	Seminar	07  - 07 Mei 2017	08:00 - 13:00	Aula BKD Wisma Sultan Sulaiman	\N	\N
387	 Workshop ðŸ’¦How to CREATE SYSTEM That RUNS WITHOUT You ðŸ’¦ 	Seminar	15  - 15 Jun 2017	08:30 - 17:00	Hotel Four Points by Sheraton, Jl. Embong Malang Sby	\N	\N
386	 Modern TemplatingÂ  	Seminar	17  - 17 Jun 2017	15:00 - 18:00	Ruang Seminar FTK, lt. 3, Fakultas Teknologi Kelautan	\N	\N
385	 Beauty Inside You 	Lain-lain	18  - 18 Jun 2017	15:30 - 18:00	Auditorium Prof. Harun Zain,Universitas Mercu Buana, Meruya 	\N	\N
384	 DEFINE ( Diponegoro Finance National Competition) 	Lain-lain	13  - 16 Sep 2017	08:00 - 15:00	Hall Ged C, Fakultas Ekonomika dan Bisnis UNDIP & BI Semarang	\N	\N
383	 Seminar nasional perlindungan hukum tenaga kerja indonesia dalam era masyarakat ekonomi asean (Mea) 	Seminar	24  - 24 Agu 2017	08:00 - 12:00	Universitas Terbuka Jakarta. jalan .Ahmad Yani no.43 kel. utan kayu kec.matraman rt.5 rw.4 .jaktim	\N	\N
382	 Seminar Rukyatul Hilal 	Seminar	25  - 25 Mei 2017	08:00 - 13:00	Aula Abdjan Soelaeman UIN SGD Bandung	\N	\N
381	 â€œ4th Congress of Indonesian Diaspora (CID 4)â€ 	Seminar	01  - 01 Jul 2017	07:00 - 20:30	Kota Kasablanka Mall, Jakarta Selatan, Indonesia	\N	\N
380	 CALLING ALL ENGINEERING AND SCIENTIST STUDENTS ALL OVER ASEAN!! 	Lain-lain	06  - 10 Sep 2017	00:00 - 00:00	Institut Teknologi Sepuluh Nopember	\N	\N
379	  Forget The Hoop! Embroider Canvas Shoes  	Expo	17  - 17 Jun 2017	16:00 - 18:00	Di Lettuce Cafe  (Erlangga Raya/ 28 Semarang)	\N	\N
378	  BAKTI SOSIAL 	Lain-lain	16  - 18 Jun 2017	16:00 - 18:00	KURANJI PADANG	\N	\N
377	 BUKA BERSAMA 99 ANAK YATIM DOLLY 	Lain-lain	22  - 22 Jun 2017	00:00 - 00:00	surabaya	\N	\N
376	 ðŸ’»SEMINAR INTERNET SEHATðŸ’» 	Seminar	20  - 20 Jun 2017	14:00 - 17:00	Aula Kampus BSI KaliabangÂ  Jl raya Kaliabang No 8 Perwira Bekasi Utara	\N	\N
375	 SANSKERTA 2017 DÃ©jÃ  vu 	Expo	17  - 17 Jun 2017	14:30 - 21:30	Graha Bhakti Budaya, Taman Ismail Marzuki.	\N	\N
374	 Singing Competition 	Musik	01 Jun 2017 - 10 Jul 2017	08:00 - 20:00	Grandioso, Musik Malang. The Ultimate Art Education, jl Raya Dieng No. 1C, Malang	\N	\N
373	 Seminar Jurnalistik 	Seminar	20  - 20 Mei 2017	08:00 - 13:00	Aula Rektorat Lantai 4 Unmul	\N	\N
372	 &quot;INTERNATIONAL SEMINAR&quot; 	Seminar	15  - 15 Mei 2017	08:00 - 13:00	Sportorium UMY	\N	\N
371	 -Seminar Nasional Pasar Modal- ðŸ“ˆ&quot;The Power of Capital Market&quot; ðŸ“ˆ 	Seminar	13  - 13 Mei 2017	08:00 - 13:00	 Ruang Seminar Lt. 3 STIE YKPN Yogyakarta	\N	\N
370	 &quot;The Influence of World Political Revolution Towards Asia Economy&quot; 	Seminar	20  - 20 Mei 2017	08:00 - 12:00	Seminar Room, 3rd floor STIE YKPN YOGYAKARTA	\N	\N
369	 Seminar Nasional  	Seminar	20  - 20 Mei 2017	07:00 - 12:00	Gedung UNNES SEKARAN	\N	\N
368	 Seminar Nasional Kesehatan  	Seminar	14  - 14 Mei 2017	07:00 - 12:00	Auditorium Graha Bina Husada Poltekkes Kemenkes Yogyakarta	\N	\N
367	 PK FEST 2017 â€œINDONESIA DIGITAL STARTUP FOR A BETTER FUTUREâ€ 	Seminar	15  - 16 Jul 2017	08:00 - 15:00	Jl. Patriot 25 Pekalongan 51116, Kampus STMIK Widya Pratama Pekalongan	\N	\N
366	 â— ACCOUNTING FAIR 2k17 â— 	Seminar	18 Apr 2017 - 16 Mei 2017	13:00 - 17:00	ðŸ“ Gazebo depan FEB 2, UPN Veteran Jawa Timur	\N	\N
365	 *Seminar Nasional & Call For Paper* 	Seminar	01 Mei 2017 - 31 Jul 2017	00:00 - 00:00	Universitas Jember	\N	\N
364	 BAKTI SOSIAL 	Lain-lain	16  - 16 Jun 2017	14:00 - 19:00	LKSA Yatim Putra Muhammadiyah	\N	\N
363	 SEMINAR BEASISWA STUDI LUAR NEGERI 	Seminar	09  - 09 Sep 2017	08:30 - 12:30	Universitas Negeri Medan	\N	\N
362	 Indahnya TAMASYA RAMADHAN (TAMARA) 	Lain-lain	17  - 17 Jun 2017	05:30 - 22:30	Desa Cihawuk, RW 01, Kec. Kertasari, Kab. Bandung	\N	\N
361	 Workshop Strategic Human Resource Management for Empowering People 	Seminar	17  - 17 Jun 2017	08:00 - 16:30	Fakultas Psikologi Universitas Airlangga, Jalan Airlangga 4-6, Surabaya	\N	\N
360	 PASAR RAMADHAN KOJO 	Lain-lain	15  - 15 Jun 2017	03:00 - 21:00	UNIV. DR. SOETOMO SURABAYA (UNITOMO)	\N	\N
359	 peringatan nuzulul quran 	Seminar	12  - 12 Jun 2017	15:00 - 18:00	gor unitri	\N	\N
358	 ogeSkatoK ngalaM 	Lain-lain	05  - 17 Jun 2017	15:00 - 18:00	Jl. Cengger Ayam no.34 Malang	\N	\N
357	 Grebeg Rockmadhan Mini Tour 2017Â  	Pensi	09  - 18 Jun 2017	15:00 - 09:00	malang	\N	\N
356	 PUNCAK PELITA RAMADHAN KAMPUS 1438 H 	Lain-lain	10  - 10 Jun 2017	12:30 - 18:00	Auditorium Juwono Sudarsono, Gedung F Fakultas Ilmu Sosial dan Ilmu Politik UI	\N	\N
355	 Pekan Ilmiah Nasional 	Lain-lain	23  - 24 Sep 2017	08:00 - 17:00	Universitas Lampung, Bandar Lampung	\N	\N
354	 HIMAFI CUP 2017 	Sport	29 Jul 2017 - 06 Agu 2017	08:00 - 16:00	GOR UNAIR, Kampus C, Mulyorejo, Surabaya	\N	\N
353	 Lomba Artikel 2017 	Lain-lain	12 Jun 2017 - 31 Des 2017	00:00 - 00:00	eventkampus.com	\N	\N
352	 GEBYAR RAMADHAN CERIA 	Lain-lain	18  - 18 Jun 2017	08:30 - 15:00	Aula E3 lantai 2, Fakultas Ekonomi, Universitas Negeri Malang	\N	\N
351	 MBC XII (METALA BOULDER COMPETITION) 	Sport	19  - 21 Agu 2017	07:00 - 23:00	GOR KAMPUS 2 UMS	\N	\N
348	 MALANG RAMADHAN FESTIVAL 	Expo	10  - 10 Jun 2017	16:00 - 19:00	malang	\N	\N
347	 BUSINESS ONLINE EXPLPRATION GO TO THE BOX 	Seminar	10  - 10 Jun 2017	09:30 - 20:00	 Bima Ballroom Lt. 2 Arcadia Hotel Surabaya, Jl. Rajawali 9 - 11, Surabaya	\N	\N
346	 ðŸŒŸEQUILIBRIUM SCIENCE FAIR 2017ðŸŒŸ 	Lain-lain	04 Jun 2017 - 08 Jul 2017	00:00 - 00:00	Universitas Udayana	\N	\N
345	 FESTIVAL ANAK SHOLEH 	Pensi	11  - 11 Jun 2017	08:00 - 00:00	Jl. Tamansiswa, No. 158 Yogyakarta	\N	\N
343	 Kajian Islam dan Buka Bersama 	Lain-lain	08  - 08 Jun 2017	15:00 - 18:00	Gedung G lt 6 UMSurabaya	\N	\N
342	 Sukses Dapat Kerja, Workshop &amp;amp;amp;amp; Therapy 	Seminar	29  - 29 Jul 2017	08:30 - 16:00	News Hotel (Belakang Giant Waru Sidoarjo)	\N	\N
341	 MICE BOX Menyelaraskan Bisnis Online dengan Bisnis Konvensional 	Seminar	10  - 10 Jun 2017	08:00 - 20:00	Hotel Arcadia Surabaya	\N	\N
339	 Bincang bincang kreatif #4 	Seminar	10  - 10 Jun 2017	12:30 - 17:00	Universitas mercubuana	\N	\N
337	 TAX SEMINAR AND TRAINING 	Seminar	05  - 07 Jun 2017	09:00 - 18:00	Grand Mercure Jakarta Harmoni	\N	\N
336	 *Sanlat Unsika* 	Lain-lain	10  - 12 Jun 2017	15:30 - 18:00	Masjid Al Khoir, Unsika	\N	\N
334	 Pesantren Ramadhan 	Pensi	10  - 10 Jun 2017	13:00 - 20:00	 Panti Asuhan Hajjah Khodijah	\N	\N
333	 Bekasi Festival Ramadhan 	Lain-lain	18  - 18 Jun 2017	10:00 - 18:00	Revotown mall bekasi	\N	\N
332	  * TALKSHOW ENTREPRENEUR * ~ Muda, mandiri, kreatif dalam menciptakan ide bisnis ~ 	Seminar	03  - 03 Jun 2017	07:30 - 12:00	 Hall Oesman Mansur Gedung C Unisma	\N	\N
331	 Konferensi IMABI WILAYAH IV 	Lain-lain	03 Jun 2017 - 04 Mei 2017	00:00 - 00:00	 Universitas Islam MalangÂ 	\N	\N
330	 Bukber 4.0 	Lain-lain	04  - 04 Jun 2017	00:00 - 00:00	Islamic University of Malang 	\N	\N
329	 Student Changemaker Summit 2017 	Lain-lain	17  - 21 Mei 2017	00:00 - 00:00	universitas airlangga	\N	\N
328	 SBSQUAD COVER DANCE CONCERT 2017 	Pensi	21  - 21 Mei 2017	10:00 - 17:00	UMM Dome, Malang	\N	\N
327	  BRITISH PARLIAMENTARY ENGLISH DEBATE COMPETITION! 	Lain-lain	26 Apr 2017 - 10 Mei 2017	00:00 - 00:00	 AULA BAU, MUHAMMADIYAH UNIVERSITY OF MALANG	\N	\N
326	 YOUTH ENTREPRENEURSHIP SYMPOSIUM  	Lain-lain	28 Apr 2017 - 15 Mei 2017	00:00 - 00:00	NUS Business School, Singapore	\N	\N
325	 RENOVIESTA 2017  Dialog Rasa dalam Bingkai Cinta  	Pensi	23  - 23 Mei 2017	18:00 - 22:00	Gedung Kesenian Cak Durasim (Taman Budaya Surabaya)	\N	\N
324	 Festival Tradisional Awal Ramadhan 	Expo	01  - 03 Jun 2017	00:00 - 00:00	 Universitas Ahmad Dahlan Yogyakarta	\N	\N
323	  Design Competition  	Lain-lain	15  - 29 Mei 2017	00:00 - 00:00	Akprind Yogyakarta	\N	\N
322	 'HILARITY OF VAGUENESS' 	Pensi	31 Mei 2017 - 04 Jun 2017	16:00 - 22:00	Galeri dan Pelataran kampus Pascasarjana ISI Yogyakarta	\N	\N
321	 LOMBA KARYA TULIS ILMIAH NASIONAL 	Lain-lain	02 Mei 2017 - 10 Jun 2017	00:00 - 00:00	UNIVERSITAS UDAYANA	\N	\N
320	 SEMINAR NASIONAL â€œPeluang dan Tantangan Kerja sarjana Teknik di Era MEAâ€ 	Seminar	19  - 19 Mar 2017	09:00 - 15:00	UNIVERSITAS PASUNDAN BANDUNG	\N	\N
319	 SEMINAR NASIONAL 	Seminar	03  - 03 Jun 2017	07:00 - 12:00	Auditorium Sekolah Tinggi Multi Media Yogyakarta (Jl. Magelang Km 6) 	\N	\N
318	 TIN REPUBLIC THE MUSICAL! The truth will set you free, but first it will piss you off  	Pensi	24  - 26 Peb 2017	18:30 - 22:00	GRAHA BAKTI BUDAYA	\N	\N
317	 Seminar Nasional Teknik Informatika 2017 	Seminar	18 Mar 2017 - 18 Mei 2017	07:00 - 13:00	Aula Gedung E Lt. 3 Universitas Dian Nuswantoro	\N	\N
316	 ðŸ“LOMBA ESAI NASIONAL FSLN 2017ðŸ“ 	Lain-lain	15 Mar 2017 - 15 Apr 2017	00:00 - 00:00	UNIVERSITAS NEGERI JAKARTA	\N	\N
315	 MATI SURI 2017 	Lain-lain	01 Apr 2017 - 01 Mei 2017	17:31 - 21:00	UNIVERSITAS BRAWIJAYA	\N	\N
314	 ðŸ’¥SEMINAR NASIONALðŸ’¥ 	Seminar	23  - 23 Apr 2017	07:30 - 11:00	 Gedung Utama Lt.4 Universitas Darussalam Gontor .	\N	\N
313	 NESCO 2017 : NATIONAL SEMINAR 	Seminar	13  - 13 Mei 2017	07:00 - 12:00	KPFT R2.1 Universitas Gadjah Mada	\N	\N
312	 Lomba Karya Tulis Ilmiah INSTHINKðŸ’¡ 	Lain-lain	28 Apr 2017 - 05 Mei 2017	00:00 - 00:00	UBAYA	\N	\N
311	 PANGGUNG KEMEPYAR 	Musik	06  - 06 Mei 2017	16:00 - 22:00	WISDOM PARHK UGM	\N	\N
310	  Coffeepreneur People! We as a Coffeepreneur team  	Seminar	09  - 11 Jun 2017	08:00 - 22:00	TGC Coffee Shop, Loop	\N	\N
309	 A pre-competition  concert 	Lain-lain	03  - 03 Jun 2017	18:30 - 22:00	ITS	\N	\N
308	 HIPNOTIS KILAT Workshop 	Seminar	15  - 16 Jul 2017	08:30 - 17:30	News Hotel Surabaya	\N	\N
307	 Coaching A Great Team 	Seminar	08  - 09 Jul 2017	08:30 - 17:00	Grand Sae Boutique Hotel	\N	\N
306	 Workshop NLP Basic Practitioner (International Certification Programe) 	Seminar	01  - 04 Jun 2017	08:30 - 18:00	Merapi Merbabu Hotel	\N	\N
305	 Jabar Book Fair 	Expo	28 Jul 2017 - 03 Agu 2017	09:00 - 16:00	Land Mark Convention Hall Jl. Braga No. 129 Bandung	\N	\N
304	 Uang Kuno dan Kini 	Seminar	02  - 03 Jun 2017	00:00 - 00:00	Universitas Mercu Buana, Jakarta	\N	\N
303	 Diponegoro Business Case Competition 2017 	Lain-lain	01 Mei 2017 - 10 Sep 2017	00:00 - 00:00	Fakultas Ekonomika dan Bisnis Universitas Diponegoro	\N	\N
302	 Ramadhan Berbagi, Senat Mahasiswa Bsi Salemba 168 	Lain-lain	03  - 04 Jun 2017	00:00 - 00:00	Jl. Salemba Tengah No. 45 (Kampus BSI salemba 45)	\N	\N
300	 ðŸ”ŠECONOMICS FAIR 2017ðŸ”Š 	Musik	22  - 22 Mei 2017	09:00 - 00:00	Aula lt. 4 Fakultas Ekonomi & Bisnis Universitas Pancasila	\N	\N
299	 Diploma Techno Dayas Himavo Micr o IT Diploma IPB 	Expo	23  - 23 Mei 2017	07:00 - 15:00	Parkiran CB Kampus Diploma IPB	\N	\N
298	 MODISCO 15 GALAXY 	Musik	24  - 24 Mei 2017	16:00 - 00:00	UNIVERSITAS MUHAMADYAH MALANG	\N	\N
297	 Goresan Pena Sosial 	Lain-lain	19 Mei 2017 - 10 Jun 2017	07:00 - 17:00	Jalan Veteran, Kota Malang, Jawa Timur 65145, Indonesia	\N	\N
296	 INDIE GIGS 	Expo	20  - 20 Mei 2017	16:00 - 00:00	GembiraÂ Cafe	\N	\N
295	 Perbanas Job Fair 	Bursa Kerja	23  - 24 Mei 2017	09:00 - 15:00	Auditorium Kampus 1, STIE Perbanas Surabaya	\N	\N
294	 SEMINAR NASIONAL PEMBANGUNAN 2017 	Seminar	20  - 20 Mei 2017	08:00 - 16:00	Aula Utama Universitas Islam Bandung	\N	\N
293	 SEMINAR NASIONAL 	Seminar	13  - 13 Mei 2017	10:00 - 00:00	 POLITEKNIK NEGERI BALI	\N	\N
292	 SLASHROOT CTF 2.0 	Lain-lain	20  - 21 Mei 2017	08:00 - 00:00	 KSL STIKOM Bali	\N	\N
291	 SEMINAR KEWIRAUSAHAAN 	Seminar	20  - 20 Mei 2017	08:00 - 00:00	Politeknik Negeri APP Jakarta (Jl. Timbul No.34 Cipedak, Jagakarsa, Jakarta Selatan)	\N	\N
290	 MENYONGSONG KEBANGKITAN NASIONAL 	Lain-lain	22  - 22 Mei 2017	08:00 - 00:00	uns	\N	\N
289	 [ Sharia Paper Competition ] 	Seminar	01 Apr 2017 - 02 Sep 2017	00:00 - 00:00	Studi Ekonomi Islam FEB Universitas Diponegoro	\N	\N
288	 Konferensi dan Live in Nasional FGMMI. 	Lain-lain	19  - 21 Mei 2017	00:00 - 00:00	SEMARANG-KUDUS	\N	\N
287	 KI - TALK 2017 	Seminar	21  - 21 Mei 2017	00:00 - 00:00	ngalup.co	\N	\N
286	 TEMAN BICARA 	Lain-lain	25  - 25 Mei 2017	10:00 - 13:00	Â Ngalup Co-working SpaceÂ 	\N	\N
285	 Agricultural Engineering Event 2017 	Lain-lain	20  - 20 Mei 2017	00:00 - 00:00	FTP UB	\N	\N
284	 SEMINAR SEKOLAH JURNALISTIK 2017 	Seminar	20  - 20 Mei 2017	00:00 - 00:00	Aula Gedung B Fakultas Ilmu Budaya Universitas Brawijaya	\N	\N
283	  NAVIGASI KOMUNIKASI 	Lain-lain	20  - 24 Mei 2017	00:00 - 00:00	universitas thribuana tungga dewi	\N	\N
282	 Acoustic Competition by AKSO FEST 2k17 	Musik	23  - 23 Mei 2017	10:00 - 17:00	Belakang Perpustakaan Kampus B Universitas Airlangga	\N	\N
281	 vignecvara 	Lain-lain	19  - 21 Mei 2017	08:00 - 14:00	Kampus STIE Malang	\N	\N
280	 Ketawa Ketiwi Charity 	Lain-lain	20  - 20 Mei 2017	18:00 - 22:00	Lt. 1 Gedung B FISIP Universitas Brawijaya	\N	\N
279	 ðŸš¨ Goresan Pena Sosial ðŸš¨  	Pensi	27 Apr 2017 - 07 Agu 2017	00:00 - 00:00	BRAWIJAYA	\N	\N
278	  CREATIVEPRENEUR 2017 	Seminar	20  - 20 Mei 2017	08:00 - 13:00	Aula C7 Unnes	\N	\N
277	 INDUSTRIAL FESTIVAL 2017 	Musik	20  - 20 Mei 2017	16:00 - 22:00	GOR Tri Lomba Juang Semarang .	\N	\N
276	 NAVIGASI KOMUNIKASI 	Lain-lain	20  - 20 Mei 2017	08:00 - 16:00	UNIVERSITAS TRIBUWANA TUNGGA DEWI	\N	\N
275	 Exploscience 2017 	Seminar	21  - 21 Mei 2017	07:30 - 12:00	Auditorium FMIPA IPB	\N	\N
274	 GATHERING DRUMMER MALANG 	Pensi	21  - 21 Mei 2017	00:00 - 00:00	God Bless Cafe 2 Malang	\N	\N
273	 CULTURE IN HOME - Festival Komunikasi Lintas Budaya  	Lain-lain	17  - 17 Mei 2017	09:00 - 16:00	Â Lap. Voli - Grahadi Utomo UNITRI	\N	\N
272	 Berkomunitas Sosial Bersama Lentera 	Lain-lain	18  - 18 Des 2016	14:00 - 16:00	Ruang Seminar, Gedung 1 Lantai 2 FISIP UNS	\N	\N
271	 TRANSMANIA BROADCAST SESSION 	Seminar	18  - 18 Mei 2017	08:00 - 15:00	Gedung I6 Srikandi UNESA	\N	\N
270	  Satu jam bersama MLUMAH lebih dekat bersama mlumah 	Lain-lain	19  - 19 Mei 2017	00:00 - 00:00	 Coffee Kayoe Jl. Sigura-gura, Kav 4, no 2 (lantai 2 Richdjoe Barbershops sigura-gura).	\N	\N
269	  Talkshow and Exhibition - Awas Berita Hoax Â  	Seminar	23  - 23 Mei 2017	09:00 - 16:00	GOR UNITRI	\N	\N
267	 ACCOUNTING FUNTAXTIC FAIR SEMINAR PERPAJAKAN 2017 	Seminar	20  - 20 Mei 2017	00:00 - 00:00	PPI LT.3 Kantor Pusat UNMER Malang	\N	\N
266	 BEMSMART16 	Musik	20  - 20 Mei 2017	15:00 - 22:00	SMA BAKTI MULYA 400	\N	\N
265	  Duta Wisata UMM 2017 	Pensi	18  - 18 Mei 2017	18:00 - 22:00	Aula Bougenville Taman Rekreasi Sengkaling UMM	\N	\N
264	 Refresh Your Mind 10 2017 THROUGH BOHEMIAN GROOVE 	Musik	18  - 18 Mei 2017	15:00 - 22:00	Perbanas Institute Jakarta	\N	\N
262	 ACCOUNTING FAIR 2k17  	Seminar	20  - 20 Mei 2017	00:00 - 00:00	 Hotel Tunjungan Jalan Tunjungan No.102-104 Surabaya	\N	\N
261	 MUSIC FESTIFAL 	Musik	21  - 21 Mei 2017	14:00 - 23:00	SMA 1 KUDUS	\N	\N
259	 AKSO FEST 2017 	Lain-lain	23  - 23 Mei 2017	10:00 - 17:00	Belakang perpus kampus B unair	\N	\N
254	 SEMINAR NASIONAL KEWIRAUSAHAAN 2017 	Seminar	18  - 18 Nov 2017	08:00 - 00:00	GRAHA CAKRAWALA UM MALANG	\N	\N
253	 Gelar Cipta Karya Boga Unesa 2017 	Pensi	21  - 21 Mei 2017	08:00 - 14:00	Gedung Serbaguna Gema Unesa Ketintang	\N	\N
252	 Seminar Nasional & Workshop 2017Â  Indonesian YoungVestor 	Seminar	20  - 20 Mei 2017	07:00 - 15:00	Ballroom Hotel Sahid Montana 1, Malang	\N	\N
250	 seminar akuntansi syariah 	Seminar	13  - 13 Mei 2017	07:00 - 12:00	gedung pascasarjana lt.7 	\N	\N
248	 GEBYAR SENI 	Pensi	13  - 13 Mei 2017	14:00 - 22:00	Gedung Kesenian Miss Tjitjih Jakarta Pusat	\N	\N
246	 Seminar Nasional 	Seminar	20  - 20 Mei 2017	09:00 - 15:30	Aula K.R.T Fadjar Notonegoro,FEB, Kampus B, Universitas Airlangga	\N	\N
245	 Festival Drama 2017 (Pementasan Drama Teater8) 	Lain-lain	22  - 22 Mei 2017	18:30 - 20:30	Gor Bulungan Jakarta Selatan	\N	\N
244	 KIOS CORNER 2017 	Expo	14  - 14 Mei 2017	07:00 - 00:00	Auditorium Faculty of Economics, Semarang State University at L1 Building â€“ 3rd floor	\N	\N
243	 Seminar Nasional & Data Mining Bootcamp 	Seminar	20  - 20 Mei 2017	08:00 - 16:30	Citra 1 Universitas Amikom Yogyakarta	\N	\N
241	 Vocomfest 2017 Improving Indonesiaâ€™s Economy Through Creative Technopreneurship 	Seminar	06  - 06 Mei 2017	08:00 - 15:00	Auditorium Fakultas Isipol UGM lantai 2	\N	\N
239	 BUSINESS LAW COMPETITION UNIVERSITAS PELITA HARAPAN 	Lain-lain	17  - 20 Mei 2017	10:00 - 16:00	Universitas Pelita Harapan, Lippo Karawaci	\N	\N
238	 TRASH TO CASH 	Lain-lain	14  - 14 Mei 2017	07:30 - 16:00	AULA TEKNIK GKB 3, UNIVERSITAS MUHAMMADIYAH MALANG.	\N	\N
237	 LOMBA MENULIS CERITA PENDEK TINGKAT NASIONAL 	Lain-lain	10 Apr 2017 - 12 Mei 2017	00:00 - 00:00	Tidak ada Tempat, acara kita full Online	\N	\N
236	 Mahakarya Polines 	Musik	29  - 29 Apr 2017	15:00 - 11:25	Lapangan Hitam Mesin Politeknik Negeri Semarang	\N	\N
235	 Workshop Coaching Counseling for HR 	Seminar	03  - 04 Mei 2017	08:30 - 17:00	Hotel Grand Sae Boutique, Jl Sam Ratulangi - Solo	\N	\N
234	 LAWPHORIA  	Musik	23  - 23 Mei 2017	18:00 - 00:00	Sportorium UMY	\N	\N
233	 GALAKSI CUP 2017 	Sport	12  - 14 Mei 2017	08:00 - 17:00	Jl. A. H. Nasution No.68, Cigending, Ujung Berung, Bandung (Depan Simulasi Tempur)	\N	\N
232	 SEMINAR KEPENULISAN 	Seminar	29  - 29 Apr 2017	08:00 - 12:00	FMIPA UNY	\N	\N
231	 IT - HOLIC and ERTIC FEST 	Seminar	13  - 13 Mei 2017	08:00 - 17:30	Gedung Techno Park Cimahi	\N	\N
230	 FESTIVAL TEATER 2017 	Pensi	30 Apr 2017 - 01 Mei 2017	18:00 - 01:00	Taman Budaya Genteng Cak Durasim Jl. Genteng Kali No.85, Genteng, Kota SBY, Jawa Timur 60275	\N	\N
229	 JOBFAIR SEKOLAH VOKASI UGM 	Bursa Kerja	03  - 04 Mei 2017	09:00 - 16:00	 Graha Sabha Pramana (GSP) Lt I UGM   	\N	\N
228	 Kupas Tuntas Pajak Bisnis e-Commerce 	Seminar	23  - 23 Mei 2017	08:00 - 16:00	Syariah Hotel Solo	\N	\N
227	 Kupas Tuntas Penyusunan Laporan Keuangan Berbasis Komputer 	Seminar	26  - 26 Apr 2017	08:00 - 16:00	Syariah Hotel Solo	\N	\N
226	 Kupas Tuntas Pajak Profesi Medis: Pajak Dokter & Apoteker, Serta Pemotongan oleh Rumah Sakit 	Seminar	27  - 27 Apr 2017	08:00 - 16:00	Syariah Hotel Solo	\N	\N
225	 TOKSIK 2016 	Lain-lain	30  - 30 Apr 2017	07:00 - 11:00	Hotel Kusuma Sahid Surakarta	\N	\N
224	 PAMERAN FOTO METAMORFOSA (dalam kabut purba) 	Lain-lain	27 Apr 2017 - 03 Mei 2017	10:30 - 17:00	27-29 april 2017 di kampus E41 Kelapa dua depok, 2-3 mei 2017 di lobby kampus J1 Kalimalang, Bekasi.	\N	\N
223	 Forestry Cup 2017 	Sport	29 Apr 2017 - 01 Mei 2017	07:00 - 18:00	Lapangan Futsal Bengawan Sport Center	\N	\N
222	 CITA-CITAKU (Lomba Mewarnai) 	Lain-lain	10  - 10 Mei 2017	09:00 - 12:00	Lapangan Badminton POLITEKNIK NEGERI SEMARANG	\N	\N
221	 DIFABLE FEST  	Lain-lain	10  - 10 Mei 2017	08:00 - 16:00	RUANG SERBA GUNA (RSG) POLITEKNIK NEGERI SEMARANG	\N	\N
220	 STIAMI CUP 2017 	Sport	20  - 21 Mei 2017	08:00 - 20:00	Metropolitan Futsal (Metland Menteng)	\N	\N
219	 Ecomonic Business Festival TALK SHOW AND BAZAR 	Pensi	20  - 20 Apr 2017	08:00 - 00:00	 Auditorium Ir. Widjatmoko Universitas SemarangÂ 	\N	\N
218	 HIMATEKPA (Himpunan Mahasiswa Teknologi Pangan)FPP UMM mengadakan ðŸ“£SEMINAR NASIONALðŸ“£ 	Seminar	20  - 20 Apr 2017	07:00 - 00:00	Hall Theatre UMM Dome	\N	\N
217	  UNIMUS ECONOMIC FESTIVAL (UEF) 2017 	Lain-lain	01  - 16 Apr 2017	00:00 - 00:00	 UNIMUS	\N	\N
216	 ðŸ’ŠSEMINAR ANTI NARKOBAðŸ’Š 	Seminar	02  - 02 Mei 2017	07:00 - 00:00	Gedung Auditorium UTM	\N	\N
215	 ðŸ“£ FISIP ISLAMIC FESTðŸ“£ 	Lain-lain	30  - 30 Apr 2017	09:00 - 00:00	 Graha Samudra Ganesha (GSG) Universitas Hangtuah Surabaya ðŸ“ƒTartil	\N	\N
214	 Week of Champions 2017 	Sport	15  - 20 Mei 2017	08:00 - 21:00	Universitas Pelita Harapan, Karawaci	\N	\N
213	 YSC (Youth Scientist Competition) 2017 	Lain-lain	15  - 22 Apr 2017	07:00 - 16:00	FAKULTAS MIPA UNY	\N	\N
212	 Smart Teaching Competition 2017 	Lain-lain	06  - 13 Mei 2017	07:00 - 15:00	FAKULTAS MIPA UNY	\N	\N
211	 UNISRI JOBFAIR 2017 	Bursa Kerja	23 Mei 2017 - 31 Des 2020	09:00 - 16:00	Auditorium Universitas Slamet Riyadi Jl. Sumpah Pemuda No.18 Kadipiro Banjarsari, Surakarta	\N	\N
210	 seminar internasional 	Seminar	27  - 27 Apr 2017	08:30 - 12:30	gedung multi purpose UIN Sunan Kalijaa Yogyakarta	\N	\N
209	 Pekan Ilmiah Dan Pekan Olaharaga Seni Mahasiswa 	Lain-lain	24 Apr 2017 - 15 Mei 2017	08:00 - 17:00	Universitas Amikom Yogyakarta	\N	\N
208	 Gamadiksi USU Expo 2017: Seminar Nasional 	Seminar	15  - 15 Apr 2017	08:00 - 15:00	Auditorium Universitas Sumatera Utara	\N	\N
207	 Youth Entrepreneurship Project 	Seminar	21  - 21 Mei 2017	09:30 - 12:30	Auditorium UNS	\N	\N
206	 MAHAKARYA SENI DAN BUDAYA  	Pensi	15  - 15 Apr 2017	08:00 - 23:00	Gedung Auditorium Universitas Bengkulu	\N	\N
205	 Seminar IT Nasional Dan Workshop 	Seminar	01  - 02 Des 2016	08:00 - 03:00	Auditorium M.Djazman Kampus 1 Universitas Muhammadiyah Surakarta	\N	\N
204	 Festival Teater 	Pensi	30  - 30 Nov -1	09:00 - 20:00	Universitas Surabaya Dan Cak Durasim	\N	\N
203	 Dialog Interaktif Politik Kampus 2017 	Seminar	07  - 07 Apr 2017	08:30 - 14:00	Sasana budaya Universitas Negeri Malang	\N	\N
202	 TRYOUT SBMPTN (TOS) 	Lain-lain	23  - 23 Apr 2017	06:30 - 12:15	FAKULTAS SAINS DAN MATEMATIKA UNIVERSITAS DIPONEGORO	\N	\N
201	 Pelatihan Pajak Bendahara Pemerintah 	Seminar	19  - 19 Apr 2017	08:00 - 16:00	Syariah Hotel Solo	\N	\N
200	 UNESA CUP BASKETBALL XII 2017 	Sport	15  - 30 Apr 2017	08:00 - 16:00	Gor Bima UNESA Lidah Wetan	\N	\N
199	 PRIDE UMN 2017 	Seminar	20  - 24 Mar 2017	08:00 - 17:00	UNIVERSITAS MULTIMEDIA NUSANTARA 	\N	\N
187	 SEMINAR NASIONAL KEWIRAUSAHAAN 	Seminar	01  - 01 Apr 2017	08:00 - 12:00	Cinema Universitas Amikom Yogyakarta	\N	\N
186	 EXPLOSCIENCE 2017 	Lain-lain	28 Peb 2017 - 21 Mei 2017	12:59 - 12:00	IPB DRAMAGA BOGOR	\N	\N
185	 EXPLOSCIENCE 2017 	Lain-lain	30  - 30 Nov -1	12:00 - 00:00	KAMPUS IPB DRAMAGA BOGOR	\N	\N
184	 Lomba Tari Tradisional 2017 se-Tapal kuda 	Lain-lain	30  - 30 Nov -1	08:00 - 05:30	universitas muhammadiyah jember	\N	\N
180	 Reality Writing Competition (RWrC 4th) 2017 	Lain-lain	18  - 25 Mar 2017	00:00 - 23:59	UNY, Jl. Colombo No.1 Yogyakarta 55281	\N	\N
179	 Pekan Ilmiah Fisika ke XXVIII 	Lain-lain	10 Sep 2017 - 12 Nov 2017	08:00 - 17:00	Universitas Negeri Semarang	\N	\N
178	 Seminar Nasional 	Seminar	18  - 18 Mar 2017	08:30 - 15:00	Garden Palace Hotel, Jl. Yos Sudarso, Surabaya.	\N	\N
177	 IT Knowledge 2017 	Lain-lain	19  - 26 Mar 2017	07:00 - 12:00	Kampus Cilibende, Program Diploma Institut Pertanian Bogor	\N	\N
176	 3rd SAFE SIP National Competition 2017 	Lain-lain	25 Peb 2017 - 14 Mei 2017	00:00 - 00:00	Politeknik Negeri Jember	\N	\N
175	 Pekan Ilmiah Fisika ke XXVIII 	Lain-lain	10 Sep 2017 - 12 Nov 2017	08:00 - 18:00	Universitas Negeri Semarang	\N	\N
174	 Futsal&Dance Competation 	Sport	14  - 16 Apr 2017	08:00 - 15:00	Gor Futsal Sidoarjo	\N	\N
173	 Sumatra English Olympiad 2017 	Musik	30  - 30 Nov -1	08:00 - 16:00	Fkip. Bhasa dan sastra inggris Universitas Riau 	\N	\N
172	 Kejuaraan antar fakultas 	Sport	12  - 12 Mar 2017	07:00 - 18:00	Gelanggang mahasiswa Uin suka	\N	\N
171	 STT-PLN Enterpreneurship Day (SE-Day) 	Seminar	18  - 18 Mar 2017	09:00 - 15:00	Auditorium STT-PLN	\N	\N
170	 GLORASKA 2017 	Lain-lain	30  - 30 Nov -1	07:00 - 14:00	Pendidikan Fisika Universitas Lampung	\N	\N
169	 LOMBA KARYA TULIS ILMIAH 2K17 	Lain-lain	20  - 20 Apr 2017	08:00 - 14:30	BANGSALPANCASILA RUANG PENATARAN UNIVERSITAS WIJAYA KUSUMA SURABAYA	\N	\N
168	 Global IdeaPreneur Week 	Seminar	21  - 23 Apr 2017	09:00 - 16:00	Cyberjaya	\N	\N
167	 Pelatihan Pajak PPh Badan 	Seminar	15  - 15 Mar 2017	08:00 - 16:00	Grand Laguna Hotel & Villa	\N	\N
166	 Seminar Nasional Indonesian Food Quiz Bowl Competition 2017 (IFQB) 	Seminar	09  - 09 Mar 2017	09:00 - 15:00	Jln Setiabudi no 193 Universitas Pasundan	\N	\N
165	 &quot;Payung Teduh&quot; Romantic Night - Law Fest Unisri 	Musik	08  - 08 Apr 2017	18:00 - 22:00	Balekambang	\N	\N
164	 Pelatihan Pajak PPh OP 	Seminar	16  - 16 Mar 2017	08:00 - 16:00	Grand Laguna Hotel & Villa	\N	\N
163	 Lomba Lari 11 K Solo Open 	Sport	12  - 12 Mar 2017	06:00 - 12:00	Jl Ir Sutami No 36A Kentingan Jebres	\N	\N
162	 SEMINAR NASIONAL ESFRA UNISSULA 2017 	Seminar	18  - 18 Mar 2017	08:00 - 12:00	Gedung Fakultas Kedokteran Unissula 	\N	\N
161	 GREEN RUN x GRENADE 	Pensi	18  - 18 Mar 2017	16:00 - 22:00	KAMPUS 2 THOMAS AQUINAS UAJY	\N	\N
160	 PGSD FAIR 2017 	Lain-lain	25 Peb 2017 - 11 Mei 2017	07:00 - 19:00	Jalan William Iskandar Pasar V, Percut Sei Tuan, Kenangan Baru, Percut Sei Tuan, Kabupaten Deli Serd	\N	\N
159	 Indonesia Islamic Business Plan Competition 	Lain-lain	05 Peb 2017 - 27 Mar 2017	08:00 - 21:31	Politeknik Elektronika Negeri Surabaya	\N	\N
158	 Lomba Fotografi Biological Control Day IMHPT Universitas Negeri Jember 	Lain-lain	21 Jan 2017 - 01 Apr 2017	00:00 - 00:00	Fakultas Pertanian Universitas Negeri Jember	\N	\N
157	 Turnamen voli antar SMA sederajat se jawa timur 	Sport	22 Apr 2017 - 06 Mei 2017	15:01 - 20:30	Kampus 1 universitas wijaya putra	\N	\N
156	 TechnoFair 2017 	Lain-lain	09  - 11 Mar 2017	08:00 - 16:00	Depok, Kalimalang, Karawaci, dan Cengkareng	\N	\N
155	 Lomba Karya Tulis Ilmiah Biology Innovation and Research Competition (LKTIN BORN) 2 2017 	Lain-lain	15 Peb 2017 - 14 Mei 2017	07:00 - 15:00	Gedung Soerachman, Universitas Jember, Jl. Kalimantan No. 37 Kampus Bumi Tegal Boto	\N	\N
154	 Perbanas Action Days 2017 	Sport	11  - 16 Mar 2017	08:00 - 17:00	Perbanas Institute	\N	\N
152	 HUT HIPMI PT POLITEKNIK POS INDONESIA  	Lain-lain	11  - 11 Mar 2017	16:00 - 11:00	Auditorium Politeknik Pos Indonesia 	\N	\N
145	 Widya Mandala Speaks on Accounting 	Lain-lain	05  - 06 Mei 2017	07:00 - 18:00	Universitas Katolik Widya Mandala Surabaya 	\N	\N
144	 National Leadership Training Jilid 4 	Lain-lain	12  - 15 Apr 2017	08:00 - 15:00	Universitas Bengkulu	\N	\N
143	 NEF UNISMA 2017 (National English Festival of Unisma 2017) 	Lain-lain	19 Mei 2017 - 21 Mar 2017	07:30 - 16:00	Kampus Universitas Islam Malang	\N	\N
142	 WORKSHOP ECONOSPHERE 2 Simulasi Kewirausahaan 	Lain-lain	25  - 25 Mar 2017	07:30 - 16:00	Abdullah Sigit Hall, Fakultas Ilmu Pendidikan UNY	\N	\N
141	 Seminar dan Talkshow Identifikasi dan Penanganan Anak Gifted  	Seminar	29  - 29 Apr 2017	08:00 - 14:30	Hotel Pose In Solo (Depan Stasiun Balapan) Jalan Mongosidi Nomor 125, Ketelan, Banjarsari Solo	\N	\N
140	 ECOFEB (Economic Championship Of Faculty Economic and Bussines) 	Lain-lain	19  - 19 Mar 2017	07:00 - 18:00	Gedung E, Kampus 1 UniversitasWijaya PutraSurabaya.  \t\t\t Jl. Raya Benowo No. 1-3 Surabaya	\N	\N
137	 Seminar Meteorologi dan Klimatologi HMD Ke-67 STMKG 	Seminar	20  - 20 Mar 2017	08:00 - 16:00	Kampus STMKG Jl. Perhubungan I No. 5, Pondok Betung, Pondok Aren, Pd. Betung, Tangerang Selatan, Kot	\N	\N
136	 STIKUBANK Pop Concert BEWILDER 	Musik	04  - 04 Mar 2017	19:00 - 22:00	Sasana Kridangga, Universitas Stikubank Jl. Kendeng V Bendan Ngisor	\N	\N
135	 NEON 2017 (National English competitiON 2017) 	Lain-lain	17  - 18 Mar 2017	07:30 - 17:00	Universitas Tarumanagara	\N	\N
133	 #APAKABARSEMARANG4 	Pensi	04  - 04 Mar 2017	10:30 - 00:00	 Lapangan Hitam Polines,  Jl. Prof. Soedarto, Tembalang , Semarang	\N	\N
131	 BASE 2017  	Pensi	30  - 30 Nov -1	17:00 - 23:00	Kawasan Tata Niaga Politeknik Negeri Semarang	\N	\N
130	 THINK WITH MUSIC, DO IT WITH MUSIC 	Seminar	21  - 21 Mar 2017	11:00 - 17:00	KAMPUS J UNIVERSITAS GUNADARMA	\N	\N
129	 Matriks Mathematics Olympiad 	Lain-lain	13 Jan 2017 - 05 Mar 2017	00:00 - 00:00	Universitas Muhammadiyah Malang	\N	\N
128	 Lomba Karya Tulis Ilmiah  	Lain-lain	13 Jan 2017 - 18 Mar 2017	00:00 - 00:00	Universitas Muhammadiyah Malang	\N	\N
127	 SEMINAR NASIONAL 	Seminar	15  - 15 Mar 2017	07:00 - 13:00	Gedung AR B Universitas Muhammadiyah Yogyakarta 	\N	\N
125	 PERBANAS DANCE COMPETITION 2017 	Lain-lain	30  - 30 Nov -1	09:00 - 04:00	Auditorium Unit 3, Perbanas Institute Jakarta	\N	\N
124	 AGRIFESTIVAL UNHAS 	Lain-lain	13  - 16 Apr 2017	08:00 - 18:00	UNIVERSITAS HASANUDDIN	\N	\N
123	 Kompetisi Desain Poster Tingkat Nasional 	Lain-lain	10 Peb 2017 - 23 Apr 2017	09:00 - 17:00	Pameran di Kota Tua Jakarta	\N	\N
122	 FESTIVAL SENI PELAJAR 2017 	Lain-lain	13  - 19 Mar 2017	07:00 - 22:00	UNIVERSITAS MUHAMMADIYAH SURABAYA	\N	\N
121	 Seminar Nasional Inspira 	Seminar	26  - 26 Peb 2017	08:00 - 13:00	Auditorium Djazman UMS, Pabelan, Sukoharjo	\N	\N
120	 DIMENSI EKSPRESI NALAR UDAYANA SCIENCE CLUB 	Lain-lain	14 Peb 2017 - 31 Mei 2017	01:00 - 23:55	Universitas Udayana	\N	\N
119	 Seminar Nasional Peran Pustakawan Guru dalam Mendukung GLS di Abad 21 	Seminar	02  - 02 Mar 2017	08:00 - 12:30	Amphiteater UPI Bandung	\N	\N
118	 Geophotography Challenge Competition 2017 	Lain-lain	20 Peb 2017 - 03 Mar 2017	11:50 - 01:05	Samarinda	\N	\N
117	 Polines Islamic Expo 2017 	Seminar	18  - 18 Mar 2017	07:00 - 13:00	Ruang Serba Guna Polines	\N	\N
116	 Gemuruh Langkah Paskibra Muda Indonesia VIII 	Lain-lain	30  - 30 Nov -1	06:00 - 19:00	Universitas Katolik Widya Mandala Surabaya Kampus Kalijudan	\N	\N
115	 SEMINAR NASIONAL PAMAWAS 	Seminar	15  - 15 Mar 2017	07:00 - 16:00	BALAI UTARI, MANDALA BHAKTI WANITATAMA	\N	\N
114	 Creativity Challenge 	Lain-lain	30  - 30 Nov -1	08:00 - 16:00	Kampus Bina Insani, Jl Siliwangi No. 6 Rawapanjang   Kota Bekasi.	\N	\N
113	 Mafia Cup 2017 	Lain-lain	21  - 21 Mar 2017	09:00 - 16:30	Lapangan Basket Universitas Krisnadwipayana	\N	\N
111	 Job Fair UAJY 2017 	Bursa Kerja	03  - 04 Mar 2017	08:00 - 16:00	Auditorium Kampus 2 Universitas Atma Jaya Yogyakarta, Lt.3 Gedung St. Thomas Aquinas, Babarsari	\N	\N
110	 Henry Dunant Competition VIII 	Lain-lain	25  - 26 Mar 2017	08:00 - 18:00	Kampus Politeknik Negeri Semarang	\N	\N
109	 VOICE JOCKEY COMPETITION 	Lain-lain	18  - 18 Mar 2017	08:00 - 16:00	2nd Floor of Soelaiman Joesoef University of PGRI Adi Buana Surabaya	\N	\N
108	 SEMINAR NASIONAL IEFAIR 2017  	Seminar	25  - 25 Peb 2017	08:00 - 12:00	Auditorium universitas sumatera utara	\N	\N
107	 Seminar Nasional Ekspresso  	Seminar	25  - 25 Peb 2017	08:00 - 15:00	Auditorium Vokasi UI	\N	\N
106	 Web Workshop Build Indonesia's E-commerce Future 	Lain-lain	18  - 18 Mar 2017	09:00 - 16:00	Auditorium Kampus L2 Universitas Gunadarma Cengkareng	\N	\N
105	 CITY PHOTO Â CONTEST 	Lain-lain	30 Nov -1 - 28 Peb 2017	08:00 - 16:00	Universitas Brawijaya	\N	\N
104	  International Conference Planning in the Era of Uncertainty 2017 	Seminar	06  - 07 Mar 2017	08:00 - 16:00	Widyaloka Building, Universitas Brawijaya	\N	\N
103	 SEMINAR NASIONAL 	Seminar	21  - 21 Peb 2017	08:00 - 12:00	Auditorium LPP Jl. PP no. 1A Balapan - Yogyakarta	\N	\N
100	 MARINE ICON 2017 	Lain-lain	28  - 30 Apr 2017	08:00 - 16:00	ITS SURABAYA	\N	\N
99	 Seminar Nasional Young Engineers 	Seminar	11  - 11 Peb 2017	08:00 - 16:00	Aula Utama Universitas Islam Bandung, Gedung Hj. Kartimi Kridhoharsojo ðŸ“ Jalan Tamansari No. 1 Ba	\N	\N
98	 The 2nd National Business Plan Competition 	Lain-lain	13  - 15 Apr 2017	08:00 - 15:00	Universitas Muhammadiyah Yogyakarta	\N	\N
96	 PENANAMAN BAKAU 	Lain-lain	04  - 04 Mar 2017	00:00 - 00:00	Pantai Baros	\N	\N
95	 CIVIL EXPO 2017 	Lain-lain	28  - 30 Mar 2017	00:00 - 00:00	Politeknik Negeri Sriwijaya, Kota Palembang	\N	\N
94	 CIVIL EXPO 2017 	Lain-lain	28  - 30 Mar 2017	00:00 - 00:00	Politeknik Negeri Sriwijaya, Kota Palembang	\N	\N
93	 IMTPI FAIR 	Lain-lain	19  - 19 Apr 2017	07:30 - 14:00	Aula Masjid A.R Fachrudin lantai 2 Universitas Muhammadiyah Malang	\N	\N
92	 BRAWIJAYA CAPITAL MARKET CONTEST 	Lain-lain	23 Mar 2017 - 03 Mei 2017	09:00 - 16:00	Universitas Brawijaya	\N	\N
91	 UNSTOPPABLE Talkshow Kreatif 	Seminar	28  - 28 Peb 2017	00:00 - 00:00	concert hall taman budaya yogyakarta	\N	\N
90	 EARQHUAKE RESISTANCE 	Lain-lain	16  - 17 Mar 2017	00:00 - 00:00	UNIVERSITAS PELITA HARAPAN KARAWACI, TANGERANG	\N	\N
89	 SBC & SSC Spagethi Bridge Competition Straw Structure Competition 	Lain-lain	15 Mar 2017 - 15 Peb 2017	00:00 - 00:00	universias Pelita harapan karawaci tangerang	\N	\N
88	 WORLD WATER DAY 	Lain-lain	10 Jan 2017 - 04 Mar 2017	00:00 - 12:00	ONLINE	\N	\N
87	 Lomba Akuntansi VII se-Indonesia 	Lain-lain	13  - 13 Mei 2017	08:00 - 18:00	Politeknik Negeri Bali	\N	\N
86	 Olimpiade Akuntansi XVIII Antar Siswa SMA/SMK se-Indonesia 	Lain-lain	13  - 13 Mei 2017	08:00 - 18:00	Politeknik Negeri Bali	\N	\N
85	 Agritech Cup 	Sport	30  - 30 Nov -1	06:30 - 21:00	GOR Pertamina - Universitas Brawijaya	\N	\N
84	 Festival Literasi Uhamka 	Lain-lain	06  - 24 Mar 2017	08:00 - 17:00	Jalan Tanah Merdeka Kampung Rambutan Kec. Pasar Rebo	\N	\N
83	 LOMBA CERDAS CERMAT PSIKOLOGI 2017 	Lain-lain	18  - 18 Mar 2017	07:00 - 17:00	ABDULLAH SIGIT HALL FAKULTAS ILMU PENDIDIKAN UNIVERSITAS NEGERI YOGYAKARTA 	\N	\N
82	 SEMINAR NASIONAL  	Seminar	16  - 16 Apr 2017	08:00 - 16:35	Orient International Restaurant and Convention Hall	\N	\N
80	 Musabaqah Funuun Islamiyah (MUFI) III 	Lain-lain	17 Mar 2017 - 19 Peb 2017	08:00 - 22:00	Kampus UIN Maulana Malik Ibrahim Malang	\N	\N
79	 SEMINAR NASIONAL 2017  	Seminar	22  - 22 Mar 2017	08:00 - 12:00	Auditorium Universitas Muria Kudus	\N	\N
78	 Seminar Nasional 	Seminar	25  - 25 Mar 2017	07:30 - 16:30	Universitas Sultan Agung Semarang (UNISSULA)	\N	\N
77	 NEON 2017 (National English competitiON 2017) 	Lain-lain	30  - 30 Nov -1	07:30 - 17:00	Universitas Tarumanagara 	\N	\N
76	 SPARTA LEAGUE 	Sport	28 Peb 2017 - 09 Mar 2017	17:00 - 22:00	GKB FIP, UNIVERSITAS NEGERI MALANG	\N	\N
75	 English Parade 2017 	Lain-lain	05  - 07 Mei 2017	07:00 - 18:00	Fakultas Ilmu Administrasi, Universitas Brawijaya	\N	\N
74	 Festival Literasi Uhamka 	Lain-lain	06  - 24 Mar 2017	08:00 - 17:00	Jalan Tanah Merdeka Kampung Rambutan Pasar Rebo Jakarta Timur	\N	\N
73	 Olimpiade ekonomi islam 	Lain-lain	27  - 27 Apr 2017	13:15 - 21:00	uin sunan kalijaga yogyakarta	\N	\N
72	 CIVIL EXPO 2017 TINGKAT PULAU JAWA 	Lain-lain	30  - 30 Nov -1	08:00 - 21:00	POLITEKNIK NEGERI SEMARANG	\N	\N
71	 Haflah Ilmiah Jilid 3 dan Bazzar Buku Murah 	Expo	27 Peb 2017 - 03 Mar 2017	08:00 - 17:00	Gedung Olahraga STAIN Kudus	\N	\N
70	 SEMINAR KESEHATAN NASIONAL 	Seminar	19  - 19 Peb 2017	08:00 - 15:00	Aula Fajar - Lantai 2, Fakultas Ekonomi dan Bisnis, Universitas Airlangga	\N	\N
69	 BAZAR BUKU UGM PRESS 2017 BACK TO CAMPUS 	Expo	06  - 18 Peb 2017	08:30 - 16:00	SHOWROOM UGM PRESS, JALAN GRAFIKA NO.1 KAMPUS UGM YOGYAKARTA (FAKULTAS TEKNIK UGM)	\N	\N
68	 Seminar Nasional Teknologi Informasi 2017 The Art of IT Security and Hacking 	Seminar	04  - 04 Mar 2017	08:30 - 14:30	Mahajaya Hotel Jalan HOS Cokroaminoto No. 63, Denpasar	\N	\N
67	 WORKSHOP PERPAJAKAN PPH OP 	Seminar	22  - 22 Peb 2017	08:00 - 16:00	Ball Room Lor In Hotel, Solo	\N	\N
66	 Business challenge 	Lain-lain	27  - 27 Apr 2017	13:15 - 21:00	covention hall uin sunankalijaga yogyakarta	\N	\N
65	 WORKSHOP JOURNALISTIC (Citizen Journalism) 	Lain-lain	25  - 25 Peb 2017	09:00 - 18:00	Universitas Katolik Widya Mandala, Kampus Pakuwon City	\N	\N
63	 BEDAH KAMPUS INDONESIA 	Expo	26  - 26 Peb 2017	07:00 - 16:00	Universitas Boyolali	\N	\N
62	 Unitri Cup 12th Badminton Championship 2017 Se â€“ Jawa Timur 	Sport	05  - 11 Des 2016	08:00 - 21:00	GOR Universitas Tribhuwana Tunggadewi Malang	\N	\N
61	 IFEST (ITN ISLAMIC FESTIVAL) 2017 	Lain-lain	14  - 21 Mar 2017	08:00 - 15:00	AUDITORIUM KAMPUS 1 ITN MALANG	\N	\N
60	 UNY Scientific Fair 2017 	Lain-lain	04 Mei 2016 - 06 Des 2016	07:00 - 21:00	Universitas Negeri Yogyakarta	\N	\N
59	 E-GAMES 2017 	Lain-lain	21  - 23 Mar 2017	07:30 - 16:00	Universitas Surabaya, Tenggilis	\N	\N
58	 PARADE MOTIVASI DAN INSPIRASI Lapis Lapis Cinta 	Lain-lain	12  - 12 Peb 2017	08:00 - 17:00	Aula D4 lantai 4 FE UM	\N	\N
57	 Seminar Nasional 	Seminar	01  - 01 Mar 2017	08:00 - 12:00	Auditorium Ar-Rahim, Universitas Yarsi	\N	\N
56	 TEMILREG JABODETABEK 2017 	Lain-lain	01  - 03 Mar 2017	08:00 - 04:00	UNIVERSITAS YARSI	\N	\N
54	 TARUMANAGARA BUSINESS PLAN COMPETITION IV 	Lain-lain	16  - 20 Mar 2017	08:00 - 16:00	KAMPUS I DAN KAMPUS II UNIVERSITAS TARUMANAGARA	\N	\N
53	 ITechno Cup 2017 	Lain-lain	13  - 16 Mar 2017	08:00 - 16:00	Politeknik Negeri Jakarta	\N	\N
52	 EXPO GREAT GENERATION 	Expo	11  - 11 Peb 2017	09:00 - 17:00	GOR PUNAKAWAN	\N	\N
51	 Technocorner UGM 2017 	Lain-lain	11  - 12 Mar 2017	08:00 - 21:00	Mandala Bhakti Wanitatama	\N	\N
50	 BIOEDU CEKREK - LOMBA FOTOGRAFI BIOTIK 2017 	Lain-lain	04  - 20 Peb 2017	10:00 - 23:55	Fakultas Sains dan Teknologi UIN Sunan Kalijaga Yogyakarta	\N	\N
49	 LOMBA MADING BIOTIK 2017 	Lain-lain	25  - 25 Peb 2017	08:00 - 13:00	Fakultas Sains dan Teknologi UIN Sunan Kalijaga Yogyakarta	\N	\N
48	 DONOR DARAH 	Lain-lain	21  - 21 Peb 2017	08:30 - 12:00	Poliklinik UIN Sunan Kalijaga	\N	\N
47	 LOMBA AKUSTIK - BIOTIK 2017 	Musik	25  - 25 Peb 2017	08:00 - 14:00	Fakultas Sains dan Teknologi UIN Sunan Kalijaga	\N	\N
46	 SEMINAR LINGKUNGAN - BIOTIK 2017 	Seminar	18  - 18 Peb 2017	08:00 - 11:30	Teatrikal Fakultas Sains dan Teknologi UIN Sunan Kalijaga	\N	\N
45	 COLOR RUN BIOTIK 2017 	Sport	26  - 26 Peb 2017	07:00 - 11:00	Kampus Barat UIN Sunan Kalijaga Yogyakarta	\N	\N
44	 Business Plan Competition 2017 	Expo	25 Jan 2017 - 28 Peb 2017	00:00 - 00:00	Universitas Riau	\N	\N
41	 ITK Thinktank 2017 	Lain-lain	17 Jan 2017 - 07 Mar 2017	00:00 - 00:00	Kampus ITK Karang Joang Balikpapan dan gedung BSC Dome Balikapapn	\N	\N
40	 JAVA ROBOT CONTEST VIII 	Lain-lain	01  - 02 Apr 2017	08:00 - 20:00	Gedung D4, Politeknik Elektronika Negeri Surabaya	\N	\N
39	 ENGLISH FESTIVAL 	Lain-lain	01  - 26 Peb 2017	07:00 - 20:00	Universitas Muhammadiyah Surabaya	\N	\N
38	 OLIMPIADE LINGKUNGAN HIDUP 	Lain-lain	25  - 25 Peb 2017	07:00 - 12:00	UNIVERSITAS MUHAMMADIYAH GRESIK	\N	\N
37	 SEMINAR NASIONAL CREATIVEPRENEUR 	Seminar	02  - 02 Apr 2017	07:00 - 11:00	AUDITORIUM SMAMDA	\N	\N
36	 MNC-FILM ( MEDAN NATIONAL CONFERENCE - FESTIVAL ILMIAH MAHASISWA) 2017 	Lain-lain	15 Jan 2017 - 09 Apr 2017	07:00 - 18:00	Universitas Negeri Medan	\N	\N
35	 Kompetisi Menulis Esai dan Opini antar Pelajar dan Mahasiswa se-Pekanbaru 	Lain-lain	06 Peb 2017 - 26 Mar 2017	06:00 - 00:00	Kampus FISIP UR Gelanggang Mahasiswa FISIP UR Lantai 2 Sekretariat IMS	\N	\N
34	 LAPIS-LAPIS CINTA 	Lain-lain	12 Peb 2017 - 30 Nov -1	08:00 - 00:00	Gedung Graha Cakrawala Universitas Negeri Malang	\N	\N
32	 Konferensi Mahasiswa Akuntansi (KMA) Universitas Atma Jaya Yogyakarta 	Lain-lain	13  - 15 Peb 2017	07:30 - 16:00	Kampus 2 Gd.Thomas Aquinas Universitas Atma Jaya Yogyakarta	\N	\N
31	 Olimpiade Akuntansi - Atma Jaya Yogyakarta Supreme Accounting Competition 	Lain-lain	13  - 15 Peb 2017	07:00 - 16:00	Kampus 3 Gd.Bonaventura Universitas Atma Jaya Yogyakarta	\N	\N
30	 SEMINAR NASIONAL 2017 ACCOUNTING ACTION DAY  	Seminar	11 Mar 2017 - 11 Peb 2017	07:00 - 13:00	Indraprasta Ballroom Sahid Jaya Yogyakarta Hotel & Convention Babarsari 	\N	\N
29	 ALFA BADMINTON COMPETITION 	Sport	01  - 02 Mar 2017	08:00 - 17:00	UMM DOME	\N	\N
26	 Lomba Debat Mahasiswa PGSD 	Lain-lain	26  - 26 Jan 2017	08:00 - 19:00	Universitas Slamet Riyadi Surakarta	\N	\N
25	 ScholarTalk 2017 International Scholarship & Competition Training 	Seminar	12  - 12 Peb 2017	09:00 - 15:00	UNY Hotel	\N	\N
24	 SEMARCUP X (Sebelas Maret Cup X)  	Sport	24  - 26 Mar 2017	08:00 - 20:00	GOR Sritex Arena 	\N	\N
21	 SEBELAS MARET INVESTMENT CHAMPIONSHIP (SMIC) 2017 	Lain-lain	06  - 25 Peb 2017	00:00 - 00:00	UNIVERSITAS SEBELAS MARET SURAKARTA	\N	\N
20	 Temilreg Trunojoyo 2017 	Lain-lain	13  - 15 Peb 2017	00:00 - 00:00	Universitas Trunojoyo Madura	\N	\N
19	 Festival Band Pelajar 	Musik	22  - 22 Peb 2017	00:00 - 00:00	Auditorium Univet Bantara Sukoharjo	\N	\N
14	 Digital Music Seminar 	Seminar	26  - 26 Jan 2017	00:00 - 00:00	El's Convention Center Solo Paragon Mall	\N	\N
11	 Seminar Pendidikan â€œThe Youth Make a Change and Inspireâ€ 	Seminar	14  - 14 Jan 2017	00:00 - 00:00	Aula Kampus BSI Salemba 22, Jl. Salemba Tengah No. 22 Jakarta Pusat	\N	\N
2	 Kompetisi Penegak Binwil 	Lain-lain	21  - 22 Jan 2017	00:00 - 00:00	Lapangan Prawit	\N	\N
13	 SEMINAR NASIONAL THE CONGLOMERATE MINDSET 	Seminar	18  - 18 Des 2016	00:00 - 00:00	AUDITORIUM DJAZMAN UMS 	\N	\N
12	 Ayo Dolanan Rek! 	Pensi	18  - 18 Des 2016	00:00 - 00:00	Gedung Perpustakaan BI, Jl. Taman Mayangkara No. 09, Surabaya	\N	\N
10	 Japanoize Revival 2016 	Pensi	18  - 18 Des 2016	00:00 - 00:00	Aula Serbaguna, Universitas Pasundan Jl. Setiabudi no.193, Bandung	\N	\N
9	 Lomba Robotik Untuk Siswa TK & SD 	Lain-lain	16  - 16 Jan 2017	00:00 - 00:00	RISE Central Park 3rd & 4th Floor, Jl. S. Parman Kav. 28 Jakarta Barat	\N	\N
6	 Indie Clothing Carnival Yogyakarta 	Pensi	23  - 25 Des 2016	00:00 - 00:00	Jogja Expo Center (JEC), Yogyakarta	\N	\N
5	 Lomba dan Seminar Matematika (LSM) XXV â€“ UNY 	Seminar	15  - 31 Des 2016	00:00 - 00:00	FMIPA Universitas Negeri Yogyakarta	\N	\N
7	 Air Supply Aniversary 	Musik	03  - 03 Des 2016	00:00 - 00:00	The Kasablanka Hall	\N	\N
4	 Law Expo PSKH UIN SUKA 	Expo	29  - 30 Nov 2017	00:00 - 00:00	Halaman FSH & FITK, UIN Sunan Kalijaga Yogyakarta	\N	\N
3	 JOB & CAREER EXPO YOGYAKARTA 	Bursa Kerja	08  - 09 Nov 2016	00:00 - 00:00	GRHA SHABA PRAMANA, UGM 	\N	\N
8	 BURSA KERJA SEMARANG â€“ September 2016 	Bursa Kerja	27  - 28 Sep 2016	00:00 - 00:00	GEDUNG MUSEUM RONGGOWARSITO, Semarang	\N	\N
\.


--
-- Data for Name: kota; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.kota (id_kota, kota) FROM stdin;
182001	 Kab. Aceh Barat
182002	 Kab. Adm. Kep. Seribu
182003	 Kab. Badung
182004	 Kab. Bandung
182005	 Kab. Bandung Barat
182006	 Kab. Bangkalan
182007	 Kab. Banjarnegara
182008	 Kab. Bantul
182009	 Kab. Banyumas
182010	 Kab. Banyuwangi
182011	 Kab. Bekasi
182012	 Kab. Bogor
182013	 Kab. Bone
182014	 Kab. Boyolali
182015	 Kab. Brebes
182016	 Kab. Buleleng
182017	 Kab. Cianjur
182018	 Kab. Cilacap
182019	 Kab. Deli Serdang
182020	 Kab. Fak Fak
182021	 Kab. Garut
182022	 Kab. Gowa
182023	 Kab. Gresik
182024	 Kab. Halmahera Barat
182025	 Kab. Indramayu
182026	 Kab. Jember
182027	 Kab. Jepara
182028	 Kab. Karanganyar
182029	 Kab. Karawang
182030	 Kab. Kebumen
182031	 Kab. Klaten
182032	 Kab. Kudus
182033	 Kab. Kulon Progo
182034	 Kab. Kuningan
182035	 Kab. Lamongan
182036	 Kab. Lampung Selatan
182037	 Kab. Lombok Tengah
182038	 Kab. Magelang
182039	 Kab. Majalengka
182040	 Kab. Malang
182041	 Kab. Manggarai
182042	 Kab. Minahasa
182043	 Kab. Nganjuk
182044	 Kab. Pacitan
182045	 Kab. Pamekasan
182046	 Kab. Pandeglang
182047	 Kab. Pegunungan Arfak
182048	 Kab. Pekalongan
182049	 Kab. Pesisir Barat
182050	 Kab. Ponorogo
182051	 Kab. Purwakarta
182052	 Kab. Purworejo
182053	 Kab. Rembang
182054	 Kab. Semarang
182055	 Kab. Serang
182056	 Kab. Sidoarjo
182057	 Kab. Sleman
182058	 Kab. Soppeng
182059	 Kab. Sragen
182060	 Kab. Subang
182061	 Kab. Sukoharjo
182062	 Kab. Sumbawa
182063	 Kab. Sumedang
182064	 Kab. Sumenep
182065	 Kab. Tangerang
182066	 Kab. Tasikmalaya
182067	 Kab. Tulungagung
182068	 Kab. Wonogiri
182069	 Kota Adm. Jakarta Barat
182070	 Kota Adm. Jakarta Pusat
182071	 Kota Adm. Jakarta Selatan
182072	 Kota Adm. Jakarta Timur
182073	 Kota Adm. Jakarta Utara
182074	 Kota Balikpapan
182075	 Kota Banda Aceh
182076	 Kota Bandar Lampung
182077	 Kota Bandung
182078	 Kota Banjarbaru
182079	 Kota Banjarmasin
182080	 Kota Batu
182081	 Kota Bekasi
182082	 Kota Bengkulu
182083	 Kota Bogor
182084	 Kota Bontang
182085	 Kota Bukittinggi
182086	 Kota Cilegon
182087	 Kota Cimahi
182088	 Kota Cirebon
182089	 Kota Denpasar
182090	 Kota Depok
182091	 Kota Jambi
182092	 Kota Kediri
182093	 Kota Kendari
182094	 Kota Madiun
182095	 Kota Magelang
182096	 Kota Makassar
182097	 Kota Malang
182098	 Kota Mataram
182099	 Kota Medan
182100	 Kota Mojokerto
182101	 Kota Padang
182102	 Kota Padang Panjang
182103	 Kota Padangsidimpuan
182104	 Kota Palangkaraya
182105	 Kota Palembang
182106	 Kota Palu
182107	 Kota Pekalongan
182108	 Kota Pekanbaru
182109	 Kota Pematangsiantar
182110	 Kota Pontianak
182111	 Kota Salatiga
182112	 Kota Samarinda
182113	 Kota Semarang
182114	 Kota Serang
182115	 Kota Sukabumi
182116	 Kota Surabaya
182117	 Kota Surakarta
182118	 Kota Tangerang
182119	 Kota Tangerang Selatan
182120	 Kota Tanjung Pinang
182121	 Kota Tasikmalaya
182122	 Kota Tegal
182123	 Kota Yogyakarta
\.


--
-- Data for Name: pembelian; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.pembelian (id_order, status, id_tiket, id_profil) FROM stdin;
\.


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.pengguna (id_pengguna, email, katasandi) FROM stdin;
\.


--
-- Data for Name: profil; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.profil (id_profil, nama, email, no_telp, alamat, jenis_kelamin, pendidikan_terakhir, sekolah_kampus, jurusan, biodata, id_pengguna) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.tag (id_event, tag) FROM stdin;
3955	badminton
3529	badminton
3109	badminton
2841	badminton
2670	badminton
2519	badminton
1442	badminton
1147	badminton
604	badminton
62	badminton
29	badminton
3800	basket
3250	basket
3109	basket
2986	basket
2983	basket
2889	basket
2874	basket
2670	basket
2528	basket
2491	basket
2130	basket
1775	basket
1496	basket
1192	basket
1163	basket
1121	basket
1047	basket
975	basket
893	basket
664	basket
604	basket
556	basket
450	basket
441	basket
223	basket
214	basket
76	basket
4201	bazaar
3760	bazaar
3045	bazaar
2966	bazaar
2922	bazaar
2898	bazaar
2880	bazaar
2449	bazaar
2279	bazaar
2249	bazaar
2134	bazaar
1945	bazaar
1891	bazaar
1838	bazaar
1815	bazaar
1714	bazaar
1660	bazaar
1593	bazaar
1563	bazaar
1517	bazaar
1465	bazaar
1444	bazaar
1232	bazaar
1183	bazaar
1158	bazaar
1018	bazaar
989	bazaar
956	bazaar
951	bazaar
867	bazaar
854	bazaar
832	bazaar
804	bazaar
728	bazaar
713	bazaar
698	bazaar
608	bazaar
485	bazaar
356	bazaar
300	bazaar
285	bazaar
277	bazaar
259	bazaar
248	bazaar
236	bazaar
178	bazaar
165	bazaar
131	bazaar
117	bazaar
95	bazaar
94	bazaar
12	bazaar
3110	bazar
3064	bazar
3041	bazar
3040	bazar
3039	bazar
3037	bazar
3036	bazar
3035	bazar
2950	bazar
2941	bazar
2935	bazar
2876	bazar
2849	bazar
2828	bazar
2678	bazar
2674	bazar
2638	bazar
2636	bazar
2217	bazar
2182	bazar
2175	bazar
2172	bazar
2132	bazar
2064	bazar
1962	bazar
1948	bazar
1806	bazar
1802	bazar
1794	bazar
1712	bazar
1619	bazar
1464	bazar
1435	bazar
1353	bazar
1295	bazar
1264	bazar
1258	bazar
1251	bazar
1242	bazar
1221	bazar
1205	bazar
1159	bazar
1137	bazar
1061	bazar
1002	bazar
967	bazar
933	bazar
926	bazar
889	bazar
876	bazar
798	bazar
795	bazar
771	bazar
610	bazar
598	bazar
547	bazar
395	bazar
360	bazar
219	bazar
217	bazar
179	bazar
175	bazar
152	bazar
133	bazar
71	bazar
69	bazar
52	bazar
4204	doorprize
4181	doorprize
3371	doorprize
4195	doorprize
4185	doorprize
4162	doorprize
4158	doorprize
4152	doorprize
4151	doorprize
4147	doorprize
4143	doorprize
4141	doorprize
4135	doorprize
4123	doorprize
4118	doorprize
4116	doorprize
4107	doorprize
4103	doorprize
4091	doorprize
4086	doorprize
4065	doorprize
4058	doorprize
4054	doorprize
4035	doorprize
4023	doorprize
4019	doorprize
3988	doorprize
3970	doorprize
3968	doorprize
3967	doorprize
3953	doorprize
3916	doorprize
3906	doorprize
3901	doorprize
3894	doorprize
3870	doorprize
3866	doorprize
3846	doorprize
3838	doorprize
3833	doorprize
3825	doorprize
3808	doorprize
3805	doorprize
3793	doorprize
3772	doorprize
3770	doorprize
3751	doorprize
3746	doorprize
3738	doorprize
3730	doorprize
3699	doorprize
3692	doorprize
3690	doorprize
3673	doorprize
3672	doorprize
3668	doorprize
3667	doorprize
3657	doorprize
3649	doorprize
3646	doorprize
3627	doorprize
3621	doorprize
3607	doorprize
3602	doorprize
3583	doorprize
3563	doorprize
3562	doorprize
3552	doorprize
3537	doorprize
3533	doorprize
3517	doorprize
3511	doorprize
3509	doorprize
3485	doorprize
3483	doorprize
3474	doorprize
3472	doorprize
3457	doorprize
3434	doorprize
3421	doorprize
3408	doorprize
3377	doorprize
3360	doorprize
3347	doorprize
3336	doorprize
3326	doorprize
3316	doorprize
3312	doorprize
3308	doorprize
3250	doorprize
3195	doorprize
3119	doorprize
3111	doorprize
3106	doorprize
3102	doorprize
3063	doorprize
3059	doorprize
3054	doorprize
3047	doorprize
3041	doorprize
3040	doorprize
3039	doorprize
3037	doorprize
3036	doorprize
3035	doorprize
3015	doorprize
2984	doorprize
2977	doorprize
2967	doorprize
2954	doorprize
2941	doorprize
2935	doorprize
2920	doorprize
2916	doorprize
2884	doorprize
2876	doorprize
2855	doorprize
2817	doorprize
2734	doorprize
2722	doorprize
2717	doorprize
2705	doorprize
2702	doorprize
2696	doorprize
2695	doorprize
2692	doorprize
2684	doorprize
2667	doorprize
2647	doorprize
2621	doorprize
2603	doorprize
2559	doorprize
2514	doorprize
2500	doorprize
2492	doorprize
2489	doorprize
2483	doorprize
2476	doorprize
2470	doorprize
2469	doorprize
2463	doorprize
2459	doorprize
2449	doorprize
2444	doorprize
2439	doorprize
2271	doorprize
2259	doorprize
2244	doorprize
2232	doorprize
2217	doorprize
2184	doorprize
2140	doorprize
2132	doorprize
2117	doorprize
2114	doorprize
2074	doorprize
2073	doorprize
2064	doorprize
2037	doorprize
2023	doorprize
2017	doorprize
1885	doorprize
1862	doorprize
1861	doorprize
1859	doorprize
1805	doorprize
1783	doorprize
1781	doorprize
1732	doorprize
1697	doorprize
1684	doorprize
1640	doorprize
1635	doorprize
1625	doorprize
1614	doorprize
1607	doorprize
1594	doorprize
1591	doorprize
1589	doorprize
1583	doorprize
1579	doorprize
1567	doorprize
1561	doorprize
1548	doorprize
1535	doorprize
1513	doorprize
1497	doorprize
1495	doorprize
1489	doorprize
1488	doorprize
1474	doorprize
1467	doorprize
1463	doorprize
1460	doorprize
1441	doorprize
1439	doorprize
1435	doorprize
1434	doorprize
1430	doorprize
1427	doorprize
1425	doorprize
1424	doorprize
1414	doorprize
1413	doorprize
1354	doorprize
1350	doorprize
1348	doorprize
1338	doorprize
1337	doorprize
1303	doorprize
1290	doorprize
1271	doorprize
1268	doorprize
1264	doorprize
1259	doorprize
1223	doorprize
1206	doorprize
1201	doorprize
1198	doorprize
1193	doorprize
1178	doorprize
1168	doorprize
1158	doorprize
1157	doorprize
1136	doorprize
1132	doorprize
1123	doorprize
1118	doorprize
1116	doorprize
1101	doorprize
1089	doorprize
1085	doorprize
1072	doorprize
1068	doorprize
1058	doorprize
1050	doorprize
1044	doorprize
1035	doorprize
1026	doorprize
1024	doorprize
1013	doorprize
1009	doorprize
1007	doorprize
1000	doorprize
976	doorprize
969	doorprize
961	doorprize
917	doorprize
889	doorprize
886	doorprize
883	doorprize
853	doorprize
851	doorprize
836	doorprize
834	doorprize
831	doorprize
822	doorprize
809	doorprize
808	doorprize
807	doorprize
806	doorprize
802	doorprize
799	doorprize
790	doorprize
787	doorprize
714	doorprize
709	doorprize
696	doorprize
693	doorprize
677	doorprize
665	doorprize
639	doorprize
629	doorprize
616	doorprize
614	doorprize
611	doorprize
587	doorprize
564	doorprize
521	doorprize
507	doorprize
484	doorprize
403	doorprize
399	doorprize
398	doorprize
385	doorprize
376	doorprize
368	doorprize
363	doorprize
339	doorprize
336	doorprize
317	doorprize
291	doorprize
278	doorprize
254	doorprize
243	doorprize
231	doorprize
225	doorprize
216	doorprize
208	doorprize
207	doorprize
187	doorprize
172	doorprize
106	doorprize
91	doorprize
82	doorprize
79	doorprize
68	doorprize
57	doorprize
45	doorprize
14	doorprize
12	doorprize
4059	futsal
3116	futsal
3110	futsal
3109	futsal
3054	futsal
3011	futsal
2986	futsal
2969	futsal
2904	futsal
2889	futsal
2841	futsal
2723	futsal
2670	futsal
2608	futsal
2557	futsal
2466	futsal
2450	futsal
2419	futsal
2130	futsal
1981	futsal
1900	futsal
1863	futsal
1816	futsal
1754	futsal
1712	futsal
1709	futsal
1676	futsal
1613	futsal
1496	futsal
1444	futsal
1442	futsal
1273	futsal
1137	futsal
1121	futsal
1081	futsal
1076	futsal
1075	futsal
1073	futsal
1047	futsal
1029	futsal
1013	futsal
1012	futsal
1004	futsal
1002	futsal
998	futsal
984	futsal
983	futsal
975	futsal
805	futsal
664	futsal
604	futsal
599	futsal
556	futsal
540	futsal
534	futsal
530	futsal
503	futsal
450	futsal
441	futsal
354	futsal
300	futsal
233	futsal
223	futsal
220	futsal
214	futsal
174	futsal
154	futsal
3972	lomba-debat
3575	lomba-debat
3538	lomba-debat
2863	lomba-debat
2862	lomba-debat
2838	lomba-debat
2636	lomba-debat
2542	lomba-debat
2249	lomba-debat
2092	lomba-debat
1943	lomba-debat
1797	lomba-debat
1712	lomba-debat
1384	lomba-debat
1306	lomba-debat
1051	lomba-debat
1038	lomba-debat
493	lomba-debat
346	lomba-debat
26	lomba-debat
4064	lomba-esai
3869	lomba-esai
3789	lomba-esai
3591	lomba-esai
3374	lomba-esai
3354	lomba-esai
3351	lomba-esai
3260	lomba-esai
3251	lomba-esai
3181	lomba-esai
3095	lomba-esai
2654	lomba-esai
2623	lomba-esai
2532	lomba-esai
2490	lomba-esai
2092	lomba-esai
2088	lomba-esai
2035	lomba-esai
1966	lomba-esai
1944	lomba-esai
1721	lomba-esai
1317	lomba-esai
1179	lomba-esai
1025	lomba-esai
823	lomba-esai
594	lomba-esai
572	lomba-esai
471	lomba-esai
346	lomba-esai
316	lomba-esai
120	lomba-esai
4036	lomba-essay
3780	lomba-essay
3775	lomba-essay
3671	lomba-essay
3639	lomba-essay
3632	lomba-essay
3365	lomba-essay
3281	lomba-essay
3270	lomba-essay
3264	lomba-essay
3071	lomba-essay
3069	lomba-essay
3049	lomba-essay
3020	lomba-essay
3011	lomba-essay
3009	lomba-essay
2642	lomba-essay
2525	lomba-essay
2524	lomba-essay
2433	lomba-essay
2126	lomba-essay
1948	lomba-essay
1796	lomba-essay
1722	lomba-essay
1699	lomba-essay
1306	lomba-essay
1170	lomba-essay
1119	lomba-essay
1056	lomba-essay
681	lomba-essay
582	lomba-essay
571	lomba-essay
567	lomba-essay
419	lomba-essay
3946	lomba-fotografi
3794	lomba-fotografi
3779	lomba-fotografi
3693	lomba-fotografi
3331	lomba-fotografi
3291	lomba-fotografi
3288	lomba-fotografi
3253	lomba-fotografi
3021	lomba-fotografi
2933	lomba-fotografi
2653	lomba-fotografi
2260	lomba-fotografi
2208	lomba-fotografi
2063	lomba-fotografi
2008	lomba-fotografi
1988	lomba-fotografi
1964	lomba-fotografi
1691	lomba-fotografi
1434	lomba-fotografi
1369	lomba-fotografi
1306	lomba-fotografi
1239	lomba-fotografi
1190	lomba-fotografi
1120	lomba-fotografi
980	lomba-fotografi
748	lomba-fotografi
631	lomba-fotografi
217	lomba-fotografi
118	lomba-fotografi
88	lomba-fotografi
50	lomba-fotografi
4188	lomba-karya-tulis
3990	lomba-karya-tulis
4104	lomba-karya-tulis
4082	lomba-karya-tulis
4021	lomba-karya-tulis
4009	lomba-karya-tulis
3882	lomba-karya-tulis
3847	lomba-karya-tulis
3321	lomba-karya-tulis
3238	lomba-karya-tulis
3234	lomba-karya-tulis
3211	lomba-karya-tulis
3190	lomba-karya-tulis
3086	lomba-karya-tulis
2952	lomba-karya-tulis
2936	lomba-karya-tulis
2932	lomba-karya-tulis
2729	lomba-karya-tulis
2700	lomba-karya-tulis
2609	lomba-karya-tulis
2578	lomba-karya-tulis
2516	lomba-karya-tulis
2473	lomba-karya-tulis
2451	lomba-karya-tulis
2418	lomba-karya-tulis
2254	lomba-karya-tulis
2239	lomba-karya-tulis
2171	lomba-karya-tulis
2034	lomba-karya-tulis
2030	lomba-karya-tulis
2026	lomba-karya-tulis
2007	lomba-karya-tulis
2005	lomba-karya-tulis
2004	lomba-karya-tulis
1997	lomba-karya-tulis
1996	lomba-karya-tulis
1995	lomba-karya-tulis
1986	lomba-karya-tulis
1985	lomba-karya-tulis
1984	lomba-karya-tulis
1982	lomba-karya-tulis
1941	lomba-karya-tulis
1940	lomba-karya-tulis
1934	lomba-karya-tulis
1923	lomba-karya-tulis
1882	lomba-karya-tulis
1876	lomba-karya-tulis
1875	lomba-karya-tulis
1864	lomba-karya-tulis
1851	lomba-karya-tulis
1840	lomba-karya-tulis
1798	lomba-karya-tulis
1767	lomba-karya-tulis
1728	lomba-karya-tulis
1713	lomba-karya-tulis
1701	lomba-karya-tulis
1679	lomba-karya-tulis
1650	lomba-karya-tulis
1631	lomba-karya-tulis
1621	lomba-karya-tulis
1604	lomba-karya-tulis
1443	lomba-karya-tulis
1238	lomba-karya-tulis
1177	lomba-karya-tulis
1110	lomba-karya-tulis
1048	lomba-karya-tulis
992	lomba-karya-tulis
852	lomba-karya-tulis
755	lomba-karya-tulis
491	lomba-karya-tulis
474	lomba-karya-tulis
418	lomba-karya-tulis
321	lomba-karya-tulis
312	lomba-karya-tulis
297	lomba-karya-tulis
279	lomba-karya-tulis
179	lomba-karya-tulis
176	lomba-karya-tulis
175	lomba-karya-tulis
160	lomba-karya-tulis
155	lomba-karya-tulis
128	lomba-karya-tulis
36	lomba-karya-tulis
2935	lomba-mewarnai
2921	lomba-mewarnai
2420	lomba-mewarnai
2113	lomba-mewarnai
1353	lomba-mewarnai
1329	lomba-mewarnai
1264	lomba-mewarnai
333	lomba-mewarnai
302	lomba-mewarnai
222	lomba-mewarnai
221	lomba-mewarnai
4064	lomba-poster
4036	lomba-poster
3971	lomba-poster
3960	lomba-poster
3936	lomba-poster
3891	lomba-poster
3868	lomba-poster
3835	lomba-poster
3779	lomba-poster
3693	lomba-poster
3632	lomba-poster
3615	lomba-poster
3575	lomba-poster
3566	lomba-poster
3365	lomba-poster
3342	lomba-poster
3251	lomba-poster
3248	lomba-poster
3246	lomba-poster
3242	lomba-poster
2952	lomba-poster
2939	lomba-poster
2622	lomba-poster
1881	lomba-poster
1829	lomba-poster
1708	lomba-poster
1652	lomba-poster
1315	lomba-poster
1306	lomba-poster
1082	lomba-poster
953	lomba-poster
876	lomba-poster
594	lomba-poster
562	lomba-poster
553	lomba-poster
493	lomba-poster
471	lomba-poster
3530	piagam-penghargaan
3245	piagam-penghargaan
3227	piagam-penghargaan
2532	piagam-penghargaan
2491	piagam-penghargaan
2473	piagam-penghargaan
2415	piagam-penghargaan
2254	piagam-penghargaan
2141	piagam-penghargaan
1996	piagam-penghargaan
1875	piagam-penghargaan
971	piagam-penghargaan
110	piagam-penghargaan
4205	seminar-bersertifikat
4204	seminar-bersertifikat
4200	seminar-bersertifikat
4191	seminar-bersertifikat
4181	seminar-bersertifikat
3371	seminar-bersertifikat
4154	seminar-bersertifikat
4152	seminar-bersertifikat
4151	seminar-bersertifikat
4133	seminar-bersertifikat
4127	seminar-bersertifikat
4122	seminar-bersertifikat
4093	seminar-bersertifikat
4085	seminar-bersertifikat
4069	seminar-bersertifikat
4060	seminar-bersertifikat
4053	seminar-bersertifikat
4023	seminar-bersertifikat
4018	seminar-bersertifikat
4017	seminar-bersertifikat
3996	seminar-bersertifikat
3983	seminar-bersertifikat
3977	seminar-bersertifikat
3970	seminar-bersertifikat
3959	seminar-bersertifikat
3958	seminar-bersertifikat
3953	seminar-bersertifikat
3948	seminar-bersertifikat
3944	seminar-bersertifikat
3941	seminar-bersertifikat
3935	seminar-bersertifikat
3934	seminar-bersertifikat
3920	seminar-bersertifikat
3916	seminar-bersertifikat
3901	seminar-bersertifikat
3897	seminar-bersertifikat
3894	seminar-bersertifikat
3893	seminar-bersertifikat
3867	seminar-bersertifikat
3866	seminar-bersertifikat
3850	seminar-bersertifikat
3833	seminar-bersertifikat
3827	seminar-bersertifikat
3823	seminar-bersertifikat
3808	seminar-bersertifikat
3805	seminar-bersertifikat
3793	seminar-bersertifikat
3778	seminar-bersertifikat
3773	seminar-bersertifikat
3767	seminar-bersertifikat
3759	seminar-bersertifikat
3738	seminar-bersertifikat
3737	seminar-bersertifikat
3736	seminar-bersertifikat
3733	seminar-bersertifikat
3730	seminar-bersertifikat
3723	seminar-bersertifikat
3721	seminar-bersertifikat
3697	seminar-bersertifikat
3692	seminar-bersertifikat
3671	seminar-bersertifikat
3670	seminar-bersertifikat
3668	seminar-bersertifikat
3666	seminar-bersertifikat
3663	seminar-bersertifikat
3660	seminar-bersertifikat
3657	seminar-bersertifikat
3649	seminar-bersertifikat
3646	seminar-bersertifikat
3644	seminar-bersertifikat
3643	seminar-bersertifikat
3622	seminar-bersertifikat
3614	seminar-bersertifikat
3608	seminar-bersertifikat
3581	seminar-bersertifikat
3567	seminar-bersertifikat
3564	seminar-bersertifikat
3560	seminar-bersertifikat
3554	seminar-bersertifikat
3550	seminar-bersertifikat
3545	seminar-bersertifikat
3537	seminar-bersertifikat
3509	seminar-bersertifikat
3506	seminar-bersertifikat
3495	seminar-bersertifikat
3486	seminar-bersertifikat
3481	seminar-bersertifikat
3474	seminar-bersertifikat
3471	seminar-bersertifikat
3468	seminar-bersertifikat
3457	seminar-bersertifikat
3456	seminar-bersertifikat
3443	seminar-bersertifikat
3442	seminar-bersertifikat
3434	seminar-bersertifikat
3422	seminar-bersertifikat
3419	seminar-bersertifikat
3409	seminar-bersertifikat
3407	seminar-bersertifikat
3377	seminar-bersertifikat
3372	seminar-bersertifikat
3362	seminar-bersertifikat
3360	seminar-bersertifikat
3345	seminar-bersertifikat
3326	seminar-bersertifikat
3316	seminar-bersertifikat
3306	seminar-bersertifikat
3293	seminar-bersertifikat
3291	seminar-bersertifikat
3250	seminar-bersertifikat
3239	seminar-bersertifikat
3232	seminar-bersertifikat
3206	seminar-bersertifikat
3195	seminar-bersertifikat
3123	seminar-bersertifikat
3121	seminar-bersertifikat
3120	seminar-bersertifikat
3111	seminar-bersertifikat
3102	seminar-bersertifikat
3072	seminar-bersertifikat
3070	seminar-bersertifikat
3063	seminar-bersertifikat
3047	seminar-bersertifikat
3045	seminar-bersertifikat
3032	seminar-bersertifikat
3000	seminar-bersertifikat
2980	seminar-bersertifikat
2968	seminar-bersertifikat
2967	seminar-bersertifikat
2956	seminar-bersertifikat
2951	seminar-bersertifikat
2932	seminar-bersertifikat
2920	seminar-bersertifikat
2887	seminar-bersertifikat
2884	seminar-bersertifikat
2878	seminar-bersertifikat
2873	seminar-bersertifikat
2856	seminar-bersertifikat
2855	seminar-bersertifikat
2847	seminar-bersertifikat
2826	seminar-bersertifikat
2823	seminar-bersertifikat
2819	seminar-bersertifikat
2734	seminar-bersertifikat
2717	seminar-bersertifikat
2705	seminar-bersertifikat
2699	seminar-bersertifikat
2696	seminar-bersertifikat
2695	seminar-bersertifikat
2692	seminar-bersertifikat
2684	seminar-bersertifikat
2681	seminar-bersertifikat
2667	seminar-bersertifikat
2662	seminar-bersertifikat
2647	seminar-bersertifikat
2643	seminar-bersertifikat
2634	seminar-bersertifikat
2598	seminar-bersertifikat
2596	seminar-bersertifikat
2595	seminar-bersertifikat
2594	seminar-bersertifikat
2581	seminar-bersertifikat
2545	seminar-bersertifikat
2502	seminar-bersertifikat
2499	seminar-bersertifikat
2489	seminar-bersertifikat
2483	seminar-bersertifikat
2477	seminar-bersertifikat
2470	seminar-bersertifikat
2467	seminar-bersertifikat
2463	seminar-bersertifikat
2459	seminar-bersertifikat
2424	seminar-bersertifikat
2273	seminar-bersertifikat
2267	seminar-bersertifikat
2259	seminar-bersertifikat
2256	seminar-bersertifikat
2251	seminar-bersertifikat
2231	seminar-bersertifikat
2217	seminar-bersertifikat
2214	seminar-bersertifikat
2212	seminar-bersertifikat
2184	seminar-bersertifikat
2174	seminar-bersertifikat
2170	seminar-bersertifikat
2155	seminar-bersertifikat
2140	seminar-bersertifikat
2132	seminar-bersertifikat
2125	seminar-bersertifikat
2124	seminar-bersertifikat
2117	seminar-bersertifikat
2098	seminar-bersertifikat
2074	seminar-bersertifikat
2073	seminar-bersertifikat
2072	seminar-bersertifikat
2042	seminar-bersertifikat
2037	seminar-bersertifikat
2022	seminar-bersertifikat
2013	seminar-bersertifikat
2012	seminar-bersertifikat
1973	seminar-bersertifikat
1972	seminar-bersertifikat
1945	seminar-bersertifikat
1889	seminar-bersertifikat
1885	seminar-bersertifikat
1837	seminar-bersertifikat
1836	seminar-bersertifikat
1833	seminar-bersertifikat
1781	seminar-bersertifikat
1747	seminar-bersertifikat
1741	seminar-bersertifikat
1737	seminar-bersertifikat
1736	seminar-bersertifikat
1732	seminar-bersertifikat
1719	seminar-bersertifikat
1705	seminar-bersertifikat
1702	seminar-bersertifikat
1697	seminar-bersertifikat
1665	seminar-bersertifikat
1635	seminar-bersertifikat
1630	seminar-bersertifikat
1625	seminar-bersertifikat
1618	seminar-bersertifikat
1614	seminar-bersertifikat
1610	seminar-bersertifikat
1605	seminar-bersertifikat
1594	seminar-bersertifikat
1588	seminar-bersertifikat
1583	seminar-bersertifikat
1581	seminar-bersertifikat
1579	seminar-bersertifikat
1577	seminar-bersertifikat
1572	seminar-bersertifikat
1567	seminar-bersertifikat
1564	seminar-bersertifikat
1561	seminar-bersertifikat
1559	seminar-bersertifikat
1517	seminar-bersertifikat
1513	seminar-bersertifikat
1505	seminar-bersertifikat
1497	seminar-bersertifikat
1495	seminar-bersertifikat
1492	seminar-bersertifikat
1489	seminar-bersertifikat
1488	seminar-bersertifikat
1486	seminar-bersertifikat
1485	seminar-bersertifikat
1474	seminar-bersertifikat
1463	seminar-bersertifikat
1441	seminar-bersertifikat
1440	seminar-bersertifikat
1431	seminar-bersertifikat
1430	seminar-bersertifikat
1425	seminar-bersertifikat
1414	seminar-bersertifikat
1413	seminar-bersertifikat
1411	seminar-bersertifikat
1409	seminar-bersertifikat
1400	seminar-bersertifikat
1399	seminar-bersertifikat
1397	seminar-bersertifikat
1394	seminar-bersertifikat
1390	seminar-bersertifikat
1348	seminar-bersertifikat
1341	seminar-bersertifikat
1338	seminar-bersertifikat
1337	seminar-bersertifikat
1318	seminar-bersertifikat
1299	seminar-bersertifikat
1293	seminar-bersertifikat
1291	seminar-bersertifikat
1290	seminar-bersertifikat
1287	seminar-bersertifikat
1271	seminar-bersertifikat
1263	seminar-bersertifikat
1250	seminar-bersertifikat
1247	seminar-bersertifikat
1228	seminar-bersertifikat
1223	seminar-bersertifikat
1206	seminar-bersertifikat
1203	seminar-bersertifikat
1202	seminar-bersertifikat
1201	seminar-bersertifikat
1178	seminar-bersertifikat
1177	seminar-bersertifikat
1175	seminar-bersertifikat
1168	seminar-bersertifikat
1166	seminar-bersertifikat
1123	seminar-bersertifikat
1116	seminar-bersertifikat
1114	seminar-bersertifikat
1095	seminar-bersertifikat
1091	seminar-bersertifikat
1089	seminar-bersertifikat
1086	seminar-bersertifikat
1085	seminar-bersertifikat
1074	seminar-bersertifikat
1068	seminar-bersertifikat
1058	seminar-bersertifikat
1035	seminar-bersertifikat
1030	seminar-bersertifikat
1024	seminar-bersertifikat
1007	seminar-bersertifikat
1000	seminar-bersertifikat
982	seminar-bersertifikat
978	seminar-bersertifikat
969	seminar-bersertifikat
960	seminar-bersertifikat
936	seminar-bersertifikat
883	seminar-bersertifikat
850	seminar-bersertifikat
836	seminar-bersertifikat
826	seminar-bersertifikat
820	seminar-bersertifikat
812	seminar-bersertifikat
811	seminar-bersertifikat
807	seminar-bersertifikat
790	seminar-bersertifikat
760	seminar-bersertifikat
739	seminar-bersertifikat
699	seminar-bersertifikat
696	seminar-bersertifikat
695	seminar-bersertifikat
693	seminar-bersertifikat
692	seminar-bersertifikat
677	seminar-bersertifikat
670	seminar-bersertifikat
639	seminar-bersertifikat
638	seminar-bersertifikat
637	seminar-bersertifikat
629	seminar-bersertifikat
628	seminar-bersertifikat
626	seminar-bersertifikat
622	seminar-bersertifikat
619	seminar-bersertifikat
611	seminar-bersertifikat
602	seminar-bersertifikat
595	seminar-bersertifikat
591	seminar-bersertifikat
590	seminar-bersertifikat
579	seminar-bersertifikat
561	seminar-bersertifikat
548	seminar-bersertifikat
546	seminar-bersertifikat
529	seminar-bersertifikat
527	seminar-bersertifikat
523	seminar-bersertifikat
521	seminar-bersertifikat
507	seminar-bersertifikat
496	seminar-bersertifikat
487	seminar-bersertifikat
485	seminar-bersertifikat
484	seminar-bersertifikat
468	seminar-bersertifikat
460	seminar-bersertifikat
423	seminar-bersertifikat
420	seminar-bersertifikat
416	seminar-bersertifikat
403	seminar-bersertifikat
400	seminar-bersertifikat
399	seminar-bersertifikat
398	seminar-bersertifikat
397	seminar-bersertifikat
395	seminar-bersertifikat
394	seminar-bersertifikat
391	seminar-bersertifikat
388	seminar-bersertifikat
383	seminar-bersertifikat
376	seminar-bersertifikat
373	seminar-bersertifikat
369	seminar-bersertifikat
368	seminar-bersertifikat
366	seminar-bersertifikat
365	seminar-bersertifikat
363	seminar-bersertifikat
347	seminar-bersertifikat
332	seminar-bersertifikat
317	seminar-bersertifikat
314	seminar-bersertifikat
308	seminar-bersertifikat
293	seminar-bersertifikat
291	seminar-bersertifikat
278	seminar-bersertifikat
271	seminar-bersertifikat
267	seminar-bersertifikat
254	seminar-bersertifikat
243	seminar-bersertifikat
232	seminar-bersertifikat
231	seminar-bersertifikat
228	seminar-bersertifikat
227	seminar-bersertifikat
226	seminar-bersertifikat
218	seminar-bersertifikat
216	seminar-bersertifikat
208	seminar-bersertifikat
207	seminar-bersertifikat
205	seminar-bersertifikat
201	seminar-bersertifikat
178	seminar-bersertifikat
171	seminar-bersertifikat
162	seminar-bersertifikat
117	seminar-bersertifikat
108	seminar-bersertifikat
107	seminar-bersertifikat
103	seminar-bersertifikat
79	seminar-bersertifikat
70	seminar-bersertifikat
68	seminar-bersertifikat
57	seminar-bersertifikat
46	seminar-bersertifikat
14	seminar-bersertifikat
11	seminar-bersertifikat
5	seminar-bersertifikat
4207	sertifikat
4205	sertifikat
4204	sertifikat
4200	sertifikat
4191	sertifikat
4189	sertifikat
4181	sertifikat
4163	sertifikat
4106	sertifikat
3371	sertifikat
4180	sertifikat
4154	sertifikat
4152	sertifikat
4151	sertifikat
4133	sertifikat
4127	sertifikat
4122	sertifikat
4107	sertifikat
4104	sertifikat
4093	sertifikat
4085	sertifikat
4082	sertifikat
4069	sertifikat
4060	sertifikat
4056	sertifikat
4053	sertifikat
4040	sertifikat
4023	sertifikat
4018	sertifikat
4017	sertifikat
4004	sertifikat
3996	sertifikat
3983	sertifikat
3977	sertifikat
3970	sertifikat
3966	sertifikat
3959	sertifikat
3958	sertifikat
3955	sertifikat
3953	sertifikat
3948	sertifikat
3944	sertifikat
3941	sertifikat
3936	sertifikat
3935	sertifikat
3934	sertifikat
3928	sertifikat
3922	sertifikat
3920	sertifikat
3916	sertifikat
3901	sertifikat
3897	sertifikat
3894	sertifikat
3893	sertifikat
3891	sertifikat
3884	sertifikat
3869	sertifikat
3867	sertifikat
3866	sertifikat
3853	sertifikat
3850	sertifikat
3840	sertifikat
3836	sertifikat
3835	sertifikat
3833	sertifikat
3827	sertifikat
3823	sertifikat
3821	sertifikat
3816	sertifikat
3808	sertifikat
3805	sertifikat
3793	sertifikat
3792	sertifikat
3786	sertifikat
3784	sertifikat
3780	sertifikat
3778	sertifikat
3775	sertifikat
3773	sertifikat
3767	sertifikat
3766	sertifikat
3759	sertifikat
3738	sertifikat
3737	sertifikat
3736	sertifikat
3734	sertifikat
3733	sertifikat
3730	sertifikat
3728	sertifikat
3723	sertifikat
3721	sertifikat
3710	sertifikat
3697	sertifikat
3693	sertifikat
3692	sertifikat
3689	sertifikat
3676	sertifikat
3674	sertifikat
3671	sertifikat
3670	sertifikat
3668	sertifikat
3667	sertifikat
3666	sertifikat
3663	sertifikat
3660	sertifikat
3657	sertifikat
3653	sertifikat
3649	sertifikat
3648	sertifikat
3646	sertifikat
3644	sertifikat
3643	sertifikat
3642	sertifikat
3624	sertifikat
3623	sertifikat
3622	sertifikat
3614	sertifikat
3608	sertifikat
3591	sertifikat
3590	sertifikat
3581	sertifikat
3573	sertifikat
3572	sertifikat
3570	sertifikat
3567	sertifikat
3566	sertifikat
3564	sertifikat
3560	sertifikat
3554	sertifikat
3550	sertifikat
3545	sertifikat
3541	sertifikat
3537	sertifikat
3536	sertifikat
3528	sertifikat
3525	sertifikat
3519	sertifikat
3512	sertifikat
3509	sertifikat
3506	sertifikat
3495	sertifikat
3492	sertifikat
3486	sertifikat
3481	sertifikat
3474	sertifikat
3471	sertifikat
3469	sertifikat
3468	sertifikat
3458	sertifikat
3457	sertifikat
3456	sertifikat
3455	sertifikat
3445	sertifikat
3443	sertifikat
3442	sertifikat
3434	sertifikat
3432	sertifikat
3430	sertifikat
3425	sertifikat
3422	sertifikat
3419	sertifikat
3411	sertifikat
3409	sertifikat
3407	sertifikat
3398	sertifikat
3391	sertifikat
3386	sertifikat
3380	sertifikat
3377	sertifikat
3375	sertifikat
3374	sertifikat
3372	sertifikat
3364	sertifikat
3362	sertifikat
3361	sertifikat
3360	sertifikat
3355	sertifikat
3354	sertifikat
3351	sertifikat
3345	sertifikat
3344	sertifikat
3343	sertifikat
3342	sertifikat
3337	sertifikat
3329	sertifikat
3327	sertifikat
3326	sertifikat
3321	sertifikat
3316	sertifikat
3308	sertifikat
3306	sertifikat
3305	sertifikat
3302	sertifikat
3293	sertifikat
3291	sertifikat
3288	sertifikat
3281	sertifikat
3280	sertifikat
3261	sertifikat
3260	sertifikat
3250	sertifikat
3246	sertifikat
3242	sertifikat
3239	sertifikat
3238	sertifikat
3236	sertifikat
3234	sertifikat
3232	sertifikat
3230	sertifikat
3228	sertifikat
3227	sertifikat
3217	sertifikat
3211	sertifikat
3208	sertifikat
3206	sertifikat
3202	sertifikat
3198	sertifikat
3195	sertifikat
3181	sertifikat
3123	sertifikat
3121	sertifikat
3120	sertifikat
3118	sertifikat
3116	sertifikat
3111	sertifikat
3108	sertifikat
3102	sertifikat
3084	sertifikat
3072	sertifikat
3070	sertifikat
3063	sertifikat
3057	sertifikat
3047	sertifikat
3045	sertifikat
3032	sertifikat
3029	sertifikat
3015	sertifikat
3003	sertifikat
3000	sertifikat
2980	sertifikat
2969	sertifikat
2968	sertifikat
2967	sertifikat
2958	sertifikat
2956	sertifikat
2951	sertifikat
2950	sertifikat
2944	sertifikat
2932	sertifikat
2920	sertifikat
2890	sertifikat
2887	sertifikat
2884	sertifikat
2878	sertifikat
2873	sertifikat
2863	sertifikat
2862	sertifikat
2856	sertifikat
2855	sertifikat
2847	sertifikat
2845	sertifikat
2826	sertifikat
2823	sertifikat
2819	sertifikat
2734	sertifikat
2726	sertifikat
2725	sertifikat
2723	sertifikat
2717	sertifikat
2705	sertifikat
2699	sertifikat
2696	sertifikat
2695	sertifikat
2692	sertifikat
2684	sertifikat
2681	sertifikat
2678	sertifikat
2675	sertifikat
2667	sertifikat
2662	sertifikat
2654	sertifikat
2653	sertifikat
2647	sertifikat
2646	sertifikat
2643	sertifikat
2642	sertifikat
2638	sertifikat
2634	sertifikat
2624	sertifikat
2623	sertifikat
2622	sertifikat
2615	sertifikat
2613	sertifikat
2607	sertifikat
2599	sertifikat
2598	sertifikat
2596	sertifikat
2595	sertifikat
2594	sertifikat
2581	sertifikat
2578	sertifikat
2572	sertifikat
2564	sertifikat
2551	sertifikat
2548	sertifikat
2545	sertifikat
2538	sertifikat
2516	sertifikat
2502	sertifikat
2501	sertifikat
2499	sertifikat
2489	sertifikat
2488	sertifikat
2484	sertifikat
2483	sertifikat
2478	sertifikat
2477	sertifikat
2473	sertifikat
2470	sertifikat
2467	sertifikat
2463	sertifikat
2459	sertifikat
2451	sertifikat
2441	sertifikat
2433	sertifikat
2424	sertifikat
2419	sertifikat
2418	sertifikat
2415	sertifikat
2288	sertifikat
2279	sertifikat
2277	sertifikat
2273	sertifikat
2268	sertifikat
2267	sertifikat
2265	sertifikat
2262	sertifikat
2259	sertifikat
2256	sertifikat
2255	sertifikat
2251	sertifikat
2250	sertifikat
2245	sertifikat
2242	sertifikat
2239	sertifikat
2238	sertifikat
2231	sertifikat
2219	sertifikat
2217	sertifikat
2214	sertifikat
2212	sertifikat
2191	sertifikat
2184	sertifikat
2181	sertifikat
2177	sertifikat
2174	sertifikat
2173	sertifikat
2170	sertifikat
2165	sertifikat
2164	sertifikat
2163	sertifikat
2155	sertifikat
2148	sertifikat
2146	sertifikat
2141	sertifikat
2140	sertifikat
2135	sertifikat
2133	sertifikat
2132	sertifikat
2130	sertifikat
2125	sertifikat
2124	sertifikat
2123	sertifikat
2117	sertifikat
2113	sertifikat
2112	sertifikat
2106	sertifikat
2100	sertifikat
2098	sertifikat
2096	sertifikat
2094	sertifikat
2092	sertifikat
2087	sertifikat
2075	sertifikat
2074	sertifikat
2073	sertifikat
2072	sertifikat
2065	sertifikat
2059	sertifikat
2057	sertifikat
2054	sertifikat
2048	sertifikat
2047	sertifikat
2042	sertifikat
2037	sertifikat
2036	sertifikat
2035	sertifikat
2030	sertifikat
2028	sertifikat
2026	sertifikat
2022	sertifikat
2013	sertifikat
2012	sertifikat
2011	sertifikat
2009	sertifikat
1998	sertifikat
1997	sertifikat
1988	sertifikat
1982	sertifikat
1981	sertifikat
1975	sertifikat
1973	sertifikat
1972	sertifikat
1966	sertifikat
1957	sertifikat
1946	sertifikat
1945	sertifikat
1944	sertifikat
1943	sertifikat
1941	sertifikat
1940	sertifikat
1934	sertifikat
1931	sertifikat
1928	sertifikat
1923	sertifikat
1898	sertifikat
1889	sertifikat
1885	sertifikat
1882	sertifikat
1876	sertifikat
1861	sertifikat
1860	sertifikat
1859	sertifikat
1851	sertifikat
1837	sertifikat
1836	sertifikat
1835	sertifikat
1833	sertifikat
1816	sertifikat
1812	sertifikat
1806	sertifikat
1805	sertifikat
1802	sertifikat
1800	sertifikat
1798	sertifikat
1797	sertifikat
1796	sertifikat
1790	sertifikat
1781	sertifikat
1779	sertifikat
1770	sertifikat
1769	sertifikat
1767	sertifikat
1751	sertifikat
1750	sertifikat
1747	sertifikat
1741	sertifikat
1737	sertifikat
1736	sertifikat
1732	sertifikat
1731	sertifikat
1730	sertifikat
1728	sertifikat
1726	sertifikat
1724	sertifikat
1723	sertifikat
1722	sertifikat
1721	sertifikat
1719	sertifikat
1716	sertifikat
1708	sertifikat
1707	sertifikat
1705	sertifikat
1702	sertifikat
1700	sertifikat
1699	sertifikat
1697	sertifikat
1691	sertifikat
1686	sertifikat
1684	sertifikat
1677	sertifikat
1669	sertifikat
1665	sertifikat
1660	sertifikat
1659	sertifikat
1658	sertifikat
1655	sertifikat
1652	sertifikat
1636	sertifikat
1635	sertifikat
1630	sertifikat
1625	sertifikat
1618	sertifikat
1614	sertifikat
1610	sertifikat
1605	sertifikat
1603	sertifikat
1600	sertifikat
1594	sertifikat
1591	sertifikat
1590	sertifikat
1588	sertifikat
1583	sertifikat
1582	sertifikat
1581	sertifikat
1579	sertifikat
1577	sertifikat
1576	sertifikat
1572	sertifikat
1567	sertifikat
1564	sertifikat
1561	sertifikat
1559	sertifikat
1541	sertifikat
1539	sertifikat
1527	sertifikat
1517	sertifikat
1513	sertifikat
1505	sertifikat
1502	sertifikat
1497	sertifikat
1495	sertifikat
1493	sertifikat
1492	sertifikat
1489	sertifikat
1488	sertifikat
1486	sertifikat
1485	sertifikat
1484	sertifikat
1474	sertifikat
1465	sertifikat
1463	sertifikat
1457	sertifikat
1441	sertifikat
1440	sertifikat
1431	sertifikat
1430	sertifikat
1425	sertifikat
1414	sertifikat
1413	sertifikat
1411	sertifikat
1409	sertifikat
1400	sertifikat
1399	sertifikat
1397	sertifikat
1394	sertifikat
1391	sertifikat
1390	sertifikat
1388	sertifikat
1368	sertifikat
1350	sertifikat
1348	sertifikat
1343	sertifikat
1341	sertifikat
1338	sertifikat
1337	sertifikat
1334	sertifikat
1329	sertifikat
1324	sertifikat
1323	sertifikat
1318	sertifikat
1315	sertifikat
1311	sertifikat
1299	sertifikat
1293	sertifikat
1292	sertifikat
1291	sertifikat
1290	sertifikat
1287	sertifikat
1274	sertifikat
1271	sertifikat
1270	sertifikat
1263	sertifikat
1250	sertifikat
1247	sertifikat
1243	sertifikat
1239	sertifikat
1238	sertifikat
1231	sertifikat
1228	sertifikat
1223	sertifikat
1218	sertifikat
1206	sertifikat
1203	sertifikat
1202	sertifikat
1201	sertifikat
1200	sertifikat
1198	sertifikat
1190	sertifikat
1189	sertifikat
1179	sertifikat
1178	sertifikat
1177	sertifikat
1175	sertifikat
1170	sertifikat
1169	sertifikat
1168	sertifikat
1166	sertifikat
1149	sertifikat
1123	sertifikat
1118	sertifikat
1116	sertifikat
1114	sertifikat
1112	sertifikat
1110	sertifikat
1095	sertifikat
1091	sertifikat
1089	sertifikat
1088	sertifikat
1086	sertifikat
1085	sertifikat
1076	sertifikat
1075	sertifikat
1074	sertifikat
1068	sertifikat
1058	sertifikat
1057	sertifikat
1052	sertifikat
1048	sertifikat
1046	sertifikat
1035	sertifikat
1034	sertifikat
1033	sertifikat
1030	sertifikat
1028	sertifikat
1027	sertifikat
1024	sertifikat
1019	sertifikat
1007	sertifikat
1004	sertifikat
1000	sertifikat
995	sertifikat
992	sertifikat
982	sertifikat
978	sertifikat
971	sertifikat
969	sertifikat
961	sertifikat
960	sertifikat
936	sertifikat
932	sertifikat
927	sertifikat
899	sertifikat
892	sertifikat
883	sertifikat
850	sertifikat
836	sertifikat
826	sertifikat
820	sertifikat
815	sertifikat
812	sertifikat
811	sertifikat
807	sertifikat
790	sertifikat
784	sertifikat
760	sertifikat
755	sertifikat
748	sertifikat
741	sertifikat
739	sertifikat
699	sertifikat
696	sertifikat
695	sertifikat
694	sertifikat
693	sertifikat
692	sertifikat
678	sertifikat
677	sertifikat
670	sertifikat
639	sertifikat
638	sertifikat
637	sertifikat
629	sertifikat
628	sertifikat
626	sertifikat
622	sertifikat
619	sertifikat
611	sertifikat
608	sertifikat
602	sertifikat
595	sertifikat
591	sertifikat
590	sertifikat
589	sertifikat
579	sertifikat
572	sertifikat
571	sertifikat
561	sertifikat
556	sertifikat
555	sertifikat
548	sertifikat
547	sertifikat
546	sertifikat
539	sertifikat
538	sertifikat
537	sertifikat
529	sertifikat
528	sertifikat
527	sertifikat
523	sertifikat
521	sertifikat
511	sertifikat
509	sertifikat
507	sertifikat
506	sertifikat
503	sertifikat
496	sertifikat
491	sertifikat
487	sertifikat
485	sertifikat
484	sertifikat
469	sertifikat
468	sertifikat
462	sertifikat
460	sertifikat
458	sertifikat
444	sertifikat
423	sertifikat
420	sertifikat
419	sertifikat
418	sertifikat
416	sertifikat
403	sertifikat
402	sertifikat
400	sertifikat
399	sertifikat
398	sertifikat
397	sertifikat
395	sertifikat
394	sertifikat
391	sertifikat
388	sertifikat
383	sertifikat
376	sertifikat
373	sertifikat
369	sertifikat
368	sertifikat
366	sertifikat
365	sertifikat
363	sertifikat
354	sertifikat
353	sertifikat
347	sertifikat
336	sertifikat
332	sertifikat
317	sertifikat
316	sertifikat
314	sertifikat
308	sertifikat
297	sertifikat
293	sertifikat
291	sertifikat
279	sertifikat
278	sertifikat
271	sertifikat
267	sertifikat
259	sertifikat
254	sertifikat
243	sertifikat
238	sertifikat
232	sertifikat
231	sertifikat
228	sertifikat
227	sertifikat
226	sertifikat
224	sertifikat
223	sertifikat
218	sertifikat
216	sertifikat
215	sertifikat
213	sertifikat
212	sertifikat
208	sertifikat
207	sertifikat
205	sertifikat
204	sertifikat
201	sertifikat
186	sertifikat
185	sertifikat
184	sertifikat
180	sertifikat
178	sertifikat
176	sertifikat
174	sertifikat
171	sertifikat
169	sertifikat
162	sertifikat
161	sertifikat
160	sertifikat
159	sertifikat
156	sertifikat
155	sertifikat
140	sertifikat
133	sertifikat
123	sertifikat
117	sertifikat
109	sertifikat
108	sertifikat
107	sertifikat
105	sertifikat
103	sertifikat
98	sertifikat
96	sertifikat
93	sertifikat
86	sertifikat
84	sertifikat
79	sertifikat
72	sertifikat
70	sertifikat
68	sertifikat
61	sertifikat
60	sertifikat
59	sertifikat
57	sertifikat
56	sertifikat
49	sertifikat
47	sertifikat
46	sertifikat
44	sertifikat
41	sertifikat
38	sertifikat
29	sertifikat
21	sertifikat
14	sertifikat
11	sertifikat
9	sertifikat
5	sertifikat
3928	trofi
3573	trofi
3398	trofi
2578	trofi
2564	trofi
2418	trofi
2133	trofi
1982	trofi
1973	trofi
1943	trofi
1941	trofi
1882	trofi
1860	trofi
1851	trofi
1836	trofi
1765	trofi
1724	trofi
1723	trofi
1699	trofi
1677	trofi
1574	trofi
1493	trofi
1238	trofi
1048	trofi
1039	trofi
1033	trofi
608	trofi
418	trofi
382	trofi
123	trofi
5	trofi
4201	workshop
4192	workshop
4203	workshop
4164	workshop
4148	workshop
4111	workshop
4093	workshop
4065	workshop
4060	workshop
4053	workshop
4039	workshop
4007	workshop
4001	workshop
3982	workshop
3974	workshop
3958	workshop
3937	workshop
3933	workshop
3910	workshop
3897	workshop
3875	workshop
3867	workshop
3864	workshop
3849	workshop
3838	workshop
3831	workshop
3813	workshop
3773	workshop
3770	workshop
3760	workshop
3758	workshop
3753	workshop
3742	workshop
3728	workshop
3723	workshop
3678	workshop
3674	workshop
3643	workshop
3626	workshop
3625	workshop
3580	workshop
3559	workshop
3543	workshop
3526	workshop
3517	workshop
3498	workshop
3481	workshop
3475	workshop
3437	workshop
3418	workshop
3379	workshop
3378	workshop
3368	workshop
3363	workshop
3352	workshop
3328	workshop
3326	workshop
3277	workshop
3273	workshop
3266	workshop
3244	workshop
3198	workshop
3121	workshop
3113	workshop
3111	workshop
3108	workshop
3095	workshop
3078	workshop
3068	workshop
3056	workshop
3034	workshop
3019	workshop
3013	workshop
3006	workshop
2980	workshop
2974	workshop
2918	workshop
2915	workshop
2900	workshop
2870	workshop
2864	workshop
2848	workshop
2692	workshop
2686	workshop
2684	workshop
2664	workshop
2661	workshop
2634	workshop
2564	workshop
2543	workshop
2537	workshop
2510	workshop
2495	workshop
2486	workshop
2477	workshop
2470	workshop
2464	workshop
2281	workshop
2232	workshop
2186	workshop
2162	workshop
2154	workshop
2153	workshop
2140	workshop
2137	workshop
2126	workshop
2123	workshop
2119	workshop
2076	workshop
2033	workshop
2000	workshop
1999	workshop
1986	workshop
1985	workshop
1984	workshop
1969	workshop
1968	workshop
1967	workshop
1929	workshop
1921	workshop
1888	workshop
1862	workshop
1857	workshop
1849	workshop
1805	workshop
1801	workshop
1777	workshop
1702	workshop
1684	workshop
1681	workshop
1612	workshop
1574	workshop
1561	workshop
1551	workshop
1537	workshop
1534	workshop
1532	workshop
1502	workshop
1500	workshop
1475	workshop
1441	workshop
1434	workshop
1426	workshop
1421	workshop
1420	workshop
1399	workshop
1388	workshop
1358	workshop
1328	workshop
1318	workshop
1309	workshop
1308	workshop
1305	workshop
1300	workshop
1290	workshop
1289	workshop
1284	workshop
1283	workshop
1282	workshop
1259	workshop
1214	workshop
1197	workshop
1114	workshop
1086	workshop
1074	workshop
1058	workshop
1050	workshop
1046	workshop
1024	workshop
989	workshop
988	workshop
976	workshop
967	workshop
948	workshop
932	workshop
902	workshop
899	workshop
876	workshop
872	workshop
842	workshop
822	workshop
819	workshop
808	workshop
802	workshop
749	workshop
742	workshop
724	workshop
717	workshop
709	workshop
679	workshop
675	workshop
674	workshop
667	workshop
632	workshop
615	workshop
614	workshop
558	workshop
520	workshop
513	workshop
505	workshop
487	workshop
485	workshop
475	workshop
472	workshop
429	workshop
428	workshop
387	workshop
367	workshop
361	workshop
342	workshop
326	workshop
308	workshop
307	workshop
304	workshop
292	workshop
252	workshop
243	workshop
235	workshop
228	workshop
227	workshop
226	workshop
205	workshop
201	workshop
177	workshop
142	workshop
106	workshop
74	workshop
67	workshop
65	workshop
25	workshop
\.


--
-- Data for Name: tiket; Type: TABLE DATA; Schema: public; Owner: marchelinefannihp
--

COPY public.tiket (id_event, id_tiket, jenis_tiket, harga_tiket) FROM stdin;
4421	442101	Tour Karanganyar 	750000
4454	445401	Fun Walk 90's STIE Totalwin	25000
4444	444401	OPICK & KYAI TAPEL GAMELAN	250000
4284	428401	Semnas EXCESS 2022	50000
4283	428301	Special Price Only (1 Orang)	275000
4283	428302	Paket Combo (2 orang)	500000
4283	428303	Kategori Umum (1 Orang)	375000
4283	428304	Paket Combo Umum (2 Orang)	725000
4200	420001	GELOMBANG II	20000
4199	419901	INVESTMENT SUMMIT PROJECT 2022 : INVESTMENT RESEARCH COMPETITION	75000
4198	419801	WEBINAR NASIONAL INSPECT 2022 “Pemulihan Ekonomi Pasca Pandemi: Sebagai Upaya Menarik Milenial untuk	15000
4191	419101	GANESION 2022	25000
4181	418101	PRESALE 1 (1 Jan - 25 Jan)	25000
4181	418102	PRESALE 2 (26 Jan - 5 Feb)	35000
4166	416601	Offline	55000
4166	416602	Streaming	25000
4161	416101	SMECOMP 2022	35000
4185	418501	HTM Beauty Class and Fashion Show with Wardah	100000
4173	417301	TOEFL Akbar Online	70000
4170	417001	Webinar INCREASE 3.0 (Innovative and Creation of Psychopreneur in Society)	35000
4170	417002	Webinar INCREASE 3.0 (Innovative and Creation of Psychopreneur in Society) for 2 pax	65000
4167	416701	SMC Online Lampung	50000
4164	416401	FOCUS : Finance On Discuss	30000
4159	415901	[LEOIWID 2022] Pre-sale 3	40000
4159	415902	[LEOIWID 2022] OTS	50000
4142	414201	Seminar;Trainerpreneur	125000
4103	410301	✨Webinar Personal Branding Your Future Created By You ✨	10000
4084	408401	 SEMINAR NASIONAL & CALL FOR PAPER BEM-FT 2021	100000
4066	406601	Upgrade Your Personality	90000
4041	404101	Paket 1	10000
4041	404102	Paket 2	25000
4041	404103	Paket 3	35000
4031	403101	Speaking For Communication	500000
4030	403001	IELTS WRITING PREPARATION	500000
4030	403002	IELTS SPEAKING PREPARATION	500000
4029	402901	TOEFL ITP COMPLATE SKILLS	250000
4025	402501	Early Bird	15000
4025	402502	Normal	20000
3249	324901	Dalgona + Pisgor	25000
3249	324902	Dalgona + French fries	25000
3249	324903	Ice lemon tea + Pisgor	25000
3249	324904	Thai Tea + French Fries	25000
3249	324905	VIP - Paket 1	75000
3249	324906	VIP - Paket 2	75000
3249	324907	VIP - Paket 3	75000
3249	324908	Reguler - Paket 1	40000
3249	324909	Reguler - Paket 2	40000
3249	3249010	Reguler - Paket 3	40000
3081	308101	Presale 1Regular	40000
3081	308102	Presale 1 Premium	50000
3081	308103	Presale 2 Regular	45000
3081	308104	Presale 2 Premium	60000
3014	301401	Early Bird 1 Nasional	100000
3014	301402	Early Bird 2 Nasional	125000
3014	301403	Normal Nasional	150000
3014	301404	Internasional	200000
2992	299201	Presale 2 Gebyar Kharisma XIX UKM Musik UBHARA	30000
2821	282101	PsyTalk 2019	80000
2721	272101	Presale 1	35000
2520	252001	Presale 1	45000
2027	202701	Presale 1 Festival	25000
2027	202702	Presale 1 VIP	40000
2027	202703	Presale 2 Festival	30000
1933	193301	Presale 2	50000
1071	107101	Presale 1	45000
1071	107102	Presale 2	55000
1071	107103	Presale 3	60000
\.


--
-- Name: profil check_no_telp; Type: CHECK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE public.profil
    ADD CONSTRAINT check_no_telp CHECK ((length((no_telp)::text) > 9)) NOT VALID;


--
-- Name: pengguna email_pengguna_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT email_pengguna_unik UNIQUE (email);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id_event);


--
-- Name: event id_event_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT id_event_unik UNIQUE (id_event);


--
-- Name: kota id_kota_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.kota
    ADD CONSTRAINT id_kota_unik UNIQUE (id_kota);


--
-- Name: pembelian id_order_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT id_order_unik PRIMARY KEY (id_order);


--
-- Name: pengguna id_pengguna_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT id_pengguna_unik UNIQUE (id_pengguna);


--
-- Name: profil id_profil_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT id_profil_unik UNIQUE (id_profil);


--
-- Name: tiket id_tiket_unik; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT id_tiket_unik UNIQUE (id_tiket);


--
-- Name: kota kota_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.kota
    ADD CONSTRAINT kota_pkey PRIMARY KEY (id_kota);


--
-- Name: pengguna pengguna_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (id_pengguna);


--
-- Name: profil profil_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT profil_pkey PRIMARY KEY (id_profil);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id_event, tag);


--
-- Name: tiket tiket_pkey; Type: CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pkey PRIMARY KEY (id_event, id_tiket);


--
-- Name: event fk_event_kota; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT fk_event_kota FOREIGN KEY (id_kota) REFERENCES public.kota(id_kota) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event fk_event_profil; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT fk_event_profil FOREIGN KEY (id_profil) REFERENCES public.profil(id_profil) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pembelian fk_order_profil; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT fk_order_profil FOREIGN KEY (id_profil) REFERENCES public.profil(id_profil) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pembelian fk_order_tiket; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.pembelian
    ADD CONSTRAINT fk_order_tiket FOREIGN KEY (id_tiket) REFERENCES public.tiket(id_tiket) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profil fk_profil_pengguna; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT fk_profil_pengguna FOREIGN KEY (id_pengguna) REFERENCES public.pengguna(id_pengguna) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: tag fk_tag_event; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT fk_tag_event FOREIGN KEY (id_event) REFERENCES public.event(id_event) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: tiket fk_tiket_event; Type: FK CONSTRAINT; Schema: public; Owner: marchelinefannihp
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT fk_tiket_event FOREIGN KEY (id_event) REFERENCES public.event(id_event) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

