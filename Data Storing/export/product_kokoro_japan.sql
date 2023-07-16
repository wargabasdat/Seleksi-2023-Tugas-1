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
-- Name: credit_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_card (
    id_payment integer NOT NULL,
    card_number character varying(255),
    name_on_card character varying(255),
    exp_date date
);


ALTER TABLE public.credit_card OWNER TO postgres;

--
-- Name: credit_card_id_payment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_card_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_card_id_payment_seq OWNER TO postgres;

--
-- Name: credit_card_id_payment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_card_id_payment_seq OWNED BY public.credit_card.id_payment;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id_customer integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    password character varying(255),
    country character varying(255),
    state character varying(255),
    city character varying(255),
    address character varying(255),
    postcode character varying(20)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_customer_seq OWNER TO postgres;

--
-- Name: customer_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_customer_seq OWNED BY public.customer.id_customer;


--
-- Name: customer_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_phone (
    id_customer integer NOT NULL,
    phone_number character varying(20)
);


ALTER TABLE public.customer_phone OWNER TO postgres;

--
-- Name: customer_phone_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_phone_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_phone_id_customer_seq OWNER TO postgres;

--
-- Name: customer_phone_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_phone_id_customer_seq OWNED BY public.customer_phone.id_customer;


--
-- Name: fill_up; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fill_up (
    id_shopping_cart integer NOT NULL,
    id_product integer NOT NULL,
    quantity integer
);


ALTER TABLE public.fill_up OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id_product integer NOT NULL,
    product_name character varying(255),
    status character varying(20),
    normal_price double precision,
    sale_price double precision,
    ratings double precision,
    count_reviews integer,
    CONSTRAINT check_status CHECK (((status)::text = ANY ((ARRAY['Sale'::character varying, 'Not sale'::character varying, 'Sold out'::character varying])::text[])))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: new_table_id_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_table_id_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_table_id_product_seq OWNER TO postgres;

--
-- Name: new_table_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_table_id_product_seq OWNED BY public.product.id_product;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id_payment integer NOT NULL,
    id_shopping_cart integer,
    id_voucher integer,
    total_amount double precision,
    price_off double precision,
    payment_date timestamp without time zone,
    payment_status boolean
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_id_payment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_payment_seq OWNER TO postgres;

--
-- Name: payment_id_payment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_payment_seq OWNED BY public.payment.id_payment;


--
-- Name: paypal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paypal (
    id_payment integer NOT NULL,
    paypal_number character varying(255)
);


ALTER TABLE public.paypal OWNER TO postgres;

--
-- Name: paypal_id_payment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paypal_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paypal_id_payment_seq OWNER TO postgres;

--
-- Name: paypal_id_payment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paypal_id_payment_seq OWNED BY public.paypal.id_payment;


--
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    id_shopping_cart integer NOT NULL,
    id_customer integer,
    note character varying(255),
    cart_status character varying(20),
    date timestamp without time zone
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- Name: shopping_cart_id_shopping_cart_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_cart_id_shopping_cart_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_cart_id_shopping_cart_seq OWNER TO postgres;

--
-- Name: shopping_cart_id_shopping_cart_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_cart_id_shopping_cart_seq OWNED BY public.shopping_cart.id_shopping_cart;


--
-- Name: voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voucher (
    id_voucher integer NOT NULL,
    voucher_name character varying(255),
    voucher_exp timestamp without time zone,
    id_customer integer
);


ALTER TABLE public.voucher OWNER TO postgres;

--
-- Name: voucher_id_voucher_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voucher_id_voucher_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_id_voucher_seq OWNER TO postgres;

--
-- Name: voucher_id_voucher_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voucher_id_voucher_seq OWNED BY public.voucher.id_voucher;


--
-- Name: credit_card id_payment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card ALTER COLUMN id_payment SET DEFAULT nextval('public.credit_card_id_payment_seq'::regclass);


--
-- Name: customer id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id_customer SET DEFAULT nextval('public.customer_id_customer_seq'::regclass);


--
-- Name: customer_phone id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_phone ALTER COLUMN id_customer SET DEFAULT nextval('public.customer_phone_id_customer_seq'::regclass);


--
-- Name: payment id_payment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id_payment SET DEFAULT nextval('public.payment_id_payment_seq'::regclass);


