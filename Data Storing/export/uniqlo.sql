--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Homebrew)
-- Dumped by pg_dump version 15.3 (Homebrew)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: justin
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category character varying(25)
);


ALTER TABLE public.categories OWNER TO justin;

--
-- Name: products; Type: TABLE; Schema: public; Owner: justin
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    description text,
    rating numeric,
    review_count integer,
    category_id integer NOT NULL,
    subcategory_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO justin;

--
-- Name: products_colors; Type: TABLE; Schema: public; Owner: justin
--

CREATE TABLE public.products_colors (
    product_id integer NOT NULL,
    color character varying(15) NOT NULL
);


ALTER TABLE public.products_colors OWNER TO justin;

--
-- Name: products_sizes; Type: TABLE; Schema: public; Owner: justin
--

CREATE TABLE public.products_sizes (
    product_id integer NOT NULL,
    size character varying(15) NOT NULL
);


ALTER TABLE public.products_sizes OWNER TO justin;

--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: justin
--

CREATE TABLE public.subcategories (
    subcategory_id integer NOT NULL,
    subcategory character varying(45)
);


ALTER TABLE public.subcategories OWNER TO justin;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: justin
--

COPY public.categories (category_id, category) FROM stdin;
1	Atasan
2	Luaran
3	Bawahan
4	Dalaman
5	Loungewear
6	Aksesoris
7	Sport utility wear
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: justin
--

