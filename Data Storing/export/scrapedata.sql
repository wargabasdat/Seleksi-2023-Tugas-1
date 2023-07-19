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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    authorid character varying(20) NOT NULL,
    name character varying(255),
    description text,
    role character varying(100)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: glyph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.glyph (
    glyphid character varying(10) NOT NULL,
    styleid character varying(10) NOT NULL,
    typefaceid character varying(10) NOT NULL,
    category character varying(20),
    glyph character varying(255)
);


ALTER TABLE public.glyph OWNER TO postgres;

--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    languageid character varying(20) NOT NULL,
    name character varying(200),
    continent character varying(20)
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license (
    licenseid character varying(20) NOT NULL,
    name character varying(200),
    description text
);


ALTER TABLE public.license OWNER TO postgres;

--
-- Name: styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.styles (
    styleid character varying(10) NOT NULL,
    typefaceid character varying(10) NOT NULL,
    name character varying(200),
    slant integer,
    weight integer
);


ALTER TABLE public.styles OWNER TO postgres;

--
-- Name: typeface; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeface (
    typefaceid character varying(10) NOT NULL,
    name character varying(200),
    description text,
    authorid character varying(20),
    licenseid character varying(20),
    usagedetails bigint,
    webusage integer
);


ALTER TABLE public.typeface OWNER TO postgres;

--
-- Name: typefacelangsupport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typefacelangsupport (
    typefaceid character varying(20) NOT NULL,
    languageid character varying(20) NOT NULL
);


ALTER TABLE public.typefacelangsupport OWNER TO postgres;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (authorid, name, description, role) FROM stdin;
ID0001	Christian Robertson	\N	\N
ID0002	Google	\N	\N
ID0003	The DocRepair Project	\N	\N
ID0005	Steve Matteson	\N	\N
ID0008	Julieta Ulanovsky	\N	\N
ID0009	Lukasz Dziedzic	\N	\N
ID0010	Indian Type Foundry	\N	\N
ID0011	Adam Jagosz	\N	\N
ID0014	Rune BjÃ¸rnerÃ¥s	\N	\N
ID0015	Rasmus Andersson	\N	\N
ID0017	Vernon Adams	\N	\N
ID0018	Matt McInerney	\N	\N
ID0022	Claus Eggers SÃ¸rensen	\N	\N
ID0025	Hubert and Fischer	\N	\N
ID0026	Dalton Maag	\N	\N
ID0027	Sorkin Type	\N	\N
ID0028	ParaType	\N	\N
ID0030	Wei Huang	\N	\N
ID0031	Peter Hull	\N	\N
ID0032	Cadson Demak	\N	\N
ID0034	Cyreal	\N	\N
ID0035	Andrew Paglinawan	\N	\N
ID0036	Carrois Apostrophe	\N	\N
ID0037	Ek Type	\N	\N
ID0038	Kevin Burke	\N	\N
ID0039	Jeremy Tribby	\N	\N
ID0040	Colophon Foundry	\N	\N
ID0041	Christian Thalmann	\N	\N
ID0043	Oded Ezer	\N	\N
ID0046	Mikhail Sharanda	\N	\N
ID0047	SIL International	\N	\N
ID0048	Accademia di Belle Arti di Urbino	\N	\N
ID0049	Mike Abbink	\N	\N
ID0051	Impallari Type	\N	\N
ID0053	Jonny Pinhorn	\N	\N
ID0054	Raph Levien	\N	\N
ID0056	Santiago Orozco	\N	\N
ID0058	Sandoll	\N	\N
ID0062	Ryoichi Tsunekawa	\N	\N
ID0063	Juan Montoreano	\N	\N
ID0065	Mohamed Gaber	\N	\N
ID0066	MADType	\N	\N
ID0070	Joe Prince	\N	\N
ID0072	Florian Karsten	\N	\N
ID0074	Sol Matas	\N	\N
ID0076	Georg Duffner	\N	\N
ID0080	Anna GiedryÅ›	\N	\N
ID0081	Natanael Gama	\N	\N
ID0083	Sebastian Kosch	\N	\N
ID0085	Bakken & BÃ¦ck	\N	\N
ID0086	Owen Earl	\N	\N
ID0089	Adobe Systems Inc.	\N	\N
ID0090	Paul D. Hunt	\N	\N
ID0093	Coji Morishita	\N	\N
ID0094	Johan Aakerlund	\N	\N
ID0096	USWDS	\N	\N
ID0097	Christian Naths	\N	\N
ID0098	Omnibus-Type	\N	\N
ID0101	Delve Withrington	\N	\N
ID0102	Anton Koovit	\N	\N
ID0104	TypeTogether	\N	\N
ID0105	Smartsheet Inc	\N	\N
ID0107	Boutros Fonts	\N	\N
ID0111	John Hudson	\N	\N
ID0112	Kimberly Geswein	\N	\N
ID0116	Typotheque	\N	\N
ID0117	Pria Ravichandran	\N	\N
ID0118	MCKL	\N	\N
ID0119	Jonas Hecksher	\N	\N
ID0121	Miguel Hernandez	\N	\N
ID0122	Yanone	\N	\N
ID0123	Sideshow	\N	\N
ID0125	Fontrix	\N	\N
ID0126	Tokotype	\N	\N
ID0127	Suppakit Chalermlarp	\N	\N
ID0136	Kinuta Font Factory	\N	\N
ID0137	Yanek Iontef	\N	\N
ID0138	Juan Pablo del Peral	\N	\N
ID0140	Jovanny Lemonad	\N	\N
ID0143	Jaikishan Patel	\N	\N
ID0144	Friedrich Althausen	\N	\N
ID0149	Daniel Johnson	\N	\N
ID0151	Tiro Typeworks	\N	\N
ID0152	Corey Hu	\N	\N
ID0154	Font Diner	\N	\N
ID0155	JM SolÃ©	\N	\N
ID0160	Monokrom	\N	\N
ID0164	Astigmatic	\N	\N
ID0165	Anja Meiners	\N	\N
ID0169	Karolina Lach	\N	\N
ID0171	Erin McLaughlin	\N	\N
ID0172	Spyros Zevelakis	\N	\N
ID0173	LatinoType	\N	\N
ID0174	David Perry	\N	\N
ID0175	Khaled Hosny	\N	\N
ID0177	Eduardo Tunni	\N	\N
ID0178	Dan Reynolds	\N	\N
ID0179	Erik Kennedy	\N	\N
ID0180	Vectro Type Foundry	\N	\N
ID0181	Robert Leuschke	\N	\N
ID0182	Bonnie Shaver-Troup	\N	\N
ID0184	Carolina Short	\N	\N
ID0185	Kosal Sen	\N	\N
ID0192	Jonathan Barnbrook	\N	\N
ID0194	mshio	\N	\N
ID0195	Fontstage	\N	\N
ID0196	Frank GrieÃŸhammer	\N	\N
ID0198	Production Type	\N	\N
ID0202	Dave Crossland	\N	\N
ID0207	Ksenya Erulevich	\N	\N
ID0208	Jiyeon Park	\N	\N
ID0209	Kyungwon Kim	\N	\N
ID0210	Minha Hyung	\N	\N
ID0211	Sooun Cho	\N	\N
ID0212	Jiashuo Zhang	\N	\N
ID0213	Haesung Cho	\N	\N
ID0217	Johan Kallas	\N	\N
ID0220	Alexey Kryukov	\N	\N
ID0222	Font Bureau	\N	\N
ID0223	Andrij Shevchenko	\N	\N
ID0231	Michal Sahar	\N	\N
ID0234	Brian LaRossa	\N	\N
ID0238	CodeMan38	\N	\N
ID0242	Eben Sorkin	\N	\N
ID0246	Ania Kruk	\N	\N
ID0250	Takashi Funayama	\N	\N
ID0252	AndrÃ©s Torresi	\N	\N
ID0256	HanYang I&C Co	\N	\N
ID0257	Catherine Leigh Schmidt	\N	\N
ID0258	Denis Masharov	\N	\N
ID0259	Andreas Kalpakidis	\N	\N
ID0262	Alessio Laiso	\N	\N
ID0263	Kostas Bartsokas	\N	\N
ID0265	Satsuyako	\N	\N
ID0266	Font Zone 108	\N	\N
ID0271	Thomas Jockin	\N	\N
ID0272	MOTOYA	\N	\N
ID0275	Toshi Omagari	\N	\N
ID0278	Igino Marini	\N	\N
ID0279	Jacques Le Bailly	\N	\N
ID0280	Natsumi Matsuba	\N	\N
ID0281	Maniackers Design	\N	\N
ID0285	David Jonathan Ross	\N	\N
ID0287	Brian Zick	\N	\N
ID0289	LÃ¢m Báº£o	\N	\N
ID0292	Nathan Willis	\N	\N
ID0293	Sudtipos	\N	\N
ID0294	Daniel Hernandez	\N	\N
ID0297	Botjo Nikoltchev	\N	\N
ID0304	Yvonne SchÃ¼ttler	\N	\N
ID0308	Mooniak	\N	\N
ID0309	Agustina Mingote	\N	\N
ID0310	Commercial Type	\N	\N
ID0311	Nicole Fally	\N	\N
ID0316	Gesine Todt	\N	\N
ID0321	Tina Anderson	\N	\N
ID0324	Juergen Huber	\N	\N
ID0325	Patrick Wagesreiter	\N	\N
ID0326	Rodrigo Fuenzalida	\N	\N
ID0328	Mariela Monsalve	\N	\N
ID0330	Matt Bailey	\N	\N
ID0337	NaN	\N	\N
ID0343	Purushoth Kumar Guttula	\N	\N
ID0346	Yoshimichi Ohira	\N	\N
ID0348	Alan Dague-Greene	\N	\N
ID0349	Andrey V. Panov	\N	\N
ID0350	Gaslight	\N	\N
ID0359	Danh Hong	\N	\N
ID0363	Monotype Imaging Inc.	\N	\N
ID0364	Sophia Tai	\N	\N
ID0365	Borna Izadpanah	\N	\N
ID0367	Ana Paula Megda	\N	\N
ID0370	James Grieshaber	\N	\N
ID0380	Tyler Finck	\N	\N
ID0382	soytutype fonts	\N	\N
ID0383	Craig Rozynski	\N	\N
ID0385	Marcelo MagalhÃ£es	\N	\N
ID0389	Saurabh Sharma	\N	\N
ID0390	Vicente LamÃ³naca	\N	\N
ID0391	FONTDASU	\N	\N
ID0392	Luciano Vergara	\N	\N
ID0395	Type Bank Co.	\N	\N
ID0397	Mark Simonson	\N	\N
ID0398	Barry Schwartz	\N	\N
ID0401	ANRT	\N	\N
ID0403	Zess Type	\N	\N
ID0408	Adam PÃ³Å‚tawski	\N	\N
ID0412	Andreas Rasmussen	\N	\N
ID0413	Thomas Junold	\N	\N
ID0418	Ringo R. Seeber	\N	\N
ID0420	Hagilda	\N	\N
ID0421	Bonjour Monde	\N	\N
ID0422	Martin Sommaruga	\N	\N
ID0428	Suon May Sophanith	\N	\N
ID0431	Rosetta	\N	\N
ID0435	Andres Torresi	\N	\N
ID0437	Huerta TipogrÃ¡fica	\N	\N
ID0438	Severin Meyer	\N	\N
ID0439	John Vargas BeltrÃ¡n	\N	\N
ID0443	Undercase Type	\N	\N
ID0444	JuliÃ¡n Tunni	\N	\N
ID0450	Eduardo Rodriguez Tunni	\N	\N
ID0456	Oleg Pospelov	\N	\N
ID0461	Viktoriya Grabowska	\N	\N
ID0462	Julia Petretta	\N	\N
ID0465	Nguyen Type	\N	\N
ID0469	Magnus Gaarde	\N	\N
ID0471	Tart Workshop	\N	\N
ID0472	Woowahan Brothers	\N	\N
ID0475	Lars Berggren	\N	\N
ID0476	Lasse Fister	\N	\N
ID0483	Joana Correia	\N	\N
ID0484	Hiroki-Chan	\N	\N
ID0487	LV=	\N	\N
ID0489	JetBrains	\N	\N
ID0491	Patric King	\N	\N
ID0500	Greek Font Society	\N	\N
ID0512	The Mozilla Foundation	\N	\N
ID0513	Gary Lonergan	\N	\N
ID0518	Gabriel Lam	\N	\N
ID0525	Braille Institute	\N	\N
ID0527	Nick Shinn	\N	\N
ID0534	Dan Sayers	\N	\N
ID0538	Michael Angeles	\N	\N
ID0544	Dario Manuel Muhafara	\N	\N
ID0545	Riccardo De Franceschi	\N	\N
ID0556	Neapolitan	\N	\N
ID0561	Birgit Pulk	\N	\N
ID0564	Aoife Mooney	\N	\N
ID0565	Santhosh Thottingal	\N	\N
ID0566	Elena Albertoni	\N	\N
ID0570	Brownfox	\N	\N
ID0578	Alfredo Marco Pradil	\N	\N
ID0581	Ashish Kumar	\N	\N
ID0582	Milena BrandÃ£o	\N	\N
ID0585	Open Window	\N	\N
ID0586	Suman Bhandary	\N	\N
ID0587	Capitalics	\N	\N
ID0591	FontFuror	\N	\N
ID0593	Alexandra Korolkova	\N	\N
ID0595	Nidud	\N	\N
ID0603	Pablo Impallari	\N	\N
ID0607	Natalia Raices	\N	\N
ID0610	Mike LaGattuta	\N	\N
ID0611	Denis Jacquerye	\N	\N
ID0624	PolarSys	\N	\N
ID0628	Saber Rastikerdar	\N	\N
ID0630	JIKJISOFT	\N	\N
ID0639	Fontworks Inc.	\N	\N
ID0643	Haley Fiege	\N	\N
ID0645	Dale Sattler	\N	\N
ID0646	Pedro Vergani	\N	\N
ID0655	Jasper de Waard	\N	\N
ID0671	Hypertype	\N	\N
ID0673	Abdullah Aref	\N	\N
ID0677	Li Dawei	\N	\N
ID0679	Pooja Saxena	\N	\N
ID0680	Ben Weiner	\N	\N
ID0685	James Barnard	\N	\N
ID0688	Lettersoup	\N	\N
ID0689	Appaji Ambarisha Darbha	\N	\N
ID0698	Ana Sanfelippo	\N	\N
ID0701	Dan Ross	\N	\N
ID0702	Zheng Qingke	\N	\N
ID0704	Font-Kai	\N	\N
ID0707	Kemie Guaida	\N	\N
ID0712	Dan Rhatigan	\N	\N
ID0714	Mota Italic	\N	\N
ID0716	Carolina Trebol	\N	\N
ID0718	AngÃ©lica DÃ­az	\N	\N
ID0720	Eli Block	\N	\N
ID0722	j. 'mach' wust	\N	\N
ID0723	Constanza Artigas Preller	\N	\N
ID0728	Jason Kottke	\N	\N
ID0732	KB Studio	\N	\N
ID0737	Tall Chai	\N	\N
ID0740	Mercedes JÃ¡uregui	\N	\N
ID0741	artakana	\N	\N
ID0747	Sabrina Mariela Lopez	\N	\N
ID0752	Familjen STHLM AB	\N	\N
ID0760	SMC	\N	\N
ID0764	RubÃ©n Prol	\N	\N
ID0765	FONTRIX	\N	\N
ID0766	Displaay	\N	\N
ID0767	DÆ°Æ¡ng Tráº§n	\N	\N
ID0768	Shantell Martin	\N	\N
ID0772	Onur YazÄ±cÄ±gil	\N	\N
ID0773	Original Type	\N	\N
ID0778	TAE System & Typefaces Co.	\N	\N
ID0779	Dominik JÃ¡ger	\N	\N
ID0786	Saumya Kishore	\N	\N
ID0791	Alejandro Inler	\N	\N
ID0797	Zeynep Akay	\N	\N
ID0799	Designtown	\N	\N
ID0805	Tanukizamurai	\N	\N
ID0806	Wojciech Kalinowski	\N	\N
ID0809	YoonDesign Inc	\N	\N
ID0812	JosÃ© MarÃ­a Ribagorda	\N	\N
ID0816	Black Foundry	\N	\N
ID0819	TypeSETit	\N	\N
ID0821	Tony de Marco	\N	\N
ID0822	Alejandra Rodriguez	\N	\N
ID0826	Typomondo	\N	\N
ID0827	Arrow Type	\N	\N
ID0829	Brenda Gallo	\N	\N
ID0830	NicolÃ¡s Silva	\N	\N
ID0832	Hector Gatti	\N	\N
ID0833	Ma ShanZheng	\N	\N
ID0853	Duarte Pinto	\N	\N
ID0858	Szymon Celej	\N	\N
ID0860	Grayscale	\N	\N
ID0866	Liu Bingke	\N	\N
ID0867	Mariya Lish	\N	\N
ID0870	Lipi Raval	\N	\N
ID0876	Yellow Type	\N	\N
ID0878	GrÃ©gori Vincens	\N	\N
ID0879	Emre Parlak	\N	\N
ID0883	TipTopTyp	\N	\N
ID0887	Tharique Azeez	\N	\N
ID0890	Tipo	\N	\N
ID0899	Lafontype	\N	\N
ID0901	Yanghee Ryu	\N	\N
ID0903	ISIA Urbino	\N	\N
ID0909	JIKJI SOFT	\N	\N
ID0914	Nataliya Kasatkina	\N	\N
ID0933	Nonty	\N	\N
ID0941	Agung Rohmat	\N	\N
ID0946	JIKJI	\N	\N
ID0959	Vaishnavi Murthy	\N	\N
ID0974	AsiaSoft Inc	\N	\N
ID0981	TypoDesign Lab. Inc	\N	\N
ID0995	Haruki Wakamatsu	\N	\N
ID0996	Roman Shamin	\N	\N
ID0997	Lautaro Hourcade	\N	\N
ID1006	Nathan Gross	\N	\N
ID1009	Christopher J. Fynn	\N	\N
ID1011	Grzegorz Klimczewski	\N	\N
ID1012	Liam Spradlin	\N	\N
ID1015	Wei Zhimang	\N	\N
ID1019	Charles Daoud	\N	\N
ID1022	Gustavo Dipre	\N	\N
ID1023	Nermin Kahrimanovic	\N	\N
ID1031	James Puckett	\N	\N
ID1047	Pablo Ugerman	\N	\N
ID1048	Andy Clymer	\N	\N
ID1051	Rony Koch	\N	\N
ID1067	Neil Summerour	\N	\N
ID1081	Gydient	\N	\N
ID1083	Rob Jelinski	\N	\N
ID1093	AsiaSoft Inc.	\N	\N
ID1103	Fernando DÃ­az	\N	\N
ID1105	Carolina Giovagnoli	\N	\N
ID1110	Sergey Steblina	\N	\N
ID1118	Tep Sovichet	\N	\N
ID1122	Yoon Design	\N	\N
ID1123	Naima Ben Ayed	\N	\N
ID1131	Liu Zhengjiang	\N	\N
ID1134	AdÃ¨le Antignac	\N	\N
ID1135	Constanza Artigas	\N	\N
ID1143	Chen Xiaomin	\N	\N
ID1165	Paolo Biagini	\N	\N
ID1166	Woowahan brothers	\N	\N
ID1167	Nur Syamsi	\N	\N
ID1186	Marion Kadi	\N	\N
ID1192	Gumpita Rahayu	\N	\N
ID1201	Alexey Maslov	\N	\N
ID1208	Kousuke Nagai	\N	\N
ID1210	John Harrington	\N	\N
ID1222	Daniel Coull	\N	\N
ID1239	Andreu Balius	\N	\N
ID1265	Octavio Pardo	\N	\N
ID1271	DXKorea Inc	\N	\N
ID1273	AbdElmomen Kadhim (blueMix)	\N	\N
ID1275	Arthur Reinders Folmer	\N	\N
ID1276	Typeland	\N	\N
ID1285	Guillermo Torres	\N	\N
ID1306	Niki Polyocan	\N	\N
ID1309	Helsinki Type Studio	\N	\N
ID1338	Annet Stirling	\N	\N
ID1397	Shibuya Font	\N	\N
\.