--
-- Name: paypal id_payment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paypal ALTER COLUMN id_payment SET DEFAULT nextval('public.paypal_id_payment_seq'::regclass);


--
-- Name: product id_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id_product SET DEFAULT nextval('public.new_table_id_product_seq'::regclass);


--
-- Name: shopping_cart id_shopping_cart; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN id_shopping_cart SET DEFAULT nextval('public.shopping_cart_id_shopping_cart_seq'::regclass);


--
-- Name: voucher id_voucher; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher ALTER COLUMN id_voucher SET DEFAULT nextval('public.voucher_id_voucher_seq'::regclass);


--
-- Data for Name: credit_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_card (id_payment, card_number, name_on_card, exp_date) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id_customer, first_name, last_name, email, password, country, state, city, address, postcode) FROM stdin;
\.


--
-- Data for Name: customer_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_phone (id_customer, phone_number) FROM stdin;
\.


--
-- Data for Name: fill_up; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fill_up (id_shopping_cart, id_product, quantity) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id_payment, id_shopping_cart, id_voucher, total_amount, price_off, payment_date, payment_status) FROM stdin;
\.


--
-- Data for Name: paypal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paypal (id_payment, paypal_number) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id_product, product_name, status, normal_price, sale_price, ratings, count_reviews) FROM stdin;
1	Biore UV Aqua Rich Watery Essence SPF50+/PA++++ 70ml	Not sale	1305	1305	4.8	76
2	Hada Labo Gokujyun Hyaluronic Acid Premium Lotion 170ml	Not sale	1710	1710	4.8	39
3	Canmake Mermaid Skin Gel UV	Not sale	1156	1156	4.9	47
4	Melano CC Intensive Anti-Spot Essence 20ml	Sale	1473	1325	4.4	25
5	Hada Labo Gokujyun Hyaluronic Acid Lotion 170ml	Not sale	1329	1329	5	30
6	Senka Perfect Whip Cleansing Foam 120 g	Not sale	789	789	4.9	25
7	DHC Collagen 60 Days	Sale	1854	1668	4.9	20
8	Hada Labo Gokujyun Cleansing Oil 200ml	Not sale	1451	1451	5	16
9	Hada Labo Gokujyun UV White Gel 90g	Not sale	2066	2066	4.7	22
10	Skin Aqua Super Moisture Gel	Not sale	1151	1151	4.7	14
11	Naturie Hatomugi Skin Conditioner	Not sale	1739	1739	4.8	14
12	Hada Labo Gokujyun Hyaluronic Acid Foaming Cleanser 100g	Sale	867	780	5	11
13	Heroine Make Kiss Me Long and Curl Mascara Super Waterproof	Not sale	1920	1920	4.5	15
14	Biore UV Aqua Rich Watery Gel SPF50+/PA++++ 70ml	Not sale	1385	1385	4.3	18
15	Anessa Perfect UV Sunscreen Skincare Milk	Not sale	1752	1752	4.7	13
16	Kose Clear Turn Vitmanin C Essence Mask 30 Sheets	Sale	1895	1705	4.4	8
17	Hada Labo Shirojyun Premium Whitening Lotion 170ml	Not sale	1610	1610	3.9	10
18	Heroine Make Kiss Me Smooth Liquid Eyeliner	Not sale	1200	1200	4.8	6
19	Skin Aqua Tone Up UV Essence SPF50+/PA++++	Not sale	1363	1363	4.5	8
20	Nivea Sun Protect Water Gel SPF50/PA+++ Pump Type	Not sale	1667	1667	5	11
21	Canmake Cream Cheek	Sale	1040	936	5	5
22	Hada Labo Hyaluronic Acid Foaming Cleanser Pump Type 160ml	Not sale	1062	1062	4.8	9
23	Keana Nadeshiko Rice Mask 10 Sheets	Sale	1457	1311	4.9	7
24	DHC Vitamin C Hard Capsule 60 Days	Sale	800	720	4.9	10
25	Shiseido Fino Premium Touch Hair Mask	Not sale	1635	1635	4.4	8
26	Kanebo Suisai Beauty Clear Powder	Sale	1503	1353	4.6	9
27	Biore UV Aqua Rich Watery Essence SPF50+/PA++++ 85g	Not sale	2133	2133	4.5	4
28	DHC Deep Cleansing Oil	Not sale	2828	2828	4.8	9
29	DHC Lip Cream	Not sale	819	819	5	3
30	Hada Labo Koi Gokujyun All-in-one Perfet Gel 100g	Not sale	1973	1973	4.3	6
31	Biore UV Aqua Rich Watery Gel SPF50+/PA++++ 155ml	Not sale	2568	2568	4.5	2
32	Hada Labo Gokujyun Hyaluronic Acid Lotion Large 400ml	Not sale	2459	2459	4.8	6
33	Sagami Original 0.01ml 5 Pieces	Not sale	1629	1629	5	4
34	Naturie Hatomugi Skin Conditioning Gel	Not sale	1534	1534	5	6
35	Itoen Oi Ocha Instant Green Tea With Matcha Powder 40g	Sale	801	721	4.5	6
36	Biore u Foam Flower Stamp Hand Soap 250 ml	Not sale	2225	2225	5	7
37	Shiseido Eyelash Refill Pads	Not sale	179	179	4.2	5
38	Hada Labo Gokujyun Hyaluronic Acid Emulsion 140ml	Not sale	1352	1352	4.7	6
39	Curel Intensive Moisture Cream	Not sale	2844	2844	4.8	4
40	MegRhythm Steam Hot Eye Mask Unscented	Sale	1728	1555	5	11
41	Shiseido Eyelash Curler 213	Not sale	1188	1188	4.7	3
42	Skin Aqua Super Moisture Gel Pump Type SPF50+/PA++++	Not sale	1416	1416	5	5
43	Hada Labo Gokujyun a Lift Cream	Sale	2060	1854	5	3
44	SK-II Facial Treatment Essence	Not sale	9901	9901	4.2	5
45	DHC Pink Colour Lip Cream	Not sale	742	742	5	3
46	Senka Perfect Whip Collagen in Cleansing Foam	Sale	1183	1065	4.7	6
47	Hada Labo Gokujyun a Lotion Moist Type 170ml	Not sale	1741	1741	5	3
48	Itoen Oi Oicha Premium Uji Matcha Tea Bag 50 Bags	Not sale	1770	1770	4.4	11
49	Tea Boutique Sweet Sakura Tea Green Tea with Cherry Blossom & Leaf 10 Bags	Sale	823	741	5	3
50	Morihan Organic Uji Matcha 30g	Sale	1115	1003	5	5
51	DHC Multivitamin 60 Days	Sale	993	894	5	2
52	Kiku Masamune Sake Lotion	Not sale	2143	2143	4	4
53	Heroine Make Kiss Me Volume and Curl Mascara Super Waterproof	Not sale	1920	1920	5	5
54	Shiseido Eyebrow Pencil	Sale	342	308	4.3	3
55	Shu Uemura S Eyelash Curler	Not sale	1560	1560	5	1
56	Canmake Quick Lash Curler	Not sale	1055	1055	5	4
57	Calbee Jagariko Salad Large 3 Pack	Not sale	1026	1026	5	3
58	Lululun Pink Face Mask 7 Sheets	Not sale	1171	1171	5	2
59	Transino White C Clear 120 Tablets	Sale	3986	3587	0	0
60	Softymo Deep Cleansing Oil	Not sale	1323	1323	5	2
61	Meiji Almond Chocolate	Not sale	592	592	5	3
62	Itoen Oi Ocha Sencha Green Tea 100g	Not sale	868	868	5	3
63	ISDG Ishokudogen Night Diet Enzyme Supplements 232 Vegetable Fruits 120 Tablets	Sale	2125	1912	4	2
64	Hada Labo Gokujyun Perfect Gel	Not sale	1861	1861	5	2
65	Lululun Precious Green Face Mask 7 Sheets	Sale	1597	1437	5	4
66	Cure Natural Aqua Gel	Not sale	4437	4437	5	3
67	KOSE Suncut UV Protect Essence SPF50+/PA++++	Not sale	1345	1345	5	1
68	Meiji Amino Collagen 196g	Sale	3680	3312	5	3
69	Nissin Cup Noodle Seafood 3-Pack	Not sale	1549	1549	5	1
70	Canmake Glow Fleur Cheeks	Sale	1383	1245	5	1
71	Hada Labo Gokujyun Hyaluronic Acid Cream 50g	Not sale	1816	1816	4.7	3
72	Excel Powder and Pencil Eyebrow	Sale	2227	2005	5	7
73	Curel Intensive Moisture Care Foaming Wash	Sale	2433	2190	5	1
74	Mentholatum Acnes Medictaed Cream Face Wash	Sale	830	747	0	0
75	Shiseido Spots Cover Foundation S100	Sale	1604	1444	0	0
76	Cow Brand No Additive Cleansing Milk	Sale	1430	1287	5	5
77	Opera My Lash Advanced Mascara	Not sale	1491	1491	1	1
78	Lululun Precious Red Face Mask 7 Sheets	Sale	1559	1403	5	1
79	Melano CC Medicated Spot Prevention Whitening Lotion Moist Type 170ml	Not sale	1537	1537	2	1
80	Kanebo Kate Rare Fit Gel Pencil Eyeliner	Not sale	1731	1731	0	0
81	TSUBAKI Extra Moist Shampoo Refill 345 ml	Not sale	2165	2165	0	0
82	Lululun Precious White Face Mask 7 Sheets	Sale	1523	1371	4.5	2
83	Saborino Morning Face Mask 32 Sheets	Not sale	2748	2748	5	2
84	Biore Pore Strips	Sale	803	723	0	0
85	DHC Honey Moisturising Lip Cream	Not sale	879	879	5	2
86	Majolica Majorca Lash Expander Long Long Long Mascara	Not sale	1942	1942	0	0
87	Minon Amino Moist Mask 4 Sheets	Not sale	2019	2019	0	0
88	Shu Uemura Ultime8 Sublime Beauty Cleansing Oil	Not sale	14863	14863	0	0
89	K-Palette Real Lasting Eyeliner 24h Waterproof	Not sale	2005	2005	0	0
90	Kinomegumi Ashi Rira Foot Patch Lavender	Sale	2983	2685	0	0
91	Calbee Jagariko Salad 3 Pack	Not sale	924	924	0	0
92	Cezanne Lasting Gloss Lipstick	Not sale	947	947	0	0
93	Biore Skincare Moisturising Face Wash	Sale	932	839	0	0
94	Dejavu Fiberwig Ultra Long Mascara	Not sale	2327	2327	5	1
95	SK-II Facial Treatment Clear Lotion	Not sale	10115	10115	5	3
96	FANCL Facial Washing Powder	Sale	2345	2111	5	1
97	Rosette Cleansing Paste Acne Clear 120g	Sale	873	786	4	1
98	Nameraka Honpo Cleansing Face Wash 150g	Sale	1150	1035	0	0
99	DUP Wonder Double Eyelid Tape Extra	Not sale	1598	1598	3	2
100	Rosette Cleansing Paste Sea Mud Smooth	Not sale	886	886	5	1
101	Transino Clear Wash	Sale	3175	2858	5	1
102	Arimino Peace Pro Design Freeze Wax	Not sale	2055	2055	5	1
103	Cezanne Super Slim Eyebrow	Not sale	983	983	0	0
104	Bifesta Cleansing Water Eye Make Up Remover	Not sale	1306	1306	0	0
105	Cezanne Pearl Glow Highlight	Sale	1011	910	0	0
106	Hadabisei Super Penetrating 3D Moist Face Mask 4 Sheets	Not sale	1390	1390	0	0
107	Sekkisei Medicated Emulsion 140ml	Not sale	5195	5195	5	1
108	Curel Moisture Lotion III Enrich	Not sale	2972	2972	1	1
109	FANCL Mild Cleansing Oil	Not sale	3173	3173	5	2
110	Kate Lash Maximizer	Not sale	1906	1906	4	1
111	Cezanne Gokuboso Extra Fine Eyeliner R Ultra Thin	Not sale	1016	1016	0	0
112	Gatsby Moving Rubber	Not sale	1288	1288	0	0
113	Hada Labo Gokujyun Hyaluronic Acid Face Mask 4 Sheets	Not sale	2244	2244	0	0
114	Opera Lip Tint N	Not sale	2774	2774	5	1
115	Maybelline New York Lashionista N Masacara Black	Not sale	1849	1849	1	1
116	Dolly Wink Eyelash	Not sale	1679	1679	0	0
117	Nameraka Honpo Cleansing Milk 300ml	Sale	2153	1938	0	0
118	Excel Skinny Rich Eye Shadow Sensual Brown	Not sale	2639	2639	0	0
119	Cow Brand Foaming Cleanser	Sale	1060	954	0	0
120	Uevo Design Cube Dry Wax	Not sale	2334	2334	0	0
121	Softymo White Cleansing Oil	Not sale	1291	1291	0	0
122	Canmake Mix Eyebrow	Sale	1188	1069	0	0
123	Men's Biore Foam Type Face Wash	Sale	989	890	5	1
124	Flowfushi Mote Liner Liquid Cherry Cheek	Not sale	2352	2352	0	0
125	Dejavu Lash Knockout Extra Volume Mascara	Not sale	2327	2327	0	0
126	Lululun Cleansing Balm	Not sale	3916	3916	0	0
127	Shiseido Ultimune Power Infusing Concentrate 50ml	Not sale	15220	15220	5	1
128	D-Up Volume Extension Mascara	Not sale	2674	2674	0	0
129	Biore UV Aqua Rich Watery Essence SPF50+/PA++++ 110ml	Not sale	2183	2183	0	0
130	Shu Uemura Eyelash Curler	Sold out	1560	1560	4	8
\.


