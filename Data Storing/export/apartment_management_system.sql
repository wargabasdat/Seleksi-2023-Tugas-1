--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-17 15:16:33

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
-- TOC entry 217 (class 1259 OID 16461)
-- Name: apartment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartment (
    apartmentid integer NOT NULL,
    apartmentname character varying(50),
    apartmentaddress character varying(200),
    ownerid integer
);


ALTER TABLE public.apartment OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16460)
-- Name: apartment_apartmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apartment_apartmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apartment_apartmentid_seq OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 216
-- Name: apartment_apartmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apartment_apartmentid_seq OWNED BY public.apartment.apartmentid;


--
-- TOC entry 223 (class 1259 OID 16497)
-- Name: cleaningstaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cleaningstaff (
    empid integer NOT NULL,
    shift character varying(50) NOT NULL
);


ALTER TABLE public.cleaningstaff OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16496)
-- Name: cleaningstaff_empid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cleaningstaff_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleaningstaff_empid_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 222
-- Name: cleaningstaff_empid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cleaningstaff_empid_seq OWNED BY public.cleaningstaff.empid;


--
-- TOC entry 233 (class 1259 OID 16564)
-- Name: creditcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creditcard (
    paymentid integer NOT NULL,
    ccnumber character varying(50) NOT NULL,
    cv character varying(50) NOT NULL
);


ALTER TABLE public.creditcard OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16563)
-- Name: creditcard_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creditcard_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditcard_paymentid_seq OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 232
-- Name: creditcard_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creditcard_paymentid_seq OWNED BY public.creditcard.paymentid;


--
-- TOC entry 235 (class 1259 OID 16576)
-- Name: debitcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debitcard (
    paymentid integer NOT NULL,
    dcnumber character varying(50) NOT NULL
);


ALTER TABLE public.debitcard OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16575)
-- Name: debitcard_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.debitcard_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.debitcard_paymentid_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 234
-- Name: debitcard_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.debitcard_paymentid_seq OWNED BY public.debitcard.paymentid;


--
-- TOC entry 215 (class 1259 OID 16447)
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owner (
    ownerid integer NOT NULL,
    ownername character varying(50) NOT NULL,
    ownerphonenumber character varying(50) NOT NULL,
    ownercc character varying(50) NOT NULL
);


ALTER TABLE public.owner OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16446)
-- Name: owner_ownerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owner_ownerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owner_ownerid_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 214
-- Name: owner_ownerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owner_ownerid_seq OWNED BY public.owner.ownerid;


--
-- TOC entry 231 (class 1259 OID 16547)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    paymentid integer NOT NULL,
    amount integer NOT NULL,
    rentid integer NOT NULL,
    tenantstateid integer NOT NULL,
    roomid integer NOT NULL,
    empid integer NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16546)
-- Name: payment_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_paymentid_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 230
-- Name: payment_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_paymentid_seq OWNED BY public.payment.paymentid;


--
-- TOC entry 225 (class 1259 OID 16509)
-- Name: paymentstaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paymentstaff (
    empid integer NOT NULL
);


ALTER TABLE public.paymentstaff OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16508)
-- Name: paymentstaff_empid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paymentstaff_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paymentstaff_empid_seq OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 224
-- Name: paymentstaff_empid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paymentstaff_empid_seq OWNED BY public.paymentstaff.empid;


--
-- TOC entry 229 (class 1259 OID 16530)
-- Name: rent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rent (
    rentid integer NOT NULL,
    tenantstateid integer NOT NULL,
    roomid integer NOT NULL,
    startdata date NOT NULL,
    enddate date NOT NULL
);


ALTER TABLE public.rent OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16529)
-- Name: rent_rentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rent_rentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rent_rentid_seq OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 228
-- Name: rent_rentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rent_rentid_seq OWNED BY public.rent.rentid;


--
-- TOC entry 219 (class 1259 OID 16473)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    roomid integer NOT NULL,
    numberofbedroom integer NOT NULL,
    numberofbathroom integer NOT NULL,
    pricepermonth integer NOT NULL,
    apartmentid integer NOT NULL
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16472)
-- Name: room_roomid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_roomid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_roomid_seq OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 218
-- Name: room_roomid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_roomid_seq OWNED BY public.room.roomid;


