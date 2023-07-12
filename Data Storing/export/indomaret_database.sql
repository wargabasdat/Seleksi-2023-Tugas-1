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
-- Name: cartproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartproduct (
    cart_id integer NOT NULL,
    cart_date date,
    status character varying(50),
    customer_id integer NOT NULL,
    payment_id integer NOT NULL,
    CONSTRAINT ck_status CHECK (((status)::text = ANY ((ARRAY['Done'::character varying, 'Ongoing'::character varying])::text[])))
);


ALTER TABLE public.cartproduct OWNER TO postgres;

--
-- Name: credit_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_card (
    payment_id integer NOT NULL,
    ccnumber bigint,
    cv integer
);


ALTER TABLE public.credit_card OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_firstname character varying(50) NOT NULL,
    customer_lastname character varying(50),
    address character varying(500),
    city character varying(100),
    postalcode integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_phone (
    customer_id integer NOT NULL,
    phonenumber character varying(20) NOT NULL
);


ALTER TABLE public.customers_phone OWNER TO postgres;

--
-- Name: debit_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debit_card (
    payment_id integer NOT NULL,
    dcnumber bigint
);


ALTER TABLE public.debit_card OWNER TO postgres;

--
-- Name: fillingcart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fillingcart (
    plu integer NOT NULL,
    cart_id integer NOT NULL,
    product_quantity integer
);


ALTER TABLE public.fillingcart OWNER TO postgres;

--
-- Name: online_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.online_payment (
    payment_id integer NOT NULL,
    paymentphonenumber character varying(20),
    companyname character varying(200)
);


ALTER TABLE public.online_payment OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_date date,
    amount real,
    payment_method character(50) NOT NULL,
    CONSTRAINT ck_method CHECK ((payment_method = ANY (ARRAY['Credit_Card'::bpchar, 'Debit_Card'::bpchar, 'Online_Payment'::bpchar])))
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    plu integer NOT NULL,
    item_name character varying(200) NOT NULL,
    final_price real NOT NULL,
    discount real,
    image character varying(1000),
    description character varying(1000),
    composition character varying(1000),
    warehousename character varying(100) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    warehousename character varying(100) NOT NULL,
    address character varying(500)
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- Name: warehouse_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse_phone (
    warehousename character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL
);


ALTER TABLE public.warehouse_phone OWNER TO postgres;

--
-- Data for Name: cartproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cartproduct (cart_id, cart_date, status, customer_id, payment_id) FROM stdin;
\.


--
-- Data for Name: credit_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_card (payment_id, ccnumber, cv) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_firstname, customer_lastname, address, city, postalcode) FROM stdin;
\.


--
-- Data for Name: customers_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_phone (customer_id, phonenumber) FROM stdin;
\.


--
-- Data for Name: debit_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debit_card (payment_id, dcnumber) FROM stdin;
\.


--
-- Data for Name: fillingcart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fillingcart (plu, cart_id, product_quantity) FROM stdin;
\.