--
-- Data for Name: glyph; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.glyph (glyphid, styleid, typefaceid, category, glyph) FROM stdin;
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (languageid, name, continent) FROM stdin;
LANG0000	Abron	Africa
LANG0001	Acoli	Africa
LANG0002	Adangme	Africa
LANG0003	Afar	Africa
LANG0004	Afrikaans	Africa
LANG0005	Aghem	Africa
LANG0006	Aja	Africa
LANG0007	Akan	Africa
LANG0008	Akoose	Africa
LANG0009	Amo	Africa
LANG0010	Angika	Africa
LANG0011	Asu	Africa
LANG0012	Atsam	Africa
LANG0013	Bafia	Africa
LANG0014	Bafut	Africa
LANG0015	Balanta-Ganja	Africa
LANG0016	Bambara	Africa
LANG0017	Bamun, Latin	Africa
LANG0018	BaoulÃ©	Africa
LANG0019	Bari	Africa
LANG0020	Basaa	Africa
LANG0021	Bassari	Africa
LANG0022	Belanda Viri, Latin	Africa
LANG0023	Bemba	Africa
LANG0024	Bena	Africa
LANG0025	Bhojpuri	Africa
LANG0026	Bini	Africa
LANG0027	Bomu	Africa
LANG0028	Bube	Africa
LANG0029	Bulu	Africa
LANG0030	Bushi	Africa
LANG0031	Cebaara Senoufo	Africa
LANG0032	Central Atlas Tamazight	Africa
LANG0033	Central-Eastern Niger Fulfulde	Africa
LANG0034	Chiga	Africa
LANG0035	Chokwe	Africa
LANG0036	Comorian, Latin	Africa
LANG0037	Comorian, Ngazidja	Africa
LANG0038	Crioulo, Upper Guinea	Africa
LANG0039	Cwi Bwamu, Latin	Africa
LANG0040	Dagaare, Southern	Africa
LANG0041	Dagbani	Africa
LANG0042	Dan	Africa
LANG0043	Dendi	Africa
LANG0044	Ditammari	Africa
LANG0045	Duala	Africa
LANG0046	Dyula	Africa
LANG0047	Eastern Gurung	Africa
LANG0048	Efik	Africa
LANG0049	Embu	Africa
LANG0050	English	Africa
LANG0051	Ewe	Africa
LANG0052	Ewondo	Africa
LANG0053	Fang	Africa
LANG0054	Fon	Africa
LANG0055	Frafra	Africa
LANG0056	French	Africa
LANG0057	Fulah	Africa
LANG0058	Fur	Africa
LANG0059	Ga	Africa
LANG0060	Ganda	Africa
LANG0061	German	Africa
LANG0062	Ghomala	Africa
LANG0063	Gusii	Africa
LANG0064	Hassaniyya	Africa
LANG0065	Hausa	Africa
LANG0066	Herero	Africa
LANG0067	Hindi	Africa
LANG0068	Ibibio	Africa
LANG0069	IfÃ¨	Africa
LANG0070	Igbo	Africa
LANG0071	Jenaama Bozo	Africa
LANG0072	Jju	Africa
LANG0073	Jola-Fonyi	Africa
LANG0074	KabiyÃ©	Africa
LANG0075	Kabuverdianu	Africa
LANG0076	Kabyle	Africa
LANG0077	Kako	Africa
LANG0078	Kalanga	Africa
LANG0079	Kalenjin	Africa
LANG0080	Kamba	Africa
LANG0081	Kanuri, Central	Africa
LANG0082	Kashmiri, Devanagari	Africa
LANG0083	Kikuyu	Africa
LANG0084	Kimbundu	Africa
LANG0085	Kinyarwanda	Africa
LANG0086	Kita Maninkakan	Africa
LANG0087	Kom	Africa
LANG0088	Kongo	Africa
LANG0089	Koro	Africa
LANG0090	Koro Wachi	Africa
LANG0091	Koyra Chiini	Africa
LANG0092	Koyraboro Senni	Africa
LANG0093	Kpelle	Africa
LANG0094	Kpelle, Guinea	Africa
LANG0095	Krio	Africa
LANG0096	Kuanyama	Africa
LANG0097	Kwasio	Africa
LANG0098	Lamnso'	Africa
LANG0099	Langi	Africa
LANG0100	Lango [Uganda]	Africa
LANG0101	Lingala	Africa
LANG0102	Lomwe	Africa
LANG0103	Lozi	Africa
LANG0104	Luba-Katanga	Africa
LANG0105	Luba-Lulua	Africa
LANG0106	Luo	Africa
LANG0107	Luyia	Africa
LANG0108	Maasina Fulfulde	Africa
LANG0109	Machame	Africa
LANG0110	Mafa	Africa
LANG0111	Makhuwa	Africa
LANG0112	Makhuwa-Meetto	Africa
LANG0113	Makonde	Africa
LANG0114	Malagasy	Africa
LANG0115	Malay, Latin	Africa
LANG0116	Mandingo	Africa
LANG0117	Mandjak	Africa
LANG0118	Maninkakan, Eastern	Africa
LANG0119	Mankanya	Africa
LANG0120	Manyika	Africa
LANG0121	Masaaba	Africa
LANG0122	Masai	Africa
LANG0123	Masalit	Africa
LANG0124	Mauritian Creole	Africa
LANG0125	Mbunga	Africa
LANG0126	Medumba	Africa
LANG0127	Mende	Africa
LANG0128	MÃ©nik	Africa
LANG0129	Meru	Africa
LANG0130	Metaâ€™	Africa
LANG0131	Moba	Africa
LANG0132	Modern Greek	Africa
LANG0133	Mongo	Africa
LANG0134	Mossi	Africa
LANG0135	Munda, Devanagari	Africa
LANG0136	Mundang	Africa
LANG0137	Nama	Africa
LANG0138	Ndau	Africa
LANG0139	Ndonga	Africa
LANG0140	Ngiemboon	Africa
LANG0141	Ngomba	Africa
LANG0142	Nigerian Fulfulde	Africa
LANG0143	Nigerian Pidgin	Africa
LANG0144	Noon	Africa
LANG0145	North Ndebele	Africa
LANG0146	Northern Sotho	Africa
LANG0147	Nuer	Africa
LANG0148	Nyamwezi	Africa
LANG0149	Nyanja	Africa
LANG0150	Nyankole	Africa
LANG0151	Nyasa Tonga	Africa
LANG0152	Nzima	Africa
LANG0153	Oromo	Africa
LANG0154	Otuho	Africa
LANG0155	PÃ¶koot	Africa
LANG0156	Portuguese	Africa
LANG0157	Pulaar	Africa
LANG0158	Pular	Africa
LANG0159	Punu	Africa
LANG0160	RÃ©union Creole French	Africa
LANG0161	Riffian (Latin)	Africa
LANG0162	Rombo	Africa
LANG0163	Ronga	Africa
LANG0164	Rundi	Africa
LANG0165	Rwa	Africa
LANG0166	Saafi-Saafi	Africa
LANG0167	Safaliba	Africa
LANG0168	Saho	Africa
LANG0169	Samburu	Africa
LANG0170	Sango	Africa
LANG0171	Sangu	Africa
LANG0172	Sena	Africa
LANG0173	Serer	Africa
LANG0174	Seselwa Creole French	Africa
LANG0175	Shambala	Africa
LANG0176	Shilluk	Africa
LANG0177	Shona	Africa
LANG0178	Sidamo	Africa
LANG0179	Soga	Africa
LANG0180	Somali	Africa
LANG0181	Soninke	Africa
LANG0182	South Ndebele	Africa
LANG0183	Southern Sotho	Africa
LANG0184	Southwestern Tamang	Africa
LANG0185	Spanish	Africa
LANG0186	Sukuma	Africa
LANG0187	Susu	Africa
LANG0188	Swahili	Africa
LANG0189	Swati	Africa
LANG0190	Tachelhit (Latin)	Africa
LANG0191	Taita	Africa
LANG0192	Tamashek	Africa
LANG0193	Tamasheq, Latin	Africa
LANG0194	Tasawaq	Africa
LANG0195	Tem	Africa
LANG0196	Teso	Africa
LANG0197	Timne	Africa
LANG0198	Tiv	Africa
LANG0199	Tomo Kan Dogon	Africa
LANG0200	Tooro	Africa
LANG0201	Tsonga	Africa
LANG0202	Tswana	Africa
LANG0203	Tumbuka	Africa
LANG0204	Tyap	Africa
LANG0205	Umbundu	Africa
LANG0206	Vai (Latin)	Africa
LANG0207	Venda	Africa
LANG0208	Vunjo	Africa
LANG0209	Waama	Africa
LANG0210	Wolof	Africa
LANG0211	Xaasongaxango	Africa
LANG0212	Xhosa	Africa
LANG0213	Yangben	Africa
LANG0214	Yao	Africa
LANG0215	Yemba	Africa
LANG0216	Yoruba	Africa
LANG0217	Zaghawa	Africa
LANG0218	Zarma	Africa
LANG0219	Zulu	Africa
LANG0220	Achuar-Shiwiar, Latin, Ecuador	Americas
LANG0221	Aguaruna	Americas
LANG0222	Alabama	Americas
LANG0223	Aleut	Americas
LANG0224	Amahuaca	Americas
LANG0225	Amarakaeri	Americas
LANG0226	Amis	Americas
LANG0227	Arabela	Americas
LANG0228	Araona	Americas
LANG0229	Arapaho	Americas
LANG0230	Aromanian	Americas
LANG0231	AshÃ¡ninka	Americas
LANG0232	AshÃ©ninka, Pichis	Americas
LANG0233	Atikamekw	Americas
LANG0234	Awa-Cuaiquer	Americas
LANG0235	Aymara	Americas
LANG0236	Bora	Americas
LANG0237	Caddo	Americas
LANG0238	Cajun French	Americas
LANG0239	Candoshi-Shapra	Americas
LANG0240	Caquinte	Americas
LANG0241	Cashibo-Cacataibo	Americas
LANG0242	Cashinahua	Americas
LANG0243	Central Alaskan Yupik	Americas
LANG0244	Central Huasteca Nahuatl	Americas
LANG0245	Central Mazahua	Americas
LANG0246	Chachi	Americas
LANG0247	Chayahuita	Americas
LANG0248	Chickasaw	Americas
LANG0249	Chimborazo Highland Quichua	Americas
LANG0250	Chin, Falam	Americas
LANG0251	Chin, Haka	Americas
LANG0252	Chin, Matu	Americas
LANG0253	Chinantec, Chiltepec	Americas
LANG0254	Chinantec, OjitlÃ¡n	Americas
LANG0255	Chipewyan	Americas
LANG0256	Choctaw	Americas
LANG0257	CofÃ¡n, Latin	Americas
LANG0258	Colorado	Americas
LANG0259	Crioulo, Upper Guinea	Americas
LANG0260	Dakota	Americas
LANG0261	Danish	Americas
LANG0262	Dinka, Northeastern	Americas
LANG0263	Dogrib	Americas
LANG0264	Drung	Americas
LANG0265	Dutch	Americas
LANG0266	Eastern Huasteca Nahuatl	Americas
LANG0267	English	Americas
LANG0268	Epena, Latin	Americas
LANG0269	Ese Ejja	Americas
LANG0270	Filipino	Americas
LANG0271	Finnish, Kven	Americas
LANG0272	French	Americas
LANG0273	Garifuna	Americas
LANG0274	German	Americas
LANG0275	Guadeloupean Creole French, Latin, Martinique	Americas
LANG0276	GuajajÃ¡ra	Americas
LANG0277	Guarani	Americas
LANG0278	Guarayu	Americas
LANG0279	Guianese Creole French	Americas
LANG0280	GwichÊ¼in	Americas
LANG0281	Haitian Creole	Americas
LANG0282	Hani	Americas
LANG0283	Hawaiian	Americas
LANG0284	Hindustani, Sarnami	Americas
LANG0285	Hmong, Northern Qiandong	Americas
LANG0286	Hmong, Southern Qiandong	Americas
LANG0287	Huastec, San LuÃ­s PotosÃ­	Americas
LANG0288	Huitoto, Murui	Americas
LANG0289	Ijo, Southeast	Americas
LANG0290	Innu	Americas
LANG0291	Inuinnaqtun	Americas
LANG0292	Inuktitut (Latin)	Americas
LANG0293	Inupiaq	Americas
LANG0294	Italian	Americas
LANG0295	Jamaican Creole English	Americas
LANG0296	Kaingang	Americas
LANG0297	Kalaallisut	Americas
LANG0298	Kaonde	Americas
LANG0299	Kaqchikel, Central	Americas
LANG0300	Kituba	Americas
LANG0301	Konjo	Americas
LANG0302	Kulango, Bouna	Americas
LANG0303	KÊ¼icheÊ¼	Americas
LANG0304	Lakota	Americas
LANG0305	Lobi	Americas
LANG0306	Lunda	Americas
LANG0307	Lushootseed	Americas
LANG0308	Luvale	Americas
LANG0309	Mam, Northern	Americas
LANG0310	Mapuche	Americas
LANG0311	MatsÃ©s, Latin, Peru	Americas
LANG0312	Mazatec, IxcatlÃ¡n	Americas
LANG0313	Mi'kmaq	Americas
LANG0314	Mina	Americas
LANG0315	MÃ­skito	Americas
LANG0316	Mixe, Totontepec	Americas
LANG0317	Mixtec, MetlatÃ³noc	Americas
LANG0318	Mohawk	Americas
LANG0319	Moro	Americas
LANG0320	Mozarabic	Americas
LANG0321	Muscogee	Americas
LANG0322	Nahuatl, Central	Americas
LANG0323	Navajo	Americas
LANG0324	Nheengatu	Americas
LANG0325	Nomatsiguenga	Americas
LANG0326	North Slavey	Americas
LANG0327	Nyemba	Americas
LANG0328	Okiek	Americas
LANG0329	Oroqen	Americas
LANG0330	Otomi, Mezquital	Americas
LANG0331	Otuho	Americas
LANG0332	PÃ¡ez	Americas
LANG0333	Papiamento	Americas
LANG0334	Pennsylvania German	Americas
LANG0335	Pijin	Americas
LANG0336	Pintupi-Luritja	Americas
LANG0337	Pipil	Americas
LANG0338	Plautdietsch	Americas
LANG0339	Portuguese	Americas
LANG0340	Purepecha	Americas
LANG0341	Q'eqchi'	Americas
LANG0342	Quechua	Americas
LANG0343	Quechua, Ambo-Pasco	Americas
LANG0344	Quechua, Arequipa-La UniÃ³n	Americas
LANG0345	Quechua, Ayacucho	Americas
LANG0346	Quechua, Cajamarca	Americas
LANG0347	Quechua, Cusco	Americas
LANG0348	Quechua, HuamalÃ­es-Dos de Mayo HuÃ¡nuco	Americas
LANG0349	Quechua, Huaylas Ancash	Americas
LANG0350	Quechua, Margos-Yarowilca-Lauricocha	Americas
LANG0351	Quechua, North JunÃ­n	Americas
LANG0352	Quechua, Northern Conchucos Ancash	Americas
LANG0353	Quechua, South Bolivian	Americas
LANG0354	Quechua, Unified Quichua, old Hispanic orthography	Americas
LANG0355	Russian	Americas
LANG0356	Saint Lucian Creole French, Latin	Americas
LANG0357	Salar	Americas
LANG0358	SÃ£otomense	Americas
LANG0359	Secoya	Americas
LANG0360	Seri	Americas
LANG0361	Sharanahua	Americas
LANG0362	Shipibo-Conibo	Americas
LANG0363	Shuar, Latin, Ecuador	Americas
LANG0364	Siona	Americas
LANG0365	Slave	Americas
LANG0366	Spanish	Americas
LANG0367	Sranan Tongo	Americas
LANG0368	Straits Salish, Latin	Americas
LANG0369	Tenango Otomi, Latin	Americas
LANG0370	Tetun Dili	Americas
LANG0371	Ticuna	Americas
LANG0372	Toba	Americas
LANG0373	Tojolabal	Americas
LANG0374	Tonga	Americas
LANG0375	Totonac, Papantla	Americas
LANG0376	Tzeltal, Oxchuc	Americas
LANG0377	Tzotzil, Chamula	Americas
LANG0378	Uduk	Americas
LANG0379	Urarina	Americas
LANG0380	Vietnamese	Americas
LANG0381	Virgin Islands Creole English	Americas
LANG0382	Waorani, Latin, Ecuador	Americas
LANG0383	Wayuu	Americas
LANG0384	Welsh	Americas
LANG0385	Western Huasteca Nahuatl	Americas
LANG0386	XavÃ¡nte	Americas
LANG0387	Yagua	Americas
LANG0388	YaneshaÊ¼	Americas
LANG0389	YanomamÃ¶	Americas
LANG0390	Yucateco	Americas
LANG0391	ZÃ¡paro	Americas
LANG0392	Zapotec, GÃ¼ilÃ¡	Americas
LANG0393	Zapotec, MiahuatlÃ¡n	Americas
LANG0394	Abkhazian	Asia
LANG0395	Achinese	Asia
LANG0396	Adyghe	Asia
LANG0397	Albanian	Asia
LANG0398	Angika	Asia
LANG0399	Ao Naga	Asia
LANG0400	Assyrian Neo-Aramaic, Latin	Asia
LANG0401	Awadhi	Asia
LANG0402	Azerbaijani	Asia
LANG0403	Azerbaijani (Cyrillic)	Asia
LANG0404	Azerbaijani, North, Cyrillic	Asia
LANG0405	Bagheli	Asia
LANG0406	Balinese	Asia
LANG0407	Balkan Gagauz Turkish	Asia
LANG0408	Banjar	Asia
LANG0409	Bantawa	Asia
LANG0410	Batak Toba	Asia
LANG0411	Bateri	Asia
LANG0412	Betawi	Asia
LANG0413	Bhilali	Asia
LANG0414	Bhili	Asia
LANG0415	Bhojpuri	Asia
LANG0416	Bhujel, Devanagari	Asia
LANG0417	Bikol	Asia
LANG0418	Bodo	Asia
LANG0419	Bodo, Latin	Asia
LANG0420	Brahui, Latin	Asia
LANG0421	Braj	Asia
LANG0422	Buginese	Asia
LANG0423	Buhid	Asia
LANG0424	Bulgarian	Asia
LANG0425	Camling, Devanagari	Asia
LANG0426	Capiznon	Asia
LANG0427	Cebuano	Asia
LANG0428	Central Dusun	Asia
LANG0429	Chantyal, Devanagari	Asia
LANG0430	Chavacano, Latin, Philippines	Asia
LANG0431	Chhattisgarhi	Asia
LANG0432	Cuyonon, Latin	Asia
LANG0433	Dangaura Tharu	Asia
LANG0434	Dhanwar, Nepal, Devanagari	Asia
LANG0435	Dhimal, Devanagari	Asia
LANG0436	Dimli	Asia
LANG0437	Dogri	Asia
LANG0438	Dotyali	Asia
LANG0439	Eastern Gurung	Asia
LANG0440	Eastern Magar	Asia
LANG0441	Eastern Tamang	Asia
LANG0442	English	Asia
LANG0443	Filipino	Asia
LANG0444	French	Asia
LANG0445	Galo, Latin	Asia
LANG0446	Gamale Kham, Devanagari	Asia
LANG0447	Garhwali	Asia
LANG0448	Gayo	Asia
LANG0449	Gelao, Klau	Asia
LANG0450	German	Asia
LANG0451	Goan Konkani	Asia
LANG0452	Gondi	Asia
LANG0453	Gorontalo	Asia
LANG0454	Gujari, Devanagari	Asia
LANG0455	Gurung	Asia
LANG0456	Hadothi	Asia
LANG0457	Hanunoo	Asia
LANG0458	Haryanvi	Asia
LANG0459	Hiligaynon	Asia
LANG0460	Hindi	Asia
LANG0461	Hindi (Latin)	Asia
LANG0462	Hmong Njua	Asia
LANG0463	Ho	Asia
LANG0464	Hungarian	Asia
LANG0465	Iban	Asia
LANG0466	Iloko	Asia
LANG0467	Indonesian	Asia
LANG0468	Jarai, Latin	Asia
LANG0469	Javanese	Asia
LANG0470	Jumli	Asia
LANG0471	Kabardian	Asia
LANG0472	Kachhi	Asia
LANG0473	Kachin	Asia
LANG0474	Kanauji	Asia
LANG0475	Kangri	Asia
LANG0476	Kara-Kalpak	Asia
LANG0477	Kashmiri, Devanagari	Asia
LANG0478	Kathoriya Tharu	Asia
LANG0479	Kazakh	Asia
LANG0480	Kazakh, Latin	Asia
LANG0481	Kerinci	Asia
LANG0482	Khandesi	Asia
LANG0483	Kharia, Devanagari	Asia
LANG0484	Khasi	Asia
LANG0485	Khowar, Latin	Asia
LANG0486	Kinaray-a	Asia
LANG0487	Kirmanjki	Asia
LANG0488	Kochila Tharu	Asia
LANG0489	Komering	Asia
LANG0490	Konkani	Asia
LANG0491	Kumaoni	Asia
LANG0492	Kurdish	Asia
LANG0493	Kurdish, Latin	Asia
LANG0494	Kurukh	Asia
LANG0495	Kyrgyz	Asia
LANG0496	Kyrgyz (Latin)	Asia
LANG0497	Ladino, Latin	Asia
LANG0498	Lampung Api	Asia
LANG0499	Lhomi, Devanagari	Asia
LANG0500	Limbu	Asia
LANG0501	Madurese	Asia
LANG0502	Magahi	Asia
LANG0503	Maguindanaon	Asia
LANG0504	Maithili	Asia
LANG0505	Makasar	Asia
LANG0506	Malay	Asia
LANG0507	Mandar	Asia
LANG0508	Maranao, Latin	Asia
LANG0509	Marathi	Asia
LANG0510	Marwari	Asia
LANG0511	Mentawai	Asia
LANG0512	Mewari	Asia
LANG0513	Mewati	Asia
LANG0514	Minangkabau	Asia
LANG0515	Mizo, Latin	Asia
LANG0516	Modern Greek	Asia
LANG0517	Mongolian	Asia
LANG0518	Mru	Asia
LANG0519	Munda, Devanagari	Asia
LANG0520	Mundari (Devanagari)	Asia
LANG0521	Musi, Latin	Asia
LANG0522	Muslim Tat	Asia
LANG0523	Naxi	Asia
LANG0524	Negeri Sembilan Malay	Asia
LANG0525	Nepali	Asia
LANG0526	Newari	Asia
LANG0527	Ngaju	Asia
LANG0528	Nimadi	Asia
LANG0529	Ossetic	Asia
LANG0530	Paite Chin, Latin	Asia
LANG0531	Pampanga	Asia
LANG0532	Pangasinan	Asia
LANG0533	Polish	Asia
LANG0534	Portuguese	Asia
LANG0535	Rajasthani	Asia
LANG0536	Rajbanshi	Asia
LANG0537	Rana Tharu	Asia
LANG0538	Rejang	Asia
LANG0539	Riang [India]	Asia
LANG0540	Rinconada Bikol	Asia
LANG0541	Rohingya, Latin	Asia
LANG0542	Romanian	Asia
LANG0543	Russian	Asia
LANG0544	Sadri	Asia
LANG0545	Sangir	Asia
LANG0546	Sanskrit	Asia
LANG0547	Santali, Devanagari	Asia
LANG0548	Sasak	Asia
LANG0549	Selayar	Asia
LANG0550	Serbian (Latin)	Asia
LANG0551	Shekhawati	Asia
LANG0552	Sherpa	Asia
LANG0553	Sindhi (Devanagari)	Asia
LANG0554	Sirmauri	Asia
LANG0555	Southern Tujia	Asia
LANG0556	Southwestern Tamang	Asia
LANG0557	Spanish	Asia
LANG0558	Sundanese	Asia
LANG0559	Tae'	Asia
LANG0560	Tagbanwa	Asia
LANG0561	Tajik	Asia
LANG0562	Tajik, Latin	Asia
LANG0563	Talysh, Latin	Asia
LANG0564	Taroko	Asia
LANG0565	Tausug	Asia
LANG0566	Tedim Chin	Asia
LANG0567	Tetum	Asia
LANG0568	Thakali, Devanagari	Asia
LANG0569	Thangmi, Devanagari	Asia
LANG0570	Thulung	Asia
LANG0571	Tolaki	Asia
LANG0572	Tsakhur	Asia
LANG0573	Turkish	Asia
LANG0574	Turkmen, Cyrillic	Asia
LANG0575	Turkmen, Latin	Asia
LANG0576	Turoyo	Asia
LANG0577	Uab Meto	Asia
LANG0578	Uyghur (Cyrillic)	Asia
LANG0579	Uyghur, Latin	Asia
LANG0580	Uzbek	Asia
LANG0581	Uzbek (Cyrillic)	Asia
LANG0582	Vietnamese	Asia
LANG0583	Wagdi	Asia
LANG0584	Wancho Naga, Devanagari	Asia
LANG0585	Wancho Naga, Latin	Asia
LANG0586	Waray	Asia
LANG0587	West Albay Bikol	Asia
LANG0588	Western Magar	Asia
LANG0589	Western Tamang	Asia
LANG0590	Yakha, Devanagari	Asia
LANG0591	Zhuang	Asia
LANG0592	Adyghe	Europe
LANG0593	Albanian	Europe
LANG0594	Aragonese	Europe
LANG0595	Arpitan	Europe
LANG0596	Asturian	Europe
LANG0597	Avaric	Europe
LANG0598	Azerbaijani (Cyrillic)	Europe
LANG0599	Bashkir	Europe
LANG0600	Bashkir, Latin	Europe
LANG0601	Basque	Europe
LANG0602	Bavarian	Europe
LANG0603	Belarusian	Europe
LANG0604	Belarusian, Latin	Europe
LANG0605	Bosnian	Europe
LANG0606	Bosnian (Cyrillic)	Europe
LANG0607	Breton	Europe
LANG0608	Bulgarian	Europe
LANG0609	Catalan	Europe
LANG0610	Chechen	Europe
LANG0611	Church Slavic	Europe
LANG0612	Chuvash	Europe
LANG0613	Colognian	Europe
LANG0614	Cornish	Europe
LANG0615	Corsican	Europe
LANG0616	Crimean Turkish	Europe
LANG0617	Crimean Turkish	Europe
LANG0618	Croatian	Europe
LANG0619	Czech	Europe
LANG0620	Danish	Europe
LANG0621	Dargwa	Europe
LANG0622	Dutch	Europe
LANG0623	Eastern Frisian	Europe
LANG0624	Emilian	Europe
LANG0625	English	Europe
LANG0626	Erzya	Europe
LANG0627	Esperanto	Europe
LANG0628	Estonian	Europe
LANG0629	Even	Europe
LANG0630	Evenki	Europe
LANG0631	Extremaduran	Europe
LANG0632	Faroese	Europe
LANG0633	Finnish	Europe
LANG0634	French	Europe
LANG0635	Friulian	Europe
LANG0636	Gagauz	Europe
LANG0637	Gagauz, Cyrillic	Europe
LANG0638	Galician	Europe
LANG0639	German	Europe
LANG0640	Gheg Albanian	Europe
LANG0641	Gronings	Europe
LANG0642	Hungarian	Europe
LANG0643	Icelandic	Europe
LANG0644	Inari Sami	Europe
LANG0645	Indonesian	Europe
LANG0646	Ingrian	Europe
LANG0647	Ingush	Europe
LANG0648	Interlingua	Europe
LANG0649	Irish	Europe
LANG0650	Italian	Europe
LANG0651	JÃ¨rriais, Latin	Europe
LANG0652	Jutish	Europe
LANG0653	Kabardian	Europe
LANG0654	Kalaallisut	Europe
LANG0655	Kalo Finnish Romani	Europe
LANG0656	Karachay-Balkar	Europe
LANG0657	Karelian	Europe
LANG0658	Kashubian	Europe
LANG0659	Khakas	Europe
LANG0660	Komi	Europe
LANG0661	Komi-Permyak	Europe
LANG0662	Kumyk	Europe
LANG0663	Kurdish	Europe
LANG0664	Ladin	Europe
LANG0665	Lak	Europe
LANG0666	Latgalian	Europe
LANG0667	Latin	Europe
LANG0668	Latvian	Europe
LANG0669	Lezghian	Europe
LANG0670	Ligurian	Europe
LANG0671	Limburgish	Europe
LANG0672	Lithuanian	Europe
LANG0673	Livonian	Europe
LANG0674	Lombard	Europe
LANG0675	Low German	Europe
LANG0676	Lower Silesian	Europe
LANG0677	Lower Sorbian	Europe
LANG0678	Lule Sami	Europe
LANG0679	Luxembourgish	Europe
LANG0680	Macedonian	Europe
LANG0681	Main-Franconian	Europe
LANG0682	Maltese	Europe
LANG0683	Manx	Europe
LANG0684	Mari	Europe
LANG0685	Middle High German	Europe
LANG0686	Modern Greek	Europe
LANG0687	Moksha	Europe
LANG0688	Mongolian	Europe
LANG0689	Nanai	Europe
LANG0690	Neapolitan	Europe
LANG0691	Nenets	Europe
LANG0692	Nganasan	Europe
LANG0693	Northern Frisian	Europe
LANG0694	Northern Sami	Europe
LANG0695	Norwegian BokmÃ¥l	Europe
LANG0696	Norwegian Nynorsk	Europe
LANG0697	Occitan	Europe
LANG0698	Old English	Europe
LANG0699	Old French	Europe
LANG0700	Old High German	Europe
LANG0701	Old Irish	Europe
LANG0702	Old Norse, Latin, Sweden	Europe
LANG0703	Old ProvenÃ§al	Europe
LANG0704	Old Russian, Cyrillic	Europe
LANG0705	Old Welsh, Latin	Europe
LANG0706	Orok	Europe
LANG0707	Ossetic	Europe
LANG0708	Palatine German	Europe
LANG0709	Picard	Europe
LANG0710	Piedmontese	Europe
LANG0711	Polish	Europe
LANG0712	Pontic	Europe
LANG0713	Portuguese	Europe
LANG0714	Riffian (Latin)	Europe
LANG0715	Romagnol	Europe
LANG0716	Romanian	Europe
LANG0717	Romanian, Cyrillic	Europe
LANG0718	Romansh	Europe
LANG0719	Russian	Europe
LANG0720	Russian Buriat	Europe
LANG0721	Rusyn	Europe
LANG0722	Sakha	Europe
LANG0723	Samogitian	Europe
LANG0724	Sardinian	Europe
LANG0725	Sassarese Sardinian	Europe
LANG0726	Saterland Frisian	Europe
LANG0727	Scots	Europe
LANG0728	Scottish Gaelic	Europe
LANG0729	Serbian	Europe
LANG0730	Serbian (Latin)	Europe
LANG0731	Shor	Europe
LANG0732	Sicilian	Europe
LANG0733	Silesian	Europe
LANG0734	Sinte Romani	Europe
LANG0735	Skolt Sami	Europe
LANG0736	Slovak	Europe
LANG0737	Slovenian	Europe
LANG0738	Southern Altai	Europe
LANG0739	Southern Sami	Europe
LANG0740	Spanish	Europe
LANG0741	Swabian	Europe
LANG0742	Swedish	Europe
LANG0743	Swiss German	Europe
LANG0744	Tatar	Europe
LANG0745	Tatar, Latin	Europe
LANG0746	Tavringer Romani	Europe
LANG0747	Tornedalen Finnish	Europe
LANG0748	Tsakonian	Europe
LANG0749	Turkish	Europe
LANG0750	Tuvinian	Europe
LANG0751	Udmurt	Europe
LANG0752	Ukrainian	Europe
LANG0753	Uncoded languages, Latin, World	Europe
LANG0754	Upper Sorbian	Europe
LANG0755	Venetian	Europe
LANG0756	Veps	Europe
LANG0757	VÃµro	Europe
LANG0758	Votic	Europe
LANG0759	Walloon	Europe
LANG0760	Walser	Europe
LANG0761	Welsh	Europe
LANG0762	West Flemish	Europe
LANG0763	Western Frisian	Europe
LANG0764	Western Mari	Europe
LANG0765	Yukaghir, Northern	Europe
LANG0766	Zeelandic	Europe
LANG0767	Angika	Oceania
LANG0768	Bislama	Oceania
LANG0769	Chamorro	Oceania
LANG0770	Chuukese	Oceania
LANG0771	Cook Islands Maori	Oceania
LANG0772	East Futuna	Oceania
LANG0773	Eastern Gurung	Oceania
LANG0774	English	Oceania
LANG0775	Fiji Hindi	Oceania
LANG0776	Fijian	Oceania
LANG0777	French	Oceania
LANG0778	Gilbertese	Oceania
LANG0779	Hindi	Oceania
LANG0780	Hiri Motu	Oceania
LANG0781	Italian	Oceania
LANG0782	Kashmiri, Devanagari	Oceania
LANG0783	Kosraean	Oceania
LANG0784	Maori	Oceania
LANG0785	Marshallese	Oceania
LANG0786	Munda, Devanagari	Oceania
LANG0787	Nauru	Oceania
LANG0788	Niuean	Oceania
LANG0789	Palauan	Oceania
LANG0790	Pohnpeian	Oceania
LANG0791	Rapa, Latin	Oceania
LANG0792	Rotuman	Oceania
LANG0793	Roviana	Oceania
LANG0794	Samoan	Oceania
LANG0795	Southwestern Tamang	Oceania
LANG0796	Tahitian	Oceania
LANG0797	Tiwi, Latin	Oceania
LANG0798	Tok Pisin	Oceania
LANG0799	Tokelau	Oceania
LANG0800	Tongan	Oceania
LANG0801	Tuvalu	Oceania
LANG0802	Ulithian	Oceania
LANG0803	Wallisian	Oceania
LANG0804	Warlpiri	Oceania
LANG0805	Yapese	Oceania
\.