COPY public.products (product_id, name, price, description, rating, review_count, category_id, subcategory_id) FROM stdin;
1	T-Shirt Dry Warna Kerah Bulat Lengan Pendek	99000	T-shirt Pria yang lembut dan berkilau dengan teknologi DRY. Simpel dan cocok dipakai untuk sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	999	1	1
2	T-Shirt Dry Warna Kerah V Lengan Pendek	99000	T-shirt Pria yang lembut dan berkilau dengan teknologi DRY. Simpel dan cocok dipakai untuk sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	359	1	1
3	T-Shirt SUPIMA Katun Kerah Bulat Lengan Pendek	199000	T-shirt dari bahan 100% SUPIMA cotton premium, kini diperbarui dengan bahan yang lebih tahan lama.	4.77	141	1	1
4	T-Shirt Kerah Bulat Lengan Pendek Uniqlo U	199000	T-shirt Pria yang detailnya didesain secara teliti dan memiliki potongan yang stylish. Miliki juga koleksi Wanita dan kenakan sebagai baju couple.	4.93	271	1	1
5	AIRism Katun T-Shirt Oversize Garis Uniqlo U	249000	T-shirt oversized Pria berbahan katun 'AIRism' yang lembut. Menampilkan desain motif bergaris. Terbuat dari polyester daur ulang.	4.74	104	1	1
6	AIRism Katun T-Shirt Oversize Kerah Bulat Uniqlo U	249000	T-shirt oversized Pria dari bahan 'AIRism' lembut dengan tampilan katun. Menggabungkan tampilan stylish dengan potongan yang nyaman dan santai.	4.9	434	1	1
7	AIRism Katun T-Shirt Oversize Kerah Bulat Uniqlo U	249000	Tampilan katun dengan performa AIRism. Desain neckline yang memberi tampilan clean dan rapi.	4.84	999	1	1
8	T-Shirt Oversized Garis Lengan Half (Lebar)	249000	T-shirt Pria dengan potongan oversized. Bahan kasual yang bentuknya tidak mudah berubah setelah dicuci.	4.83	12	1	1
9	T-Shirt Oversized Garis Lengan Half (Reguler)	249000	T-shirt Pria dari bahan 100% katun yang tahan lama. Melalui proses pre-washed untuk tampilan kasual dan nyaman.	5	1	1	1
10	T-Shirt Oversize Garis Lengan Half	249000	T-shirt dengan bahan 100% katun. Desain dan potongan yang menawan.	5	28	1	1
11	T-Shirt Oversize Garis Lengan Half (Lebar)	249000	T-shirt dengan bahan 100% katun. Desain dan potongan yang menawan.	4.78	40	1	1
12	T-Shirt Oversize Garis Lengan Half	249000	T-shirt dengan bahan 100% katun. Desain dan potongan yang menawan.	4.9	31	1	1
13	T-Shirt Oversize Saku Kerah Bulat Lengan Half	249000	T-shirt oversized untuk Pria dan Wanita, dari bahan yang tahan lama dengan gaya laid-back.	4.84	238	1	1
14	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria dengan teknologi 'DRY-EX' yang cepat kering. Bahan mesh sejuk pada bagian belakang untuk menjaga Anda tetap segar.	4.75	4	1	1
15	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria berperforma tinggi dengan fitur 'DRY-EX' yang cepat kering. Kini terasa lebih ringan untuk kenyamanan yang lebih baik.	4.65	37	1	1
16	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria dengan teknologi Quick-drying 'DRY-EX', dilengkapi dengan 3 tipe mesh untuk kesegaran tahan lama. Terbuat dari polyester daur ulang.	4.87	114	1	1
17	T-Shirt DRY-EX Kerah Bulat Motif	249000	T-shirt Pria dengan bahan cepat kering dan motif grafis yang stylish. Terbuat dari polyester daur ulang.	4.79	39	1	1
18	T-Shirt DRY-EX Kerah Bulat Lengan Pendek (Mapping)	249000	T-shirt Pria dan Wanita dengan performa tinggi yang sejuk dan nyaman. Cocok untuk berolahraga.	4.79	291	1	1
19	T-Shirt Grafis Lengan Pendek Roger Federer	299000	Koleksi kolaborasi dengan Roger Federer. Bahan katun premium dengan logo RF.	4.98	50	1	1
20	Kaos Polo Dry Pique Lengan Pendek	299000	Kaos Polo lembut dan tahan lama dari bahan campuran katun dan poliester daur ulang. Produk basic yang selalu disempurnakan. Bentuk tidak mudah berubah setelah dicuci.	4.86	307	1	1
21	Kaos Polo Dry Pique Lengan Pendek	299000	Kaos Polo Pria yang lembut, ringan, dan nyaman. Terdapat detail desain yang cermat.	4.82	537	1	1
22	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Kaos Polo 'AIRism' yang lembut dan sejuk. Tampilan terlihat berkualitas pada permukaan, namun nyaman dikenakan. Cocok untuk tampilan kasual atau rapi.	4.86	132	1	1
23	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos polo dengan tekstur lembut, ringan, dan sejuk. Kerah berkancing yang cocok untuk tampilan formal.	4.81	21	1	1
24	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos Polo yang super lembut, ringan, dan sejuk. Hadir dengan kerah berkancing yang cocok untuk kegiatan formal.	4.76	45	1	1
25	AIRism Kaos Polo Lengan Pendek (Full Open)	299000	Kaos Polo yang super lembut, ringan, dan sejuk.	4.85	181	1	1
26	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Polo Pria yang terasa nyaman dan sejuk dikenakan. Didesain secara cermat untuk tampilan yang ramping.	4.72	110	1	1
27	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Kaos polo Pria dengan kesejukan AIRism. Desain yang clean dan elegan.	4.74	159	1	1
28	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos polo pria yang terasa fresh dan selembut sutra. Dengan tampilan minimalis.	4.73	70	1	1
29	Kaos Polo DRY-EX Lengan Pendek (Gradasi)	299000	Kaos Polo Pria berbahan 'DRY-EX' yang cepat kering dengan panel mesh di beberapa bagian. Desain warna alami cocok untuk pakaian kasual atau olahraga. Terbuat dari polyester daur ulang.	4.96	24	1	1
30	T-Shirt Oversize Lengan Half (Raglan)	249000	T-shirt dari bahan 100% katun, dengan aksen pre-washed untuk tampilan kasual. Desain blok warna yang kontras.	4.8	74	1	1
31	AIRism Katun T-Shirt Tanpa Lengan	199000	T-shirt Pria dari bahan 'AIRism' yang halus dengan tampilan katun. Desain dan potongan basic serbaguna.	4.78	49	1	1
32	T-Shirt Waffle Kerah Bulat Lengan Panjang	299000	T-shirt Pria dari bahan waffle lembut dengan tekstur tebal dan berkontur. T-shirt ringan dengan tekstur yang khas.	4.9	10	1	2
33	T-Shirt Waffle Kerah Henley Lengan Panjang	299000	T-shirt dengan bahan waffle bertekstur untuk tampilan kasual. Desain kerah dan hem klasik. Miliki untuk Pria dan Wanita, dan kenakan sebagai baju couple.	4.91	115	1	2
34	T-Shirt Katun Washed Garis Kerah Bulat Lengan Panjang	299000	T-shirt Pria berbahan 100% katun yang lembut dan tahan lama. Potongan oversized yang mudah dipadupadankan.	5	1	1	2
35	T-Shirt Katun Washed Kerah Bulat Lengan Panjang	299000	T-shirt Pria berbahan 100% katun yang lembut dan tahan lama. Potongan oversized yang mudah dipadupadankan.	5	7	1	2
36	T-Shirt Katun Washed Kerah Bulat Lengan Panjang	299000	T-shirt yang simpel dengan detail bahan dan siluet yang luar biasa. Terdapat saku di bagian dada sehingga bisa dikenakan dengan sendirinya.	4.96	24	1	2
37	T-Shirt Soft Touch Kerah Turtle Lengan Panjang	199000	T-shirt Pria dengan finishing dan ukuran yang diperbarui untuk kenyamanan. Berbahan brushed sehingga lembut saat disentuh.	4.95	108	1	2
38	T-Shirt Soft Touch Kerah Bulat Lengan Panjang	199000	T-shirt Pria dengan finishing dan ukuran yang diperbarui sehingga fit terasa lebih nyaman. Bahan brushed sehingga lembut saat disentuh.	4.92	321	1	2
39	T-Shirt Soft Touch Kerah Turtle Lengan Panjang	199000	T-shirt Pria dan Wanita dengan tekstur brushed yang lembut. Desain turtle neck sehingga hangat dikenakan.	4.9	172	1	2
40	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	5	1	1	3
41	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	4.33	3	1	3
42	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	5	2	1	3
43	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	\N	\N	1	3
44	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	5	2	1	3
45	UT Naruto Lengan Pendek	199000	Desain orisinal untuk merayakan anniversary ke-20 NARUTO, kini hadir di UT	4.75	4	1	3
46	Peace For All T-Shirt miffy Favorite Things Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	5	1	1	3
47	Peace For All T-Shirt Magnum Photos Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	5	8	1	3
48	Peace For All T-Shirt Peanuts Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	5	32	1	3
49	Peace For All T-Shirt Wim Wenders Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	4.67	9	1	3
50	Peace For All T-Shirt Basquiat Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	4.25	4	1	3
51	Peace For All T-Shirt Roger Federer Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	4.78	9	1	3
52	Peace For All T-Shirt Lisa Larson Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	4.93	15	1	3
53	Peace For All T-Shirt Akamai Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	5	5	1	3
54	UT Disney Good Vibes Lengan Pendek	199000	Sebuah karya seni spesial yang menggambarkan Mickey Mouse bersama teman-temannya mengikuti irama musik di sebuah pesta, telah hadir di UT!	\N	\N	1	3
55	UT Disney Good Vibes Lengan Pendek	199000	Sebuah karya seni spesial yang menggambarkan Mickey Mouse bersama teman-temannya mengikuti irama musik di sebuah pesta, telah hadir di UT!	\N	\N	1	3
56	UT Disney Good Vibes Lengan Pendek	199000	Sebuah karya seni spesial yang menggambarkan Mickey Mouse bersama teman-temannya mengikuti irama musik di sebuah pesta, telah hadir di UT!	5	3	1	3
57	UT Disney Good Vibes Lengan Pendek	199000	Sebuah karya seni spesial yang menggambarkan Mickey Mouse bersama teman-temannya mengikuti irama musik di sebuah pesta, telah hadir di UT!	\N	\N	1	3
58	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	4.92	13	1	3
59	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	4.85	13	1	3
60	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	5	13	1	3
61	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	5	8	1	3
62	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	5	5	1	3
63	UT My Hero Academia Lengan Pendek	199000	Serial TV anime populer My Hero Academia telah hadir di UT!	\N	\N	1	3
64	UT Pixar Art Lengan Pendek	199000	Koleksi UT yang menampilkan desain unik dan belum pernah dilihat sebelumnya yang diciptakan oleh para seniman kontemporer.	5	2	1	3
65	UT Pixar Art Lengan Pendek	199000	Koleksi UT yang menampilkan desain unik dan belum pernah dilihat sebelumnya yang diciptakan oleh para seniman kontemporer.	5	2	1	3
66	UT Pixar Art Lengan Pendek	199000	Koleksi UT yang menampilkan desain unik dan belum pernah dilihat sebelumnya yang diciptakan oleh para seniman kontemporer.	5	8	1	3
67	UT Pixar Art Lengan Pendek	199000	Koleksi UT yang menampilkan desain unik dan belum pernah dilihat sebelumnya yang diciptakan oleh para seniman kontemporer.	5	10	1	3
68	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	\N	\N	1	3
69	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	4.5	2	1	3
70	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	5	1	1	3
71	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	5	1	1	3
72	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	\N	\N	1	3
73	UT L.A. Eats Lengan Pendek	249000	Sebuah koleksi yang menampilkan tiga restoran di Los Angeles yang terkenal di komunitas kuliner.	5	1	1	3
74	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	\N	\N	1	3
75	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	1	1	3
76	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	1	1	3
77	UT Shochiku Kabuki Lengan Pendek	199000	T-shirt dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	5	2	1	3
78	UT Shochiku Kabuki Lengan Pendek	199000	T-shirt dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	\N	\N	1	3
79	UT Shochiku Kabuki Lengan Pendek	199000	T-shirt dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	\N	\N	1	3
80	UT Pokemon Lengan Pendek	199000	Koleksi Pokemon UT kini tersedia. Merayakan persahabatan antara Pokemon dan Trainer!	3	1	1	3
81	UT Pokemon Lengan Pendek	199000	Koleksi Pokemon UT kini tersedia. Merayakan persahabatan antara Pokemon dan Trainer!	4.92	24	1	3
82	UT Pokemon Lengan Pendek	199000	Koleksi Pokemon UT kini tersedia. Merayakan persahabatan antara Pokemon dan Trainer!	5	1	1	3
83	UT Pokemon Lengan Pendek	199000	Koleksi Pokemon UT kini tersedia. Merayakan persahabatan antara Pokemon dan Trainer!	5	10	1	3
84	Boks Dragon Ball	1690000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya. Produk ini tidak dapat ditukar atau dikembalikan.	5	4	1	3
85	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	5	5	1	3
86	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	5	3	1	3
87	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	4.91	11	1	3
88	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	5	5	1	3
89	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	4.75	8	1	3
90	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	5	9	1	3
91	UT Dragon Ball Lengan Pendek	199000	History of Dragon Ball. Melihat kembali sejarah petualangan dan pertempuran sengit Goku dan teman-temannya.	4.92	13	1	3
92	UT (T-Shirt) UTme Grafis Lengan Pendek (GOJEK)	249000	T-shirt dari bahan 100% katun yang tahan lama dan terasa halus.	5	2	1	3
93	UT (T-Shirt) UTme Grafis Lengan Pendek (TOLAK ANGIN)	249000	T-shirt dari bahan 100% katun yang tahan lama dan terasa halus.	5	2	1	3
94	UT (T-Shirt) MFA Lengan Pendek (Bali)	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	6	1	3
95	UT (T-Shirt) MFA Lengan Pendek (Madura)	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	6	1	3
96	UT Meitantei Conan Lengan Pendek (Detective Conan)	199000	Koleksi UT dari manga populer Detective Conan (Case Closed)! Menampilkan desain keren dari manga original dan TV anime.	5	39	1	3
97	UT ARCHIVE Lengan Pendek (Andy Warhol)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	3.5	2	1	3
98	UT ARCHIVE Lengan Pendek (Andy Warhol)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	4.78	9	1	3
99	UT ARCHIVE Lengan Pendek (Andy Warhol)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	5	2	1	3
100	UT ARCHIVE Lengan Pendek (Andy Warhol)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	5	2	1	3
101	UT ARCHIVE Lengan Pendek (Basquiat)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	4.94	16	1	3
102	UT ARCHIVE Lengan Pendek (Basquiat)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	5	11	1	3
103	UT ARCHIVE Lengan Pendek (Basquiat)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	5	5	1	3
104	UT ARCHIVE Lengan Pendek (Basquiat)	199000	Abadi selamanya. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	5	6	1	3
105	UT My style, My ghibli Lengan Pendek	299000	Peringatan Pameran Studio Ghibli. My Neighbor Totoro akan tampil pertama kali dalam koleksi UT. T-shirt dan tas dijual satu set. Warna tas tidak bisa dipilih.	4.78	46	1	3
106	UT My style, My ghibli Lengan Pendek	299000	Peringatan Pameran Studio Ghibli. My Neighbor Totoro akan tampil pertama kali dalam koleksi UT. T-shirt dan tas dijual satu set. Warna tas tidak bisa dipilih.	4.71	35	1	3
107	UT My style, My ghibli Lengan Pendek	299000	Peringatan Pameran Studio Ghibli. My Neighbor Totoro akan tampil pertama kali dalam koleksi UT. T-shirt dan tas dijual satu set. Warna tas tidak bisa dipilih.	4.95	37	1	3
108	UT My style, My ghibli Lengan Pendek	299000	Peringatan Pameran Studio Ghibli. My Neighbor Totoro akan tampil pertama kali dalam koleksi UT. T-shirt dan tas dijual satu set. Warna tas tidak bisa dipilih.	4.85	40	1	3
216	Celana Sweat Garis Samping	399000	Celana training Pria dari bahan katun yang lembut. Dilengkapi dengan desain garis sporty.	\N	\N	1	5
109	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	10	1	3
110	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	1	1	3
111	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	4.83	6	1	3
112	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	4.8	5	1	3
113	UT Mickey Stands Lengan Pendek	199000	T-shirt yang menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	4.88	17	1	3
114	UT Mickey Stands Lengan Pendek	199000	T-shirt yang menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	4.86	14	1	3
115	UT Mickey Stands Lengan Pendek	199000	T-shirt yang menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	2	1	3
116	Peace For All T-Shirt Hana Tajima Lengan Pendek	199000	Sebuah t-shirt yang memiliki kekuatan untuk menyebarkan perdamaian.	\N	\N	1	3
117	Peace For All T-Shirt JW Anderson Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari proyek ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
118	Peace For All T-Shirt Christophe Lemaire Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari proyek ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
119	Peace For All T-Shirt Ines De La Fressange Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	5	9	1	3
120	Peace For All T-Shirt Tadao Ando Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
121	Peace For All T-Shirt Kosuke Kawamura Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
122	Peace For All T-Shirt Kashiwa Sato Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
123	Peace For All T-Shirt Rei Inamoto Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
124	Peace For All T-Shirt Shingo Kunieda Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
125	Peace For All T-Shirt Kei Nishikori Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
126	Peace For All T-Shirt Ayumu Hirano Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
127	Peace For All T-Shirt Adam Scott Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
128	Peace For All T-Shirt Gordon Reid Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
129	Peace For All T-Shirt Shinya Yamanaka Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
130	Peace For All T-Shirt Haruki Murakami Lengan Pendek	199000	UNIQLO UT FOR PEACE. Sebagian keuntungan* yang dihasilkan dari project ini akan membantu masyarakat di seluruh dunia. Ikuti movement kami.	\N	\N	1	3
131	UT UTGP 2023 MFA Lengan Pendek	199000	Koleksi UT spesial ini menampilkan 13 karya pemenang dari UT GRAND PRIX yang sangat didambakan, dan terbuka bagi siapa saja yang memiliki kreativitas dari seluruh dunia!	4.94	48	1	3
132	UT UTGP 2023 MFA Lengan Pendek	199000	Koleksi UT spesial ini menampilkan 13 karya pemenang dari UT GRAND PRIX yang sangat didambakan, dan terbuka bagi siapa saja yang memiliki kreativitas dari seluruh dunia!	5	7	1	3
133	UT UTGP 2023 MFA Lengan Pendek	199000	Koleksi UT spesial ini menampilkan 13 karya pemenang dari UT GRAND PRIX yang sangat didambakan, dan terbuka bagi siapa saja yang memiliki kreativitas dari seluruh dunia!	5	9	1	3
134	UT UTGP 2023 MFA Lengan Pendek	199000	Koleksi UT spesial ini menampilkan 13 karya pemenang dari UT GRAND PRIX yang sangat didambakan, dan terbuka bagi siapa saja yang memiliki kreativitas dari seluruh dunia!	4.83	6	1	3
135	UT UTGP 2023 MFA Lengan Pendek	199000	Koleksi UT spesial ini menampilkan 13 karya pemenang dari UT GRAND PRIX yang sangat didambakan, dan terbuka bagi siapa saja yang memiliki kreativitas dari seluruh dunia!	5	5	1	3
136	UT Louvre Lengan Pendek	249000	T-shirt grafis yang menampilkan desain bold masterpiece Louvre yang dikembangkan di Paris.	5	4	1	3
137	UT Louvre Lengan Pendek	249000	T-shirt grafis yang menampilkan desain bold masterpiece Louvre yang dikembangkan di Paris.	5	5	1	3
138	UT Splatoon 3 Lengan Pendek	199000	Koleksi spesial dari kolaborasi bersama franchise game shooter yang banyak disukai, Splatoon, menampilkan seri game terbarunya.	5	3	1	3
139	UT Splatoon 3 Lengan Pendek	199000	Koleksi spesial dari kolaborasi bersama franchise game shooter yang banyak disukai, Splatoon, menampilkan seri game terbarunya.	5	3	1	3
140	UT Splatoon 3 Lengan Pendek	199000	Koleksi spesial dari kolaborasi bersama franchise game shooter yang banyak disukai, Splatoon, menampilkan seri game terbarunya.	5	6	1	3
141	UT Legends of Graphic Lengan Pendek (Herb Lubalin)	199000	Memperkenalkan T-shirt grafis yang menampilkan tren desain dari tahun 60 & 70-an!	4.88	16	1	3
142	UT Legends of Graphic Lengan Pendek (Paul Rand)	199000	Memperkenalkan T-shirt grafis yang menampilkan tren desain dari tahun 60 & 70-an!	5	4	1	3
143	UT Shin Kamen Rider Lengan Pendek	199000	T-shirt yang menampilkan seri The Shin karya pengarang berbakat Hideaki Anno. Temukan 'pahlawan super' asal Jepang dalam koleksi t-shirt ini.	5	11	1	3
144	UT Shin Ultraman Lengan Pendek	199000	T-shirt yang menampilkan seri The Shin karya pengarang berbakat Hideaki Anno. Temukan 'pahlawan super' asal Jepang dalam koleksi t-shirt ini.	5	15	1	3
145	UT Shin Evangelion Lengan Pendek	199000	T-shirt yang menampilkan seri The Shin karya pengarang berbakat Hideaki Anno. Temukan 'pahlawan super' asal Jepang dalam koleksi t-shirt ini.	4.84	19	1	3
146	UT PlayStation Lengan Pendek	199000	Karya seni original UT yang menampilkan konsol game yang ikonik, PlayStation!	4.96	26	1	3
147	UT ARCHIVE Lengan Pendek (Naruto)	199000	Forever timeless. Wearing the famous scenes with original designs revived from UT ARCHIVE!	4.83	18	1	3
148	UT ARCHIVE Lengan Pendek (Naruto)	199000	Forever timeless. Wearing the famous scenes with original designs revived from UT ARCHIVE!	4.88	26	1	3
149	UT ARCHIVE Lengan Pendek (Naruto)	199000	Forever timeless. Wearing the famous scenes with original designs revived from UT ARCHIVE!	5	23	1	3
150	UT Yusuke Hanai Lengan Pendek	199000	Ambil langkah kecil menuju masa depan. T-shirt dengan pesan positif oleh seniman kontemporer asal Jepang, Yusuke Hanai.	4.78	9	1	3
151	UT Yusuke Hanai Lengan Pendek	199000	Ambil langkah kecil menuju masa depan. T-shirt dengan pesan positif oleh seniman kontemporer asal Jepang, Yusuke Hanai.	4.95	20	1	3
152	UT Yusuke Hanai Lengan Pendek	199000	Ambil langkah kecil menuju masa depan. T-shirt dengan pesan positif oleh seniman kontemporer asal Jepang, Yusuke Hanai.	4.91	22	1	3
153	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	4.75	12	1	3
154	UT Mickey Stands Lengan Pendek	199000	Menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	2	1	3
155	UT Mickey Stands Lengan Pendek	199000	T-shirt yang menampilkan pose Mickey Mouse yang ikonik, seperti yang digambarkan oleh para pencipta Disney terkemuka.	5	10	1	3
156	Peace For All T-Shirt F. Risso Lengan Pendek	199000	A single T-shirt has the power to spread peace.	\N	\N	1	3
157	Peace For All T-Shirt Julian Opie Lengan Pendek	199000	A single T-shirt has the power to spread peace.	\N	\N	1	3
158	Peace For All T-Shirt Haruka Ayase Lengan Pendek	199000	A single T-shirt has the power to spread peace.	\N	\N	1	3
159	Peace For All T-Shirt Daido Moriyama Lengan Pendek	199000	A single T-shirt has the power to spread peace.	\N	\N	1	3
160	UT (T-Shirt) Hokusai Lengan Pendek	199000	A collection that highlights the multifaceted allure of Katsushika Hokusai's waterscapes.	\N	\N	1	3
161	UT (T-Shirt) Hokusai Lengan Pendek	199000	A collection that highlights the multifaceted allure of Katsushika Hokusai's waterscapes.	\N	\N	1	3
162	UT (T-Shirt) Hokusai Lengan Pendek	199000	A collection that highlights the multifaceted allure of Katsushika Hokusai's waterscapes.	\N	\N	1	3
163	UT (T-Shirt) Hokusai Lengan Pendek	199000	A collection that highlights the multifaceted allure of Katsushika Hokusai's waterscapes.	\N	\N	1	3
164	UT Disney Lengan Pendek	199000	The iconic Disney collection from the special project MAGIC FOR ALL is back!	\N	\N	1	3
165	UT Disney Lengan Pendek	199000	The iconic Disney collection from the special project MAGIC FOR ALL is back!	\N	\N	1	3
166	UT Bleach Lengan Pendek	199000	To celebrate the final chapter of the TV animation, Thousand-Year Blood War, the Soul Reapers and Quincies are now available as a UT graphic Tee!	\N	\N	1	3
167	UT Bleach Lengan Pendek	199000	To celebrate the final chapter of the TV animation, Thousand-Year Blood War, the Soul Reapers and Quincies are now available as a UT graphic Tee!	\N	\N	1	3
168	UT Bleach Lengan Pendek	199000	To celebrate the final chapter of the TV animation, Thousand-Year Blood War, the Soul Reapers and Quincies are now available as a UT graphic Tee!	\N	\N	1	3
169	UT Bleach Lengan Pendek	199000	To celebrate the final chapter of the TV animation, Thousand-Year Blood War, the Soul Reapers and Quincies are now available as a UT graphic Tee!	\N	\N	1	3
170	UT Bleach Lengan Pendek	199000	To celebrate the final chapter of the TV animation, Thousand-Year Blood War, the Soul Reapers and Quincies are now available as a UT graphic Tee!	\N	\N	1	3
171	UT Marvel X Mondo Lengan Pendek	199000	This t-shirt collection features supreme artworks that vividly depict classic MARVEL films, especially inspired by their movie posters.	\N	\N	1	3
172	UT Marvel X Mondo Lengan Pendek	199000	This t-shirt collection features supreme artworks that vividly depict classic MARVEL films, especially inspired by their movie posters.	\N	\N	1	3
173	UT Marvel X Mondo Lengan Pendek	199000	This t-shirt collection features supreme artworks that vividly depict classic MARVEL films, especially inspired by their movie posters.	\N	\N	1	3
174	UT Marvel X Mondo Lengan Pendek	199000	This t-shirt collection features supreme artworks that vividly depict classic MARVEL films, especially inspired by their movie posters.	\N	\N	1	3
175	UT Doraemon Lengan Pendek	199000	T-shirt yang dibuat dari 100% poliester daur ulang.	4.8	5	1	3
176	UT Doraemon Lengan Pendek	199000	T-shirt yang dibuat dari 100% poliester daur ulang.	4.8	10	1	3
177	UT Archive Lengan Pendek (Basquiat)	199000	Forever timeless. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	\N	\N	1	3
178	UT Archive Lengan Pendek (Basquiat)	199000	Forever timeless. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	\N	\N	1	3
179	UT Archive Lengan Pendek (Andy Warhol)	199000	Forever timeless. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	\N	\N	1	3
180	UT Archive Lengan Pendek (Andy Warhol)	199000	Forever timeless. Pilihan terbaik UT yang dijual di masa lalu kini tersedia kembali.	\N	\N	1	3
181	Kaos Polo Rugger Lengan Panjang (Reguler)	399000	Kaos polo Pria berdesain autentik dalam warna tradisional. Terdapat kancing yang mudah dipasang.	5	1	1	4
182	Kaos Polo Rugger Lengan Panjang (Lebar)	399000	Kaos polo Pria berdesain autentik dalam warna tradisional. Terdapat kancing yang mudah dipasang.	\N	\N	1	4
183	Kaos Polo Dry Pique Lengan Pendek (Tipping)	299000	Kaos polo Pria dengan desain dan potongan yang cocok untuk berbagai outfit. Dua garis di bagian kerah menambahkan aksen stylish.	4.87	39	1	4
184	Kaos Polo Dry Pique Garis (Reguler)	299000	Kaos Polo Pria yang lembut dan tahan lama dengan campuran katun serta poliester daur ulang. Pakaian esensial yang terus dikembangkan. Miliki untuk Pria dan Wanita, dan kenakan sebagai baju couple.	4.76	21	1	4
185	Kaos Polo Dry Pique Garis (Lebar)	299000	Kaos Polo Pria yang lembut dan tahan lama dengan campuran katun serta poliester daur ulang. Pakaian esensial yang terus dikembangkan. Miliki untuk Pria dan Wanita, dan kenakan sebagai baju couple.	4.82	33	1	4
186	Kaos Polo Dry Pique Lengan Pendek	299000	Kaos Polo lembut dan tahan lama dari bahan campuran katun dan poliester daur ulang. Produk basic yang selalu disempurnakan. Bentuk tidak mudah berubah setelah dicuci.	4.86	307	1	4
187	Kaos Polo Dry Pique Lengan Pendek	299000	Kaos Polo Pria yang lembut, ringan, dan nyaman. Terdapat detail desain yang cermat.	4.82	537	1	4
188	AIRism Kaos Polo Lengan Pendek (Full Open)	299000	Kaos Polo yang super lembut, ringan, dan sejuk.	4.85	181	1	4
189	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Kaos Polo 'AIRism' yang lembut dan sejuk. Tampilan terlihat berkualitas pada permukaan, namun nyaman dikenakan. Cocok untuk tampilan kasual atau rapi.	4.86	132	1	4
190	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos polo dengan tekstur lembut, ringan, dan sejuk. Kerah berkancing yang cocok untuk tampilan formal.	4.81	21	1	4
191	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos Polo yang super lembut, ringan, dan sejuk. Hadir dengan kerah berkancing yang cocok untuk kegiatan formal.	4.76	45	1	4
192	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Polo Pria yang terasa nyaman dan sejuk dikenakan. Didesain secara cermat untuk tampilan yang ramping.	4.72	110	1	4
193	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Kaos polo Pria dengan kesejukan AIRism. Desain yang clean dan elegan.	4.74	159	1	4
194	AIRism Kaos Polo Pique Lengan Pendek (Kerah Berkancing)	299000	Kaos polo pria yang terasa fresh dan selembut sutra. Dengan tampilan minimalis.	4.73	70	1	4
217	Celana Sweat (Garis Samping)	399000	Celana Sweat yang nyaman dan lembut. Terdapat aksen garis di bagian samping untuk tampilan yang ramping dan stylish.	4.86	14	1	5
195	Kaos Polo DRY-EX Lengan Pendek (Gradasi)	299000	Kaos Polo Pria berbahan 'DRY-EX' yang cepat kering dengan panel mesh di beberapa bagian. Desain warna alami cocok untuk pakaian kasual atau olahraga. Terbuat dari polyester daur ulang.	4.96	24	1	4
196	Kaos Polo DRY-EX Lengan Pendek	299000	Kaos Polo Pria yang terbuat dari bahan daur ulang. Sangat fungsional dan nyaman dipakai.	4.84	161	1	4
391	Jeans Slim Fit (Damaged)	599000	Celana denim Pria dengan tampilan autentik dan potongan lurus yang stylish.	5	2	3	15
197	Kaos Polo DRY-EX Lengan Pendek	299000	Kaos Polo 'DRY-EX' yang cepat kering dengan 3 tipe mesh untuk kesejukan yang tahan lama. Padankan dengan koleksi Pria Celana, cocok dipakai untuk kegiatan outdoor dan mobilitas sehari-hari. Terbuat dari poliester daur ulang.	4.88	172	1	4
198	AIRism Kaos Polo Pique Lengan Pendek	299000	Kaos polo performa tinggi untuk pria. Dengan siluet ramping, cocok dipakai untuk bekerja.	4.82	33	1	4
199	AIRism Kaos Polo Lengan Pendek (Kancing Full)	299000	Kaos polo Pria yang nyaman dan ringan. Desain modern yang cocok untuk dipakai ke kantor.	5	18	1	4
200	AIRism Kaos Polo Lengan Pendek (Kerah Reguler)	299000	Kaos polo Pria yang nyaman dan ringan. Polo serbaguna untuk tampilan kasual maupun formal.	5	1	1	4
201	Kaos Polo DRY-EX Lengan Pendek (Tipping)	399000	Kaos polo Pria dari bahan 'DRY-EX' yang cepat kering untuk kenyamanan setiap saat. Dengan bahan mesh yang sejuk.	\N	\N	1	4
202	Kaos Polo DRY-EX Lengan Pendek (Border)	399000	Kaos polo Pria dari bahan 'DRY-EX' yang cepat kering untuk kenyamanan setiap saat. Dengan bahan mesh yang sejuk.	\N	\N	1	4
203	AIRism Jaket Proteksi Sinar UV Retsleting	399000	Hoodie yang lembut dan nyaman. Sweater kasual yang melindungi Anda dari sinar UV. Dengan UPF 40.	4.93	136	1	5
204	AIRism Jaket Hoodie Retsleting Proteksi Sinar UV	399000	Jaket hoodie Pria dengan bahan 'AIRism' yang menjaga Anda tetap fresh. Dengan perlindungan terhadap sinar UV dengan UPF 40.	4.89	356	1	5
205	Hoodie DRY-EX Proteksi Sinar UV Retsleting	399000	Jaket Hoodie Pria dengan mesh yang sejuk dan nyaman. Sangat elastis untuk kemudahan bergerak dengan UPF 50+. Terbuat dari polyester daur ulang.	4.85	94	1	5
206	Jaket Sweat Hoodie Ritsleting Lengan Panjang	499000	Jaket hoodie Pria dengan fit relax yang mudah dipadankan. Desain tudung berkontur.	5	2	1	5
207	Sweat Hoodie Retsleting Lengan Panjang	499000	Hoodie Pria yang dengan tekstur yang diperbarui di kedua sisi. Serat bahan tidak mudah rontok.	4.88	142	1	5
208	Sweater Lengan Panjang	399000	Sweater Pria dengan desain garis sporty. Lengan raglan untuk kemudahan bergerak.	\N	\N	1	5
209	Sweater Lengan Panjang	399000	Sweater Pria yang dibuat dari pilihan bahan yang lembut. Terlihat autentik dengan detail yang dirancang dengan cermat.	4.88	41	1	5
210	Pullover Sweat Hoodie Lengan Panjang (Blok Warna)	499000	Hoodie sweat stylish untuk Pria dan Wanita, dengan lapisan yang nyaman dan detail autentik.	4.93	28	1	5
211	Pullover Sweat Hoodie Lengan Panjang	499000	Pullover hoodie dengan tekstur yang diperbarui di kedua sisi. Lapisan terbaru dengan serat tidak mudah rontok.	4.97	35	1	5
212	Jaket Sweat Dry Stretch Hoodie Lengan Panjang	599000	Jaket hoodie Pria dengan bahan katun pada bagian luar untuk kesan premium. Kini terasa lebih elastis. Terdapat lapisan bahan mesh yang cepat kering di dalam tudung dan saku.	5	1	1	5
213	Jaket Sweat Dry Stretch Hoodie Lengan Panjang	599000	Jaket hoodie Pria dengan bahan katun pada bagian luar untuk kesan premium. Kini terasa lebih elastis. Terdapat lapisan bahan mesh yang cepat kering di dalam tudung dan saku.	5	1	1	5
214	Cardigan Sweat Lengan Panjang (Indigo)	599000	Cardigan Pria berwarna indigo yang unik, dengan potongan leluasa yang mudah dilapiskan.	4.91	22	1	5
215	Cardigan Sweat Lengan Panjang	599000	Cardigan Pria dengan kenyamanan sweat yang tak perlu diragukan lagi. Praktis dan cocok untuk berbagai outfit.	4.76	33	1	5
218	Celana Sweat Dry Stretch	499000	Celana training terbaru dengan tampilan stylish yang tidak terlihat terlalu kasual. Sangat fungsional dan terasa nyaman. Terbuat dari polyester daur ulang.	4.95	20	1	5
219	Celana Sweat	399000	Celana training modis dengan tekstur halus. Aksen rib pada pinggang dan hem untuk fit yang ramping.	4.77	30	1	5
220	Kardigan Sweat Lengan Panjang	599000	Cardigan Pria dengan potongan leluasa yang mudah dilapiskan. Terdapat saku samping yang fungsional.	4.91	11	1	5
221	Celana Sweat Dry Stretch	499000	Celana training Pria dengan bahan katun pada bagian luar dan kesan premium. Kini terasa lebih elastis, cocok untuk pakaian olahraga.	\N	\N	1	5
222	Kemeja Katun Linen Kerah Tegak Lengan Pendek	399000	Kemeja Pria dengan tekstur lembut, sejuk, dan nyaman dikenakan.	4.91	53	1	6
223	Kemeja Katun Modal Kerah Terbuka Lengan Pendek	399000	Kemeja Pria dari bahan yang lembut dengan potongan leluasa untuk tampilan relax.	5	8	1	6
224	Kemeja Katun Modal Kerah Terbuka	399000	Kemeja Pria yang terbuat dari bahan yang nyaman dan drape yang halus. Padankan dengan koleksi Pria T-shirt dan kenakan sebagai luaran.	4.82	104	1	6
225	Kemeja Katun Modal Kerah Terbuka Lengan Pendek	399000	Kemeja Pria dengan bahan katun-rayon yang halus. Tidak mudah kusut setelah dicuci.	\N	\N	1	6
226	Kemeja Motif Katun Modal Kerah Terbuka	399000	Kemeja dari bahan nyaman dengan aksen drape yang halus. Potongan lebar yang cocok dikenakan sebagai outer layer.	4.88	8	1	6
227	Kemeja Motif Katun Modal Kerah Terbuka	399000	Kemeja Pria dari bahan nyaman dengan drape yang halus. Potongan lebar yang cocok dikenakan sebagai outer layer.	5	9	1	6
228	Kemeja Motif Katun Modal Kerah Terbuka	399000	Kemeja Pria dari bahan nyaman dengan drape yang halus. Potongan lebar yang cocok dikenakan sebagai outer layer.	4.94	18	1	6
229	Shochiku Kabuki Kemeja Kerah Terbuka	399000	Kemeja Pria dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	5	4	1	6
230	Shochiku Kabuki Kemeja Kerah Terbuka	399000	Kemeja Pria dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	5	1	1	6
231	Shochiku Kabuki Kemeja Kerah Terbuka	399000	Kemeja Pria dengan desain spesial untuk memperingati suksesi Ichikawa Danjuro, penguasa feodal agung Naritaya.	5	6	1	6
232	Kemeja Oxford Slim Fit Lengan Pendek	399000	Kemeja Pria dengan bahan premium. Terlihat klasik dalam setiap detailnya.	4.6	30	1	6
233	Kemeja Oxford Slim Fit Lengan Pendek	399000	Kemeja Pria klasik Oxford. Diperbarui dengan bahan yang lebih tahan lama.	4.83	59	1	6
234	Kemeja Broadcloth Extra Fine Cotton Motif	399000	Kemeja Pria yang dibuat dari bahan katun ultra-long dengan tekstur dan warna yang stylish. Diperbarui dengan fit yang lebih leluasa.	4.53	15	1	6
235	Kemeja Broadcloth Extra Fine Cotton Motif	399000	Kemeja Pria yang dibuat dari bahan katun ultra-long dengan tekstur dan warna yang stylish. Diperbarui dengan fit yang lebih leluasa.	4.83	18	1	6
236	Kemeja Broadcloth Extra Fine Cotton Kotak	399000	Kemeja Pria dan Wanita dengan siluet regular fit terbaru. Terbuat dari ultra-long cotton untuk tekstur dan warna yang mewah.	5	15	1	6
392	Jeans Slim Fit	599000	Celana denim Pria dengan tampilan autentik dan potongan lurus yang stylish.	5	2	3	15
237	Kemeja Broadcloth Extra Fine Cotton Kotak	399000	Kemeja Pria dan Wanita dengan siluet regular fit terbaru. Terbuat dari ultra-long cotton untuk tekstur dan warna yang mewah. Desain unisex.	5	10	1	6
238	Kemeja Broadcloth Extra Fine Cotton Garis	399000	Kemeja Pria dan Wanita dengan fit lebar reguler. Dibuat dari ultra-long cotton untuk tekstur dan warna memikat.	5	7	1	6
670	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
239	Kemeja Broadcloth Extra Fine Cotton Motif	399000	Kemeja Pria kasual yang terbuat dari 100% katun premium. Telah melalui proses washed, hadir dalam warna dan motif yang menarik.	4.94	35	1	6
240	Kemeja Katun Modal Kerah Tegak Lengan Pendek	399000	Kemeja kerah tegak yang stylish. Terbuat dari bahan yang halus.	3.67	3	1	6
241	Kemeja Katun Modal Kerah Tegak Lengan Pendek	399000	Kemeja Pria dari bahan yang nyaman dan aksen drape yang terlihat elegan. Desain kerah tegak untuk tampilan stylish.	4.87	101	1	6
242	Kemeja Katun Modal Kerah Tegak Lengan Pendek	399000	Kemeja Pria yang lembut dengan desain dan siluet yang simple.	4.88	186	1	6
243	Kemeja Motif Katun Modal Kerah Terbuka	399000	Kemeja dari bahan nyaman dengan aksen drape yang halus. Potongan lebar yang cocok dikenakan sebagai outer layer.	4.89	9	1	6
244	Kemeja Motif Katun Modal Kerah Terbuka	399000	Kemeja dari bahan nyaman dengan aksen drape yang halus. Potongan lebar yang cocok dikenakan sebagai outer layer.	4.75	4	1	6
245	Kemeja Oxford Garis Lengan Pendek (Pullover)	399000	Kemeja Pria dengan bahan premium yang lembut. Dengan potongan santai dan stylish dalam gaya pullover.	4.33	12	1	6
246	Kemeja Oxford Garis Lengan Pendek (Pullover)	399000	Kemeja Pria dengan bahan premium yang lembut. Dengan potongan santai dan stylish dalam gaya pullover.	4.73	11	1	6
247	Kemeja Broadcloth Extra Fine Cotton Kotak	399000	Kemeja Pria dan Wanita dengan siluet regular fit terbaru. Terbuat dari ultra-long cotton untuk tekstur dan warna yang mewah.	5	6	1	6
248	Kemeja Broadcloth Extra Fine Cotton Garis	399000	Kemeja Pria dan Wanita dengan fit lebar reguler. Dibuat dari ultra-long cotton untuk tekstur dan warna memikat.	5	3	1	6
249	Kemeja Twill Lembut Kerah Tegak Lengan Panjang	499000	Kemeja Pria dari bahan 100% katun yang terasa lembut. Kerah tegak didesain untuk tampilan natural.	\N	\N	1	7
250	Kemeja Soft Twill Kerah Tegak Lengan Panjang	499000	Kemeja Pria dari bahan 100% katun yang lembut. Kerah dirancang agar terlihat bagus meski tidak dikancing.	4.85	132	1	7
251	Kemeja Oxford Slim Fit Lengan Panjang	399000	Kemeja Pria dari bahan yang halus dan tahan lama. Potongan stylish modern.	5	3	1	7
252	Kemeja Oxford Slim Fit Lengan Panjang	399000	Kemeja Pria dengan bahan crisp bernuansa premium. Dilengkapi dengan detail klasik.	4.74	39	1	7
253	Kemeja Oxford Slim Fit Lengan Panjang	399000	Kemeja pria yang dapat dipakai untuk gaya clean maupun kasual. Cocok untuk berbagai tampilan gaya.	4.85	84	1	7
254	Kemeja Oxford Slim Fit Garis Lengan Panjang	399000	Kemeja Pria dengan bahan halus yang tahan lama. Dengan potongan santai terbaru.	\N	\N	1	7
255	Kemeja Oxford Slim Fit Garis Lengan Panjang	399000	Kemeja Pria dengan bahan crisp bernuansa premium. Dilengkapi dengan detail klasik.	4.68	22	1	7
256	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang terasa tebal namun tetap sejuk. Terdapat tekstur brushed di kedua sisi untuk kehangatan ekstra.	5	1	1	7
257	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja flannel dari bahan ringan yang cocok untuk berbagai gaya. Fit santai yang cocok sebagai outer layer.	\N	\N	1	7
258	Kemeja Flannel Lengan Panjang	399000	Kemeja Pria dari bahan flanel yang ringan dan cocok untuk gaya apa pun. Fit reguler sehingga mudah dilapiskan.	4.92	13	1	7
259	Kemeja Flannel Lengan Panjang	399000	Kemeja Pria dari bahan flanel yang ringan dan cocok untuk gaya apa pun. Fit reguler sehingga mudah dilapiskan.	4.92	13	1	7
260	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja flanel Pria yang lembut dan elegan. Hadir dalam potongan ramping sehingga cocok untuk berbagai tampilan.	4.5	8	1	7
261	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Flannel Pria dengan fit reguler yang bisa dipakai dengan sendirinya, atau dijadikan sebagai luaran.	4.94	16	1	7
262	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Flannel Pria dengan fit reguler yang bisa dipakai dengan sendirinya, atau dijadikan sebagai luaran.	4.75	16	1	7
263	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Flannel Pria dengan fit reguler yang bisa dipakai dengan sendirinya, atau dijadikan sebagai luaran.	4.75	16	1	7
264	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dengan bahan yang diperbarui sehingga lebih tebal. Cocok dipakai dengan sendirinya atau sebagai lapisan luar ringan.	4.91	32	1	7
265	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dengan bahan yang diperbarui sehingga lebih tebal. Cocok dipakai dengan sendirinya atau sebagai lapisan luar ringan.	4.95	38	1	7
266	Kemeja Flannel Kotak Lengan Panjang	399000	Berdasarkan respon pelanggan, kami telah mengubah kemeja flannel pria menjadi lebih tebal. Terlihat cocok dengan sendirinya atau sebagai lapisan luar yang ringan.	4.92	118	1	7
267	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang lebih tebal. Bersiluet regular fit yang cocok dikenakan dengan sendirinya atau sebagai outer layer. Warna variatif yang cocok untuk tampilan kasual.	4.77	81	1	7
268	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang lebih tebal. Bersiluet regular fit yang cocok dikenakan dengan sendirinya atau sebagai outer layer. Warna variatif yang cocok untuk tampilan kasual.	4.86	36	1	7
269	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dengan bahan yang diperbarui sehingga lebih tebal. Cocok dipakai dengan sendirinya atau sebagai lapisan luar ringan.	4.94	33	1	7
270	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang lebih tebal. Bersiluet regular fit yang cocok dikenakan dengan sendirinya atau sebagai outer layer. Warna variatif yang cocok untuk tampilan kasual.	5	18	1	7
271	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang lebih tebal. Bersiluet regular fit yang cocok dikenakan dengan sendirinya atau sebagai outer layer. Warna variatif yang cocok untuk tampilan kasual.	5	6	1	7
272	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.95	22	1	7
273	Kemeja Luaran Denim Lengan Panjang	599000	Jaket kemeja bergaya workwear yang terasa ringan dan nyaman dikenakan. Sempurna dikenakan dengan sendirinya atau sebagai outer layer.	\N	\N	1	7
274	Kemeja Luaran Jersey Lengan Panjang	599000	Jaket kemeja yang terasa ringan dan cocok untuk tampilan kasual. Sempurna dikenakan sebagai kemeja atau luaran.	5	4	1	7
275	Jaket Kemeja Luaran Jersey	699000	Jaket Kemeja bergaya workwear yang nyaman dan ringan. Dapat dikenakan sebagai kemeja ataupun jaket. Cocok untuk dipakai di cuaca dingin.	4.94	115	1	7
276	Kemeja Broadcloth Extra Fine Cotton Kotak Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
277	Kemeja Broadcloth Extra Fine Cotton Kotak Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
278	Kemeja Broadcloth Extra Fine Cotton Garis Lengan Panjang	399000	Kemeja Pria dari katun yang lembut dengan kilau elegan. Tidak mudah kusut untuk kelembutan yang tahan lama.	5	4	1	7
279	Kemeja Extra Fine Cotton Kotak	399000	Kemeja Pria dari bahan katun premium dan serat ultra-long cotton. Pilihan warna dan tekstur yang menawan.	4.6	5	1	7
280	Kemeja Extra Fine Cotton Kotak	399000	Kemeja Pria dari bahan katun premium dan serat ultra-long cotton. Pilihan warna dan tekstur yang menawan.	5	6	1	7
281	Kemeja Broadcloth Extra Fine Cotton Garis	399000	Kemeja Pria dari bahan katun premium dan ultra-long fiber. Tekstur yang elegan dengan pilihan warna memikat.	4.5	2	1	7
282	Kemeja Extra Fine Cotton Broadcloth Motif	399000	Kemeja klasik dari 100% katun premium. Tidak mudah kusut dengan potongan yang diperbarui untuk kemudahan bergerak.	\N	\N	1	7
283	Kemeja Extra Fine Cotton Broadcloth Kotak	399000	Kemeja Pria dari bahan katun premium dan serat ultra-long cotton. Pilihan warna dan tekstur yang menawan.	5	9	1	7
284	Kemeja Extra Fine Cotton Broadcloth Garis	399000	Kemeja Pria dari bahan katun premium dan ultra-long fiber. Tekstur yang elegan dengan pilihan warna memikat.	5	4	1	7
285	Kemeja Extra Fine Cotton Broadcloth Lengan Panjang	399000	Kemeja Pria dari bahan katun halus dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama	4.88	8	1	7
286	Kemeja Linen Katun Kerah Tegak	499000	Kemeja Pria dengan bahan yang diperbarui sehingga terasa lembut, sejuk, dan nyaman dipakai.	4.86	21	1	7
287	Kemeja Flannel Kotak Lengan Panjang	399000	Berdasarkan feedback pelanggan, kami telah memperbarui bahan menjadi lebih tebal. Cocok dipakai dengan sendirinya atau sebagai lapisan luar.	4.9	50	1	7
288	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.9	10	1	7
289	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.79	34	1	7
290	Jaket Kemeja AirSense (Ultra Light)	899000	Jaket Kemeja Pria yang nyaman dengan performa tinggi. Desain ringan dan stylish. Dapat dikenakan sebagai kemeja maupun luaran.	4.89	28	1	7
291	Kemeja Extra Fine Cotton Kotak	399000	Kemeja Pria dari bahan katun premium dan serat ultra-long cotton. Pilihan warna dan tekstur yang menawan.	4.93	14	1	7
292	Kemeja Premium Linen Lengan Panjang	599000	Kemeja 100% linen premium dengan serat alami yang terasa sejuk, cocok dipakai sepanjang tahun. Detail terlihat sangat elegan.	4.86	7	1	7
293	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.94	50	1	7
294	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.94	34	1	7
295	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria berbahan flannel yang ringan dalam fit regular. Kemeja serbaguna yang mudah dikenakan dan bisa dipadankan sesuai styling Anda.	4.92	26	1	7
296	Kemeja Luaran Twill Brushed Lengan Panjang	599000	Kemeja Pria dengan potongan lebar yang cocok dipakai sebagai outer. Kemeja serbaguna untuk berbagai gaya.	\N	\N	1	7
297	Kemeja Luaran Twill Brushed Kotak Lengan Panjang	599000	Kemeja Pria dengan tekstur brushed premium yang lembut. Cocok dipakai sebagai outer layer.	\N	\N	1	7
298	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dengan tekstur brushed di kedua sisi sehingga terasa hangat dikenakan.	5	1	1	7
299	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang terasa tebal namun tetap sejuk. Terdapat tekstur brushed di kedua sisi untuk kehangatan ekstra.	5	1	1	7
300	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang terasa tebal namun tetap sejuk. Terdapat tekstur brushed di kedua sisi untuk kehangatan ekstra.	\N	\N	1	7
301	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang terasa tebal namun tetap sejuk. Terdapat tekstur brushed di kedua sisi untuk kehangatan ekstra.	5	6	1	7
302	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja Pria dari bahan flannel yang terasa sejuk. Terdapat tekstur brushed di kedua sisi untuk kehangatan ekstra.	\N	\N	1	7
303	Kemeja Flannel Kotak Lengan Panjang	399000	Flannel shirt with a thick yet airy feel. Brushed on both sides for extra warmth.	\N	\N	1	7
304	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja flannel dari bahan ringan yang cocok untuk berbagai gaya. Fit santai yang cocok sebagai outer layer.	\N	\N	1	7
305	Kemeja Flannel Kotak Lengan Panjang	399000	Kemeja flannel dari bahan ringan yang cocok untuk berbagai gaya. Fit santai yang cocok sebagai outer layer.	\N	\N	1	7
306	Kemeja Broadcloth Extra Fine Cotton Kotak Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
307	Kemeja Broadcloth Extra Fine Cotton Kotak Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
308	Kemeja Broadcloth Extra Fine Cotton Kotak (Pjg)	399000	Kemeja Pria dari bahan katun halus dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	4.86	7	1	7
309	Kemeja Broadcloth Extra Fine Garis Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
310	Kemeja Broadcloth Extra Fine Cotton Garis Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
311	Kemeja Broadcloth Extra Fine Cotton Garis Lengan Panjang	399000	Kemeja Pria dari bahan 100% katun ultra-long fiber yang lembut dan berkilau. Tidak mudah kusut untuk kelembutan yang tahan lama.	\N	\N	1	7
312	Kemeja Fine Cloth Easy Care Stretch Slim Fit Kotak	499000	Kemeja Pria berkualitas tinggi, didesain dengan perhatian terhadap detail. Tidak mudah kusut sehingga mudah perawatannya.	4.83	12	1	8
313	Kemeja Fine Cloth Easy Care Stretch Slim Fit Kotak	499000	Kemeja Pria berkualitas tinggi, didesain dengan perhatian terhadap detail. Tidak mudah kusut sehingga mudah perawatannya.	\N	\N	1	8
314	Kemeja Fine Cloth Easy Care Stretch Slim Fit Broadcloth	499000	Kemeja Pria yang sempurna untuk berbagai kesempatan. Dengan tekstur mewah dari katun ultra-long fiber.	4.83	12	1	8
315	Kemeja Super Non Iron Slim Fit Lengan Panjang	499000	Kemeja Pria dengan 100% katun premium yang tidak perlu disetrika. Kemeja formal yang sempurna untuk aktivitas Anda.	5	2	1	8
316	Kemeja Super Non Iron Slim Fit Lengan Panjang	499000	Kemeja Pria dengan 100% katun premium yang tidak perlu disetrika. Kemeja formal yang sempurna untuk aktivitas Anda.	4.76	17	1	8
317	Kemeja Oxford Slim Fit Lengan Pendek	399000	Kemeja Pria klasik Oxford. Diperbarui dengan bahan yang lebih tahan lama.	4.83	59	1	8
318	Kemeja Oxford Slim Fit Lengan Panjang	399000	Kemeja pria yang dapat dipakai untuk gaya clean maupun kasual. Cocok untuk berbagai tampilan gaya.	4.85	84	1	8
319	Cardigan Sweat Lengan Panjang (Indigo)	599000	Cardigan Pria berwarna indigo yang unik, dengan potongan leluasa yang mudah dilapiskan.	4.91	22	1	9
320	Cardigan Sweat Lengan Panjang	599000	Cardigan stylish yang nyaman serta lembut di bagian depan dan belakang. Desain simpel yang cocok dengan berbagai outfit.	4.92	24	1	9
321	Rompi Rajut Kabel Kerah V	399000	Rompi Pria dan Wanita, cocok untuk tampilan rapi maupun kasual.	4.91	47	1	9
322	Cardigan Sweat Lengan Panjang	599000	Cardigan Pria dengan kenyamanan sweat yang tak perlu diragukan lagi. Praktis dan cocok untuk berbagai outfit.	4.76	33	1	9
671	Celana Flannel Ankle Rileks	399000	\N	\N	\N	5	27
323	Kardigan Sweat Lengan Panjang	599000	Cardigan Pria dengan potongan leluasa yang mudah dilapiskan. Terdapat saku samping yang fungsional.	4.91	11	1	9
324	Sweater Extra Fine Merino Kerah Bulat Lengan Panjang	499000	Sweater Pria dari bahan wol Merino yang sangat halus dan mengkilap. Dapat dicuci menggunakan mesin cuci, sehingga mudah perawatannya.	\N	\N	1	9
325	Jaket Parka Reversibel (Water-Repellent)	599000	Jaket hoodie Pria dengan desain 2 gaya (reversibel). Terdapat lapisan water-repellent untuk perlindungan di berbagai cuaca.	4.88	81	2	10
326	Jaket Parka Saku Proteksi Sinar UV Potongan 3D (Water-Repellent)	599000	Jaket hoodie Pria untuk sehari-hari. Potongan 3D untuk kemudahan bergerak, dengan fitur UV Protection (UPF 40). Bahan memiliki fungsi water-repellent, cocok dikenakan saat hujan ringan.	4.55	31	2	10
327	Jaket Parka Saku Proteksi Sinar UV Potongan 3D (Water-Repellent)	599000	Jaket hoodie Pria santai yang mudah dipadupadankan. Desain 3D cut pada bagian badan, bahu, dan lengan, dengan fungsi UV Protection (UPF40). Bahan memiliki fungsi water-repellent, cocok dikenakan saat hujan ringan.	4.78	156	2	10
328	Jaket Blouson Pendek Utilitas	999000	Jaket blouson Pria dengan kerah berbahan korduroi dan lapisan dalam beraksen motif kotak. Lengan raglan untuk fit relax.	5	14	2	10
329	BLOCKTECH Jaket Parka (Water-Repellent)	999000	Jaket hoodie Pria yang beperforma tinggi untuk melindungi dari berbagai kondisi cuaca. Cocok dikenakan sepanjang waktu.	4.88	42	2	10
330	Hoodie DRY-EX Proteksi Sinar UV Retsleting	399000	Jaket Hoodie Pria dengan mesh yang sejuk dan nyaman. Sangat elastis untuk kemudahan bergerak dengan UPF 50+. Terbuat dari polyester daur ulang.	4.85	94	2	10
331	AIRism Jaket Proteksi Sinar UV Retsleting	399000	Hoodie yang lembut dan nyaman. Sweater kasual yang melindungi Anda dari sinar UV. Dengan UPF 40.	4.93	136	2	10
332	Sweat Hoodie Retsleting Lengan Panjang	499000	Hoodie Pria yang dengan tekstur yang diperbarui di kedua sisi. Serat bahan tidak mudah rontok.	4.88	142	2	10
333	AIRism Jaket Hoodie Retsleting Proteksi Sinar UV	399000	Jaket hoodie Pria dengan bahan 'AIRism' yang menjaga Anda tetap fresh. Dengan perlindungan terhadap sinar UV dengan UPF 40.	4.89	356	2	10
334	Jaket Parka Seamless Down (Potongan 3D)	1990000	Jaket hangat Pria dengan desain tudung yang diperbarui, memberi perlindungan lebih terhadap udara dingin. Fungsional dan stylish. Cocok untuk holiday dan traveling.	\N	\N	2	10
335	Jaket Blouson MA-1	899000	Jaket blouson dengan detail autentik dan potongan modern. Mudah dipadupadankan.	5	12	2	10
336	Rompi Ultra Light Down (Blok Warna)	699000	Warm premium down. Incredibly lightweight.	\N	\N	2	10
337	Jaket Ultra Light Down (Potongan 3D)	999000	Warm premium down. Incredibly lightweight.	\N	\N	2	10
338	Rompi Ultra Light Down	699000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	2	10
339	Jaket Ultra Light Down (Potongan 3D)	999000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	2	10
340	Mantel 2WAY Single Breasted	1690000	Durable water-repellent coating. Removable hood for versatile use in any temperatures.	\N	\N	2	10
341	Jaket Parka Hybrid Down (Potongan 3D)	1990000	Jaket hoodie Pria yang terasa lebih hangat dengan desain tudung yang diperbarui. Fungsional dan stylish.	5	1	2	10
342	Kemeja Luaran Denim Lengan Panjang	599000	Jaket kemeja bergaya workwear yang terasa ringan dan nyaman dikenakan. Sempurna dikenakan dengan sendirinya atau sebagai outer layer.	\N	\N	2	11
343	Kemeja Luaran Jersey Lengan Panjang	599000	Jaket kemeja yang terasa ringan dan cocok untuk tampilan kasual. Sempurna dikenakan sebagai kemeja atau luaran.	5	4	2	11
344	Jaket Kemeja Luaran Jersey	699000	Jaket Kemeja bergaya workwear yang nyaman dan ringan. Dapat dikenakan sebagai kemeja ataupun jaket. Cocok untuk dipakai di cuaca dingin.	4.94	115	2	11
345	Jaket Utilitas Denim	899000	Jaket Pria berbahan denim stretch autentik dengan tampilan washed. Siluet lebar relax.	\N	\N	2	11
346	Jaket Utilitas	899000	Jaket Pria dari bahan brushed (berbulu) yang terasa hangat. Terdapat detail workwear yang autentik.	\N	\N	2	11
347	Jaket Comfort 2 Kancing Motif	899000	Jas Pria dari bahan jersey lembut yang nyaman dikenakan. Dapat dicuci dengan tangan sehingga mudah perawatannya.	5	5	2	11
348	Jaket Comfort 2 Kancing Motif	899000	Jas Pria dari bahan jersey lembut yang nyaman dikenakan. Dapat dicuci dengan tangan sehingga mudah perawatannya.	5	5	2	11
349	Jaket Comfort 2 Kancing Motif	899000	Jas Pria dari bahan jersey lembut yang nyaman dikenakan. Dapat dicuci dengan tangan sehingga mudah perawatannya.	5	5	2	11
350	Jaket Comfort 2 Kancing	899000	Jas Pria dari bahan yang lentur dan nyaman dikenakan. Desain lengan memudahkan untuk dikenakan dan dilepas.	4.84	32	2	11
351	Jaket AirSense (Ultra Light) Serupa Wol	899000	Jaket performa tinggi untuk Pria yang terasa ringan, lentur, dan cepat kering. Cocok untuk kegiatan formal. Miliki juga koleksi Celana AirSense (Ultra Light) Serupa Wol dan padankan sebagai setelan.	4.83	66	2	11
352	Jaket AirSense (Ultra Light) Serupa Katun	899000	Jaket Pria berperforma tinggi yang luar biasa ringan, elastis, dan cepat kering. Cocok dengan berbagai outfit.	4.79	34	2	11
353	Jaket Down Recycle	1290000	Jaket Pria dengan desain tanpa kerah yang stylish. Desain tanpa kerah membuatnya cocok untuk luaran maupun lapisan tengah (mid-layer).	\N	\N	2	11
354	Jaket Ultra Light Down (Potongan 3D)	999000	Jaket hangat Pria dari bahan Ultra Light Down yang tipis dan ringan. Cocok untuk holiday dan traveling.	4.93	27	2	11
355	Jaket Kemeja AirSense (Ultra Light)	899000	Jaket Kemeja Pria yang nyaman dengan performa tinggi. Desain ringan dan stylish. Dapat dikenakan sebagai kemeja maupun luaran.	4.89	28	2	11
356	Jaket Luaran Kemeja	899000	An easy throw-on layer with dropped shoulders. Packed with meticulous details.	5	3	2	11
357	Jaket Luaran Kemeja	899000	An easy throw-on layer with dropped shoulders. Packed with meticulous details.	5	3	2	11
358	Jaket Ultra Light Down (Potongan 3D)	999000	Warm premium down. Incredibly lightweight.	\N	\N	2	11
359	Jaket Ultra Light Down (Potongan 3D)	999000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	2	11
360	Jaket AirSense (Ultra Light) Serupa Wol	899000	Jaket performa tinggi untuk Pria yang terasa ringan, lentur, dan cepat kering. Cocok untuk kegiatan formal. Miliki juga koleksi Celana AirSense (Ultra Light) Serupa Wol dan padankan sebagai setelan.	4.83	66	2	12
361	Jaket AirSense (Ultra Light) Serupa Katun	899000	Jaket Pria berperforma tinggi yang luar biasa ringan, elastis, dan cepat kering. Cocok dengan berbagai outfit.	4.79	34	2	12
362	Jaket Kemeja AirSense (Ultra Light)	899000	Jaket Kemeja Pria yang nyaman dengan performa tinggi. Desain ringan dan stylish. Dapat dikenakan sebagai kemeja maupun luaran.	4.89	28	2	12
363	Jaket Parka Seamless Down (Potongan 3D)	1990000	Jaket hangat Pria dengan desain tudung yang diperbarui, memberi perlindungan lebih terhadap udara dingin. Fungsional dan stylish. Cocok untuk holiday dan traveling.	\N	\N	2	13
364	Jaket Ultra Light Down (Potongan 3D)	999000	Jaket hangat Pria dari bahan Ultra Light Down yang tipis dan ringan. Cocok untuk holiday dan traveling.	4.93	27	2	13
365	Jaket Ultra Light Down (Potongan 3D)	999000	Warm premium down. Incredibly lightweight.	\N	\N	2	13
366	Jaket Ultra Light Down (Potongan 3D)	999000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	2	13
367	Rompi Ultra Light Down (Blok Warna)	699000	Warm premium down. Incredibly lightweight.	\N	\N	2	13
368	Rompi Ultra Light Down	699000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	2	13
369	Celana Jogger Kargo	599000	Celana cargo Pria berbahan lentur untuk fit yang nyaman. Celana cargo bergaya jogger yang terlihat ramping.	5	8	3	14
370	Celana Work Utility (Kargo)	599000	Celana panjang kargo Pria yang bersiluet lebar, dengan hem yang rapi untuk kenyamanan. Terdapat saku seperti work pants.	4.98	45	3	14
371	Celana Rileks Katun Ankle Denim	399000	Celana panjang Pria, kini dengan aksen indigo yang tidak mudah pudar. Terbuat dari denim lentur untuk kemudahan bergerak.	\N	\N	3	14
372	Celana Rileks Katun Ankle	399000	Celana panjang Pria dari bahan katun yang elastis untuk kemudahan bergerak. Didesain sehingga sempurna dikenakan di dalam atau luar ruangan.	5	13	3	14
373	Celana Jersey Ankle Washed	399000	Celana kasual dengan detail jahitan yang unik. Pinggang dapat disesuaikan untuk fit yang lebih nyaman.	4.93	30	3	14
374	Celana Katun Ankle Rileks	399000	Celana panjang Pria yang dibuat dengan proses washed untuk tampilan kasual. Cocok dikenakan di rumah atau untuk bepergian.	4.84	69	3	14
375	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang dapat dikenakan di rumah atau saat bepergian. Bahan katun yang elastis untuk kemudahan bergerak.	4.8	5	3	14
376	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang diproduksi dengan proses wash untuk tampilan kasual. Celana serbaguna dengan potongan jogger, cocok untuk bepergian.	4.87	30	3	14
377	Celana Lebar Lipit	599000	Celana panjang Pria yang mampu meregang 2 arah secara vertikal maupun horizontal sehingga nyaman dipakai. Terbuat dari bahan elegan yang cocok untuk kasual maupun formal.	4.75	51	3	14
378	Celana Sweat Garis Samping	399000	Celana training Pria dari bahan katun yang lembut. Dilengkapi dengan desain garis sporty.	\N	\N	3	14
379	Celana Tapered Ultra Stretch DRY-EX	399000	Celana training Pria dengan performa tinggi yang didesain untuk kenyamanan. Bawahan esensial yang wajib dimiliki siapapun. Terbuat dari polyester daur ulang.	4.91	78	3	14
380	Celana Sweat (Garis Samping)	399000	Celana Sweat yang nyaman dan lembut. Terdapat aksen garis di bagian samping untuk tampilan yang ramping dan stylish.	4.86	14	3	14
381	Celana Jogger Ultra Stretch DRY-EX	399000	Celana jogger lembut untuk kemudahan bergerak, dengan kilau elegan. Cocok untuk berbagai kesempatan.	4.97	99	3	14
382	Celana Sweat Dry Stretch	499000	Celana training terbaru dengan tampilan stylish yang tidak terlihat terlalu kasual. Sangat fungsional dan terasa nyaman. Terbuat dari polyester daur ulang.	4.95	20	3	14
383	Celana Sweat Dry Stretch	499000	Berdasarkan feedback Pelanggan, kami telah memperbarui sweat ini menjadi tidak mudah kusut dan terlihat alami untuk dipakai sehari-hari.	4.89	38	3	14
384	Celana Sweat	399000	Celana training modis dengan tekstur halus. Aksen rib pada pinggang dan hem untuk fit yang ramping.	4.77	30	3	14
385	Celana Rileks Katun Ankle (Motif)	399000	Celana panjang Pria yang terbuat dari benang slub bernuansa natural, dalam motif kotak yang unik. Celana serbaguna untuk indoor dan outdoor.	4.89	18	3	14
386	Celana Rileks Katun Ankle (Denim)	399000	Celana panjang Pria yang terlihat seperti denim, dengan fit lebar yang nyaman. Saku fungsional di kedua sisi belakang.	4.91	35	3	14
387	HEATTECH Celana Lapis Hangat (Kargo)	699000	Warm 'HEATTECH' lining. With cargo-style side pockets.	\N	\N	3	14
388	Celana Lebar Lipit (Korduroi)	599000	Easy yet elegant. Versatile pants for any occasion.	\N	\N	3	14
389	Celana Jogger Jersey Washed	399000	Stretch fabric for casual styling. Versatile pants designed to be perfect indoors or out.	4	1	3	14
390	Jeans Wide Fit	599000	Celana jeans Pria dengan potongan lurus lebar. Terbuat dari katun denim yang diproduksi oleh produsen denim terkenal di dunia, Kaihara.	4.8	5	3	15
393	Jeans Slim Fit	599000	Celana jeans Pria dengan desain klasik denim yang terasa lentur dikenakan. Siluet slim fit yang stylish.	5	16	3	15
394	Jeans EZY Ultra Stretch	599000	Celana Jeans Pria yang terlihat seperti denim, namun terasa nyaman seperti celana sweat. Siluet telah diperbarui untuk fit yang lebih indah.	4.9	105	3	15
395	Jeans Slim Fit Stretch Selvedge	599000	Celana denim selvedge Pria yang autentik dan lebih elastis. Pakailah secara terus-menerus untuk menciptakan karakter khas Anda sendiri.	4.27	11	3	15
396	Jeans Warna Ultra Stretch	499000	Celana jeans Pria berbahan Ultra Stretch yang sangat elastis. Potongan skinny fit yang nyaman dan tidak terasa ketat.	4.79	139	3	15
397	Jeans Warna Ultra Stretch	499000	Celana jeans Pria berbahan Ultra Stretch yang sangat elastis. Potongan skinny fit yang nyaman dan tidak terasa ketat.	4.79	139	3	15
398	Jeans Ultra Stretch	599000	Celana jeans Pria yang luar biasa elastis dan nyaman, dengan potongan skinny fit yang sempurna.	5	1	3	15
399	Jeans Ultra Stretch (Damaged)	599000	Celana jeans Pria khas UNIQLO yang paling elastis dengan potongan skinny fit yang sempurna.	\N	\N	3	15
400	Jeans Ultra Stretch	599000	Celana jeans pria elastis bersiluet ramping dalam tampilan elegan. Fit terasa nyaman.	4.92	24	3	15
401	Jeans Skinny Fit Ultra Stretch	599000	Celana jeans kami yang paling elastis. Celana Pria dengan desain yang indah dan detail yang stylish.	4.93	14	3	15
402	Jeans Ultra Stretch	599000	Celana jeans Pria dengan fit skinny dan bahan yang lentur. Detail desain membuatnya terlihat klasik.	4.84	140	3	15
403	Jeans Potongan Klasik Helmut Lang	1490000	Jeans klasik dari brand fashion ikonik 90-an, Helmut Lang telah dibuat kembali secara modern oleh UNIQLO.	3.67	3	3	15
404	Jeans Slim Fit (Damaged)	599000	Celana jeans Pria dengan denim autentik dan lentur. Jeans inovatif yang menggabungkan style dan kenyamanan.	4.95	22	3	15
405	Jeans Slim Fit Stretch Selvedge	599000	Celana jeans Pria dengan denim autentik yang terasa elastis dikenakan. Celana yang nyaman dengan potongan ramping.	4.52	33	3	15
406	Jeans Potongan Klasik Helmut Lang	1490000	Jeans ikonik terbaru dari Helmut Lang. Dengan desain ramping modern.	\N	\N	3	15
407	Celana Pendek Chino (panjang 20,3 - 23,8 cm)	399000	Menampilkan sentuhan modern pada celana pendek chino klasik kami. Dengan bahan autentik dan potongan ramping terbaru. Ukuran lebih pendek (20,3 - 23,8 cm) untuk fit yang lebih nyaman.	4.73	63	3	16
408	Celana Chino Slim Fit	599000	Celana chino Pria dengan detail celana formal. Dari bahan katun premium yang lembut.	4.88	84	3	16
409	Celana Chino Slim Fit	599000	Celana chino Pria dengan detail celana formal. Dari bahan katun premium yang lembut.	4.88	84	3	16
410	Celana Chino Skinny Fit	599000	Celana chino pria dengan siluet skinny yang memperindah bentuk kaki. Terbuat dari bahan stretch sehingga pas dikenakan.	4.79	48	3	16
411	Celana Chino Skinny Fit	599000	Celana yang elastis dan mudah dipakai. Potongan ramping yang terlihat indah.	5	14	3	16
412	Celana Chino Skinny Fit	599000	Celana yang elastis dan mudah dipakai. Potongan ramping yang terlihat indah.	5	14	3	16
413	Celana Lipit AirSense	599000	Celana panjang Pria yang ringan, lentur, dan cepat kering. Celana performa tinggi dengan saku breathable.	4.67	6	3	17
414	Celana AirSense (Serupa Katun)	599000	Celana panjang Pria berperforma tinggi yang nyaman dikenakan. Tampilan premium yang cocok untuk gaya formal.	5	2	3	17
415	Celana AirSense (Ultra Light) Serupa Katun	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Tampilan premium yang cocok untuk dipakai ke kantor.	4.77	61	3	17
416	Celana AirSense (Ultra Light) Serupa Wol	599000	Celana panjang performa tinggi untuk Pria dari bahan yang nyaman. Tampilan premium yang cocok untuk situasi formal. Miliki juga koleksi Jaket AirSense (Ultra Light) Serupa Wol dan padankan sebagai setelan.	4.63	60	3	17
417	Celana AirSense (Ultra Light) Serupa Katun	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Tampilan premium yang cocok untuk dipakai ke kantor.	4.77	61	3	17
418	Celana Rileks AirSense (Ultra Light)	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Hadir dalam tampilan ramping dan siluet meruncing.	4.74	27	3	17
419	Celana Sweat Garis Samping	399000	Celana training Pria dari bahan katun yang lembut. Dilengkapi dengan desain garis sporty.	\N	\N	3	18
420	Celana Sweat (Garis Samping)	399000	Celana Sweat yang nyaman dan lembut. Terdapat aksen garis di bagian samping untuk tampilan yang ramping dan stylish.	4.86	14	3	18
421	Celana Sweat	399000	Celana training modis dengan tekstur halus. Aksen rib pada pinggang dan hem untuk fit yang ramping.	4.77	30	3	18
422	Celana Sweat Dry Stretch	499000	Celana training terbaru dengan tampilan stylish yang tidak terlihat terlalu kasual. Sangat fungsional dan terasa nyaman. Terbuat dari polyester daur ulang.	4.95	20	3	18
423	Celana Sweat Dry Stretch	499000	Berdasarkan feedback Pelanggan, kami telah memperbarui sweat ini menjadi tidak mudah kusut dan terlihat alami untuk dipakai sehari-hari.	4.89	38	3	18
424	Celana Jogger Ultra Stretch DRY-EX	399000	Celana jogger lembut untuk kemudahan bergerak, dengan kilau elegan. Cocok untuk berbagai kesempatan.	4.97	99	3	18
425	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang diproduksi dengan proses wash untuk tampilan kasual. Celana serbaguna dengan potongan jogger, cocok untuk bepergian.	4.87	30	3	18
426	Celana Sweat Dry Stretch	499000	Celana training Pria dengan bahan katun pada bagian luar dan kesan premium. Kini terasa lebih elastis, cocok untuk pakaian olahraga.	\N	\N	3	18
427	Celana Ankle Rapi (Gunclub Check)	599000	Celana panjang Pria dari bahan 2-way stretch yang lembut dan nyaman. Celana sepanjang mata kaki (ankle-length) dengan potongan slim yang stylish.	5	1	3	19
428	Celana Ankle Rapi Glen Check	599000	Celana panjang Pria dari bahan 2-way stretch yang lembut dan nyaman. Celana sepanjang mata kaki (ankle-length) dengan potongan slim yang stylish.	5	1	3	19
429	Celana Ankle Rapi (Katun)	599000	Celana Pria yang ramping dan elastis. Terbuat dari bahan katun yang nyaman.	4.86	44	3	19
430	Celana Ankle Rapi (Serupa Wol)	599000	Celana yang ramping dan elastis. Cocok untuk formal dan kasual. Terbuat dari polyester daur ulang.	4.93	42	3	19
431	Celana Ankle Rapi (Serupa Wol)	599000	Celana Pria yang ramping, nyaman, dan elastis. Cocok untuk bekerja maupun di rumah.	4.8	186	3	19
432	Celana Lipit AirSense	599000	Celana panjang Pria yang ringan, lentur, dan cepat kering. Celana performa tinggi dengan saku breathable.	4.67	6	3	19
433	Celana AirSense (Serupa Katun)	599000	Celana panjang Pria berperforma tinggi yang nyaman dikenakan. Tampilan premium yang cocok untuk gaya formal.	5	2	3	19
434	Celana AirSense (Ultra Light) Serupa Katun	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Tampilan premium yang cocok untuk dipakai ke kantor.	4.77	61	3	19
435	Celana AirSense (Ultra Light) Serupa Wol	599000	Celana panjang performa tinggi untuk Pria dari bahan yang nyaman. Tampilan premium yang cocok untuk situasi formal. Miliki juga koleksi Jaket AirSense (Ultra Light) Serupa Wol dan padankan sebagai setelan.	4.63	60	3	19
436	Celana AirSense (Ultra Light) Serupa Katun	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Tampilan premium yang cocok untuk dipakai ke kantor.	4.77	61	3	19
437	Celana Lebar Lipit	599000	Celana panjang Pria yang mampu meregang 2 arah secara vertikal maupun horizontal sehingga nyaman dipakai. Terbuat dari bahan elegan yang cocok untuk kasual maupun formal.	4.75	51	3	19
438	Celana Jogger Kargo	599000	Celana cargo Pria berbahan lentur untuk fit yang nyaman. Celana cargo bergaya jogger yang terlihat ramping.	5	8	3	19
439	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang dapat dikenakan di rumah atau saat bepergian. Bahan katun yang elastis untuk kemudahan bergerak.	4.8	5	3	19
440	Celana Rileks Katun Ankle Denim	399000	Celana panjang Pria, kini dengan aksen indigo yang tidak mudah pudar. Terbuat dari denim lentur untuk kemudahan bergerak.	\N	\N	3	19
441	Celana Rileks Katun Ankle	399000	Celana panjang Pria dari bahan katun yang elastis untuk kemudahan bergerak. Didesain sehingga sempurna dikenakan di dalam atau luar ruangan.	5	13	3	19
442	Celana Jersey Ankle Washed	399000	Celana kasual dengan detail jahitan yang unik. Pinggang dapat disesuaikan untuk fit yang lebih nyaman.	4.93	30	3	19
443	Celana Katun Ankle Rileks	399000	Celana panjang Pria yang dibuat dengan proses washed untuk tampilan kasual. Cocok dikenakan di rumah atau untuk bepergian.	4.84	69	3	19
444	Celana Work Utility (Kargo)	599000	Celana panjang kargo Pria yang bersiluet lebar, dengan hem yang rapi untuk kenyamanan. Terdapat saku seperti work pants.	4.98	45	3	19
445	Celana Ankle Rapi (Motif)	599000	Celana serbaguna yang ramping dan elastis. Cocok untuk dipakai formal dan kasual. Terbuat dari polyester daur ulang.	4.95	40	3	19
446	Celana Rileks AirSense (Ultra Light)	599000	Celana panjang Pria yang nyaman dengan performa tinggi. Hadir dalam tampilan ramping dan siluet meruncing.	4.74	27	3	19
447	Celana Rileks Katun Ankle (Motif)	399000	Celana panjang Pria yang terbuat dari benang slub bernuansa natural, dalam motif kotak yang unik. Celana serbaguna untuk indoor dan outdoor.	4.89	18	3	19
448	Celana Rileks Katun Ankle (Denim)	399000	Celana panjang Pria yang terlihat seperti denim, dengan fit lebar yang nyaman. Saku fungsional di kedua sisi belakang.	4.91	35	3	19
449	Celana Lebar Lipit	599000	These versatile pants are comfortable yet elegant. In a sleek straight cut.	4.86	14	3	19
450	Celana Pendek Chino (panjang 20,3 - 23,8 cm)	399000	Menampilkan sentuhan modern pada celana pendek chino klasik kami. Dengan bahan autentik dan potongan ramping terbaru. Ukuran lebih pendek (20,3 - 23,8 cm) untuk fit yang lebih nyaman.	4.73	63	3	20
451	Celana Pendek Kargo	399000	Celana pendek kargo Pria dengan bahan elastis dan potongan leluasa untuk kemudahan bergerak. Terdapat saku fungsional.	4.5	4	3	20
452	Celana Pendek Stretch Slim Fit Motif	399000	Celana pendek Pria dengan pinggang elastis untuk kenyamanan Anda. Cocok untuk tampilan stylish.	4.79	14	3	20
453	Celana Pendek Stretch Slim Fit	399000	Celana pendek Pria yang terasa nyaman dan elastis. Dengan pinggang elastis untuk kemudahan bergerak.	\N	\N	3	20
454	Celana Pendek Stretch Slim Fit	399000	Celana pendek Pria dengan pinggang yang elastis dan nyaman. Cocok untuk tampilan semi-formal.	4.62	40	3	20
455	Celana Pendek Geared	399000	Celana pendek Pria dengan fitur water-repellent untuk segala kondisi cuaca. Saku samping dengan ritsleting cocok untuk kegiatan olahraga.	4.78	9	3	20
456	Celana Pendek Geared	399000	Celana pendek dari nilon ringan dan fitur water resistance. Celana praktis dengan detail fungsional.	4.88	66	3	20
457	Celana Pendek DRY-EX Motif	299000	Celana pendek Pria dari bahan cepat kering dengan grafis yang menarik. Terbuat dari polyester daur ulang.	4.5	8	3	20
458	Celana Pendek DRY-EX Ultra Stretch	299000	Celana pendek Pria dengan bahan yang memudahkan gerak dan terasa halus. Saku dengan retsleting untuk menyimpan barang Anda dengan aman selama berolahraga. Terbuat dari polyester daur ulang.	4.88	32	3	20
459	Celana Pendek Rileks Dry Stretch	299000	Celana pendek dari bahan yang cepat kering untuk kemudahan bergerak. Cocok untuk bersantai di rumah maupun bepergian.	4.93	29	3	20
460	Celana Pendek Rileks Stretch Seersucker	299000	Celana pendek dengan bahan seersucker yang sejuk. Pinggang elastis yang nyaman.	5	5	3	20
461	Celana Pendek Rileks Stretch (Chambray)	299000	Celana pendek dengan desain yang nyaman, cocok untuk bersantai di rumah maupun bepergian.	4.94	18	3	20
462	Celana Pendek Rileks Washed Jersey	299000	Celana pendek kasual yang dibuat melalui proses wash untuk tekstur yang khas.	4.83	52	3	20
463	Celana Pendek Rileks Washed Jersey	299000	Celana Pendek Pria dengan tekstur unik. Bahan ringan dan nyaman sehingga mudah untuk digerakkan.	4.9	138	3	20
464	Celana Pendek Relax Jersey Washed	299000	Celana pendek kasual untuk Pria dan Wanita dengan proses washed yang menghasilkan tekstur unik.	4.93	28	3	20
465	Celana Pendek Relax Dry Stretch	299000	Celana relax pria yang stretch dan nyaman dengan teknologi DRY. Cocok juga untuk gaya kasual.	4.81	133	3	20
466	Celana Pendek Relax Dry Stretch	299000	Celana relax pria dari bahan yang lembut, mudah bergerak saat memakainya. Terlihat stylish di dalam maupun luar rumah.	4.83	304	3	20
467	Celana Pendek Rileks Stretch (Daun)	299000	Celana pendek dari bahan twill untuk tampilan kasual. Pinggang elastis yang nyaman.	4.75	4	3	20
468	AIRism Katun Celana Pendek Rileks	299000	Celana Pendek Pria yang terasa lembut di kulit. Terdapat saku dan drawstring yang dapat disesuaikan di bagian pinggang.	4.94	65	3	20
469	Celana Pendek Relax Stretch (Seersucker)	299000	Celana pendek Pria dengan pinggang elastis yang nyaman.	4.74	54	3	20
470	AIRism Katun T-Shirt Kerah Bulat Lengan Pendek	149000	T-shirt Pria dengan bahan 'AIRism' yang halus dengan tampilan katun. Cocok dikenakan sebagai t-shirt atau dalaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	210	4	21
500	HEATTECH Pakaian Dalam Tights	199000	Dalaman fungsional Pria yang hangat dan mudah digerakkan. Bersiluet ramping yang tetap tersembunyi di balik Bawahan.	4.85	26	4	22
471	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Dalaman 'AIRism', kini terbuat dari poliester daur ulang. Tetap tersembunyi di balik pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	33	4	21
472	AIRism Katun T-Shirt Kerah Bulat Lengan Pendek	149000	T-shirt Pria dengan tampilan seperti katun dan performa 'AIRism'. Dapat dikenakan sebagai T-shirt atau pakaian dalam. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.8	201	4	21
473	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Inner t-shirt Pria dari bahan 'AIRism' yang senantiasa nyaman dan sejuk. Desain yang basic sangat ideal untuk dipakai sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	62	4	21
474	AIRism T-Shirt Kerah V Lengan Pendek	149000	Dalaman Pria dari bahan 'AIRism' yang lembut, sejuk, dan nyaman. Tidak terlihat dari luar pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	34	4	21
475	AIRism T-Shirt Kerah V Lengan Pendek	149000	Dalaman Pria yang terasa senantiasa nyaman dan sejuk. Desain V-neck yang tetap tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.93	30	4	21
476	AIRism Pakaian Dalam Boxer Motif	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
477	AIRism Pakaian Dalam Boxer Motif	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
478	AIRism Pakaian Dalam Boxer Garis	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
479	AIRism Pakaian Dalam Boxer Garis	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
480	AIRism Pakaian Dalam (Seamless)	149000	Celana dalam Pria dengan bahan 'AIRism' yang lembut dan nyaman. Terasa lentur untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.81	31	4	21
481	AIRism Pakaian Dalam Ultra Seamless	149000	Celana dalam Pria dari bahan 'AIRism' yang halus, nyaman, dan pas dikenakan. Terasa lentur untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.96	74	4	21
482	AIRism Pakaian Dalam Boxer	149000	Celana dalam Pria dari bahan 'AIRism', kini dengan polyester daur ulang. Desain tiga dimensi yang terasa nyaman dan sejuk. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	21
483	AIRism Pakaian Dalam Boxer	149000	Diperbarui dengan fit yang lebih nyaman. Bahan 'AIRism' yang lembut dan sejuk dipadukan dengan teknologi UV Protection. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.94	18	4	21
484	AIRism Pakaian Dalam Boxer	149000	Boxer Pria dengan kelembutan 'AIRism' yang terasa sejuk, nyaman, dan pas dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	19	4	21
485	AIRism Pakaian Dalam Boxer	149000	Celana dalam Pria dari bahan AIRism yang terasa sejuk di kulit Anda. Nyaman dan pas saat dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.86	14	4	21
486	AIRism Pakaian Dalam Boxer	149000	Celana boxer pria yang menjaga Anda tetap kering dan nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.88	26	4	21
487	AIRism Pakaian Dalam Boxer Motif (Pinggang Rendah)	149000	Celana dalam Pria dari bahan 'AIRism' yang halus dan nyaman. Pinggang rendah yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
488	AIRism Pakaian Dalam Boxer Motif (Pinggang Rendah)	149000	Celana dalam Pria dari bahan 'AIRism' yang halus dan nyaman. Pinggang rendah yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
489	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria dengan bahan 'AIRism' yang sejuk dan nyaman. Desain pinggang rendah. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	21
490	AIRism Pakaian Dalam Ultra Seamless (Pinggang Rendah)	149000	Boxer Pria tanpa jahitan dengan desain fit yang sempurna. Kini terasa lebih nyaman dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	298	4	21
491	AIRism Pakaian Dalam Boxer (Motif)	149000	Boxer 'AIRism' Pria, kini dibuat dari bahan poliester daur ulang. Desain tiga dimensi yang sejuk untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.91	11	4	21
492	AIRism Pakaian Dalam Boxer (Motif)	149000	Boxer 'AIRism' Pria, kini dibuat dari bahan poliester daur ulang. Desain tiga dimensi yang sejuk untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	12	4	21
493	HEATTECH Ultra Hangat T-Shirt Kerah Bulat Lengan Panjang	399000	T-shirt Pria dengan elastisitas yang diperbarui sehingga mudah digerakkan. Dengan teknologi Ultra Warm, kira-kira 2,25 kali lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	57	4	22
494	HEATTECH Ultra Hangat Tights	399000	Berdasarkan permintaan pelanggan, kami telah memperbarui bahan dengan elastisitas yang lebih baik sehinga mudah digerakkan. Sekitar 2,25 kali* lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.95	40	4	22
495	HEATTECH Katun T-Shirt Kerah Tinggi Lengan Panjang (Ekstra Hangat)	299000	Turtle neck ekstra hangat dengan 100% katun yang ramah terhadap kulit. Fitur deodorisasi untuk kenyamanan. 1,5 kali lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.68	22	4	22
496	HEATTECH Katun T-Shirt Kerah Bulat Lengan Panjang (Ekstra Hangat)	299000	T-shirt Pria dengan fitur deodorisasi untuk kenyamanan ekstra. 1,5 kali lebih hangat dari 'HEATTECH' regular. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	22
497	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton lining. 1.5 times* warmer than our regular 'HEATTECH'. Due to hygiene reasons, this product cannot be returned.	5	6	4	22
498	HEATTECH Katun Tights (Ekstra Hangat)	299000	Legging Pria yang 1,5 kali lebih hangat dari 'HEATTECH' reguler. Menjaga kaki dan pinggul Anda tetap nyaman dan hangat. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	22
499	HEATTECH Katun Tights (Ekstra Hangat)	299000	Diperbarui dengan fitur penghilang bau. Permukaan katun untuk rasa nyaman dan teknologi Extra Warm yang kira-kira 1,5 kali lebih hangat dari 'HEATTECH' regular. Elastisitas luar biasa untuk memudahkan gerakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	22
501	HEATTECH Katun T-Shirt Waffle Kerah Bulat Lengan Panjang	299000	Inner t-shirt Pria yang terbuat dari bahan waffle, cocok juga dikenakan sebagai t-shirt luar. Dengan lapisan 100% katun yang terasa nyaman.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	22
502	HEATTECH Ultra Hangat T-Shirt Lengan Panjang Kerah Bulat	399000	Ultra Warm is 2.25 times* warmer than our regular HEATTECH. Soft and airy comfort.	\N	\N	4	22
503	HEATTECH Ultra Hangat Tights	399000	Ultra Warm is 2.25 times* warmer than our regular HEATTECH. Soft and airy comfort.	\N	\N	4	22
504	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton on the inside. 1.5 times* warmer than our regular 'HEATTECH'.	\N	\N	4	22
505	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton lining. 1.5 times* warmer than our regular 'HEATTECH'. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	6	4	22
506	KIDS HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	249000	1.5 times* warmer than our regular 'HEATTECH'. 100% cotton lining for a soft feel against the skin.	\N	\N	4	22
507	HEATTECH T-Shirt Kerah Bulat (Blok Warna)	249000	Warmth without bulk. A multifunctional base layer for all occasions. Due to hygiene reasons, this product cannot be returned.	\N	\N	4	22
508	HEATTECH T-Shirt Kerah Bulat Lengan Panjang	249000	Warmth without bulk. A multifunctional base layer for all occasions. Updated with a printed care label for even more comfort.	\N	\N	4	22
509	HEATTECH Kaos Kaki Pendek Blok Warna	99000	Warm socks packed with comfort features. Ribbed at the ankle for a non-constrictive fit.	\N	\N	4	22
510	HEATTECH Kaos Kaki Lapis Lembut	99000	Warm and cozy socks packed with comfort features.  Comfortable pile cushioning.	\N	\N	4	22
511	HEATTECH Kaos Kaki Fair Isle	99000	Warm and cozy socks packed with comfort features. The knit fabric and pattern give a sense of warmth.	\N	\N	4	22
512	HEATTECH Kaos Kaki Berlapis	99000	Warm and comfy socks packed with comfort features. Comfortable pile cushioning.	\N	\N	4	22
513	HEATTECH Kaos Kaki Half Berlapis	99000	Warm and comfy socks packed with comfort features. Comfortable pile cushioning.	\N	\N	4	22
514	T-Shirt Dry Warna Kerah Bulat Lengan Pendek	99000	T-shirt Pria yang lembut dan berkilau dengan teknologi DRY. Simpel dan cocok dipakai untuk sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	999	4	23
515	T-Shirt Dry Warna Kerah V Lengan Pendek	99000	T-shirt Pria yang lembut dan berkilau dengan teknologi DRY. Simpel dan cocok dipakai untuk sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	359	4	23
516	AIRism Katun T-Shirt Kerah Bulat Lengan Pendek	149000	T-shirt Pria dengan bahan 'AIRism' yang halus dengan tampilan katun. Cocok dikenakan sebagai t-shirt atau dalaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	210	4	23
517	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Dalaman 'AIRism', kini terbuat dari poliester daur ulang. Tetap tersembunyi di balik pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	33	4	23
518	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Inner t-shirt Pria dari bahan 'AIRism' yang senantiasa nyaman dan sejuk. Desain yang basic sangat ideal untuk dipakai sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	62	4	23
519	AIRism Katun T-Shirt Kerah Bulat Lengan Pendek	149000	T-shirt Pria dengan tampilan seperti katun dan performa 'AIRism'. Dapat dikenakan sebagai T-shirt atau pakaian dalam. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.8	201	4	23
520	AIRism T-Shirt Kerah V Lengan Pendek	149000	Dalaman Pria dari bahan 'AIRism' yang lembut, sejuk, dan nyaman. Tidak terlihat dari luar pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	34	4	23
521	AIRism T-Shirt Kerah V Lengan Pendek	149000	Dalaman Pria yang terasa senantiasa nyaman dan sejuk. Desain V-neck yang tetap tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.93	30	4	23
522	HEATTECH Katun T-Shirt Waffle Kerah Bulat Lengan Panjang	299000	Inner t-shirt Pria yang terbuat dari bahan waffle, cocok juga dikenakan sebagai t-shirt luar. Dengan lapisan 100% katun yang terasa nyaman.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	23
523	HEATTECH Katun T-Shirt Kerah Tinggi Lengan Panjang (Ekstra Hangat)	299000	Turtle neck ekstra hangat dengan 100% katun yang ramah terhadap kulit. Fitur deodorisasi untuk kenyamanan. 1,5 kali lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.68	22	4	23
524	HEATTECH Katun T-Shirt Kerah Bulat Lengan Panjang (Ekstra Hangat)	299000	T-shirt Pria dengan fitur deodorisasi untuk kenyamanan ekstra. 1,5 kali lebih hangat dari 'HEATTECH' regular. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	23
525	HEATTECH Ultra Hangat T-Shirt Kerah Bulat Lengan Panjang	399000	T-shirt Pria dengan elastisitas yang diperbarui sehingga mudah digerakkan. Dengan teknologi Ultra Warm, kira-kira 2,25 kali lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	57	4	23
526	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton lining. 1.5 times* warmer than our regular 'HEATTECH'. Due to hygiene reasons, this product cannot be returned.	5	6	4	23
527	HEATTECH T-Shirt Kerah Bulat (Blok Warna)	249000	Warmth without bulk. A multifunctional base layer for all occasions. Due to hygiene reasons, this product cannot be returned.	\N	\N	4	23
528	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton on the inside. 1.5 times* warmer than our regular 'HEATTECH'.	\N	\N	4	23
529	HEATTECH Ultra Hangat T-Shirt Lengan Panjang Kerah Bulat	399000	Ultra Warm is 2.25 times* warmer than our regular HEATTECH. Soft and airy comfort.	\N	\N	4	23
530	HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	299000	Premium 100% SUPIMA cotton lining. 1.5 times* warmer than our regular 'HEATTECH'. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	6	4	23
531	KIDS HEATTECH Katun T-Shirt Lengan Panjang Kerah Bulat (Ekstra Hangat)	249000	1.5 times* warmer than our regular 'HEATTECH'. 100% cotton lining for a soft feel against the skin.	\N	\N	4	23
532	HEATTECH Katun Tights (Ekstra Hangat)	299000	Legging Pria yang 1,5 kali lebih hangat dari 'HEATTECH' reguler. Menjaga kaki dan pinggul Anda tetap nyaman dan hangat. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	24
533	HEATTECH Ultra Hangat Tights	399000	Berdasarkan permintaan pelanggan, kami telah memperbarui bahan dengan elastisitas yang lebih baik sehinga mudah digerakkan. Sekitar 2,25 kali* lebih hangat dari 'HEATTECH' reguler. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.95	40	4	24
534	HEATTECH Katun Tights (Ekstra Hangat)	299000	Diperbarui dengan fitur penghilang bau. Permukaan katun untuk rasa nyaman dan teknologi Extra Warm yang kira-kira 1,5 kali lebih hangat dari 'HEATTECH' regular. Elastisitas luar biasa untuk memudahkan gerakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	24
535	HEATTECH Pakaian Dalam Tights	199000	Dalaman fungsional Pria yang hangat dan mudah digerakkan. Bersiluet ramping yang tetap tersembunyi di balik Bawahan.	4.85	26	4	24
536	HEATTECH Ultra Hangat Tights	399000	Ultra Warm is 2.25 times* warmer than our regular HEATTECH. Soft and airy comfort.	\N	\N	4	24
537	HEATTECH Pakaian Dalam Tights	249000	Warmth without bulk. Sleek tights, perfect for layering. Updated with a printed care label for even more comfort.	\N	\N	4	24
538	Pakaian Dalam Boxer Katun Motif	99000	Celana dalam Pria dari bahan katun yang terasa lembut. Dapat meregang untuk kenyamanan yang luar biasa. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
539	Pakaian Dalam Boxer Katun Motif	99000	Celana dalam Pria dari bahan katun yang lembut. Dengan kelenturan luar biasa untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
540	Pakaian Dalam Boxer Katun Garis	99000	Celana dalam Pria dari bahan katun yang lembut. Dapat meregang ke segala arah untuk kenyamanan luar biasa. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
541	Pakaian Dalam Boxer Katun Garis	99000	Celana dalam Pria dari bahan katun yang lembut. Dapat meregang ke segala arah untuk kenyamanan luar biasa. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
542	Pakaian Dalam Boxer Katun	99000	Celana boxer Pria dari bahan katun yang elastis dan lembut untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	65	4	25
543	Pakaian Dalam Boxer SUPIMA Katun	99000	Celana dalam Pria dengan katun premium yang terasa lentur dan nyaman. Desain pinggang tinggi yang tidak mudah bergeser.  Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	81	4	25
544	Pakaian Dalam Boxer SUPIMA Katun	99000	Celana boxer pria yang stretch dan nyaman dipakai. Siluet regular rise yang nyaman dan tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	81	4	25
545	Pakaian Dalam Boxer Katun Garis (Pinggang Rendah)	99000	Celana dalam Pria dari bahan katun yang lembut. Dapat meregang ke segala arah untuk kenyamanan luar biasa. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
546	Pakaian Dalam Boxer Katun Garis (Pinggang Rendah)	99000	Celana dalam Pria dari bahan katun yang lembut. Dapat meregang ke segala arah untuk kenyamanan luar biasa. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
547	Pakaian Dalam Boxer Katun Pinggang Rendah	99000	Celana boxer Pria dari bahan katun yang elastis dan lembut untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.77	35	4	25
548	Pakaian Dalam Boxer SUPIMA Katun (Pinggang Rendah)	99000	Celana dalam Pria dengan bahan katun premium yang lentur. Desain low rise dengan fit nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.81	48	4	25
549	Pakaian Dalam Pinggang Garis	99000	Celana dalam Pria dari bahan katun yang halus dan nyaman. Dengan kelenturan yang baik untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
550	Pakaian Dalam Garis	99000	Celana dalam Pria dari bahan katun yang halus dan nyaman. Dengan kelenturan yang baik untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
551	Pakaian Dalam	99000	Celana dalam Pria berbahan katun premium yang elastis dan nyaman. Hadir dalam fit ramping.	4.55	11	4	25
552	AIRism Pakaian Dalam Boxer Motif	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
553	AIRism Pakaian Dalam Boxer Motif	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
554	AIRism Pakaian Dalam Boxer Garis	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
555	AIRism Pakaian Dalam Boxer Garis	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut dan nyaman. Desain regular rise yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
556	AIRism Pakaian Dalam (Seamless)	149000	Celana dalam Pria dengan bahan 'AIRism' yang lembut dan nyaman. Terasa lentur untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.81	31	4	25
557	AIRism Pakaian Dalam Ultra Seamless	149000	Celana dalam Pria dari bahan 'AIRism' yang halus, nyaman, dan pas dikenakan. Terasa lentur untuk kemudahan bergerak. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.96	74	4	25
558	AIRism Pakaian Dalam Boxer	149000	Celana dalam Pria dari bahan 'AIRism', kini dengan polyester daur ulang. Desain tiga dimensi yang terasa nyaman dan sejuk. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
559	AIRism Pakaian Dalam Boxer	149000	Diperbarui dengan fit yang lebih nyaman. Bahan 'AIRism' yang lembut dan sejuk dipadukan dengan teknologi UV Protection. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.94	18	4	25
560	AIRism Pakaian Dalam Boxer	149000	Boxer Pria dengan kelembutan 'AIRism' yang terasa sejuk, nyaman, dan pas dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	19	4	25
561	AIRism Pakaian Dalam Boxer	149000	Celana dalam Pria dari bahan AIRism yang terasa sejuk di kulit Anda. Nyaman dan pas saat dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.86	14	4	25
562	AIRism Pakaian Dalam Boxer	149000	Celana boxer pria yang menjaga Anda tetap kering dan nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.88	26	4	25
563	AIRism Pakaian Dalam Boxer Motif (Pinggang Rendah)	149000	Celana dalam Pria dari bahan 'AIRism' yang halus dan nyaman. Pinggang rendah yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
564	AIRism Pakaian Dalam Boxer Motif (Pinggang Rendah)	149000	Celana dalam Pria dari bahan 'AIRism' yang halus dan nyaman. Pinggang rendah yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
565	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria dengan bahan 'AIRism' yang sejuk dan nyaman. Desain pinggang rendah. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
566	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria dari bahan 'AIRism' halus yang lembut, sejuk, dan nyaman. Desain pinggang rendah. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	16	4	25
567	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria dengan fitur AIRism yang sejuk dan nyaman. Desain low-rise yang tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	4	4	25
568	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria dengan fitur 'AIRism' yang sejuk dan nyaman. Desain low-rise yang tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	17	4	25
569	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Boxer Pria yang terbuat dari bahan 'AIRism' yang sejuk. Desain low-rise yang tetap tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	5	4	25
570	AIRism Pakaian Dalam Ultra Seamless (Pinggang Rendah)	149000	Boxer Pria tanpa jahitan dengan desain fit yang sempurna. Kini terasa lebih nyaman dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	298	4	25
571	AIRism Pakaian Dalam Boxer Pinggang Rendah	149000	Celana dalam Pria yang terbuat dari bahan AIRism yang sejuk. Desain low-rise membuatnya tetap tersembunyi di balik lapisan luar. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.78	18	4	25
572	AIRism Pakaian Dalam Boxer Low Rise	149000	Celana boxer pria yang terasa halus dan lembut. Menjaga Anda tetap sejuk, kering, dan nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.67	6	4	25
573	Celana Boxer Tenun Motif Kecil	99000	Celana dalam Pria dari 100% katun yang lembut dan berkilau. Fit relax yang terasa ringan dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
574	Celana Boxer Tenun Kotak	99000	Celana dalam Pria dari 100% katun yang lembut dan berkilau. Fit relax yang terasa ringan dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
575	Celana Boxer Tenun Kotak	99000	Celana dalam Pria dari 100% katun yang lembut dan berkilau. Fit relax yang terasa ringan dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	25
576	Celana Boxer Tenun Polkadot	99000	Celana dalam Pria dari 100% katun yang lembut dan berkilau. Fit relax yang terasa ringan dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	2	4	25
577	Celana Boxer Tenun Garis	99000	Celana dalam Pria dari 100% katun yang lembut dan berkilau. Fit relax yang terasa ringan dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	25
578	Celana Boxer Tenun Polkadot	99000	Celana dalam Pria yang terbuat dari 100% katun premium. Potongan lebar yang santai. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	20	4	25
579	Celana Boxer Tenun Garis London	99000	Celana dalam Pria dari bahan 100% katun. Terdapat lapisan penyerap cairan pada pinggang sehingga nyaman dan lembut dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	9	4	25
580	Celana Boxer Tenun Garis London	99000	Stitched elastic waistband for a secure fit. 100% cotton for a fresh feel.	5	8	4	25
581	Pakaian Dalam Tenun Broadcloth	99000	Stitched elastic waistband for a secure fit. 100% cotton for a fresh feel.	4.8	25	4	25
582	Celana Boxer Tenun Garis	99000	Celana dalam pria dari bahan katun yang terasa nyaman dan fresh. Dengan siluet relax. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.86	21	4	25
583	Celana Boxer Tenun	99000	Celana dalam Pria yang terbuat dari 100% katun untuk kenyamanan Anda. Terdapat lapisan penyerap air di bagian pinggang yang lembut dan terasa nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.88	25	4	25
584	Celana Boxer Tenun Polkadot	99000	Celana dalam pria yang ringan, nyaman dipakai, dan tidak ketat. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.8	56	4	25
585	Pakaian Dalam Boxer Katun (Patchwork)	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.93	15	4	25
586	Pakaian Dalam Boxer Katun Motif	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.95	22	4	25
672	Celana Jersey Ankle Washed Denim	399000	A versatile wardrobe essential. Garment-washed for a casual jeans style.	\N	\N	5	27
587	Pakaian Dalam Boxer Katun Motif	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	10	4	25
588	Pakaian Dalam Boxer Katun (Garis)	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	17	4	25
589	Pakaian Dalam Boxer Katun (Garis)	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	17	4	25
590	Pakaian Dalam Boxer Katun Motif (Pinggang Rendah)	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	25	4	25
591	Pakaian Dalam Boxer Katun Motif (Pinggang Rendah)	99000	Boxer yang lembut dan terbuat dari katun elastis untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	18	4	25
592	Pakaian Dalam Boxer SUPIMA Katun (Pinggang Rendah)	99000	Celana boxer Pria dengan katun premium yang terasa lentur. Desain low rise dengan fit yang nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.75	16	4	25
593	Pakaian Dalam	99000	Dalaman dengan 100% katun yang lembut dan fit ramping. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.55	11	4	25
594	AIRism Pakaian Dalam Boxer (Motif)	149000	Boxer 'AIRism' Pria, kini dibuat dari bahan poliester daur ulang. Desain tiga dimensi yang sejuk untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.91	11	4	25
595	AIRism Pakaian Dalam Boxer (Motif)	149000	Boxer 'AIRism' Pria, kini dibuat dari bahan poliester daur ulang. Desain tiga dimensi yang sejuk untuk kenyamanan Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	12	4	25
596	AIRism Pakaian Dalam Boxer (Pinggang Rendah)	149000	Celana dalam Pria dari bahan 'AIRism' yang lembut, sejuk, dan terasa nyaman. Desain low-rise yang terlihat ramping. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.94	17	4	25
597	Celana Boxer Tenun Kotak	99000	Celana dalam Pria dari 100% katun yang nyaman. Terdapat lapisan penyerap di bagian pinggang. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	27	4	25
598	Celana Boxer Tenun Kotak Gingham	99000	Celana dalam Pria dari bahan 100% katun. Terdapat lapisan penyerap cairan pada pinggang sehingga nyaman dan lembut dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.92	13	4	25
599	Celana Boxer Tenun Motif Kecil	99000	Celana dalam Pria dari bahan 100% katun. Terdapat lapisan penyerap cairan pada pinggang sehingga nyaman dan lembut dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.86	36	4	25
600	Celana Boxer Tenun Gingham Kotak	99000	Stitched elastic waistband for a secure fit. 100% cotton for a fresh feel.	5	10	4	25
601	Celana Boxer Tenun Gingham Kotak	99000	Celana dalam pria dari bahan katun yang terasa nyaman dan fresh. Dengan siluet relax. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.81	16	4	25
602	Pakaian Dalam Boxer Katun	99000	The smooth feel of cotton. All-direction stretch for incredible comfort.	4.67	3	4	25
603	Pakaian Dalam Boxer Katun (Pinggang Rendah)	99000	The smooth feel of cotton. All-direction stretch for incredible comfort.	5	3	4	25
604	Celana Boxer Garis London	99000	Smooth and glossy 100% cotton. Relaxed fit for a light feel.	5	2	4	25
605	Celana Boxer Tenun Broadcloth	99000	Smooth and glossy 100% cotton. Relaxed fit for a light feel.	\N	\N	4	25
606	Kaos Kaki Warna	50000	Kaos kaki basic dari bahan rib rajut. Tersedia dalam banyak pilihan warna yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	124	4	26
607	Kaos Kaki Warna	50000	Kaos kaki basic dari bahan rib rajut. Tersedia dalam banyak pilihan warna yang stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	124	4	26
608	Kaos Kaki Polkadot	79000	Kaos kaki Pria yang lembut dan tidak terasa ketat. Terdapat rajutan rata sehingga terasa halus. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
609	Kaos Kaki Garis	79000	Kaos kaki Pria yang lembut dan tidak terasa ketat. Desain berkontur yang tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
610	Kaos Kaki Garis Berlapis	79000	Kaos kaki Pria dengan rib di bagian bukaan kaki sehingga mudah untuk digulung. Bantalan empuk pada bagian sol untuk kenyamanan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
611	Kaos Kaki Garis	79000	Kaos kaki Pria yang lembut dan tidak terasa ketat. Terdapat rajutan rata sehingga terasa halus. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
612	Kaos Kaki Garis	79000	Kaos kaki Pria yang lembut dan tidak terasa ketat. Dengan rajutan rata yang terasa halus.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
613	Kaos Kaki SUPIMA Katun Rib Lebar	79000	Kaos kaki Pria dari bahan katun premium yang berkilau. Lembut dan tidak terasa ketat.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	10	4	26
614	Kaos Kaki SUPIMA Katun Rib Lebar	79000	Kaos kaki Pria dari bahan katun premium yang berkilau. Lembut dan tidak terasa ketat.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	10	4	26
615	Kaos Kaki SUPIMA Katun Kotak	50000	Kaos kaki yang terbuat dari bahan katun premium, cocok untuk berbagai kesempatan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	6	4	26
616	Kaos Kaki Garis	79000	Kaos kaki Pria yang lembut dan tidak terasa ketat. Dengan rajutan rata yang terasa halus.Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
617	Kaos Kaki Berlapis	79000	Kaos Kaki pile fungsional yang memiliki bantalan dan sirkulasi udara yang baik. Fit terasa nyaman.	5	16	4	26
618	Kaos Kaki SUPIMA Katun Pique	79000	Kaos kaki Pria dari bahan katun premium yang cocok untuk berbagai kesempatan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
619	Kaos Kaki Half Berlapis	79000	Kaos kaki Pria berperforma tinggi dengan fitur DRY, deodorisasi, dan mengontrol bau. Desain rib berlapis ganda pada bukaan kaki agar nyaman dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	26
620	Kaos Kaki Half Olahraga	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap sejuk. Bahan mesh sejuk di bagian insole. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
621	Kaos Kaki Half Rib	79000	Kaos kaki Pria dengan aksen warna pada bukaan dan rajut rib yang nyaman dikenakan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
622	Kaos Kaki Half Olahraga	79000	Kaos Kaki Pria berperforma tinggi yang elastis dan sejuk. Sepanjang betis yang ideal untuk olahraga atau kasual. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	11	4	26
623	Kaos Kaki Half Lapis Lembut	79000	Kaos kaki Pria dengan cushion yang nyaman. Terasa lembut, cocok dipakai di dalam rumah. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
624	Kaos Kaki Half Berlapis	79000	Kaos Kaki berperforma tinggi dengan bantalan yang luar biasa nyaman. Ukuran sepanjang betis yang cocok untuk olahraga dan kasual. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	19	4	26
625	Kaos Kaki Pendek Olahraga Blok Warna	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap sejuk. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	4	26
626	Kaos Kaki Pendek Olahraga	79000	Kaos kaki Pria berperforma tinggi yang menjaga Anda tetap sejuk. Barbahan elastis sehingga terasa lebih nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
627	Kaos Kaki Pendek Olahraga Garis Berlapis	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap segar. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.75	12	4	26
628	Kaos Kaki Pendek Berlapis Lembut	79000	Kaos kaki Pria dengan sol yang lembut dan nyaman. Terdapat rib di bukaan kaki sehingga tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	4	26
629	Kaos Kaki Pendek Rib	79000	Kaos kaki Pria yang memberi aksen warna-warni pada kaki Anda. Rajut rib untuk fit yang lebih nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	6	4	26
630	Kaos Kaki Pendek Berlapis	79000	Kaos kaki Pria yang terasa pas dikenakan. Terdapat aksen warna pada bukaan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	6	4	26
631	Kaos Kaki Pendek Mesh Berlapis	79000	Kaos Kaki pile fungsional yang memiliki bantalan dan sirkulasi udara yang baik. Fit terasa nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	13	4	26
632	Kaos Kaki Pendek Rib	79000	Kaos kaki Pria berukuran pendek dengan tampilan stylish. Dengan aksen warna di pergelangan. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.6	15	4	26
633	Kaos Kaki Pendek Sports Garis	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap segar. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.77	13	4	26
634	Kaos Kaki Potongan Rendah Berlapis	79000	Kaos kaki Pria dengan fitur anti-selip pada tumit. Potongan rendah yang tetap tersembunyi di balik sepatu Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.88	41	4	26
635	Kaos Kaki Potongan Rendah Garis	79000	Kaos kaki Pria dengan fitur anti-selip pada tumit. Potongan rendah yang tetap tersembunyi di balik sepatu Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	11	4	26
636	Kaos Kaki Potongan Rendah	79000	Kaos kaki Pria dengan fitur anti-selip pada tumit. Potongan rendah yang tetap tersembunyi di balik sepatu Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4	1	4	26
637	Kaos Kaki Potongan Rendah Garis	79000	Kaos kaki Pria dengan fitur anti-selip pada tumit. Potongan rendah yang tetap tersembunyi di balik sepatu Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	11	4	26
638	Kaos Kaki Potongan Rendah Berlapis	79000	Kaos kaki Pria dengan fitur anti-selip pada tumit. Potongan rendah yang tetap tersembunyi di balik sepatu Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.88	41	4	26
639	Kaos Kaki Potongan Rendah	79000	Kaos kaki Pria yang tidak terlihat dari luar. Desain yang pas dikenakan dan tidak mudah bergeser. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.77	69	4	26
640	HEATTECH Kaos Kaki Lapis Lembut	99000	Warm and cozy socks packed with comfort features.  Comfortable pile cushioning.	\N	\N	4	26
641	HEATTECH Kaos Kaki Fair Isle	99000	Warm and cozy socks packed with comfort features. The knit fabric and pattern give a sense of warmth.	\N	\N	4	26
642	HEATTECH Kaos Kaki Berlapis	99000	Warm and comfy socks packed with comfort features. Comfortable pile cushioning.	\N	\N	4	26
643	HEATTECH Kaos Kaki Half Berlapis	99000	Warm and comfy socks packed with comfort features. Comfortable pile cushioning.	\N	\N	4	26
644	HEATTECH Kaos Kaki Pendek Blok Warna	99000	Warm socks packed with comfort features. Ribbed at the ankle for a non-constrictive fit.	\N	\N	4	26
645	Kaos Kaki Bertumpuk	79000	High-performance socks for stay-fresh comfort. Breathable mesh instep.	\N	\N	4	26
646	Celana Rileks Katun Ankle Denim	399000	Celana panjang Pria, kini dengan aksen indigo yang tidak mudah pudar. Terbuat dari denim lentur untuk kemudahan bergerak.	\N	\N	5	27
647	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang dapat dikenakan di rumah atau saat bepergian. Bahan katun yang elastis untuk kemudahan bergerak.	4.8	5	5	27
648	Celana Rileks Katun Ankle	399000	Celana panjang Pria dari bahan katun yang elastis untuk kemudahan bergerak. Didesain sehingga sempurna dikenakan di dalam atau luar ruangan.	5	13	5	27
649	Celana Jersey Ankle Washed	399000	Celana kasual dengan detail jahitan yang unik. Pinggang dapat disesuaikan untuk fit yang lebih nyaman.	4.93	30	5	27
650	Celana Katun Ankle Rileks	399000	Celana panjang Pria yang dibuat dengan proses washed untuk tampilan kasual. Cocok dikenakan di rumah atau untuk bepergian.	4.84	69	5	27
651	Celana Jogger Katun Rileks	399000	Celana panjang Pria yang diproduksi dengan proses wash untuk tampilan kasual. Celana serbaguna dengan potongan jogger, cocok untuk bepergian.	4.87	30	5	27
652	Celana Pendek Rileks Dry Stretch	299000	Celana pendek dari bahan yang cepat kering untuk kemudahan bergerak. Cocok untuk bersantai di rumah maupun bepergian.	4.93	29	5	27
653	Celana Pendek Rileks Stretch Seersucker	299000	Celana pendek dengan bahan seersucker yang sejuk. Pinggang elastis yang nyaman.	5	5	5	27
654	Celana Pendek Rileks Stretch (Chambray)	299000	Celana pendek dengan desain yang nyaman, cocok untuk bersantai di rumah maupun bepergian.	4.94	18	5	27
655	Celana Pendek Rileks Washed Jersey	299000	Celana pendek kasual yang dibuat melalui proses wash untuk tekstur yang khas.	4.83	52	5	27
656	Celana Pendek Rileks Washed Jersey	299000	Celana Pendek Pria dengan tekstur unik. Bahan ringan dan nyaman sehingga mudah untuk digerakkan.	4.9	138	5	27
657	Celana Jersey Ankle Washed	399000	Celana Pria yang terbuat dari bahan elastis sehingga mudah digerakkan.	4.84	37	5	27
658	Celana Rileks Katun Ankle (Motif)	399000	Celana panjang Pria yang terbuat dari benang slub bernuansa natural, dalam motif kotak yang unik. Celana serbaguna untuk indoor dan outdoor.	4.89	18	5	27
659	Celana Rileks Katun Ankle (Denim)	399000	Celana panjang Pria yang terlihat seperti denim, dengan fit lebar yang nyaman. Saku fungsional di kedua sisi belakang.	4.91	35	5	27
660	AIRism Katun Set Mesh Lengan Pendek	399000	Piyama Pria dari bahan 'AIRism' halus yang terlihat seperti katun. Dengan saku fungsional di kedua sisi. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.75	12	5	27
661	Celana Pendek Rileks Stretch (Daun)	299000	Celana pendek dari bahan twill untuk tampilan kasual. Pinggang elastis yang nyaman.	4.75	4	5	27
662	Celana Pendek Relax Stretch (Seersucker)	299000	Celana pendek Pria dengan pinggang elastis yang nyaman.	4.74	54	5	27
663	AIRism Katun Celana Pendek Rileks	299000	Celana Pendek Pria yang terasa lembut di kulit. Terdapat saku dan drawstring yang dapat disesuaikan di bagian pinggang.	4.94	65	5	27
664	Celana Jogger Jersey Washed	399000	Stretch fabric for casual styling. Versatile pants designed to be perfect indoors or out.	4	1	5	27
665	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
666	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
667	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
668	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
669	Celana Flannel Ankle Rileks (Motif)	399000	\N	\N	\N	5	27
673	Sandal Rumah Waffle (Sol Karet)	299000	Sandal rumah yang dapat dicuci dengan mesin untuk kemudahan perawatan. Desain open toe yang nyaman. Produk ini tidak dapat dikembalikan.	4.75	12	5	28
674	Sandal Rumah (Sol Karet)	299000	Sandal rumah dengan desain terbaru yang terasa ringan, dilengkapi dengan bantalan yang sangat nyaman. Produk ini tidak dapat dikembalikan.	4.5	6	5	28
675	Sandal Rumah Serupa Denim (Sol Karet)	299000	Sandal rumah dengan desain terbaru yang terasa ringan, dilengkapi dengan bantalan yang sangat nyaman. Produk ini tidak dapat dikembalikan.	4	5	5	28
676	Sandal Rumah	299000	Sandal dari bahan berbulu yang terasa sejuk dikenakan. Produk ini tidak dapat dikembalikan.	4.88	8	5	28
677	Sandal Rumah Washable (Sol Karet)	299000	Sandal rumah yang diperbarui untuk fit nyaman. Produk ini tidak dapat dikembalikan.	4.76	58	5	28
678	Topi 2WAY Stretch Proteksi Sinar UV	299000	Topi dari bahan two-way stretch sehingga terasa nyaman. Teknologi DRY membuat Anda merasa sejuk. UPF50+. Produk ini tidak dapat dikembalikan.	4.4	10	6	29
679	Topi Twill Proteksi Sinar UV	299000	Topi dengan desain klasik yang bisa dipakai ke mana saja. Dilengkapi dengan teknologi DRY dan UV Protection. UPF50+. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	6	29
680	Topi Twill Proteksi Sinar UV	299000	Topi yang sangat fungsional dan menambakan aksen stylish pada outfit Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	21	6	29
681	Topi Bucket Proteksi Sinar UV	299000	Topi dengan desain simpel yang cocok untuk berbagai gaya. Terdapat fitur UV protection dan teknologi DRY untuk kenyamanan yang tahan lama. UPF50+. Produk ini tidak dapat dikembalikan.	4.5	2	6	29
682	Topi Proteksi Sinar UV	299000	Topi yang terasa ringan, mudah dilipat, dan dibawa kemana saja. Cocok untuk berkegiatan di luar ruangan. UPF50+. Produk ini tidak dapat dikembalikan.	5	1	6	29
683	Topi Proteksi Sinar UV	299000	Topi fungsional dan fashionable yang cocok untuk berbagai kesempatan. Produk ini tidak dapat dikembalikan.	4.82	11	6	29
684	Topi Bucket Linen Blend Proteksi Sinar UV	299000	Topi dengan tekstur alami yang menarik. Sangat fungsional dan nyaman untuk berbagai situasi. Produk ini tidak dapat dikembalikan.	5	11	6	29
685	Tas Bahu Mini Bulat	199000	Tas mini dengan ukuran yang tepat untuk semua kebutuhan Anda. Tekstur alami yang cocok dengan gaya apa pun. Produk ini tidak dapat dikembalikan.	4.95	134	6	31
686	Tas Nilon	199000	Tas dengan ukuran yang ideal untuk dikenakan. Sesuaikan strap untuk menggunakannya sebagai tas bahu. Produk ini tidak dapat dikembalikan.	4.96	141	6	31
687	Tas Utilitas 2WAY	499000	Tas dengan desain terbaru agar lebih mudah dibawa. Desain 2-way yang dapat dikenakan untuk aktivitas outdoor atau kasual. Produk ini tidak dapat dikembalikan.	4.58	19	6	31
688	Tas Kado	59000	Sempurna untuk memberi kado! Tersedia dalam berbagai ukuran untuk memuat berbagai jenis hadiah.	4.93	82	6	31
689	Tas Eco-Friendly	39000	Tas ramah lingkungan yang ringan dan bisa dilipat secara praktis. Produk ini tidak dapat dikembalikan.	4.9	91	6	31
690	Tas Bahu Mini Bulat	199000	Tas mini dengan fitur water-repellent dan fit sempurna untuk kegiatan aktif seperti berolahraga. Dengan kapasitas penyimpanan yang besar. Terbuat dari polyester daur ulang. Produk ini tidak dapat dikembalikan.	4.96	682	6	31
691	Ikat Pinggang Italian Leather Vintage Narrow	499000	Ikat pinggang Pria dengan bahan dan proses pembuatan yang dipilih dengan cermat untuk hasil akhir autentik. Desain sylish yang cocok untuk tampilan kasual.	5	3	6	32
692	Ikat Pinggang Kulit Mesh	499000	Ikat Pinggang mesh dengan kulit braided berkualitas tinggi. Bebas disesuaikan dengan fit yang Anda inginkan. Produk ini tidak dapat dikembalikan.	5	3	6	32
693	Ikat Pinggang Kulit Lebar Mesh	499000	Ikat pinggang Pria dengan bahan dan proses pembuatan yang dipilih dengan cermat untuk hasil akhir autentik. Dengan proses khusus untuk memberi tekstur lembut dan tampilan seperti sudah pernah dipakai. Produk ini tidak dapat dikembalikan.	\N	\N	6	32
694	Ikat Pinggang Kulit Italia Vintage	499000	Ikat pinggang tekstur mengkilap dengan kulit autentik Italia, dengan buckle bergaya vintage. Produk ini tidak dapat dikembalikan.	\N	\N	6	32
695	Ikat Pinggang Kulit Italia Oiled	499000	Ikat pinggang dari kulit asli premium Italia. Tekstur terlihat berkarakter seiring pemakaian. Produk ini tidak dapat dikembalikan.	5	8	6	32
696	Ikat Pinggang Kulit Italia Stitched Lembut	499000	Ikat pinggang Pria yang dibuat dari bahan dan proses pembuatan khusus untuk hasil akhir autentik. Dengan detail jahitan dan desain yang stylish. Produk ini tidak dapat dikembalikan.	\N	\N	6	32
697	Ikat Pinggang Italian Leather Stitched	499000	Ikat pinggang premium untuk pria dengan detail stitching khusus. Pasangkan dengan pakaian apapun untuk tampilan stylish. Produk ini tidak dapat dikembalikan.	\N	\N	6	32
698	Payung Compact Proteksi Sinar UV	299000	Payung dengan fitur UV Protection. Desain dan bahan yang terasa ringan namun tahan lama. UPF40. Produk ini tidak dapat dikembalikan.	\N	\N	6	34
699	Payung Compact Proteksi Sinar UV	299000	Payung ringan dan tahan lama yang cocok untuk cuaca hujan maupun panas. Praktis sehingga cocok dibawa di dalam tas. UPF40.	\N	\N	6	34
700	Kacamata Persegi	299000	Sunglass dengan lensa anti-fog terbaru yang tahan terhadap embun. Lensa berbentuk persegi yang stylish. Produk ini tidak dapat dikembalikan.	4	3	6	35
701	Kacamata Boston Persegi	299000	Sunglass dengan desain stylish dan serbaguna. Mudah dipadankan dengan outfit manapun. Produk ini tidak dapat dikembalikan.	5	11	6	35
702	Kacamata Persegi	299000	Sunglass dengan lensa berwarna untuk tampilan kasual. Nosepad yang terasa nyaman. Produk ini tidak dapat dikembalikan.	4.8	5	6	35
703	Kacamata Teardrop	299000	Sunglass dengan desain klasik yang tak lekang oleh waktu. Nyaman dipakai dengan performa tinggi. Produk ini tidak dapat dikembalikan.	4.43	7	6	35
704	Kacamata Browline	299000	Sunglass dengan desain santai yang cocok dikenakan ke mana saja. Desain stylish yang melengkapi gaya outfit Anda. Produk ini tidak dapat dikembalikan.	4.4	5	6	35
705	Kacamata Sports Rim Half	299000	Sunglass dengan lensa terbaru yang tahan terhadap kabut. Cocok untuk berolahraga. Produk ini tidak dapat dikembalikan.	5	3	6	35
706	Kacamata Frame Besi Bulat	299000	Sunglass dengan desain dan bahan terbaru. Tampilan unik yang cocok dikenakan apa adanya. Produk ini tidak dapat dikembalikan.	4.71	7	6	35
707	Kacamata Wellington Lipat	299000	Sunglass yang dapat dilipat. Perlindungan praktis terhadap sinar matahari saat bepergian ke luar. Produk ini tidak dapat dikembalikan.	4.85	26	6	35
708	Kacamata Sports Rim Half	299000	Sunglass dengan lensa terbaru yang tahan terhadap kabut. Cocok untuk berolahraga. Produk ini tidak dapat dikembalikan.	5	3	6	35
709	Topi Proteksi Sinar UV	299000	Topi fungsional dan fashionable yang cocok untuk berbagai kesempatan. Produk ini tidak dapat dikembalikan.	4.82	11	6	36
710	Topi 2WAY Stretch Proteksi Sinar UV	299000	Topi dari bahan two-way stretch sehingga terasa nyaman. Teknologi DRY membuat Anda merasa sejuk. UPF50+. Produk ini tidak dapat dikembalikan.	4.4	10	6	36
711	Topi Twill Proteksi Sinar UV	299000	Topi yang sangat fungsional dan menambakan aksen stylish pada outfit Anda. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.9	21	6	36
712	HEATTECH Sarung Tangan Lapis Stretch	299000	Taklukan udara dingin dengan kehangatan Sarung Tangan 'HEATTECH'. Kini lebih sensitif terhadap touch screen. Produk ini tidak dapat dikembalikan.	3.67	6	6	36
713	HEATTECH Sarung Tangan Lapis Fungsional	299000	Sarung tangan Pria yang diperbarui menjadi lebih sensitif terhadap touch screen. Sarung tangan performa tinggi yang terbuat dari kehangatan dan fitur windproof 'HEATTECH'. Produk ini tidak dapat dikembalikan.	4.58	19	6	36
714	Topi Bucket Linen Blend Proteksi Sinar UV	299000	Topi dengan tekstur alami yang menarik. Sangat fungsional dan nyaman untuk berbagai situasi. Produk ini tidak dapat dikembalikan.	5	11	6	36
715	HEATTECH Sarung Tangan Lapis Stretch	299000	Warm and cozy 'HEATTECH'. Touchscreen compatible.	\N	\N	6	36
716	HEATTECH Sarung Tangan Suede Sintetis	299000	Warm and functional 'HEATTECH'. Touchscreen compatible.	\N	\N	6	36
717	HEATTECH Sarung Tangan Lapis Fungsional	299000	The perfect gloves for active scenarios. Warm 'HEATTECH' fleece lining.	\N	\N	6	36
718	T-Shirt Dry Warna Kerah Bulat Lengan Pendek	99000	T-shirt Pria yang lembut dan berkilau dengan teknologi DRY. Simpel dan cocok dipakai untuk sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.83	999	7	37
719	Jaket Sweat Dry Stretch Hoodie Lengan Panjang	599000	Jaket hoodie Pria dengan bahan katun pada bagian luar untuk kesan premium. Kini terasa lebih elastis. Terdapat lapisan bahan mesh yang cepat kering di dalam tudung dan saku.	5	1	7	37
720	Jaket Sweat Dry Stretch Hoodie Lengan Panjang	599000	Jaket hoodie Pria dengan bahan katun pada bagian luar untuk kesan premium. Kini terasa lebih elastis. Terdapat lapisan bahan mesh yang cepat kering di dalam tudung dan saku.	5	1	7	37
721	Hoodie DRY-EX Proteksi Sinar UV Retsleting	399000	Jaket Hoodie Pria dengan mesh yang sejuk dan nyaman. Sangat elastis untuk kemudahan bergerak dengan UPF 50+. Terbuat dari polyester daur ulang.	4.85	94	7	37
722	AIRism Jaket Proteksi Sinar UV Retsleting	399000	Hoodie yang lembut dan nyaman. Sweater kasual yang melindungi Anda dari sinar UV. Dengan UPF 40.	4.93	136	7	37
723	Sweat Hoodie Retsleting Lengan Panjang	499000	Hoodie Pria yang dengan tekstur yang diperbarui di kedua sisi. Serat bahan tidak mudah rontok.	4.88	142	7	37
724	Pullover Sweat Hoodie Lengan Panjang	499000	Pullover hoodie dengan tekstur yang diperbarui di kedua sisi. Lapisan terbaru dengan serat tidak mudah rontok.	4.97	35	7	37
725	Sweater Lengan Panjang	399000	Sweater Pria yang dibuat dari pilihan bahan yang lembut. Terlihat autentik dengan detail yang dirancang dengan cermat.	4.88	41	7	37
726	Jaket Parka Reversibel (Water-Repellent)	599000	Jaket hoodie Pria dengan desain 2 gaya (reversibel). Terdapat lapisan water-repellent untuk perlindungan di berbagai cuaca.	4.88	81	7	37
727	BLOCKTECH Jaket Parka (Water-Repellent)	999000	Jaket hoodie Pria yang beperforma tinggi untuk melindungi dari berbagai kondisi cuaca. Cocok dikenakan sepanjang waktu.	4.88	42	7	37
728	Jaket Parka Saku Proteksi Sinar UV Potongan 3D (Water-Repellent)	599000	Jaket hoodie Pria untuk sehari-hari. Potongan 3D untuk kemudahan bergerak, dengan fitur UV Protection (UPF 40). Bahan memiliki fungsi water-repellent, cocok dikenakan saat hujan ringan.	4.55	31	7	37
729	Jaket Parka Seamless Down (Potongan 3D)	1990000	Jaket hangat Pria dengan desain tudung yang diperbarui, memberi perlindungan lebih terhadap udara dingin. Fungsional dan stylish. Cocok untuk holiday dan traveling.	\N	\N	7	37
730	Jaket Parka Saku Proteksi Sinar UV Potongan 3D (Water-Repellent)	599000	Jaket hoodie Pria santai yang mudah dipadupadankan. Desain 3D cut pada bagian badan, bahu, dan lengan, dengan fungsi UV Protection (UPF40). Bahan memiliki fungsi water-repellent, cocok dikenakan saat hujan ringan.	4.78	157	7	37
731	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria dengan teknologi 'DRY-EX' yang cepat kering. Bahan mesh sejuk pada bagian belakang untuk menjaga Anda tetap segar.	4.75	4	7	37
732	T-Shirt Grafis Lengan Pendek Roger Federer	299000	Koleksi kolaborasi dengan Roger Federer. Bahan katun premium dengan logo RF.	4.98	50	7	37
733	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria berperforma tinggi dengan fitur 'DRY-EX' yang cepat kering. Kini terasa lebih ringan untuk kenyamanan yang lebih baik.	4.65	37	7	37
734	T-Shirt DRY-EX Kerah Bulat Lengan Pendek	249000	T-shirt Pria dengan teknologi Quick-drying 'DRY-EX', dilengkapi dengan 3 tipe mesh untuk kesegaran tahan lama. Terbuat dari polyester daur ulang.	4.87	114	7	37
735	T-Shirt DRY-EX Kerah Bulat Lengan Pendek (Mapping)	249000	T-shirt Pria dan Wanita dengan performa tinggi yang sejuk dan nyaman. Cocok untuk berolahraga.	4.79	291	7	37
736	Kaos Polo DRY-EX Lengan Pendek (Gradasi)	299000	Kaos Polo Pria berbahan 'DRY-EX' yang cepat kering dengan panel mesh di beberapa bagian. Desain warna alami cocok untuk pakaian kasual atau olahraga. Terbuat dari polyester daur ulang.	4.96	24	7	37
737	Kaos Polo DRY-EX Lengan Pendek	299000	Kaos Polo Pria yang terbuat dari bahan daur ulang. Sangat fungsional dan nyaman dipakai.	4.84	161	7	37
738	Kaos Polo DRY-EX Lengan Pendek	299000	Kaos Polo 'DRY-EX' yang cepat kering dengan 3 tipe mesh untuk kesejukan yang tahan lama. Padankan dengan koleksi Pria Celana, cocok dipakai untuk kegiatan outdoor dan mobilitas sehari-hari. Terbuat dari poliester daur ulang.	4.88	172	7	37
739	Celana Lipit AirSense	599000	Celana panjang Pria yang ringan, lentur, dan cepat kering. Celana performa tinggi dengan saku breathable.	4.67	6	7	37
740	Celana Sweat Garis Samping	399000	Celana training Pria dari bahan katun yang lembut. Dilengkapi dengan desain garis sporty.	\N	\N	7	37
741	Celana Tapered Ultra Stretch DRY-EX	399000	Celana training Pria dengan performa tinggi yang didesain untuk kenyamanan. Bawahan esensial yang wajib dimiliki siapapun. Terbuat dari polyester daur ulang.	4.91	78	7	37
742	Celana Sweat (Garis Samping)	399000	Celana Sweat yang nyaman dan lembut. Terdapat aksen garis di bagian samping untuk tampilan yang ramping dan stylish.	4.86	14	7	37
743	Celana Jogger Ultra Stretch DRY-EX	399000	Celana jogger lembut untuk kemudahan bergerak, dengan kilau elegan. Cocok untuk berbagai kesempatan.	4.97	99	7	37
744	Celana Sweat Dry Stretch	499000	Celana training terbaru dengan tampilan stylish yang tidak terlihat terlalu kasual. Sangat fungsional dan terasa nyaman. Terbuat dari polyester daur ulang.	4.95	20	7	37
745	Celana Sweat	399000	Celana training modis dengan tekstur halus. Aksen rib pada pinggang dan hem untuk fit yang ramping.	4.77	30	7	37
746	Celana Pendek DRY-EX Motif	299000	Celana pendek Pria dari bahan cepat kering dengan grafis yang menarik. Terbuat dari polyester daur ulang.	4.5	8	7	37
747	Celana Pendek Stretch Slim Fit Motif	399000	Celana pendek Pria dengan pinggang elastis untuk kenyamanan Anda. Cocok untuk tampilan stylish.	4.79	14	7	37
748	Celana Pendek Stretch Slim Fit	399000	Celana pendek Pria yang terasa nyaman dan elastis. Dengan pinggang elastis untuk kemudahan bergerak.	\N	\N	7	37
749	Celana Pendek Geared	399000	Celana pendek Pria dengan fitur water-repellent untuk segala kondisi cuaca. Saku samping dengan ritsleting cocok untuk kegiatan olahraga.	4.78	9	7	37
750	Celana Pendek DRY-EX Ultra Stretch	299000	Celana pendek Pria dengan bahan yang memudahkan gerak dan terasa halus. Saku dengan retsleting untuk menyimpan barang Anda dengan aman selama berolahraga. Terbuat dari polyester daur ulang.	4.88	32	7	37
751	Celana Pendek Stretch Slim Fit	399000	Celana pendek Pria dengan pinggang yang elastis dan nyaman. Cocok untuk tampilan semi-formal.	4.62	40	7	37
752	Celana Pendek Geared	399000	Celana pendek dari nilon ringan dan fitur water resistance. Celana praktis dengan detail fungsional.	4.88	66	7	37
773	AIRism Katun T-Shirt Tanpa Lengan	199000	T-shirt Pria dari bahan 'AIRism' yang halus dengan tampilan katun. Desain dan potongan basic serbaguna.	4.78	49	7	37
753	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Dalaman 'AIRism', kini terbuat dari poliester daur ulang. Tetap tersembunyi di balik pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	33	7	37
754	AIRism T-Shirt Kerah V Lengan Pendek	149000	Dalaman Pria dari bahan 'AIRism' yang lembut, sejuk, dan nyaman. Tidak terlihat dari luar pakaian. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.85	34	7	37
755	AIRism T-Shirt Kerah Bulat Lengan Pendek	149000	Inner t-shirt Pria dari bahan 'AIRism' yang senantiasa nyaman dan sejuk. Desain yang basic sangat ideal untuk dipakai sehari-hari. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.89	62	7	37
756	Topi Bucket Proteksi Sinar UV	299000	Topi dengan desain simpel yang cocok untuk berbagai gaya. Terdapat fitur UV protection dan teknologi DRY untuk kenyamanan yang tahan lama. UPF50+. Produk ini tidak dapat dikembalikan.	4.5	2	7	37
757	Topi Proteksi Sinar UV	299000	Topi yang terasa ringan, mudah dilipat, dan dibawa kemana saja. Cocok untuk berkegiatan di luar ruangan. UPF50+. Produk ini tidak dapat dikembalikan.	5	1	7	37
758	Topi 2WAY Stretch Proteksi Sinar UV	299000	Topi dari bahan two-way stretch sehingga terasa nyaman. Teknologi DRY membuat Anda merasa sejuk. UPF50+. Produk ini tidak dapat dikembalikan.	4.4	10	7	37
759	Topi Twill Proteksi Sinar UV	299000	Topi dengan desain klasik yang bisa dipakai ke mana saja. Dilengkapi dengan teknologi DRY dan UV Protection. UPF50+. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	7	37
760	Kaos Kaki Half Olahraga	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap sejuk. Bahan mesh sejuk di bagian insole. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	7	37
761	Kaos Kaki Pendek Olahraga Blok Warna	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap sejuk. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	5	1	7	37
762	Kaos Kaki Pendek Olahraga	79000	Kaos kaki Pria berperforma tinggi yang menjaga Anda tetap sejuk. Barbahan elastis sehingga terasa lebih nyaman. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	\N	\N	7	37
763	Kaos Kaki Pendek Olahraga Garis Berlapis	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap segar. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.77	13	7	37
764	Kaos Kaki Half Olahraga	79000	Kaos Kaki Pria berperforma tinggi yang elastis dan sejuk. Sepanjang betis yang ideal untuk olahraga atau kasual. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.82	11	7	37
765	Kaos Kaki Pendek Sports Garis	79000	Kaos kaki Pria berperforma tinggi untuk menjaga Anda agar tetap segar. Terdapat bahan mesh yang sejuk pada instep. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.	4.77	13	7	37
766	Kacamata Sports Rim Half	299000	Sunglass dengan lensa terbaru yang tahan terhadap kabut. Cocok untuk berolahraga. Produk ini tidak dapat dikembalikan.	5	3	7	37
767	Kacamata Sports Rim Half	299000	Sunglass dengan lensa terbaru yang tahan terhadap kabut. Cocok untuk berolahraga. Produk ini tidak dapat dikembalikan.	5	3	7	37
768	Rompi Ultra Light Down (Blok Warna)	699000	Warm premium down. Incredibly lightweight.	\N	\N	7	37
769	Jaket Ultra Light Down (Potongan 3D)	999000	Warm premium down. Incredibly lightweight.	\N	\N	7	37
770	Rompi Ultra Light Down	699000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	7	37
771	Jaket Ultra Light Down (Potongan 3D)	999000	Premium down plus technology equals warmth and incredible lightness. Convenient pocketable design.	\N	\N	7	37
772	Jaket Parka Hybrid Down (Potongan 3D)	1990000	Jaket hoodie Pria yang terasa lebih hangat dengan desain tudung yang diperbarui. Fungsional dan stylish.	5	1	7	37
774	Kaos Polo DRY-EX Lengan Pendek (Tipping)	399000	Kaos polo Pria dari bahan 'DRY-EX' yang cepat kering untuk kenyamanan setiap saat. Dengan bahan mesh yang sejuk.	\N	\N	7	37
775	Kaos Polo DRY-EX Lengan Pendek (Border)	399000	Kaos polo Pria dari bahan 'DRY-EX' yang cepat kering untuk kenyamanan setiap saat. Dengan bahan mesh yang sejuk.	\N	\N	7	37
776	HEATTECH Celana Lapis Hangat (Kargo)	699000	Warm 'HEATTECH' lining. With cargo-style side pockets.	\N	\N	7	37
777	Celana Sweat Dry Stretch	499000	A new take on sweats with a cool style that's not too casual. Exceptional functionality plus long-lasting comfort.	\N	\N	7	37
778	Celana Sweat Dry Stretch	499000	Celana training Pria dengan bahan katun pada bagian luar dan kesan premium. Kini terasa lebih elastis, cocok untuk pakaian olahraga.	\N	\N	7	37
779	HEATTECH Sarung Tangan Lapis Stretch	299000	Warm and cozy 'HEATTECH'. Touchscreen compatible.	\N	\N	7	37
\.