--
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (id_shopping_cart, id_customer, note, cart_status, date) FROM stdin;
\.


--
-- Data for Name: voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voucher (id_voucher, voucher_name, voucher_exp, id_customer) FROM stdin;
\.


--
-- Name: credit_card_id_payment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_card_id_payment_seq', 1, false);


--
-- Name: customer_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_customer_seq', 1, false);


--
-- Name: customer_phone_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_phone_id_customer_seq', 1, false);


--
-- Name: new_table_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_table_id_product_seq', 1, false);


--
-- Name: payment_id_payment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_payment_seq', 1, false);


--
-- Name: paypal_id_payment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paypal_id_payment_seq', 1, false);


--
-- Name: shopping_cart_id_shopping_cart_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_shopping_cart_seq', 1, false);


--
-- Name: voucher_id_voucher_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voucher_id_voucher_seq', 1, false);


--
-- Name: credit_card credit_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_pkey PRIMARY KEY (id_payment);


--
-- Name: customer_phone customer_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_phone
    ADD CONSTRAINT customer_phone_pkey PRIMARY KEY (id_customer);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_customer);


--
-- Name: fill_up fill_up_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fill_up
    ADD CONSTRAINT fill_up_pkey PRIMARY KEY (id_shopping_cart, id_product);


--
-- Name: product new_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT new_table_pkey PRIMARY KEY (id_product);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id_payment);