--
-- Data for Name: online_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.online_payment (payment_id, paymentphonenumber, companyname) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, payment_date, amount, payment_method) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (plu, item_name, final_price, discount, image, description, composition, warehousename) FROM stdin;
10006895	Wrp Meal Replacement Cokelat 324G 	83000	50	https://assets.klikindomaret.com/products/10006895/10006895_thumb.jpg?Version.20.01.1.01	WRP susu bubuk rasa coklat tinggi protein; tinggi kalsium ; sumber serat.	Susu bubuk skim; susu bubuk full krim; gula pasir; protein whey; bubuk coklat; krimer nabati; serat inulin; premiks vitamin & mineral; pemanis buatan asesulfam-k 10/mg/saji (ADI: 15mg/kg berat badan/hari).	Toko Indomaret
20117263	Madu Enak Manuka Honey 250G 	30000	48	https://assets.klikindomaret.com/products/20117263/20117263_thumb.jpg?Version.20.01.1.01	100% madu asli; diperkaya pleh madu manuka. Madu manuka adalah madu yang diperoleh dari lebah yang mengumpulkan serbuk sari dan nektar jelly bush yang dikenal sebagai pohon manuka.	Madu hutan; madu randu; madu karet; madu kelengkeng dan madu manuka.	Toko Indomaret
20123183	Puck Cream Cheese Spread 140G 	19900	37	https://assets.klikindomaret.com/products/20123183/20123183_thumb.jpg?Version.20.01.1.01	kelembutan tekstur keju oles puck cream cheese membuat sajian makanan dirumah menjadi lebih istimewa	keju krim (88.7%) (mengandung susu sapi terpasteurisasi; kultur asam laktat); minyak nabati; pengemulsi trinatrium fosfat; garam; tidak mengandung rennet; tanpa pengawet	Toko Indomaret
20093997	Diabetamil Sweetener 50G 	19900	29	https://assets.klikindomaret.com/products/20093997/20093997_thumb.jpg?Version.20.01.1.01	Pemanis lebih rendah energi; kemanisan tidak berubah pada suhu tinggi; bantu cegah konsumsi gula berlebih untuk jaga dan kontrol kadar gula darah.	Pemanis alami sorbitol; pemanis buatan	Toko Indomaret
20119663	Captain Oats Instant Oatmeal 12x40g 	24300	27	https://assets.klikindomaret.com/products/20119663/20119663_thumb.jpg?Version.20.01.1.01	Captain Oats Instant Oatmeal merupakan salah satu makanan sehat dari Captain Oats yang bermanfaat untuk system pencernaan; tekanan darah tinggi dan kolestrol. Apalagi; produk ini juga ideal bagi Anda yang sedang menjalankan program diet. Dengan; dibuatnya 100% biji oat import menjadikan Captain Oats mempunyai bahan berkualitas tinggi tanpa tambahan bahan pengawet. Selain itu; proses dengan cara OatiFresh menjamin kualitas terbaik dan tidak mengurangi nutrisi yang ada.	N/A	Warehouse Jakarta 1
10030665	Simba Cereal Choco Chips Cokelat 55G 	6900	26	https://assets.klikindomaret.com/products/10030665/10030665_thumb.jpg?Version.20.01.1.01	Sereal gandum rasa coklat yang lezat	Tepung gandum; coklat bubuk; pasta coklat; susu bubuk; gula; ekstrak malt; garam; pengemulsi lesitin kedelai; perisa coklat; kalsium karbonat; pewarna karamel (E-150C).	Toko Indomaret
20109980	Ovomaltine Crunchy Cream 230G 	45500	25	https://assets.klikindomaret.com/products/20109980/20109980_thumb.jpg?Version.20.01.1.01	Ovomaltine crunchy cream knusper schokogenuss	Ovomaltine Bubuk 33%; Ekstrak barley Malt; Susu Skim kental; serum susu kental; 13.3% kako bubuk rendah lemak; gula; fruktosa; mineral; minyak rapeseed; Vitamin A;E;C; thiamin; riboflavin; niasin; B6; asam folat; B12; biotin; asam pantotenat; garam; perisa sintetik vanila; kacang Hazel; pengemulsi nabati; penstabil fosfat; minyak biji bunga matahari.	Toko Indomaret
20096795	Indomaret Jam Strawberry 170G 	10900	22	https://assets.klikindomaret.com/products/20096795/20096795_thumb.jpg?Version.20.01.1.01	Selai yang dibuat dari buah stroberi pilihan yang dicampur dengan bahan berkualitas.	Gula; buah stroberi; air; pengental pektin; pengatur keasaman asam sitrat; pengemulsi & penstabil nabati; perisa sintetik stroberi; pengawet kalium sorbat; pewarna makanan.	Toko Indomaret
20127302	Bella Spread Choco Cashew 300G 	22300	18	https://assets.klikindomaret.com/products/20127302/20127302_thumb.jpg?Version.20.01.1.01	Selai dengan varian rasa dan tekstur yang khas; sangat cocok untuk aplikasi isian; olesan; adonan; dan juga dekorasi.	N/A	Toko Indomaret
10025006	Nestle Cereal Breakfast Combo Pack Koko Krunch 32G 	7500	17	https://assets.klikindomaret.com/products/10025006/10025006_thumb.jpg?Version.20.01.1.01	Sereal dengan gandum utuh rasa coklat yang dahsyat	Serealia (tepung gandum; tepung gandum utuh) gula; bubuk kakao; sari malt; minyak nabati; mineral; garam; pengemulsi lestin kedelai; vitamin; perisa vanila dan antioksidan tokoferol	Toko Indomaret
20096794	Indomaret Jam Pineapple 170G 	10900	16	https://assets.klikindomaret.com/products/20096794/20096794_thumb.jpg?Version.20.01.1.01	Selai yang dibuat dari buah nanas pilihan yang dicampur dengan bahan berkualitas.	Gula; buah nanas; air; pengental pektin; pengatur keasaman asam sitrat; pengemulsi & penstabil nabati; perisa sintetik nanas; pengawet kalium sorbat; pewarna makanan.	Toko Indomaret
20064435	Al Shifa Natural Honey 250G 	55200	15	https://assets.klikindomaret.com/products/20064435/20064435_thumb.jpg?Version.20.01.1.01	Al shifa natural honey	100% madu	Toko Indomaret
20053052	Ceres Choco Spread Choco Hazelnut 200G 	26900	15	https://assets.klikindomaret.com/products/20053052/20053052_thumb.jpg?Version.20.01.1.01	Selai dengan perpaduan cokelat dan kacang hazel terbaik yang terbuat dari bahan pilihan dengan rasa dan kualitas terbaik.	Gula; minyak nabati; bubuk whey; bubuk kakao penuh lemak; kacang hazel; pengemulsi lesitin kedelai; perisa identik alami; vanili.	Toko Indomaret
20069858	Tresno Joyo Madu Kurma Tj 150G 	20000	11	https://assets.klikindomaret.com/products/20069858/20069858_thumb.jpg?Version.20.01.1.01	Kombinasi antara sari kurma dan madu murni	Sari kurma murni; madu murni; royal jelly.	Toko Indomaret
20055265	Tresno Joyo Madu Tj Murni 150G 	20000	11	https://assets.klikindomaret.com/products/20055265/20055265_thumb.jpg?Version.20.01.1.01	Terbuat dari madu terbaik diproses secara steril dan higienis.	Madu TJ muri adalah 100% madu pilihan; diproduksi oleh lebah pagi yang fresh dan dipanen saat madu matang; sehingga kualitas madu selalu terjamin.	Toko Indomaret
20122031	Skippy Jam Chunky Peanut Butter 170G 	24500	10	https://assets.klikindomaret.com/products/20122031/20122031_thumb.jpg?Version.20.01.1.01	Selai kacang dengan rasa yang enak.	N/A	Toko Indomaret
20127326	Nestle Cereal Breakfast Trix Honey Stars 150G 	19900	9	https://assets.klikindomaret.com/products/20127326/20127326_thumb.jpg?Version.20.01.1.01	2 kelezatan sereal dalam 1 mangkok.Sereal dengan gandum utuh.	N/A	Toko Indomaret
20083837	Morin Jam Hazelnut With Cocoa 150G 	25300	7	https://assets.klikindomaret.com/products/20083837/20083837_thumb.jpg?Version.20.01.1.01	Selai cokelat dan kacang hazel dengan rasa yang enak.	N/A	Toko Indomaret
20115438	5 Days Croissant Cheese 60G 	7000	0	https://assets.klikindomaret.com/products/20115438/20115438_thumb.jpg?Version.20.01.1.01	CROISSANT DALAM KEMASAN NO 1 YANG ADA DI INDONESIA	Tepung Terigu; Vla Keju (27;52%) (Mengandung Pengawet Asam Sorbat; Pewarna Alami Titanium Dioksida Cl No 77891. Penguat rasa Mononatrium L-Glutamat; Air; Margarin (mengandung pengawet kalium sorbat; Antioksidan Tokoferot. Pewarna makanan alami Beta Karoten CI No 40800). Gula Icing. Ragi; Susu Bubuk; Sirup Jagung tinggi Fruktosa. Pengemulsi Nabati (mengandung Pemanis Alami Sorbitol. Pewarna makanan Sintetik Kuning FCF CI No 15985). Minyak Goreng (mengandung Antioksidan BHA). Pati Jagung	Toko Indomaret
20125077	5 Days Croissant Pandan Srikaya 60G 	7000	0	https://assets.klikindomaret.com/products/20125077/20125077_thumb.jpg?Version.20.01.1.01	ROTI CROISSANT ISI SELAI RASA PANDAN SRIKAYA.	N/A	Toko Indomaret
20128391	7+ Cereal Bar Cocoa Chia 22G 	7500	0	https://assets.klikindomaret.com/products/20128391/20128391_thumb.jpg?Version.20.01.1.01	Cereal bar yang terbuat dari bahan-bahan pilihan terbaik. Perpaduan rasa dari Rolled oats; Chia Seeds; Brown Flaxseed; Cranberries; Freeze Dried Strawberries; California Raisins; Blueberries.	N/A	Warehouse Jakarta 1
20128392	7+ Cereal Bar Yoghurt Berry 22G 	7500	0	https://assets.klikindomaret.com/products/20128392/20128392_thumb.jpg?Version.20.01.1.01	Cereal bar yang terbuat dari bahan-bahan pilihan terbaik. Perpaduan rasa dari Real Yoghurt; Rolled oats; Chia seeds; Cranberries; Freeze dried strawberries; Blueberries; California Raisins.	N/A	Warehouse Jakarta 1
20052206	Air Mancur Madurasa Murni 150G 	22000	0	https://assets.klikindomaret.com/products/20052206/20052206_thumb.jpg?Version.20.01.1.01	Terbuat dari madu terbaik diproses secara steril dan higienis.	N/A	Toko Indomaret
20073984	Air Mancur Madurasa Original 150G 	15200	0	https://assets.klikindomaret.com/products/20073984/20073984_thumb.jpg?Version.20.01.1.01	Terbuat dari madu terbaik diproses secara steril dan higienis.	Fruktosa; glukosa; madu 2.305%; air demineral; perisa identik alami madu; pewarna karamel III amonia proses; karomoisin CI14720.	Toko Indomaret
20098940	Arnon Roti Kasur 180G 	11000	0	https://assets.klikindomaret.com/products/20098940/20098940_thumb.jpg?Version.20.01.1.01	Roti kasur	Tepung Terigu; Gula; Garam; Telur; Mentega; Ragi Alami; Coklat Butir; Kalsium Propionat	Toko Indomaret
20054691	Arnon Roti Manis 5'S Cream Messes 200G 	16000	0	https://assets.klikindomaret.com/products/20054691/20054691_thumb.jpg?Version.20.01.1.01	roti manis	Terigu; Gula; Garam; Telur; Mentega; Ragi Alami; Coklat Butir; Kalsium Propionat	Toko Indomaret
20099290	Arnon Roti Manis Choco Roll 	7000	0	https://assets.klikindomaret.com/products/20099290/20099290_thumb.jpg?Version.20.01.1.01	Roti lapis	Tepung Terigu; Gula Pasir; Margarine; Minyak Sayur; Ragi; Telur; Kalsium Propionat; Air; Pasta Cokelat.	Toko Indomaret
20057573	Arnon Roti Manis Cream Meises 40G 	4000	0	https://assets.klikindomaret.com/products/20057573/20057573_thumb.jpg?Version.20.01.1.01	roti manis	Terigu; Gula; Garam; Telur; Mentega; Ragi Alami; Coklat Butir; Kalsium Propionat.	Toko Indomaret
10003941	Budy Jam Pindekas 120G 	16400	0	https://assets.klikindomaret.com/products/10003941/10003941_thumb.jpg?Version.20.01.1.01	Selai kacang dari bahan pilihan yang terbaik.	Kacang tanah; gula; lemak nabati; garam; anti oksidan BHT.	Toko Indomaret
20054091	Budy Jam Selai Coklat 150G 	12200	0	https://assets.klikindomaret.com/products/20054091/20054091_thumb.jpg?Version.20.01.1.01	Budy jam selai serbaguna dengan rasa coklat yang enak.	Gula; cokelat bubuk; susu bubuk; lemak nabati; telur; perisa artifasial vanila; pengawet kalium sorbat.	Toko Indomaret
10003942	Budy Jam Strawberry 150G 	9800	0	https://assets.klikindomaret.com/products/10003942/10003942_thumb.jpg?Version.20.01.1.01	Selai strawberry dari bahan pilihan yang terbaik.	Gula; buah stroberi; pengatur keasaman (Asam Sitrat); Glukosa; pengawet (Natrium Benzoat); Pewarna (Ponceau 4R CI 16255)	Toko Indomaret
20041422	Ceres Choco Spread Double Hazelnut 350G 	46500	0	https://assets.klikindomaret.com/products/20041422/20041422_thumb.jpg?Version.20.01.1.01		N/A	Toko Indomaret
10004771	Ceres Choco Spread Duo Milk Hazelnut 350G 	46500	0	https://assets.klikindomaret.com/products/10004771/10004771_thumb.jpg?Version.20.01.1.01	Selai dengan perpaduan cokelat dan kacang hazel terbaik yang terbuat dari bahan pilihan dengan rasa dan kualitas terbaik.	Gula; minyak nabati; susu bubuk skim (5.5%); bubuk whey; bubuk kakao (2.5%); kacang hazel (1%); pengemulsi lesitin kedelai; perisa vanila ektrak; serpihan kacang almond.	Toko Indomaret
10036688	Ceres Hagelslag Rice Choco Classic 200G 	22500	0	https://assets.klikindomaret.com/products/10036688/10036688_thumb.jpg?Version.20.01.1.01	Cokelat meses terbaik yang terbuat dari bahan pilihan dengan rasa dan kualitas terbaik.	Gula; kakao massa (34.8%); lemak kakao; pengemulsi lesitin kedelai; perisa identik alami vanili; pelapis (carnauba wax).	Toko Indomaret
10000128	Ceres Hagelslag Rice Choco Classic 80G 	10000	0	https://assets.klikindomaret.com/products/10000128/10000128_thumb.jpg?Version.20.01.1.01	Cokelat meses terbaik yang terbuat dari bahan pilihan dengan rasa dan kualitas terbaik.	Gula; kakao massa (34.8%); lemak kakao; pengemulsi lesitin kedelai; perisa identik alami vanili; pelapis (carnauba wax).	Toko Indomaret
10000129	Ceres Hagelslag Rice Choco Festive 80G 	10000	0	https://assets.klikindomaret.com/products/10000129/10000129_thumb.jpg?Version.20.01.1.01	Cokelat meses terbaik yang terbuat dari bahan pilihan dengan rasa dan kualitas terbaik.	Gula; kakao massa; lemak kakao; bubuk whey; pengemulsi lesitin kedelai; pelapis (syelak); perisa identik alami (vanili; jeruk); pewarna (tartrazin CI 19148; eritrosin CI45430; biru berlian CI 42090).	Toko Indomaret
20093336	Diabetasol Zero Calorie Sweetener 100X1g 	76600	0	https://assets.klikindomaret.com/products/20093336/20093336_thumb.jpg?Version.20.01.1.01	Diabetasol No Calorie Sweetener merupakan pemanis penganti gula yang diformulasi khusus untuk para pengidap diabetes. Mengandung Suklarosa yang aman dikonsumsi; serta dibuat tanpa kandungan kalori sehingga mempermudah pengaturan kalori sajian.	Laktosa; pemanis buatan sukrolosa; antioksidan natrium askorbat.	Toko Indomaret
20042356	Diabetasol Zero Calorie Sweetener 50'S 50X1g 	42300	0	https://assets.klikindomaret.com/products/20042356/20042356_thumb.jpg?Version.20.01.1.01	Diabetasol No Calorie Sweetener 50G merupakan pemanis penganti gula yang diformulasi khusus untuk para pengidap diabetes. Mengandung Suklarosa yang aman dikonsumsi; serta dibuat tanpa kandungan kalori sehingga mempermudah pengaturan kalori sajian. Tak han	N/A	Toko Indomaret
20081740	Ellenka Fiber Creme 100G 	13800	0	https://assets.klikindomaret.com/products/20081740/20081740_thumb.jpg?Version.20.01.1.01	Idealnya; kita mengonsumsi serat yakni 30 gram/ hari. Namun faktanya; rata-rata konsumsi serat penduduk Indonesia masih kurang; yakni baru sekitar 10;5 gram per hari. Hal ini tentunya akan membuat sistem pencernaan menjadi tidak sehat.	Isomalto-Oligosakarida; Minyak Nabati; Natrium Kaseinat. Penstabil Fosfat; Pengemulsi Nabati; Anti Kempal. Tanpa Pemanis Buatan; Tanpa Pengawet	Toko Indomaret
10036853	Energen Cereal & Susu Instant Vanilla 5X32G 	11000	0	https://assets.klikindomaret.com/products/10036853/10036853_thumb.jpg?Version.20.01.1.01	Minuman serbuk sereal dan susu yang bernutrisi membantu menambah asupan gizi dengan rasa vanilla	Gula; krimer; terigu; susu bubuk; perisa vanilla; jagung; oat; kalsium karbonat; garam; premiks vitamin; telur; ektrak malt.	Toko Indomaret
20126111	Energen Cereal Instant Champion Coklat 4X35G 	9400	0	https://assets.klikindomaret.com/products/20126111/20126111_thumb.jpg?Version.20.01.1.01	Energen Champion; minuman cokelat dengan susu; malt; 8 vitamin; dan telur membantu memenuhi kebutuhan gizi anda sekeluarga.	N/A	Toko Indomaret
20001606	Energen Cereal Instant Kacang Hijau 10X35G 	23200	0	https://assets.klikindomaret.com/products/20001606/20001606_thumb.jpg?Version.20.01.1.01	Minuman serbuk sereal dan susu yang bernutrisi membantu menambah asupan gizi dengan rasa kacang hijau	Gula; Krimer nabati; kacang hijau (14.28%); tepung terigu (8.2%); susu bubuk (7.95%); jagung; oat; kalsium karbonat; garam; pengemulsi nabati (lesitin kedelai); perisa sintetik; premiks vitamin (A;B1;B2;B9;asam folat;B12;D dan E); natrium askorbat (vitamin C); telur bubuk (0.01%); Ekstrak Malt.	Toko Indomaret
20103565	Energen Cereal Instant Kurma 10X30g 	25800	0	https://assets.klikindomaret.com/products/20103565/20103565_thumb.jpg?Version.20.01.1.01	Energen minuman serbuk sereal dan susu bersinergi dengan kurma pilihan membantu menambah asupan gizi anda sekeluarga.	Gula; susu bubuk (28.7%); krimer nabati; tepung terigu (9.59%); jagung; perisa sintetik; oat; pewarna alami karamel kelas I dan II; kalsium. karamel; garam; kurma (0.1%); pengemulsi lestitin kedelai; vitamin A; B1; B2; B6; asam folat; B12; D; dan E; ekstrak malt.	Toko Indomaret
20001605	Energen Sereal & Susu Cokelat 10X34g 	23200	0	https://assets.klikindomaret.com/products/20001605/20001605_thumb.jpg?Version.20.01.1.01	Minuman serbuk sereal dan susu yang bernutrisi membantu menambah asupan gizi dengan rasa coklat	Gula; krimer; terigu; susu bubuk; kakao bubuk; jagung; oat; kalsium karbonat; garam; premiks vitamin; telur; ektrak malt.	Toko Indomaret
10003340	Energen Sereal & Susu Cokelat 5X34g 	11000	0	https://assets.klikindomaret.com/products/10003340/10003340_thumb.jpg?Version.20.01.1.01	Minuman serbuk sereal dan susu yang bernutrisi membantu menambah asupan gizi dengan rasa coklat	Gula; krimer; terigu; susu bubuk; kakao bubuk; jagung; oat; kalsium karbonat; garam; premiks vitamin; telur; ektrak malt.	Toko Indomaret
20001604	Energen Sereal & Susu Vanila 10X32g 	23200	0	https://assets.klikindomaret.com/products/20001604/20001604_thumb.jpg?Version.20.01.1.01	Minuman serbuk sereal dan susu yang bernutrisi membantu menambah asupan gizi dengan rasa vanilla	Gula; krimer; terigu; susu bubuk; perisa vanilla; jagung; oat; kalsium karbonat; garam; premiks vitamin; telur; ektrak malt.	Toko Indomaret
20127831	Fitbar Cheese Fitbar 20G 	5300	0	https://assets.klikindomaret.com/products/20127831/20127831_thumb.jpg?Version.20.01.1.01	Fitbar merupakan camilan sehat yang terbuat dari paduan bahan oat; quinoa dan whole wheat sebagai sumber serat. Camilan ini diolah dengan kandungan yang baik; bebas kolesterol; bebas lemak; dan sangat rendah kalori. Manfaatnya yang besar dapat menjaga kesehatan jantung; menurunkan resiko kanker; menurunkan kolesterol serta menstabilkan gula darah. Dengan mengkonsumsinya setiap hari; tubuh akan sehat dan berat badan akan terjaga dengan seimbang.	N/A	Warehouse Jakarta 1
10004823	Flora Madu Tropis 350Ml 	57700	0	https://assets.klikindomaret.com/products/10004823/10004823_thumb.jpg?Version.20.01.1.01	Madu Flora Tropis dihasilkan dari lebah yang menghisap aneka ragam nektar bunga alami di hutan tropis Indonesia sehingga madu ini memiliki cita rasa yang tidak seragam ( rsasa dan aroma madu bervariasi)	N/A	Toko Indomaret
20109716	Goldenfil Spread Choco Crunchy 350g 	33300	0	https://assets.klikindomaret.com/products/20109716/20109716_thumb.jpg?Version.20.01.1.01	Goldenfil Choco Crunchy Chocolate Selai Coklat Crunchy merupakan selai coklat yang memiliki tambahan sensasi renyah; Garing coklat. Dengan Aroma dan Rasa Coklat yang Gurih dan kuat. GOLDENFIL Chocolate Crunchy sangat cocok untuk olesan roti dan lapisan cake.	N/A	Toko Indomaret
20004032	Indomaret Chocolate Meises 90G 	4900	0	https://assets.klikindomaret.com/products/20004032/20004032_thumb.jpg?Version.20.01.1.01	Rasa dan aroma yang nikmat serta butiran coklatnya yang ernyah; cocok untuk roti; kue dan snack pilihan keluarga anda.	Gula; lemak nabati; bubuk coklat; susu bubuk lesitin (kedelai); vanilin.	Toko Indomaret
20112450	Indomaret Coklat Meises 225g 	11200	0	https://assets.klikindomaret.com/products/20112450/20112450_thumb.jpg?Version.20.01.1.01	Rasa dan aroma yang nikmat serta butiran coklatnya yang enak; cocok untuk roti; kue dan snack pilihan keluarga anda.	N/A	Toko Indomaret
20039235	Indomaret Coklat Meises Mix 90G 	4900	0	https://assets.klikindomaret.com/products/20039235/20039235_thumb.jpg?Version.20.01.1.01	Rasa dan aroma yang nikmat serta butiran coklatnya yang enak; cocok untuk roti; kue dan snack pilihan keluarga anda.	Gula; lemak nabati; bubuk coklat; susu bubuk lesitin (kedelai); vanilin.	Toko Indomaret
20096796	Indomaret Spread Chocolate 160G 	17000	0	https://assets.klikindomaret.com/products/20096796/20096796_thumb.jpg?Version.20.01.1.01	Olesan cokelat yang dibuat dari pasta cokelat berkualitas.	Pasta cokelat; susu bubuk; cokelat bubuk; pengemulsi.	Toko Indomaret
10005455	Kellogg's Cereal Corn Flakes Classic 150G 	22800	0	https://assets.klikindomaret.com/products/10005455/10005455_thumb.jpg?Version.20.01.1.01	Kellogs Corn Flakes sereal sarapan jagung yang sehat	Jagung (89%); Gula; Ekstrak Malt; Garam; Premiks Vitamin dan Mineral (Vitamin (A; B1; B2; B3; B6; B9; B12; E dan Mineral Zat Besi)	Toko Indomaret
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (warehousename, address) FROM stdin;
Toko Indomaret	Jl. X
Warehouse Jakarta 1	Jl. Y
\.