--
-- TOC entry 221 (class 1259 OID 16485)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    empid integer NOT NULL,
    empname character varying(50) NOT NULL,
    empphonenumber character varying(50) NOT NULL,
    salary integer NOT NULL,
    apartmentid integer NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16484)
-- Name: staff_empid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_empid_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_empid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_empid_seq OWNED BY public.staff.empid;


--
-- TOC entry 227 (class 1259 OID 16521)
-- Name: tenant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenant (
    tenantstateid integer NOT NULL,
    tenantname character varying(50) NOT NULL,
    tenantphonenumber character varying(50) NOT NULL,
    tenantemergencycontact character varying(50) NOT NULL,
    tenantphotoid bytea NOT NULL
);


ALTER TABLE public.tenant OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16520)
-- Name: tenant_tenantstateid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tenant_tenantstateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenant_tenantstateid_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 226
-- Name: tenant_tenantstateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tenant_tenantstateid_seq OWNED BY public.tenant.tenantstateid;


--
-- TOC entry 3224 (class 2604 OID 16464)
-- Name: apartment apartmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartment ALTER COLUMN apartmentid SET DEFAULT nextval('public.apartment_apartmentid_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16500)
-- Name: cleaningstaff empid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaningstaff ALTER COLUMN empid SET DEFAULT nextval('public.cleaningstaff_empid_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16567)
-- Name: creditcard paymentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditcard ALTER COLUMN paymentid SET DEFAULT nextval('public.creditcard_paymentid_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 16579)
-- Name: debitcard paymentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debitcard ALTER COLUMN paymentid SET DEFAULT nextval('public.debitcard_paymentid_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16450)
-- Name: owner ownerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner ALTER COLUMN ownerid SET DEFAULT nextval('public.owner_ownerid_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16550)
-- Name: payment paymentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN paymentid SET DEFAULT nextval('public.payment_paymentid_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16512)
-- Name: paymentstaff empid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentstaff ALTER COLUMN empid SET DEFAULT nextval('public.paymentstaff_empid_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 16533)
-- Name: rent rentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent ALTER COLUMN rentid SET DEFAULT nextval('public.rent_rentid_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16476)
-- Name: room roomid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN roomid SET DEFAULT nextval('public.room_roomid_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16488)
-- Name: staff empid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN empid SET DEFAULT nextval('public.staff_empid_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16524)
-- Name: tenant tenantstateid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant ALTER COLUMN tenantstateid SET DEFAULT nextval('public.tenant_tenantstateid_seq'::regclass);


--
-- TOC entry 3412 (class 0 OID 16461)
-- Dependencies: 217
-- Data for Name: apartment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apartment (apartmentid, apartmentname, apartmentaddress, ownerid) FROM stdin;
1	\N	West Wharf | 60 Wharf Dr, Brooklyn, NY	\N
5	\N	Avalon Willoughby Square | 214 Duffield St, Brooklyn, NY	\N
7	\N	AVA DoBro | 100 Willoughby St, Brooklyn, NY	\N
11	\N	THE BELLSLIP | 1 Bell Slip, Brooklyn, NY	\N
14	\N	AVA Fort Greene | 343 Gold St, Brooklyn, NY	\N
18	\N	461 Dean | 461 Dean St, Brooklyn, NY	\N
20	\N	461 Dean, 461 Dean St APT 33F, Brooklyn, NY 11217	\N
21	\N	One Blue Slip | 1 Blue Slip, Brooklyn, NY	\N
24	\N	180 Montague | 180 Montague St, Brooklyn, NY	\N
49	\N	810 Flushing Ave, Brooklyn, NY	\N
50	\N	277 Classon Ave, Brooklyn, NY	\N
52	\N	221 E 57th St #2, Brooklyn, NY 11203	\N
53	\N	1119 Broadway #6-A, Brooklyn, NY 11221	\N
54	\N	1530 E 8th St, Brooklyn, NY 11230	\N
55	\N	10 Sackman St APT 1, Brooklyn, NY 11233	\N
56	\N	1770 E 14th St APT 6E, Brooklyn, NY 11229	\N
57	\N	19 Jardine Pl #2, Brooklyn, NY 11233	\N
58	\N	290 Linden Blvd #2G, Brooklyn, NY 11226	\N
59	\N	708 Lorimer St APT 2R, Brooklyn, NY 11211	\N
60	\N	808 Putnam Ave, Brooklyn, NY	\N
61	\N	4603 8th Ave, Brooklyn, NY	\N
64	\N	650 Ocean Ave #14, Brooklyn, NY 11226	\N
65	\N	640 Halsey St #4, Brooklyn, NY 11233	\N
66	\N	704 8th Ave, Brooklyn, NY	\N
67	\N	824 E New York Ave, Brooklyn, NY	\N
68	\N	375 Dean St, Brooklyn, NY	\N
71	\N	754 Grand St, Brooklyn, NY	\N
72	\N	107 Vanderveer St #1D, Brooklyn, NY 11207	\N
73	\N	142 Scholes St APT 5, Brooklyn, NY 11206	\N
74	\N	362 Stockton St APT 22, Brooklyn, NY 11206	\N
75	\N	1875 Atlantic Ave, Brooklyn, NY	\N
78	\N	92 Decatur St #1K, Brooklyn, NY 11216	\N
79	\N	839 53rd St FLOOR 2, Brooklyn, NY 11220	\N
80	\N	579 E 84th St #1, Brooklyn, NY 11236	\N
81	\N	46 India St FLOOR 2, Brooklyn, NY 11222	\N
82	\N	280 Meeker Ave, Brooklyn, NY	\N
86	\N	375 Vernon Ave, Brooklyn, NY	\N
88	\N	123 Melrose St, Brooklyn, NY	\N
91	\N	195 Spencer St APT 4B, Brooklyn, NY 11205	\N
92	\N	25 E 21st St #4F, Brooklyn, NY 11226	\N
93	\N	22 Tehama St, Brooklyn, NY	\N
94	\N	333 Schermerhorn St, Brooklyn, NY	\N
96	\N	10 Montieth St, Brooklyn, NY	\N
99	\N	165 Wilson Ave APT 2R, Brooklyn, NY 11237	\N
100	\N	555 Waverly Ave, Brooklyn, NY	\N
102	\N	1104 Dean St APT 1, Brooklyn, NY 11216	\N
103	\N	244 Garfield Pl APT 2, Brooklyn, NY 11215	\N
104	\N	125 Lefferts Pl APT 3, Brooklyn, NY 11238	\N
105	\N	105 Vanderveer St, Brooklyn, NY	\N
107	\N	138 Saint Marks Pl, Brooklyn, NY	\N
108	\N	475 Grand St, Brooklyn, NY	\N
110	\N	301 3rd St APT 4, Brooklyn, NY 11215	\N
111	\N	180 Myrtle Ave APT 6V, Brooklyn, NY 11201	\N
112	\N	295 N 7th St, Brooklyn, NY	\N
114	\N	959 Metropolitan Ave APT 4R, Brooklyn, NY 11211	\N
115	\N	88 Lewis Ave APT 2, Brooklyn, NY 11206	\N
116	\N	7410 Ridge Blvd APT 4M, Brooklyn, NY 11209	\N
117	\N	1420 Nostrand Ave #24, Brooklyn, NY 11226	\N
118	\N	123 Park Ave, Brooklyn, NY	\N
120	\N	555 Graham Ave APT 1A, Brooklyn, NY 11222	\N
121	\N	595 Marcy Ave, Brooklyn, NY	\N
123	\N	125 Borinquen Pl, Brooklyn, NY	\N
125	\N	181 Eldert St, Brooklyn, NY	\N
126	\N	930A Lafayette Ave #1, Brooklyn, NY 11221	\N
127	\N	511 Hicks St #1, Brooklyn, NY 11231	\N
128	\N	924 President St APT 1R, Brooklyn, NY 11215	\N
129	\N	177 Garfield Pl, Brooklyn, NY 11215	\N
130	\N	150 Myrtle Ave, Brooklyn, NY	\N
131	\N	8 Vanderbilt Ave APT 8J, Brooklyn, NY 11205	\N
132	\N	285 Division Ave APT 33, Brooklyn, NY 11211	\N
133	\N	148 Meserole St #3L1, Brooklyn, NY 11206	\N
134	\N	383 Knickerbocker Ave, Brooklyn, NY	\N
137	\N	155 Havemeyer St #3B, Brooklyn, NY 11211	\N
138	\N	1012 Halsey St, Brooklyn, NY	\N
140	\N	108 Saint Marks Pl #1, Brooklyn, NY 11217	\N
141	\N	1426 De Kalb Ave, Brooklyn, NY	\N
142	\N	1328 Fulton St, Brooklyn, NY	\N
143	\N	171 Minna St #2R, Brooklyn, NY 11218	\N
144	\N	277 Irving Ave #2R, Brooklyn, NY 11237	\N
145	\N	336 12th St #3, Brooklyn, NY 11215	\N
146	\N	506 Eastern Pkwy APT B2, Brooklyn, NY 11225	\N
147	\N	199 N 6th St APT 1, Brooklyn, NY 11211	\N
148	\N	100 Powers St APT 1R, Brooklyn, NY 11211	\N
149	\N	43 Mac Donough St #3, Brooklyn, NY 11216	\N
150	\N	72 Poplar St #3C, Brooklyn, NY 11201	\N
151	\N	806 Saint Johns Pl, Brooklyn, NY	\N
152	\N	1178 Gates Ave #2F, Brooklyn, NY 11221	\N
153	\N	109 Winthrop St #4A, Brooklyn, NY 11225	\N
154	\N	201 Woodpoint Rd APT 1L, Brooklyn, NY 11211	\N
155	\N	79 Bridge St APT 4I, Brooklyn, NY 11201	\N
156	\N	35 Eastern Pkwy, Brooklyn, NY	\N
158	\N	303 Malcolm X Blvd, Brooklyn, NY	\N
160	\N	920 Eastern Pkwy, Brooklyn, NY	\N
162	\N	410 State St APT 40, Brooklyn, NY 11217	\N
163	\N	220 Rogers Ave #2, Brooklyn, NY 11225	\N
164	\N	625 Park Pl APT 4, Brooklyn, NY 11238	\N
165	\N	81 Douglass St APT 4, Brooklyn, NY 11231	\N
166	\N	996 Carroll St, Brooklyn, NY	\N
170	\N	290 Hancock St APT 3, Brooklyn, NY 11216	\N
171	\N	470 Humboldt St #1, Brooklyn, NY 11211	\N
172	\N	545 Saint Marks Ave, Brooklyn, NY 11216	\N
173	\N	2484 Bedford Ave #3A, Brooklyn, NY 11226	\N
174	\N	1430 Fulton St, Brooklyn, NY	\N
177	\N	685 Manhattan Ave APT 2F, Brooklyn, NY 11222	\N
178	\N	756 Myrtle Ave, Brooklyn, NY	\N
179	\N	7A Lexington Ave #7AC, Brooklyn, NY 11238	\N
180	\N	412 Evergreen Ave APT 3G, Brooklyn, NY 11221	\N
181	\N	140 Hope St, Brooklyn, NY	\N
182	\N	174 Meserole St APT 2L, Brooklyn, NY 11206	\N
183	\N	390 Bergen St #1, Brooklyn, NY 11217	\N
184	\N	2025 Farragut Rd #5F, Brooklyn, NY 11210	\N
185	\N	300 Lincoln Rd APT 2D, Brooklyn, NY 11225	\N
186	\N	2950 Ocean Ave APT C3, Brooklyn, NY 11235	\N
187	\N	145 Henry St, Brooklyn, NY	\N
189	\N	30 Bayard St, Brooklyn, NY	\N
191	\N	258 Richardson St, Brooklyn, NY	\N
193	\N	925 Bushwick Ave #4B, Brooklyn, NY 11221	\N
194	\N	168 Dean St, Brooklyn, NY 11217	\N
195	\N	5210 Church Ave #1R, Brooklyn, NY 11203	\N
196	\N	596 Washington Ave, Brooklyn, NY	\N
198	\N	1382 Nostrand Ave APT 5, Brooklyn, NY 11226	\N
199	\N	979 Bedford Ave, Brooklyn, NY	\N
200	\N	875 De Kalb Ave, Brooklyn, NY	\N
203	\N	316 Himrod St APT 504, Brooklyn, NY 11237	\N
204	\N	532 10th St APT 2, Brooklyn, NY 11215	\N
205	\N	568 Willoughby Ave APT 3, Brooklyn, NY 11206	\N
206	\N	571 E 19th St #1B, Brooklyn, NY 11226	\N
207	\N	440 Kent Ave, Brooklyn, NY	\N
209	\N	598 Willoughby Ave, Brooklyn, NY	\N
211	\N	241 Troutman St APT 3R, Brooklyn, NY 11237	\N
212	\N	1212 Lincoln Pl APT 4D, Brooklyn, NY 11213	\N
213	\N	896 Gates Ave, Brooklyn, NY	\N
214	\N	24 Troutman St, Brooklyn, NY	\N
216	\N	255 Powers St APT 3L, Brooklyn, NY 11211	\N
217	\N	50 Ocean Pkwy APT 5C, Brooklyn, NY 11218	\N
218	\N	22 N 6th St, Brooklyn, NY	\N
219	\N	58 Graham Ave #2, Brooklyn, NY 11206	\N
220	\N	240 Irving Ave, Brooklyn, NY	\N
221	\N	2307 Clarendon Rd #A10, Brooklyn, NY 11226	\N
222	\N	1571 Sterling Pl #B2, Brooklyn, NY 11213	\N
223	\N	60 S 8th St, Brooklyn, NY	\N
225	\N	74 Ryerson St #3, Brooklyn, NY 11205	\N
226	\N	126 Malcolm X Blvd #4, Brooklyn, NY 11221	\N
227	\N	40 N 4th St, Brooklyn, NY	\N
230	\N	187 State St #2F, Brooklyn, NY 11201	\N
231	\N	134 Boerum St #C4, Brooklyn, NY 11206	\N
232	\N	200 N 11th St APT 4H, Brooklyn, NY 11211	\N
233	\N	548 11th St APT 4, Brooklyn, NY 11215	\N
234	\N	263 Melrose St APT 2L, Brooklyn, NY 11206	\N
235	\N	10571 Avenue N FLOOR 2, Brooklyn, NY 11236	\N
236	\N	2 Northside Piers, Brooklyn, NY	\N
238	\N	260 N 9th St APT 2A, Brooklyn, NY 11211	\N
239	\N	249 Willoughby Ave, Brooklyn, NY	\N
240	\N	7903 14th Ave #1, Brooklyn, NY 11228	\N
241	\N	144 West St APT 303, Brooklyn, NY 11222	\N
242	\N	156 Knickerbocker Ave APT 2R, Brooklyn, NY 11237	\N
243	\N	89 Grattan St APT 2, Brooklyn, NY 11237	\N
244	\N	117 S 4th St, Brooklyn, NY	\N
245	\N	60 Duffield St, Brooklyn, NY	\N
247	\N	343 Grove St APT 3L, Brooklyn, NY 11237	\N
248	\N	187 20th St #2C, Brooklyn, NY 11232	\N
249	\N	921 Broadway APT 4L, Brooklyn, NY 11206	\N
250	\N	69 Ten Eyck St #2O, Brooklyn, NY 11206	\N
251	\N	542 Chauncey St #1E, Brooklyn, NY 11233	\N
252	\N	30 Fayette St #2C, Brooklyn, NY 11206	\N
253	\N	148 Kingsland Ave #3, Brooklyn, NY 11222	\N
254	\N	203 17th St APT 19, Brooklyn, NY 11215	\N
255	\N	308 Court St #2, Brooklyn, NY 11231	\N
256	\N	1520 Fulton St APT 7E, Brooklyn, NY 11216	\N
257	\N	691 Chauncey St, Brooklyn, NY	\N
259	\N	74 Sherman St #2L, Brooklyn, NY 11215	\N
\.


--
-- TOC entry 3418 (class 0 OID 16497)
-- Dependencies: 223
-- Data for Name: cleaningstaff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cleaningstaff (empid, shift) FROM stdin;
\.


--
-- TOC entry 3428 (class 0 OID 16564)
-- Dependencies: 233
-- Data for Name: creditcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creditcard (paymentid, ccnumber, cv) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 16576)
-- Dependencies: 235
-- Data for Name: debitcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debitcard (paymentid, dcnumber) FROM stdin;
\.


--
-- TOC entry 3410 (class 0 OID 16447)
-- Dependencies: 215
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owner (ownerid, ownername, ownerphonenumber, ownercc) FROM stdin;
\.


--
-- TOC entry 3426 (class 0 OID 16547)
-- Dependencies: 231
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (paymentid, amount, rentid, tenantstateid, roomid, empid) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 16509)
-- Dependencies: 225
-- Data for Name: paymentstaff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paymentstaff (empid) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 16530)
-- Dependencies: 229
-- Data for Name: rent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rent (rentid, tenantstateid, roomid, startdata, enddate) FROM stdin;
\.


--
-- TOC entry 3414 (class 0 OID 16473)
-- Dependencies: 219
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (roomid, numberofbedroom, numberofbathroom, pricepermonth, apartmentid) FROM stdin;
1	1	1	3575	1
2	1	1	4308	5
3	2	1	8250	7
4	3	1	9167	11
5	1	1	3254	14
6	1	1	3864	18
7	1	1	3600	20
8	1	1	4451	21
9	2	1	5462	24
10	3	1	6075	49
11	1	1	3204	50
12	1	1	4930	52
13	2	1	7094	53
14	1	1	3775	54
15	1	1	3835	55
16	2	1	5105	56
17	3	1	7832	57
18	1	1	3245	58
19	1	1	3995	59
20	0	0	3995	60
21	1	1	3655	61
22	1	1	3875	64
23	2	1	7055	65
24	1	1	4071	66
25	1	1	3575	67
26	1	1	4308	68
27	2	1	8250	71
28	3	1	9167	72
29	1	1	3254	73
30	1	1	3864	74
31	1	1	3600	75
32	1	1	4451	78
33	2	1	5462	79
34	3	1	6075	80
35	1	1	3204	81
36	1	1	4930	82
37	2	1	7094	86
38	1	1	3775	88
39	1	1	3835	91
40	2	1	5105	92
41	3	1	7832	93
42	1	1	3245	94
43	1	1	3995	96
44	0	0	3995	99
45	1	1	3655	100
46	1	1	3875	102
47	2	1	7055	103
48	1	1	4071	104
49	2	1	3057	105
50	3	1	3600	107
51	4	1	3500	108
52	0	1	2800	110
53	0	1	2150	111
54	0	1	2100	112
55	0	0	2600	114
56	0	1	2550	115
57	0	0	2450	116
58	0	2	2900	117
59	0	0	3500	118
60	2	1	3100	120
61	2	1	2800	121
62	3	1	3400	123
63	7	1	6600	125
64	0	1	1550	126
65	0	0	4200	127
66	3	1	6250	128
67	1	1	2453	129
68	1	1	3300	130
69	1	1	4200	131
70	2	1	7100	132
71	3	1	5500	133
72	0	1	2200	134
73	0	1	3700	137
74	0	1	2499	138
75	1	1	2500	140
76	2	1	2800	141
77	3	1	3550	142
78	0	5	3975	143
79	0	0	1900	144
80	0	0	2350	145
81	0	0	5250	146
82	1	1	3150	147
83	1	1	4900	148
84	2	1	4800	149
85	3	1	7900	150
86	4	1	4200	151
87	5	1	5299	152
88	1	1	2850	153
89	1	1	3615	154
90	2	1	4015	155
91	0	0	4800	156
92	0	1	3495	158
93	2	1	2500	160
94	1	1	3322	162
95	1	1	4327	163
96	1	1	2462	164
97	1	1	3080	165
98	2	1	4480	166
99	0	2	2500	170
100	1	1	3000	171
101	1	1	4000	172
102	0	1	1700	173
103	0	0	4150	174
104	0	2	4800	177
105	3	1	3500	178
106	4	1	4000	179
107	1	1	2400	180
108	4	1	8800	181
109	5	1	10800	182
110	0	2	4995	183
111	0	0	3921	184
112	2	1	6400	185
113	4	1	9500	186
114	0	2	4300	187
115	0	0	4800	189
116	0	0	2595	191
117	0	2	3850	193
118	1	1	2999	194
119	4	1	5999	195
120	0	5	4100	196
121	3	1	4000	198
122	5	1	5950	199
123	1	1	3618	200
124	2	1	4750	203
125	4	1	4350	204
126	0	1	2999	205
127	0	0	9000	206
128	0	2	4000	207
129	0	1	3600	209
130	1	1	2950	211
131	0	0	3500	212
132	0	0	5500	213
133	0	5	5000	214
134	1	1	2500	216
135	2	1	3750	217
136	3	1	3750	218
137	0	1	4600	219
138	3	1	5449	220
139	4	1	4795	221
140	0	0	6850	222
141	3	1	4200	223
142	2	1	4066	225
143	0	1	2400	226
144	0	1	2900	227
145	0	0	4500	230
146	0	0	3595	231
147	0	2	7700	232
148	0	1	3900	233
149	0	5	4500	234
150	0	0	18500	235
151	2	1	3700	236
152	0	1	3399	238
153	0	1	3500	239
154	0	1	3599	240
155	0	0	3900	241
156	2	1	4250	242
157	3	1	4395	243
158	2	1	2799	244
159	4	1	4199	245
160	1	1	2650	247
161	4	1	6950	248
162	0	1	4250	249
163	0	0	4000	250
164	0	2	4830	251
165	0	0	4000	252
166	1	1	2975	253
167	1	1	3298	254
168	2	1	3950	255
169	3	1	4645	256
170	0	1	3500	257
171	0	0	4800	259
172	0	1	3500	1
173	0	2	3400	5
174	1	1	2700	7
175	1	1	2800	11
176	2	1	3600	14
177	0	1	3200	18
178	1	1	3250	20
179	0	0	4800	21
180	0	0	4500	24
181	1	1	4800	49
182	0	2	5995	50
183	0	0	8250	52
184	0	1	3300	53
185	0	1	2718	54
186	0	1	2250	55
187	2	1	6500	56
188	3	1	9750	57
189	1	1	4400	58
190	2	1	7000	59
191	3	1	6650	60
192	4	1	6650	61
193	0	1	2850	64
194	0	1	4995	65
195	0	1	1800	66
196	1	1	3275	67
197	3	1	4846	68
198	0	2	3750	71
199	2	1	3899	72
200	1	1	2750	73
201	2	1	3599	74
202	3	1	3650	75
203	0	1	3400	78
204	0	1	3500	79
205	0	1	2999	80
206	0	1	2300	81
207	1	1	4700	82
208	3	1	12500	86
209	2	1	3500	88
210	3	1	4500	91
211	0	0	4000	92
212	0	1	2999	93
213	4	1	3500	94
214	2	1	2900	96
215	4	1	3800	99
216	0	0	2900	100
217	0	0	2950	102
218	2	1	7000	103
219	0	5	7500	104
220	2	1	2575	105
221	0	1	1795	107
222	0	1	2295	108
223	1	1	5000	110
224	2	1	7000	111
225	0	1	2750	112
226	0	1	3000	114
227	1	1	4850	115
228	2	1	6650	116
229	3	1	6650	117
230	0	2	6000	118
231	0	1	3250	120
232	0	1	4017	121
233	0	1	2850	123
234	0	1	3750	125
235	0	0	2200	126
236	1	1	4995	127
237	2	1	7995	128
238	0	0	9300	129
239	1	1	4100	130
240	0	0	2800	131
241	0	0	3850	132
242	0	1	3500	133
243	0	1	3800	134
244	2	1	3700	137
245	1	1	4010	138
246	2	1	5757	140
247	0	2	2999	141
248	0	1	3499	142
249	0	2	4100	143
250	0	1	5200	144
251	0	5	3895	145
252	0	2	4500	146
253	0	1	2795	147
254	0	1	2450	148
255	0	1	3500	149
256	0	0	3995	150
257	3	1	4000	151
258	5	1	5650	152
259	0	1	3250	153
\.


--
-- TOC entry 3416 (class 0 OID 16485)
-- Dependencies: 221
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (empid, empname, empphonenumber, salary, apartmentid) FROM stdin;
\.


--
-- TOC entry 3422 (class 0 OID 16521)
-- Dependencies: 227
-- Data for Name: tenant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenant (tenantstateid, tenantname, tenantphonenumber, tenantemergencycontact, tenantphotoid) FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 216
-- Name: apartment_apartmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apartment_apartmentid_seq', 1, false);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 222
-- Name: cleaningstaff_empid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cleaningstaff_empid_seq', 1, false);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 232
-- Name: creditcard_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creditcard_paymentid_seq', 1, false);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 234
-- Name: debitcard_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.debitcard_paymentid_seq', 1, false);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 214
-- Name: owner_ownerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owner_ownerid_seq', 1, false);


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 230
-- Name: payment_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_paymentid_seq', 1, false);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 224
-- Name: paymentstaff_empid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paymentstaff_empid_seq', 1, false);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 228
-- Name: rent_rentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rent_rentid_seq', 1, false);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 218
-- Name: room_roomid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_roomid_seq', 1, false);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_empid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_empid_seq', 1, false);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 226
-- Name: tenant_tenantstateid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tenant_tenantstateid_seq', 1, false);


--
-- TOC entry 3237 (class 2606 OID 16466)
-- Name: apartment apartment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartment
    ADD CONSTRAINT apartment_pkey PRIMARY KEY (apartmentid);


--
-- TOC entry 3243 (class 2606 OID 16502)
-- Name: cleaningstaff cleaningstaff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaningstaff
    ADD CONSTRAINT cleaningstaff_pkey PRIMARY KEY (empid);


--
-- TOC entry 3253 (class 2606 OID 16569)
-- Name: creditcard creditcard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditcard
    ADD CONSTRAINT creditcard_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 3255 (class 2606 OID 16581)
-- Name: debitcard debitcard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debitcard
    ADD CONSTRAINT debitcard_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 3235 (class 2606 OID 16452)
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (ownerid);


--
-- TOC entry 3251 (class 2606 OID 16552)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 3245 (class 2606 OID 16514)
-- Name: paymentstaff paymentstaff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentstaff
    ADD CONSTRAINT paymentstaff_pkey PRIMARY KEY (empid);


--
-- TOC entry 3249 (class 2606 OID 16535)
-- Name: rent rent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent
    ADD CONSTRAINT rent_pkey PRIMARY KEY (rentid, tenantstateid, roomid);


--
-- TOC entry 3239 (class 2606 OID 16478)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (roomid);


--
-- TOC entry 3241 (class 2606 OID 16490)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (empid);


--
-- TOC entry 3247 (class 2606 OID 16528)
-- Name: tenant tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_pkey PRIMARY KEY (tenantstateid);


--
-- TOC entry 3256 (class 2606 OID 16467)
-- Name: apartment fk_apartment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartment
    ADD CONSTRAINT fk_apartment FOREIGN KEY (ownerid) REFERENCES public.owner(ownerid);


--
-- TOC entry 3259 (class 2606 OID 16503)
-- Name: cleaningstaff fk_cleaning; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaningstaff
    ADD CONSTRAINT fk_cleaning FOREIGN KEY (empid) REFERENCES public.staff(empid);


--
-- TOC entry 3265 (class 2606 OID 16570)
-- Name: creditcard fk_credit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creditcard
    ADD CONSTRAINT fk_credit FOREIGN KEY (paymentid) REFERENCES public.payment(paymentid);


--
-- TOC entry 3266 (class 2606 OID 16582)
-- Name: debitcard fk_credit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debitcard
    ADD CONSTRAINT fk_credit FOREIGN KEY (paymentid) REFERENCES public.payment(paymentid);


--
-- TOC entry 3260 (class 2606 OID 16515)
-- Name: paymentstaff fk_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentstaff
    ADD CONSTRAINT fk_payment FOREIGN KEY (empid) REFERENCES public.staff(empid);


--
-- TOC entry 3263 (class 2606 OID 16553)
-- Name: payment fk_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment FOREIGN KEY (rentid, tenantstateid, roomid) REFERENCES public.rent(rentid, tenantstateid, roomid);


--
-- TOC entry 3261 (class 2606 OID 16536)
-- Name: rent fk_rent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent
    ADD CONSTRAINT fk_rent FOREIGN KEY (tenantstateid) REFERENCES public.tenant(tenantstateid);


--
-- TOC entry 3257 (class 2606 OID 16479)
-- Name: room fk_room; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_room FOREIGN KEY (apartmentid) REFERENCES public.apartment(apartmentid);


--
-- TOC entry 3258 (class 2606 OID 16491)
-- Name: staff fk_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT fk_staff FOREIGN KEY (apartmentid) REFERENCES public.apartment(apartmentid);


--
-- TOC entry 3264 (class 2606 OID 16558)
-- Name: payment payment_empid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_empid_fkey FOREIGN KEY (empid) REFERENCES public.staff(empid);


--
-- TOC entry 3262 (class 2606 OID 16541)
-- Name: rent rent_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent
    ADD CONSTRAINT rent_roomid_fkey FOREIGN KEY (roomid) REFERENCES public.room(roomid);


-- Completed on 2023-07-17 15:16:34

--
-- PostgreSQL database dump complete
--