--
-- Name: paypal paypal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paypal
    ADD CONSTRAINT paypal_pkey PRIMARY KEY (id_payment);


--
-- Name: shopping_cart shopping_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_pkey PRIMARY KEY (id_shopping_cart);


--
-- Name: voucher voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY (id_voucher);


--
-- Name: credit_card credit_card_id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_id_payment_fkey FOREIGN KEY (id_payment) REFERENCES public.payment(id_payment);


--
-- Name: customer_phone customer_phone_id_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_phone
    ADD CONSTRAINT customer_phone_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customer(id_customer);


--
-- Name: fill_up fk_id_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fill_up
    ADD CONSTRAINT fk_id_product FOREIGN KEY (id_product) REFERENCES public.product(id_product);


--
-- Name: fill_up fk_id_shopping_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fill_up
    ADD CONSTRAINT fk_id_shopping_cart FOREIGN KEY (id_shopping_cart) REFERENCES public.shopping_cart(id_shopping_cart);


--
-- Name: payment payment_id_shopping_cart_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_shopping_cart_fkey FOREIGN KEY (id_shopping_cart) REFERENCES public.shopping_cart(id_shopping_cart);


--
-- Name: payment payment_id_voucher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_voucher_fkey FOREIGN KEY (id_voucher) REFERENCES public.voucher(id_voucher);


--
-- Name: paypal paypal_id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paypal
    ADD CONSTRAINT paypal_id_payment_fkey FOREIGN KEY (id_payment) REFERENCES public.payment(id_payment);


--
-- Name: shopping_cart shopping_cart_id_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customer(id_customer);


--
-- Name: voucher voucher_id_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customer(id_customer);


--
-- PostgreSQL database dump complete
--

