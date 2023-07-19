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
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_name text,
    city_id integer NOT NULL,
    country_id integer
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- Name: coach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach (
    coach_id text NOT NULL,
    coach_name text,
    date_of_birth date,
    role text,
    nationality integer
);


ALTER TABLE public.coach OWNER TO postgres;

--
-- Name: confederation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confederation (
    confederation_name text,
    confederation_id integer NOT NULL
);


ALTER TABLE public.confederation OWNER TO postgres;

--
-- Name: confederation_confederation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.confederation_confederation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confederation_confederation_id_seq OWNER TO postgres;

--
-- Name: confederation_confederation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.confederation_confederation_id_seq OWNED BY public.confederation.confederation_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_name text,
    country_id integer NOT NULL,
    confederation_id integer
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match (
    day date,
    court text,
    player_1 text NOT NULL,
    player_2 text NOT NULL,
    player_1_score integer,
    player_2_score integer,
    duration integer,
    winner text,
    tournament_id integer NOT NULL,
    player_1_id text,
    umpire_id text
);


ALTER TABLE public.match OWNER TO postgres;

--
-- Name: organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization (
    organization_name text,
    organization_id integer NOT NULL
);


ALTER TABLE public.organization OWNER TO postgres;

--
-- Name: organization_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organization_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_organization_id_seq OWNER TO postgres;

--
-- Name: organization_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organization_organization_id_seq OWNED BY public.organization.organization_id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    member_id text NOT NULL,
    player_name text,
    date_of_birth date,
    nationality integer,
    confederation_id integer,
    coach_id text
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: player_performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_performance (
    member_id text NOT NULL,
    tournaments integer,
    total_match integer,
    win integer NOT NULL,
    lose integer NOT NULL
);


ALTER TABLE public.player_performance OWNER TO postgres;

--
-- Name: player_prize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_prize (
    member_id text NOT NULL,
    year_prize double precision,
    total_prize double precision NOT NULL
);


ALTER TABLE public.player_prize OWNER TO postgres;

--
-- Name: player_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_rank (
    member_id text NOT NULL,
    rank integer NOT NULL,
    points integer
);


ALTER TABLE public.player_rank OWNER TO postgres;

--
-- Name: tournament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament (
    tournament_name text,
    venue text,
    start_date date,
    end_date date,
    series text,
    match_count integer,
    tournament_id integer NOT NULL,
    organization_id integer,
    city_id integer,
    country_id integer
);


ALTER TABLE public.tournament OWNER TO postgres;

--
-- Name: tournament_tournament_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tournament_tournament_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tournament_tournament_id_seq OWNER TO postgres;

--
-- Name: tournament_tournament_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tournament_tournament_id_seq OWNED BY public.tournament.tournament_id;


--
-- Name: umpire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.umpire (
    umpire_id text NOT NULL,
    umpire_name text,
    date_of_birth date,
    nationality integer
);


ALTER TABLE public.umpire OWNER TO postgres;

--
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- Name: confederation confederation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confederation ALTER COLUMN confederation_id SET DEFAULT nextval('public.confederation_confederation_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: organization organization_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization ALTER COLUMN organization_id SET DEFAULT nextval('public.organization_organization_id_seq'::regclass);


--
-- Name: tournament tournament_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament ALTER COLUMN tournament_id SET DEFAULT nextval('public.tournament_tournament_id_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_name, city_id, country_id) FROM stdin;
Phnom Penh	46	126
Saipan	55	127
Hillerød	58	1
Jakarta	4	2
Osaka	29	3
Nakhon Ratchasima	16	4
Bangkok	8	4
Hangzhou	66	5
Ruichang	20	5
Singapore	56	6
Taipei	68	7
New Delhi	3	8
Kuala Lumpur	1	10
REZE	65	11
Saint Louis	45	11
Aire sur la Lys	37	11
Voiron	33	11
Orleans	32	11
Rishon Le Zion	31	14
Wateringen	35	15
Haarlem	15	15
Český Krumlov	30	17
Guatemala	63	18
El Campello	62	20
Madrid	28	20
Oviedo	23	20
Benalmádena	9	20
Edegem	34	23
Bergisch Gladbach	59	24
Bonn	52	24
Berlin	19	24
Mulheim	17	24
Uppsala	6	25
Caldas da Rainha	18	27
Bolzano	41	28
Milano	14	28
Ha Noi	26	30
Shymkent	51	31
Graz	50	34
Dornbirn	44	34
Basel	25	35
Birmingham	22	41
Guadalajara	42	42
Pazardzhik	70	44
Svilengrad	61	44
Auckland	11	46
Kingston	40	48
Pécs	10	49
Lima	64	50
Kampala	13	54
Białystok	49	55
Tarnów	27	55
16-400	24	55
Male	54	56
Johannesburg	12	57
Maribor	47	62
Tallinn	2	63
Ulaanbaatar	67	64
Opatija	48	66
Santo Domingo	57	68
Dubai	39	71
Luxembourg	43	74
Tehran	7	78
Santiago	53	84
Panevėžys	60	86
La Habana	21	91
Novi Sad	69	93
Nicosia	38	98
Reykjavik	5	116
Liepāja	36	120
\.


--
-- Data for Name: coach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach (coach_id, coach_name, date_of_birth, role, nationality) FROM stdin;
\.


--
-- Data for Name: confederation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confederation (confederation_name, confederation_id) FROM stdin;
Europe	1
Asia	2
Pan America	3
Africa	4
Oceania	5
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_name, country_id, confederation_id) FROM stdin;
Cambodia	126	2
Northern Mariana Islands	127	5
Denmark	1	1
Indonesia	2	2
Japan	3	2
Thailand	4	2
China	5	2
Singapore	6	2
Chinese Taipei	7	2
India	8	2
Hong Kong China	9	2
Malaysia	10	2
France	11	1
Canada	12	3
Ireland	13	1
Israel	14	1
Netherlands	15	1
Korea	16	2
Czech Republic	17	1
Guatemala	18	3
Finland	19	1
Spain	20	1
El Salvador	21	3
Brazil	22	3
Belgium	23	1
Germany	24	1
Sweden	25	1
Azerbaijan	26	1
Portugal	27	1
Italy	28	1
Jordan	29	2
Vietnam	30	2
Kazakhstan	31	2
U.S.A.	32	3
Ukraine	33	1
Austria	34	1
Switzerland	35	1
Mauritius	36	4
Australia	37	5
Nigeria	38	4
Sri Lanka	39	2
Slovakia	40	1
England	41	1
Mexico	42	3
Egypt	43	4
Bulgaria	44	1
Norway	45	1
New Zealand	46	5
Algeria	47	4
Jamaica	48	3
Hungary	49	1
Peru	50	3
Myanmar	51	2
Malta	52	1
Bahrain	53	2
Uganda	54	4
Poland	55	1
Maldives	56	2
South Africa	57	4
Zambia	58	4
Philippines	59	2
Tahiti	60	5
Argentina	61	3
Slovenia	62	1
Estonia	63	1
Mongolia	64	2
Paraguay	65	3
Croatia	66	1
Nepal	67	2
Dominican Republic	68	3
Türkiye	69	1
Zimbabwe	70	4
UNITED ARAB EMIRATES	71	2
Ecuador	72	3
Ligue Nouvelle Badminton REUNION	73	4
Luxembourg	74	1
Trinidad & Tobago	75	3
East Timor	76	2
Brunei Darussalam	77	2
Iran	78	2
Cameroon	79	4
Scotland	80	1
Syrian Arab Republic	81	2
NORTHERN MARIANAS	82	5
Romania	83	1
Chile	84	3
SAUDI ARABIA	85	2
Lithuania	86	1
Macau China	87	2
Barbados	88	3
Mozambique	89	4
Guam National Badminton Federation	90	5
Cuba	91	3
Venezuela	92	3
Serbia	93	1
Costa Rica	94	3
Iraq	95	2
Colombia	96	3
Suriname	97	3
Cyprus	98	1
Guyana	99	3
BUR Burkina Faso	100	4
Botswana	101	4
Benin	102	4
Uzbekistan	103	2
Moldova	104	1
CENTRAL AFRICAN Republic	105	4
Losotho	106	4
New Caledonia	107	5
Tonga	108	5
COOK ISLANDS	109	5
Fiji	110	5
Seychelles	111	4
Madagascar	112	4
Wales	113	1
EQUATORIAL GUINEA	114	4
Bangladesh	115	2
Iceland	116	1
Greece	117	1
Favorite	118	4
Lao	119	2
Latvia	120	1
NIGER Fédération Nigerienne de Badminton	121	4
Congo	122	4
Macedonia	123	1
Faroe Islands	124	1
\.


--
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match (day, court, player_1, player_2, player_1_score, player_2_score, duration, winner, tournament_id, player_1_id, umpire_id) FROM stdin;
\N	-	Anuoluwapo Juwon OPEYORI	Robert SUMMERS	2	0	35	Anuoluwapo Juwon OPEYORI	14	79662	\N
\N	-	Lee Tao Ong	Munkh-Od Lkhagvasuren	2	0	18	Lee Tao Ong	76	\N	\N
2023-01-10	Axiata Arena - Court 4	Anders Antonsen	Weng Hong Yang	2	1	75	Anders Antonsen	1	91554	\N
2023-01-10	Axiata Arena - Court 1	Anthony Sinisuka Ginting	Ng Ka Long Angus	2	1	65	Anthony Sinisuka Ginting	1	95661	\N
2023-01-12	Axiata Arena - Court 2	Anthony Sinisuka Ginting	Anders Antonsen	2	1	72	Anthony Sinisuka Ginting	1	95661	\N
2023-07-02	National Sport Complex - 1	Chan Yin Chak	Daniil Dubovenko	2	0	33	Chan Yin Chak	82	57924	\N
2023-07-01	National Sport Complex - 1	Chan Yin Chak	Huang Yu	2	1	53	Chan Yin Chak	82	57924	\N
2023-06-30	National Sport Complex - 3	Chan Yin Chak	Koshiro Moriguchi	2	0	27	Chan Yin Chak	82	57924	\N
2023-01-11	Axiata Arena - Court 2	Chico Aura Dwi Wardoyo	Hans-Kristian Solberg Vittinghus	2	1	65	Chico Aura Dwi Wardoyo	1	71408	\N
2023-01-10	Axiata Arena - Court 1	Chou Tien Chen	Shi Yu Qi	2	1	79	Chou Tien Chen	1	34810	\N
2023-06-30	National Sport Complex - 3	Daniil Dubovenko	Yang Yang	2	1	52	Daniil Dubovenko	82	94119	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Ruben Carreras	Edvard Petre Olsson	2	0	25	Ruben Carreras	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Tsvetan Ivanov	Erik Blomberg	2	0	35	Tsvetan Ivanov	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Pepe Fernandez	Cesar Rodrigues	2	0	22	Pepe Fernandez	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Gaspard Leriche	Raul Bergua	2	1	65	Gaspard Leriche	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Herbert Blairdimir	Harry Vaihinger	2	1	51	Herbert Blairdimir	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Rokas Lesinskas	Ludvig Edholm	2	0	39	Rokas Lesinskas	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Mitchell Purnomo	Yegor Romaniuk	2	1	41	Mitchell Purnomo	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Adam Medin	Bohdan Poliakov	2	0	19	Adam Medin	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Rafe Kenji Braach	Domas Paksys	2	1	42	Rafe Kenji Braach	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Viktor Chen	Quinn Jens	2	0	21	Viktor Chen	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Kaspar Sorge	Liam Birahij	2	1	44	Kaspar Sorge	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Fedir Tiurin	Michel Schuster	2	0	18	Fedir Tiurin	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Edward Davey	Roel Pipeleers	2	0	23	Edward Davey	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Lenny Bonniere	Jaxon Clarke	2	0	27	Lenny Bonniere	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Orphé Queton-Bouissou	Martin Pho	2	0	23	Orphé Queton-Bouissou	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Gonzalo Isabal	Tymofii Kadiemin	2	0	31	Gonzalo Isabal	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Priit Põder	Mats Wohlers	2	0	24	Priit Põder	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Marti Joost	Toms Sala	2	0	30	Marti Joost	6	\N	\N
2023-01-27	-	Oskar Laanes	Carl Rosenlund (Walkover)	0	0	0	Oskar Laanes	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Linus Emmerich	Rasmus Roogsoo	2	0	31	Linus Emmerich	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Pranav Erukattil	Dion Hijdra	2	0	21	Pranav Erukattil	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Leon Kaschura	Thomas Mabbe	2	0	23	Leon Kaschura	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Philip Quan	Gino Monopoli	2	1	40	Philip Quan	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Danil Sedov	Patrik Dimitrov	2	0	36	Danil Sedov	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Mario Rodriguez	Nojus Tenikaitis	2	0	27	Mario Rodriguez	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Daniel Huang	Alejandro Bejar	2	0	31	Daniel Huang	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Mady Sow	Valerian Eckert	2	0	31	Mady Sow	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Sonish Hathi	Alexander Philipp Zhang	2	0	37	Sonish Hathi	6	\N	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Alejandro Gallego	Viktor Patteet	2	0	31	Alejandro Gallego	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Rafe Kenji Braach	Herbert Blairdimir	2	0	31	Rafe Kenji Braach	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Mitchell Purnomo	Philip Quan	2	0	26	Mitchell Purnomo	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Danil Sedov	Mario Rodriguez	2	0	34	Danil Sedov	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Viktor Chen	Edward Davey	2	1	36	Viktor Chen	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 4	Orphé Queton-Bouissou	Tsvetan Ivanov	2	1	60	Orphé Queton-Bouissou	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Marti Joost	Kaspar Sorge	2	0	24	Marti Joost	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Gonzalo Isabal	Oskar Laanes	2	0	22	Gonzalo Isabal	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Gaspard Leriche	Adam Medin	2	1	47	Gaspard Leriche	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Lenny Bonniere	Linus Emmerich	2	0	32	Lenny Bonniere	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Fedir Tiurin	Pranav Erukattil	2	0	14	Fedir Tiurin	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Priit Põder	Rokas Lesinskas	2	1	45	Priit Põder	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Daniel Huang	Mady Sow	2	0	31	Daniel Huang	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 4	Sonish Hathi	Alejandro Gallego	2	0	30	Sonish Hathi	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 4	Orphé Queton-Bouissou	Gonzalo Isabal	2	1	50	Orphé Queton-Bouissou	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Rafe Kenji Braach	Gaspard Leriche	2	1	44	Rafe Kenji Braach	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Fedir Tiurin	Lenny Bonniere	2	0	26	Fedir Tiurin	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Danil Sedov	Mitchell Purnomo	2	0	22	Danil Sedov	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Sonish Hathi	Daniel Huang	2	0	35	Sonish Hathi	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 4	Fedir Tiurin	Vladyslav Kunin	2	0	24	Fedir Tiurin	6	\N	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Sonish Hathi	Danil Sedov	2	1	54	Sonish Hathi	6	\N	\N
2023-01-29	Upplands Boservice Arena/Fyrisfjädern - Court 5	Sonish Hathi	Fedir Tiurin	2	1	41	Sonish Hathi	6	\N	\N
2023-01-27	Fyrishov - Court 4	Gaspard Delabrosse	Victor Morskogen	2	1	41	Gaspard Delabrosse	7	\N	\N
2023-01-27	Fyrishov - Court 5	Christoffer Boman	Martin Mosquera	2	0	20	Christoffer Boman	7	\N	\N
2023-01-27	Fyrishov - Court 1	Elof Åberg	Eric Teller	2	0	32	Elof Åberg	7	\N	\N
2023-01-27	-	Sven Bosund	Guillermo Nuviala (Walkover)	0	0	0	Sven Bosund	7	\N	\N
2023-01-27	Fyrishov - Court 5	Nicolas Fouquet	Albert Muhrer	2	0	29	Nicolas Fouquet	7	\N	\N
2023-01-27	-	David Purnomo	Ebbe Mill (Walkover)	0	0	0	David Purnomo	7	\N	\N
2023-01-27	Fyrishov - Court 3	Andre Martin Reins	David Lundström	2	1	48	Andre Martin Reins	7	\N	\N
2023-01-27	Fyrishov - Court 2	Jofre Comella	Sebastian Lätth	2	0	30	Jofre Comella	7	\N	\N
2023-01-27	Fyrishov - Court 4	Andy Lojander	Eric Gomez	2	0	23	Andy Lojander	7	\N	\N
2023-01-27	-	Rasmus Talts	Romeo Makboul (Walkover)	0	0	0	Rasmus Talts	7	\N	\N
2023-01-27	Fyrishov - Court 5	Filip Swahn	Pau Gomez	2	0	24	Filip Swahn	7	\N	\N
2023-01-27	Fyrishov - Court 2	Bruno Steffen-Sanchez	Joackim Hagström	2	1	47	Bruno Steffen-Sanchez	7	\N	\N
2023-01-27	Fyrishov - Court 4	Anthony Gourdon	Leon Fritz	2	1	61	Anthony Gourdon	7	\N	\N
2023-01-27	Fyrishov - Court 3	Yuri Cho	Marcus Friman	2	0	23	Yuri Cho	7	\N	\N
2023-01-27	Fyrishov - Court 1	Martin Bellot	Aditya Patil	2	1	45	Martin Bellot	7	\N	\N
2023-01-27	Fyrishov - Court 5	Oliver Oldorff	Daniel Ström	2	1	46	Oliver Oldorff	7	\N	\N
2023-01-27	Fyrishov - Court 3	Neo Åstrand	Siim Saarse	2	0	35	Neo Åstrand	7	\N	\N
2023-01-27	Fyrishov - Court 1	Filip Swahn	Rasmus Talts	2	0	24	Filip Swahn	7	\N	\N
2023-01-27	Fyrishov - Court 2	Luca Wiechmann	Anthony Gourdon	2	0	32	Luca Wiechmann	7	\N	\N
2023-01-27	Fyrishov - Court 4	Hugo Themas	David Purnomo	2	1	46	Hugo Themas	7	\N	\N
2023-01-27	-	Martin Bellot	Kjell Wagener (Walkover)	0	0	0	Martin Bellot	7	\N	\N
2023-01-27	Fyrishov - Court 5	Oliver Oldorff	Neo Åstrand	2	0	36	Oliver Oldorff	7	\N	\N
2023-01-27	-	Elof Åberg	Julian Strack (Walkover)	0	0	0	Elof Åberg	7	\N	\N
2023-01-27	Fyrishov - Court 4	Andy Lojander	Matteo Bjurman	2	0	29	Andy Lojander	7	\N	\N
2023-01-27	Fyrishov - Court 4	Andrei Schmidt	Gaspard Delabrosse	2	1	47	Andrei Schmidt	7	\N	\N
2023-01-27	-	Christoffer Boman	Kevin Baum (Walkover)	0	0	0	Christoffer Boman	7	\N	\N
2023-01-27	Fyrishov - Court 1	Nicolas Fouquet	Tregert Gustav Värv	2	0	22	Nicolas Fouquet	7	\N	\N
2023-01-27	Fyrishov - Court 5	Jofre Comella	Yuri Cho	2	0	36	Jofre Comella	7	\N	\N
2023-01-28	Fyrishov - Court 2	Oliver Oldorff	Martin Bellot	2	1	49	Oliver Oldorff	7	\N	\N
2023-01-28	Fyrishov - Court 3	Filip Swahn	Elof Åberg	2	1	50	Filip Swahn	7	\N	\N
2023-01-28	Fyrishov - Court 5	Luca Wiechmann	Swann Hardi	2	1	57	Luca Wiechmann	7	\N	\N
2023-01-28	Fyrishov - Court 1	Hugo Themas	Andy Lojander	2	1	37	Hugo Themas	7	\N	\N
2023-01-28	Fyrishov - Court 1	Andrei Schmidt	Chris Robin Talts	2	0	26	Andrei Schmidt	7	\N	\N
2023-01-28	Fyrishov - Court 3	Christoffer Boman	Jofre Comella	2	1	57	Christoffer Boman	7	\N	\N
2023-01-28	Fyrishov - Court 1	Christoffer Boman	Oliver Oldorff	2	0	26	Christoffer Boman	7	\N	\N
2023-01-28	Fyrishov - Court 4	Luca Wiechmann	Filip Swahn	2	0	30	Luca Wiechmann	7	\N	\N
2023-02-01	Afrasiabi Hall - court 3	Alwi Farhan	Yousif Alhumairi	2	0	22	Alwi Farhan	8	58089	\N
2023-02-01	Afrasiabi Hall - court 3	Syabda Perkasa Belawa	Nima Rostampourlagaldani	2	0	34	Syabda Perkasa Belawa	8	\N	\N
2023-02-01	Afrasiabi Hall - court 2	Sulistio Tegar	Alap Mishra	2	0	36	Sulistio Tegar	8	\N	\N
2023-02-02	Afrasiabi Hall - court 3	Syabda Perkasa Belawa	Pranav Rao Gandham	2	0	36	Syabda Perkasa Belawa	8	\N	\N
2023-02-03	Afrasiabi Hall - court 2	Syabda Perkasa Belawa	Bernardo Atilano	2	0	37	Syabda Perkasa Belawa	8	\N	\N
2023-02-03	Afrasiabi Hall - court 2	Syabda Perkasa Belawa	Chirag Sen	2	0	34	Syabda Perkasa Belawa	8	\N	\N
2023-02-04	Afrasiabi Hall - court 2	Syabda Perkasa Belawa	Iqbal Diaz Syahputra	2	0	30	Syabda Perkasa Belawa	8	\N	\N
2023-02-05	Afrasiabi Hall - court 1	Syabda Perkasa Belawa	Justin Hoh	2	1	69	Syabda Perkasa Belawa	8	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Tim Schmitz	Sam Reinert	2	0	24	Tim Schmitz	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Alejandro Gallego	Aldrin Nelson	2	1	54	Alejandro Gallego	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 4	Leon Kaschura	Juan Daza Arteche	2	0	18	Leon Kaschura	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Shangxi Olivier Song	Pablo Alfaya	2	1	51	Shangxi Olivier Song	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Felix Ekstrand	Alejandro Valdés	2	0	22	Felix Ekstrand	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Arnaud Boschung	Joxe Zuazola	2	0	21	Arnaud Boschung	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 4	Timeo Ternon	Fynn Ohliger	2	0	30	Timeo Ternon	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Linus Emmerich	Francisco Daniel	2	0	28	Linus Emmerich	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Nojus Tenikaitis	Yago Garcia	2	0	27	Nojus Tenikaitis	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Marek Čepela	Yulien Gil	2	0	24	Marek Čepela	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Alexandre Bernardo	Ole Schroth	2	0	21	Alexandre Bernardo	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Kryštof Coufal	Arthur Miauton	2	1	45	Kryštof Coufal	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Jonas Schmid	Oliver Fonseca	2	0	20	Jonas Schmid	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Elie Burgot	Hugo Campos	2	0	25	Elie Burgot	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Rafe Kenji Braach	Lukáš Thor	2	1	45	Rafe Kenji Braach	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Hugo Chanthakesone	Iñigo Achotegui	2	0	21	Hugo Chanthakesone	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 4	Zhi Lun Ong	Ismael Oballe	2	0	27	Zhi Lun Ong	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Adrian Rodriguez	Fionn Dowling	2	0	30	Adrian Rodriguez	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Adam Srnec	Iker Rodrguez	2	1	43	Adam Srnec	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 3	Filip Titěra	Alejandro Bejar	2	0	22	Filip Titěra	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Ruben Fellin	Omar Tariq	2	0	30	Ruben Fellin	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Rokas Lesinskas	Lev Antamonov	2	0	33	Rokas Lesinskas	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 4	Alexander Philipp Zhang	Pepe Fernandez	2	0	21	Alexander Philipp Zhang	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Yaidel Gil	Nicolas Briancourt	2	0	28	Yaidel Gil	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Petr Bříza	Mateo Rey	2	1	43	Petr Bříza	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Gonzalo Isabal	Nolan Chanthakesone	2	0	31	Gonzalo Isabal	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Jakub Sidor	Luuk Vingerhoed	2	0	21	Jakub Sidor	10	\N	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Tiago Berenguer	Alejandro Yaycarov	2	1	44	Tiago Berenguer	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 5	Arnaud Boschung	Linus Emmerich	2	0	30	Arnaud Boschung	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 4	Alexandre Bernardo	Nojus Tenikaitis	2	0	31	Alexandre Bernardo	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Marek Čepela	Leon Kaschura	2	1	46	Marek Čepela	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Jonas Schmid	Kryštof Coufal	2	0	34	Jonas Schmid	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Rafe Kenji Braach	Elie Burgot	2	0	26	Rafe Kenji Braach	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 5	Zhi Lun Ong	Hugo Chanthakesone	2	0	36	Zhi Lun Ong	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Alejandro Gallego	Felix Ekstrand	2	1	38	Alejandro Gallego	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Adam Srnec	Adrian Rodriguez	2	1	34	Adam Srnec	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 4	Rokas Lesinskas	Ruben Fellin	2	1	45	Rokas Lesinskas	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 5	Yaidel Gil	Alexander Philipp Zhang	2	1	54	Yaidel Gil	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Gonzalo Isabal	Petr Bříza	2	0	25	Gonzalo Isabal	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Tiago Berenguer	Jakub Sidor	2	0	29	Tiago Berenguer	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Jonas Schmid	Alexandre Bernardo	2	0	25	Jonas Schmid	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Marek Čepela	Vladyslav Stepanchenko	2	1	49	Marek Čepela	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 5	Alejandro Gallego	Arnaud Boschung	2	1	45	Alejandro Gallego	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Rafe Kenji Braach	Zhi Lun Ong	2	0	30	Rafe Kenji Braach	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 4	Yaidel Gil	Rokas Lesinskas	2	0	24	Yaidel Gil	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Tiago Berenguer	Gonzalo Isabal	2	0	33	Tiago Berenguer	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Alejandro Gallego	Jonas Schmid	2	1	44	Alejandro Gallego	10	\N	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Tiago Berenguer	Yaidel Gil	2	0	30	Tiago Berenguer	10	\N	\N
2023-02-05	Polideportivo Arroyo de la Miel - 3	Tiago Berenguer	Vladyslav Kunin	2	0	25	Tiago Berenguer	10	\N	\N
2023-02-09	Badminton Center Pécs - 4	Samuel Nagy	Heorhii Antropov	2	1	33	Samuel Nagy	11	\N	\N
2023-02-09	Badminton Center Pécs - 1	Hrvoje Mavriček	Mate Kota	2	0	25	Hrvoje Mavriček	11	\N	\N
2023-02-09	-	Alvaro Moran	Ondřej Šolar (Walkover)	0	0	0	Alvaro Moran	11	\N	\N
2023-02-09	Badminton Center Pécs - 2	Thibault Gardon	Sharon Perelshtein	2	1	40	Thibault Gardon	11	\N	\N
2023-02-09	Badminton Center Pécs - 1	Matts Croes	Peter Palkovics	2	0	22	Matts Croes	11	\N	\N
2023-02-09	Badminton Center Pécs - 6	Paul Massias	Gergo Donaczi	2	0	23	Paul Massias	11	\N	\N
2023-02-09	Badminton Center Pécs - 3	Vid Koščak	Szilveszter Dravai	2	0	32	Vid Koščak	11	\N	\N
2023-02-09	Badminton Center Pécs - 4	Richard Pavlik	Marek Waliszewski	2	1	50	Richard Pavlik	11	\N	\N
2023-02-09	-	Lorenz Windauer	Ziga Podgoršek (Walkover)	0	0	0	Lorenz Windauer	11	\N	\N
2023-02-09	Badminton Center Pécs - 3	Sebastian Pinkowicz	Abel Balint Kiss	2	0	25	Sebastian Pinkowicz	11	\N	\N
2023-02-09	Badminton Center Pécs - 2	Iago Martinez	Luc Thalmann	2	0	25	Iago Martinez	11	\N	\N
2023-02-09	Badminton Center Pécs - 3	Dmytro Shcherbatiuk	Andrej Suchy	2	0	30	Dmytro Shcherbatiuk	11	\N	\N
2023-02-09	-	Martin Pintrava	Adam Burget (Walkover)	0	0	0	Martin Pintrava	11	\N	\N
2023-02-09	Badminton Center Pécs - 5	Jofre Comella	Vojtěch Matuš	2	0	28	Jofre Comella	11	\N	\N
2023-02-09	Badminton Center Pécs - 1	Raphael Maho	Zsombor Erdos	2	0	24	Raphael Maho	11	\N	\N
2023-02-09	Badminton Center Pécs - 6	Pascal Cheng	Balazs Peto	2	0	20	Pascal Cheng	11	\N	\N
2023-02-09	Badminton Center Pécs - 2	Tadej Jelenc	Mayan Mogilner	2	0	23	Tadej Jelenc	11	\N	\N
2023-02-09	Badminton Center Pécs - 3	Milan Mesterhazy	Patrik Fuciman	2	0	20	Milan Mesterhazy	11	\N	\N
2023-02-09	Badminton Center Pécs - 5	Balazs Csernyanszki	Maksymilian Krogulski	2	1	44	Balazs Csernyanszki	11	\N	\N
2023-02-09	Badminton Center Pécs - 1	Alejandro Lopez	Juraj Marek	2	0	26	Alejandro Lopez	11	\N	\N
2023-02-10	Badminton Center Pécs - 3	Richard Pavlik	Paul Massias	2	1	53	Richard Pavlik	11	\N	\N
2023-02-10	Badminton Center Pécs - 3	Jofre Comella	Raphael Maho	2	0	30	Jofre Comella	11	\N	\N
2023-02-10	Badminton Center Pécs - 2	Milan Mesterhazy	Balazs Csernyanszki	2	0	27	Milan Mesterhazy	11	\N	\N
2023-02-10	Badminton Center Pécs - 2	Matts Croes	Lorenz Windauer	2	0	25	Matts Croes	11	\N	\N
2023-02-10	Badminton Center Pécs - 3	Sebastian Pinkowicz	Csanad Horvath	2	0	28	Sebastian Pinkowicz	11	\N	\N
2023-02-10	Badminton Center Pécs - 4	Pascal Cheng	Tadej Jelenc	2	0	28	Pascal Cheng	11	\N	\N
2023-02-10	Badminton Center Pécs - 5	Richard Pavlik	Matts Croes	2	1	45	Richard Pavlik	11	\N	\N
2023-02-10	Badminton Center Pécs - 4	Sebastian Pinkowicz	Mark Koroša	2	1	58	Sebastian Pinkowicz	11	\N	\N
2023-02-10	Badminton Center Pécs - 6	Pascal Cheng	Jofre Comella	2	0	26	Pascal Cheng	11	\N	\N
2023-02-11	Badminton Center Pécs - 2	Pascal Cheng	Matthew Cheung	2	0	43	Pascal Cheng	11	\N	\N
2023-02-13	ABA - 1	Hoe Keat Oon	Praveen Tayalan	2	0	16	Hoe Keat Oon	12	\N	\N
2023-02-13	ABA - 5	Ken Goh	Richky Lim	2	0	42	Ken Goh	13	\N	\N
2023-02-13	ABA - 4	Forrest Huang	Ryan Soo-Jones	2	0	39	Forrest Huang	13	\N	\N
2023-02-13	ABA - 4	Tony Yu	Emanuela Mataio	2	0	23	Tony Yu	13	\N	\N
2023-02-13	ABA - 5	Samuel Navarra	Kaiyin Mataio	2	0	18	Samuel Navarra	13	\N	\N
2023-02-13	ABA - 6	Raphael Deloy	Hugo Kasimun Sargito	2	0	19	Raphael Deloy	13	\N	\N
2023-02-15	ABA - 3	Edward Lau	Oscar Guo	2	0	40	Edward Lau	12	99895	\N
2023-02-13	ABA - 4	Timothy Sentosa	Lezhi Zhu	2	0	22	Timothy Sentosa	13	\N	\N
2023-02-13	ABA - 6	Hugo Chou	Tahitoa Webb	2	0	15	Hugo Chou	13	\N	\N
2023-02-13	ABA - 5	Asher Jing Jie Ooi	Elias Maublanc	2	0	23	Asher Jing Jie Ooi	13	\N	\N
2023-02-13	ABA - 4	Frederick Zhao	Von Lee Ooi	2	0	20	Frederick Zhao	13	\N	\N
2023-02-13	ABA - 6	Preston Lee	Augustine Teraitua	2	0	20	Preston Lee	13	\N	\N
2023-02-13	ABA - 5	Ken Goh	Zarrian Heather-Rau	2	0	20	Ken Goh	13	\N	\N
2023-02-13	ABA - 4	Timothy Sentosa	Daniel Akavi	2	0	15	Timothy Sentosa	13	\N	\N
2023-02-13	ABA - 5	Tony Yu	Jaehyun Park	2	1	40	Tony Yu	13	\N	\N
2023-02-13	ABA - 4	Samuel Navarra	Dion Binod	2	0	20	Samuel Navarra	13	\N	\N
2023-02-13	ABA - 5	Daniel Hu	Ephraim Stephen Sam	2	1	55	Daniel Hu	13	\N	\N
2023-02-13	ABA - 4	Frederick Zhao	Isaac Chan	2	1	41	Frederick Zhao	13	\N	\N
2023-02-13	ABA - 5	Raphael Deloy	Eric Lu	2	0	68	Raphael Deloy	13	\N	\N
2023-02-13	ABA - 4	Asher Jing Jie Ooi	Ansen Bee	2	0	20	Asher Jing Jie Ooi	13	\N	\N
2023-02-14	ABA - 6	Frederick Zhao	Samuel Navarra	2	0	31	Frederick Zhao	13	\N	\N
2023-02-14	ABA - 4	Ken Goh	Jaden Mingoa	2	1	42	Ken Goh	13	\N	\N
2023-02-14	ABA - 6	Daniel Hu	Lucas Juillot	2	0	16	Daniel Hu	13	\N	\N
2023-02-15	ABA - 6	Daniel Hu	Shrey Dhand	2	1	54	Daniel Hu	13	\N	\N
2023-02-15	ABA - 4	Frederick Zhao	Emmanuel Stephen Sam	2	1	46	Frederick Zhao	13	\N	\N
2023-02-15	ABA - 4	Daniel Hu	Ken Goh	2	0	24	Daniel Hu	13	\N	\N
2023-02-24	PalaBadminton - 1	Loris Dietrich	Nathan Bouillot	2	0	27	Loris Dietrich	16	\N	\N
2023-02-24	PalaBadminton - 6	Ilija Nicolussi	Jonas Pfister	2	0	32	Ilija Nicolussi	16	\N	\N
2023-02-24	PalaBadminton - 4	Eric Teller	Noel Tappeiner	2	0	31	Eric Teller	16	\N	\N
2023-02-24	PalaBadminton - 5	Wongsup Wongsup-In	Noah Warning	2	0	24	Wongsup Wongsup-In	16	\N	\N
2023-02-24	PalaBadminton - 2	Kee Is Qian	Florian Otto	2	0	20	Kee Is Qian	16	\N	\N
2023-02-24	PalaBadminton - 6	Mark Obermeier	Iago Martinez	2	0	38	Mark Obermeier	16	\N	\N
2023-02-24	PalaBadminton - 2	Marc Martin	Brent Stockman	2	0	30	Marc Martin	16	\N	\N
2023-02-24	PalaBadminton - 5	Luca Wiechmann	Csanad Horvath	2	0	20	Luca Wiechmann	16	\N	\N
2023-02-24	PalaBadminton - 1	Nolhan Rihouey	Hugo Chanthakesone	2	0	23	Nolhan Rihouey	16	\N	\N
2023-02-24	PalaBadminton - 3	Basilio Porto	Lenny Bonniere	2	0	41	Basilio Porto	16	\N	\N
2023-02-24	PalaBadminton - 5	Nicolas Fouquet	Ruben Fellin	2	0	30	Nicolas Fouquet	16	\N	\N
2023-02-24	PalaBadminton - 4	Matys Duru	Rodrigo Sanjurjo	2	0	34	Matys Duru	16	\N	\N
2023-02-24	PalaBadminton - 6	Ethan Bissay	Lorenz Windauer	2	0	27	Ethan Bissay	16	\N	\N
2023-02-24	PalaBadminton - 2	Bima Al Ayman Modjo	Keishin Rimmer	2	0	34	Bima Al Ayman Modjo	16	\N	\N
2023-02-24	PalaBadminton - 1	Arnaud Huberty	Luca Bellazzi	2	0	27	Arnaud Huberty	16	\N	\N
2023-02-24	PalaBadminton - 5	Nachakorn Pusri	Joep Strooper	2	0	18	Nachakorn Pusri	16	\N	\N
2023-02-24	PalaBadminton - 6	Mikolaj Kraft	Ewan Goulin	2	1	64	Mikolaj Kraft	16	\N	\N
2023-02-24	PalaBadminton - 3	Alvaro Moran	Simone Piccinin	2	0	38	Alvaro Moran	16	\N	\N
2023-02-25	PalaBadminton - 6	Loris Dietrich	Dillon Chong	2	0	32	Loris Dietrich	16	\N	\N
2023-02-25	PalaBadminton - 5	Wongsup Wongsup-In	Kee Is Qian	2	1	58	Wongsup Wongsup-In	16	\N	\N
2023-02-25	PalaBadminton - 2	Basilio Porto	Nolhan Rihouey	2	0	35	Basilio Porto	16	\N	\N
2023-02-25	PalaBadminton - 1	Marc Martin	Josua Hardmeier	2	0	20	Marc Martin	16	\N	\N
2023-02-25	PalaBadminton - 6	Matys Duru	Nicolas Fouquet	2	0	31	Matys Duru	16	\N	\N
2023-02-25	PalaBadminton - 2	Bima Al Ayman Modjo	Ethan Bissay	2	0	34	Bima Al Ayman Modjo	16	\N	\N
2023-02-25	PalaBadminton - 4	Nachakorn Pusri	Arnaud Huberty	2	0	28	Nachakorn Pusri	16	\N	\N
2023-02-25	PalaBadminton - 5	Alvaro Moran	Mikolaj Kraft	2	1	54	Alvaro Moran	16	\N	\N
2023-02-25	PalaBadminton - 4	Matys Duru	Basilio Porto	2	0	41	Matys Duru	16	\N	\N
2023-02-25	PalaBadminton - 6	Wongsup Wongsup-In	Rune Van Dalm	2	0	22	Wongsup Wongsup-In	16	\N	\N
2023-02-25	PalaBadminton - 3	Nachakorn Pusri	Bima Al Ayman Modjo	2	0	36	Nachakorn Pusri	16	\N	\N
2023-02-25	PalaBadminton - 1	Wongsup Wongsup-In	Ziga Podgoršek	2	0	25	Wongsup Wongsup-In	16	\N	\N
2023-02-25	PalaBadminton - 4	Nachakorn Pusri	Mark Koroša	2	0	25	Nachakorn Pusri	16	\N	\N
2023-02-26	PalaBadminton - 2	Nachakorn Pusri	Wongsup Wongsup-In	2	1	60	Nachakorn Pusri	16	\N	\N
2023-02-26	PalaBadminton - 4	Wongsup Wongsup-In	Daniel Franco	2	0	36	Wongsup Wongsup-In	16	\N	\N
2023-02-26	PalaBadminton - 5	Nachakorn Pusri	Adith Karthikeyan Priya	2	0	30	Nachakorn Pusri	16	\N	\N
2023-02-27	MTN Arena - COURT 1	Nathan Muganga Nsibambi	Joshua Ogwang	2	0	11	Nathan Muganga Nsibambi	17	\N	\N
2023-02-27	MTN Arena - COURT 2	Riyan Malhan	Tendo Kizito Mukalazi	2	0	14	Riyan Malhan	17	\N	\N
2023-02-27	MTN Arena - COURT 3	Mitchell Purnomo	Shilton Tayebwa	2	0	16	Mitchell Purnomo	17	\N	\N
2023-02-27	MTN Arena - COURT 1	Kunj Ravi Patel	Naveen Yashwanth Vengarai Prassanna	2	0	20	Kunj Ravi Patel	17	\N	\N
2023-02-27	MTN Arena - COURT 2	Girish Venkat Padmanabhan	Akbar Oduka	2	0	24	Girish Venkat Padmanabhan	17	\N	\N
2023-02-27	MTN Arena - COURT 3	Dev Vishnu	Pranav Bhaugeerothee	2	0	16	Dev Vishnu	17	\N	\N
2023-02-27	MTN Arena - COURT 2	Rajhans Rai Nundah	Eric Ofoyuru	2	1	29	Rajhans Rai Nundah	17	\N	\N
2023-02-28	MTN Arena - COURT 3	Dev Vishnu	Girish Venkat Padmanabhan	2	0	23	Dev Vishnu	17	\N	\N
2023-02-28	MTN Arena - COURT 3	Riyan Malhan	Bhavesh Bissessur	2	0	17	Riyan Malhan	17	\N	\N
2023-02-28	MTN Arena - COURT 3	Girish Venkat Padmanabhan	Kunj Ravi Patel	2	0	12	Girish Venkat Padmanabhan	17	\N	\N
2023-02-28	MTN Arena - COURT 2	Dev Vishnu	Lucas Douce	2	1	31	Dev Vishnu	17	\N	\N
2023-03-01	MTN Arena - COURT 1	Dev Vishnu	Abed Bukenya	2	0	23	Dev Vishnu	17	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 2	Yudai Okimoto	Mats Duwel	2	0	26	Yudai Okimoto	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 1	Cho Hyeon Woo	Luis Pongratz	2	0	26	Cho Hyeon Woo	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 5	Joep Strooper	Lino Degenkolb	2	0	39	Joep Strooper	18	\N	\N
2023-03-01	-	Sri Mohith Kothapalli	Aditya Patil (Walkover)	0	0	0	Sri Mohith Kothapalli	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 2	Yu Hang Shih	Federico Marrazza	2	0	19	Yu Hang Shih	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 1	Philip Kryger Boe	Chayakorn Sootlake	2	1	51	Philip Kryger Boe	18	\N	\N
2023-03-01	-	Lee Jong Min	Raphael Maho (Walkover)	0	0	0	Lee Jong Min	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 3	Mark Obermeier	Philip Oliver Rasmussen	2	0	31	Mark Obermeier	18	\N	\N
2023-03-01	-	Salomon Adam Thomasen	Bruno Steffen-Sanchez (Walkover)	0	0	0	Salomon Adam Thomasen	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 4	Tian Qi Zhang	Lorenz Oberndorfer	2	0	32	Tian Qi Zhang	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 5	Huang Jia Ming	Devin Artha Wahyudi	2	0	27	Huang Jia Ming	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 1	Moon Jong Woo	Ayush Shetty	2	0	31	Moon Jong Woo	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 3	Bima Al Ayman Modjo	Gaspard Delabrosse	2	0	21	Bima Al Ayman Modjo	18	\N	\N
2023-03-01	-	Park Sung Ju	William Bøgebjerg (Walkover)	0	0	0	Park Sung Ju	18	\N	\N
2023-03-01	-	Nicolas Fouquet	Pascal Cheng (Walkover)	0	0	0	Nicolas Fouquet	18	\N	\N
2023-03-01	-	Matteo Schinzel	Arnaud Huberty (Walkover)	0	0	0	Matteo Schinzel	18	\N	\N
2023-03-01	Badmintonhall DEGIRO hall - 2	Dhruv Negi	Simone Piccinin	2	0	22	Dhruv Negi	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 3	Pan Yin Long	Jakob Rinner	2	0	22	Pan Yin Long	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Cho Hyeon Woo	Eogene Ewe	2	1	69	Cho Hyeon Woo	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Sri Mohith Kothapalli	Alexander Becsh	2	0	27	Sri Mohith Kothapalli	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 3	Ryan Putra Widyanto	Philip Kryger Boe	2	0	35	Ryan Putra Widyanto	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 3	Yudai Okimoto	Wongsup Wongsup-In	2	0	45	Yudai Okimoto	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Mark Obermeier	Jonas Rau	2	0	19	Mark Obermeier	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Manraj Singh	Huang Jia Ming	2	1	50	Manraj Singh	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Søren Møller Thomsen	Tian Qi Zhang	2	0	35	Søren Møller Thomsen	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Dhruv Negi	Kee Is Qian	2	0	44	Dhruv Negi	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Moon Jong Woo	Lok Hong Quan	2	0	31	Moon Jong Woo	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Park Sung Ju	Emil Bach Kristensen	2	0	24	Park Sung Ju	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Hu Zhe An	Matteo Schinzel	2	0	16	Hu Zhe An	18	\N	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Wang Zi Jun	Nicolas Fouquet	2	0	27	Wang Zi Jun	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 3	Yudai Okimoto	Sebastian Mikkelsen	2	0	39	Yudai Okimoto	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 2	Ryan Putra Widyanto	Baptiste Rolin	2	0	29	Ryan Putra Widyanto	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 5	Pan Yin Long	Yohann Osvald	2	0	31	Pan Yin Long	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 1	Moon Jong Woo	Kenta Matsukawa	2	0	43	Moon Jong Woo	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 1	Manraj Singh	Adisak Prasertphetmanee	2	0	51	Manraj Singh	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 5	Wang Zi Jun	Park Sung Ju	2	1	69	Wang Zi Jun	18	\N	\N
2023-03-03	Badmintonhall DEGIRO hall - 2	Hu Zhe An	Zyver John De Leon	2	0	27	Hu Zhe An	18	\N	\N
2023-03-04	Badmintonhall DEGIRO hall - 1	Yudai Okimoto	Mads Emil Monke	2	0	31	Yudai Okimoto	18	\N	\N
2023-03-04	Badmintonhall DEGIRO hall - 4	Hu Zhe An	Charles Fouyn	2	0	38	Hu Zhe An	18	\N	\N
2023-03-04	Badmintonhall DEGIRO hall - 1	Manraj Singh	Moon Jong Woo	2	1	61	Manraj Singh	18	\N	\N
2023-03-04	Badmintonhall DEGIRO hall - 4	Yudai Okimoto	Pan Yin Long	2	1	88	Yudai Okimoto	18	\N	\N
2023-03-04	Badmintonhall DEGIRO hall - 2	Hu Zhe An	Wang Zi Jun	2	1	52	Hu Zhe An	18	\N	\N
2023-03-05	Badmintonhall DEGIRO hall - 3	Yudai Okimoto	Hu Zhe An	1	1	54	Yudai Okimoto	18	\N	\N
2023-03-05	Badmintonhall DEGIRO hall - 4	Yudai Okimoto	Moh. Zaki Ubaidillah	2	0	37	Yudai Okimoto	18	\N	\N
2023-03-05	Badmintonhall DEGIRO hall - 2	Hu Zhe An	Daigo Tanioka	2	0	39	Hu Zhe An	18	\N	\N
2023-03-17	-	Gonzalo Isabal	Rafael Cresdee (Walkover)	0	0	0	Gonzalo Isabal	26	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Lokesh Reddy Kalagotla	Felix Schütt	2	0	25	Lokesh Reddy Kalagotla	22	\N	\N
2023-03-17	Sports Hall - 1 Malow	Aldrin Nelson	Michal Weslawowicz	2	0	26	Aldrin Nelson	27	\N	\N
2023-03-10	High Performance Centre - 4	Aria Dinata	Harshit Aggarwal	2	0	33	Aria Dinata	21	91894	\N
\N	-	Aditya Patil	Anton Druzhchenko (Walkover)	0	0	0	Aditya Patil	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Cho Hyeon Woo	Arthur Wakhevitsch	2	0	41	Cho Hyeon Woo	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Moon Jong Woo	Marco Danti	2	0	26	Moon Jong Woo	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Jason Ou	Lorenz Windauer	2	0	26	Jason Ou	22	\N	\N
2023-03-08	-	Yu Hang Shih	Tebbe Monsees (Walkover)	0	0	0	Yu Hang Shih	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Sri Mohith Kothapalli	Loris Dietrich	2	0	26	Sri Mohith Kothapalli	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Devin Artha Wahyudi	Maksymilian Krogulski	2	0	25	Devin Artha Wahyudi	22	\N	\N
2023-03-08	-	Huang Jia Ming	Matteo Schinzel (Walkover)	0	0	0	Huang Jia Ming	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Marek Waliszewski	Rayce Su	2	0	29	Marek Waliszewski	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 6	Rafe Kenji Braach	Michael Pang	2	1	55	Rafe Kenji Braach	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Zhi Lun Ong	Jakob Rinner	2	1	48	Zhi Lun Ong	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Ryan Putra Widyanto	Rune Van Dalm	2	0	27	Ryan Putra Widyanto	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Tian Qi Zhang	Philip Oliver Rasmussen	2	1	41	Tian Qi Zhang	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Robert Nebel	Alexander Becsh	2	1	45	Robert Nebel	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Bima Al Ayman Modjo	Sean Fanseda	2	0	20	Bima Al Ayman Modjo	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Nachakorn Pusri	Gagan Balyan	2	0	34	Nachakorn Pusri	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Yudai Okimoto	Lasse Linderoth Pedersen	2	0	28	Yudai Okimoto	22	\N	\N
2023-03-08	-	Kevin Baum	William Bøgebjerg (Walkover)	0	0	0	Kevin Baum	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Salomon Adam Thomasen	Liano Panza	2	0	28	Salomon Adam Thomasen	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Chayakorn Sootlake	Chua Min Han	2	0	34	Chayakorn Sootlake	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 6	Park Sung Ju	Matthew Li	2	0	17	Park Sung Ju	22	\N	\N
2023-03-08	-	Ilija Nicolussi	Julian Strack (Walkover)	0	0	0	Ilija Nicolussi	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Mark Obermeier	Mikolaj Morawski	2	0	27	Mark Obermeier	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Park Beom Soo	Mahan Yousefimoein	2	0	20	Park Beom Soo	22	\N	\N
2023-03-08	-	Patrik Fuciman	Matus Polacek (Walkover)	0	0	0	Patrik Fuciman	22	\N	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Manraj Singh	Armin Verchow	2	0	20	Manraj Singh	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 3	Wang Zi Jun	Moon Jong Woo	2	0	40	Wang Zi Jun	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 4	Wongsup Wongsup-In	Adith Karthikeyan Priya	2	1	43	Wongsup Wongsup-In	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 1	Lokesh Reddy Kalagotla	Luca Wiechmann	2	0	20	Lokesh Reddy Kalagotla	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 2	Huang Jia Ming	Garret Tan	2	0	36	Huang Jia Ming	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 1	Pan Yin Long	Cho Hyeon Woo	2	0	36	Pan Yin Long	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 3	Devin Artha Wahyudi	Sri Mohith Kothapalli	2	0	28	Devin Artha Wahyudi	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 3	Jason Ou	Rafe Kenji Braach	2	1	50	Jason Ou	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 6	Yudai Okimoto	Kevin Baum	2	0	24	Yudai Okimoto	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 4	Chayakorn Sootlake	Aditya Patil	2	0	34	Chayakorn Sootlake	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 5	Park Sung Ju	Hu Zhe An	2	0	45	Park Sung Ju	22	\N	\N
2023-03-09	Sportarena (Sportforum) Berlin - 2	Park Beom Soo	Patrik Fuciman	2	0	25	Park Beom Soo	22	\N	\N
2023-03-09	-	Manraj Singh	Mateusz Golas (Walkover)	0	0	0	Manraj Singh	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 5	Wang Zi Jun	Jan Wilczak	2	0	25	Wang Zi Jun	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 1	Wongsup Wongsup-In	Jason Ou	2	0	29	Wongsup Wongsup-In	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 4	Lokesh Reddy Kalagotla	Devin Artha Wahyudi	2	0	20	Lokesh Reddy Kalagotla	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 2	Huang Jia Ming	Noah Haase	2	0	39	Huang Jia Ming	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 2	Yudai Okimoto	Daigo Tanioka	2	0	40	Yudai Okimoto	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Park Sung Ju	Chayakorn Sootlake	2	0	28	Park Sung Ju	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Park Beom Soo	Manraj Singh	2	0	37	Park Beom Soo	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 6	Wang Zi Jun	Mads Emil Monke	2	0	31	Wang Zi Jun	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 5	Wongsup Wongsup-In	Kenta Matsukawa	2	0	34	Wongsup Wongsup-In	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 1	Huang Jia Ming	Lakshay Sharma	2	1	70	Huang Jia Ming	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 2	Yudai Okimoto	Park Sung Ju	2	0	54	Yudai Okimoto	22	\N	\N
2023-03-10	Sportarena (Sportforum) Berlin - 5	Park Beom Soo	Lau Jun Hui Marcus	2	0	45	Park Beom Soo	22	\N	\N
2023-03-11	Sportarena (Sportforum) Berlin - 2	Yudai Okimoto	Ayush Shetty	2	1	62	Yudai Okimoto	22	\N	\N
2023-03-11	Sportarena (Sportforum) Berlin - 1	Wang Zi Jun	Wongsup Wongsup-In	2	1	61	Wang Zi Jun	22	\N	\N
2023-03-11	Sportarena (Sportforum) Berlin - 4	Yudai Okimoto	Park Beom Soo	2	1	65	Yudai Okimoto	22	\N	\N
2023-03-12	Sportarena (Sportforum) Berlin - 1	Yudai Okimoto	Eogene Ewe	2	1	73	Yudai Okimoto	22	\N	\N
2023-03-16	-	Muhammad Sultan Nurhabibu Mayang	Leandro Gil Dueñas	2	0	21	Muhammad Sultan Nurhabibu Mayang	24	\N	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 3	Muhammad Sultan Nurhabibu Mayang	Aria Dinata	2	0	41	Muhammad Sultan Nurhabibu Mayang	24	\N	\N
2023-03-18	Coliseo de la Ciudad Deportiva - 1	Muhammad Sultan Nurhabibu Mayang	Iliyan Stoynov	2	0	35	Muhammad Sultan Nurhabibu Mayang	24	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Alejandro Gallego	Richard Adams	2	0	25	Alejandro Gallego	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Santiago Batalha	Basilio Porto	2	0	39	Santiago Batalha	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Alejandro Barcala	Pedro Mancura	2	0	22	Alejandro Barcala	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Josh Taylor	Mario Banzo	2	0	15	Josh Taylor	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Raul Bergua	Marco Castillo	2	0	30	Raul Bergua	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Theo Johnston	Victor Cañadas	2	0	30	Theo Johnston	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Martin Harbo	Ivan Torre	2	0	30	Martin Harbo	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Philip Oliver Rasmussen	Alejandro Lopez	2	0	38	Philip Oliver Rasmussen	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Gines Valles	Evan Kenny	2	0	23	Gines Valles	26	\N	\N
2023-03-17	-	Dinis Maia	Alexander Parmentier (Walkover)	0	0	0	Dinis Maia	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Tiago Gouveia	Eric Gomez	2	0	23	Tiago Gouveia	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Thomas Valther Pedersen	Abu Serrano	2	0	23	Thomas Valther Pedersen	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Finlay Jack	Nacho Frances	2	0	22	Finlay Jack	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Dev Vishnu	Raul Yedra Rodríguez	2	0	20	Dev Vishnu	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Arnaud Huberty	Joan Guasch	2	1	43	Arnaud Huberty	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Tiago Berenguer	Pau Gomez	2	0	20	Tiago Berenguer	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Francisco Daniel	Yago Garcia	2	0	25	Francisco Daniel	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Remy Taing	Alvaro Moran	2	1	57	Remy Taing	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Iago Martinez	Matthew Yu	2	0	29	Iago Martinez	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Ramon Rovira	Alexandre Bernardo	2	0	30	Ramon Rovira	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Raphael Maho	Marc Guasch	2	0	25	Raphael Maho	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Riyan Malhan	Jofre Comella	2	0	39	Riyan Malhan	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Pau Muñoz	Howard Yau Lok Cheuk	2	0	27	Pau Muñoz	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Matts Croes	Mario Rodriguez	2	1	44	Matts Croes	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Pedro Almeida	Mateo Rey	2	1	44	Pedro Almeida	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Rodrigo Sanjurjo	Juan Pablo De Siano	2	0	19	Rodrigo Sanjurjo	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Raul Bergua	Josh Taylor	2	1	50	Raul Bergua	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Santiago Batalha	Alejandro Barcala	2	0	25	Santiago Batalha	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Philip Oliver Rasmussen	Gines Valles	2	0	31	Philip Oliver Rasmussen	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Martin Harbo	Gonzalo Isabal	2	0	23	Martin Harbo	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Tiago Gouveia	Dinis Maia	2	1	42	Tiago Gouveia	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Thomas Valther Pedersen	Finlay Jack	2	0	31	Thomas Valther Pedersen	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Tiago Berenguer	Arnaud Huberty	1	0	24	Tiago Berenguer	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Remy Taing	Francisco Daniel	2	0	19	Remy Taing	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Ramon Rovira	Iago Martinez	2	1	50	Ramon Rovira	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 4	Raphael Maho	Riyan Malhan	2	1	50	Raphael Maho	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Matts Croes	Pau Muñoz	2	0	21	Matts Croes	26	\N	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Rodrigo Sanjurjo	Pedro Almeida	2	0	19	Rodrigo Sanjurjo	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 3	Raphael Maho	Ramon Rovira	2	0	34	Raphael Maho	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 2	Santiago Batalha	Raul Bergua	2	0	36	Santiago Batalha	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 1	Philip Oliver Rasmussen	Tiago Gouveia	2	1	49	Philip Oliver Rasmussen	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 2	Tiago Berenguer	Remy Taing	2	0	50	Tiago Berenguer	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 5	Rodrigo Sanjurjo	Matts Croes	2	0	26	Rodrigo Sanjurjo	26	\N	\N
2023-03-18	Polideportivo Corredoria Arena - 3	Rodrigo Sanjurjo	Raphael Maho	2	1	47	Rodrigo Sanjurjo	26	\N	\N
2023-03-17	Sports Hall - 3 Betonex	Nojus Tenikaitis	Kaspar Sorge	2	0	22	Nojus Tenikaitis	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Sebastian Pinkowicz	Louis Morin	2	0	27	Sebastian Pinkowicz	27	\N	\N
2023-03-17	Sports Hall - 2 Racis	Andrej Suchy	Mats Wohlers	2	0	22	Andrej Suchy	27	\N	\N
2023-03-17	Sports Hall - 3 Betonex	Yulien Gil	Tymofii Kadiemin	2	1	33	Yulien Gil	27	\N	\N
2023-03-17	Sports Hall - 2 Racis	Jakub Raška	Jurgis Jatulis	2	0	22	Jakub Raška	27	\N	\N
2023-03-17	Sports Hall - 1 Malow	Marek Čepela	Alon Shlezinger	2	0	20	Marek Čepela	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Danil Sedov	Jakub Dulemba	2	0	20	Danil Sedov	27	\N	\N
2023-03-17	Sports Hall - 2 Racis	Adam Srnec	Kamil Markus	2	0	22	Adam Srnec	27	\N	\N
2023-03-17	Sports Hall - 1 Malow	Boris Popov	Rotem Siluk	2	0	24	Boris Popov	27	\N	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Marti Joost	Andrej Macek	2	0	20	Marti Joost	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Wojciech Budny	Kajus Vilpisauskas	2	0	18	Wojciech Budny	27	\N	\N
2023-03-17	Sports Hall - 3 Betonex	Jakub Sidor	Regnars Bajars	2	1	38	Jakub Sidor	27	\N	\N
2023-03-17	Sports Hall - 1 Malow	Kryštof Coufal	Jan Szeszko	2	1	40	Kryštof Coufal	27	\N	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Igor Skolimowski	Toms Sala	2	0	25	Igor Skolimowski	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Petr Bříza	Erik Hajdu	2	0	19	Petr Bříza	27	\N	\N
2023-03-17	Sports Hall - 3 Betonex	Pawel Kiszczyk	Leonardo Golovcenko	2	0	21	Pawel Kiszczyk	27	\N	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Bartosz Punko	Lukáš Thor	2	0	21	Bartosz Punko	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Rafal Mielnik	Daniel Leonovic	2	0	25	Rafal Mielnik	27	\N	\N
2023-03-17	Sports Hall - 1 Malow	Michael Havlíček	Vladyslav Stepanchenko	2	1	37	Michael Havlíček	27	\N	\N
2023-03-17	Sports Hall - 2 Racis	Alex Petrovic	Cesar Rodrigues	2	0	16	Alex Petrovic	27	\N	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Fedir Tiurin	Petr Martinec	2	0	20	Fedir Tiurin	27	\N	\N
2023-03-17	Sports Hall - 3 Betonex	Rokas Lesinskas	Martin Pho	2	0	20	Rokas Lesinskas	27	\N	\N
2023-03-17	Sports Hall - 5 Yonex	Ismael Oballe	Priit Põder	2	0	20	Ismael Oballe	27	\N	\N
2023-03-17	Sports Hall - 2 Racis	Rasmus Roogsoo	Felix Wohlers	2	0	20	Rasmus Roogsoo	27	\N	\N
2023-03-18	Sports Hall - 1 Malow	Sebastian Pinkowicz	Marek Čepela	2	0	36	Sebastian Pinkowicz	27	\N	\N
2023-03-18	Sports Hall - 3 Betonex	Danil Sedov	Serhii Marushchak	2	0	23	Danil Sedov	27	\N	\N
2023-03-18	Sports Hall - 2 Racis	Fedir Tiurin	Vladyslav Kunin	2	0	17	Fedir Tiurin	27	\N	\N
2023-03-18	Sports Hall - 1 Malow	Ismael Oballe	Rokas Lesinskas	2	0	31	Ismael Oballe	27	\N	\N
2023-03-18	Sports Hall - 3 Betonex	Sebastian Pinkowicz	Jakub Raška	2	0	19	Sebastian Pinkowicz	27	\N	\N
2023-03-18	Sports Hall - 5 Yonex	Rafal Mielnik	Michael Havlíček	2	1	45	Rafal Mielnik	27	\N	\N
2023-03-18	Sports Hall - 3 Betonex	Marek Čepela	Jakub Sidor	2	1	38	Marek Čepela	27	\N	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Fedir Tiurin	Alex Petrovic	2	0	19	Fedir Tiurin	27	\N	\N
2023-03-18	Sports Hall - 2 Racis	Danil Sedov	Adam Srnec	2	0	22	Danil Sedov	27	\N	\N
2023-03-18	Sports Hall - 5 Yonex	Wojciech Budny	Marti Joost	2	1	46	Wojciech Budny	27	\N	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Bartosz Punko	Pawel Kiszczyk	2	0	20	Bartosz Punko	27	\N	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Aldrin Nelson	Nojus Tenikaitis	2	0	33	Aldrin Nelson	27	\N	\N
2023-03-18	Sports Hall - 3 Betonex	Andrej Suchy	Yegor Romaniuk	2	0	33	Andrej Suchy	27	\N	\N
2023-03-18	Sports Hall - 5 Yonex	Sebastian Pinkowicz	Andrej Suchy	2	0	28	Sebastian Pinkowicz	27	\N	\N
2023-03-18	Sports Hall - 3 Betonex	Marek Čepela	Wojciech Budny	2	0	21	Marek Čepela	27	\N	\N
2023-03-18	Sports Hall - 5 Yonex	Danil Sedov	Mikolaj Morawski	2	0	25	Danil Sedov	27	\N	\N
2023-03-18	Sports Hall - 1 Malow	Fedir Tiurin	Rafal Mielnik	2	0	19	Fedir Tiurin	27	\N	\N
2023-03-19	Sports Hall - 1 Malow	Fedir Tiurin	Sebastian Pinkowicz	2	1	42	Fedir Tiurin	27	\N	\N
2023-03-19	Sports Hall - 2 Racis	Sebastian Pinkowicz	Ivan Tsaregorotsev	2	1	63	Sebastian Pinkowicz	27	\N	\N
2023-03-19	Sports Hall - 2 Racis	Fedir Tiurin	Danil Sedov	2	0	32	Fedir Tiurin	27	\N	\N
2023-03-22	St. Jakobshalle Basel - 3	Chi Yu Jen	Tobias Kuenzi	2	0	42	Chi Yu Jen	28	77848	\N
2023-03-30	Sportovní hala - Court 2	Sonish Hathi	Abel Balint Kiss	2	0	19	Sonish Hathi	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Kryštof Coufal	Viktor Patteet	2	0	26	Kryštof Coufal	33	\N	\N
2023-03-30	Sportovní hala - Court 3	Patrik Dimitrov	Vince Felix Boros	2	0	21	Patrik Dimitrov	33	\N	\N
2023-03-30	Sportovní hala - Court 2	David Ng	Vojtěch Strejček	2	0	28	David Ng	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Lukáš Thor	Davide Izzo	2	1	44	Lukáš Thor	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Kamil Markus	Ruben Fellin	2	1	34	Kamil Markus	33	\N	\N
2023-03-30	Sportovní hala - Court 3	Adam Srnec	Nikola Hingerl	2	0	22	Adam Srnec	33	\N	\N
2023-03-30	Sportovní hala - Court 5	Filip Titěra	Micah Melis	2	0	20	Filip Titěra	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Tsvetan Ivanov	Petr Martinec	2	0	18	Tsvetan Ivanov	33	\N	\N
2023-03-30	Sportovní hala - Court 3	Tiago Berenguer	Zhi Lun Ong	2	0	23	Tiago Berenguer	33	\N	\N
2023-03-30	Sportovní hala - Court 5	Pranav Erukattil	Roel Pipeleers	2	1	37	Pranav Erukattil	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Raul Bergua	Matia Dell'Antone	2	0	19	Raul Bergua	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Lukáš Patzák	Calin Grajdieru	2	0	31	Lukáš Patzák	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Andrej Macek	Lennert Pompe	2	1	40	Andrej Macek	33	\N	\N
2023-03-30	Sportovní hala - Court 3	Marek Čepela	Vlad Dehelean	2	0	23	Marek Čepela	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Erik Hajdu	Libor Raška	2	0	19	Erik Hajdu	33	\N	\N
2023-03-30	Sportovní hala - Court 5	Balazs Peto	Petr Bříza	2	1	30	Balazs Peto	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Ondřej Kaplan	Alejandro Gallego	2	1	35	Ondřej Kaplan	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Dennis Kerpl	Zeno Agai	2	0	21	Dennis Kerpl	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Andrej Suchy	Igor Skolimowski	2	1	51	Andrej Suchy	33	\N	\N
2023-03-30	Sportovní hala - Court 5	George Alexandru Mocan	Vito Radovanović	2	1	40	George Alexandru Mocan	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Nikita Peshekhonov	Matic Jaklin	2	0	23	Nikita Peshekhonov	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Alex Petrovic	Adam Balogh	2	1	35	Alex Petrovic	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Balazs Csernyanszki	Michael Havlíček	2	0	28	Balazs Csernyanszki	33	\N	\N
2023-03-30	Sportovní hala - Court 3	James Song	Luis Haupt	2	0	16	James Song	33	\N	\N
2023-03-30	Sportovní hala - Court 1	Tevž Ornik	Lev Antamonov	2	1	35	Tevž Ornik	33	\N	\N
2023-03-30	Sportovní hala - Court 5	Gonzalo Isabal	Kryštof Klíma	2	0	22	Gonzalo Isabal	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Aarav Sujith	Harry Vaihinger	2	0	20	Aarav Sujith	33	\N	\N
2023-03-30	Sportovní hala - Court 2	Dragos Gabriel Nita	Aron Wesian	2	0	22	Dragos Gabriel Nita	33	\N	\N
2023-03-30	Sportovní hala - Court 3	Edward Davey	Shangzu Zhan	2	0	24	Edward Davey	33	\N	\N
2023-03-30	Sportovní hala - Court 4	Luca-Stefan Pandele	Thomas Wiesler	2	0	15	Luca-Stefan Pandele	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Andrej Suchy	Patrik Dimitrov	2	1	42	Andrej Suchy	33	\N	\N
2023-03-31	Sportovní hala - Court 3	Marek Čepela	Nikita Peshekhonov	2	0	15	Marek Čepela	33	\N	\N
2023-03-31	Sportovní hala - Court 5	Raul Bergua	Lukáš Patzák	2	0	30	Raul Bergua	33	\N	\N
2023-03-31	Sportovní hala - Court 2	Lukáš Thor	Andrej Macek	2	0	20	Lukáš Thor	33	\N	\N
2023-03-31	Sportovní hala - Court 1	Kamil Markus	Balazs Peto	2	1	37	Kamil Markus	33	\N	\N
2023-03-31	Sportovní hala - Court 3	Tiago Berenguer	Sonish Hathi	2	0	29	Tiago Berenguer	33	\N	\N
2023-03-31	Sportovní hala - Court 2	David Ng	George Alexandru Mocan	2	0	24	David Ng	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Pranav Erukattil	Erik Hajdu	2	0	18	Pranav Erukattil	33	\N	\N
2023-03-31	Sportovní hala - Court 5	James Song	Balazs Csernyanszki	2	1	35	James Song	33	\N	\N
2023-03-31	Sportovní hala - Court 3	Tevž Ornik	Ondřej Kaplan	2	0	22	Tevž Ornik	33	\N	\N
2023-03-31	Sportovní hala - Court 1	Kryštof Coufal	Dennis Kerpl	2	0	20	Kryštof Coufal	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Alex Petrovic	Adam Srnec	2	1	34	Alex Petrovic	33	\N	\N
2023-03-31	Sportovní hala - Court 2	Tsvetan Ivanov	Filip Titěra	2	0	28	Tsvetan Ivanov	33	\N	\N
2023-03-31	Sportovní hala - Court 3	Gonzalo Isabal	Noel Tappeiner	2	0	29	Gonzalo Isabal	33	\N	\N
2023-03-31	Sportovní hala - Court 1	Aarav Sujith	Dragos Gabriel Nita	2	0	18	Aarav Sujith	33	\N	\N
2023-03-31	Sportovní hala - Court 5	Luca-Stefan Pandele	Edward Davey	2	0	20	Luca-Stefan Pandele	33	\N	\N
2023-03-31	Sportovní hala - Court 5	Alex Petrovic	Kamil Markus	2	1	31	Alex Petrovic	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Tiago Berenguer	Kryštof Coufal	2	0	20	Tiago Berenguer	33	\N	\N
2023-03-31	Sportovní hala - Court 2	Marek Čepela	Pranav Erukattil	2	1	49	Marek Čepela	33	\N	\N
2023-03-31	Sportovní hala - Court 1	Raul Bergua	Lukáš Thor	2	1	63	Raul Bergua	33	\N	\N
2023-03-31	Sportovní hala - Court 3	Tsvetan Ivanov	Gonzalo Isabal	2	1	44	Tsvetan Ivanov	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Luca-Stefan Pandele	Aarav Sujith	2	1	45	Luca-Stefan Pandele	33	\N	\N
2023-03-31	Sportovní hala - Court 3	David Ng	Andrej Suchy	2	0	31	David Ng	33	\N	\N
2023-03-31	Sportovní hala - Court 2	James Song	Tevž Ornik	2	0	20	James Song	33	\N	\N
2023-03-31	Sportovní hala - Court 2	Tiago Berenguer	David Ng	2	0	33	Tiago Berenguer	33	\N	\N
2023-03-31	Sportovní hala - Court 1	Marek Čepela	Raul Bergua	2	1	52	Marek Čepela	33	\N	\N
2023-03-31	Sportovní hala - Court 3	James Song	Alex Petrovic	2	0	18	James Song	33	\N	\N
2023-03-31	Sportovní hala - Court 4	Luca-Stefan Pandele	Tsvetan Ivanov	2	0	19	Luca-Stefan Pandele	33	\N	\N
2023-04-01	Sportovní hala - Court 1	Tiago Berenguer	Marek Čepela	2	0	31	Tiago Berenguer	33	\N	\N
2023-04-01	Sportovní hala - Court 3	Luca-Stefan Pandele	James Song	2	0	30	Luca-Stefan Pandele	33	\N	\N
2023-04-01	Sportovní hala - Court 1	Tiago Berenguer	Luca-Stefan Pandele	2	1	48	Tiago Berenguer	33	\N	\N
2023-03-30	City Sport Hall - Court 4	Patcharakit Apiratchataset	Shachar Bar Yosef-Yayama	2	0	24	Patcharakit Apiratchataset	34	\N	\N
2023-03-30	City Sport Hall - Court 5	Stithapragnya Reddy Saddi	Shawn Grinblat	2	0	30	Stithapragnya Reddy Saddi	34	\N	\N
2023-03-30	City Sport Hall - Court 2	Ioannis Tambourlas	Alon Shlezinger	2	0	26	Ioannis Tambourlas	34	\N	\N
2023-03-30	City Sport Hall - Court 3	Hrvoje Mavriček	Itamar Bardenstein	2	0	25	Hrvoje Mavriček	34	\N	\N
2023-03-30	City Sport Hall - Court 1	Roko Pipunić	Konstantinos Giannopoulos	2	0	20	Roko Pipunić	34	\N	\N
2023-03-30	City Sport Hall - Court 2	Panya Phutthiphraisakul	Nikolas Kokosis	2	0	28	Panya Phutthiphraisakul	34	\N	\N
2023-03-30	City Sport Hall - Court 3	Eakanath Kitkawinroj	Abhishek Kanapala	2	0	33	Eakanath Kitkawinroj	34	\N	\N
2023-03-30	-	Dinu Pandele	Borut Patčev (Walkover)	0	0	0	Dinu Pandele	34	\N	\N
2023-03-30	City Sport Hall - Court 2	Evelthon Hadjipantelis	Yoel Slutsky	2	0	19	Evelthon Hadjipantelis	34	\N	\N
2023-03-30	City Sport Hall - Court 2	Ioannis Tambourlas	Guy Nachlieli	2	0	28	Ioannis Tambourlas	34	\N	\N
2023-03-31	City Sport Hall - Court 2	Patcharakit Apiratchataset	Stithapragnya Reddy Saddi	2	0	32	Patcharakit Apiratchataset	34	\N	\N
2023-03-31	City Sport Hall - Court 3	Ioannis Tambourlas	Sharon Perelshtein	2	0	23	Ioannis Tambourlas	34	\N	\N
2023-03-31	City Sport Hall - Court 4	Eakanath Kitkawinroj	Dor Shani	2	0	17	Eakanath Kitkawinroj	34	\N	\N
2023-03-31	City Sport Hall - Court 5	Dinu Pandele	Guy Blumenreich	2	1	34	Dinu Pandele	34	\N	\N
2023-03-31	City Sport Hall - Court 2	Roko Pipunić	David Pupko	2	0	16	Roko Pipunić	34	\N	\N
2023-03-31	City Sport Hall - Court 1	Panya Phutthiphraisakul	Mayan Mogilner	2	0	26	Panya Phutthiphraisakul	34	\N	\N
2023-03-31	City Sport Hall - Court 3	Eakanath Kitkawinroj	Ioannis Tambourlas	2	0	22	Eakanath Kitkawinroj	34	\N	\N
2023-03-31	City Sport Hall - Court 5	Patcharakit Apiratchataset	Roko Pipunić	2	1	48	Patcharakit Apiratchataset	34	\N	\N
2023-04-01	City Sport Hall - Court 1	Patcharakit Apiratchataset	Eakanath Kitkawinroj	2	0	36	Patcharakit Apiratchataset	34	\N	\N
2023-04-01	City Sport Hall - Court 1	Patcharakit Apiratchataset	Viktor Petrovic	2	0	36	Patcharakit Apiratchataset	34	\N	\N
2023-04-01	City Sport Hall - Court 3	Eakanath Kitkawinroj	Adith Karthikeyan Priya	2	1	64	Eakanath Kitkawinroj	34	\N	\N
2023-04-06	Salle Everest - 2 - Vals	Nathan Nguyen	Ondřej Šolar	2	0	31	Nathan Nguyen	36	\N	\N
2023-04-06	Salle Everest - 4 - Kyriad	Eric Teller	Evan Long	2	0	30	Eric Teller	36	\N	\N
2023-04-06	Salle Everest - 1 - FZ FORZA	Boris Popov	Jan Huttenloch	2	1	42	Boris Popov	36	\N	\N
2023-04-06	Salle Everest - 2 - Vals	Marco Marie	Timo Amacker	2	0	30	Marco Marie	36	\N	\N
2023-04-06	Salle Everest - 3 - Carrefour	Jing Yi Gavin Ng	Remy Taing	2	1	55	Jing Yi Gavin Ng	36	\N	\N
2023-04-06	Salle Everest - 5 - Koesio	Loris Dietrich	Martin Bellot	2	1	45	Loris Dietrich	36	\N	\N
2023-04-06	Salle Everest - 4 - Kyriad	Leo Boichat	Zephyr Plante	2	0	19	Leo Boichat	36	\N	\N
2023-04-06	Salle Everest - 4 - Kyriad	Pau Gomez	Timothee Lecarme	2	1	37	Pau Gomez	36	\N	\N
2023-04-06	-	Nolhan Rihouey	Abhishek Kanapala (Walkover)	0	0	0	Nolhan Rihouey	36	\N	\N
2023-04-06	Salle Everest - 1 - FZ FORZA	Arnaud Huberty	Anthony Gourdon	2	1	51	Arnaud Huberty	36	\N	\N
2023-04-06	Salle Everest - 5 - Koesio	Gaspard Delabrosse	Nacho Frances	2	0	23	Gaspard Delabrosse	36	\N	\N
2023-04-06	Salle Everest - 3 - Carrefour	Ondřej Běhounek	Artem Lytvynenko	2	0	28	Ondřej Běhounek	36	\N	\N
2023-04-06	Salle Everest - 2 - Vals	Jonas Pfister	Ewan Goulin	1	1	47	Jonas Pfister	36	\N	\N
2023-04-06	Salle Everest - 1 - FZ FORZA	Yann Grimaud	Loic Schneider	2	0	31	Yann Grimaud	36	\N	\N
2023-04-06	Salle Everest - 3 - Carrefour	See Yu	Thibault Gardon	2	1	55	See Yu	36	\N	\N
2023-04-06	-	Alejandro Lopez	Brieuc Jegou	2	0	36	Alejandro Lopez	36	\N	\N
2023-04-07	Salle Everest - 2 - Vals	Nathan Nguyen	Elias Maublanc	2	0	23	Nathan Nguyen	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Eric Teller	Matt Jenkins	2	0	27	Eric Teller	36	\N	\N
2023-04-07	-	Boris Popov	Eliott Morille (Walkover)	0	0	0	Boris Popov	36	\N	\N
2023-04-07	Salle Everest - 5 - Koesio	Jing Yi Gavin Ng	Timeo Bourgin	2	1	57	Jing Yi Gavin Ng	36	\N	\N
2023-04-08	Salle Everest - 5 - Koesio	See Yu	Arthur Wakhevitsch	2	0	31	See Yu	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Alvaro Moran	Jakob Rinner	2	0	33	Alvaro Moran	36	\N	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Loris Dietrich	Timeo Lacour	2	1	48	Loris Dietrich	36	\N	\N
2023-04-07	Salle Everest - 2 - Vals	Marc Martin	Leo Boichat	2	0	22	Marc Martin	36	\N	\N
2023-04-07	Salle Everest - 2 - Vals	Jing Xuan Fan	Pau Gomez	2	0	23	Jing Xuan Fan	36	\N	\N
2023-04-07	Salle Everest - 5 - Koesio	Nolhan Rihouey	Maxime Rigo	2	0	28	Nolhan Rihouey	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Arnaud Huberty	Ethan Bissay	2	0	41	Arnaud Huberty	36	\N	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Ilija Nicolussi	Gaspard Delabrosse	2	0	31	Ilija Nicolussi	36	\N	\N
2023-04-07	Salle Everest - 5 - Koesio	Patcharakit Apiratchataset	Ondřej Běhounek	2	0	18	Patcharakit Apiratchataset	36	\N	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Jonas Pfister	Marco Danti	2	0	34	Jonas Pfister	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Malo Delettre	Yann Grimaud	2	0	21	Malo Delettre	36	\N	\N
2023-04-07	Salle Everest - 5 - Koesio	See Yu	Ramon Rovira	2	0	24	See Yu	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Axel Bastide	Alejandro Lopez	2	1	61	Axel Bastide	36	\N	\N
2023-04-07	Salle Everest - 3 - Carrefour	Luca Wiechmann	Titouan Emond	2	1	58	Luca Wiechmann	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Jing Yi Gavin Ng	Michael Pang	2	0	39	Jing Yi Gavin Ng	36	\N	\N
2023-04-07	Salle Everest - 3 - Carrefour	Alvaro Moran	Loris Dietrich	2	0	33	Alvaro Moran	36	\N	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Marc Martin	Zyver John De Leon	2	1	45	Marc Martin	36	\N	\N
2023-04-07	Salle Everest - 3 - Carrefour	Ilija Nicolussi	Arnaud Huberty	2	0	31	Ilija Nicolussi	36	\N	\N
2023-04-07	Salle Everest - 4 - Kyriad	Patcharakit Apiratchataset	Josua Hardmeier	2	0	28	Patcharakit Apiratchataset	36	\N	\N
2023-04-07	Salle Everest - 3 - Carrefour	See Yu	Ong Tae Ern	2	1	52	See Yu	36	\N	\N
2023-04-08	Salle Everest - 5 - Koesio	Alvaro Moran	Marc Martin	2	0	34	Alvaro Moran	36	\N	\N
2023-04-08	Salle Everest - 2 - Vals	Patcharakit Apiratchataset	Ilija Nicolussi	2	1	43	Patcharakit Apiratchataset	36	\N	\N
2023-04-08	Salle Everest - 4 - Kyriad	Patcharakit Apiratchataset	Yap Chun Sin	2	1	62	Patcharakit Apiratchataset	36	\N	\N
2023-04-08	Salle Everest - 1 - FZ FORZA	See Yu	Robinson Coube	2	0	36	See Yu	36	\N	\N
2023-04-09	Salle Everest - 3 - Carrefour	Patcharakit Apiratchataset	See Yu	2	0	35	Patcharakit Apiratchataset	36	\N	\N
2023-04-07	Den Willecom - 03	Ismael Oballe	Felix Wohlers	2	0	29	Ismael Oballe	37	\N	\N
2023-04-07	Den Willecom - 04	Leon Kaschura	Roel Pipeleers	2	0	28	Leon Kaschura	37	\N	\N
2023-04-07	Den Willecom - 07	Orphé Queton-Bouissou	Adam Balogh	2	0	28	Orphé Queton-Bouissou	37	\N	\N
2023-04-07	Den Willecom - 06	Milan Mesterhazy	Vincent Hofmeister	2	0	15	Milan Mesterhazy	37	\N	\N
2023-04-07	Den Willecom - 09	Jonah Strack	Yulien Gil	2	0	25	Jonah Strack	37	\N	\N
2023-04-07	Den Willecom - 07	Tiago Berenguer	Vince Felix Boros	2	0	20	Tiago Berenguer	37	\N	\N
2023-04-07	Den Willecom - 03	Nolan Chanthakesone	Zisis Pegios	2	0	20	Nolan Chanthakesone	37	\N	\N
2023-04-07	Den Willecom - 05	Hugo Chanthakesone	Peter Palkovics	2	0	26	Hugo Chanthakesone	37	\N	\N
2023-04-07	Den Willecom - 02	Gaspard Leriche	Balazs Csernyanszki	2	1	52	Gaspard Leriche	37	\N	\N
2023-04-07	Den Willecom - 04	Pranav Erukattil	Nikola Hingerl	2	0	23	Pranav Erukattil	37	\N	\N
2023-04-07	Den Willecom - 09	Felix Ekstrand	Adam Srnec	2	0	25	Felix Ekstrand	37	\N	\N
2023-04-07	Den Willecom - 11	Timeo Ternon	Elmeri Lybeck	2	0	38	Timeo Ternon	37	\N	\N
2023-04-07	Den Willecom - 06	Jakob Sjöblom	Sam Reinert	2	1	43	Jakob Sjöblom	37	\N	\N
2023-04-07	Den Willecom - 04	Mats Wohlers	Luuk Vingerhoed	2	0	31	Mats Wohlers	37	\N	\N
2023-04-07	Den Willecom - 01	Tim Schmitz	Quinn Jens	2	0	27	Tim Schmitz	37	\N	\N
2023-04-07	Den Willecom - 08	Linus Emmerich	Evangelos - Stauros Anastasiou	2	0	33	Linus Emmerich	37	\N	\N
2023-04-07	Den Willecom - 06	Yaidel Gil	Lennert Pompe	2	0	31	Yaidel Gil	37	\N	\N
2023-04-07	Den Willecom - 10	Raul Bergua	Shangzu Zhan	2	0	27	Raul Bergua	37	\N	\N
2023-04-07	Den Willecom - 09	Valerian Eckert	Viktor Patteet	2	1	52	Valerian Eckert	37	\N	\N
2023-04-07	Den Willecom - 07	Thomas Tournefier	Gino Monopoli	2	0	30	Thomas Tournefier	37	\N	\N
2023-04-07	Den Willecom - 08	Aldrin Nelson	Francisco Jones	2	0	32	Aldrin Nelson	37	\N	\N
2023-04-07	Den Willecom - 10	Alexandre Bernardo	Pol Feltes	2	0	25	Alexandre Bernardo	37	\N	\N
2023-04-07	Den Willecom - 07	Lukáš Thor	Zhi Lun Ong	2	0	28	Lukáš Thor	37	\N	\N
2023-04-07	Den Willecom - 01	Nicolas Briancourt	Abel Balint Kiss	2	0	26	Nicolas Briancourt	37	\N	\N
2023-04-07	Den Willecom - 03	Arnaud Boschung	Elie Burgot	2	0	30	Arnaud Boschung	37	\N	\N
2023-04-07	Den Willecom - 02	Paul Massias	Petr Bříza	2	0	34	Paul Massias	37	\N	\N
2023-04-07	Den Willecom - 05	Marek Čepela	Luc Thalmann	2	1	61	Marek Čepela	37	\N	\N
2023-04-07	Den Willecom - 01	Gonzalo Isabal	Thomas Mabbe	2	0	22	Gonzalo Isabal	37	\N	\N
2023-04-07	Den Willecom - 11	Alexander Philipp Zhang	Thomas Wiesler	2	0	28	Alexander Philipp Zhang	37	\N	\N
2023-04-07	Den Willecom - 06	Alejandro Gallego	Arthur Miauton	2	0	25	Alejandro Gallego	37	\N	\N
2023-04-08	Den Willecom - 01	Tiago Berenguer	Nolan Chanthakesone	2	0	38	Tiago Berenguer	37	\N	\N
2023-04-08	Den Willecom - 05	Hugo Chanthakesone	Gaspard Leriche	2	0	33	Hugo Chanthakesone	37	\N	\N
2023-04-08	Den Willecom - 09	Pranav Erukattil	Ismael Oballe	2	0	29	Pranav Erukattil	37	\N	\N
2023-04-08	Den Willecom - 07	Timeo Ternon	Felix Ekstrand	2	0	40	Timeo Ternon	37	\N	\N
2023-04-08	Den Willecom - 04	Yaidel Gil	Jakob Sjöblom	2	0	26	Yaidel Gil	37	\N	\N
2023-04-08	Den Willecom - 11	Leon Kaschura	Mats Wohlers	2	0	26	Leon Kaschura	37	\N	\N
2023-04-08	Den Willecom - 08	Raul Bergua	Tim Schmitz	2	0	31	Raul Bergua	37	\N	\N
2023-04-08	Den Willecom - 04	Valerian Eckert	Orphé Queton-Bouissou	2	1	49	Valerian Eckert	37	\N	\N
2023-04-08	Den Willecom - 02	Thomas Tournefier	Linus Emmerich	2	0	32	Thomas Tournefier	37	\N	\N
2023-04-08	Den Willecom - 09	Milan Mesterhazy	Aldrin Nelson	2	0	33	Milan Mesterhazy	37	\N	\N
2023-04-08	Den Willecom - 05	Alexandre Bernardo	Lukáš Thor	2	0	38	Alexandre Bernardo	37	\N	\N
2023-04-08	Den Willecom - 01	Arnaud Boschung	Nicolas Briancourt	2	0	25	Arnaud Boschung	37	\N	\N
2023-04-08	Den Willecom - 10	Marek Čepela	Paul Massias	2	0	39	Marek Čepela	37	\N	\N
2023-04-08	Den Willecom - 03	Gonzalo Isabal	Noel Tappeiner	2	0	34	Gonzalo Isabal	37	\N	\N
2023-04-08	Den Willecom - 07	Alejandro Gallego	Alexander Philipp Zhang	2	0	29	Alejandro Gallego	37	\N	\N
2023-04-08	Den Willecom - 07	Tiago Berenguer	Hugo Chanthakesone	2	0	28	Tiago Berenguer	37	\N	\N
2023-04-08	Den Willecom - 09	Pranav Erukattil	Timeo Ternon	2	1	53	Pranav Erukattil	37	\N	\N
2023-04-08	Den Willecom - 01	Yaidel Gil	Leon Kaschura	2	1	46	Yaidel Gil	37	\N	\N
2023-04-08	Den Willecom - 06	Raul Bergua	Valerian Eckert	2	0	36	Raul Bergua	37	\N	\N
2023-04-08	Den Willecom - 10	Milan Mesterhazy	Thomas Tournefier	2	1	53	Milan Mesterhazy	37	\N	\N
2023-04-08	Den Willecom - 04	Marek Čepela	Arnaud Boschung	2	0	36	Marek Čepela	37	\N	\N
2023-04-08	Den Willecom - 03	Alejandro Gallego	Gonzalo Isabal	2	0	26	Alejandro Gallego	37	\N	\N
2023-04-08	Den Willecom - 09	Tiago Berenguer	Pranav Erukattil	2	0	34	Tiago Berenguer	37	\N	\N
2023-04-08	Den Willecom - 02	Raul Bergua	Yaidel Gil	2	1	60	Raul Bergua	37	\N	\N
2023-04-08	Den Willecom - 03	Marek Čepela	Alejandro Gallego	2	1	56	Marek Čepela	37	\N	\N
2023-04-09	Den Willecom - 03	Tiago Berenguer	Arthur Tatranov	2	1	50	Tiago Berenguer	37	\N	\N
2023-04-09	Den Willecom - 03	Tiago Berenguer	Raul Bergua	2	0	35	Tiago Berenguer	37	\N	\N
2023-04-14	LOC Manege - 1	Rasmus Roogsoo	Toms Sala	2	1	44	Rasmus Roogsoo	39	\N	\N
2023-04-14	LOC Manege - 2	Noam Hochman	Oskars Gutmanis	2	0	12	Noam Hochman	39	\N	\N
2023-04-14	LOC Manege - 3	Jan Szeszko	Kajus Vilpisauskas	2	0	26	Jan Szeszko	39	\N	\N
2023-04-14	LOC Manege - 2	Daniel Leonovic	Oskar Laanes	2	0	20	Daniel Leonovic	39	\N	\N
2023-04-14	LOC Manege - 1	Rokas Lesinskas	Nikola Hingerl	2	0	27	Rokas Lesinskas	39	\N	\N
2023-04-14	LOC Manege - 1	Joris Ivanauskas	Aleksis Emiljans Kviesis	2	0	20	Joris Ivanauskas	39	\N	\N
2023-04-14	LOC Manege - 2	Tymofii Kadiemin	Martin Pho	2	0	25	Tymofii Kadiemin	39	\N	\N
2023-04-14	LOC Manege - TV	Rokas Lesinskas	Regnars Bajars	2	0	29	Rokas Lesinskas	39	\N	\N
2023-04-14	LOC Manege - 2	Marti Joost	Ricards Klavs Miezitis	2	0	17	Marti Joost	39	\N	\N
2023-04-14	LOC Manege - TV	Jakub Dulemba	Leonardo Golovcenko	2	0	25	Jakub Dulemba	39	\N	\N
2023-04-14	LOC Manege - 3	Joris Ivanauskas	Prohors Dobrovolskis	2	0	22	Joris Ivanauskas	39	\N	\N
2023-04-14	LOC Manege - 1	Rasmus Roogsoo	Kipras Sakalauskas	2	0	28	Rasmus Roogsoo	39	\N	\N
2023-04-14	LOC Manege - 2	Daniel Leonovic	Liam Birahij	2	1	40	Daniel Leonovic	39	\N	\N
2023-04-14	LOC Manege - 3	Nojus Tenikaitis	Petr Martinec	2	0	29	Nojus Tenikaitis	39	\N	\N
2023-04-14	LOC Manege - 1	Danil Sedov	Noam Hochman	2	0	20	Danil Sedov	39	\N	\N
2023-04-14	LOC Manege - 1	Priit Põder	Jan Szeszko	2	1	43	Priit Põder	39	\N	\N
2023-04-15	LOC Manege - 1	Nojus Tenikaitis	Daniel Leonovic	2	0	24	Nojus Tenikaitis	39	\N	\N
2023-04-15	LOC Manege - TV	Danil Sedov	Yegor Romaniuk	2	0	32	Danil Sedov	39	\N	\N
2023-04-15	LOC Manege - 1	Marti Joost	Jakub Dulemba	2	1	38	Marti Joost	39	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Mario Rodriguez	Maxance Liraud	2	0	31	Mario Rodriguez	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Bartosz Punko	Arthur Shanmugarajah	2	0	30	Bartosz Punko	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Praneel Reddy Vallapureddy	Jaxon Clarke	2	0	35	Praneel Reddy Vallapureddy	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 3	Timeo Ternon	Aurel Pulcinella	2	0	36	Timeo Ternon	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	James Song	Luc Thalmann	2	0	38	James Song	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Sonish Hathi	Tim Schmitz	2	0	37	Sonish Hathi	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Tom Radenne	Luca Perfido	2	1	47	Tom Radenne	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Nathan Nguyen	Anish Nair	2	0	25	Nathan Nguyen	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Matia Dell'Antone	Micah Melis	2	0	28	Matia Dell'Antone	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Shangxi Olivier Song	Quinn Jens	2	0	3	Shangxi Olivier Song	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	Pawel Kiszczyk	Arthur Phengphachanh	2	1	54	Pawel Kiszczyk	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Orphé Queton-Bouissou	Dion Hijdra	2	0	38	Orphé Queton-Bouissou	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 3	Aarav Sujith	Loic Gosset	2	0	23	Aarav Sujith	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Nicolas Briancourt	Vincent Hofmeister	2	0	22	Nicolas Briancourt	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	Thomas Mabbe	Leo Crelier	2	1	41	Thomas Mabbe	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 3	Paul Massias	Hugo Chanthakesone	2	0	27	Paul Massias	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Oliver Fonseca	Bastien Chevallier	2	0	32	Oliver Fonseca	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Arnaud Boschung	Omar Tariq	2	0	9	Arnaud Boschung	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Elie Burgot	Liam Birahij	2	0	30	Elie Burgot	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	Gaspard Leriche	Nathan Nguyen	2	0	28	Gaspard Leriche	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Senan O'Rourke	Luuk Vingerhoed	2	1	19	Senan O'Rourke	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	Viktor Patteet	Shaurya Sujit	2	0	22	Viktor Patteet	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Nolan Chanthakesone	Dion Hoegen	2	0	24	Nolan Chanthakesone	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 3	Erme Mutlu	Thibault Robin	2	1	37	Erme Mutlu	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 4	Fionn Dowling	Roel Pipeleers	2	0	30	Fionn Dowling	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 2	Valentin Roulleau	Zachary Morris	2	0	33	Valentin Roulleau	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 1	Boris Popov	Ruben Carreras	2	1	54	Boris Popov	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 5	Ali Devran Agiksu	Martin Pho	2	0	24	Ali Devran Agiksu	40	\N	\N
2023-04-20	Complexe Sportif Regional - Court 3	Sebastian Pinkowicz	Felix Ekstrand	2	0	26	Sebastian Pinkowicz	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	Shangxi Olivier Song	Thomas Mabbe	2	0	27	Shangxi Olivier Song	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	Nathan Nguyen	Matia Dell'Antone	2	0	27	Nathan Nguyen	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Bartosz Punko	Timeo Ternon	2	0	28	Bartosz Punko	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 4	Mario Rodriguez	Orphé Queton-Bouissou	2	0	24	Mario Rodriguez	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Aarav Sujith	Pawel Kiszczyk	2	0	30	Aarav Sujith	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	James Song	Noel Tappeiner	2	0	39	James Song	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 3	Paul Massias	Nicolas Briancourt	2	0	23	Paul Massias	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 4	Sonish Hathi	Oliver Fonseca	2	0	23	Sonish Hathi	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	Arnaud Boschung	Tom Radenne	2	0	32	Arnaud Boschung	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Gaspard Leriche	Elie Burgot	2	1	36	Gaspard Leriche	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 4	Nolan Chanthakesone	Viktor Patteet	2	0	33	Nolan Chanthakesone	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	Erme Mutlu	Fionn Dowling	2	0	25	Erme Mutlu	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	Valentin Roulleau	Boris Popov	2	1	50	Valentin Roulleau	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Sebastian Pinkowicz	Ali Devran Agiksu	2	0	40	Sebastian Pinkowicz	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	Nathan Nguyen	Mario Rodriguez	2	0	23	Nathan Nguyen	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Bartosz Punko	Aarav Sujith	2	1	30	Bartosz Punko	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	James Song	Paul Massias	2	0	28	James Song	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 3	Sonish Hathi	Arnaud Boschung	2	0	25	Sonish Hathi	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	Gaspard Leriche	Arthur Tatranov	2	0	34	Gaspard Leriche	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	Erme Mutlu	Nolan Chanthakesone	2	1	46	Erme Mutlu	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 2	Sebastian Pinkowicz	Valentin Roulleau	2	0	25	Sebastian Pinkowicz	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 4	Bartosz Punko	James Song	2	0	34	Bartosz Punko	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 4	Sonish Hathi	Gaspard Leriche	2	1	45	Sonish Hathi	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 5	Sebastian Pinkowicz	Erme Mutlu	2	0	30	Sebastian Pinkowicz	40	\N	\N
2023-04-21	Complexe Sportif Regional - Court 1	Nathan Nguyen	Swann Hardi	2	0	34	Nathan Nguyen	40	\N	\N
2023-04-22	Complexe Sportif Regional - Court 1	Nathan Nguyen	Bartosz Punko	2	0	35	Nathan Nguyen	40	\N	\N
2023-04-22	Complexe Sportif Regional - Court 3	Sebastian Pinkowicz	Sonish Hathi	2	1	68	Sebastian Pinkowicz	40	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Aleksanders Jakovlevs	Andreas Panteli	2	0	15	Aleksanders Jakovlevs	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Filip Swahn	Guy Blumenreich	2	0	25	Filip Swahn	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Filip Boehn	Panayiotis Loizides	2	0	20	Filip Boehn	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Rishabh Kalidasan	Adam Travinskiy	2	0	22	Rishabh Kalidasan	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Nikolas Kokosis	Guy Nachlieli	2	0	20	Nikolas Kokosis	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Akseli Aalto	Garri Ter-Karapetyan	2	0	15	Akseli Aalto	41	\N	\N
2023-04-21	-	Noah Warning	Stithapragnya Reddy Saddi (Walkover)	0	0	0	Noah Warning	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Oliver Oldorff	Konstantinos Christodoulides	2	0	13	Oliver Oldorff	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Roko Pipunić	Tom Feltes	2	0	25	Roko Pipunić	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Sourabh Kulkarni	Demetris Aristidou	2	0	30	Sourabh Kulkarni	41	\N	\N
2023-04-21	-	Angelos Christoforou	Abhishek Kanapala (Walkover)	0	0	0	Angelos Christoforou	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Tommi Kaikkonen	Nicolas Maroudias	2	0	30	Tommi Kaikkonen	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Elof Åberg	Hrvoje Mavriček	2	0	23	Elof Åberg	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Riyan Malhan	Vid Koščak	2	0	15	Riyan Malhan	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Ioannis Tambourlas	Agasi Kirakosyan	2	0	16	Ioannis Tambourlas	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Alvar Melleri	Dor Shani	2	0	19	Alvar Melleri	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Aditya Menon	Panayiotis Adamou	2	0	20	Aditya Menon	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Romeo Makboul	Zinonas Hadjipolykarpou	2	0	14	Romeo Makboul	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Mathias Wong	George Pouyioutas	2	0	22	Mathias Wong	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Dev Vishnu	Antreas Demetriou	2	0	15	Dev Vishnu	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Konstantinos Giannopoulos	Andreas Iordanou	2	0	15	Konstantinos Giannopoulos	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Oliver Oldorff	Sharon Perelshtein	2	1	35	Oliver Oldorff	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Filip Swahn	Tommi Kaikkonen	2	0	30	Filip Swahn	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Rishabh Kalidasan	Filip Boehn	2	1	47	Rishabh Kalidasan	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Noah Warning	Akseli Aalto	2	1	45	Noah Warning	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Riyan Malhan	Elof Åberg	2	0	52	Riyan Malhan	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Romeo Makboul	Aditya Menon	2	0	24	Romeo Makboul	41	\N	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Dev Vishnu	Mathias Wong	2	0	25	Dev Vishnu	41	\N	\N
2023-04-22	Evangelos Florakis Sports Hall - 2	Noah Warning	Rishabh Kalidasan	2	1	40	Noah Warning	41	\N	\N
2023-04-22	Evangelos Florakis Sports Hall - 1	Dev Vishnu	Adith Karthikeyan Priya	1	1	40	Dev Vishnu	41	\N	\N
2023-04-22	Evangelos Florakis Sports Hall - 3	Dev Vishnu	Ng In Qin	2	1	57	Dev Vishnu	41	\N	\N
2023-04-21	-	Ng In Qin	Christos Papadouris (Walkover)	0	0	0	Ng In Qin	41	95954	\N
2023-04-23	Evangelos Florakis Sports Hall - 2	Dev Vishnu	Mark Koroša	2	0	32	Dev Vishnu	41	\N	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Armando Gaitan	Javier Armando Alas	2	0	31	Armando Gaitan	43	\N	\N
2023-04-28	Palaresia - ASA HOTEL	Lukáš Thor	Balazs Peto	2	0	25	Lukáš Thor	44	\N	\N
2023-04-28	Palaresia - YONEX	Simon Yu Xuan Wang	Alessandro Gimorri	2	0	28	Simon Yu Xuan Wang	44	\N	\N
2023-04-28	Palaresia - GRUBER LOGISTICS	Luuk Vingerhoed	Nathan Nguyen	2	0	30	Luuk Vingerhoed	44	\N	\N
2023-04-28	Palaresia - RAIFFEISEN BOZEN	Thomas Wiesler	Moritz Hopp	2	0	28	Thomas Wiesler	44	\N	\N
2023-04-28	Palaresia - ASSIBROKER	Michael Havlíček	Ziao Zhou	2	0	20	Michael Havlíček	44	\N	\N
2023-04-28	Palaresia - HELL PROFITECHNIK	Matia Dell'Antone	Muhammed Eren Bilgen	2	0	36	Matia Dell'Antone	44	\N	\N
2023-04-28	Palaresia - ASA HOTEL	Lukáš Patzák	Tobias Andergassen	2	0	24	Lukáš Patzák	44	\N	\N
2023-04-28	Palaresia - YONEX	Aaron Waltl	Nikola Hingerl	2	1	50	Aaron Waltl	44	\N	\N
2023-04-28	Palaresia - ASSIBROKER	Kryštof Coufal	Tancredi Virzì	2	0	32	Kryštof Coufal	44	\N	\N
2023-04-28	Palaresia - GRUBER LOGISTICS	Ruben Fellin	Vito Radovanović	2	1	42	Ruben Fellin	44	\N	\N
2023-04-28	Palaresia - ASA HOTEL	Cedric Pascher	Aron Wesian	2	0	31	Cedric Pascher	44	\N	\N
2023-04-28	Palaresia - RAIFFEISEN BOZEN	Abel Balint Kiss	Victor Gunnlert	2	0	28	Abel Balint Kiss	44	\N	\N
2023-04-28	Palaresia - HELL PROFITECHNIK	Yordan Yordanov	Liam Birahij	2	0	26	Yordan Yordanov	44	\N	\N
2023-04-28	Palaresia - ASSIBROKER	Filip Titěra	Zeno Agai	2	1	36	Filip Titěra	44	\N	\N
2023-04-28	Palaresia - YONEX	Vince Felix Boros	Daniele Segato	2	1	37	Vince Felix Boros	44	\N	\N
2023-04-28	Palaresia - ASA HOTEL	Alejandro Valdés	Alex Bianchi	2	0	24	Alejandro Valdés	44	\N	\N
2023-04-28	Palaresia - HELL PROFITECHNIK	Davide Izzo	Thomas Gintz	2	0	37	Davide Izzo	44	\N	\N
2023-04-28	Palaresia - RAIFFEISEN BOZEN	Tobias Niemi Ström	Patrik Dimitrov	2	0	33	Tobias Niemi Ström	44	\N	\N
2023-04-28	Palaresia - GRUBER LOGISTICS	Simon Sutterlütti	Patrik Karamatić	2	1	42	Simon Sutterlütti	44	\N	\N
2023-04-28	Palaresia - ASSIBROKER	Dion Hoegen	Giuseppe Alì Anas Vitale	2	0	22	Dion Hoegen	44	\N	\N
2023-04-28	Palaresia - ASA HOTEL	Jakob Sjöblom	Massimo Grotti	2	0	27	Jakob Sjöblom	44	\N	\N
2023-04-28	Palaresia - YONEX	Adam Srnec	Teodor Mitev	2	1	44	Adam Srnec	44	\N	\N
2023-04-28	Palaresia - HELL PROFITECHNIK	Ruben Carreras	Toms Sala	2	1	49	Ruben Carreras	44	\N	\N
2023-04-28	Palaresia - ASSIBROKER	Alexander Philipp Zhang	Jakub Klokan	2	0	29	Alexander Philipp Zhang	44	\N	\N
2023-04-29	-	Michael Havlíček	Marek Čepela (Walkover)	0	0	0	Michael Havlíček	44	\N	\N
2023-04-29	Palaresia - GRUBER LOGISTICS	Matia Dell'Antone	Aaron Waltl	2	1	35	Matia Dell'Antone	44	\N	\N
2023-04-29	Palaresia - YONEX	Kryštof Coufal	Simon Yu Xuan Wang	2	0	21	Kryštof Coufal	44	\N	\N
2023-04-29	Palaresia - RAIFFEISEN BOZEN	Davide Izzo	Tobias Niemi Ström	2	0	26	Davide Izzo	44	\N	\N
2023-04-29	Palaresia - HELL PROFITECHNIK	Alejandro Gallego	Thomas Wiesler	2	0	18	Alejandro Gallego	44	\N	\N
2023-04-29	Palaresia - ASSIBROKER	Dion Hoegen	Simon Sutterlütti	2	0	17	Dion Hoegen	44	\N	\N
2023-04-29	Palaresia - ASA HOTEL	Tiago Berenguer	Ruben Fellin	2	0	22	Tiago Berenguer	44	\N	\N
2023-04-29	Palaresia - YONEX	Lukáš Thor	Abel Balint Kiss	2	0	22	Lukáš Thor	44	\N	\N
2023-04-29	Palaresia - ASSIBROKER	Raul Bergua	Yordan Yordanov	2	0	35	Raul Bergua	44	\N	\N
2023-04-29	Palaresia - HELL PROFITECHNIK	Lukáš Patzák	Cedric Pascher	2	0	21	Lukáš Patzák	44	\N	\N
2023-04-29	Palaresia - GRUBER LOGISTICS	Filip Titěra	Valerian Eckert	2	0	25	Filip Titěra	44	\N	\N
2023-04-29	Palaresia - RAIFFEISEN BOZEN	Luuk Vingerhoed	Vince Felix Boros	2	0	24	Luuk Vingerhoed	44	\N	\N
2023-04-29	Palaresia - ASA HOTEL	Gonzalo Isabal	Jakob Sjöblom	2	0	22	Gonzalo Isabal	44	\N	\N
2023-04-29	Palaresia - HELL PROFITECHNIK	Ruben Carreras	Adam Srnec	2	1	49	Ruben Carreras	44	\N	\N
2023-04-29	Palaresia - GRUBER LOGISTICS	Luca-Stefan Pandele	Alexander Philipp Zhang	2	0	22	Luca-Stefan Pandele	44	\N	\N
2023-04-29	Palaresia - GRUBER LOGISTICS	Tiago Berenguer	Lukáš Thor	2	0	28	Tiago Berenguer	44	\N	\N
2023-04-29	Palaresia - YONEX	Lukáš Patzák	Raul Bergua	2	0	40	Lukáš Patzák	44	\N	\N
2023-04-29	Palaresia - ASA HOTEL	Michael Havlíček	Matia Dell'Antone	2	0	20	Michael Havlíček	44	\N	\N
2023-04-29	Palaresia - RAIFFEISEN BOZEN	Kryštof Coufal	Filip Titěra	2	0	22	Kryštof Coufal	44	\N	\N
2023-04-29	Palaresia - GRUBER LOGISTICS	Alejandro Gallego	Davide Izzo	2	0	24	Alejandro Gallego	44	\N	\N
2023-04-29	Palaresia - ASA HOTEL	Dion Hoegen	Gonzalo Isabal	2	1	42	Dion Hoegen	44	\N	\N
2023-04-29	Palaresia - HELL PROFITECHNIK	Luca-Stefan Pandele	Ruben Carreras	2	1	37	Luca-Stefan Pandele	44	\N	\N
2023-04-29	Palaresia - ASSIBROKER	Tiago Berenguer	Lukáš Patzák	2	0	25	Tiago Berenguer	44	\N	\N
2023-04-29	Palaresia - RAIFFEISEN BOZEN	Kryštof Coufal	Michael Havlíček	2	1	40	Kryštof Coufal	44	\N	\N
2023-04-29	Palaresia - RAIFFEISEN BOZEN	Alejandro Gallego	Zyver John De Leon	2	1	48	Alejandro Gallego	44	\N	\N
2023-04-29	Palaresia - ASSIBROKER	Luca-Stefan Pandele	Dion Hoegen	2	0	23	Luca-Stefan Pandele	44	\N	\N
2023-04-30	Palaresia - ASA HOTEL	Luca-Stefan Pandele	Tiago Berenguer	2	1	46	Luca-Stefan Pandele	44	\N	\N
2023-04-30	Palaresia - ASA HOTEL	Tiago Berenguer	Kryštof Coufal	2	0	22	Tiago Berenguer	44	\N	\N
2023-04-30	Palaresia - HELL PROFITECHNIK	Luca-Stefan Pandele	Alejandro Gallego	2	0	19	Luca-Stefan Pandele	44	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Nolan Chanthakesone	Petr Bříza	2	0	26	Nolan Chanthakesone	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 1	Luca-Stefan Pandele	Thomas Gintz	2	0	30	Luca-Stefan Pandele	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Adam Medin	Max Pfanz-Sponagel	2	0	25	Adam Medin	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Luc Thalmann	Tim Schmitz	2	0	27	Luc Thalmann	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 4	Praneel Reddy Vallapureddy	Gino Monopoli	2	0	24	Praneel Reddy Vallapureddy	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Ruben Fellin	Aron Wesian	2	0	24	Ruben Fellin	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 2	Matia Dell'Antone	Nathan Nguyen	2	0	41	Matia Dell'Antone	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 1	Hugo Chanthakesone	Vojtěch Strejček	2	0	31	Hugo Chanthakesone	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 5	Nicolas Briancourt	Luis Dallhammer	2	0	25	Nicolas Briancourt	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 4	Lian Ubieto	Valerian Eckert	2	1	45	Lian Ubieto	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Kryštof Klíma	Nikola Hingerl	2	0	27	Kryštof Klíma	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 1	Ole Schroth	Shangxi Olivier Song	2	1	52	Ole Schroth	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 5	Adam Srnec	Philipp Ofner	2	0	24	Adam Srnec	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 2	Martin Pho	Jonas Senn	2	1	39	Martin Pho	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Arda Dogac Atan	Arthur Phengphachanh	2	0	41	Arda Dogac Atan	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 5	Pranav Erukattil	Dion Hijdra	2	0	21	Pranav Erukattil	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Zhi Lun Ong	Shangzu Zhan	2	1	44	Zhi Lun Ong	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 5	Kryštof Coufal	Tristan Inhoven	2	0	26	Kryštof Coufal	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 1	Felix Schütt	Paul Massias	2	1	53	Felix Schütt	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 2	Felix Ekstrand	Vincent Hofmeister	2	0	25	Felix Ekstrand	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 4	Alexander Philipp Zhang	Zeno Baldegger	2	0	29	Alexander Philipp Zhang	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 5	William Fjällby	Samuel Seitz	2	1	40	William Fjällby	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Leo Crelier	Roman Phu	2	1	50	Leo Crelier	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 2	Tobias Andergassen	Mael Fellay	2	0	28	Tobias Andergassen	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Muhammed Eren Bilgen	Lio Spohn	2	0	30	Muhammed Eren Bilgen	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 4	Lukáš Patzák	Oliver Truchanowicz Schwarz	2	0	21	Lukáš Patzák	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 1	Felix Ma	Elias Elgazri	2	0	35	Felix Ma	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 2	Quinn Jens	Thomas Wiesler	2	1	46	Quinn Jens	47	\N	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Marek Čepela	Nils Schneider	2	0	25	Marek Čepela	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Luca-Stefan Pandele	Adam Medin	2	0	28	Luca-Stefan Pandele	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Luc Thalmann	Praneel Reddy Vallapureddy	2	0	36	Luc Thalmann	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 1	Ruben Fellin	Matia Dell'Antone	2	0	34	Ruben Fellin	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 2	Hugo Chanthakesone	Nicolas Briancourt	2	1	39	Hugo Chanthakesone	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 5	Kryštof Klíma	Ole Schroth	2	0	30	Kryštof Klíma	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Adam Srnec	Martin Pho	2	0	14	Adam Srnec	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 1	Nolan Chanthakesone	Arda Dogac Atan	2	1	58	Nolan Chanthakesone	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Pranav Erukattil	Toms Sala	2	0	31	Pranav Erukattil	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Kryštof Coufal	Zhi Lun Ong	2	0	31	Kryštof Coufal	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 2	Felix Ekstrand	Felix Schütt	2	1	44	Felix Ekstrand	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 5	Leo Crelier	William Fjällby	2	0	29	Leo Crelier	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Muhammed Eren Bilgen	Tobias Andergassen	2	0	27	Muhammed Eren Bilgen	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 4	Lukáš Patzák	Felix Ma	2	1	58	Lukáš Patzák	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Marek Čepela	Quinn Jens	2	0	21	Marek Čepela	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Luca-Stefan Pandele	Luc Thalmann	2	0	32	Luca-Stefan Pandele	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 2	Ruben Fellin	Hugo Chanthakesone	2	1	40	Ruben Fellin	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 1	Nolan Chanthakesone	Adam Srnec	2	1	36	Nolan Chanthakesone	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 4	Pranav Erukattil	Kryštof Coufal	2	1	70	Pranav Erukattil	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 6	Leo Crelier	Muhammed Eren Bilgen	2	1	53	Leo Crelier	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Marek Čepela	Lukáš Patzák	2	0	11	Marek Čepela	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 4	Luca-Stefan Pandele	Ruben Fellin	2	0	37	Luca-Stefan Pandele	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 1	Nolan Chanthakesone	Noel Tappeiner	2	0	31	Nolan Chanthakesone	47	\N	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Marek Čepela	Leo Crelier	2	0	28	Marek Čepela	47	\N	\N
2023-05-07	Badmintonhalle Vorarlberg - 2	Luca-Stefan Pandele	Marek Čepela	2	1	45	Luca-Stefan Pandele	47	\N	\N
2023-05-07	Badmintonhalle Vorarlberg - 2	Luca-Stefan Pandele	Nolan Chanthakesone	2	1	52	Luca-Stefan Pandele	47	\N	\N
2023-05-07	Badmintonhalle Vorarlberg - 1	Marek Čepela	Serhii Marushchak	2	0	29	Marek Čepela	47	\N	\N
2023-05-12	Sportenum - 4	Eric Teller	Almalki Fahad	2	0	16	Eric Teller	49	\N	\N
2023-05-12	Sportenum - 2	Paul Massias	Hugo Chanthakesone	2	0	23	Paul Massias	49	\N	\N
2023-05-12	Sportenum - 3	Thomas Valther	Zhi Lun Ong	2	0	29	Thomas Valther	49	\N	\N
2023-05-12	Sportenum - 4	Lian Ubieto	Arthur Miauton	2	0	28	Lian Ubieto	49	\N	\N
2023-05-12	Sportenum - 2	Mark Obermeier	Matts Croes	2	0	27	Mark Obermeier	49	\N	\N
2023-05-12	Sportenum - 1	Arnaud Boschung	Artem Lytvynenko	2	1	28	Arnaud Boschung	49	\N	\N
2023-05-12	Sportenum - 5	Hugo Themas	Roman Phu	2	0	19	Hugo Themas	49	\N	\N
2023-05-12	Sportenum - 4	Dev Vishnu	Abdulaziz Almuqahwi	2	0	17	Dev Vishnu	49	\N	\N
2023-05-12	Sportenum - 2	Amer Mohammed	Danial Iman Marzuan	2	0	32	Amer Mohammed	49	\N	\N
2023-05-12	Sportenum - 1	Jakob Rinner	Dillon Chong	2	0	29	Jakob Rinner	49	\N	\N
2023-05-12	Sportenum - 3	Leo Boichat	Chris Robin Talts	2	0	26	Leo Boichat	49	\N	\N
2023-05-12	Sportenum - 1	Arnaud Huberty	Fionn Fallah	2	0	23	Arnaud Huberty	49	\N	\N
2023-05-12	Sportenum - 4	Yuri Cho	Matteo Galati	2	0	23	Yuri Cho	49	\N	\N
2023-05-12	Sportenum - 5	Basile Berthomier	Felix Ekstrand	2	0	30	Basile Berthomier	49	\N	\N
2023-05-12	Sportenum - 2	Luca Wiechmann	Rayan Almukhimer	2	0	23	Luca Wiechmann	49	\N	\N
2023-05-12	Sportenum - 1	Martin Harbo	Titouan Emond	2	0	33	Martin Harbo	49	\N	\N
2023-05-12	Sportenum - 2	Jan Huttenloch	Heorhii Antropov	2	0	24	Jan Huttenloch	49	\N	\N
2023-05-12	Sportenum - 5	Ilija Nicolussi	Florian Otto	2	0	24	Ilija Nicolussi	49	\N	\N
2023-05-12	Sportenum - 4	Rafe Kenji Braach	Loic Schneider	2	0	29	Rafe Kenji Braach	49	\N	\N
2023-05-12	Sportenum - 3	Alexander Becsh	Andrei Schmidt	2	0	35	Alexander Becsh	49	\N	\N
2023-05-12	Sportenum - 1	Anthony Gourdon	Leander Züst	2	0	23	Anthony Gourdon	49	\N	\N
2023-05-13	Sportenum - 3	Mark Obermeier	Arnaud Boschung	2	0	22	Mark Obermeier	49	\N	\N
2023-05-13	Sportenum - 5	Basile Berthomier	Yuri Cho	2	1	55	Basile Berthomier	49	\N	\N
2023-05-13	Sportenum - 1	Eric Teller	Paul Massias	2	1	43	Eric Teller	49	\N	\N
2023-05-13	Sportenum - 4	Amer Mohammed	Lian Ubieto	2	0	27	Amer Mohammed	49	\N	\N
2023-05-13	Sportenum - 5	Ilija Nicolussi	Jan Huttenloch	2	0	19	Ilija Nicolussi	49	\N	\N
2023-05-13	Sportenum - 2	Dev Vishnu	Thomas Valther	2	0	27	Dev Vishnu	49	\N	\N
2023-05-13	Sportenum - 3	Alexander Becsh	Rafe Kenji Braach	2	0	33	Alexander Becsh	49	\N	\N
2023-05-13	Sportenum - 2	Dev Vishnu	Luis Pongratz	2	0	38	Dev Vishnu	49	\N	\N
2023-05-13	Sportenum - 2	Mark Obermeier	Amer Mohammed	2	0	34	Mark Obermeier	49	\N	\N
2023-05-13	Sportenum - 4	Dev Vishnu	Baptiste Rolin	2	1	48	Dev Vishnu	49	\N	\N
2023-05-13	Sportenum - 4	Baptiste Rolin	Eric Teller	2	0	26	Baptiste Rolin	49	96561	\N
2023-05-19	Sport hall Marino Cvetković - 5	Alejandro Gallego	Balazs Csernyanszki	2	0	39	Alejandro Gallego	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Michael Havlíček	Pol Feltes	2	0	23	Michael Havlíček	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Zeno Agai	Maks Ian Mattias	2	0	27	Zeno Agai	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 3	Peter Palkovics	Petr Bříza	2	1	40	Peter Palkovics	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Lukáš Patzák	Ruben Carreras	2	0	37	Lukáš Patzák	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Davide Izzo	Jarno Deters	2	0	35	Davide Izzo	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 5	Marek Čepela	Roel Pipeleers	2	0	27	Marek Čepela	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Massimo Grotti	Luca Perfido	2	0	23	Massimo Grotti	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Erik Hajdu	Tobias Andergassen	2	0	24	Erik Hajdu	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Gonzalo Isabal	Oliver Truchanowicz Schwarz	2	0	31	Gonzalo Isabal	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 5	Jakub Klokan	Shangzu Zhan	2	0	33	Jakub Klokan	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Marti Joost	Nikita Peshekhonov	2	1	47	Marti Joost	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 3	Lukáš Thor	Vlad Dehelean	2	0	24	Lukáš Thor	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Mats Wohlers	Edvards Oskalns	2	0	37	Mats Wohlers	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Alex Petrovic	Thomas Wiesler	2	0	27	Alex Petrovic	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 5	Emre Mutlu	Sam Reinert	2	0	25	Emre Mutlu	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 3	Yordan Yordanov	Adam Srnec	2	0	29	Yordan Yordanov	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Vojtěch Strejček	Aurel Pulcinella	2	0	22	Vojtěch Strejček	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Kryštof Coufal	Cesar Rodrigues	2	0	24	Kryštof Coufal	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Aron Wesian	Alessio Catalfamo	2	0	37	Aron Wesian	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 5	Filip Titěra	Tsvetan Ivanov	2	1	55	Filip Titěra	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 3	Viktor Patteet	Kryštof Klíma	2	1	53	Viktor Patteet	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Raul Bergua	Adam Balogh	2	0	24	Raul Bergua	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Vid Tomazin	Petr Martinec	2	0	30	Vid Tomazin	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 2	Andrej Suchy	Mario Rodriguez	2	1	51	Andrej Suchy	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 4	Dennis Kerpl	Tevž Ornik	2	0	36	Dennis Kerpl	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Milan Mesterhazy	Vito Radovanović	2	0	24	Milan Mesterhazy	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 5	Vince Felix Boros	Saku Yoshioka	2	1	36	Vince Felix Boros	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 3	George Alexandru Mocan	Andrej Macek	2	0	23	George Alexandru Mocan	52	\N	\N
2023-05-19	Sport hall Marino Cvetković - 1	Micah Melis	Felix Wohlers	2	0	31	Micah Melis	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	Alejandro Gallego	Peter Palkovics	2	0	10	Alejandro Gallego	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Marek Čepela	Marti Joost	2	1	14	Marek Čepela	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 4	Raul Bergua	Emre Mutlu	2	0	39	Raul Bergua	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 1	Milan Mesterhazy	Vladyslav Kunin	2	0	24	Milan Mesterhazy	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	Michael Havlíček	Zeno Agai	2	0	26	Michael Havlíček	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Peter Palkovics	Davide Izzo	2	1	40	Peter Palkovics	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 3	Marek Čepela	Massimo Grotti	2	0	27	Marek Čepela	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Alejandro Gallego	Erik Hajdu	2	0	26	Alejandro Gallego	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 3	Gonzalo Isabal	Lukáš Patzák	2	1	54	Gonzalo Isabal	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 4	Lukáš Thor	Alex Petrovic	2	0	36	Lukáš Thor	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	Emre Mutlu	Yordan Yordanov	2	0	30	Emre Mutlu	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Marti Joost	Mats Wohlers	2	0	28	Marti Joost	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 1	Vojtěch Strejček	Kryštof Coufal	2	1	49	Vojtěch Strejček	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	Filip Titěra	Aron Wesian	2	0	27	Filip Titěra	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Raul Bergua	Viktor Patteet	2	0	42	Raul Bergua	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 4	Andrej Suchy	Vid Tomazin	2	0	34	Andrej Suchy	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 3	Milan Mesterhazy	Dennis Kerpl	2	0	24	Milan Mesterhazy	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	George Alexandru Mocan	Vince Felix Boros	2	0	22	George Alexandru Mocan	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 4	Alejandro Gallego	Michael Havlíček	2	1	57	Alejandro Gallego	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 3	Peter Palkovics	Gonzalo Isabal	2	1	58	Peter Palkovics	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Marek Čepela	Yegor Romaniuk	2	0	31	Marek Čepela	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 1	Marti Joost	Lukáš Thor	2	0	35	Marti Joost	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 5	Emre Mutlu	Vojtěch Strejček	2	1	19	Emre Mutlu	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 2	Raul Bergua	Filip Titěra	2	0	32	Raul Bergua	52	\N	\N
2023-05-20	Sport hall Marino Cvetković - 4	Milan Mesterhazy	Andrej Suchy	2	0	34	Milan Mesterhazy	52	\N	\N
2023-05-21	Sport hall Marino Cvetković - 2	Raul Bergua	Marek Čepela	2	1	49	Raul Bergua	52	\N	\N
2023-05-21	Sport hall Marino Cvetković - 2	Marek Čepela	Alejandro Gallego	2	1	43	Marek Čepela	52	\N	\N
2023-05-21	Sport hall Marino Cvetković - 4	Raul Bergua	Milan Mesterhazy	2	0	41	Raul Bergua	52	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 2. Podlaskie	Tymoteusz Cybulski	Priit Põder	2	1	36	Tymoteusz Cybulski	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 5. MSiT	Matija Berce	Rokas Lesinskas	2	0	24	Matija Berce	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 4. Yonex	Frederik Hinding	Kuba Zagozdzon	2	0	17	Frederik Hinding	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 1. Białystok	Sebastian Pinkowicz	Michael Havlíček	2	0	24	Sebastian Pinkowicz	54	\N	\N
2023-05-25	-	Gino Monopoli	Tsvetan Ivanov (Walkover)	0	0	0	Gino Monopoli	54	\N	\N
2023-05-24	Axiata Arena - Court 2	Anthony Sinisuka Ginting	Wang Tzu Wei	2	0	37	Anthony Sinisuka Ginting	53	95661	\N
2023-05-25	Sports Hall of Agricultural School Complex - 5. MSiT	Tomasz Koperdowski	Jayaditya Kumar	2	0	27	Tomasz Koperdowski	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 1. Białystok	Igor Skolimowski	Oskar Laanes	2	0	22	Igor Skolimowski	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 2. Podlaskie	Nojus Tenikaitis	Lourenco Pinto	2	0	15	Nojus Tenikaitis	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 3. SportLen	Adam Winciaszek	Sargis Hovhannisyan	2	0	14	Adam Winciaszek	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 2. Podlaskie	Kacper Pachucki	Erik Hajdu	2	1	32	Kacper Pachucki	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 5. MSiT	Jakub Sidor	Karl Mattias Pedai	2	0	21	Jakub Sidor	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 1. Białystok	Anton Druzhchenko	Artyom Hovhannisyan	2	0	22	Anton Druzhchenko	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 4. Yonex	Sonish Hathi	Bartosz Kufel	2	0	22	Sonish Hathi	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 3. SportLen	Adam Srnec	Martin Pho	2	0	17	Adam Srnec	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 5. MSiT	Alexandre Bernardo	Kamil Markus	2	0	23	Alexandre Bernardo	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 1. Białystok	Andrej Suchy	Rafal Mielnik	2	1	40	Andrej Suchy	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 4. Yonex	Andrej Macek	Vahe Hayrapetyan	2	0	16	Andrej Macek	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 3. SportLen	Mikkel Eilersen Bouet	Dominik Tankevic	2	0	17	Mikkel Eilersen Bouet	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 2. Podlaskie	Kaspar Sorge	Szymon Walecki	2	0	21	Kaspar Sorge	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 4. Yonex	Alex Petrovic	Tymofii Kadiemin	2	1	45	Alex Petrovic	54	\N	\N
2023-05-25	-	Daniel Leonovic	Bartosz Punko (Walkover)	0	0	0	Daniel Leonovic	54	\N	\N
2023-05-25	-	Danil Sedov	Patrik Dimitrov (Walkover)	0	0	0	Danil Sedov	54	\N	\N
2023-05-25	Sports Hall of Agricultural School Complex - 3. SportLen	Jan Szeszko	Rasmus Roogsoo	2	1	35	Jan Szeszko	54	\N	\N
2023-05-25	-	Jakub Dulemba	Aarav Sujith (Walkover)	0	0	0	Jakub Dulemba	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Marti Joost	Matija Berce	2	0	28	Marti Joost	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 3. SportLen	Sebastian Pinkowicz	Yegor Romaniuk	2	0	25	Sebastian Pinkowicz	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Adam Srnec	Andrej Macek	2	0	21	Adam Srnec	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Andrej Suchy	Vladyslav Kunin	2	0	21	Andrej Suchy	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Fedir Tiurin	Jakub Dulemba	2	0	19	Fedir Tiurin	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Alexandre Bernardo	Tymoteusz Cybulski	2	0	20	Alexandre Bernardo	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 3. SportLen	Igor Skolimowski	Nojus Tenikaitis	2	1	56	Igor Skolimowski	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Mikkel Eilersen Bouet	Serhii Marushchak	2	0	36	Mikkel Eilersen Bouet	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Danil Sedov	Jan Szeszko	2	0	23	Danil Sedov	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Anton Druzhchenko	Jakub Sidor	2	0	32	Anton Druzhchenko	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Frederik Hinding	Kacper Pachucki	2	0	18	Frederik Hinding	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Sonish Hathi	Gino Monopoli	2	0	19	Sonish Hathi	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Alex Petrovic	Kaspar Sorge	2	0	25	Alex Petrovic	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Adam Winciaszek	Daniel Leonovic	2	0	24	Adam Winciaszek	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Sebastian Pinkowicz	Sonish Hathi	2	0	43	Sebastian Pinkowicz	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Adam Winciaszek	Alex Petrovic	2	0	26	Adam Winciaszek	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Frederik Hinding	Marti Joost	2	0	31	Frederik Hinding	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Anton Druzhchenko	Andrej Suchy	2	0	30	Anton Druzhchenko	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Mikkel Eilersen Bouet	Igor Skolimowski	2	0	25	Mikkel Eilersen Bouet	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 5. MSiT	Fedir Tiurin	Danil Sedov	2	0	22	Fedir Tiurin	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 3. SportLen	Sebastian Pinkowicz	Anton Druzhchenko	2	0	27	Sebastian Pinkowicz	54	\N	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Fedir Tiurin	Adam Winciaszek	2	0	24	Fedir Tiurin	54	\N	\N
2023-05-27	Sports Hall of Agricultural School Complex - 1. Białystok	Fedir Tiurin	Vladyslav Stepanchenko	2	1	32	Fedir Tiurin	54	\N	\N
2023-05-27	Sports Hall of Agricultural School Complex - 1. Białystok	Fedir Tiurin	Ivan Tsaregorotsev	1	1	33	Fedir Tiurin	54	\N	\N
2023-05-31	Center of Badminton - 3	Mehad Shaikh	Khaitmurat Kulmatov	2	0	36	Mehad Shaikh	57	\N	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Jose Rendon	Olmos Martin	2	0	20	Jose Rendon	59	\N	\N
\N	-	Allan Zeng	Rajesh Srikar (Walkover)	0	0	0	Allan Zeng	61	32769	\N
2023-06-08	Virgilio TRavieso Soto - 2	Armando Gaitan	Jadon Tsang	2	0	29	Armando Gaitan	63	\N	\N
2023-06-08	Virgilio TRavieso Soto - 3	Armando Gaitan	Justin Ma	2	1	69	Armando Gaitan	63	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 4	Maxance Liraud	Florian Dietrich	2	0	25	Maxance Liraud	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 2	Blair Tait	Vincent Hofmeister	2	0	28	Blair Tait	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 3	Aske Rømer Roslyng	Nils Barion	2	0	21	Aske Rømer Roslyng	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 6	Arush Ravikumar	Jarno Deters	2	0	27	Arush Ravikumar	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 1	Valentin Roulleau	Lio Spohn	2	0	27	Valentin Roulleau	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 4	Matija Berce	Tim Schmitz	2	0	34	Matija Berce	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 5	Ivan Dzhus	Cornelius Wolf	2	0	28	Ivan Dzhus	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 2	Thomas Gintz	Felix Jianheng Luo	2	0	25	Thomas Gintz	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 3	Clément Massias	Luis Haupt	2	1	40	Clément Massias	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 5	Luc Thalmann	Jari Hannes	2	0	24	Luc Thalmann	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 6	Tom Klein	Loic Gosset	2	1	53	Tom Klein	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 1	Felix Schütt	Christoffer K. Andersen	2	0	25	Felix Schütt	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 4	Simon Torp Kristensen	Marwin Roschild	2	0	25	Simon Torp Kristensen	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 2	Adam Janssens	Oskar Kohli	2	0	29	Adam Janssens	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 1	Shangxi Olivier Song	Christoph Webhofer	2	0	24	Shangxi Olivier Song	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 4	Linus Madsen	Nikola Hingerl	2	0	37	Linus Madsen	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 5	Leo Crelier	Henri Saur	2	1	49	Leo Crelier	65	\N	\N
2023-06-08	Sporthalle Steinbreche - Court 2	Youri Schwarz	Sam Groundwater	2	1	46	Youri Schwarz	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Bartosz Punko	Mika Dörschel	2	0	24	Bartosz Punko	65	\N	\N
2023-06-09	-	Raphael Schreiber	Wojciech Budny (Walkover)	0	0	0	Raphael Schreiber	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 3	Marek Čepela	Fraser Banks	2	0	23	Marek Čepela	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Arush Ravikumar	Michel Schuster	2	0	25	Arush Ravikumar	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 6	Thomas Gintz	Matia Dell'Antone	2	0	31	Thomas Gintz	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Rafe Kenji Braach	Mady Sow	2	0	41	Rafe Kenji Braach	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 2	Sebastian Pinkowicz	Luis Ebert	2	0	21	Sebastian Pinkowicz	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 3	Pranav Erukattil	Rayan Benaissa	2	1	60	Pranav Erukattil	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Clément Massias	Edvin Ståhl	2	1	41	Clément Massias	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 5	Valerian Eckert	Anton Druzhchenko	2	1	52	Valerian Eckert	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 2	Paul Massias	Ludvig Edholm	2	0	32	Paul Massias	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 6	Luc Thalmann	Benjamin Klein	2	0	25	Luc Thalmann	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Viktor Skov Ellegaard	Arnaud Boschung	2	0	34	Viktor Skov Ellegaard	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 6	Benno Oßwald	Maxance Liraud	2	1	52	Benno Oßwald	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 2	Shangxi Olivier Song	Jakob Sjöblom	2	0	29	Shangxi Olivier Song	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Aske Rømer Roslyng	Konstantin Kaprov	2	0	25	Aske Rømer Roslyng	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 5	Valentin Roulleau	Fynn Alfsmann	2	0	34	Valentin Roulleau	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 3	Linus Emmerich	Tom Klein	2	0	28	Linus Emmerich	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 2	Felix Schütt	Nathanael Cossac	2	0	29	Felix Schütt	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Blair Tait	Max Pasquier	2	0	22	Blair Tait	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Leon Kaschura	Matija Berce	2	0	36	Leon Kaschura	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 6	Theo Thillemann	Ivan Dzhus	2	0	29	Theo Thillemann	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 5	Adam Srnec	Tonio Behne	2	0	22	Adam Srnec	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 3	Felix Ma	Fynn Ohliger	2	0	33	Felix Ma	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 2	Linus Madsen	Pranav Vempati	2	1	33	Linus Madsen	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Mattis Gutsche	Leo Crelier	2	0	29	Mattis Gutsche	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 5	Simon Torp Kristensen	Jonas Schmid	2	0	31	Simon Torp Kristensen	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 1	Lenny Bonniere	Callum Jack	2	1	46	Lenny Bonniere	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 6	Arthur Phengphachanh	Adam Janssens	2	0	42	Arthur Phengphachanh	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 3	Nicolas Briancourt	Adrien Strohhecker	2	1	43	Nicolas Briancourt	65	\N	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Youri Schwarz	Jonah Strack	2	1	52	Youri Schwarz	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 2	Marek Čepela	Benno Oßwald	2	0	23	Marek Čepela	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 5	Shangxi Olivier Song	Valerian Eckert	2	1	55	Shangxi Olivier Song	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Bartosz Punko	Arush Ravikumar	2	0	24	Bartosz Punko	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 4	Valentin Roulleau	Viktor Skov Ellegaard	2	1	41	Valentin Roulleau	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 2	Felix Ma	Thomas Gintz	2	0	47	Felix Ma	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 3	Rafe Kenji Braach	Linus Madsen	2	0	32	Rafe Kenji Braach	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Mattis Gutsche	Raphael Schreiber	2	0	29	Mattis Gutsche	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 1	Nicolas Briancourt	Arthur Phengphachanh	2	1	42	Nicolas Briancourt	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Sebastian Pinkowicz	Youri Schwarz	2	0	26	Sebastian Pinkowicz	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 5	Pranav Erukattil	Clément Massias	2	0	45	Pranav Erukattil	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Paul Massias	Luc Thalmann	2	0	48	Paul Massias	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 2	Felix Schütt	Linus Emmerich	2	1	51	Felix Schütt	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 2	Leon Kaschura	Blair Tait	2	0	27	Leon Kaschura	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 3	Adam Srnec	Theo Thillemann	2	0	28	Adam Srnec	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 5	Lenny Bonniere	Simon Torp Kristensen	2	0	36	Lenny Bonniere	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Aske Rømer Roslyng	Noel Tappeiner	2	0	31	Aske Rømer Roslyng	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 3	Marek Čepela	Pranav Erukattil	2	1	56	Marek Čepela	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 1	Aske Rømer Roslyng	Shangxi Olivier Song	2	0	30	Aske Rømer Roslyng	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 4	Bartosz Punko	Paul Massias	2	0	28	Bartosz Punko	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Felix Schütt	Valentin Roulleau	2	1	58	Felix Schütt	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 5	Leon Kaschura	Adam Srnec	2	0	27	Leon Kaschura	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 1	Rafe Kenji Braach	Felix Ma	2	0	33	Rafe Kenji Braach	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 4	Lenny Bonniere	Mattis Gutsche	2	0	21	Lenny Bonniere	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 5	Sebastian Pinkowicz	Nicolas Briancourt	2	0	22	Sebastian Pinkowicz	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 4	Aske Rømer Roslyng	Marek Čepela	2	0	29	Aske Rømer Roslyng	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 6	Bartosz Punko	Felix Schütt	2	1	37	Bartosz Punko	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 1	Leon Kaschura	Rafe Kenji Braach	1	0	32	Leon Kaschura	65	\N	\N
2023-06-10	Sporthalle Steinbreche - Court 3	Sebastian Pinkowicz	Lenny Bonniere	2	1	67	Sebastian Pinkowicz	65	\N	\N
2023-06-11	Sporthalle Steinbreche - Court 1	Aske Rømer Roslyng	Bartosz Punko	2	1	48	Aske Rømer Roslyng	65	\N	\N
2023-06-11	Sporthalle Steinbreche - Court 2	Sebastian Pinkowicz	Leon Kaschura	2	0	27	Sebastian Pinkowicz	65	\N	\N
2023-06-11	Sporthalle Steinbreche - Court 2	Sebastian Pinkowicz	Aske Rømer Roslyng	2	0	27	Sebastian Pinkowicz	65	\N	\N
2023-06-09	-	Veysel Tasdemir	Tiago Berenguer (Walkover)	0	0	0	Veysel Tasdemir	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Hasan Can Arslan	Nikolay Kolev	2	0	17	Hasan Can Arslan	67	\N	\N
2023-06-09	-	Fatih Erdogan	Ilhan Alian (Walkover)	0	0	0	Fatih Erdogan	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 2	Yigitcan Erol	Adam Travinskiy	2	0	21	Yigitcan Erol	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 4	Vladimir Shterev	Muhammed Eren Bilgen	2	0	25	Vladimir Shterev	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Dian Milkov	Yusuf Altintas	2	1	32	Dian Milkov	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 1	Mehmet Can Toremis	Yordan Yordanov	2	0	22	Mehmet Can Toremis	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 2	Arda Dogac Atan	Mahammadali Bayramli	2	0	28	Arda Dogac Atan	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 1	Martin Stratiev	Mehmet Emin Kilic	2	0	21	Martin Stratiev	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 4	Sarkhan Baghirov	Boyan Boev	2	1	34	Sarkhan Baghirov	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Tsvetan Ivanov	Ada Atasoy	2	0	18	Tsvetan Ivanov	67	\N	\N
2023-06-09	-	Gokay Gol	Hristo Yordanov (Walkover)	0	0	0	Gokay Gol	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 1	Ahmet Bera Kus	Georgi Deyanov	2	0	18	Ahmet Bera Kus	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Muhammed Hasim Turksoy	Stiliyan Stoimenov	2	1	44	Muhammed Hasim Turksoy	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 4	Luca-Stefan Pandele	Soner Arda Aydin	2	0	17	Luca-Stefan Pandele	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 1	Hasan Can Arslan	Fatih Erdogan	2	0	20	Hasan Can Arslan	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 2	Luca-Stefan Pandele	Muhammed Hasim Turksoy	2	0	24	Luca-Stefan Pandele	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 4	Yigitcan Erol	Vladimir Shterev	2	0	18	Yigitcan Erol	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Gokay Gol	Martin Stratiev	2	0	19	Gokay Gol	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 1	Arda Dogac Atan	Veysel Tasdemir	2	0	30	Arda Dogac Atan	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 3	Mehmet Can Toremis	Dian Milkov	2	0	15	Mehmet Can Toremis	67	\N	\N
2023-06-09	Sport Hall Svilengrad - 2	Tsvetan Ivanov	Sarkhan Baghirov	2	0	24	Tsvetan Ivanov	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 2	Gokay Gol	Arda Dogac Atan	2	0	38	Gokay Gol	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 2	Mehmet Can Toremis	Luca-Stefan Pandele	2	1	56	Mehmet Can Toremis	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 1	Arda Dogac Atan	Hasan Can Arslan	2	0	23	Arda Dogac Atan	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 4	Gokay Gol	Yigitcan Erol	2	0	29	Gokay Gol	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 1	Mehmet Can Toremis	Tsvetan Ivanov	2	0	29	Mehmet Can Toremis	67	\N	\N
2023-06-10	Sport Hall Svilengrad - 4	Luca-Stefan Pandele	Shon Leitman	2	0	28	Luca-Stefan Pandele	67	\N	\N
2023-06-11	Sport Hall Svilengrad - 1	Mehmet Can Toremis	Gokay Gol	2	0	31	Mehmet Can Toremis	67	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Victor Cañadas	Godfrey Antomarlin	2	0	29	Victor Cañadas	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Alvaro Moran	Oliver Oldorff	2	0	37	Alvaro Moran	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Adrian Gálvez	Louis Morin	2	1	46	Adrian Gálvez	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Kevin Baum	Vicent Molina	2	0	24	Kevin Baum	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Evan Kenny	Nicolas Medrano Valencia (Walkover)	0	0	0	Evan Kenny	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Dev Vishnu	Jonas Pagh Almtoft	2	0	33	Dev Vishnu	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Alejandro Gallego	Hannes Blühdorn	2	0	25	Alejandro Gallego	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Nolhan Rihouey	Pau Muñoz	2	0	30	Nolhan Rihouey	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Jofre Comella	Riyan Malhan	2	1	70	Jofre Comella	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Tadej Jelenc	Sourabh Kulkarni	2	0	34	Tadej Jelenc	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Marc Martin	Eric Teller	2	1	45	Marc Martin	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Nacho Frances	Liron Ubieto	2	1	39	Nacho Frances	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Joan Guasch	Kameshwaran Saravanan	2	0	25	Joan Guasch	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Alejandro Lopez	Wilhelm Astrup Madsen	2	1	65	Alejandro Lopez	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Alvar Melleri	José Luis Nsogo Nguema (Walkover)	0	0	0	Alvar Melleri	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Stithapragnya Reddy Saddi	Raul Bergua	2	0	41	Stithapragnya Reddy Saddi	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Ramon Rovira	Yaidel Gil	2	1	43	Ramon Rovira	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Gines Valles	Vid Koščak	2	1	46	Gines Valles	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Ismael Oballe	Juan Pablo De Siano	2	0	29	Ismael Oballe	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Akseli Aalto	Marc Guasch	2	0	32	Akseli Aalto	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Luca Wiechmann	Marco Terhi	2	1	44	Luca Wiechmann	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Emil Bach	Guillermo Nuviala	2	0	41	Emil Bach	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Basilio Porto	Robbie Frost	2	0	26	Basilio Porto	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Søren Møller	Nicholas Kroath	2	0	28	Søren Møller	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	William Bøgebjerg	Mario Rodriguez	2	0	30	William Bøgebjerg	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Oliver Nicolson	Jesus Ngua Esawong Belica (Walkover)	0	0	0	Oliver Nicolson	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	William Bøgebjerg	Søren Møller	2	0	34	William Bøgebjerg	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Emil Bach	Alejandro Lopez	2	0	36	Emil Bach	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Alvar Melleri	Dillon Chong	2	0	40	Alvar Melleri	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Stithapragnya Reddy Saddi	Alvaro Moran	2	1	73	Stithapragnya Reddy Saddi	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Adrian Gálvez	Ismael Oballe	2	0	29	Adrian Gálvez	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Tadej Jelenc	Kevin Baum	2	1	47	Tadej Jelenc	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Luca Wiechmann	Joan Guasch	2	0	35	Luca Wiechmann	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Marc Martin	Nacho Frances	2	0	18	Marc Martin	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Dev Vishnu	Evan Kenny	2	0	23	Dev Vishnu	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Basilio Porto	Nolhan Rihouey	2	1	7	Basilio Porto	68	\N	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Jofre Comella	Gines Valles	2	0	37	Jofre Comella	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 4	William Bøgebjerg	Luis Pongratz	2	0	40	William Bøgebjerg	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 5	Dev Vishnu	Emil Bach	2	0	37	Dev Vishnu	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 1	Stithapragnya Reddy Saddi	Adrian Gálvez	0	0	16	Stithapragnya Reddy Saddi	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 2	Luca Wiechmann	Marc Martin	2	0	37	Luca Wiechmann	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 4	Stithapragnya Reddy Saddi	Bharath Latheesh	2	0	55	Stithapragnya Reddy Saddi	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 3	Dev Vishnu	Ziga Podgoršek	2	0	32	Dev Vishnu	68	\N	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 3	William Bøgebjerg	Baptiste Rolin	2	0	34	William Bøgebjerg	68	\N	\N
2023-06-11	Pabellón Municipal "Polideportivo Centro" - 2	William Bøgebjerg	Stithapragnya Reddy Saddi	2	0	34	William Bøgebjerg	68	\N	\N
2023-06-11	Pabellón Municipal "Polideportivo Centro" - 2	Stithapragnya Reddy Saddi	Mark Koroša	2	1	90	Stithapragnya Reddy Saddi	68	\N	\N
2023-06-11	Pabellón Municipal "Polideportivo Centro" - 3	William Bøgebjerg	Dev Vishnu	2	0	33	William Bøgebjerg	68	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 1	Hamit Atmaca	David Spitaler	2	0	23	Hamit Atmaca	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 2	Yigitcan Erol	Stefan Zeirov	2	0	23	Yigitcan Erol	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 1	Kerem Acu	Garri Ter-Karapetyan	2	0	16	Kerem Acu	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 2	Arda Dogac Atan	Pol Hild	2	0	21	Arda Dogac Atan	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 4	Bugra Aktas	Giorgi Mzhavia	2	0	13	Bugra Aktas	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 4	Miraç Kantar	Yordan Yordanov	2	0	26	Miraç Kantar	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 1	Arda Oz	Ruben Fellin	2	0	23	Arda Oz	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 2	Tsvetan Ivanov	Muhammed Eren Bilgen	2	0	26	Tsvetan Ivanov	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 3	Mehmet Can Toremis	Nikolay Kolev	2	0	21	Mehmet Can Toremis	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 4	Georgi Kirov	Fatih Erdogan	2	0	23	Georgi Kirov	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 1	Mustafa Samet Tuncer	Patrik Dimitrov	2	0	31	Mustafa Samet Tuncer	69	\N	\N
2023-06-12	Sport Hall "Svilengrad" - 3	Stithapragnya Reddy Saddi	Hasan Can Arslan	2	0	20	Stithapragnya Reddy Saddi	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 2	Stithapragnya Reddy Saddi	Anil Ulaç Atan	2	1	49	Stithapragnya Reddy Saddi	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Yigitcan Erol	Berat Ayindi	2	1	39	Yigitcan Erol	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Kevin Baum	Shon Leitman	2	0	23	Kevin Baum	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Georgi Kirov	Dor Shani	2	0	23	Georgi Kirov	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Noah Warning	Tsvetan Ivanov	2	0	29	Noah Warning	69	\N	\N
2023-06-13	-	Burak Cesitcioglu	Alexander Becsh (Walkover)	0	0	0	Burak Cesitcioglu	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 2	Gokay Gol	Hamit Atmaca	2	1	37	Gokay Gol	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Kerem Acu	Alexander Giuliani	2	0	20	Kerem Acu	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Arda Dogac Atan	Ahmet Bera Kus	2	0	23	Arda Dogac Atan	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Bugra Aktas	Roko Pipunić	2	0	28	Bugra Aktas	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Miraç Kantar	Davide Izzo	2	0	23	Miraç Kantar	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Arda Oz	Stanimir Terziev	2	1	42	Arda Oz	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 2	Mustafa Samet Tuncer	Daniel Tatevosiani	2	0	21	Mustafa Samet Tuncer	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Mehmet Can Toremis	Eyup Eren Bakici	2	0	17	Mehmet Can Toremis	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 2	Stithapragnya Reddy Saddi	Yigitcan Erol	2	0	26	Stithapragnya Reddy Saddi	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Arda Dogac Atan	Georgi Kirov	2	0	19	Arda Dogac Atan	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Noah Warning	Mustafa Samet Tuncer	2	0	26	Noah Warning	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 2	Kevin Baum	Kerem Acu	2	0	30	Kevin Baum	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 4	Bugra Aktas	Adam Travinskiy	2	0	19	Bugra Aktas	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Miraç Kantar	Arda Oz	2	0	25	Miraç Kantar	69	\N	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Mehmet Can Toremis	Burak Cesitcioglu	2	0	21	Mehmet Can Toremis	69	\N	\N
2023-06-14	Sport Hall "Svilengrad" - 1	Mehmet Can Toremis	Bugra Aktas	2	0	25	Mehmet Can Toremis	69	\N	\N
2023-06-14	Sport Hall "Svilengrad" - 3	Arda Dogac Atan	Kevin Baum	2	0	31	Arda Dogac Atan	69	\N	\N
2023-06-14	Sport Hall "Svilengrad" - 1	Bugra Aktas	Miraç Kantar	2	0	34	Bugra Aktas	69	\N	\N
2023-06-14	Sport Hall "Svilengrad" - 1	Mehmet Can Toremis	Noah Warning	2	0	28	Mehmet Can Toremis	69	\N	\N
\N	-	Cho Geonyeop	Tukum Laa (Walkover)	0	0	0	Cho Geonyeop	71	89595	\N
2023-06-15	Teodoro Palacios Flores - 2	Carlos Guillermo Ramirez	Ermerson Moises Navarro Villatoro	2	0	20	Carlos Guillermo Ramirez	72	\N	\N
2023-06-15	Teodoro Palacios Flores - 2	Jorge Andrés Villeda Solis	Cristian Humblers Samayoa	2	0	43	Jorge Andrés Villeda Solis	72	\N	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Muhammad Sultan Nurhabibu Mayang	Jose Rendon	2	0	21	Muhammad Sultan Nurhabibu Mayang	73	\N	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Muhammad Sultan Nurhabibu Mayang	Eason Wong	2	0	25	Muhammad Sultan Nurhabibu Mayang	73	\N	\N
2023-06-16	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Muhammad Sultan Nurhabibu Mayang	Kevin Arokia Walter	2	0	46	Muhammad Sultan Nurhabibu Mayang	73	\N	\N
2023-06-17	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Muhammad Sultan Nurhabibu Mayang	Mark Shelley Alcala	2	0	58	Muhammad Sultan Nurhabibu Mayang	73	\N	\N
2023-06-18	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Muhammad Sultan Nurhabibu Mayang	Muhammad Halim As Sidiq	2	1	90	Muhammad Sultan Nurhabibu Mayang	73	\N	\N
2023-06-21	Tian-Mu Arena - Court 4	Lin Chun-Yi	Chia Hao Lee	2	0	43	Lin Chun-Yi	78	86114	\N
\N	-	Song Renxu	Battugs Bayarsaikhan	2	1	41	Song Renxu	76	\N	\N
\N	-	Zi Hin Chong	Bymbadorj Lkhgvasuren	2	0	19	Zi Hin Chong	76	\N	\N
\N	-	Usukh-Ireedui Uulensolongo	Munkhbayar Mergen	2	0	20	Usukh-Ireedui Uulensolongo	76	\N	\N
\N	-	Chua Min Han	Bumbayar Erdenechimeg	2	0	18	Chua Min Han	76	\N	\N
\N	-	Tay Ron Hsien Justin	Turmunkh Purevochir	2	0	14	Tay Ron Hsien Justin	76	\N	\N
\N	-	Wei Yann Kuan	Khishigchuluun Dulguun	2	0	20	Wei Yann Kuan	76	\N	\N
\N	-	Odbayar Bishrelt-Erdene	Erdem Munkhtur	2	0	23	Odbayar Bishrelt-Erdene	76	\N	\N
\N	-	Khoh Ren Jen	Anand Zorigt	2	0	19	Khoh Ren Jen	76	\N	\N
2023-06-22	-	Odbayar Bishrelt-Erdene	Enkh-Orshikh Dawaadorj	2	0	20	Odbayar Bishrelt-Erdene	76	\N	\N
2023-06-22	National Sports Complex - 2	Wei Yann Kuan	Altanhuyag Tamir	2	0	20	Wei Yann Kuan	76	\N	\N
2023-06-22	National Sports Complex - 3	Lee Tao Ong	Temuulen Eriintovch	2	0	16	Lee Tao Ong	76	\N	\N
2023-06-22	National Sports Complex - 1	Chua Min Han	Usukh-Ireedui Uulensolongo	2	0	19	Chua Min Han	76	\N	\N
2023-06-22	National Sports Complex - 1	Tay Ron Hsien Justin	Chu Chen Lin	2	0	30	Tay Ron Hsien Justin	76	\N	\N
2023-06-23	National Sports Complex - 3	Tay Ron Hsien Justin	Wei Yann Kuan	2	0	20	Tay Ron Hsien Justin	76	\N	\N
2023-06-22	Teodoro Palacios Flores - 1	Muhammad Sultan Nurhabibu Mayang	Andy Rodrigo Ferguharson Alfaro	2	0	20	Muhammad Sultan Nurhabibu Mayang	77	\N	\N
2023-06-22	Teodoro Palacios Flores - 1	Muhammad Sultan Nurhabibu Mayang	Rui Sato	2	0	26	Muhammad Sultan Nurhabibu Mayang	77	\N	\N
2023-06-23	Teodoro Palacios Flores - 1	Muhammad Sultan Nurhabibu Mayang	Daigo Tanioka	2	0	39	Muhammad Sultan Nurhabibu Mayang	77	\N	\N
2023-06-24	Teodoro Palacios Flores - 1	Muhammad Sultan Nurhabibu Mayang	Kaito Sugawara	2	0	34	Muhammad Sultan Nurhabibu Mayang	77	\N	\N
2023-06-25	Teodoro Palacios Flores - 1	Muhammad Sultan Nurhabibu Mayang	Mark Shelley Alcala	2	0	41	Muhammad Sultan Nurhabibu Mayang	77	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Luca-Stefan Pandele	Mehmet Can Toremis	2	1	44	Luca-Stefan Pandele	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Jonas Schmid	Zeno Agai	2	1	32	Jonas Schmid	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Dragos Gabriel Nita	Cesar Rodrigues	2	0	20	Dragos Gabriel Nita	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Alex Petrovic	Abel Balint Kiss	2	0	26	Alex Petrovic	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Arsene Serre	Matic Cerar	2	0	22	Arsene Serre	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Yordan Yordanov	Petr Martinec	2	0	26	Yordan Yordanov	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Kryštof Klíma	Adam Travinskiy	2	1	31	Kryštof Klíma	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Andrej Macek	Zsombor Erdos	2	1	42	Andrej Macek	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Tevž Ornik	Mehmet Emin Kilic	2	1	42	Tevž Ornik	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Vlad Dehelean	Patrik Karamatić	2	0	23	Vlad Dehelean	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Milan Mesterhazy	Nicolas Maroudias	2	0	16	Milan Mesterhazy	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Shachar Bar Yosef-Yayama	Jurij Vodan Jecelj	2	0	22	Shachar Bar Yosef-Yayama	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Adam Balogh	Calin-Sabin Campanu	2	0	16	Adam Balogh	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Arda Dogac Atan	Michael Havlíček	2	0	27	Arda Dogac Atan	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Balazs Csernyanszki	Maks Ian Mattias	2	0	23	Balazs Csernyanszki	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Noam Hochman	Soner Arda Aydin	2	0	27	Noam Hochman	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Peter Palkovics	Zisis Pegios	2	0	16	Peter Palkovics	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Teodor Mitev	Linus Emmerich	2	0	32	Teodor Mitev	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Andrej Suchy	Shon Leitman	2	1	46	Andrej Suchy	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Yigitcan Erol	George Pouyioutas	2	0	17	Yigitcan Erol	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Lukáš Patzák	George Alexandru Mocan	2	0	24	Lukáš Patzák	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Konstantinos Giannopoulos	Yoav Eckshtein	2	1	45	Konstantinos Giannopoulos	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Vince Felix Boros	Fatih Erdogan	2	1	35	Vince Felix Boros	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Alon Shlezinger	Vito Radovanović	2	1	47	Alon Shlezinger	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Muhammed Eren Bilgen	Erik Hajdu	2	0	24	Muhammed Eren Bilgen	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Petr Bříza	Nikita Peshekhonov	2	0	22	Petr Bříza	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 2	Lenny Bonniere	Yahav Sade	2	0	26	Lenny Bonniere	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 4	Guy Nachlieli	Balazs Peto	2	1	37	Guy Nachlieli	79	\N	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 3	Calin Grajdieru	Ada Atasoy	2	0	27	Calin Grajdieru	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Jonas Schmid	Alex Petrovic	2	0	24	Jonas Schmid	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 5	Arsene Serre	Dragos Gabriel Nita	2	0	33	Arsene Serre	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 4	Kryštof Klíma	Andrej Macek	2	1	33	Kryštof Klíma	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 3	Konstantinos Giannopoulos	Vince Felix Boros	2	1	32	Konstantinos Giannopoulos	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Luca-Stefan Pandele	Tevž Ornik	2	0	26	Luca-Stefan Pandele	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Milan Mesterhazy	Yordan Yordanov	2	1	36	Milan Mesterhazy	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 3	Adam Balogh	Shachar Bar Yosef-Yayama	2	0	21	Adam Balogh	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 4	Arda Dogac Atan	Balazs Csernyanszki	2	0	38	Arda Dogac Atan	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Peter Palkovics	Noam Hochman	2	0	26	Peter Palkovics	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 5	Andrej Suchy	Teodor Mitev	2	0	30	Andrej Suchy	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 3	Yigitcan Erol	Lukáš Patzák	2	0	35	Yigitcan Erol	79	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 3	Alexandre Bernardo	Louis Morin	2	0	22	Alexandre Bernardo	80	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 4	Lenny Bonniere	Petr Bříza	2	0	21	Lenny Bonniere	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Calin Grajdieru	Guy Nachlieli	2	0	33	Calin Grajdieru	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Luca-Stefan Pandele	Jonas Schmid	2	0	28	Luca-Stefan Pandele	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Milan Mesterhazy	Kryštof Klíma	2	0	27	Milan Mesterhazy	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 3	Arda Dogac Atan	Adam Balogh	2	0	44	Arda Dogac Atan	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 4	Andrej Suchy	Peter Palkovics	2	1	61	Andrej Suchy	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Yigitcan Erol	Konstantinos Giannopoulos	2	1	40	Yigitcan Erol	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 5	Lenny Bonniere	Calin Grajdieru	2	0	29	Lenny Bonniere	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Luca-Stefan Pandele	Arthur Chardain	2	0	46	Luca-Stefan Pandele	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Arda Dogac Atan	Milan Mesterhazy	2	0	39	Arda Dogac Atan	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Andrej Suchy	Yigitcan Erol	2	0	29	Andrej Suchy	79	\N	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 3	Lenny Bonniere	Timeo Lacour	2	1	45	Lenny Bonniere	79	\N	\N
2023-06-25	Sports Center ''Slana Bara - Klisa'' - 2	Luca-Stefan Pandele	Arda Dogac Atan	2	0	38	Luca-Stefan Pandele	79	\N	\N
2023-06-25	Sports Center ''Slana Bara - Klisa'' - 1	Lenny Bonniere	Andrej Suchy	2	1	35	Lenny Bonniere	79	\N	\N
2023-06-26	-	Yusuf Altintas	Ludvig Edholm (Walkover)	0	0	0	Yusuf Altintas	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 1	Ahmet Bera Kus	Stanislav Ivanov	2	0	15	Ahmet Bera Kus	80	\N	\N
2023-06-26	-	Pavlos Pegios	Vahe Hayrapetyan (Walkover)	0	0	0	Pavlos Pegios	80	\N	\N
2023-06-26	-	Yahav Sade	Diyan Kirev (Walkover)	0	0	0	Yahav Sade	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 1	Yigitcan Erol	Yoav Eckshtein	2	0	22	Yigitcan Erol	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 2	Martin Catel	Teodor Mitev	2	0	25	Martin Catel	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 3	Muhammed Eren Bilgen	Viktor Minekov	2	0	15	Muhammed Eren Bilgen	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Edward Davey	Ada Atasoy	2	0	23	Edward Davey	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 3	Muhammed Hasim Turksoy	Nikolay Kolev	2	0	21	Muhammed Hasim Turksoy	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 1	Timeo Ternon	Gokay Gol	2	1	64	Timeo Ternon	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Yordan Yordanov	Calin-Sabin Campanu	2	0	15	Yordan Yordanov	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 2	Fatih Erdogan	Nikolai Nikolov	2	0	14	Fatih Erdogan	80	\N	\N
2023-06-26	-	Tobias Andergassen	Ilhan Aliyan (Walkover)	0	0	0	Tobias Andergassen	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 3	Andrei Zubcu	Martin Stratiev	2	1	42	Andrei Zubcu	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Arda Dogac Atan	Ruben Fellin	2	0	34	Arda Dogac Atan	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 2	Massimo Grotti	Zisis Pegios	2	0	14	Massimo Grotti	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 2	Alon Shlezinger	Boyan Boev	2	0	22	Alon Shlezinger	80	\N	\N
2023-06-26	-	Petr Martinec	Berkay Yumer (Walkover)	0	0	0	Petr Martinec	80	\N	\N
2023-06-26	-	Noam Hochman	Georgi Vasilev (Walkover)	0	0	0	Noam Hochman	80	\N	\N
2023-06-26	-	Gaspard Leriche	Edvin Ståhl (Walkover)	0	0	0	Gaspard Leriche	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Evangelos - Stauros Anastasiou	Kristian Damianov	2	0	10	Evangelos - Stauros Anastasiou	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 3	Mehmet Can Toremis	Martin Popov	2	0	14	Mehmet Can Toremis	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 1	Guy Nachlieli	Chrisafis Palazis	2	0	20	Guy Nachlieli	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 2	Tsvetan Ivanov	Shachar Bar Yosef-Yayama	2	0	18	Tsvetan Ivanov	80	\N	\N
2023-06-26	-	Matei Eugen Slavu	Artyom Hovhannisyan (Walkover)	0	0	0	Matei Eugen Slavu	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 1	Soner Arda Aydin	Georgi Rupcov	2	0	19	Soner Arda Aydin	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Mehmet Emin Kilic	Luka Stefanovski	2	0	10	Mehmet Emin Kilic	80	\N	\N
2023-06-26	Sport Hall “Vasil Levski” - 4	Davide Izzo	Shon Leitman	2	1	43	Davide Izzo	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Fatih Erdogan	Tobias Andergassen	2	0	23	Fatih Erdogan	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Arda Dogac Atan	Massimo Grotti	2	0	27	Arda Dogac Atan	80	\N	\N
2023-06-27	-	Edward Davey	Luca-Stefan Pandele (Walkover)	0	0	0	Edward Davey	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Muhammed Hasim Turksoy	Soner Arda Aydin	2	0	23	Muhammed Hasim Turksoy	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 3	Ahmet Bera Kus	Pavlos Pegios	2	0	21	Ahmet Bera Kus	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 4	Evangelos - Stauros Anastasiou	Davide Izzo	2	0	24	Evangelos - Stauros Anastasiou	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Tsvetan Ivanov	Martin Catel	2	1	41	Tsvetan Ivanov	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 4	Timeo Ternon	Yordan Yordanov	2	0	28	Timeo Ternon	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 3	Sonish Hathi	Andrei Zubcu	2	0	14	Sonish Hathi	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 3	Mehmet Emin Kilic	Alon Shlezinger	2	0	22	Mehmet Emin Kilic	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Muhammed Eren Bilgen	Matei Eugen Slavu	2	0	16	Muhammed Eren Bilgen	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Tiago Berenguer	Yusuf Altintas	2	0	17	Tiago Berenguer	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 4	Alexandre Bernardo	Petr Martinec	2	0	31	Alexandre Bernardo	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 3	Gaspard Leriche	Noam Hochman	2	0	20	Gaspard Leriche	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Yigitcan Erol	Guy Nachlieli	2	0	23	Yigitcan Erol	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Mehmet Can Toremis	Yahav Sade	2	0	17	Mehmet Can Toremis	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 4	Sonish Hathi	Ahmet Bera Kus	2	0	27	Sonish Hathi	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Arda Dogac Atan	Mehmet Emin Kilic	2	0	19	Arda Dogac Atan	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Alexandre Bernardo	Gaspard Leriche	2	0	36	Alexandre Bernardo	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 4	Tiago Berenguer	Muhammed Hasim Turksoy	2	0	26	Tiago Berenguer	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 3	Timeo Ternon	Fatih Erdogan	2	0	37	Timeo Ternon	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 2	Yigitcan Erol	Tsvetan Ivanov	2	0	23	Yigitcan Erol	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Muhammed Eren Bilgen	Edward Davey	2	0	25	Muhammed Eren Bilgen	80	\N	\N
2023-06-27	Sport Hall “Vasil Levski” - 1	Mehmet Can Toremis	Evangelos - Stauros Anastasiou	2	0	19	Mehmet Can Toremis	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 1	Tiago Berenguer	Arda Dogac Atan	2	0	36	Tiago Berenguer	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 2	Mehmet Can Toremis	Muhammed Eren Bilgen	2	0	19	Mehmet Can Toremis	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 1	Tiago Berenguer	Timeo Ternon	2	0	30	Tiago Berenguer	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 2	Arda Dogac Atan	Sonish Hathi	2	0	39	Arda Dogac Atan	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 4	Muhammed Eren Bilgen	Yigitcan Erol	2	0	30	Muhammed Eren Bilgen	80	\N	\N
2023-06-28	Sport Hall “Vasil Levski” - 2	Mehmet Can Toremis	Alexandre Bernardo	2	0	31	Mehmet Can Toremis	80	\N	\N
2023-06-29	Sport Hall “Vasil Levski” - 1	Mehmet Can Toremis	Tiago Berenguer	2	0	36	Mehmet Can Toremis	80	\N	\N
2023-02-17	John Barrable Hall - 3	Amos MUYANJA	Tebello SELEMELA	2	0	20	Amos MUYANJA	14	98624	\N
2023-02-17	John Barrable Hall - 2	ASSING Aaron	EZZAT Kareem	2	0	27	ASSING Aaron	14	79759	\N
2023-02-17	John Barrable Hall - 3	Augustus OWINYI	Pascal NOLEM	2	0	23	Augustus OWINYI	14	76865	\N
2023-02-17	John Barrable Hall - 4	CHAN FUNG TING Xavier	Zulficar Issufo MUSSAGY	2	0	24	CHAN FUNG TING Xavier	14	85882	\N
2023-06-29	National Sport Complex - 3	Chan Yin Chak	Meiraba Luwang Maisnam	2	0	29	Chan Yin Chak	82	57924	\N
2023-06-30	National Sport Complex - 1	Chan Yin Chak	Keita Makino	2	0	29	Chan Yin Chak	82	57924	\N
2023-06-29	National Sport Complex - 2	Chu Chen Lin	Fang Keat Koo	2	0	31	Chu Chen Lin	82	24589	\N
2023-06-29	National Sport Complex - 1	Daniil Dubovenko	Jia Wei Joel Koh	2	0	30	Daniil Dubovenko	82	94119	\N
\N	-	Georges Julien PAUL	Brian KASIRYE	2	0	31	Georges Julien PAUL	14	64839	\N
2023-06-29	National Sport Complex - 3	Hikaru Minegishi	Puritat Arree	2	0	42	Hikaru Minegishi	82	85385	\N
2023-06-29	National Sport Complex - 1	Huang Yu	Jacob Schueler	2	0	33	Huang Yu	82	98462	\N
2023-06-29	National Sport Complex - 2	Jason Gunawan	Ng In Qin	2	0	34	Jason Gunawan	82	65634	\N
2023-02-17	John Barrable Hall - 1	Jean Bernard BONGOUT	Mahmoud Montaser MONTASER MAHMOUD	2	1	41	Jean Bernard BONGOUT	14	59445	\N
2023-06-29	National Sport Complex - 1	Jia Heng Jason Teh	Shogo Ogawa	2	1	67	Jia Heng Jason Teh	82	82606	\N
2023-06-29	National Sport Complex - 1	Keita Makino	Wei-Cheng Su	2	0	27	Keita Makino	82	78400	\N
2023-06-29	National Sport Complex - 2	Koshiro Moriguchi	Nguyen Hai Dang	2	0	43	Koshiro Moriguchi	82	65788	\N
2023-06-30	National Sport Complex - 2	Koshiro Moriguchi	Zong Ruei Lee	2	1	62	Koshiro Moriguchi	82	65788	\N
2023-06-29	National Sport Complex - 2	Le Duc Phat	Dmitriy Panarin	2	1	43	Le Duc Phat	82	69345	\N
\N	-	Abdurashid Muminov	Daniel S. Farid (Walkover)	0	0	0	Abdurashid Muminov	57	64159	\N
2023-02-27	MTN Arena - COURT 2	Abed Bukenya	Aaron Ndawula	2	0	21	Abed Bukenya	17	89692	\N
2023-02-28	MTN Arena - COURT 1	Abed Bukenya	Nyanesh Anand Changea	2	0	19	Abed Bukenya	17	89692	\N
2023-02-28	MTN Arena - COURT 1	Abed Bukenya	Vaishnav Russeean	2	0	22	Abed Bukenya	17	89692	\N
2023-02-14	ABA - 3	Abhinav Manota	Jack Yu	2	0	25	Abhinav Manota	12	58628	\N
2023-02-16	ABA - 1	Abhinav Manota	Edward Lau	2	0	29	Abhinav Manota	12	58628	\N
2023-02-15	ABA - 2	Abhinav Manota	Jacob Schueler	2	0	31	Abhinav Manota	12	58628	\N
2023-02-15	ABA - 2	Abhinav Manota	Nathan Tang	2	0	33	Abhinav Manota	12	58628	\N
2023-02-14	ABA - 1	Abhinav Manota	Kai Chen Teoh	2	1	52	Abhinav Manota	12	58628	\N
2023-06-01	Center of Badminton - 3	Abhinav Thakur	Yevgeniy Yevseyev	2	0	27	Abhinav Thakur	57	74264	\N
2023-05-31	Center of Badminton - 3	Abhinav Thakur	Biloliddin Kuchkarboev	2	1	49	Abhinav Thakur	57	74264	\N
2023-06-01	Center of Badminton - 1	Abhishek Saini	Makhsut Tadzhibullaev	2	0	21	Abhishek Saini	57	98859	\N
2023-06-02	Center of Badminton - 2	Abhishek Saini	Ayush Shetty	2	0	40	Abhishek Saini	57	98859	\N
2023-06-01	Center of Badminton - 1	Abhishek Saini	Buwaneka Goonethilleka	2	0	30	Abhishek Saini	57	98859	\N
2023-05-31	Center of Badminton - 2	Abhishek Saini	Abdurasul Khadjaev	2	0	18	Abhishek Saini	57	98859	\N
2023-05-26	Raiffeisen Sportpark - 1	Abhishek Yeligar	Chirag Sen	2	0	35	Abhishek Yeligar	55	95489	\N
2023-02-14	ABA - 1	Adam Dolman	Daniel Hillier	2	0	25	Adam Dolman	12	70141	\N
2023-03-30	City Sport Hall - Court 1	Adam Travinskiy	Sushanta Moirangthem (Walkover)	0	0	0	Adam Travinskiy	34	76440	\N
2023-06-13	Sport Hall "Svilengrad" - 1	Adam Travinskiy	Mehmet Emin Kilic	2	0	19	Adam Travinskiy	69	76440	\N
2023-06-12	Sport Hall "Svilengrad" - 3	Adam Travinskiy	Ahmet Arda Atak	2	0	21	Adam Travinskiy	69	76440	\N
2023-03-30	City Sport Hall - Court 1	Adam Travinskiy	Andreas Panteli	2	0	19	Adam Travinskiy	34	76440	\N
2023-05-19	Sport hall Dras - Court 1	Ade Resky Dwicahyo	Dmitriy Panarin	2	0	31	Ade Resky Dwicahyo	51	78890	\N
2023-02-23	MTN Arena - 1	Ade Resky Dwicahyo	Naren Shankar Iyer	2	0	32	Ade Resky Dwicahyo	15	78890	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Ade Resky Dwicahyo	Wolfgang Gnedt	2	0	37	Ade Resky Dwicahyo	46	78890	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 1	Ade Resky Dwicahyo	Matthias Kicklitz	2	0	28	Ade Resky Dwicahyo	46	78890	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 1	Ade Resky Dwicahyo	Krishna Adi Nugraha	2	1	62	Ade Resky Dwicahyo	46	78890	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 4	Ade Resky Dwicahyo	Mikolaj Szymanowski	2	0	26	Ade Resky Dwicahyo	46	78890	\N
2023-02-18	John Barrable Hall - 3	Adel HAMEK	ASSING Aaron	2	0	24	Adel HAMEK	14	98896	\N
2023-02-17	John Barrable Hall - 1	Adel HAMEK	Mustaopha MUHAMMED	2	1	51	Adel HAMEK	14	98896	\N
2023-02-18	John Barrable Hall - 1	Adham Hatem ELGAMAL	Robert WHITE	2	1	43	Adham Hatem ELGAMAL	14	72466	\N
2023-02-17	John Barrable Hall - 1	Adham Hatem ELGAMAL	Mujittapha UMAR	2	0	28	Adham Hatem ELGAMAL	14	72466	\N
2023-03-09	Sportarena (Sportforum) Berlin - 5	Adisak Prasertphetmanee	Sarun Rukcharoen	2	0	31	Adisak Prasertphetmanee	22	64613	\N
2023-03-10	Sportarena (Sportforum) Berlin - 1	Adisak Prasertphetmanee	Ryan Putra Widyanto	2	1	66	Adisak Prasertphetmanee	22	64613	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Adisak Prasertphetmanee	Rune Van Dalm	2	0	33	Adisak Prasertphetmanee	18	64613	\N
2023-02-10	Badminton Center Pécs - 4	Adith Karthikeyan Priya	Samuel Nagy	2	0	38	Adith Karthikeyan Priya	11	84166	\N
2023-04-07	Salle Everest - 2 - Vals	Adith Karthikeyan Priya	Boris Popov	2	0	28	Adith Karthikeyan Priya	36	84166	\N
2023-04-08	Salle Everest - 4 - Kyriad	Adith Karthikeyan Priya	Jing Yi Gavin Ng	2	0	27	Adith Karthikeyan Priya	36	84166	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Adith Karthikeyan Priya	Mike Sinico	2	0	19	Adith Karthikeyan Priya	69	84166	\N
2023-05-13	Sportenum - 4	Adith Karthikeyan Priya	Alexander Becsh	2	0	24	Adith Karthikeyan Priya	49	84166	\N
2023-02-24	PalaBadminton - 4	Adith Karthikeyan Priya	Arnaud Boschung	2	0	23	Adith Karthikeyan Priya	16	84166	\N
2023-05-13	Sportenum - 1	Adith Karthikeyan Priya	Anthony Gourdon	2	1	50	Adith Karthikeyan Priya	49	84166	\N
2023-06-13	Sport Hall "Svilengrad" - 3	Adith Karthikeyan Priya	Gokay Gol	2	0	23	Adith Karthikeyan Priya	69	84166	\N
2023-05-12	Sportenum - 2	Adith Karthikeyan Priya	Liano Panza	2	0	24	Adith Karthikeyan Priya	49	84166	\N
2023-02-25	PalaBadminton - 1	Adith Karthikeyan Priya	Luca Wiechmann	2	0	30	Adith Karthikeyan Priya	16	84166	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Adith Karthikeyan Priya	Pascal Cheng	2	0	28	Adith Karthikeyan Priya	36	84166	\N
2023-02-11	Badminton Center Pécs - 2	Adith Karthikeyan Priya	Viktor Petrovic	2	0	35	Adith Karthikeyan Priya	11	84166	\N
2023-02-11	Badminton Center Pécs - 6	Adith Karthikeyan Priya	Simone Piccinin	2	0	35	Adith Karthikeyan Priya	11	84166	\N
2023-02-25	PalaBadminton - 5	Adith Karthikeyan Priya	Marc Martin	2	0	27	Adith Karthikeyan Priya	16	84166	\N
2023-02-10	Badminton Center Pécs - 1	Adith Karthikeyan Priya	Mateusz Golas	2	0	33	Adith Karthikeyan Priya	11	84166	\N
2023-02-25	PalaBadminton - 3	Adith Karthikeyan Priya	Matys Duru	2	0	24	Adith Karthikeyan Priya	16	84166	\N
2023-06-14	Sport Hall "Svilengrad" - 2	Adith Karthikeyan Priya	Arda Dogac Atan	2	0	33	Adith Karthikeyan Priya	69	84166	\N
2023-06-14	Sport Hall "Svilengrad" - 2	Adith Karthikeyan Priya	Stithapragnya Reddy Saddi	2	0	24	Adith Karthikeyan Priya	69	84166	\N
2023-06-15	Sport Hall "Svilengrad" - 1	Adith Karthikeyan Priya	Mehmet Can Toremis	2	0	30	Adith Karthikeyan Priya	69	84166	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Adith Karthikeyan Priya	Yuri Cho	2	0	35	Adith Karthikeyan Priya	22	84166	\N
2023-03-01	Badmintonhall DEGIRO hall - 5	Adith Karthikeyan Priya	Eric Teller	2	0	33	Adith Karthikeyan Priya	18	84166	\N
2023-02-09	Badminton Center Pécs - 5	Adith Karthikeyan Priya	Adam Nusser	2	0	24	Adith Karthikeyan Priya	11	84166	\N
2023-03-31	City Sport Hall - Court 4	Adith Karthikeyan Priya	Dinu Pandele	2	0	27	Adith Karthikeyan Priya	34	84166	\N
2023-03-31	City Sport Hall - Court 1	Adith Karthikeyan Priya	Evelthon Hadjipantelis	2	0	15	Adith Karthikeyan Priya	34	84166	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Adith Karthikeyan Priya	Sander Oesthassel	2	0	21	Adith Karthikeyan Priya	41	84166	\N
2023-03-30	City Sport Hall - Court 4	Adith Karthikeyan Priya	Shon Leitman	2	0	32	Adith Karthikeyan Priya	34	84166	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Adith Karthikeyan Priya	Konstantinos Giannopoulos	2	0	17	Adith Karthikeyan Priya	41	84166	\N
2023-03-16	-	Adriano Viale Aguirre	Derek Yu	2	0	28	Adriano Viale Aguirre	24	55942	\N
2023-03-10	High Performance Centre - 2	Adriano Viale Aguirre	Karan Rajan Rajarajan	2	1	45	Adriano Viale Aguirre	21	55942	\N
2023-02-17	John Barrable Hall - 2	Ahmed SALAH	Thabani MATHE	2	1	39	Ahmed SALAH	14	55949	\N
2023-02-27	MTN Arena - COURT 3	Aidan Yu Kiat Siow Yin Young	Nabil Ishimwe	2	0	20	Aidan Yu Kiat Siow Yin Young	17	84106	\N
2023-05-31	Center of Badminton - 3	Akash Singh	Nawaf Alghamdi	2	0	25	Akash Singh	57	99105	\N
2023-06-01	Center of Badminton - 2	Akash Singh	Jangir Ibraev	2	0	27	Akash Singh	57	99105	\N
2023-06-01	Center of Badminton - 2	Akash Singh	Batdavaa Munkhbat	2	0	43	Akash Singh	57	99105	\N
2023-06-06	Male’ Sports Complex - 1	Alap Mishra	Luis Ramon Garrido	2	1	65	Alap Mishra	60	95439	\N
2023-03-21	Tay Ho District Stadium - 2	Alap Mishra	Yushi Tanaka	2	1	60	Alap Mishra	29	95439	\N
2023-03-22	Tay Ho District Stadium - 4	Alap Mishra	Chang Shih-Chieh	2	1	45	Alap Mishra	29	95439	\N
2023-05-12	IFU Arena - 1.Victor	Alap Mishra	Rohan Midha	2	0	30	Alap Mishra	48	95439	\N
2023-06-01	Centro Entrenamiento Olimpico - 2	Alejandro Àvalos	Bruno Mora	2	0	24	Alejandro Àvalos	59	59910	\N
2023-03-25	Arena Jaskółka - 4 Tarnów	Alex Lanier	Joakim Oldorff	2	0	35	Alex Lanier	30	94580	\N
2023-06-09	Royal Stage - 1	Alex Lanier	Lucas Claerbout	2	1	63	Alex Lanier	64	94580	\N
2023-03-26	Arena Jaskółka - 1 ORLEN	Alex Lanier	Kalle Koljonen	2	0	43	Alex Lanier	30	94580	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Alex Lanier	Ong Zhen Yi	2	0	39	Alex Lanier	2	94580	\N
2023-03-26	Arena Jaskółka - 1 ORLEN	Alex Lanier	Magnus Johannesen	2	1	67	Alex Lanier	30	94580	\N
2023-01-14	Kalevi Spordihall - 2 Yonex	Alex Lanier	Joran Kweekel	2	1	64	Alex Lanier	2	94580	\N
2023-04-06	Palais des Sports - 1	Alex Lanier	Mads Christophersen	2	1	72	Alex Lanier	35	94580	\N
2023-03-25	Arena Jaskółka - 4 Tarnów	Alex Lanier	Collins Valentine Filimon	2	0	36	Alex Lanier	30	94580	\N
2023-03-24	Arena Jaskółka - 3	Alex Lanier	Keita Makino	2	1	66	Alex Lanier	30	94580	\N
2023-01-14	Kalevi Spordihall - 2 Yonex	Alex Lanier	Magnus Johannesen	2	0	45	Alex Lanier	2	94580	\N
2023-06-09	Royal Stage - 1	Alex Lanier	Julien Carraggi	2	0	41	Alex Lanier	64	94580	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Alex Lanier	Joakim Oldorff	2	0	40	Alex Lanier	2	94580	\N
2023-04-05	Palais des Sports - 1	Alex Lanier	Anders Antonsen	2	1	61	Alex Lanier	35	94580	\N
2023-02-02	Afrasiabi Hall - court 3	Alfito Pringgo Yudanto	Jonathan Matias	2	1	64	Alfito Pringgo Yudanto	8	60676	\N
2023-02-01	Afrasiabi Hall - court 2	Alfito Pringgo Yudanto	Siddhartha Mishra	2	1	65	Alfito Pringgo Yudanto	8	60676	\N
2023-06-01	Centro Entrenamiento Olimpico - 3	Alonso Medel	Gonzalo Sebastian Castillo Salazar	2	0	22	Alonso Medel	59	85277	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Alonso Medel	Jose Rendon	2	0	23	Alonso Medel	59	85277	\N
2023-02-03	Afrasiabi Hall - court 1	Alvi Wijaya Chairullah	Alwi Farhan	2	0	53	Alvi Wijaya Chairullah	8	69712	\N
2023-03-07	Terminal 21 Korat - Court2	Alvi Wijaya Chairullah	Tan Jia Jie	2	0	34	Alvi Wijaya Chairullah	19	69712	\N
2023-02-02	Afrasiabi Hall - court 1	Alvi Wijaya Chairullah	Kuo Kuan Lin	2	0	20	Alvi Wijaya Chairullah	8	69712	\N
2023-02-01	Afrasiabi Hall - court 1	Alvi Wijaya Chairullah	Lok Hong Quan	2	0	35	Alvi Wijaya Chairullah	8	69712	\N
2023-02-03	Afrasiabi Hall - court 2	Alvi Wijaya Chairullah	Harshit Aggarwal	2	1	60	Alvi Wijaya Chairullah	8	69712	\N
2023-06-09	Royal Stage - 4	Alwi Farhan	Markus Barth	2	0	25	Alwi Farhan	64	58089	\N
2023-04-01	Main Location - 1	Alwi Farhan	Jeon Hyeok Jin	2	0	38	Alwi Farhan	32	58089	\N
2023-03-31	Main Location - 5	Alwi Farhan	Justin Hoh	2	0	42	Alwi Farhan	32	58089	\N
2023-03-30	Main Location - 3	Alwi Farhan	Riku Hatano	2	0	34	Alwi Farhan	32	58089	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Alwi Farhan	Luís Enrique Peñalver	2	0	36	Alwi Farhan	74	58089	\N
2023-03-30	Main Location - 1	Alwi Farhan	Riki Takei	2	1	70	Alwi Farhan	32	58089	\N
2023-02-03	Afrasiabi Hall - court 1	Alwi Farhan	Xiaodong Sheng	2	0	33	Alwi Farhan	8	58089	\N
2023-02-02	Afrasiabi Hall - court 2	Alwi Farhan	Siddhanth Gupta	2	1	55	Alwi Farhan	8	58089	\N
2023-06-09	Cido Arena - Court 2	Amaury Lievre	Camilo Borst	2	0	29	Amaury Lievre	66	68262	\N
2023-03-17	Utilita Arena Birmingham - 1 Minoru Yoneyama	Anders Antonsen	Anthony Sinisuka Ginting	2	1	73	Anders Antonsen	25	91554	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 2	Anders Antonsen	Ygor Coelho	2	0	38	Anders Antonsen	31	91554	\N
2023-01-25	Istora Senayan - Court 2	Anders Antonsen	Weng Hong Yang	2	0	46	Anders Antonsen	4	91554	\N
2023-01-18	K. D. Jadhav Indoor Hall - 2	Anders Antonsen	Toma Junior Popov	2	1	90	Anders Antonsen	3	91554	\N
2023-03-16	Utilita Arena Birmingham - 2 12BET	Anders Antonsen	Lakshya Sen	2	0	52	Anders Antonsen	25	91554	\N
2023-06-06	Singapore Indoor Stadium - 1	Anders Antonsen	Toma Junior Popov	2	1	74	Anders Antonsen	62	91554	\N
2023-06-08	Singapore Indoor Stadium - 1	Anders Antonsen	Chou Tien Chen	2	0	40	Anders Antonsen	62	91554	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 4	Anders Antonsen	Misha Zilberman	2	1	65	Anders Antonsen	31	91554	\N
2023-03-31	Centro Deportivo Municipal Gallur - Court 1	Anders Antonsen	Koki Watanabe	2	0	56	Anders Antonsen	31	91554	\N
2023-03-14	Utilita Arena Birmingham - 2 12BET	Anders Antonsen	Rasmus Gemke	2	0	65	Anders Antonsen	25	91554	\N
2023-02-01	Nimibutr National Stadium - Court 1	Anders Antonsen	Sitthikom Thammasin	2	0	52	Anders Antonsen	9	91554	\N
2023-06-09	Singapore Indoor Stadium - 2	Anders Antonsen	Chia Hao Lee	2	1	58	Anders Antonsen	62	91554	\N
2023-06-10	Singapore Indoor Stadium - 1	Anders Antonsen	Kodai Naraoka	2	1	81	Anders Antonsen	62	91554	\N
2023-06-08	Virgilio TRavieso Soto - 3	Anderson Taveras	Angel Argenis Marinez Ulloa	2	0	52	Anderson Taveras	63	88165	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 4	Anderson Taveras	Nathaniel Finzi	2	0	22	Anderson Taveras	43	88165	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Anderson Taveras	Zane Reid	2	0	30	Anderson Taveras	43	88165	\N
2023-05-12	IFU Arena - 2.Sportity	Andi Fadel Muhammad	Johnnie Torjussen	2	1	56	Andi Fadel Muhammad	48	67660	\N
2023-01-13	Kalevi Spordihall - 6 Badminton Estonia	Andi Fadel Muhammad	Ade Resky Dwicahyo	2	0	39	Andi Fadel Muhammad	2	67660	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Andreau Galvez	Chen Yang Hu	2	0	21	Andreau Galvez	71	45514	\N
2023-02-13	ABA - 1	Andrew Rouse	Damus Matakino	2	0	15	Andrew Rouse	12	88938	\N
2023-06-06	Male’ Sports Complex - 1	Anirudh Janardhanan	Abhinav Thakur	2	1	56	Anirudh Janardhanan	60	82952	\N
2023-06-06	Male’ Sports Complex - 3	Ansal Yadav	Kah Kit Kan	2	0	24	Ansal Yadav	60	81106	\N
2023-06-20	Binjiang Gymnasium - 3	Anson Cheong	Kah Kit Kan	2	0	26	Anson Cheong	75	81321	\N
2023-06-14	Istora - 1	Anthony Sinisuka Ginting	Hans-Kristian Solberg Vittinghus	2	0	31	Anthony Sinisuka Ginting	70	95661	\N
2023-03-14	Utilita Arena Birmingham - 1 Minoru Yoneyama	Anthony Sinisuka Ginting	Kantaphon Wangcharoen	2	0	51	Anthony Sinisuka Ginting	25	95661	\N
2023-01-19	K. D. Jadhav Indoor Hall - 3	Anthony Sinisuka Ginting	Kantaphon Wangcharoen	2	0	38	Anthony Sinisuka Ginting	3	95661	\N
2023-06-08	Singapore Indoor Stadium - 2	Anthony Sinisuka Ginting	Brian Yang	2	0	35	Anthony Sinisuka Ginting	62	95661	\N
2023-04-29	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Anthony Sinisuka Ginting	Kanta Tsuneyama	2	0	37	Anthony Sinisuka Ginting	42	95661	\N
2023-04-30	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Anthony Sinisuka Ginting	Loh Kean Yew	2	0	28	Anthony Sinisuka Ginting	42	95661	\N
2023-04-28	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Anthony Sinisuka Ginting	Li Shi Feng	2	1	82	Anthony Sinisuka Ginting	42	95661	\N
2023-06-16	Istora - 2	Anthony Sinisuka Ginting	Jonatan Christie	2	0	51	Anthony Sinisuka Ginting	70	95661	\N
2023-03-16	Utilita Arena Birmingham - 1 Minoru Yoneyama	Anthony Sinisuka Ginting	Prannoy H. S.	2	1	68	Anthony Sinisuka Ginting	25	95661	\N
2023-01-25	Istora Senayan - Court 1	Anthony Sinisuka Ginting	Lee Cheuk Yiu	2	0	36	Anthony Sinisuka Ginting	4	95661	\N
2023-06-09	Singapore Indoor Stadium - 1	Anthony Sinisuka Ginting	Li Shi Feng	2	1	62	Anthony Sinisuka Ginting	62	95661	\N
2023-06-10	Singapore Indoor Stadium - 1	Anthony Sinisuka Ginting	Kunlavut Vitidsarn	1	1	45	Anthony Sinisuka Ginting	62	95661	\N
2023-01-18	K. D. Jadhav Indoor Hall - 3	Anthony Sinisuka Ginting	Lu Guang Zu	2	1	81	Anthony Sinisuka Ginting	3	95661	\N
2023-06-11	Singapore Indoor Stadium - 1	Anthony Sinisuka Ginting	Anders Antonsen	2	0	40	Anthony Sinisuka Ginting	62	95661	\N
2023-01-20	K. D. Jadhav Indoor Hall - 1	Anthony Sinisuka Ginting	Li Shi Feng	2	1	65	Anthony Sinisuka Ginting	3	95661	\N
2023-06-15	Istora - 1	Anthony Sinisuka Ginting	Priyanshu Rajawat	2	1	63	Anthony Sinisuka Ginting	70	95661	\N
2023-06-07	Singapore Indoor Stadium - 3	Anthony Sinisuka Ginting	Ng Ka Long Angus	2	0	43	Anthony Sinisuka Ginting	62	95661	\N
2023-06-17	Istora - 1	Anthony Sinisuka Ginting	Li Shi Feng	2	0	51	Anthony Sinisuka Ginting	70	95661	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Anthony Sinisuka Ginting	Kenta Nishimoto	2	0	46	Anthony Sinisuka Ginting	42	95661	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Anthony Sinisuka Ginting	Wang Tzu Wei	2	0	41	Anthony Sinisuka Ginting	42	95661	\N
2023-02-24	MTN Arena - 1	Anuoluwapo Juwon Opeyori	Ong Ken Yon	2	0	33	Anuoluwapo Juwon Opeyori	15	79662	\N
2023-02-19	John Barrable Hall - 1	Anuoluwapo Juwon OPEYORI	Georges Julien PAUL	2	1	46	Anuoluwapo Juwon OPEYORI	14	79662	\N
2023-02-18	John Barrable Hall - 2	Anuoluwapo Juwon OPEYORI	Ruan SNYMAN	2	0	29	Anuoluwapo Juwon OPEYORI	14	79662	\N
2023-02-23	MTN Arena - 1	Anuoluwapo Juwon Opeyori	Adham Hatem Elgamal	2	0	71	Anuoluwapo Juwon Opeyori	15	79662	\N
2023-02-17	John Barrable Hall - 3	Anuoluwapo Juwon OPEYORI	Trinity CHIPUMHO	2	0	21	Anuoluwapo Juwon OPEYORI	14	79662	\N
2023-02-18	John Barrable Hall - 4	Anuoluwapo Juwon OPEYORI	Kalombo MULENGA	2	1	45	Anuoluwapo Juwon OPEYORI	14	79662	\N
2023-06-06	Male’ Sports Complex - 1	Anuoluwapo Juwon Opeyori	Siddhanth Gupta	2	0	38	Anuoluwapo Juwon Opeyori	60	79662	\N
2023-06-20	Binjiang Gymnasium - 4	Ao Fei Long	Mohamed Ajfan Rasheed	2	0	34	Ao Fei Long	75	82093	\N
2023-03-16	-	Aria Dinata	Matthew Abela (Walkover)	0	0	0	Aria Dinata	24	91894	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 4	Arnaud Merkle	Brice Leverdez	2	0	41	Arnaud Merkle	31	59543	\N
2023-06-17	Salle metropolitaine de la Trocardière - 2 - +2bad	Arnaud Merkle	Mark Caljouw	2	0	32	Arnaud Merkle	74	59543	\N
2023-06-18	Salle metropolitaine de la Trocardière - 1 - Forza	Arnaud Merkle	Jason Christ Alexander	2	0	51	Arnaud Merkle	74	59543	\N
2023-05-04	CODE II Jalisco - 2	Arnaud Merkle	Max Weisskirchen	2	0	38	Arnaud Merkle	45	59543	\N
2023-06-17	Salle metropolitaine de la Trocardière - 1 - Forza	Arnaud Merkle	Sameer Verma	2	0	46	Arnaud Merkle	74	59543	\N
2023-06-09	Royal Stage - 2	Arnaud Merkle	Tobias Kuenzi	2	0	36	Arnaud Merkle	64	59543	\N
2023-05-03	CODE II Jalisco - 2	Arnaud Merkle	Giovanni Toti	2	0	32	Arnaud Merkle	45	59543	\N
2023-05-03	CODE II Jalisco - 1	Arnaud Merkle	Luis Armando Montoya Navarro	2	0	28	Arnaud Merkle	45	59543	\N
2023-06-16	Salle metropolitaine de la Trocardière - 3 - BoitaPart	Arnaud Merkle	Sacha Leveque	2	0	40	Arnaud Merkle	74	59543	\N
2023-06-09	Royal Stage - 2	Arnaud Merkle	Victor Svendsen	2	0	35	Arnaud Merkle	64	59543	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Arnaud Merkle	Alwi Farhan	2	0	58	Arnaud Merkle	74	59543	\N
2023-04-06	Salle Everest - 5 - Koesio	Arthur Chardain	Panya Phutthiphraisakul	2	0	36	Arthur Chardain	36	77710	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Arthur Chardain	Evangelos - Stauros Anastasiou	2	0	22	Arthur Chardain	79	77710	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 5	Arthur Chardain	Arsene Serre	2	0	34	Arthur Chardain	79	77710	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 5	Arthur Chardain	Vlad Dehelean	2	0	24	Arthur Chardain	79	77710	\N
2023-05-13	Sportenum - 4	Arthur Tatranov	Luca Wiechmann	2	0	33	Arthur Tatranov	49	58122	\N
2023-04-21	Complexe Sportif Regional - Court 3	Arthur Tatranov	Senan O'Rourke	2	0	29	Arthur Tatranov	40	58122	\N
2023-05-13	Sportenum - 1	Arthur Tatranov	Basile Berthomier	2	0	35	Arthur Tatranov	49	58122	\N
2023-05-12	Sportenum - 3	Arthur Tatranov	Loris Dietrich	2	0	31	Arthur Tatranov	49	58122	\N
2023-04-20	Complexe Sportif Regional - Court 5	Arthur Tatranov	Adam Janssens	2	0	18	Arthur Tatranov	40	58122	\N
2023-04-09	Den Willecom - 05	Arthur Tatranov	Marek Čepela	2	1	43	Arthur Tatranov	37	58122	\N
2023-04-08	Den Willecom - 01	Arthur Tatranov	Milan Mesterhazy	2	1	51	Arthur Tatranov	37	58122	\N
2023-04-08	Den Willecom - 08	Arthur Tatranov	Alexandre Bernardo	2	0	37	Arthur Tatranov	37	58122	\N
2023-04-08	Den Willecom - 06	Arthur Tatranov	Jonah Strack	2	1	32	Arthur Tatranov	37	58122	\N
2023-04-07	Den Willecom - 01	Arthur Tatranov	Petr Martinec	2	0	21	Arthur Tatranov	37	58122	\N
2023-04-07	Salle Everest - 2 - Vals	Arthur Wakhevitsch	Arthur Chardain	2	0	27	Arthur Wakhevitsch	36	66224	\N
2023-04-07	Salle Everest - 4 - Kyriad	Arthur Wakhevitsch	Malo Delettre	2	0	26	Arthur Wakhevitsch	36	66224	\N
2023-03-01	Badmintonhall DEGIRO hall - 4	Arthur Wakhevitsch	Michael Pang	2	0	40	Arthur Wakhevitsch	18	66224	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Arthur Wakhevitsch	Shaurya Gullaiya	2	0	27	Arthur Wakhevitsch	18	66224	\N
2023-05-31	Center of Badminton - 2	Arun Kumar Ashok Kumar	Gafforbek Jabborov	2	0	32	Arun Kumar Ashok Kumar	57	88026	\N
2023-06-07	Male’ Sports Complex - 3	Arunesh Hari	Bernardo Atilano	2	1	60	Arunesh Hari	60	75539	\N
2023-06-06	Male’ Sports Complex - 3	Arunesh Hari	Kuswanto Kuswanto	2	0	40	Arunesh Hari	60	75539	\N
2023-06-08	Male’ Sports Complex - 1	Arunesh Hari	Hemanth M.Gowda	2	0	22	Arunesh Hari	60	75539	\N
2023-06-06	Male’ Sports Complex - 3	Arya Bhivpathaki	Ibrahim Ali Haisham	2	0	22	Arya Bhivpathaki	60	71877	\N
2023-05-31	Center of Badminton - 1	Asadbek Olimjanov	Andrey Nedbaylo	2	0	32	Asadbek Olimjanov	57	75527	\N
2023-02-17	John Barrable Hall - 3	ASSING Aaron	Timothy KAFUNDA	2	1	41	ASSING Aaron	14	79759	\N
2023-02-14	ABA - 1	Athi Selladurai	Tony Chen	2	0	17	Athi Selladurai	12	72215	\N
2023-02-13	ABA - 1	Avinash Shastri	Remy Goubin	2	0	20	Avinash Shastri	12	89982	\N
2023-06-01	Center of Badminton - 2	Ayush Shetty	Arun Kumar Ashok Kumar	2	0	32	Ayush Shetty	57	68322	\N
2023-06-01	Center of Badminton - 1	Ayush Shetty	Jewel Angelo Albo	2	0	31	Ayush Shetty	57	68322	\N
2023-03-10	Sportarena (Sportforum) Berlin - 4	Ayush Shetty	Muhammad Faiq	2	1	53	Ayush Shetty	22	68322	\N
2023-03-11	Sportarena (Sportforum) Berlin - 3	Ayush Shetty	Lok Hong Quan	2	0	35	Ayush Shetty	22	68322	\N
2023-03-10	Sportarena (Sportforum) Berlin - 6	Ayush Shetty	Jan Jireh Lee	2	0	33	Ayush Shetty	22	68322	\N
2023-03-09	Sportarena (Sportforum) Berlin - 6	Ayush Shetty	Michael Ji	2	0	26	Ayush Shetty	22	68322	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Ayush Shetty	Patrik Hrazdíra	2	0	17	Ayush Shetty	22	68322	\N
2023-05-31	Center of Badminton - 1	Ayush Shetty	Ibray Bayken	2	0	22	Ayush Shetty	57	68322	\N
2023-05-12	IFU Arena - 2.Sportity	B. R. Sankeerth	S.Sankar Muthusamy Subramanian	2	1	69	B. R. Sankeerth	48	61819	\N
2023-05-27	Raiffeisen Sportpark - 5	B. R. Sankeerth	Enogat Roy	2	0	41	B. R. Sankeerth	55	61819	\N
2023-05-26	Raiffeisen Sportpark - 3	B. R. Sankeerth	Lim Chong King	2	0	48	B. R. Sankeerth	55	61819	\N
2023-03-24	Arena Jaskółka - 5 TOSiR	B. R. Sankeerth	Milan Dratva	2	0	37	B. R. Sankeerth	30	61819	\N
2023-03-11	High Performance Centre - 1	B. R. Sankeerth	Christopher Vittoriani	2	0	38	B. R. Sankeerth	21	61819	\N
2023-03-10	High Performance Centre - 5	B. R. Sankeerth	Matthias Kicklitz	2	0	31	B. R. Sankeerth	21	61819	\N
2023-02-01	Afrasiabi Hall - court 2	Bahaedeen Ahmad Alshannik	Anirudh Janardhanan	2	1	41	Bahaedeen Ahmad Alshannik	8	95425	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 4	Bahaedeen Ahmad Alshannik	Hussein Zayan Shaheed	2	0	25	Bahaedeen Ahmad Alshannik	42	95425	\N
2023-02-23	MTN Arena - 1	Bahaedeen Ahmad Alshannik	Rohan Midha	2	1	52	Bahaedeen Ahmad Alshannik	15	95425	\N
2023-02-24	PalaBadminton - 4	Baptiste Rolin	Liano Panza	2	0	28	Baptiste Rolin	16	96561	\N
2023-05-12	Sportenum - 3	Baptiste Rolin	Nicolas Briancourt	2	0	23	Baptiste Rolin	49	96561	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Baptiste Rolin	Yu Hang Shih	2	0	40	Baptiste Rolin	18	96561	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Baptiste Rolin	Elias Mols Kabell	2	0	29	Baptiste Rolin	68	96561	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Baptiste Rolin	Oliver Nicolson	2	0	31	Baptiste Rolin	68	96561	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 4	Baptiste Rolin	Jofre Comella	2	0	38	Baptiste Rolin	68	96561	\N
2023-05-13	Sportenum - 2	Baptiste Rolin	Keishin Rimmer	2	0	26	Baptiste Rolin	49	96561	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Baptiste Rolin	Rayce Su	2	0	25	Baptiste Rolin	26	96561	\N
2023-02-25	PalaBadminton - 6	Baptiste Rolin	Marco Danti	2	0	21	Baptiste Rolin	16	96561	\N
2023-02-25	PalaBadminton - 1	Baptiste Rolin	Luis Pongratz	1	0	23	Baptiste Rolin	16	96561	\N
2023-06-01	Center of Badminton - 3	Batdavaa Munkhbat	H. Leihong Konyak	2	0	32	Batdavaa Munkhbat	57	67753	\N
2023-06-20	Binjiang Gymnasium - 3	Batdavaa Munkhbat	Lai Yin Chung	2	0	30	Batdavaa Munkhbat	75	67753	\N
2023-03-03	Badmintonhall DEGIRO hall - 4	Ben Hammond	Mark Obermeier	2	0	28	Ben Hammond	18	56095	\N
2023-03-01	Badmintonhall DEGIRO hall - 2	Ben Hammond	Marco Danti	2	0	28	Ben Hammond	18	56095	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Ben Hammond	Noah Haase	2	0	38	Ben Hammond	18	56095	\N
2023-02-02	Afrasiabi Hall - court 2	Bernardo Atilano	Chua Kim Sheng	2	0	33	Bernardo Atilano	8	83597	\N
2023-06-06	Male’ Sports Complex - 2	Bernardo Atilano	Ming Yap Too	2	0	27	Bernardo Atilano	60	83597	\N
2023-02-01	Afrasiabi Hall - court 1	Bernardo Atilano	Mohammad Zarchi	2	0	31	Bernardo Atilano	8	83597	\N
2023-05-31	Center of Badminton - 3	Bharat Raghav	Nikita Vasiliyev	2	0	21	Bharat Raghav	57	96974	\N
2023-06-01	Center of Badminton - 2	Bharat Raghav	Samuel Cassar	2	0	23	Bharat Raghav	57	96974	\N
2023-02-27	MTN Arena - COURT 1	Bharath Latheesh	Arafat Tendo Kibirige	2	0	16	Bharath Latheesh	17	86445	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Bharath Latheesh	Victor Cañadas	2	0	27	Bharath Latheesh	68	86445	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Bharath Latheesh	Eric Gomez	2	0	1	Bharath Latheesh	68	86445	\N
2023-05-13	Sportenum - 1	Bharath Latheesh	Adith Karthikeyan Priya	2	0	30	Bharath Latheesh	49	86445	\N
2023-05-13	Sportenum - 3	Bharath Latheesh	Ilija Nicolussi	2	0	37	Bharath Latheesh	49	86445	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Bharath Latheesh	Guillermo Nuviala	2	0	32	Bharath Latheesh	26	86445	\N
2023-03-17	Polideportivo Corredoria Arena - 3	Bharath Latheesh	Alejandro Gallego	2	0	29	Bharath Latheesh	26	86445	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Bharath Latheesh	Nicholas Kroath	2	0	21	Bharath Latheesh	41	86445	\N
2023-05-13	Sportenum - 3	Bharath Latheesh	Martin Harbo	2	0	30	Bharath Latheesh	49	86445	\N
2023-03-18	Polideportivo Corredoria Arena - 5	Bharath Latheesh	Baptiste Rolin	2	0	35	Bharath Latheesh	26	86445	\N
2023-05-12	Sportenum - 4	Bharath Latheesh	Hannes Blühdorn	2	0	18	Bharath Latheesh	49	86445	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 2	Bharath Latheesh	Alvar Melleri	2	0	38	Bharath Latheesh	68	86445	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Bharath Latheesh	Sourabh Kulkarni	2	0	24	Bharath Latheesh	41	86445	\N
2023-03-18	Polideportivo Corredoria Arena - 3	Bharath Latheesh	Santiago Batalha	2	0	28	Bharath Latheesh	26	86445	\N
2023-03-19	Polideportivo Corredoria Arena - 1	Bharath Latheesh	Michael Ji	2	0	30	Bharath Latheesh	26	86445	\N
2023-03-01	MTN Arena - COURT 2	Bharath Latheesh	Khemtish Rai Nundah	2	0	31	Bharath Latheesh	17	86445	\N
2023-03-01	MTN Arena - COURT 1	Bharath Latheesh	Dev Vishnu	2	0	32	Bharath Latheesh	17	86445	\N
2023-02-28	MTN Arena - COURT 2	Bharath Latheesh	Aidan Yu Kiat Siow Yin Young	2	0	22	Bharath Latheesh	17	86445	\N
2023-03-19	Polideportivo Corredoria Arena - 1	Bharath Latheesh	Daniel Franco	2	0	39	Bharath Latheesh	26	86445	\N
2023-02-28	MTN Arena - COURT 2	Bharath Latheesh	Guna Kusal Dhulupudi	2	0	18	Bharath Latheesh	17	86445	\N
2023-04-22	Evangelos Florakis Sports Hall - 3	Bharath Latheesh	Keishin Rimmer	2	0	26	Bharath Latheesh	41	86445	\N
2023-04-22	Evangelos Florakis Sports Hall - 1	Bharath Latheesh	Ziga Podgoršek	2	1	48	Bharath Latheesh	41	86445	\N
2023-04-23	Evangelos Florakis Sports Hall - 1	Bharath Latheesh	Dev Vishnu	2	0	35	Bharath Latheesh	41	86445	\N
2023-04-23	Evangelos Florakis Sports Hall - 1	Bharath Latheesh	Yap Chun Sin	2	0	54	Bharath Latheesh	41	86445	\N
2023-06-06	Male’ Sports Complex - 3	Bhargav Somasundara	Meiraba Luwang Maisnam	2	0	36	Bhargav Somasundara	60	91347	\N
2023-02-27	MTN Arena - COURT 3	Bhavesh Bissessur	Daksh Haldar	2	0	18	Bhavesh Bissessur	17	75795	\N
2023-02-17	John Barrable Hall - 4	Blessing MAHWIRE	Neo RAHLOLO	2	0	23	Blessing MAHWIRE	14	88755	\N
2023-02-02	Afrasiabi Hall - court 1	Bobby Setiabudi	Subhankar Dey	2	0	33	Bobby Setiabudi	8	80886	\N
2023-02-01	Afrasiabi Hall - court 3	Bobby Setiabudi	Samuel Cassar	2	0	23	Bobby Setiabudi	8	80886	\N
2023-03-21	Tay Ho District Stadium - 4	Bobby Setiabudi	Chia Jeng Hon	2	1	50	Bobby Setiabudi	29	80886	\N
2023-03-07	Terminal 21 Korat - Court2	Bodhi Ratana Teja Gotama	Anirudh Janardhanan	2	0	33	Bodhi Ratana Teja Gotama	19	69037	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 4	Bradley Evans	Ernick Zorrilla	2	1	47	Bradley Evans	43	57490	\N
2023-04-26	-	Bradley Evans	Luis Ramon Garrido (Walkover)	0	0	0	Bradley Evans	43	57490	\N
2023-06-01	Erwin Kranz Halle - 2	Brian Holtschke	Amaury Lievre	2	1	70	Brian Holtschke	58	57406	\N
2023-06-09	Cido Arena - Court 5	Brian Holtschke	Harry Huang	2	1	67	Brian Holtschke	66	57406	\N
2023-06-10	Cido Arena - Court 1	Brian Holtschke	Tino Daoudal	2	1	62	Brian Holtschke	66	57406	\N
2023-02-18	John Barrable Hall - 2	Brian KASIRYE	Caden KAKORA	2	1	41	Brian KASIRYE	14	73671	\N
2023-02-17	John Barrable Hall - 4	Brian KASIRYE	Blessing MAHWIRE	2	0	14	Brian KASIRYE	14	73671	\N
2023-02-18	John Barrable Hall - 2	Brian KASIRYE	Adel HAMEK	2	0	41	Brian KASIRYE	14	73671	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Brian Lubao	Ratchaphol Srithong (Walkover)	0	0	0	Brian Lubao	61	41481	\N
2023-06-01	Centro Entrenamiento Olimpico - 3	Brian Rodrigo Roque Caycho	Emilio Zambrano Solano	2	0	20	Brian Rodrigo Roque Caycho	59	85218	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Brian Yang	Enrico Asuncion	2	0	28	Brian Yang	43	63122	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 1	Brian Yang	Job Castillo	2	0	35	Brian Yang	43	63122	\N
2023-01-25	Istora Senayan - Court 3	Brian Yang	Chou Tien Chen	2	0	32	Brian Yang	4	63122	\N
2023-06-13	Istora - 3	Brian Yang	Nhat Nguyen	2	0	64	Brian Yang	70	63122	\N
2023-04-29	G.C. Foster College of Physical Education and Spor - 1	Brian Yang	Uriel Francisco Canjura Artiga	2	0	29	Brian Yang	43	63122	\N
2023-06-07	Singapore Indoor Stadium - 1	Brian Yang	Rasmus Gemke	2	0	44	Brian Yang	62	63122	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 1	Brian Yang	Ygor Coelho	2	1	55	Brian Yang	43	63122	\N
2023-03-08	Main Location - Court 2	Brian Yang	Toma Junior Popov	2	0	46	Brian Yang	20	63122	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 3	Brian Yang	Yeison Esleiter Del Cid Alvarez	2	0	22	Brian Yang	43	63122	\N
2023-01-26	Istora Senayan - Court 2	Brian Yang	Kenta Nishimoto	2	1	62	Brian Yang	4	63122	\N
2023-05-03	CODE II Jalisco - 1	Brian Yang	Jacob Zhang	2	0	34	Brian Yang	45	63122	\N
2023-06-06	Male’ Sports Complex - 3	Buwaneka Goonethilleka	Raghu Mariswamy	2	1	48	Buwaneka Goonethilleka	60	68845	\N
2023-06-01	Center of Badminton - 3	Buwaneka Goonethilleka	Abdurashid Muminov	2	0	30	Buwaneka Goonethilleka	57	68845	\N
2023-05-31	Center of Badminton - 3	Buwaneka Goonethilleka	Erlan Yeshimkhanov	2	0	21	Buwaneka Goonethilleka	57	68845	\N
2023-02-17	John Barrable Hall - 2	Caden KAKORA	Khemtish Rai NUNDAH	2	0	30	Caden KAKORA	14	86616	\N
2023-02-09	Badminton Center Pécs - 5	Calin Tudor Turcu	Vince Felix Boros	2	0	22	Calin Tudor Turcu	11	86571	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Casper Spaans	Noah Warning	2	0	27	Casper Spaans	22	86084	\N
2023-03-09	Terminal 21 Korat - Court4	Chan Yin Chak	Soong Joo Ven	2	1	61	Chan Yin Chak	19	57924	\N
2023-06-28	National Sport Complex - 2	Chan Yin Chak	Woraphop Chuenkha	2	0	30	Chan Yin Chak	82	57924	\N
2023-03-21	Tay Ho District Stadium - 1	Chan Yin Chak	Anirudh Janardhanan	2	0	27	Chan Yin Chak	29	57924	\N
2023-03-07	Terminal 21 Korat - Court3	Chan Yin Chak	Kuo Kuan Lin	2	0	36	Chan Yin Chak	19	57924	\N
2023-02-01	Nimibutr National Stadium - Court 4	Chan Yin Chak	Soong Joo Ven	2	1	69	Chan Yin Chak	9	57924	\N
2023-03-22	Tay Ho District Stadium - 4	Chan Yin Chak	Wang Po-Wei	2	1	47	Chan Yin Chak	29	57924	\N
2023-03-23	Tay Ho District Stadium - 4	Chan Yin Chak	Liu Wei Chi	2	0	35	Chan Yin Chak	29	57924	\N
2023-03-24	Tay Ho District Stadium - 2	Chan Yin Chak	Justin Hoh	2	1	60	Chan Yin Chak	29	57924	\N
2023-06-21	Tian-Mu Arena - Court 2	Chan Yin Chak	Soong Joo Ven	2	0	36	Chan Yin Chak	78	57924	\N
2023-03-08	Terminal 21 Korat - Court2	Chan Yin Chak	Tharun Mannepalli	2	0	26	Chan Yin Chak	19	57924	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Chan Yin Chak	Yu Igarashi	2	0	35	Chan Yin Chak	23	57924	\N
2023-03-21	Tay Ho District Stadium - 1	Chang Shih-Chieh	Enrico Asuncion	2	0	40	Chang Shih-Chieh	29	56243	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Charles Fouyn	Kevin Baum	2	0	20	Charles Fouyn	18	99703	\N
2023-03-03	Badmintonhall DEGIRO hall - 2	Charles Fouyn	Arthur Wakhevitsch	2	1	74	Charles Fouyn	18	99703	\N
2023-03-04	Badmintonhall DEGIRO hall - 4	Charles Fouyn	Matteo Justel	2	0	26	Charles Fouyn	18	99703	\N
2023-03-16	Coliseo de la Ciudad Deportiva - 2	Charlie Castle	Reidan Cervantes Osoria	2	0	21	Charlie Castle	24	78729	\N
2023-02-01	Nimibutr National Stadium - Court 1	Cheam June Wei	Kantaphon Wangcharoen	2	0	50	Cheam June Wei	9	92796	\N
2023-03-22	St. Jakobshalle Basel - 4	Cheam June Wei	Liew Daren	2	0	31	Cheam June Wei	28	92796	\N
2023-06-21	Tian-Mu Arena - Court 1	Cheam June Wei	Jeon Hyeok Jin	2	0	50	Cheam June Wei	78	92796	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Chen Chi Ting	Ricky Tang	2	0	27	Chen Chi Ting	61	76994	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Chen Chi Ting	Keith Mark Edison	2	0	31	Chen Chi Ting	71	76994	\N
2023-06-14	Gilbert C. Ada Gymnasium - 1 - Streaming	Chen Chi Ting	Andreau Galvez	2	0	19	Chen Chi Ting	71	76994	\N
2023-04-07	Salle Everest - 3 - Carrefour	Chen Shao-Hsuan	Ben Hammond	2	1	59	Chen Shao-Hsuan	36	59490	\N
2023-04-07	Salle Everest - 5 - Koesio	Chen Shao-Hsuan	Jonas Pfister	2	0	24	Chen Shao-Hsuan	36	59490	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Chen Shao-Hsuan	Daniell Pablo	2	0	13	Chen Shao-Hsuan	71	59490	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Chen Yu Cheng	Ricky Tang	2	0	33	Chen Yu Cheng	71	74534	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Cheng-Han Tsai	Paulo Quidato	2	0	15	Cheng-Han Tsai	61	77614	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Cheng-Han Tsai	Elias Bracke	2	1	58	Cheng-Han Tsai	61	77614	\N
2023-06-21	Tian-Mu Arena - Court 2	Chi Yu Jen	Sathish Kumar Karunakaran	2	0	25	Chi Yu Jen	78	77848	\N
2023-03-08	Terminal 21 Korat - Court1	Chi Yu Jen	Koo Takahashi	2	0	62	Chi Yu Jen	19	77848	\N
2023-04-05	Palais des Sports - 3	Chi Yu Jen	Rasmus Gemke	1	0	30	Chi Yu Jen	35	77848	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Chi Yu Jen	Jia Wei Joel Koh	2	0	38	Chi Yu Jen	61	77848	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Chi Yu Jen	Luis Ramon Garrido	2	0	26	Chi Yu Jen	71	77848	\N
2023-03-09	Terminal 21 Korat - Court1	Chi Yu Jen	Sathish Kumar Karunakaran	2	0	40	Chi Yu Jen	19	77848	\N
2023-03-10	Terminal 21 Korat - Court1	Chi Yu Jen	Chan Yin Chak	2	0	33	Chi Yu Jen	19	77848	\N
2023-03-11	Terminal 21 Korat - Court1	Chi Yu Jen	Riku Hatano	2	0	37	Chi Yu Jen	19	77848	\N
2023-03-07	Terminal 21 Korat - Court3	Chi Yu Jen	Pranav Rao Gandham	2	1	56	Chi Yu Jen	19	77848	\N
2023-04-06	Palais des Sports - 2	Chi Yu Jen	Mithun Manjunath	2	0	48	Chi Yu Jen	35	77848	\N
2023-06-08	Gilbert C. Ada Gymnasium - 3	Chi Yu Jen	Choi Pyeong Gang	2	0	34	Chi Yu Jen	61	77848	\N
2023-06-06	Singapore Indoor Stadium - 2	Chia Hao Lee	Kenta Nishimoto	2	0	40	Chia Hao Lee	62	59322	\N
2023-03-22	St. Jakobshalle Basel - 4	Chia Hao Lee	Zhao Jun Peng	2	0	30	Chia Hao Lee	28	59322	\N
2023-06-08	Singapore Indoor Stadium - 3	Chia Hao Lee	Kidambi Srikanth	2	0	37	Chia Hao Lee	62	59322	\N
2023-03-23	St. Jakobshalle Basel - 4	Chia Hao Lee	Mithun Manjunath	2	0	39	Chia Hao Lee	28	59322	\N
2023-03-09	Main Location - Court 4	Chia Hao Lee	Lee Zii Jia	2	1	57	Chia Hao Lee	20	59322	\N
2023-03-08	Main Location - Court 3	Chia Hao Lee	Misha Zilberman	2	0	28	Chia Hao Lee	20	59322	\N
2023-03-15	Utilita Arena Birmingham - 2 12BET	Chico Aura Dwi Wardoyo	Liew Daren	2	0	38	Chico Aura Dwi Wardoyo	25	71408	\N
2023-05-15	Morodok Techo - 1	Chico Aura DWI WARDOYO	LEE Shun Yang	2	0	38	Chico Aura DWI WARDOYO	50	71408	\N
2023-05-14	Morodok Techo - 2	Chico Aura DWI WARDOYO	LE Duc Phat	2	0	27	Chico Aura DWI WARDOYO	50	71408	\N
2023-05-12	Morodok Techo - 2	Chico Aura DWI WARDOYO	VELASCO Mark Anthony	2	0	24	Chico Aura DWI WARDOYO	50	71408	\N
2023-01-25	Istora Senayan - Court 2	Chico Aura Dwi Wardoyo	Priyanshu Rajawat	2	1	61	Chico Aura Dwi Wardoyo	4	71408	\N
2023-01-26	Istora Senayan - Court 2	Chico Aura Dwi Wardoyo	Loh Kean Yew	2	0	42	Chico Aura Dwi Wardoyo	4	71408	\N
2023-06-25	Tian-Mu Arena - Court 1	Chico Aura Dwi Wardoyo	Su Li Yang	2	0	52	Chico Aura Dwi Wardoyo	78	71408	\N
2023-06-24	Tian-Mu Arena - Court 1	Chico Aura Dwi Wardoyo	Wang Tzu Wei	2	0	38	Chico Aura Dwi Wardoyo	78	71408	\N
2023-06-23	Tian-Mu Arena - Court 3	Chico Aura Dwi Wardoyo	Kenta Nishimoto	2	0	47	Chico Aura Dwi Wardoyo	78	71408	\N
2023-01-27	Istora Senayan - Court 2	Chico Aura Dwi Wardoyo	Brian Yang	2	0	43	Chico Aura Dwi Wardoyo	4	71408	\N
2023-06-22	Tian-Mu Arena - Court 3	Chico Aura Dwi Wardoyo	Leong Jun Hao	2	1	72	Chico Aura Dwi Wardoyo	78	71408	\N
2023-01-28	Istora Senayan - Court 1	Chico Aura Dwi Wardoyo	Ng Ka Long Angus	2	1	83	Chico Aura Dwi Wardoyo	4	71408	\N
2023-06-21	Tian-Mu Arena - Court 1	Chico Aura Dwi Wardoyo	Lu Chia Hung	2	0	32	Chico Aura Dwi Wardoyo	78	71408	\N
2023-05-31	Indoor Stadium Huamark - Court 3	Chico Aura Dwi Wardoyo	Brian Yang	2	0	31	Chico Aura Dwi Wardoyo	56	71408	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Chico Aura Dwi Wardoyo	Dmitriy Panarin	2	0	30	Chico Aura Dwi Wardoyo	42	71408	\N
2023-02-01	Afrasiabi Hall - court 1	Chirag Sen	Muhammad Reza Al Fajri	2	0	35	Chirag Sen	8	83657	\N
2023-03-21	Tay Ho District Stadium - 3	Chirag Sen	Eveshgaran Vasigaran	2	1	61	Chirag Sen	29	83657	\N
2023-03-14	Ruichang Sports Park Gym - Court 1	Chirag Sen	Hussein Zayan Shaheed	2	0	23	Chirag Sen	23	83657	\N
2023-06-06	Male’ Sports Complex - 4	Chirag Sen	Tan Mun Dick	2	0	27	Chirag Sen	60	83657	\N
2023-05-12	IFU Arena - 3.Uppsala	Chirag Sen	Iqbal Diaz Syahputra	2	0	34	Chirag Sen	48	83657	\N
2023-02-03	Afrasiabi Hall - court 3	Chirag Sen	Lee Shun Yang	2	0	33	Chirag Sen	8	83657	\N
2023-02-02	Afrasiabi Hall - court 1	Chirag Sen	Tang Kai Feng	2	1	46	Chirag Sen	8	83657	\N
2023-05-12	IFU Arena - 5.Unidamp	Chirag Sen	Tobias Kuenzi	2	1	37	Chirag Sen	48	83657	\N
2023-06-07	Gilbert C. Ada Gymnasium - 1 - Streaming	Cho Geonyeop	Chen Chi Ting	2	0	38	Cho Geonyeop	61	89595	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Cho Geonyeop	Shun Saito	2	0	35	Cho Geonyeop	61	89595	\N
2023-06-08	Gilbert C. Ada Gymnasium - 1 - Streaming	Cho Geonyeop	Kevin Cordon	2	1	65	Cho Geonyeop	61	89595	\N
2023-06-07	Gilbert C. Ada Gymnasium - 1 - Streaming	Choi Pyeong Gang	Ryoma Muramoto	2	0	40	Choi Pyeong Gang	61	57963	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Choi Pyeong Gang	Jacob Schueler	2	0	23	Choi Pyeong Gang	71	57963	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Choi Pyeong Gang	Chen Yu Cheng	2	0	37	Choi Pyeong Gang	61	57963	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Chou Tien Chen	Nguyen Hai Dang	2	0	39	Chou Tien Chen	42	34810	\N
2023-01-17	K. D. Jadhav Indoor Hall - 3	Chou Tien Chen	Lee Cheuk Yiu	2	1	65	Chou Tien Chen	3	34810	\N
2023-03-25	St. Jakobshalle Basel - 1	Chou Tien Chen	Viktor Axelsen	2	0	32	Chou Tien Chen	28	34810	\N
2023-03-24	St. Jakobshalle Basel - 1	Chou Tien Chen	Ng Tze Yong	1	0	18	Chou Tien Chen	28	34810	\N
2023-03-23	St. Jakobshalle Basel - 3	Chou Tien Chen	Chi Yu Jen	2	1	72	Chou Tien Chen	28	34810	\N
2023-03-22	St. Jakobshalle Basel - 4	Chou Tien Chen	Wang Tzu Wei	2	0	45	Chou Tien Chen	28	34810	\N
2023-06-06	Singapore Indoor Stadium - 1	Chou Tien Chen	Lakshya Sen	2	1	69	Chou Tien Chen	62	34810	\N
2023-05-31	Indoor Stadium Huamark - Court 2	Chou Tien Chen	Lin Chun-Yi	2	1	64	Chou Tien Chen	56	34810	\N
2023-06-15	Istora - 1	Chou Tien Chen	Brian Yang	2	0	38	Chou Tien Chen	70	34810	\N
2023-06-13	Istora - 3	Chou Tien Chen	Christo Popov	2	1	66	Chou Tien Chen	70	34810	\N
2023-06-21	Tian-Mu Arena - Court 1	Chou Tien Chen	Mithun Manjunath	2	1	71	Chou Tien Chen	78	34810	\N
2023-01-19	K. D. Jadhav Indoor Hall - 2	Chou Tien Chen	Wang Tzu Wei	2	1	94	Chou Tien Chen	3	34810	\N
2023-02-14	ABA - 4	Chris Benzie	Tony Yu	2	0	17	Chris Benzie	13	56178	\N
2023-02-13	ABA - 6	Chris Benzie	Colin Malaval	2	0	15	Chris Benzie	13	56178	\N
2023-01-27	-	Chris Robin Talts	Casper Nordling (Walkover)	0	0	0	Chris Robin Talts	7	64076	\N
2023-01-27	Fyrishov - Court 5	Chris Robin Talts	Andre Martin Reins	2	0	27	Chris Robin Talts	7	64076	\N
2023-05-26	Axiata Arena - Court 3	Christian Adinata	Kidambi Srikanth	2	1	57	Christian Adinata	53	69006	\N
2023-05-24	Axiata Arena - Court 2	Christian Adinata	Kantaphon Wangcharoen	2	0	47	Christian Adinata	53	69006	\N
2023-05-14	Morodok Techo - 2	Christian ADINATA	NGUYEN Hai Dang	2	0	41	Christian ADINATA	50	69006	\N
2023-02-01	Nimibutr National Stadium - Court 1	Christian Adinata	Tommy Sugiarto	2	1	57	Christian Adinata	9	69006	\N
2023-05-13	Morodok Techo - 3	Christian ADINATA	Saran JAMSRI	2	0	45	Christian ADINATA	50	69006	\N
2023-05-25	Axiata Arena - Court 3	Christian Adinata	Magnus Johannesen	2	0	41	Christian Adinata	53	69006	\N
2023-05-16	Morodok Techo - 1	Christian ADINATA	Chico Aura DWI WARDOYO	2	1	54	Christian ADINATA	50	69006	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 2	Christian Adinata	Cheam June Wei	2	0	32	Christian Adinata	31	69006	\N
2023-05-15	Morodok Techo - 2	Christian ADINATA	LEONG Jun Hao	2	0	45	Christian ADINATA	50	69006	\N
2023-04-05	Palais des Sports - 2	Christian Adinata	Toma Junior Popov	2	1	75	Christian Adinata	35	69006	\N
2023-03-23	St. Jakobshalle Basel - 2	Christo Popov	Prannoy H. S.	2	0	36	Christo Popov	28	72885	\N
2023-03-22	St. Jakobshalle Basel - 3	Christo Popov	Kiran George	2	0	42	Christo Popov	28	72885	\N
2023-07-01	Arena Jaskółka Tarnów TOSiR - Court 2	Christo Popov	Misha Zilberman	2	0	43	Christo Popov	81	72885	\N
2023-03-08	Main Location - Court 1 - TV Court	Christo Popov	Lakshya Sen	2	0	46	Christo Popov	20	72885	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Christo Popov	Kevin Cordon	2	0	35	Christo Popov	31	72885	\N
2023-06-08	Singapore Indoor Stadium - 1	Christo Popov	Loh Kean Yew	2	0	45	Christo Popov	62	72885	\N
2023-06-07	Singapore Indoor Stadium - 2	Christo Popov	Misha Zilberman	2	0	37	Christo Popov	62	72885	\N
2023-05-31	Indoor Stadium Huamark - Court 4	Christo Popov	Sai Praneeth B.	2	0	43	Christo Popov	56	72885	\N
2023-04-05	Palais des Sports - 2	Christo Popov	Felix Burestedt	2	1	67	Christo Popov	35	72885	\N
2023-06-30	Arena Jaskółka Tarnów TOSiR - Court 3	Christo Popov	Mark Caljouw	2	1	80	Christo Popov	81	72885	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 2	Christo Popov	Jan Louda	2	0	53	Christo Popov	81	72885	\N
2023-05-26	Raiffeisen Sportpark - 5	Christopher Vittoriani	Su Li Yang	2	1	52	Christopher Vittoriani	55	94104	\N
2023-05-27	Raiffeisen Sportpark - 1	Christopher Vittoriani	Pablo Abian	2	0	38	Christopher Vittoriani	55	94104	\N
2023-03-10	High Performance Centre - 4	Christopher Vittoriani	Joonas Korhonen	2	0	33	Christopher Vittoriani	21	94104	\N
2023-06-09	Royal Stage - 3	Christopher Vittoriani	Wolfgang Gnedt	2	0	37	Christopher Vittoriani	64	94104	\N
\N	-	Chu Chen Lin	Usukhbayar Biligtbaatar	2	0	14	Chu Chen Lin	76	24589	\N
2023-02-01	Afrasiabi Hall - court 2	Chua Kim Sheng	Jewel Angelo Albo	2	0	39	Chua Kim Sheng	8	78590	\N
2023-02-23	MTN Arena - 1	Chua Kim Sheng	Enrico Asuncion	2	0	26	Chua Kim Sheng	15	78590	\N
2023-02-24	MTN Arena - 1	Chua Kim Sheng	Bahaedeen Ahmad Alshannik	2	1	46	Chua Kim Sheng	15	78590	\N
2023-06-07	Gilbert C. Ada Gymnasium - 3	Chung-Hsiang Yih	Kai Chen Teoh	2	0	34	Chung-Hsiang Yih	61	57236	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Chung-Hsiang Yih	Leonard Manuel	2	0	17	Chung-Hsiang Yih	61	57236	\N
2023-06-17	Salle metropolitaine de la Trocardière - 3 - BoitaPart	Collins Valentine Filimon	Kalle Koljonen	2	1	52	Collins Valentine Filimon	74	86887	\N
2023-05-26	Raiffeisen Sportpark - 1	Collins Valentine Filimon	Liao Jhuo-Fu	2	0	34	Collins Valentine Filimon	55	86887	\N
2023-06-16	Salle metropolitaine de la Trocardière - 3 - BoitaPart	Collins Valentine Filimon	Howard Shu	2	0	26	Collins Valentine Filimon	74	86887	\N
2023-03-11	High Performance Centre - 4	Collins Valentine Filimon	Dominik Kwinta	2	1	45	Collins Valentine Filimon	21	86887	\N
2023-05-20	Sport hall Dras - Court 5	Collins Valentine Filimon	S.Sankar Muthusamy Subramanian	2	0	35	Collins Valentine Filimon	51	86887	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Collins Valentine Filimon	Jan Louda	2	1	55	Collins Valentine Filimon	74	86887	\N
2023-03-25	Arena Jaskółka - 3	Collins Valentine Filimon	Felix Burestedt	2	0	34	Collins Valentine Filimon	30	86887	\N
2023-03-24	Arena Jaskółka - 4 Tarnów	Collins Valentine Filimon	Jack Yu	2	0	26	Collins Valentine Filimon	30	86887	\N
2023-05-19	Sport hall Dras - Court 5	Collins Valentine Filimon	Kiran George	2	1	41	Collins Valentine Filimon	51	86887	\N
2023-03-10	High Performance Centre - 1	Collins Valentine Filimon	Joakim Oldorff	2	1	53	Collins Valentine Filimon	21	86887	\N
2023-02-09	Badminton Center Pécs - 1	Csanad Horvath	Matus Polacek	2	0	25	Csanad Horvath	11	92143	\N
2023-06-22	Teodoro Palacios Flores - 3	Daigo Tanioka	Shubh Krishan	2	0	19	Daigo Tanioka	77	83883	\N
2023-06-22	Teodoro Palacios Flores - 2	Daigo Tanioka	Ramiro Alonso Espinoza	2	0	31	Daigo Tanioka	77	83883	\N
2023-03-04	Badmintonhall DEGIRO hall - 1	Daigo Tanioka	Muhammad Faiq	2	0	28	Daigo Tanioka	18	83883	\N
2023-03-09	Sportarena (Sportforum) Berlin - 4	Daigo Tanioka	Salomon Adam Thomasen	2	0	30	Daigo Tanioka	22	83883	\N
2023-03-04	Badmintonhall DEGIRO hall - 3	Daigo Tanioka	Manraj Singh	2	0	33	Daigo Tanioka	18	83883	\N
2023-03-03	Badmintonhall DEGIRO hall - 4	Daigo Tanioka	Garret Tan	2	0	30	Daigo Tanioka	18	83883	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Daigo Tanioka	Bima Al Ayman Modjo	2	0	32	Daigo Tanioka	18	83883	\N
2023-02-10	Badminton Center Pécs - 5	Daniel Dvořák	Martin Pintrava	2	0	22	Daniel Dvořák	11	92943	\N
2023-02-10	Badminton Center Pécs - 3	Daniel Dvořák	Zyver John De Leon	2	0	36	Daniel Dvořák	11	92943	\N
2023-02-11	Badminton Center Pécs - 6	Daniel Dvořák	Sebastian Pinkowicz	2	0	30	Daniel Dvořák	11	92943	\N
2023-02-11	Badminton Center Pécs - 5	Daniel Dvořák	Pascal Cheng	2	1	43	Daniel Dvořák	11	92943	\N
2023-02-12	Badminton Center Pécs - 5	Daniel Dvořák	Adith Karthikeyan Priya	2	0	29	Daniel Dvořák	11	92943	\N
2023-02-09	Badminton Center Pécs - 6	Daniel Dvořák	Zeno Agai	2	0	18	Daniel Dvořák	11	92943	\N
2023-03-17	Polideportivo Corredoria Arena - 5	Daniel Franco	Alejandro Valdés	2	1	40	Daniel Franco	26	67800	\N
2023-02-25	PalaBadminton - 3	Daniel Franco	Loris Dietrich	2	0	25	Daniel Franco	16	67800	\N
2023-02-25	PalaBadminton - 4	Daniel Franco	Shaurya Gullaiya	2	0	19	Daniel Franco	16	67800	\N
2023-02-25	PalaBadminton - 1	Daniel Franco	Baptiste Rolin	2	0	35	Daniel Franco	16	67800	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Daniel Franco	Theo Johnston	2	0	24	Daniel Franco	26	67800	\N
2023-03-18	Polideportivo Corredoria Arena - 3	Daniel Franco	Martin Harbo	2	0	43	Daniel Franco	26	67800	\N
2023-02-24	PalaBadminton - 1	Daniel Franco	Nolan Chanthakesone	2	0	26	Daniel Franco	16	67800	\N
2023-03-18	Polideportivo Corredoria Arena - 4	Daniel Franco	Philip Oliver Rasmussen	2	0	26	Daniel Franco	26	67800	\N
2023-02-13	ABA - 1	Daniel Hillier	Glen Lefoll	2	0	20	Daniel Hillier	12	78535	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Daniel La Torre Regal	Sharum Durand Cardenas	2	0	41	Daniel La Torre Regal	73	72923	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Daniel Macario	Chen Yang Hu	2	0	20	Daniel Macario	61	23461	\N
2023-03-09	Sportarena (Sportforum) Berlin - 4	Daniel Zhou	Dillon Chong	2	0	26	Daniel Zhou	22	59796	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Daniel Zhou	Yohann Osvald	2	1	51	Daniel Zhou	22	59796	\N
2023-06-07	Male’ Sports Complex - 2	Daniil Dubovenko	Shreyansh Jaiswal	2	1	75	Daniil Dubovenko	60	94119	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 1	Daniil Dubovenko	Ramiro Alonso Espinoza	2	0	24	Daniil Dubovenko	24	94119	\N
2023-06-28	National Sport Complex - 1	Daniil Dubovenko	Ryoma Muramoto	2	0	43	Daniil Dubovenko	82	94119	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 3	Daniil Dubovenko	Samuel O’Brien Ricketts	2	0	31	Daniil Dubovenko	24	94119	\N
2023-07-01	National Sport Complex - 1	Daniil Dubovenko	Shota Omoto	2	0	36	Daniil Dubovenko	82	94119	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Daniil Dubovenko	Samuel Hsiao	2	1	62	Daniil Dubovenko	46	94119	\N
2023-03-16	-	Daniil Dubovenko	Anthony Moreno Hobelin	2	0	20	Daniil Dubovenko	24	94119	\N
2023-06-06	Male’ Sports Complex - 3	Daniil Dubovenko	Chia Jeng Hon	2	1	79	Daniil Dubovenko	60	94119	\N
2023-06-30	National Sport Complex - 3	Daniil Dubovenko	Chu Chen Lin	2	0	29	Daniil Dubovenko	82	94119	\N
2023-05-03	CODE II Jalisco - 1	Danylo Bosniuk	Bernardo Atilano	2	0	27	Danylo Bosniuk	45	58328	\N
2023-05-05	CODE II Jalisco - 3	Danylo Bosniuk	Harshit Aggarwal	2	0	37	Danylo Bosniuk	45	58328	\N
2023-05-03	CODE II Jalisco - 4	Danylo Bosniuk	Fabio Caponio	2	1	56	Danylo Bosniuk	45	58328	\N
2023-03-10	High Performance Centre - 5	Danylo Bosniuk	Joel König	2	0	32	Danylo Bosniuk	21	58328	\N
2023-05-04	CODE II Jalisco - 4	Danylo Bosniuk	Ygor Coelho	2	0	35	Danylo Bosniuk	45	58328	\N
2023-05-06	CODE II Jalisco - 2	Danylo Bosniuk	Ryoma Muramoto	2	1	65	Danylo Bosniuk	45	58328	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 4	Davi Silva	Henry Huebla Leon	2	0	20	Davi Silva	43	78948	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Davi Silva	Justin Ma	2	0	38	Davi Silva	43	78948	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Davi Silva	B. R. Sankeerth	2	0	34	Davi Silva	43	78948	\N
2023-03-30	City Sport Hall - Court 4	David Pupko	Yoav Eckshtein	2	1	41	David Pupko	34	65760	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Deivid Silva	Nicholas Bonkowsky	2	0	19	Deivid Silva	43	69960	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Deivid Silva	Akili Haynes	2	0	18	Deivid Silva	43	69960	\N
2023-06-06	Male’ Sports Complex - 2	Dhruv Kumar	Hussein Zayan Shaheed	2	0	40	Dhruv Kumar	60	81466	\N
2023-03-14	Ruichang Sports Park Gym - Court 3	Dicky Dwi Pangestu	Chang Shih-Chieh	2	0	43	Dicky Dwi Pangestu	23	79604	\N
2023-05-19	Sport hall Dras - Court 4	Dicky Dwi Pangestu	Milan Dratva	1	1	50	Dicky Dwi Pangestu	51	79604	\N
2023-06-15	Teodoro Palacios Flores - 1	Diego Garcia Garcia	Alessandro Anguiano Gonzalez	2	0	21	Diego Garcia Garcia	72	80698	\N
2023-06-15	Teodoro Palacios Flores - 3	Diego Trujillo Marrero	Jonathan Molineros Ochoa	2	1	43	Diego Trujillo Marrero	72	61382	\N
2023-06-22	Teodoro Palacios Flores - 2	Enrico Asuncion	Saket Thavanani	2	1	55	Enrico Asuncion	77	88711	\N
2023-06-16	Teodoro Palacios Flores - 3	Diego Trujillo Marrero	Carlos Guillermo Ramirez	2	0	22	Diego Trujillo Marrero	72	61382	\N
2023-02-24	PalaBadminton - 4	Dillon Chong	Vlad Dehelean	2	0	17	Dillon Chong	16	73493	\N
2023-03-08	Sportarena (Sportforum) Berlin - 6	Dillon Chong	Juraj Marek	2	0	15	Dillon Chong	22	73493	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Dillon Chong	Philip Oliver Rasmussen	2	0	39	Dillon Chong	68	73493	\N
2023-06-01	Erwin Kranz Halle - 3	Dimitar Yanakiev	Jeppe Bruun	2	1	58	Dimitar Yanakiev	58	71797	\N
2023-04-14	VELO-hall - 3	Dimitar Yanakiev	Samuel Lee	2	1	46	Dimitar Yanakiev	38	71797	\N
2023-06-02	Erwin Kranz Halle - 2	Dimitar Yanakiev	Yanis Gaudin	2	1	65	Dimitar Yanakiev	58	71797	\N
2023-06-02	Erwin Kranz Halle - 2	Dimitar Yanakiev	Sacha Leveque	2	1	58	Dimitar Yanakiev	58	71797	\N
2023-03-10	High Performance Centre - 4	Ditlev Jaeger Holm	Giovanni Toti	2	1	47	Ditlev Jaeger Holm	21	90130	\N
2023-06-01	Center of Badminton - 1	Dmitriy Panarin	Manav Choudhary	2	0	41	Dmitriy Panarin	57	82989	\N
2023-02-23	MTN Arena - 2	Dmitriy Panarin	Tobias Kuenzi	1	0	18	Dmitriy Panarin	15	82989	\N
2023-06-03	Center of Badminton - 1	Dmitriy Panarin	Le Duc Phat	2	0	42	Dmitriy Panarin	57	82989	\N
2023-06-02	Center of Badminton - 1	Dmitriy Panarin	Dumindu Abeywickrama	2	0	25	Dmitriy Panarin	57	82989	\N
2023-06-01	Center of Badminton - 2	Dmitriy Panarin	Bharat Raghav	2	0	36	Dmitriy Panarin	57	82989	\N
2023-06-02	Center of Badminton - 1	Dmitriy Panarin	Low Eu Cong	1	0	45	Dmitriy Panarin	57	82989	\N
2023-02-02	Afrasiabi Hall - court 1	Dmitriy Panarin	Eogene Ewe	2	0	38	Dmitriy Panarin	8	82989	\N
2023-02-01	Afrasiabi Hall - court 1	Dmitriy Panarin	Yonathan Ramlie	2	0	37	Dmitriy Panarin	8	82989	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Domas Paksys	Yaidel Gil	2	0	26	Domas Paksys	27	65682	\N
2023-03-18	Sports Hall - 5 Yonex	Domas Paksys	Petr Bříza	2	0	19	Domas Paksys	27	65682	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Domas Paksys	Aldrin Nelson	2	0	31	Domas Paksys	27	65682	\N
2023-05-25	Sports Hall of Agricultural School Complex - 1. Białystok	Domas Paksys	Oskar Kohli	2	0	19	Domas Paksys	54	65682	\N
2023-04-15	LOC Manege - 3	Domas Paksys	Rokas Lesinskas	2	0	44	Domas Paksys	39	65682	\N
2023-04-14	LOC Manege - 1	Domas Paksys	Karl Mattias Pedai	2	0	20	Domas Paksys	39	65682	\N
2023-03-10	High Performance Centre - 4	Dominik Kwinta	Matthew Abela	2	0	26	Dominik Kwinta	21	58521	\N
2023-06-20	Binjiang Gymnasium - 2	Dong Tian Yao	Yu Sheng Po	2	0	45	Dong Tian Yao	75	95516	\N
2023-06-21	Binjiang Gymnasium - 2	Dong Tian Yao	Yap Chun Sin	2	0	30	Dong Tian Yao	75	95516	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Dong Tian Yao	Leong Jun Hao	2	1	78	Dong Tian Yao	23	95516	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Dong Tian Yao	Lei Lan Xi	2	1	60	Dong Tian Yao	23	95516	\N
2023-03-30	City Sport Hall - Court 5	Dor Shani	Noam Hochman	2	1	42	Dor Shani	34	92065	\N
2023-06-01	Center of Badminton - 2	Dumindu Abeywickrama	Sayfiddin Mukhtarov	2	0	19	Dumindu Abeywickrama	57	87857	\N
2023-06-01	Center of Badminton - 1	Dumindu Abeywickrama	Lance Gabriel Vargas	2	1	44	Dumindu Abeywickrama	57	87857	\N
2023-06-02	Center of Badminton - 3	Dumindu Abeywickrama	Akash Singh	2	1	54	Dumindu Abeywickrama	57	87857	\N
2023-02-23	MTN Arena - 2	Dumindu Abeywickrama	Lee Shun Yang	2	1	49	Dumindu Abeywickrama	15	87857	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Eason Wong	Saul Andrade Yanque	2	0	23	Eason Wong	73	84648	\N
2023-02-14	ABA - 1	Edward Lau	Milain Lohith Ranasinghe	2	1	53	Edward Lau	12	99895	\N
2023-02-15	ABA - 1	Edward Lau	Remi Rossi	2	0	45	Edward Lau	12	99895	\N
2023-02-14	ABA - 1	Edward Lau	Ken Richardson	2	1	60	Edward Lau	12	99895	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Elias Bracke	Xiaodong Sheng	2	1	55	Elias Bracke	71	67251	\N
2023-03-24	Arena Jaskółka - 4 Tarnów	Elias Bracke	Dominik Kwinta	2	0	40	Elias Bracke	30	67251	\N
2023-03-10	High Performance Centre - 3	Elias Bracke	Grégoire Deschamp	2	0	33	Elias Bracke	21	67251	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Elias Bracke	Eveshgaran Vasigaran	2	1	49	Elias Bracke	61	67251	\N
2023-02-13	ABA - 4	Emmanuel Stephen Sam	Jay Xuan Tan	2	0	19	Emmanuel Stephen Sam	13	71340	\N
2023-02-14	ABA - 6	Emmanuel Stephen Sam	Jayden Lim	2	1	56	Emmanuel Stephen Sam	13	71340	\N
2023-02-13	ABA - 6	Emmanuel Stephen Sam	Damien Maugin	2	0	15	Emmanuel Stephen Sam	13	71340	\N
2023-03-10	High Performance Centre - 3	Enogat Roy	Bernardo Atilano	2	1	58	Enogat Roy	21	85118	\N
2023-05-26	Raiffeisen Sportpark - 2	Enogat Roy	Rohan Midha	2	0	36	Enogat Roy	55	85118	\N
2023-05-12	IFU Arena - 5.Unidamp	Enogat Roy	Subhankar Dey	2	0	46	Enogat Roy	48	85118	\N
2023-05-12	IFU Arena - 3.Uppsala	Enogat Roy	Milan Dratva	2	0	39	Enogat Roy	48	85118	\N
2023-03-11	High Performance Centre - 1	Enogat Roy	Collins Valentine Filimon	2	0	39	Enogat Roy	21	85118	\N
2023-03-11	High Performance Centre - 5	Enogat Roy	Adriano Viale Aguirre	2	0	39	Enogat Roy	21	85118	\N
2023-02-14	ABA - 2	Ricky Cheng	Kevin Xu	2	0	16	Ricky Cheng	12	79943	\N
2023-05-03	CODE II Jalisco - 4	Enrico Asuncion	Hooman Bagheri	2	0	28	Enrico Asuncion	45	88711	\N
2023-06-08	Virgilio TRavieso Soto - 2	Enrico Asuncion	Davi Silva	2	1	73	Enrico Asuncion	63	88711	\N
2023-06-08	Virgilio TRavieso Soto - 3	Enrico Asuncion	Samuel O’Brien Ricketts	2	1	57	Enrico Asuncion	63	88711	\N
2023-03-11	Sportarena (Sportforum) Berlin - 2	Eogene Ewe	Huang Jia Ming	2	0	54	Eogene Ewe	22	75014	\N
2023-03-11	Sportarena (Sportforum) Berlin - 1	Eogene Ewe	Wang Zi Jun	2	1	58	Eogene Ewe	22	75014	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Eogene Ewe	Lokesh Reddy Kalagotla	2	1	50	Eogene Ewe	22	75014	\N
2023-05-26	Raiffeisen Sportpark - 6	Eogene Ewe	Enrico Asuncion	2	0	34	Eogene Ewe	55	75014	\N
2023-05-27	Raiffeisen Sportpark - 4	Eogene Ewe	Collins Valentine Filimon	2	0	32	Eogene Ewe	55	75014	\N
2023-02-01	Afrasiabi Hall - court 3	Eogene Ewe	Mehran Shahbazi	2	1	59	Eogene Ewe	8	75014	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Eogene Ewe	Shaurya Gullaiya	2	0	23	Eogene Ewe	22	75014	\N
2023-03-09	Sportarena (Sportforum) Berlin - 6	Eogene Ewe	Yu Hang Shih	2	0	36	Eogene Ewe	22	75014	\N
2023-02-13	ABA - 2	Ephraim Van Der Ley	Taniela Ngaue	2	0	22	Ephraim Van Der Ley	12	79984	\N
2023-06-09	Cido Arena - Court 4	Ethan Rose	Julien Scheiwiller	2	0	39	Ethan Rose	66	99908	\N
2023-03-07	Terminal 21 Korat - Court3	Eveshgaran Vasigaran	Jia Wei Joel Koh	2	0	39	Eveshgaran Vasigaran	19	61453	\N
2023-06-22	Teodoro Palacios Flores - 3	Fabián Alejandro Sagastume Bustamante	Dario Alejandro Tul Teo	2	1	34	Fabián Alejandro Sagastume Bustamante	77	72037	\N
2023-05-03	CODE II Jalisco - 4	Fabian Roth	Garret Tan	2	1	55	Fabian Roth	45	57297	\N
2023-03-25	Arena Jaskółka - 5 TOSiR	Fabian Roth	S.Sankar Muthusamy Subramanian	2	1	60	Fabian Roth	30	57297	\N
2023-04-14	VELO-hall - 2	Fabian Roth	Keisuke Fujiwara	2	0	35	Fabian Roth	38	57297	\N
2023-04-14	VELO-hall - 4	Fabian Roth	Harry Huang	2	0	40	Fabian Roth	38	57297	\N
2023-03-24	Arena Jaskółka - 1 ORLEN	Fabian Roth	Fabio Caponio	2	1	54	Fabian Roth	30	57297	\N
2023-06-09	Virgilio TRavieso Soto - 2	Fabio Caponio	Kuo Li-Chun	2	0	40	Fabio Caponio	63	87691	\N
2023-06-08	Virgilio TRavieso Soto - 2	Fabio Caponio	Kevin Arokia Walter	2	0	40	Fabio Caponio	63	87691	\N
2023-06-03	Centro Entrenamiento Olimpico - 2	Fabio Caponio	Georges Julien Paul	2	0	36	Fabio Caponio	59	87691	\N
2023-03-10	High Performance Centre - 1	Fabio Caponio	Julien Scheiwiller	2	0	40	Fabio Caponio	21	87691	\N
2023-06-01	Centro Entrenamiento Olimpico - 2	Fabio Caponio	Sie Zi Lok	2	0	40	Fabio Caponio	59	87691	\N
2023-06-02	Centro Entrenamiento Olimpico - 2	Fabio Caponio	Samuel O’Brien Ricketts	2	0	41	Fabio Caponio	59	87691	\N
2023-06-08	Virgilio TRavieso Soto - 2	Fabio Caponio	Leo Lee	2	0	22	Fabio Caponio	63	87691	\N
2023-05-03	CODE II Jalisco - 2	Fabio Caponio	Armando Gaitan	2	1	55	Fabio Caponio	45	87691	\N
2023-05-31	-	Fabio Caponio	Marcelo Novoa (Walkover)	0	0	0	Fabio Caponio	59	87691	\N
2023-02-23	MTN Arena - 2	Fabio Caponio	Elias Bracke	2	1	48	Fabio Caponio	15	87691	\N
2023-06-04	Centro Entrenamiento Olimpico - 2	Fabio Caponio	Kevin Arokia Walter	2	1	84	Fabio Caponio	59	87691	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Fabrizio Valdivieso Negri	Kjell Wagener	2	0	22	Fabrizio Valdivieso Negri	73	11311	\N
2023-06-21	Binjiang Gymnasium - 1	Faiz Rozain	Liu Hao Da	2	0	46	Faiz Rozain	75	58566	\N
2023-06-20	Binjiang Gymnasium - 4	Faiz Rozain	Keith Mark Edison	2	0	33	Faiz Rozain	75	58566	\N
\N	-	Fang Keat Koo	Pablo Abian (Walkover)	0	0	0	Fang Keat Koo	82	34170	\N
2023-05-12	IFU Arena - 1.Victor	Felix Burestedt	Joel König	2	1	52	Felix Burestedt	48	83985	\N
2023-03-24	Arena Jaskółka - 4 Tarnów	Felix Burestedt	Sai Praneeth B.	2	1	71	Felix Burestedt	30	83985	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Felix Burestedt	Fabian Roth	2	1	62	Felix Burestedt	2	83985	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 1	Felix Burestedt	Giovanni Toti	2	0	39	Felix Burestedt	81	83985	\N
2023-02-17	John Barrable Hall - 2	Felix Dureil NKONOMO BENGONO	Lucio Raul Mize LAMPIAO	2	0	23	Felix Dureil NKONOMO BENGONO	14	80475	\N
2023-04-07	Salle Everest - 4 - Kyriad	Felix Wright	Liron Ubieto	2	0	25	Felix Wright	36	56193	\N
2023-04-06	Salle Everest - 4 - Kyriad	Felix Wright	Victor Cañadas	2	0	21	Felix Wright	36	56193	\N
2023-06-01	Centro Entrenamiento Olimpico - 3	Fernando Sanhueza	Ian Moromisato Namisato	2	0	31	Fernando Sanhueza	59	86169	\N
2023-03-16	-	Filip Spoljarec	Jose Leandro Labrada Soler	2	0	11	Filip Spoljarec	24	83212	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 2	Firman Abdul Kholik	Marcus Viscovich	2	1	51	Firman Abdul Kholik	5	61797	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 3	Firman Abdul Kholik	Martin Bundgaard	2	1	78	Firman Abdul Kholik	5	61797	\N
2023-03-01	Badmintonhall DEGIRO hall - 4	Gagan Balyan	Simon Schenk	2	0	20	Gagan Balyan	18	83039	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Gagan Balyan	Ilija Nicolussi	2	0	29	Gagan Balyan	18	83039	\N
2023-03-15	Ruichang Sports Park Gym - Court 2	Gao Zheng Ze	Kuo Kuan Lin	2	1	55	Gao Zheng Ze	23	68697	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Gao Zheng Ze	Wu Kai An	2	0	60	Gao Zheng Ze	23	68697	\N
2023-03-16	Ruichang Sports Park Gym - Court 3	Gao Zheng Ze	Dong Tian Yao	2	0	50	Gao Zheng Ze	23	68697	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Garret Tan	Lino Degenkolb	2	0	25	Garret Tan	22	60145	\N
2023-03-01	Badmintonhall DEGIRO hall - 2	Garret Tan	Casper Spaans	2	0	28	Garret Tan	18	60145	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Garret Tan	Lorenz Windauer	2	0	28	Garret Tan	18	60145	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Garret Tan	Nachakorn Pusri (Walkover)	0	0	0	Garret Tan	71	60145	\N
2023-02-13	ABA - 1	Gavin Kyjac Ong	Alexander Coumbe	2	0	18	Gavin Kyjac Ong	12	73970	\N
2023-02-18	John Barrable Hall - 1	Georges Julien PAUL	Mohamed Abderrahime BELARBI	2	0	13	Georges Julien PAUL	14	64839	\N
2023-02-18	John Barrable Hall - 3	Georges Julien PAUL	Adham Hatem ELGAMAL	2	1	48	Georges Julien PAUL	14	64839	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Georges Julien Paul	Bengy Laime	2	0	30	Georges Julien Paul	59	64839	\N
2023-06-02	Centro Entrenamiento Olimpico - 2	Georges Julien Paul	Wong Yan Kit	2	0	32	Georges Julien Paul	59	64839	\N
2023-06-08	Virgilio TRavieso Soto - 2	Georges Julien Paul	Miha Ivančič	2	0	31	Georges Julien Paul	63	64839	\N
2023-06-01	Centro Entrenamiento Olimpico - 1	Georges Julien Paul	Santiago Otero	2	0	34	Georges Julien Paul	59	64839	\N
2023-02-17	John Barrable Hall - 4	Georges Julien PAUL	Felix Dureil NKONOMO BENGONO	2	0	18	Georges Julien PAUL	14	64839	\N
2023-06-08	Virgilio TRavieso Soto - 2	Giovanni Toti	Anderson Taveras	2	0	26	Giovanni Toti	63	69253	\N
2023-06-08	Virgilio TRavieso Soto - 2	Giovanni Toti	Javier Armando Alas	2	0	35	Giovanni Toti	63	69253	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 1	Grégoire Deschamp	Arthur Wakhevitsch	2	1	50	Grégoire Deschamp	5	75657	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Grégoire Deschamp	Aram Mahmoud	2	1	51	Grégoire Deschamp	46	75657	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 4	Grégoire Deschamp	Jakob Houe	2	1	45	Grégoire Deschamp	5	75657	\N
2023-02-27	MTN Arena - COURT 2	Guna Kusal Dhulupudi	Tejas Savoo	2	1	28	Guna Kusal Dhulupudi	17	70720	\N
2023-02-28	MTN Arena - COURT 1	Guna Kusal Dhulupudi	Mitchell Purnomo	2	1	32	Guna Kusal Dhulupudi	17	70720	\N
2023-03-30	City Sport Hall - Court 3	Guy Blumenreich	Hrvoje Mavriček	2	0	22	Guy Blumenreich	34	98660	\N
2023-05-31	Center of Badminton - 3	H. Leihong Konyak	Temur Turakhonov	2	0	15	H. Leihong Konyak	57	86245	\N
2023-03-08	Main Location - Court 3	Hans-Kristian Solberg Vittinghus	Alex Lanier	2	0	44	Hans-Kristian Solberg Vittinghus	20	53753	\N
2023-01-18	K. D. Jadhav Indoor Hall - 2	Hans-Kristian Solberg Vittinghus	Liew Daren	0	0	9	Hans-Kristian Solberg Vittinghus	3	53753	\N
2023-06-16	Salle metropolitaine de la Trocardière - 3 - BoitaPart	Harry Huang	Yanis Gaudin	2	0	41	Harry Huang	74	63170	\N
2023-06-01	Center of Badminton - 3	Harshal Bhoyar	Asadbek Olimjanov	2	0	31	Harshal Bhoyar	57	79119	\N
2023-05-31	Center of Badminton - 2	Harshal Bhoyar	Muhammad Ariffuddin Radin	2	1	57	Harshal Bhoyar	57	79119	\N
2023-05-26	Raiffeisen Sportpark - 4	Harsheel Dani	Alap Mishra	2	0	26	Harsheel Dani	55	85472	\N
2023-02-02	Afrasiabi Hall - court 3	Harshit Aggarwal	Mohamad Hafiz Mohamed Sikkander	2	0	33	Harshit Aggarwal	8	58670	\N
2023-05-03	CODE II Jalisco - 3	Harshit Aggarwal	Fabian Roth	2	1	60	Harshit Aggarwal	45	58670	\N
2023-02-01	Afrasiabi Hall - court 1	Harshit Aggarwal	Lukasz Cimosz	2	0	30	Harshit Aggarwal	8	58670	\N
2023-05-04	CODE II Jalisco - 2	Harshit Aggarwal	Misha Zilberman	2	0	39	Harshit Aggarwal	45	58670	\N
2023-05-03	CODE II Jalisco - 2	Harshit Aggarwal	Adriano Viale Aguirre	2	0	23	Harshit Aggarwal	45	58670	\N
2023-05-31	Center of Badminton - 1	Harshit Thakur	Muath Alghamdi	2	0	24	Harshit Thakur	57	58912	\N
2023-06-07	Male’ Sports Complex - 4	Hemanth M.Gowda	Sai Praneeth B.	2	1	70	Hemanth M.Gowda	60	80369	\N
2023-03-07	Terminal 21 Korat - Court3	Hemanth M.Gowda	Abhishek Yeligar	2	0	39	Hemanth M.Gowda	19	80369	\N
2023-06-06	Male’ Sports Complex - 4	Hemanth M.Gowda	Jewel Angelo Albo	2	1	70	Hemanth M.Gowda	60	80369	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 4	Heng Lin Ngan	Finn Achthoven	2	1	56	Heng Lin Ngan	5	66193	\N
2023-06-09	Cido Arena - Court 3	Heng Lin Ngan	Finn Achthoven	2	1	57	Heng Lin Ngan	66	66193	\N
2023-06-20	Binjiang Gymnasium - 4	Heng Lin Ngan	Thanh Dat Bui	2	0	36	Heng Lin Ngan	75	66193	\N
2023-06-10	Cido Arena - Court 3	Heng Lin Ngan	Ethan Rose	2	0	48	Heng Lin Ngan	66	66193	\N
2023-06-01	Erwin Kranz Halle - 3	Henrikho Kho Wibowo	Joel König	2	0	35	Henrikho Kho Wibowo	58	76618	\N
2023-06-02	Erwin Kranz Halle - 4	Henrikho Kho Wibowo	Brian Holtschke	2	0	39	Henrikho Kho Wibowo	58	76618	\N
2023-06-09	Cido Arena - Court 2	Henrikho Kho Wibowo	Valentin Singer	2	1	49	Henrikho Kho Wibowo	66	76618	\N
2023-06-10	Cido Arena - Court 4	Henrikho Kho Wibowo	Tan Rui Yang Ryan	2	1	54	Henrikho Kho Wibowo	66	76618	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Henry Huebla Leon	Leo Lee	2	1	44	Henry Huebla Leon	43	69770	\N
2023-02-01	Nimibutr National Stadium - Court 2	Heo Kwang Hee	Priyanshu Rajawat	2	1	69	Heo Kwang Hee	9	68718	\N
2023-03-21	Tay Ho District Stadium - 2	Heo Kwang Hee	Yohanes Saut Marcellyno	2	0	55	Heo Kwang Hee	29	68718	\N
2023-03-22	Tay Ho District Stadium - 2	Heo Kwang Hee	Tan Jia Jie	2	0	45	Heo Kwang Hee	29	68718	\N
2023-06-28	National Sport Complex - 1	Hikaru Minegishi	Nathan Tang	2	1	56	Hikaru Minegishi	82	85385	\N
2023-03-01	-	Ho Yu Feng Julian	Philipp Volovnik (Walkover)	0	0	0	Ho Yu Feng Julian	18	77013	\N
2023-03-21	Tay Ho District Stadium - 2	Hooi Shao Herng	Iqbal Diaz Syahputra	2	0	37	Hooi Shao Herng	29	94727	\N
2023-03-16	-	Hooman Bagheri	Jean Carlos Guerrero Gallo	2	0	20	Hooman Bagheri	24	96616	\N
2023-05-03	CODE II Jalisco - 3	Howard Shu	Saket Thavanani	2	0	26	Howard Shu	45	46776	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Howard Shu	Imran Wadia	2	0	37	Howard Shu	43	46776	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 1	Howard Shu	Samuel O’Brien Ricketts	2	1	43	Howard Shu	43	46776	\N
2023-06-01	Erwin Kranz Halle - 5	Hsu Yu-Han	David Kim	2	0	34	Hsu Yu-Han	58	72503	\N
2023-06-28	National Sport Complex - 2	Huang Yu	Kar Lung Chun	2	0	18	Huang Yu	82	98462	\N
2023-05-12	IFU Arena - 3.Uppsala	Huang Yu	Julien Scheiwiller	2	1	52	Huang Yu	48	98462	\N
2023-06-30	National Sport Complex - 2	Huang Yu	Max Weisskirchen	2	0	36	Huang Yu	82	98462	\N
2023-05-12	IFU Arena - 4.IFU	Huang Yu	Felix Burestedt	2	1	56	Huang Yu	48	98462	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 3	Huang Yu	Karan Rajan Rajarajan	2	0	35	Huang Yu	46	98462	\N
2023-06-30	National Sport Complex - 3	Huang Yu	Jia Heng Jason Teh	2	0	32	Huang Yu	82	98462	\N
2023-05-13	IFU Arena - 1.Victor	Huang Yu	Tegar Sulistio	2	1	74	Huang Yu	48	98462	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 3	Huang Yu	Chirag Sen	2	0	29	Huang Yu	46	98462	\N
2023-05-19	Sport hall Dras - Court 4	Huang Yu Kai	Harsheel Dani	2	0	33	Huang Yu Kai	51	98595	\N
2023-05-20	Sport hall Dras - Court 1	Huang Yu Kai	Julien Carraggi	2	1	63	Huang Yu Kai	51	98595	\N
2023-03-21	Tay Ho District Stadium - 2	Huang Yu Kai	Lu Chia Hung	2	1	57	Huang Yu Kai	29	98595	\N
2023-01-13	Kalevi Spordihall - 6 Badminton Estonia	Huang Yu Kai	Jia Wei Joel Koh	2	0	25	Huang Yu Kai	2	98595	\N
2023-06-02	Erwin Kranz Halle - 5	Huang Yu Kai	Yohan Barbieri	2	0	27	Huang Yu Kai	58	98595	\N
2023-01-13	Kalevi Spordihall - 3 Grano	Huang Yu Kai	Giovanni Toti	2	1	45	Huang Yu Kai	2	98595	\N
2023-06-11	Royal Stage - 1	Huang Yu Kai	Mark Caljouw	2	0	39	Huang Yu Kai	64	98595	\N
2023-03-22	Tay Ho District Stadium - 4	Huang Yu Kai	Tegar Sulistio	2	0	50	Huang Yu Kai	29	98595	\N
2023-06-10	Royal Stage - 2	Huang Yu Kai	Alex Lanier	0	0	6	Huang Yu Kai	64	98595	\N
2023-03-23	Tay Ho District Stadium - 4	Huang Yu Kai	Koo Takahashi	2	0	35	Huang Yu Kai	29	98595	\N
2023-05-27	Raiffeisen Sportpark - 4	Huang Yu Kai	Eogene Ewe	2	0	35	Huang Yu Kai	55	98595	\N
2023-05-27	Raiffeisen Sportpark - 2	Huang Yu Kai	Abhishek Yeligar	2	0	26	Huang Yu Kai	55	98595	\N
2023-06-10	Royal Stage - 1	Huang Yu Kai	Mads Christophersen	2	0	35	Huang Yu Kai	64	98595	\N
\N	-	Huang Yu Kai	Ade Resky Dwicahyo (Walkover)	0	0	0	Huang Yu Kai	55	98595	\N
2023-06-09	Royal Stage - 4	Huang Yu Kai	Uriel Francisco Canjura Artiga	2	0	34	Huang Yu Kai	64	98595	\N
2023-06-01	Erwin Kranz Halle - 5	Huang Yu Kai	Mohamed Abderrahime Belarbi	2	0	21	Huang Yu Kai	58	98595	\N
2023-05-28	Raiffeisen Sportpark - 2	Huang Yu Kai	Joakim Oldorff	2	1	47	Huang Yu Kai	55	98595	\N
2023-06-09	Royal Stage - 5	Huang Yu Kai	Johnnie Torjussen	2	0	33	Huang Yu Kai	64	98595	\N
2023-03-07	Terminal 21 Korat - Court4	Huang Yu Kai	Yonathan Ramlie	2	1	68	Huang Yu Kai	19	98595	\N
2023-05-20	Sport hall Dras - Court 1	Huang Yu Kai	Jan Louda	2	1	57	Huang Yu Kai	51	98595	\N
2023-02-09	Badminton Center Pécs - 5	Igor Jasek	Adam Balogh	2	0	24	Igor Jasek	11	93629	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Igor Jasek	Florian Otto	2	1	40	Igor Jasek	22	93629	\N
2023-02-10	Badminton Center Pécs - 4	Igor Jasek	Thibault Gardon	2	1	43	Igor Jasek	11	93629	\N
2023-06-09	Cido Arena - Court 5	Iikka Heino	Cholan Kayan	2	0	36	Iikka Heino	66	88856	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 2	Iliyan Stoynov	Roberto Carlos Herrera Vazquez	2	0	31	Iliyan Stoynov	24	63140	\N
2023-03-16	Coliseo de la Ciudad Deportiva - 2	Iliyan Stoynov	Yosuan Pita Segura	2	0	20	Iliyan Stoynov	24	63140	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 3	Iliyan Stoynov	Nadeem Dalvi	2	1	56	Iliyan Stoynov	24	63140	\N
2023-05-31	Center of Badminton - 2	Ilya Lysenko	Samarveer , (Walkover)	0	0	0	Ilya Lysenko	57	61686	\N
2023-05-03	CODE II Jalisco - 1	Imran Wadia	John Li	2	0	22	Imran Wadia	45	79256	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Imran Wadia	Garret Tan	2	1	55	Imran Wadia	43	79256	\N
2023-02-01	Afrasiabi Hall - court 3	Iqbal Diaz Syahputra	Ong Zhen Yi	2	1	68	Iqbal Diaz Syahputra	8	79047	\N
2023-03-07	Terminal 21 Korat - Court3	Iqbal Diaz Syahputra	Le Duc Phat	2	0	38	Iqbal Diaz Syahputra	19	79047	\N
2023-02-02	Afrasiabi Hall - court 1	Iqbal Diaz Syahputra	Salar Bayat	2	0	34	Iqbal Diaz Syahputra	8	79047	\N
2023-02-03	Afrasiabi Hall - court 1	Iqbal Diaz Syahputra	Le Duc Phat	2	0	28	Iqbal Diaz Syahputra	8	79047	\N
2023-02-03	Afrasiabi Hall - court 3	Iqbal Diaz Syahputra	Muhammad Faiq	2	0	33	Iqbal Diaz Syahputra	8	79047	\N
2023-05-12	IFU Arena - 1.Victor	Iqbal Diaz Syahputra	Amaury Lievre	2	0	41	Iqbal Diaz Syahputra	48	79047	\N
2023-01-29	Upplands Boservice Arena/Fyrisfjädern - Court 4	Ivan Tsaregorotsev	Sonish Hathi	2	0	34	Ivan Tsaregorotsev	6	97232	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 5	Ivan Tsaregorotsev	Jesper Nordén	2	0	23	Ivan Tsaregorotsev	6	97232	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Ivan Tsaregorotsev	Timeo Ternon	2	0	35	Ivan Tsaregorotsev	10	97232	\N
2023-02-05	Polideportivo Arroyo de la Miel - 3	Ivan Tsaregorotsev	Alejandro Gallego	2	0	30	Ivan Tsaregorotsev	10	97232	\N
2023-02-05	Polideportivo Arroyo de la Miel - 3	Ivan Tsaregorotsev	Tiago Berenguer	2	0	31	Ivan Tsaregorotsev	10	97232	\N
2023-03-18	Sports Hall - 5 Yonex	Ivan Tsaregorotsev	Swann Hardi	2	0	28	Ivan Tsaregorotsev	27	97232	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Ivan Tsaregorotsev	Ruben Carreras	2	0	38	Ivan Tsaregorotsev	10	97232	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Ivan Tsaregorotsev	Yulien Gil	2	0	20	Ivan Tsaregorotsev	27	97232	\N
2023-04-16	LOC Manege - TV	Ivan Tsaregorotsev	Serhii Marushchak	2	0	22	Ivan Tsaregorotsev	39	97232	\N
2023-03-18	Sports Hall - 3 Betonex	Ivan Tsaregorotsev	Domas Paksys	2	0	27	Ivan Tsaregorotsev	27	97232	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Ivan Tsaregorotsev	Domas Paksys	2	0	30	Ivan Tsaregorotsev	54	97232	\N
2023-04-15	LOC Manege - 1	Ivan Tsaregorotsev	Domas Paksys	2	0	39	Ivan Tsaregorotsev	39	97232	\N
2023-04-15	LOC Manege - 1	Ivan Tsaregorotsev	Tymofii Kadiemin	2	0	20	Ivan Tsaregorotsev	39	97232	\N
2023-05-26	Sports Hall of Agricultural School Complex - 5. MSiT	Ivan Tsaregorotsev	Alexandre Bernardo	2	0	32	Ivan Tsaregorotsev	54	97232	\N
2023-05-26	Sports Hall of Agricultural School Complex - 4. Yonex	Ivan Tsaregorotsev	Frederik Hinding	2	0	27	Ivan Tsaregorotsev	54	97232	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Ivan Tsaregorotsev	Marek Čepela	2	0	40	Ivan Tsaregorotsev	10	97232	\N
2023-01-29	Upplands Boservice Arena/Fyrisfjädern - Court 4	Ivan Tsaregorotsev	Serhii Marushchak	2	0	22	Ivan Tsaregorotsev	6	97232	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Ivan Tsaregorotsev	Yegor Romaniuk	2	0	32	Ivan Tsaregorotsev	10	97232	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Ivan Tsaregorotsev	Orphé Queton-Bouissou	2	0	23	Ivan Tsaregorotsev	6	97232	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 2	Ivan Tsaregorotsev	Viktor Chen	2	0	28	Ivan Tsaregorotsev	6	97232	\N
2023-05-27	Sports Hall of Agricultural School Complex - 2. Podlaskie	Ivan Tsaregorotsev	Sebastian Pinkowicz	2	0	37	Ivan Tsaregorotsev	54	97232	\N
2023-04-14	LOC Manege - 3	Ivan Tsaregorotsev	Arijus Baranauskas	2	0	15	Ivan Tsaregorotsev	39	97232	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Ivan Tsaregorotsev	Ruben Carreras	2	0	25	Ivan Tsaregorotsev	6	97232	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Ivan Tsaregorotsev	Sam Reinert	2	0	20	Ivan Tsaregorotsev	27	97232	\N
2023-02-13	ABA - 1	Jack Jiang	Heiva Yvonet	2	0	20	Jack Jiang	12	55886	\N
2023-02-13	ABA - 3	Jack Yu	Teiva Politi	2	0	16	Jack Yu	12	94332	\N
2023-06-08	Virgilio TRavieso Soto - 2	Jackson Yang	Shaurya Gullaiya	2	0	27	Jackson Yang	63	83385	\N
2023-02-14	ABA - 1	Jacob Schueler	Hoe Keat Oon	2	0	29	Jacob Schueler	12	77792	\N
2023-02-15	ABA - 2	Jacob Schueler	Niccolo Tagle	2	1	48	Jacob Schueler	12	77792	\N
2023-06-28	National Sport Complex - 2	Jacob Schueler	Erdenebayar Enkhbold	2	0	21	Jacob Schueler	82	77792	\N
2023-06-20	Binjiang Gymnasium - 3	Jacob Schueler	Dylan Chan	2	0	28	Jacob Schueler	75	77792	\N
2023-02-14	ABA - 3	Jacob Schueler	Julian Mao Lun Lee	2	0	33	Jacob Schueler	12	77792	\N
2023-02-13	ABA - 4	Jaden Mingoa	Forrest Huang	2	0	26	Jaden Mingoa	13	89799	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 5	Jakob Houe	Viacheslav Yakovlev	2	0	30	Jakob Houe	5	74452	\N
2023-06-01	Erwin Kranz Halle - 3	Jan Jireh Lee	Adel Hamek	2	0	30	Jan Jireh Lee	58	64119	\N
2023-03-10	Sportarena (Sportforum) Berlin - 6	Jan Jireh Lee	Daniel Zhou	2	0	32	Jan Jireh Lee	22	64119	\N
2023-06-02	Erwin Kranz Halle - 1	Jan Jireh Lee	Tino Daoudal	2	1	75	Jan Jireh Lee	58	64119	\N
2023-03-09	Sportarena (Sportforum) Berlin - 5	Jan Jireh Lee	Bima Al Ayman Modjo	2	0	35	Jan Jireh Lee	22	64119	\N
2023-06-09	Royal Stage - 1	Jan Louda	Lin Kuan-Ting	2	0	38	Jan Louda	64	61423	\N
2023-05-03	CODE II Jalisco - 4	Jan Louda	Adrian King-Sun Mar	2	0	31	Jan Louda	45	61423	\N
2023-04-05	Palais des Sports - 3	Jan Louda	Sitthikom Thammasin	2	0	39	Jan Louda	35	61423	\N
2023-06-09	Royal Stage - 1	Jan Louda	Lim Chong King	2	0	41	Jan Louda	64	61423	\N
2023-05-19	Sport hall Dras - Court 2	Jan Louda	Mads Christophersen	2	0	43	Jan Louda	51	61423	\N
2023-05-20	Sport hall Dras - Court 1	Jan Louda	Lin Yu Hsien	2	0	32	Jan Louda	51	61423	\N
2023-05-07	CODE II Jalisco - 1	Jan Louda	Danylo Bosniuk	2	1	59	Jan Louda	45	61423	\N
2023-05-06	CODE II Jalisco - 1	Jan Louda	Kevin Cordon	2	0	32	Jan Louda	45	61423	\N
2023-05-05	CODE II Jalisco - 4	Jan Louda	Shogo Ogawa	2	1	76	Jan Louda	45	61423	\N
2023-05-04	CODE II Jalisco - 3	Jan Louda	Jonathan Matias	2	0	35	Jan Louda	45	61423	\N
2023-06-16	Salle metropolitaine de la Trocardière - 2 - +2bad	Jan Louda	Julien Carraggi	2	0	34	Jan Louda	74	61423	\N
2023-05-03	CODE II Jalisco - 1	Jan Louda	Samuel O’Brien Ricketts	2	0	30	Jan Louda	45	61423	\N
2023-03-09	Sportarena (Sportforum) Berlin - 1	Jan Wilczak	Kjell Wagener	2	0	35	Jan Wilczak	22	89846	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Jan Wilczak	Valerian Eckert	2	0	40	Jan Wilczak	22	89846	\N
2023-05-31	Center of Badminton - 1	Jangir Ibraev	Amrullo Bakhshullaev	2	0	42	Jangir Ibraev	57	67702	\N
2023-06-16	Salle metropolitaine de la Trocardière - 4 - Renault Dacia	Jason Christ Alexander	Ygor Coelho	2	1	59	Jason Christ Alexander	74	87811	\N
2023-06-10	Cido Arena - Court 3	Jason Christ Alexander	Leo Van Gysel	2	0	35	Jason Christ Alexander	66	87811	\N
2023-06-17	Salle metropolitaine de la Trocardière - 2 - +2bad	Jason Christ Alexander	Collins Valentine Filimon	2	1	52	Jason Christ Alexander	74	87811	\N
2023-06-17	Salle metropolitaine de la Trocardière - 1 - Forza	Jason Christ Alexander	Lucas Claerbout	2	1	71	Jason Christ Alexander	74	87811	\N
2023-06-16	Salle metropolitaine de la Trocardière - 2 - +2bad	Jason Christ Alexander	Victor Svendsen	2	0	36	Jason Christ Alexander	74	87811	\N
2023-06-10	Cido Arena - Court 2	Jason Christ Alexander	Heng Lin Ngan	2	0	42	Jason Christ Alexander	66	87811	\N
2023-06-09	Cido Arena - Court 1	Jason Christ Alexander	Dominik Kwinta	2	0	38	Jason Christ Alexander	66	87811	\N
2023-06-20	Binjiang Gymnasium - 1	Jason Gunawan	Chen Jia Jun	2	0	37	Jason Gunawan	75	65634	\N
2023-03-21	Tay Ho District Stadium - 4	Jason Gunawan	Sholeh Aidil	2	0	47	Jason Gunawan	29	65634	\N
2023-06-28	National Sport Complex - 1	Jason Gunawan	Chung-Hsiang Yih	2	0	27	Jason Gunawan	82	65634	\N
2023-06-22	Binjiang Gymnasium - 2	Jason Gunawan	Faiz Rozain	2	0	45	Jason Gunawan	75	65634	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Jason Gunawan	Uriel Francisco Canjura Artiga	2	1	62	Jason Gunawan	23	65634	\N
2023-06-21	Binjiang Gymnasium - 1	Jason Gunawan	Anson Cheong	2	0	31	Jason Gunawan	75	65634	\N
2023-03-22	Tay Ho District Stadium - 2	Jason Gunawan	Lee Yun Gyu	2	1	70	Jason Gunawan	29	65634	\N
2023-03-14	Ruichang Sports Park Gym - Court 1	Jason Gunawan	Kai Chen Teoh	2	0	32	Jason Gunawan	23	65634	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Javier Armando Alas	Yonatan Linarez	2	0	35	Javier Armando Alas	43	91004	\N
2023-02-13	ABA - 4	Jayden Lim	Aveer Virk	2	0	20	Jayden Lim	13	68039	\N
2023-02-17	John Barrable Hall - 2	Jean Bernard BONGOUT	Augustus OWINYI	2	0	24	Jean Bernard BONGOUT	14	59445	\N
2023-03-21	Tay Ho District Stadium - 1	Jeon Hyeok Jin	Yang Yang	2	1	75	Jeon Hyeok Jin	29	65580	\N
2023-03-08	Terminal 21 Korat - Court2	Jeon Hyeok Jin	Wang Po-Wei	2	0	44	Jeon Hyeok Jin	19	65580	\N
2023-03-07	Terminal 21 Korat - Court2	Jeon Hyeok Jin	Rohan Midha	2	0	32	Jeon Hyeok Jin	19	65580	\N
2023-03-09	Terminal 21 Korat - Court1	Jeon Hyeok Jin	Kok Jing Hong	2	0	47	Jeon Hyeok Jin	19	65580	\N
2023-06-17	Gilbert C. Ada Gymnasium - 1 - Streaming	Jeon Hyeok Jin	Lee Yun Gyu	2	1	57	Jeon Hyeok Jin	71	65580	\N
2023-06-16	Gilbert C. Ada Gymnasium - 2 - Streaming	Jeon Hyeok Jin	Yushi Tanaka	2	0	35	Jeon Hyeok Jin	71	65580	\N
2023-06-15	Gilbert C. Ada Gymnasium - 1 - Streaming	Jeon Hyeok Jin	Liao Jhuo-Fu	2	1	51	Jeon Hyeok Jin	71	65580	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Jeon Hyeok Jin	Shun Saito	2	0	35	Jeon Hyeok Jin	71	65580	\N
2023-03-22	Tay Ho District Stadium - 1	Jeon Hyeok Jin	Lim Chong King	2	0	45	Jeon Hyeok Jin	29	65580	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Jeon Hyeok Jin	Daniel Macario	2	0	16	Jeon Hyeok Jin	71	65580	\N
2023-03-30	Main Location - 3	Jeon Hyeok Jin	Huang Yu	2	0	38	Jeon Hyeok Jin	32	65580	\N
2023-03-30	Main Location - 6	Jeon Hyeok Jin	Koshiro Moriguchi	2	1	79	Jeon Hyeok Jin	32	65580	\N
2023-03-31	Main Location - 1	Jeon Hyeok Jin	Su Li Yang	2	0	62	Jeon Hyeok Jin	32	65580	\N
2023-02-01	Nimibutr National Stadium - Court 3	Jeon Hyeok Jin	Victor Svendsen	2	0	39	Jeon Hyeok Jin	9	65580	\N
2023-06-10	Gilbert C. Ada Gymnasium - 1 - Streaming	Jeon Hyeok Jin	Riku Hatano	2	0	47	Jeon Hyeok Jin	61	65580	\N
2023-06-09	Gilbert C. Ada Gymnasium - 3	Jeon Hyeok Jin	Lee Yun Gyu	1	0	28	Jeon Hyeok Jin	61	65580	\N
2023-06-08	Gilbert C. Ada Gymnasium - 3	Jeon Hyeok Jin	Chung-Hsiang Yih	2	0	33	Jeon Hyeok Jin	61	65580	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Jeon Hyeok Jin	Shih Kuan-Chih	2	0	29	Jeon Hyeok Jin	61	65580	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Jeon Hyeok Jin	Max Weisskirchen	2	0	30	Jeon Hyeok Jin	61	65580	\N
2023-05-03	CODE II Jalisco - 4	Jeppe Bruun	Luis Ramon Garrido	2	1	39	Jeppe Bruun	45	99294	\N
2023-05-13	Morodok Techo - 2	Jewel Angelo ALBO	Zaw Lin HTOO	2	0	35	Jewel Angelo ALBO	50	57758	\N
2023-06-01	Center of Badminton - 1	Jewel Angelo Albo	Mehad Shaikh	2	0	46	Jewel Angelo Albo	57	57758	\N
2023-05-12	Morodok Techo - 1	Jewel Angelo ALBO	Sok RIKREAY	2	0	33	Jewel Angelo ALBO	50	57758	\N
2023-03-24	Arena Jaskółka - 3	Jia Heng Jason Teh	Jonathan Matias	2	0	46	Jia Heng Jason Teh	30	82606	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Jia Wei Joel Koh	Garret Tan	2	0	36	Jia Wei Joel Koh	61	75575	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Jia Wei Joel Koh	Son Wan Ho	2	1	65	Jia Wei Joel Koh	71	75575	\N
2023-03-30	Main Location - 6	Jia Wei Joel Koh	Lee Yun Gyu	2	0	40	Jia Wei Joel Koh	32	75575	\N
2023-06-14	Gilbert C. Ada Gymnasium - 1 - Streaming	Jia Wei Joel Koh	Chen Shao-Hsuan	2	0	36	Jia Wei Joel Koh	71	75575	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Jia Wei Joel Koh	Kai Schaefer	2	1	72	Jia Wei Joel Koh	2	75575	\N
2023-06-28	National Sport Complex - 2	Jia Wei Joel Koh	Patrick Chi	2	0	28	Jia Wei Joel Koh	82	75575	\N
2023-02-15	ABA - 5	Jie Ying Chan	Frederick Zhao	2	0	30	Jie Ying Chan	13	64890	\N
2023-02-13	ABA - 3	Jie Ying Chan	Wesley Lau	2	0	22	Jie Ying Chan	13	64890	\N
2023-02-16	ABA - 2	Jie Ying Chan	Daniel Hu	2	0	37	Jie Ying Chan	13	64890	\N
2023-02-15	ABA - 5	Jie Ying Chan	Chris Benzie	2	1	48	Jie Ying Chan	13	64890	\N
2023-02-14	ABA - 5	Jie Ying Chan	Timothy Sentosa	2	0	30	Jie Ying Chan	13	64890	\N
2023-05-26	Raiffeisen Sportpark - 3	Joakim Oldorff	Dmitriy Panarin	2	1	59	Joakim Oldorff	55	85563	\N
2023-05-03	CODE II Jalisco - 2	Joakim Oldorff	Davi Silva	2	1	26	Joakim Oldorff	45	85563	\N
2023-03-24	Arena Jaskółka - 3	Joakim Oldorff	Bahaedeen Ahmad Alshannik	2	0	42	Joakim Oldorff	30	85563	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Joakim Oldorff	Axel Henrik Parkhøi	2	0	40	Joakim Oldorff	2	85563	\N
2023-05-27	Raiffeisen Sportpark - 2	Joakim Oldorff	Christopher Vittoriani	2	1	49	Joakim Oldorff	55	85563	\N
2023-05-27	Raiffeisen Sportpark - 3	Joakim Oldorff	Tan Jia Jie	2	1	64	Joakim Oldorff	55	85563	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Joakim Oldorff	Korakrit Laotrakul (Walkover)	0	0	0	Joakim Oldorff	71	85563	\N
2023-05-03	CODE II Jalisco - 4	Joakim Oldorff	Tobias Kuenzi	2	1	50	Joakim Oldorff	45	85563	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Joakim Oldorff	Nachakorn Pusri (Walkover)	0	0	0	Joakim Oldorff	61	85563	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Job Castillo	Alonso Medel	2	1	40	Job Castillo	43	93101	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 2	Job Castillo	Anderson Taveras	2	0	23	Job Castillo	43	93101	\N
2023-06-08	Virgilio TRavieso Soto - 3	Job Castillo	Wong Yan Kit	2	1	58	Job Castillo	63	93101	\N
2023-06-08	Virgilio TRavieso Soto - 1	Joel König	Josh Nguyen	2	1	73	Joel König	63	58631	\N
2023-06-08	Virgilio TRavieso Soto - 1	Joel König	Howard Shu	2	0	38	Joel König	63	58631	\N
2023-06-09	Virgilio TRavieso Soto - 2	Joel König	Enrico Asuncion	2	0	51	Joel König	63	58631	\N
2023-04-14	VELO-hall - 2	Joel König	Dennis Koppen	2	0	39	Joel König	38	58631	\N
2023-03-12	High Performance Centre - 1	Johnnie Torjussen	Enogat Roy	2	0	37	Johnnie Torjussen	21	75763	\N
2023-03-12	High Performance Centre - 1	Johnnie Torjussen	Victor Ørding Kauffmann	2	1	48	Johnnie Torjussen	21	75763	\N
2023-03-11	High Performance Centre - 3	Johnnie Torjussen	Jonathan Dolan	2	0	27	Johnnie Torjussen	21	75763	\N
2023-05-26	Raiffeisen Sportpark - 6	Johnnie Torjussen	Jonathan Dolan	2	0	27	Johnnie Torjussen	55	75763	\N
2023-03-11	High Performance Centre - 4	Johnnie Torjussen	Danylo Bosniuk	2	0	45	Johnnie Torjussen	21	75763	\N
2023-04-14	VELO-hall - 2	Johnnie Torjussen	Nguyen Hai Dang	2	1	55	Johnnie Torjussen	38	75763	\N
2023-03-10	High Performance Centre - 4	Johnnie Torjussen	Wolfgang Gnedt	2	0	32	Johnnie Torjussen	21	75763	\N
2023-05-24	Axiata Arena - Court 4	Jonatan Christie	Chi Yu Jen	2	1	65	Jonatan Christie	53	73442	\N
2023-01-29	Istora Senayan - Court 1	Jonatan Christie	Chico Aura Dwi Wardoyo	2	0	44	Jonatan Christie	4	73442	\N
2023-01-28	Istora Senayan - Court 1	Jonatan Christie	Shi Yu Qi	2	1	73	Jonatan Christie	4	73442	\N
2023-01-27	Istora Senayan - Court 1	Jonatan Christie	Lakshya Sen	2	1	62	Jonatan Christie	4	73442	\N
2023-01-26	Istora Senayan - Court 2	Jonatan Christie	Shesar Hiren Rhustavito	2	0	39	Jonatan Christie	4	73442	\N
2023-01-25	Istora Senayan - Court 2	Jonatan Christie	Nhat Nguyen	2	1	67	Jonatan Christie	4	73442	\N
2023-06-15	Istora - 2	Jonatan Christie	Toma Junior Popov	2	1	64	Jonatan Christie	70	73442	\N
2023-06-14	Istora - 1	Jonatan Christie	Kanta Tsuneyama	2	0	39	Jonatan Christie	70	73442	\N
2023-01-20	K. D. Jadhav Indoor Hall - 1	Jonatan Christie	Chou Tien Chen	2	1	72	Jonatan Christie	3	73442	\N
2023-01-10	Axiata Arena - Court 2	Jonatan Christie	Wang Tzu Wei	2	0	36	Jonatan Christie	1	73442	\N
2023-01-19	K. D. Jadhav Indoor Hall - 1	Jonatan Christie	Zhao Jun Peng	2	1	62	Jonatan Christie	3	73442	\N
2023-01-17	K. D. Jadhav Indoor Hall - 2	Jonatan Christie	Brian Yang	2	0	30	Jonatan Christie	3	73442	\N
2023-06-01	Erwin Kranz Halle - 5	Jonathan Dolan	Subhankar Dey	2	1	55	Jonathan Dolan	58	93539	\N
2023-03-10	High Performance Centre - 1	Jonathan Dolan	Sacha Leveque	2	1	58	Jonathan Dolan	21	93539	\N
2023-03-11	High Performance Centre - 3	Jonathan Dolan	Fabio Caponio	2	1	66	Jonathan Dolan	21	93539	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 2	Jonathan Matias	Bradley Evans	2	0	18	Jonathan Matias	43	86470	\N
2023-05-03	CODE II Jalisco - 3	Jonathan Matias	Rohan Midha	2	0	34	Jonathan Matias	45	86470	\N
2023-06-10	Virgilio TRavieso Soto - 2	Jonathan Matias	Fabio Caponio	2	0	188	Jonathan Matias	63	86470	\N
2023-02-01	Afrasiabi Hall - court 2	Jonathan Matias	Ali Hayati	2	0	28	Jonathan Matias	8	86470	\N
2023-05-03	CODE II Jalisco - 1	Jonathan Matias	Adham Hatem Elgamal	2	0	28	Jonathan Matias	45	86470	\N
2023-06-09	Virgilio TRavieso Soto - 1	Jonathan Matias	Armando Gaitan	2	0	40	Jonathan Matias	63	86470	\N
2023-06-08	Virgilio TRavieso Soto - 2	Jonathan Matias	Jackson Yang	2	0	32	Jonathan Matias	63	86470	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Jonathan Matias	Roberto Carlos Herrera Vazquez	2	0	26	Jonathan Matias	43	86470	\N
2023-06-08	Virgilio TRavieso Soto - 1	Jonathan Matias	Hooman Bagheri	2	0	26	Jonathan Matias	63	86470	\N
2023-06-11	Virgilio TRavieso Soto - 1	Jonathan Matias	Mark Shelley Alcala	2	1	66	Jonathan Matias	63	86470	\N
2023-06-22	Teodoro Palacios Flores - 2	Jonathan Molineros Ochoa	William Javier Esteban Marroquin Mayen	2	0	23	Jonathan Molineros Ochoa	77	61720	\N
2023-04-15	VELO-hall - 1	Joran Kweekel	Lucas Claerbout	2	1	71	Joran Kweekel	38	62286	\N
2023-01-13	Kalevi Spordihall - 5 Radisson Blu	Joran Kweekel	Koo Takahashi	2	1	62	Joran Kweekel	2	62286	\N
2023-04-14	VELO-hall - 1	Joran Kweekel	Nathan Tang	2	0	26	Joran Kweekel	38	62286	\N
2023-04-15	VELO-hall - 2	Joran Kweekel	Max Weisskirchen	1	0	17	Joran Kweekel	38	62286	\N
2023-05-20	Sport hall Dras - Court 2	Joran Kweekel	Ade Resky Dwicahyo	2	0	31	Joran Kweekel	51	62286	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Joran Kweekel	Johnnie Torjussen	2	0	27	Joran Kweekel	2	62286	\N
2023-05-19	Sport hall Dras - Court 2	Joran Kweekel	Samuel Hsiao	2	0	40	Joran Kweekel	51	62286	\N
2023-04-14	VELO-hall - 1	Joran Kweekel	Joel König	2	0	29	Joran Kweekel	38	62286	\N
2023-02-14	ABA - 5	Jordan Yang	Raphael Deloy	2	0	22	Jordan Yang	13	67417	\N
2023-02-13	ABA - 3	Jordan Yang	Hugo Chou	2	0	24	Jordan Yang	13	67417	\N
2023-06-15	Teodoro Palacios Flores - 2	José Daniel Ochoa	Fabián Alejandro Sagastume Bustamante	2	0	21	José Daniel Ochoa	72	81195	\N
2023-06-16	Teodoro Palacios Flores - 1	José Daniel Ochoa	Shaurya Gullaiya	2	1	48	José Daniel Ochoa	72	81195	\N
2023-06-17	Teodoro Palacios Flores - 1	José Daniel Ochoa	Melvin Calzadilla	2	0	26	José Daniel Ochoa	72	81195	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Jose Guevara	Kennie King	2	0	23	Jose Guevara	73	58402	\N
2023-06-08	Virgilio TRavieso Soto - 3	Josh Nguyen	Youcef Sabri Medel	2	0	37	Josh Nguyen	63	71843	\N
2023-02-13	ABA - 3	Joshua Feng	Kaihei Teiefitu	2	0	19	Joshua Feng	12	75929	\N
2023-04-07	Salle Everest - 2 - Vals	Josua Hardmeier	Iago Martinez	2	1	52	Josua Hardmeier	36	73615	\N
2023-02-24	PalaBadminton - 3	Josua Hardmeier	Pepijn Van Rossom	2	0	22	Josua Hardmeier	16	73615	\N
2023-04-06	Salle Everest - 2 - Vals	Josua Hardmeier	Eric Gomez	2	0	24	Josua Hardmeier	36	73615	\N
2023-02-14	ABA - 2	Julian Mao Lun Lee	Maretapu Maneatapu	2	0	15	Julian Mao Lun Lee	12	59697	\N
2023-02-13	ABA - 3	Julian Mao Lun Lee	Bevan Cox	2	0	26	Julian Mao Lun Lee	12	59697	\N
2023-04-14	VELO-hall - 2	Julien Carraggi	Larry Pong	2	0	32	Julien Carraggi	38	70399	\N
2023-05-19	Sport hall Dras - Court 1	Julien Carraggi	Pablo Abian	2	0	35	Julien Carraggi	51	70399	\N
2023-05-26	Raiffeisen Sportpark - 5	Julien Carraggi	Tobias Kuenzi	2	0	31	Julien Carraggi	55	70399	\N
2023-05-28	Raiffeisen Sportpark - 1	Julien Carraggi	Wang Po-Wei	2	1	64	Julien Carraggi	55	70399	\N
2023-05-28	Raiffeisen Sportpark - 1	Julien Carraggi	Huang Yu Kai	2	0	35	Julien Carraggi	55	70399	\N
2023-05-03	CODE II Jalisco - 2	Julien Carraggi	Nicholas Bonkowsky	2	0	17	Julien Carraggi	45	70399	\N
2023-05-27	Raiffeisen Sportpark - 1	Julien Carraggi	Johnnie Torjussen	2	0	30	Julien Carraggi	55	70399	\N
2023-05-27	Raiffeisen Sportpark - 1	Julien Carraggi	Karan Rajan Rajarajan	2	0	42	Julien Carraggi	55	70399	\N
2023-05-03	CODE II Jalisco - 1	Julien Carraggi	Justin Ma	2	0	34	Julien Carraggi	45	70399	\N
2023-04-15	VELO-hall - 1	Julien Carraggi	Fabian Roth	2	0	51	Julien Carraggi	38	70399	\N
2023-03-24	Arena Jaskółka - 5 TOSiR	Julien Carraggi	Giovanni Toti	2	0	34	Julien Carraggi	30	70399	\N
2023-03-25	Arena Jaskółka - Ministerstwo Sportu	Julien Carraggi	Victor Svendsen	2	0	35	Julien Carraggi	30	70399	\N
2023-03-25	Arena Jaskółka - Ministerstwo Sportu	Julien Carraggi	Kai Schaefer	2	1	59	Julien Carraggi	30	70399	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 1	Julien Carraggi	Markus Barth	2	1	62	Julien Carraggi	81	70399	\N
2023-04-14	VELO-hall - 1	Julien Carraggi	Victor Ørding Kauffmann	2	1	48	Julien Carraggi	38	70399	\N
2023-04-16	VELO-hall - 1	Julien Carraggi	Joran Kweekel	2	1	68	Julien Carraggi	38	70399	\N
2023-04-15	VELO-hall - 2	Julien Carraggi	Karan Rajan Rajarajan	2	0	35	Julien Carraggi	38	70399	\N
2023-02-26	MTN Arena - 1	Justin Hoh	Kanishq M	2	0	27	Justin Hoh	15	68392	\N
2023-01-14	Kalevi Spordihall - 1 Lenne	Justin Hoh	Kalle Koljonen	2	1	53	Justin Hoh	2	68392	\N
2023-01-13	Kalevi Spordihall - 4 Tallinn	Justin Hoh	Andi Fadel Muhammad	2	1	77	Justin Hoh	2	68392	\N
2023-02-03	Afrasiabi Hall - court 1	Justin Hoh	Bobby Setiabudi	2	0	35	Justin Hoh	8	68392	\N
2023-01-13	Kalevi Spordihall - 4 Tallinn	Justin Hoh	Markus Barth	2	0	22	Justin Hoh	2	68392	\N
2023-02-01	Afrasiabi Hall - court 1	Justin Hoh	Farzin Khanjani	2	0	25	Justin Hoh	8	68392	\N
2023-03-23	Tay Ho District Stadium - 2	Justin Hoh	Lin Kuan-Ting	2	0	48	Justin Hoh	29	68392	\N
2023-02-25	MTN Arena - 3	Justin Hoh	Chua Kim Sheng	2	0	34	Justin Hoh	15	68392	\N
2023-02-25	MTN Arena - 1	Justin Hoh	Viren Nettasinghe	2	0	34	Justin Hoh	15	68392	\N
2023-03-22	Tay Ho District Stadium - 2	Justin Hoh	Lin Yu Hsien	2	0	40	Justin Hoh	29	68392	\N
2023-02-24	MTN Arena - 2	Justin Hoh	Fabio Caponio	2	1	64	Justin Hoh	15	68392	\N
2023-02-04	Afrasiabi Hall - court 1	Justin Hoh	Alvi Wijaya Chairullah	2	0	29	Justin Hoh	8	68392	\N
2023-03-21	Tay Ho District Stadium - 4	Justin Hoh	Cho Geonyeop	2	0	45	Justin Hoh	29	68392	\N
2023-03-30	Main Location - 2	Justin Hoh	Takuma Obayashi	2	1	67	Justin Hoh	32	68392	\N
2023-02-23	MTN Arena - 3	Justin Hoh	Justin Ma	2	0	27	Justin Hoh	15	68392	\N
2023-03-17	Ruichang Sports Park Gym - Court 2	Justin Hoh	Su Li Yang	2	0	44	Justin Hoh	23	68392	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Justin Hoh	Ricky Cheng	2	0	27	Justin Hoh	23	68392	\N
2023-03-30	Main Location - 4	Justin Hoh	Panitchaphon Teeraratsakul	2	1	60	Justin Hoh	32	68392	\N
2023-03-16	Ruichang Sports Park Gym - Court 1	Justin Hoh	Jason Gunawan	2	1	73	Justin Hoh	23	68392	\N
2023-02-02	Afrasiabi Hall - court 1	Justin Hoh	Bahaedeen Ahmad Alshannik	2	0	27	Justin Hoh	8	68392	\N
2023-02-03	Afrasiabi Hall - court 3	Justin Hoh	Ong Ken Yon	2	0	30	Justin Hoh	8	68392	\N
2023-06-22	Teodoro Palacios Flores - 2	Justin Ma	Santiago Lozoya	2	0	15	Justin Ma	77	59702	\N
2023-06-02	Centro Entrenamiento Olimpico - 3	Justin Ma	Alonso Medel	2	0	33	Justin Ma	59	59702	\N
2023-06-01	Centro Entrenamiento Olimpico - 2	Justin Ma	Bahamondez Benjamin	2	0	26	Justin Ma	59	59702	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Justin Ma	Alejandro Chueca Sanchez	2	0	21	Justin Ma	73	59702	\N
2023-06-08	Virgilio TRavieso Soto - 3	Justin Ma	Daniel Antonio Acosta Hilario	2	0	23	Justin Ma	63	59702	\N
2023-06-01	Centro Entrenamiento Olimpico - 3	Justin Ma	Brian Rodrigo Roque Caycho	2	0	29	Justin Ma	59	59702	\N
2023-06-22	Teodoro Palacios Flores - 1	Justin Ma	Kenta Matsukawa	2	0	30	Justin Ma	77	59702	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Justin Ma	Manuel Mejia	2	0	28	Justin Ma	73	59702	\N
2023-06-16	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Justin Ma	Santiago Otero	2	0	30	Justin Ma	73	59702	\N
2023-05-03	CODE II Jalisco - 1	Justin Ma	Eric Duong	2	1	43	Justin Ma	45	59702	\N
\N	-	Kai Chen Teoh	Milan Dratva (Walkover)	0	0	0	Kai Chen Teoh	61	69529	\N
2023-02-13	ABA - 3	Kai Chen Teoh	Jasmanjot Virk	2	0	24	Kai Chen Teoh	12	69529	\N
2023-02-14	ABA - 2	Kai Chen Teoh	Andrew Rouse	2	0	23	Kai Chen Teoh	12	69529	\N
2023-06-08	Male’ Sports Complex - 1	Kai Schaefer	Sathish Kumar Karunakaran	2	0	58	Kai Schaefer	60	20808	\N
2023-03-24	Arena Jaskółka - 5 TOSiR	Kai Schaefer	Danylo Bosniuk	2	0	40	Kai Schaefer	30	20808	\N
2023-06-08	Male’ Sports Complex - 1	Kai Schaefer	Shota Omoto	2	0	49	Kai Schaefer	60	20808	\N
2023-06-07	Male’ Sports Complex - 4	Kai Schaefer	Anirudh Janardhanan	2	0	40	Kai Schaefer	60	20808	\N
2023-02-24	MTN Arena - 3	Kai Schaefer	Shashwat Dalal	2	1	63	Kai Schaefer	15	20808	\N
2023-06-06	Male’ Sports Complex - 2	Kai Schaefer	Rohan Midha	2	0	40	Kai Schaefer	60	20808	\N
2023-02-23	MTN Arena - 2	Kai Schaefer	Youcef Sabri Medel	2	0	24	Kai Schaefer	15	20808	\N
2023-06-22	Teodoro Palacios Flores - 1	Kaito Sugawara	José Daniel Ochoa	2	0	22	Kaito Sugawara	77	56930	\N
2023-06-22	Teodoro Palacios Flores - 2	Kaito Sugawara	Enrico Asuncion	2	0	34	Kaito Sugawara	77	56930	\N
2023-06-23	Teodoro Palacios Flores - 1	Kaito Sugawara	Luis Ramon Garrido	2	1	58	Kaito Sugawara	77	56930	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Kalle Koljonen	Lim Chong King	2	0	35	Kalle Koljonen	74	92655	\N
2023-05-13	IFU Arena - 1.Victor	Kalle Koljonen	Chirag Sen	2	1	53	Kalle Koljonen	48	92655	\N
2023-05-20	Sport hall Dras - Court 3	Kalle Koljonen	Collins Valentine Filimon	2	1	50	Kalle Koljonen	51	92655	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 2	Kalle Koljonen	Ade Resky Dwicahyo	2	0	40	Kalle Koljonen	81	92655	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Kalle Koljonen	Kiran Kumar Mekala	2	0	32	Kalle Koljonen	2	92655	\N
2023-03-25	Arena Jaskółka - 1 ORLEN	Kalle Koljonen	Jia Heng Jason Teh	2	0	39	Kalle Koljonen	30	92655	\N
2023-05-12	IFU Arena - 1.Victor	Kalle Koljonen	Lucas Claerbout	2	1	70	Kalle Koljonen	48	92655	\N
2023-05-12	IFU Arena - 2.Sportity	Kalle Koljonen	Yohanes Saut Marcellyno	2	0	41	Kalle Koljonen	48	92655	\N
2023-03-24	Arena Jaskółka - 1 ORLEN	Kalle Koljonen	Harshit Aggarwal	2	1	60	Kalle Koljonen	30	92655	\N
2023-03-26	Arena Jaskółka - Ministerstwo Sportu	Kalle Koljonen	Julien Carraggi	2	0	45	Kalle Koljonen	30	92655	\N
2023-03-25	Arena Jaskółka - 1 ORLEN	Kalle Koljonen	Fabian Roth	2	0	43	Kalle Koljonen	30	92655	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Kalle Koljonen	Samuel Hsiao	2	0	40	Kalle Koljonen	2	92655	\N
2023-05-19	Sport hall Dras - Court 1	Kalle Koljonen	Arnaud Merkle	2	0	58	Kalle Koljonen	51	92655	\N
2023-05-13	IFU Arena - 2.Sportity	Kalle Koljonen	Huang Yu	2	0	36	Kalle Koljonen	48	92655	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Kalle Koljonen	Magnus Johannesen	2	1	58	Kalle Koljonen	74	92655	\N
2023-05-20	Sport hall Dras - Court 1	Kalle Koljonen	Sai Praneeth B.	2	0	36	Kalle Koljonen	51	92655	\N
2023-02-17	John Barrable Hall - 4	Kalombo MULENGA	CHAN FUNG TING Xavier	2	1	38	Kalombo MULENGA	14	55024	\N
2023-02-18	John Barrable Hall - 4	Kalombo MULENGA	Jean Bernard BONGOUT	2	1	51	Kalombo MULENGA	14	55024	\N
2023-02-25	MTN Arena - 3	Kanishq M	Milan Dratva (Walkover)	0	0	0	Kanishq M	15	65081	\N
2023-02-23	MTN Arena - 1	Kanishq M	Danylo Bosniuk	2	1	49	Kanishq M	15	65081	\N
2023-02-24	MTN Arena - 2	Kanishq M	Matthias Kicklitz	2	0	31	Kanishq M	15	65081	\N
2023-02-25	MTN Arena - 2	Kanishq M	Ong Zhen Yi	2	0	36	Kanishq M	15	65081	\N
2023-01-12	Axiata Arena - Court 3	Kanta Tsuneyama	Chou Tien Chen	2	0	59	Kanta Tsuneyama	1	57823	\N
2023-04-01	Centro Deportivo Municipal Gallur - Court 1	Kanta Tsuneyama	Anders Antonsen	2	1	89	Kanta Tsuneyama	31	57823	\N
2023-06-21	Tian-Mu Arena - Court 2	Kanta Tsuneyama	S.Sankar Muthusamy Subramanian	2	0	37	Kanta Tsuneyama	78	57823	\N
2023-01-26	Istora Senayan - Court 1	Kanta Tsuneyama	Anders Antonsen	2	0	48	Kanta Tsuneyama	4	57823	\N
2023-03-31	Centro Deportivo Municipal Gallur - Court 2	Kanta Tsuneyama	Rasmus Gemke	2	1	76	Kanta Tsuneyama	31	57823	\N
2023-01-13	Axiata Arena - Court 1	Kanta Tsuneyama	Anthony Sinisuka Ginting	2	0	50	Kanta Tsuneyama	1	57823	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Kanta Tsuneyama	Ng Ka Long Angus	2	1	57	Kanta Tsuneyama	42	57823	\N
2023-04-28	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Kanta Tsuneyama	Prannoy H. S.	1	0	34	Kanta Tsuneyama	42	57823	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 1	Kanta Tsuneyama	Sameer Verma	2	0	43	Kanta Tsuneyama	31	57823	\N
2023-01-10	Axiata Arena - Court 2	Kanta Tsuneyama	Lee Cheuk Yiu	2	1	52	Kanta Tsuneyama	1	57823	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 2	Kanta Tsuneyama	Brian Yang	2	0	41	Kanta Tsuneyama	31	57823	\N
2023-03-08	Main Location - Court 2	Kanta Tsuneyama	Liew Daren	2	0	40	Kanta Tsuneyama	20	57823	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Kanta Tsuneyama	Prince Dahal	2	0	28	Kanta Tsuneyama	42	57823	\N
2023-01-25	Istora Senayan - Court 3	Kanta Tsuneyama	Prannoy H. S.	2	0	42	Kanta Tsuneyama	4	57823	\N
2023-01-18	K. D. Jadhav Indoor Hall - 2	Kantaphon Wangcharoen	Kenta Nishimoto	2	1	88	Kantaphon Wangcharoen	3	92508	\N
2023-01-11	Axiata Arena - Court 3	Kantaphon Wangcharoen	Brian Yang	2	1	59	Kantaphon Wangcharoen	1	92508	\N
2023-05-31	Indoor Stadium Huamark - Court 1	Kantaphon Wangcharoen	Luís Enrique Peñalver	2	0	31	Kantaphon Wangcharoen	56	92508	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 5	Karan Rajan Rajarajan	Kevin Barkman	2	0	28	Karan Rajan Rajarajan	5	72555	\N
2023-04-14	VELO-hall - 3	Karan Rajan Rajarajan	Valentin Singer	2	0	30	Karan Rajan Rajarajan	38	72555	\N
2023-04-15	VELO-hall - 4	Karan Rajan Rajarajan	Samuel Hsiao (Walkover)	0	0	0	Karan Rajan Rajarajan	38	72555	\N
2023-04-14	VELO-hall - 5	Karan Rajan Rajarajan	Matthew Abela	2	0	32	Karan Rajan Rajarajan	38	72555	\N
2023-05-26	Raiffeisen Sportpark - 1	Karan Rajan Rajarajan	Luka Wraber	2	0	38	Karan Rajan Rajarajan	55	72555	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Karan Rajan Rajarajan	Julien Scheiwiller	2	1	59	Karan Rajan Rajarajan	46	72555	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 4	Karan Rajan Rajarajan	Noah Haase	2	0	35	Karan Rajan Rajarajan	5	72555	\N
2023-05-27	Raiffeisen Sportpark - 2	Karan Rajan Rajarajan	Kuo Kuan Lin	2	0	40	Karan Rajan Rajarajan	55	72555	\N
2023-01-29	Tennis- og badmintonfélag Reykjavíkur - 1	Karan Rajan Rajarajan	Mathias Solgaard	2	0	39	Karan Rajan Rajarajan	5	72555	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 5	Karan Rajan Rajarajan	Valentin Singer	2	0	35	Karan Rajan Rajarajan	5	72555	\N
2023-06-06	Male’ Sports Complex - 1	Kartikey Gulshan Kumar	Pranay Katta	2	1	65	Kartikey Gulshan Kumar	60	64794	\N
2023-05-12	Sportenum - 5	Keishin Rimmer	Aditya Patil	2	1	46	Keishin Rimmer	49	98092	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Keishin Rimmer	Aleksanders Jakovlevs	2	1	46	Keishin Rimmer	41	98092	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Keishin Rimmer	Tomáš Vrbka	2	1	50	Keishin Rimmer	22	98092	\N
2023-03-09	Sportarena (Sportforum) Berlin - 1	Keishin Rimmer	Tian Qi Zhang	2	1	47	Keishin Rimmer	22	98092	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Keishin Rimmer	Alexis Minez	2	1	44	Keishin Rimmer	41	98092	\N
2023-04-06	-	Keishin Rimmer	Stithapragnya Reddy Saddi (Walkover)	0	0	0	Keishin Rimmer	36	98092	\N
2023-06-28	National Sport Complex - 3	Keisuke Fujiwara	Sie Zi Lok	2	0	42	Keisuke Fujiwara	82	93848	\N
2023-04-14	VELO-hall - 5	Keisuke Fujiwara	Jeppe Bruun	2	1	60	Keisuke Fujiwara	38	93848	\N
2023-06-06	Male’ Sports Complex - 2	Keita Makino	Sai Charan Koya	2	0	47	Keita Makino	60	78400	\N
2023-06-28	National Sport Complex - 3	Keita Makino	Soyombo Zoljargal	2	0	18	Keita Makino	82	78400	\N
2023-02-14	ABA - 3	Keith Mark Edison	Siale Molitika	2	0	19	Keith Mark Edison	12	69521	\N
2023-02-13	ABA - 2	Keith Mark Edison	Yifan Zhang	2	0	19	Keith Mark Edison	12	69521	\N
2023-02-13	ABA - 2	Ken Richardson	Jeremy Lemaitre	2	0	24	Ken Richardson	12	56428	\N
2023-03-10	Sportarena (Sportforum) Berlin - 6	Kenta Matsukawa	Sebastian Mikkelsen	2	0	36	Kenta Matsukawa	22	94252	\N
2023-03-02	Badmintonhall DEGIRO hall - 3	Kenta Matsukawa	Ho Yu Feng Julian	2	0	29	Kenta Matsukawa	18	94252	\N
2023-03-08	Sportarena (Sportforum) Berlin - 6	Kenta Matsukawa	Dhruv Negi	2	1	63	Kenta Matsukawa	22	94252	\N
2023-03-09	Sportarena (Sportforum) Berlin - 2	Kenta Matsukawa	Daniel Dvořák	2	0	29	Kenta Matsukawa	22	94252	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 2	Kenta Nishimoto	Arnaud Merkle (Walkover)	0	0	0	Kenta Nishimoto	31	85394	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Kenta Nishimoto	Chia Hao Lee	2	1	62	Kenta Nishimoto	31	85394	\N
2023-03-15	Utilita Arena Birmingham - 4	Kenta Nishimoto	Brian Yang	2	0	44	Kenta Nishimoto	25	85394	\N
2023-03-31	Centro Deportivo Municipal Gallur - Court 1	Kenta Nishimoto	Kidambi Srikanth	2	0	41	Kenta Nishimoto	31	85394	\N
2023-01-10	Axiata Arena - Court 1	Kenta Nishimoto	Kidambi Srikanth	2	0	42	Kenta Nishimoto	1	85394	\N
2023-04-05	Palais des Sports - 1	Kenta Nishimoto	Chia Hao Lee	2	0	51	Kenta Nishimoto	35	85394	\N
2023-04-01	Centro Deportivo Municipal Gallur - Court 1	Kenta Nishimoto	Toma Junior Popov	2	1	79	Kenta Nishimoto	31	85394	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Kenta Nishimoto	Jewel Angelo Albo	2	0	38	Kenta Nishimoto	42	85394	\N
2023-02-02	Nimibutr National Stadium - Court 2	Kenta Nishimoto	Anders Antonsen	2	1	90	Kenta Nishimoto	9	85394	\N
2023-05-25	Axiata Arena - Court 2	Kenta Nishimoto	Jonatan Christie	2	0	52	Kenta Nishimoto	53	85394	\N
2023-01-25	Istora Senayan - Court 1	Kenta Nishimoto	Christian Adinata	2	1	66	Kenta Nishimoto	4	85394	\N
2023-03-08	Main Location - Court 3	Kenta Nishimoto	Cheam June Wei	2	0	42	Kenta Nishimoto	20	85394	\N
2023-01-12	Axiata Arena - Court 1	Kenta Nishimoto	Jonatan Christie	2	0	52	Kenta Nishimoto	1	85394	\N
2023-02-01	Nimibutr National Stadium - Court 4	Kenta Nishimoto	Mithun Manjunath	2	0	45	Kenta Nishimoto	9	85394	\N
2023-04-02	Centro Deportivo Municipal Gallur - Court 1	Kenta Nishimoto	Kanta Tsuneyama	2	1	75	Kenta Nishimoto	31	85394	\N
2023-06-21	Tian-Mu Arena - Court 3	Kenta Nishimoto	Sholeh Aidil	2	0	33	Kenta Nishimoto	78	85394	\N
2023-03-09	Main Location - Court 1 - TV Court	Kenta Nishimoto	Loh Kean Yew	2	1	78	Kenta Nishimoto	20	85394	\N
2023-06-22	Tian-Mu Arena - Court 2	Kenta Nishimoto	Chan Yin Chak	2	0	40	Kenta Nishimoto	78	85394	\N
2023-05-24	Axiata Arena - Court 1	Kenta Nishimoto	Ng Tze Yong	2	1	83	Kenta Nishimoto	53	85394	\N
2023-03-10	Main Location - Court 1 - TV Court	Kento Momota	Kenta Nishimoto	2	1	74	Kento Momota	20	89785	\N
2023-03-08	Main Location - Court 1 - TV Court	Kento Momota	Shi Yu Qi	2	0	44	Kento Momota	20	89785	\N
2023-03-09	Main Location - Court 2	Kento Momota	Brian Yang	2	0	39	Kento Momota	20	89785	\N
2023-03-16	Coliseo de la Ciudad Deportiva - 3	Kevin Arokia Walter	Johnnie Torjussen	2	1	45	Kevin Arokia Walter	24	57594	\N
2023-06-03	Centro Entrenamiento Olimpico - 3	Kevin Arokia Walter	Justin Ma	2	0	35	Kevin Arokia Walter	59	57594	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 3	Kevin Arokia Walter	Filip Spoljarec	2	0	34	Kevin Arokia Walter	24	57594	\N
2023-06-02	Centro Entrenamiento Olimpico - 3	Kevin Arokia Walter	Sharum Durand Cardenas	2	0	27	Kevin Arokia Walter	59	57594	\N
2023-06-01	Centro Entrenamiento Olimpico - 1	Kevin Arokia Walter	Giovanni Toti	2	0	40	Kevin Arokia Walter	59	57594	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Kevin Arokia Walter	Fabrizio Valdivieso Negri	2	0	24	Kevin Arokia Walter	73	57594	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Kevin Arokia Walter	Brian Rodrigo Roque Caycho	2	0	34	Kevin Arokia Walter	73	57594	\N
2023-06-01	Centro Entrenamiento Olimpico - 1	Kevin Arokia Walter	Franco Motto	2	0	25	Kevin Arokia Walter	59	57594	\N
2023-06-08	Virgilio TRavieso Soto - 3	Kevin Arokia Walter	Yonatan Linarez	2	0	18	Kevin Arokia Walter	63	57594	\N
2023-06-22	Teodoro Palacios Flores - 2	Kevin Barkman	Fabián Alejandro Sagastume Bustamante	2	0	15	Kevin Barkman	77	88298	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 1	Kevin Barkman	Ivan Medynskiy	2	0	32	Kevin Barkman	5	88298	\N
2023-06-22	Teodoro Palacios Flores - 1	Kevin Barkman	Diego Trujillo Marrero	2	0	20	Kevin Barkman	77	88298	\N
2023-06-07	Gilbert C. Ada Gymnasium - 1 - Streaming	Kevin Cordon	Allan Zeng	2	0	17	Kevin Cordon	61	54897	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 1	Kevin Cordon	Victor Lai	2	1	56	Kevin Cordon	43	54897	\N
2023-05-03	CODE II Jalisco - 1	Kevin Cordon	Elias Bracke	2	0	31	Kevin Cordon	45	54897	\N
2023-05-04	CODE II Jalisco - 4	Kevin Cordon	Joakim Oldorff	2	0	38	Kevin Cordon	45	54897	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 4	Kevin Cordon	Davi Silva	2	0	36	Kevin Cordon	43	54897	\N
2023-05-03	CODE II Jalisco - 1	Kevin Cordon	Victor Lai	2	0	38	Kevin Cordon	45	54897	\N
2023-05-05	CODE II Jalisco - 2	Kevin Cordon	Arnaud Merkle	2	1	57	Kevin Cordon	45	54897	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Kevin Cordon	Frank Barrios	2	0	24	Kevin Cordon	43	54897	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Kevin Cordon	Choi Pyeong Gang	2	1	45	Kevin Cordon	71	54897	\N
2023-02-13	ABA - 1	Kevin Xu	David Piakura	2	0	19	Kevin Xu	12	98782	\N
2023-02-28	MTN Arena - COURT 1	Khemtish Rai Nundah	Nathan Muganga Nsibambi	2	0	14	Khemtish Rai Nundah	17	96008	\N
2023-02-27	MTN Arena - COURT 2	Khemtish Rai Nundah	Reagan Micheal Nsubuga	2	0	25	Khemtish Rai Nundah	17	96008	\N
2023-02-17	John Barrable Hall - 2	Khemtish Rai NUNDAH	Antoine Eddy OWONA NDIMAKO	1	0	27	Khemtish Rai NUNDAH	14	96008	\N
2023-02-28	MTN Arena - COURT 1	Khemtish Rai Nundah	Riyan Malhan	2	1	40	Khemtish Rai Nundah	17	96008	\N
2023-06-10	Cido Arena - Court 2	Kian-Yu Oei	Henrikho Kho Wibowo	2	0	35	Kian-Yu Oei	66	57322	\N
2023-06-09	Cido Arena - Court 4	Kian-Yu Oei	Mikolaj Szymanowski	2	0	38	Kian-Yu Oei	66	57322	\N
2023-06-10	Cido Arena - Court 3	Kian-Yu Oei	Prahdiska Bagas Shujiwo	2	1	69	Kian-Yu Oei	66	57322	\N
2023-06-11	Cido Arena - Court 2	Kian-Yu Oei	Nicolas A. Mueller	2	0	38	Kian-Yu Oei	66	57322	\N
2023-05-24	Axiata Arena - Court 2	Kidambi Srikanth	Toma Junior Popov	2	0	37	Kidambi Srikanth	53	93627	\N
2023-03-22	St. Jakobshalle Basel - 1	Kidambi Srikanth	Weng Hong Yang	2	1	70	Kidambi Srikanth	28	93627	\N
2023-05-25	Axiata Arena - Court 3	Kidambi Srikanth	Kunlavut Vitidsarn	2	0	45	Kidambi Srikanth	53	93627	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 4	Kidambi Srikanth	Sai Praneeth B.	2	0	36	Kidambi Srikanth	31	93627	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Kidambi Srikanth	Sitthikom Thammasin	2	1	65	Kidambi Srikanth	31	93627	\N
2023-03-15	Utilita Arena Birmingham - 2 12BET	Kidambi Srikanth	Toma Junior Popov	2	1	63	Kidambi Srikanth	25	93627	\N
2023-06-06	Singapore Indoor Stadium - 2	Kidambi Srikanth	Kantaphon Wangcharoen	2	0	43	Kidambi Srikanth	62	93627	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 4	Kidambi Srikanth	Adnan Ebrahim	2	0	25	Kidambi Srikanth	42	93627	\N
2023-06-15	Istora - 3	Kidambi Srikanth	Lakshya Sen	2	0	45	Kidambi Srikanth	70	93627	\N
2023-06-14	Istora - 3	Kidambi Srikanth	Lu Guang Zu	2	0	46	Kidambi Srikanth	70	93627	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 2	Kim Bruun	Christopher Vittoriani	2	0	41	Kim Bruun	46	96545	\N
2023-06-20	Binjiang Gymnasium - 4	King Kien Hwa	Ricky Cheng	2	0	37	King Kien Hwa	75	75713	\N
2023-06-08	Male’ Sports Complex - 3	Kiran George	Daniil Dubovenko	2	0	30	Kiran George	60	68317	\N
2023-02-01	Nimibutr National Stadium - Court 4	Kiran George	Chia Hao Lee	2	1	63	Kiran George	9	68317	\N
2023-05-31	Indoor Stadium Huamark - Court 4	Kiran George	Shi Yu Qi	2	0	47	Kiran George	56	68317	\N
2023-06-07	Male’ Sports Complex - 3	Kiran George	Alap Mishra	2	1	40	Kiran George	60	68317	\N
2023-06-01	Indoor Stadium Huamark - Court 2	Kiran George	Weng Hong Yang	2	0	39	Kiran George	56	68317	\N
2023-06-08	Male’ Sports Complex - 4	Kiran George	Varun Kapur	2	0	40	Kiran George	60	68317	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 4	Kiran George	Mithun Manjunath	2	0	38	Kiran George	31	68317	\N
2023-06-06	Male’ Sports Complex - 3	Kiran George	Tukum Laa	2	1	61	Kiran George	60	68317	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 4	Kiran Kumar Mekala	Oleksandar Shmundyak	2	0	56	Kiran Kumar Mekala	5	92114	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 1	Kiran Kumar Mekala	Samuel O’Brien Ricketts	2	0	39	Kiran Kumar Mekala	5	92114	\N
2023-05-13	Sportenum - 4	Kjell Wagener	Leo Boichat	2	0	22	Kjell Wagener	49	98680	\N
2023-05-12	Sportenum - 2	Kjell Wagener	Luc Thalmann	2	0	28	Kjell Wagener	49	98680	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Kjell Wagener	Andrej Suchy	2	0	34	Kjell Wagener	22	98680	\N
2023-01-13	Axiata Arena - Court 2	Kodai Naraoka	Prannoy H. S.	2	1	84	Kodai Naraoka	1	62063	\N
2023-01-12	Axiata Arena - Court 2	Kodai Naraoka	Ng Tze Yong	2	1	92	Kodai Naraoka	1	62063	\N
2023-06-14	Istora - 2	Kodai Naraoka	Anders Antonsen	2	1	82	Kodai Naraoka	70	62063	\N
2023-01-11	Axiata Arena - Court 1	Kodai Naraoka	Lee Zii Jia	2	1	73	Kodai Naraoka	1	62063	\N
2023-06-15	Istora - 1	Kodai Naraoka	Shi Yu Qi	2	1	80	Kodai Naraoka	70	62063	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Kodai Naraoka	Kidambi Srikanth	2	1	72	Kodai Naraoka	42	62063	\N
2023-01-14	Axiata Arena - Court 1	Kodai Naraoka	Kunlavut Vitidsarn	2	1	113	Kodai Naraoka	1	62063	\N
2023-03-16	Utilita Arena Birmingham - 2 12BET	Kodai Naraoka	Kidambi Srikanth	2	0	51	Kodai Naraoka	25	62063	\N
2023-05-24	Axiata Arena - Court 2	Kodai Naraoka	Chia Hao Lee	2	0	54	Kodai Naraoka	53	62063	\N
2023-03-15	Utilita Arena Birmingham - 2 12BET	Kodai Naraoka	Lu Guang Zu	0	0	10	Kodai Naraoka	25	62063	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Kodai Naraoka	Bharath Latheesh	2	0	23	Kodai Naraoka	42	62063	\N
2023-06-09	Singapore Indoor Stadium - 1	Kodai Naraoka	Shi Yu Qi	2	0	41	Kodai Naraoka	62	62063	\N
2023-05-25	Axiata Arena - Court 2	Kodai Naraoka	Rasmus Gemke	2	0	63	Kodai Naraoka	53	62063	\N
2023-06-08	Singapore Indoor Stadium - 1	Kodai Naraoka	Priyanshu Rajawat	2	0	47	Kodai Naraoka	62	62063	\N
2023-06-06	Singapore Indoor Stadium - 3	Kodai Naraoka	Prannoy H. S.	2	0	56	Kodai Naraoka	62	62063	\N
2023-03-21	Tay Ho District Stadium - 2	Kok Jing Hong	Jia Wei Joel Koh	2	1	70	Kok Jing Hong	29	82372	\N
2023-06-06	Male’ Sports Complex - 4	Kok Jing Hong	Yash Yogi	2	0	37	Kok Jing Hong	60	82372	\N
2023-03-23	Tay Ho District Stadium - 3	Kok Jing Hong	Lee Shun Yang	2	1	54	Kok Jing Hong	29	82372	\N
2023-03-08	Terminal 21 Korat - Court3	Kok Jing Hong	Ravi Ravi	2	0	35	Kok Jing Hong	19	82372	\N
2023-03-07	Terminal 21 Korat - Court2	Kok Jing Hong	Chen Chi Ting	2	0	39	Kok Jing Hong	19	82372	\N
2023-03-22	Tay Ho District Stadium - 3	Kok Jing Hong	Chirag Sen	2	0	45	Kok Jing Hong	29	82372	\N
2023-03-25	St. Jakobshalle Basel - 1	Koki Watanabe	Lee Zii Jia	2	0	27	Koki Watanabe	28	97174	\N
2023-02-01	Nimibutr National Stadium - Court 2	Koki Watanabe	Brian Yang	2	0	37	Koki Watanabe	9	97174	\N
2023-03-24	St. Jakobshalle Basel - 1	Koki Watanabe	Lee Cheuk Yiu	2	0	38	Koki Watanabe	28	97174	\N
2023-03-23	St. Jakobshalle Basel - 1	Koki Watanabe	Toma Junior Popov	2	1	59	Koki Watanabe	28	97174	\N
2023-03-22	St. Jakobshalle Basel - 4	Koki Watanabe	Sitthikom Thammasin	2	0	30	Koki Watanabe	28	97174	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Koki Watanabe	Wang Tzu Wei	2	1	52	Koki Watanabe	31	97174	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 3	Koki Watanabe	Christo Popov	2	0	46	Koki Watanabe	31	97174	\N
2023-04-05	Palais des Sports - 2	Koki Watanabe	Kanta Tsuneyama	2	1	47	Koki Watanabe	35	97174	\N
2023-03-26	St. Jakobshalle Basel - 1	Koki Watanabe	Chou Tien Chen	2	1	74	Koki Watanabe	28	97174	\N
2023-03-22	Tay Ho District Stadium - 2	Koo Takahashi	Tharun Mannepalli	2	0	43	Koo Takahashi	29	86230	\N
2023-03-30	Main Location - 6	Koo Takahashi	Ikhsan Leonardo Imanuel Rumbay	2	0	51	Koo Takahashi	32	86230	\N
2023-03-30	Main Location - 4	Koo Takahashi	Lin Kuan-Ting	2	0	54	Koo Takahashi	32	86230	\N
2023-06-08	Gilbert C. Ada Gymnasium - 1 - Streaming	Koo Takahashi	Cheng-Han Tsai	2	1	66	Koo Takahashi	61	86230	\N
2023-06-07	Gilbert C. Ada Gymnasium - 3	Koo Takahashi	Lee Dong Keun	2	0	60	Koo Takahashi	61	86230	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Koo Takahashi	Chen Shao-Hsuan	2	0	34	Koo Takahashi	61	86230	\N
2023-03-07	Terminal 21 Korat - Court2	Koo Takahashi	Lim Chong King	2	0	40	Koo Takahashi	19	86230	\N
2023-03-31	Main Location - 3	Koo Takahashi	Minoru Koga	2	0	55	Koo Takahashi	32	86230	\N
2023-01-13	Kalevi Spordihall - 5 Radisson Blu	Koo Takahashi	Christian Faust Kjær	2	0	27	Koo Takahashi	2	86230	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Korakrit Laotrakul	Tarun Reddy Katam	2	1	61	Korakrit Laotrakul	23	75565	\N
2023-06-28	National Sport Complex - 2	Koshiro Moriguchi	Yesun- Erdene Munkhbaatar	2	0	19	Koshiro Moriguchi	82	65788	\N
2023-03-30	Main Location - 2	Koshiro Moriguchi	Rohan Midha	2	0	33	Koshiro Moriguchi	32	65788	\N
2023-05-12	IFU Arena - 3.Uppsala	Krishna Adi Nugraha	B. R. Sankeerth	2	0	41	Krishna Adi Nugraha	48	68647	\N
2023-05-13	IFU Arena - 2.Sportity	Krishna Adi Nugraha	Lin Kuan-Ting	2	1	73	Krishna Adi Nugraha	48	68647	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Krishna Adi Nugraha	Grégoire Deschamp	2	0	39	Krishna Adi Nugraha	46	68647	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Krishna Adi Nugraha	Matthew Abela	2	0	29	Krishna Adi Nugraha	46	68647	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 2	Krishna Adi Nugraha	Huang Yu	2	1	53	Krishna Adi Nugraha	46	68647	\N
2023-05-12	IFU Arena - 5.Unidamp	Krishna Adi Nugraha	Matthias Kicklitz	2	0	39	Krishna Adi Nugraha	48	68647	\N
2023-01-21	K. D. Jadhav Indoor Hall - 1	Kunlavut Vitidsarn	Anthony Sinisuka Ginting	2	0	58	Kunlavut Vitidsarn	3	64032	\N
2023-01-11	Axiata Arena - Court 2	Kunlavut Vitidsarn	Shesar Hiren Rhustavito	2	1	76	Kunlavut Vitidsarn	1	64032	\N
2023-01-12	Axiata Arena - Court 4	Kunlavut Vitidsarn	Kantaphon Wangcharoen	2	0	57	Kunlavut Vitidsarn	1	64032	\N
2023-01-13	Axiata Arena - Court 2	Kunlavut Vitidsarn	Loh Kean Yew	2	1	80	Kunlavut Vitidsarn	1	64032	\N
2023-01-18	K. D. Jadhav Indoor Hall - 1	Kunlavut Vitidsarn	Ng Ka Long Angus	2	0	40	Kunlavut Vitidsarn	3	64032	\N
2023-01-19	K. D. Jadhav Indoor Hall - 3	Kunlavut Vitidsarn	Anders Antonsen	2	1	72	Kunlavut Vitidsarn	3	64032	\N
2023-01-20	K. D. Jadhav Indoor Hall - 1	Kunlavut Vitidsarn	Loh Kean Yew	2	0	39	Kunlavut Vitidsarn	3	64032	\N
2023-01-22	K. D. Jadhav Indoor Hall - 1	Kunlavut Vitidsarn	Viktor Axelsen	2	1	64	Kunlavut Vitidsarn	3	64032	\N
2023-06-09	Singapore Indoor Stadium - 1	Kunlavut Vitidsarn	Christo Popov	2	0	40	Kunlavut Vitidsarn	62	64032	\N
2023-06-08	Singapore Indoor Stadium - 2	Kunlavut Vitidsarn	Ng Tze Yong	2	1	66	Kunlavut Vitidsarn	62	64032	\N
2023-06-07	Singapore Indoor Stadium - 1	Kunlavut Vitidsarn	Wang Tzu Wei	2	1	68	Kunlavut Vitidsarn	62	64032	\N
2023-06-04	Indoor Stadium Huamark - Court 1	Kunlavut Vitidsarn	Lee Cheuk Yiu	2	0	38	Kunlavut Vitidsarn	56	64032	\N
2023-06-03	Indoor Stadium Huamark - Court 1	Kunlavut Vitidsarn	Lakshya Sen	2	1	75	Kunlavut Vitidsarn	56	64032	\N
2023-06-02	Indoor Stadium Huamark - Court 1	Kunlavut Vitidsarn	Lu Guang Zu	2	1	73	Kunlavut Vitidsarn	56	64032	\N
2023-06-01	Indoor Stadium Huamark - Court 1	Kunlavut Vitidsarn	Chico Aura Dwi Wardoyo	2	1	67	Kunlavut Vitidsarn	56	64032	\N
2023-05-31	Indoor Stadium Huamark - Court 1	Kunlavut Vitidsarn	Mithun Manjunath	2	1	67	Kunlavut Vitidsarn	56	64032	\N
2023-05-24	Axiata Arena - Court 4	Kunlavut Vitidsarn	Kanta Tsuneyama	2	0	59	Kunlavut Vitidsarn	53	64032	\N
2023-03-15	Utilita Arena Birmingham - 1 Minoru Yoneyama	Kunlavut Vitidsarn	Kento Momota	2	0	61	Kunlavut Vitidsarn	25	64032	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 4	Kunlavut Vitidsarn	Viren Nettasinghe	2	0	26	Kunlavut Vitidsarn	42	64032	\N
2023-06-01	Erwin Kranz Halle - 1	Kuo Kuan Lin	Kian-Yu Oei	2	1	66	Kuo Kuan Lin	58	59077	\N
2023-05-26	Raiffeisen Sportpark - 2	Kuo Kuan Lin	Samuel Hsiao	2	0	39	Kuo Kuan Lin	55	59077	\N
2023-03-21	Tay Ho District Stadium - 4	Kuo Kuan Lin	Chen Chi Ting	2	0	33	Kuo Kuan Lin	29	59077	\N
2023-03-23	Tay Ho District Stadium - 4	Kuo Kuan Lin	Alap Mishra	2	0	30	Kuo Kuan Lin	29	59077	\N
2023-06-03	Erwin Kranz Halle - 3	Kuo Kuan Lin	Dimitar Yanakiev	2	1	58	Kuo Kuan Lin	58	59077	\N
2023-06-02	Erwin Kranz Halle - 3	Kuo Kuan Lin	Hsu Yu-Han	2	0	32	Kuo Kuan Lin	58	59077	\N
2023-06-02	Erwin Kranz Halle - 4	Kuo Kuan Lin	Jan Jireh Lee	1	1	63	Kuo Kuan Lin	58	59077	\N
2023-03-22	Tay Ho District Stadium - 3	Kuo Kuan Lin	Shahyar Shaqeem	2	0	45	Kuo Kuan Lin	29	59077	\N
2023-02-01	Afrasiabi Hall - court 3	Kuo Kuan Lin	Milan Dratva	2	1	59	Kuo Kuan Lin	8	59077	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Kuo Li-Chun	Javier Armando Alas	2	0	40	Kuo Li-Chun	73	71959	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Kuo Li-Chun	Shubh Krishan	2	0	20	Kuo Li-Chun	73	71959	\N
2023-06-08	Virgilio TRavieso Soto - 3	Kuo Li-Chun	Georges Julien Paul	2	1	59	Kuo Li-Chun	63	71959	\N
2023-06-08	Virgilio TRavieso Soto - 3	Kuo Li-Chun	Manuel Mejia	2	0	31	Kuo Li-Chun	63	71959	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Lakshay Sharma	Lee Jong Min	2	1	64	Lakshay Sharma	18	61880	\N
2023-03-10	Sportarena (Sportforum) Berlin - 5	Lakshay Sharma	Moh. Zaki Ubaidillah	2	1	67	Lakshay Sharma	22	61880	\N
2023-03-09	Sportarena (Sportforum) Berlin - 3	Lakshay Sharma	Marek Waliszewski	2	0	23	Lakshay Sharma	22	61880	\N
2023-05-31	Indoor Stadium Huamark - Court 3	Lakshya Sen	Wang Tzu Wei	2	1	70	Lakshya Sen	56	68870	\N
2023-01-17	K. D. Jadhav Indoor Hall - 1	Lakshya Sen	Prannoy H. S.	2	0	45	Lakshya Sen	3	68870	\N
2023-05-24	Axiata Arena - Court 3	Lakshya Sen	Loh Kean Yew	2	1	55	Lakshya Sen	53	68870	\N
2023-03-14	Utilita Arena Birmingham - 1 Minoru Yoneyama	Lakshya Sen	Chou Tien Chen	2	0	49	Lakshya Sen	25	68870	\N
2023-06-01	Indoor Stadium Huamark - Court 3	Lakshya Sen	Li Shi Feng	2	0	49	Lakshya Sen	56	68870	\N
2023-06-02	Indoor Stadium Huamark - Court 3	Lakshya Sen	Leong Jun Hao	2	0	41	Lakshya Sen	56	68870	\N
2023-06-14	Istora - 2	Lakshya Sen	Lee Zii Jia	2	0	33	Lakshya Sen	70	68870	\N
2023-01-26	Istora Senayan - Court 1	Lakshya Sen	Ng Tze Yong	2	1	61	Lakshya Sen	4	68870	\N
2023-01-25	Istora Senayan - Court 2	Lakshya Sen	Kodai Naraoka	2	0	42	Lakshya Sen	4	68870	\N
2023-05-31	Center of Badminton - 3	Lance Gabriel Vargas	Ratmir Gilmanov	2	0	21	Lance Gabriel Vargas	57	78108	\N
2023-04-14	VELO-hall - 3	Larry Pong	Aram Mahmoud	2	1	42	Larry Pong	38	68727	\N
2023-03-04	Badmintonhall DEGIRO hall - 3	Lau Jun Hui Marcus	Ben Hammond	2	0	41	Lau Jun Hui Marcus	18	51123	\N
2023-03-09	Sportarena (Sportforum) Berlin - 6	Lau Jun Hui Marcus	Mark Obermeier	2	0	27	Lau Jun Hui Marcus	22	51123	\N
2023-03-03	Badmintonhall DEGIRO hall - 5	Lau Jun Hui Marcus	Søren Møller Thomsen	2	0	32	Lau Jun Hui Marcus	18	51123	\N
2023-05-12	Morodok Techo - 3	LAU Jun Hui Marcus	Zidane Evaldo COSTA GUSMAO DE JESUS	2	0	15	LAU Jun Hui Marcus	50	51123	\N
2023-03-10	Sportarena (Sportforum) Berlin - 6	Lau Jun Hui Marcus	Simone Piccinin	2	0	37	Lau Jun Hui Marcus	22	51123	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Lau Jun Hui Marcus	Salomon Adam Thomasen	2	1	49	Lau Jun Hui Marcus	18	51123	\N
2023-06-09	Cido Arena - Court 1	Lau Jun Hui Marcus	Remus Ng	2	0	48	Lau Jun Hui Marcus	66	51123	\N
2023-06-28	National Sport Complex - 1	Le Duc Phat	Keith Mark Edison	2	0	27	Le Duc Phat	82	69345	\N
2023-02-03	Afrasiabi Hall - court 1	Le Duc Phat	Dmitriy Panarin	2	0	40	Le Duc Phat	8	69345	\N
2023-06-06	Male’ Sports Complex - 1	Le Duc Phat	Somi Romdhani	2	0	45	Le Duc Phat	60	69345	\N
2023-06-20	Binjiang Gymnasium - 1	Le Duc Phat	Pang Fong Pui	2	0	33	Le Duc Phat	75	69345	\N
2023-06-07	Male’ Sports Complex - 1	Le Duc Phat	Keita Makino	2	1	67	Le Duc Phat	60	69345	\N
2023-02-01	Afrasiabi Hall - court 2	Le Duc Phat	Mohamad Pairavand	2	0	33	Le Duc Phat	8	69345	\N
2023-03-22	Tay Ho District Stadium - 1	Le Duc Phat	Siddhanth Gupta	2	0	40	Le Duc Phat	29	69345	\N
2023-03-24	Tay Ho District Stadium - 1	Le Duc Phat	Huang Yu Kai	2	1	62	Le Duc Phat	29	69345	\N
2023-03-21	Tay Ho District Stadium - 1	Le Duc Phat	Yeoh Seng Zoe	0	0	7	Le Duc Phat	29	69345	\N
2023-06-01	Center of Badminton - 1	Le Duc Phat	Somi Romdhani	2	0	37	Le Duc Phat	57	69345	\N
2023-06-01	Center of Badminton - 3	Le Duc Phat	Abhinav Thakur	2	0	44	Le Duc Phat	57	69345	\N
2023-06-02	Center of Badminton - 1	Le Duc Phat	Abhishek Saini	2	0	27	Le Duc Phat	57	69345	\N
2023-06-02	Center of Badminton - 2	Le Duc Phat	Rasindu Hendahewa	2	1	65	Le Duc Phat	57	69345	\N
2023-03-23	Tay Ho District Stadium - 1	Le Duc Phat	Heo Kwang Hee	2	1	58	Le Duc Phat	29	69345	\N
2023-03-25	Tay Ho District Stadium - 1	Le Duc Phat	Chan Yin Chak	2	0	47	Le Duc Phat	29	69345	\N
2023-02-02	Afrasiabi Hall - court 2	Le Duc Phat	S.Sankar Muthusamy Subramanian	2	0	29	Le Duc Phat	8	69345	\N
2023-05-12	Morodok Techo - 1	LE Duc Phat	Vannthoun VATH	2	0	24	LE Duc Phat	50	69345	\N
2023-06-01	Indoor Stadium Huamark - Court 1	Lee Cheuk Yiu	Magnus Johannesen	2	1	55	Lee Cheuk Yiu	56	94780	\N
2023-03-10	Main Location - Court 1 - TV Court	Lee Cheuk Yiu	Chia Hao Lee	2	0	43	Lee Cheuk Yiu	20	94780	\N
2023-03-22	St. Jakobshalle Basel - 2	Lee Cheuk Yiu	Lakshya Sen	2	0	34	Lee Cheuk Yiu	28	94780	\N
2023-05-31	Indoor Stadium Huamark - Court 3	Lee Cheuk Yiu	Rasmus Gemke	2	1	63	Lee Cheuk Yiu	56	94780	\N
2023-06-02	Indoor Stadium Huamark - Court 1	Lee Cheuk Yiu	Ng Tze Yong	2	0	53	Lee Cheuk Yiu	56	94780	\N
2023-06-03	Indoor Stadium Huamark - Court 2	Lee Cheuk Yiu	Toma Junior Popov	2	0	35	Lee Cheuk Yiu	56	94780	\N
2023-03-09	Main Location - Court 3	Lee Cheuk Yiu	Christo Popov	2	0	49	Lee Cheuk Yiu	20	94780	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Lee Cheuk Yiu	Ng Tze Yong	2	0	42	Lee Cheuk Yiu	42	94780	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Lee Cheuk Yiu	Shi Yu Qi	2	0	40	Lee Cheuk Yiu	42	94780	\N
2023-02-02	Nimibutr National Stadium - Court 3	Lee Cheuk Yiu	Kiran George	2	1	62	Lee Cheuk Yiu	9	94780	\N
2023-02-01	Nimibutr National Stadium - Court 4	Lee Cheuk Yiu	Riku Hatano	2	0	39	Lee Cheuk Yiu	9	94780	\N
2023-03-08	Main Location - Court 4	Lee Cheuk Yiu	Victor Svendsen	2	0	39	Lee Cheuk Yiu	20	94780	\N
2023-03-23	St. Jakobshalle Basel - 3	Lee Cheuk Yiu	Kidambi Srikanth	2	0	40	Lee Cheuk Yiu	28	94780	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Lee Dong Keun	Keith Mark Edison	2	0	31	Lee Dong Keun	61	64933	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Lee Dong Keun	Riku Hatano	2	1	72	Lee Dong Keun	71	64933	\N
2023-06-15	Gilbert C. Ada Gymnasium - 3	Lee Dong Keun	Yang Yang	2	1	66	Lee Dong Keun	71	64933	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Lee Dong Keun	Jack Yu	2	0	43	Lee Dong Keun	71	64933	\N
2023-05-12	Morodok Techo - 3	LEE Shun Yang	Hein HTUT	2	0	39	LEE Shun Yang	50	62615	\N
2023-03-22	Tay Ho District Stadium - 4	Lee Shun Yang	Bobby Setiabudi	2	0	33	Lee Shun Yang	29	62615	\N
2023-02-02	Afrasiabi Hall - court 2	Lee Shun Yang	Yohanes Saut Marcellyno	2	1	65	Lee Shun Yang	8	62615	\N
2023-03-30	Main Location - 5	Lee Shun Yang	Cheng-Han Tsai	2	0	40	Lee Shun Yang	32	62615	\N
2023-02-01	Afrasiabi Hall - court 2	Lee Shun Yang	Matin Moghimi	2	0	30	Lee Shun Yang	8	62615	\N
2023-05-14	Morodok Techo - 3	LEE Shun Yang	Panitchaphon TEERARATSAKUL	2	1	69	LEE Shun Yang	50	62615	\N
2023-03-21	Tay Ho District Stadium - 1	Lee Shun Yang	Su Li Yang	2	0	40	Lee Shun Yang	29	62615	\N
2023-03-15	Ruichang Sports Park Gym - Court 2	Lee Shun Yang	Zhu Tian Shun	2	1	54	Lee Shun Yang	23	62615	\N
2023-06-22	National Sports Complex - 2	Lee Yu-Jui	Zi Hin Chong	2	0	25	Lee Yu-Jui	76	86564	\N
2023-06-25	National Sports Complex - 1	Lee Yu-Jui	Zong Ruei Lee	2	0	32	Lee Yu-Jui	76	86564	\N
2023-05-12	Sportenum - 5	Lee Yu-Jui	Nolan Chanthakesone	2	0	26	Lee Yu-Jui	49	86564	\N
2023-06-23	National Sports Complex - 1	Lee Yu-Jui	Chua Min Han	2	0	40	Lee Yu-Jui	76	86564	\N
2023-06-24	National Sports Complex - 2	Lee Yu-Jui	Wei-Cheng Su	2	1	49	Lee Yu-Jui	76	86564	\N
2023-05-13	Sportenum - 3	Lee Yu-Jui	Hugo Themas	2	0	27	Lee Yu-Jui	49	86564	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Lee Yun Gyu	Liu Wei Chi	2	1	56	Lee Yun Gyu	61	79686	\N
2023-06-07	Gilbert C. Ada Gymnasium - 1 - Streaming	Lee Yun Gyu	Samuel Lee	2	0	30	Lee Yun Gyu	61	79686	\N
2023-06-08	Gilbert C. Ada Gymnasium - 3	Lee Yun Gyu	Yushi Tanaka	2	1	63	Lee Yun Gyu	61	79686	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Lee Yun Gyu	Ratchaphol Srithong (Walkover)	0	0	0	Lee Yun Gyu	71	79686	\N
2023-06-14	Gilbert C. Ada Gymnasium - 3	Lee Yun Gyu	Lin Yu Hsien	2	0	29	Lee Yun Gyu	71	79686	\N
2023-06-15	Gilbert C. Ada Gymnasium - 3	Lee Yun Gyu	Chi Yu Jen	2	1	56	Lee Yun Gyu	71	79686	\N
2023-06-16	Gilbert C. Ada Gymnasium - 1 - Streaming	Lee Yun Gyu	Max Weisskirchen	2	0	29	Lee Yun Gyu	71	79686	\N
2023-03-21	Tay Ho District Stadium - 3	Lee Yun Gyu	Raghu Mariswamy	2	1	50	Lee Yun Gyu	29	79686	\N
2023-03-22	St. Jakobshalle Basel - 2	Lee Zii Jia	Li Shi Feng	2	1	72	Lee Zii Jia	28	81561	\N
2023-01-18	K. D. Jadhav Indoor Hall - 1	Lee Zii Jia	Shesar Hiren Rhustavito	2	1	63	Lee Zii Jia	3	81561	\N
2023-01-25	Istora Senayan - Court 1	Lee Zii Jia	Lin Chun-Yi	2	0	41	Lee Zii Jia	4	81561	\N
2023-05-24	Axiata Arena - Court 1	Lee Zii Jia	Lu Guang Zu	2	0	45	Lee Zii Jia	53	81561	\N
2023-03-16	Utilita Arena Birmingham - 1 Minoru Yoneyama	Lee Zii Jia	Kenta Nishimoto	2	0	40	Lee Zii Jia	25	81561	\N
2023-03-15	Utilita Arena Birmingham - 1 Minoru Yoneyama	Lee Zii Jia	Sitthikom Thammasin	2	0	33	Lee Zii Jia	25	81561	\N
2023-03-08	Main Location - Court 2	Lee Zii Jia	Magnus Johannesen	2	0	27	Lee Zii Jia	20	81561	\N
2023-03-17	Utilita Arena Birmingham - 2 12BET	Lee Zii Jia	Kodai Naraoka	2	1	67	Lee Zii Jia	25	81561	\N
2023-03-23	St. Jakobshalle Basel - 1	Lee Zii Jia	Nhat Nguyen	2	0	51	Lee Zii Jia	28	81561	\N
2023-03-24	St. Jakobshalle Basel - 1	Lee Zii Jia	Chia Hao Lee	2	0	37	Lee Zii Jia	28	81561	\N
2023-04-09	Salle Everest - 2 - Vals	Lei Ci Fu	Ng In Qin	2	0	38	Lei Ci Fu	36	98304	\N
2023-04-08	Salle Everest - 3 - Carrefour	Lei Ci Fu	Yohann Osvald	2	0	34	Lei Ci Fu	36	98304	\N
2023-04-07	Salle Everest - 3 - Carrefour	Lei Ci Fu	Nathan Nguyen	2	0	29	Lei Ci Fu	36	98304	\N
2023-04-09	Salle Everest - 2 - Vals	Lei Ci Fu	Patcharakit Apiratchataset	2	0	58	Lei Ci Fu	36	98304	\N
2023-04-07	Salle Everest - 5 - Koesio	Lei Ci Fu	Baptiste Rolin	2	0	27	Lei Ci Fu	36	98304	\N
2023-04-08	Salle Everest - 3 - Carrefour	Lei Ci Fu	Adith Karthikeyan Priya	2	1	60	Lei Ci Fu	36	98304	\N
2023-06-22	Binjiang Gymnasium - 1	Lei Lan Xi	Wang Zheng Xing	1	0	12	Lei Lan Xi	75	91673	\N
2023-04-07	Palais des Sports - 1	Lei Lan Xi	Alex Lanier	2	0	48	Lei Lan Xi	35	91673	\N
2023-04-06	Palais des Sports - 1	Lei Lan Xi	Christo Popov	2	0	44	Lei Lan Xi	35	91673	\N
2023-04-05	Palais des Sports - 4	Lei Lan Xi	Kai Schaefer	2	0	39	Lei Lan Xi	35	91673	\N
\N	-	Lei Lan Xi	Liu Liang	2	0	38	Lei Lan Xi	75	91673	\N
2023-06-21	Binjiang Gymnasium - 1	Lei Lan Xi	Ong Tae Ern	2	0	30	Lei Lan Xi	75	91673	\N
2023-06-23	Binjiang Gymnasium - 1	Lei Lan Xi	Jason Gunawan	2	1	61	Lei Lan Xi	75	91673	\N
2023-06-24	Binjiang Gymnasium - 1	Lei Lan Xi	Nguyen Hai Dang	2	0	34	Lei Lan Xi	75	91673	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Leo Lee	Angel Argenis Marinez Ulloa	2	0	23	Leo Lee	43	88961	\N
2023-06-01	Centro Entrenamiento Olimpico - 2	Leo Lee	Fabrizio Tabini Pinasco	2	0	21	Leo Lee	59	88961	\N
2023-06-09	Cido Arena - Court 4	Leo Van Gysel	Lukasz Cimosz	2	0	33	Leo Van Gysel	66	85281	\N
2023-02-13	-	Leonard Manuel	Ronan Ho-Yagues (Walkover)	0	0	0	Leonard Manuel	12	70504	\N
2023-04-14	LOC Manege - 2	Leonardo Golovcenko	Yoav Eckshtein	2	0	26	Leonardo Golovcenko	39	80316	\N
2023-05-14	Morodok Techo - 1	LEONG Jun Hao	Jewel Angelo ALBO	2	0	46	LEONG Jun Hao	50	84838	\N
2023-05-13	Morodok Techo - 1	LEONG Jun Hao	Jia Wei Joel KOH	2	0	39	LEONG Jun Hao	50	84838	\N
2023-06-01	Indoor Stadium Huamark - Court 2	Leong Jun Hao	Christo Popov	2	1	76	Leong Jun Hao	56	84838	\N
2023-05-31	Indoor Stadium Huamark - Court 2	Leong Jun Hao	Sitthikom Thammasin	2	1	65	Leong Jun Hao	56	84838	\N
2023-04-05	Palais des Sports - 1	Leong Jun Hao	Sai Praneeth B.	2	0	47	Leong Jun Hao	35	84838	\N
2023-06-21	Tian-Mu Arena - Court 3	Leong Jun Hao	Kiran George	2	1	54	Leong Jun Hao	78	84838	\N
2023-04-06	Palais des Sports - 1	Leong Jun Hao	Koki Watanabe	2	0	50	Leong Jun Hao	35	84838	\N
2023-03-15	Utilita Arena Birmingham - 3	Li Shi Feng	Ng Ka Long Angus	1	0	26	Li Shi Feng	25	95476	\N
2023-03-16	Utilita Arena Birmingham - 4	Li Shi Feng	Zhao Jun Peng	2	0	34	Li Shi Feng	25	95476	\N
2023-03-17	Utilita Arena Birmingham - 1 Minoru Yoneyama	Li Shi Feng	Ng Tze Yong	2	0	41	Li Shi Feng	25	95476	\N
2023-03-18	Utilita Arena Birmingham - 1 Minoru Yoneyama	Li Shi Feng	Anders Antonsen	2	1	95	Li Shi Feng	25	95476	\N
2023-03-19	Utilita Arena Birmingham - 1 Minoru Yoneyama	Li Shi Feng	Shi Yu Qi	2	0	50	Li Shi Feng	25	95476	\N
2023-03-10	Main Location - Court 2	Li Shi Feng	Lin Chun-Yi	2	0	47	Li Shi Feng	20	95476	\N
2023-03-09	Main Location - Court 1 - TV Court	Li Shi Feng	Hans-Kristian Solberg Vittinghus	2	0	43	Li Shi Feng	20	95476	\N
2023-03-08	Main Location - Court 1 - TV Court	Li Shi Feng	Kunlavut Vitidsarn	1	0	28	Li Shi Feng	20	95476	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Li Shi Feng	Jeon Hyeok Jin	2	0	45	Li Shi Feng	42	95476	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Li Shi Feng	Kunlavut Vitidsarn	2	0	42	Li Shi Feng	42	95476	\N
2023-03-11	Main Location - Court 1 - TV Court	Li Shi Feng	Kento Momota	2	0	40	Li Shi Feng	20	95476	\N
2023-05-24	Axiata Arena - Court 3	Li Shi Feng	Lee Cheuk Yiu	2	0	44	Li Shi Feng	53	95476	\N
2023-05-31	Indoor Stadium Huamark - Court 2	Li Shi Feng	Cheam June Wei	2	1	78	Li Shi Feng	56	95476	\N
2023-06-07	Singapore Indoor Stadium - 2	Li Shi Feng	Cheam June Wei	2	1	75	Li Shi Feng	62	95476	\N
2023-06-08	Singapore Indoor Stadium - 2	Li Shi Feng	Weng Hong Yang	2	1	74	Li Shi Feng	62	95476	\N
2023-02-03	Nimibutr National Stadium - Court 1	Li Shi Feng	Sai Praneeth B.	2	1	84	Li Shi Feng	9	95476	\N
2023-02-02	Nimibutr National Stadium - Court 3	Li Shi Feng	Chan Yin Chak	2	0	49	Li Shi Feng	9	95476	\N
2023-02-01	Nimibutr National Stadium - Court 3	Li Shi Feng	Sameer Verma	2	0	38	Li Shi Feng	9	95476	\N
2023-06-14	Istora - 3	Li Shi Feng	Lee Cheuk Yiu	2	1	70	Li Shi Feng	70	95476	\N
2023-06-15	Istora - 2	Li Shi Feng	Loh Kean Yew	2	0	44	Li Shi Feng	70	95476	\N
2023-06-16	Istora - 1	Li Shi Feng	Kidambi Srikanth	2	1	69	Li Shi Feng	70	95476	\N
2023-01-19	K. D. Jadhav Indoor Hall - 2	Li Shi Feng	Lee Zii Jia	2	1	64	Li Shi Feng	3	95476	\N
2023-01-18	K. D. Jadhav Indoor Hall - 2	Li Shi Feng	Ng Tze Yong	2	0	49	Li Shi Feng	3	95476	\N
2023-06-21	Binjiang Gymnasium - 2	Li Yun Ze	Batdavaa Munkhbat	2	0	28	Li Yun Ze	75	72200	\N
2023-06-20	Binjiang Gymnasium - 2	Li Yun Ze	Mohamad Hafiz Mohamed Sikkander	2	0	38	Li Yun Ze	75	72200	\N
2023-04-06	Salle Everest - 5 - Koesio	Liano Panza	Joan Guasch	2	0	24	Liano Panza	36	95721	\N
2023-03-14	Ruichang Sports Park Gym - Court 2	Liao Jhuo-Fu	Luca Zhou	2	0	30	Liao Jhuo-Fu	23	64081	\N
2023-03-17	Ruichang Sports Park Gym - Court 3	Liao Jhuo-Fu	Gao Zheng Ze	0	0	9	Liao Jhuo-Fu	23	64081	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Liao Jhuo-Fu	Nathan Tang	2	0	26	Liao Jhuo-Fu	71	64081	\N
2023-06-07	Gilbert C. Ada Gymnasium - 3	Liao Jhuo-Fu	Takuma Obayashi	2	1	53	Liao Jhuo-Fu	61	64081	\N
2023-05-19	Sport hall Dras - Court 5	Liao Jhuo-Fu	Mark Caljouw	2	1	59	Liao Jhuo-Fu	51	64081	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Liao Jhuo-Fu	Zhao Chen Xun	2	0	32	Liao Jhuo-Fu	23	64081	\N
\N	-	Liao Jhuo-Fu	Pablo Abian (Walkover)	0	0	0	Liao Jhuo-Fu	61	64081	\N
2023-03-16	Ruichang Sports Park Gym - Court 4	Liao Jhuo-Fu	Takuma Kawamoto	2	0	39	Liao Jhuo-Fu	23	64081	\N
2023-06-11	Gilbert C. Ada Gymnasium - 1 - Streaming	Liao Jhuo-Fu	Jeon Hyeok Jin	2	0	31	Liao Jhuo-Fu	61	64081	\N
2023-06-10	Gilbert C. Ada Gymnasium - 2 - Streaming	Liao Jhuo-Fu	Su Li Yang	2	0	40	Liao Jhuo-Fu	61	64081	\N
2023-05-20	Sport hall Dras - Court 2	Liao Jhuo-Fu	Xiaodong Sheng	2	1	61	Liao Jhuo-Fu	51	64081	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Liao Jhuo-Fu	Jia Heng Jason Teh	2	0	32	Liao Jhuo-Fu	71	64081	\N
2023-06-09	Gilbert C. Ada Gymnasium - 1 - Streaming	Liao Jhuo-Fu	Cho Geonyeop	2	0	36	Liao Jhuo-Fu	61	64081	\N
2023-06-08	Gilbert C. Ada Gymnasium - 2 - Streaming	Liao Jhuo-Fu	Yang Yang	2	0	26	Liao Jhuo-Fu	61	64081	\N
2023-01-10	Axiata Arena - Court 2	Liew Daren	Toma Junior Popov	2	1	59	Liew Daren	1	52864	\N
2023-06-09	Royal Stage - 3	Lim Chong King	Joran Kweekel	2	0	35	Lim Chong King	64	92542	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Lim Chong King	Joran Kweekel	2	1	67	Lim Chong King	74	92542	\N
2023-03-21	Tay Ho District Stadium - 2	Lim Chong King	Subhankar Dey	2	1	65	Lim Chong King	29	92542	\N
2023-05-26	Axiata Arena - Court 1	Lin Chun-Yi	Kodai Naraoka	1	1	120	Lin Chun-Yi	53	86114	\N
2023-02-04	Nimibutr National Stadium - Court 1	Lin Chun-Yi	Shi Yu Qi	2	0	44	Lin Chun-Yi	9	86114	\N
2023-02-01	Nimibutr National Stadium - Court 3	Lin Chun-Yi	Weng Hong Yang	2	1	78	Lin Chun-Yi	9	86114	\N
2023-02-03	Nimibutr National Stadium - Court 2	Lin Chun-Yi	Kenta Nishimoto	2	0	30	Lin Chun-Yi	9	86114	\N
2023-03-09	Main Location - Court 4	Lin Chun-Yi	Zhao Jun Peng	2	1	67	Lin Chun-Yi	20	86114	\N
2023-05-25	Axiata Arena - Court 1	Lin Chun-Yi	Lee Zii Jia	2	1	87	Lin Chun-Yi	53	86114	\N
2023-03-08	Main Location - Court 4	Lin Chun-Yi	Mark Caljouw	2	1	58	Lin Chun-Yi	20	86114	\N
2023-02-02	Nimibutr National Stadium - Court 4	Lin Chun-Yi	Christian Adinata	2	0	35	Lin Chun-Yi	9	86114	\N
2023-03-22	St. Jakobshalle Basel - 4	Lin Chun-Yi	Brian Yang	2	1	61	Lin Chun-Yi	28	86114	\N
2023-05-24	Axiata Arena - Court 4	Lin Chun-Yi	Chico Aura Dwi Wardoyo	2	1	59	Lin Chun-Yi	53	86114	\N
2023-02-05	Nimibutr National Stadium - Court 1	Lin Chun-Yi	Ng Ka Long Angus	2	0	37	Lin Chun-Yi	9	86114	\N
2023-06-22	Tian-Mu Arena - Court 1	Lin Chun-Yi	Chou Tien Chen	2	1	65	Lin Chun-Yi	78	86114	\N
2023-05-12	IFU Arena - 5.Unidamp	Lin Kuan-Ting	Gustav Bjorkler	2	0	33	Lin Kuan-Ting	48	58639	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 2	Lin Kuan-Ting	Abhishek Yeligar	2	0	36	Lin Kuan-Ting	46	58639	\N
2023-03-30	Main Location - 5	Lin Kuan-Ting	Huang Yu Kai	2	1	61	Lin Kuan-Ting	32	58639	\N
2023-05-12	IFU Arena - 2.Sportity	Lin Kuan-Ting	Andi Fadel Muhammad	2	0	40	Lin Kuan-Ting	48	58639	\N
2023-03-22	Tay Ho District Stadium - 1	Lin Kuan-Ting	Tien Minh Nguyen	2	0	30	Lin Kuan-Ting	29	58639	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 4	Lin Kuan-Ting	Simon Baron-Vezilier	2	1	51	Lin Kuan-Ting	46	58639	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 2	Lin Kuan-Ting	Panji Ahmad Maulana	2	0	27	Lin Kuan-Ting	46	58639	\N
2023-03-21	Tay Ho District Stadium - 1	Lin Kuan-Ting	Sathish Kumar Karunakaran	2	0	43	Lin Kuan-Ting	29	58639	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Lin Yu Hsien	Brian Lubao	2	0	17	Lin Yu Hsien	71	91665	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Lin Yu Hsien	Nguyen Hai Dang	2	1	60	Lin Yu Hsien	61	91665	\N
2023-06-07	Gilbert C. Ada Gymnasium - 1 - Streaming	Lin Yu Hsien	Victor Lai	2	0	33	Lin Yu Hsien	61	91665	\N
2023-05-19	Sport hall Dras - Court 3	Lin Yu Hsien	Kartikey Gulshan Kumar	2	1	66	Lin Yu Hsien	51	91665	\N
2023-03-07	Terminal 21 Korat - Court4	Lin Yu Hsien	Lin Kuan-Ting	2	0	39	Lin Yu Hsien	19	91665	\N
2023-03-21	Tay Ho District Stadium - 2	Lin Yu Hsien	Alvi Wijaya Chairullah	2	0	48	Lin Yu Hsien	29	91665	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Liu Hai Chao	Korakrit Laotrakul	2	1	59	Liu Hai Chao	23	97959	\N
2023-03-16	Ruichang Sports Park Gym - Court 4	Liu Hai Chao	Liu Ze Qing	2	1	52	Liu Hai Chao	23	97959	\N
2023-06-20	Binjiang Gymnasium - 1	Liu Hao Da	Chung-Hsiang Yih	2	1	73	Liu Hao Da	75	13548	\N
2023-06-23	Binjiang Gymnasium - 4	Liu Liang	Wu Kai An	2	1	72	Liu Liang	75	92816	\N
2023-06-24	Binjiang Gymnasium - 2	Liu Liang	Zhang Wei Yi	2	1	76	Liu Liang	75	92816	\N
2023-06-21	Binjiang Gymnasium - 4	Liu Liang	Ng In Qin	2	0	34	Liu Liang	75	92816	\N
2023-03-16	Ruichang Sports Park Gym - Court 1	Liu Liang	Meiraba Luwang Maisnam	2	1	53	Liu Liang	23	92816	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Liu Liang	Huang Yu Kai	2	0	29	Liu Liang	23	92816	\N
2023-06-20	Binjiang Gymnasium - 2	Liu Liang	Hing Long Wong	2	0	31	Liu Liang	75	92816	\N
2023-03-14	Ruichang Sports Park Gym - Court 2	Liu Liang	Xiaodong Sheng	2	0	38	Liu Liang	23	92816	\N
2023-06-22	Binjiang Gymnasium - 3	Liu Liang	Yang Yang	2	1	52	Liu Liang	75	92816	\N
2023-03-22	Tay Ho District Stadium - 3	Liu Wei Chi	Hooi Shao Herng	2	1	53	Liu Wei Chi	29	69537	\N
2023-03-21	Tay Ho District Stadium - 2	Liu Wei Chi	Riku Hatano	2	0	30	Liu Wei Chi	29	69537	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Liu Wei Chi	Eveshgaran Vasigaran	2	1	49	Liu Wei Chi	71	69537	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Liu Ze Qing	Kok Jing Hong	2	0	47	Liu Ze Qing	23	98831	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Liu Ze Qing	Wong Yan Kit	2	0	29	Liu Ze Qing	23	98831	\N
2023-06-07	Singapore Indoor Stadium - 1	Loh Kean Yew	Lee Cheuk Yiu	2	0	41	Loh Kean Yew	62	76115	\N
2023-03-08	Main Location - Court 1 - TV Court	Loh Kean Yew	Mithun Manjunath	2	1	59	Loh Kean Yew	20	76115	\N
2023-01-18	K. D. Jadhav Indoor Hall - 1	Loh Kean Yew	Kodai Naraoka	2	1	56	Loh Kean Yew	3	76115	\N
2023-04-29	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Loh Kean Yew	Lu Guang Zu	2	0	42	Loh Kean Yew	42	76115	\N
2023-01-12	Axiata Arena - Court 1	Loh Kean Yew	Zhao Jun Peng	2	0	39	Loh Kean Yew	1	76115	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Loh Kean Yew	Bahaedeen Ahmad Alshannik	2	0	30	Loh Kean Yew	42	76115	\N
2023-01-19	K. D. Jadhav Indoor Hall - 2	Loh Kean Yew	Hans-Kristian Solberg Vittinghus	2	0	44	Loh Kean Yew	3	76115	\N
2023-06-14	Istora - 1	Loh Kean Yew	Chico Aura Dwi Wardoyo	2	0	45	Loh Kean Yew	70	76115	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Loh Kean Yew	Lakshya Sen	2	0	37	Loh Kean Yew	42	76115	\N
2023-04-28	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 1	Loh Kean Yew	Lee Cheuk Yiu	2	0	39	Loh Kean Yew	42	76115	\N
2023-01-11	Axiata Arena - Court 1	Loh Kean Yew	Li Shi Feng	2	0	51	Loh Kean Yew	1	76115	\N
2023-01-25	Istora Senayan - Court 3	Loh Kean Yew	Li Shi Feng	2	0	41	Loh Kean Yew	4	76115	\N
2023-02-17	John Barrable Hall - 1	Loic BERTIL	Paul KOPOLO	2	0	21	Loic BERTIL	14	59181	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Lok Hong Quan	Keishin Rimmer	2	0	26	Lok Hong Quan	22	55750	\N
2023-03-10	Sportarena (Sportforum) Berlin - 4	Lok Hong Quan	Adisak Prasertphetmanee	2	0	34	Lok Hong Quan	22	55750	\N
2023-03-09	Sportarena (Sportforum) Berlin - 2	Lok Hong Quan	Casper Spaans	2	0	25	Lok Hong Quan	22	55750	\N
2023-05-31	Center of Badminton - 3	Low Eu Cong	Gnana Harsha Jetty	2	0	31	Low Eu Cong	57	67825	\N
2023-06-01	Center of Badminton - 1	Low Eu Cong	Velasco Mark Anthony	2	0	38	Low Eu Cong	57	67825	\N
2023-06-01	Center of Badminton - 2	Low Eu Cong	Maxim Grinblat	2	0	26	Low Eu Cong	57	67825	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Lu Chia Hung	Fabian Roth	0	1	21	Lu Chia Hung	74	91254	\N
2023-03-09	Main Location - Court 2	Lu Guang Zu	Kanta Tsuneyama	2	0	51	Lu Guang Zu	20	77427	\N
2023-01-25	Istora Senayan - Court 1	Lu Guang Zu	Sitthikom Thammasin	2	1	69	Lu Guang Zu	4	77427	\N
2023-06-01	Indoor Stadium Huamark - Court 1	Lu Guang Zu	Kantaphon Wangcharoen	2	1	82	Lu Guang Zu	56	77427	\N
2023-05-31	Indoor Stadium Huamark - Court 4	Lu Guang Zu	Misha Zilberman	2	0	43	Lu Guang Zu	56	77427	\N
2023-06-06	Singapore Indoor Stadium - 3	Lu Guang Zu	Lin Chun-Yi	2	0	47	Lu Guang Zu	62	77427	\N
2023-01-26	Istora Senayan - Court 3	Lu Guang Zu	Toma Junior Popov	2	1	79	Lu Guang Zu	4	77427	\N
2023-04-28	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Lu Guang Zu	Kodai Naraoka	2	0	47	Lu Guang Zu	42	77427	\N
2023-03-08	Main Location - Court 3	Lu Guang Zu	Jan Louda	2	0	48	Lu Guang Zu	20	77427	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Lu Guang Zu	Chou Tien Chen	2	1	60	Lu Guang Zu	42	77427	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 2	Lu Guang Zu	Kantaphon Wangcharoen	2	0	44	Lu Guang Zu	42	77427	\N
2023-04-14	VELO-hall - 4	Lucas Claerbout	Markus Barth	2	0	33	Lucas Claerbout	38	89506	\N
2023-06-09	Royal Stage - 3	Lucas Claerbout	Samuel Hsiao	2	1	54	Lucas Claerbout	64	89506	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Lucas Claerbout	Lu Chia Hung	2	0	29	Lucas Claerbout	74	89506	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Lucas Claerbout	Samuel Hsiao	2	0	43	Lucas Claerbout	74	89506	\N
2023-05-03	CODE II Jalisco - 4	Lucas Claerbout	B. R. Sankeerth	2	1	60	Lucas Claerbout	45	89506	\N
2023-04-14	VELO-hall - 2	Lucas Claerbout	Joakim Oldorff	2	0	37	Lucas Claerbout	38	89506	\N
2023-05-12	IFU Arena - 1.Victor	Lucas Claerbout	Bodhi Ratana Teja Gotama	2	1	77	Lucas Claerbout	48	89506	\N
2023-04-15	VELO-hall - 1	Lucas Claerbout	S.Sankar Muthusamy Subramanian	2	1	68	Lucas Claerbout	38	89506	\N
2023-02-27	MTN Arena - COURT 1	Lucas Douce	Marvin Nicholas Bakaki	2	0	13	Lucas Douce	17	56114	\N
2023-02-14	ABA - 6	Lucas Juillot	Preston Lee	2	0	25	Lucas Juillot	13	68763	\N
2023-05-03	CODE II Jalisco - 3	Luis Armando Montoya Navarro	Mehad Shaikh	2	0	33	Luis Armando Montoya Navarro	45	74987	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Luis Armando Montoya Navarro	Sharum Durand Cardenas	2	0	24	Luis Armando Montoya Navarro	43	74987	\N
2023-04-05	Palais des Sports - 2	Luís Enrique Peñalver	Brice Leverdez	2	0	38	Luís Enrique Peñalver	35	71221	\N
2023-03-08	Main Location - Court 4	Luís Enrique Peñalver	Mads Christophersen	2	1	64	Luís Enrique Peñalver	20	71221	\N
2023-05-12	Sportenum - 1	Luis Pongratz	Liron Ubieto	2	0	25	Luis Pongratz	49	93302	\N
2023-01-27	Fyrishov - Court 1	Luis Pongratz	Sven Bosund	2	0	29	Luis Pongratz	7	93302	\N
2023-01-28	Fyrishov - Court 5	Luis Pongratz	Hugo Themas	2	0	35	Luis Pongratz	7	93302	\N
2023-02-25	PalaBadminton - 1	Luis Pongratz	Zyver John De Leon	2	0	34	Luis Pongratz	16	93302	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 5	Luis Pongratz	Ramon Rovira	2	0	37	Luis Pongratz	68	93302	\N
2023-01-27	-	Luis Pongratz	Frans Tegenmark (Walkover)	0	0	0	Luis Pongratz	7	93302	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 2	Luis Pongratz	Tommi Kaikkonen	2	0	30	Luis Pongratz	68	93302	\N
2023-01-28	Fyrishov - Court 1	Luis Pongratz	Nicolas Fouquet	2	0	41	Luis Pongratz	7	93302	\N
2023-02-24	PalaBadminton - 3	Luis Pongratz	Mats Duwel	2	1	52	Luis Pongratz	16	93302	\N
2023-01-29	Fyrishov - Court 1	Luis Pongratz	Luca Wiechmann	2	1	60	Luis Pongratz	7	93302	\N
2023-05-13	Sportenum - 4	Luis Pongratz	Marco Danti	2	0	33	Luis Pongratz	49	93302	\N
\N	-	Luis Ramon Garrido	Rithvik Sanjeevi Satish Kumar (Walkover)	0	0	0	Luis Ramon Garrido	71	97943	\N
2023-06-22	Teodoro Palacios Flores - 2	Luis Ramon Garrido	Diego Garcia Garcia	2	0	27	Luis Ramon Garrido	77	97943	\N
2023-06-22	Teodoro Palacios Flores - 1	Luis Ramon Garrido	Jonathan Molineros Ochoa	2	0	21	Luis Ramon Garrido	77	97943	\N
2023-03-24	Arena Jaskółka - Ministerstwo Sportu	Luka Wraber	Mateusz Danielak	2	1	60	Luka Wraber	30	56274	\N
2023-05-03	CODE II Jalisco - 2	Luka Wraber	Markus Barth	2	0	35	Luka Wraber	45	56274	\N
2023-05-03	CODE II Jalisco - 2	Luka Wraber	Yeison Esleiter Del Cid Alvarez	2	0	45	Luka Wraber	45	56274	\N
2023-06-09	Royal Stage - 5	Luka Wraber	Bahaedeen Ahmad Alshannik	2	0	44	Luka Wraber	64	56274	\N
2023-06-07	Male’ Sports Complex - 1	M Atef Haikal Taufik	Ansal Yadav	2	1	67	M Atef Haikal Taufik	60	81101	\N
2023-06-06	Male’ Sports Complex - 4	M Atef Haikal Taufik	Kalle Koljonen	2	1	58	M Atef Haikal Taufik	60	81101	\N
2023-01-13	Kalevi Spordihall - 5 Radisson Blu	Mads Christophersen	Fabio Caponio	2	0	33	Mads Christophersen	2	83938	\N
2023-06-10	Royal Stage - 1	Mads Christophersen	Jan Louda	2	0	43	Mads Christophersen	64	83938	\N
2023-06-16	Salle metropolitaine de la Trocardière - 2 - +2bad	Mads Christophersen	Parupalli Kashyap	2	0	35	Mads Christophersen	74	83938	\N
2023-06-09	Royal Stage - 2	Mads Christophersen	Felix Burestedt	2	0	36	Mads Christophersen	64	83938	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Mads Christophersen	Harry Huang	2	0	31	Mads Christophersen	74	83938	\N
2023-04-05	Palais des Sports - 4	Mads Christophersen	Lin Chun-Yi	2	0	35	Mads Christophersen	35	83938	\N
2023-06-09	Royal Stage - 5	Mads Christophersen	Alwi Farhan	2	0	45	Mads Christophersen	64	83938	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Mads Christophersen	Mads Juel Møller	2	0	33	Mads Christophersen	2	83938	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Mads Emil Monke	Luca Wiechmann	2	0	26	Mads Emil Monke	18	88756	\N
2023-03-03	Badmintonhall DEGIRO hall - 3	Mads Emil Monke	Sri Mohith Kothapalli	2	1	49	Mads Emil Monke	18	88756	\N
2023-03-04	Badmintonhall DEGIRO hall - 2	Mads Emil Monke	Sarun Rukcharoen	2	1	42	Mads Emil Monke	18	88756	\N
2023-03-09	Sportarena (Sportforum) Berlin - 1	Mads Emil Monke	Matthew Yu	2	0	28	Mads Emil Monke	22	88756	\N
2023-03-08	Sportarena (Sportforum) Berlin - 1	Mads Emil Monke	Richard Pavlik	2	1	42	Mads Emil Monke	22	88756	\N
2023-03-01	Badmintonhall DEGIRO hall - 3	Mads Emil Monke	Chua Min Han	2	0	31	Mads Emil Monke	18	88756	\N
2023-03-10	Sportarena (Sportforum) Berlin - 3	Mads Emil Monke	Pan Yin Long	2	0	28	Mads Emil Monke	22	88756	\N
2023-01-13	Kalevi Spordihall - 4 Tallinn	Mads Juel Møller	Rohan Midha	2	0	29	Mads Juel Møller	2	69875	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 1	Mads Juel Møller	Markus Barth	2	0	32	Mads Juel Møller	5	69875	\N
2023-04-14	VELO-hall - 5	Mads Juel Møller	Georges Julien Paul	2	0	34	Mads Juel Møller	38	69875	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 2	Mads Juel Møller	Justin Ma	2	1	52	Mads Juel Møller	5	69875	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 3	Mads Juel Møller	Grégoire Deschamp	2	1	54	Mads Juel Møller	5	69875	\N
2023-04-05	Palais des Sports - 1	Magnus Johannesen	Cheam June Wei	2	0	38	Magnus Johannesen	35	97030	\N
2023-04-06	Palais des Sports - 2	Magnus Johannesen	Christian Adinata	2	1	76	Magnus Johannesen	35	97030	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Magnus Johannesen	Luís Enrique Peñalver	2	1	50	Magnus Johannesen	31	97030	\N
2023-04-07	Palais des Sports - 1	Magnus Johannesen	Leong Jun Hao	2	0	51	Magnus Johannesen	35	97030	\N
2023-03-25	Arena Jaskółka - Ministerstwo Sportu	Magnus Johannesen	Max Weisskirchen	2	1	46	Magnus Johannesen	30	97030	\N
2023-05-31	Indoor Stadium Huamark - Court 2	Magnus Johannesen	Sameer Verma	2	0	43	Magnus Johannesen	56	97030	\N
2023-05-24	Axiata Arena - Court 4	Magnus Johannesen	Sitthikom Thammasin	2	1	53	Magnus Johannesen	53	97030	\N
2023-06-09	Royal Stage - 2	Magnus Johannesen	Parupalli Kashyap	2	0	33	Magnus Johannesen	64	97030	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Magnus Johannesen	Minoru Koga	2	0	40	Magnus Johannesen	2	97030	\N
2023-01-13	Kalevi Spordihall - 6 Badminton Estonia	Magnus Johannesen	Christopher Vittoriani	2	0	29	Magnus Johannesen	2	97030	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 1	Magnus Johannesen	Kiran George	2	0	31	Magnus Johannesen	31	97030	\N
2023-03-25	Arena Jaskółka - 1 ORLEN	Magnus Johannesen	B. R. Sankeerth	2	0	36	Magnus Johannesen	30	97030	\N
2023-04-08	Palais des Sports - 1	Magnus Johannesen	Lei Lan Xi	2	1	71	Magnus Johannesen	35	97030	\N
2023-01-14	Kalevi Spordihall - 2 Yonex	Magnus Johannesen	Huang Yu Kai	2	0	35	Magnus Johannesen	2	97030	\N
2023-03-24	Arena Jaskółka - 3	Magnus Johannesen	Victor Ørding Kauffmann	2	0	30	Magnus Johannesen	30	97030	\N
\N	-	Makhsut Tadzhibullaev	Mohd Nazman Mohd Salleh (Walkover)	0	0	0	Makhsut Tadzhibullaev	57	60664	\N
2023-05-31	Center of Badminton - 1	Manav Choudhary	Artyom Savatyugin	2	0	20	Manav Choudhary	57	66842	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Manuel Mejia	Maurice Martin	2	0	30	Manuel Mejia	73	86109	\N
2023-02-24	PalaBadminton - 5	Marco Danti	Tsvetan Ivanov	2	0	27	Marco Danti	16	57876	\N
2023-05-12	Sportenum - 3	Marco Danti	Serhii Marushchak	2	1	35	Marco Danti	49	57876	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 2	Marcus Viscovich	Karl Kert	2	0	34	Marcus Viscovich	5	58349	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 3	Mark Caljouw	Dimitar Yanakiev	2	0	40	Mark Caljouw	81	76973	\N
2023-06-16	Salle metropolitaine de la Trocardière - 4 - Renault Dacia	Mark Caljouw	Uriel Francisco Canjura Artiga	2	0	32	Mark Caljouw	74	76973	\N
2023-06-09	Royal Stage - 4	Mark Caljouw	Victor Ørding Kauffmann	2	0	30	Mark Caljouw	64	76973	\N
2023-06-10	Royal Stage - 2	Mark Caljouw	Wang Po-Wei	2	1	77	Mark Caljouw	64	76973	\N
2023-06-10	Royal Stage - 1	Mark Caljouw	Arnaud Merkle	2	0	45	Mark Caljouw	64	76973	\N
2023-06-16	Salle metropolitaine de la Trocardière - 4 - Renault Dacia	Mark Caljouw	Prahdiska Bagas Shujiwo	2	0	42	Mark Caljouw	74	76973	\N
2023-06-09	Royal Stage - 4	Mark Caljouw	Luka Wraber	2	0	28	Mark Caljouw	64	76973	\N
2023-02-10	Badminton Center Pécs - 6	Mark Koroša	Dmytro Shcherbatiuk	2	0	28	Mark Koroša	11	83567	\N
2023-02-24	PalaBadminton - 4	Mark Koroša	Timeo Lacour	2	0	28	Mark Koroša	16	83567	\N
2023-02-25	PalaBadminton - 1	Mark Koroša	Noah Haase	2	1	61	Mark Koroša	16	83567	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Mark Koroša	Ioannis Tambourlas	2	0	26	Mark Koroša	41	83567	\N
2023-04-22	Evangelos Florakis Sports Hall - 1	Mark Koroša	Riyan Malhan	2	0	27	Mark Koroša	41	83567	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 4	Mark Koroša	Luca Wiechmann	2	0	47	Mark Koroša	68	83567	\N
2023-04-22	Evangelos Florakis Sports Hall - 4	Mark Koroša	Noah Warning	2	0	36	Mark Koroša	41	83567	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 5	Mark Koroša	Tadej Jelenc	2	0	37	Mark Koroša	68	83567	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Mark Koroša	Quique Gil Andres	2	0	25	Mark Koroša	68	83567	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 1	Mark Koroša	Akseli Aalto	2	0	36	Mark Koroša	68	83567	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Mark Koroša	Harper Leigh	2	0	35	Mark Koroša	41	83567	\N
2023-02-25	PalaBadminton - 1	Mark Koroša	Alvaro Moran	2	0	34	Mark Koroša	16	83567	\N
2023-02-09	Badminton Center Pécs - 1	Mark Koroša	Balazs Kerekes	2	0	25	Mark Koroša	11	83567	\N
2023-06-08	Virgilio TRavieso Soto - 3	Mark Shelley Alcala	Phone Pyae Naing	2	0	38	Mark Shelley Alcala	63	87610	\N
2023-06-09	Virgilio TRavieso Soto - 1	Mark Shelley Alcala	Giovanni Toti	2	1	66	Mark Shelley Alcala	63	87610	\N
2023-06-22	Teodoro Palacios Flores - 3	Mark Shelley Alcala	Welton Menezes	2	0	25	Mark Shelley Alcala	77	87610	\N
2023-06-16	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Mark Shelley Alcala	Kuo Li-Chun	2	1	58	Mark Shelley Alcala	73	87610	\N
2023-06-08	Virgilio TRavieso Soto - 3	Mark Shelley Alcala	Job Castillo	2	1	72	Mark Shelley Alcala	63	87610	\N
2023-06-23	Teodoro Palacios Flores - 3	Mark Shelley Alcala	Kevin Barkman	2	0	30	Mark Shelley Alcala	77	87610	\N
2023-06-22	Teodoro Palacios Flores - 1	Mark Shelley Alcala	Santiago Uziel Lopez Martinez	2	0	20	Mark Shelley Alcala	77	87610	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Mark Shelley Alcala	Jose Guevara	2	0	32	Mark Shelley Alcala	73	87610	\N
2023-06-10	Virgilio TRavieso Soto - 1	Mark Shelley Alcala	Joel König	2	0	142	Mark Shelley Alcala	63	87610	\N
2023-06-24	Teodoro Palacios Flores - 2	Mark Shelley Alcala	Muhammad Halim As Sidiq	2	0	45	Mark Shelley Alcala	77	87610	\N
2023-05-03	CODE II Jalisco - 4	Mark Shelley Alcala	Brian Yang	2	0	31	Mark Shelley Alcala	45	87610	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Mark Shelley Alcala	Remo Blondet Martinez	2	0	35	Mark Shelley Alcala	73	87610	\N
2023-05-03	CODE II Jalisco - 2	Mark Shelley Alcala	Erick Trujillo Enriquez	2	0	31	Mark Shelley Alcala	45	87610	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 3	Markus Barth	Lukasz Cimosz	2	0	35	Markus Barth	5	67447	\N
2023-04-14	VELO-hall - 4	Markus Barth	Rohan Midha	2	1	55	Markus Barth	38	67447	\N
2023-02-10	Badminton Center Pécs - 1	Mateusz Golas	Calin Tudor Turcu	2	0	30	Mateusz Golas	11	61627	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 1	Mathias Solgaard	Kian-Yu Oei	2	0	35	Mathias Solgaard	5	82757	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 4	Mathias Solgaard	Kiran Kumar Mekala	2	1	61	Mathias Solgaard	5	82757	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 3	Mathias Solgaard	Heng Lin Ngan	2	0	43	Mathias Solgaard	5	82757	\N
2023-04-07	Salle Everest - 3 - Carrefour	Matteo Justel	Eakanath Kitkawinroj	2	0	47	Matteo Justel	36	68404	\N
2023-04-06	Salle Everest - 3 - Carrefour	Matteo Justel	Adam Burget	2	0	24	Matteo Justel	36	68404	\N
2023-03-01	Badmintonhall DEGIRO hall - 1	Matteo Justel	Bennet Möhles	2	0	16	Matteo Justel	18	68404	\N
2023-04-07	Salle Everest - 5 - Koesio	Matteo Justel	Nolhan Rihouey	2	0	23	Matteo Justel	36	68404	\N
2023-03-03	Badmintonhall DEGIRO hall - 4	Matteo Justel	Dhruv Negi	2	0	32	Matteo Justel	18	68404	\N
2023-03-02	Badmintonhall DEGIRO hall - 1	Matteo Justel	Jan Jireh Lee	2	0	39	Matteo Justel	18	68404	\N
2023-02-10	Badminton Center Pécs - 1	Matthew Cheung	Milan Mesterhazy	2	1	48	Matthew Cheung	11	62266	\N
2023-02-10	Badminton Center Pécs - 5	Matthew Cheung	Alejandro Lopez	2	0	25	Matthew Cheung	11	62266	\N
2023-02-09	Badminton Center Pécs - 4	Matthew Cheung	Roko Pipunić	2	0	25	Matthew Cheung	11	62266	\N
2023-06-09	Cido Arena - Court 1	Matthias Kicklitz	Joonas Korhonen	2	1	45	Matthias Kicklitz	66	51998	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Matthias Kicklitz	Kim Bruun	1	0	23	Matthias Kicklitz	46	51998	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 1	Matthias Kicklitz	Firman Abdul Kholik	2	1	58	Matthias Kicklitz	5	51998	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 3	Matthias Kicklitz	Jerome Pauquet	2	0	26	Matthias Kicklitz	46	51998	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 4	Matthias Kicklitz	Bruno Carvalho	2	0	32	Matthias Kicklitz	5	51998	\N
2023-06-11	Cido Arena - Court 1	Matthias Kicklitz	Kian-Yu Oei	2	0	33	Matthias Kicklitz	66	51998	\N
2023-02-23	MTN Arena - 3	Matthias Kicklitz	Samuel Hsiao	2	0	30	Matthias Kicklitz	15	51998	\N
2023-06-11	Cido Arena - Court 1	Matthias Kicklitz	Jason Christ Alexander	2	0	38	Matthias Kicklitz	66	51998	\N
2023-06-02	Erwin Kranz Halle - 5	Matthias Kicklitz	Zack Bobrowski	2	0	33	Matthias Kicklitz	58	51998	\N
2023-06-10	Cido Arena - Court 2	Matthias Kicklitz	Lau Jun Hui Marcus	2	1	64	Matthias Kicklitz	66	51998	\N
2023-06-02	Erwin Kranz Halle - 2	Matthias Kicklitz	Henrikho Kho Wibowo	2	0	31	Matthias Kicklitz	58	51998	\N
2023-01-29	Tennis- og badmintonfélag Reykjavíkur - 3	Matthias Kicklitz	Mads Juel Møller	2	1	55	Matthias Kicklitz	5	51998	\N
2023-06-10	Cido Arena - Court 2	Matthias Kicklitz	Thomas Fourcade	2	1	69	Matthias Kicklitz	66	51998	\N
2023-06-01	Erwin Kranz Halle - 2	Matthias Kicklitz	Mads Juel Møller	2	0	33	Matthias Kicklitz	58	51998	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 3	Matthias Kicklitz	Victor Ørding Kauffmann	2	0	33	Matthias Kicklitz	5	51998	\N
2023-01-29	Tennis- og badmintonfélag Reykjavíkur - 3	Matthias Kicklitz	Karan Rajan Rajarajan	2	1	57	Matthias Kicklitz	5	51998	\N
2023-03-24	Arena Jaskółka - 1 ORLEN	Max Weisskirchen	Jan Louda	2	1	62	Max Weisskirchen	30	84815	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Max Weisskirchen	Koo Takahashi	2	0	39	Max Weisskirchen	71	84815	\N
2023-06-30	National Sport Complex - 1	Max Weisskirchen	Somi Romdhani	2	1	51	Max Weisskirchen	82	84815	\N
2023-06-28	National Sport Complex - 1	Max Weisskirchen	Khuvituguldur Byambajav	2	0	22	Max Weisskirchen	82	84815	\N
2023-06-29	National Sport Complex - 3	Max Weisskirchen	Keisuke Fujiwara	2	1	57	Max Weisskirchen	82	84815	\N
2023-06-14	Gilbert C. Ada Gymnasium - 1 - Streaming	Max Weisskirchen	Elias Bracke	2	1	65	Max Weisskirchen	71	84815	\N
2023-06-15	Gilbert C. Ada Gymnasium - 2 - Streaming	Max Weisskirchen	Chen Chi Ting	2	1	57	Max Weisskirchen	71	84815	\N
2023-04-14	VELO-hall - 4	Max Weisskirchen	Elias Bracke	2	1	50	Max Weisskirchen	38	84815	\N
2023-05-03	CODE II Jalisco - 2	Max Weisskirchen	Derek Yu	2	0	19	Max Weisskirchen	45	84815	\N
2023-04-14	VELO-hall - 5	Max Weisskirchen	Dimitar Yanakiev	2	1	64	Max Weisskirchen	38	84815	\N
2023-05-03	CODE II Jalisco - 4	Max Weisskirchen	Howard Shu	2	0	26	Max Weisskirchen	45	84815	\N
2023-03-25	Arena Jaskółka - Ministerstwo Sportu	Max Weisskirchen	Luka Wraber	2	0	41	Max Weisskirchen	30	84815	\N
2023-05-31	Center of Badminton - 2	Maxim Grinblat	Abdul Voris Muminov	2	0	37	Maxim Grinblat	57	63750	\N
2023-03-30	City Sport Hall - Court 3	Mayan Mogilner	Rotem Siluk	2	0	25	Mayan Mogilner	34	86086	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Mayan Mogilner	Tadej Jelenc	2	0	27	Mayan Mogilner	41	86086	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Mayan Mogilner	Angelos Christoforou	2	0	13	Mayan Mogilner	41	86086	\N
2023-02-01	Afrasiabi Hall - court 1	Meiraba Luwang Maisnam	Amirhossein Hasani	2	0	22	Meiraba Luwang Maisnam	8	91651	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Meiraba Luwang Maisnam	Ong Ken Yon	2	0	42	Meiraba Luwang Maisnam	23	91651	\N
2023-03-08	Terminal 21 Korat - Court2	Meiraba Luwang Maisnam	Eveshgaran Vasigaran	2	0	31	Meiraba Luwang Maisnam	19	91651	\N
2023-03-07	Terminal 21 Korat - Court1	Meiraba Luwang Maisnam	Hooi Shao Herng	2	0	48	Meiraba Luwang Maisnam	19	91651	\N
2023-02-17	John Barrable Hall - 4	Melvin APPIAH	Chongo Ezra MULENGA	2	0	25	Melvin APPIAH	14	65648	\N
2023-02-17	John Barrable Hall - 4	Melvin APPIAH	Muzafaru LUBEGA	2	0	29	Melvin APPIAH	14	65648	\N
2023-06-16	Teodoro Palacios Flores - 2	Melvin Calzadilla	Jorge Andrés Villeda Solis	2	0	23	Melvin Calzadilla	72	77927	\N
2023-06-15	Teodoro Palacios Flores - 3	Melvin Calzadilla	William Javier Esteban Marroquin Mayen	2	0	23	Melvin Calzadilla	72	77927	\N
2023-03-19	Polideportivo Corredoria Arena - 1	Michael Ji	Rodrigo Sanjurjo	2	0	20	Michael Ji	26	85930	\N
2023-03-08	Sportarena (Sportforum) Berlin - 6	Michael Ji	Sebastian Pinkowicz	2	0	30	Michael Ji	22	85930	\N
2023-03-18	Polideportivo Corredoria Arena - 1	Michael Ji	Thomas Valther Pedersen	2	0	32	Michael Ji	26	85930	\N
2023-03-17	Polideportivo Corredoria Arena - 2	Michael Ji	Dev Vishnu	2	1	50	Michael Ji	26	85930	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Michael Ji	Marc Martin	2	0	27	Michael Ji	26	85930	\N
2023-03-18	Polideportivo Corredoria Arena - 4	Michael Ji	Tiago Berenguer	2	0	30	Michael Ji	26	85930	\N
2023-04-07	Salle Everest - 2 - Vals	Michael Pang	Marco Marie	2	0	24	Michael Pang	36	56250	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 5	Mikolaj Morawski	Vojtěch Strejček	2	0	23	Mikolaj Morawski	79	76831	\N
2023-03-17	Sports Hall - 2 Racis	Mikolaj Morawski	Dominik Tankevic	2	0	21	Mikolaj Morawski	27	76831	\N
2023-03-18	Sports Hall - 4 Bank Spółdzielczy	Mikolaj Morawski	Boris Popov	2	0	22	Mikolaj Morawski	27	76831	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Mikolaj Morawski	Muhammed Eren Bilgen	2	0	19	Mikolaj Morawski	79	76831	\N
2023-02-14	ABA - 2	Milain Lohith Ranasinghe	Ephraim Van Der Ley	2	0	19	Milain Lohith Ranasinghe	12	64223	\N
2023-02-23	MTN Arena - 3	Milan Dratva	Balraj Kajla	2	0	34	Milan Dratva	15	68819	\N
2023-02-24	MTN Arena - 3	Milan Dratva	Dumindu Abeywickrama	2	0	21	Milan Dratva	15	68819	\N
2023-01-13	Kalevi Spordihall - 3 Grano	Minoru Koga	Elias Bracke	2	0	39	Minoru Koga	2	80062	\N
2023-03-09	Terminal 21 Korat - Court4	Minoru Koga	Sholeh Aidil	2	0	33	Minoru Koga	19	80062	\N
2023-03-30	Main Location - 3	Minoru Koga	Ong Ken Yon	2	0	37	Minoru Koga	32	80062	\N
2023-03-30	Main Location - 6	Minoru Koga	Jia Wei Joel Koh	2	0	44	Minoru Koga	32	80062	\N
2023-03-08	Terminal 21 Korat - Court1	Minoru Koga	Nguyen Hai Dang	2	0	50	Minoru Koga	19	80062	\N
2023-03-11	Terminal 21 Korat - Court1	Minoru Koga	Takuma Obayashi	2	0	51	Minoru Koga	19	80062	\N
2023-03-12	Terminal 21 Korat - Court1	Minoru Koga	Chi Yu Jen	2	1	75	Minoru Koga	19	80062	\N
2023-03-10	Terminal 21 Korat - Court1	Minoru Koga	Jeon Hyeok Jin	2	0	48	Minoru Koga	19	80062	\N
2023-03-07	Terminal 21 Korat - Court1	Minoru Koga	Woraphop Chuenkha	2	0	36	Minoru Koga	19	80062	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 4	Misha Zilberman	Jonathan Matias	2	0	28	Misha Zilberman	31	52953	\N
2023-04-05	Palais des Sports - 2	Misha Zilberman	Soong Joo Ven	1	0	26	Misha Zilberman	35	52953	\N
2023-04-06	Palais des Sports - 2	Misha Zilberman	Luís Enrique Peñalver	2	1	54	Misha Zilberman	35	52953	\N
2023-05-03	CODE II Jalisco - 2	Misha Zilberman	Imran Wadia	2	0	22	Misha Zilberman	45	52953	\N
2023-05-03	CODE II Jalisco - 3	Misha Zilberman	Gergo Pytel	2	0	26	Misha Zilberman	45	52953	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 3	Misha Zilberman	Tobias Kuenzi	2	1	61	Misha Zilberman	81	52953	\N
2023-06-30	Arena Jaskółka Tarnów TOSiR - Court 1	Misha Zilberman	Felix Burestedt	2	1	78	Misha Zilberman	81	52953	\N
2023-03-22	St. Jakobshalle Basel - 3	Mithun Manjunath	Joran Kweekel	2	0	35	Mithun Manjunath	28	62720	\N
2023-04-05	Palais des Sports - 3	Mithun Manjunath	Victor Svendsen	2	0	48	Mithun Manjunath	35	62720	\N
2023-06-07	Male’ Sports Complex - 2	Mithun Manjunath	Velasco Mark Anthony	2	0	37	Mithun Manjunath	60	62720	\N
2023-06-08	Male’ Sports Complex - 3	Mithun Manjunath	Rasindu Hendahewa	2	1	55	Mithun Manjunath	60	62720	\N
2023-06-06	Male’ Sports Complex - 1	Mithun Manjunath	Chua Kim Sheng	2	0	45	Mithun Manjunath	60	62720	\N
2023-03-03	Badmintonhall DEGIRO hall - 2	Moh. Zaki Ubaidillah	Lakshay Sharma	2	0	37	Moh. Zaki Ubaidillah	18	60321	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Moh. Zaki Ubaidillah	Vojtěch Matuš	2	0	16	Moh. Zaki Ubaidillah	22	60321	\N
2023-03-04	Badmintonhall DEGIRO hall - 2	Moh. Zaki Ubaidillah	Lau Jun Hui Marcus	2	0	29	Moh. Zaki Ubaidillah	18	60321	\N
2023-03-04	Badmintonhall DEGIRO hall - 4	Moh. Zaki Ubaidillah	Ryan Putra Widyanto	2	0	32	Moh. Zaki Ubaidillah	18	60321	\N
2023-03-09	Sportarena (Sportforum) Berlin - 6	Moh. Zaki Ubaidillah	Robert Nebel	2	0	39	Moh. Zaki Ubaidillah	22	60321	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Moh. Zaki Ubaidillah	Kas Sacranie	2	0	19	Moh. Zaki Ubaidillah	18	60321	\N
2023-03-01	Badmintonhall DEGIRO hall - 4	Moh. Zaki Ubaidillah	Lokesh Reddy Kalagotla	2	0	31	Moh. Zaki Ubaidillah	18	60321	\N
2023-02-01	Afrasiabi Hall - court 2	Mohamad Hafiz Mohamed Sikkander	Raymond Sing	2	0	30	Mohamad Hafiz Mohamed Sikkander	8	95561	\N
2023-02-17	John Barrable Hall - 1	Mohamed Abdelaziz OUCHEFOUN	Thibaud COUGOUILLE	2	0	25	Mohamed Abdelaziz OUCHEFOUN	14	81874	\N
2023-02-17	John Barrable Hall - 3	Mohamed Abderrahime BELARBI	Kenneth Comfort MWAMBU	2	1	42	Mohamed Abderrahime BELARBI	14	99187	\N
2023-02-17	John Barrable Hall - 3	Mohamed Abderrahime BELARBI	Loic BERTIL	2	0	30	Mohamed Abderrahime BELARBI	14	99187	\N
2023-02-02	Afrasiabi Hall - court 3	Muhammad Faiq	Sulistio Tegar	2	1	67	Muhammad Faiq	8	92846	\N
2023-02-01	Afrasiabi Hall - court 3	Muhammad Faiq	Wong Yan Kit	2	0	28	Muhammad Faiq	8	92846	\N
2023-03-03	Badmintonhall DEGIRO hall - 3	Muhammad Faiq	Gagan Balyan	2	0	34	Muhammad Faiq	18	92846	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Muhammad Faiq	Adith Karthikeyan Priya	2	0	39	Muhammad Faiq	18	92846	\N
2023-03-09	Sportarena (Sportforum) Berlin - 2	Muhammad Faiq	Nachakorn Pusri	2	1	53	Muhammad Faiq	22	92846	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 1	Muhammad Halim As Sidiq	Hooman Bagheri	2	0	25	Muhammad Halim As Sidiq	24	89268	\N
2023-03-16	-	Muhammad Halim As Sidiq	Juan Carlos Bencomo Otaño	2	0	17	Muhammad Halim As Sidiq	24	89268	\N
2023-03-19	Coliseo de la Ciudad Deportiva - 1	Muhammad Halim As Sidiq	Muhammad Sultan Nurhabibu Mayang	2	1	107	Muhammad Halim As Sidiq	24	89268	\N
2023-06-22	Teodoro Palacios Flores - 3	Muhammad Halim As Sidiq	Alejandro Garcia Garcia	2	0	20	Muhammad Halim As Sidiq	77	89268	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Muhammad Halim As Sidiq	Daniel La Torre Regal	2	0	36	Muhammad Halim As Sidiq	73	89268	\N
2023-03-18	Coliseo de la Ciudad Deportiva - 1	Muhammad Halim As Sidiq	Daniil Dubovenko	2	1	110	Muhammad Halim As Sidiq	24	89268	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Muhammad Halim As Sidiq	Kevin Barkman	2	0	38	Muhammad Halim As Sidiq	73	89268	\N
2023-06-22	Teodoro Palacios Flores - 1	Muhammad Halim As Sidiq	Yeison Esleiter Del Cid Alvarez	2	0	30	Muhammad Halim As Sidiq	77	89268	\N
2023-06-16	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Muhammad Halim As Sidiq	Samuel O’Brien Ricketts	2	0	32	Muhammad Halim As Sidiq	73	89268	\N
2023-06-17	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Muhammad Halim As Sidiq	Justin Ma	2	0	35	Muhammad Halim As Sidiq	73	89268	\N
2023-06-23	Teodoro Palacios Flores - 1	Muhammad Halim As Sidiq	Justin Ma	2	0	20	Muhammad Halim As Sidiq	77	89268	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 2	Muhammad Halim As Sidiq	Kevin Arokia Walter	2	0	45	Muhammad Halim As Sidiq	24	89268	\N
2023-03-21	Tay Ho District Stadium - 3	Muhammad Reza Al Fajri	Alfito Pringgo Yudanto	2	1	100	Muhammad Reza Al Fajri	29	97243	\N
2023-02-17	John Barrable Hall - 1	Mujittapha UMAR	Idrisse Issofo MOSSAGY	2	0	20	Mujittapha UMAR	14	75861	\N
2023-02-17	John Barrable Hall - 3	Mustaopha MUHAMMED	Ashel DZIVA	2	0	20	Mustaopha MUHAMMED	14	72988	\N
2023-02-17	John Barrable Hall - 3	Muzafaru LUBEGA	Lucas DOUCE	2	0	30	Muzafaru LUBEGA	14	77864	\N
2023-02-17	John Barrable Hall - 4	Mwanza EDWARD	Ryan BONIFACE	2	0	16	Mwanza EDWARD	14	66626	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 2	Nadeem Dalvi	Justin Ma	2	1	46	Nadeem Dalvi	24	87999	\N
2023-03-16	-	Nadeem Dalvi	Diosbel Tamayo Palacio	2	0	20	Nadeem Dalvi	24	87999	\N
2023-02-14	ABA - 3	Nathan Tang	Jack Jiang	2	0	25	Nathan Tang	12	64561	\N
2023-02-14	ABA - 2	Nathan Tang	Keith Mark Edison	2	1	52	Nathan Tang	12	64561	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Nathan Tang	Ian Lubao	2	0	14	Nathan Tang	61	64561	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Nathan Tang	Raymond Sing	2	0	24	Nathan Tang	71	64561	\N
2023-04-08	Salle Everest - 1 - FZ FORZA	Ng In Qin	Matteo Justel	2	0	39	Ng In Qin	36	95954	\N
2023-04-08	Salle Everest - 2 - Vals	Ng In Qin	Alvaro Moran	2	0	42	Ng In Qin	36	95954	\N
2023-04-07	Salle Everest - 2 - Vals	Ng In Qin	Jing Xuan Fan	2	0	41	Ng In Qin	36	95954	\N
2023-06-28	National Sport Complex - 2	Ng In Qin	Hein Htut	2	1	52	Ng In Qin	82	95954	\N
2023-04-22	Evangelos Florakis Sports Hall - 5	Ng In Qin	Romeo Makboul	2	1	64	Ng In Qin	41	95954	\N
2023-04-21	Evangelos Florakis Sports Hall - 1	Ng In Qin	Alvar Melleri	2	0	26	Ng In Qin	41	95954	\N
2023-04-06	Salle Everest - 2 - Vals	Ng In Qin	Shih Kuan-Chih	2	0	34	Ng In Qin	36	95954	\N
2023-04-07	Salle Everest - 4 - Kyriad	Ng In Qin	Mark Obermeier	2	0	30	Ng In Qin	36	95954	\N
2023-06-20	Binjiang Gymnasium - 1	Ng In Qin	Utchan Ruaysap	2	1	56	Ng In Qin	75	95954	\N
2023-02-04	Nimibutr National Stadium - Court 1	Ng Ka Long Angus	Li Shi Feng	2	1	64	Ng Ka Long Angus	9	45171	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Ng Ka Long Angus	Lee Zii Jia	2	0	39	Ng Ka Long Angus	42	45171	\N
2023-01-25	Istora Senayan - Court 2	Ng Ka Long Angus	Cheam June Wei	2	0	30	Ng Ka Long Angus	4	45171	\N
2023-01-26	Istora Senayan - Court 3	Ng Ka Long Angus	Lee Zii Jia	2	1	65	Ng Ka Long Angus	4	45171	\N
2023-06-23	Tian-Mu Arena - Court 2	Ng Ka Long Angus	Prannoy H. S.	2	0	38	Ng Ka Long Angus	78	45171	\N
2023-01-27	Istora Senayan - Court 1	Ng Ka Long Angus	Kanta Tsuneyama	2	0	46	Ng Ka Long Angus	4	45171	\N
2023-06-22	Tian-Mu Arena - Court 1	Ng Ka Long Angus	Cheam June Wei	2	0	34	Ng Ka Long Angus	78	45171	\N
2023-06-21	Tian-Mu Arena - Court 2	Ng Ka Long Angus	Meiraba Luwang Maisnam	2	0	36	Ng Ka Long Angus	78	45171	\N
2023-03-08	Main Location - Court 2	Ng Ka Long Angus	Kodai Naraoka	1	1	56	Ng Ka Long Angus	20	45171	\N
2023-03-09	Main Location - Court 3	Ng Ka Long Angus	Luís Enrique Peñalver	2	0	34	Ng Ka Long Angus	20	45171	\N
2023-03-10	Main Location - Court 2	Ng Ka Long Angus	Lu Guang Zu	0	1	32	Ng Ka Long Angus	20	45171	\N
2023-05-24	Axiata Arena - Court 2	Ng Ka Long Angus	Nhat Nguyen	2	1	81	Ng Ka Long Angus	53	45171	\N
2023-05-25	Axiata Arena - Court 1	Ng Ka Long Angus	Lakshya Sen	2	0	48	Ng Ka Long Angus	53	45171	\N
2023-03-11	Main Location - Court 2	Ng Ka Long Angus	Lee Cheuk Yiu	2	1	58	Ng Ka Long Angus	20	45171	\N
2023-03-12	Main Location - Court 1 - TV Court	Ng Ka Long Angus	Li Shi Feng	2	1	86	Ng Ka Long Angus	20	45171	\N
2023-06-13	Istora - 1	Ng Ka Long Angus	Kento Momota	2	0	38	Ng Ka Long Angus	70	45171	\N
2023-05-31	Indoor Stadium Huamark - Court 3	Ng Ka Long Angus	Chia Hao Lee	2	1	58	Ng Ka Long Angus	56	45171	\N
2023-02-01	Nimibutr National Stadium - Court 3	Ng Ka Long Angus	Misha Zilberman	2	0	29	Ng Ka Long Angus	9	45171	\N
2023-02-02	Nimibutr National Stadium - Court 1	Ng Ka Long Angus	Cheam June Wei	2	1	51	Ng Ka Long Angus	9	45171	\N
2023-02-03	Nimibutr National Stadium - Court 1	Ng Ka Long Angus	Ng Tze Yong	2	0	43	Ng Ka Long Angus	9	45171	\N
2023-03-23	St. Jakobshalle Basel - 1	Ng Tze Yong	Cheam June Wei	2	0	41	Ng Tze Yong	28	81362	\N
2023-03-16	Utilita Arena Birmingham - 1 Minoru Yoneyama	Ng Tze Yong	Viktor Axelsen	2	1	69	Ng Tze Yong	25	81362	\N
2023-05-31	Indoor Stadium Huamark - Court 1	Ng Tze Yong	Priyanshu Rajawat	2	0	33	Ng Tze Yong	56	81362	\N
2023-06-01	Indoor Stadium Huamark - Court 1	Ng Tze Yong	Chou Tien Chen	2	0	59	Ng Tze Yong	56	81362	\N
2023-03-22	St. Jakobshalle Basel - 1	Ng Tze Yong	Soong Joo Ven	1	1	68	Ng Tze Yong	28	81362	\N
2023-02-02	Nimibutr National Stadium - Court 2	Ng Tze Yong	Heo Kwang Hee	2	0	38	Ng Tze Yong	9	81362	\N
2023-01-25	Istora Senayan - Court 2	Ng Tze Yong	Hans-Kristian Solberg Vittinghus	2	0	36	Ng Tze Yong	4	81362	\N
2023-06-07	Singapore Indoor Stadium - 2	Ng Tze Yong	Nhat Nguyen	2	1	82	Ng Tze Yong	62	81362	\N
2023-01-11	Axiata Arena - Court 2	Ng Tze Yong	Nhat Nguyen	2	0	35	Ng Tze Yong	1	81362	\N
2023-02-01	Nimibutr National Stadium - Court 2	Ng Tze Yong	Ygor Coelho	2	0	41	Ng Tze Yong	9	81362	\N
2023-03-14	Utilita Arena Birmingham - 3	Ng Tze Yong	Shesar Hiren Rhustavito	2	0	36	Ng Tze Yong	25	81362	\N
2023-06-23	Binjiang Gymnasium - 2	Nguyen Hai Dang	Xiaodong Sheng	2	0	35	Nguyen Hai Dang	75	64648	\N
2023-05-12	Morodok Techo - 3	NGUYEN Hai Dang	Mourinho Zefi COSTA GUSMAO DE JESUS	2	0	23	NGUYEN Hai Dang	50	64648	\N
2023-06-22	Binjiang Gymnasium - 2	Nguyen Hai Dang	Dong Tian Yao	1	0	31	Nguyen Hai Dang	75	64648	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Nguyen Hai Dang	Ian Lubao	2	0	14	Nguyen Hai Dang	71	64648	\N
2023-03-21	Tay Ho District Stadium - 1	Nguyen Hai Dang	Yonathan Ramlie	2	1	70	Nguyen Hai Dang	29	64648	\N
2023-06-14	Gilbert C. Ada Gymnasium - 1 - Streaming	Nguyen Hai Dang	Samuel Lee	2	1	69	Nguyen Hai Dang	71	64648	\N
2023-03-07	Terminal 21 Korat - Court3	Nguyen Hai Dang	Chirag Sen	2	1	60	Nguyen Hai Dang	19	64648	\N
2023-06-21	Binjiang Gymnasium - 2	Nguyen Hai Dang	Pui Chi Chon	2	0	24	Nguyen Hai Dang	75	64648	\N
2023-04-06	Palais des Sports - 3	Nhat Nguyen	Jan Louda	2	0	44	Nhat Nguyen	35	85095	\N
2023-03-22	St. Jakobshalle Basel - 1	Nhat Nguyen	Shesar Hiren Rhustavito	2	0	43	Nhat Nguyen	28	85095	\N
2023-04-05	Palais des Sports - 2	Nhat Nguyen	Sameer Verma	2	1	83	Nhat Nguyen	35	85095	\N
2023-04-07	Palais des Sports - 2	Nhat Nguyen	Misha Zilberman (Walkover)	0	0	0	Nhat Nguyen	35	85095	\N
2023-02-14	ABA - 2	Niccolo Tagle	Pit Seng Low	2	0	27	Niccolo Tagle	12	82961	\N
2023-02-13	ABA - 2	Niccolo Tagle	Alan Martin	2	0	18	Niccolo Tagle	12	82961	\N
2023-02-14	ABA - 2	Niccolo Tagle	Leonard Manuel	2	0	15	Niccolo Tagle	12	82961	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 5	Nicolas A. Mueller	Magnus Klinggaard	2	1	63	Nicolas A. Mueller	5	78891	\N
2023-06-10	Cido Arena - Court 4	Nicolas A. Mueller	Iikka Heino	2	1	54	Nicolas A. Mueller	66	78891	\N
2023-06-10	Cido Arena - Court 1	Nicolas A. Mueller	Brian Holtschke	2	0	46	Nicolas A. Mueller	66	78891	\N
2023-06-09	Cido Arena - Court 4	Nicolas A. Mueller	Bruno Carvalho	2	0	44	Nicolas A. Mueller	66	78891	\N
2023-03-09	Sportarena (Sportforum) Berlin - 5	Noah Haase	Igor Jasek	2	0	26	Noah Haase	22	95766	\N
2023-02-24	PalaBadminton - 2	Noah Haase	Calin Tudor Turcu	2	1	45	Noah Haase	16	95766	\N
2023-04-07	Den Willecom - 03	Noel Tappeiner	Micah Melis	2	0	29	Noel Tappeiner	37	90778	\N
2023-05-06	Badmintonhalle Vorarlberg - 3	Noel Tappeiner	Kryštof Klíma	2	0	33	Noel Tappeiner	47	90778	\N
2023-04-20	Complexe Sportif Regional - Court 3	Noel Tappeiner	Dimitri Leroy	2	0	31	Noel Tappeiner	40	90778	\N
2023-05-05	Badmintonhalle Vorarlberg - 3	Noel Tappeiner	Liam Birahij	2	0	25	Noel Tappeiner	47	90778	\N
2023-03-30	Sportovní hala - Court 3	Noel Tappeiner	Thomas Mabbe	2	0	21	Noel Tappeiner	33	90778	\N
2023-05-06	Badmintonhalle Vorarlberg - 4	Noel Tappeiner	Lian Ubieto	2	0	40	Noel Tappeiner	47	90778	\N
2023-06-09	Sporthalle Steinbreche - Court 4	Noel Tappeiner	Ole Schroth	2	0	31	Noel Tappeiner	65	90778	\N
2023-02-27	MTN Arena - COURT 1	Nyanesh Anand Changea	Ninaad Chetankumar Modi	2	0	15	Nyanesh Anand Changea	17	58129	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 3	Oleksandar Shmundyak	Axel Henrik Parkhøi	2	1	68	Oleksandar Shmundyak	5	58309	\N
2023-02-25	PalaBadminton - 4	Oleksii Titov	Ilija Nicolussi	2	0	31	Oleksii Titov	16	75729	\N
2023-01-27	Fyrishov - Court 5	Oleksii Titov	Shaurya Gullaiya	2	1	41	Oleksii Titov	7	75729	\N
2023-01-28	Fyrishov - Court 2	Oleksii Titov	Andrei Schmidt	2	0	32	Oleksii Titov	7	75729	\N
2023-02-24	PalaBadminton - 2	Oleksii Titov	Bartosz Punko	2	0	27	Oleksii Titov	16	75729	\N
2023-01-29	Fyrishov - Court 1	Oleksii Titov	Christoffer Boman	2	0	28	Oleksii Titov	7	75729	\N
2023-01-29	Fyrishov - Court 1	Oleksii Titov	Luis Pongratz	2	1	58	Oleksii Titov	7	75729	\N
2023-01-28	Fyrishov - Court 4	Oleksii Titov	Rene Leeman	2	0	30	Oleksii Titov	7	75729	\N
2023-02-01	Afrasiabi Hall - court 1	Ong Ken Yon	Mohammad Ali Faghih Khorasani	2	0	37	Ong Ken Yon	8	91853	\N
2023-03-14	Ruichang Sports Park Gym - Court 4	Ong Ken Yon	Enrico Asuncion	2	0	22	Ong Ken Yon	23	91853	\N
2023-02-02	Afrasiabi Hall - court 2	Ong Ken Yon	Tarun Reddy Katam	2	0	42	Ong Ken Yon	8	91853	\N
2023-02-23	MTN Arena - 2	Ong Ken Yon	Harshit Aggarwal	2	0	32	Ong Ken Yon	15	91853	\N
2023-02-03	Afrasiabi Hall - court 3	Ong Ken Yon	Alfito Pringgo Yudanto	2	1	72	Ong Ken Yon	8	91853	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Ong Tae Ern	Shawn Grinblat	2	0	21	Ong Tae Ern	41	73490	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Ong Tae Ern	Jofre Comella	2	0	27	Ong Tae Ern	36	73490	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Ong Tae Ern	Shon Leitman	2	0	38	Ong Tae Ern	41	73490	\N
2023-06-28	National Sport Complex - 3	Ong Tae Ern	Lee Yu-Jui	2	0	36	Ong Tae Ern	82	73490	\N
2023-06-20	Binjiang Gymnasium - 2	Ong Tae Ern	Ahmed Nibal	2	0	35	Ong Tae Ern	75	73490	\N
2023-04-22	Evangelos Florakis Sports Hall - 5	Ong Tae Ern	Mayan Mogilner	2	1	43	Ong Tae Ern	41	73490	\N
2023-02-23	MTN Arena - 3	Ong Zhen Yi	Giovanni Toti	2	1	53	Ong Zhen Yi	15	75283	\N
2023-02-24	MTN Arena - 1	Ong Zhen Yi	Dmitriy Panarin	2	1	46	Ong Zhen Yi	15	75283	\N
2023-06-06	Male’ Sports Complex - 3	Ong Zhen Yi	Tan Kean Wei	2	0	32	Ong Zhen Yi	60	75283	\N
2023-02-25	MTN Arena - 1	Ong Zhen Yi	Kai Schaefer	2	1	57	Ong Zhen Yi	15	75283	\N
2023-06-07	Male’ Sports Complex - 4	Ong Zhen Yi	Bhargav Somasundara	2	0	60	Ong Zhen Yi	60	75283	\N
2023-02-14	ABA - 3	Oscar Guo	Joshua Feng	2	0	24	Oscar Guo	12	72674	\N
2023-02-13	ABA - 2	Oscar Guo	Rio Agustino	2	0	31	Oscar Guo	12	72674	\N
2023-02-14	ABA - 2	Oscar Guo	Athi Selladurai	2	0	40	Oscar Guo	12	72674	\N
2023-03-11	High Performance Centre - 1	Pablo Abian	B. R. Sankeerth	2	1	59	Pablo Abian	21	14251	\N
2023-03-11	High Performance Centre - 4	Pablo Abian	Elias Bracke	2	0	30	Pablo Abian	21	14251	\N
2023-05-26	Raiffeisen Sportpark - 1	Pablo Abian	Kim Bruun	2	0	40	Pablo Abian	55	14251	\N
2023-03-10	High Performance Centre - 1	Pablo Abian	Niluka Karunaratne	2	0	48	Pablo Abian	21	14251	\N
2023-06-20	Binjiang Gymnasium - 3	Panitchaphon Teeraratsakul	Patrick Chi	2	0	20	Panitchaphon Teeraratsakul	75	85845	\N
2023-03-07	Terminal 21 Korat - Court4	Panitchaphon Teeraratsakul	Mark Shelley Alcala	2	0	38	Panitchaphon Teeraratsakul	19	85845	\N
2023-05-13	Morodok Techo - 3	Panitchaphon TEERARATSAKUL	LAU Jun Hui Marcus	2	0	32	Panitchaphon TEERARATSAKUL	50	85845	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Panji Ahmad Maulana	Charles Fouyn	2	1	47	Panji Ahmad Maulana	46	85956	\N
2023-05-12	IFU Arena - 5.Unidamp	Panji Ahmad Maulana	Alvi Wijaya Chairullah	2	1	52	Panji Ahmad Maulana	48	85956	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 2	Panji Ahmad Maulana	Tan Jia Jie	2	0	32	Panji Ahmad Maulana	46	85956	\N
2023-06-21	Tian-Mu Arena - Court 3	Parupalli Kashyap	Samuel Hsiao	2	0	43	Parupalli Kashyap	78	53944	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Paulo Quidato	Allan Zeng	2	1	32	Paulo Quidato	71	24963	\N
2023-06-20	Binjiang Gymnasium - 4	Phuc Thinh Phan	Jingtong Chen	2	0	20	Phuc Thinh Phan	75	92103	\N
2023-02-14	ABA - 1	Pit Seng Low	Avinash Shastri	2	0	40	Pit Seng Low	12	86104	\N
2023-06-09	Cido Arena - Court 2	Prahdiska Bagas Shujiwo	Mateusz Danielak	2	0	36	Prahdiska Bagas Shujiwo	66	59614	\N
2023-02-01	Afrasiabi Hall - court 2	Pranav Rao Gandham	Charan Naik Kelavathu	2	0	28	Pranav Rao Gandham	8	74420	\N
2023-06-15	Istora - 2	Prannoy H. S.	Ng Ka Long Angus	2	0	43	Prannoy H. S.	70	83950	\N
2023-05-27	Axiata Arena - Court 1	Prannoy H. S.	Christian Adinata	0	0	27	Prannoy H. S.	53	83950	\N
2023-04-27	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 4	Prannoy H. S.	Chico Aura Dwi Wardoyo	2	1	62	Prannoy H. S.	42	83950	\N
2023-01-11	Axiata Arena - Court 4	Prannoy H. S.	Lakshya Sen	2	1	61	Prannoy H. S.	1	83950	\N
2023-06-22	Tian-Mu Arena - Court 2	Prannoy H. S.	Tommy Sugiarto	2	0	36	Prannoy H. S.	78	83950	\N
2023-05-26	Axiata Arena - Court 2	Prannoy H. S.	Kenta Nishimoto	2	1	91	Prannoy H. S.	53	83950	\N
2023-06-21	Tian-Mu Arena - Court 2	Prannoy H. S.	Lin Yu Hsien	2	0	26	Prannoy H. S.	78	83950	\N
2023-03-14	Utilita Arena Birmingham - 4	Prannoy H. S.	Wang Tzu Wei	2	0	49	Prannoy H. S.	25	83950	\N
2023-01-12	Axiata Arena - Court 1	Prannoy H. S.	Chico Aura Dwi Wardoyo	2	1	64	Prannoy H. S.	1	83950	\N
2023-03-22	St. Jakobshalle Basel - 1	Prannoy H. S.	Shi Yu Qi	2	1	64	Prannoy H. S.	28	83950	\N
2023-05-25	Axiata Arena - Court 1	Prannoy H. S.	Li Shi Feng	2	1	70	Prannoy H. S.	53	83950	\N
2023-05-28	Axiata Arena - Court 1	Prannoy H. S.	Weng Hong Yang	2	1	94	Prannoy H. S.	53	83950	\N
2023-06-13	Istora - 2	Prannoy H. S.	Kenta Nishimoto	2	0	50	Prannoy H. S.	70	83950	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 3	Prannoy H. S.	Phone Pyae Naing	2	0	32	Prannoy H. S.	42	83950	\N
2023-06-16	Istora - 2	Prannoy H. S.	Kodai Naraoka	2	0	55	Prannoy H. S.	70	83950	\N
2023-05-24	Axiata Arena - Court 1	Prannoy H. S.	Chou Tien Chen	2	1	64	Prannoy H. S.	53	83950	\N
2023-04-08	Palais des Sports - 1	Priyanshu Rajawat	Nhat Nguyen	2	0	44	Priyanshu Rajawat	35	69093	\N
2023-04-09	Palais des Sports - 1	Priyanshu Rajawat	Magnus Johannesen	2	1	68	Priyanshu Rajawat	35	69093	\N
2023-04-07	Palais des Sports - 1	Priyanshu Rajawat	Chi Yu Jen	2	0	44	Priyanshu Rajawat	35	69093	\N
2023-04-06	Palais des Sports - 1	Priyanshu Rajawat	Kenta Nishimoto	2	0	42	Priyanshu Rajawat	35	69093	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 3	Priyanshu Rajawat	Victor Svendsen	2	1	46	Priyanshu Rajawat	31	69093	\N
2023-04-05	Palais des Sports - 4	Priyanshu Rajawat	Kiran George	2	0	34	Priyanshu Rajawat	35	69093	\N
2023-06-14	Istora - 3	Priyanshu Rajawat	Kunlavut Vitidsarn (Walkover)	0	0	0	Priyanshu Rajawat	70	69093	\N
2023-06-06	Singapore Indoor Stadium - 3	Priyanshu Rajawat	Kanta Tsuneyama	2	0	38	Priyanshu Rajawat	62	69093	\N
2023-06-28	National Sport Complex - 2	Puritat Arree	Batdavaa Munkhbat	2	0	35	Puritat Arree	82	63171	\N
2023-03-16	-	Ramiro Alonso Espinoza	Roilan Perez Fuentes	2	0	15	Ramiro Alonso Espinoza	24	58155	\N
2023-06-16	Teodoro Palacios Flores - 3	Ramiro Alonso Espinoza	Diego Garcia Garcia	2	0	19	Ramiro Alonso Espinoza	72	58155	\N
2023-06-17	Teodoro Palacios Flores - 2	Ramiro Alonso Espinoza	Diego Trujillo Marrero	2	0	29	Ramiro Alonso Espinoza	72	58155	\N
2023-06-18	Teodoro Palacios Flores - 1	Ramiro Alonso Espinoza	José Daniel Ochoa	2	0	37	Ramiro Alonso Espinoza	72	58155	\N
2023-06-06	Male’ Sports Complex - 2	Rasindu Hendahewa	Tharun Mannepalli	2	1	78	Rasindu Hendahewa	60	97018	\N
2023-06-01	Center of Badminton - 2	Rasindu Hendahewa	Harshal Bhoyar	2	1	58	Rasindu Hendahewa	57	97018	\N
2023-06-01	Center of Badminton - 2	Rasindu Hendahewa	Harshit Thakur	2	0	32	Rasindu Hendahewa	57	97018	\N
2023-06-07	Male’ Sports Complex - 1	Rasindu Hendahewa	Chirag Sen	2	1	58	Rasindu Hendahewa	60	97018	\N
2023-05-24	Axiata Arena - Court 4	Rasmus Gemke	Jeon Hyeok Jin	2	1	101	Rasmus Gemke	53	62855	\N
2023-01-17	K. D. Jadhav Indoor Hall - 1	Rasmus Gemke	Kento Momota	2	0	49	Rasmus Gemke	3	62855	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 4	Rasmus Gemke	Mads Christophersen	2	1	53	Rasmus Gemke	31	62855	\N
2023-01-19	K. D. Jadhav Indoor Hall - 1	Rasmus Gemke	Lakshya Sen	2	1	81	Rasmus Gemke	3	62855	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 2	Rasmus Gemke	Christian Adinata	2	0	56	Rasmus Gemke	31	62855	\N
2023-06-07	Male’ Sports Complex - 2	Ravi Ravi	Anuoluwapo Juwon Opeyori	2	1	58	Ravi Ravi	60	70824	\N
2023-03-07	Terminal 21 Korat - Court4	Ravi Ravi	Yohanes Saut Marcellyno	2	1	83	Ravi Ravi	19	70824	\N
2023-06-08	Male’ Sports Complex - 4	Ravi Ravi	Mithun Manjunath	2	0	54	Ravi Ravi	60	70824	\N
2023-06-10	Male’ Sports Complex - 1	Ravi Ravi	Soong Joo Ven	2	0	51	Ravi Ravi	60	70824	\N
2023-06-06	Male’ Sports Complex - 4	Ravi Ravi	Aditya Chouhan	2	0	29	Ravi Ravi	60	70824	\N
2023-06-08	Male’ Sports Complex - 2	Ravi Ravi	Ong Zhen Yi	2	1	77	Ravi Ravi	60	70824	\N
2023-06-09	Male’ Sports Complex - 1	Ravi Ravi	Kai Schaefer	2	0	35	Ravi Ravi	60	70824	\N
2023-03-17	Polideportivo Corredoria Arena - 1	Rayce Su	Manuel Miguez	2	0	19	Rayce Su	26	56782	\N
2023-02-15	ABA - 3	Remi Rossi	Ricky Tang	2	1	60	Remi Rossi	12	55838	\N
2023-02-14	ABA - 1	Remi Rossi	Ricky Cheng	2	0	41	Remi Rossi	12	55838	\N
2023-02-14	ABA - 3	Remi Rossi	Gavin Kyjac Ong	2	0	42	Remi Rossi	12	55838	\N
2023-02-13	ABA - 3	Remi Rossi	Hongyuan Wong	2	0	38	Remi Rossi	12	55838	\N
2023-01-27	Fyrishov - Court 3	Rene Leeman	Lino Degenkolb	2	0	22	Rene Leeman	7	70825	\N
2023-01-27	Fyrishov - Court 2	Rene Leeman	Isak Erliksson	2	1	52	Rene Leeman	7	70825	\N
2023-03-14	Ruichang Sports Park Gym - Court 4	Ricky Cheng	Jackson Yang	2	0	28	Ricky Cheng	23	79943	\N
2023-02-13	ABA - 2	Ricky Tang	Winson Wong	2	0	23	Ricky Tang	12	83265	\N
2023-02-14	ABA - 2	Ricky Tang	Tony Fang	2	0	24	Ricky Tang	12	83265	\N
2023-02-14	ABA - 3	Ricky Tang	Adam Dolman	2	1	58	Ricky Tang	12	83265	\N
2023-06-09	Gilbert C. Ada Gymnasium - 3	Riku Hatano	Chi Yu Jen	2	0	37	Riku Hatano	61	62018	\N
2023-03-07	Terminal 21 Korat - Court3	Riku Hatano	Jason Gunawan	2	0	42	Riku Hatano	19	62018	\N
2023-03-09	Terminal 21 Korat - Court3	Riku Hatano	Yu Igarashi	2	0	42	Riku Hatano	19	62018	\N
2023-03-10	Terminal 21 Korat - Court2	Riku Hatano	Su Li Yang	2	0	37	Riku Hatano	19	62018	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Riku Hatano	Lei Ci Fu	2	0	28	Riku Hatano	61	62018	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Riku Hatano	Shashwat Dalal	2	0	34	Riku Hatano	61	62018	\N
2023-06-08	Gilbert C. Ada Gymnasium - 1 - Streaming	Riku Hatano	Lin Yu Hsien	2	0	34	Riku Hatano	61	62018	\N
2023-03-30	Main Location - 2	Riku Hatano	Liao Jhuo-Fu	2	1	60	Riku Hatano	32	62018	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Riku Hatano	Cheng-Han Tsai	2	0	29	Riku Hatano	71	62018	\N
2023-03-08	Terminal 21 Korat - Court1	Riku Hatano	Bodhi Ratana Teja Gotama	2	0	37	Riku Hatano	19	62018	\N
2023-03-08	Terminal 21 Korat - Court3	Rithvik Sanjeevi Satish Kumar	Iqbal Diaz Syahputra	2	1	57	Rithvik Sanjeevi Satish Kumar	19	86975	\N
2023-03-07	Terminal 21 Korat - Court1	Rithvik Sanjeevi Satish Kumar	Chia Jeng Hon	2	1	56	Rithvik Sanjeevi Satish Kumar	19	86975	\N
2023-02-18	John Barrable Hall - 3	Robert SUMMERS	Melvin APPIAH	2	1	41	Robert SUMMERS	14	85735	\N
2023-02-17	John Barrable Hall - 3	Robert SUMMERS	Amos MUYANJA	2	0	24	Robert SUMMERS	14	85735	\N
2023-02-18	John Barrable Hall - 1	Robert SUMMERS	Youcef Sabri MEDEL	2	0	32	Robert SUMMERS	14	85735	\N
2023-02-17	John Barrable Hall - 2	Robert WHITE	Mwanza EDWARD	2	0	19	Robert WHITE	14	62699	\N
2023-03-16	-	Roberto Carlos Herrera Vazquez	Shubh Krishan	2	0	28	Roberto Carlos Herrera Vazquez	24	76678	\N
2023-04-07	Salle Everest - 1 - FZ FORZA	Robinson Coube	Luca Wiechmann	2	1	50	Robinson Coube	36	64309	\N
2023-04-07	Salle Everest - 5 - Koesio	Robinson Coube	Arthur Vaugeois	2	0	33	Robinson Coube	36	64309	\N
2023-04-08	Salle Everest - 3 - Carrefour	Robinson Coube	Simone Piccinin	2	1	54	Robinson Coube	36	64309	\N
2023-04-06	Salle Everest - 2 - Vals	Robinson Coube	Marc Guasch	2	0	30	Robinson Coube	36	64309	\N
2023-05-03	CODE II Jalisco - 4	Rohan Midha	Miha Ivančič	2	1	65	Rohan Midha	45	90111	\N
2023-02-17	John Barrable Hall - 1	Ruan SNYMAN	Sifeddine LARBAOUI	2	0	29	Ruan SNYMAN	14	82080	\N
2023-06-22	Teodoro Palacios Flores - 1	Rui Sato	Estuardo Del Valle Leisbeth	2	0	38	Rui Sato	77	70220	\N
2023-02-25	PalaBadminton - 3	Rune Van Dalm	Mark Obermeier	2	0	32	Rune Van Dalm	16	98845	\N
2023-03-01	-	Rune Van Dalm	Rafe Kenji Braach (Walkover)	0	0	0	Rune Van Dalm	18	98845	\N
2023-02-24	PalaBadminton - 1	Rune Van Dalm	Dinu Pandele	2	0	22	Rune Van Dalm	16	98845	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Ryoma Muramoto	Shashwat Dalal	2	0	35	Ryoma Muramoto	71	63069	\N
2023-06-14	Gilbert C. Ada Gymnasium - 3	Ryoma Muramoto	Liu Wei Chi	2	1	58	Ryoma Muramoto	71	63069	\N
2023-06-15	Gilbert C. Ada Gymnasium - 1 - Streaming	Ryoma Muramoto	Kevin Cordon	2	1	65	Ryoma Muramoto	71	63069	\N
2023-05-03	CODE II Jalisco - 4	Ryoma Muramoto	Lucas Claerbout	2	0	46	Ryoma Muramoto	45	63069	\N
\N	-	Ryoma Muramoto	Batdavaa Munkhbat (Walkover)	0	0	0	Ryoma Muramoto	61	63069	\N
2023-05-04	CODE II Jalisco - 3	Ryoma Muramoto	Julien Carraggi	2	0	42	Ryoma Muramoto	45	63069	\N
2023-05-05	CODE II Jalisco - 3	Ryoma Muramoto	Uriel Francisco Canjura Artiga	2	0	36	Ryoma Muramoto	45	63069	\N
2023-05-03	CODE II Jalisco - 2	Ryoma Muramoto	Kai Schaefer	2	0	30	Ryoma Muramoto	45	63069	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 3	S.Sankar Muthusamy Subramanian	Valentin Singer	2	1	50	S.Sankar Muthusamy Subramanian	46	91814	\N
2023-04-14	VELO-hall - 3	S.Sankar Muthusamy Subramanian	Ivan Rusev	2	0	33	S.Sankar Muthusamy Subramanian	38	91814	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	S.Sankar Muthusamy Subramanian	Xiaodong Sheng	2	0	31	S.Sankar Muthusamy Subramanian	46	91814	\N
2023-05-19	Sport hall Dras - Court 3	S.Sankar Muthusamy Subramanian	Bernardo Atilano	2	0	35	S.Sankar Muthusamy Subramanian	51	91814	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 3	S.Sankar Muthusamy Subramanian	Bruno Carvalho	2	0	26	S.Sankar Muthusamy Subramanian	46	91814	\N
2023-05-06	d'Coque Centre National Sportif & culturel - 2	S.Sankar Muthusamy Subramanian	Lin Kuan-Ting	2	0	41	S.Sankar Muthusamy Subramanian	46	91814	\N
2023-03-24	Arena Jaskółka - Ministerstwo Sportu	S.Sankar Muthusamy Subramanian	Samuel Hsiao	2	1	53	S.Sankar Muthusamy Subramanian	30	91814	\N
2023-04-14	VELO-hall - 4	S.Sankar Muthusamy Subramanian	Mads Juel Møller	2	0	42	S.Sankar Muthusamy Subramanian	38	91814	\N
2023-02-01	Afrasiabi Hall - court 1	S.Sankar Muthusamy Subramanian	Rasindu Hendahewa	2	1	62	S.Sankar Muthusamy Subramanian	8	91814	\N
2023-05-07	d'Coque Centre National Sportif & culturel - 1	S.Sankar Muthusamy Subramanian	Ade Resky Dwicahyo	2	0	37	S.Sankar Muthusamy Subramanian	46	91814	\N
2023-06-01	Erwin Kranz Halle - 2	Sacha Leveque	Julien Scheiwiller	2	1	59	Sacha Leveque	58	86866	\N
2023-02-02	Nimibutr National Stadium - Court 4	Sai Praneeth B.	Jeon Hyeok Jin	2	1	78	Sai Praneeth B.	9	42776	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 3	Sai Praneeth B.	Jan Louda	2	1	61	Sai Praneeth B.	31	42776	\N
2023-02-01	Nimibutr National Stadium - Court 1	Sai Praneeth B.	Mads Christophersen	2	0	31	Sai Praneeth B.	9	42776	\N
2023-06-06	Male’ Sports Complex - 1	Sai Praneeth B.	Mehad Shaikh	2	0	47	Sai Praneeth B.	60	42776	\N
2023-05-19	Sport hall Dras - Court 4	Sai Praneeth B.	Zhao Chen Xun	2	0	38	Sai Praneeth B.	51	42776	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Saket Thavanani	Kalei Kuan-Veng	2	0	47	Saket Thavanani	73	83999	\N
2023-02-01	Afrasiabi Hall - court 2	Salar Bayat	Darshan Pujari	2	1	74	Salar Bayat	8	81642	\N
2023-05-20	Sport hall Dras - Court 1	Sameer Verma	Joran Kweekel	2	1	66	Sameer Verma	51	77003	\N
2023-06-16	Salle metropolitaine de la Trocardière - 1 - Forza	Sameer Verma	Ade Resky Dwicahyo	2	1	51	Sameer Verma	74	77003	\N
2023-05-21	Sport hall Dras - Court 2	Sameer Verma	Huang Yu Kai	2	1	60	Sameer Verma	51	77003	\N
2023-06-17	Salle metropolitaine de la Trocardière - 1 - Forza	Sameer Verma	Mads Christophersen	2	1	46	Sameer Verma	74	77003	\N
2023-05-19	Sport hall Dras - Court 5	Sameer Verma	Christopher Vittoriani	2	1	66	Sameer Verma	51	77003	\N
2023-05-21	Sport hall Dras - Court 2	Sameer Verma	Su Li Yang	2	0	45	Sameer Verma	51	77003	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 3	Sameer Verma	Nhat Nguyen	2	1	64	Sameer Verma	31	77003	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Sameer Verma	Victor Ørding Kauffmann	2	0	31	Sameer Verma	74	77003	\N
2023-05-20	Sport hall Dras - Court 3	Sameer Verma	Dicky Dwi Pangestu	2	0	29	Sameer Verma	51	77003	\N
2023-05-31	Center of Badminton - 2	Samuel Cassar	Abdullah Aldawsari	2	0	20	Samuel Cassar	57	59921	\N
2023-01-13	Kalevi Spordihall - 2 Yonex	Samuel Hsiao	Danylo Bosniuk	2	0	37	Samuel Hsiao	2	73966	\N
2023-06-28	National Sport Complex - 1	Samuel Hsiao	Adham Hatem Elgamal	2	0	35	Samuel Hsiao	82	73966	\N
2023-04-14	VELO-hall - 2	Samuel Hsiao	Johnnie Torjussen	2	0	32	Samuel Hsiao	38	73966	\N
2023-03-30	Main Location - 4	Samuel Hsiao	Justin Ma	2	1	54	Samuel Hsiao	32	73966	\N
2023-04-14	VELO-hall - 1	Samuel Hsiao	Tobias Kuenzi	2	0	40	Samuel Hsiao	38	73966	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Samuel Lee	Korakrit Laotrakul (Walkover)	0	0	0	Samuel Lee	61	64001	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Samuel Lee	Shih Kuan-Chih	2	0	33	Samuel Lee	71	64001	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 4	Samuel O’Brien Ricketts	Adriano Viale Aguirre	2	0	27	Samuel O’Brien Ricketts	43	81655	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 2	Samuel O’Brien Ricketts	Victor Ho	2	0	34	Samuel O’Brien Ricketts	73	81655	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Samuel O’Brien Ricketts	Gianpiero Cavallotti	2	0	27	Samuel O’Brien Ricketts	43	81655	\N
2023-05-03	CODE II Jalisco - 2	Samuel O’Brien Ricketts	Nicky Yemin Aung	2	0	24	Samuel O’Brien Ricketts	45	81655	\N
2023-03-16	-	Samuel O’Brien Ricketts	Manuel Del Rosario Pargas	2	0	20	Samuel O’Brien Ricketts	24	81655	\N
2023-06-01	Centro Entrenamiento Olimpico - 1	Samuel O’Brien Ricketts	Linden Wang	2	0	27	Samuel O’Brien Ricketts	59	81655	\N
2023-06-08	Virgilio TRavieso Soto - 2	Samuel O’Brien Ricketts	Luis Armando Montoya Navarro	2	0	47	Samuel O’Brien Ricketts	63	81655	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Samuel O’Brien Ricketts	Luis Pongratz	2	0	36	Samuel O’Brien Ricketts	73	81655	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 1	Samuel O’Brien Ricketts	Adriano Viale Aguirre	2	0	37	Samuel O’Brien Ricketts	24	81655	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Samuel O’Brien Ricketts	Fernando Sanhueza	2	0	30	Samuel O’Brien Ricketts	59	81655	\N
2023-06-22	Teodoro Palacios Flores - 3	Santiago Lozoya	Alessandro Anguiano Gonzalez	2	0	25	Santiago Lozoya	77	56611	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Santiago Otero	Guillermo Buendia	2	0	28	Santiago Otero	73	92533	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 1	Santiago Otero	Saket Thavanani	2	0	32	Santiago Otero	73	92533	\N
\N	-	Santiago Otero	Jose Guevara (Walkover)	0	0	0	Santiago Otero	59	92533	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Sarun Rukcharoen	Joep Strooper	2	0	24	Sarun Rukcharoen	18	56306	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Sarun Rukcharoen	Philip Kryger Boe	2	0	26	Sarun Rukcharoen	22	56306	\N
2023-03-03	Badmintonhall DEGIRO hall - 3	Sarun Rukcharoen	Cho Hyeon Woo	2	0	41	Sarun Rukcharoen	18	56306	\N
2023-03-07	Terminal 21 Korat - Court1	Sathish Kumar Karunakaran	Alfito Pringgo Yudanto	2	0	46	Sathish Kumar Karunakaran	19	79164	\N
2023-06-06	Male’ Sports Complex - 3	Sathish Kumar Karunakaran	Dumindu Abeywickrama	2	0	25	Sathish Kumar Karunakaran	60	79164	\N
2023-06-07	Male’ Sports Complex - 2	Sathish Kumar Karunakaran	Kok Jing Hong	2	0	49	Sathish Kumar Karunakaran	60	79164	\N
2023-03-08	Terminal 21 Korat - Court3	Sathish Kumar Karunakaran	Panitchaphon Teeraratsakul	2	0	37	Sathish Kumar Karunakaran	19	79164	\N
2023-06-01	Center of Badminton - 2	Sayfiddin Mukhtarov	Ilya Lysenko	2	0	26	Sayfiddin Mukhtarov	57	85839	\N
2023-05-31	Center of Badminton - 2	Sayfiddin Mukhtarov	Teo Wei Jun	2	0	24	Sayfiddin Mukhtarov	57	85839	\N
2023-03-09	Sportarena (Sportforum) Berlin - 5	Sebastian Mikkelsen	Zyver John De Leon	2	0	20	Sebastian Mikkelsen	22	99670	\N
2023-03-08	Sportarena (Sportforum) Berlin - 5	Sebastian Mikkelsen	Alexander Philipp Zhang	2	0	16	Sebastian Mikkelsen	22	99670	\N
2023-03-02	Badmintonhall DEGIRO hall - 5	Sebastian Mikkelsen	Alexander Ringbæk	2	0	41	Sebastian Mikkelsen	18	99670	\N
2023-03-01	Badmintonhall DEGIRO hall - 4	Sebastian Mikkelsen	Nachakorn Pusri	2	1	59	Sebastian Mikkelsen	18	99670	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 3	Serhii Marushchak	Pepe Fernandez	2	0	22	Serhii Marushchak	6	86707	\N
2023-05-06	Badmintonhalle Vorarlberg - 2	Serhii Marushchak	Pranav Erukattil	1	1	44	Serhii Marushchak	47	86707	\N
2023-04-14	LOC Manege - 3	Serhii Marushchak	Jakob Sjöblom	2	0	20	Serhii Marushchak	39	86707	\N
2023-04-15	LOC Manege - 3	Serhii Marushchak	Nojus Tenikaitis	2	1	43	Serhii Marushchak	39	86707	\N
2023-05-06	Badmintonhalle Vorarlberg - 5	Serhii Marushchak	Felix Ekstrand	2	0	26	Serhii Marushchak	47	86707	\N
2023-03-17	Sports Hall - 2 Racis	Serhii Marushchak	Filip Titěra	2	0	21	Serhii Marushchak	27	86707	\N
2023-03-18	Sports Hall - 3 Betonex	Serhii Marushchak	Bartosz Punko	2	1	43	Serhii Marushchak	27	86707	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Serhii Marushchak	Alejandro Yaycarov	2	1	44	Serhii Marushchak	6	86707	\N
2023-05-05	Badmintonhalle Vorarlberg - 6	Serhii Marushchak	Moritz Hopp	2	0	22	Serhii Marushchak	47	86707	\N
2023-04-16	LOC Manege - TV	Serhii Marushchak	Vladyslav Kunin	2	1	36	Serhii Marushchak	39	86707	\N
2023-04-15	LOC Manege - TV	Serhii Marushchak	Rasmus Roogsoo	2	0	25	Serhii Marushchak	39	86707	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Serhii Marushchak	Rafe Kenji Braach	2	0	34	Serhii Marushchak	6	86707	\N
2023-03-18	Sports Hall - 3 Betonex	Serhii Marushchak	Kryštof Coufal	2	0	21	Serhii Marushchak	27	86707	\N
2023-05-06	Badmintonhalle Vorarlberg - 4	Serhii Marushchak	Alexander Philipp Zhang	2	0	24	Serhii Marushchak	47	86707	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Serhii Marushchak	Marti Joost	2	0	34	Serhii Marushchak	6	86707	\N
2023-03-21	Tay Ho District Stadium - 3	Shahyar Shaqeem	Viren Nettasinghe	2	0	40	Shahyar Shaqeem	29	70383	\N
2023-03-30	City Sport Hall - Court 1	Sharon Perelshtein	Arie Dunin	2	0	36	Sharon Perelshtein	34	50006	\N
2023-04-21	Evangelos Florakis Sports Hall - 2	Sharon Perelshtein	Daniel Tatevosiani	2	0	23	Sharon Perelshtein	41	50006	\N
2023-05-31	-	Sharum Durand Cardenas	King Kien Hwa (Walkover)	0	0	0	Sharum Durand Cardenas	59	88283	\N
2023-06-01	Centro Entrenamiento Olimpico - 2	Sharum Durand Cardenas	Alejandro Àvalos	2	0	25	Sharum Durand Cardenas	59	88283	\N
2023-06-06	Gilbert C. Ada Gymnasium - 3	Shashwat Dalal	Daniell Pablo	2	0	16	Shashwat Dalal	61	60710	\N
2023-02-23	MTN Arena - 1	Shashwat Dalal	Howard Shu	2	0	42	Shashwat Dalal	15	60710	\N
2023-06-15	Teodoro Palacios Flores - 1	Shaurya Gullaiya	Danilo Sebastián Lopez Herrera	2	0	25	Shaurya Gullaiya	72	95468	\N
2023-02-24	PalaBadminton - 6	Shaurya Gullaiya	Milan Mesterhazy	2	0	25	Shaurya Gullaiya	16	95468	\N
2023-03-09	Sportarena (Sportforum) Berlin - 4	Shaurya Gullaiya	Zhi Lun Ong	2	0	22	Shaurya Gullaiya	22	95468	\N
2023-01-27	Fyrishov - Court 2	Shaurya Gullaiya	Simon Schenk	2	0	35	Shaurya Gullaiya	7	95468	\N
2023-03-08	Sportarena (Sportforum) Berlin - 4	Shaurya Gullaiya	Luis Pongratz	2	1	32	Shaurya Gullaiya	22	95468	\N
2023-01-25	Istora Senayan - Court 2	Shesar Hiren Rhustavito	Kidambi Srikanth	2	0	39	Shesar Hiren Rhustavito	4	81887	\N
2023-01-17	K. D. Jadhav Indoor Hall - 2	Shi Yu Qi	Chico Aura Dwi Wardoyo	2	1	60	Shi Yu Qi	3	57945	\N
2023-03-15	Utilita Arena Birmingham - 2 12BET	Shi Yu Qi	Kanta Tsuneyama	2	0	42	Shi Yu Qi	25	57945	\N
2023-01-25	Istora Senayan - Court 1	Shi Yu Qi	Kento Momota	2	0	40	Shi Yu Qi	4	57945	\N
2023-03-16	Utilita Arena Birmingham - 2 12BET	Shi Yu Qi	Kunlavut Vitidsarn	2	0	51	Shi Yu Qi	25	57945	\N
2023-01-27	Istora Senayan - Court 3	Shi Yu Qi	Lu Guang Zu	2	0	35	Shi Yu Qi	4	57945	\N
2023-04-26	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club - 4	Shi Yu Qi	Jonatan Christie (Walkover)	0	0	0	Shi Yu Qi	42	57945	\N
2023-03-18	Utilita Arena Birmingham - 1 Minoru Yoneyama	Shi Yu Qi	Lee Zii Jia	2	0	43	Shi Yu Qi	25	57945	\N
2023-03-17	Utilita Arena Birmingham - 2 12BET	Shi Yu Qi	Weng Hong Yang	2	0	43	Shi Yu Qi	25	57945	\N
2023-06-13	Istora - 1	Shi Yu Qi	Ng Tze Yong	2	1	60	Shi Yu Qi	70	57945	\N
2023-02-03	Nimibutr National Stadium - Court 2	Shi Yu Qi	Lee Cheuk Yiu	2	0	29	Shi Yu Qi	9	57945	\N
2023-02-02	Nimibutr National Stadium - Court 1	Shi Yu Qi	Koki Watanabe	2	1	60	Shi Yu Qi	9	57945	\N
2023-06-08	Singapore Indoor Stadium - 3	Shi Yu Qi	Lu Guang Zu	2	1	80	Shi Yu Qi	62	57945	\N
2023-06-06	Singapore Indoor Stadium - 3	Shi Yu Qi	Jonatan Christie	2	0	44	Shi Yu Qi	62	57945	\N
2023-02-01	Nimibutr National Stadium - Court 2	Shi Yu Qi	Mark Caljouw	2	1	61	Shi Yu Qi	9	57945	\N
2023-01-26	Istora Senayan - Court 1	Shi Yu Qi	Anthony Sinisuka Ginting	2	0	41	Shi Yu Qi	4	57945	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Shih Kuan-Chih	Raymond Sing	2	0	22	Shih Kuan-Chih	61	55836	\N
2023-06-28	National Sport Complex - 3	Shogo Ogawa	King Kien Hwa	1	0	18	Shogo Ogawa	82	62395	\N
2023-05-04	CODE II Jalisco - 1	Shogo Ogawa	Mark Shelley Alcala	2	0	39	Shogo Ogawa	45	62395	\N
2023-05-03	CODE II Jalisco - 2	Shogo Ogawa	Shun Saito	2	0	35	Shogo Ogawa	45	62395	\N
2023-05-03	CODE II Jalisco - 3	Shogo Ogawa	Pablo Abian	2	1	64	Shogo Ogawa	45	62395	\N
2023-03-15	Ruichang Sports Park Gym - Court 2	Sholeh Aidil	Lee Shun Yang	2	1	66	Sholeh Aidil	23	79110	\N
2023-03-07	Terminal 21 Korat - Court2	Sholeh Aidil	Tegar Sulistio	2	0	45	Sholeh Aidil	19	79110	\N
2023-03-08	Terminal 21 Korat - Court2	Sholeh Aidil	Lin Yu Hsien	2	0	36	Sholeh Aidil	19	79110	\N
2023-06-09	Sport Hall Svilengrad - 2	Shon Leitman	Ahmet Arda Atak	2	0	23	Shon Leitman	67	80423	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Shon Leitman	Christos Georgiou	2	0	28	Shon Leitman	41	80423	\N
2023-06-12	Sport Hall "Svilengrad" - 3	Shon Leitman	Tom Feltes	2	0	24	Shon Leitman	69	80423	\N
2023-06-09	Sport Hall Svilengrad - 4	Shon Leitman	Ahmet Bera Kus	2	1	56	Shon Leitman	67	80423	\N
2023-06-30	National Sport Complex - 2	Shota Omoto	Le Duc Phat	2	1	66	Shota Omoto	82	69756	\N
2023-06-28	National Sport Complex - 2	Shota Omoto	Rohan Midha	2	0	33	Shota Omoto	82	69756	\N
2023-06-06	Male’ Sports Complex - 1	Shota Omoto	Abhyansh Singh	2	0	33	Shota Omoto	60	69756	\N
2023-06-07	Male’ Sports Complex - 3	Shota Omoto	Arya Bhivpathaki	2	1	69	Shota Omoto	60	69756	\N
2023-06-08	Male’ Sports Complex - 4	Shota Omoto	M Atef Haikal Taufik	2	0	36	Shota Omoto	60	69756	\N
2023-06-29	National Sport Complex - 3	Shota Omoto	Ong Tae Ern	2	0	32	Shota Omoto	82	69756	\N
2023-06-30	National Sport Complex - 1	Shota Omoto	Takuma Kawamoto	2	0	34	Shota Omoto	82	69756	\N
2023-02-14	ABA - 5	Shrey Dhand	Asher Jing Jie Ooi	2	0	31	Shrey Dhand	13	56028	\N
2023-02-13	ABA - 5	Shrey Dhand	Alex Galt	2	0	20	Shrey Dhand	13	56028	\N
2023-02-15	ABA - 5	Shrey Dhand	Jordan Yang	2	1	60	Shrey Dhand	13	56028	\N
2023-06-06	Male’ Sports Complex - 2	Shreyansh Jaiswal	Ahmed Nibal	2	0	35	Shreyansh Jaiswal	60	83243	\N
2023-06-15	Polideportivo Villa Deportiva, Club Regatas Lima - 3	Shubh Krishan	Bengy Laime	2	1	49	Shubh Krishan	73	93924	\N
2023-06-22	Teodoro Palacios Flores - 3	Shubh Krishan	Jose Espnoza	2	1	35	Shubh Krishan	77	93924	\N
2023-06-13	Gilbert C. Ada Gymnasium - 1 - Streaming	Shun Saito	Ting Yen-Chen	2	0	36	Shun Saito	71	70050	\N
2023-05-03	CODE II Jalisco - 4	Shun Saito	King Kien Hwa	2	0	20	Shun Saito	45	70050	\N
2023-03-07	Terminal 21 Korat - Court3	Siddhanth Gupta	Yap Juin An	2	0	28	Siddhanth Gupta	19	89814	\N
2023-02-01	Afrasiabi Hall - court 3	Siddhanth Gupta	Mohsen Naeimi	2	0	20	Siddhanth Gupta	8	89814	\N
2023-03-21	Tay Ho District Stadium - 4	Siddhanth Gupta	Rohan Midha	2	0	35	Siddhanth Gupta	29	89814	\N
2023-03-08	Terminal 21 Korat - Court1	Siddhanth Gupta	Uriel Francisco Canjura Artiga	2	1	66	Siddhanth Gupta	19	89814	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Sie Zi Lok	Sebastian Vasquez	2	0	19	Sie Zi Lok	59	92024	\N
2023-06-20	Binjiang Gymnasium - 3	Sie Zi Lok	Hussein Zayan Shaheed	2	0	26	Sie Zi Lok	75	92024	\N
2023-02-17	John Barrable Hall - 2	Sifeddine LARBAOUI	Aaron MALCOUZANE	2	0	22	Sifeddine LARBAOUI	14	72161	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 4	Simon Baron-Vezilier	Joel König	2	1	59	Simon Baron-Vezilier	46	66522	\N
2023-04-07	Salle Everest - 2 - Vals	Simone Piccinin	Axel Bastide	2	0	35	Simone Piccinin	36	85595	\N
2023-02-10	Badminton Center Pécs - 2	Simone Piccinin	Igor Jasek	2	1	45	Simone Piccinin	11	85595	\N
2023-03-08	Sportarena (Sportforum) Berlin - 2	Simone Piccinin	Eric Teller	2	0	34	Simone Piccinin	22	85595	\N
2023-03-09	Sportarena (Sportforum) Berlin - 3	Simone Piccinin	Ilija Nicolussi	2	0	30	Simone Piccinin	22	85595	\N
2023-02-11	Badminton Center Pécs - 6	Simone Piccinin	Richard Pavlik	2	0	30	Simone Piccinin	11	85595	\N
2023-02-10	Badminton Center Pécs - 6	Simone Piccinin	Alvaro Moran	2	0	46	Simone Piccinin	11	85595	\N
2023-04-07	Salle Everest - 2 - Vals	Simone Piccinin	Keishin Rimmer	2	0	34	Simone Piccinin	36	85595	\N
2023-02-09	Badminton Center Pécs - 6	Simone Piccinin	Tomáš Vrbka	2	0	27	Simone Piccinin	11	85595	\N
2023-05-31	Center of Badminton - 2	Somi Romdhani	Artur Niyazov	2	0	30	Somi Romdhani	57	87484	\N
2023-06-28	National Sport Complex - 2	Somi Romdhani	Howard Shu	2	1	40	Somi Romdhani	82	87484	\N
2023-06-29	National Sport Complex - 3	Somi Romdhani	Yu Sheng Po	2	1	47	Somi Romdhani	82	87484	\N
2023-06-09	Male’ Sports Complex - 2	Soong Joo Ven	Kiran George	2	1	68	Soong Joo Ven	60	87117	\N
2023-03-07	Terminal 21 Korat - Court2	Soong Joo Ven	Liao Jhuo-Fu	2	1	63	Soong Joo Ven	19	87117	\N
2023-03-08	Terminal 21 Korat - Court1	Soong Joo Ven	Subhankar Dey	2	0	47	Soong Joo Ven	19	87117	\N
2023-06-06	Male’ Sports Complex - 4	Soong Joo Ven	Charan Naik Kelavathu	2	0	36	Soong Joo Ven	60	87117	\N
2023-06-08	Male’ Sports Complex - 4	Soong Joo Ven	Viren Nettasinghe	2	0	35	Soong Joo Ven	60	87117	\N
2023-06-08	Male’ Sports Complex - 1	Soong Joo Ven	Arunesh Hari	2	1	66	Soong Joo Ven	60	87117	\N
2023-06-07	Male’ Sports Complex - 1	Soong Joo Ven	Dhruv Kumar	2	1	80	Soong Joo Ven	60	87117	\N
2023-02-09	Badminton Center Pécs - 5	Stanimir Terziev	Simon Schenk	2	0	29	Stanimir Terziev	11	82828	\N
2023-02-10	Badminton Center Pécs - 5	Stanimir Terziev	Vid Koščak	2	0	26	Stanimir Terziev	11	82828	\N
2023-06-21	Tian-Mu Arena - Court 4	Su Li Yang	Liao Jhuo-Fu	2	0	37	Su Li Yang	78	94397	\N
2023-06-08	Gilbert C. Ada Gymnasium - 3	Su Li Yang	Ting Yen-Chen	2	0	35	Su Li Yang	61	94397	\N
2023-05-20	Sport hall Dras - Court 4	Su Li Yang	Victor Svendsen	2	0	48	Su Li Yang	51	94397	\N
2023-05-21	Sport hall Dras - Court 1	Su Li Yang	Kalle Koljonen	2	0	38	Su Li Yang	51	94397	\N
2023-06-07	Gilbert C. Ada Gymnasium - 3	Su Li Yang	Joakim Oldorff	2	1	64	Su Li Yang	61	94397	\N
2023-03-08	Terminal 21 Korat - Court2	Su Li Yang	Huang Yu Kai	2	0	25	Su Li Yang	19	94397	\N
2023-06-16	Gilbert C. Ada Gymnasium - 1 - Streaming	Su Li Yang	Lee Dong Keun	2	0	40	Su Li Yang	71	94397	\N
2023-05-20	Sport hall Dras - Court 2	Su Li Yang	Liao Jhuo-Fu	2	0	42	Su Li Yang	51	94397	\N
2023-06-15	Gilbert C. Ada Gymnasium - 2 - Streaming	Su Li Yang	Jia Wei Joel Koh	2	0	29	Su Li Yang	71	94397	\N
2023-06-09	Gilbert C. Ada Gymnasium - 2 - Streaming	Su Li Yang	Koo Takahashi	2	1	50	Su Li Yang	61	94397	\N
2023-05-19	Sport hall Dras - Court 1	Su Li Yang	Lin Kuan-Ting	2	0	42	Su Li Yang	51	94397	\N
2023-03-09	Terminal 21 Korat - Court3	Su Li Yang	Siddhanth Gupta	2	0	38	Su Li Yang	19	94397	\N
2023-03-07	Terminal 21 Korat - Court1	Su Li Yang	Tien Minh Nguyen	2	0	47	Su Li Yang	19	94397	\N
2023-06-14	Gilbert C. Ada Gymnasium - 2 - Streaming	Su Li Yang	Joakim Oldorff	2	1	51	Su Li Yang	71	94397	\N
2023-06-24	Tian-Mu Arena - Court 1	Su Li Yang	Ng Ka Long Angus	2	0	35	Su Li Yang	78	94397	\N
2023-06-23	Tian-Mu Arena - Court 1	Su Li Yang	Yeoh Seng Zoe	2	0	38	Su Li Yang	78	94397	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Su Li Yang	Dicky Dwi Pangestu	2	0	31	Su Li Yang	23	94397	\N
2023-06-22	Tian-Mu Arena - Court 1	Su Li Yang	Parupalli Kashyap	2	0	42	Su Li Yang	78	94397	\N
2023-03-30	Main Location - 5	Su Li Yang	Takuma Kawamoto	2	0	40	Su Li Yang	32	94397	\N
2023-03-16	Ruichang Sports Park Gym - Court 2	Su Li Yang	Zhu Xuan Chen	2	1	60	Su Li Yang	23	94397	\N
2023-03-30	Main Location - 5	Su Li Yang	Raghu Mariswamy	2	0	29	Su Li Yang	32	94397	\N
2023-03-07	Terminal 21 Korat - Court1	Subhankar Dey	M Atef Haikal Taufik	2	1	64	Subhankar Dey	19	60967	\N
2023-05-12	IFU Arena - 5.Unidamp	Subhankar Dey	Xiaodong Sheng	2	0	39	Subhankar Dey	48	60967	\N
2023-02-01	Afrasiabi Hall - court 1	Subhankar Dey	Prince Dahal	2	0	31	Subhankar Dey	8	60967	\N
2023-03-16	Ruichang Sports Park Gym - Court 1	Sun Chao	Chan Yin Chak	2	1	46	Sun Chao	23	89424	\N
2023-03-15	Ruichang Sports Park Gym - Court 5	Sun Chao	Ade Resky Dwicahyo	2	0	36	Sun Chao	23	89424	\N
2023-03-18	Ruichang Sports Park Gym - Court 1	Sun Chao	Liao Jhuo-Fu	2	1	69	Sun Chao	23	89424	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Sun Chao	Choo Kai Qing	2	0	27	Sun Chao	23	89424	\N
2023-03-17	Ruichang Sports Park Gym - Court 3	Sun Chao	Liu Liang	2	1	51	Sun Chao	23	89424	\N
2023-03-19	Ruichang Sports Park Gym - Court 1	Sun Fei Xiang	Sun Chao	2	0	48	Sun Fei Xiang	23	57762	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Sun Fei Xiang	Micaiah Jien Zheng Chai	2	0	29	Sun Fei Xiang	23	57762	\N
2023-06-21	Binjiang Gymnasium - 4	Sun Fei Xiang	Jacob Schueler	2	0	29	Sun Fei Xiang	75	57762	\N
2023-03-17	Ruichang Sports Park Gym - Court 1	Sun Fei Xiang	Liu Hai Chao	2	1	53	Sun Fei Xiang	23	57762	\N
2023-03-15	Ruichang Sports Park Gym - Court 2	Sun Fei Xiang	Rohan Midha	2	0	31	Sun Fei Xiang	23	57762	\N
2023-03-18	Ruichang Sports Park Gym - Court 1	Sun Fei Xiang	Justin Hoh	2	0	43	Sun Fei Xiang	23	57762	\N
2023-03-16	Ruichang Sports Park Gym - Court 1	Sun Fei Xiang	Sholeh Aidil	2	1	67	Sun Fei Xiang	23	57762	\N
2023-03-17	Sports Hall - 5 Yonex	Swann Hardi	Kryštof Klíma	2	0	31	Swann Hardi	27	84282	\N
2023-04-21	Complexe Sportif Regional - Court 4	Swann Hardi	Shangxi Olivier Song	2	1	17	Swann Hardi	40	84282	\N
2023-01-27	Fyrishov - Court 1	Swann Hardi	Bruno Steffen-Sanchez	2	0	32	Swann Hardi	7	84282	\N
2023-01-27	Fyrishov - Court 2	Swann Hardi	Eric Jarltén	2	0	26	Swann Hardi	7	84282	\N
2023-04-21	Complexe Sportif Regional - Court 3	Swann Hardi	Praneel Reddy Vallapureddy	2	0	32	Swann Hardi	40	84282	\N
2023-04-20	Complexe Sportif Regional - Court 4	Swann Hardi	Zhi Lun Ong	2	0	40	Swann Hardi	40	84282	\N
2023-03-18	Sports Hall - 2 Racis	Swann Hardi	Igor Skolimowski	2	0	30	Swann Hardi	27	84282	\N
2023-06-29	National Sport Complex - 3	Takuma Kawamoto	Samuel Hsiao	2	0	37	Takuma Kawamoto	82	81906	\N
2023-03-15	Ruichang Sports Park Gym - Court 3	Takuma Kawamoto	Lu Chia Hung	2	0	28	Takuma Kawamoto	23	81906	\N
2023-03-14	Ruichang Sports Park Gym - Court 3	Takuma Kawamoto	Sathish Kumar Karunakaran	2	0	33	Takuma Kawamoto	23	81906	\N
2023-03-30	Main Location - 6	Takuma Kawamoto	Enrico Asuncion	2	0	30	Takuma Kawamoto	32	81906	\N
2023-06-30	National Sport Complex - 3	Takuma Kawamoto	Jason Gunawan	2	1	45	Takuma Kawamoto	82	81906	\N
2023-06-28	National Sport Complex - 1	Takuma Kawamoto	Gerelsukh Jargalsaikhan	2	0	25	Takuma Kawamoto	82	81906	\N
2023-03-23	Tay Ho District Stadium - 4	Takuma Obayashi	Jeon Hyeok Jin	2	1	70	Takuma Obayashi	29	74076	\N
2023-03-07	Terminal 21 Korat - Court2	Takuma Obayashi	Lu Chia Hung	2	0	38	Takuma Obayashi	19	74076	\N
2023-03-24	Tay Ho District Stadium - 4	Takuma Obayashi	Kok Jing Hong	2	0	40	Takuma Obayashi	29	74076	\N
2023-06-13	Gilbert C. Ada Gymnasium - 2 - Streaming	Takuma Obayashi	Lei Ci Fu	2	0	34	Takuma Obayashi	71	74076	\N
2023-03-25	Tay Ho District Stadium - 2	Takuma Obayashi	Tommy Sugiarto	1	1	73	Takuma Obayashi	29	74076	\N
2023-03-21	Tay Ho District Stadium - 4	Takuma Obayashi	Kiran Kumar Mekala	2	1	60	Takuma Obayashi	29	74076	\N
2023-03-26	Tay Ho District Stadium - 1	Takuma Obayashi	Le Duc Phat	2	0	40	Takuma Obayashi	29	74076	\N
2023-03-08	Terminal 21 Korat - Court2	Takuma Obayashi	Hemanth M.Gowda	2	0	34	Takuma Obayashi	19	74076	\N
2023-03-10	Terminal 21 Korat - Court3	Takuma Obayashi	Yushi Tanaka	2	0	37	Takuma Obayashi	19	74076	\N
2023-03-22	Tay Ho District Stadium - 2	Takuma Obayashi	Muhammad Reza Al Fajri	2	1	62	Takuma Obayashi	29	74076	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Takuma Obayashi	Jia Heng Jason Teh	2	0	42	Takuma Obayashi	61	74076	\N
2023-06-14	Gilbert C. Ada Gymnasium - 1 - Streaming	Takuma Obayashi	Garret Tan	2	0	29	Takuma Obayashi	71	74076	\N
2023-03-30	Main Location - 3	Takuma Obayashi	Kuo Kuan Lin	2	0	39	Takuma Obayashi	32	74076	\N
2023-03-09	Terminal 21 Korat - Court4	Takuma Obayashi	Rithvik Sanjeevi Satish Kumar	2	1	63	Takuma Obayashi	19	74076	\N
2023-06-18	Gilbert C. Ada Gymnasium - 1 - Streaming	Takuma Obayashi	Jeon Hyeok Jin	2	0	43	Takuma Obayashi	71	74076	\N
2023-06-17	Gilbert C. Ada Gymnasium - 2 - Streaming	Takuma Obayashi	Su Li Yang	2	1	63	Takuma Obayashi	71	74076	\N
2023-06-16	Gilbert C. Ada Gymnasium - 3	Takuma Obayashi	Ryoma Muramoto	2	1	49	Takuma Obayashi	71	74076	\N
2023-06-15	Gilbert C. Ada Gymnasium - 2 - Streaming	Takuma Obayashi	Victor Lai	2	1	60	Takuma Obayashi	71	74076	\N
2023-03-21	Tay Ho District Stadium - 3	Tan Jia Jie	Ong Zhen Yi	2	0	50	Tan Jia Jie	29	68316	\N
2023-05-26	Raiffeisen Sportpark - 2	Tan Jia Jie	Wolfgang Gnedt	2	0	35	Tan Jia Jie	55	68316	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Tan Jia Jie	Subhankar Dey	2	1	52	Tan Jia Jie	46	68316	\N
2023-06-09	Cido Arena - Court 1	Tan Rui Yang Ryan	Karl Kert	2	1	53	Tan Rui Yang Ryan	66	80839	\N
2023-06-21	Binjiang Gymnasium - 3	Tan Zheng Tseng	Howard Shu	2	0	35	Tan Zheng Tseng	75	96955	\N
2023-02-01	Afrasiabi Hall - court 3	Tang Kai Feng	Davi Silva	2	0	14	Tang Kai Feng	8	64011	\N
2023-02-01	Afrasiabi Hall - court 3	Tarun Reddy Katam	Bodhi Ratana Teja Gotama	2	0	35	Tarun Reddy Katam	8	64768	\N
2023-03-21	Tay Ho District Stadium - 3	Tegar Sulistio	Bodhi Ratana Teja Gotama	2	0	48	Tegar Sulistio	29	81430	\N
2023-05-12	IFU Arena - 4.IFU	Tegar Sulistio	Simon Baron-Vezilier	2	0	33	Tegar Sulistio	48	81430	\N
2023-05-12	IFU Arena - 1.Victor	Tegar Sulistio	Alap Mishra	2	0	45	Tegar Sulistio	48	81430	\N
2023-02-17	John Barrable Hall - 2	Thabani MATHE	Michel Henri ASSEMBE	2	0	27	Thabani MATHE	14	64088	\N
2023-03-07	Terminal 21 Korat - Court4	Tharun Mannepalli	Bobby Setiabudi	2	1	58	Tharun Mannepalli	19	92160	\N
2023-03-21	Tay Ho District Stadium - 3	Tharun Mannepalli	Lu Wei Hsuan	2	0	42	Tharun Mannepalli	29	92160	\N
2023-06-09	Cido Arena - Court 5	Thomas Fourcade	Adith Karthikeyan Priya	2	0	37	Thomas Fourcade	66	59956	\N
2023-06-10	Cido Arena - Court 1	Thomas Fourcade	Amaury Lievre	2	1	60	Thomas Fourcade	66	59956	\N
2023-03-21	Tay Ho District Stadium - 1	Tien Minh Nguyen	Abhyansh Singh	2	1	55	Tien Minh Nguyen	29	14107	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 1	Timeo Lacour	Mikolaj Morawski	2	1	49	Timeo Lacour	79	83463	\N
2023-06-23	Sports Center ''Slana Bara - Klisa'' - 1	Timeo Lacour	Ahmet Bera Kus	2	0	23	Timeo Lacour	79	83463	\N
2023-06-24	Sports Center ''Slana Bara - Klisa'' - 2	Timeo Lacour	Alon Shlezinger	2	0	28	Timeo Lacour	79	83463	\N
2023-02-17	John Barrable Hall - 4	Timothy KAFUNDA	Jakim RENAUD	2	0	24	Timothy KAFUNDA	14	79629	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Ting Yen-Chen	Xiaodong Sheng	2	0	43	Ting Yen-Chen	61	86521	\N
2023-03-30	Main Location - 1	Ting Yen-Chen	Heo Kwang Hee	2	1	56	Ting Yen-Chen	32	86521	\N
2023-03-30	Main Location - 5	Ting Yen-Chen	Samuel Hsiao	2	0	38	Ting Yen-Chen	32	86521	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Ting Yen-Chen	Nathan Tang	2	1	45	Ting Yen-Chen	61	86521	\N
2023-06-01	Erwin Kranz Halle - 1	Tino Daoudal	Phone Pyae Naing	2	1	60	Tino Daoudal	58	93913	\N
2023-06-09	Cido Arena - Court 3	Tino Daoudal	Kiran Kumar Mekala	2	1	62	Tino Daoudal	66	93913	\N
2023-05-03	CODE II Jalisco - 1	Tobias Kuenzi	Shubh Krishan	2	0	22	Tobias Kuenzi	45	60427	\N
2023-06-09	Royal Stage - 1	Tobias Kuenzi	Lu Chia Hung	2	1	44	Tobias Kuenzi	64	60427	\N
2023-06-02	Indoor Stadium Huamark - Court 2	Toma Junior Popov	Kiran George	2	0	41	Toma Junior Popov	56	61628	\N
2023-03-29	Centro Deportivo Municipal Gallur - Court 1	Toma Junior Popov	Lin Chun-Yi	2	1	65	Toma Junior Popov	31	61628	\N
2023-06-01	Indoor Stadium Huamark - Court 2	Toma Junior Popov	Ng Ka Long Angus	2	0	41	Toma Junior Popov	56	61628	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 3	Toma Junior Popov	Gergo Pytel	2	0	37	Toma Junior Popov	81	61628	\N
2023-06-14	Istora - 3	Toma Junior Popov	Lin Chun-Yi	2	0	51	Toma Junior Popov	70	61628	\N
2023-05-31	Indoor Stadium Huamark - Court 3	Toma Junior Popov	Nhat Nguyen	2	0	54	Toma Junior Popov	56	61628	\N
2023-01-25	Istora Senayan - Court 2	Toma Junior Popov	Wang Tzu Wei	2	1	71	Toma Junior Popov	4	61628	\N
2023-03-30	Centro Deportivo Municipal Gallur - Court 4	Toma Junior Popov	Priyanshu Rajawat	2	0	34	Toma Junior Popov	31	61628	\N
2023-03-22	St. Jakobshalle Basel - 2	Toma Junior Popov	Hans-Kristian Solberg Vittinghus	2	0	44	Toma Junior Popov	28	61628	\N
2023-06-30	Arena Jaskółka Tarnów TOSiR - Court 3	Toma Junior Popov	Julien Carraggi	2	0	43	Toma Junior Popov	81	61628	\N
2023-03-31	Centro Deportivo Municipal Gallur - Court 2	Toma Junior Popov	Magnus Johannesen	2	0	37	Toma Junior Popov	31	61628	\N
2023-03-24	Tay Ho District Stadium - 3	Tommy Sugiarto	Kuo Kuan Lin	2	1	56	Tommy Sugiarto	29	14587	\N
2023-03-21	Tay Ho District Stadium - 1	Tommy Sugiarto	Liao Jhuo-Fu	2	0	44	Tommy Sugiarto	29	14587	\N
2023-03-23	Tay Ho District Stadium - 1	Tommy Sugiarto	Jason Gunawan	2	1	60	Tommy Sugiarto	29	14587	\N
2023-06-21	Tian-Mu Arena - Court 4	Tommy Sugiarto	Chen Chi Ting	2	1	66	Tommy Sugiarto	78	14587	\N
2023-03-22	Tay Ho District Stadium - 1	Tommy Sugiarto	Nguyen Hai Dang	2	0	36	Tommy Sugiarto	29	14587	\N
2023-05-05	Badmintonhalle Vorarlberg - 4	Toms Sala	Arthur Miauton	2	0	27	Toms Sala	47	93978	\N
2023-02-13	ABA - 1	Tony Chen	Ian Lubao	2	0	19	Tony Chen	12	85817	\N
2023-02-13	ABA - 2	Tony Fang	Liam Fong	2	0	26	Tony Fang	12	96242	\N
2023-02-17	John Barrable Hall - 1	Trinity CHIPUMHO	Edmilson Paulo MUTONDO	2	0	20	Trinity CHIPUMHO	14	74639	\N
2023-06-09	Royal Stage - 4	Uriel Francisco Canjura Artiga	Danylo Bosniuk	2	1	60	Uriel Francisco Canjura Artiga	64	74579	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 2	Uriel Francisco Canjura Artiga	Luis Armando Montoya Navarro	2	1	56	Uriel Francisco Canjura Artiga	43	74579	\N
2023-05-03	CODE II Jalisco - 3	Uriel Francisco Canjura Artiga	Jeppe Bruun	2	0	42	Uriel Francisco Canjura Artiga	45	74579	\N
2023-06-16	Salle metropolitaine de la Trocardière - 4 - Renault Dacia	Uriel Francisco Canjura Artiga	Lin Kuan-Ting	2	1	62	Uriel Francisco Canjura Artiga	74	74579	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 2	Uriel Francisco Canjura Artiga	Jonathan Matias	2	1	59	Uriel Francisco Canjura Artiga	43	74579	\N
2023-05-04	CODE II Jalisco - 1	Uriel Francisco Canjura Artiga	Luka Wraber	2	0	35	Uriel Francisco Canjura Artiga	45	74579	\N
2023-03-07	Terminal 21 Korat - Court2	Uriel Francisco Canjura Artiga	Shahyar Shaqeem	2	0	51	Uriel Francisco Canjura Artiga	19	74579	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 1	Uriel Francisco Canjura Artiga	Kevin Cordon	2	1	61	Uriel Francisco Canjura Artiga	43	74579	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 3	Uriel Francisco Canjura Artiga	Deivid Silva	2	0	41	Uriel Francisco Canjura Artiga	43	74579	\N
2023-05-03	CODE II Jalisco - 3	Uriel Francisco Canjura Artiga	Job Castillo	2	1	65	Uriel Francisco Canjura Artiga	45	74579	\N
2023-02-28	MTN Arena - COURT 3	Vaishnav Russeean	Rajhans Rai Nundah	2	1	37	Vaishnav Russeean	17	77759	\N
2023-02-27	MTN Arena - COURT 3	Vaishnav Russeean	Batham Kaweesa	2	1	41	Vaishnav Russeean	17	77759	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 2	Valentin Singer	Brian Holtschke	2	1	58	Valentin Singer	5	96339	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Valentin Singer	Amaury Lievre	2	0	27	Valentin Singer	46	96339	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 1	Valentin Singer	Daniil Dubovenko	2	1	59	Valentin Singer	46	96339	\N
2023-04-14	VELO-hall - 2	Valentin Singer	Uriel Francisco Canjura Artiga	2	0	32	Valentin Singer	38	96339	\N
2023-01-28	Tennis- og badmintonfélag Reykjavíkur - 1	Valentin Singer	Nicolas A. Mueller	2	1	63	Valentin Singer	5	96339	\N
2023-03-10	High Performance Centre - 3	Valentin Singer	Nathan Tang	2	0	27	Valentin Singer	21	96339	\N
2023-03-11	High Performance Centre - 5	Valentin Singer	Ditlev Jaeger Holm	2	1	66	Valentin Singer	21	96339	\N
2023-06-08	Male’ Sports Complex - 2	Varun Kapur	Le Duc Phat	2	0	40	Varun Kapur	60	62933	\N
2023-06-06	Male’ Sports Complex - 4	Varun Kapur	Lance Gabriel Vargas	2	1	85	Varun Kapur	60	62933	\N
2023-06-07	Male’ Sports Complex - 4	Varun Kapur	Buwaneka Goonethilleka	2	0	45	Varun Kapur	60	62933	\N
2023-06-01	Center of Badminton - 3	Velasco Mark Anthony	Kavin Thangam Kavin	2	1	53	Velasco Mark Anthony	57	70896	\N
2023-05-31	Center of Badminton - 2	Velasco Mark Anthony	Andrey Shalagin	2	0	19	Velasco Mark Anthony	57	70896	\N
2023-06-06	Male’ Sports Complex - 3	Velasco Mark Anthony	Kavin Thangam Kavin	2	0	30	Velasco Mark Anthony	60	70896	\N
2023-05-03	CODE II Jalisco - 3	Victor Lai	William Hu	2	1	46	Victor Lai	45	94151	\N
2023-06-14	Gilbert C. Ada Gymnasium - 3	Victor Lai	Chen Yu Cheng	2	1	61	Victor Lai	71	94151	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Victor Lai	Kemar Valentine	2	0	21	Victor Lai	43	94151	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Victor Lai	Jacob Schueler	2	1	50	Victor Lai	61	94151	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Victor Lai	Joel Angus	2	0	20	Victor Lai	43	94151	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Victor Lai	Leonard Manuel	2	0	15	Victor Lai	71	94151	\N
2023-03-12	High Performance Centre - 2	Victor Ørding Kauffmann	Pablo Abian	2	1	67	Victor Ørding Kauffmann	21	90360	\N
2023-06-16	Salle metropolitaine de la Trocardière - 5 - Credit Agricole	Victor Ørding Kauffmann	Bahaedeen Ahmad Alshannik	2	0	25	Victor Ørding Kauffmann	74	90360	\N
2023-01-27	Tennis- og badmintonfélag Reykjavíkur - 5	Victor Ørding Kauffmann	Sid Palakkal	2	0	25	Victor Ørding Kauffmann	5	90360	\N
2023-03-11	High Performance Centre - 2	Victor Ørding Kauffmann	Aria Dinata	2	1	52	Victor Ørding Kauffmann	21	90360	\N
2023-03-10	High Performance Centre - 3	Victor Ørding Kauffmann	Leo Van Gysel	2	0	30	Victor Ørding Kauffmann	21	90360	\N
2023-03-11	High Performance Centre - 3	Victor Ørding Kauffmann	Valentin Singer	2	0	33	Victor Ørding Kauffmann	21	90360	\N
2023-05-19	Sport hall Dras - Court 2	Victor Svendsen	Max Weisskirchen	2	0	30	Victor Svendsen	51	59420	\N
2023-05-12	IFU Arena - 4.IFU	Victor Svendsen	Abhishek Yeligar	2	0	26	Victor Svendsen	48	59420	\N
2023-05-13	IFU Arena - 1.Victor	Victor Svendsen	Krishna Adi Nugraha	2	0	32	Victor Svendsen	48	59420	\N
2023-06-16	Salle metropolitaine de la Trocardière - 3 - BoitaPart	Victor Svendsen	Bernardo Atilano	2	0	25	Victor Svendsen	74	59420	\N
2023-03-24	Arena Jaskółka - Ministerstwo Sportu	Victor Svendsen	Kartikey Gulshan Kumar (Walkover)	0	0	0	Victor Svendsen	30	59420	\N
2023-03-25	Arena Jaskółka - 3	Victor Svendsen	Elias Bracke	2	0	34	Victor Svendsen	30	59420	\N
2023-05-13	IFU Arena - 3.Uppsala	Victor Svendsen	Enogat Roy	2	1	48	Victor Svendsen	48	59420	\N
2023-05-12	IFU Arena - 2.Sportity	Victor Svendsen	Panji Ahmad Maulana	2	1	50	Victor Svendsen	48	59420	\N
2023-05-14	IFU Arena - 2.Sportity	Victor Svendsen	Kalle Koljonen	2	0	31	Victor Svendsen	48	59420	\N
2023-03-22	St. Jakobshalle Basel - 1	Viktor Axelsen	Chico Aura Dwi Wardoyo	0	0	5	Viktor Axelsen	28	25831	\N
2023-06-30	Arena Jaskółka Tarnów TOSiR - Court 2	Viktor Axelsen	Kalle Koljonen	2	0	39	Viktor Axelsen	81	25831	\N
2023-03-14	Utilita Arena Birmingham - 1 Minoru Yoneyama	Viktor Axelsen	Lee Cheuk Yiu	2	1	60	Viktor Axelsen	25	25831	\N
2023-06-18	Istora - 1	Viktor Axelsen	Anthony Sinisuka Ginting	2	0	47	Viktor Axelsen	70	25831	\N
2023-06-15	Istora - 1	Viktor Axelsen	Wang Tzu Wei	2	0	43	Viktor Axelsen	70	25831	\N
2023-01-14	Axiata Arena - Court 1	Viktor Axelsen	Kanta Tsuneyama	2	0	46	Viktor Axelsen	1	25831	\N
2023-07-02	Arena Jaskółka Tarnów TOSiR - Court 2	Viktor Axelsen	Christo Popov	2	1	83	Viktor Axelsen	81	25831	\N
2023-01-15	Axiata Arena - Court 1	Viktor Axelsen	Kodai Naraoka	2	0	40	Viktor Axelsen	1	25831	\N
2023-01-13	Axiata Arena - Court 1	Viktor Axelsen	Kenta Nishimoto	2	0	38	Viktor Axelsen	1	25831	\N
2023-01-12	Axiata Arena - Court 2	Viktor Axelsen	Liew Daren (Walkover)	0	0	0	Viktor Axelsen	1	25831	\N
2023-01-20	K. D. Jadhav Indoor Hall - 2	Viktor Axelsen	Rasmus Gemke	0	0	17	Viktor Axelsen	3	25831	\N
2023-06-29	Arena Jaskółka Tarnów TOSiR - Court 1	Viktor Axelsen	Nhat Nguyen	2	0	41	Viktor Axelsen	81	25831	\N
2023-03-23	St. Jakobshalle Basel - 1	Viktor Axelsen	Lin Chun-Yi	2	0	30	Viktor Axelsen	28	25831	\N
2023-06-16	Istora - 1	Viktor Axelsen	Chou Tien Chen	2	0	39	Viktor Axelsen	70	25831	\N
2023-01-19	K. D. Jadhav Indoor Hall - 1	Viktor Axelsen	Shi Yu Qi	2	1	63	Viktor Axelsen	3	25831	\N
2023-01-21	K. D. Jadhav Indoor Hall - 1	Viktor Axelsen	Jonatan Christie	2	0	38	Viktor Axelsen	3	25831	\N
2023-03-24	St. Jakobshalle Basel - 1	Viktor Axelsen	Christo Popov	2	0	40	Viktor Axelsen	28	25831	\N
2023-06-17	Istora - 1	Viktor Axelsen	Prannoy H. S.	2	0	46	Viktor Axelsen	70	25831	\N
2023-06-13	Istora - 1	Viktor Axelsen	Weng Hong Yang	2	0	36	Viktor Axelsen	70	25831	\N
2023-01-10	Axiata Arena - Court 4	Viktor Axelsen	Rasmus Gemke	2	1	65	Viktor Axelsen	1	25831	\N
2023-01-18	K. D. Jadhav Indoor Hall - 1	Viktor Axelsen	Kidambi Srikanth	2	0	41	Viktor Axelsen	3	25831	\N
2023-07-01	Arena Jaskółka Tarnów TOSiR - Court 2	Viktor Axelsen	Toma Junior Popov	2	0	51	Viktor Axelsen	81	25831	\N
2023-02-10	Badminton Center Pécs - 1	Viktor Petrovic	Hrvoje Mavriček	2	0	26	Viktor Petrovic	11	58194	\N
2023-02-10	Badminton Center Pécs - 6	Viktor Petrovic	Stanimir Terziev	2	0	27	Viktor Petrovic	11	58194	\N
2023-02-09	Badminton Center Pécs - 2	Viktor Petrovic	Alex Petrovic	2	0	25	Viktor Petrovic	11	58194	\N
2023-03-31	City Sport Hall - Court 3	Viktor Petrovic	Adam Travinskiy	2	0	20	Viktor Petrovic	34	58194	\N
2023-03-30	City Sport Hall - Court 5	Viktor Petrovic	Amit Vainer	2	0	18	Viktor Petrovic	34	58194	\N
2023-03-31	City Sport Hall - Court 2	Viktor Petrovic	Panya Phutthiphraisakul	2	1	54	Viktor Petrovic	34	58194	\N
2023-02-25	MTN Arena - 2	Viren Nettasinghe	Anuoluwapo Juwon Opeyori	2	0	31	Viren Nettasinghe	15	64666	\N
2023-02-24	MTN Arena - 3	Viren Nettasinghe	Ade Resky Dwicahyo	2	1	50	Viren Nettasinghe	15	64666	\N
2023-06-07	Male’ Sports Complex - 4	Viren Nettasinghe	Kartikey Gulshan Kumar	2	0	46	Viren Nettasinghe	60	64666	\N
2023-02-23	MTN Arena - 3	Viren Nettasinghe	Fabian Roth	2	1	46	Viren Nettasinghe	15	64666	\N
2023-06-06	Male’ Sports Complex - 2	Viren Nettasinghe	Mohammed Munawar	2	0	25	Viren Nettasinghe	60	64666	\N
2023-05-19	Sport hall Marino Cvetković - 4	Vladyslav Kunin	Ruben Fellin	2	0	26	Vladyslav Kunin	52	79186	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Bana 1	Vladyslav Kunin	Priit Põder	2	0	22	Vladyslav Kunin	6	79186	\N
2023-03-18	Sports Hall - 2 Racis	Vladyslav Kunin	Ismael Oballe	2	1	40	Vladyslav Kunin	27	79186	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Vladyslav Kunin	Rafe Kenji Braach	2	0	30	Vladyslav Kunin	10	79186	\N
2023-03-18	Sports Hall - 3 Betonex	Vladyslav Kunin	Rasmus Roogsoo	2	0	22	Vladyslav Kunin	27	79186	\N
2023-02-04	Polideportivo Arroyo de la Miel - 3	Vladyslav Kunin	Adam Srnec	2	0	25	Vladyslav Kunin	10	79186	\N
2023-01-28	Upplands Boservice Arena/Fyrisfjädern - Court 5	Vladyslav Kunin	Leon Kaschura	2	1	41	Vladyslav Kunin	6	79186	\N
2023-05-20	Sport hall Marino Cvetković - 1	Vladyslav Kunin	Micah Melis	2	0	22	Vladyslav Kunin	52	79186	\N
2023-04-14	LOC Manege - 3	Vladyslav Kunin	Jurgis Jatulis	2	0	27	Vladyslav Kunin	39	79186	\N
2023-03-17	Sports Hall - 4 Bank Spółdzielczy	Vladyslav Kunin	Bartosz Kufel	2	0	20	Vladyslav Kunin	27	79186	\N
2023-04-15	LOC Manege - 2	Vladyslav Kunin	Priit Põder	2	0	22	Vladyslav Kunin	39	79186	\N
2023-02-04	Polideportivo Arroyo de la Miel - 2	Vladyslav Kunin	Filip Titěra	2	0	25	Vladyslav Kunin	10	79186	\N
2023-05-20	Sport hall Marino Cvetković - 1	Vladyslav Kunin	George Alexandru Mocan	2	0	30	Vladyslav Kunin	52	79186	\N
2023-04-15	LOC Manege - TV	Vladyslav Kunin	Danil Sedov	2	1	37	Vladyslav Kunin	39	79186	\N
2023-02-03	Polideportivo Arroyo de la Miel - 2	Vladyslav Kunin	Mario Rodriguez	2	0	22	Vladyslav Kunin	10	79186	\N
2023-01-27	Upplands Boservice Arena/Fyrisfjädern - Court 4	Vladyslav Kunin	Luuk Vingerhoed	2	0	24	Vladyslav Kunin	6	79186	\N
2023-02-04	Polideportivo Arroyo de la Miel - 1	Vladyslav Stepanchenko	Shangxi Olivier Song	2	0	29	Vladyslav Stepanchenko	10	82207	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Vladyslav Stepanchenko	Tomasz Koperdowski	2	0	19	Vladyslav Stepanchenko	54	82207	\N
2023-04-14	LOC Manege - TV	Vladyslav Stepanchenko	Dominik Tankevic	2	0	27	Vladyslav Stepanchenko	39	82207	\N
2023-05-26	Sports Hall of Agricultural School Complex - 1. Białystok	Vladyslav Stepanchenko	Adam Srnec	2	0	25	Vladyslav Stepanchenko	54	82207	\N
2023-04-15	LOC Manege - TV	Vladyslav Stepanchenko	Joris Ivanauskas	2	0	22	Vladyslav Stepanchenko	39	82207	\N
2023-02-03	Polideportivo Arroyo de la Miel - 1	Vladyslav Stepanchenko	Davide Izzo	2	0	25	Vladyslav Stepanchenko	10	82207	\N
2023-05-25	Sports Hall of Agricultural School Complex - 4. Yonex	Vladyslav Stepanchenko	Pawel Kiszczyk	2	0	27	Vladyslav Stepanchenko	54	82207	\N
2023-05-26	Sports Hall of Agricultural School Complex - 2. Podlaskie	Vladyslav Stepanchenko	Mikkel Eilersen Bouet	2	0	25	Vladyslav Stepanchenko	54	82207	\N
2023-04-15	LOC Manege - 2	Vladyslav Stepanchenko	Marti Joost	2	1	55	Vladyslav Stepanchenko	39	82207	\N
2023-06-02	Erwin Kranz Halle - 4	Wang Po-Wei	Huang Yu Kai	2	0	28	Wang Po-Wei	58	87029	\N
2023-06-10	Royal Stage - 3	Wang Po-Wei	Ygor Coelho	2	1	55	Wang Po-Wei	64	87029	\N
2023-03-07	Terminal 21 Korat - Court1	Wang Po-Wei	Kartikey Gulshan Kumar	2	0	42	Wang Po-Wei	19	87029	\N
2023-05-27	Raiffeisen Sportpark - 1	Wang Po-Wei	Harsheel Dani	2	0	31	Wang Po-Wei	55	87029	\N
2023-06-01	Erwin Kranz Halle - 4	Wang Po-Wei	Alvaro Leal	2	0	37	Wang Po-Wei	58	87029	\N
2023-06-09	Royal Stage - 5	Wang Po-Wei	Ade Resky Dwicahyo	2	0	41	Wang Po-Wei	64	87029	\N
2023-05-27	Raiffeisen Sportpark - 2	Wang Po-Wei	B. R. Sankeerth	2	0	37	Wang Po-Wei	55	87029	\N
2023-06-09	Royal Stage - 2	Wang Po-Wei	Magnus Johannesen	2	1	62	Wang Po-Wei	64	87029	\N
2023-06-02	Erwin Kranz Halle - 2	Wang Po-Wei	Xiaodong Sheng	2	0	32	Wang Po-Wei	58	87029	\N
2023-03-21	Tay Ho District Stadium - 3	Wang Po-Wei	Ong Ken Yon	2	0	45	Wang Po-Wei	29	87029	\N
2023-06-03	Erwin Kranz Halle - 2	Wang Po-Wei	Kuo Kuan Lin	2	0	33	Wang Po-Wei	58	87029	\N
2023-05-26	Raiffeisen Sportpark - 4	Wang Po-Wei	Lin Kuan-Ting	2	1	54	Wang Po-Wei	55	87029	\N
2023-06-03	Erwin Kranz Halle - 1	Wang Po-Wei	Matthias Kicklitz	2	0	36	Wang Po-Wei	58	87029	\N
2023-06-22	Tian-Mu Arena - Court 4	Wang Tzu Wei	Chi Yu Jen	2	0	34	Wang Tzu Wei	78	87375	\N
2023-06-23	Tian-Mu Arena - Court 1	Wang Tzu Wei	Lin Chun-Yi	2	0	50	Wang Tzu Wei	78	87375	\N
2023-06-21	Tian-Mu Arena - Court 1	Wang Tzu Wei	Lee Cheuk Yiu	2	0	42	Wang Tzu Wei	78	87375	\N
2023-06-13	Istora - 3	Wang Tzu Wei	Kantaphon Wangcharoen	2	0	35	Wang Tzu Wei	70	87375	\N
2023-01-17	K. D. Jadhav Indoor Hall - 3	Wang Tzu Wei	Nhat Nguyen	2	0	55	Wang Tzu Wei	3	87375	\N
2023-06-21	Binjiang Gymnasium - 4	Wang Zheng Xing	Heng Lin Ngan	2	0	33	Wang Zheng Xing	75	89163	\N
2023-06-20	Binjiang Gymnasium - 3	Wang Zheng Xing	Par Tien Ann	2	0	35	Wang Zheng Xing	75	89163	\N
2023-05-14	Sportenum - 3	Wei-Cheng Su	Bharath Latheesh	2	0	27	Wei-Cheng Su	49	61504	\N
2023-06-22	National Sports Complex - 2	Wei-Cheng Su	Song Renxu	2	0	21	Wei-Cheng Su	76	61504	\N
2023-05-14	Sportenum - 1	Wei-Cheng Su	Zong Ruei Lee	2	0	29	Wei-Cheng Su	49	61504	\N
2023-05-13	Sportenum - 1	Wei-Cheng Su	Arnaud Huberty	2	0	24	Wei-Cheng Su	49	61504	\N
2023-05-13	Sportenum - 2	Wei-Cheng Su	Arthur Tatranov	2	0	29	Wei-Cheng Su	49	61504	\N
2023-06-23	National Sports Complex - 1	Wei-Cheng Su	Lee Tao Ong	2	0	26	Wei-Cheng Su	76	61504	\N
2023-05-12	Sportenum - 5	Wei-Cheng Su	Timo Amacker	2	0	22	Wei-Cheng Su	49	61504	\N
2023-05-13	Sportenum - 1	Wei-Cheng Su	Kjell Wagener	2	0	31	Wei-Cheng Su	49	61504	\N
2023-06-28	National Sport Complex - 3	Wei-Cheng Su	Huan Kai Hern	2	1	55	Wei-Cheng Su	82	61504	\N
2023-06-22	Teodoro Palacios Flores - 3	Welton Menezes	Raul Anguiano	2	0	21	Welton Menezes	77	56821	\N
2023-05-31	Indoor Stadium Huamark - Court 2	Weng Hong Yang	Kidambi Srikanth	2	1	62	Weng Hong Yang	56	77042	\N
2023-05-25	Axiata Arena - Court 2	Weng Hong Yang	Anthony Sinisuka Ginting	2	0	51	Weng Hong Yang	53	77042	\N
2023-05-26	Axiata Arena - Court 1	Weng Hong Yang	Ng Ka Long Angus	2	1	86	Weng Hong Yang	53	77042	\N
2023-05-27	Axiata Arena - Court 1	Weng Hong Yang	Lin Chun-Yi	2	0	59	Weng Hong Yang	53	77042	\N
2023-03-16	Utilita Arena Birmingham - 4	Weng Hong Yang	Chico Aura Dwi Wardoyo	2	1	62	Weng Hong Yang	25	77042	\N
2023-06-07	Singapore Indoor Stadium - 3	Weng Hong Yang	Lee Zii Jia	2	1	74	Weng Hong Yang	62	77042	\N
2023-05-24	Axiata Arena - Court 3	Weng Hong Yang	Kento Momota	2	1	95	Weng Hong Yang	53	77042	\N
2023-03-15	Utilita Arena Birmingham - 3	Weng Hong Yang	Jonatan Christie	2	0	40	Weng Hong Yang	25	77042	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 5	Wolfgang Gnedt	David Kim	2	0	36	Wolfgang Gnedt	46	61916	\N
2023-06-01	Centro Entrenamiento Olimpico - 3	Wong Yan Kit	Leo Lee	2	0	30	Wong Yan Kit	59	78169	\N
2023-06-01	Centro Entrenamiento Olimpico - 4	Wong Yan Kit	Alejandro Chueca Sanchez	2	0	33	Wong Yan Kit	59	78169	\N
2023-06-21	Binjiang Gymnasium - 2	Wu Kai An	Ao Fei Long	2	0	24	Wu Kai An	75	63973	\N
2023-06-22	Binjiang Gymnasium - 4	Wu Kai An	Tan Zheng Tseng	2	0	34	Wu Kai An	75	63973	\N
2023-06-20	Binjiang Gymnasium - 2	Wu Kai An	Larry Pong	2	1	56	Wu Kai An	75	63973	\N
2023-05-05	d'Coque Centre National Sportif & culturel - 4	Xiaodong Sheng	Mads Juel Møller	2	1	52	Xiaodong Sheng	46	77143	\N
2023-02-02	Afrasiabi Hall - court 3	Xiaodong Sheng	Meiraba Luwang Maisnam	2	1	62	Xiaodong Sheng	8	77143	\N
2023-02-01	Afrasiabi Hall - court 2	Xiaodong Sheng	Saleh Sangtarash	2	0	32	Xiaodong Sheng	8	77143	\N
2023-06-01	Erwin Kranz Halle - 3	Xiaodong Sheng	Kiran Kumar Mekala	2	0	30	Xiaodong Sheng	58	77143	\N
2023-06-22	Binjiang Gymnasium - 1	Xiaodong Sheng	Zhang Jing Yi	2	1	67	Xiaodong Sheng	75	77143	\N
2023-06-21	Binjiang Gymnasium - 3	Xiaodong Sheng	Panitchaphon Teeraratsakul	2	1	58	Xiaodong Sheng	75	77143	\N
2023-06-20	Binjiang Gymnasium - 3	Xiaodong Sheng	Micaiah Jien Zheng Chai	2	0	38	Xiaodong Sheng	75	77143	\N
2023-05-19	Sport hall Dras - Court 3	Xiaodong Sheng	Meiraba Luwang Maisnam	2	1	66	Xiaodong Sheng	51	77143	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Yang Yang	Hanz Haiqal	2	0	28	Yang Yang	71	89309	\N
2023-06-07	Gilbert C. Ada Gymnasium - 2 - Streaming	Yang Yang	Brian Lubao	2	0	15	Yang Yang	61	89309	\N
2023-03-07	Terminal 21 Korat - Court4	Yang Yang	Liu Wei Chi	2	0	35	Yang Yang	19	89309	\N
2023-06-20	Binjiang Gymnasium - 1	Yang Yang	Choo Kai Qing	2	0	27	Yang Yang	75	89309	\N
2023-06-28	National Sport Complex - 3	Yang Yang	Pang Fong Pui	2	1	53	Yang Yang	82	89309	\N
2023-06-06	Gilbert C. Ada Gymnasium - 1 - Streaming	Yang Yang	Son Wan Ho	2	1	66	Yang Yang	61	89309	\N
2023-06-14	Gilbert C. Ada Gymnasium - 3	Yang Yang	Paulo Quidato	2	0	17	Yang Yang	71	89309	\N
2023-06-21	Binjiang Gymnasium - 3	Yang Yang	Phuc Thinh Phan	2	1	54	Yang Yang	75	89309	\N
2023-06-30	National Sport Complex - 1	Yang Yang	Hikaru Minegishi	2	1	60	Yang Yang	82	89309	\N
2023-06-29	-	Yang Yang	Soong Joo Ven (Walkover)	0	0	0	Yang Yang	82	89309	\N
2023-06-01	Erwin Kranz Halle - 4	Yanis Gaudin	Ernesto Baschwitz	2	0	32	Yanis Gaudin	58	83581	\N
2023-06-02	Erwin Kranz Halle - 1	Yanis Gaudin	Jonathan Dolan	2	0	32	Yanis Gaudin	58	83581	\N
2023-04-22	Evangelos Florakis Sports Hall - 3	Yap Chun Sin	Ong Tae Ern	2	0	37	Yap Chun Sin	41	59157	\N
2023-04-07	Salle Everest - 2 - Vals	Yap Chun Sin	Felix Wright	2	0	35	Yap Chun Sin	36	59157	\N
2023-06-28	National Sport Complex - 2	Yap Chun Sin	Pui Chi Chon	2	0	25	Yap Chun Sin	82	59157	\N
2023-06-20	Binjiang Gymnasium - 4	Yap Chun Sin	Jhonatan Wu Zheng	2	0	25	Yap Chun Sin	75	59157	\N
2023-04-07	-	Yap Chun Sin	Nathan Bouillot (Walkover)	0	0	0	Yap Chun Sin	36	59157	\N
2023-04-06	Salle Everest - 5 - Koesio	Yap Chun Sin	Ewen Peres	2	0	23	Yap Chun Sin	36	59157	\N
2023-04-08	Salle Everest - 4 - Kyriad	Yap Chun Sin	Chen Shao-Hsuan	2	1	53	Yap Chun Sin	36	59157	\N
2023-04-22	Evangelos Florakis Sports Hall - 3	Yap Chun Sin	Filip Swahn	2	1	56	Yap Chun Sin	41	59157	\N
2023-04-21	Evangelos Florakis Sports Hall - 3	Yap Chun Sin	Panayiotis Kyriacou	2	0	14	Yap Chun Sin	41	59157	\N
2023-04-21	Evangelos Florakis Sports Hall - 5	Yap Chun Sin	Roko Pipunić	2	0	23	Yap Chun Sin	41	59157	\N
2023-03-17	Sports Hall - 3 Betonex	Yegor Romaniuk	Vojtěch Strejček	2	0	23	Yegor Romaniuk	27	91051	\N
2023-02-03	Polideportivo Arroyo de la Miel - 5	Yegor Romaniuk	Raul Bergua	2	1	61	Yegor Romaniuk	10	91051	\N
2023-04-14	LOC Manege - 2	Yegor Romaniuk	Mykolas Grigas	2	0	19	Yegor Romaniuk	39	91051	\N
2023-05-19	Sport hall Marino Cvetković - 3	Yegor Romaniuk	Abel Balint Kiss	2	0	25	Yegor Romaniuk	52	91051	\N
2023-05-25	Sports Hall of Agricultural School Complex - 3. SportLen	Yegor Romaniuk	Mikolaj Mroszczyk	2	0	24	Yegor Romaniuk	54	91051	\N
2023-05-20	Sport hall Marino Cvetković - 1	Yegor Romaniuk	Jakub Klokan	2	0	26	Yegor Romaniuk	52	91051	\N
2023-02-04	Polideportivo Arroyo de la Miel - 4	Yegor Romaniuk	Tim Schmitz	2	0	19	Yegor Romaniuk	10	91051	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 3	Yeison Esleiter Del Cid Alvarez	Santiago Otero	2	0	46	Yeison Esleiter Del Cid Alvarez	43	73177	\N
2023-05-03	CODE II Jalisco - 3	Yeison Esleiter Del Cid Alvarez	Luís Enrique Peñalver	2	1	47	Yeison Esleiter Del Cid Alvarez	45	73177	\N
2023-06-22	Teodoro Palacios Flores - 2	Yeison Esleiter Del Cid Alvarez	Alvaro Rio	2	0	30	Yeison Esleiter Del Cid Alvarez	77	73177	\N
2023-03-17	Coliseo de la Ciudad Deportiva - 2	Yeison Esleiter Del Cid Alvarez	Charlie Castle	2	0	30	Yeison Esleiter Del Cid Alvarez	24	73177	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 4	Yeison Esleiter Del Cid Alvarez	Keiber Alberto Peñalver Rivas	2	0	26	Yeison Esleiter Del Cid Alvarez	43	73177	\N
2023-03-16	-	Yeison Esleiter Del Cid Alvarez	Jorge Manuel Basulto Fernandez	2	0	15	Yeison Esleiter Del Cid Alvarez	24	73177	\N
2023-06-21	Tian-Mu Arena - Court 1	Yeoh Seng Zoe	Lin Kuan-Ting	2	1	68	Yeoh Seng Zoe	78	95952	\N
2023-06-22	Tian-Mu Arena - Court 3	Yeoh Seng Zoe	Kanta Tsuneyama	2	0	44	Yeoh Seng Zoe	78	95952	\N
2023-05-31	Center of Badminton - 1	Yevgeniy Yevseyev	Yazan Saigh	2	0	26	Yevgeniy Yevseyev	57	60776	\N
2023-04-28	G.C. Foster College of Physical Education and Spor - 3	Ygor Coelho	Howard Shu	1	0	15	Ygor Coelho	43	96429	\N
2023-05-03	CODE II Jalisco - 1	Ygor Coelho	Youcef Sabri Medel	2	0	18	Ygor Coelho	45	96429	\N
2023-06-09	Royal Stage - 4	Ygor Coelho	Kim Bruun	2	0	29	Ygor Coelho	64	96429	\N
2023-05-03	CODE II Jalisco - 3	Ygor Coelho	Enrico Asuncion	2	0	31	Ygor Coelho	45	96429	\N
2023-06-09	Royal Stage - 3	Ygor Coelho	Christopher Vittoriani	2	1	50	Ygor Coelho	64	96429	\N
2023-04-26	G.C. Foster College of Physical Education and Spor - 1	Ygor Coelho	Juan Carlos Bencomo Otaño	2	0	19	Ygor Coelho	43	96429	\N
2023-04-27	G.C. Foster College of Physical Education and Spor - 3	Ygor Coelho	Armando Gaitan	2	0	32	Ygor Coelho	43	96429	\N
2023-06-01	Erwin Kranz Halle - 1	Yohan Barbieri	Aaron Sonnenschein	2	1	65	Yohan Barbieri	58	66489	\N
2023-02-01	Afrasiabi Hall - court 3	Yohanes Saut Marcellyno	Hemanth M.Gowda	2	0	35	Yohanes Saut Marcellyno	8	84764	\N
2023-04-07	Salle Everest - 3 - Carrefour	Yohann Osvald	Liano Panza	2	0	25	Yohann Osvald	36	72561	\N
2023-03-02	Badmintonhall DEGIRO hall - 4	Yohann Osvald	Sean Fanseda	2	0	25	Yohann Osvald	18	72561	\N
2023-04-07	Salle Everest - 5 - Koesio	Yohann Osvald	Eric Teller	2	1	45	Yohann Osvald	36	72561	\N
2023-03-01	Badmintonhall DEGIRO hall - 5	Yohann Osvald	Tieme Holstege	2	0	40	Yohann Osvald	18	72561	\N
2023-02-17	John Barrable Hall - 1	Youcef Sabri MEDEL	Mohamed Abdelaziz OUCHEFOUN	2	0	29	Youcef Sabri MEDEL	14	63846	\N
2023-02-18	John Barrable Hall - 4	Youcef Sabri MEDEL	Ahmed SALAH	2	0	30	Youcef Sabri MEDEL	14	63846	\N
2023-03-07	Terminal 21 Korat - Court1	Yu Igarashi	Alap Mishra	2	0	40	Yu Igarashi	19	64179	\N
2023-03-08	Terminal 21 Korat - Court3	Yu Igarashi	Yang Yang	2	0	38	Yu Igarashi	19	64179	\N
2023-03-15	Ruichang Sports Park Gym - Court 4	Yu Igarashi	Phone Pyae Naing	2	0	29	Yu Igarashi	23	64179	\N
2023-06-28	National Sport Complex - 3	Yu Sheng Po	Ao Fei Long	2	0	22	Yu Sheng Po	82	61868	\N
2023-03-08	Terminal 21 Korat - Court1	Yushi Tanaka	Alvi Wijaya Chairullah	2	0	31	Yushi Tanaka	19	86672	\N
2023-06-13	Gilbert C. Ada Gymnasium - 3	Yushi Tanaka	Kai Chen Teoh	2	0	27	Yushi Tanaka	71	86672	\N
2023-01-13	Kalevi Spordihall - 5 Radisson Blu	Yushi Tanaka	Cholan Kayan	2	0	38	Yushi Tanaka	2	86672	\N
2023-06-15	Gilbert C. Ada Gymnasium - 1 - Streaming	Yushi Tanaka	Nguyen Hai Dang	2	0	35	Yushi Tanaka	71	86672	\N
2023-01-14	Kalevi Spordihall - 1 Lenne	Yushi Tanaka	Justin Hoh	2	1	60	Yushi Tanaka	2	86672	\N
2023-01-14	Kalevi Spordihall - 1 Lenne	Yushi Tanaka	Mads Christophersen	2	0	35	Yushi Tanaka	2	86672	\N
2023-06-07	Gilbert C. Ada Gymnasium - 3	Yushi Tanaka	Daniel Macario	2	0	16	Yushi Tanaka	61	86672	\N
2023-06-06	Gilbert C. Ada Gymnasium - 2 - Streaming	Yushi Tanaka	Jack Yu	2	0	27	Yushi Tanaka	61	86672	\N
2023-03-09	Terminal 21 Korat - Court1	Yushi Tanaka	Meiraba Luwang Maisnam	2	1	46	Yushi Tanaka	19	86672	\N
2023-03-07	Terminal 21 Korat - Court4	Yushi Tanaka	Viren Nettasinghe	2	0	26	Yushi Tanaka	19	86672	\N
2023-01-13	Kalevi Spordihall - 1 Lenne	Yushi Tanaka	Felix Burestedt	2	0	32	Yushi Tanaka	2	86672	\N
2023-01-15	Kalevi Spordihall - 1 Lenne	Yushi Tanaka	Alex Lanier	2	1	57	Yushi Tanaka	2	86672	\N
2023-04-02	Main Location - 1	Yushi Tanaka	Alwi Farhan	2	1	64	Yushi Tanaka	32	86672	\N
2023-04-01	Main Location - 2	Yushi Tanaka	Koo Takahashi	2	0	44	Yushi Tanaka	32	86672	\N
2023-03-31	Main Location - 2	Yushi Tanaka	Ting Yen-Chen	2	0	33	Yushi Tanaka	32	86672	\N
2023-03-30	Main Location - 1	Yushi Tanaka	Lee Shun Yang	2	1	68	Yushi Tanaka	32	86672	\N
2023-03-30	Main Location - 2	Yushi Tanaka	Chen Chi Ting	2	0	42	Yushi Tanaka	32	86672	\N
2023-06-14	Gilbert C. Ada Gymnasium - 3	Yushi Tanaka	Cho Geonyeop	2	0	44	Yushi Tanaka	71	86672	\N
2023-06-01	Erwin Kranz Halle - 4	Zack Bobrowski	Mateusz Danielak	2	1	55	Zack Bobrowski	58	88338	\N
2023-06-20	Binjiang Gymnasium - 4	Zhang Jing Yi	Hoang Kha Tran	2	0	40	Zhang Jing Yi	75	56939	\N
2023-06-21	Binjiang Gymnasium - 3	Zhang Jing Yi	King Kien Hwa	2	1	68	Zhang Jing Yi	75	56939	\N
2023-06-20	Binjiang Gymnasium - 1	Zhang Wei Yi	Aaron Kai Bin Kok	2	0	39	Zhang Wei Yi	75	93602	\N
2023-06-23	Binjiang Gymnasium - 3	Zhang Wei Yi	Zhu Xuan Chen	2	1	84	Zhang Wei Yi	75	93602	\N
2023-06-21	Binjiang Gymnasium - 1	Zhang Wei Yi	Le Duc Phat	2	0	39	Zhang Wei Yi	75	93602	\N
2023-06-22	Binjiang Gymnasium - 3	Zhang Wei Yi	Li Yun Ze	2	1	81	Zhang Wei Yi	75	93602	\N
2023-03-14	Utilita Arena Birmingham - 2 12BET	Zhao Jun Peng	Loh Kean Yew	2	1	58	Zhao Jun Peng	25	95930	\N
2023-03-08	Main Location - Court 3	Zhao Jun Peng	Ade Resky Dwicahyo	2	0	39	Zhao Jun Peng	20	95930	\N
2023-01-17	K. D. Jadhav Indoor Hall - 3	Zhao Jun Peng	Weng Hong Yang	2	0	47	Zhao Jun Peng	3	95930	\N
2023-01-11	Axiata Arena - Court 4	Zhao Jun Peng	Lu Guang Zu	2	0	46	Zhao Jun Peng	1	95930	\N
2023-06-21	Binjiang Gymnasium - 2	Zhu Xuan Chen	Sie Zi Lok	2	0	43	Zhu Xuan Chen	75	97345	\N
2023-03-15	Ruichang Sports Park Gym - Court 1	Zhu Xuan Chen	Chirag Sen	2	0	27	Zhu Xuan Chen	23	97345	\N
2023-06-22	Binjiang Gymnasium - 4	Zhu Xuan Chen	Sun Fei Xiang	2	0	40	Zhu Xuan Chen	75	97345	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 3	Ziga Podgoršek	Alejandro Gallego	2	1	55	Ziga Podgoršek	68	70464	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Ziga Podgoršek	Nikolas Kokosis	2	1	50	Ziga Podgoršek	41	70464	\N
2023-06-09	Pabellón Municipal "Polideportivo Centro" - 4	Ziga Podgoršek	Pau Gomez	2	0	26	Ziga Podgoršek	68	70464	\N
2023-04-22	Evangelos Florakis Sports Hall - 2	Ziga Podgoršek	Oliver Oldorff	2	0	30	Ziga Podgoršek	41	70464	\N
2023-02-25	PalaBadminton - 2	Ziga Podgoršek	Oleksii Titov	2	1	40	Ziga Podgoršek	16	70464	\N
2023-02-25	PalaBadminton - 3	Ziga Podgoršek	Eric Teller	2	0	34	Ziga Podgoršek	16	70464	\N
2023-06-10	Pabellón Municipal "Polideportivo Centro" - 4	Ziga Podgoršek	Basilio Porto	2	1	77	Ziga Podgoršek	68	70464	\N
2023-04-21	Evangelos Florakis Sports Hall - 4	Ziga Podgoršek	Evelthon Hadjipantelis	2	0	19	Ziga Podgoršek	41	70464	\N
2023-02-24	PalaBadminton - 3	Ziga Podgoršek	Mikolaj Morawski	2	0	27	Ziga Podgoršek	16	70464	\N
2023-06-23	National Sports Complex - 1	Zong Ruei Lee	Odbayar Bishrelt-Erdene	2	0	16	Zong Ruei Lee	76	75584	\N
2023-06-29	National Sport Complex - 1	Zong Ruei Lee	Yap Chun Sin	2	0	33	Zong Ruei Lee	82	75584	\N
2023-05-12	Sportenum - 4	Zong Ruei Lee	Josua Hardmeier	2	0	26	Zong Ruei Lee	49	75584	\N
2023-06-28	National Sport Complex - 3	Zong Ruei Lee	Jack Yu	2	0	36	Zong Ruei Lee	82	75584	\N
2023-05-13	Sportenum - 3	Zong Ruei Lee	Mark Obermeier	2	0	26	Zong Ruei Lee	49	75584	\N
2023-05-13	Sportenum - 2	Zong Ruei Lee	Jakob Rinner	2	0	26	Zong Ruei Lee	49	75584	\N
2023-06-24	National Sports Complex - 1	Zong Ruei Lee	Tay Ron Hsien Justin	2	0	20	Zong Ruei Lee	76	75584	\N
2023-06-22	National Sports Complex - 2	Zong Ruei Lee	Khoh Ren Jen	2	0	16	Zong Ruei Lee	76	75584	\N
2023-05-13	Sportenum - 5	Zong Ruei Lee	Lee Yu-Jui	2	1	62	Zong Ruei Lee	49	75584	\N
2023-05-14	Sportenum - 1	Zong Ruei Lee	Dev Vishnu	2	0	26	Zong Ruei Lee	49	75584	\N
2023-03-01	Badmintonhall DEGIRO hall - 3	Zyver John De Leon	Arthur Vaugeois	2	1	47	Zyver John De Leon	18	78928	\N
2023-02-10	Badminton Center Pécs - 1	Zyver John De Leon	Iago Martinez	2	0	33	Zyver John De Leon	11	78928	\N
2023-03-02	Badmintonhall DEGIRO hall - 2	Zyver John De Leon	Matthew Li	2	0	33	Zyver John De Leon	18	78928	\N
2023-04-29	Palaresia - YONEX	Zyver John De Leon	Alejandro Valdés	1	0	23	Zyver John De Leon	44	78928	\N
2023-04-07	Salle Everest - 3 - Carrefour	Zyver John De Leon	Mateo Boix	2	0	28	Zyver John De Leon	36	78928	\N
2023-04-29	Palaresia - ASSIBROKER	Zyver John De Leon	Luuk Vingerhoed	2	0	18	Zyver John De Leon	44	78928	\N
2023-02-09	Badminton Center Pécs - 4	Zyver John De Leon	Pavel Maňásek	2	1	51	Zyver John De Leon	11	78928	\N
2023-03-08	Sportarena (Sportforum) Berlin - 3	Zyver John De Leon	Ho Yu Feng Julian	2	0	25	Zyver John De Leon	22	78928	\N
2023-02-24	PalaBadminton - 2	Zyver John De Leon	Lander Van Coillie	2	0	20	Zyver John De Leon	16	78928	\N
2023-04-06	Salle Everest - 1 - FZ FORZA	Zyver John De Leon	Lorenz Oberndorfer	2	0	28	Zyver John De Leon	36	78928	\N
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organization (organization_name, organization_id) FROM stdin;
Badminton World Federation	1
Badminton Europe	2
Badminton Confederation of Africa	3
BWF - Badminton Asia Confederation	4
BWF - Bulgarian Badminton Federation	5
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (member_id, player_name, date_of_birth, nationality, confederation_id, coach_id) FROM stdin;
91673	LEI Lan Xi	1998-01-25	5	2	\N
70824	Ravi RAVI	2002-11-14	8	2	\N
88096	Camilo BORST	2000-06-10	24	1	\N
68156	Ali HAYATI	2005-03-21	78	2	\N
99466	Riki TAKEI	2003-07-21	3	2	\N
96974	Bharat RAGHAV	2004-01-09	8	2	\N
25831	Viktor AXELSEN	1994-01-04	1	1	\N
95661	Anthony Sinisuka GINTING	1996-05-11	2	2	\N
62063	Kodai NARAOKA	2001-06-30	3	2	\N
64032	Kunlavut VITIDSARN	2001-05-11	4	2	\N
57945	SHI Yu Qi	1996-02-28	5	2	\N
76115	LOH Kean Yew	1997-06-26	6	2	\N
34810	CHOU Tien Chen	1990-01-08	7	2	\N
83950	PRANNOY H. S.	1992-07-17	8	2	\N
73442	Jonatan CHRISTIE	1997-09-15	2	2	\N
95476	LI Shi Feng	2000-01-09	5	2	\N
85394	Kenta NISHIMOTO	1994-08-30	3	2	\N
77427	LU Guang Zu	1996-10-19	5	2	\N
45171	NG Ka Long Angus	1994-06-24	9	2	\N
57823	Kanta TSUNEYAMA	1996-06-21	3	2	\N
91554	Anders ANTONSEN	1997-04-27	1	1	\N
81561	LEE Zii Jia	1998-03-29	10	2	\N
94780	LEE Cheuk Yiu	1996-08-28	9	2	\N
71408	Chico Aura DWI WARDOYO	1998-06-15	2	2	\N
68870	Lakshya SEN	2001-08-16	8	2	\N
93627	KIDAMBI Srikanth	1993-02-07	8	2	\N
81362	NG Tze Yong	2000-05-16	10	2	\N
62855	Rasmus GEMKE	1997-01-11	1	1	\N
95930	ZHAO Jun Peng	1996-02-02	5	2	\N
61628	Toma Junior POPOV	1998-09-29	11	1	\N
63122	Brian YANG	2001-11-25	12	3	\N
77042	WENG Hong Yang	1999-06-18	5	2	\N
86114	LIN Chun-Yi	1999-10-02	7	2	\N
72885	Christo POPOV	2002-03-08	11	1	\N
87375	WANG Tzu Wei	1995-02-27	7	2	\N
92508	Kantaphon WANGCHAROEN	1998-09-18	4	2	\N
69093	Priyanshu RAJAWAT	2002-02-01	8	2	\N
85095	Nhat NGUYEN	2000-06-16	13	1	\N
59322	Chia Hao LEE	1999-06-04	7	2	\N
52953	Misha ZILBERMAN	1989-01-25	14	1	\N
58963	Sitthikom THAMMASIN	1995-04-07	4	2	\N
97030	Magnus JOHANNESEN	2002-02-02	1	1	\N
94397	SU Li Yang	2001-12-27	7	2	\N
97174	Koki WATANABE	1999-01-29	3	2	\N
94580	Alex LANIER	2005-01-26	11	1	\N
76973	Mark CALJOUW	1995-01-25	15	1	\N
92796	CHEAM June Wei	1997-01-23	10	2	\N
65580	JEON Hyeok Jin	1995-06-13	16	2	\N
61423	Jan LOUDA	1999-04-25	17	1	\N
62720	Mithun MANJUNATH	1998-06-28	8	2	\N
53753	Hans-Kristian Solberg VITTINGHUS	1986-01-16	1	1	\N
77848	CHI Yu Jen	1997-06-25	7	2	\N
69006	Christian ADINATA	2001-06-16	2	2	\N
59543	Arnaud MERKLE	2000-04-24	11	1	\N
54897	Kevin CORDON	1986-11-28	18	3	\N
86672	Yushi TANAKA	1999-10-05	3	2	\N
92655	Kalle KOLJONEN	1994-02-26	19	1	\N
52864	LIEW Daren	1987-08-06	10	2	\N
68317	Kiran GEORGE	2000-02-11	8	2	\N
84838	LEONG Jun Hao	1999-07-13	10	2	\N
78756	Arturs KELPE	1999-08-04	120	1	\N
81887	Shesar Hiren RHUSTAVITO	1994-03-03	2	2	\N
71221	Luís Enrique PEÑALVER	1996-02-10	20	1	\N
74579	Uriel Francisco CANJURA ARTIGA	2000-09-12	21	3	\N
96429	Ygor COELHO	1996-11-24	22	3	\N
74076	Takuma OBAYASHI	1999-08-07	3	2	\N
89785	Kento MOMOTA	1994-09-01	3	2	\N
77003	Sameer VERMA	1994-10-22	8	2	\N
70399	Julien CARRAGGI	2000-07-02	23	1	\N
83938	Mads CHRISTOPHERSEN	1997-08-24	1	1	\N
59420	Victor SVENDSEN	1995-08-02	1	1	\N
68392	Justin HOH	2004-04-01	10	2	\N
20808	Kai SCHAEFER	1993-06-13	24	1	\N
86470	Jonathan MATIAS	2000-02-10	22	3	\N
62018	Riku HATANO	2001-06-19	3	2	\N
83985	Felix BURESTEDT	1995-02-26	25	1	\N
80062	Minoru KOGA	1996-09-30	3	2	\N
42776	SAI PRANEETH B.	1992-08-10	8	2	\N
78890	Ade Resky DWICAHYO	1998-05-13	26	1	\N
87117	SOONG Joo Ven	1995-05-19	10	2	\N
98595	HUANG Yu Kai	2002-10-07	7	2	\N
91651	Meiraba Luwang MAISNAM	2002-12-30	8	2	\N
64081	LIAO Jhuo-Fu	2002-07-26	7	2	\N
57924	CHAN Yin Chak	1999-01-07	9	2	\N
91814	S.Sankar Muthusamy SUBRAMANIAN	2004-01-13	8	2	\N
83597	Bernardo ATILANO	1996-06-19	27	1	\N
62286	Joran KWEEKEL	1998-05-16	15	1	\N
79164	Sathish Kumar KARUNAKARAN	2001-05-20	8	2	\N
69253	Giovanni TOTI	2000-12-28	28	1	\N
86230	Koo TAKAHASHI	2001-09-20	3	2	\N
82606	Jia Heng Jason TEH	2000-08-25	6	2	\N
95425	Bahaedeen Ahmad ALSHANNIK	1997-07-18	29	2	\N
58639	LIN Kuan-Ting	2001-12-15	7	2	\N
64648	NGUYEN Hai Dang	2000-09-24	30	2	\N
57762	SUN Fei Xiang	1998-05-15	5	2	\N
57297	Fabian ROTH	1995-11-29	24	1	\N
64794	Kartikey GULSHAN KUMAR	2000-02-20	8	2	\N
62615	LEE Shun Yang	2001-06-27	10	2	\N
82989	Dmitriy PANARIN	2000-01-08	31	2	\N
93791	Jason Anthony HO-SHUE	1998-08-29	12	3	\N
14587	Tommy SUGIARTO	1988-05-31	2	2	\N
58089	Alwi FARHAN	2005-05-12	2	2	\N
91853	ONG Ken Yon	2002-05-28	10	2	\N
79110	Sholeh AIDIL	2000-01-09	10	2	\N
46776	Howard SHU	1990-11-28	32	3	\N
58328	DANYLO BOSNIUK	2000-08-23	33	1	\N
14251	Pablo ABIAN	1985-06-12	20	1	\N
89506	Lucas CLAERBOUT	1992-10-22	11	1	\N
52968	Brice LEVERDEZ	1986-04-09	11	1	\N
56274	Luka WRABER	1990-09-07	34	1	\N
60427	Tobias KUENZI	1998-02-18	35	1	\N
58670	Harshit AGGARWAL	1996-08-09	8	2	\N
51998	Matthias KICKLITZ	2002-04-05	24	1	\N
94104	Christopher VITTORIANI	2003-03-25	28	1	\N
64839	Georges Julien PAUL	1996-01-07	36	4	\N
73966	Samuel HSIAO	1998-12-25	24	1	\N
64561	Nathan TANG	1990-08-26	37	5	\N
95952	YEOH Seng Zoe	1997-09-28	10	2	\N
79662	Anuoluwapo Juwon OPEYORI	1997-06-01	38	4	\N
64666	Viren NETTASINGHE	2003-06-17	39	2	\N
87691	Fabio CAPONIO	1999-03-26	28	1	\N
83657	Chirag SEN	1998-07-22	8	2	\N
76994	CHEN Chi Ting	1999-09-01	7	2	\N
91254	LU Chia Hung	1997-03-04	7	2	\N
75283	ONG Zhen Yi	2003-12-01	10	2	\N
86887	Collins Valentine FILIMON	1998-02-14	34	1	\N
79047	Iqbal Diaz SYAHPUTRA	2003-04-01	2	2	\N
75575	Jia Wei Joel KOH	2000-11-23	6	2	\N
59077	KUO Kuan Lin	2004-02-03	7	2	\N
69345	LE Duc Phat	1998-02-01	30	2	\N
68819	Milan DRATVA	1996-04-24	40	1	\N
85563	Joakim OLDORFF	2002-12-14	19	1	\N
84815	Max WEISSKIRCHEN	1996-10-18	24	1	\N
65788	Koshiro MORIGUCHI	2003-07-21	3	2	\N
87029	WANG Po-Wei	2002-02-12	7	2	\N
90657	Ikhsan Leonardo Imanuel RUMBAY	2000-01-16	2	2	\N
92816	LIU Liang	2003-03-26	5	2	\N
68718	HEO Kwang Hee	1995-08-11	16	2	\N
75763	Johnnie TORJUSSEN	1999-06-24	41	1	\N
93101	Job CASTILLO	1992-11-01	42	3	\N
79686	LEE Yun Gyu	1997-11-01	16	2	\N
89814	Siddhanth GUPTA	2003-03-30	8	2	\N
72466	Adham Hatem ELGAMAL	1998-02-04	43	4	\N
89309	YANG Yang	2001-03-24	7	2	\N
95439	Alap MISHRA	2000-05-28	8	2	\N
61819	B. R. Sankeerth	1997-12-22	12	3	\N
95489	Abhishek YELIGAR	1994-06-20	8	2	\N
90360	Victor ørding KAUFFMANN	2003-01-20	1	1	\N
65634	Jason GUNAWAN	2004-06-18	9	2	\N
85118	Enogat ROY	2003-05-05	11	1	\N
59702	Justin MA	1997-05-02	32	3	\N
80886	Bobby SETIABUDI	2001-03-22	2	2	\N
71797	Dimitar YANAKIEV	1998-11-05	44	1	\N
69537	LIU Wei Chi	1996-12-16	7	2	\N
67447	Markus BARTH	2000-06-16	45	1	\N
77792	Jacob SCHUELER	1998-02-17	37	5	\N
85845	Panitchaphon TEERARATSAKUL	2004-11-11	4	2	\N
96339	Valentin SINGER	1999-08-20	11	1	\N
88711	Enrico ASUNCION	1998-11-08	32	3	\N
92542	LIM Chong King	2000-05-06	10	2	\N
87610	Mark Shelley ALCALA	1999-06-19	32	3	\N
78590	CHUA Kim Sheng	2003-11-14	10	2	\N
98728	Armando GAITAN FAUSTO	2002-08-13	42	3	\N
89595	CHO Geonyeop	1996-04-01	16	2	\N
90111	Rohan MIDHA	1990-01-01	41	1	\N
78948	Davi SILVA	2003-06-15	22	3	\N
98462	HUANG Yu	2004-08-06	7	2	\N
58628	Abhinav MANOTA	1992-04-07	46	5	\N
60967	Subhankar DEY	1993-06-06	8	2	\N
69712	Alvi Wijaya CHAIRULLAH	2002-08-24	2	2	\N
72555	Karan Rajan RAJARAJAN	1996-10-30	1	1	\N
70442	Daniel NIKOLOV	1998-08-26	44	1	\N
68647	Krishna Adi NUGRAHA	1996-01-07	2	2	\N
67251	Elias BRACKE	1998-09-26	23	1	\N
77143	Xiaodong SHENG	1998-01-19	12	3	\N
78856	Muhammad Sultan Nurhabibullah MAYANG	2004-04-13	2	2	\N
82372	KOK Jing Hong	2002-03-12	10	2	\N
94151	Victor LAI	2004-12-19	12	3	\N
92114	Kiran Kumar MEKALA	1997-08-26	8	2	\N
62932	Raghu MARISWAMY	1998-02-14	8	2	\N
63846	Youcef Sabri MEDEL	1996-07-05	47	4	\N
56243	CHANG Shih-Chieh	1999-09-03	7	2	\N
58631	Joel KÖNIG	1995-07-06	35	1	\N
74987	Luis Armando MONTOYA NAVARRO	2000-12-08	42	3	\N
85956	Panji Ahmad MAULANA	1997-07-21	2	2	\N
78400	Keita MAKINO	1996-05-31	3	2	\N
92160	Tharun MANNEPALLI	2001-08-24	8	2	\N
64179	Yu IGARASHI	1995-05-15	3	2	\N
61453	Eveshgaran VASIGARAN	1999-12-20	10	2	\N
91665	LIN Yu Hsien	1991-09-27	7	2	\N
99895	Edward LAU	2001-02-22	46	5	\N
81655	Samuel O’Brien RICKETTS	1996-04-25	48	3	\N
69756	Shota OMOTO	1997-01-16	3	2	\N
53944	PARUPALLI Kashyap	1986-09-08	8	2	\N
94426	Gergo PYTEL	1999-03-11	49	1	\N
98896	Adel HAMEK	1992-10-25	47	4	\N
80369	Hemanth M.GOWDA	1995-11-30	8	2	\N
73886	Aryamann TANDON	1999-02-17	8	2	\N
55942	Adriano VIALE AGUIRRE	2004-09-01	50	3	\N
96545	Kim BRUUN	1993-08-21	1	1	\N
81106	Ansal YADAV	1997-07-23	8	2	\N
68316	TAN Jia Jie	2002-07-05	10	2	\N
54346	SON Wan Ho	1988-05-17	16	2	\N
74008	Julien SCHEIWILLER	1999-09-24	35	1	\N
75539	Arunesh HARI	2001-02-05	8	2	\N
81430	Tegar SULISTIO	2002-05-22	2	2	\N
83865	PHONE Pyae NAING	1998-03-29	51	2	\N
94119	Daniil DUBOVENKO	2005-10-20	14	1	\N
73177	Yeison Esleiter DEL CID ALVAREZ	2004-01-03	18	3	\N
87811	Jason Christ ALEXANDER	2004-08-28	2	2	\N
84764	Yohanes Saut MARCELLYNO	2003-05-02	2	2	\N
85790	YANG Chih Chieh	1980-01-01	7	2	\N
60676	Alfito Pringgo YUDANTO	2003-02-25	2	2	\N
67660	Andi Fadel MUHAMMAD	1999-05-16	2	2	\N
61916	Wolfgang GNEDT	1997-05-28	34	1	\N
70383	Shahyar SHAQEEM	2001-03-14	10	2	\N
97243	Muhammad Reza AL FAJRI	2005-06-23	2	2	\N
69875	Mads Juel MØLLER	2003-01-16	1	1	\N
79256	Imran WADIA	1996-10-24	12	3	\N
81906	Takuma KAWAMOTO	2001-04-13	3	2	\N
57460	Matthew ABELA	1999-03-18	52	1	\N
96461	Lino MUNOZ	1991-02-08	42	3	\N
80189	Adnan EBRAHIM	1998-07-03	53	2	\N
86866	Sacha LEVEQUE	2003-10-08	11	1	\N
62933	Varun KAPUR	2003-03-09	8	2	\N
75565	Korakrit LAOTRAKUL	1998-04-27	4	2	\N
79943	Ricky CHENG	2002-06-10	46	5	\N
73671	Brian KASIRYE	2001-09-03	54	4	\N
57322	Kian-Yu OEI	2003-02-03	24	1	\N
69037	Bodhi Ratana Teja GOTAMA	2005-09-22	2	2	\N
63069	Ryoma MURAMOTO	1999-10-26	3	2	\N
69521	Keith Mark EDISON	1999-05-31	37	5	\N
99294	Jeppe BRUUN	1997-02-26	1	1	\N
58521	Dominik KWINTA	2004-07-27	55	1	\N
75657	Grégoire DESCHAMP	2003-04-01	11	1	\N
83265	Ricky TANG	2004-04-06	37	5	\N
60145	Garret TAN	2008-01-11	32	3	\N
60771	CHIA Jeng Hon	2003-07-20	10	2	\N
97959	LIU Hai Chao	1998-03-22	5	2	\N
94332	Jack YU	2004-09-13	37	5	\N
86975	Rithvik Sanjeevi SATISH KUMAR	2003-05-15	8	2	\N
93848	Keisuke FUJIWARA	1998-10-17	3	2	\N
70219	Hussein Zayan SHAHEED ZAKI	1993-05-30	56	2	\N
70141	Adam DOLMAN	1992-11-08	37	5	\N
65081	Kanishq M	1999-12-22	8	2	\N
97018	Rasindu HENDAHEWA	2002-03-25	39	2	\N
69529	Kai Chen TEOH	2000-11-01	37	5	\N
93539	Jonathan DOLAN	1994-12-19	13	1	\N
94727	HOOI Shao Herng	2003-10-04	10	2	\N
85735	Robert SUMMERS	2002-05-13	57	4	\N
69960	Deivid SILVA	2003-06-15	22	3	\N
97943	Luis Ramon GARRIDO	1996-05-10	42	3	\N
66193	Heng Lin NGAN	1995-04-02	41	1	\N
25925	Sourabh VERMA	1992-12-30	8	2	\N
87857	Dumindu ABEYWICKRAMA	2003-03-05	39	2	\N
55024	Kalombo MULENGA	2001-12-29	58	4	\N
57758	Jewel Angelo ALBO	2003-12-20	59	2	\N
68262	Amaury LIEVRE	2003-02-07	11	1	\N
55838	Remi ROSSI	1995-12-23	60	5	\N
85472	Harsheel DANI	1996-08-12	8	2	\N
82952	Anirudh JANARDHANAN	2001-07-21	8	2	\N
86104	Pit Seng LOW	1995-05-09	37	5	\N
83155	Alvaro LEAL	2001-06-01	20	1	\N
64890	Jie Ying CHAN	2005-01-29	37	5	\N
57406	Brian HOLTSCHKE	2000-11-17	24	1	\N
92533	Santiago OTERO	2001-05-24	61	3	\N
63145	YAP Juin An	2003-07-12	10	2	\N
57543	Miha IVANIČ	1998-05-22	62	1	\N
63170	Harry HUANG	2001-08-25	41	1	\N
89163	WANG Zheng Xing	2002-02-21	5	2	\N
81643	Rahul Yadav CHITTABOINA	1998-05-03	8	2	\N
89424	SUN Chao	2003-08-19	5	2	\N
91004	Javier Armando ALAS	2003-03-24	21	3	\N
68934	Ernesto BASCHWITZ	2001-06-17	20	1	\N
68727	Larry PONG	1995-12-05	41	1	\N
81765	Karl KERT	2000-08-16	63	1	\N
81101	M ATEF Haikal Taufik	2002-02-15	10	2	\N
98305	Adrian King-Sun MAR	2004-09-30	32	3	\N
78169	WONG Yan Kit	2004-04-28	12	3	\N
14107	Tien Minh NGUYEN	1983-02-12	30	2	\N
91710	Jiří KRÁL	2000-12-19	17	1	\N
77614	Cheng-Han TSAI	2004-01-27	7	2	\N
84263	Aram MAHMOUD	1997-07-15	15	1	\N
74420	Pranav Rao GANDHAM	2004-01-14	8	2	\N
90130	Ditlev Jaeger HOLM	1997-06-30	1	1	\N
86616	Caden KAKORA	2003-07-10	57	4	\N
85281	Leo VAN GYSEL	2002-02-19	11	1	\N
75014	Eogene EWE	2005-02-18	10	2	\N
64933	LEE Dong Keun	1990-11-20	16	2	\N
83385	Jackson YANG	1999-04-23	12	3	\N
77846	Cholan KAYAN	2003-03-06	41	1	\N
75079	Yonathan RAMLIE	2001-01-31	2	2	\N
99595	Siddharth Pratap SINGH	1998-06-15	8	2	\N
79604	Dicky Dwi PANGESTU	2004-05-08	26	1	\N
93776	Abhyansh SINGH	2000-01-11	8	2	\N
60649	Aditya JOSHI	1996-08-07	8	2	\N
67753	Batdavaa MUNKHBAT	1995-09-10	64	2	\N
98838	Farogh Sanjay AMAN	2000-03-23	8	2	\N
64768	Tarun Reddy KATAM	2001-07-28	8	2	\N
88961	Leo LEE	2002-06-20	65	3	\N
93670	Carlos PIRIS	2001-02-09	20	1	\N
85224	Bruno CARVALHO	1994-10-01	27	1	\N
97345	ZHU Xuan Chen	2004-01-18	5	2	\N
86521	TING Yen-Chen	2004-05-06	7	2	\N
89268	Muhammad Halim AS SIDIQ	2004-04-09	2	2	\N
92003	Mateusz DANIELAK	1997-08-09	55	1	\N
57594	Kevin Arokia WALTER	1999-10-20	32	3	\N
81466	Dhruv KUMAR	1996-08-01	8	2	\N
99187	Mohamed Abderrahime BELARBI	1992-08-08	47	4	\N
93857	LIM Chi Wing	1995-04-11	10	2	\N
83212	Filip SPOLJAREC	1994-05-01	66	1	\N
93913	Tino DAOUDAL	2004-11-01	11	1	\N
59490	CHEN Shao-Hsuan	2005-11-11	7	2	\N
71877	Arya BHIVPATHAKI	1999-09-29	8	2	\N
89890	Naren Shankar IYER	2003-04-13	8	2	\N
76817	LU Wei Hsuan	2002-07-22	7	2	\N
62699	Robert WHITE	2004-07-27	57	4	\N
64512	Joonas KORHONEN	1994-08-23	19	1	\N
98248	Andraz KRAPEZ	1997-01-12	62	1	\N
76618	Henrikho KHO WIBOWO	1994-04-29	2	2	\N
82670	Kaushal DHARMAMER	1996-02-01	8	2	\N
93370	Balraj KAJLA	1998-12-03	8	2	\N
90978	Prince DAHAL	2004-02-08	67	2	\N
78891	Nicolas A. MUELLER	2000-12-28	35	1	\N
88298	Kevin BARKMAN	1994-12-01	12	3	\N
60710	Shashwat DALAL	2002-11-01	8	2	\N
69306	Albin Carl HJELM	1993-07-26	25	1	\N
88165	Anderson TAVERAS	2000-09-21	68	3	\N
66694	Emre LALE	1993-10-14	69	1	\N
95516	DONG Tian Yao	2003-10-21	5	2	\N
86723	Ming Hong LIM	2002-03-23	6	2	\N
80203	David KIM	1995-10-10	1	1	\N
72215	Athi SELLADURAI	1995-08-31	37	5	\N
95561	Mohamad Hafiz MOHAMED SIKKANDER	2002-06-09	10	2	\N
71954	Pranay KATTA	2003-09-26	8	2	\N
99672	KIM DongHun	1993-09-15	16	2	\N
99580	Woraphop CHUENKHA	2002-08-14	4	2	\N
91894	Aria DINATA	2003-07-12	66	1	\N
55949	Ahmed SALAH	2003-07-12	43	4	\N
82483	Saneeth DAYANAND SHIMOGA	2003-01-12	8	2	\N
50387	WU Cheng-En	2000-01-04	7	2	\N
14004	Niluka KARUNARATNE	1985-02-13	39	2	\N
68845	Buwaneka GOONETHILLEKA	1996-05-08	39	2	\N
78209	Kartik JINDAL	1998-11-07	8	2	\N
83243	Shreyansh JAISWAL	1995-05-10	8	2	\N
68139	Siril VERMA	1999-12-25	8	2	\N
91347	BHARGAV SOMASUNDARA	2001-06-08	8	2	\N
66522	Simon BARON-VEZILIER	2004-06-09	11	1	\N
55836	SHIH Kuan-Chih	2006-09-10	7	2	\N
86567	Miha IVANČIČ	1998-10-05	62	1	\N
66041	Finn ACHTHOVEN	2002-02-01	15	1	\N
58309	Oleksandar SHMUNDYAK	1998-06-25	33	1	\N
55280	WONG Wing Ki Vincent	1990-03-18	9	2	\N
88013	Ming Yap TOO	2002-12-17	10	2	\N
59695	Donnians OLIVEIRA	2000-11-21	22	3	\N
62395	Shogo OGAWA	2001-01-04	3	2	\N
51123	LAU Jun Hui Marcus	2005-01-28	6	2	\N
72674	Oscar GUO	2000-10-30	46	5	\N
58349	Marcus VISCOVICH	2002-06-18	1	1	\N
85385	Hikaru MINEGISHI	1999-08-18	3	2	\N
93602	ZHANG Wei Yi	2000-03-25	5	2	\N
68697	GAO Zheng Ze	1999-05-29	5	2	\N
88856	Iikka HEINO	1995-01-09	19	1	\N
69243	Martin OUAZZEN	2002-07-22	11	1	\N
64088	Thabani MATHE	1997-07-15	70	4	\N
86445	Bharath LATHEESH	2007-07-12	71	2	\N
57963	CHOI Pyeong Gang	2003-10-24	16	2	\N
81297	Rio AGUSTINO	2002-08-04	37	5	\N
64001	Samuel LEE	2003-04-17	10	2	\N
50864	LIM Shun Tian	2002-02-27	6	2	\N
95480	Lukasz CIMOSZ	2001-03-29	55	1	\N
59967	Lai Yin CHUNG	1997-11-14	12	3	\N
59614	Prahdiska Bagas SHUJIWO	2005-09-02	2	2	\N
59445	Jean Bernard BONGOUT	2001-02-18	36	4	\N
65546	Mikolaj SZYMANOWSKI	2003-11-27	55	1	\N
83581	Yanis GAUDIN	2002-12-26	11	1	\N
57490	Bradley EVANS	2000-12-20	48	3	\N
69770	Henry HUEBLA LEON	2005-12-06	72	3	\N
65648	Melvin APPIAH	1999-03-28	36	4	\N
63973	WU Kai An	2001-04-18	5	2	\N
72503	HSU Yu-Han	2002-04-04	7	2	\N
92000	Axel Henrik PARKHØI	2002-02-05	1	1	\N
59956	Thomas FOURCADE	2002-09-08	11	1	\N
90927	John LI	1997-10-02	12	3	\N
90593	Sheng LYU	1994-02-18	32	3	\N
98589	Ivan RUSEV	1993-05-06	44	1	\N
61988	Aditya GUPTA	2000-07-26	8	2	\N
87999	Nadeem DALVI	2004-09-01	41	1	\N
90269	Dennis KOPPEN	2000-06-23	15	1	\N
89587	Le Manh An TRAN	2004-09-14	30	2	\N
90396	Yonatan LINAREZ	2000-10-04	68	3	\N
71959	KUO Li-Chun	2003-09-17	7	2	\N
58913	JEONG Min Seon	1999-06-04	16	2	\N
87274	Nathan APPAVE	1998-11-21	12	3	\N
79759	ASSING Aaron	2004-04-11	73	4	\N
58402	Jose GUEVARA	1998-10-06	50	3	\N
59697	Julian Mao Lun LEE	2003-10-17	37	5	\N
98750	Sai Charan KOYA	2002-05-09	8	2	\N
61797	Firman Abdul KHOLIK	1997-08-11	2	2	\N
56428	Ken RICHARDSON	2003-11-19	37	5	\N
66626	Mwanza EDWARD	2004-02-10	58	4	\N
75260	Tukum LAA	2002-02-23	8	2	\N
79176	Ahmed NIBAL	2002-06-10	56	2	\N
67561	Micaiah Jien Zheng CHAI	1999-07-08	10	2	\N
82875	CHOO Kai Qing	1999-09-16	10	2	\N
75537	Kavin Thangam KAVIN	2003-09-10	8	2	\N
86109	Manuel MEJIA	1998-01-20	21	3	\N
76972	Jacob NILSSON	1994-01-01	25	1	\N
97290	Jerome PAUQUET	2004-01-05	74	1	\N
88283	Sharum DURAND CARDENAS	2005-09-24	50	3	\N
73768	Gabriel CURY	2003-03-24	22	3	\N
70050	Shun SAITO	2004-06-06	3	2	\N
98859	Abhishek SAINI	1999-10-29	8	2	\N
26459	Nicholas BONKOWSKY	1988-06-14	75	3	\N
58125	Peter YAN	2000-02-18	37	5	\N
88046	B.M.Rahul BHARADWAJ	2000-04-18	8	2	\N
60582	Ephraim STEPHEN SAM	2005-07-04	37	5	\N
57236	Chung-Hsiang YIH	2008-01-28	7	2	\N
87484	Somi ROMDHANI	1998-01-28	71	2	\N
58155	Ramiro ALONSO ESPINOZA	2005-03-14	18	3	\N
29449	Khosit PHETPRADAB	1994-07-08	4	2	\N
63140	Iliyan STOYNOV	2001-01-25	44	1	\N
90973	KAN Chao Yu	1994-04-20	12	3	\N
99172	PARK Sang Yong	2001-09-30	16	2	\N
88128	Aaron BAI	2005-06-11	32	3	\N
57334	Bodhit JOSHI	1998-02-13	8	2	\N
67825	LOW Eu Cong	2000-06-03	10	2	\N
80545	Jagadeesh KALAGA	2000-08-29	8	2	\N
82961	Niccolo TAGLE	1997-03-01	46	5	\N
63135	Raymond SING	1996-09-27	76	2	\N
61064	Kah Kit KAN	2000-12-05	77	2	\N
79629	Timothy KAFUNDA	1996-01-04	58	4	\N
68019	Johan AZELIUS	2000-12-07	25	1	\N
72513	Kelvin CHONG	2003-10-12	32	3	\N
72988	Mustaopha MUHAMMED	1996-12-02	38	4	\N
59921	Samuel CASSAR	2001-10-14	52	1	\N
81642	Salar BAYAT	1980-01-01	78	2	\N
98831	LIU Ze Qing	2001-08-13	5	2	\N
99703	Charles FOUYN	2005-06-01	23	1	\N
88595	Maksymilian DANIELAK	2004-10-29	55	1	\N
64119	Jan Jireh LEE	2005-05-22	10	2	\N
64223	Milain Lohith RANASINGHE	2001-01-05	37	5	\N
66489	Yohan BARBIERI	2004-09-17	11	1	\N
82239	Nicolas OLIVA	2002-10-11	61	3	\N
92024	SIE Zi Lok	2004-07-15	10	2	\N
65622	Aaron SONNENSCHEIN	2002-05-05	24	1	\N
93924	Shubh KRISHAN	1990-03-02	12	3	\N
80475	Felix Dureil NKONOMO BENGONO	1995-07-24	79	4	\N
80839	TAN Rui Yang Ryan	2004-07-28	6	2	\N
89690	Saran JAMSRI	2000-01-20	4	2	\N
63750	Maxim GRINBLAT	2001-03-03	14	1	\N
84817	Kreetik KREETIK	2000-12-30	10	2	\N
96616	Hooman BAGHERI	1990-04-10	12	3	\N
57887	Mikael Dwi PUTRA	1995-04-23	2	2	\N
61970	Linden WANG	2007-03-05	32	3	\N
86077	Callum SMITH	2002-03-09	80	1	\N
57588	Magnus KLINGGAARD	2001-05-22	1	1	\N
67848	Filip KARLBORG	2002-02-16	25	1	\N
67508	Talar LAA	1997-04-05	8	2	\N
73422	Shubham PATEL	2003-01-10	8	2	\N
64011	TANG Kai Feng	1996-11-02	5	2	\N
70121	Arjun REHANI	2001-08-02	8	2	\N
96085	Danila GATAULLIN	2002-06-04	45	1	\N
64730	Jacob ZHANG	2001-06-04	32	3	\N
99000	Bevan COX	2003-01-22	46	5	\N
87688	Orijit CHALIHA	2000-01-10	8	2	\N
75929	Joshua FENG	2001-09-07	46	5	\N
61880	Lakshay SHARMA	2005-09-21	8	2	\N
73490	ONG Tae Ern	2006-06-23	10	2	\N
59157	YAP Chun Sin	2006-07-12	10	2	\N
95954	NG In Qin	2005-02-18	10	2	\N
75550	William HU	2002-03-26	32	3	\N
64670	Ludvig PETRE OLSSON	2001-02-23	25	1	\N
80259	Abdelrahman ABDELHAKIM	1996-11-08	43	4	\N
93399	Shaun EKENGREN	1998-07-22	25	1	\N
95766	Noah HAASE	2005-02-11	15	1	\N
62917	Zaw Lin HTOO	2004-08-05	51	2	\N
96669	Aljallad AHMAD	1997-01-25	81	2	\N
67852	Angel Argenis MARINEZ ULLOA	1998-02-06	68	3	\N
72200	LI Yun Ze	2001-04-22	5	2	\N
89757	Paul TOURNEFIER	2004-02-08	11	1	\N
59955	Teerapat KLEAWAN	2000-03-03	4	2	\N
87934	Muhammad FEBRIANSYAH	2001-02-26	2	2	\N
78781	Alden Lefilson Putra MAINAKY	2002-06-14	2	2	\N
90878	Mohamad Haris Sufian RUSHDAN	2003-04-26	10	2	\N
73690	EZZAT Kareem	2002-10-10	43	4	\N
66224	Arthur WAKHEVITSCH	2005-05-18	11	1	\N
92174	HUNG Chun Chung	1994-12-17	7	2	\N
82757	Mathias SOLGAARD	2002-03-25	1	1	\N
72275	José Alejandro ORELLANA	2000-11-09	21	3	\N
83315	Mads THØGERSEN	1999-02-19	1	1	\N
85964	Viacheslav YAKOVLEV	2003-07-13	33	1	\N
95479	Luca ZHOU	2004-07-08	28	1	\N
75511	Anton MENZEL	2002-12-09	12	3	\N
94680	Kevin SHI	2002-10-06	12	3	\N
70504	Leonard MANUEL	2001-06-19	82	5	\N
64613	Adisak PRASERTPHETMANEE	2005-05-01	4	2	\N
92103	Phuc Thinh PHAN	2003-04-07	30	2	\N
75713	KING Kien Hwa	2004-11-20	10	2	\N
98737	Jacob HJORTH	2002-07-30	1	1	\N
60722	Tien Tuan NGUYEN	2002-02-25	30	2	\N
70753	TEH Jin Hong	2002-08-20	10	2	\N
83290	Martin BUNDGAARD	1997-08-22	1	1	\N
83999	Saket THAVANANI	1993-11-21	12	3	\N
66421	Teodor Ioan CIOROBOIU	2004-02-03	83	1	\N
85277	Alonso MEDEL	2001-12-19	84	3	\N
78625	Xing Huong GOH	1998-12-04	37	5	\N
57382	Aaron Kai Bin KOK	2003-11-17	10	2	\N
58873	Rafael GAVOIS	2002-07-06	11	1	\N
61720	Jonathan MOLINEROS OCHOA	2007-07-17	18	3	\N
70896	VELASCO Mark Anthony	2001-05-20	59	2	\N
58566	Faiz ROZAIN	1998-02-18	10	2	\N
60379	Samson GRADT-URBAN	1992-05-03	11	1	\N
82080	Ruan SNYMAN	1998-11-02	57	4	\N
92846	Muhammad FAIQ	2006-06-16	10	2	\N
56939	ZHANG Jing Yi	2001-06-04	5	2	\N
96955	TAN Zheng Tseng	2003-04-30	10	2	\N
75584	Zong Ruei LEE	2006-04-12	7	2	\N
24589	Chu Chen LIN	2008-08-30	7	2	\N
83039	Gagan BALYAN	2006-01-13	8	2	\N
73970	Gavin Kyjac ONG	2003-11-20	37	5	\N
74160	ZHAO Chen Xun	2003-06-03	7	2	\N
84648	Eason WONG	2000-08-31	12	3	\N
78102	Mohamed MOSTAFA KAMEL	2000-08-01	43	4	\N
85854	Don Henley AVERIA	2003-02-09	32	3	\N
58835	KHABILAN Siva	2003-04-07	10	2	\N
79835	Estuardo DEL VALLE LEISBETH	2002-10-03	18	3	\N
76398	Brent GUO	1994-04-17	37	5	\N
97497	Ajay Satish Kumar NAIR	1999-06-14	8	2	\N
54991	Guilhem HOYAUX	2001-08-24	11	1	\N
63054	MONTASER Mahmoud	2001-10-15	43	4	\N
82585	Ashel DZIVA	1995-05-02	70	4	\N
56936	Nawaf ALGHAMDI	2002-08-19	85	2	\N
93868	Danielius BERZANSKIS	2003-05-29	86	1	\N
76496	Romain FRANK	1998-11-26	11	1	\N
82093	AO Fei Long	2002-02-02	87	2	\N
71843	Josh NGUYEN	2005-09-09	12	3	\N
61780	PUI Chi Chon	2003-04-27	87	2	\N
90459	Ruben CASTELLANOS	1997-01-18	18	3	\N
60733	Willian GUIMARAES	2002-02-13	22	3	\N
64674	Waleson Vinicios Evangelista Dos SANTOS	1999-04-15	22	3	\N
96008	Khemtish Rai NUNDAH	2005-07-22	36	4	\N
99734	Michel Henri ASSEMBE	1998-12-06	79	4	\N
96016	PAR Tien Ann	2001-06-04	10	2	\N
77935	Dickon KHOO	2000-06-01	10	2	\N
81321	Anson CHEONG	2003-02-04	10	2	\N
88523	Toby PENTY	1992-08-12	41	1	\N
88529	Kennie KING	2002-06-07	88	3	\N
56463	Remus NG	2005-10-17	6	2	\N
72361	Eugene CHAN	1995-01-09	12	3	\N
78535	Daniel HILLIER	1996-04-10	46	5	\N
61868	YU Sheng Po	2001-01-03	7	2	\N
15788	Idrisse Issofo MOSSAGY	1984-11-14	89	4	\N
85882	CHAN FUNG TING Xavier	1993-09-06	73	4	\N
79984	Ephraim VAN DER LEY	2003-08-13	46	5	\N
66356	Darshan PUJARI	2004-08-31	8	2	\N
62551	Dylan CHAN	2001-01-13	46	5	\N
32769	Allan ZENG	2008-04-27	90	5	\N
41481	Brian LUBAO	2004-12-05	82	5	\N
23461	Daniel MACARIO	1992-06-08	82	5	\N
24963	Paulo QUIDATO	2006-07-04	82	5	\N
74534	CHEN Yu Cheng	2007-03-29	7	2	\N
72161	Sifeddine LARBAOUI	2002-06-30	47	4	\N
81874	Mohamed Abdelaziz OUCHEFOUN	2001-09-09	47	4	\N
81195	José Daniel OCHOA	2006-04-05	18	3	\N
74639	Trinity CHIPUMHO	1999-12-14	70	4	\N
59181	Loic BERTIL	1987-10-27	73	4	\N
76678	Roberto Carlos HERRERA VAZQUEZ	2002-10-13	91	3	\N
60449	Vishal VASUDEVAN	1997-04-03	8	2	\N
63076	ROHAN GURBANI	2002-09-07	8	2	\N
62012	Sid PALAKKAL	2002-09-16	41	1	\N
89982	Avinash SHASTRI	1998-02-28	46	5	\N
94966	Nicky Yemin AUNG	1992-07-20	12	3	\N
99461	Louis DUCROT	1998-09-21	11	1	\N
71084	Jorgen ROSENLUND	1988-08-23	45	1	\N
75326	Keiber Alberto PEÑALVER RIVAS	2001-04-25	92	3	\N
92049	Harsh ARORA	2002-03-10	8	2	\N
98798	Dragoslav PETROVIC	1996-06-23	93	1	\N
55573	Classius Chris BELANDRO	2002-04-16	2	2	\N
73815	may BAR NETZER	2000-04-05	14	1	\N
66802	An Chi CHEN	2005-10-08	7	2	\N
56930	Kaito SUGAWARA	2005-12-14	3	2	\N
93739	Neil BHABUTA	2003-01-17	41	1	\N
67237	Mohamed Ajfan RASHEED	1990-02-15	56	2	\N
75005	Siddharath THAKUR	1995-01-25	8	2	\N
56821	Welton MENEZES	2001-03-05	22	3	\N
66003	Kai NIEDERHUBER	2003-09-02	34	1	\N
56028	Shrey DHAND	2007-12-07	37	5	\N
70044	Rohith MARISWAMY	2000-07-25	8	2	\N
68290	Muhammad Naim AHMAD FAIRUZLY	1999-06-04	10	2	\N
75385	Gianpiero CAVALLOTTI	1997-09-09	94	3	\N
74079	Kar Lung CHUN	1975-12-08	41	1	\N
59918	Kennet SURIA	2001-10-03	21	3	\N
92119	Surya Kiran Reddy DUNDI	2002-04-09	8	2	\N
99105	Akash SINGH	2006-12-28	8	2	\N
79144	Ian LUBAO	2004-12-05	82	5	\N
68394	mahd SHAIKH	2005-10-23	85	2	\N
78729	Charlie CASTLE	2004-08-16	41	1	\N
80166	Van Mai NGUYEN	2006-08-12	30	2	\N
99908	Ethan ROSE	2003-01-01	41	1	\N
84561	Soen RIMMER	2000-09-05	35	1	\N
74084	Alvaro RIO	2001-01-29	42	3	\N
83883	Daigo TANIOKA	2006-01-12	3	2	\N
94649	Dominik KOPŘIVA	2004-09-23	17	1	\N
62643	Ragnar SEPP	1981-08-24	63	1	\N
77902	Jonas PETKUS	2001-07-23	86	1	\N
73930	Yash YOGI	1997-08-31	8	2	\N
84783	Kenneth Comfort MWAMBU	2000-03-23	54	4	\N
68050	Yehezkiel Fritz MAINAKY	1999-10-16	2	2	\N
95957	Denish GANESHA	1995-01-10	2	2	\N
91432	Jan JANOŠTÍK	2003-11-19	17	1	\N
98955	Abdul Swaburuh SSEMPIRI	2003-11-28	54	4	\N
64078	Dylan OOI	2004-03-01	10	2	\N
65384	Juan Carlos BENCOMO OTAÑO	2004-01-01	91	3	\N
68446	Armin SAROSI	2004-12-29	34	1	\N
56095	Ben HAMMOND	2005-05-23	41	1	\N
98624	Amos MUYANJA	2000-04-10	54	4	\N
64041	Sri KOLLA	2002-08-29	32	3	\N
80172	NUSA Momoh	1995-01-15	38	4	\N
64546	Yousif ALHUMAIRI	2003-09-10	95	2	\N
74452	Jakob HOUE	2004-02-14	1	1	\N
74264	Abhinav THAKUR	2004-07-10	8	2	\N
88338	Zack BOBROWSKI	2003-02-02	41	1	\N
85218	Brian Rodrigo ROQUE CAYCHO	2002-09-24	50	3	\N
98455	Bwalya CHANDA	2001-01-20	58	4	\N
56611	Santiago LOZOYA	2005-09-28	42	3	\N
59325	Jose RENDON CHIRINOS	2006-06-24	50	3	\N
60496	Richard KUHL	1997-04-08	25	1	\N
76977	Ramnish KUMAR	1997-11-15	12	3	\N
83742	Saketh UPADHYA	2000-02-25	32	3	\N
82517	Tanawat YIMJIT	2004-12-07	4	2	\N
88755	Blessing MAHWIRE	2003-11-18	70	4	\N
98443	Yaro VAN DELSEN	2003-06-25	23	1	\N
77349	YIM Seung Ki	1991-10-30	16	2	\N
66071	Aatish LUBAH	1995-11-03	36	4	\N
96242	Tony FANG	1993-02-06	46	5	\N
65183	Alisson VASCONCELLOS	1996-06-09	22	3	\N
88938	Andrew ROUSE	1998-05-06	46	5	\N
75861	Mujittapha UMAR	1998-09-10	38	4	\N
59257	Douglas SHEPHARD	1998-10-23	46	5	\N
77864	Muzafaru LUBEGA	2000-05-08	54	4	\N
59400	Rafael FARIA	2002-01-03	22	3	\N
91027	Yusuf YAŞAR	1999-05-25	69	1	\N
76865	Augustus OWINYI	1999-05-24	54	4	\N
64123	Joao Marcos MOREIRA	1998-08-21	22	3	\N
55886	Jack JIANG	2000-06-04	46	5	\N
73355	Philip AFOLABI	2002-06-06	38	4	\N
78598	Gerardo SAAVEDRA	2001-02-02	42	3	\N
83231	Manuel Estefano QUIJADA MORENO	2002-01-07	92	3	\N
67920	Rodrigo MORALES	2003-04-30	42	3	\N
67875	Miguel QUIRAMA	2002-07-09	96	3	\N
81214	Marcus KONG	2001-05-11	37	5	\N
92204	Klerton Zaidan De Carvalho SILVA	2006-01-17	22	3	\N
96653	Fernando Da Costa Vieira JUNIOR	2003-06-03	22	3	\N
76217	Kevin SHI	2002-09-06	32	3	\N
63171	Puritat ARREE	2003-01-28	4	2	\N
76441	Pedro MENDONÇA	2003-08-11	22	3	\N
60543	João Mendonça TAVEIRA	2005-06-22	22	3	\N
60321	Moh. Zaki UBAIDILLAH	2007-06-26	2	2	\N
86018	Philipp DOEHRN	1997-05-28	46	5	\N
66018	Sora OGAKI	2004-06-14	3	2	\N
85930	Michael JI	2006-06-23	12	3	\N
72260	Kevin WANG	2006-11-17	12	3	\N
77842	Timothy LOCK	2005-11-04	12	3	\N
98782	Kevin XU	1997-09-22	37	5	\N
85817	Tony CHEN	2004-07-24	46	5	\N
68322	Ayush SHETTY	2005-05-03	8	2	\N
45514	Andreau GALVEZ	1991-11-21	82	5	\N
13548	LIU Hao Da	2006-03-09	5	2	\N
61504	Wei-Cheng SU	2006-01-24	7	2	\N
34170	Fang Keat KOO	2007-09-15	10	2	\N
60721	Antoine Eddy OWONA NDIMAKO	1991-07-30	79	4	\N
94882	TAI Chuan Zhe	2000-07-12	10	2	\N
65893	Pascal NOLEM	2005-12-28	79	4	\N
6493	Raul ANGUIANO	1975-05-16	18	3	\N
61382	Diego TRUJILLO MARRERO	2007-03-06	18	3	\N
80159	Alejandro GARCIA GARCIA	2003-11-19	18	3	\N
83383	Saul ANDRADE YANQUE	2005-11-05	50	3	\N
80698	Diego GARCIA GARCIA	2007-04-16	18	3	\N
99014	Andy Rodrigo FERGUHARSON ALFARO	2002-02-26	18	3	\N
62731	Kalei KUAN-VENG KUONG	2005-07-04	50	3	\N
90321	Ze Xi SEAN NGU	2004-02-07	10	2	\N
61331	Alberto PERALS	2000-10-19	20	1	\N
72114	Astitva KALE	1998-11-10	8	2	\N
84679	Derek YU	1995-07-02	12	3	\N
75049	Christian Faust KJÆR	2004-08-25	1	1	\N
59910	Alejandro ÀVALOS	2005-01-22	65	3	\N
92698	KIM Joo Wan	1997-05-09	16	2	\N
64537	Johnathan AKIN-MULROONEY	1995-12-21	12	3	\N
61951	Philip MAK	2000-10-05	12	3	\N
66104	Jett KO	2002-09-12	12	3	\N
66862	Amit KSHATRIYA	1989-01-31	12	3	\N
57182	Kiren Milan DERAJ	2002-10-19	12	3	\N
92551	Thanh Dat BUI	2003-07-09	30	2	\N
83368	Andrzej NICZYPORUK	2003-08-14	55	1	\N
53929	Enrico BARONI	2001-05-20	28	1	\N
57319	Mohammed MUNAWAR	1994-11-20	71	2	\N
61494	Muath ALGHAMDI	2002-04-10	85	2	\N
98016	Muhammad Ammar Rusyaidi RAZIF	2002-01-22	10	2	\N
78015	James ROBERTSON	2000-01-02	80	1	\N
58119	Rasmus Careø CHRISTENSEN	1993-04-24	1	1	\N
98860	Pang Fong PUI	2000-03-13	87	2	\N
74364	Danylo SKRYNNIK	2002-02-05	33	1	\N
97160	Ayush Raj GUPTA	2003-07-30	8	2	\N
78108	Lance Gabriel VARGAS	2004-09-11	59	2	\N
90511	Ziad HESHAM	2007-08-28	43	4	\N
93205	Christopher Alexander MARTINEZ SALVADOR	2000-05-05	18	3	\N
95709	Raymond WEBSTER	1954-04-13	41	1	\N
95654	Rhitvik MOHANTY	2000-09-03	8	2	\N
97624	Patrick ZBINDEN	2001-03-23	35	1	\N
77830	Meng Jin Basile KOH	2003-05-08	6	2	\N
77559	Muhammad Affan AHMAD ATABEK	2002-03-08	10	2	\N
77163	Azmy QOWIMURAMADHONI	1999-01-01	26	1	\N
64454	Tonni ZHOU	1999-06-07	28	1	\N
83896	Ernick ZORRILLA	2003-01-18	68	3	\N
76838	Edward SURIA	2000-02-04	21	3	\N
78198	Soren OPTI	1997-05-16	97	3	\N
60744	Varot URAIWONG	2002-05-09	4	2	\N
79119	Harshal BHOYAR	1998-02-12	8	2	\N
58715	Adarsh PALANI KUMAR	2004-03-03	41	1	\N
77551	Artur NIYAZOV	1993-08-30	31	2	\N
63969	Iakovos ACHERIOTIS	2003-03-10	98	1	\N
58227	Jasmanjot VIRK	1999-06-02	46	5	\N
70381	SWARNARAJ BORA	1999-12-16	8	2	\N
81924	Thu Thao NGUYEN	1999-01-06	30	2	\N
59321	Patrick CHI	2006-04-04	32	3	\N
86964	Velayutham POOPATHI	2004-04-06	10	2	\N
80879	Thibaud COUGOUILLE	1992-06-03	73	4	\N
81329	Quoc Khanh TRAN	2006-07-22	30	2	\N
59241	Dinh Hoang NGUYEN	2003-03-04	30	2	\N
63811	Alan MARTIN	1999-08-26	37	5	\N
95021	Charan Naik KELAVATHU	2002-04-13	8	2	\N
28998	Chen Yang HU	2007-05-27	90	5	\N
36690	Daniell PABLO	2005-01-16	82	5	\N
98304	LEI Ci Fu	2006-09-02	7	2	\N
82700	Tejraj PULTOO	1999-10-19	36	4	\N
92068	Marvin CHISELA	1998-04-20	58	4	\N
89898	Alejandro CHUECA SANCHEZ	2003-04-29	50	3	\N
37111	Bengy LAIME	2005-11-10	50	3	\N
79521	Mykhailo VYSHNEVYI	2004-08-23	33	1	\N
80660	Ali Ahmed EL KHATEEB	1990-10-10	43	4	\N
79377	Christopher WEIBE	2001-11-05	12	3	\N
64859	Anthony WONG	2002-05-21	12	3	\N
95468	Shaurya GULLAIYA	2009-12-23	12	3	\N
86155	Abdul Karim HIDAYAT	1995-02-27	2	2	\N
63643	Paul James SIMANJUNTAK	2003-10-08	2	2	\N
89692	Abed BUKENYA	2006-08-15	54	4	\N
86526	Kemar VALENTINE	1991-11-24	48	3	\N
97153	Joel ANGUS	2000-05-31	48	3	\N
79081	Akili HAYNES	2001-06-18	99	3	\N
94963	Frank BARRIOS	1998-11-26	92	3	\N
71758	Zane REID	2003-12-20	48	3	\N
63063	Nathaniel FINZI	2006-01-03	48	3	\N
93177	Idan SCHNEIDMAN	2004-12-11	14	1	\N
93676	Thoif Ahmed MOHAMED	1996-02-26	56	2	\N
59356	Thuan KIM	1980-01-01	30	2	\N
91864	Trung Tin TRAN	2005-11-09	30	2	\N
93294	Hai Dang VU	2005-08-17	30	2	\N
95760	Viet Khang NGUYEN	2003-11-17	30	2	\N
66798	Dinh Manh TRAN	2003-05-23	30	2	\N
74118	Amir SHAPIRA	2004-01-01	14	1	\N
64141	Oswald FUNG	1998-03-22	41	1	\N
63148	Vaibhav B.S.	2003-09-17	8	2	\N
5083	Henry PAYNTER	1951-11-15	12	3	\N
81788	Andrei DON	2002-06-16	33	1	\N
93952	Hadrien HARAND	2004-12-09	11	1	\N
59796	Daniel ZHOU	2005-05-10	12	3	\N
86086	Mayan MOGILNER	2005-06-16	14	1	\N
55858	Senne HOUTHOOFD	2001-09-18	23	1	\N
91097	LIM Hong Zhe	2003-04-03	10	2	\N
76332	Eshwar SUKUMAR	2002-03-31	8	2	\N
83092	Sankalp CHANDRAGURALA	2000-03-20	8	2	\N
62927	Ibrahim Ali HAISHAM	2003-09-09	56	2	\N
57478	Jhonatan WU ZHENG	1995-05-08	92	3	\N
77460	Hoang Kha TRAN	2006-12-15	30	2	\N
53351	CHEN Cheng Yu	2004-10-26	7	2	\N
68473	Yi LIU	2005-06-14	7	2	\N
66079	MA Cheng-Yi	2005-05-24	7	2	\N
72923	Daniel LA TORRE REGAL	1997-08-20	50	3	\N
89815	Martin KANGWA	1997-02-08	58	4	\N
74310	Sebastian DE LA TORRE	1996-10-05	42	3	\N
57590	Mwansa RODRICK	1999-07-07	58	4	\N
68083	Ousmane OUEDRAOGO	2001-12-29	100	4	\N
86169	Fernando SANHUEZA	2000-10-07	84	3	\N
98776	Taolo KARENG	1996-04-04	101	4	\N
75185	Gilbert MWIYA	2002-07-29	58	4	\N
69107	Emmanuel Olusegun OGUNSANWO	1999-09-13	38	4	\N
55661	Trevor TAN	2002-09-02	32	3	\N
75158	Khalil Safana SHAMSUDDEEN	2003-09-28	38	4	\N
78096	Saddam Sidi RUFAI	2003-09-25	38	4	\N
68294	Carlos Miguel Codjo KPANOU	2003-04-14	102	4	\N
71659	Wesley KAFUNDA	2004-11-28	58	4	\N
67405	Jonas ØSTHASSEL	2001-10-02	45	1	\N
57863	Pedro MARTINEZ	2005-04-13	42	3	\N
69016	Prashant HARISH	2003-08-08	32	3	\N
81363	Victor LAI	1999-06-04	32	3	\N
81792	Fadh AROGOUN	2004-07-30	102	4	\N
81300	Anders JUNKER	1998-08-09	1	1	\N
66655	Orcun OZTURK	2003-01-06	69	1	\N
89186	Rotem SILUK	2007-09-01	14	1	\N
81962	Surya GANESH	2005-12-31	58	4	\N
85212	Yu Liang CHANG	2005-12-13	7	2	\N
94173	Li Chi CHEN	2007-02-17	7	2	\N
68279	Phillip AMWATA	1997-09-25	57	4	\N
93072	Yu Che LIU	2005-09-16	7	2	\N
78931	Mohammad FALAMARZI	2003-05-29	71	2	\N
85839	Sayfiddin MUKHTAROV	2007-05-12	103	2	\N
93302	Luis PONGRATZ	2006-11-24	24	1	\N
11311	Fabrizio VALDIVIESO NEGRI	2006-08-11	50	3	\N
72037	FabiáN Alejandro SAGASTUME BUSTAMANTE	2007-12-22	18	3	\N
70220	Rui SATO	2005-06-12	3	2	\N
88947	Nikhit LAXMAN	1999-03-25	8	2	\N
97265	Justin SEIBEL	2002-01-22	24	1	\N
57562	Cristian SAVIN	2000-07-11	104	1	\N
62864	Mehran SHAHBAZI	1996-09-20	78	2	\N
59658	Karono KARONO	2000-02-28	2	2	\N
70291	Muhammad Izzuddin SHAMSUL MUZLI	1998-01-22	10	2	\N
74462	Zhao Jie Stanley CHIONG	1999-09-07	10	2	\N
58689	Ying Xiang LIN	1999-11-25	37	5	\N
99109	Takeru KAI	2002-04-16	37	5	\N
79517	Gustav BJORKLER	2002-03-29	25	1	\N
69164	Thomas Zi Xuan NG	2003-02-01	37	5	\N
68039	Jayden LIM	2008-07-21	37	5	\N
93213	Nicholas CHIU	2004-03-19	32	3	\N
56178	Chris BENZIE	2005-01-08	46	5	\N
79090	Utchan RUAYSAP	2007-09-18	4	2	\N
86452	Hing Long WONG	2001-04-12	12	3	\N
64812	Jakob GODT	1998-01-30	1	1	\N
92650	Dario Alejandro TUL TEO	2002-02-13	18	3	\N
73141	Aakash RAVIKUMAR	2002-03-27	71	2	\N
76702	Christos HAILIS	2002-04-15	98	1	\N
71248	Mateus Carrijo CUTTI	1995-11-13	22	3	\N
96232	Ros Leonard PEDROSA	1996-07-06	59	2	\N
85309	Young Min KIM	1999-05-10	16	2	\N
72986	Koceila MAMMERI	1999-02-23	47	4	\N
61465	Marcelo Bosa OLIVEIRA	1979-02-28	22	3	\N
85582	Daniel Antonio ACOSTA HILARIO	2001-05-12	68	3	\N
87234	FéLix Michel KEMENE ATANGANA	2002-01-19	79	4	\N
58534	Gilles Francis DONGUITSOP	2003-09-01	79	4	\N
82265	Raul Eduardo ANGUIANO	2004-09-26	18	3	\N
72439	Marlon Adonay MANCIA VIDES	2006-04-15	21	3	\N
88596	Caio Henrique Da SILVA	2002-06-30	22	3	\N
69532	Paulo Teodoro Alves FEITOSA	2003-03-13	22	3	\N
75852	Frank Henrique De Sousa MAGALHAES	2004-10-12	22	3	\N
90776	Marcos Ryan Santos SOUSA	2003-10-09	22	3	\N
70129	Luan Rios SILVA	2005-04-10	22	3	\N
63556	Jonatas Da Silva CARVALHO	1999-08-27	22	3	\N
98726	Raphael LYDRA	2006-04-16	37	5	\N
86160	Muhammad Khadafi AMRI	2002-02-01	26	1	\N
68393	Hamadou Bappa ABDOURAMAN	2004-02-10	79	4	\N
82987	Bernard Heritier NDABA	1992-06-15	105	4	\N
95459	Yanni MORETTI	2003-08-26	22	3	\N
99168	Jun Zong Kayson GOH	2004-07-15	37	5	\N
89799	Jaden MINGOA	2006-11-24	46	5	\N
86450	Dion BINOD	2006-07-26	37	5	\N
77927	Melvin CALZADILLA	2007-03-07	21	3	\N
79023	Jadon TSANG	2003-10-10	12	3	\N
65554	Krzysztof JAKOWCZUK	1996-05-30	55	1	\N
65734	LIM Hong Xuan	2001-10-11	10	2	\N
99738	Siddhant SALAR	2001-05-09	8	2	\N
82054	Vashu FRASHWAL	1998-11-13	8	2	\N
65055	Manoj RAJKUMAR	2003-05-10	37	5	\N
74915	Danny ROBSON	2001-06-24	80	1	\N
94087	Mihir PALANDE	1998-01-02	20	1	\N
75440	Rishabh DESHPANDE	1999-10-24	8	2	\N
84666	Dhruv RAWAT	2001-12-25	8	2	\N
79116	Ryan RANKIN	1994-08-21	12	3	\N
61574	Archangelo OUANO	1997-02-25	12	3	\N
63791	Paul OUANO	2000-10-09	12	3	\N
73799	ZHU Tian Shun	2004-06-03	5	2	\N
65857	Chongo Ezra MULENGA	1998-08-19	58	4	\N
56114	Lucas DOUCE	2006-11-17	36	4	\N
72955	Jayant RANA	2003-09-05	8	2	\N
56566	Gal BIZJAK	2002-05-25	62	1	\N
68388	Abdullah ALDAWSARI	2005-02-21	85	2	\N
79757	Yazan SAIGH	2006-09-29	85	2	\N
77759	Vaishnav RUSSEEAN	2005-08-04	36	4	\N
71340	Emmanuel STEPHEN SAM	2007-06-24	37	5	\N
88691	Muhammad Alif AHMAD FAIRUZLY	2004-05-21	10	2	\N
83274	Gagan Jit Singh MAAN	2000-12-09	10	2	\N
82213	Ian MOROMISATO NAMISATO	2006-04-12	50	3	\N
60664	Makhsut TADZHIBULLAEV	2004-10-03	31	2	\N
99710	Gonzalo Sebastian CASTILLO SALAZAR	2006-03-23	50	3	\N
71501	Fabrizio TABINI PINASCO	2004-04-06	50	3	\N
93544	Victor HO	2004-07-09	12	3	\N
16451	Borko PETROVIC	1993-06-22	93	1	\N
83606	David SILVA	2003-09-12	27	1	\N
55335	Andrew ZHUANG	1989-09-26	12	3	\N
59705	LIM Yik Fong	1999-02-13	10	2	\N
93901	Muhammad Ikmal Aizat MOHD ISHAK	2001-01-20	10	2	\N
73890	Isaac CHAN	2005-04-15	46	5	\N
60553	Bhawesh PANDEY	2001-08-28	8	2	\N
80613	Manigandan RAJASEKARAN	1996-09-16	8	2	\N
84166	Adith KARTHIKEYAN PRIYA	2006-07-03	15	1	\N
95674	Arturo ANGEL SALAZAR	2002-06-06	42	3	\N
60832	Jonathan ESQUIVEL VARGAS	2002-03-16	42	3	\N
65499	Marco CASTILLO	2006-03-23	94	3	\N
88075	Michael TOMIC	2003-02-14	34	1	\N
57599	Andre IRPOLA	2004-03-06	25	1	\N
84412	Iljo VAN DELSEN	2003-06-25	23	1	\N
99140	Shamanth RAO KIDIYOOR	2000-04-26	8	2	\N
84106	Aidan Yu Kiat SIOW YIN YOUNG	2006-08-15	36	4	\N
70870	Hein HTUT	2006-03-03	51	2	\N
65678	Ivan MEDYNSKIY	2000-11-14	33	1	\N
88026	Arun Kumar ASHOK KUMAR	1991-01-12	41	1	\N
70720	Guna Kusal DHULUPUDI	2005-05-29	54	4	\N
89412	Mads Storm RANDRUP	2001-08-25	1	1	\N
91996	Marian LIPTAK	1998-12-06	40	1	\N
57177	Alexander PEDERSEN	2003-12-28	1	1	\N
75878	Harivignesh SHUNMUGAM PILLAI RAVICHANDRAN	1999-05-09	8	2	\N
57453	Shishir DWIVEDI	1999-07-09	8	2	\N
69468	Rajan YADAV	2001-07-25	8	2	\N
63563	Saahas Kumar P.	2004-07-21	8	2	\N
78310	Robin MESMAN	2002-04-07	15	1	\N
92514	Neo RAHLOLO	2002-12-14	106	4	\N
96790	Ethan Ao Jun CHAN	2003-12-22	12	3	\N
86564	LEE Yu-Jui	2008-03-05	7	2	\N
92875	Emil DANTLER	2004-09-06	34	1	\N
85813	Hanz HAIQAL	2004-07-14	10	2	\N
68954	David SMUTNÝ	2004-05-25	17	1	\N
58493	Kevin LEE	1998-11-10	12	3	\N
85366	Shae Michael MARTIN	1999-09-21	88	3	\N
99811	Matthew Shankar TEOH	2003-03-16	10	2	\N
56882	Darrell, Sen Xian CHEW	2004-06-12	10	2	\N
55750	LOK Hong Quan	2006-03-08	10	2	\N
67693	Maj POBOLJŠAJ	2001-02-16	62	1	\N
89325	Matthew GALEA	2000-12-01	52	1	\N
87411	Glen LEFOLL	1991-12-28	60	5	\N
98395	Jeremy LEMAITRE	1994-09-21	107	5	\N
91438	Kaihei TEIEFITU	2004-11-17	60	5	\N
58607	Taniela NGAUE	2005-08-26	108	5	\N
78807	Remy GOUBIN	1996-07-19	60	5	\N
69820	Mark ARONCHIK	2004-09-10	14	1	\N
99121	Damus MATAKINO	2003-07-08	109	5	\N
87209	Tebello SELEMELA	2002-02-05	106	4	\N
90754	David PIAKURA	1995-08-29	109	5	\N
67055	Praveen TAYALAN	1991-04-14	46	5	\N
42403	Paul KOPOLO	1987-12-27	70	4	\N
53845	Erdenebayar ENKHBOLD	1988-08-23	64	2	\N
76170	Farzin KHANJANI	1994-10-04	78	2	\N
86996	Kai Yi LIM	1990-01-17	46	5	\N
14201	Zulficar Issufo MUSSAGY	1980-05-10	89	4	\N
96755	Daxxon VONG	1997-09-13	46	5	\N
88148	Daniel S. Farid	1997-01-20	8	2	\N
72695	Jingtong CHEN	1988-09-26	37	5	\N
93554	Khuvituguldur BYAMBAJAV	1996-04-22	64	2	\N
80675	Gerelsukh JARGALSAIKHAN	1996-06-02	64	2	\N
91102	Olonbayar ENKHBAT	1986-05-22	64	2	\N
92430	Neville Baptist Nosius LUARAN	2000-08-05	10	2	\N
95506	Mohamad PAIRAVAND	1995-10-22	78	2	\N
91101	Nima ROSTAMPOURLAGALDANI	2003-01-26	78	2	\N
82767	Liam FONG	1999-12-23	110	5	\N
86116	Edmilson Paulo MUTONDO	1998-04-19	89	4	\N
11093	Lucio Raul Mize LAMPIAO	1978-05-19	89	4	\N
78666	Teiva POLITI	2001-11-05	60	5	\N
71225	Yifan ZHANG	1996-03-24	46	5	\N
88849	Matin MOGHIMI	2002-02-06	78	2	\N
65927	Jakim RENAUD	2001-03-25	111	4	\N
75559	Mohammad Ali FAGHIH KHORASANI	1994-07-28	78	2	\N
69588	Saleh SANGTARASH	2001-05-17	78	2	\N
88566	Mohammad ZARCHI	2004-05-30	78	2	\N
75586	Keng Hooi TAN	1981-12-06	37	5	\N
76250	Sasi Kumar RAJ KUMAR	1995-08-15	8	2	\N
94974	Hongyuan WONG	2002-08-13	37	5	\N
56646	Joseph LU	2002-03-27	12	3	\N
55023	Winson WONG	1995-11-15	46	5	\N
87742	Heiva YVONET	2004-06-06	60	5	\N
71446	Priyansh KHUSHWANI	2000-01-01	8	2	\N
63997	Gregory GRONDIN	2002-04-03	73	4	\N
69491	Chauncey YU	2007-09-18	37	5	\N
69088	RANAIVOLALA Eugelot	1988-05-23	112	4	\N
94624	Yesun- Erdene MUNKHBAATAR	2004-09-01	64	2	\N
55868	Shaun LI	2002-11-28	37	5	\N
50098	Wey Shawn NG	2007-05-12	37	5	\N
55701	Wilson LI	2004-02-10	37	5	\N
66713	Lincoln Isaac SHIM	2002-07-02	10	2	\N
96089	Evan RUSLI	2007-05-12	37	5	\N
50320	Harith JAYASURIYA	2001-02-26	37	5	\N
61004	Nils VERCRUYSSE	2006-03-27	37	5	\N
82924	Jack JI	2007-09-03	46	5	\N
64171	Mebel MANO KURIAN	2009-01-01	113	1	\N
87913	Benoit BORDELEAU	2002-02-21	12	3	\N
76591	Yufei ZHAI	2000-08-11	12	3	\N
56782	Rayce SU	2006-04-20	12	3	\N
71840	Oliver CHEN	2008-03-23	12	3	\N
68857	Muhammad ADAM	2004-06-12	10	2	\N
99300	Amirhossein HASANI	2004-03-30	78	2	\N
91172	Mohsen NAEIMI	2005-11-15	78	2	\N
66010	SIDDHARTHA MISHRA	2002-07-30	8	2	\N
97955	Aaron MALCOUZANE	2003-05-04	111	4	\N
74911	Ryan BONIFACE	2003-04-30	111	4	\N
98006	Siale MOLITIKA	2002-06-27	108	5	\N
94377	MARETAPU Maneatapu	1991-06-01	109	5	\N
90967	Alexander COUMBE	1999-03-18	46	5	\N
97759	Erick TRUJILLO ENRIQUEZ	2007-02-20	42	3	\N
58659	Eric DUONG	2002-02-26	32	3	\N
63995	Alexander RINGBÆK	2005-03-14	1	1	\N
97445	TAN Mun Dick	2001-04-22	10	2	\N
83357	TAN Kean Wei	2006-06-27	10	2	\N
72035	Aditya CHOUHAN	2001-06-29	8	2	\N
81034	Kuswanto KUSWANTO	1998-12-15	71	2	\N
89147	CHEN JIA JUN	2001-04-18	5	2	\N
29783	Soyombo ZOLJARGAL	2005-07-11	64	2	\N
93882	HUAN Kai Hern	2005-10-02	10	2	\N
64159	Abdurashid MUMINOV	2002-08-03	103	2	\N
95212	Andres QUADRI	1994-02-28	42	3	\N
74728	Jose ESPNOZA	1996-04-29	18	3	\N
79938	Emilio ZAMBRANO SOLANO	1996-06-04	72	3	\N
74260	Tumisang OLEKANTSE	1996-11-14	101	4	\N
62696	Tlamelang KEPALETSWE	1992-03-18	101	4	\N
65164	PEREKISI Tshepo	1996-11-11	101	4	\N
60946	Jafar Salihu UMAR	1997-04-02	38	4	\N
73346	Ami ABEKASIS	1974-09-17	14	1	\N
62126	Mark BANDA	1994-07-10	58	4	\N
88028	Senakpon Carlos BOSSOUVI	1989-12-28	102	4	\N
77688	Gbenoukpo Sebastiano DEGBE	1994-02-10	102	4	\N
59977	Hassani D PHIRI	1995-10-16	58	4	\N
84030	Andrew MUMBA	2001-05-12	58	4	\N
57668	Jorge RODRIGUEZ	2000-02-25	42	3	\N
71851	Tobiloba OYEWOLE	1996-03-15	102	4	\N
97019	Ofir BELENKI	1999-06-05	14	1	\N
68046	Stav PELEG	1991-01-04	14	1	\N
70621	Manuel DEL ROSARIO PARGAS	1995-11-01	91	3	\N
60535	Oswald Ash FANO-DOSH	2003-09-16	102	4	\N
97840	Carlos Charles AHOUANGASSI	2002-07-17	102	4	\N
83759	Gedeon MONTCHO	1998-09-01	102	4	\N
70040	Saul SOLIS	2000-12-19	42	3	\N
78249	Julio Cesar GONZALEZ VERA	2002-11-28	65	3	\N
81111	Fred SIMABAMBAYA	1999-05-30	58	4	\N
80469	Ryan Armand SWART	2001-08-01	57	4	\N
70277	Franco MOTTO	2003-08-25	61	3	\N
62053	Remo BLONDET MARTINEZ	2003-04-19	50	3	\N
73025	Preferet ADOMAHOU	2004-04-08	102	4	\N
85855	Jean-Marc Vianney AGOSSOUWI	2002-08-04	102	4	\N
60776	Yevgeniy YEVSEYEV	1997-08-21	31	2	\N
61686	Ilya LYSENKO	2002-11-15	31	2	\N
67490	Cedwyn MOSWEU	2000-07-05	101	4	\N
86971	Dean MATYANGA	1998-02-20	70	4	\N
65484	Poho KAUMBA	2006-05-26	58	4	\N
82092	Mike MASEKO	1985-12-28	58	4	\N
58018	Anthony MORENO HOBELIN	2003-01-14	91	3	\N
99538	Henri Joel KOMADADI	1999-07-18	102	4	\N
94388	Julien Wadoud TOTIN	2004-04-04	102	4	\N
90479	Jaures BADOU	2004-12-17	102	4	\N
79328	Peniel Degnon DE-DRAVO	2004-04-09	102	4	\N
95080	BAHAMONDEZ Benjamin	2004-06-23	84	3	\N
79058	Shawn GRINBLAT	2005-11-09	14	1	\N
89385	Andres GONZALEZ SAÑUDO	1999-08-11	42	3	\N
92065	Dor SHANI	2006-11-22	14	1	\N
50006	Sharon PERELSHTEIN	2006-09-24	14	1	\N
65760	David PUPKO	2005-09-15	14	1	\N
76440	Adam TRAVINSKIY	2007-09-01	14	1	\N
98660	Guy BLUMENREICH	2005-04-16	14	1	\N
89553	Alessandro ANGUIANO GONZALEZ	2008-09-17	18	3	\N
77773	Kenny CHISI	2004-06-12	58	4	\N
66343	Owei MBOLE	2004-01-01	58	4	\N
79671	Peter POHO	2005-02-25	58	4	\N
66747	Mishingo Meshack KEOKILWE	2001-04-29	101	4	\N
86022	Yu Hsiang LIN	2007-08-16	7	2	\N
97551	LU Cheng-Che	2006-04-02	7	2	\N
79290	Yu Yen CHENG	2005-12-06	7	2	\N
72982	Diosbel TAMAYO PALACIO	2014-02-14	91	3	\N
83477	Yosuan PITA SEGURA	2003-05-16	91	3	\N
90781	Leandro GIL DUEÑAS	2006-10-06	91	3	\N
71956	Reidan CERVANTES OSORIA	2005-05-04	91	3	\N
65418	Jorge Manuel BASULTO FERNANDEZ	1995-03-09	91	3	\N
86833	Roilan PEREZ FUENTES	2010-01-06	91	3	\N
94243	Jean Carlos GUERRERO GALLO	2005-04-02	91	3	\N
75665	Jose Leandro LABRADA SOLER	2007-05-25	91	3	\N
66842	Manav CHOUDHARY	2003-10-21	8	2	\N
86245	H. Leihong KONYAK	2000-08-04	8	2	\N
67702	Jangir IBRAEV	2003-06-14	31	2	\N
75527	Asadbek OLIMJANOV	2002-03-11	103	2	\N
58912	Harshit THAKUR	2002-04-02	8	2	\N
87695	Bruno MORA	2006-01-30	84	3	\N
53129	OLMOS Martin	2008-01-18	84	3	\N
42640	Sebastian VASQUEZ	2007-07-17	84	3	\N
56027	Maurice MARTIN REVILLA	2007-02-09	50	3	\N
50025	Guillermo BUENDIA MALDONADO	2008-05-08	50	3	\N
98680	Kjell WAGENER	2005-09-01	24	1	\N
94252	Kenta MATSUKAWA	2006-06-19	3	2	\N
97220	Santiago Uziel LOPEZ MARTINEZ	2008-01-03	42	3	\N
61630	William Javier Esteban MARROQUIN MAYEN	2008-05-31	18	3	\N
56112	Min Htet KAUNG	2001-09-20	51	2	\N
86501	Arintap DAS GUPTA	1999-08-02	8	2	\N
88756	Mads Emil MONKE	2005-08-18	1	1	\N
89132	Niklas KRAMER	2005-09-21	35	1	\N
73231	Ben Muir	1990-01-01	41	1	\N
74259	Aleksi MÄKI	2004-08-03	19	1	\N
71492	Balazs PAPAI	2000-01-27	49	1	\N
66821	Michael SU	2005-10-21	37	5	\N
83323	Szymon STOKFISZ	2001-09-13	55	1	\N
93479	Gopal Krishna Reddy DUNDI	1997-02-07	8	2	\N
91154	Saharsh MOHAN	2002-12-11	8	2	\N
79362	Sidhant CHOPRA	1999-05-26	8	2	\N
81656	Rajesh SRIKAR	2001-04-29	8	2	\N
87463	Sohit HOODA	1999-03-10	8	2	\N
59795	Jaiditya Pratap SINGH	2002-06-27	8	2	\N
99427	Harsh Anand DESHWAL	2005-07-18	8	2	\N
59340	Jasper KOPPEN	1997-12-11	15	1	\N
66402	Jamie PEARCY	1999-04-10	41	1	\N
57421	Gregor ALIČ	2001-10-27	62	1	\N
75948	Shaun ALLY AAMIR	2004-07-06	80	1	\N
68565	Pedro PORTELAS	2003-01-31	27	1	\N
63959	Gabriel RODRIGUES	2002-04-15	27	1	\N
95028	Alessandro GOZZINI	2004-03-09	28	1	\N
74744	Eliel MELLERI	2003-12-31	19	1	\N
78221	Jonas JÆGER	2000-04-14	1	1	\N
97974	Venkata Uneeth Krishna BHIMAVARAPU	2004-05-30	8	2	\N
90031	Saruul SHAFIQ	1989-12-06	24	1	\N
79387	Sebastian Lassen NIELSEN	2005-11-28	1	1	\N
57484	Yusuf ALMUTAWA	2006-05-03	53	2	\N
98198	Connor LOUIE	1998-09-05	12	3	\N
69996	Diogo GLORIA	2002-04-19	27	1	\N
79941	Aleksander DZWONNIK	2001-12-03	55	1	\N
69615	Adam MCALLISTER	2000-07-01	13	1	\N
56250	Michael PANG	2005-06-26	41	1	\N
92033	Rishwan SHIYAM	1996-04-09	56	2	\N
71809	Ajay MEENA	1997-06-26	8	2	\N
70317	Vaibhav JADHAV	1997-11-02	8	2	\N
77957	Mukul ARORA	1997-10-26	8	2	\N
55956	Mokshit PORWAL	2002-10-05	8	2	\N
68414	Siddhartha DAS	2005-03-07	8	2	\N
93877	Vishesh SHARMA	2003-05-11	8	2	\N
72684	Ka Wai NG	1989-04-05	41	1	\N
99954	GU Jun Feng	1999-10-22	5	2	\N
72430	REN Cheng Ming	2002-04-23	5	2	\N
76059	LI Xiang	2001-07-23	5	2	\N
62698	Aaron ZHAO	1999-10-26	12	3	\N
87478	Michal WALENTEK	1992-04-22	55	1	\N
84469	Pavel MAŇÁSEK	2005-07-07	17	1	\N
69797	Balint PAPAI	2002-07-31	49	1	\N
71295	Archie BULT	2003-04-11	113	1	\N
81091	José Luis NSOGO NGUEMA	2005-09-30	114	4	\N
95418	Benjamin Igor OLO ANGONO	2003-03-28	114	4	\N
85825	Sebastian KADLEC	2004-09-23	40	1	\N
75729	Oleksii TITOV	2005-10-14	33	1	\N
98845	Rune VAN DALM	2005-07-02	15	1	\N
98180	Nikhil JANGID	1992-12-08	8	2	\N
69814	Rajesh VERMA	1994-01-01	8	2	\N
76331	Akul CHAUHAN	1998-11-23	8	2	\N
74254	Gandhar NAWALE	2002-08-31	8	2	\N
99670	Sebastian MIKKELSEN	2005-12-20	1	1	\N
65262	Thomas SIBBALD	1998-04-28	15	1	\N
92511	Lars KROS	2001-02-23	15	1	\N
63178	Rakesh SHARMA	1988-03-28	15	1	\N
82907	LEE Hong Je	1993-04-17	16	2	\N
56212	Duy Nam LE	1997-02-21	30	2	\N
77921	Oba-Ob RABBIE JAYSON	1993-03-01	59	2	\N
64900	LEE Sang Ho	1994-11-14	16	2	\N
59407	Mattias XU	1998-06-13	45	1	\N
87832	SON Seong Hyun	1998-01-21	16	2	\N
65590	Omar EMAD	1994-12-11	43	4	\N
88428	Mohamed TOSON	2000-07-28	43	4	\N
87790	Pierre Frederic BITEP	1999-07-19	79	4	\N
57538	Chang Ho KIM	2001-04-28	110	5	\N
66088	Vincent NGUYEN	1997-09-07	37	5	\N
98066	Andrew Peter NEWMAN	2002-08-12	4	2	\N
55748	Ashwin GOPALAN NAIR	1991-04-08	37	5	\N
67396	Andrew TAN	2005-11-12	32	3	\N
76669	Rylan TAN	2009-01-10	32	3	\N
67417	Jordan YANG	2005-09-21	37	5	\N
99157	William SAYAPHET	1998-05-15	37	5	\N
92591	Paul Christ ASSEMBE VOUNDI	2005-01-26	79	4	\N
56306	Sarun RUKCHAROEN	2005-07-21	4	2	\N
84140	Mohamed HEGAZY	2006-02-22	43	4	\N
87282	Umang KAUSHIK	1998-03-18	8	2	\N
62726	Amal SANJAI MAYADEVI	1999-06-29	8	2	\N
87436	PARK Joon Hyeok	1998-12-14	16	2	\N
70775	Hein Kaung SAN	2001-02-25	51	2	\N
66075	Thanh Long VU	2005-03-02	30	2	\N
62538	Phitikamon PHANKAEW	2004-01-18	4	2	\N
94220	Vishal PEREIRA	1995-05-01	53	2	\N
89846	Jan WILCZAK	2005-06-11	55	1	\N
67891	Jaka IVANČIČ	2001-11-19	62	1	\N
60581	Anosch ALI	2003-04-15	24	1	\N
65879	Joseph WAUGH	2001-08-25	41	1	\N
85344	Kevin HARGIONO	2002-04-02	74	1	\N
66578	Sanjeevi PADMANABHAN VASUDEVAN	2004-03-26	24	1	\N
90020	Sen THOMAS	2001-09-01	80	1	\N
93019	Hendrik STAGGE	2003-12-17	24	1	\N
87085	Hugo JARDIM	1987-05-19	41	1	\N
88119	Safin EMRAN	2002-04-12	19	1	\N
92236	Mats DUWEL	2006-04-06	15	1	\N
94576	Ratchaphol SRITHONG	2006-02-23	4	2	\N
24470	Soroush ESKANDARI VATANNEJAD	1989-06-06	78	2	\N
93747	David WALSH	1994-05-23	13	1	\N
61017	Mehdi ANSARI	2000-01-03	78	2	\N
55665	Yajnesh Anand CHANGEA	2004-11-14	36	4	\N
58280	Syed Saker Mohammad SIBGAT ULLAH	2004-02-16	115	2	\N
65936	Xavier LAPERRIERE	1998-06-05	12	3	\N
87426	Aris KATTIRTZI	2003-09-12	98	1	\N
81433	Panukorn NIMITPORNCHAI	2001-08-02	4	2	\N
58314	Ansh VISHAL GUPTA	2005-07-28	8	2	\N
82926	Md Nazmul Islam JOY	2006-05-03	115	2	\N
95968	Hugo CONSTANS	2005-06-09	73	4	\N
80048	RANDRIANANTENAINA Sitraka Jean Baptiste	1998-09-01	112	4	\N
73284	Tejas SAVOO	2007-09-17	36	4	\N
60929	Kah Wei TAN	2000-08-19	37	5	\N
73493	Dillon CHONG	2006-04-17	41	1	\N
83774	Jerry YIN	2007-08-23	12	3	\N
62351	Arpitraj Rajesh Kumar SINHA	2003-04-27	12	3	\N
76501	Sahil SAHIL	1993-09-26	12	3	\N
97379	Arnav LOKHANDE	2005-05-14	12	3	\N
83003	Anton ANGELES	2002-09-17	12	3	\N
82018	Nicholas LAI-CHEONG	1989-08-15	12	3	\N
91514	Felix Dong SUN	1989-08-20	12	3	\N
77013	HO Yu Feng Julian	2005-01-15	6	2	\N
83339	TING Wen Xuan	2004-01-27	10	2	\N
57741	Mohammad BAGHERI	2004-10-14	78	2	\N
80842	Alireza FAKHER	2006-02-13	78	2	\N
77430	Leo HÖLZMER	2002-01-03	74	1	\N
69295	Gabriel Ingi HELGASON	2004-09-30	116	1	\N
97702	Christian TOMIC	2004-01-14	34	1	\N
82071	Ivor ZEKAN	2004-10-11	66	1	\N
92943	Daniel DVOŘÁK	2005-04-01	17	1	\N
78160	Lois LE CORRE	2001-01-01	11	1	\N
79383	Jose Manuel JAIME MAGAÑA	2006-04-29	42	3	\N
61428	Oleg AMOSOV	2001-12-13	33	1	\N
68404	Matteo JUSTEL	2005-10-25	11	1	\N
56679	Isaac ELLUL	2005-11-28	52	1	\N
80961	Adam KONCZOL	2004-01-06	49	1	\N
85017	Lorrain JOLIAT	2004-09-01	35	1	\N
84499	Marius REBOUL L'ALEXANDRE	2003-02-13	11	1	\N
99306	Siddharth JAKHAR	1992-12-01	8	2	\N
86465	NIKHIL SHYAM SRIRAM	1999-10-19	8	2	\N
58274	THEJAS SHIVAKUMAR	1998-06-26	8	2	\N
84220	Irvin Arokia WALTER	2003-06-04	8	2	\N
78694	Murali Krishna KANNURI	1990-11-11	8	2	\N
85595	Simone PICCININ	2006-08-01	28	1	\N
59449	Marton SZERECZ	1997-02-27	49	1	\N
70348	Nicolai CONDRATIUC	1999-06-22	104	1	\N
94558	Thomas BARTH	2004-01-12	45	1	\N
69558	Biloliddin KUCHKARBOEV	2001-07-10	103	2	\N
63047	Adams NTUNGAMILI	1990-10-17	101	4	\N
93127	Artyom SAVATYUGIN	1994-07-09	103	2	\N
84342	Khaitmurat KULMATOV	1996-02-19	31	2	\N
88633	Amrullo BAKHSHULLAEV	1996-07-22	103	2	\N
96731	Georgios Orfeas TSAMOUSIADIS	2002-02-09	117	1	\N
71117	Temur TURAKHONOV	1999-05-21	103	2	\N
85876	Abdurasul KHADJAEV	1999-05-18	103	2	\N
91089	Batanani Bongani OBOLETSE	1998-11-05	101	4	\N
75012	Adeogun Gbolahan AJOSE	2000-03-22	38	4	\N
89693	Nikita VASILIYEV	2004-08-22	31	2	\N
60081	Andrey SHALAGIN	2002-06-26	31	2	\N
79129	Kao Gee-Q Gobe MOKGATLE	2000-09-18	101	4	\N
94800	Amord SEPELA	1996-12-14	101	4	\N
78234	Romeo HAMBADA	2003-05-05	102	4	\N
89648	Erlan YESHIMKHANOV	2000-10-16	31	2	\N
68899	Theo LANIER	2001-04-16	11	1	\N
67800	Daniel FRANCO	2005-04-06	20	1	\N
85835	Miguel ESTEVE	2002-05-16	20	1	\N
94436	Emil SÖDERDAHL	2003-12-17	25	1	\N
76094	Kevin CHEN	2004-10-13	65	3	\N
78759	Leonardo RAMIREZ LOPEZ	2004-12-30	42	3	\N
56061	Alberto RODRIGUEZ	2003-04-29	42	3	\N
57413	Mustapha QUAM ADEDEJI	2005-12-19	38	4	\N
84625	Joseph ABEL	2003-01-05	38	4	\N
84657	Ali KABORÉ	1998-10-25	100	4	\N
78074	Daniel Christopher EGBONYI	2001-03-26	38	4	\N
81688	Loan PEILLET	2004-06-27	11	1	\N
80423	Shon LEITMAN	2007-11-12	14	1	\N
96594	Jayesh Milind KHAMKAR	1994-08-04	70	4	\N
86135	Ephraim MWALE	1991-04-14	58	4	\N
64963	Laone MOGOPA	2002-06-27	101	4	\N
98158	Batsho KGAKISHI	2002-03-13	101	4	\N
93683	Mohmed Sufiyan MALIK	2000-11-27	57	4	\N
98092	Keishin RIMMER	2006-03-23	35	1	\N
60750	Abdul Voris MUMINOV	2002-07-11	103	2	\N
63210	Gnana Harsha JETTY	2004-01-03	8	2	\N
66077	Ratmir GILMANOV	2005-02-28	31	2	\N
61315	TEO Wei Jun	2001-11-09	10	2	\N
55775	Gafforbek JABBOROV	2003-07-17	103	2	\N
73261	IBRAY Bayken	2006-07-21	31	2	\N
91854	Andrey NEDBAYLO	2004-07-22	31	2	\N
81885	Muhammad Ariffuddin RADIN	2004-06-17	10	2	\N
20045	Fabrizio GUTIERREZ QUICAÑO	2007-06-26	50	3	\N
20248	Alejandro CRISANTO TORIBIO	2007-08-04	50	3	\N
34287	Danilo Sebastián LOPEZ HERRERA	2009-10-10	18	3	\N
99885	Raphael CHENU	2003-06-17	11	1	\N
66853	Ignas REZNIKAS	1995-09-29	86	1	\N
91051	Yegor ROMANIUK	2007-08-04	33	1	\N
78928	Zyver John DE LEON	2007-05-08	28	1	\N
58194	Viktor PETROVIC	2005-03-10	93	1	\N
59964	Dominik TRIPET	1996-02-21	35	1	\N
61743	Alvaro VAZQUEZ	1999-03-11	20	1	\N
68730	Bartosz KRAJEWSKI	2004-05-27	55	1	\N
96561	Baptiste ROLIN	2005-02-17	23	1	\N
73747	Tadeáš BRÁZDA	2002-09-17	17	1	\N
94916	Oliver Lee NOWAK	1998-06-12	1	1	\N
56087	Niilo NYQVIST	2004-01-10	19	1	\N
95973	Man Yin LEUNG	1995-05-15	113	1	\N
51531	Raul MUST	1987-11-09	63	1	\N
64631	Duarte Nuno ANJO	1996-04-05	27	1	\N
89189	Ayham ABD ELEDDIN	1998-05-23	29	2	\N
83718	Carl Christian MØLLER	1995-08-28	45	1	\N
99864	Mutombo TSHIZANGA	1996-06-26	118	4	\N
97466	John RIAD	2000-01-31	43	4	\N
65970	Basel HESHAM MOHAMED IBRAHIM	2003-02-07	43	4	\N
82021	Omar Ezzat ABELRAHIM MOHAMED	2002-03-03	43	4	\N
84017	Quoc Huy NGUYEN	2001-02-21	30	2	\N
86637	Worapat SURAKKHAKA	1999-10-11	4	2	\N
94005	Izzeldeen ABUARRAH	2003-05-12	29	2	\N
79916	Louidou De Lellis GBATE-MALO	1986-08-05	105	4	\N
76466	Dawid PERKOWSKI	2004-08-17	55	1	\N
90936	Qusai ALTHAWAHREH	2005-09-20	29	2	\N
56686	Saif ABU EID	2005-09-03	29	2	\N
80965	Nurullah SARAÇ	2003-02-06	69	1	\N
57386	Jesus NGUA ESAWONG BELICA	2006-07-21	114	4	\N
81530	Vincent-Parfait INHOUL-OUAHALLY	1990-01-04	105	4	\N
92940	Saint Cyr NGANABEAME	1997-12-01	105	4	\N
61627	Mateusz GOLAS	2006-07-22	55	1	\N
62262	Sabreeshwaran HARIBASKARAN	2003-09-11	8	2	\N
77644	Nhat Hoang DINH	2004-11-25	30	2	\N
64792	Phillip HALIM	2007-04-21	37	5	\N
92436	Jason HONG	1998-01-09	37	5	\N
75066	Raphael Chris DELOY	2007-08-26	46	5	\N
81395	Omar SHATER	2007-09-27	43	4	\N
89088	Moaz HESHAM HASSAN	2005-08-10	43	4	\N
68893	Youssif MOHAMED	2004-04-19	43	4	\N
91573	Seif OMAR	2007-11-01	43	4	\N
69303	Kiran BALAJI	1999-05-17	8	2	\N
61018	Patrik HRAZDÍRA	2006-10-13	17	1	\N
85891	Minh Thai LE	2002-10-14	30	2	\N
53098	Tien Dat NGUYEN	2001-12-27	30	2	\N
71820	Thiti KOKILAWATEE	1995-03-05	4	2	\N
62096	Quang Huy DONG	2003-02-28	30	2	\N
79697	Phonesack SOKTHAVY	2002-09-13	119	2	\N
99842	Viet Nhan NGUYEN	2001-02-14	30	2	\N
61940	KIM Min Jae	1996-06-09	16	2	\N
96423	Duc Bao TA	2006-02-03	30	2	\N
79443	Duc Truong NGO	2005-08-23	30	2	\N
56139	Nam Khanh BUI	2005-01-12	30	2	\N
85554	Hoai Nam NGUYEN	2006-03-13	30	2	\N
69387	Van Sang NGUYEN	2005-12-30	30	2	\N
57541	Nasser ALNAKKAS	2007-04-16	53	2	\N
58460	Sayed Ebrahim HASAN	2008-11-12	53	2	\N
71420	Ahmed HASAN	2006-09-11	53	2	\N
92308	SUN Wen Duo	2005-09-19	5	2	\N
72383	LIU Run Jie	2001-12-18	5	2	\N
89796	LIU Yu Xuan	2005-12-28	5	2	\N
74437	PENG Jia Qi	2006-02-20	5	2	\N
79216	WANG Deng Xian	2005-06-06	5	2	\N
61562	Steven HE	1998-07-25	12	3	\N
56540	TIAN Yi Chuan	2003-12-31	5	2	\N
55807	Juan Alexis ACOSTA	2002-12-18	68	3	\N
69594	ARTURS AKMENS	1992-05-09	120	1	\N
95779	Michael SCHAUSBERGER	1997-06-01	34	1	\N
58857	Dorian Florin TIHI	2003-07-29	24	1	\N
56734	Rasmus ANDERSSON	2004-08-26	19	1	\N
89352	Sean LAURETA	2002-08-01	13	1	\N
89773	Daniel JOHANNESSON	1996-04-26	116	1	\N
75417	Max SVENSSON	2002-02-08	25	1	\N
96420	Patryk KORDEK	2001-10-05	55	1	\N
87011	Martin HLEBARSKI	1990-10-22	44	1	\N
76405	Ivan DIMITROV	1990-04-04	44	1	\N
66298	Evgeni UZUNOV	2004-06-11	44	1	\N
62266	Matthew CHEUNG	2005-03-14	13	1	\N
89036	Edvin HADŽIHALILOVIĆ	1999-03-19	66	1	\N
97232	Ivan TSAREGOROTSEV	2007-01-03	33	1	\N
63932	Eid Ali AL MALIKI	1996-01-10	41	1	\N
43397	Mykola SHKLIAIEV	1983-09-27	33	1	\N
19498	Kazimieras DAUSKURTAS	1990-10-29	86	1	\N
63764	Kaiwen LI	2005-09-03	19	1	\N
82828	Stanimir TERZIEV	2005-10-20	44	1	\N
57876	Marco DANTI	2006-11-01	28	1	\N
95721	Liano PANZA	2006-08-12	35	1	\N
81860	Rasmus MESSERSCHMIDT	1992-06-09	1	1	\N
94389	Seyed Armin ZAKI ZADEH	1995-01-24	78	2	\N
61273	AL- QAZZAZ Ali Muafaq Hadi	1998-10-27	95	2	\N
75245	Hery-Zo Maminiaina RAKOTOHERINIVO	1980-07-22	112	4	\N
91571	Ali MOHAMMED ALI	1994-09-01	95	2	\N
91294	Ali NEAMAH	1986-04-17	95	2	\N
81855	Niels VEENSTRA	1998-07-17	15	1	\N
78579	Expedito EMUDDU	2003-08-17	54	4	\N
63500	Terry Sebastien AMEDEE	1981-06-07	73	4	\N
81607	Sebastiaan LI	1999-07-28	15	1	\N
64009	Sarath DUNNA	2001-11-13	8	2	\N
90048	RANDRIAMALALA Julio Keman	2000-03-23	112	4	\N
63620	Tijl DEWIT	1995-05-30	23	1	\N
87076	Adrien SLEGERS	2001-07-09	23	1	\N
85954	Callum THOMAS	1997-10-10	13	1	\N
98197	Mohammad Mahdi MIRSHEKARI	2001-08-23	78	2	\N
80381	Thomas KATEREGA	2002-05-30	54	4	\N
62890	Ahmed ODUKA	2004-06-22	54	4	\N
73918	Michael SVEJSØ	1993-07-01	1	1	\N
75795	Bhavesh BISSESSUR	2006-02-23	36	4	\N
62069	Hanuman PRAVISH	2004-10-27	36	4	\N
75591	Srivatsav DUWARI	1999-11-22	8	2	\N
81574	Muntadher NABEEL	2002-09-11	95	2	\N
89023	Louie LYONS	2002-07-25	13	1	\N
65317	Saied BABAYANI	1991-04-28	78	2	\N
86948	Muhammad SSALI	2002-02-14	54	4	\N
84968	Dennis OMARA	1997-02-07	54	4	\N
58404	Vikash Prabhu RADHAKRISHNAN	2002-01-22	8	2	\N
86085	Magnus Bach KRISTENSEN	2002-11-30	1	1	\N
71715	Raviraj SHARMA	1989-10-30	8	2	\N
94478	Dharsan ARUL	2004-07-30	8	2	\N
77594	Devansh HIRANI	1995-05-25	8	2	\N
90815	Jake THOMAS	1996-09-14	80	1	\N
63802	Karrar HUSSEIN	2000-06-18	95	2	\N
84663	Murtadha TALIB	2000-10-31	95	2	\N
91367	KHANDOKAR ABDUS Soad	2003-11-06	115	2	\N
83218	Gaurav PARMAR	1991-06-28	8	2	\N
91086	Amer AWAD	1996-06-28	95	2	\N
97074	Arshia AMALKONANDE	2003-05-07	78	2	\N
92452	NANICAOUDIN Loic Antoine	1999-11-24	73	4	\N
82782	MOHAMMAD RAYAN SHANAWAZ REZAH Emamdhully	2004-01-30	36	4	\N
95403	Mohammad WALUGEMBE	2002-10-13	54	4	\N
90044	Shilton TAYEBWA	2005-04-28	54	4	\N
88847	Dennis EVERSDIJK	2000-08-09	15	1	\N
58129	Nyanesh Anand CHANGEA	2008-12-24	36	4	\N
81796	RAKOTOJAONA Tokinirina Fifaliana José	1999-07-23	112	4	\N
72839	REALE Devy	2000-08-24	73	4	\N
94286	Rayan EMAMDHULLY	2004-01-30	36	4	\N
53999	RAZAFIMANDIMBY Tokinirina	2000-02-07	112	4	\N
80957	Cheong Fon Youn JORDY KRIS WANN HUA	2009-02-27	36	4	\N
68436	Mathieu SAVINI	2005-09-27	73	4	\N
77105	Akash Kumar ALOK	2000-08-30	8	2	\N
60428	Dion ROVERS	2001-12-14	15	1	\N
70490	Pepijn VAN ROSSOM	2006-01-13	23	1	\N
73923	Abdul Samad Mohamed SAALIM	2005-07-18	56	2	\N
90187	Hassan ZAYAN	2003-11-18	56	2	\N
62951	Chamath DIAS	2001-03-26	39	2	\N
92963	Abdul Latheef Gasim LIYAH	2006-07-06	56	2	\N
72537	Azhar Mohamed AYYOOB	2007-03-19	56	2	\N
56346	Mohamed MAAILU FATHUHULLA ISMAIL	2006-05-29	56	2	\N
74899	Ewen STEPHEN	2002-06-12	41	1	\N
81597	Isum ARACHCHIGE	2005-10-03	41	1	\N
82077	Seyedmohammad GOLCHIN HOSSEINI	2006-01-29	78	2	\N
61719	Karwan Nozad ABDULLAH	2004-02-05	95	2	\N
99620	Adel SOURATI	2006-03-03	78	2	\N
85237	Ahmad RAOUFI	2004-05-22	78	2	\N
60556	Mehdi HAJTALEBI	2006-10-29	78	2	\N
98173	Yousif M. KHUDHUR	2004-03-24	95	2	\N
25670	Chen Chang NG	2004-09-10	10	2	\N
30374	Hassan HISHAM MOHAMED	1990-01-16	56	2	\N
72455	Robert Ingi HULDARSSON	1997-06-24	116	1	\N
95429	Carl CLAESSON	2004-03-22	25	1	\N
69579	Mitchell MAYNARD	1993-12-04	25	1	\N
90812	Josip UGLESIC	1992-10-22	66	1	\N
97866	Samuel CALI	1989-11-28	52	1	\N
85506	Andis BERZINS	1992-12-09	120	1	\N
60541	Juan Carlos GARCIA TAPIA	1963-09-30	42	3	\N
71824	Dimitrios PAPADOPOULOS	2001-04-25	117	1	\N
68988	Tayfun TASDEMIR	2001-01-01	69	1	\N
97639	Vilius BAGDANAVICIUS	2004-06-10	86	1	\N
97098	Jeronimo URUÑUELA	1985-02-26	42	3	\N
75996	Abdoulnasser ISSIAKOU CHAIBOU	2004-01-01	121	4	\N
77294	Azuolas BARKAUSKAS	2004-04-16	86	1	\N
64309	Robinson COUBE	2005-06-14	11	1	\N
58122	Arthur TATRANOV	2008-06-25	11	1	\N
65896	Logan DORSO	2000-01-19	11	1	\N
64333	Marwen DEBECHE	2004-07-07	11	1	\N
83151	Maxime LEVEQUE	1998-12-29	11	1	\N
95483	Lian Josue CHEN GONZALEZ	2003-01-25	65	3	\N
65438	Santiago SUAREZ	2006-06-29	94	3	\N
69655	Yibak JESSEL	2002-07-29	42	3	\N
78536	Hector Emiliano REGINO ROJAS	2000-03-10	42	3	\N
63964	Chukwuka MICHAEL	2004-04-24	38	4	\N
59541	Nicolas GERBER	2001-08-02	35	1	\N
66621	Victor POPP	1999-02-01	1	1	\N
56125	Mikkel LANGEMARK	2004-03-23	1	1	\N
91558	Manuel CALERO	2002-07-20	20	1	\N
78131	Nikolay KOLEV	2007-05-17	44	1	\N
90490	Berkay CICEN	2000-02-13	69	1	\N
56258	Gift KANGELESA	1991-07-05	58	4	\N
75472	Maurice MBEWE	2002-09-11	58	4	\N
77267	Justine SIMWANZA	2001-01-13	58	4	\N
66771	Ananda Galvani DANISWARA	2004-07-12	19	1	\N
96682	Thabang NAWA	2000-03-29	101	4	\N
91141	Tso Chuan YEH	2006-10-29	7	2	\N
87678	Wen Che LEE	2005-10-07	7	2	\N
85216	Tak Wing YU	1991-08-23	57	4	\N
69008	Moritz UNZ	2000-11-23	24	1	\N
71208	Niklas Lynge OLESEN	2004-05-23	1	1	\N
56647	Michal SOBOLEWSKI	1999-01-26	55	1	\N
80163	Tony LINDELÖF	2001-01-06	19	1	\N
88714	Rannar ZIRK	2003-02-14	63	1	\N
76093	Sergej LUKIC	2003-02-21	93	1	\N
94630	Vito SAGANIĆ	2003-08-29	66	1	\N
82160	Tsamorena Kevin KGOSIDIALWA	1997-09-20	101	4	\N
74208	Constantinos SYMEONIDES	2004-02-24	98	1	\N
83482	Kristof TOTH	2004-02-04	49	1	\N
86571	Calin Tudor TURCU	2005-05-18	83	1	\N
82785	Bene Benjamin KISS	2003-03-28	49	1	\N
64818	Mads MARUM	1998-04-27	45	1	\N
91863	Piotr KRAJEWSKI	1999-05-16	55	1	\N
86625	Michal SZCZYPKA	2005-03-20	55	1	\N
80327	Adrian KOC	2000-12-08	55	1	\N
72975	ŁUkasz CHUDZINSKI	2004-07-20	55	1	\N
80598	Franciszek KAMINSKI	2004-09-01	55	1	\N
56871	Piotr HEINKE	2003-06-02	55	1	\N
88770	Kajetan BARANOWSKI	2004-01-21	55	1	\N
60404	Joshua CHANG	1994-11-07	12	3	\N
77270	Adam BOGACZ	2001-02-22	55	1	\N
91192	Tomáš PATERA	2003-10-21	17	1	\N
99024	Tomáš VRBKA	2005-04-24	17	1	\N
92143	Csanad HORVATH	2006-07-24	49	1	\N
58020	Andreas ROKSVAAG	2004-01-27	45	1	\N
79195	Jonathan DRESP	2004-01-09	24	1	\N
71255	Andy Jesús BAQUE MARCILLO MARCILLO	2000-08-03	72	3	\N
72416	Marcell CSOBOD	2001-05-11	49	1	\N
60475	Pauls Eliass ROZENVALDS	2004-07-20	120	1	\N
98238	Volodymyr KOLUZAIEV	2004-07-31	33	1	\N
64700	Paak Yee CHONG	1999-04-02	113	1	\N
70011	Harry MORGAN	2000-03-24	41	1	\N
86582	Kristian KITANOV	2003-12-17	44	1	\N
72331	Rodrigo ALMEIDA	2001-08-29	27	1	\N
52229	Dinuka KARUNARATNE	1987-10-06	41	1	\N
72661	Thomas Joseph STANFORD	1993-05-01	41	1	\N
83071	Gavin KIRBY	1993-05-23	113	1	\N
74507	YEHOR NECHAI	2004-10-09	33	1	\N
93629	Igor JASEK	2005-06-29	55	1	\N
70464	Ziga PODGORŠEK	2005-03-22	62	1	\N
83567	Mark KOROŠA	2005-07-18	62	1	\N
58638	Harry LINES	2002-05-16	41	1	\N
56193	Felix WRIGHT	2005-06-25	41	1	\N
89019	Barry GARNHAM	1984-08-06	113	1	\N
69198	Luke GRIFFITHS	2003-09-07	41	1	\N
94179	Harper LEIGH	2006-09-01	113	1	\N
90405	Harry WILLSON	1998-06-17	41	1	\N
76831	Mikolaj MORAWSKI	2007-03-14	55	1	\N
67632	Andraž PUNGARTNIK	2003-03-21	62	1	\N
82207	Vladyslav STEPANCHENKO	2007-01-11	33	1	\N
93574	Mbongo DIMITRI	1989-03-23	122	4	\N
69480	Keone OLATOSTE	1992-04-16	101	4	\N
73433	Angelo SILVA	1997-03-30	27	1	\N
87745	Axilleas TSARTSIDIS	1996-10-20	117	1	\N
64377	Paschalis MELIKIDIS	1998-10-30	117	1	\N
73269	Jonas SCHWARZ	1997-01-09	35	1	\N
68483	Gotsilemang MOTLHABANE	1991-11-25	101	4	\N
99547	Jules Francklin NAHOUENOU	1999-08-02	102	4	\N
88401	Michal MATYSIAK	2000-07-25	55	1	\N
69094	Nigel DEGAETANO	1998-05-14	52	1	\N
82569	Zsombor DULCZ	2000-08-16	49	1	\N
61503	Tshimologo RASTA	1995-01-01	101	4	\N
98767	Kevin SELVARAJAH	2000-01-28	27	1	\N
60632	Christopher KLAUER	1999-02-10	24	1	\N
80943	Mario ANAGONOU	1996-03-05	102	4	\N
95734	Ivan PEJOSKI	2002-12-26	123	1	\N
70175	Joshua APILIGA	2001-01-30	80	1	\N
83918	Theodoros PAPADOPOULOS	2004-02-01	117	1	\N
80085	William FREER	2002-02-20	41	1	\N
59674	Patriks KANDIS	2004-12-13	120	1	\N
62523	Blaise Awolabi EFFOUYEMI	2001-06-02	102	4	\N
56440	Raoul Charbel KODJO	2001-07-06	102	4	\N
91574	Alex Revelie Djinin SAH	2005-02-09	102	4	\N
74244	Ulrich TOMETIN	2002-07-10	102	4	\N
92268	Pavel DIMITROV	2003-04-05	44	1	\N
65682	Domas PAKSYS	2007-08-18	86	1	\N
59989	Adrian ONCINA	2002-09-30	20	1	\N
71141	Nacho CERVELLO	2003-10-23	20	1	\N
67493	Seto Priskero KIKI	2005-06-02	102	4	\N
64153	Godson DOSSA	2006-04-16	102	4	\N
59451	Alhassane SONGOMA	2003-04-30	102	4	\N
87524	Elise ASSIGBE	2004-06-02	102	4	\N
80648	Yann Vital ABISSI	2005-04-24	102	4	\N
83946	Anton BERIK	2003-06-29	63	1	\N
94819	Rolands BRATCIKOVS	2006-02-16	120	1	\N
57155	Tsaone MOSWEU	2000-11-16	101	4	\N
90970	Hector REBETZ	2004-12-28	25	1	\N
97671	Kean Gabor KIGYOS	2005-07-03	49	1	\N
74126	Tamino PROCIDA	2003-10-23	24	1	\N
74201	Achille GIRARD	2004-10-17	11	1	\N
77710	Arthur CHARDAIN	2007-02-11	11	1	\N
89925	Zafir EMRAN	2004-11-06	19	1	\N
79370	Louis LEFEVRE	2001-08-16	11	1	\N
66642	Tristan GRELLIER	1995-12-10	11	1	\N
72561	Yohann OSVALD	2005-09-02	11	1	\N
78642	Eliott MORILLE	2007-11-11	11	1	\N
83463	Timeo LACOUR	2007-11-26	11	1	\N
91789	Axel GANCI	1999-12-22	11	1	\N
84282	Swann HARDI	2007-01-05	11	1	\N
88002	Ewan GOULIN	2007-04-28	11	1	\N
70901	Arnolds TIĻĻA	2005-01-07	120	1	\N
91221	Gildas TOBOSSI	1999-05-05	102	4	\N
68324	T. L. Novalis Noel NOUKPO	2001-12-24	102	4	\N
60481	Yasser ABDELKADER SOUNA SIDO	1991-11-01	121	4	\N
76540	Gbenakpon Franck ALLOGNON	2001-12-13	102	4	\N
69324	Issoufou HAMADOU ALI	2002-03-08	121	4	\N
60109	Edric Marnel Charbel MEHOU	2003-03-12	102	4	\N
63064	Abba MOHAMMED	2010-03-27	38	4	\N
96841	Abdoul Fatah SOUMAILA TIECOURA	2004-11-04	121	4	\N
81276	Spero DOSSA	1996-06-21	102	4	\N
93721	Niels RUGAARD	1997-04-20	1	1	\N
91946	Jacob THYGE	2003-07-30	1	1	\N
56713	Kasper FUNCH	1999-10-13	1	1	\N
77342	Robin GERBER	1999-03-25	35	1	\N
83143	Rune TØTTRUP	1998-01-12	1	1	\N
88215	Stefan ZEIROV	2005-04-11	44	1	\N
71911	Deepak PILLAI	2004-05-26	25	1	\N
65715	Tsvetomir STOYANOV	2001-08-06	44	1	\N
78616	Krasimir TODOROV	2004-12-14	44	1	\N
82919	Aleksander PETROV	2004-09-12	44	1	\N
74314	Nelson TJIHUMINO	2001-05-19	101	4	\N
73984	Phenyo MOKGWATLHENG	2000-02-07	101	4	\N
67469	Oankgoga TIDIMATSO	1998-09-26	101	4	\N
97773	Ryan Ngetupe KEHINANA	2003-08-03	101	4	\N
80682	Baldwin Atlang WESI	1999-12-21	101	4	\N
99722	Trinity PHEKO	2002-02-18	101	4	\N
85308	Sibusiso Jabulani NTUNGWANA	2004-07-05	101	4	\N
99973	Modiri MOTSHEGWE	2002-10-22	101	4	\N
99349	Kamogelo Bofelo WESI	2002-04-12	101	4	\N
75562	Thabang LEBOGANG	1998-06-24	101	4	\N
94376	Matthias TRAUFFER	2002-11-22	35	1	\N
90806	Andri NIEDERMANN	2003-11-09	35	1	\N
74504	Diego SCALVINI	1998-07-12	28	1	\N
73615	Josua HARDMEIER	2005-01-30	35	1	\N
61732	Marcus SVENSON	2004-04-10	25	1	\N
90778	Noel TAPPEINER	2007-01-30	35	1	\N
86084	Casper SPAANS	2006-04-07	15	1	\N
84442	Edgaras SLUSNYS	1991-07-21	86	1	\N
12761	Edijs LIVINS	1980-06-15	120	1	\N
80726	Daniel KLANČAR	1984-09-20	62	1	\N
84276	Aljaz FERK	1996-06-30	62	1	\N
76226	Ivo KEISS	1978-08-22	120	1	\N
56559	Roberts Renars MISCENKO	2003-11-05	120	1	\N
91465	Gustavs Davids BRECS	2003-11-28	120	1	\N
70825	Rene LEEMAN	2006-11-20	63	1	\N
62484	Augustas VALATKA	2003-10-20	86	1	\N
93978	Toms SALA	2007-10-07	120	1	\N
64076	Chris Robin TALTS	2005-06-16	63	1	\N
72408	Rihards ZUGS	2005-01-26	120	1	\N
80316	Leonardo GOLOVCENKO	2007-09-24	120	1	\N
86707	Serhii MARUSHCHAK	2007-08-26	33	1	\N
59717	Nicolas FRANCONVILLE	2004-04-18	35	1	\N
79186	Vladyslav KUNIN	2008-06-27	33	1	\N
79148	Anrijs ZAĶIS	2002-12-19	120	1	\N
97045	Edzus MEIRANS	2005-04-27	120	1	\N
97471	Dominykas GABRIUNAS	2005-04-25	86	1	\N
94172	Pjotr ODIJK	2001-12-16	15	1	\N
95829	Djordje STEPANOVIC	2001-09-15	93	1	\N
99639	Sune Juul ØRSKOV	2004-06-12	1	1	\N
98752	RúNi ØSTER	2002-09-02	124	1	\N
82683	Dylan SOEDJASA	1995-01-13	46	5	\N
68763	Lucas JUILLOT	2005-01-13	107	5	\N
93996	Emanuela MATAIO	2006-10-31	109	5	\N
\.


--
-- Data for Name: player_performance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_performance (member_id, tournaments, total_match, win, lose) FROM stdin;
25831	12	647	501	146
95661	16	405	262	143
62063	20	243	172	71
64032	14	453	337	116
57945	18	341	248	93
76115	19	335	209	126
34810	20	730	471	259
83950	18	429	257	172
73442	15	417	277	140
95476	19	192	140	52
85394	19	349	214	135
77427	18	171	102	69
45171	19	547	335	212
57823	18	305	189	116
91554	13	364	271	93
81561	17	346	237	109
94780	20	300	173	127
71408	18	224	137	87
68870	17	311	220	91
93627	18	491	312	179
81362	17	186	128	58
62855	13	255	161	94
95930	12	208	131	77
61628	20	595	381	214
63122	21	368	264	104
77042	15	105	68	37
86114	20	176	122	54
72885	17	463	301	162
87375	17	494	284	210
92508	17	320	168	152
69093	13	121	87	34
85095	19	372	243	129
59322	15	308	198	110
52953	13	711	367	344
58963	16	294	175	119
97030	16	217	150	67
94397	18	244	160	84
97174	10	219	138	81
94580	14	248	186	62
76973	14	441	267	174
92796	17	330	200	130
65580	13	312	227	85
61423	17	412	272	140
62720	15	174	100	74
53753	12	592	360	232
77848	17	231	139	92
69006	10	150	109	41
59543	10	388	287	101
54897	11	650	493	157
86672	13	63	50	13
92655	16	484	287	197
52864	10	437	231	206
68317	14	192	126	66
84838	12	223	158	65
81887	9	271	167	104
71221	14	442	271	171
74579	14	231	138	93
96429	14	398	244	154
74076	8	142	103	39
89785	8	484	373	111
77003	9	320	201	119
70399	19	367	234	133
83938	14	214	142	72
59420	18	339	232	107
91673	8	82	63	19
68392	8	223	181	42
20808	19	369	193	176
86470	14	179	115	64
62018	13	121	84	37
83985	15	320	189	131
80062	10	122	84	38
42776	12	410	242	168
78890	18	314	201	113
87117	14	365	221	144
98595	14	139	101	38
91651	17	184	136	48
64081	13	113	75	38
57924	7	186	115	71
91814	20	128	77	51
83597	14	344	174	170
62286	13	256	153	103
79164	12	105	70	35
69253	17	273	148	125
86230	12	55	38	17
82606	16	167	105	62
95425	12	268	163	105
58639	14	101	58	43
64648	12	118	70	48
57762	7	176	128	48
57297	17	358	240	118
64794	12	176	92	84
62615	11	115	74	41
82989	14	340	227	113
93791	7	404	244	160
14587	8	592	365	227
58089	8	132	107	25
91853	10	97	63	34
79110	10	110	69	41
46776	14	490	278	212
58328	15	389	252	137
14251	11	812	532	280
89506	11	426	231	195
52968	7	734	411	323
56274	14	531	277	254
60427	14	236	127	109
58670	13	137	75	62
51998	17	334	216	118
94104	13	151	110	41
64839	13	444	272	172
73966	21	207	109	98
64561	14	128	56	72
95952	9	197	122	75
79662	8	232	156	76
64666	11	60	32	28
87691	14	337	166	171
83657	16	229	128	101
76994	12	205	129	76
91254	15	380	222	158
75283	11	109	79	30
86887	10	353	201	152
79047	9	63	44	19
75575	13	139	73	66
59077	15	62	45	17
69345	9	149	82	67
68819	14	442	194	248
85563	16	270	176	94
84815	11	382	247	135
65788	9	38	24	14
87029	11	75	54	21
90657	7	192	142	50
92816	6	75	61	14
68718	6	288	169	119
75763	15	253	150	103
93101	8	526	293	233
79686	8	62	32	30
89814	11	52	29	23
72466	11	399	236	163
89309	10	120	67	53
95439	15	122	63	59
61819	13	241	128	113
95489	13	162	78	84
90360	12	135	95	40
65634	8	126	81	45
85118	12	214	127	87
59702	14	81	44	37
80886	8	133	94	39
71797	14	320	170	150
69537	11	179	95	84
67447	17	239	126	113
77792	12	173	73	100
85845	10	78	47	31
96339	15	168	93	75
88711	15	104	49	55
92542	10	142	89	53
87610	13	116	63	53
78590	10	34	23	11
98728	8	103	48	55
70824	7	41	26	15
89595	7	27	11	16
90111	24	105	43	62
78948	8	91	51	40
98462	9	60	44	16
58628	4	240	136	104
60967	13	303	175	128
69712	8	60	39	21
72555	13	194	110	84
70442	7	401	243	158
68647	6	158	106	52
67251	17	318	162	156
77143	12	152	89	63
78856	8	89	75	14
82372	8	174	128	46
94151	9	62	37	25
92114	12	65	29	36
62932	10	69	39	30
63846	12	262	154	108
56243	11	33	19	14
58631	17	291	118	173
74987	8	268	154	114
85956	5	171	119	52
78400	5	22	16	6
92160	10	40	22	18
64179	5	169	106	63
61453	11	98	37	61
91665	8	342	183	159
99895	5	137	79	58
81655	10	263	151	112
69756	6	46	28	18
53944	5	544	306	238
94426	9	262	114	148
98896	11	283	140	143
80369	10	89	44	45
73886	4	104	62	42
55942	10	100	44	56
96545	6	369	226	143
81106	6	102	61	41
68316	13	42	26	16
54346	4	554	356	198
74008	13	237	135	102
75539	8	32	17	15
81430	9	85	62	23
83865	10	86	36	50
94119	5	169	119	50
73177	7	117	57	60
87811	6	85	62	23
84764	9	72	48	24
85790	8	155	89	66
60676	8	39	22	17
67660	8	83	62	21
61916	13	346	196	150
70383	8	54	36	18
97243	8	47	29	18
69875	15	207	154	53
79256	9	52	24	28
81906	4	86	56	30
57460	14	125	31	94
96461	5	620	339	281
99466	4	89	58	31
80189	7	110	40	70
86866	14	178	114	64
62933	9	137	93	44
75565	11	158	92	66
79943	8	43	14	29
73671	8	182	87	95
57322	16	273	183	90
69037	8	79	53	26
63069	4	25	16	9
69521	14	100	46	54
99294	13	171	98	73
58521	9	117	63	54
75657	12	180	108	72
83265	5	89	44	45
60145	12	52	24	28
60771	9	36	20	16
97959	4	81	54	27
94332	9	98	55	43
86975	9	37	21	16
93848	6	18	12	6
70219	12	141	30	111
70141	8	76	26	50
65081	8	59	39	20
97018	11	53	23	30
69529	10	114	44	70
93539	7	263	158	105
94727	9	28	16	12
85735	6	139	78	61
69960	4	45	23	22
97943	7	220	145	75
66193	12	76	39	37
25925	2	336	212	124
87857	10	67	38	29
55024	8	230	127	103
57758	7	17	4	13
68262	12	166	105	61
55838	12	130	63	67
85472	8	220	135	85
82952	15	49	19	30
86104	5	269	103	166
83155	12	166	85	81
64890	3	20	11	9
57406	14	259	152	107
92533	7	99	43	56
63145	9	33	16	17
57543	8	591	323	268
63170	7	127	91	36
89163	4	16	11	5
81643	4	150	80	70
89424	2	9	7	2
91004	7	105	39	66
68934	13	232	128	104
68727	10	40	26	14
81765	13	241	119	122
81101	9	69	38	31
98305	4	32	15	17
78169	17	35	9	26
14107	5	680	468	212
91710	8	149	73	76
77614	6	33	22	11
84263	5	134	79	55
74420	8	70	48	22
90130	4	200	144	56
86616	7	102	61	41
85281	10	139	87	52
75014	5	91	66	25
64933	3	346	190	156
83385	7	24	8	16
77846	14	214	131	83
75079	8	132	84	48
99595	7	103	52	51
79604	8	53	32	21
93776	8	60	26	34
60649	3	136	87	49
67753	10	79	20	59
98838	8	89	47	42
64768	8	41	21	20
88961	7	35	7	28
93670	5	278	151	127
85224	15	279	117	162
97345	2	26	22	4
86521	4	41	21	20
89268	3	75	62	13
92003	15	210	93	117
57594	5	113	56	57
81466	12	43	16	27
99187	9	265	118	147
93857	2	207	120	87
83212	9	395	183	212
93913	14	152	91	61
59490	8	17	8	9
71877	5	26	16	10
89890	11	35	21	14
76817	6	33	21	12
62699	5	135	85	50
64512	11	281	140	141
98248	10	385	202	183
76618	9	165	64	101
82670	4	120	80	40
93370	4	52	31	21
90978	4	104	50	54
78891	11	252	133	119
88298	13	97	29	68
60710	6	25	10	15
69306	7	196	100	96
88165	2	38	14	24
66694	4	339	182	157
95516	2	15	11	4
86723	6	49	31	18
80203	12	166	105	61
72215	5	96	30	66
95561	9	17	2	15
71954	7	21	13	8
99672	2	110	59	51
99580	6	100	47	53
91894	8	67	43	24
55949	3	447	262	185
82483	10	34	22	12
50387	5	60	30	30
14004	3	563	356	207
68845	4	235	140	95
78209	3	75	41	34
83243	6	167	89	78
68139	4	155	88	67
91347	5	16	8	8
88096	12	55	15	40
66522	8	200	124	76
55836	6	18	6	12
86567	16	399	170	229
66041	17	176	74	102
58309	6	208	111	97
55280	1	452	227	225
88013	7	26	8	18
59695	2	67	48	19
62395	2	13	9	4
51123	7	60	38	22
72674	3	127	80	47
58349	9	43	26	17
85385	4	37	23	14
93602	2	24	18	6
68697	1	41	29	12
88856	8	499	278	221
69243	7	152	84	68
64088	5	63	11	52
86445	2	38	31	7
57963	3	37	24	13
81297	5	44	16	28
64001	5	18	7	11
50864	7	27	11	16
95480	12	234	125	109
59967	5	20	6	14
59614	4	56	38	18
59445	5	205	112	93
65546	11	229	122	107
83581	7	259	155	104
57490	1	6	2	4
69770	1	4	2	2
65648	4	164	82	82
63973	2	10	7	3
72503	5	23	15	8
92000	7	123	78	45
59956	8	163	98	65
90927	6	18	4	14
90593	4	33	15	18
98589	11	478	229	249
61988	5	21	11	10
87999	11	134	71	63
90269	7	234	136	98
89587	3	9	2	7
90396	4	79	31	48
71959	4	22	14	8
58913	2	19	11	8
87274	2	3	1	2
79759	2	43	20	23
58402	5	271	114	157
59697	4	42	16	26
98750	5	53	28	25
61797	3	202	131	71
56428	4	13	2	11
66626	4	49	17	32
75260	4	19	10	9
79176	8	75	20	55
67561	8	20	2	18
82875	8	19	1	18
75537	8	26	9	17
86109	5	40	7	33
76972	3	294	151	143
97290	9	150	60	90
88283	4	33	9	24
73768	2	44	21	23
70050	4	60	42	18
98859	4	27	17	10
26459	5	157	24	133
58125	3	75	29	46
88046	3	103	76	27
60582	3	19	9	10
57236	3	20	14	6
87484	3	14	8	6
58155	5	42	21	21
29449	1	311	172	139
63140	6	378	203	175
90973	2	96	31	65
99172	2	18	9	9
88128	15	79	43	36
57334	3	71	36	35
67825	3	25	16	9
80545	3	20	11	9
82961	1	139	65	74
63135	8	30	7	23
61064	5	9	2	7
79629	3	41	15	26
68019	6	85	52	33
72513	5	33	10	23
72988	3	53	26	27
59921	7	110	28	82
81642	2	17	7	10
98831	1	5	4	1
99703	10	158	103	55
88595	6	111	58	53
64119	4	56	36	20
64223	3	27	14	13
66489	13	213	129	84
82239	4	85	38	47
92024	4	8	3	5
65622	10	220	127	93
93924	6	10	3	7
80475	3	26	3	23
80839	8	44	25	19
89690	4	157	84	73
63750	10	256	110	146
84817	6	29	6	23
96616	5	16	6	10
57887	4	17	4	13
61970	10	15	4	11
86077	5	97	47	50
57588	7	102	65	37
67848	12	177	101	76
67508	2	108	65	43
73422	2	21	12	9
64011	6	31	17	14
70121	3	13	7	6
96085	10	105	39	66
64730	4	28	12	16
99000	4	10	3	7
87688	8	61	30	31
75929	2	47	16	31
61880	2	32	23	9
73490	2	10	6	4
59157	2	13	9	4
95954	2	13	9	4
75550	3	34	16	18
64670	11	202	113	89
80259	8	253	136	117
93399	11	105	46	59
95766	8	177	114	63
62917	4	33	17	16
96669	4	81	29	52
67852	3	122	44	78
72200	2	51	41	10
89757	9	168	116	52
59955	5	35	13	22
87934	4	57	32	25
78781	4	58	19	39
90878	2	13	8	5
73690	4	42	21	21
66224	11	160	98	62
92174	1	38	21	17
82757	9	98	63	35
72275	3	30	8	22
83315	5	203	132	71
85964	9	181	96	85
95479	5	146	85	61
75511	2	8	3	5
94680	2	9	4	5
70504	4	16	1	15
64613	3	43	23	20
92103	3	15	6	9
75713	3	5	1	4
98737	8	25	14	11
60722	3	21	7	14
70753	6	29	10	19
83290	4	94	54	40
83999	5	7	2	5
66421	4	71	17	54
85277	2	143	59	84
78625	2	4	0	4
57382	4	6	2	4
58873	9	76	33	43
61720	2	18	4	14
70896	2	7	5	2
58566	1	38	18	20
60379	1	59	25	34
82080	1	122	53	69
92846	1	77	55	22
56939	1	3	2	1
96955	1	3	2	1
75584	1	19	14	5
24589	1	5	3	2
83039	5	37	17	20
73970	3	34	16	18
74160	3	10	7	3
84648	3	15	5	10
78102	2	208	118	90
85854	2	43	25	18
58835	3	8	3	5
79835	3	5	0	5
76398	4	24	3	21
97497	4	15	6	9
54991	4	31	18	13
63054	5	88	45	43
82585	4	42	6	36
56936	10	49	3	46
93868	8	123	42	81
76496	5	62	32	30
82093	3	28	4	24
71843	3	27	21	6
61780	3	24	9	15
90459	1	295	179	116
60733	1	49	26	23
64674	1	9	6	3
96008	3	66	44	22
99734	3	41	5	36
96016	6	17	3	14
77935	7	18	4	14
81321	3	45	26	19
88523	1	367	216	151
88529	3	44	14	30
56463	3	21	10	11
72361	1	7	2	5
78535	2	16	5	11
61868	2	127	72	55
15788	2	16	4	12
85882	2	30	18	12
79984	2	6	2	4
66356	2	25	16	9
62551	2	5	0	5
32769	2	6	0	6
41481	2	4	0	4
23461	2	5	1	4
24963	2	4	1	3
74534	2	7	3	4
72161	2	96	55	41
81874	2	74	37	37
81195	2	53	26	27
74639	2	10	5	5
59181	3	20	4	16
76678	2	19	6	13
60449	4	17	5	12
63076	4	45	29	16
62012	10	85	42	43
89982	4	6	1	5
94966	3	11	4	7
99461	6	145	85	60
71084	6	68	12	56
75326	2	7	1	6
92049	7	28	15	13
98798	4	218	115	103
55573	4	10	0	10
73815	1	151	61	90
66802	1	18	13	5
56930	1	11	6	5
93739	9	102	54	48
67237	7	125	30	95
75005	4	104	47	57
56821	2	10	5	5
66003	11	207	113	94
56028	2	20	9	11
70044	5	11	4	7
68290	3	31	12	19
75385	3	75	14	61
74079	4	43	4	39
59918	2	37	9	28
92119	2	11	4	7
99105	2	13	9	4
79144	4	15	1	14
68394	3	12	5	7
78729	6	65	30	35
80166	2	8	4	4
99908	5	129	83	46
84561	5	53	21	32
74084	3	22	6	16
83883	2	78	59	19
94649	9	139	65	74
62643	5	41	2	39
77902	6	144	45	99
73930	5	20	9	11
84783	5	40	13	27
68050	4	115	9	106
95957	4	8	1	7
91432	7	368	251	117
98955	3	20	7	13
64078	2	25	12	13
65384	2	10	1	9
68446	9	112	59	53
56095	7	76	44	32
98624	2	37	16	21
64041	2	31	14	17
80172	2	10	6	4
64546	2	27	12	15
74452	2	130	93	37
74264	2	28	16	12
88338	7	53	20	33
85218	2	39	8	31
98455	2	19	4	15
56611	2	12	5	7
59325	2	9	4	5
60496	7	143	62	81
76977	6	30	12	18
83742	4	39	15	24
82517	3	38	20	18
88755	2	5	3	2
98443	9	176	103	73
77349	1	20	9	11
66071	1	316	188	128
96242	1	20	8	12
65183	1	35	15	20
88938	1	28	6	22
75861	1	22	12	10
59257	1	9	0	9
77864	1	62	29	33
59400	1	25	10	15
91027	1	51	30	21
76865	1	36	14	22
64123	1	17	7	10
55886	1	15	2	13
73355	1	9	5	4
78598	1	51	22	29
83231	1	29	12	17
67920	1	58	27	31
67875	1	32	20	12
81214	1	40	17	23
92204	1	8	1	7
96653	1	8	2	6
76217	1	19	10	9
63171	1	59	33	26
76441	1	4	1	3
60543	1	4	2	2
60321	1	35	28	7
86018	1	2	0	2
66018	1	42	28	14
85930	1	19	11	8
72260	1	6	2	4
77842	1	18	10	8
98782	1	8	2	6
85817	1	2	1	1
68322	1	27	20	7
45514	1	3	1	2
13548	1	2	1	1
61504	1	34	25	9
34170	1	1	0	1
60721	2	46	13	33
94882	2	39	22	17
65893	2	6	3	3
6493	2	29	0	29
61382	2	25	6	19
80159	2	12	1	11
83383	2	14	4	10
80698	2	20	7	13
99014	2	6	0	6
62731	2	6	1	5
90321	6	17	9	8
61331	4	59	31	28
72114	3	22	5	17
84679	4	12	3	9
75049	4	212	158	54
59910	3	6	1	5
92698	2	20	10	10
64537	2	16	4	12
61951	2	4	0	4
66104	2	14	4	10
66862	2	5	2	3
57182	2	12	4	8
92551	2	13	3	10
83368	7	169	85	84
53929	6	243	127	116
57319	4	39	21	18
61494	9	50	4	46
98016	4	9	0	9
78015	12	30	9	21
58119	7	32	13	19
98860	3	89	22	67
74364	7	74	25	49
97160	4	29	17	12
78108	3	4	1	3
90511	2	9	5	4
93205	1	270	151	119
95709	8	52	0	52
95654	3	8	4	4
97624	6	16	3	13
77830	6	16	4	12
77559	4	28	11	17
77163	3	224	130	94
64454	7	52	22	30
83896	2	34	14	20
76838	2	14	0	14
78198	3	133	52	81
60744	3	50	24	26
79119	3	8	2	6
58715	10	73	33	40
77551	2	220	86	134
63969	3	103	36	67
58227	2	32	10	22
70381	2	93	52	41
81924	2	7	2	5
59321	2	5	0	5
86964	2	33	17	16
80879	2	9	3	6
81329	2	13	5	8
59241	2	26	10	16
63811	2	3	1	2
95021	2	8	4	4
28998	2	4	0	4
36690	2	4	0	4
98304	2	20	14	6
82700	4	165	70	95
92068	2	20	4	16
89898	2	16	1	15
37111	2	7	2	5
79521	8	72	34	38
80660	5	305	145	160
79377	2	3	0	3
64859	2	8	1	7
95468	2	17	7	10
86155	3	15	5	10
63643	3	8	2	6
89692	2	43	19	24
86526	1	26	6	20
97153	1	40	16	24
79081	1	16	2	14
94963	1	19	4	15
71758	1	5	0	5
63063	1	3	0	3
93177	8	61	20	41
93676	5	55	14	41
59356	2	19	3	16
91864	2	6	2	4
93294	2	3	1	2
95760	2	15	3	12
66798	2	26	11	15
74118	3	47	18	29
64141	2	44	16	28
63148	3	20	9	11
5083	3	10	2	8
81788	6	116	47	69
93952	2	4	2	2
59796	2	17	9	8
86086	2	46	19	27
55858	7	145	49	96
91097	4	19	3	16
76332	3	16	9	7
83092	3	11	6	5
62927	3	9	0	9
57478	2	35	11	24
77460	2	3	1	2
53351	2	16	6	10
68473	2	17	8	9
66079	2	21	10	11
72923	1	224	105	119
89815	1	17	7	10
74310	1	22	6	16
57590	1	21	7	14
68083	1	54	17	37
86169	1	39	13	26
98776	1	14	5	9
75185	1	12	4	8
69107	1	9	4	5
55661	1	39	11	28
75158	1	17	12	5
78096	1	11	7	4
68294	1	23	6	17
71659	1	5	1	4
67405	1	80	29	51
57863	1	8	4	4
69016	1	3	2	1
81363	1	7	5	2
81792	1	16	10	6
81300	1	8	5	3
66655	1	59	36	23
89186	1	14	2	12
81962	1	2	1	1
85212	1	14	11	3
94173	1	8	3	5
68279	1	3	1	2
93072	1	20	16	4
78931	1	9	1	8
96974	1	13	11	2
85839	1	6	3	3
93302	1	100	67	33
11311	1	7	4	3
72037	1	7	1	6
70220	1	20	13	7
88947	5	27	6	21
97265	9	142	74	68
57562	4	226	129	97
62864	2	76	37	39
59658	2	95	64	31
70291	2	79	42	37
74462	2	9	1	8
58689	2	72	35	37
99109	2	4	0	4
79517	2	156	104	52
69164	2	27	9	18
68039	2	15	4	11
93213	2	6	3	3
56178	2	15	6	9
79090	2	6	1	5
86452	4	5	0	5
64812	2	58	33	25
92650	2	7	1	6
73141	5	37	14	23
76702	3	92	23	69
71248	1	54	23	31
96232	1	50	19	31
85309	1	19	13	6
72986	1	253	175	78
61465	1	9	0	9
85582	1	39	10	29
87234	1	20	2	18
58534	1	8	0	8
82265	1	13	6	7
72439	1	13	3	10
88596	1	7	2	5
69532	1	8	2	6
75852	1	2	0	2
90776	1	20	9	11
70129	1	5	0	5
63556	1	5	0	5
98726	1	5	1	4
86160	1	30	15	15
68393	1	1	0	1
82987	1	3	1	2
95459	1	3	0	3
99168	1	10	4	6
89799	1	12	6	6
86450	1	5	2	3
77927	1	14	2	12
79023	1	10	3	7
65554	4	294	164	130
65734	4	6	1	5
99738	2	12	6	6
82054	2	7	4	3
65055	2	2	0	2
74915	4	39	10	29
94087	7	10	1	9
75440	4	19	6	13
84666	1	49	25	24
79116	1	1	0	1
61574	1	2	0	2
63791	1	4	0	4
73799	1	3	2	1
65857	3	170	75	95
56114	3	45	27	18
72955	3	26	14	12
56566	8	122	31	91
68388	5	14	0	14
79757	5	14	0	14
77759	3	19	3	16
71340	2	9	3	6
88691	3	4	0	4
83274	3	4	0	4
82213	2	10	1	9
60664	2	26	11	15
99710	2	9	1	8
71501	2	19	2	17
93544	2	7	3	4
16451	4	97	24	73
83606	7	74	32	42
55335	3	26	6	20
59705	2	26	12	14
93901	2	4	0	4
73890	2	9	0	9
60553	2	16	7	9
80613	3	17	6	11
84166	3	44	31	13
95674	2	14	3	11
60832	2	8	1	7
65499	2	24	3	21
88075	10	211	110	101
57599	8	71	29	42
84412	8	160	65	95
99140	2	7	3	4
84106	2	32	17	15
70870	2	12	3	9
65678	4	181	64	117
88026	2	52	17	35
70720	2	51	21	30
89412	2	6	2	4
91996	8	28	7	21
57177	7	62	31	31
75878	3	12	5	7
57453	3	12	3	9
69468	3	7	2	5
63563	2	4	2	2
78310	5	63	22	41
92514	3	10	0	10
96790	3	4	1	3
86564	2	33	20	13
92875	3	68	27	41
85813	2	11	8	3
68954	5	151	76	75
58493	2	109	61	48
85366	2	102	38	64
99811	2	6	2	4
56882	2	6	3	3
55750	2	84	58	26
67693	7	46	9	37
89325	2	6	0	6
87411	2	34	7	27
98395	2	35	12	23
91438	2	16	3	13
58607	2	15	3	12
78807	2	7	2	5
69820	2	28	5	23
99121	2	12	1	11
87209	2	11	0	11
90754	2	6	0	6
67055	1	39	10	29
42403	1	36	4	32
53845	1	41	9	32
76170	1	131	67	64
86996	1	18	0	18
14201	1	20	10	10
96755	1	60	26	34
88148	1	45	28	17
72695	1	12	1	11
93554	1	22	4	18
80675	1	17	2	15
91102	1	18	3	15
92430	1	31	16	15
95506	1	23	11	12
91101	1	27	10	17
82767	1	43	8	35
86116	1	9	0	9
11093	1	9	0	9
78666	1	16	1	15
71225	1	6	1	5
88849	1	12	5	7
65927	1	31	11	20
75559	1	12	4	8
68156	1	16	9	7
69588	1	15	6	9
88566	1	13	6	7
75586	1	8	2	6
76250	1	16	7	9
94974	1	20	8	12
56646	1	22	15	7
55023	1	6	2	4
87742	1	16	1	15
71446	1	7	5	2
63997	1	13	4	9
69491	1	5	0	5
69088	1	2	0	2
94624	1	19	4	15
55868	1	2	1	1
50098	1	2	0	2
55701	1	1	0	1
66713	1	4	0	4
96089	1	2	1	1
50320	1	1	0	1
61004	1	2	0	2
82924	1	1	0	1
64171	1	2	1	1
87913	1	4	2	2
76591	1	3	1	2
56782	1	12	5	7
71840	1	4	1	3
68857	1	22	11	11
99300	1	11	7	4
91172	1	2	0	2
66010	1	9	5	4
97955	1	3	1	2
74911	1	2	0	2
98006	1	5	0	5
94377	1	1	0	1
90967	1	1	0	1
97759	1	1	0	1
58659	1	4	1	3
63995	1	58	47	11
97445	1	4	1	3
83357	1	4	2	2
72035	1	2	1	1
81034	1	4	2	2
89147	1	1	0	1
29783	1	1	0	1
93882	1	11	3	8
64159	2	37	16	21
95212	1	50	16	34
74728	1	38	11	27
79938	1	53	16	37
74260	1	63	15	48
62696	1	35	12	23
65164	1	74	12	62
60946	1	40	20	20
73346	1	7	0	7
62126	1	63	29	34
88028	1	7	1	6
77688	1	55	24	31
59977	1	8	3	5
84030	1	19	6	13
57668	1	85	37	48
71851	1	60	31	29
97019	1	28	9	19
68046	1	6	1	5
70621	1	7	0	7
60535	1	58	24	34
97840	1	41	10	31
83759	1	15	3	12
70040	1	19	4	15
78249	1	16	4	12
81111	1	10	1	9
80469	1	25	10	15
70277	1	5	1	4
62053	1	31	11	20
73025	1	41	17	24
85855	1	12	3	9
60776	1	14	8	6
61686	1	22	10	12
67490	1	16	6	10
86971	1	12	2	10
65484	1	3	0	3
82092	1	3	1	2
58018	1	6	1	5
99538	1	8	1	7
94388	1	22	8	14
90479	1	21	9	12
79328	1	9	3	6
95080	1	7	1	6
79058	1	42	10	32
89385	1	6	3	3
92065	1	43	7	36
50006	1	53	27	26
65760	1	20	4	16
76440	1	66	15	51
98660	1	19	6	13
89553	1	9	1	8
77773	1	5	1	4
66343	1	2	0	2
79671	1	3	1	2
66747	1	3	1	2
86022	1	7	3	4
97551	1	14	8	6
79290	1	22	17	5
72982	1	5	2	3
83477	1	2	0	2
90781	1	3	0	3
71956	1	3	0	3
65418	1	2	0	2
86833	1	3	0	3
94243	1	3	0	3
75665	1	2	0	2
66842	1	2	1	1
86245	1	2	1	1
67702	1	8	3	5
75527	1	21	7	14
58912	1	2	1	1
87695	1	2	0	2
53129	1	7	0	7
42640	1	3	0	3
56027	1	4	1	3
50025	1	4	1	3
98680	1	79	47	32
94252	1	41	29	12
97220	1	4	1	3
61630	1	6	0	6
56112	3	13	2	11
86501	2	37	20	17
88756	2	51	40	11
89132	2	19	4	15
73231	3	51	17	34
74259	5	32	15	17
71492	4	141	55	86
66821	1	1	0	1
83323	6	232	104	128
93479	3	19	5	14
91154	3	14	3	11
79362	3	6	2	4
81656	3	6	2	4
87463	3	12	2	10
59795	3	12	4	8
99427	3	12	5	7
59340	5	38	12	26
66402	4	6	1	5
57421	8	65	10	55
75948	8	22	3	19
68565	6	38	5	33
63959	6	123	59	64
95028	5	126	63	63
74744	4	31	14	17
78221	3	100	62	38
97974	4	63	36	27
90031	2	16	5	11
79387	2	29	19	10
57484	2	4	0	4
98198	2	4	0	4
69996	6	62	27	35
79941	6	38	10	28
69615	5	110	42	68
56250	3	27	12	15
92033	2	19	3	16
71809	2	6	2	4
70317	2	7	2	5
77957	2	4	1	3
55956	2	4	1	3
68414	2	6	1	5
93877	2	4	1	3
72684	2	6	2	4
99954	1	26	17	9
72430	1	41	24	17
76059	1	14	7	7
62698	1	6	2	4
87478	6	65	11	54
84469	6	82	31	51
69797	2	91	36	55
71295	2	33	9	24
81091	2	7	2	5
95418	2	5	0	5
85825	6	142	51	91
75729	5	118	58	60
98845	6	102	43	59
98180	3	9	1	8
69814	3	21	6	15
76331	3	13	7	6
74254	3	5	1	4
99670	3	47	33	14
65262	2	74	21	53
92511	2	72	21	51
63178	2	3	1	2
82907	1	90	55	35
56212	1	22	6	16
77921	1	16	4	12
64900	1	21	12	9
59407	1	112	41	71
87832	1	39	18	21
65590	1	32	10	22
88428	1	29	10	19
87790	1	7	3	4
57538	1	28	3	25
66088	1	11	3	8
98066	1	11	4	7
55748	1	2	0	2
67396	1	22	13	9
76669	1	24	12	12
67417	1	27	16	11
99157	1	3	0	3
92591	1	4	1	3
56306	1	40	22	18
84140	1	23	12	11
87282	1	8	3	5
62726	1	4	2	2
87436	1	6	2	4
70775	1	5	1	4
66075	1	3	1	2
62538	1	5	2	3
94220	1	2	1	1
89846	3	94	55	39
67891	2	228	116	112
60581	2	50	20	30
65879	7	21	0	21
85344	6	74	17	57
66578	3	60	39	21
90020	2	3	1	2
93019	4	38	8	30
87085	3	24	0	24
88119	3	32	11	21
92236	3	101	52	49
94576	2	17	8	9
24470	1	203	116	87
93747	1	118	52	66
61017	1	40	14	26
55665	1	4	0	4
58280	1	49	15	34
65936	1	19	9	10
87426	1	71	26	45
81433	1	11	4	7
58314	1	14	7	7
82926	1	27	10	17
95968	1	11	5	6
80048	1	1	0	1
73284	1	7	3	4
60929	1	1	0	1
73493	1	82	54	28
83774	1	3	0	3
62351	1	2	0	2
76501	1	2	0	2
97379	1	1	0	1
83003	1	1	0	1
82018	1	1	0	1
91514	1	1	0	1
77013	1	23	6	17
83339	1	1	0	1
57741	1	7	3	4
80842	1	3	1	2
77430	6	76	12	64
69295	5	26	3	23
97702	5	156	76	80
82071	4	71	15	56
92943	3	104	55	49
78160	3	4	0	4
79383	2	5	0	5
61428	3	59	23	36
68404	3	98	65	33
56679	2	18	1	17
80961	4	83	32	51
85017	4	112	51	61
84499	3	11	3	8
99306	2	99	42	57
86465	2	29	17	12
58274	2	12	6	6
84220	2	3	0	3
78694	2	3	0	3
85595	2	88	44	44
59449	4	79	23	56
70348	3	26	0	26
94558	3	46	15	31
69558	2	48	25	23
63047	1	28	9	19
93127	1	197	39	158
84342	1	126	34	92
88633	1	189	46	143
96731	1	82	29	53
71117	1	54	26	28
85876	1	60	24	36
91089	1	6	2	4
75012	1	6	2	4
89693	1	17	2	15
60081	1	29	3	26
79129	1	6	1	5
94800	1	4	1	3
78234	1	13	3	10
89648	1	18	6	12
68899	1	45	21	24
67800	1	209	127	82
85835	1	17	8	9
94436	1	89	40	49
76094	1	4	0	4
78759	1	3	1	2
56061	1	2	0	2
57413	1	13	11	2
84625	1	4	2	2
84657	1	5	3	2
78074	1	18	12	6
81688	1	71	42	29
80423	1	58	23	35
96594	1	2	1	1
86135	1	1	0	1
64963	1	3	1	2
98158	1	4	1	3
93683	1	2	0	2
98092	1	64	31	33
60750	1	24	11	13
63210	1	6	2	4
66077	1	12	3	9
61315	1	1	0	1
55775	1	8	2	6
73261	1	3	0	3
91854	1	8	2	6
81885	1	2	0	2
20045	1	3	0	3
20248	1	3	0	3
34287	1	8	2	6
99885	4	8	3	5
66853	2	63	9	54
91051	2	110	72	38
78928	2	61	36	25
58194	3	74	45	29
59964	3	6	1	5
61743	2	189	99	90
68730	2	36	12	24
96561	2	126	65	61
73747	4	96	39	57
94916	3	24	8	16
56087	2	42	18	24
95973	2	6	0	6
51531	1	618	370	248
64631	1	244	94	150
89189	1	33	7	26
83718	1	9	1	8
99864	1	23	2	21
97466	1	39	14	25
65970	1	22	3	19
82021	1	11	2	9
84017	1	6	2	4
86637	1	7	1	6
94005	1	33	16	17
79916	1	3	0	3
76466	1	109	62	47
90936	1	29	12	17
56686	1	9	3	6
80965	1	108	84	24
57386	1	1	0	1
81530	1	2	0	2
92940	1	2	0	2
61627	1	102	70	32
62262	1	7	2	5
77644	1	1	0	1
64792	1	1	0	1
92436	1	4	0	4
75066	1	6	2	4
81395	1	2	0	2
89088	1	20	7	13
68893	1	29	16	13
91573	1	16	5	11
69303	1	5	3	2
61018	1	98	52	46
85891	1	2	0	2
53098	1	2	0	2
71820	1	3	1	2
62096	1	4	1	3
79697	1	3	0	3
99842	1	3	1	2
61940	1	6	2	4
96423	1	1	0	1
79443	1	2	0	2
56139	1	2	0	2
85554	1	2	0	2
69387	1	2	0	2
57541	1	3	0	3
58460	1	5	0	5
71420	1	3	0	3
92308	1	1	0	1
72383	1	1	0	1
89796	1	1	0	1
74437	1	1	0	1
79216	1	1	0	1
61562	1	2	0	2
56540	1	3	1	2
55807	1	4	0	4
69594	3	27	5	22
95779	3	67	18	49
58857	3	13	5	8
56734	3	42	16	26
89352	2	47	12	35
89773	3	137	45	92
75417	3	97	38	59
96420	2	151	74	77
87011	2	6	1	5
76405	2	10	2	8
66298	2	28	3	25
62266	2	57	33	24
89036	3	31	2	29
97232	3	161	120	41
63932	3	4	0	4
43397	2	57	14	43
19498	2	40	8	32
63764	2	20	6	14
82828	2	84	37	47
57876	2	114	57	57
95721	2	92	40	52
81860	1	229	138	91
94389	1	29	11	18
61273	1	12	2	10
75245	1	5	1	4
91571	1	4	1	3
91294	1	6	0	6
81855	1	63	17	46
78579	1	67	24	43
63500	1	11	5	6
81607	1	82	31	51
64009	1	20	7	13
90048	1	6	2	4
63620	1	6	1	5
87076	1	58	9	49
85954	1	25	1	24
98197	1	11	4	7
80381	1	26	10	16
62890	1	15	6	9
73918	1	12	6	6
75795	1	14	5	9
62069	1	19	10	9
75591	1	11	4	7
81574	1	19	8	11
89023	1	19	4	15
65317	1	8	2	6
86948	1	7	1	6
84968	1	10	1	9
58404	1	22	13	9
86085	1	10	4	6
71715	1	2	0	2
94478	1	3	0	3
77594	1	2	0	2
90815	1	4	0	4
63802	1	12	0	12
84663	1	11	0	11
91367	1	17	3	14
83218	1	2	0	2
91086	1	6	0	6
97074	1	6	1	5
92452	1	13	4	9
82782	1	11	3	8
95403	1	2	0	2
90044	1	10	1	9
88847	1	2	0	2
58129	1	6	2	4
81796	1	2	0	2
72839	1	2	0	2
94286	1	7	3	4
53999	1	4	0	4
80957	1	2	0	2
68436	1	1	0	1
77105	1	3	1	2
60428	1	2	0	2
70490	1	23	4	19
73923	1	5	0	5
90187	1	3	0	3
62951	1	29	7	22
92963	1	4	0	4
72537	1	5	0	5
56346	1	3	0	3
74899	1	14	5	9
81597	1	9	4	5
82077	1	4	0	4
61719	1	4	0	4
99620	1	3	0	3
85237	1	2	0	2
60556	1	4	0	4
98173	1	6	0	6
25670	1	2	0	2
30374	1	1	0	1
72455	3	43	6	37
95429	3	43	10	33
69579	2	33	12	21
90812	1	127	47	80
97866	1	26	2	24
85506	1	62	4	58
60541	1	2	0	2
71824	1	49	7	42
68988	1	82	49	33
97639	1	69	29	40
97098	1	6	2	4
75996	1	8	1	7
77294	1	21	6	15
64309	1	28	12	16
58122	1	60	45	15
65896	1	8	2	6
64333	1	33	12	21
83151	1	5	2	3
95483	1	3	1	2
65438	1	2	0	2
69655	1	2	0	2
78536	1	2	0	2
63964	1	3	1	2
59541	1	24	10	14
66621	1	3	1	2
56125	1	55	41	14
91558	1	3	1	2
78131	1	17	6	11
90490	1	64	36	28
56258	1	1	0	1
75472	1	1	0	1
77267	1	1	0	1
66771	1	49	31	18
96682	1	2	1	1
91141	1	11	7	4
87678	1	20	17	3
85216	1	4	1	3
69008	4	17	6	11
71208	3	16	7	9
56647	2	92	28	64
80163	2	120	50	70
88714	2	80	26	54
76093	2	308	219	89
94630	2	7	0	7
82160	2	19	6	13
74208	2	41	11	30
83482	2	112	63	49
86571	2	64	23	41
82785	2	73	25	48
64818	1	64	19	45
91863	1	7	0	7
86625	1	74	27	47
80327	1	2	0	2
72975	1	3	0	3
80598	1	6	0	6
56871	1	40	13	27
88770	1	3	0	3
60404	1	4	0	4
77270	1	11	2	9
91192	1	28	13	15
99024	1	59	33	26
92143	1	99	57	42
58020	1	11	2	9
79195	1	172	102	70
71255	1	22	6	16
72416	2	45	7	38
60475	2	44	3	41
98238	2	110	43	67
64700	2	16	8	8
70011	2	15	6	9
86582	2	17	2	15
72331	2	51	17	34
52229	1	398	240	158
72661	1	18	4	14
83071	1	4	0	4
74507	1	14	6	8
93629	1	60	27	33
70464	1	111	53	58
83567	1	129	74	55
58638	1	7	3	4
56193	1	17	10	7
89019	1	1	0	1
69198	1	13	2	11
94179	1	77	47	30
90405	1	3	0	3
76831	1	161	107	54
67632	1	14	2	12
82207	2	81	45	36
93574	1	29	6	23
69480	1	31	14	17
73433	1	117	47	70
87745	1	55	7	48
64377	1	49	11	38
73269	1	67	20	47
68483	1	8	0	8
99547	1	10	0	10
88401	1	58	22	36
69094	1	20	2	18
82569	1	86	17	69
61503	1	16	4	12
98767	1	48	9	39
60632	1	120	57	63
80943	1	3	0	3
95734	1	20	0	20
70175	1	173	102	71
83918	1	23	3	20
80085	1	36	3	33
59674	1	28	2	26
62523	1	3	0	3
56440	1	6	0	6
91574	1	12	3	9
74244	1	4	0	4
92268	1	16	0	16
65682	1	77	35	42
59989	1	4	0	4
71141	1	19	7	12
67493	1	11	3	8
64153	1	6	0	6
59451	1	4	0	4
87524	1	6	1	5
80648	1	9	3	6
83946	1	33	10	23
94819	1	15	0	15
57155	1	5	1	4
90970	1	19	6	13
97671	1	102	60	42
74126	1	5	0	5
74201	1	27	9	18
77710	1	74	49	25
89925	1	6	1	5
79370	1	2	0	2
66642	1	2	0	2
72561	1	102	58	44
78642	1	34	17	17
83463	1	101	60	41
91789	1	4	1	3
84282	1	124	82	42
88002	1	122	85	37
70901	1	1	0	1
91221	1	1	0	1
68324	1	2	0	2
60481	1	2	0	2
76540	1	2	0	2
69324	1	2	0	2
60109	1	2	0	2
63064	1	9	5	4
96841	1	2	0	2
81276	1	2	0	2
93721	1	1	0	1
91946	1	2	0	2
56713	1	2	0	2
77342	1	17	4	13
83143	1	2	0	2
88215	1	14	3	11
71911	1	25	7	18
65715	1	44	12	32
78616	1	13	0	13
82919	1	15	2	13
74314	1	2	0	2
73984	1	1	0	1
67469	1	1	0	1
97773	1	2	0	2
80682	1	3	0	3
99722	1	3	0	3
85308	1	1	0	1
99973	1	2	0	2
99349	1	2	0	2
75562	1	1	0	1
94376	1	2	0	2
90806	1	10	4	6
74504	1	3	0	3
73615	1	30	8	22
61732	1	12	0	12
90778	1	60	26	34
86084	1	93	31	62
84442	1	118	25	93
12761	1	62	11	51
80726	1	25	2	23
84276	1	23	5	18
78756	1	26	3	23
76226	1	12	1	11
56559	1	35	1	34
91465	1	29	0	29
70825	1	53	19	34
62484	1	10	0	10
93978	1	46	7	39
64076	1	65	23	42
72408	1	15	1	14
80316	1	26	3	23
86707	1	93	60	33
59717	1	110	43	67
79186	1	133	91	42
79148	1	3	0	3
97045	1	24	4	20
97471	1	9	2	7
94172	1	5	0	5
95829	1	7	0	7
99639	1	8	2	6
98752	1	1	0	1
82683	1	183	87	96
68763	1	27	9	18
93996	1	15	4	11
\.


--
-- Data for Name: player_prize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_prize (member_id, year_prize, total_prize) FROM stdin;
25831	210695	1826154.5
95661	130590	693182.5
62063	77610	200180
64032	125620	266726.06
57945	63860	632972.5
76115	21305	178323.75
34810	29285	987419.12
83950	63320	254913.5
73442	57595	421588
95476	145525	178832.5
85394	44025	253646.25
77427	13450	129267.5
45171	46275	360057.87
57823	32820	203078.87
91554	59200	531687.75
81561	30120	358042.25
94780	28445	173761
71408	42780	96993
68870	53730	213901.25
93627	19790	578451.25
81362	21785	45878.5
62855	10755	185831.5
95930	10785	113825
61628	22015	105178.75
63122	12905	41805
77042	30205	70926
86114	27195	57642.5
72885	13690	45893.75
87375	12695	233537.25
92508	11120	115588.75
69093	25035	35490
85095	8415	35258
59322	7195	15226.71
52953	4495	42231.94
58963	1250	71707.5
97030	16290	20515
94397	9390	11148
97174	21105	58993
94580	3115	10280
76973	1320	76019
92796	3055	25253
65580	2590	88701
61423	3860	10030
62720	1665	19882
53753	5785	293059.1
77848	5081.25	10257.43
69006	8400	12558.5
59543	3605	20362.5
54897	300	35964.24
86672	2596.25	6696.25
92655	1390	12785.5
52864	5850	121398.37
68317	4207.5	17504
84838	4695	22621
81887	4820	88507.5
71221	1575	12581.9
74579	0	1970
96429	1670	25786.35
74076	2780	10702.5
89785	6395	1304947.12
77003	1035	165916
70399	3820	5745
83938	1460	13230
59420	1120	32656.25
91673	9750	13031
68392	4500	6575
20808	367.5	9942
86470	450	2710
62018	530	5222.5
83985	0	9539.5
80062	1275	10152.5
42776	1995	119125
78890	575	14807.62
87117	622.5	33585.62
98595	2090	2365
91651	472.5	5370
64081	3090	3142.5
57924	3322.5	5865
91814	500	2112.5
83597	52.5	1535
62286	550	3622.5
79164	105	3244.5
69253	0	1335
86230	546.25	1198.75
82606	52.5	2861.25
95425	0	2985.86
58639	290	1707.5
64648	725	1235
57762	9175	34380
57297	1590	8864.5
64794	0	4180
62615	192.5	845
82989	52.5	2298.12
93791	0	28317.49
14587	952.5	369238.5
58089	1040	1235
91853	90	830
79110	472.5	3606.25
46776	0	11739.35
58328	600	2267.5
14251	0	63936.37
89506	420	23863.99
52968	0	123693
56274	0	12095.61
60427	0	630
58670	52.5	2493.25
51998	0	100
94104	0	0
64839	0	5550.75
73966	87.5	1677.5
64561	0	1340.51
95952	1260	4803.12
79662	150	4528.74
64666	532.5	817.5
87691	100	1697.5
83657	90	3907.5
76994	0	8440.62
91254	0	20003.07
75283	427.5	707.5
86887	420	1070
79047	217.5	781
75575	87.5	460
59077	90	660
69345	765	1533.25
68819	204.37	2307.37
85563	0	0
84815	341.25	10697.25
65788	177.5	558.75
87029	500	500
90657	0	8247.5
92816	2620	2995
68718	787.5	70657.5
75763	0	0
93101	300	10377.9
79686	356.25	446.25
89814	52.5	1197.5
72466	28.2	5708.95
89309	265	312.5
95439	52.5	2647.5
61819	0	5877.18
95489	0	3891.75
90360	0	500
65634	825	877.5
85118	0	250
59702	0	60
80886	52.5	418.5
71797	0	853.12
69537	52.5	1699.87
67447	0	0
77792	28.2	170.2
85845	0	155.8
96339	0	0
88711	0	1241.25
92542	0	1882.5
87610	200	463.12
78590	150	817.5
98728	0	0
70824	1125	1633.12
89595	131.25	617.25
90111	0	0
78948	1060.07	1790.07
98462	517.5	517.5
58628	0	6087.25
60967	0	28585.62
69712	217.5	300
72555	300	2835
70442	0	1590
68647	450	6693.5
67251	0	840.62
77143	352.5	9287.5
78856	0	52.5
82372	142.5	1023.8
94151	0	400
92114	0	1015
62932	0	2095
63846	393.75	2030.07
56243	0	0
58631	100	200
74987	430	5460
85956	0	9182.5
78400	52.5	652.5
92160	0	467.5
64179	52.5	22132.74
61453	0	335.62
91665	0	37091.25
99895	0	324.25
81655	60	2668
69756	307.5	980
53944	735	156440
94426	0	0
98896	0	267.5
80369	52.5	886.25
73886	0	1151.5
55942	0	0
96545	0	17532.75
81106	0	2075
68316	0	17.5
54346	0	536326.37
74008	0	0
75539	90	197.5
81430	0	270
83865	0	120
94119	622.5	622.5
73177	0	0
87811	720	720
84764	0	232.5
85790	0	4283.74
60676	52.5	212.5
67660	0	1035
61916	0	487.5
70383	0	373.5
97243	0	137.5
69875	0	0
79256	0	0
81906	597.5	784.5
57460	0	135
96461	0	12305.37
99466	0	540.62
80189	0	796
86866	0	0
62933	90	1540
75565	0	357.5
79943	0	337.5
73671	0	650
57322	0	0
69037	0	90
63069	431.25	618.75
69521	0	140.25
99294	0	790
58521	0	0
75657	0	0
83265	0	0
60145	0	0
60771	0	17.5
97959	720	11207.5
94332	105	105
86975	52.5	937.5
93848	0	131.25
70219	28.2	857.97
70141	0	0
65081	975	1062.5
97018	52.5	52.5
69529	0	15
93539	0	484.38
94727	0	17.5
85735	0	0
69960	0	0
97943	0	4121.25
66193	0	0
25925	0	87243.5
87857	0	137
55024	0	127.5
57758	0	0
68262	0	0
55838	0	189.06
85472	0	8265
82952	0	225
86104	0	1345.69
83155	0	362.5
64890	0	630
57406	0	0
92533	0	63
63145	0	17.5
57543	0	262.5
63170	0	0
89163	175	205
81643	0	5786
89424	4560	4560
91004	0	60
68934	0	262.5
68727	0	0
81765	0	100
81101	52.5	133.2
98305	0	262.5
78169	0	0
14107	0	203732.75
91710	0	0
77614	0	0
84263	0	270
74420	0	17.5
90130	0	5210.4
86616	0	0
85281	0	0
75014	0	0
64933	131.25	97891.25
83385	0	140.62
77846	0	0
75079	0	260
99595	0	2461.5
79604	0	103.2
93776	0	502.5
60649	0	2797.5
67753	0	416.62
98838	0	87.5
64768	0	87.5
88961	0	0
93670	0	627.5
85224	0	0
97345	720	720
86521	150	240
89268	0	0
92003	0	0
57594	0	1055
81466	0	0
99187	0	242.5
93857	0	3746.5
83212	0	210
93913	0	0
59490	0	0
71877	0	52.5
89890	0	0
76817	0	0
62699	0	37.5
64512	0	0
98248	0	0
76618	0	980
82670	0	6117.5
93370	0	258.5
90978	0	181.25
78891	0	450
88298	0	260.63
60710	0	0
69306	0	0
88165	0	0
66694	0	2616.87
95516	595	595
86723	0	0
80203	0	940
72215	0	82.51
95561	0	0
71954	0	52.5
99672	0	8468.5
99580	0	52.5
91894	0	0
55949	0	4136.86
82483	0	30
50387	0	120
14004	0	19442
68845	105	2059.49
78209	0	908
83243	0	3537
68139	0	8422.5
91347	0	52.5
88096	0	250
66522	0	0
55836	0	0
86567	112.5	112.5
66041	0	0
58309	0	47
55280	0	162590.62
88013	0	91.97
59695	0	380
62395	105	105
51123	0	87.5
72674	0	563.25
58349	0	0
85385	52.5	142.5
93602	725	987.5
68697	720	2201.25
88856	0	2115.62
69243	0	0
64088	0	0
86445	0	0
57963	0	0
81297	0	0
64001	0	80.7
50864	0	0
95480	0	0
59967	0	403.12
59614	0	17.5
59445	0	167
65546	0	0
83581	0	0
57490	0	0
69770	0	0
65648	0	381.5
63973	300	300
72503	0	30
92000	0	0
59956	0	0
90927	0	0
90593	0	352.81
98589	0	1402.5
61988	0	52.5
87999	0	0
90269	0	0
89587	0	262.5
90396	0	160
71959	0	0
58913	0	283.5
87274	0	262.5
79759	0	0
58402	60	935.93
59697	0	0
98750	0	0
61797	0	21820
56428	0	0
66626	0	0
75260	0	90
79176	0	63.77
67561	0	0
82875	0	0
75537	0	0
86109	0	0
76972	0	1540
97290	0	0
88283	0	0
73768	0	60
70050	159.5	159.5
98859	0	1537.5
26459	0	771.24
58125	0	17.5
88046	0	912.5
60582	0	0
57236	0	0
87484	52.5	52.5
58155	0	0
29449	0	90528.12
63140	112.5	112.5
90973	0	1556.23
99172	0	0
88128	0	0
57334	0	270.5
67825	0	0
80545	0	87.5
82961	0	228.63
63135	0	15
61064	0	0
79629	0	0
68019	0	0
72513	0	281.24
72988	0	54.37
59921	0	0
81642	0	28.12
98831	420	420
99703	0	0
88595	0	0
64119	0	0
64223	0	0
66489	0	0
82239	0	63
92024	0	0
65622	0	0
93924	0	0
80475	0	150
80839	0	0
89690	0	1285
63750	0	0
84817	0	0
96616	0	0
57887	0	0
61970	0	0
86077	0	0
57588	0	0
67848	0	0
67508	0	140
73422	0	87.5
64011	0	0
70121	0	52.5
96085	0	0
64730	0	60
99000	0	0
87688	0	0
75929	0	0
61880	0	0
73490	0	0
59157	0	0
95954	0	0
75550	0	60
64670	0	0
80259	0	905.37
93399	0	0
95766	0	250
62917	0	0
96669	0	544.82
67852	0	220
72200	175	175
89757	0	0
59955	0	0
87934	0	35
78781	0	0
90878	0	87.5
73690	0	0
66224	0	0
92174	0	0
82757	0	0
72275	0	0
83315	0	1215.62
85964	0	47
95479	0	0
75511	0	140.62
94680	0	0
70504	0	0
64613	0	17.5
92103	0	0
75713	0	0
98737	0	0
60722	0	0
70753	0	0
83290	0	150
83999	0	0
66421	0	0
85277	0	585
78625	0	0
57382	0	0
58873	0	0
61720	0	0
70896	0	0
58566	175	280
60379	0	0
82080	0	0
92846	52.5	52.5
56939	175	175
96955	175	175
75584	106.87	106.87
24589	52.5	52.5
83039	0	0
73970	0	0
74160	0	0
84648	0	140.62
78102	0	0
85854	0	100
58835	0	0
79835	0	0
76398	0	0
97497	0	52.5
54991	0	0
63054	0	0
82585	0	0
56936	0	9.4
93868	0	0
76496	0	200
82093	0	0
71843	0	0
61780	0	0
90459	0	3702.79
60733	0	171.24
64674	0	60
96008	0	0
99734	0	75
96016	0	0
77935	0	0
81321	94	94
88523	0	24925.6
88529	0	100
56463	0	0
72361	0	140.62
78535	0	17.5
61868	0	262.5
15788	0	0
85882	0	0
79984	0	0
66356	0	0
62551	0	0
32769	0	0
41481	0	0
23461	0	0
24963	0	0
74534	0	0
72161	0	246
81874	0	150
81195	0	0
74639	0	0
59181	0	0
76678	0	60
60449	0	35
63076	0	0
62012	0	0
89982	0	0
94966	0	140.62
99461	0	200
71084	0	0
75326	0	0
92049	0	87.5
98798	0	0
55573	0	0
73815	0	0
66802	0	0
56930	0	0
93739	0	0
67237	0	245.01
75005	0	2430.25
56821	0	0
66003	0	0
56028	0	0
70044	0	0
68290	0	150
75385	0	0
74079	0	140.62
59918	0	0
92119	0	0
99105	0	0
79144	0	0
68394	28.2	28.2
78729	0	0
80166	0	0
99908	0	0
84561	0	0
74084	0	0
83883	0	0
94649	0	0
62643	0	0
77902	0	0
73930	0	0
84783	0	0
68050	0	1390.62
95957	0	0
91432	0	0
98955	0	0
64078	0	0
65384	0	0
68446	0	0
56095	0	0
98624	0	0
64041	0	60
80172	0	0
64546	0	0
74452	0	0
74264	28.2	28.2
88338	0	0
85218	0	0
98455	0	0
56611	0	0
59325	0	0
60496	0	0
76977	0	180
83742	0	0
82517	0	0
88755	0	0
98443	0	0
77349	0	113.9
66071	0	1539
96242	0	26.88
65183	0	660.62
88938	0	0
75861	0	142.5
59257	0	0
77864	0	75
59400	0	103.12
91027	0	0
76865	0	0
64123	0	75
55886	0	0
73355	0	0
78598	0	0
83231	0	72
67920	0	0
67875	0	0
81214	0	0
92204	0	0
96653	0	0
76217	0	190
63171	0	0
76441	0	0
60543	0	0
60321	0	17.5
86018	0	0
66018	0	0
85930	0	0
72260	0	0
77842	0	0
98782	0	0
85817	0	0
68322	0	0
45514	0	0
13548	0	0
61504	105	105
34170	0	0
60721	0	75
94882	0	35
65893	0	0
6493	0	0
61382	0	0
80159	0	0
83383	0	0
80698	0	0
99014	0	0
62731	0	0
90321	0	0
61331	0	0
72114	0	543.75
84679	0	0
75049	300	837.5
59910	0	0
92698	0	0
64537	0	0
61951	0	140.62
66104	0	0
66862	0	0
57182	0	0
92551	0	0
83368	0	0
53929	0	0
57319	28.2	132.95
61494	0	37.6
98016	0	0
78015	0	0
58119	0	0
98860	0	47
74364	0	0
97160	0	0
78108	0	0
90511	0	0
93205	0	1386.24
95709	0	0
95654	0	0
97624	0	0
77830	0	0
77559	0	0
77163	300	2065.12
64454	0	9.4
83896	0	24
76838	0	0
78198	0	360
60744	0	0
79119	0	0
58715	0	0
77551	0	1767.49
63969	0	0
58227	0	0
70381	0	1565.62
81924	0	0
59321	28.2	28.2
86964	0	0
80879	0	0
81329	0	0
59241	0	158.74
63811	0	0
95021	0	0
28998	0	0
36690	0	0
98304	0	0
82700	0	94
92068	0	0
89898	0	0
37111	0	0
79521	0	0
80660	0	1761.96
79377	0	0
64859	0	0
95468	0	0
86155	0	0
63643	0	0
89692	0	0
86526	0	0
97153	0	0
79081	0	0
94963	0	0
71758	0	0
63063	0	0
93177	0	0
93676	0	121.92
59356	0	9.4
91864	0	9.4
93294	0	0
95760	0	0
66798	0	299.36
74118	0	26.25
64141	0	0
63148	0	90.62
5083	0	0
81788	0	0
93952	0	0
59796	0	140.62
86086	0	0
55858	0	0
91097	0	65.8
76332	0	0
83092	0	0
62927	0	0
57478	0	0
77460	0	0
53351	0	0
68473	0	0
66079	0	0
72923	0	1326.61
89815	0	0
74310	0	0
57590	0	0
68083	0	0
86169	0	0
98776	0	0
75185	0	0
69107	0	0
55661	0	140.62
75158	0	0
78096	0	0
68294	0	0
71659	0	0
67405	0	0
57863	0	0
69016	0	0
81363	0	0
81792	0	0
81300	0	0
66655	0	0
89186	0	0
81962	0	0
85212	0	0
94173	0	0
68279	0	0
93072	0	0
78931	0	0
96974	0	0
85839	0	0
93302	0	0
11311	0	0
72037	0	0
70220	0	0
88947	0	0
97265	0	0
57562	0	200
62864	0	1567.48
59658	0	450
70291	0	139
74462	0	0
58689	0	0
99109	0	0
79517	0	0
69164	0	0
68039	0	0
93213	0	0
56178	0	0
79090	0	0
86452	0	0
64812	0	0
92650	0	0
73141	0	36.25
76702	0	0
71248	0	574.98
96232	0	0
85309	0	9.4
72986	693.75	2335.07
61465	0	0
85582	0	0
87234	0	100
58534	0	0
82265	0	0
72439	0	0
88596	0	0
69532	0	0
75852	0	0
90776	0	60
70129	0	0
63556	0	0
98726	0	0
86160	0	0
68393	0	0
82987	0	0
95459	0	0
99168	0	0
89799	0	0
86450	0	0
77927	0	0
79023	0	0
65554	0	0
65734	0	0
99738	0	0
82054	0	0
65055	0	0
74915	0	0
94087	0	0
75440	0	0
84666	0	1217.49
79116	0	0
61574	0	0
63791	0	0
73799	0	0
65857	0	75
56114	0	0
72955	0	0
56566	0	0
68388	0	0
79757	0	0
77759	0	0
71340	0	0
88691	0	0
83274	0	0
82213	0	0
60664	0	0
99710	0	0
71501	0	0
93544	0	0
16451	0	0
83606	0	0
55335	0	80.62
59705	0	35
93901	0	0
73890	0	0
60553	0	144.37
80613	0	0
84166	0	0
95674	0	0
60832	0	0
65499	0	0
88075	0	0
57599	0	0
84412	0	0
99140	0	0
84106	0	0
70870	0	0
65678	0	0
88026	0	252
70720	0	0
89412	0	0
91996	0	0
57177	0	0
75878	0	0
57453	0	0
69468	0	0
63563	0	0
78310	0	0
92514	0	0
96790	0	0
86564	28.2	28.2
92875	0	0
85813	0	0
68954	0	0
58493	679.37	2811.24
85366	0	1180
99811	0	0
56882	0	0
55750	0	47
67693	0	0
89325	0	0
87411	0	37.5
98395	0	35
91438	0	0
58607	0	0
78807	0	0
69820	0	0
99121	0	0
87209	0	0
90754	0	0
67055	0	380.01
42403	0	0
53845	0	349.48
76170	0	2559.47
86996	0	0
14201	0	5.62
96755	0	338.25
88148	0	350
72695	0	0
93554	0	285.04
80675	0	221.83
91102	0	320.95
92430	0	0
95506	0	437.62
91101	0	393.74
82767	0	0
86116	0	0
11093	0	0
78666	0	0
71225	0	0
88849	28.2	28.2
65927	0	0
75559	0	90.62
68156	28.2	75.2
69588	28.2	515.82
88566	28.2	28.2
75586	0	0
76250	0	100.8
94974	0	0
56646	0	0
55023	0	0
87742	0	0
71446	0	0
63997	0	0
69491	0	0
69088	0	0
94624	0	75.2
55868	0	0
50098	0	0
55701	0	0
66713	0	0
96089	0	0
50320	0	0
61004	0	0
82924	0	0
64171	0	0
87913	0	0
76591	0	0
56782	0	0
71840	0	0
68857	0	0
99300	28.2	28.2
91172	0	0
66010	0	0
97955	0	0
74911	0	0
98006	0	0
94377	0	0
90967	0	0
97759	0	0
58659	0	0
63995	0	0
97445	0	0
83357	0	0
72035	0	0
81034	54.37	54.37
89147	0	0
29783	0	0
93882	0	0
64159	0	0
95212	0	54.37
74728	0	0
79938	0	28.12
74260	0	0
62696	0	0
65164	0	0
60946	0	0
73346	0	0
62126	0	0
88028	0	28.12
77688	0	75
59977	0	0
84030	0	0
57668	0	0
71851	0	112.5
97019	0	0
68046	0	0
70621	0	0
60535	0	0
97840	0	0
83759	0	0
70040	0	0
78249	0	0
81111	0	0
80469	0	0
70277	0	0
62053	0	0
73025	0	0
85855	0	0
60776	0	115.05
61686	0	18.8
67490	0	0
86971	0	0
65484	0	0
82092	0	0
58018	0	0
99538	0	0
94388	0	0
90479	0	0
79328	0	0
95080	0	0
79058	0	0
89385	0	0
92065	0	0
50006	0	0
65760	0	0
76440	0	0
98660	0	0
89553	0	0
77773	0	0
66343	0	0
79671	0	0
66747	0	0
86022	0	0
97551	0	0
79290	0	0
72982	0	0
83477	0	0
90781	0	0
71956	0	0
65418	0	0
86833	0	0
94243	0	0
75665	0	0
66842	0	0
86245	0	0
67702	0	0
75527	0	0
58912	0	0
87695	0	0
53129	0	0
42640	0	0
56027	0	0
50025	0	0
98680	0	0
94252	0	0
97220	0	0
61630	0	0
56112	0	0
86501	0	35
88756	0	0
89132	0	0
73231	0	0
74259	0	0
71492	0	0
66821	0	0
83323	0	0
93479	0	0
91154	0	87.5
79362	0	0
81656	0	0
87463	0	0
59795	0	0
99427	0	0
59340	0	0
66402	0	0
57421	0	0
75948	0	0
68565	0	0
63959	0	0
95028	0	0
74744	0	0
78221	0	0
97974	28.2	28.2
90031	0	0
79387	0	0
57484	0	0
98198	0	0
69996	0	0
79941	0	0
69615	0	0
56250	0	0
92033	0	28.12
71809	0	0
70317	0	0
77957	0	0
55956	0	0
68414	0	0
93877	0	0
72684	0	0
99954	0	481.25
72430	225	500
76059	0	0
62698	0	0
87478	0	0
84469	0	0
69797	0	0
71295	0	0
81091	0	0
95418	0	0
85825	0	0
75729	0	0
98845	0	0
98180	0	11.25
69814	0	1078.2
76331	0	0
74254	0	0
99670	0	0
65262	0	0
92511	0	0
63178	0	0
82907	0	563.12
56212	0	26.88
77921	0	0
64900	0	658.12
59407	0	0
87832	0	9.4
65590	0	0
88428	0	0
87790	0	0
57538	0	0
66088	0	0
98066	0	28.2
55748	0	0
67396	0	40
76669	0	0
67417	0	0
99157	0	0
92591	0	0
56306	0	0
84140	0	0
87282	0	54.37
62726	0	0
87436	0	0
70775	0	0
66075	0	0
62538	0	0
94220	0	0
89846	0	0
67891	0	0
60581	0	0
65879	0	0
85344	0	0
66578	0	0
90020	0	0
93019	0	0
87085	0	0
88119	0	0
92236	0	0
94576	0	0
24470	0	3516.97
93747	0	0
61017	0	143.12
55665	0	0
58280	0	122.2
65936	0	120
87426	0	0
81433	0	0
58314	0	0
82926	0	0
95968	0	0
80048	0	0
73284	0	0
60929	0	0
73493	0	0
83774	0	0
62351	0	0
76501	0	0
97379	0	0
83003	0	0
82018	0	0
91514	0	0
77013	0	0
83339	0	0
57741	28.2	28.2
80842	0	0
77430	0	0
69295	0	0
97702	0	0
82071	0	0
92943	0	0
78160	0	0
79383	0	0
61428	0	0
68404	0	0
56679	0	0
80961	0	0
85017	0	0
84499	0	0
99306	0	1402.12
86465	0	0
58274	0	0
84220	0	0
78694	0	0
85595	0	0
59449	0	0
70348	0	0
94558	0	0
69558	0	0
63047	0	0
93127	0	591.51
84342	0	608.35
88633	0	1155.22
96731	0	0
71117	0	91.3
85876	0	71.25
91089	0	0
75012	0	0
89693	0	18.8
60081	0	92.65
79129	0	0
94800	0	0
78234	0	0
89648	0	37.6
68899	0	0
67800	0	0
85835	0	0
94436	0	0
76094	0	0
78759	0	0
56061	0	0
57413	0	0
84625	0	0
84657	0	0
78074	0	0
81688	0	0
80423	0	0
96594	0	0
86135	0	0
64963	0	0
98158	0	0
93683	0	0
98092	0	0
60750	0	0
63210	0	0
66077	0	0
61315	0	0
55775	0	0
73261	0	0
91854	0	0
81885	0	0
20045	0	0
20248	0	0
34287	0	0
99885	0	0
66853	0	0
91051	0	0
78928	0	0
58194	0	0
59964	0	0
61743	0	0
68730	0	0
96561	0	0
73747	0	0
94916	0	0
56087	0	0
95973	0	0
51531	0	19925.9
64631	0	800
89189	0	188.74
83718	0	0
99864	0	0
97466	0	0
65970	0	0
82021	0	0
84017	0	0
86637	0	0
94005	0	0
79916	0	0
76466	0	0
90936	0	0
56686	0	0
80965	0	0
57386	0	0
81530	0	0
92940	0	0
61627	0	0
62262	0	54.37
77644	0	0
64792	0	0
92436	0	0
75066	0	0
81395	0	0
89088	0	0
68893	0	0
91573	0	0
69303	0	52.5
61018	0	0
85891	0	0
53098	0	0
71820	0	9.4
62096	0	0
79697	0	0
99842	0	0
61940	0	0
96423	0	0
79443	0	0
56139	0	0
85554	0	0
69387	0	0
57541	0	0
58460	0	0
71420	0	0
92308	0	0
72383	0	0
89796	0	0
74437	0	0
79216	0	0
61562	0	0
56540	225	225
55807	0	0
69594	0	0
95779	0	0
58857	0	0
56734	0	0
89352	0	0
89773	0	0
75417	0	0
96420	0	0
87011	0	0
76405	0	0
66298	0	0
62266	0	0
89036	0	0
97232	0	0
63932	0	0
43397	0	0
19498	0	0
63764	0	0
82828	0	0
57876	0	0
95721	0	0
81860	0	5625
94389	0	381.36
61273	0	46.24
75245	0	0
91571	0	0
91294	0	0
81855	0	0
78579	0	0
63500	0	0
81607	0	0
64009	0	0
90048	0	0
63620	0	0
87076	0	0
85954	0	0
98197	28.2	337.7
80381	0	0
62890	0	0
73918	0	0
75795	0	0
62069	0	0
75591	0	0
81574	0	0
89023	0	0
65317	0	90.62
86948	0	0
84968	0	0
58404	0	0
86085	0	0
71715	0	0
94478	0	0
77594	0	0
90815	0	0
63802	0	0
84663	0	0
91367	0	0
83218	0	0
91086	0	0
97074	28.2	28.2
92452	0	0
82782	0	0
95403	0	0
90044	0	0
88847	0	0
58129	0	0
81796	0	0
72839	0	0
94286	0	0
53999	0	0
80957	0	0
68436	0	0
77105	0	0
60428	0	0
70490	0	0
73923	0	28.2
90187	0	0
62951	0	28.2
92963	0	0
72537	0	28.2
56346	0	28.2
74899	0	0
81597	0	0
82077	0	0
61719	0	0
99620	0	0
85237	0	0
60556	0	0
98173	0	0
25670	0	0
30374	0	0
72455	0	0
95429	0	0
69579	0	0
90812	0	0
97866	0	0
85506	0	0
60541	0	0
71824	0	0
68988	0	0
97639	0	0
97098	0	0
75996	0	0
77294	0	0
64309	0	0
58122	0	0
65896	0	0
64333	0	0
83151	0	0
95483	0	0
65438	0	0
69655	0	0
78536	0	0
63964	0	0
59541	0	0
66621	0	0
56125	0	0
91558	0	0
78131	0	0
90490	0	0
56258	0	0
75472	0	0
77267	0	0
66771	0	0
96682	0	0
91141	0	0
87678	0	0
85216	0	0
69008	0	0
71208	0	0
56647	0	0
80163	0	0
88714	0	0
76093	0	0
94630	0	0
82160	0	0
74208	0	0
83482	0	0
86571	0	0
82785	0	0
64818	0	0
91863	0	0
86625	0	0
80327	0	0
72975	0	0
80598	0	0
56871	0	0
88770	0	0
60404	0	0
77270	0	0
91192	0	0
99024	0	0
92143	0	0
58020	0	0
79195	0	0
71255	0	0
72416	0	0
60475	0	0
98238	0	0
64700	0	0
70011	0	0
86582	0	0
72331	0	0
52229	0	6316.12
72661	0	0
83071	0	0
74507	0	0
93629	0	0
70464	0	0
83567	0	0
58638	0	0
56193	0	0
89019	0	0
69198	0	0
94179	0	0
90405	0	0
76831	0	0
67632	0	0
82207	0	0
93574	0	0
69480	0	0
73433	0	0
87745	0	0
64377	0	0
73269	0	0
68483	0	0
99547	0	0
88401	0	0
69094	0	0
82569	0	0
61503	0	0
98767	0	0
60632	0	271.88
80943	0	0
95734	0	0
70175	0	0
83918	0	0
80085	0	0
59674	0	0
62523	0	0
56440	0	0
91574	0	0
74244	0	0
92268	0	0
65682	0	0
59989	0	0
71141	0	0
67493	0	0
64153	0	0
59451	0	0
87524	0	0
80648	0	0
83946	0	0
94819	0	0
57155	0	0
90970	0	0
97671	0	0
74126	0	0
74201	0	0
77710	0	0
89925	0	0
79370	0	0
66642	0	0
72561	0	0
78642	0	0
83463	0	0
91789	0	0
84282	0	0
88002	0	0
70901	0	0
91221	0	0
68324	0	0
60481	0	0
76540	0	0
69324	0	0
60109	0	0
63064	0	0
96841	0	0
81276	0	0
93721	0	0
91946	0	0
56713	0	0
77342	0	0
83143	0	0
88215	0	0
71911	0	0
65715	0	0
78616	0	0
82919	0	0
74314	0	0
73984	0	0
67469	0	0
97773	0	0
80682	0	0
99722	0	0
85308	0	0
99973	0	0
99349	0	0
75562	0	0
94376	0	0
90806	0	0
74504	0	0
73615	0	0
61732	0	0
90778	0	0
86084	0	0
84442	0	0
12761	0	0
80726	0	0
84276	0	0
78756	0	0
76226	0	0
56559	0	0
91465	0	0
70825	0	0
62484	0	0
93978	0	0
64076	0	0
72408	0	0
80316	0	0
86707	0	0
59717	0	0
79186	0	0
79148	0	0
97045	0	0
97471	0	0
94172	0	0
95829	0	0
99639	0	0
98752	0	0
82683	0	951.63
68763	0	0
93996	0	0
\.


--
-- Data for Name: player_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_rank (member_id, rank, points) FROM stdin;
25831	1	101205
95661	2	89811
62063	3	77015
64032	4	74898
57945	5	70554
76115	6	69882
34810	7	68627
83950	8	67677
73442	9	67541
95476	10	65538
85394	11	57947
77427	12	54790
45171	13	54522
57823	14	54271
91554	15	54040
81561	16	53156
94780	17	53074
71408	18	49744
68870	19	48701
93627	20	48033
81362	21	46000
62855	22	45889
95930	23	45748
61628	24	44497
63122	25	43036
77042	26	41950
86114	27	41870
72885	28	39711
87375	29	39520
92508	30	37214
69093	31	35110
85095	32	34769
59322	33	31370
52953	34	31304
58963	35	31294
97030	36	30940
94397	37	30180
97174	38	29657
94580	39	28600
76973	40	28465
92796	41	28280
65580	42	27839
61423	43	27760
62720	44	27660
53753	45	27160
77848	46	26611
69006	47	26480
59543	48	26470
54897	49	26372
86672	50	26040
92655	51	25851
52864	52	25830
68317	53	25470
84838	54	25448
81887	55	25330
71221	56	24613
74579	57	24400
96429	58	24210
74076	59	24120
89785	60	23860
77003	61	23320
70399	62	23238
83938	63	23050
59420	64	22590
91673	65	22377
68392	66	22320
20808	67	22058
86470	68	21921
62018	69	21370
83985	70	21305
80062	71	20560
42776	72	19550
78890	73	19130
87117	74	18990
98595	75	18560
91651	76	18490
64081	77	18440
57924	78	17900
91814	79	17450
83597	80	17278
62286	81	17103
79164	82	16680
69253	83	16592
86230	84	16270
82606	85	16046
95425	86	16040
58639	87	15510
64648	88	15340
57762	89	15150
57297	90	15040
64794	91	14960
62615	92	14950
82989	93	14936
93791	94	14780
14587	95	14730
58089	96	14350
91853	97	14200
79110	98	14140
46776	99	14139
58328	100	14088
14251	101	14080
89506	102	14040
52968	103	13770
56274	104	13723
60427	105	13597
58670	106	13330
51998	107	13290
94104	108	13270
64839	109	13201
73966	110	13180
64561	111	13050
95952	112	13020
79662	113	13012
64666	114	12990
87691	115	12965
83657	116	12950
76994	117	12930
91254	118	12840
75283	119	12810
86887	120	12790
79047	121	12570
75575	122	12560
59077	123	12420
69345	124	12400
68819	125	12380
85563	126	12346
84815	127	12290
65788	128	12240
87029	129	12170
90657	130	12150
92816	131	12110
68718	132	11900
75763	133	11852
93101	134	11740
79686	135	11587
89814	136	11390
72466	137	11336
89309	138	11240
95439	139	11090
61819	140	11062
95489	141	10980
90360	142	10910
65634	143	10700
85118	144	10680
59702	145	10600
80886	146	10470
71797	147	10385
69537	148	10360
67447	149	10324
77792	150	10264
85845	151	10232
96339	152	9980
88711	152	9980
92542	154	9930
87610	155	9860
78590	156	9850
98728	157	9651
70824	158	9530
89595	159	9473
90111	160	9430
78948	161	9410
98462	162	9400
58628	163	9400
60967	164	9370
69712	165	9130
72555	166	9110
70442	167	9003
68647	168	8970
67251	169	8920
77143	170	8900
78856	171	8900
82372	172	8830
94151	173	8730
92114	174	8610
62932	175	8500
63846	176	8432
56243	177	8310
58631	178	8180
74987	179	8160
85956	180	8130
78400	180	8130
92160	182	8120
64179	183	7980
61453	184	7940
91665	185	7870
99895	186	7850
81655	187	7790
69756	188	7780
53944	189	7730
94426	190	7682
98896	191	7670
80369	192	7670
73886	193	7670
55942	194	7655
96545	195	7630
81106	196	7590
68316	197	7580
54346	198	7370
74008	199	7330
75539	200	7330
81430	201	7280
83865	202	7240
94119	203	7220
73177	204	7210
87811	205	7200
84764	206	7180
85790	207	7170
60676	208	7070
67660	209	7060
61916	210	7049
70383	211	7030
97243	212	6960
69875	213	6910
79256	214	6790
81906	215	6750
57460	216	6710
96461	217	6640
99466	218	6620
80189	219	6535
86866	220	6520
62933	221	6520
75565	222	6500
79943	223	6500
73671	224	6479
57322	225	6430
69037	226	6410
63069	227	6280
69521	228	6230
99294	229	6220
58521	230	6198
75657	231	6170
83265	232	6075
60145	233	6070
60771	234	6030
97959	235	6010
94332	236	6002
86975	237	5960
93848	238	5960
70219	239	5750
70141	240	5750
65081	241	5730
97018	242	5720
69529	243	5690
93539	244	5630
94727	245	5620
85735	246	5610
69960	247	5590
97943	248	5586
66193	249	5530
25925	250	5520
87857	251	5460
55024	252	5442
57758	253	5380
68262	254	5340
55838	255	5338
85472	256	5310
82952	257	5280
86104	258	5240
83155	259	5200
64890	260	5190
57406	261	5160
92533	262	5160
63145	263	5140
57543	264	5100
63170	265	5100
89163	266	5100
81643	267	5070
89424	268	5040
91004	269	4990
68934	270	4980
68727	271	4970
81765	272	4956
81101	273	4910
98305	274	4905
78169	275	4880
14107	276	4840
91710	277	4830
77614	278	4780
84263	279	4770
74420	280	4740
90130	281	4730
86616	282	4727
85281	283	4650
75014	284	4640
64933	285	4640
83385	286	4620
77846	287	4618
75079	288	4570
99595	289	4570
79604	290	4540
93776	291	4520
60649	292	4490
67753	293	4480
98838	294	4470
64768	295	4390
88961	296	4370
93670	297	4340
85224	298	4330
97345	299	4310
86521	300	4290
89268	301	4290
92003	302	4260
57594	303	4250
81466	304	4190
99187	305	4177
93857	306	4170
83212	307	4140
93913	308	4110
59490	309	4090
71877	310	4080
89890	311	4060
76817	312	4030
62699	313	3960
64512	314	3930
98248	315	3880
76618	316	3860
82670	317	3840
93370	317	3840
90978	319	3790
78891	320	3780
88298	321	3690
60710	322	3690
69306	323	3670
88165	324	3670
66694	325	3640
95516	326	3630
86723	327	3610
80203	328	3600
72215	329	3560
95561	330	3540
71954	331	3540
99672	332	3490
99580	333	3470
91894	334	3440
55949	335	3411
82483	336	3410
50387	337	3370
14004	338	3370
68845	339	3360
78209	340	3360
83243	341	3330
68139	342	3310
91347	343	3290
88096	344	3280
66522	345	3280
55836	346	3260
86567	347	3210
66041	348	3200
58309	349	3200
55280	350	3200
88013	351	3120
59695	352	3120
62395	352	3120
51123	354	3110
72674	355	3110
58349	356	3060
85385	357	3060
93602	358	3040
68697	359	3030
88856	360	3020
69243	361	3010
64088	362	3006
86445	363	3000
57963	364	2990
81297	365	2960
64001	365	2960
50864	367	2890
95480	368	2880
59967	369	2870
59614	370	2800
59445	371	2790
65546	372	2751
83581	373	2750
57490	374	2750
69770	374	2750
65648	376	2720
63973	377	2710
72503	378	2690
92000	379	2670
59956	380	2630
90927	381	2600
90593	382	2600
98589	383	2585
61988	384	2580
87999	385	2571
90269	386	2550
89587	387	2530
90396	388	2490
71959	389	2480
58913	390	2470
87274	390	2470
79759	392	2460
58402	393	2450
59697	394	2450
98750	395	2440
61797	396	2440
56428	397	2410
66626	398	2395
75260	399	2370
79176	400	2360
67561	400	2360
82875	400	2360
75537	403	2350
86109	404	2350
76972	405	2350
97290	406	2348
88283	407	2290
73768	408	2290
70050	409	2260
98859	410	2250
26459	411	2240
58125	412	2240
88046	412	2240
60582	412	2240
57236	412	2240
87484	416	2230
58155	417	2220
29449	418	2220
63140	419	2210
90973	420	2210
99172	420	2210
88128	422	2200
57334	423	2200
67825	423	2200
80545	423	2200
82961	426	2200
63135	427	2190
61064	428	2190
79629	429	2190
68019	430	2180
72513	431	2160
72988	432	2143
59921	433	2130
81642	434	2120
98831	435	2110
99703	436	2100
88595	437	2100
64119	438	2090
64223	439	2090
66489	440	2060
82239	441	2053
92024	442	2050
65622	443	2040
93924	444	2030
80475	445	2020
80839	446	2010
89690	447	1987
63750	448	1940
84817	449	1940
96616	450	1940
57887	451	1930
61970	452	1920
86077	453	1904
57588	454	1900
67848	455	1880
67508	456	1880
73422	456	1880
64011	458	1860
70121	459	1860
96085	460	1850
64730	461	1850
99000	461	1850
87688	463	1840
75929	464	1840
61880	464	1840
73490	464	1840
59157	464	1840
95954	464	1840
75550	469	1830
64670	470	1810
80259	471	1800
93399	472	1790
95766	473	1790
62917	474	1790
96669	475	1770
67852	476	1760
72200	477	1760
89757	478	1740
59955	479	1730
87934	480	1730
78781	480	1730
90878	482	1730
73690	483	1726
66224	484	1710
92174	485	1700
82757	486	1680
72275	487	1667
83315	488	1660
85964	489	1650
95479	490	1650
75511	491	1650
94680	491	1650
70504	493	1640
64613	494	1640
92103	494	1640
75713	494	1640
98737	497	1610
60722	498	1610
70753	499	1600
83290	500	1600
83999	501	1580
66421	502	1580
85277	503	1580
78625	503	1580
57382	505	1560
58873	506	1520
61720	507	1520
70896	507	1520
58566	509	1520
60379	509	1520
82080	509	1520
92846	509	1520
56939	509	1520
96955	509	1520
75584	509	1520
24589	509	1520
83039	517	1510
73970	518	1490
74160	518	1490
84648	520	1470
78102	521	1470
85854	521	1470
58835	524	1460
79835	525	1450
76398	526	1440
97497	526	1440
54991	526	1440
63054	529	1430
82585	530	1410
56936	531	1400
93868	532	1390
76496	533	1390
82093	534	1380
71843	534	1380
61780	534	1380
90459	537	1370
60733	537	1370
64674	537	1370
96008	540	1350
99734	541	1349
96016	542	1340
77935	543	1320
81321	544	1300
88523	545	1300
88529	546	1290
56463	546	1290
72361	548	1290
78535	549	1280
61868	549	1280
15788	549	1280
85882	549	1280
79984	549	1280
66356	549	1280
62551	549	1280
32769	549	1280
41481	549	1280
23461	549	1280
24963	549	1280
74534	549	1280
72161	561	1270
81874	561	1270
81195	561	1270
74639	561	1270
59181	565	1260
76678	566	1260
60449	567	1250
63076	567	1250
62012	569	1230
89982	570	1230
94966	571	1230
99461	572	1220
71084	573	1210
75326	574	1210
92049	575	1190
98798	576	1180
55573	577	1170
73815	578	1170
66802	578	1170
56930	578	1170
93739	581	1160
67237	582	1150
75005	583	1150
56821	584	1150
66003	585	1140
56028	586	1130
70044	587	1120
68290	588	1120
75385	589	1110
74079	590	1100
59918	591	1100
92119	592	1090
99105	592	1090
79144	594	1080
68394	595	1070
78729	596	1060
80166	597	1060
99908	598	1050
84561	598	1050
74084	600	1050
83883	601	1050
94649	602	1040
62643	603	1040
77902	604	1037
73930	605	1030
84783	605	1030
68050	607	1030
95957	607	1030
91432	609	1020
98955	610	1020
64078	611	1020
65384	612	1010
68446	613	1000
56095	614	1000
98624	615	990
64041	615	990
80172	615	990
64546	618	960
74452	618	960
74264	618	960
88338	621	950
85218	622	950
98455	622	950
56611	622	950
59325	622	950
60496	626	940
76977	627	940
83742	628	940
82517	629	930
88755	630	921
98443	631	920
77349	632	920
66071	632	920
96242	632	920
65183	632	920
88938	632	920
75861	632	920
59257	632	920
77864	632	920
59400	632	920
91027	632	920
76865	632	920
64123	632	920
55886	632	920
73355	632	920
78598	632	920
83231	632	920
67920	632	920
67875	632	920
81214	632	920
92204	632	920
96653	632	920
76217	632	920
63171	632	920
76441	632	920
60543	632	920
60321	632	920
86018	632	920
66018	632	920
85930	632	920
72260	632	920
77842	632	920
98782	632	920
85817	632	920
68322	632	920
45514	632	920
13548	632	920
61504	632	920
34170	632	920
60721	670	910
94882	670	910
65893	670	910
6493	673	900
61382	673	900
80159	673	900
83383	673	900
80698	673	900
99014	673	900
62731	673	900
90321	680	890
61331	681	890
72114	682	890
84679	683	880
75049	684	870
59910	685	870
92698	686	870
64537	686	870
61951	686	870
66104	686	870
66862	686	870
57182	686	870
92551	686	870
83368	693	860
53929	694	860
57319	695	860
61494	696	840
98016	697	840
78015	698	829
58119	699	820
98860	700	820
74364	701	810
97160	702	810
78108	703	810
90511	704	810
93205	705	808
95709	706	800
95654	707	790
97624	708	770
77830	708	770
77559	710	770
77163	711	770
64454	712	760
83896	713	760
76838	713	760
78198	715	750
60744	716	740
79119	716	740
58715	718	730
77551	719	730
63969	720	720
58227	721	720
70381	721	720
81924	721	720
59321	721	720
86964	721	720
80879	721	720
81329	721	720
59241	721	720
63811	721	720
95021	721	720
28998	721	720
36690	721	720
98304	721	720
82700	734	700
92068	735	700
89898	735	700
37111	735	700
79521	739	680
80660	740	680
79377	741	680
64859	741	680
95468	741	680
86155	744	670
63643	744	670
89692	746	670
86526	747	660
97153	747	660
79081	747	660
94963	747	660
71758	747	660
63063	747	660
93177	754	650
93676	755	650
59356	756	650
91864	756	650
93294	756	650
95760	756	650
66798	756	650
74118	761	640
64141	762	640
63148	763	630
5083	764	620
81788	765	610
93952	766	610
59796	766	610
86086	766	610
55858	769	600
91097	770	600
76332	771	600
83092	771	600
62927	771	600
57478	774	600
77460	774	600
53351	774	600
68473	774	600
66079	774	600
72923	779	600
89815	779	600
74310	779	600
57590	779	600
68083	779	600
86169	779	600
98776	779	600
75185	779	600
69107	779	600
55661	779	600
75158	779	600
78096	779	600
68294	779	600
71659	779	600
67405	779	600
57863	779	600
69016	779	600
81363	779	600
81792	779	600
81300	779	600
66655	779	600
89186	779	600
81962	779	600
85212	779	600
94173	779	600
68279	779	600
93072	779	600
78931	779	600
96974	779	600
85839	779	600
93302	779	600
11311	779	600
72037	779	600
70220	779	600
88947	814	590
97265	815	570
57562	816	570
62864	817	570
59658	817	570
70291	817	570
74462	817	570
58689	817	570
99109	817	570
79517	817	570
69164	817	570
68039	817	570
93213	817	570
56178	817	570
79090	817	570
86452	829	560
64812	830	560
92650	830	560
73141	832	550
76702	833	550
71248	834	550
96232	834	550
85309	834	550
72986	834	550
61465	834	550
85582	834	550
87234	834	550
58534	834	550
82265	834	550
72439	834	550
88596	834	550
69532	834	550
75852	834	550
90776	834	550
70129	834	550
63556	834	550
98726	834	550
86160	834	550
68393	834	550
82987	834	550
95459	834	550
99168	834	550
89799	834	550
86450	834	550
77927	834	550
79023	834	550
65554	861	530
65734	861	530
99738	863	530
82054	863	530
65055	863	530
74915	866	520
94087	867	510
75440	868	510
84666	869	510
79116	869	510
61574	869	510
63791	869	510
73799	869	510
65857	874	500
56114	874	500
72955	874	500
56566	877	490
68388	878	490
79757	878	490
77759	880	490
71340	881	490
88691	882	480
83274	882	480
82213	884	480
60664	884	480
99710	884	480
71501	884	480
93544	884	480
16451	889	470
83606	890	460
55335	891	460
59705	892	460
93901	892	460
73890	892	460
60553	892	460
80613	896	450
84166	896	450
95674	898	450
60832	898	450
65499	898	450
88075	901	440
57599	902	440
84412	903	430
99140	904	430
84106	904	430
70870	904	430
65678	907	420
88026	908	420
70720	908	420
89412	908	420
91996	911	410
57177	912	410
75878	913	410
57453	913	410
69468	913	410
63563	916	410
78310	918	400
92514	919	400
96790	919	400
86564	921	400
92875	922	390
85813	923	390
68954	924	380
58493	925	380
85366	925	380
99811	925	380
56882	925	380
55750	925	380
67693	930	370
89325	931	370
87411	932	362
98395	932	362
91438	932	362
58607	932	362
78807	932	362
69820	937	360
99121	937	360
87209	937	360
90754	937	360
67055	941	360
42403	941	360
53845	941	360
76170	941	360
86996	941	360
14201	941	360
96755	941	360
88148	941	360
72695	941	360
93554	941	360
80675	941	360
91102	941	360
92430	941	360
95506	941	360
91101	941	360
82767	941	360
86116	941	360
11093	941	360
78666	941	360
71225	941	360
88849	941	360
65927	941	360
75559	941	360
68156	941	360
69588	941	360
88566	941	360
75586	941	360
76250	941	360
94974	941	360
56646	941	360
55023	941	360
87742	941	360
71446	941	360
63997	941	360
69491	941	360
69088	941	360
94624	941	360
55868	941	360
50098	941	360
55701	941	360
66713	941	360
96089	941	360
50320	941	360
61004	941	360
82924	941	360
64171	941	360
87913	941	360
76591	941	360
56782	941	360
71840	941	360
68857	941	360
99300	941	360
91172	941	360
66010	941	360
97955	941	360
74911	941	360
98006	941	360
94377	941	360
90967	941	360
97759	941	360
58659	941	360
63995	941	360
97445	941	360
83357	941	360
72035	941	360
81034	941	360
89147	941	360
29783	941	360
93882	941	360
64159	1010	350
95212	1011	350
74728	1011	350
79938	1011	350
74260	1011	350
62696	1011	350
65164	1011	350
60946	1011	350
73346	1011	350
62126	1011	350
88028	1011	350
77688	1011	350
59977	1011	350
84030	1011	350
57668	1011	350
71851	1011	350
97019	1011	350
68046	1011	350
70621	1011	350
60535	1011	350
97840	1011	350
83759	1011	350
70040	1011	350
78249	1011	350
81111	1011	350
80469	1011	350
70277	1011	350
62053	1011	350
73025	1011	350
85855	1011	350
60776	1011	350
61686	1011	350
67490	1011	350
86971	1011	350
65484	1011	350
82092	1011	350
58018	1011	350
99538	1011	350
94388	1011	350
90479	1011	350
79328	1011	350
95080	1011	350
79058	1011	350
89385	1011	350
92065	1011	350
50006	1011	350
65760	1011	350
76440	1011	350
98660	1011	350
89553	1011	350
77773	1011	350
66343	1011	350
79671	1011	350
66747	1011	350
86022	1011	350
97551	1011	350
79290	1011	350
72982	1011	350
83477	1011	350
90781	1011	350
71956	1011	350
65418	1011	350
86833	1011	350
94243	1011	350
75665	1011	350
66842	1011	350
86245	1011	350
67702	1011	350
75527	1011	350
58912	1011	350
87695	1011	350
53129	1011	350
42640	1011	350
56027	1011	350
50025	1011	350
98680	1011	350
94252	1011	350
97220	1011	350
61630	1011	350
56112	1092	340
86501	1093	340
88756	1093	340
89132	1093	340
73231	1096	330
74259	1097	320
71492	1098	320
66821	1099	320
83323	1100	310
93479	1101	310
91154	1101	310
79362	1101	310
81656	1101	310
87463	1101	310
59795	1101	310
99427	1101	310
59340	1108	300
66402	1109	290
57421	1110	280
75948	1110	280
68565	1112	280
63959	1112	280
95028	1114	280
74744	1115	280
78221	1116	280
97974	1117	270
90031	1118	270
79387	1118	270
57484	1118	270
98198	1118	270
69996	1122	250
79941	1122	250
69615	1124	250
56250	1125	250
92033	1126	240
71809	1126	240
70317	1126	240
77957	1126	240
55956	1126	240
68414	1126	240
93877	1126	240
72684	1126	240
99954	1134	240
72430	1134	240
76059	1134	240
62698	1134	240
87478	1138	230
84469	1138	230
69797	1140	230
71295	1140	230
81091	1140	230
95418	1140	230
85825	1144	220
75729	1145	220
98845	1146	210
98180	1147	210
69814	1147	210
76331	1147	210
74254	1147	210
99670	1147	210
65262	1152	210
92511	1152	210
63178	1152	210
82907	1155	210
56212	1155	210
77921	1155	210
64900	1155	210
59407	1155	210
87832	1155	210
65590	1155	210
88428	1155	210
87790	1155	210
57538	1155	210
66088	1155	210
98066	1155	210
55748	1155	210
67396	1155	210
76669	1155	210
67417	1155	210
99157	1155	210
92591	1155	210
56306	1155	210
84140	1155	210
87282	1155	210
62726	1155	210
87436	1155	210
70775	1155	210
66075	1155	210
62538	1155	210
94220	1155	210
89846	1183	200
67891	1184	200
60581	1184	200
65879	1186	190
85344	1187	190
66578	1188	190
90020	1189	190
93019	1190	180
87085	1191	170
88119	1191	170
92236	1191	170
94576	1194	170
24470	1195	170
93747	1195	170
61017	1195	170
55665	1195	170
58280	1195	170
65936	1195	170
87426	1195	170
81433	1195	170
58314	1195	170
82926	1195	170
95968	1195	170
80048	1195	170
73284	1195	170
60929	1195	170
73493	1195	170
83774	1195	170
62351	1195	170
76501	1195	170
97379	1195	170
83003	1195	170
82018	1195	170
91514	1195	170
77013	1195	170
83339	1195	170
57741	1195	170
80842	1195	170
77430	1221	160
69295	1222	160
97702	1222	160
82071	1225	160
92943	1226	160
78160	1226	160
79383	1228	160
61428	1229	150
68404	1229	150
56679	1231	150
80961	1232	140
85017	1232	140
84499	1234	140
99306	1235	140
86465	1235	140
58274	1235	140
84220	1235	140
78694	1235	140
85595	1235	140
59449	1241	130
70348	1242	130
94558	1242	130
69558	1244	130
63047	1245	130
93127	1245	130
84342	1245	130
88633	1245	130
96731	1245	130
71117	1245	130
85876	1245	130
91089	1245	130
75012	1245	130
89693	1245	130
60081	1245	130
79129	1245	130
94800	1245	130
78234	1245	130
89648	1245	130
68899	1245	130
67800	1245	130
85835	1245	130
94436	1245	130
76094	1245	130
78759	1245	130
56061	1245	130
57413	1245	130
84625	1245	130
84657	1245	130
78074	1245	130
81688	1245	130
80423	1245	130
96594	1245	130
86135	1245	130
64963	1245	130
98158	1245	130
93683	1245	130
98092	1245	130
60750	1245	130
63210	1245	130
66077	1245	130
61315	1245	130
55775	1245	130
73261	1245	130
91854	1245	130
81885	1245	130
20045	1245	130
20248	1245	130
34287	1245	130
99885	1290	120
66853	1291	120
91051	1291	120
78928	1291	120
58194	1294	110
59964	1294	110
61743	1296	110
68730	1296	110
96561	1296	110
73747	1299	100
94916	1300	100
56087	1301	100
95973	1301	100
51531	1303	100
64631	1303	100
89189	1303	100
83718	1303	100
99864	1303	100
97466	1303	100
65970	1303	100
82021	1303	100
84017	1303	100
86637	1303	100
94005	1303	100
79916	1303	100
76466	1303	100
90936	1303	100
56686	1303	100
80965	1303	100
57386	1303	100
81530	1303	100
92940	1303	100
61627	1303	100
62262	1303	100
77644	1303	100
64792	1303	100
92436	1303	100
75066	1303	100
81395	1303	100
89088	1303	100
68893	1303	100
91573	1303	100
69303	1303	100
61018	1303	100
85891	1303	100
53098	1303	100
71820	1303	100
62096	1303	100
79697	1303	100
99842	1303	100
61940	1303	100
96423	1303	100
79443	1303	100
56139	1303	100
85554	1303	100
69387	1303	100
57541	1303	100
58460	1303	100
71420	1303	100
92308	1303	100
72383	1303	100
89796	1303	100
74437	1303	100
79216	1303	100
61562	1303	100
56540	1303	100
55807	1303	100
69594	1358	90
95779	1358	90
58857	1358	90
56734	1358	90
89352	1362	90
89773	1363	80
75417	1363	80
96420	1365	80
87011	1365	80
76405	1365	80
66298	1365	80
62266	1365	80
89036	1370	70
97232	1370	70
63932	1370	70
43397	1373	70
19498	1373	70
63764	1373	70
82828	1373	70
57876	1373	70
95721	1373	70
81860	1379	70
94389	1379	70
61273	1379	70
75245	1379	70
91571	1379	70
91294	1379	70
81855	1379	70
78579	1379	70
63500	1379	70
81607	1379	70
64009	1379	70
90048	1379	70
63620	1379	70
87076	1379	70
85954	1379	70
98197	1379	70
80381	1379	70
62890	1379	70
73918	1379	70
75795	1379	70
62069	1379	70
75591	1379	70
81574	1379	70
89023	1379	70
65317	1379	70
86948	1379	70
84968	1379	70
58404	1379	70
86085	1379	70
71715	1379	70
94478	1379	70
77594	1379	70
90815	1379	70
63802	1379	70
84663	1379	70
91367	1379	70
83218	1379	70
91086	1379	70
97074	1379	70
92452	1379	70
82782	1379	70
95403	1379	70
90044	1379	70
88847	1379	70
58129	1379	70
81796	1379	70
72839	1379	70
94286	1379	70
53999	1379	70
80957	1379	70
68436	1379	70
77105	1379	70
60428	1379	70
70490	1379	70
73923	1379	70
90187	1379	70
62951	1379	70
92963	1379	70
72537	1379	70
56346	1379	70
74899	1379	70
81597	1379	70
82077	1379	70
61719	1379	70
99620	1379	70
85237	1379	70
60556	1379	70
98173	1379	70
25670	1379	70
30374	1379	70
72455	1449	60
95429	1449	60
69579	1451	60
90812	1452	60
97866	1452	60
85506	1452	60
60541	1452	60
71824	1452	60
68988	1452	60
97639	1452	60
97098	1452	60
75996	1452	60
77294	1452	60
64309	1452	60
58122	1452	60
65896	1452	60
64333	1452	60
83151	1452	60
95483	1452	60
65438	1452	60
69655	1452	60
78536	1452	60
63964	1452	60
59541	1452	60
66621	1452	60
56125	1452	60
91558	1452	60
78131	1452	60
90490	1452	60
56258	1452	60
75472	1452	60
77267	1452	60
66771	1452	60
96682	1452	60
91141	1452	60
87678	1452	60
85216	1452	60
69008	1486	50
71208	1487	50
56647	1488	50
80163	1488	50
88714	1488	50
76093	1488	50
94630	1488	50
82160	1493	40
74208	1493	40
83482	1493	40
86571	1493	40
82785	1493	40
64818	1498	40
91863	1498	40
86625	1498	40
80327	1498	40
72975	1498	40
80598	1498	40
56871	1498	40
88770	1498	40
60404	1498	40
77270	1498	40
91192	1498	40
99024	1498	40
92143	1498	40
58020	1498	40
79195	1498	40
71255	1513	38
72416	1514	30
60475	1514	30
98238	1514	30
64700	1514	30
70011	1514	30
86582	1514	30
72331	1514	30
52229	1521	30
72661	1521	30
83071	1521	30
74507	1521	30
93629	1521	30
70464	1521	30
83567	1521	30
58638	1521	30
56193	1521	30
89019	1521	30
69198	1521	30
94179	1521	30
90405	1521	30
76831	1521	30
67632	1521	30
82207	1536	20
93574	1537	20
69480	1537	20
73433	1537	20
87745	1537	20
64377	1537	20
73269	1537	20
68483	1537	20
99547	1537	20
88401	1537	20
69094	1537	20
82569	1537	20
61503	1537	20
98767	1537	20
60632	1537	20
80943	1537	20
95734	1537	20
70175	1537	20
83918	1537	20
80085	1537	20
59674	1537	20
62523	1537	20
56440	1537	20
91574	1537	20
74244	1537	20
92268	1537	20
65682	1537	20
59989	1537	20
71141	1537	20
67493	1537	20
64153	1537	20
59451	1537	20
87524	1537	20
80648	1537	20
83946	1537	20
94819	1537	20
57155	1537	20
90970	1537	20
97671	1537	20
74126	1537	20
74201	1537	20
77710	1537	20
89925	1537	20
79370	1537	20
66642	1537	20
72561	1537	20
78642	1537	20
83463	1537	20
91789	1537	20
84282	1537	20
88002	1537	20
70901	1537	20
91221	1537	20
68324	1537	20
60481	1537	20
76540	1537	20
69324	1537	20
60109	1537	20
63064	1537	20
96841	1537	20
81276	1537	20
93721	1537	20
91946	1537	20
56713	1537	20
77342	1537	20
83143	1537	20
88215	1537	20
71911	1537	20
65715	1537	20
78616	1537	20
82919	1537	20
74314	1537	20
73984	1537	20
67469	1537	20
97773	1537	20
80682	1537	20
99722	1537	20
85308	1537	20
99973	1537	20
99349	1537	20
75562	1537	20
94376	1537	20
90806	1537	20
74504	1537	20
73615	1537	20
61732	1537	20
90778	1537	20
86084	1537	20
84442	1625	10
12761	1625	10
80726	1625	10
84276	1625	10
78756	1625	10
76226	1625	10
56559	1625	10
91465	1625	10
70825	1625	10
62484	1625	10
93978	1625	10
64076	1625	10
72408	1625	10
80316	1625	10
86707	1625	10
59717	1625	10
79186	1625	10
79148	1625	10
97045	1625	10
97471	1625	10
94172	1625	10
95829	1625	10
99639	1625	10
98752	1625	10
82683	1649	2
68763	1649	2
93996	1649	2
\.


--
-- Data for Name: tournament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament (tournament_name, venue, start_date, end_date, series, match_count, tournament_id, organization_id, city_id, country_id) FROM stdin;
KHILADIX.COM Dubai Badminton Asia Championships 2023 powered by FLOKI	Sheikh Rashid Bin Hamdan Indoor Hall, Al Nasr Club	2023-04-25	2023-04-30	Continental Individual Championships	31	42	1	39	71
PETRONAS Malaysia Open 2023	Axiata Arena	2023-01-10	2023-01-15	HSBC BWF World Tour Super 1000	31	1	1	1	10
YONEX Estonian International 2023	Kalevi Spordihall	2023-01-12	2023-01-15	International Series	31	2	1	2	63
YONEX SUNRISE India Open 2023	K. D. Jadhav Indoor Hall	2023-01-17	2023-01-22	HSBC BWF World Tour Super 750	31	3	1	3	8
DAIHATSU Indonesia Masters 2023	Istora Senayan	2023-01-24	2023-01-29	HSBC BWF World Tour Super 500	31	4	1	4	2
RSL Iceland International 2023	Tennis- og badmintonfélag Reykjavíkur	2023-01-26	2023-01-29	Future Series	31	5	1	5	116
Swedish International U17 2023	Upplands Boservice Arena/Fyrisfjädern	2023-01-27	2023-01-29	-	63	6	2	6	25
Swedish Junior 2023	Fyrishov	2023-01-27	2023-01-29	Junior International Series	53	7	1	6	25
31st Iran Fajr International Challenge 2023	Afrasiabi Hall	2023-01-31	2023-02-05	International Challenge	63	8	1	7	78
PRINCESS SIRIVANNAVARI Thailand Masters 2023	Nimibutr National Stadium	2023-01-31	2023-02-05	HSBC BWF World Tour Super 300	31	9	1	8	4
Spanish U17 Open 2023	Polideportivo Arroyo de la Miel	2023-02-03	2023-02-05	-	63	10	2	9	20
13th MULTI ALARM Hungarian Junior International Championships 2023 presented by VICTOR	Badminton Center Pécs	2023-02-09	2023-02-12	Junior International Series	62	11	1	10	49
VICTOR Oceania Championships 2023	ABA	2023-02-13	2023-02-16	Continental Individual Championships	52	12	1	11	46
VICTOR Swedish Open 2023	IFU Arena	2023-05-11	2023-05-14	International Series	31	48	1	6	25
VICTOR Oceania Junior Championships 2023	ABA	2023-02-13	2023-02-16	Continental Junior Individual Championships	42	13	1	11	46
All Africa Individual Championships 2023	John Barrable Hall	2023-02-17	2023-02-19	Continental Individual Championships	51	14	3	12	57
Uganda International Challenge 2023	MTN Arena	2023-02-22	2023-02-26	International Challenge	31	15	1	13	54
Italian Junior 2023	PalaBadminton	2023-02-24	2023-02-26	Junior International Challenge	63	16	1	14	28
Uganda Junior International 2023	MTN Arena	2023-02-27	2023-03-01	Junior Future Series	31	17	1	13	54
YONEX Dutch Junior International 2023	Badmintonhall DEGIRO hall	2023-03-01	2023-03-05	Junior International Grand Prix	93	18	1	15	15
TOYOTA Gazoo Racing Thailand International Challenge 2023	Terminal 21 Korat	2023-03-07	2023-03-12	International Challenge	63	19	1	16	4
YONEX German Open 2023	Main Location	2023-03-07	2023-03-12	HSBC BWF World Tour Super 300	31	20	1	17	24
58 Portugal International Championships 2023	High Performance Centre	2023-03-08	2023-03-12	International Series	31	21	1	18	27
YONEX German Junior 2023	Sportarena (Sportforum) Berlin	2023-03-08	2023-03-12	Junior International Grand Prix	108	22	1	19	24
Ruichang China Masters 2023	Ruichang Sports Park Gym	2023-03-14	2023-03-19	BWF Tour Super 100	47	23	1	20	5
LI-NING Maldives International Challenge 2023	Male’ Sports Complex	2023-06-05	2023-06-10	International Challenge	63	60	1	54	56
XXI Torneo Internacional de Badminton Giraldilla de La Habana 2023	Coliseo de la Ciudad Deportiva	2023-03-14	2023-03-19	Future Series	29	24	1	21	91
YONEX All England Open Badminton Championships 2023	Utilita Arena Birmingham	2023-03-14	2023-03-19	HSBC BWF World Tour Super 1000	31	25	1	22	41
IBERDROLA Spanish Junior Open 2023	Polideportivo Corredoria Arena	2023-03-17	2023-03-19	Junior International Series	62	26	1	23	20
Polish U17 International 2023	Sports Hall	2023-03-17	2023-03-19	-	63	27	2	24	55
YONEX Swiss Open 2023	St. Jakobshalle Basel	2023-03-21	2023-03-26	HSBC BWF World Tour Super 300	31	28	1	25	35
CIPUTRA HANOI - YONEX SUNRISE Vietnam International Challenge 2023	Tay Ho District Stadium	2023-03-21	2023-03-26	International Challenge	62	29	1	26	30
ORLEN Polish Open 2023	Arena Jaskółka	2023-03-22	2023-03-26	International Challenge	31	30	1	27	55
Madrid Spain Masters 2023	Centro Deportivo Municipal Gallur	2023-03-28	2023-04-02	HSBC BWF World Tour Super 300	31	31	1	28	20
Osaka International Challenge 2023	Main Location	2023-03-29	2023-04-02	International Challenge	31	32	1	29	3
OLIVER Czech U17 International 2023	Sportovní hala	2023-03-30	2023-04-01	-	63	33	2	30	17
PACK LINE Israel Junior 2023	City Sport Hall	2023-03-30	2023-04-01	Junior International Series	34	34	1	31	14
Orléans Masters Badminton 2023 presented by VICTOR	Palais des Sports	2023-04-04	2023-04-09	HSBC BWF World Tour Super 300	31	35	1	32	11
FZ FORZA Alpes International U19 2023	Salle Everest	2023-04-06	2023-04-09	Junior International Series	89	36	1	33	11
VICTOR JOT Tournament (U17) 2023	Den Willecom	2023-04-07	2023-04-09	-	63	37	2	34	23
FZ FORZA Dutch International 2023	VELO-hall	2023-04-13	2023-04-16	International Series	31	38	1	35	15
VICTOR Latvia U17 International 2023	LOC Manege	2023-04-14	2023-04-16	-	37	39	2	36	120
YONEX France U17 Open 2023	Complexe Sportif Regional	2023-04-20	2023-04-22	-	62	40	2	37	11
Cyprus Junior 2023	Evangelos Florakis Sports Hall	2023-04-21	2023-04-23	Junior International Series	63	41	1	38	98
XXVI YONEX Pan Am Individual Championships 2023	G.C. Foster College of Physical Education and Spor	2023-04-26	2023-04-29	Continental Individual Championships	42	43	1	40	48
YONEX Bozner Cup U17 International 2023	Palaresia	2023-04-28	2023-04-30	-	55	44	2	41	28
III Mexican International Challenge 2023	CODE II Jalisco	2023-05-02	2023-05-07	International Challenge	63	45	1	42	42
YONEX Luxembourg Open 2023	d'Coque Centre National Sportif & culturel	2023-05-04	2023-05-07	International Series	31	46	1	43	74
Austrian U17 Open 2023	Badmintonhalle Vorarlberg	2023-05-05	2023-05-07	-	63	47	2	44	34
YONEX 3 Borders U19 2023	Sportenum	2023-05-12	2023-05-14	Junior International Series	63	49	1	45	11
SEA Games 2023 ( Individual Events)	Morodok Techo	2023-05-12	2023-05-16	-	17	50	4	46	126
I FEEL SLOVENIA YONEX Open 2023	Sport hall Dras	2023-05-17	2023-05-21	International Challenge	31	51	1	47	62
Adria U17 International 2023	Sport hall Marino Cvetković	2023-05-19	2023-05-21	-	63	52	2	48	66
PERODUA Malaysia Masters 2023 presented by DAIHATSU	Axiata Arena	2023-05-23	2023-05-28	HSBC BWF World Tour Super 500	31	53	1	1	10
YONEX Polish U17 Open 2023	Sports Hall of Agricultural School Complex	2023-05-25	2023-05-27	-	58	54	2	49	55
Austrian Open 2023	Raiffeisen Sportpark	2023-05-25	2023-05-28	International Series	31	55	2	50	34
TOYOTA GAZOO RACING Thailand Open 2023	Indoor Stadium Huamark	2023-05-30	2023-06-04	HSBC BWF World Tour Super 500	31	56	1	8	4
APACS Kazakhstan Future Series 2023	Center of Badminton	2023-05-31	2023-06-03	Future Series	56	57	1	51	31
YONEX Bonn International 2023	Erwin Kranz Halle	2023-05-31	2023-06-03	Future Series	31	58	1	52	24
Chile International 2023	Centro Entrenamiento Olimpico	2023-05-31	2023-06-04	Future Series	30	59	1	53	84
CROWNE PLAZA Northern Marianas Open 2023	Gilbert C. Ada Gymnasium	2023-06-06	2023-06-11	International Challenge	60	61	1	55	127
KFF Singapore Open 2023	Singapore Indoor Stadium	2023-06-06	2023-06-11	HSBC BWF World Tour Super 750	31	62	1	56	6
XIII Santo Domingo Open 2023	Virgilio TRavieso Soto	2023-06-07	2023-06-11	International Series	31	63	1	57	68
VICTOR Denmark Masters 2023	Royal Stage	2023-06-08	2023-06-11	International Challenge	31	64	2	58	1
BABOLAT German U17 Open 2023	Sporthalle Steinbreche	2023-06-08	2023-06-11	-	81	65	2	59	24
RSL Lithuanian International 2023	Cido Arena	2023-06-08	2023-06-11	Future Series	31	66	1	60	86
Bulgarian U17 International 2023	Sport Hall Svilengrad	2023-06-09	2023-06-11	-	31	67	2	61	44
IBERDROLA Spanish Junior International 2023	Pabellón Municipal "Polideportivo Centro"	2023-06-09	2023-06-11	Junior International Series	63	68	2	62	20
Bulgarian Junior U19 International 2023	Sport Hall "Svilengrad"	2023-06-12	2023-06-15	Junior International Series	45	69	5	61	44
KAPAL API GROUP Indonesia Open 2023	Istora	2023-06-13	2023-06-18	HSBC BWF World Tour Super 1000	31	70	1	4	2
TAKECARE Saipan International 2023	Gilbert C. Ada Gymnasium	2023-06-13	2023-06-18	International Challenge	60	71	1	55	127
IX Guatemala Junior International 2023	Teodoro Palacios Flores	2023-06-14	2023-06-18	Junior Future Series	14	72	1	63	18
Perú Future Series 2023	Polideportivo Villa Deportiva, Club Regatas Lima	2023-06-14	2023-06-18	Future Series	30	73	1	64	50
Nantes International Challenge 2023	Salle metropolitaine de la Trocardière	2023-06-15	2023-06-18	International Challenge	31	74	1	65	11
Hangzhou China International Challenge 2023	Binjiang Gymnasium	2023-06-20	2023-06-25	International Challenge	56	75	1	66	5
Mongolia Junior International Series 2023	National Sports Complex	2023-06-20	2023-06-25	Junior International Series	25	76	1	67	64
V Guatemala Future Series 2023	Teodoro Palacios Flores	2023-06-20	2023-06-25	Future Series	31	77	1	63	18
YONEX Taipei Open 2023	Tian-Mu Arena	2023-06-20	2023-06-25	HSBC BWF World Tour Super 300	31	78	1	68	7
Serbian U17 International - NOVI SAD 2023	Sports Center ''Slana Bara	2023-06-23	2023-06-25	-	62	79	2	69	93
HEBAR U17 Bulgaria Open 2023	Sport Hall “Vasil Levski”	2023-06-26	2023-06-29	-	60	80	2	70	44
2023 European Games	Arena Jaskółka Tarnów TOSiR	2023-06-26	2023-07-02	Continental Individual Championships	15	81	1	27	55
Mongolia International Challenge 2023	National Sport Complex	2023-06-27	2023-07-02	International Challenge	57	82	1	67	64
\.


--
-- Data for Name: umpire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.umpire (umpire_id, umpire_name, date_of_birth, nationality) FROM stdin;
\.


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 70, true);


--
-- Name: confederation_confederation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.confederation_confederation_id_seq', 5, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 127, true);


--
-- Name: organization_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organization_organization_id_seq', 5, true);


--
-- Name: tournament_tournament_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tournament_tournament_id_seq', 82, true);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: coach coach_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach
    ADD CONSTRAINT coach_pkey PRIMARY KEY (coach_id);


--
-- Name: confederation confederation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confederation
    ADD CONSTRAINT confederation_pkey PRIMARY KEY (confederation_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: match match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (tournament_id, player_1, player_2);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (organization_id);


--
-- Name: player_performance player_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_performance
    ADD CONSTRAINT player_performance_pkey PRIMARY KEY (member_id, win, lose);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (member_id);


--
-- Name: player_prize player_prize_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_prize
    ADD CONSTRAINT player_prize_pkey PRIMARY KEY (member_id, total_prize);


--
-- Name: player_rank player_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_rank
    ADD CONSTRAINT player_rank_pkey PRIMARY KEY (member_id, rank);


--
-- Name: tournament tournament_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_pkey PRIMARY KEY (tournament_id);


--
-- Name: umpire umpire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.umpire
    ADD CONSTRAINT umpire_pkey PRIMARY KEY (umpire_id);


--
-- Name: city fk_city_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: coach fk_coach_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach
    ADD CONSTRAINT fk_coach_country FOREIGN KEY (nationality) REFERENCES public.country(country_id);


--
-- Name: country fk_country_confederation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_country_confederation FOREIGN KEY (confederation_id) REFERENCES public.confederation(confederation_id);


--
-- Name: match fk_match_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT fk_match_player FOREIGN KEY (player_1_id) REFERENCES public.player(member_id);


--
-- Name: match fk_match_tournament; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT fk_match_tournament FOREIGN KEY (tournament_id) REFERENCES public.tournament(tournament_id);


--
-- Name: match fk_match_umpire; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT fk_match_umpire FOREIGN KEY (umpire_id) REFERENCES public.umpire(umpire_id);


--
-- Name: player fk_player_coach; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT fk_player_coach FOREIGN KEY (coach_id) REFERENCES public.coach(coach_id);


--
-- Name: player fk_player_confederation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT fk_player_confederation FOREIGN KEY (confederation_id) REFERENCES public.confederation(confederation_id);


--
-- Name: player fk_player_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT fk_player_country FOREIGN KEY (nationality) REFERENCES public.country(country_id);


--
-- Name: player_performance fk_player_performance_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_performance
    ADD CONSTRAINT fk_player_performance_player FOREIGN KEY (member_id) REFERENCES public.player(member_id);


--
-- Name: player_prize fk_player_prize_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_prize
    ADD CONSTRAINT fk_player_prize_player FOREIGN KEY (member_id) REFERENCES public.player(member_id);


--
-- Name: player_rank fk_player_rank_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_rank
    ADD CONSTRAINT fk_player_rank_player FOREIGN KEY (member_id) REFERENCES public.player(member_id);


--
-- Name: tournament fk_tournament_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT fk_tournament_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: tournament fk_tournament_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT fk_tournament_country FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: tournament fk_tournament_organization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT fk_tournament_organization FOREIGN KEY (organization_id) REFERENCES public.organization(organization_id);


--
-- Name: umpire fk_umpire_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.umpire
    ADD CONSTRAINT fk_umpire_country FOREIGN KEY (nationality) REFERENCES public.country(country_id);


--
-- PostgreSQL database dump complete
--