--
-- Data for Name: license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.license (licenseid, name, description) FROM stdin;
\.


--
-- Data for Name: styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.styles (styleid, typefaceid, name, slant, weight) FROM stdin;
\.


--
-- Data for Name: typeface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeface (typefaceid, name, description, authorid, licenseid, usagedetails, webusage) FROM stdin;
TYPE00001	Roboto	\N	ID0001	\N	67500000000	600000000
TYPE00002	Noto Serif Khitan Small Script	\N	ID0002	\N	832000	480
TYPE00003	Lugrasimo	\N	ID0003	\N	778000	520
TYPE00004	Lumanosimo	\N	ID0003	\N	757000	520
TYPE00005	Open Sans	\N	ID0005	\N	27000000000	100000000
TYPE00006	Noto Sans Japanese	\N	ID0002	\N	18100000000	200000000
TYPE00007	Lunasima	\N	ID0003	\N	720000	490
TYPE00008	Montserrat	\N	ID0008	\N	9640000000	17000000
TYPE00009	Lato	\N	\N	\N	8119999999	21000000
TYPE00010	Poppins	\N	ID0010	\N	7820000000	11000000
TYPE00011	Tektur	\N	ID0011	\N	811000	500
TYPE00012	Roboto Condensed	\N	ID0001	\N	4320000000	5000000
TYPE00013	Noto Sans Cypro Minoan	\N	ID0002	\N	670000	490
TYPE00014	Victor Mono	\N	ID0014	\N	959000	510
TYPE00015	Inter	\N	ID0015	\N	3660000000	920000
TYPE00016	Roboto Mono	\N	ID0001	\N	3290000000	480000
TYPE00017	Oswald	\N	ID0017	\N	2890000000	4700000
TYPE00018	Raleway	\N	ID0018	\N	2450000000	6300000
TYPE00019	Noto Sans	\N	ID0002	\N	2320000000	3600000
TYPE00020	Noto Sans Syriac Eastern	\N	ID0002	\N	323000	470
TYPE00021	Nunito Sans	\N	ID0017	\N	1610000000	1700000
TYPE00022	Playfair Display	\N	ID0022	\N	1490000000	3900000
TYPE00023	Roboto Slab	\N	ID0001	\N	1530000000	8000000
TYPE00024	Nunito	\N	ID0017	\N	1510000000	2900000
TYPE00025	Rubik	\N	ID0025	\N	1490000000	1300000
TYPE00026	Ubuntu	\N	ID0026	\N	1530000000	6800000
TYPE00027	Merriweather	\N	ID0027	\N	1370000000	3200000
TYPE00028	PT Sans	\N	ID0028	\N	1240000000	4100000
TYPE00029	Noto Sans Korean	\N	ID0002	\N	1110000000	280000
TYPE00030	Work Sans	\N	ID0030	\N	1010000000	990000
TYPE00031	VT323	\N	ID0031	\N	549000000	94000
TYPE00032	Kanit	\N	ID0032	\N	1050000000	320000
TYPE00033	Noto Sans Traditional Chinese	\N	ID0002	\N	860000000	850000
TYPE00034	Lora	\N	ID0034	\N	869000000	2300000
TYPE00035	Quicksand	\N	ID0035	\N	726000000	1700000
TYPE00036	Fira Sans	\N	ID0036	\N	789000000	3700000
TYPE00037	Mukta	\N	ID0037	\N	759000000	1500000
TYPE00038	Pangolin	\N	ID0038	\N	550000000	24000
TYPE00039	Barlow	\N	ID0039	\N	671000000	670000
TYPE00040	DM Sans	\N	ID0040	\N	596000000	330000
TYPE00041	Ysabeau Office	\N	ID0041	\N	685000	2100
TYPE00042	Ysabeau Infant	\N	ID0041	\N	638000	2100
TYPE00043	Heebo	\N	ID0043	\N	588000000	6100000
TYPE00044	PT Serif	\N	ID0028	\N	585000000	1300000
TYPE00045	Mulish	\N	ID0017	\N	594000000	130000
TYPE00046	Manrope	\N	ID0046	\N	525000000	200000
TYPE00047	Narnoor	\N	ID0047	\N	1640000	4400
TYPE00048	Titillium Web	\N	ID0048	\N	525000000	800000
TYPE00049	IBM Plex Sans	\N	ID0049	\N	467000000	400000
TYPE00050	Noto Serif	\N	ID0002	\N	484000000	1000000
TYPE00051	Libre Franklin	\N	ID0051	\N	475000000	1200000
TYPE00052	Hind Siliguri	\N	ID0010	\N	443000000	1600000
TYPE00053	Karla	\N	ID0053	\N	432000000	1000000
TYPE00054	Inconsolata	\N	ID0054	\N	517000000	670000
TYPE00055	Arimo	\N	ID0005	\N	369000000	790000
TYPE00056	Josefin Sans	\N	ID0056	\N	389000000	920000
TYPE00057	Noto Serif Makasar	\N	ID0002	\N	1610000	480
TYPE00058	Nanum Gothic	\N	ID0058	\N	409000000	130000
TYPE00059	Libre Baskerville	\N	ID0051	\N	345000000	1200000
TYPE00060	PT Sans Narrow	\N	ID0028	\N	337000000	570000
TYPE00061	Dosis	\N	ID0051	\N	341000000	920000
TYPE00062	Bebas Neue	\N	ID0062	\N	313000000	170000
TYPE00063	Lilita One	\N	ID0063	\N	633000000	67000
TYPE00064	Anton	\N	ID0017	\N	283000000	510000
TYPE00065	Cairo	\N	ID0065	\N	289000000	290000
TYPE00066	Abel	\N	ID0066	\N	278000000	620000
TYPE00067	Dancing Script	\N	ID0051	\N	285000000	750000
TYPE00068	Oxygen	\N	ID0017	\N	293000000	2800000
TYPE00069	Cabin	\N	ID0051	\N	293000000	870000
TYPE00070	Maven Pro	\N	ID0070	\N	265000000	300000
TYPE00071	Ysabeau SC	\N	ID0041	\N	540000	2200
TYPE00072	Space Grotesk	\N	ID0072	\N	253000000	37000
TYPE00073	Akatab	\N	ID0047	\N	1990000	2500
TYPE00074	Bitter	\N	ID0074	\N	293000000	1400000
TYPE00075	Prompt	\N	ID0032	\N	241000000	200000
TYPE00076	EB Garamond	\N	ID0076	\N	248000000	1000000
TYPE00077	Barlow Condensed	\N	ID0039	\N	254000000	400000
TYPE00078	Hind	\N	ID0010	\N	236000000	620000
TYPE00079	Noto Serif Japanese	\N	ID0002	\N	219000000	120000
TYPE00080	Signika Negative	\N	ID0080	\N	214000000	73000
TYPE00081	Exo 2	\N	ID0081	\N	230000000	1200000
TYPE00082	Lobster	\N	ID0051	\N	223000000	680000
TYPE00083	Crimson Text	\N	ID0083	\N	216000000	610000
TYPE00084	Pacifico	\N	ID0017	\N	217000000	690000
TYPE00085	Schibsted Grotesk	\N	ID0085	\N	1870000	4000
TYPE00086	Jost	\N	ID0086	\N	215000000	310000
TYPE00087	Noto Sans Simplified Chinese	\N	ID0002	\N	220000000	55000
TYPE00088	Teko	\N	ID0010	\N	204000000	330000
TYPE00089	Assistant	\N	ID0089	\N	216000000	260000
TYPE00090	Source Code Pro	\N	ID0090	\N	239000000	630000
TYPE00091	Fjalla One	\N	ID0027	\N	201000000	680000
TYPE00092	Rajdhani	\N	ID0010	\N	196000000	190000
TYPE00093	M PLUS Rounded 1c	\N	ID0093	\N	177000000	60000
TYPE00094	Comfortaa	\N	ID0094	\N	190000000	610000
TYPE00095	Varela Round	\N	ID0070	\N	182000000	480000
TYPE00096	Public Sans	\N	ID0096	\N	181000000	83000
TYPE00097	Redacted	\N	ID0097	\N	1130000	6000
TYPE00098	Archivo	\N	ID0098	\N	174000000	470000
TYPE00099	Asap	\N	ID0098	\N	160000000	340000
TYPE00100	Caveat	\N	ID0051	\N	158000000	230000
TYPE00101	Overpass	\N	ID0101	\N	151000000	190000
TYPE00102	Arvo	\N	ID0102	\N	162000000	640000
TYPE00103	Cormorant Garamond	\N	ID0041	\N	152000000	360000
TYPE00104	Abril Fatface	\N	ID0104	\N	153000000	740000
TYPE00105	Outfit	\N	ID0105	\N	139000000	70000
TYPE00106	Hind Madurai	\N	ID0010	\N	143000000	2200000
TYPE00107	Tajawal	\N	ID0107	\N	140000000	59000
TYPE00108	Noto Sans Sundanese	\N	ID0002	\N	166000	5300
TYPE00109	Fira Sans Condensed	\N	ID0036	\N	139000000	180000
TYPE00110	IBM Plex Mono	\N	ID0049	\N	141000000	85000
TYPE00111	Slabo 27px	\N	ID0111	\N	142000000	3700000
TYPE00112	Shadows Into Light	\N	ID0112	\N	145000000	480000
TYPE00113	IBM Plex Sans Arabic	\N	ID0049	\N	122000000	9300
TYPE00114	Merriweather Sans	\N	ID0027	\N	137000000	440000
TYPE00115	Asap Condensed	\N	ID0098	\N	116000000	38000
TYPE00116	Zilla Slab	\N	ID0116	\N	118000000	57000
TYPE00117	Catamaran	\N	ID0117	\N	118000000	290000
TYPE00118	Red Hat Display	\N	ID0118	\N	122000000	69000
TYPE00119	Play	\N	ID0119	\N	113000000	280000
TYPE00120	Chakra Petch	\N	ID0032	\N	111000000	26000
TYPE00121	Chela One	\N	ID0121	\N	2160000	57000
TYPE00122	Yanone Kaffeesatz	\N	ID0122	\N	117000000	340000
TYPE00123	Satisfy	\N	ID0123	\N	115000000	400000
TYPE00124	Indie Flower	\N	ID0112	\N	115000000	530000
TYPE00125	Nanum Myeongjo	\N	ID0125	\N	113000000	97000
TYPE00126	Plus Jakarta Sans	\N	ID0126	\N	104000000	64000
TYPE00127	Sarabun	\N	ID0127	\N	99100000	65000
TYPE00128	M PLUS 1p	\N	ID0093	\N	97200000	33000
TYPE00129	Belanosima	\N	ID0003	\N	910000	2300
TYPE00130	Questrial	\N	ID0070	\N	103000000	290000
TYPE00131	Noto Serif Ottoman Siyaq	\N	ID0002	\N	232000	2100
TYPE00132	Barlow Semi Condensed	\N	ID0039	\N	104000000	95000
TYPE00133	Domine	\N	ID0051	\N	96900000	410000
TYPE00134	Noto Sans Hong Kong	\N	ID0002	\N	97200000	27000
TYPE00135	Agdasima	\N	ID0003	\N	1260000	2500
TYPE00136	Yuji Boku	\N	ID0136	\N	660000	5300
TYPE00137	Frank Ruhl Libre	\N	ID0137	\N	90200000	310000
TYPE00138	Acme	\N	ID0138	\N	91900000	230000
TYPE00139	Almarai	\N	ID0107	\N	86300000	34000
TYPE00140	Russo One	\N	ID0140	\N	87600000	180000
TYPE00141	Caprasimo	\N	ID0003	\N	1270000	2200
TYPE00142	Bacasime Antique	\N	ID0003	\N	1040000	2200
TYPE00143	Rowdies	\N	ID0143	\N	82500000	15000
TYPE00144	Vollkorn	\N	ID0144	\N	84900000	600000
TYPE00145	IBM Plex Serif	\N	ID0049	\N	88900000	54000
TYPE00146	Alegreya	\N	ID0138	\N	81900000	370000
TYPE00147	Signika	\N	ID0080	\N	88900000	220000
TYPE00148	Orbitron	\N	ID0018	\N	76700000	150000
TYPE00149	Didact Gothic	\N	ID0149	\N	82000000	190000
TYPE00150	Archivo Black	\N	ID0098	\N	77000000	170000
TYPE00151	Castoro Titling	\N	ID0151	\N	472000	3900
TYPE00152	Urbanist	\N	ID0152	\N	78600000	29000
TYPE00153	Alegreya Sans	\N	ID0138	\N	82000000	280000
TYPE00154	Permanent Marker	\N	ID0154	\N	82600000	250000
TYPE00155	Alfa Slab One	\N	ID0155	\N	75100000	180000
TYPE00156	Cinzel	\N	ID0081	\N	76500000	310000
TYPE00157	DM Serif Display	\N	ID0040	\N	80900000	99000
TYPE00158	Amatic SC	\N	ID0017	\N	79700000	290000
TYPE00159	Exo	\N	ID0081	\N	81100000	290000
TYPE00160	Geologica	\N	ID0160	\N	1240000	970
TYPE00161	Kalam	\N	ID0010	\N	77400000	180000
TYPE00162	Archivo Narrow	\N	ID0098	\N	79100000	430000
TYPE00163	Bree Serif	\N	ID0104	\N	80800000	290000
TYPE00164	Righteous	\N	ID0164	\N	73100000	310000
TYPE00165	ABeeZee	\N	ID0165	\N	72200000	260000
TYPE00166	Saira Condensed	\N	ID0098	\N	50900000	30000
TYPE00167	Tinos	\N	ID0005	\N	71200000	190000
TYPE00168	Anek Tamil	\N	ID0037	\N	3720000	6900
TYPE00169	Courgette	\N	ID0169	\N	70000000	240000
TYPE00170	Montserrat Alternates	\N	ID0008	\N	67000000	170000
TYPE00171	Yantramanav	\N	ID0171	\N	69600000	380000
TYPE00172	Alata	\N	ID0172	\N	59900000	78000
TYPE00173	Patua One	\N	ID0173	\N	60400000	180000
TYPE00174	Cardo	\N	ID0174	\N	57800000	390000
TYPE00175	Amiri	\N	ID0175	\N	62500000	140000
TYPE00176	Lobster Two	\N	ID0051	\N	61900000	210000
TYPE00177	Changa	\N	ID0177	\N	59300000	93000
TYPE00178	Martel	\N	ID0178	\N	64099999	78000
TYPE00179	Figtree	\N	ID0179	\N	57900000	48000
TYPE00180	Kablammo	\N	ID0180	\N	378000	3600
TYPE00181	Great Vibes	\N	ID0181	\N	61600000	380000
TYPE00182	Lexend	\N	ID0182	\N	58600000	43000
TYPE00183	Philosopher	\N	ID0140	\N	57100000	180000
TYPE00184	Mynerve	\N	ID0184	\N	856000	4200
TYPE00185	Sen	\N	ID0185	\N	54900000	43000
TYPE00186	Cormorant	\N	ID0041	\N	59700000	220000
TYPE00187	Noticia Text	\N	ID0155	\N	59300000	210000
TYPE00188	Prata	\N	ID0034	\N	58100000	200000
TYPE00189	Ubuntu Condensed	\N	ID0026	\N	59600000	220000
TYPE00190	Space Mono	\N	ID0040	\N	57100000	160000
TYPE00191	Noto Serif Traditional Chinese	\N	ID0002	\N	53200000	41000
TYPE00192	Sora	\N	ID0192	\N	67099999	70000
TYPE00193	Rokkitt	\N	ID0017	\N	46800000	310000
TYPE00194	Sawarabi Mincho	\N	ID0194	\N	48600000	36000
TYPE00195	Passion One	\N	ID0195	\N	50400000	140000
TYPE00196	Source Serif 4	\N	ID0196	\N	55600000	20000
TYPE00197	PT Sans Caption	\N	ID0028	\N	55600000	310000
TYPE00198	Spectral	\N	ID0198	\N	53300000	170000
TYPE00199	Baloo 2	\N	ID0037	\N	50500000	24000
TYPE00200	Stint Ultra Condensed	\N	ID0164	\N	10700000	55000
TYPE00201	Crete Round	\N	ID0104	\N	53400000	180000
TYPE00202	Cantarell	\N	ID0202	\N	59500000	3300000
TYPE00203	Noto Serif Korean	\N	ID0002	\N	50700000	21000
TYPE00204	Encode Sans	\N	ID0051	\N	55200000	43000
TYPE00205	Pathway Gothic One	\N	ID0177	\N	46600000	120000
TYPE00206	Yellowtail	\N	ID0164	\N	46000000	130000
TYPE00207	Alice	\N	ID0207	\N	45400000	110000
TYPE00208	Moirai One	\N	ID0208	\N	225000	3700
TYPE00209	Bagel Fat One	\N	ID0209	\N	230000	3800
TYPE00210	Diphylleia	\N	ID0210	\N	208000	3700
TYPE00211	Orbit	\N	ID0211	\N	212000	3700
TYPE00212	Gasoek One	\N	ID0212	\N	196000	3700
TYPE00213	Grandiflora One	\N	ID0213	\N	167000	3600
TYPE00214	Kaushan Script	\N	ID0051	\N	47600000	270000
TYPE00215	Noto Sans Display	\N	ID0002	\N	42800000	8700
TYPE00216	Marcellus	\N	ID0164	\N	45000000	110000
TYPE00217	Concert One	\N	ID0217	\N	41300000	160000
TYPE00218	Unna	\N	ID0098	\N	44300000	72000
TYPE00219	Sawarabi Gothic	\N	ID0194	\N	41000000	28000
TYPE00220	Old Standard TT	\N	ID0220	\N	43100000	360000
TYPE00221	Sacramento	\N	ID0164	\N	44200000	210000
TYPE00222	Roboto Flex	\N	ID0222	\N	45200000	60000
TYPE00223	Arsenal	\N	ID0223	\N	41000000	75000
TYPE00224	Gruppo	\N	ID0017	\N	43000000	100000
TYPE00225	Bodoni Moda	\N	ID0086	\N	41700000	39000
TYPE00226	Carter One	\N	ID0017	\N	38800000	96000
TYPE00227	El Messiri	\N	ID0065	\N	39100000	68000
TYPE00228	Noto Sans Thai	\N	ID0002	\N	35700000	18000
TYPE00229	Norican	\N	ID0017	\N	15600000	64000
TYPE00230	Gloria Hallelujah	\N	ID0112	\N	42100000	170000
TYPE00231	Secular One	\N	ID0231	\N	41900000	140000
TYPE00232	Francois One	\N	ID0017	\N	40000000	180000
TYPE00233	Chivo	\N	ID0098	\N	46700000	330000
TYPE00234	Staatliches	\N	ID0234	\N	43400000	44000
TYPE00235	Mate	\N	ID0177	\N	36900000	58000
TYPE00236	Josefin Slab	\N	ID0056	\N	38900000	360000
TYPE00237	Alegreya Sans SC	\N	ID0138	\N	37000000	100000
TYPE00238	Press Start 2P	\N	ID0238	\N	39600000	92000
TYPE00239	Architects Daughter	\N	ID0112	\N	40800000	330000
TYPE00240	Quattrocento Sans	\N	ID0051	\N	40300000	220000
TYPE00241	Niramit	\N	ID0032	\N	38700000	37000
TYPE00242	Gelasio	\N	ID0242	\N	37600000	16000
TYPE00243	Ubuntu Mono	\N	ID0026	\N	38200000	120000
TYPE00244	Khand	\N	ID0010	\N	40700000	100000
TYPE00245	Antic Slab	\N	ID0056	\N	35800000	81000
TYPE00246	Cookie	\N	ID0246	\N	37000000	240000
TYPE00247	IBM Plex Sans Condensed	\N	ID0049	\N	35300000	19000
TYPE00248	Paytone One	\N	ID0017	\N	33100000	98000
TYPE00249	Mate SC	\N	ID0177	\N	33200000	53000
TYPE00250	Tsukimi Rounded	\N	ID0250	\N	198000	3600
TYPE00251	Special Elite	\N	ID0164	\N	33000000	170000
TYPE00252	Caladea	\N	ID0252	\N	29100000	12000
TYPE00253	Zeyada	\N	ID0112	\N	53600000	75000
TYPE00254	Fira Sans Extra Condensed	\N	ID0036	\N	35300000	30000
TYPE00255	Saira	\N	ID0098	\N	36100000	47000
TYPE00256	Gothic A1	\N	ID0256	\N	37100000	37000
TYPE00257	Yatra One	\N	ID0257	\N	35600000	120000
TYPE00258	Tenor Sans	\N	ID0258	\N	32400000	99000
TYPE00259	Advent Pro	\N	ID0259	\N	35600000	160000
TYPE00260	Handlee	\N	ID0070	\N	34200000	160000
TYPE00261	Mitr	\N	ID0032	\N	31900000	75000
TYPE00262	Aleo	\N	ID0262	\N	32900000	42000
TYPE00263	Commissioner	\N	ID0263	\N	33800000	13000
TYPE00264	Vidaloka	\N	ID0034	\N	32200000	160000
TYPE00265	Cherry Bomb One	\N	ID0265	\N	385000	3700
TYPE00266	Chokokutai	\N	ID0266	\N	163000	3600
TYPE00267	Poiret One	\N	ID0258	\N	32200000	230000
TYPE00268	Wix Madefor Text	\N	ID0026	\N	589000	3600
TYPE00269	Marck Script	\N	ID0258	\N	30800000	240000
TYPE00270	Cuprum	\N	ID0140	\N	32100000	160000
TYPE00271	Readex Pro	\N	ID0271	\N	29900000	12000
TYPE00272	Kosugi Maru	\N	ID0272	\N	28900000	30000
TYPE00273	Ultra	\N	ID0164	\N	29000000	230000
TYPE00274	Lexend Deca	\N	ID0182	\N	36000000	54000
TYPE00275	Tangerine	\N	ID0275	\N	29200000	230000
TYPE00276	Red Hat Text	\N	ID0118	\N	32400000	38000
TYPE00277	Encode Sans Condensed	\N	ID0051	\N	31700000	29000
TYPE00278	IM Fell Great Primer	\N	ID0278	\N	2200000	51000
TYPE00279	Crimson Pro	\N	ID0279	\N	31100000	25000
TYPE00280	Aoboshi One	\N	ID0280	\N	524000	3800
TYPE00281	Monomaniac One	\N	ID0281	\N	243000	3700
TYPE00282	Slackside One	\N	ID0281	\N	175000	3500
TYPE00283	Noto Sans Chorasmian	\N	ID0002	\N	115000	3500
TYPE00284	Quattrocento	\N	ID0051	\N	32500000	300000
TYPE00285	Bungee	\N	ID0285	\N	26900000	78000
TYPE00286	Luckiest Guy	\N	ID0164	\N	30300000	100000
TYPE00287	Neuton	\N	ID0287	\N	36300000	190000
TYPE00288	Yeseva One	\N	ID0140	\N	29800000	110000
TYPE00289	Be Vietnam Pro	\N	ID0289	\N	32600000	23000
TYPE00290	Viga	\N	ID0195	\N	28200000	120000
TYPE00291	Literata	\N	ID0104	\N	28300000	47000
TYPE00292	News Cycle	\N	ID0292	\N	29700000	210000
TYPE00293	Mr Dafoe	\N	ID0293	\N	30900000	120000
TYPE00294	Sanchez	\N	ID0294	\N	30800000	200000
TYPE00295	Ysabeau	\N	ID0041	\N	449000	3900
TYPE00296	Mukta Malar	\N	ID0037	\N	29100000	15000
TYPE00297	Ropa Sans	\N	ID0297	\N	27100000	140000
TYPE00298	Faustina	\N	ID0098	\N	28400000	23000
TYPE00299	Playfair Display SC	\N	ID0022	\N	27900000	220000
TYPE00300	Allura	\N	ID0181	\N	28600000	170000
TYPE00301	Source Sans 3	\N	ID0090	\N	32200000	29000
TYPE00302	Noto Serif Simplified Chinese	\N	ID0002	\N	25900000	26000
TYPE00303	Bangers	\N	ID0017	\N	27000000	200000
TYPE00304	Calistoga	\N	ID0304	\N	21400000	25000
TYPE00305	DM Serif Text	\N	ID0040	\N	26800000	35000
TYPE00306	Taviraj	\N	ID0032	\N	26400000	96000
TYPE00307	Wix Madefor Display	\N	ID0026	\N	2680000	4100
TYPE00308	Abhaya Libre	\N	ID0308	\N	25400000	96000
TYPE00309	Gudea	\N	ID0309	\N	25700000	110000
TYPE00310	Roboto Serif	\N	ID0310	\N	27300000	44000
TYPE00311	Hammersmith One	\N	ID0311	\N	23200000	180000
TYPE00312	Antonio	\N	ID0017	\N	22600000	19000
TYPE00313	Libre Caslon Text	\N	ID0051	\N	25700000	24000
TYPE00314	Hind Vadodara	\N	ID0010	\N	24100000	67000
TYPE00315	Volkhov	\N	ID0034	\N	24100000	250000
TYPE00316	Amaranth	\N	ID0316	\N	24200000	140000
TYPE00317	Neucha	\N	ID0140	\N	25000000	93000
TYPE00318	Shrikhand	\N	ID0053	\N	23300000	90000
TYPE00319	Noto Naskh Arabic	\N	ID0002	\N	22900000	5700
TYPE00320	Nanum Gothic Coding	\N	ID0058	\N	24800000	16000
TYPE00321	Edu TAS Beginner	\N	ID0321	\N	271000	5100
TYPE00322	Noto Sans Devanagari	\N	ID0002	\N	23500000	5800
TYPE00323	Saira Semi Condensed	\N	ID0098	\N	24900000	31000
TYPE00324	Blinker	\N	ID0324	\N	29000000	22000
TYPE00325	Patrick Hand	\N	ID0325	\N	25300000	160000
TYPE00326	Instrument Sans	\N	ID0326	\N	1000000	4300
TYPE00327	Parisienne	\N	ID0164	\N	24200000	150000
TYPE00328	Ruda	\N	ID0328	\N	24600000	100000
TYPE00329	Itim	\N	ID0032	\N	23300000	72000
TYPE00330	League Spartan	\N	ID0330	\N	24300000	20000
TYPE00331	Rubik Mono One	\N	ID0025	\N	24100000	91000
TYPE00332	Pragati Narrow	\N	ID0098	\N	21500000	63000
TYPE00333	Homemade Apple	\N	ID0154	\N	24100000	130000
TYPE00334	Castoro	\N	ID0151	\N	21100000	16000
TYPE00335	Pathway Extreme	\N	ID0177	\N	6800000	3900
TYPE00336	Adamina	\N	ID0034	\N	21200000	120000
TYPE00337	Unbounded	\N	ID0337	\N	26600000	7200
TYPE00338	Noto Serif Bengali	\N	ID0002	\N	20900000	6200
TYPE00339	Laila	\N	ID0010	\N	20100000	61000
TYPE00340	Playball	\N	ID0181	\N	22100000	150000
TYPE00341	Monoton	\N	ID0017	\N	22800000	100000
TYPE00342	Noto Sans Nag Mundari	\N	ID0002	\N	122000	3600
TYPE00343	Mandali	\N	ID0343	\N	20800000	56000
TYPE00344	PT Mono	\N	ID0028	\N	26000000	170000
TYPE00345	Noto Sans Tamil	\N	ID0002	\N	17900000	5800
TYPE00346	Zen Kaku Gothic New	\N	ID0346	\N	20100000	8700
TYPE00347	Voltaire	\N	ID0304	\N	19800000	72000
TYPE00348	Courier Prime	\N	ID0348	\N	19800000	34000
TYPE00349	Istok Web	\N	ID0349	\N	21600000	110000
TYPE00350	Bad Script	\N	ID0350	\N	20400000	180000
TYPE00351	Six Caps	\N	ID0017	\N	18900000	100000
TYPE00352	Unica One	\N	ID0177	\N	19400000	110000
TYPE00353	Mada	\N	ID0175	\N	21700000	61000
TYPE00354	Electrolize	\N	ID0350	\N	18700000	64000
TYPE00355	Inter Tight	\N	ID0015	\N	20700000	14000
TYPE00356	Share Tech Mono	\N	ID0036	\N	18900000	65000
TYPE00357	Sriracha	\N	ID0032	\N	19200000	75000
TYPE00358	Rock Salt	\N	ID0123	\N	20200000	160000
TYPE00359	Angkor	\N	ID0359	\N	3310000	56000
TYPE00360	Noto Sans Nandinagari	\N	ID0002	\N	284000	5200
TYPE00361	Merienda	\N	ID0177	\N	20900000	200000
TYPE00362	Athiti	\N	ID0032	\N	18700000	71000
TYPE00363	David Libre	\N	ID0363	\N	8289999	94000
TYPE00364	Foldit	\N	ID0364	\N	283000	3600
TYPE00365	Lalezar	\N	ID0365	\N	19300000	81000
TYPE00366	Titan One	\N	ID0326	\N	22300000	59000
TYPE00367	Lusitana	\N	ID0367	\N	19700000	120000
TYPE00368	Markazi Text	\N	ID0365	\N	16000000	10000
TYPE00369	Playfair	\N	ID0022	\N	9760000	4700
TYPE00370	Black Ops One	\N	ID0370	\N	18500000	79000
TYPE00371	Bai Jamjuree	\N	ID0032	\N	19500000	37000
TYPE00372	Monda	\N	ID0017	\N	19400000	150000
TYPE00373	Cousine	\N	ID0005	\N	20500000	120000
TYPE00374	Alex Brush	\N	ID0181	\N	21400000	160000
TYPE00375	Jura	\N	ID0149	\N	18000000	160000
TYPE00376	Ramabhadra	\N	ID0343	\N	19500000	56000
TYPE00377	Comme	\N	ID0017	\N	154000	3700
TYPE00378	BenchNine	\N	ID0017	\N	18400000	110000
TYPE00379	Nanum Pen Script	\N	ID0058	\N	19600000	19000
TYPE00380	Epilogue	\N	ID0380	\N	17600000	36000
TYPE00381	Rubik Dirt	\N	ID0337	\N	4010000	8100
TYPE00382	Oleo Script	\N	ID0382	\N	19300000	96000
TYPE00383	Comic Neue	\N	ID0383	\N	19100000	19000
TYPE00384	Carlito	\N	\N	\N	345000	3900
TYPE00385	Londrina Solid	\N	ID0385	\N	15900000	58000
TYPE00386	Audiowide	\N	ID0164	\N	17500000	94000
TYPE00387	Cabin Condensed	\N	ID0051	\N	18400000	100000
TYPE00388	Khula	\N	ID0171	\N	16500000	68000
TYPE00389	Kumbh Sans	\N	ID0389	\N	16600000	23000
TYPE00390	Economica	\N	ID0390	\N	17300000	100000
TYPE00391	Shippori Mincho	\N	ID0391	\N	16700000	10000
TYPE00392	Julius Sans One	\N	ID0392	\N	16700000	150000
TYPE00393	Noto Sans Malayalam	\N	ID0002	\N	14700000	5600
TYPE00394	Jaldi	\N	ID0098	\N	16600000	580000
TYPE00395	BIZ UDPGothic	\N	ID0395	\N	14700000	7500
TYPE00396	Martel Sans	\N	ID0178	\N	16300000	63000
TYPE00397	Anonymous Pro	\N	ID0397	\N	17600000	170000
TYPE00398	Sorts Mill Goudy	\N	ID0398	\N	16700000	88000
TYPE00399	Leckerli One	\N	ID0316	\N	15600000	91000
TYPE00400	Forum	\N	ID0258	\N	16300000	170000
TYPE00401	Baskervville	\N	ID0401	\N	15900000	35000
TYPE00402	Italianno	\N	ID0181	\N	16399999	87000
TYPE00403	Black Han Sans	\N	ID0403	\N	16200000	24000
TYPE00404	Sansita	\N	ID0098	\N	15000000	20000
TYPE00405	Quantico	\N	ID0066	\N	15100000	96000
TYPE00406	Pridi	\N	ID0032	\N	15800000	69000
TYPE00407	Damion	\N	ID0017	\N	16200000	120000
TYPE00408	PÃ³Å‚tawski Nowy	\N	ID0408	\N	969000	3900
TYPE00409	Reem Kufi	\N	ID0175	\N	15700000	93000
TYPE00410	Varela	\N	ID0070	\N	16399999	140000
TYPE00411	Zen Maru Gothic	\N	ID0346	\N	15200000	9200
TYPE00412	Albert Sans	\N	ID0412	\N	17000000	21000
TYPE00413	Actor	\N	ID0413	\N	15700000	160000
TYPE00414	Squada One	\N	ID0070	\N	14800000	76000
TYPE00415	Krub	\N	ID0032	\N	15500000	43000
TYPE00416	Antic	\N	ID0056	\N	14900000	67000
TYPE00417	Nothing You Could Do	\N	ID0112	\N	16500000	160000
TYPE00418	Petrona	\N	ID0418	\N	14400000	55000
TYPE00419	Koulen	\N	ID0359	\N	14700000	51000
TYPE00420	Alef	\N	ID0420	\N	15800000	100000
TYPE00421	Syne	\N	ID0421	\N	15000000	37000
TYPE00422	Rufina	\N	ID0422	\N	16200000	95000
TYPE00423	Holtwood One SC	\N	ID0017	\N	14500000	69000
TYPE00424	Anybody	\N	ID0380	\N	1010000	8600
TYPE00425	Fira Mono	\N	ID0036	\N	17800000	92000
TYPE00426	Saira Extra Condensed	\N	ID0098	\N	14300000	32000
TYPE00427	Darumadrop One	\N	ID0281	\N	206000	4800
TYPE00428	Konkhmer Sleokchher	\N	ID0428	\N	121000	3600
TYPE00429	Pontano Sans	\N	ID0017	\N	14900000	110000
TYPE00430	Gilda Display	\N	ID0177	\N	14400000	97000
TYPE00431	Eczar	\N	ID0431	\N	16900000	110000
TYPE00432	Aclonica	\N	ID0164	\N	14200000	110000
TYPE00433	Pinyon Script	\N	ID0311	\N	14200000	100000
TYPE00434	Glegoo	\N	ID0177	\N	14400000	94000
TYPE00435	Sarala	\N	ID0435	\N	15600000	84000
TYPE00436	Days One	\N	ID0140	\N	13500000	100000
TYPE00437	Gochi Hand	\N	ID0437	\N	14800000	66000
TYPE00438	Oxanium	\N	ID0438	\N	13100000	12000
TYPE00439	Macondo	\N	ID0439	\N	15700000	51000
TYPE00440	Lemonada	\N	ID0065	\N	12700000	61000
TYPE00441	Chewy	\N	ID0123	\N	12400000	160000
TYPE00442	Arbutus Slab	\N	ID0169	\N	11200000	81000
TYPE00443	Fraunces	\N	ID0443	\N	13700000	32000
TYPE00444	Julee	\N	ID0444	\N	11600000	53000
TYPE00445	Arapey	\N	ID0177	\N	12900000	86000
TYPE00446	Fugaz One	\N	ID0173	\N	13200000	220000
TYPE00447	Just Another Hand	\N	ID0164	\N	13300000	85000
TYPE00448	Fasthand	\N	ID0359	\N	3480000	50000
TYPE00449	Berkshire Swash	\N	ID0164	\N	12700000	130000
TYPE00450	Sintony	\N	ID0450	\N	13500000	88000
TYPE00451	Palanquin	\N	ID0117	\N	13600000	73000
TYPE00452	Charm	\N	ID0032	\N	12100000	77000
TYPE00453	Cutive Mono	\N	ID0017	\N	12400000	100000
TYPE00454	Hind Guntur	\N	ID0010	\N	12400000	59000
TYPE00455	DM Mono	\N	ID0040	\N	13500000	14000
TYPE00456	Oranienbaum	\N	ID0456	\N	11100000	100000
TYPE00457	PT Serif Caption	\N	ID0028	\N	12600000	77000
TYPE00458	Covered By Your Grace	\N	ID0112	\N	12700000	90000
TYPE00459	Alexandria	\N	ID0065	\N	11000000	12000
TYPE00460	Newsreader	\N	ID0198	\N	12100000	19000
TYPE00461	Capriola	\N	ID0461	\N	11800000	69000
TYPE00462	Kreon	\N	ID0462	\N	12300000	110000
TYPE00463	Karma	\N	ID0010	\N	13000000	60000
TYPE00464	Sigmar	\N	ID0017	\N	280000	3800
TYPE00465	Vina Sans	\N	ID0465	\N	151000	3700
TYPE00466	Amita	\N	ID0177	\N	12000000	69000
TYPE00467	Mali	\N	ID0032	\N	11400000	22000
TYPE00468	Reenie Beanie	\N	ID0370	\N	12900000	160000
TYPE00469	Basic	\N	ID0469	\N	11200000	120000
TYPE00470	Tiro Kannada	\N	ID0151	\N	1520000	5000
TYPE00471	Fredericka the Great	\N	ID0471	\N	11200000	160000
TYPE00472	Jua	\N	ID0472	\N	11000000	16000
TYPE00473	Cinzel Decorative	\N	ID0081	\N	10700000	95000
TYPE00474	Palanquin Dark	\N	ID0117	\N	11700000	110000
TYPE00475	Wallpoet	\N	ID0475	\N	10900000	69000
TYPE00476	Libre Barcode 39	\N	ID0476	\N	10900000	9200
TYPE00477	K2D	\N	ID0032	\N	10900000	26000
TYPE00478	Syncopate	\N	ID0164	\N	11700000	100000
TYPE00479	Racing Sans One	\N	ID0051	\N	10800000	86000
TYPE00480	Bruno Ace SC	\N	ID0164	\N	938000	4000
TYPE00481	Bruno Ace	\N	ID0164	\N	174000	3900
TYPE00482	Alike	\N	ID0034	\N	10100000	68000
TYPE00483	Cantata One	\N	ID0483	\N	11000000	91000
TYPE00484	Kiwi Maru	\N	ID0484	\N	9690000	7300
TYPE00485	Cabin Sketch	\N	ID0051	\N	11700000	87000
TYPE00486	Candal	\N	ID0017	\N	10600000	74000
TYPE00487	Livvic	\N	ID0487	\N	10800000	21000
TYPE00488	Anuphan	\N	ID0032	\N	2140000	4100
TYPE00489	JetBrains Mono	\N	ID0489	\N	11300000	22000
TYPE00490	Michroma	\N	ID0017	\N	10600000	95000
TYPE00491	Big Shoulders Display	\N	ID0491	\N	12100000	17000
TYPE00492	Sirin Stencil	\N	ID0034	\N	1530000	62000
TYPE00493	Changa One	\N	ID0177	\N	11300000	100000
TYPE00494	Coda	\N	ID0017	\N	10300000	84000
TYPE00495	Rammetto One	\N	ID0017	\N	10900000	62000
TYPE00496	Fjord One	\N	ID0461	\N	9210000	53000
TYPE00497	IBM Plex Sans Thai	\N	ID0049	\N	9390000	14000
TYPE00498	Alatsi	\N	ID0172	\N	9750000	28000
TYPE00499	Yrsa	\N	ID0431	\N	10100000	110000
TYPE00500	GFS Didot	\N	ID0500	\N	10600000	60000
TYPE00501	Cormorant Infant	\N	ID0041	\N	9330000	85000
TYPE00502	Boogaloo	\N	ID0439	\N	10600000	99000
TYPE00503	Trirong	\N	ID0032	\N	10300000	78000
TYPE00504	Allerta	\N	ID0018	\N	9070000	130000
TYPE00505	Noto Sans Mono	\N	ID0002	\N	11500000	6100
TYPE00506	Bevan	\N	ID0017	\N	9670000	120000
TYPE00507	Biryani	\N	ID0178	\N	9350000	69000
TYPE00508	Caveat Brush	\N	ID0051	\N	11000000	71000
TYPE00509	Carrois Gothic	\N	ID0036	\N	10300000	72000
TYPE00510	Arizonia	\N	ID0181	\N	9860000	100000
TYPE00511	Aldrich	\N	ID0066	\N	9500000	93000
TYPE00512	Fira Code	\N	ID0512	\N	11000000	39000
TYPE00513	Headland One	\N	ID0513	\N	9180000	58000
TYPE00514	Lustria	\N	ID0066	\N	9720000	75000
TYPE00515	Short Stack	\N	ID0370	\N	9590000	62000
TYPE00516	Armata	\N	ID0461	\N	10600000	87000
TYPE00517	Shadows Into Light Two	\N	ID0112	\N	10100000	110000
TYPE00518	Darker Grotesque	\N	ID0518	\N	9300000	20000
TYPE00519	Average Sans	\N	ID0177	\N	9540000	71000
TYPE00520	Herr Von Muellerhoff	\N	ID0293	\N	9870000	85000
TYPE00521	Pattaya	\N	ID0032	\N	9650000	77000
TYPE00522	Scada	\N	ID0140	\N	9700000	80000
TYPE00523	Rubik Moonrocks	\N	ID0337	\N	8210000	6600
TYPE00524	Do Hyeon	\N	ID0472	\N	8830000	24000
TYPE00525	Atkinson Hyperlegible	\N	ID0525	\N	9710000	10000
TYPE00526	Quintessential	\N	ID0164	\N	8830000	56000
TYPE00527	Bellefair	\N	ID0527	\N	8840000	28000
TYPE00528	Marcellus SC	\N	ID0164	\N	8500000	74000
TYPE00529	Rubik Pixels	\N	ID0337	\N	138000	4800
TYPE00530	M PLUS 2	\N	ID0093	\N	3500000	5600
TYPE00531	Rancho	\N	ID0123	\N	10400000	77000
TYPE00532	Niconne	\N	ID0017	\N	9010000	140000
TYPE00533	STIX Two Text	\N	ID0151	\N	10700000	9600
TYPE00534	Averia Serif Libre	\N	ID0534	\N	9710000	100000
TYPE00535	Corben	\N	ID0017	\N	9450000	150000
TYPE00536	Krona One	\N	ID0304	\N	9190000	85000
TYPE00537	Irish Grover	\N	ID0123	\N	8109999	54000
TYPE00538	Balsamiq Sans	\N	ID0538	\N	8350000	13000
TYPE00539	Belleza	\N	ID0177	\N	9130000	72000
TYPE00540	Rozha One	\N	ID0010	\N	9110000	96000
TYPE00541	Nanum Brush Script	\N	ID0058	\N	9480000	17000
TYPE00542	Smokum	\N	ID0164	\N	7730000	57000
TYPE00543	Noto Serif Display	\N	ID0002	\N	9470000	10000
TYPE00544	Overlock	\N	ID0544	\N	9130000	140000
TYPE00545	Contrail One	\N	ID0545	\N	8220000	66000
TYPE00546	Rye	\N	ID0311	\N	8279999	73000
TYPE00547	Knewave	\N	ID0380	\N	8800000	89000
TYPE00548	Overpass Mono	\N	ID0101	\N	8580000	47000
TYPE00549	Allerta Stencil	\N	ID0018	\N	8610000	85000
TYPE00550	Yesteryear	\N	ID0164	\N	8279999	83000
TYPE00551	Annie Use Your Telescope	\N	ID0112	\N	8119999	75000
TYPE00552	Chango	\N	ID0195	\N	2910000	52000
TYPE00553	Bowlby One SC	\N	ID0017	\N	8080000	66000
TYPE00554	Mrs Saint Delafield	\N	ID0293	\N	10000000	100000
TYPE00555	Chonburi	\N	ID0032	\N	8560000	68000
TYPE00556	Seaweed Script	\N	ID0556	\N	7820000	73000
TYPE00557	Averia Libre	\N	ID0534	\N	7920000	55000
TYPE00558	Noto Sans Hebrew	\N	ID0002	\N	9030000	6100
TYPE00559	M PLUS 1	\N	ID0093	\N	8029999	6700
TYPE00560	Bungee Inline	\N	ID0285	\N	8109999	66000
TYPE00561	Kristi	\N	ID0561	\N	8060000	100000
TYPE00562	Hanuman	\N	ID0359	\N	7950000	55000
TYPE00563	Marmelad	\N	ID0034	\N	7670000	72000
TYPE00564	BioRhyme	\N	ID0564	\N	8440000	100000
TYPE00565	Manjari	\N	ID0565	\N	7720000	45000
TYPE00566	Spinnaker	\N	ID0566	\N	7420000	120000
TYPE00567	Kosugi	\N	ID0272	\N	8540000	16000
TYPE00568	Grandstander	\N	ID0380	\N	7610000	8000
TYPE00569	Pirata One	\N	ID0326	\N	7090000	59000
TYPE00570	Henny Penny	\N	ID0570	\N	7090000	61000
TYPE00571	Alegreya SC	\N	ID0138	\N	7500000	96000
TYPE00572	Rambla	\N	ID0422	\N	7540000	64000
TYPE00573	Smooch Sans	\N	ID0181	\N	1490000	5400
TYPE00574	Alumni Sans	\N	ID0181	\N	6580000	12000
TYPE00575	La Belle Aurore	\N	ID0112	\N	9300000	84000
TYPE00576	Noto Nastaliq Urdu	\N	ID0002	\N	7070000	6400
TYPE00577	Coustard	\N	ID0017	\N	7780000	69000
TYPE00578	Hanken Grotesk	\N	ID0578	\N	7090000	8100
TYPE00579	Graduate	\N	ID0177	\N	7640000	73000
TYPE00580	Bubblegum Sans	\N	ID0293	\N	6750000	67000
TYPE00581	Braah One	\N	ID0581	\N	377000	6200
TYPE00582	Fredoka	\N	ID0582	\N	7470000	8400
TYPE00583	Thasadith	\N	ID0032	\N	7140000	21000
TYPE00584	Georama	\N	ID0198	\N	6940000	15000
TYPE00585	Coming Soon	\N	ID0585	\N	7440000	110000
TYPE00586	Alkatra	\N	ID0586	\N	753000	4400
TYPE00587	Brygada 1918	\N	ID0587	\N	6290000	10000
TYPE00588	Trykker	\N	ID0469	\N	6240000	49000
TYPE00589	Aladin	\N	ID0293	\N	6730000	85000
TYPE00590	Podkova	\N	ID0034	\N	7350000	63000
TYPE00591	Magra	\N	ID0591	\N	6880000	59000
TYPE00592	Average	\N	ID0177	\N	6860000	79000
TYPE00593	Golos Text	\N	ID0593	\N	7130000	5400
TYPE00594	Maitree	\N	ID0032	\N	7010000	65000
TYPE00595	Caudex	\N	ID0595	\N	7150000	120000
TYPE00596	Enriqueta	\N	ID0591	\N	7340000	120000
TYPE00597	Spline Sans Mono	\N	ID0242	\N	1130000	6100
TYPE00598	Kurale	\N	ID0177	\N	6990000	54000
TYPE00599	Rochester	\N	ID0123	\N	7090000	120000
TYPE00600	Grand Hotel	\N	ID0164	\N	7070000	140000
TYPE00601	Noto Serif Devanagari	\N	ID0002	\N	6670000	5800
TYPE00602	Arya	\N	ID0177	\N	6360000	55000
TYPE00603	Libre Bodoni	\N	ID0603	\N	7060000	7700
TYPE00604	Sofia	\N	ID0173	\N	7100000	88000
TYPE00605	Kameron	\N	ID0017	\N	7160000	64000
TYPE00606	Limelight	\N	ID0311	\N	6510000	73000
TYPE00607	Delius	\N	ID0607	\N	6730000	60000
TYPE00608	Halant	\N	ID0010	\N	6570000	68000
TYPE00609	Tillana	\N	ID0010	\N	6550000	52000
TYPE00610	Hepta Slab	\N	ID0610	\N	6370000	11000
TYPE00611	Molengo	\N	ID0611	\N	5820000	78000
TYPE00612	Telex	\N	ID0437	\N	7620000	64000
TYPE00613	Petit Formal Script	\N	ID0051	\N	6650000	110000
TYPE00614	Instrument Serif	\N	ID0326	\N	926000	4000
TYPE00615	Suez One	\N	ID0231	\N	6830000	79000
TYPE00616	Rasa	\N	ID0431	\N	6440000	61000
TYPE00617	Ovo	\N	ID0311	\N	6840000	87000
TYPE00618	Amiko	\N	ID0051	\N	6610000	75000
TYPE00619	Encode Sans Semi Condensed	\N	ID0051	\N	6200000	22000
TYPE00620	League Gothic	\N	ID0380	\N	6290000	11000
TYPE00621	Cormorant Upright	\N	ID0041	\N	6280000	63000
TYPE00622	Mallanna	\N	ID0343	\N	6780000	51000
TYPE00623	Monsieur La Doulaise	\N	ID0293	\N	6770000	68000
TYPE00624	B612	\N	ID0624	\N	6400000	17000
TYPE00625	Grenze Gotisch	\N	ID0098	\N	6110000	7200
TYPE00626	Judson	\N	ID0149	\N	6430000	69000
TYPE00627	Creepster	\N	ID0123	\N	9920000	70000
TYPE00628	Vazirmatn	\N	ID0628	\N	5090000	7500
TYPE00629	Cedarville Cursive	\N	ID0112	\N	7270000	93000
TYPE00630	Sunflower	\N	ID0630	\N	6330000	19000
TYPE00631	IM Fell English SC	\N	ID0278	\N	5590000	84000
TYPE00632	Share	\N	ID0036	\N	6300000	64000
TYPE00633	Nobile	\N	ID0017	\N	6590000	74000
TYPE00634	Baloo Thambi 2	\N	ID0037	\N	5310000	9600
TYPE00635	Amethysta	\N	ID0034	\N	5900000	62000
TYPE00636	Trocchi	\N	ID0017	\N	6670000	66000
TYPE00637	Vollkorn SC	\N	ID0144	\N	6800000	12000
TYPE00638	Nixie One	\N	ID0140	\N	5930000	85000
TYPE00639	Klee One	\N	ID0639	\N	6290000	6500
TYPE00640	Miriam Libre	\N	ID0231	\N	6770000	75000
TYPE00641	Lateef	\N	ID0047	\N	6150000	66000
TYPE00642	Fahkwang	\N	ID0032	\N	5930000	28000
TYPE00749	Andika	\N	ID0047	\N	4270000	89000
TYPE00643	Sniglet	\N	ID0643	\N	6170000	69000
TYPE00644	B612 Mono	\N	ID0624	\N	6270000	16000
TYPE00645	Turret Road	\N	ID0645	\N	5600000	8700
TYPE00646	Sedgwick Ave	\N	ID0646	\N	5350000	17000
TYPE00647	Oxygen Mono	\N	ID0017	\N	5630000	54000
TYPE00648	Zen Old Mincho	\N	ID0346	\N	5740000	7500
TYPE00649	Padauk	\N	ID0047	\N	9780000	35000
TYPE00650	Baloo Da 2	\N	ID0037	\N	5410000	9400
TYPE00651	Rosario	\N	ID0098	\N	5660000	82000
TYPE00652	Sansita Swashed	\N	ID0098	\N	5450000	18000
TYPE00653	Zen Antique	\N	ID0346	\N	4680000	7200
TYPE00654	Calligraffitti	\N	ID0585	\N	5620000	99000
TYPE00655	Proza Libre	\N	ID0655	\N	5980000	110000
TYPE00656	Mansalva	\N	ID0184	\N	5240000	39000
TYPE00657	Slabo 13px	\N	ID0111	\N	5380000	190000
TYPE00658	IM Fell English	\N	ID0278	\N	5300000	57000
TYPE00659	Metrophobic	\N	ID0017	\N	5440000	76000
TYPE00660	Schoolbell	\N	ID0154	\N	6330000	70000
TYPE00661	Jockey One	\N	ID0104	\N	5480000	120000
TYPE00662	Zen Kaku Gothic Antique	\N	ID0346	\N	4550000	7000
TYPE00663	Gabriela	\N	ID0177	\N	5290000	70000
TYPE00664	Noto Sans Bengali	\N	ID0002	\N	5090000	6000
TYPE00665	Freehand	\N	ID0359	\N	3750000	54000
TYPE00666	Spectral SC	\N	ID0198	\N	5320000	24000
TYPE00667	Della Respira	\N	ID0292	\N	4700000	53000
TYPE00668	Fauna One	\N	ID0177	\N	5720000	74000
TYPE00669	Style Script	\N	ID0181	\N	5320000	17000
TYPE00670	Allison	\N	ID0181	\N	4580000	13000
TYPE00671	Hahmlet	\N	ID0671	\N	5120000	17000
TYPE00672	IM Fell DW Pica	\N	ID0278	\N	4760000	54000
TYPE00673	Aref Ruqaa	\N	ID0673	\N	4700000	58000
TYPE00674	Waiting for the Sunrise	\N	ID0112	\N	4950000	69000
TYPE00675	Loved by the King	\N	ID0112	\N	5210000	66000
TYPE00676	Shippori Mincho B1	\N	ID0391	\N	5020000	8100
TYPE00677	ZCOOL XiaoWei	\N	ID0677	\N	5000000	21000
TYPE00678	NTR	\N	ID0343	\N	6140000	56000
TYPE00679	Cambay	\N	ID0679	\N	5600000	58000
TYPE00680	Bentham	\N	ID0680	\N	4940000	62000
TYPE00681	Qwigley	\N	ID0181	\N	6930000	100000
TYPE00682	Suranna	\N	ID0343	\N	4770000	52000
TYPE00683	Alike Angular	\N	ID0034	\N	5310000	61000
TYPE00684	Montserrat Subrayada	\N	ID0008	\N	4670000	71000
TYPE00685	Odibee Sans	\N	ID0685	\N	4630000	8500
TYPE00686	Gravitas One	\N	ID0027	\N	5140000	95000
TYPE00687	Love Ya Like A Sister	\N	ID0112	\N	5140000	100000
TYPE00688	Sofia Sans Condensed	\N	ID0688	\N	4600000	5700
TYPE00689	Tenali Ramakrishna	\N	ID0689	\N	4340000	50000
TYPE00690	Germania One	\N	ID0439	\N	4190000	56000
TYPE00691	Big Shoulders Text	\N	ID0491	\N	5140000	11000
TYPE00692	Italiana	\N	ID0056	\N	4690000	86000
TYPE00693	IBM Plex Sans KR	\N	ID0049	\N	5010000	6100
TYPE00694	Bowlby One	\N	ID0017	\N	4990000	66000
TYPE00695	Cormorant SC	\N	ID0041	\N	4780000	66000
TYPE00696	Bungee Shade	\N	ID0285	\N	4410000	59000
TYPE00697	Lexend Zetta	\N	ID0182	\N	4330000	36000
TYPE00698	Almendra	\N	ID0698	\N	4970000	65000
TYPE00699	Sigmar One	\N	ID0017	\N	4680000	65000
TYPE00700	Stardos Stencil	\N	ID0017	\N	5220000	80000
TYPE00701	Flow Circular	\N	ID0701	\N	3440000	6000
TYPE00702	ZCOOL QingKe HuangYou	\N	ID0702	\N	4840000	7800
TYPE00703	Goudy Bookletter 1911	\N	ID0398	\N	5190000	78000
TYPE00704	Kaisei Decol	\N	ID0704	\N	3990000	7200
TYPE00705	Gurajada	\N	ID0343	\N	4680000	60000
TYPE00706	Quando	\N	ID0483	\N	4680000	67000
TYPE00707	Bellota Text	\N	ID0707	\N	4480000	12000
TYPE00708	RocknRoll One	\N	ID0639	\N	4110000	27000
TYPE00709	Oleo Script Swash Caps	\N	ID0382	\N	4540000	67000
TYPE00710	Anek Malayalam	\N	ID0037	\N	4320000	7100
TYPE00711	Brawler	\N	ID0034	\N	5030000	62000
TYPE00712	Copse	\N	ID0712	\N	4600000	94000
TYPE00713	Fondamento	\N	ID0164	\N	4220000	84000
TYPE00714	Vesper Libre	\N	ID0714	\N	4290000	51000
TYPE00715	Zen Kurenaido	\N	ID0346	\N	4030000	6100
TYPE00716	Marvel	\N	ID0716	\N	4470000	90000
TYPE00717	Kodchasan	\N	ID0032	\N	4560000	20000
TYPE00718	Esteban	\N	ID0718	\N	3850000	60000
TYPE00719	Reggae One	\N	ID0639	\N	4070000	7600
TYPE00720	Notable	\N	ID0720	\N	4099999	85000
TYPE00721	Glory	\N	ID0181	\N	3860000	6400
TYPE00722	UnifrakturMaguntia	\N	ID0722	\N	4290000	100000
TYPE00723	Homenaje	\N	ID0723	\N	4000000	64000
TYPE00724	Inder	\N	ID0027	\N	4460000	66000
TYPE00725	KoHo	\N	ID0032	\N	4510000	26000
TYPE00726	Dawning of a New Day	\N	ID0112	\N	5200000	65000
TYPE00727	Syne Mono	\N	ID0421	\N	4200000	6100
TYPE00728	Silkscreen	\N	ID0728	\N	4160000	6100
TYPE00729	Radley	\N	ID0017	\N	4139999	63000
TYPE00730	Kelly Slab	\N	ID0258	\N	4250000	130000
TYPE00731	Mochiy Pop One	\N	ID0391	\N	4770000	13000
TYPE00732	Mirza	\N	ID0732	\N	4200000	52000
TYPE00733	Cutive	\N	ID0017	\N	4200000	84000
TYPE00734	Noto Sans Telugu	\N	ID0002	\N	3530000	5200
TYPE00735	Flamenco	\N	ID0173	\N	4000000	60000
TYPE00736	Baloo Tamma 2	\N	ID0037	\N	4139999	8500
TYPE00737	Akshar	\N	ID0737	\N	4500000	15000
TYPE00738	Buenard	\N	ID0591	\N	3800000	54000
TYPE00739	Baloo Paaji 2	\N	ID0037	\N	4480000	10000
TYPE00740	Labrada	\N	ID0740	\N	382000	4100
TYPE00741	Dela Gothic One	\N	ID0741	\N	3910000	19000
TYPE00742	BhuTuka Expanded One	\N	ID0171	\N	3980000	6300
TYPE00743	Kadwa	\N	ID0074	\N	3940000	52000
TYPE00744	Meddon	\N	ID0017	\N	4120000	73000
TYPE00745	Mukta Vaani	\N	ID0037	\N	4010000	64000
TYPE00746	Sofia Sans	\N	ID0688	\N	3730000	9800
TYPE00747	Rouge Script	\N	ID0747	\N	3840000	76000
TYPE00748	Amarante	\N	ID0169	\N	3450000	70000
TYPE00750	IM Fell Double Pica	\N	ID0278	\N	3630000	52000
TYPE00751	Montez	\N	ID0164	\N	3990000	76000
TYPE00752	Familjen Grotesk	\N	ID0752	\N	3730000	6400
TYPE00753	Noto Sans Kannada	\N	ID0002	\N	3610000	5500
TYPE00754	Ms Madi	\N	ID0181	\N	3710000	6700
TYPE00755	Original Surfer	\N	ID0164	\N	3470000	65000
TYPE00756	Harmattan	\N	ID0047	\N	3770000	51000
TYPE00757	Chelsea Market	\N	ID0471	\N	3710000	110000
TYPE00758	Andada Pro	\N	ID0437	\N	3460000	15000
TYPE00759	Ceviche One	\N	ID0121	\N	4070000	53000
TYPE00760	Meera Inimai	\N	ID0760	\N	3740000	48000
TYPE00761	Goblin One	\N	ID0027	\N	3370000	52000
TYPE00762	Goldman	\N	ID0143	\N	3660000	9800
TYPE00763	Fanwood Text	\N	ID0398	\N	3890000	95000
TYPE00764	Carme	\N	ID0764	\N	3530000	63000
TYPE00765	Dokdo	\N	ID0765	\N	3700000	12000
TYPE00766	Azeret Mono	\N	ID0766	\N	3450000	13000
TYPE00767	Phudu	\N	ID0767	\N	133000	4000
TYPE00768	Shantell Sans	\N	ID0768	\N	2310000	4300
TYPE00769	Hurricane	\N	ID0181	\N	3320000	6400
TYPE00770	Sulphur Point	\N	ID0645	\N	3470000	13000
TYPE00771	Antic Didone	\N	ID0056	\N	3550000	68000
TYPE00772	Duru Sans	\N	ID0772	\N	3490000	61000
TYPE00773	Kufam	\N	ID0773	\N	3420000	6800
TYPE00774	Oooh Baby	\N	ID0181	\N	3710000	16000
TYPE00775	Federo	\N	ID0034	\N	3390000	77000
TYPE00776	DotGothic16	\N	ID0639	\N	3250000	6500
TYPE00777	Smooch	\N	ID0181	\N	854000	6500
TYPE00778	Gugi	\N	ID0778	\N	3470000	16000
TYPE00779	Aboreto	\N	ID0779	\N	3570000	26000
TYPE00780	Raleway Dots	\N	ID0018	\N	3480000	73000
TYPE00781	Baloo Chettan 2	\N	ID0037	\N	3570000	10000
TYPE00782	Cambo	\N	ID0437	\N	3910000	56000
TYPE00783	Mako	\N	ID0017	\N	3700000	75000
TYPE00784	Allan	\N	ID0102	\N	3390000	80000
TYPE00785	Supermercado One	\N	ID0370	\N	3320000	51000
TYPE00786	Bakbak One	\N	ID0786	\N	3300000	13000
TYPE00787	Mouse Memoirs	\N	ID0164	\N	3730000	61000
TYPE00788	Poller One	\N	ID0304	\N	3330000	61000
TYPE00789	Oregano	\N	ID0164	\N	3220000	72000
TYPE00790	Skranji	\N	ID0556	\N	3150000	53000
TYPE00791	Elsie	\N	ID0791	\N	3120000	95000
TYPE00792	Anaheim	\N	ID0017	\N	3410000	76000
TYPE00793	Jomhuria	\N	ID0732	\N	3250000	50000
TYPE00794	Noto Sans Sinhala	\N	ID0002	\N	3480000	5500
TYPE00795	Rampart One	\N	ID0639	\N	3470000	8100
TYPE00796	Patrick Hand SC	\N	ID0325	\N	3820000	71000
TYPE00797	Rakkas	\N	ID0797	\N	3350000	100000
TYPE00798	Mr De Haviland	\N	ID0293	\N	3630000	140000
TYPE00799	Expletus Sans	\N	ID0799	\N	3430000	60000
TYPE00800	Megrim	\N	ID0149	\N	3740000	67000
TYPE00801	Aguafina Script	\N	ID0293	\N	3310000	92000
TYPE00802	Averia Sans Libre	\N	ID0534	\N	3100000	60000
TYPE00803	Share Tech	\N	ID0036	\N	3210000	67000
TYPE00804	Ledger	\N	ID0258	\N	3330000	150000
TYPE00805	Yusei Magic	\N	ID0805	\N	3110000	6800
TYPE00806	Nova Mono	\N	ID0806	\N	3260000	56000
TYPE00807	Battambang	\N	ID0359	\N	3090000	54000
TYPE00808	Vast Shadow	\N	ID0311	\N	2990000	62000
TYPE00809	Hi Melody	\N	ID0809	\N	3120000	12000
TYPE00810	Ruslan Display	\N	ID0258	\N	3000000	69000
TYPE00811	Sail	\N	ID0121	\N	2910000	100000
TYPE00812	Ibarra Real Nova	\N	ID0812	\N	3020000	10000
TYPE00813	Mukta Mahee	\N	ID0037	\N	3230000	13000
TYPE00814	Inknut Antiqua	\N	ID0022	\N	2800000	110000
TYPE00815	Emilys Candy	\N	ID0556	\N	3030000	57000
TYPE00816	Galada	\N	ID0816	\N	2840000	60000
TYPE00817	Metamorphous	\N	ID0370	\N	2930000	60000
TYPE00818	Atma	\N	ID0816	\N	2660000	54000
TYPE00819	Bilbo Swash Caps	\N	ID0819	\N	3030000	68000
TYPE00820	Cormorant Unicase	\N	ID0041	\N	2840000	54000
TYPE00821	Tomorrow	\N	ID0821	\N	2820000	10000
TYPE00822	Montaga	\N	ID0822	\N	3110000	57000
TYPE00823	Asul	\N	ID0328	\N	2660000	58000
TYPE00824	Lemon	\N	ID0177	\N	2990000	56000
TYPE00825	Nova Round	\N	ID0806	\N	2930000	66000
TYPE00826	Eater	\N	ID0826	\N	2650000	63000
TYPE00827	Recursive	\N	ID0827	\N	3270000	10000
TYPE00828	Codystar	\N	ID0556	\N	3100000	99000
TYPE00829	Happy Monkey	\N	ID0829	\N	2860000	86000
TYPE00830	Poly	\N	ID0830	\N	3000000	61000
TYPE00831	Kite One	\N	ID0177	\N	2840000	62000
TYPE00832	Saira Stencil One	\N	ID0832	\N	2810000	14000
TYPE00833	Ma Shan Zheng	\N	ID0833	\N	3340000	7200
TYPE00834	Noto Serif Thai	\N	ID0002	\N	2580000	13000
TYPE00835	Chivo Mono	\N	ID0098	\N	3340000	17000
TYPE00836	Euphoria Script	\N	ID0747	\N	2850000	75000
TYPE00837	Sono	\N	ID0380	\N	2720000	5200
TYPE00838	Encode Sans Expanded	\N	ID0051	\N	3370000	22000
TYPE00839	McLaren	\N	ID0164	\N	2910000	54000
TYPE00840	Sue Ellen Francisco	\N	ID0112	\N	2940000	110000
TYPE00841	Wendy One	\N	ID0791	\N	2650000	55000
TYPE00842	Pompiere	\N	ID0169	\N	2810000	94000
TYPE00843	Clicker Script	\N	ID0164	\N	2820000	75000
TYPE00844	Shojumaru	\N	ID0164	\N	2960000	59000
TYPE00845	Prosto One	\N	ID0140	\N	2700000	72000
TYPE00846	Noto Serif Malayalam	\N	ID0002	\N	3270000	5500
TYPE00847	Fresca	\N	ID0195	\N	2410000	59000
TYPE00848	Numans	\N	ID0140	\N	3130000	65000
TYPE00849	Timmana	\N	ID0689	\N	2620000	54000
TYPE00850	Chau Philomene One	\N	ID0390	\N	2800000	55000
TYPE00851	Walter Turncoat	\N	ID0123	\N	2680000	70000
TYPE00852	Give You Glory	\N	ID0112	\N	3010000	60000
TYPE00853	Gloock	\N	ID0853	\N	2860000	4600
TYPE00854	Abyssinica SIL	\N	ID0047	\N	2970000	20000
TYPE00855	Convergence	\N	ID0830	\N	2750000	58000
TYPE00856	Baumans	\N	ID0034	\N	2690000	75000
TYPE00857	Finger Paint	\N	ID0036	\N	2670000	68000
TYPE00858	Doppio One	\N	ID0858	\N	2710000	60000
TYPE00859	Freckle Face	\N	ID0164	\N	2540000	57000
TYPE00860	Farro	\N	ID0860	\N	3690000	10000
TYPE00861	Gajraj One	\N	ID0389	\N	110000	4100
TYPE00862	Frijole	\N	ID0123	\N	2430000	54000
TYPE00863	Gemunu Libre	\N	ID0308	\N	2440000	6600
TYPE00864	Geo	\N	ID0680	\N	2610000	89000
TYPE00865	Noto Sans Georgian	\N	ID0002	\N	2700000	5800
TYPE00866	ZCOOL KuaiLe	\N	ID0866	\N	2390000	9000
TYPE00867	Solway	\N	ID0867	\N	2700000	8800
TYPE00868	Libre Caslon Display	\N	ID0051	\N	2570000	11000
TYPE00869	Scope One	\N	ID0026	\N	2590000	60000
TYPE00870	Mogra	\N	ID0870	\N	2450000	54000
TYPE00871	Balthazar	\N	ID0544	\N	2360000	55000
TYPE00872	Londrina Shadow	\N	ID0385	\N	2140000	55000
TYPE00873	Baloo Bhaina 2	\N	ID0037	\N	2310000	8400
TYPE00874	Coiny	\N	ID0385	\N	2610000	51000
TYPE00875	Faster One	\N	ID0177	\N	2560000	76000
TYPE00876	Xanh Mono	\N	ID0876	\N	2300000	6100
TYPE00877	Puritan	\N	ID0680	\N	2009999	60000
TYPE00878	Inria Sans	\N	ID0878	\N	2240000	9600
TYPE00879	Major Mono Display	\N	ID0879	\N	2820000	12000
TYPE00880	Salsa	\N	ID0439	\N	2420000	80000
TYPE00881	Bellota	\N	ID0707	\N	2380000	11000
TYPE00882	Sofia Sans Semi Condensed	\N	ID0688	\N	2150000	5500
TYPE00883	Ranga	\N	ID0883	\N	2280000	62000
TYPE00884	Shalimar	\N	ID0181	\N	2180000	6100
TYPE00885	Mountains of Christmas	\N	ID0471	\N	2400000	67000
TYPE00886	Zen Tokyo Zoo	\N	ID0346	\N	814000	5900
TYPE00887	Pavanam	\N	ID0887	\N	2560000	70000
TYPE00888	Orienta	\N	ID0177	\N	2510000	58000
TYPE00889	Imprima	\N	ID0177	\N	2310000	65000
TYPE00890	Port Lligat Slab	\N	ID0890	\N	2560000	140000
TYPE00891	Delius Unicase	\N	ID0607	\N	2160000	67000
TYPE00892	BIZ UDPMincho	\N	ID0395	\N	2290000	6900
TYPE00893	Modak	\N	ID0037	\N	2320000	68000
TYPE00894	Charmonman	\N	ID0032	\N	2420000	26000
TYPE00895	Life Savers	\N	ID0051	\N	2340000	55000
TYPE00896	Delius Swash Caps	\N	ID0607	\N	2350000	59000
TYPE00897	Spline Sans	\N	ID0242	\N	2310000	7400
TYPE00898	Over the Rainbow	\N	ID0112	\N	2820000	70000
TYPE00899	Gantari	\N	ID0899	\N	2400000	5800
TYPE00900	Odor Mean Chey	\N	ID0359	\N	2100000	63000
TYPE00901	Dongle	\N	ID0901	\N	3100000	6000
TYPE00902	Gayathri	\N	ID0760	\N	2270000	9100
TYPE00903	Lekton	\N	ID0903	\N	2480000	73000
TYPE00904	Potta One	\N	ID0266	\N	2020000	13000
TYPE00905	Katibeh	\N	ID0732	\N	2100000	50000
TYPE00906	Slackey	\N	ID0123	\N	2100000	57000
TYPE00907	Gamja Flower	\N	ID0809	\N	2250000	19000
TYPE00908	Kaisei Tokumin	\N	ID0704	\N	2069999	6100
TYPE00909	Gaegu	\N	ID0909	\N	2200000	15000
TYPE00910	Nova Cut	\N	ID0806	\N	472000	50000
TYPE00911	Peralta	\N	ID0164	\N	2089999	58000
TYPE00912	Sumana	\N	ID0034	\N	2110000	50000
TYPE00913	Libre Barcode 128	\N	ID0476	\N	2340000	8600
TYPE00914	Cherry Swash	\N	ID0914	\N	1920000	100000
TYPE00915	Ephesis	\N	ID0181	\N	2440000	7200
TYPE00916	Sree Krushnadevaraya	\N	ID0343	\N	1980000	48000
TYPE00917	IM Fell French Canon	\N	ID0278	\N	1860000	57000
TYPE00918	Artifika	\N	ID0034	\N	2089999	62000
TYPE00919	Inria Serif	\N	ID0878	\N	2200000	16000
TYPE00920	Ramaraja	\N	ID0689	\N	2040000	50000
TYPE00921	Tiro Devanagari Hindi	\N	ID0151	\N	2220000	5700
TYPE00922	Nokora	\N	ID0359	\N	2110000	49000
TYPE00923	Sarpanch	\N	ID0010	\N	2020000	58000
TYPE00924	Red Rose	\N	ID0143	\N	2100000	11000
TYPE00925	Bigshot One	\N	ID0316	\N	2080000	60000
TYPE00926	Tienne	\N	ID0017	\N	2100000	52000
TYPE00927	Noto Sans Armenian	\N	ID0002	\N	1750000	5800
TYPE00928	Sofia Sans Extra Condensed	\N	ID0688	\N	1720000	5500
TYPE00929	Lexend Exa	\N	ID0182	\N	2060000	16000
TYPE00930	Vibur	\N	ID0217	\N	2290000	55000
TYPE00931	Birthstone	\N	ID0181	\N	1990000	7800
TYPE00932	Lily Script One	\N	ID0462	\N	1950000	100000
TYPE00933	Hachi Maru Pop	\N	ID0933	\N	1850000	13000
TYPE00934	Prociono	\N	ID0398	\N	1950000	55000
TYPE00935	Asar	\N	ID0027	\N	1960000	53000
TYPE00936	Just Me Again Down Here	\N	ID0112	\N	2049999	72000
TYPE00937	Corinthia	\N	ID0181	\N	1690000	8300
TYPE00938	Belgrano	\N	ID0173	\N	1980000	60000
TYPE00939	Comforter Brush	\N	ID0181	\N	1780000	6700
TYPE00940	Noto Serif Hebrew	\N	ID0002	\N	1820000	5600
TYPE00941	Delicious Handrawn	\N	ID0941	\N	1920000	4100
TYPE00942	Uncial Antiqua	\N	ID0164	\N	1780000	51000
TYPE00943	Tauri	\N	ID0304	\N	1910000	56000
TYPE00944	Besley	\N	ID0086	\N	2000000	7500
TYPE00945	Crafty Girls	\N	ID0471	\N	1970000	110000
TYPE00946	Song Myung	\N	ID0946	\N	1820000	16000
TYPE00947	Varta	\N	ID0483	\N	1980000	8700
TYPE00948	Stick	\N	ID0639	\N	1640000	5700
TYPE00949	Sonsie One	\N	ID0545	\N	1920000	56000
TYPE00950	Londrina Outline	\N	ID0385	\N	1670000	53000
TYPE00951	Medula One	\N	ID0173	\N	1810000	59000
TYPE00952	Kotta One	\N	ID0246	\N	1770000	58000
TYPE00953	Kranky	\N	ID0123	\N	1820000	73000
TYPE00954	MuseoModerno	\N	ID0098	\N	1930000	9100
TYPE00955	Noto Sans Pahawh Hmong	\N	ID0002	\N	61500	5200
TYPE00956	Hina Mincho	\N	ID0265	\N	1750000	6500
TYPE00957	Dynalight	\N	ID0164	\N	2120000	61000
TYPE00958	Baloo Bhaijaan 2	\N	ID0037	\N	1760000	7400
TYPE00959	Akaya Telivigala	\N	ID0959	\N	1810000	17000
TYPE00960	Cherry Cream Soda	\N	ID0154	\N	1800000	82000
TYPE00961	Kaisei Opti	\N	ID0704	\N	1600000	6400
TYPE00962	Carrois Gothic SC	\N	ID0036	\N	1730000	59000
TYPE00963	Voces	\N	ID0367	\N	1840000	73000
TYPE00964	Iceland	\N	ID0034	\N	1600000	54000
TYPE00965	Libre Barcode 39 Text	\N	ID0476	\N	1970000	8500
TYPE00966	Mina	\N	ID0586	\N	1770000	11000
TYPE00967	League Script	\N	ID0643	\N	1830000	56000
TYPE00968	Rum Raisin	\N	ID0164	\N	1690000	61000
TYPE00969	Ribeye	\N	ID0164	\N	1620000	52000
TYPE00970	Lexend Giga	\N	ID0182	\N	1690000	10000
TYPE00971	Gotu	\N	ID0037	\N	1640000	12000
TYPE00972	Trade Winds	\N	ID0123	\N	1620000	61000
TYPE00973	Libre Barcode 39 Extended Text	\N	ID0476	\N	1980000	10000
TYPE00974	Stylish	\N	ID0974	\N	1740000	19000
TYPE00975	Averia Gruesa Libre	\N	ID0534	\N	1620000	54000
TYPE00976	Encode Sans Semi Expanded	\N	ID0051	\N	1850000	32000
TYPE00977	UnifrakturCook	\N	ID0722	\N	1790000	87000
TYPE00978	Baloo Bhai 2	\N	ID0037	\N	1690000	9900
TYPE00979	Baloo Tammudu 2	\N	ID0037	\N	1670000	8100
TYPE00980	Spicy Rice	\N	ID0164	\N	1920000	55000
TYPE00981	Cute Font	\N	ID0981	\N	1730000	15000
TYPE00982	Lexend Peta	\N	ID0182	\N	1970000	8900
TYPE00983	Ranchers	\N	ID0051	\N	1700000	56000
TYPE00984	Bayon	\N	ID0359	\N	1500000	55000
TYPE00985	Denk One	\N	ID0027	\N	1520000	55000
TYPE00986	Miniver	\N	ID0585	\N	1520000	58000
TYPE00987	Fragment Mono	\N	ID0030	\N	1230000	5300
TYPE00988	The Girl Next Door	\N	ID0112	\N	1660000	79000
TYPE00989	Kavoon	\N	ID0461	\N	1530000	60000
TYPE00990	Lovers Quarrel	\N	ID0181	\N	1600000	57000
TYPE00991	Piazzolla	\N	ID0138	\N	1610000	7600
TYPE00992	Dorsa	\N	ID0056	\N	1270000	57000
TYPE00993	Shanti	\N	ID0017	\N	1560000	60000
TYPE00994	Unlock	\N	ID0177	\N	1480000	50000
TYPE00995	Orelega One	\N	ID0995	\N	1680000	10000
TYPE00996	Martian Mono	\N	ID0996	\N	419000	5200
TYPE00997	Gafata	\N	ID0997	\N	1570000	54000
TYPE00998	Rationale	\N	ID0034	\N	1520000	53000
TYPE00999	Qwitcher Grypen	\N	ID0181	\N	1570000	8600
TYPE01000	Sancreek	\N	ID0017	\N	1340000	54000
TYPE01001	Overlock SC	\N	ID0544	\N	1610000	73000
TYPE01002	Monofett	\N	ID0017	\N	1480000	71000
TYPE01003	Stoke	\N	ID0311	\N	1460000	53000
TYPE01004	Macondo Swash Caps	\N	ID0439	\N	1440000	51000
TYPE01005	Wire One	\N	ID0034	\N	1570000	90000
TYPE01006	Solitreo	\N	ID1006	\N	463000	5300
TYPE01007	Nova Square	\N	ID0806	\N	1510000	61000
TYPE01008	Kulim Park	\N	ID0645	\N	1480000	9400
TYPE01009	Jomolhari	\N	ID1009	\N	1380000	8800
TYPE01010	Farsan	\N	ID0679	\N	1490000	53000
TYPE01011	Akronim	\N	ID1011	\N	1480000	67000
TYPE01012	Girassol	\N	ID1012	\N	1370000	7500
TYPE01013	Road Rage	\N	ID0181	\N	1400000	35000
TYPE01014	Cantora One	\N	ID0051	\N	1510000	62000
TYPE01015	Zhi Mang Xing	\N	ID1015	\N	1350000	8800
TYPE01016	Barrio	\N	ID0098	\N	1420000	15000
TYPE01017	Manuale	\N	ID0098	\N	1420000	12000
TYPE01018	Noto Sans Mongolian	\N	ID0002	\N	241000	5300
TYPE01019	Radio Canada	\N	ID1019	\N	1730000	6900
TYPE01020	Suwannaphum	\N	ID0359	\N	1300000	49000
TYPE01021	Strait	\N	ID0177	\N	1530000	52000
TYPE01022	Gorditas	\N	ID1022	\N	1160000	52000
TYPE01023	Nerko One	\N	ID1023	\N	2200000	6200
TYPE01024	Scheherazade New	\N	ID0047	\N	1810000	6700
TYPE01025	Mystery Quest	\N	ID0123	\N	1340000	62000
TYPE01026	IBM Plex Sans Devanagari	\N	ID0049	\N	1400000	6200
TYPE01027	Donegal One	\N	ID0513	\N	1310000	51000
TYPE01028	Iceberg	\N	ID0034	\N	1270000	53000
TYPE01029	BIZ UDGothic	\N	ID0395	\N	1310000	6800
TYPE01030	Alkalami	\N	ID0047	\N	1210000	9600
TYPE01031	Padyakke Expanded One	\N	ID1031	\N	53900	5000
TYPE01032	Yuji Syuku	\N	ID0136	\N	1180000	5700
TYPE01033	Chicle	\N	ID0293	\N	1300000	59000
TYPE01034	East Sea Dokdo	\N	ID0809	\N	1380000	12000
TYPE01035	Paprika	\N	ID0177	\N	1260000	60000
TYPE01036	Redressed	\N	ID0164	\N	1230000	55000
TYPE01037	Gowun Batang	\N	ID0901	\N	1340000	6000
TYPE01038	Comforter	\N	ID0181	\N	1240000	6500
TYPE01039	Habibi	\N	ID0469	\N	1460000	60000
TYPE01040	Rubik Spray Paint	\N	ID0337	\N	230000	6400
TYPE01041	Rubik Vinyl	\N	ID0337	\N	210000	6000
TYPE01042	Rubik 80s Fade	\N	ID0337	\N	166000	7600
TYPE01043	Rubik Storm	\N	ID0337	\N	121000	5700
TYPE01044	Rubik Gemstones	\N	ID0337	\N	93600	6400
TYPE01045	Unkempt	\N	ID0123	\N	1380000	75000
TYPE01046	Kaisei HarunoUmi	\N	ID0704	\N	1090000	6700
TYPE01047	Rosarivo	\N	ID1047	\N	1230000	62000
TYPE01048	Tilt Warp	\N	ID1048	\N	1370000	3900
TYPE01049	Tilt Neon	\N	ID1048	\N	323000	3700
TYPE01050	Tilt Prism	\N	ID1048	\N	221000	3700
TYPE01051	Karantina	\N	ID1051	\N	1230000	7000
TYPE01052	Noto Sans Lao	\N	ID0002	\N	1170000	5300
TYPE01053	Stalemate	\N	ID0164	\N	1220000	71000
TYPE01054	Yomogi	\N	ID0265	\N	1150000	6100
TYPE01055	Gowun Dodum	\N	ID0901	\N	1110000	6100
TYPE01056	Moon Dance	\N	ID0181	\N	1220000	10000
TYPE01057	Princess Sofia	\N	ID0471	\N	1210000	57000
TYPE01058	MonteCarlo	\N	ID0181	\N	1210000	10000
TYPE01059	Khmer	\N	ID0359	\N	1280000	50000
TYPE01060	IBM Plex Sans Thai Looped	\N	ID0049	\N	1270000	14000
TYPE01061	Inspiration	\N	ID0181	\N	1630000	6700
TYPE01062	Ruthie	\N	ID0181	\N	1280000	60000
TYPE01063	Rhodium Libre	\N	ID1031	\N	1180000	50000
TYPE01064	Meie Script	\N	ID0217	\N	1090000	53000
TYPE01065	Vujahday Script	\N	ID0181	\N	1110000	6800
TYPE01066	Port Lligat Sans	\N	ID0890	\N	1300000	64000
TYPE01067	Murecho	\N	ID1067	\N	1220000	6400
TYPE01068	Moul	\N	ID0359	\N	1290000	56000
TYPE01069	IBM Plex Sans JP	\N	ID0049	\N	1070000	5200
TYPE01070	Engagement	\N	ID0164	\N	1200000	56000
TYPE01071	Fontdiner Swanky	\N	ID0154	\N	1140000	62000
TYPE01072	WindSong	\N	ID0181	\N	1190000	7100
TYPE01073	Dekko	\N	ID0027	\N	1200000	50000
TYPE01074	Anek Bangla	\N	ID0037	\N	1150000	8200
TYPE01075	Tiro Bangla	\N	ID0151	\N	951000	5400
TYPE01076	Crushed	\N	ID0164	\N	1110000	73000
TYPE01077	Piedra	\N	ID0293	\N	1180000	53000
TYPE01078	Jolly Lodger	\N	ID0154	\N	1060000	49000
TYPE01079	Ravi Prakash	\N	ID0689	\N	979000	42000
TYPE01080	Shippori Antique	\N	ID0391	\N	1050000	7400
TYPE01081	Viaoda Libre	\N	ID1081	\N	1020000	6900
TYPE01082	Bubbler One	\N	ID0829	\N	1110000	67000
TYPE01083	Beth Ellen	\N	ID1083	\N	1110000	12000
TYPE01084	Grape Nuts	\N	ID0181	\N	1230000	6000
TYPE01085	Vampiro One	\N	ID0545	\N	1110000	77000
TYPE01086	Noto Sans Symbols	\N	ID0002	\N	1370000	5500
TYPE01087	New Rocker	\N	ID0051	\N	1080000	63000
TYPE01088	Molle	\N	ID0566	\N	1110000	50000
TYPE01089	Mochiy Pop P One	\N	ID0391	\N	1050000	12000
TYPE01090	Wellfleet	\N	ID0545	\N	1060000	51000
TYPE01091	Milonga	\N	ID0051	\N	994000	56000
TYPE01092	Square Peg	\N	ID0181	\N	1210000	6600
TYPE01093	Black And White Picture	\N	ID1093	\N	927000	13000
TYPE01094	Red Hat Mono	\N	ID0118	\N	1340000	6700
TYPE01095	Trispace	\N	ID0380	\N	1090000	8000
TYPE01096	Zilla Slab Highlight	\N	ID0116	\N	1170000	15000
TYPE01097	Cagliostro	\N	ID0066	\N	1050000	56000
TYPE01098	Offside	\N	ID0177	\N	1030000	87000
TYPE01099	Elsie Swash Caps	\N	ID0791	\N	961000	61000
TYPE01100	MedievalSharp	\N	ID0806	\N	1000000	52000
TYPE01101	Noto Sans Oriya	\N	ID0002	\N	961000	5100
TYPE01102	Akaya Kanadaka	\N	ID0959	\N	1010000	19000
TYPE01103	Fenix	\N	ID1103	\N	1010000	52000
TYPE01104	Zen Dots	\N	ID0346	\N	971000	8100
TYPE01105	Sura	\N	ID1105	\N	1060000	49000
TYPE01106	Romanesco	\N	ID0164	\N	926000	72000
TYPE01107	Caesar Dressing	\N	ID0585	\N	939000	53000
TYPE01108	Yaldevi	\N	ID0308	\N	1030000	6000
TYPE01109	Dr Sugiyama	\N	ID0293	\N	729000	58000
TYPE01110	Underdog	\N	ID1110	\N	917000	65000
TYPE01111	Encode Sans SC	\N	ID0051	\N	884000	6300
TYPE01112	Train One	\N	ID0639	\N	1020000	6200
TYPE01113	Anek Telugu	\N	ID0037	\N	1180000	7000
TYPE01114	Sarina	\N	ID0370	\N	1020000	100000
TYPE01115	Fascinate	\N	ID0164	\N	947000	49000
TYPE01116	Sahitya	\N	ID0138	\N	982000	51000
TYPE01117	Noto Sans Gujarati	\N	ID0002	\N	885000	5300
TYPE01118	Kantumruy Pro	\N	ID1118	\N	934000	5500
TYPE01119	Noto Sans Khmer	\N	ID0002	\N	875000	5300
TYPE01120	Margarine	\N	ID0164	\N	987000	54000
TYPE01121	Metal Mania	\N	ID0585	\N	982000	61000
TYPE01122	Poor Story	\N	ID1122	\N	1180000	18000
TYPE01123	Tulpen One	\N	ID1123	\N	964000	53000
TYPE01124	Anek Devanagari	\N	ID0037	\N	947000	9000
TYPE01125	Kavivanar	\N	ID0887	\N	956000	48000
TYPE01126	Nova Flat	\N	ID0806	\N	914000	64000
TYPE01127	Stint Ultra Expanded	\N	ID0164	\N	1080000	65000
TYPE01128	Arima	\N	ID0081	\N	1070000	7900
TYPE01129	Eagle Lake	\N	ID0164	\N	967000	59000
TYPE01130	Passions Conflict	\N	ID0181	\N	940000	5700
TYPE01131	Liu Jian Mao Cao	\N	ID1131	\N	868000	10000
TYPE01132	Lexend Mega	\N	ID0182	\N	1030000	11000
TYPE01133	Simonetta	\N	ID0570	\N	889000	55000
TYPE01134	Buda	\N	ID1134	\N	888000	55000
TYPE01135	Inika	\N	ID1135	\N	933000	56000
TYPE01136	Linden Hill	\N	ID0398	\N	909000	51000
TYPE01137	Noto Sans SignWriting	\N	ID0002	\N	43300	4400
TYPE01138	Srisakdi	\N	ID0032	\N	970000	18000
TYPE01139	M PLUS 1 Code	\N	ID0093	\N	864000	5300
TYPE01140	Fascinate Inline	\N	ID0164	\N	1180000	54000
TYPE01141	Fuzzy Bubbles	\N	ID0181	\N	967000	6800
TYPE01142	Text Me One	\N	ID0462	\N	899000	57000
TYPE01143	Long Cang	\N	ID1143	\N	896000	7000
TYPE01144	Joti One	\N	ID0177	\N	868000	52000
TYPE01145	Noto Sans Modi	\N	ID0002	\N	54300	5100
TYPE01146	Diplomata	\N	ID0177	\N	907000	51000
TYPE01147	Bigelow Rules	\N	ID0164	\N	872000	53000
TYPE01148	Genos	\N	ID0181	\N	822000	6000
TYPE01149	Bona Nova	\N	ID0587	\N	1050000	8600
TYPE01150	Bilbo	\N	ID0181	\N	922000	58000
TYPE01151	Licorice	\N	ID0181	\N	928000	7300
TYPE01152	Keania One	\N	ID0462	\N	866000	60000
TYPE01153	Modern Antiqua	\N	ID0806	\N	837000	53000
TYPE01154	Content	\N	ID0359	\N	856000	52000
TYPE01155	Carattere	\N	ID0181	\N	790000	8000
TYPE01156	Jacques Francois	\N	ID0034	\N	773000	53000
TYPE01157	Spirax	\N	ID0829	\N	832000	55000
TYPE01158	Maiden Orange	\N	ID0164	\N	746000	56000
TYPE01159	Griffy	\N	ID0556	\N	814000	52000
TYPE01160	Montagu Slab	\N	ID0072	\N	1170000	8900
TYPE01161	Qahiri	\N	ID0175	\N	801000	5900
TYPE01162	Noto Serif Lao	\N	ID0002	\N	750000	5400
TYPE01163	Condiment	\N	ID0293	\N	851000	77000
TYPE01164	Plaster	\N	ID0027	\N	999000	52000
TYPE01165	Joan	\N	ID1165	\N	760000	5600
TYPE01166	Yeon Sung	\N	ID1166	\N	801000	12000
TYPE01167	Marhey	\N	ID1167	\N	228000	5000
TYPE01168	Nosifer	\N	ID0826	\N	772000	59000
TYPE01169	Kirang Haerang	\N	ID0472	\N	786000	12000
TYPE01170	Jacques Francois Shadow	\N	ID0034	\N	820000	54000
TYPE01171	Nuosu SIL	\N	ID0047	\N	718000	5900
TYPE01172	Nova Slim	\N	ID0806	\N	674000	64000
TYPE01173	Ruluko	\N	ID0698	\N	809000	59000
TYPE01174	Anek Latin	\N	ID0037	\N	896000	8500
TYPE01175	Englebert	\N	ID0164	\N	737000	57000
TYPE01176	Atomic Age	\N	ID0370	\N	681000	52000
TYPE01177	Bahiana	\N	ID0098	\N	673000	11000
TYPE01178	Hanalei Fill	\N	ID0164	\N	658000	74000
TYPE01179	Risque	\N	ID0164	\N	769000	61000
TYPE01180	Festive	\N	ID0181	\N	614000	5700
TYPE01181	Snippet	\N	ID0316	\N	725000	66000
TYPE01182	Noto Serif Kannada	\N	ID0002	\N	731000	5500
TYPE01183	Waterfall	\N	ID0181	\N	936000	6300
TYPE01184	Autour One	\N	ID0027	\N	733000	58000
TYPE01185	Croissant One	\N	ID0177	\N	692000	54000
TYPE01186	Lancelot	\N	ID1186	\N	635000	50000
TYPE01187	Mrs Sheppards	\N	ID0293	\N	767000	78000
TYPE01188	Swanky and Moo Moo	\N	ID0112	\N	819000	58000
TYPE01189	Libre Barcode 128 Text	\N	ID0476	\N	784000	7900
TYPE01190	Noto Serif Georgian	\N	ID0002	\N	746000	5800
TYPE01191	Shippori Antique B1	\N	ID0391	\N	654000	6400
TYPE01192	Mohave	\N	ID1192	\N	710000	6100
TYPE01193	Felipa	\N	ID0195	\N	894000	54000
TYPE01194	Chathura	\N	ID0689	\N	856000	49000
TYPE01195	Peddana	\N	ID0689	\N	732000	49000
TYPE01196	Arbutus	\N	ID0169	\N	685000	55000
TYPE01197	Junge	\N	ID0034	\N	764000	52000
TYPE01198	Marko One	\N	ID0034	\N	700000	70000
TYPE01199	Jim Nightshade	\N	ID0164	\N	649000	57000
TYPE01200	Beau Rivage	\N	ID0181	\N	627000	7400
TYPE01201	Stalinist One	\N	ID1201	\N	763000	50000
TYPE01202	Tiro Gurmukhi	\N	ID0151	\N	647000	5000
TYPE01203	IM Fell DW Pica SC	\N	ID0278	\N	629000	62000
TYPE01204	Gidugu	\N	ID0343	\N	684000	50000
TYPE01205	Noto Sans Lao Looped	\N	ID0002	\N	106000	5200
TYPE01206	Birthstone Bounce	\N	ID0181	\N	673000	7600
TYPE01207	IBM Plex Sans Hebrew	\N	ID0049	\N	632000	7000
TYPE01208	New Tegomin	\N	ID1208	\N	692000	5900
TYPE01209	Galdeano	\N	ID0544	\N	660000	51000
TYPE01210	Benne	\N	ID1210	\N	634000	7300
TYPE01211	Gluten	\N	ID0380	\N	683000	5900
TYPE01212	Amiri Quran	\N	ID0175	\N	617000	8100
TYPE01213	Meow Script	\N	ID0181	\N	592000	7100
TYPE01214	DynaPuff	\N	ID0275	\N	664000	5800
TYPE01215	Smythe	\N	ID0017	\N	589000	50000
TYPE01216	Passero One	\N	ID0461	\N	592000	53000
TYPE01217	Stick No Bills	\N	ID0308	\N	622000	5500
TYPE01218	Zen Antique Soft	\N	ID0346	\N	635000	6300
TYPE01219	Gulzar	\N	ID0365	\N	726000	5000
TYPE01220	Ribeye Marrow	\N	ID0164	\N	618000	57000
TYPE01221	IM Fell Great Primer SC	\N	ID0278	\N	551000	59000
TYPE01222	Climate Crisis	\N	ID1222	\N	230000	4200
TYPE01223	Seymour One	\N	ID0017	\N	581000	53000
TYPE01224	BIZ UDMincho	\N	ID0395	\N	568000	6700
TYPE01225	Emblema One	\N	ID0545	\N	566000	54000
TYPE01226	Oldenburg	\N	ID0311	\N	631000	50000
TYPE01227	Ewert	\N	ID0217	\N	559000	58000
TYPE01228	Grenze	\N	ID0098	\N	628000	7800
TYPE01229	Noto Sans Tangsa	\N	ID0002	\N	161000	4400
TYPE01230	Combo	\N	ID0177	\N	570000	51000
TYPE01231	Lakki Reddy	\N	ID0689	\N	630000	50000
TYPE01232	Diplomata SC	\N	ID0177	\N	566000	66000
TYPE01233	Bahianita	\N	ID0098	\N	479000	8200
TYPE01234	Glass Antiqua	\N	ID0258	\N	586000	71000
TYPE01235	IM Fell French Canon SC	\N	ID0278	\N	564000	51000
TYPE01236	Noto Sans Symbols 2	\N	ID0002	\N	576000	5300
TYPE01237	Kumar One	\N	ID0010	\N	582000	47000
TYPE01238	Erica One	\N	ID0121	\N	537000	61000
TYPE01239	Trochut	\N	ID1239	\N	518000	64000
TYPE01240	Dangrek	\N	ID0359	\N	558000	51000
TYPE01241	Chilanka	\N	ID0760	\N	681000	8900
TYPE01242	Noto Serif Toto	\N	ID0002	\N	83400	4600
TYPE01243	Siemreap	\N	ID0359	\N	625000	50000
TYPE01244	Galindo	\N	ID0164	\N	493000	50000
TYPE01245	Noto Serif Sinhala	\N	ID0002	\N	506000	5400
TYPE01246	Metal	\N	ID0359	\N	549000	50000
TYPE01247	Imbue	\N	ID0380	\N	552000	6000
TYPE01248	Devonshire	\N	ID0164	\N	573000	53000
TYPE01249	Bokor	\N	ID0359	\N	531000	51000
TYPE01250	Bungee Outline	\N	ID0285	\N	507000	49000
TYPE01251	Noto Serif Khojki	\N	ID0002	\N	96900	4600
TYPE01252	Sedgwick Ave Display	\N	ID0646	\N	556000	13000
TYPE01253	Purple Purse	\N	ID0164	\N	606000	51000
TYPE01254	BioRhyme Expanded	\N	ID0564	\N	508000	48000
TYPE01255	Whisper	\N	ID0181	\N	526000	5500
TYPE01256	The Nautigal	\N	ID0181	\N	509000	7100
TYPE01257	Almendra SC	\N	ID0698	\N	541000	55000
TYPE01258	Revalia	\N	ID0217	\N	525000	60000
TYPE01259	Anek Gujarati	\N	ID0037	\N	458000	7700
TYPE01260	Luxurious Script	\N	ID0181	\N	452000	5600
TYPE01261	Gentium Plus	\N	ID0047	\N	504000	5400
TYPE01262	Almendra Display	\N	ID0698	\N	462000	65000
TYPE01263	Praise	\N	ID0181	\N	483000	11000
TYPE01264	Federant	\N	ID0034	\N	420000	49000
TYPE01265	Gupter	\N	ID1265	\N	472000	7400
TYPE01266	Bungee Hairline	\N	ID0285	\N	474000	50000
TYPE01267	Asset	\N	ID0545	\N	483000	52000
TYPE01268	Kumar One Outline	\N	ID0010	\N	439000	48000
TYPE01269	Water Brush	\N	ID0181	\N	497000	5700
TYPE01270	Cairo Play	\N	ID0065	\N	132000	6800
TYPE01271	Single Day	\N	ID1271	\N	617000	9600
TYPE01272	Big Shoulders Stencil Text	\N	ID0491	\N	449000	6900
TYPE01273	Vibes	\N	ID1273	\N	417000	8000
TYPE01274	Sunshiney	\N	ID0123	\N	470000	53000
TYPE01275	Nabla	\N	ID1275	\N	289000	5000
TYPE01276	Langar	\N	ID1276	\N	415000	6400
TYPE01277	Barriecito	\N	ID0098	\N	421000	9300
TYPE01278	Noto Sans Ethiopic	\N	ID0002	\N	439000	4700
TYPE01279	Lexend Tera	\N	ID0182	\N	442000	8500
TYPE01280	Flavors	\N	ID0123	\N	446000	52000
TYPE01281	Big Shoulders Stencil Display	\N	ID0491	\N	417000	7900
TYPE01282	Noto Serif Armenian	\N	ID0002	\N	493000	5600
TYPE01283	Astloch	\N	ID0712	\N	394000	59000
TYPE01284	Tiro Devanagari Sanskrit	\N	ID0151	\N	385000	5100
TYPE01285	Texturina	\N	ID1285	\N	417000	6200
TYPE01286	Butterfly Kids	\N	ID0471	\N	428000	51000
TYPE01287	Charis SIL	\N	ID0047	\N	393000	5600
TYPE01288	Alumni Sans Inline One	\N	ID0181	\N	384000	9000
TYPE01289	Neonderthaw	\N	ID0181	\N	512000	5300
TYPE01290	Kdam Thmor Pro	\N	ID1118	\N	395000	5600
TYPE01291	Noto Sans Samaritan	\N	ID0002	\N	441000	5300
TYPE01292	Bonheur Royale	\N	ID0181	\N	399000	8700
TYPE01293	Geostar Fill	\N	ID0070	\N	362000	51000
TYPE01294	GFS Neohellenic	\N	ID0500	\N	371000	53000
TYPE01295	Miss Fajardose	\N	ID0293	\N	427000	58000
TYPE01296	Londrina Sketch	\N	ID0385	\N	367000	56000
TYPE01297	Ruge Boogie	\N	ID0181	\N	355000	57000
TYPE01298	Aubrey	\N	ID0034	\N	364000	51000
TYPE01299	Lavishly Yours	\N	ID0181	\N	424000	6500
TYPE01300	Rubik Distressed	\N	ID0337	\N	342000	7100
TYPE01301	Mea Culpa	\N	ID0181	\N	342000	5400
TYPE01302	Libre Barcode 39 Extended	\N	ID0476	\N	406000	6800
TYPE01303	IM Fell Double Pica SC	\N	ID0278	\N	322000	50000
TYPE01304	Zen Loop	\N	ID0346	\N	211000	5700
TYPE01305	Suravaram	\N	ID0343	\N	371000	49000
TYPE01306	Lacquer	\N	ID1306	\N	337000	7000
TYPE01307	Noto Serif Gujarati	\N	ID0002	\N	325000	5400
TYPE01308	Rubik Beastly	\N	ID0337	\N	358000	8200
TYPE01309	Finlandica	\N	ID1309	\N	348000	5400
TYPE01310	Ballet	\N	ID0098	\N	353000	7700
TYPE01311	Noto Serif Khmer	\N	ID0002	\N	313000	5300
TYPE01312	Preahvihear	\N	ID0359	\N	335000	51000
TYPE01313	Mr Bedfort	\N	ID0293	\N	360000	58000
TYPE01314	Rubik Wet Paint	\N	ID0337	\N	354000	6300
TYPE01315	Tai Heritage Pro	\N	ID0047	\N	314000	5500
TYPE01316	Kenia	\N	ID0462	\N	309000	52000
TYPE01317	Caramel	\N	ID0181	\N	362000	6600
TYPE01318	Chenla	\N	ID0359	\N	296000	50000
TYPE01319	Noto Serif Tangut	\N	ID0002	\N	293000	5300
TYPE01320	Edu NSW ACT Foundation	\N	ID0321	\N	264000	5400
TYPE01321	Gideon Roman	\N	ID0181	\N	296000	6200
TYPE01322	Truculenta	\N	ID0098	\N	304000	7600
TYPE01323	Noto Sans Saurashtra	\N	ID0002	\N	56300	5200
TYPE01324	Geostar	\N	ID0070	\N	281000	51000
TYPE01325	Taprom	\N	ID0359	\N	275000	49000
TYPE01326	Fruktur	\N	ID0461	\N	305000	49000
TYPE01327	Rubik Glitch	\N	ID0337	\N	309000	6700
TYPE01328	Rubik Puddles	\N	ID0337	\N	301000	6100
TYPE01329	Butcherman	\N	ID0826	\N	331000	53000
TYPE01330	Hubballi	\N	ID0171	\N	280000	5300
TYPE01331	Nova Oval	\N	ID0806	\N	316000	63000
TYPE01332	Tiro Devanagari Marathi	\N	ID0151	\N	317000	5100
TYPE01333	Anek Gurmukhi	\N	ID0037	\N	288000	16000
TYPE01334	Sofadi One	\N	ID0297	\N	335000	50000
TYPE01335	Send Flowers	\N	ID0181	\N	217000	5900
TYPE01336	Rubik Bubbles	\N	ID0337	\N	335000	7700
TYPE01337	Fuggles	\N	ID0181	\N	358000	6000
TYPE01338	Snowburst One	\N	ID1338	\N	315000	52000
TYPE01339	Noto Serif Oriya	\N	ID0002	\N	59900	4600
TYPE01340	Uchen	\N	ID1009	\N	286000	5500
TYPE01341	Noto Sans Thai Looped	\N	ID0002	\N	322000	13000
TYPE01342	Imperial Script	\N	ID0181	\N	293000	5900
TYPE01343	Anek Odia	\N	ID0037	\N	277000	6900
TYPE01344	Dhurjati	\N	ID0343	\N	295000	50000
TYPE01345	Koh Santepheap	\N	ID0359	\N	300000	5500
TYPE01346	Sassy Frass	\N	ID0181	\N	357000	6000
TYPE01347	Blaka Hollow	\N	ID0065	\N	228000	5500
TYPE01348	Noto Serif Hong Kong	\N	ID0002	\N	457000	4900
TYPE01349	Big Shoulders Inline Text	\N	ID0491	\N	250000	6900
TYPE01350	Edu QLD Beginner	\N	ID0321	\N	166000	5300
TYPE01351	Anek Kannada	\N	ID0037	\N	240000	7200
TYPE01352	Blaka	\N	ID0065	\N	238000	5500
TYPE01353	Babylonica	\N	ID0181	\N	263000	7200
TYPE01354	Gentium Book Plus	\N	ID0047	\N	244000	5400
TYPE01355	Hanalei	\N	ID0164	\N	249000	51000
TYPE01356	Gwendolyn	\N	ID0181	\N	254000	5700
TYPE01357	Alumni Sans Collegiate One	\N	ID0181	\N	242000	9100
TYPE01358	Rubik Marker Hatch	\N	ID0337	\N	133000	6400
TYPE01359	Rubik Iso	\N	ID0337	\N	108000	6400
TYPE01360	Rubik Burned	\N	ID0337	\N	80200	7400
TYPE01361	Rubik Maze	\N	ID0337	\N	68300	6300
TYPE01362	Fleur De Leah	\N	ID0181	\N	231000	6100
TYPE01363	Sevillana	\N	ID0570	\N	257000	51000
TYPE01364	Moulpali	\N	ID0359	\N	238000	51000
TYPE01365	Alumni Sans Pinstripe	\N	ID0181	\N	202000	10000
TYPE01366	Noto Sans Javanese	\N	ID0002	\N	236000	5900
TYPE01367	Nova Script	\N	ID0806	\N	253000	53000
TYPE01368	Noto Serif Tamil	\N	ID0002	\N	164000	5400
TYPE01369	Noto Sans Adlam Unjoined	\N	ID0002	\N	172000	5900
TYPE01370	Miltonian	\N	ID0051	\N	280000	50000
TYPE01371	Big Shoulders Inline Display	\N	ID0491	\N	236000	7900
TYPE01372	Miltonian Tattoo	\N	ID0051	\N	239000	52000
TYPE01373	Noto Sans Gurmukhi	\N	ID0002	\N	213000	5300
TYPE01374	Libre Barcode EAN13 Text	\N	ID0476	\N	197000	5500
TYPE01375	Bonbon	\N	ID0034	\N	243000	96000
TYPE01376	Aref Ruqaa Ink	\N	ID0673	\N	202000	7800
TYPE01377	Updock	\N	ID0181	\N	237000	5100
TYPE01378	Noto Sans Syloti Nagri	\N	ID0002	\N	212000	5200
TYPE01379	Island Moments	\N	ID0181	\N	214000	6700
TYPE01380	Tourney	\N	ID0380	\N	212000	5700
TYPE01381	Oi	\N	ID0263	\N	196000	6300
TYPE01382	Noto Serif Telugu	\N	ID0002	\N	186000	5400
TYPE01383	Edu VIC WA NT Beginner	\N	ID0321	\N	198000	5100
TYPE01384	Edu SA Beginner	\N	ID0321	\N	173000	5000
TYPE01385	Luxurious Roman	\N	ID0181	\N	181000	5500
TYPE01386	Noto Sans Coptic	\N	ID0002	\N	142000	5300
TYPE01387	Tiro Telugu	\N	ID0151	\N	171000	5000
TYPE01388	Warnes	\N	ID0177	\N	157000	53000
TYPE01389	Tiro Tamil	\N	ID0151	\N	156000	5000
TYPE01390	Grechen Fuemen	\N	ID0181	\N	173000	5900
TYPE01391	Petemoss	\N	ID0181	\N	169000	5500
TYPE01392	Noto Serif Ethiopic	\N	ID0002	\N	121000	5400
TYPE01393	Mingzat	\N	ID0047	\N	66900	5000
TYPE01394	Splash	\N	ID0181	\N	158000	5600
TYPE01395	Reem Kufi Fun	\N	ID0175	\N	192000	6200
TYPE01396	Noto Serif Tibetan	\N	ID0002	\N	158000	5300
TYPE01397	Palette Mosaic	\N	ID1397	\N	178000	4700
TYPE01398	Bungee Spice	\N	ID0285	\N	179000	5600
TYPE01399	Noto Sans Newa	\N	ID0002	\N	53300	5100
TYPE01400	Yuji Mai	\N	ID0136	\N	156000	5200
TYPE01401	Syne Tactile	\N	ID0421	\N	148000	5800
TYPE01402	Tapestry	\N	ID0181	\N	138000	5300
TYPE01403	Redacted Script	\N	ID0097	\N	188000	7200
TYPE01404	Noto Sans Adlam	\N	ID0002	\N	143000	6500
TYPE01405	Noto Rashi Hebrew	\N	ID0002	\N	128000	6200
TYPE01406	Noto Sans Masaram Gondi	\N	ID0002	\N	52000	5200
TYPE01407	Noto Sans Meetei Mayek	\N	ID0002	\N	114000	4900
TYPE01408	Noto Sans Lepcha	\N	ID0002	\N	128000	5200
TYPE01409	Rubik Microbe	\N	ID0337	\N	130000	7200
TYPE01410	My Soul	\N	ID0181	\N	172000	5400
TYPE01411	Noto Sans Sora Sompeng	\N	ID0002	\N	137000	5900
TYPE01412	Kolker Brush	\N	ID0181	\N	158000	5100
TYPE01413	Love Light	\N	ID0181	\N	125000	5500
TYPE01414	Are You Serious	\N	ID0181	\N	132000	7900
TYPE01415	Rock 3D	\N	ID1397	\N	145000	5700
TYPE01416	M PLUS Code Latin	\N	ID0093	\N	108000	5700
TYPE01417	Noto Music	\N	ID0002	\N	112000	6200
TYPE01418	Noto Sans Canadian Aboriginal	\N	ID0002	\N	105000	5400
TYPE01419	Flow Block	\N	ID0701	\N	119000	5100
TYPE01420	Estonia	\N	ID0181	\N	114000	5300
TYPE01421	Twinkle Star	\N	ID0181	\N	99800	5400
TYPE01422	Explora	\N	ID0181	\N	109000	6400
TYPE01423	Noto Sans Warang Citi	\N	ID0002	\N	50600	5200
TYPE01424	Noto Sans Miao	\N	ID0002	\N	86200	5100
TYPE01425	Kings	\N	ID0181	\N	96400	5000
TYPE01426	Reem Kufi Ink	\N	ID0175	\N	97300	6100
TYPE01427	Shizuru	\N	ID1397	\N	93900	4300
TYPE01428	Grey Qo	\N	ID0181	\N	101000	5800
TYPE01429	Noto Serif Ahom	\N	ID0002	\N	88100	5500
TYPE01430	Moo Lah Lah	\N	ID0181	\N	95000	9600
TYPE01431	Noto Traditional NÃ¼shu	\N	ID0002	\N	87100	5400
TYPE01432	Noto Sans Mro	\N	ID0002	\N	52300	5000
TYPE01433	Cherish	\N	ID0181	\N	90500	5900
TYPE01434	Ingrid Darling	\N	ID0181	\N	74300	5000
TYPE01435	Noto Sans Old Italic	\N	ID0002	\N	80800	5300
TYPE01436	Puppies Play	\N	ID0181	\N	95800	6200
TYPE01437	Noto Sans Hatran	\N	ID0002	\N	68300	5200
TYPE01438	Ole	\N	ID0181	\N	83900	5200
TYPE01439	Flow Rounded	\N	ID0701	\N	81300	5100
TYPE01440	Blaka Ink	\N	ID0065	\N	70100	5400
TYPE01441	Noto Sans Cham	\N	ID0002	\N	75800	5300
TYPE01442	Noto Sans Bamum	\N	ID0002	\N	71600	5400
TYPE01443	Noto Sans Avestan	\N	ID0002	\N	72300	5500
TYPE01444	Noto Sans Thaana	\N	ID0002	\N	95500	5200
TYPE01445	Noto Sans Ugaritic	\N	ID0002	\N	62400	5200
TYPE01446	Noto Sans Marchen	\N	ID0002	\N	76200	5100
TYPE01447	Noto Sans Tagalog	\N	ID0002	\N	72500	5100
TYPE01448	Noto Sans Cherokee	\N	ID0002	\N	83300	5300
TYPE01449	Noto Sans Old Persian	\N	ID0002	\N	61500	5200
TYPE01450	Noto Sans Balinese	\N	ID0002	\N	72400	5500
TYPE01451	Noto Sans Tai Viet	\N	ID0002	\N	71200	5100
TYPE01452	Noto Serif Nyiakeng Puachue Hmong	\N	ID0002	\N	61600	4600
TYPE01453	Noto Sans Kayah Li	\N	ID0002	\N	67200	5200
TYPE01454	Noto Sans Sharada	\N	ID0002	\N	63500	5200
TYPE01455	Yuji Hentaigana Akebono	\N	ID0136	\N	69300	4300
TYPE01456	Noto Sans Limbu	\N	ID0002	\N	60300	5100
TYPE01457	Noto Sans Bassa Vah	\N	ID0002	\N	57600	5600
TYPE01458	Noto Sans Yi	\N	ID0002	\N	59700	5200
TYPE01459	Noto Sans Tai Tham	\N	ID0002	\N	61000	5200
TYPE01460	Noto Sans Osage	\N	ID0002	\N	51100	5100
TYPE01461	Noto Sans Buhid	\N	ID0002	\N	54000	5300
TYPE01462	Noto Serif Balinese	\N	ID0002	\N	57400	5400
TYPE01463	Noto Sans Multani	\N	ID0002	\N	50300	5200
TYPE01464	Yuji Hentaigana Akari	\N	ID0136	\N	60800	4300
TYPE01465	Noto Serif Grantha	\N	ID0002	\N	51000	5300
TYPE01466	Noto Sans Zanabazar Square	\N	ID0002	\N	58300	5400
TYPE01467	Noto Sans Buginese	\N	ID0002	\N	55400	5300
TYPE01468	Noto Sans Ol Chiki	\N	ID0002	\N	57100	5100
TYPE01469	Noto Serif Gurmukhi	\N	ID0002	\N	57900	5300
TYPE01470	Noto Sans Mende Kikakui	\N	ID0002	\N	50800	4500
TYPE01471	Noto Sans Medefaidrin	\N	ID0002	\N	54000	5600
TYPE01472	Noto Sans Takri	\N	ID0002	\N	52800	5100
TYPE01473	Noto Sans Vai	\N	ID0002	\N	49400	5200
TYPE01474	Noto Sans Tifinagh	\N	ID0002	\N	78200	5200
TYPE01475	Noto Sans Lisu	\N	ID0002	\N	47800	5100
TYPE01476	Noto Sans Psalter Pahlavi	\N	ID0002	\N	48400	5200
TYPE01477	Noto Sans N'Ko	\N	ID0002	\N	46200	4000
TYPE01478	Noto Sans Palmyrene	\N	ID0002	\N	45500	5300
TYPE01479	Noto Sans Rejang	\N	ID0002	\N	47200	5100
TYPE01480	Noto Sans Chakma	\N	ID0002	\N	47100	5300
TYPE01481	Noto Sans Siddham	\N	ID0002	\N	45200	5100
TYPE01482	Noto Sans Hanunoo	\N	ID0002	\N	46000	6000
TYPE01483	Noto Sans Grantha	\N	ID0002	\N	43300	5200
TYPE01484	Noto Sans Old North Arabian	\N	ID0002	\N	40400	5200
TYPE01485	Noto Sans Old South Arabian	\N	ID0002	\N	41100	5500
TYPE01486	Noto Sans Batak	\N	ID0002	\N	43200	5400
TYPE01487	Noto Sans Tagbanwa	\N	ID0002	\N	45000	5200
TYPE01488	Noto Sans Tamil Supplement	\N	ID0002	\N	41600	5300
TYPE01489	Noto Sans Elbasan	\N	ID0002	\N	39200	5200
TYPE01490	Noto Sans Syriac	\N	ID0002	\N	40900	5200
TYPE01491	Noto Sans Wancho	\N	ID0002	\N	40700	5200
TYPE01492	Noto Sans Inscriptional Parthian	\N	ID0002	\N	41000	5500
TYPE01493	Noto Sans Kharoshthi	\N	ID0002	\N	37500	5200
TYPE01494	Noto Sans New Tai Lue	\N	ID0002	\N	38600	5100
TYPE01495	Noto Sans Hanifi Rohingya	\N	ID0002	\N	37800	5200
TYPE01496	Noto Sans Tai Le	\N	ID0002	\N	39800	5200
TYPE01497	Noto Sans Old Permic	\N	ID0002	\N	34400	5200
TYPE01498	Noto Sans Duployan	\N	ID0002	\N	36500	5200
TYPE01499	Noto Sans NÃ¼shu	\N	ID0002	\N	36800	5100
TYPE01500	Noto Sans Old Sogdian	\N	ID0002	\N	36400	5100
TYPE01501	Noto Sans Meroitic	\N	ID0002	\N	36500	5100
TYPE01502	Noto Sans Osmanya	\N	ID0002	\N	36000	5100
TYPE01503	Noto Sans Pau Cin Hau	\N	ID0002	\N	36300	5200
TYPE01504	Noto Sans Khojki	\N	ID0002	\N	35200	5100
TYPE01505	Noto Sans Sogdian	\N	ID0002	\N	34500	5100
TYPE01506	Noto Sans Nabataean	\N	ID0002	\N	34800	5000
TYPE01507	Noto Color Emoji	\N	ID0002	\N	372000000	6000
TYPE01508	Noto Sans Arabic	\N	ID0002	\N	142000000	8100
TYPE01509	Noto Kufi Arabic	\N	ID0002	\N	61300000	9000
TYPE01510	Noto Sans Tirhuta	\N	ID0002	\N	53100	5200
TYPE01511	Noto Sans Bhaiksuki	\N	ID0002	\N	51100	5300
TYPE01512	Noto Sans Myanmar	\N	ID0002	\N	1480000	5200
TYPE01513	Noto Sans Math	\N	ID0002	\N	1060000	5200
TYPE01514	Noto Emoji	\N	ID0002	\N	1110000	5400
TYPE01515	Noto Sans Anatolian Hieroglyphs	\N	ID0002	\N	912000	6400
TYPE01516	Noto Sans Gothic	\N	ID0002	\N	469000	5600
TYPE01517	Noto Sans Mayan Numerals	\N	ID0002	\N	51500	5500
TYPE01518	Noto Serif Dogra	\N	ID0002	\N	54900	5300
TYPE01519	Noto Sans Khudawadi	\N	ID0002	\N	55000	5100
TYPE01520	Noto Sans Carian	\N	ID0002	\N	103000	5600
TYPE01521	Noto Sans Cypriot	\N	ID0002	\N	121000	5200
TYPE01522	Noto Sans Deseret	\N	ID0002	\N	89700	5200
TYPE01523	Noto Sans Imperial Aramaic	\N	ID0002	\N	72000	5400
TYPE01524	Noto Serif Myanmar	\N	ID0002	\N	73600	5300
TYPE01525	Noto Sans Egyptian Hieroglyphs	\N	ID0002	\N	75200	5300
TYPE01526	Noto Sans Cuneiform	\N	ID0002	\N	59400	5200
TYPE01527	Noto Sans Inscriptional Pahlavi	\N	ID0002	\N	58600	5400
TYPE01528	Noto Sans Glagolitic	\N	ID0002	\N	64400	5200
TYPE01529	Noto Sans Brahmi	\N	ID0002	\N	57100	5300
TYPE01530	Noto Sans Shavian	\N	ID0002	\N	47000	5100
TYPE01531	Noto Sans Mahajani	\N	ID0002	\N	35100	5100
TYPE01532	Noto Sans Old Hungarian	\N	ID0002	\N	49700	5400
TYPE01533	Noto Sans Old Turkic	\N	ID0002	\N	47200	5100
TYPE01534	Noto Sans Lydian	\N	ID0002	\N	48000	5000
TYPE01535	Noto Serif Yezidi	\N	ID0002	\N	48000	5400
TYPE01536	Noto Sans Lycian	\N	ID0002	\N	41400	5100
TYPE01537	Noto Sans Runic	\N	ID0002	\N	39800	5100
TYPE01538	Noto Sans Phoenician	\N	ID0002	\N	39500	5100
TYPE01539	Noto Sans Caucasian Albanian	\N	ID0002	\N	39400	5400
TYPE01540	Noto Sans Indic Siyaq Numbers	\N	ID0002	\N	38200	5300
TYPE01541	Noto Sans Linear A	\N	ID0002	\N	37200	5100
TYPE01542	Noto Sans Mandaic	\N	ID0002	\N	36500	5100
TYPE01543	Noto Sans Kaithi	\N	ID0002	\N	36000	5200
TYPE01544	Noto Sans Ogham	\N	ID0002	\N	35600	5000
TYPE01545	Noto Sans Gunjala Gondi	\N	ID0002	\N	33300	5200
TYPE01546	Noto Sans Soyombo	\N	ID0002	\N	33400	5100
TYPE01547	Noto Sans Manichaean	\N	ID0002	\N	33900	5100
TYPE01548	Noto Sans Linear B	\N	ID0002	\N	33300	5100
TYPE01549	Noto Sans Phags Pa	\N	ID0002	\N	34000	5100
TYPE01550	Noto Sans Elymaic	\N	ID0002	\N	32900	5100
\.