--
-- Data for Name: products_colors; Type: TABLE DATA; Schema: public; Owner: justin
--

COPY public.products_colors (product_id, color) FROM stdin;
1	WHITE
1	GRAY
1	DARK GRAY
1	BLACK
1	ORANGE
1	YELLOW
1	BLUE
1	NAVY
2	WHITE
2	GRAY
2	BLACK
2	PINK
2	DARK GREEN
2	BLUE
2	NAVY
3	WHITE
3	GRAY
3	BLACK
3	PINK
3	YELLOW
3	GREEN
3	BLUE
3	NAVY
4	WHITE
4	GRAY
4	BLACK
4	RED
4	ORANGE
4	NATURAL
4	BROWN
4	GREEN
4	OLIVE
4	BLUE
4	PURPLE
5	WHITE
5	BLACK
5	BEIGE
5	BROWN
5	BLUE
6	WHITE
6	LIGHT GRAY
6	GRAY
6	BLACK
6	PINK
6	ORANGE
6	BEIGE
6	GREEN
6	OLIVE
6	BLUE
6	PURPLE
7	WHITE
7	LIGHT GRAY
7	BLACK
7	BEIGE
7	NAVY
8	GRAY
8	BEIGE
8	NAVY
9	WINE
9	NAVY
10	PINK
10	BLUE
11	GRAY
11	NAVY
12	YELLOW
12	GREEN
12	NAVY
13	WHITE
13	GRAY
13	BLACK
13	ORANGE
13	CREAM
13	GREEN
13	BLUE
14	WHITE
14	DARK GRAY
14	BLACK
14	YELLOW
14	DARK GREEN
14	BLUE
15	GRAY
15	DARK GRAY
15	RED
15	BLUE
16	WHITE
16	BLACK
16	GREEN
16	BLUE
16	PURPLE
17	WHITE
17	DARK GRAY
17	LIGHT BLUE
18	WHITE
18	BLACK
18	NAVY
19	WHITE
19	BLACK
19	PURPLE
20	WHITE
20	GRAY
20	BLACK
20	PINK
20	RED
20	ORANGE
20	YELLOW
20	GREEN
20	BLUE
20	NAVY
20	PURPLE
21	WHITE
21	BLACK
22	WHITE
22	BLACK
22	GREEN
22	BLUE
22	PURPLE
23	GRAY
24	WHITE
24	LIGHT BLUE
24	NAVY
25	WHITE
25	GRAY
25	BLACK
25	PINK
26	WHITE
26	BLACK
27	WHITE
27	BLACK
28	WHITE
28	LIGHT BLUE
28	NAVY
29	GRAY
29	RED
29	BLUE
30	GRAY
30	BLACK
30	PINK
30	OLIVE
30	BLUE
30	NAVY
31	WHITE
31	GRAY
31	BLACK
31	ORANGE
31	NATURAL
31	GREEN
31	BLUE
32	OFF WHITE
32	BLACK
32	NATURAL
32	YELLOW
32	DARK GREEN
33	OFF WHITE
33	GRAY
33	BLACK
33	NATURAL
33	OLIVE
33	DARK GREEN
34	OFF WHITE
34	BLUE
35	WHITE
35	GRAY
35	BLACK
35	YELLOW
35	GREEN
35	PURPLE
36	WHITE
36	GRAY
36	BLACK
36	ORANGE
36	NATURAL
36	GREEN
36	BLUE
37	WHITE
37	BLACK
37	BROWN
37	DARK GREEN
37	NAVY
38	WHITE
38	GRAY
38	BLACK
38	RED
38	BROWN
38	OLIVE
38	NAVY
39	WHITE
39	BLACK
39	NAVY
40	WHITE
41	RED
42	BLACK
43	OLIVE
44	NAVY
45	YELLOW
46	BLUE
47	WHITE
48	YELLOW
49	WHITE
50	DARK GRAY
51	WHITE
52	NAVY
53	BLACK
54	BLACK
55	ORANGE
56	WHITE
57	WHITE
58	WHITE
59	PINK
60	WHITE
61	ORANGE
62	DARK GRAY
63	WHITE
64	BLACK
65	WHITE
66	NAVY
67	WHITE
68	DARK GRAY
69	WINE
70	BLUE
71	BLUE
72	BLACK
73	WHITE
74	WHITE
75	Other
76	PURPLE
77	WHITE
78	WHITE
79	BLACK
80	BLUE
81	ORANGE
82	WHITE
83	GREEN
84	YELLOW
85	BLACK
85	OLIVE
86	WHITE
86	ORANGE
87	BLACK
88	BLACK
89	WHITE
90	WHITE
91	OFF WHITE
92	DARK GRAY
93	YELLOW
94	NAVY
95	WHITE
96	BLUE
97	BLACK
98	BLACK
99	GREEN
100	WHITE
101	BLACK
102	PINK
103	PINK
104	BLACK
105	WHITE
106	PINK
107	WHITE
108	GREEN
109	WHITE
110	WHITE
111	BLACK
112	WHITE
113	BLACK
114	BLACK
115	WHITE
116	NAVY
117	BLACK
118	WHITE
119	WHITE
120	WHITE
121	NAVY
122	BEIGE
123	WHITE
124	WHITE
125	BLUE
126	GREEN
127	WHITE
128	BLACK
129	WHITE
130	WHITE
131	BLACK
132	WHITE
133	GREEN
134	WHITE
135	NATURAL
136	WHITE
137	WHITE
138	BLACK
139	WHITE
140	WHITE
141	WHITE
142	WHITE
143	WHITE
144	GRAY
145	WHITE
146	NAVY
147	GRAY
148	WHITE
149	GRAY
150	PURPLE
151	GRAY
152	LIGHT BLUE
153	WHITE
154	NATURAL
155	WHITE
156	WHITE
157	PINK
158	BLACK
159	OFF WHITE
160	BLUE
161	BLUE
162	NAVY
163	WHITE
163	BLUE
164	WHITE
164	LIGHT GREEN
164	BLUE
165	WHITE
166	BLACK
167	BLACK
168	BLACK
169	WHITE
170	WHITE
171	RED
172	BLUE
173	BLACK
174	WHITE
175	WHITE
176	NATURAL
177	WHITE
178	WHITE
179	WHITE
180	WINE
180	NATURAL
180	NAVY
181	YELLOW
181	GREEN
182	WHITE
182	PINK
182	NAVY
183	WHITE
183	YELLOW
183	NAVY
184	WHITE
184	GREEN
184	NAVY
185	WHITE
185	GRAY
185	BLACK
185	PINK
185	RED
185	ORANGE
185	YELLOW
185	GREEN
185	BLUE
185	NAVY
185	PURPLE
186	WHITE
186	BLACK
187	WHITE
187	GRAY
187	BLACK
187	PINK
188	WHITE
188	BLACK
188	GREEN
188	BLUE
188	PURPLE
189	GRAY
190	WHITE
190	LIGHT BLUE
190	NAVY
191	WHITE
191	BLACK
192	WHITE
192	BLACK
193	WHITE
193	LIGHT BLUE
193	NAVY
194	GRAY
194	RED
194	BLUE
195	WHITE
195	BLACK
196	WHITE
196	BLACK
196	GREEN
196	BLUE
196	NAVY
197	WHITE
197	NAVY
198	WHITE
198	GRAY
198	BLACK
198	DARK GREEN
199	GREEN
199	PURPLE
200	DARK GRAY
200	BLUE
201	RED
201	BLUE
202	OFF WHITE
202	GRAY
202	BLACK
202	YELLOW
202	DARK GREEN
202	NAVY
203	OFF WHITE
203	BLACK
203	NAVY
204	OFF WHITE
204	LIGHT GRAY
204	DARK GRAY
204	BLACK
204	GREEN
204	BLUE
205	ORANGE
205	GREEN
205	BLUE
206	LIGHT GRAY
206	GRAY
206	BLACK
206	ORANGE
206	BLUE
207	DARK GRAY
207	WINE
208	OFF WHITE
208	GRAY
208	BLACK
208	PINK
208	NATURAL
208	YELLOW
208	GREEN
208	BLUE
208	NAVY
208	PURPLE
209	OFF WHITE
209	GRAY
209	BLACK
209	RED
209	YELLOW
209	PURPLE
210	DARK GRAY
211	LIGHT GRAY
211	BLACK
211	WINE
211	BLUE
212	BLUE
213	OFF WHITE
213	BLACK
213	YELLOW
213	DARK GREEN
213	BLUE
214	LIGHT GRAY
214	GRAY
214	BLACK
215	LIGHT GRAY
215	GRAY
215	NAVY
216	WHITE
216	GRAY
216	DARK GRAY
216	BLACK
217	OFF WHITE
217	GRAY
217	BLACK
217	DARK GREEN
217	BLUE
217	NAVY
218	LIGHT GRAY
218	BLUE
219	PINK
219	BEIGE
219	DARK GREEN
220	LIGHT GRAY
220	DARK GRAY
220	BLACK
220	BLUE
221	WHITE
221	NATURAL
221	BROWN
221	OLIVE
221	BLUE
222	WHITE
222	BLACK
222	DARK ORANGE
222	BROWN
222	OLIVE
222	BLUE
223	WHITE
223	BLACK
223	BEIGE
223	BROWN
223	OLIVE
223	BLUE
224	OLIVE
224	NAVY
225	OFF WHITE
226	GREEN
226	BLUE
227	BLACK
227	BEIGE
228	BLACK
229	RED
230	WHITE
231	OFF WHITE
231	GRAY
231	PINK
231	BLUE
232	OFF WHITE
232	GRAY
232	PINK
233	GRAY
233	OLIVE
233	BLUE
234	WHITE
234	WINE
234	NAVY
235	RED
235	BLUE
236	YELLOW
236	BLUE
237	GREEN
237	BLUE
238	WHITE
238	WINE
238	NAVY
239	WHITE
239	GRAY
239	WINE
239	NAVY
240	WHITE
240	GRAY
240	MUSTARD
240	OLIVE
240	BLUE
240	NAVY
241	WHITE
241	NAVY
242	NAVY
243	GREEN
244	YELLOW
244	BLUE
245	BLUE
245	PURPLE
246	ORANGE
246	GREEN
247	BLUE
247	NAVY
248	BLACK
249	BROWN
250	GREEN
251	BEIGE
252	WHITE
252	ORANGE
252	BEIGE
252	OLIVE
252	NAVY
253	ORANGE
253	BEIGE
253	DARK GREEN
254	OFF WHITE
254	WINE
254	BEIGE
254	OLIVE
254	NAVY
255	GRAY
256	OFF WHITE
256	GRAY
256	PINK
256	BLUE
256	NAVY
257	OFF WHITE
257	GRAY
257	BLUE
258	GRAY
258	RED
259	GREEN
259	BLUE
260	RED
260	NAVY
261	GRAY
261	OLIVE
262	OFF WHITE
262	GRAY
262	BROWN
262	BLUE
262	NAVY
263	NATURAL
263	OLIVE
264	WINE
265	BEIGE
265	BLUE
266	PINK
266	BLUE
267	YELLOW
267	GREEN
268	NATURAL
268	BLUE
269	OLIVE
270	WINE
271	YELLOW
271	BLUE
272	GRAY
272	BEIGE
273	BLUE
274	GREEN
275	YELLOW
276	OFF WHITE
276	RED
276	GREEN
276	BLUE
277	BROWN
278	BLUE
279	BROWN
279	OLIVE
279	NAVY
280	OFF WHITE
280	BROWN
280	OLIVE
280	BLUE
280	NAVY
281	BLUE
282	WINE
283	ORANGE
283	BROWN
284	GREEN
284	BLUE
285	YELLOW
285	BLUE
286	WINE
286	BLUE
287	WHITE
287	BLUE
288	BLUE
288	PURPLE
289	GREEN
289	BLUE
290	WHITE
290	GRAY
290	BLUE
290	NAVY
290	LIGHT PURPLE
291	BEIGE
292	BLUE
293	GRAY
294	BLACK
294	BEIGE
294	OLIVE
295	RED
295	BLUE
296	WHITE
296	OLIVE
296	NAVY
297	WHITE
297	GRAY
297	BLACK
297	RED
297	BEIGE
297	YELLOW
297	OLIVE
297	BLUE
298	DARK GREEN
299	NAVY
300	GRAY
301	GRAY
301	BLACK
301	BROWN
302	DARK GRAY
303	WINE
303	DARK GREEN
304	GRAY
304	BLUE
305	OFF WHITE
305	GRAY
306	BLUE
307	DARK BROWN
307	BLUE
308	YELLOW
309	BLACK
309	RED
309	ORANGE
309	BLUE
310	GRAY
310	YELLOW
311	OFF WHITE
311	NAVY
312	BROWN
312	GREEN
313	BROWN
313	DARK GREEN
314	BLUE
315	BLUE
316	WHITE
317	BLUE
318	BLUE
319	WHITE
319	BLACK
319	BLUE
320	WHITE
320	BLACK
320	LIGHT BLUE
321	WHITE
321	BLUE
322	OFF WHITE
322	GRAY
322	PINK
323	OFF WHITE
323	GRAY
323	BLUE
324	WHITE
324	BLUE
325	BLUE
326	OFF WHITE
326	BLACK
327	BEIGE
327	GREEN
327	NAVY
328	OFF WHITE
328	BLACK
328	YELLOW
328	DARK GREEN
328	BLUE
329	PINK
329	BEIGE
329	DARK GREEN
330	DARK GRAY
330	BLACK
330	ORANGE
330	BLUE
331	BLACK
331	BEIGE
331	BROWN
331	YELLOW
331	GREEN
331	OLIVE
331	BLUE
331	NAVY
332	GRAY
332	BLACK
332	ORANGE
332	NAVY
333	GRAY
333	BLACK
333	ORANGE
333	NAVY
334	BLACK
334	BROWN
334	OLIVE
335	BLACK
335	OLIVE
335	NAVY
336	OFF WHITE
336	LIGHT GRAY
336	DARK GRAY
336	BLACK
336	GREEN
336	BLUE
337	OFF WHITE
337	GRAY
337	BLACK
337	YELLOW
337	DARK GREEN
337	NAVY
338	OFF WHITE
338	BLACK
338	NAVY
339	ORANGE
339	GREEN
339	BLUE
340	LIGHT GRAY
340	GRAY
340	BLACK
340	ORANGE
340	BLUE
341	BLACK
341	BEIGE
341	BROWN
341	DARK GREEN
341	NAVY
342	BLACK
342	OLIVE
342	NAVY
343	BROWN
343	OLIVE
344	OLIVE
344	BLUE
345	BLACK
345	RED
345	GREEN
345	BLUE
346	BLACK
346	NATURAL
346	GREEN
346	NAVY
347	BEIGE
347	NAVY
348	LIGHT GRAY
348	GRAY
348	BLACK
348	RED
348	ORANGE
348	DARK GREEN
348	NAVY
349	OFF WHITE
349	BROWN
349	OLIVE
349	BLUE
349	NAVY
350	OFF WHITE
350	BLUE
351	BROWN
351	OLIVE
351	BLUE
352	DARK BROWN
353	NAVY
354	GRAY
355	DARK GRAY
355	BLACK
355	NAVY
356	DARK GRAY
356	BLACK
356	NAVY
357	BEIGE
357	NAVY
358	GRAY
358	BLACK
358	BROWN
358	OLIVE
359	BLACK
359	ORANGE
359	NATURAL
359	BROWN
359	OLIVE
359	NAVY
360	BLACK
360	BEIGE
360	OLIVE
361	BROWN
361	BLUE
362	BROWN
362	NAVY
363	OLIVE
363	BLUE
364	BLACK
364	NATURAL
364	GREEN
364	NAVY
365	DARK GRAY
365	BLACK
365	NAVY
366	BEIGE
366	NAVY
367	BLACK
367	BEIGE
367	OLIVE
368	BLACK
368	ORANGE
368	NATURAL
368	BROWN
368	OLIVE
368	NAVY
369	LIGHT GRAY
369	GRAY
369	BLACK
369	RED
369	ORANGE
369	DARK GREEN
369	NAVY
370	OLIVE
370	BLUE
371	BLACK
371	NATURAL
371	GREEN
371	NAVY
372	BROWN
372	OLIVE
373	BLACK
373	RED
373	GREEN
373	BLUE
374	DARK GRAY
374	BLACK
374	BROWN
374	OLIVE
375	BEIGE
375	OLIVE
375	NAVY
376	GRAY
376	BLUE
377	DARK GRAY
377	BROWN
377	DARK GREEN
378	OFF WHITE
378	ORANGE
378	BEIGE
378	GREEN
378	NAVY
379	OLIVE
380	DARK GRAY
380	BLACK
380	BEIGE
380	OLIVE
381	GRAY
381	BLACK
381	NAVY
382	LIGHT GRAY
382	GRAY
382	BLACK
383	LIGHT GRAY
383	BLACK
383	BEIGE
383	NAVY
384	LIGHT GRAY
384	GRAY
384	NAVY
385	OFF WHITE
385	GRAY
385	DARK GRAY
385	BLACK
385	OLIVE
386	WHITE
386	GRAY
386	DARK GRAY
386	BLACK
387	GRAY
387	DARK GRAY
387	BLACK
387	BLUE
388	OFF WHITE
388	GRAY
388	BLACK
388	DARK GREEN
388	BLUE
388	NAVY
389	DARK GRAY
389	BEIGE
389	OLIVE
389	NAVY
390	BLACK
390	BLUE
391	BLUE
392	BLACK
392	BEIGE
392	OLIVE
392	NAVY
393	DARK GRAY
393	NATURAL
393	BROWN
394	DARK GRAY
394	BEIGE
394	DARK GREEN
394	NAVY
395	GRAY
395	BLUE
396	BLUE
397	GRAY
397	BLUE
398	OFF WHITE
398	BLUE
399	BLACK
399	BLUE
400	BLACK
400	NAVY
401	BLUE
402	WHITE
402	GRAY
402	BLACK
402	BEIGE
402	BROWN
402	GREEN
402	OLIVE
402	BLUE
403	GRAY
403	BLACK
403	BLUE
404	BLUE
405	BLACK
406	BLACK
406	BLUE
407	GRAY
407	BLACK
407	BLUE
408	OFF WHITE
408	BLACK
408	BLUE
409	BLUE
410	BLACK
411	BLUE
412	OFF WHITE
412	BLACK
412	DARK ORANGE
412	BEIGE
412	BROWN
412	YELLOW
412	GREEN
412	BLUE
412	NAVY
413	WINE
414	BLACK
414	NATURAL
414	BEIGE
414	OLIVE
414	NAVY
415	BLACK
415	NATURAL
415	BEIGE
415	MUSTARD
415	OLIVE
415	BLUE
416	BLUE
417	BLACK
417	BEIGE
417	OLIVE
417	BLUE
418	BROWN
418	OLIVE
418	NAVY
419	KHAKI
419	BROWN
419	NAVY
420	GRAY
420	BLACK
421	BLACK
422	GRAY
422	DARK GRAY
422	BLACK
422	NAVY
423	BEIGE
423	OLIVE
423	NAVY
424	BLACK
424	BEIGE
424	OLIVE
424	BLUE
425	LIGHT GRAY
425	GRAY
425	BLACK
426	LIGHT GRAY
426	GRAY
426	NAVY
427	OFF WHITE
427	GRAY
427	BLACK
427	DARK GREEN
427	BLUE
427	NAVY
428	WHITE
428	GRAY
428	DARK GRAY
428	BLACK
429	GRAY
429	DARK GRAY
429	BLACK
429	BLUE
430	OFF WHITE
430	GRAY
430	DARK GRAY
430	BLACK
430	OLIVE
431	DARK GRAY
431	BLACK
431	BEIGE
431	OLIVE
432	LIGHT GRAY
432	DARK GRAY
432	BLACK
432	BLUE
433	GRAY
434	DARK BROWN
435	OFF WHITE
435	BEIGE
435	OLIVE
435	NAVY
436	GRAY
436	BLACK
436	NAVY
437	GRAY
437	NAVY
438	KHAKI
438	BROWN
438	NAVY
439	GRAY
439	BLACK
440	BLACK
441	GRAY
441	DARK GRAY
441	BLACK
441	NAVY
442	BEIGE
442	OLIVE
442	NAVY
443	GRAY
443	BLACK
443	NAVY
444	DARK GRAY
444	BLACK
444	BROWN
444	OLIVE
445	OLIVE
446	GRAY
446	BLUE
447	DARK GRAY
447	BROWN
447	DARK GREEN
448	OFF WHITE
448	ORANGE
448	BEIGE
448	GREEN
448	NAVY
449	BEIGE
449	OLIVE
449	NAVY
450	NAVY
451	BLACK
451	BEIGE
451	OLIVE
451	BLUE
452	DARK GRAY
452	BEIGE
452	OLIVE
452	NAVY
453	BLACK
453	BLUE
454	BLUE
455	GRAY
455	BLACK
455	NAVY
456	OFF WHITE
456	BLACK
456	DARK ORANGE
456	BEIGE
456	BROWN
456	YELLOW
456	GREEN
456	BLUE
456	NAVY
457	OFF WHITE
457	DARK GRAY
457	KHAKI
457	OLIVE
457	NAVY
458	BEIGE
458	NAVY
459	DARK GRAY
459	WINE
459	OLIVE
460	WHITE
460	GRAY
460	BEIGE
460	NAVY
461	DARK GRAY
461	DARK ORANGE
462	BLACK
462	BEIGE
462	YELLOW
462	OLIVE
462	BLUE
462	PURPLE
463	DARK GRAY
463	BLUE
464	OFF WHITE
464	DARK GRAY
464	BLACK
464	OLIVE
464	BLUE
465	DARK GRAY
465	BLACK
465	DARK ORANGE
465	BEIGE
465	OLIVE
465	NAVY
466	BLUE
466	NAVY
467	BLUE
468	DARK GRAY
468	WINE
468	BROWN
468	DARK GREEN
468	BLUE
468	NAVY
469	WINE
469	BROWN
469	YELLOW
469	OLIVE
469	DARK GREEN
469	NAVY
470	DARK GRAY
471	BEIGE
471	NAVY
472	BLACK
472	BEIGE
472	NAVY
473	GRAY
473	WINE
473	BEIGE
473	BROWN
473	NAVY
474	GREEN
474	BLUE
475	PINK
475	KHAKI
475	GREEN
475	BLUE
476	GRAY
476	NAVY
477	WHITE
477	GRAY
477	BLACK
477	GREEN
477	BLUE
477	NAVY
478	WHITE
478	BLACK
478	NAVY
479	WHITE
479	BLACK
479	GREEN
479	NAVY
480	WHITE
480	BLACK
480	NAVY
481	WHITE
481	BLACK
482	WHITE
482	BLACK
483	BLACK
483	RED
484	BLACK
484	BLUE
485	BLACK
485	BLUE
486	GRAY
486	BLUE
487	BLACK
487	GREEN
487	NAVY
488	GRAY
488	BLACK
488	NAVY
489	GRAY
490	BLACK
490	NAVY
491	BLACK
491	NAVY
492	GRAY
493	BLACK
493	NAVY
494	BLACK
494	NAVY
495	BLACK
495	GREEN
496	LIGHT GRAY
497	GRAY
497	BLACK
497	NAVY
498	GRAY
498	BLUE
499	BLACK
499	RED
500	OFF WHITE
500	DARK GRAY
500	BLACK
501	GRAY
501	DARK GRAY
501	BLACK
502	OFF WHITE
502	BLACK
503	GRAY
503	DARK BROWN
504	OFF WHITE
504	BLACK
504	DARK GREEN
504	NAVY
505	DARK GRAY
506	BLACK
507	DARK GRAY
507	BLACK
508	GRAY
508	DARK GRAY
509	OFF WHITE
509	DARK GRAY
509	BLACK
509	DARK BROWN
509	DARK GREEN
510	DARK GRAY
510	BLACK
511	GRAY
511	DARK GRAY
512	YELLOW
512	OLIVE
512	BLUE
513	DARK GRAY
514	GRAY
514	DARK GREEN
514	NAVY
515	WHITE
515	DARK GRAY
515	BLACK
516	OFF WHITE
516	DARK GRAY
516	WINE
516	BLUE
517	LIGHT GRAY
517	BLACK
517	DARK BROWN
517	BLUE
518	GRAY
518	BLACK
518	BROWN
518	BLUE
519	OFF WHITE
519	GRAY
519	DARK GRAY
519	BLACK
519	WINE
519	BROWN
519	BLUE
520	OFF WHITE
520	GRAY
520	DARK GRAY
520	BLACK
520	WINE
520	BROWN
520	GREEN
520	BLUE
521	WHITE
521	GRAY
521	DARK GRAY
521	BLACK
521	ORANGE
521	YELLOW
521	BLUE
521	NAVY
522	WHITE
522	GRAY
522	BLACK
522	PINK
522	DARK GREEN
522	BLUE
522	NAVY
523	WHITE
523	GRAY
523	BLACK
523	GREEN
523	BLUE
523	NAVY
524	WHITE
524	BLACK
524	NAVY
525	WHITE
525	BLACK
525	NAVY
526	WHITE
526	BLACK
526	GREEN
526	NAVY
527	WHITE
527	BLACK
528	WHITE
528	BLACK
529	GRAY
529	DARK GRAY
530	OFF WHITE
530	BLACK
531	GRAY
531	DARK BROWN
532	OFF WHITE
532	DARK GRAY
532	BLACK
533	OFF WHITE
533	BLACK
533	DARK GREEN
533	NAVY
534	GRAY
534	DARK GREEN
534	NAVY
535	GRAY
535	DARK GRAY
536	OFF WHITE
536	DARK GRAY
536	BLACK
536	DARK BROWN
536	DARK GREEN
537	YELLOW
537	OLIVE
537	BLUE
538	DARK GRAY
539	DARK GRAY
539	RED
539	NAVY
540	OLIVE
540	NAVY
541	BLACK
541	NAVY
542	GRAY
542	WINE
543	WHITE
543	GRAY
543	BLACK
543	RED
543	NAVY
544	WHITE
545	WHITE
545	GRAY
545	BLACK
545	NAVY
546	DARK GRAY
546	NAVY
547	WINE
547	DARK GREEN
548	GRAY
548	BLACK
548	NAVY
549	GRAY
549	BLACK
549	NAVY
550	DARK GRAY
550	NAVY
551	WINE
551	DARK GREEN
552	WHITE
552	GRAY
552	BLACK
552	NAVY
553	BLACK
553	RED
554	BLACK
554	BLUE
555	BLACK
555	BLUE
556	GRAY
556	BLUE
557	BLACK
557	GREEN
557	NAVY
558	GRAY
558	BLACK
558	NAVY
559	GRAY
560	BLACK
560	NAVY
561	BLACK
561	NAVY
562	GRAY
563	GRAY
563	BLUE
564	OLIVE
565	DARK GRAY
565	BROWN
565	DARK GREEN
566	OFF WHITE
566	ORANGE
566	BEIGE
566	GREEN
566	NAVY
567	DARK GRAY
567	BLACK
567	BEIGE
567	OLIVE
568	DARK GRAY
568	BLACK
568	DARK ORANGE
568	BEIGE
568	OLIVE
568	NAVY
569	BLUE
569	NAVY
570	BLUE
571	DARK GRAY
571	WINE
571	BROWN
571	DARK GREEN
571	BLUE
571	NAVY
572	WINE
572	BROWN
572	YELLOW
572	OLIVE
572	DARK GREEN
572	NAVY
573	DARK GRAY
573	BEIGE
573	OLIVE
573	NAVY
574	BLACK
574	BLUE
575	BLUE
576	GREEN
576	NAVY
577	GREEN
577	BLUE
578	GRAY
578	NAVY
579	PINK
579	KHAKI
579	GREEN
579	BLUE
580	DARK GRAY
580	OLIVE
580	NAVY
581	BLUE
582	DARK GRAY
582	BEIGE
582	DARK GREEN
582	NAVY
583	BROWN
584	GRAY
585	DARK GRAY
586	RED
587	DARK BROWN
588	DARK GREEN
589	GRAY
589	BLACK
590	BLUE
591	GRAY
591	PINK
591	BLUE
592	GRAY
592	PINK
592	YELLOW
592	GREEN
592	NAVY
593	LIGHT BLUE
593	BLUE
594	ORANGE
594	NATURAL
594	LIGHT BLUE
594	NAVY
595	DARK GRAY
595	BEIGE
595	DARK GREEN
596	BLACK
597	BLACK
597	BEIGE
598	BEIGE
598	NAVY
599	BLACK
600	OLIVE
600	NAVY
601	BEIGE
601	NAVY
602	OFF WHITE
602	BLACK
603	OFF WHITE
603	BLACK
603	RED
603	NATURAL
603	BEIGE
603	YELLOW
603	OLIVE
603	PURPLE
604	BLACK
604	BEIGE
604	BROWN
604	OLIVE
604	PURPLE
605	BLACK
605	OLIVE
606	OFF WHITE
607	OFF WHITE
608	BLACK
608	NATURAL
608	BEIGE
608	GREEN
608	BLUE
608	NAVY
609	BLACK
609	BROWN
610	BLACK
610	DARK BROWN
611	BLACK
611	BROWN
611	DARK BROWN
612	BLACK
612	BROWN
612	DARK BROWN
613	BLACK
613	BROWN
614	BLACK
614	DARK BROWN
615	BLACK
615	BROWN
615	DARK BROWN
616	BLACK
616	BROWN
616	DARK BROWN
616	LIGHT BLUE
616	LIGHT PURPLE
617	BLACK
617	NATURAL
617	OLIVE
617	NAVY
618	GRAY
618	BLACK
619	BLACK
619	BROWN
619	80
619	81
620	BLACK
620	BROWN
621	81
621	82
622	80
622	81
622	82
623	BLACK
623	BROWN
624	BLACK
624	BROWN
625	WHITE
625	WINE
626	BEIGE
626	NAVY
627	BLACK
628	BEIGE
628	NAVY
629	GRAY
629	BLACK
630	BLACK
630	BROWN
630	OLIVE
631	OFF WHITE
631	BLACK
632	GRAY
632	BLACK
633	BLACK
633	BROWN
634	BLACK
634	OLIVE
635	WHITE
635	GRAY
635	DARK GRAY
635	BLACK
635	ORANGE
635	YELLOW
635	BLUE
635	NAVY
636	DARK GRAY
637	LIGHT GRAY
637	BLACK
637	WINE
637	BLUE
638	OFF WHITE
638	LIGHT GRAY
638	DARK GRAY
638	BLACK
638	GREEN
638	BLUE
639	OFF WHITE
639	GRAY
639	BLACK
639	YELLOW
639	DARK GREEN
639	NAVY
640	LIGHT GRAY
640	GRAY
640	BLACK
640	ORANGE
640	BLUE
641	OFF WHITE
641	GRAY
641	BLACK
641	RED
641	YELLOW
641	PURPLE
642	OFF WHITE
642	GRAY
642	BLACK
642	PINK
642	NATURAL
642	YELLOW
642	GREEN
642	BLUE
642	NAVY
642	PURPLE
643	BLACK
643	BEIGE
643	BROWN
643	YELLOW
643	GREEN
643	OLIVE
643	BLUE
643	NAVY
644	BLACK
644	OLIVE
644	NAVY
645	GRAY
645	BLACK
645	ORANGE
645	NAVY
646	LIGHT GRAY
646	GRAY
646	BLACK
646	RED
646	ORANGE
646	DARK GREEN
646	NAVY
647	GRAY
647	BLACK
647	ORANGE
647	NAVY
648	BLACK
648	BEIGE
648	BROWN
648	DARK GREEN
648	NAVY
649	WHITE
649	DARK GRAY
649	BLACK
649	YELLOW
649	DARK GREEN
649	BLUE
650	WHITE
650	BLACK
650	PURPLE
651	GRAY
651	DARK GRAY
651	RED
651	BLUE
652	WHITE
652	BLACK
652	GREEN
652	BLUE
652	PURPLE
653	WHITE
653	BLACK
653	NAVY
654	GRAY
654	RED
654	BLUE
655	WHITE
655	BLACK
656	WHITE
656	BLACK
656	GREEN
656	BLUE
656	NAVY
657	KHAKI
657	BROWN
657	NAVY
658	LIGHT GRAY
658	GRAY
658	BLACK
659	LIGHT GRAY
659	BLACK
659	BEIGE
659	NAVY
660	LIGHT GRAY
660	GRAY
660	NAVY
661	OFF WHITE
661	GRAY
661	DARK GRAY
661	BLACK
661	OLIVE
662	WHITE
662	GRAY
662	DARK GRAY
662	BLACK
663	OFF WHITE
663	GRAY
663	BLACK
663	DARK GREEN
663	BLUE
663	NAVY
664	DARK GRAY
664	BLUE
665	BEIGE
665	NAVY
666	DARK GRAY
666	WINE
666	OLIVE
667	DARK GRAY
667	DARK ORANGE
668	OFF WHITE
668	DARK GRAY
668	BLACK
668	OLIVE
668	BLUE
669	WHITE
669	GRAY
669	BEIGE
669	NAVY
670	BLACK
670	BEIGE
670	YELLOW
670	OLIVE
670	BLUE
670	PURPLE
671	WHITE
671	BLACK
671	NAVY
672	WHITE
672	BLACK
673	WHITE
673	BLACK
673	NAVY
674	BLACK
675	OLIVE
675	NAVY
676	BLACK
677	BLACK
677	BEIGE
678	WHITE
678	BLACK
678	YELLOW
678	OLIVE
679	WHITE
679	BLACK
679	ORANGE
679	OLIVE
680	GRAY
680	DARK GRAY
680	RED
680	PURPLE
681	RED
681	BLUE
682	WHITE
682	GRAY
682	DARK GRAY
682	PURPLE
683	OFF WHITE
683	BLACK
683	GREEN
683	BLUE
683	PURPLE
684	WHITE
684	WINE
685	BROWN
685	OLIVE
686	OLIVE
686	BLUE
687	BLACK
687	RED
687	GREEN
687	BLUE
688	BLACK
688	NATURAL
688	GREEN
688	NAVY
689	WHITE
689	GRAY
689	BLACK
689	ORANGE
689	NATURAL
689	GREEN
689	BLUE
690	DARK GRAY
690	BLUE
691	RED
691	BLUE
692	BLACK
692	BEIGE
692	OLIVE
692	NAVY
693	WHITE
693	GRAY
693	DARK GRAY
693	BLACK
694	LIGHT GRAY
694	DARK GRAY
694	BLACK
694	BLUE
695	GRAY
695	BLACK
\.