--
-- Data for Name: warehouse_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse_phone (warehousename, phone_number) FROM stdin;
\.


--
-- Name: cartproduct cartproduct_cart_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartproduct
    ADD CONSTRAINT cartproduct_cart_id_key UNIQUE (cart_id);


--
-- Name: cartproduct cartproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartproduct
    ADD CONSTRAINT cartproduct_pkey PRIMARY KEY (cart_id);


--
-- Name: credit_card credit_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_pkey PRIMARY KEY (payment_id);


--
-- Name: customers customers_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_id_key UNIQUE (customer_id);


--
-- Name: customers_phone customers_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_phone
    ADD CONSTRAINT customers_phone_pkey PRIMARY KEY (customer_id, phonenumber);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: debit_card debit_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debit_card
    ADD CONSTRAINT debit_card_pkey PRIMARY KEY (payment_id);


--
-- Name: fillingcart fillingcart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fillingcart
    ADD CONSTRAINT fillingcart_pkey PRIMARY KEY (plu, cart_id);


--
-- Name: online_payment online_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_payment
    ADD CONSTRAINT online_payment_pkey PRIMARY KEY (payment_id);


--
-- Name: payment payment_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_id_key UNIQUE (payment_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (plu);


--
-- Name: products products_plu_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_plu_key UNIQUE (plu);


--
-- Name: warehouse_phone warehouse_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_phone
    ADD CONSTRAINT warehouse_phone_pkey PRIMARY KEY (warehousename, phone_number);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehousename);