--
-- Data for Name: typefacelangsupport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typefacelangsupport (typefaceid, languageid) FROM stdin;
\.


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (authorid);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (languageid);


--
-- Name: license license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license
    ADD CONSTRAINT license_pkey PRIMARY KEY (licenseid);


--
-- Name: glyph pk_glyph; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glyph
    ADD CONSTRAINT pk_glyph PRIMARY KEY (glyphid, styleid, typefaceid);


--
-- Name: typeface pk_typeface; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeface
    ADD CONSTRAINT pk_typeface PRIMARY KEY (typefaceid);


--
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (styleid, typefaceid);


--
-- Name: typefacelangsupport typefacelangsupport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typefacelangsupport
    ADD CONSTRAINT typefacelangsupport_pkey PRIMARY KEY (typefaceid, languageid);


--
-- Name: glyph glyph_styleid_typefaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glyph
    ADD CONSTRAINT glyph_styleid_typefaceid_fkey FOREIGN KEY (styleid, typefaceid) REFERENCES public.styles(styleid, typefaceid);


--
-- Name: styles styles_typefaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_typefaceid_fkey FOREIGN KEY (typefaceid) REFERENCES public.typeface(typefaceid);


--
-- Name: typeface typeface_authorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeface
    ADD CONSTRAINT typeface_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.author(authorid);


--
-- Name: typeface typeface_licenseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeface
    ADD CONSTRAINT typeface_licenseid_fkey FOREIGN KEY (licenseid) REFERENCES public.license(licenseid);


--
-- Name: typefacelangsupport typefacelangsupport_languageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typefacelangsupport
    ADD CONSTRAINT typefacelangsupport_languageid_fkey FOREIGN KEY (languageid) REFERENCES public.language(languageid);


--
-- Name: typefacelangsupport typefacelangsupport_typefaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typefacelangsupport
    ADD CONSTRAINT typefacelangsupport_typefaceid_fkey FOREIGN KEY (typefaceid) REFERENCES public.typeface(typefaceid);


--
-- PostgreSQL database dump complete
--