--
-- Data for Name: products_sizes; Type: TABLE DATA; Schema: public; Owner: justin
--

COPY public.products_sizes (product_id, size) FROM stdin;
1	XS
1	S
1	M
1	L
1	XL
1	XXL
2	XS
2	S
2	M
2	L
2	XL
2	XXL
3	XS
3	S
3	M
3	L
3	XL
3	XXL
4	XS
4	S
4	M
4	L
4	XL
4	XXL
5	XS
5	S
5	M
5	L
5	XL
5	XXL
6	XS
6	S
6	M
6	L
6	XL
6	XXL
6	3XL
7	XS
7	S
7	M
7	L
7	XL
7	XXL
8	XS
8	S
8	M
8	L
8	XL
8	XXL
8	3XL
9	XS
9	S
9	M
9	L
9	XL
9	XXL
9	3XL
10	XS
10	S
10	M
10	L
10	XL
10	XXL
10	3XL
11	XS
11	S
11	M
11	L
11	XL
11	XXL
12	XS
12	S
12	M
12	L
12	XL
12	XXL
13	XS
13	S
13	M
13	L
13	XL
13	XXL
14	XS
14	S
14	M
14	L
14	XL
14	XXL
14	3XL
15	XS
15	S
15	M
15	L
15	XL
15	XXL
16	XS
16	S
16	M
16	L
16	XL
16	XXL
17	XS
17	S
17	M
17	L
17	XL
17	XXL
17	3XL
18	XS
18	S
18	M
18	L
18	XL
18	XXL
19	S
19	M
19	L
19	XL
20	XS
20	S
20	M
20	L
20	XL
20	XXL
21	XS
21	S
21	M
21	L
21	XL
21	XXL
22	XS
22	S
22	M
22	L
22	XL
22	XXL
23	XS
23	S
23	M
23	L
23	XL
23	XXL
24	XS
24	S
24	M
24	L
24	XL
24	XXL
25	XS
25	S
25	M
25	L
25	XL
25	XXL
26	XS
26	S
26	M
26	L
26	XL
26	XXL
27	XS
27	S
27	M
27	L
27	XL
27	XXL
28	XS
28	S
28	M
28	L
28	XL
28	XXL
29	XS
29	S
29	M
29	L
29	XL
29	XXL
30	XS
30	S
30	M
30	L
30	XL
30	XXL
31	XS
31	S
31	M
31	L
31	XL
31	XXL
31	3XL
32	XS
32	S
32	M
32	L
32	XL
32	XXL
32	3XL
33	XS
33	S
33	M
33	L
33	XL
33	XXL
34	XS
34	S
34	M
34	L
34	XL
34	XXL
34	3XL
35	XS
35	S
35	M
35	L
35	XL
35	XXL
35	3XL
36	S
36	M
36	L
36	XL
37	XS
37	S
37	M
37	L
37	XL
37	XXL
38	XS
38	S
38	M
38	L
38	XL
38	XXL
39	XS
39	S
39	M
39	L
39	XL
39	XXL
40	XS
40	S
40	M
40	L
40	XL
40	XXL
40	3XL
41	XS
41	S
41	M
41	L
41	XL
41	XXL
41	3XL
42	XS
42	S
42	M
42	L
42	XL
42	XXL
42	3XL
43	XS
43	S
43	M
43	L
43	XL
43	XXL
43	3XL
44	XS
44	S
44	M
44	L
44	XL
44	XXL
44	3XL
45	XS
45	S
45	M
45	L
45	XL
45	XXL
45	3XL
46	XS
46	S
46	M
46	L
46	XL
46	XXL
46	3XL
47	XS
47	S
47	M
47	L
47	XL
47	XXL
47	3XL
48	XS
48	S
48	M
48	L
48	XL
48	XXL
48	3XL
49	XS
49	S
49	M
49	L
49	XL
49	XXL
49	3XL
50	XS
50	S
50	M
50	L
50	XL
50	XXL
50	3XL
51	XS
51	S
51	M
51	L
51	XL
51	XXL
51	3XL
52	XS
52	S
52	M
52	L
52	XL
52	XXL
52	3XL
53	XS
53	S
53	M
53	L
53	XL
53	XXL
53	3XL
54	XS
54	S
54	M
54	L
54	XL
54	XXL
54	3XL
55	XS
55	S
55	M
55	L
55	XL
55	XXL
55	3XL
56	XS
56	S
56	M
56	L
56	XL
56	XXL
56	3XL
57	XS
57	S
57	M
57	L
57	XL
57	XXL
57	3XL
58	XS
58	S
58	M
58	L
58	XL
58	XXL
58	3XL
59	XS
59	S
59	M
59	L
59	XL
59	XXL
59	3XL
60	XS
60	S
60	M
60	L
60	XL
60	XXL
60	3XL
61	XS
61	S
61	M
61	L
61	XL
61	XXL
61	3XL
62	XS
62	S
62	M
62	L
62	XL
62	XXL
62	3XL
63	XS
63	S
63	M
63	L
63	XL
63	XXL
63	3XL
64	XS
64	S
64	M
64	L
64	XL
64	XXL
65	XS
65	S
65	M
65	L
65	XL
65	XXL
66	XS
66	S
66	M
66	L
66	XL
66	XXL
67	XS
67	S
67	M
67	L
67	XL
67	XXL
68	XS
68	S
68	M
68	L
68	XL
68	XXL
69	XS
69	S
69	M
69	L
69	XL
69	XXL
70	XS
70	S
70	M
70	L
70	XL
70	XXL
71	XS
71	S
71	M
71	L
71	XL
71	XXL
72	XS
72	S
72	M
72	L
72	XL
72	XXL
73	XS
73	S
73	M
73	L
73	XL
73	XXL
74	XS
74	S
74	M
74	L
74	XL
74	XXL
74	3XL
75	XS
75	S
75	M
75	L
75	XL
75	XXL
75	3XL
76	XS
76	S
76	M
76	L
76	XL
76	XXL
76	3XL
77	XS
77	S
77	M
77	L
77	XL
77	XXL
78	XS
78	S
78	M
78	L
78	XL
78	XXL
79	XS
79	S
79	M
79	L
79	XL
79	XXL
80	XS
80	S
80	M
80	L
80	XL
80	XXL
81	XS
81	S
81	M
81	L
81	XL
81	XXL
82	XS
82	S
82	M
82	L
82	XL
82	XXL
83	XS
83	S
83	M
83	L
83	XL
83	XXL
84	S
84	M
84	L
84	XL
85	XS
85	S
85	M
85	L
85	XL
85	XXL
86	XS
86	S
86	M
86	L
86	XL
86	XXL
87	XS
87	S
87	M
87	L
87	XL
87	XXL
88	XS
88	S
88	M
88	L
88	XL
88	XXL
89	XS
89	S
89	M
89	L
89	XL
89	XXL
90	XS
90	S
90	M
90	L
90	XL
90	XXL
91	XS
91	S
91	M
91	L
91	XL
91	XXL
92	S
92	M
92	L
92	XL
93	S
93	M
93	L
93	XL
94	XS
94	S
94	M
94	L
94	XL
94	XXL
95	XS
95	S
95	M
95	L
95	XL
95	XXL
96	XS
96	S
96	M
96	L
96	XL
96	XXL
97	XS
97	S
97	M
97	L
97	XL
97	XXL
98	XS
98	S
98	M
98	L
98	XL
98	XXL
99	XS
99	S
99	M
99	L
99	XL
99	XXL
100	XS
100	S
100	M
100	L
100	XL
100	XXL
101	XS
101	S
101	M
101	L
101	XL
101	XXL
102	XS
102	S
102	M
102	L
102	XL
102	XXL
103	XS
103	S
103	M
103	L
103	XL
103	XXL
104	XS
104	S
104	M
104	L
104	XL
104	XXL
105	XS
105	S
105	M
105	L
105	XL
105	XXL
106	XS
106	S
106	M
106	L
106	XL
106	XXL
107	XS
107	S
107	M
107	L
107	XL
107	XXL
108	XS
108	S
108	M
108	L
108	XL
108	XXL
109	XS
109	S
109	M
109	L
109	XL
109	XXL
109	3XL
110	XS
110	S
110	M
110	L
110	XL
110	XXL
110	3XL
111	XS
111	S
111	M
111	L
111	XL
111	XXL
112	XS
112	S
112	M
112	L
112	XL
112	XXL
113	XS
113	S
113	M
113	L
113	XL
113	XXL
114	XS
114	S
114	M
114	L
114	XL
114	XXL
115	XS
115	S
115	M
115	L
115	XL
115	XXL
116	XS
116	S
116	M
116	L
116	XL
116	XXL
116	3XL
117	XS
117	S
117	M
117	L
117	XL
117	XXL
117	3XL
118	XS
118	S
118	M
118	L
118	XL
118	XXL
118	3XL
119	XS
119	S
119	M
119	L
119	XL
119	XXL
120	XS
120	S
120	M
120	L
120	XL
120	XXL
120	3XL
121	XS
121	S
121	M
121	L
121	XL
121	XXL
121	3XL
122	XS
122	S
122	M
122	L
122	XL
122	XXL
122	3XL
123	XS
123	S
123	M
123	L
123	XL
123	XXL
123	3XL
124	XS
124	S
124	M
124	L
124	XL
124	XXL
124	3XL
125	XS
125	S
125	M
125	L
125	XL
125	XXL
125	3XL
126	XS
126	S
126	M
126	L
126	XL
126	XXL
126	3XL
127	XS
127	S
127	M
127	L
127	XL
127	XXL
127	3XL
128	XS
128	S
128	M
128	L
128	XL
128	XXL
128	3XL
129	XS
129	S
129	M
129	L
129	XL
129	XXL
129	3XL
130	XS
130	S
130	M
130	L
130	XL
130	XXL
130	3XL
131	XS
131	S
131	M
131	L
131	XL
131	XXL
132	XS
132	S
132	M
132	L
132	XL
132	XXL
133	XS
133	S
133	M
133	L
133	XL
133	XXL
134	XS
134	S
134	M
134	L
134	XL
134	XXL
135	XS
135	S
135	M
135	L
135	XL
135	XXL
136	XS
136	S
136	M
136	L
136	XL
136	XXL
137	XS
137	S
137	M
137	L
137	XL
137	XXL
138	XS
138	S
138	M
138	L
138	XL
138	XXL
139	XS
139	S
139	M
139	L
139	XL
139	XXL
140	XS
140	S
140	M
140	L
140	XL
140	XXL
141	XS
141	S
141	M
141	L
141	XL
141	XXL
142	XS
142	S
142	M
142	L
142	XL
142	XXL
143	XS
143	S
143	M
143	L
143	XL
143	XXL
144	XS
144	S
144	M
144	L
144	XL
144	XXL
145	XS
145	S
145	M
145	L
145	XL
145	XXL
146	XS
146	S
146	M
146	L
146	XL
146	XXL
147	XS
147	S
147	M
147	L
147	XL
147	XXL
148	XS
148	S
148	M
148	L
148	XL
148	XXL
149	XS
149	S
149	M
149	L
149	XL
149	XXL
150	XS
150	S
150	M
150	L
150	XL
150	XXL
151	XS
151	S
151	M
151	L
151	XL
151	XXL
152	XS
152	S
152	M
152	L
152	XL
152	XXL
153	XS
153	S
153	M
153	L
153	XL
153	XXL
153	3XL
154	XS
154	S
154	M
154	L
154	XL
154	XXL
155	XS
155	S
155	M
155	L
155	XL
155	XXL
156	XS
156	S
156	M
156	L
156	XL
156	XXL
156	3XL
157	XS
157	S
157	M
157	L
157	XL
157	XXL
157	3XL
158	XS
158	S
158	M
158	L
158	XL
158	XXL
158	3XL
159	XS
159	S
159	M
159	L
159	XL
159	XXL
159	3XL
160	XS
160	S
160	M
160	L
160	XL
160	XXL
160	3XL
161	XS
161	S
161	M
161	L
161	XL
161	XXL
161	3XL
162	XS
162	S
162	M
162	L
162	XL
162	XXL
162	3XL
163	XS
163	S
163	M
163	L
163	XL
163	XXL
163	3XL
164	XS
164	S
164	M
164	L
164	XL
164	XXL
164	3XL
165	XS
165	S
165	M
165	L
165	XL
165	XXL
165	3XL
166	XS
166	S
166	M
166	L
166	XL
166	XXL
166	3XL
167	XS
167	S
167	M
167	L
167	XL
167	XXL
167	3XL
168	XS
168	S
168	M
168	L
168	XL
168	XXL
168	3XL
169	XS
169	S
169	M
169	L
169	XL
169	XXL
169	3XL
170	XS
170	S
170	M
170	L
170	XL
170	XXL
170	3XL
171	XS
171	S
171	M
171	L
171	XL
171	XXL
171	3XL
172	XS
172	S
172	M
172	L
172	XL
172	XXL
172	3XL
173	XS
173	S
173	M
173	L
173	XL
173	XXL
173	3XL
174	XS
174	S
174	M
174	L
174	XL
174	XXL
174	3XL
175	XS
175	S
175	M
175	L
175	XL
175	XXL
176	XS
176	S
176	M
176	L
176	XL
176	XXL
177	XS
177	S
177	M
177	L
177	XL
177	XXL
177	3XL
178	XS
178	S
178	M
178	L
178	XL
178	XXL
179	XS
179	S
179	M
179	L
179	XL
179	XXL
179	3XL
180	XS
180	S
180	M
180	L
180	XL
180	XXL
180	3XL
181	XS
181	S
181	M
181	L
181	XL
181	XXL
181	3XL
182	XS
182	S
182	M
182	L
182	XL
182	XXL
182	3XL
183	XS
183	S
183	M
183	L
183	XL
183	XXL
184	XS
184	S
184	M
184	L
184	XL
184	XXL
185	XS
185	S
185	M
185	L
185	XL
185	XXL
186	XS
186	S
186	M
186	L
186	XL
186	XXL
187	XS
187	S
187	M
187	L
187	XL
187	XXL
188	XS
188	S
188	M
188	L
188	XL
188	XXL
189	XS
189	S
189	M
189	L
189	XL
189	XXL
190	XS
190	S
190	M
190	L
190	XL
190	XXL
191	XS
191	S
191	M
191	L
191	XL
191	XXL
192	XS
192	S
192	M
192	L
192	XL
192	XXL
193	XS
193	S
193	M
193	L
193	XL
193	XXL
194	XS
194	S
194	M
194	L
194	XL
194	XXL
195	XS
195	S
195	M
195	L
195	XL
195	XXL
196	XS
196	S
196	M
196	L
196	XL
196	XXL
197	XS
197	S
197	M
197	L
197	XL
197	XXL
198	XS
198	S
198	M
198	L
198	XL
199	XS
199	S
199	M
199	L
199	XL
199	XXL
199	3XL
200	XS
200	S
200	M
200	L
200	XL
200	XXL
200	3XL
201	XS
201	S
201	M
201	L
201	XL
201	XXL
201	3XL
202	XS
202	S
202	M
202	L
202	XL
202	XXL
202	3XL
203	XS
203	S
203	M
203	L
203	XL
203	XXL
203	3XL
204	XS
204	S
204	M
204	L
204	XL
204	XXL
205	XS
205	S
205	M
205	L
205	XL
205	XXL
206	XS
206	S
206	M
206	L
206	XL
206	XXL
206	3XL
207	XS
207	S
207	M
207	L
207	XL
207	XXL
208	XS
208	S
208	M
208	L
208	XL
208	XXL
208	3XL
209	XS
209	S
209	M
209	L
209	XL
209	XXL
209	3XL
210	XS
210	S
210	M
210	L
210	XL
210	XXL
211	XS
211	S
211	M
211	L
211	XL
211	XXL
211	3XL
212	XS
212	S
212	M
212	L
212	XL
212	XXL
212	3XL
213	XS
213	S
213	M
213	L
213	XL
213	XXL
213	3XL
214	XS
214	S
214	M
214	L
214	XL
214	XXL
214	3XL
215	XS
215	S
215	M
215	L
215	XL
215	XXL
216	XS
216	S
216	M
216	L
216	XL
216	XXL
216	3XL
217	XS
217	S
217	M
217	L
217	XL
217	XXL
218	XS
218	S
218	M
218	L
218	XL
218	XXL
219	XS
219	S
219	M
219	L
219	XL
219	XXL
219	3XL
220	XS
220	S
220	M
220	L
220	XL
220	XXL
220	3XL
221	XS
221	S
221	M
221	L
221	XL
221	XXL
221	3XL
222	XS
222	S
222	M
222	L
222	XL
222	XXL
223	XS
223	S
223	M
223	L
223	XL
223	XXL
223	3XL
224	XS
224	S
224	M
224	L
224	XL
224	XXL
225	XS
225	S
225	M
225	L
225	XL
225	XXL
225	3XL
226	XS
226	S
226	M
226	L
226	XL
226	XXL
227	XS
227	S
227	M
227	L
227	XL
227	XXL
228	XS
228	S
228	M
228	L
228	XL
228	XXL
229	XS
229	S
229	M
229	L
229	XL
229	XXL
230	XS
230	S
230	M
230	L
230	XL
230	XXL
231	XS
231	S
231	M
231	L
231	XL
231	XXL
232	XS
232	S
232	M
232	L
232	XL
232	XXL
233	XS
233	S
233	M
233	L
233	XL
233	XXL
234	XS
234	S
234	M
234	L
234	XL
234	XXL
235	XS
235	S
235	M
235	L
235	XL
235	XXL
236	XS
236	S
236	M
236	L
236	XL
236	XXL
237	XS
237	S
237	M
237	L
237	XL
237	XXL
238	XS
238	S
238	M
238	L
238	XL
238	XXL
239	XS
239	S
239	M
239	L
239	XL
239	XXL
240	XS
240	S
240	M
240	L
240	XL
240	XXL
240	3XL
241	XS
241	S
241	M
241	L
241	XL
241	XXL
242	XS
242	S
242	M
242	L
242	XL
242	XXL
243	XS
243	S
243	M
243	L
243	XL
243	XXL
244	XS
244	S
244	M
244	L
244	XL
244	XXL
245	XS
245	S
245	M
245	L
245	XL
245	XXL
246	XS
246	S
246	M
246	L
246	XL
246	XXL
247	XS
247	S
247	M
247	L
247	XL
247	XXL
248	XS
248	S
248	M
248	L
248	XL
248	XXL
249	XS
249	S
249	M
249	L
249	XL
249	XXL
249	3XL
250	XS
250	S
250	M
250	L
250	XL
250	XXL
251	XS
251	S
251	M
251	L
251	XL
251	XXL
251	3XL
252	XS
252	S
252	M
252	L
252	XL
252	XXL
252	3XL
253	XS
253	S
253	M
253	L
253	XL
253	XXL
254	XS
254	S
254	M
254	L
254	XL
254	XXL
254	3XL
255	XS
255	S
255	M
255	L
255	XL
255	XXL
255	3XL
256	XS
256	S
256	M
256	L
256	XL
256	XXL
256	3XL
257	XS
257	S
257	M
257	L
257	XL
257	XXL
257	3XL
258	XS
258	S
258	M
258	L
258	XL
258	XXL
258	3XL
259	XS
259	S
259	M
259	L
259	XL
259	XXL
259	3XL
260	XS
260	S
260	M
260	L
260	XL
260	XXL
261	XS
261	S
261	M
261	L
261	XL
261	XXL
262	XS
262	S
262	M
262	L
262	XL
262	XXL
263	XS
263	S
263	M
263	L
263	XL
263	XXL
264	XS
264	S
264	M
264	L
264	XL
264	XXL
265	XS
265	S
265	M
265	L
265	XL
265	XXL
266	XS
266	S
266	M
266	L
266	XL
266	XXL
267	XS
267	S
267	M
267	L
267	XL
267	XXL
268	XS
268	S
268	M
268	L
268	XL
268	XXL
269	XS
269	S
269	M
269	L
269	XL
269	XXL
270	XS
270	S
270	M
270	L
270	XL
270	XXL
271	XS
271	S
271	M
271	L
271	XL
271	XXL
271	3XL
272	XS
272	S
272	M
272	L
272	XL
272	XXL
273	XS
273	S
273	M
273	L
273	XL
273	XXL
273	3XL
274	XS
274	S
274	M
274	L
274	XL
274	XXL
274	3XL
275	XS
275	S
275	M
275	L
275	XL
275	XXL
276	XS
276	S
276	M
276	L
276	XL
276	XXL
276	3XL
277	XS
277	S
277	M
277	L
277	XL
277	XXL
277	3XL
278	XS
278	S
278	M
278	L
278	XL
278	XXL
278	3XL
279	XS
279	S
279	M
279	L
279	XL
279	XXL
280	XS
280	S
280	M
280	L
280	XL
280	XXL
281	XS
281	S
281	M
281	L
281	XL
281	XXL
282	XS
282	S
282	M
282	L
282	XL
282	XXL
282	3XL
283	XS
283	S
283	M
283	L
283	XL
283	XXL
284	XS
284	S
284	M
284	L
284	XL
284	XXL
285	XS
285	S
285	M
285	L
285	XL
285	XXL
285	3XL
286	XS
286	S
286	M
286	L
286	XL
286	XXL
287	XS
287	S
287	M
287	L
287	XL
287	XXL
288	XS
288	S
288	M
288	L
288	XL
288	XXL
289	XS
289	S
289	M
289	L
289	XL
289	XXL
290	XS
290	S
290	M
290	L
290	XL
290	XXL
291	XS
291	S
291	M
291	L
291	XL
291	XXL
292	XS
292	S
292	M
292	L
292	XL
292	XXL
293	XS
293	S
293	M
293	L
293	XL
293	XXL
294	XS
294	S
294	M
294	L
294	XL
294	XXL
295	XS
295	S
295	M
295	L
295	XL
295	XXL
296	XS
296	S
296	M
296	L
296	XL
296	XXL
296	3XL
297	XS
297	S
297	M
297	L
297	XL
297	XXL
297	3XL
298	XS
298	S
298	M
298	L
298	XL
298	XXL
298	3XL
299	XS
299	S
299	M
299	L
299	XL
299	XXL
299	3XL
300	XS
300	S
300	M
300	L
300	XL
300	XXL
300	3XL
301	XS
301	S
301	M
301	L
301	XL
301	XXL
301	3XL
302	XS
302	S
302	M
302	L
302	XL
302	XXL
302	3XL
303	XS
303	S
303	M
303	L
303	XL
303	XXL
303	3XL
304	XS
304	S
304	M
304	L
304	XL
304	XXL
304	3XL
305	XS
305	S
305	M
305	L
305	XL
305	XXL
305	3XL
306	XS
306	S
306	M
306	L
306	XL
306	XXL
306	3XL
307	XS
307	S
307	M
307	L
307	XL
307	XXL
307	3XL
308	XS
308	S
308	M
308	L
308	XL
308	XXL
308	3XL
309	XS
309	S
309	M
309	L
309	XL
309	XXL
309	3XL
310	XS
310	S
310	M
310	L
310	XL
310	XXL
310	3XL
311	XS
311	S
311	M
311	L
311	XL
311	XXL
311	3XL
312	XS
312	S
312	M
312	L
312	XL
312	XXL
313	XS
313	S
313	M
313	L
313	XL
313	XXL
313	3XL
314	XS
314	S
314	M
314	L
314	XL
314	XXL
314	3XL
315	XS
315	S
315	M
315	L
315	XL
315	XXL
315	3XL
316	XS
316	S
316	M
316	L
316	XL
316	XXL
316	3XL
317	XS
317	S
317	M
317	L
317	XL
317	XXL
318	XS
318	S
318	M
318	L
318	XL
318	XXL
319	XS
319	S
319	M
319	L
319	XL
319	XXL
319	3XL
320	XS
320	S
320	M
320	L
320	XL
320	XXL
321	XS
321	S
321	M
321	L
321	XL
321	XXL
322	XS
322	S
322	M
322	L
322	XL
322	XXL
323	XS
323	S
323	M
323	L
323	XL
323	XXL
323	3XL
324	XS
324	S
324	M
324	L
324	XL
324	XXL
325	XS
325	S
325	M
325	L
325	XL
325	XXL
325	3XL
326	XS
326	S
326	M
326	L
326	XL
326	XXL
326	3XL
327	XS
327	S
327	M
327	L
327	XL
327	XXL
328	XS
328	S
328	M
328	L
328	XL
328	XXL
328	3XL
329	XS
329	S
329	M
329	L
329	XL
329	XXL
329	3XL
330	XS
330	S
330	M
330	L
330	XL
330	XXL
331	XS
331	S
331	M
331	L
331	XL
331	XXL
331	3XL
332	XS
332	S
332	M
332	L
332	XL
332	XXL
333	XS
333	S
333	M
333	L
333	XL
333	XXL
334	XS
334	S
334	M
334	L
334	XL
334	XXL
334	3XL
335	XS
335	S
335	M
335	L
335	XL
335	XXL
335	3XL
336	XS
336	S
336	M
336	L
336	XL
336	XXL
336	3XL
337	XS
337	S
337	M
337	L
337	XL
337	XXL
337	3XL
338	XS
338	S
338	M
338	L
338	XL
338	XXL
338	3XL
339	XS
339	S
339	M
339	L
339	XL
339	XXL
339	3XL
340	S
340	M
340	L
340	XL
341	S
341	M
341	L
341	XL
342	XS
342	S
342	M
342	L
342	XL
342	XXL
342	3XL
343	XS
343	S
343	M
343	L
343	XL
343	XXL
343	3XL
344	XS
344	S
344	M
344	L
344	XL
344	XXL
345	XS
345	S
345	M
345	L
345	XL
345	XXL
346	XS
346	S
346	M
346	L
346	XL
346	XXL
347	XS
347	S
347	M
347	L
347	XL
347	XXL
347	3XL
348	XS
348	S
348	M
348	L
348	XL
348	XXL
349	XS
349	S
349	M
349	L
349	XL
349	XXL
349	3XL
350	XS
350	S
350	M
350	L
350	XL
350	XXL
350	3XL
351	XS
351	S
351	M
351	L
351	XL
351	XXL
352	XS
352	S
352	M
352	L
352	XL
352	XXL
353	S
353	M
353	L
353	XL
354	XS
354	S
354	M
354	L
354	XL
354	XXL
355	XS
355	S
355	M
355	L
355	XL
355	XXL
356	XS
356	S
356	M
356	L
356	XL
356	XXL
356	3XL
357	XS
357	S
357	M
357	L
357	XL
357	XXL
357	3XL
358	XS
358	S
358	M
358	L
358	XL
358	XXL
358	3XL
359	XS
359	S
359	M
359	L
359	XL
359	XXL
359	3XL
360	XS
360	S
360	M
360	L
360	XL
360	XXL
361	XS
361	S
361	M
361	L
361	XL
361	XXL
362	XS
362	S
362	M
362	L
362	XL
362	XXL
363	XS
363	S
363	M
363	L
363	XL
363	XXL
363	3XL
364	XS
364	S
364	M
364	L
364	XL
364	XXL
365	XS
365	S
365	M
365	L
365	XL
365	XXL
365	3XL
366	XS
366	S
366	M
366	L
366	XL
366	XXL
366	3XL
367	XS
367	S
367	M
367	L
367	XL
367	XXL
367	3XL
368	XS
368	S
368	M
368	L
368	XL
368	XXL
368	3XL
369	XS
369	S
369	M
369	L
369	XL
369	XXL
370	XS
370	S
370	M
370	L
370	XL
370	XXL
371	XS
371	S
371	M
371	L
371	XL
371	XXL
371	3XL
372	XS
372	S
372	M
372	L
372	XL
372	XXL
372	3XL
373	XS
373	S
373	M
373	L
373	XL
373	XXL
374	XS
374	S
374	M
374	L
374	XL
374	XXL
375	XS
375	S
375	M
375	L
375	XL
375	XXL
375	3XL
376	XS
376	S
376	M
376	L
376	XL
376	XXL
377	XS
377	S
377	M
377	L
377	XL
377	XXL
378	XS
378	S
378	M
378	L
378	XL
378	XXL
378	3XL
379	XS
379	S
379	M
379	L
379	XL
379	XXL
379	3XL
380	XS
380	S
380	M
380	L
380	XL
380	XXL
381	XS
381	S
381	M
381	L
381	XL
381	XXL
382	XS
382	S
382	M
382	L
382	XL
382	XXL
383	XS
383	S
383	M
383	L
383	XL
383	XXL
384	XS
384	S
384	M
384	L
384	XL
384	XXL
384	3XL
385	XS
385	S
385	M
385	L
385	XL
385	XXL
386	XS
386	S
386	M
386	L
386	XL
386	XXL
387	XS
387	S
387	M
387	L
387	XL
387	XXL
387	3XL
388	S
388	M
388	L
388	XL
389	XS
389	S
389	M
389	L
389	XL
389	XXL
390	27inch
390	28inch
390	29inch
390	30inch
390	31inch
390	32inch
390	33inch
390	34inch
390	35inch
390	36inch
390	38inch
391	27inch
391	28inch
391	29inch
391	30inch
391	31inch
391	32inch
391	33inch
391	34inch
391	35inch
391	36inch
391	38inch
392	27inch
392	28inch
392	29inch
392	30inch
392	31inch
392	32inch
392	33inch
392	34inch
392	35inch
392	36inch
392	38inch
393	27inch
393	28inch
393	29inch
393	30inch
393	31inch
393	32inch
393	33inch
393	34inch
393	35inch
393	36inch
393	38inch
394	XS
394	S
394	M
394	L
394	XL
394	XXL
394	3XL
395	27inch
395	28inch
395	29inch
395	30inch
395	31inch
395	32inch
395	33inch
395	34inch
395	35inch
395	36inch
395	37inch
395	38inch
396	XS
396	S
396	M
396	L
396	XL
396	XXL
396	3XL
397	XS
397	S
397	M
397	L
397	XL
397	XXL
397	3XL
398	27inch
398	28inch
398	29inch
398	30inch
398	31inch
398	32inch
398	33inch
398	34inch
398	35inch
398	36inch
398	38inch
399	27inch
399	28inch
399	29inch
399	30inch
399	31inch
399	32inch
399	33inch
399	34inch
399	35inch
399	36inch
399	38inch
400	27inch
400	28inch
400	29inch
400	30inch
400	31inch
400	32inch
400	33inch
400	34inch
400	35inch
400	36inch
400	38inch
401	28inch
401	29inch
401	30inch
401	31inch
401	32inch
401	33inch
401	34inch
401	35inch
401	36inch
402	27inch
402	28inch
402	29inch
402	30inch
402	31inch
402	32inch
402	33inch
402	34inch
402	35inch
402	36inch
402	38inch
403	29inch
403	30inch
403	31inch
403	32inch
403	33inch
404	27inch
404	28inch
404	29inch
404	30inch
404	31inch
404	32inch
404	33inch
404	34inch
404	35inch
404	36inch
404	38inch
405	27inch
405	28inch
405	29inch
405	30inch
405	31inch
405	32inch
405	33inch
405	34inch
405	35inch
405	36inch
405	38inch
406	30inch
406	31inch
406	32inch
406	33inch
407	XS
407	S
407	M
407	L
407	XL
407	XXL
408	70cm
408	73cm
408	76cm
408	79cm
408	82cm
408	85cm
408	88cm
408	91cm
408	95cm
409	70cm
409	73cm
409	76cm
409	79cm
409	82cm
409	85cm
409	88cm
409	91cm
409	95cm
410	70cm
410	73cm
410	76cm
410	79cm
410	82cm
410	85cm
410	88cm
410	91cm
410	95cm
411	70cm
411	73cm
411	76cm
411	79cm
411	82cm
411	85cm
411	88cm
411	91cm
411	95cm
412	70cm
412	73cm
412	76cm
412	79cm
412	82cm
412	85cm
412	88cm
412	91cm
412	95cm
413	70cm
413	73cm
413	76cm
413	79cm
413	82cm
413	85cm
413	88cm
414	70cm
414	73cm
414	76cm
414	79cm
414	82cm
414	85cm
414	88cm
414	91cm
414	95cm
415	70cm
415	73cm
415	76cm
415	79cm
415	82cm
415	85cm
415	88cm
415	91cm
415	95cm
416	70cm
416	73cm
416	76cm
416	79cm
416	82cm
416	85cm
416	88cm
416	91cm
416	95cm
417	70cm
417	73cm
417	76cm
417	79cm
417	82cm
417	85cm
417	88cm
417	91cm
417	95cm
418	XS
418	S
418	M
418	L
418	XL
418	XXL
419	XS
419	S
419	M
419	L
419	XL
419	XXL
419	3XL
420	XS
420	S
420	M
420	L
420	XL
420	XXL
421	XS
421	S
421	M
421	L
421	XL
421	XXL
421	3XL
422	XS
422	S
422	M
422	L
422	XL
422	XXL
423	XS
423	S
423	M
423	L
423	XL
423	XXL
424	XS
424	S
424	M
424	L
424	XL
424	XXL
425	XS
425	S
425	M
425	L
425	XL
425	XXL
426	XS
426	S
426	M
426	L
426	XL
426	XXL
426	3XL
427	XS
427	S
427	M
427	L
427	XL
427	XXL
428	XS
428	S
428	M
428	L
428	XL
428	XXL
429	XS
429	S
429	M
429	L
429	XL
429	XXL
429	3XL
430	XS
430	S
430	M
430	L
430	XL
430	XXL
430	3XL
431	XS
431	S
431	M
431	L
431	XL
431	XXL
432	70cm
432	73cm
432	76cm
432	79cm
432	82cm
432	85cm
432	88cm
433	70cm
433	73cm
433	76cm
433	79cm
433	82cm
433	85cm
433	88cm
433	91cm
433	95cm
434	70cm
434	73cm
434	76cm
434	79cm
434	82cm
434	85cm
434	88cm
434	91cm
434	95cm
435	70cm
435	73cm
435	76cm
435	79cm
435	82cm
435	85cm
435	88cm
435	91cm
435	95cm
436	70cm
436	73cm
436	76cm
436	79cm
436	82cm
436	85cm
436	88cm
436	91cm
436	95cm
437	XS
437	S
437	M
437	L
437	XL
437	XXL
438	XS
438	S
438	M
438	L
438	XL
438	XXL
439	XS
439	S
439	M
439	L
439	XL
439	XXL
439	3XL
440	XS
440	S
440	M
440	L
440	XL
440	XXL
440	3XL
441	XS
441	S
441	M
441	L
441	XL
441	XXL
441	3XL
442	XS
442	S
442	M
442	L
442	XL
442	XXL
443	XS
443	S
443	M
443	L
443	XL
443	XXL
444	XS
444	S
444	M
444	L
444	XL
444	XXL
445	XS
445	S
445	M
445	L
445	XL
445	XXL
446	XS
446	S
446	M
446	L
446	XL
446	XXL
447	XS
447	S
447	M
447	L
447	XL
447	XXL
448	XS
448	S
448	M
448	L
448	XL
448	XXL
449	S
449	M
449	L
449	XL
450	XS
450	S
450	M
450	L
450	XL
450	XXL
451	XS
451	S
451	M
451	L
451	XL
451	XXL
452	XS
452	S
452	M
452	L
452	XL
452	XXL
453	XS
453	S
453	M
453	L
453	XL
453	XXL
453	3XL
454	XS
454	S
454	M
454	L
454	XL
454	XXL
455	XS
455	S
455	M
455	L
455	XL
455	XXL
456	XS
456	S
456	M
456	L
456	XL
456	XXL
457	XS
457	S
457	M
457	L
457	XL
457	XXL
458	XS
458	S
458	M
458	L
458	XL
458	XXL
459	XS
459	S
459	M
459	L
459	XL
459	XXL
460	XS
460	S
460	M
460	L
460	XL
460	XXL
461	XS
461	S
461	M
461	L
461	XL
461	XXL
462	XS
462	S
462	M
462	L
462	XL
462	XXL
463	XS
463	S
463	M
463	L
463	XL
463	XXL
464	XS
464	S
464	M
464	L
464	XL
464	XXL
465	XS
465	S
465	M
465	L
465	XL
465	XXL
466	XS
466	S
466	M
466	L
466	XL
466	XXL
467	XS
467	S
467	M
467	L
467	XL
467	XXL
468	XS
468	S
468	M
468	L
468	XL
468	XXL
469	XS
469	S
469	M
469	L
469	XL
469	XXL
470	XS
470	S
470	M
470	L
470	XL
470	XXL
471	XS
471	S
471	M
471	L
471	XL
471	XXL
472	XS
472	S
472	M
472	L
472	XL
472	XXL
473	XS
473	S
473	M
473	L
473	XL
473	XXL
474	XS
474	S
474	M
474	L
474	XL
474	XXL
475	XS
475	S
475	M
475	L
475	XL
475	XXL
476	S
476	M
476	L
476	XL
476	XXL
477	S
477	M
477	L
477	XL
477	XXL
478	S
478	M
478	L
478	XL
478	XXL
479	S
479	M
479	L
479	XL
479	XXL
480	S
480	M
480	L
480	XL
480	XXL
481	S
481	M
481	L
481	XL
481	XXL
482	S
482	M
482	L
482	XL
482	XXL
483	S
483	M
483	L
483	XL
483	XXL
484	S
484	M
484	L
484	XL
484	XXL
485	S
485	M
485	L
485	XL
485	XXL
486	S
486	M
486	L
486	XL
486	XXL
487	S
487	M
487	L
487	XL
487	XXL
488	S
488	M
488	L
488	XL
488	XXL
489	S
489	M
489	L
489	XL
489	XXL
490	S
490	M
490	L
490	XL
490	XXL
491	S
491	M
491	L
491	XL
491	XXL
492	S
492	M
492	L
492	XL
492	XXL
493	XS
493	S
493	M
493	L
493	XL
493	XXL
494	XS
494	S
494	M
494	L
494	XL
494	XXL
495	XS
495	S
495	M
495	L
495	XL
495	XXL
496	XS
496	S
496	M
496	L
496	XL
496	XXL
497	XS
497	S
497	M
497	L
497	XL
497	XXL
497	3XL
498	XS
498	S
498	M
498	L
498	XL
498	XXL
499	XS
499	S
499	M
499	L
499	XL
499	XXL
500	XS
500	S
500	M
500	L
500	XL
500	XXL
501	XS
501	S
501	M
501	L
501	XL
501	XXL
502	XS
502	S
502	M
502	L
502	XL
502	XXL
502	3XL
503	XS
503	S
503	M
503	L
503	XL
503	XXL
503	3XL
504	XS
504	S
504	M
504	L
504	XL
504	XXL
504	3XL
505	XS
505	S
505	M
505	L
505	XL
505	XXL
505	3XL
506	110cm
506	120cm
506	130cm
506	140cm
506	150cm
506	160cm
507	XS
507	S
507	M
507	L
507	XL
507	XXL
507	3XL
508	XS
508	S
508	M
508	L
508	XL
508	XXL
508	3XL
509	25-27cm
510	25-27cm
511	25-27cm
512	25-27cm
513	25-27cm
514	XS
514	S
514	M
514	L
514	XL
514	XXL
515	XS
515	S
515	M
515	L
515	XL
515	XXL
516	XS
516	S
516	M
516	L
516	XL
516	XXL
517	XS
517	S
517	M
517	L
517	XL
517	XXL
518	XS
518	S
518	M
518	L
518	XL
518	XXL
519	XS
519	S
519	M
519	L
519	XL
519	XXL
520	XS
520	S
520	M
520	L
520	XL
520	XXL
521	XS
521	S
521	M
521	L
521	XL
521	XXL
522	XS
522	S
522	M
522	L
522	XL
522	XXL
523	XS
523	S
523	M
523	L
523	XL
523	XXL
524	XS
524	S
524	M
524	L
524	XL
524	XXL
525	XS
525	S
525	M
525	L
525	XL
525	XXL
526	XS
526	S
526	M
526	L
526	XL
526	XXL
526	3XL
527	XS
527	S
527	M
527	L
527	XL
527	XXL
527	3XL
528	XS
528	S
528	M
528	L
528	XL
528	XXL
528	3XL
529	XS
529	S
529	M
529	L
529	XL
529	XXL
529	3XL
530	XS
530	S
530	M
530	L
530	XL
530	XXL
530	3XL
531	110cm
531	120cm
531	130cm
531	140cm
531	150cm
531	160cm
532	XS
532	S
532	M
532	L
532	XL
532	XXL
533	XS
533	S
533	M
533	L
533	XL
533	XXL
534	XS
534	S
534	M
534	L
534	XL
534	XXL
535	XS
535	S
535	M
535	L
535	XL
535	XXL
536	XS
536	S
536	M
536	L
536	XL
536	XXL
536	3XL
537	XS
537	S
537	M
537	L
537	XL
537	XXL
538	S
538	M
538	L
538	XL
538	XXL
538	3XL
539	S
539	M
539	L
539	XL
539	XXL
539	3XL
540	S
540	M
540	L
540	XL
540	XXL
541	S
541	M
541	L
541	XL
541	XXL
541	3XL
542	S
542	M
542	L
542	XL
542	XXL
543	S
543	M
543	L
543	XL
543	XXL
544	S
544	M
544	L
544	XL
544	XXL
545	S
545	M
545	L
545	XL
545	XXL
545	3XL
546	S
546	M
546	L
546	XL
546	XXL
547	S
547	M
547	L
547	XL
547	XXL
548	S
548	M
548	L
548	XL
548	XXL
549	S
549	M
549	L
549	XL
549	XXL
549	3XL
550	S
550	M
550	L
550	XL
550	XXL
550	3XL
551	S
551	M
551	L
551	XL
551	XXL
551	3XL
552	S
552	M
552	L
552	XL
552	XXL
553	S
553	M
553	L
553	XL
553	XXL
554	S
554	M
554	L
554	XL
554	XXL
555	S
555	M
555	L
555	XL
555	XXL
556	S
556	M
556	L
556	XL
556	XXL
557	S
557	M
557	L
557	XL
557	XXL
558	S
558	M
558	L
558	XL
558	XXL
559	S
559	M
559	L
559	XL
559	XXL
560	S
560	M
560	L
560	XL
560	XXL
561	S
561	M
561	L
561	XL
561	XXL
562	S
562	M
562	L
562	XL
562	XXL
563	S
563	M
563	L
563	XL
563	XXL
564	S
564	M
564	L
564	XL
564	XXL
565	S
565	M
565	L
565	XL
565	XXL
566	S
566	M
566	L
566	XL
566	XXL
567	S
567	M
567	L
567	XL
567	XXL
568	S
568	M
568	L
568	XL
568	XXL
569	S
569	M
569	L
569	XL
569	XXL
570	S
570	M
570	L
570	XL
570	XXL
571	S
571	M
571	L
571	XL
571	XXL
572	M
572	L
572	XL
573	S
573	M
573	L
573	XL
573	XXL
573	3XL
574	S
574	M
574	L
574	XL
574	XXL
574	3XL
575	S
575	M
575	L
575	XL
575	XXL
575	3XL
576	S
576	M
576	L
576	XL
576	XXL
576	3XL
577	S
577	M
577	L
577	XL
577	XXL
578	S
578	M
578	L
578	XL
578	XXL
579	S
579	M
579	L
579	XL
579	XXL
580	S
580	M
580	L
580	XL
580	XXL
581	S
581	M
581	L
581	XL
581	XXL
582	S
582	M
582	L
582	XL
582	XXL
583	S
583	M
583	L
583	XL
583	XXL
584	S
584	M
584	L
584	XL
584	XXL
585	S
585	M
585	L
585	XL
585	XXL
586	S
586	M
586	L
586	XL
586	XXL
587	S
587	M
587	L
587	XL
587	XXL
588	S
588	M
588	L
588	XL
588	XXL
589	S
589	M
589	L
589	XL
589	XXL
590	S
590	M
590	L
590	XL
590	XXL
591	S
591	M
591	L
591	XL
591	XXL
592	S
592	M
592	L
592	XL
592	XXL
593	S
593	M
593	L
593	XL
593	XXL
594	S
594	M
594	L
594	XL
594	XXL
595	S
595	M
595	L
595	XL
595	XXL
596	S
596	M
596	L
596	XL
596	XXL
597	S
597	M
597	L
597	XL
597	XXL
598	S
598	M
598	L
598	XL
598	XXL
599	S
599	M
599	L
599	XL
599	XXL
600	S
600	M
600	L
600	XL
600	XXL
601	S
601	M
601	L
601	XL
601	XXL
602	S
602	M
602	L
602	XL
602	XXL
602	3XL
603	S
603	M
603	L
603	XL
603	XXL
603	3XL
604	S
604	M
604	L
604	XL
604	XXL
604	3XL
605	S
605	M
605	L
605	XL
605	XXL
605	3XL
606	25-27cm
607	25-27cm
608	25-27cm
609	25-27cm
610	25-27cm
611	25-27cm
612	25-27cm
613	25-27cm
614	25-27cm
615	25-27cm
616	25-27cm
617	25-27cm
618	25-27cm
619	25-27cm
620	25-27cm
621	25-27cm
622	25-27cm
623	25-27cm
624	25-27cm
625	25-27cm
626	25-27cm
627	25-27cm
628	25-27cm
629	25-27cm
630	25-27cm
631	25-27cm
632	25-27cm
633	25-27cm
634	25-27cm
635	25-27cm
636	25-27cm
637	25-27cm
638	25-27cm
639	25-27cm
640	25-27cm
641	25-27cm
642	25-27cm
643	25-27cm
644	25-27cm
645	25-27cm
646	XS
646	S
646	M
646	L
646	XL
646	XXL
646	3XL
647	XS
647	S
647	M
647	L
647	XL
647	XXL
647	3XL
648	XS
648	S
648	M
648	L
648	XL
648	XXL
648	3XL
649	XS
649	S
649	M
649	L
649	XL
649	XXL
650	XS
650	S
650	M
650	L
650	XL
650	XXL
651	XS
651	S
651	M
651	L
651	XL
651	XXL
652	XS
652	S
652	M
652	L
652	XL
652	XXL
653	XS
653	S
653	M
653	L
653	XL
653	XXL
654	XS
654	S
654	M
654	L
654	XL
654	XXL
655	XS
655	S
655	M
655	L
655	XL
655	XXL
656	XS
656	S
656	M
656	L
656	XL
656	XXL
657	XS
657	S
657	M
657	L
657	XL
657	XXL
658	XS
658	S
658	M
658	L
658	XL
658	XXL
659	XS
659	S
659	M
659	L
659	XL
659	XXL
660	XS
660	S
660	M
660	L
660	XL
660	XXL
661	XS
661	S
661	M
661	L
661	XL
661	XXL
662	XS
662	S
662	M
662	L
662	XL
662	XXL
663	XS
663	S
663	M
663	L
663	XL
663	XXL
664	XS
664	S
664	M
664	L
664	XL
664	XXL
665	XS
665	S
665	M
665	L
665	XL
665	XXL
666	XS
666	S
666	M
666	L
666	XL
666	XXL
667	XS
667	S
667	M
667	L
667	XL
667	XXL
668	XS
668	S
668	M
668	L
668	XL
668	XXL
669	XS
669	S
669	M
669	L
669	XL
669	XXL
670	XS
670	S
670	M
670	L
670	XL
670	XXL
671	XS
671	S
671	M
671	L
671	XL
671	XXL
672	XS
672	S
672	M
672	L
672	XL
672	XXL
673	M
673	L
674	M
674	L
675	M
675	L
676	M
676	L
677	M
677	L
688	S
688	M
688	L
689	M
689	L
691	M
691	L
692	M
692	L
693	M
693	L
694	M
694	L
695	M
695	L
696	M
696	L
697	M
697	L
698	M
698	L
712	M
712	L
713	M
713	L
715	M
715	L
716	M
716	L
717	M
717	L
718	XS
718	S
718	M
718	L
718	XL
718	XXL
719	XS
719	S
719	M
719	L
719	XL
719	XXL
719	3XL
720	XS
720	S
720	M
720	L
720	XL
720	XXL
720	3XL
721	XS
721	S
721	M
721	L
721	XL
721	XXL
722	XS
722	S
722	M
722	L
722	XL
722	XXL
722	3XL
723	XS
723	S
723	M
723	L
723	XL
723	XXL
724	XS
724	S
724	M
724	L
724	XL
724	XXL
724	3XL
725	XS
725	S
725	M
725	L
725	XL
725	XXL
725	3XL
726	XS
726	S
726	M
726	L
726	XL
726	XXL
726	3XL
727	XS
727	S
727	M
727	L
727	XL
727	XXL
727	3XL
728	XS
728	S
728	M
728	L
728	XL
728	XXL
728	3XL
729	XS
729	S
729	M
729	L
729	XL
729	XXL
729	3XL
730	XS
730	S
730	M
730	L
730	XL
730	XXL
731	XS
731	S
731	M
731	L
731	XL
731	XXL
731	3XL
732	S
732	M
732	L
732	XL
733	XS
733	S
733	M
733	L
733	XL
733	XXL
734	XS
734	S
734	M
734	L
734	XL
734	XXL
735	XS
735	S
735	M
735	L
735	XL
735	XXL
736	XS
736	S
736	M
736	L
736	XL
736	XXL
737	XS
737	S
737	M
737	L
737	XL
737	XXL
738	XS
738	S
738	M
738	L
738	XL
738	XXL
739	70cm
739	73cm
739	76cm
739	79cm
739	82cm
739	85cm
739	88cm
740	XS
740	S
740	M
740	L
740	XL
740	XXL
740	3XL
741	XS
741	S
741	M
741	L
741	XL
741	XXL
741	3XL
742	XS
742	S
742	M
742	L
742	XL
742	XXL
743	XS
743	S
743	M
743	L
743	XL
743	XXL
744	XS
744	S
744	M
744	L
744	XL
744	XXL
745	XS
745	S
745	M
745	L
745	XL
745	XXL
745	3XL
746	XS
746	S
746	M
746	L
746	XL
746	XXL
747	XS
747	S
747	M
747	L
747	XL
747	XXL
748	XS
748	S
748	M
748	L
748	XL
748	XXL
748	3XL
749	XS
749	S
749	M
749	L
749	XL
749	XXL
750	XS
750	S
750	M
750	L
750	XL
750	XXL
751	XS
751	S
751	M
751	L
751	XL
751	XXL
752	XS
752	S
752	M
752	L
752	XL
752	XXL
753	XS
753	S
753	M
753	L
753	XL
753	XXL
754	XS
754	S
754	M
754	L
754	XL
754	XXL
755	XS
755	S
755	M
755	L
755	XL
755	XXL
760	25-27cm
761	25-27cm
762	25-27cm
763	25-27cm
764	25-27cm
765	25-27cm
768	XS
768	S
768	M
768	L
768	XL
768	XXL
768	3XL
769	XS
769	S
769	M
769	L
769	XL
769	XXL
769	3XL
770	XS
770	S
770	M
770	L
770	XL
770	XXL
770	3XL
771	XS
771	S
771	M
771	L
771	XL
771	XXL
771	3XL
772	S
772	M
772	L
772	XL
773	XS
773	S
773	M
773	L
773	XL
773	XXL
773	3XL
774	XS
774	S
774	M
774	L
774	XL
774	XXL
774	3XL
775	XS
775	S
775	M
775	L
775	XL
775	XXL
775	3XL
776	XS
776	S
776	M
776	L
776	XL
776	XXL
776	3XL
777	XS
777	S
777	M
777	L
777	XL
777	XXL
777	3XL
778	XS
778	S
778	M
778	L
778	XL
778	XXL
778	3XL
779	M
779	L
\.