--
-- Name: warehouse warehouse_warehousename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_warehousename_key UNIQUE (warehousename);


--
-- Name: cartproduct cartproduct_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartproduct
    ADD CONSTRAINT cartproduct_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: cartproduct cartproduct_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartproduct
    ADD CONSTRAINT cartproduct_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: credit_card credit_card_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: customers_phone customers_phone_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_phone
    ADD CONSTRAINT customers_phone_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: debit_card debit_card_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debit_card
    ADD CONSTRAINT debit_card_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: fillingcart fillingcart_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fillingcart
    ADD CONSTRAINT fillingcart_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cartproduct(cart_id);


--
-- Name: fillingcart fillingcart_plu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fillingcart
    ADD CONSTRAINT fillingcart_plu_fkey FOREIGN KEY (plu) REFERENCES public.products(plu);


--
-- Name: online_payment online_payment_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_payment
    ADD CONSTRAINT online_payment_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: products products_warehousename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_warehousename_fkey FOREIGN KEY (warehousename) REFERENCES public.warehouse(warehousename);


--
-- Name: warehouse_phone warehouse_phone_warehousename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_phone
    ADD CONSTRAINT warehouse_phone_warehousename_fkey FOREIGN KEY (warehousename) REFERENCES public.warehouse(warehousename);


--
-- PostgreSQL database dump complete
--