--
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: justin
--

COPY public.subcategories (subcategory_id, subcategory) FROM stdin;
1	T-Shirt Lengan Pendek
2	T-Shirt Lengan Panjang
3	UT(Graphic T-Shirt)
4	Kaos Polo
5	Koleksi Sweat & Jaket Hoodie
6	Kemeja Kasual (Lengan Pendek)
7	Kemeja Kasual (Lengan Panjang)
8	Kemeja Formal
9	Sweater & Cardigan
10	Blouson & Jaket Parka
11	Jaket & Blazer
12	AirSense
13	Ultra Light Down
14	Celana Relax & Lebar
15	Jeans
16	Chino
17	AirSense
18	Celana Sweat
19	Celana Panjang & Ankle
20	Celana Pendek
21	AIRism
22	HEATTECH
23	Dalaman Atas
24	Legging
25	Celana Dalam
26	Kaos Kaki
27	Piyama
28	Sandal Rumah
29	Topi
30	Syal
31	Tas
32	Ikat Pinggang
33	Sepatu & Sandal
34	Payung
35	Kacamata
36	Lainnya
37	Sport Utility Wear
\.


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: products_colors products_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products_colors
    ADD CONSTRAINT products_colors_pkey PRIMARY KEY (product_id, color);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: products_sizes products_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products_sizes
    ADD CONSTRAINT products_sizes_pkey PRIMARY KEY (product_id, size);


--
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (subcategory_id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: products_colors products_colors_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products_colors
    ADD CONSTRAINT products_colors_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products_sizes products_sizes_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products_sizes
    ADD CONSTRAINT products_sizes_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products products_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: justin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(subcategory_id);


--
-- PostgreSQL database dump complete
--

