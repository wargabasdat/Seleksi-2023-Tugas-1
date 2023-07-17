--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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

--
-- Name: check_order_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_order_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                    IF EXISTS(
                        SELECT *
                        FROM Cart
                        WHERE Cart.Cart_ID = NEW.Cart_ID
                        AND Cart.Order_Status = 'unpaid'

                    ) THEN
                        RETURN NEW;
                    ELSE
                        RAISE EXCEPTION 'Cannot insert new payment record! It was paid!';
                    END IF;
                END;
                $$;


ALTER FUNCTION public.check_order_status() OWNER TO postgres;

--
-- Name: check_payment(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_payment() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                    BEGIN
                        IF NOT EXISTS(
                            SELECT 1 
                            FROM Payment
                            WHERE Payment.Cart_ID = NEW.Cart_ID 
                            
                        ) AND NEW.Order_Status != 'unpaid' 
                        THEN
                            RAISE EXCEPTION 'You havent paid! Failed to insert or update data!';

                        ELSE
                            RETURN NEW;
                        END IF;

                    END;

                $$;


ALTER FUNCTION public.check_payment() OWNER TO postgres;

--
-- Name: update_unpaid_status_function(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_unpaid_status_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                        UPDATE Cart
                        SET Order_Status = 'on delivery'
                        WHERE Cart_ID = NEW.Cart_ID;
                        RETURN NEW;
                END;
                $$;


ALTER FUNCTION public.update_unpaid_status_function() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bank_transfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_transfer (
    payment_id integer NOT NULL,
    account_number character varying(30) NOT NULL
);


ALTER TABLE public.bank_transfer OWNER TO postgres;

--
-- Name: bank_transfer_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_transfer_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_transfer_payment_id_seq OWNER TO postgres;

--
-- Name: bank_transfer_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_transfer_payment_id_seq OWNED BY public.bank_transfer.payment_id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_status character varying(100) NOT NULL,
    CONSTRAINT order_status CHECK (((order_status)::text = ANY ((ARRAY['unpaid'::character varying, 'on delivery'::character varying, 'delivered'::character varying])::text[])))
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cart_id_seq OWNER TO postgres;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- Name: cart_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_customer_id_seq OWNER TO postgres;

--
-- Name: cart_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_customer_id_seq OWNED BY public.cart.customer_id;


--
-- Name: cart_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_product (
    order_number integer NOT NULL,
    cart_id integer NOT NULL,
    product_code character varying(20) NOT NULL,
    quantity integer NOT NULL,
    size character varying(4) NOT NULL,
    CONSTRAINT size CHECK (((size)::text = ANY ((ARRAY['XS'::character varying, 'S'::character varying, 'M'::character varying, 'L'::character varying, 'XL'::character varying])::text[])))
);


ALTER TABLE public.cart_product OWNER TO postgres;

--
-- Name: cart_product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_product_cart_id_seq OWNER TO postgres;

--
-- Name: cart_product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_product_cart_id_seq OWNED BY public.cart_product.cart_id;


--
-- Name: cart_product_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_product_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_product_order_number_seq OWNER TO postgres;

--
-- Name: cart_product_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_product_order_number_seq OWNED BY public.cart_product.order_number;


--
-- Name: credit_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_card (
    payment_id integer NOT NULL,
    credit_card_number character varying(20) NOT NULL
);


ALTER TABLE public.credit_card OWNER TO postgres;

--
-- Name: credit_card_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_card_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_card_payment_id_seq OWNER TO postgres;

--
-- Name: credit_card_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_card_payment_id_seq OWNED BY public.credit_card.payment_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    street character varying(50) NOT NULL,
    ward character varying(30) NOT NULL,
    subdistrict character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    province character varying(30) NOT NULL,
    postal_code character varying(10) NOT NULL,
    telephone_number character varying(15) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: e_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.e_wallet (
    payment_id integer NOT NULL,
    telephone_number character varying(15) NOT NULL
);


ALTER TABLE public.e_wallet OWNER TO postgres;

--
-- Name: e_wallet_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.e_wallet_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.e_wallet_payment_id_seq OWNER TO postgres;

--
-- Name: e_wallet_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.e_wallet_payment_id_seq OWNED BY public.e_wallet.payment_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    cart_id integer NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_cart_id_seq OWNER TO postgres;

--
-- Name: payment_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_cart_id_seq OWNED BY public.payment.cart_id;


--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_code character varying(20) NOT NULL,
    product_name character varying(100) NOT NULL,
    image_link character varying(200) NOT NULL,
    color character varying(15) NOT NULL,
    price integer NOT NULL,
    details text
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: bank_transfer payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_transfer ALTER COLUMN payment_id SET DEFAULT nextval('public.bank_transfer_payment_id_seq'::regclass);


--
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- Name: cart customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN customer_id SET DEFAULT nextval('public.cart_customer_id_seq'::regclass);


--
-- Name: cart_product order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product ALTER COLUMN order_number SET DEFAULT nextval('public.cart_product_order_number_seq'::regclass);


--
-- Name: cart_product cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_product_cart_id_seq'::regclass);


--
-- Name: credit_card payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card ALTER COLUMN payment_id SET DEFAULT nextval('public.credit_card_payment_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: e_wallet payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e_wallet ALTER COLUMN payment_id SET DEFAULT nextval('public.e_wallet_payment_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: payment cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN cart_id SET DEFAULT nextval('public.payment_cart_id_seq'::regclass);


--
-- Data for Name: bank_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_transfer (payment_id, account_number) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cart_id, customer_id, order_status) FROM stdin;
1	1	on delivery
\.


--
-- Data for Name: cart_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_product (order_number, cart_id, product_code, quantity, size) FROM stdin;
1	1	I-TSKBSC523O606	1	S
\.


--
-- Data for Name: credit_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_card (payment_id, credit_card_number) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, name, street, ward, subdistrict, city, province, postal_code, telephone_number) FROM stdin;
1	Kandida	Jalan Gunung	Lariangbangi	Makassar	Makassar	Sulawesi Selatan	90141	08521317293
\.


--
-- Data for Name: e_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.e_wallet (payment_id, telephone_number) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, cart_id, payment_date) FROM stdin;
1	1	2023-02-11 00:00:00
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_code, product_name, image_link, color, price, details) FROM stdin;
I-TSKBSC523O606	Basic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC523O606_BROWN_1_T.jpg?v=1688058751&width=320	Brown	59900	T-shirt lengan pendek,  Round neck,  Unfinished hemline details,  Crop length,  Regular Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:TSKBSC520O605	Basic Round Neck Loose T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O605_PINK_1_T.jpg?v=1688058744&width=320	Pink	69900	T-shirt lengan pendek,  Round neck,  Unfinished hemline details,  Regular length,  Loose fit,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:TSKBSC520O604	Basic Round Neck Loose T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O604_LIME_1_T.jpg?v=1688058737&width=320	Lime	69900	T-shirt lengan pendek,  Round neck,  Unfinished hemline details,  Regular length,  Loose fit,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPWBSC523O519	Basic Linen Look Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWBSC523O519_LT._BLUE_4_T.jpg?v=1688058731&width=320	Lt. Blue	159900	Celana pendek berpotongan basic,  Front pleat details,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPWBSC523O518	Basic Linen Look Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWBSC523O518_SOFT_PINK_4_T.jpg?v=1688058725&width=320	Soft Pink	159900	Celana pendek berpotongan basic,  Front pleat details,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPWBSC523O517	Basic Linen Look Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWBSC523O517_BEIGE_4_T.jpg?v=1688058719&width=320	Beige	159900	Celana pendek berpotongan basic,  Front pleat details,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPWBSC523O516	Basic Linen Look Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWBSC523O516_BLACK_4_T.jpg?v=1688058713&width=320	Black	159900	Celana pendek berpotongan basic,  Front pleat details,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTKBSC523O513	Racer Rib Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC523O513_PINK_3_T.jpg?v=1688058706&width=320	Pink	79900	Atasan tanpa lengan,  Racer neck,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTKBSC523O512	Racer Rib Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC523O512_LT._BLUE_3_T.jpg?v=1688058700&width=320	Lt. Blue	79900	Atasan tanpa lengan,  Racer neck,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTKBSC523O511	Racer Rib Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC523O511_GREEN_1_T.jpg?v=1688058693&width=320	Green	79900	Atasan tanpa lengan,  Racer neck,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTKBSC522O507	Racer Rib Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC522O507_OFF_WHITE_1.jpg?v=1688058686&width=320	White	79900	Atasan tanpa lengan,  Racer neck,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTKBSC522O506	Racer Rib Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC522O506_BLACK_1_3534e481-bf87-4afa-b446-2273f0b724ca.jpg?v=1688058680&width=320	Black	79900	Atasan tanpa lengan,  Racer neck,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TLKBBT123G307	Graphic Round Neck Long Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/I-TLKBBT123G307_DARK_GREEN_1_T.jpg?v=1688058673&width=320	Dark Green	49900	T-shirt lengan panjang,  Round neck,  Graphics at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G306	Graphic Crew Neck Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G306_BLACK_1_T.jpg?v=1688058667&width=320	Black	49900	T-shirt lengan pendek,  Crew neck,  Graphics at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G305	Graphic Crew Neck Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G305_PINK_1_T.jpg?v=1688058661&width=320	Pink	49900	T-shirt lengan pendek,  Crew neck,  Graphics at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G303	Graphic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G303_OFF_WHITE_3_T.jpg?v=1688058655&width=320	Off White	49900	T-shirt lengan pendek,  Round neck,  Full printed fabric,  Crop length,  Oversized Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G304	Graphic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G304_BLUE_3_T.jpg?v=1688058558&width=320	Blue	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Crop length,  Oversized Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G302	Graphic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G302_ECRU_3_T.jpg?v=1688058551&width=320	Ecru	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Crop length,  Oversized Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKBBT123G301	Graphic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123G301_OFF_WHITE_3_T.jpg?v=1688058545&width=320	Off White	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Crop length,  Oversized Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPDKEY123G074	A-line Denim Shorts	//colorbox.co.id/cdn/shop/products/I-SPDKEY123G074_MED_BLUE_4_T.jpg?v=1688058539&width=320	Med Blue	229900	Celana pendek denim,  High waist,  A-line,  Dengan kantong depan,  Dilengkapi belt loop,  Regular fit,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPDKEY123G073	A-line Denim Shorts	//colorbox.co.id/cdn/shop/products/I-SPDKEY123G073_LT._BLUE_4_T.jpg?v=1688058533&width=320	Lt. Blue	229900	Celana pendek denim,  High waist,  A-line,  Dengan kantong depan,  Dilengkapi belt loop,  Regular fit,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPDKEY123G072	Cargo Drawstring Jeans	//colorbox.co.id/cdn/shop/products/I-LPDKEY123G072_BLACK_4_T.jpg?v=1688058526&width=320	Black	349900	Celana panjang denim,  Elastic waist with drawstring,  Double side cargo pocket,  Dengan kantong samping,  Regular fit,  Material: Denim,  Model menggunakan ukuran 26,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPDKEY123G071	Cargo Drawstring Jeans	//colorbox.co.id/cdn/shop/products/I-LPDKEY123G071_MED_BLUE_4_T.jpg?v=1688058520&width=320	Med Blue	349900	Celana panjang denim,  Elastic waist with drawstring,  Double side cargo pocket,  Dengan kantong samping,  Regular fit,  Material: Denim,  Model menggunakan ukuran 26,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G070	V-Neck Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G070_OFF_WHITE_1_T.jpg?v=1688058513&width=320	Black	179900	Atasan lengan panjang,  V-neck with collar,  Crop length with elastic hem,  Regular fit,  Material: Poly Crinkle,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G069	V-Neck Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G069_ORANGE_3_T.jpg?v=1688058506&width=320	Orange	179900	Atasan lengan panjang,  V-neck with collar,  Crop length with elastic hem,  Regular fit,  Material: Poly Crinkle,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123G068	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123G068_BLUE_4_T.jpg?v=1688058499&width=320	Blue	149900	Blouse lengan pendek,  Notch collar,  Drop shoulder details,  Regular length,  Front button opening,  Regular fit,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123G067	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123G067_MULTICOLOR_1_T.jpg?v=1688058492&width=320	Multicolor	149900	Blouse lengan pendek,  Notch collar,  Drop shoulder details,  Regular length,  Front button opening,  Regular fit,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123G066	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123G066_ORANGE_1_T.jpg?v=1688058484&width=320	Orange	149900	Blouse lengan pendek,  Notch collar,  Drop shoulder details,  Regular length,  Front button opening,  Regular fit,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-STKKEY123G065	Long Sleeve Graphic Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123G065_ORANGE_1_T.jpg?v=1688058477&width=320	Orange	179900	Sweatshirt lengan panjang,  Round neck,  Front graphic details,  Drop shoulder,  Regular fit,  Material: Baby Terry,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-STKKEY123G064	Long Sleeve Graphic Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123G064_BLUE_1.jpg?v=1688058470&width=320	Blue	179900	Sweatshirt lengan panjang,  Round neck,  Front graphic details,  Drop shoulder,  Regular fit,  Material: Baby Terry,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G063	Short Sleeve T-Shirt with Twist Detail	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G063_BLUE_1_T.jpg?v=1688058463&width=320	Blue	99900	T-shirt lengan pendek,  Round neck,  Twisted front details,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G062	Short Sleeve T-Shirt with Twist Detail	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G062_OFF_WHITE_1_T.jpg?v=1688058456&width=320	Off White	99900	T-shirt lengan pendek,  Round neck,  Twisted front details,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G061	Short Sleeve T-Shirt with Twist Detail	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G061_BLACK_1_T.jpg?v=1688058449&width=320	Black	99900	T-shirt lengan pendek,  Round neck,  Twisted front details,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPWKEY123G060	Wide Leg Striped Pants with Slit Details	//colorbox.co.id/cdn/shop/products/I-LPWKEY123G060_BLUE_4_T.jpg?v=1688058442&width=320	Blue	229900	Celana panjang wide leg,  Side slit details,  Dengan kantong samping,  Dilengkapi belt loop,  Stripe printed fabric,  Regular fit,  Material: Oxford,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPWKEY123G059	Wide Leg Striped Pants with Slit Details	//colorbox.co.id/cdn/shop/products/I-LPWKEY123G059_KHAKI_4_T.jpg?v=1688058435&width=320	Khaki	229900	Celana panjang wide leg,  Side slit details,  Dengan kantong samping,  Dilengkapi belt loop,  Stripe printed fabric,  Regular fit,  Material: Oxford,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SKWKEY123G058	Wrap Mini Skort	//colorbox.co.id/cdn/shop/products/I-SKWKEY123G058_PINK_4_T.jpg?v=1688058428&width=320	Pink	179900	Mini skort berpotongan basic,  Wrap front with side tie details,  High waist,  Side zipper opening,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SKWKEY123G057	Wrap Mini Skort	//colorbox.co.id/cdn/shop/products/I-SKWKEY123G057_OFF_WHITE_4_T.jpg?v=1688058352&width=320	Off White	179900	Mini skort berpotongan basic,  Wrap front with side tie details,  High waist,  Side zipper opening,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-VEWKEY123G056	Striped Crop Vest	//colorbox.co.id/cdn/shop/products/I-VEWKEY123G056_BLUE_1_T.jpg?v=1688058345&width=320	Blue	179900	Atasan tanpa lengan,  Notch collar,  Front button opening,  Crop length,  Stripe printed fabric,  Regular Crop,  Material: Oxford,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-VEWKEY123G055	Striped Crop Vest	//colorbox.co.id/cdn/shop/products/I-VEWKEY123G055_KHAKI_3_T.jpg?v=1688058338&width=320	Khaki	179900	Atasan tanpa lengan,  Notch collar,  Front button opening,  Crop length,  Stripe printed fabric,  Regular Crop,  Material: Oxford,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SWGKEY123G054	Flowery Long Sleeve Crop Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY123G054_PINK_1_T.jpg?v=1688058332&width=320	Pink	229900	Sweater lengan panjang,  V-neck,  Crop length,  Flowery graphic details,  Regular Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SWGKEY123G053	Flowery Long Sleeve Crop Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY123G053_BLUE_1_T.jpg?v=1688058325&width=320	Blue	229900	Sweater lengan panjang,  V-neck,  Crop length,  Flowery graphic details,  Regular Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G052	V-Neck Long Sleeve Wrap Top	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G052_PINK_1.jpg?v=1688058318&width=320	Pink	179900	Atasan lengan panjang,  V-neck,  Front wrap with side tie,  Puff sleeves,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G051	V-Neck Long Sleeve Wrap Top	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G051_OFF_WHITE_1_T.jpg?v=1688058311&width=320	Off White	179900	Atasan lengan panjang,  V-neck,  Front wrap with side tie,  Puff sleeves,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TLKKEY123G050	Square Neck Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123G050_BLUE_3_T.jpg?v=1688058305&width=320	Blue	129900	Atasan lengan panjang,  Square neck,  Crop length,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TLKKEY123G049	Square Neck Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123G049_KHAKI_1_T.jpg?v=1688058296&width=320	Khaki	129900	Atasan lengan panjang,  Square neck,  Crop length,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSGKEY123G048	Puff Sleeves Polo Crop Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123G048_PINK_1_T.jpg?v=1688058289&width=320	Pink	199900	Atasan lengan pendek,  Puff sleeves,  Polo collar,  Front button opening,  Textured fabric,  Regular Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSGKEY123G047	Puff Sleeves Polo Crop Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123G047_PINK_1_T.jpg?v=1688058282&width=320	Khaki	199900	Atasan lengan pendek,  Puff sleeves,  Polo collar,  Front button opening,  Textured fabric,  Regular Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123G046	V-Neck Printed Blouse with Drawstring	//colorbox.co.id/cdn/shop/products/IBSWKEY123G046_PINK_1_T.jpg?v=1688058275&width=320	Pink	149900	Blouse lengan pendek,  V-neck,  Puff sleeves,  Hemline with drawstring details,  Printed fabric,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123G045	V-Neck Printed Blouse with Drawstring	//colorbox.co.id/cdn/shop/products/IBSWKEY123G045_MULTICOLOR_1_T.jpg?v=1688058268&width=320	Multicolor	149900	Blouse lengan pendek,  V-neck,  Puff sleeves,  Hemline with drawstring details,  Printed fabric,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:SPKKEY123G043	Waffle Shorts with Rounded Hem	//colorbox.co.id/cdn/shop/products/ISPKKEY123G043_BLACK_4_T.jpg?v=1688058255&width=320	Black	149900	Celana pendek casual,  Elastic waist,  Dengan kantong samping,  Rounded hemline details,  Textured fabric,  Regular fit,  Material: Waffle Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-CLKKEY123G042	High Waist Textured Culottes	//colorbox.co.id/cdn/shop/products/I-CLKKEY123G042_OFF_WHITE_4_T.jpg?v=1688058249&width=320	Off White	229900	Celana panjang model kulot,  High waist,  Straight leg,  Textured fabric,  Elastic waist,  Regular fit,  Material: Baby Plisket,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-CLKKEY123G041	High Waist Textured Culottes	//colorbox.co.id/cdn/shop/products/I-CLKKEY123G041_BLACK_4_T.jpg?v=1688058243&width=320	Black	229900	Celana panjang model kulot,  High waist,  Straight leg,  Textured fabric,  Elastic waist,  Regular fit,  Material: Baby Plisket,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPKKEY123G040	Flare Rib Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123G040_BLACK_4_T.jpg?v=1688058237&width=320	Black	199900	Celana panjang casual,  High waist,  Flare leg,  Elastic waist,  Textured fabric,  Fit and Flare,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPKKEY123G039	Flare Rib Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123G039_GREEN_4_T.jpg?v=1688058230&width=320	Green	199900	Celana panjang casual,  High waist,  Flare leg,  Elastic waist,  Textured fabric,  Fit and Flare,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-DIKKEY123G038	Rib Short Sleeve Polo Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIKKEY123G038_BLACK_1_T.jpg?v=1688058224&width=320	Black	199900	Mini dress lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Fit and Flare,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-DIKKEY123G037	Rib Short Sleeve Polo Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIKKEY123G037_LT._BLUE_4_T.jpg?v=1688058217&width=320	Lt. Blue	199900	Mini dress lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Fit and Flare,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G034	Utility Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G034_OFF_WHITE_1_T.jpg?v=1688058197&width=320	Off White	179900	Blouse lengan panjang,  Kerah kemeja,  Double front pocket with flap,  Front button opening,  Loose fit,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWKEY123G033	Utility Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123G033_LT._BLUE_1.jpg?v=1688058191&width=320	Lt. Blue	179900	Blouse lengan panjang,  Kerah kemeja,  Double front pocket with flap,  Front button opening,  Loose fit,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G032	Printed V-Neck Puff Sleeves Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G032_OFF_WHITE_1_T.jpg?v=1688058184&width=320	Off White	129900	Atasan lengan pendek,  V-neck with ruched details,  Puff sleeves,  Lettuce hemline,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G031	V-Neck Puff Sleeves Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G031_BLACK_1_T.jpg?v=1688058177&width=320	Black	129900	Atasan lengan pendek,  V-neck with ruched details,  Puff sleeves,  Lettuce hemline,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKKEY123G030	Short Sleeve Crop Shirt with Round Hem	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G030_GREEN_1.jpg?v=1688058170&width=320	Green	129900	Atasan lengan pendek,  Kerah kemeja,  Rounded hemline,  Front button opening,  Fitted Crop,  Material: ,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-VEGKEY123C035	Pattern Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123C035_PINK_3_T.jpg?v=1677166525&width=320	Pink	161910	Atasan tanpa lengan,  V-neck,  Printed knit fabric,  Crop length,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKKEY123G029	Short Sleeve Crop Shirt with Round Hem	//colorbox.co.id/cdn/shop/products/I-TSKKEY123G029_OFF_WHITE_1.jpg?v=1688058163&width=320	Off White	129900	Atasan lengan pendek,  Kerah kemeja,  Rounded hemline,  Front button opening,  Fitted Crop,  Material: ,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPDFJN123G021	Denim Bermuda Pants	//colorbox.co.id/cdn/shop/products/I-SPDFJN123G021_BLUE_4_T.jpg?v=1688058157&width=320	Blue	259900	Celana pendek denim,  High waist,  Straight leg,  Dengan kantong depan dan belakang,  Regular fit,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPDFJN123G020	Printed Flare Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDFJN123G020_BLUE_4_T.jpg?v=1688058152&width=320	Blue	359900	Celana panjang denim,  Fit and flare cur,  Dilengkapi kantong depan dan belakang,  Printed fabric,  Fit and Flare,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-BLWFJN123G019	Tapered Waist Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/I-BLWFJN123G019_OFF_WHITE_3_T.jpg?v=1688058145&width=320	Off White	259900	Blouse lengan panjang,  Kerah kemeja,  Tight back waist with elastic,  Front button opening,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTGFJN123G018	Wavy Knit Tank Top	//colorbox.co.id/cdn/shop/products/I-TTGFJN123G018_MULTICOLOR_1_T.jpg?v=1688058139&width=320	Multicolor	149900	Atasan tanpa lengan,  V-neck,  Wavy knit fabric,  Crop length,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TSKFJN123G017	Solid Button Up Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TSKFJN123G017_OFF_WHITE_3_T.jpg?v=1688058132&width=320	Off White	129900	Atasan lengan pendek,  Round neck with tie back details,  Front button opening,  Textured fabric,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-VEDFJN123G016	Printed Denim Crop Waistcoat	//colorbox.co.id/cdn/shop/products/I-VEDFJN123G016_MED_BLUE_1_T.jpg?v=1688058125&width=320	Med Blue	229900	Atasan denim tanpa lengan,  V-neck with collar,  Front button opening,  Printed fabric,  Fitted Crop,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SWGFJN123G015	Long Sleeve Wavy Knit Sweater	//colorbox.co.id/cdn/shop/products/I-SWGFJN123G015_MULTICOLOR_3_T.jpg?v=1688058118&width=320	Multicolor	259900	Sweater lengan panjang,  Ribbed high neck,  Drop shoulder details,  Wavy knit fabric,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-COGFCR123G013	Crochet Long Sleeve Cardigan with Button	//colorbox.co.id/cdn/shop/products/I-COGFCR123G013_BEIGE_1_T.jpg?v=1688057978&width=320	Beige	259900	Cardigan lengan panjang,  Textured fabric,  V-neck,  Front button opening,  Wavy hem details,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-DIWFCR123G012	Printed Ruffle Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWFCR123G012_BLUE_1_T.jpg?v=1688057972&width=320	Blue	259900	Mini dress tanpa lengan,  Square neckline,  Printed fabric with ruffle details,  Fit and Flare,  Material: Rayon Twill,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SDDFCR123G011	Button Up Midi Denim Skirt	//colorbox.co.id/cdn/shop/products/I-SDDFCR123G011_LT._BLUE_4_T.jpg?v=1688057964&width=320	Lt. Blue	299900	Midi skirt denim,  Straight cut,  Metal font button opening,  Dengan kantong samping dan belakang,  A-line,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWFCR123G009	Fitted Puff Sleeves Crop Top	//colorbox.co.id/cdn/shop/products/IBSWFCR123G009_OFF_WHITE_1_T.jpg?v=1688057951&width=320	Off White	179900	Atasan lengan pendek,  Puff sleeves,  Square neck,  Tight waist with tie details,  Crop length,  Fitted Crop,  Material: ,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TLGFCR123G008	Off Shoulder Long Sleeve Knit Top	//colorbox.co.id/cdn/shop/products/I-TLGFCR123G008_BEIGE_1.jpg?v=1688057944&width=320	Beige	229900	Atasan knit lengan panjang,  Off shoulder,  Front zipper opening,  Textured fabric,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-TTWFCR123G007	Ruffled Trim Sleeveless Top	//colorbox.co.id/cdn/shop/products/I-TTWFCR123G007_BLUE_1_T.jpg?v=1688057938&width=320	Blue	129900	Atasan tanpa lengan,  Adjustable spaghetti strap,  Square neck,  Ruffle trim details,  Printed fabric,  Fitted Crop,  Material: Rayon Twill,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SIWFCT123G006	Plaid Mini Wrap Skirt	//colorbox.co.id/cdn/shop/products/I-SIWFCT123G006_BLACK_4_T.jpg?v=1688057931&width=320	Black	229900	Mini skirt berbahan print,  A-line,  Front wrap with asymmetric hem,  Front button details,  A-line,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-DIWFCT123G004	Plaid Mini Dress with Contrast Lapel	//colorbox.co.id/cdn/shop/products/I-DIWFCT123G004_BLACK_4_T.jpg?v=1688057918&width=320	Black	329900	Mini dress lengan pendek,  V-neck with contrast lapel,  Front button opening,  Tied back details,  Slim fit,  Material: Cotton,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-STKFCT123G002	Preppy Long Sleeve Polo Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKFCT123G002_BLACK_4_T.jpg?v=1688057905&width=320	Black	259900	Sweatshirt lengan panjang,  Polo collar,  Contrast fabric details,  Front button opening,  Regular fit,  Material: Cotton Baby Terry,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BLWKEY123F066	Round Hem Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/IBLWKEY123F066_PINK_1.jpg?v=1688057891&width=320	Pink	161910	Blouse lengan panjang,  Kerah kemeja,  Crop length,  Front button opening,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:TSKKEY123F037	Tie Wrap Short Sleeve Top	//colorbox.co.id/cdn/shop/products/ITSKKEY123F037_BLACK_1_T.jpg?v=1688057885&width=320	Black	71910	Atasan lengan pendek,  V-neck,  Wrap front with tie back details,  Crop length,  Regular Crop,  Material: ,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:TSKKEY123F036	Tie Wrap Short Sleeve Top	//colorbox.co.id/cdn/shop/products/ITSKKEY123F036_LILAC_1_T.jpg?v=1688057878&width=320	Lilac	71910	Atasan lengan pendek,  V-neck,  Wrap front with tie back details,  Crop length,  Regular Crop,  Material: ,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:BSWKEY123F031	Short Sleeve Blouse with Front Tie	//colorbox.co.id/cdn/shop/products/IBSWKEY123F031_BLACK_3_T.jpg?v=1688057872&width=320	Black	134910	Blouse lengan pendek,  Double flap pocket,  Notch collar,  Front tie details,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-LPWFLW123F028	Printed Lounge Long Pants	//colorbox.co.id/cdn/shop/products/I-LPWFLW123F028_MULTICOLOR_4.jpg?v=1688057866&width=320	Multicolor	161910	Celana panjang casual,  Straight leg,  Elastic waist with drawstring,  Printed fabric,  Regular fit,  Material: Rayon,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-SPDFJN123F020	Denim Shorts with Turndown Waistband	//colorbox.co.id/cdn/shop/products/I-SPDFJN123F020_LT._BLUE_4_T.jpg?v=1688057858&width=320	Lt. Blue	233910	Celana pendek denim,  Raw hemline,  Turndown waistband details,  Dengan kantong depan dan belakang,  Slim fit,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I-JKDKEY123D014	Crop Oversized Denim Jacket	//colorbox.co.id/cdn/shop/products/I-JKDKEY123D014_MED_BLUE_1.jpg?v=1688057851&width=320	Med Blue	323910	Jaket denim lengan panjang,  Kerah kemeja,  Drop shoulder details,  Double front pocket with button,  Oversized Crop,  Material: Denim,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm
I:TSKBSC520O603	Basic Loose Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O603_BROWN_1_T.jpg?v=1685884554&width=320	Brown	69900	T-shirt lengan pendek,  Round neck,  Regular length,  Unfinished hemline details,  Loose fit,  Material: TC,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKBBT123F306	Short Sleeves Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123F306_OFF_WHITE_3_T.jpg?v=1685884540&width=320	Off White	49900	T-shirt lengan pendek,  Round neck,  Regular length,  Graphic details,  Regular fit,  Material: TC,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKBBT123F305	Short Sleeves Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123F305_BROWN_1_T.jpg?v=1685884534&width=320	Brown	49900	T-shirt lengan pendek,  Round neck,  Regular length,  Graphic details,  Regular fit,  Material: TC,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKBBT123F302	Short Sleeves Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT123F302_PINK_1_T.jpg?v=1685884513&width=320	Pink	49900	T-shirt lengan pendek,  Round neck,  Crop length,  Front graphic details,  Oversized Crop,  Material: TC,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPDKEY123F071	Straight Crop Denim with Pocket	//colorbox.co.id/cdn/shop/products/I-LPDKEY123F071_LT._BLUE_4_T.jpg?v=1685884500&width=320	Lt. Blue	296910	Celana panjang denim,  Crop length,  Straight leg,  High waist,  Double front pocket,  Contrast stitching details,  Regular Crop,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPDKEY123F070	Straight Crop Denim with Pocket	//colorbox.co.id/cdn/shop/products/I-LPDKEY123F070_MED_BLUE_4_T.jpg?v=1685884493&width=320	Med Blue	296910	Celana panjang denim,  Crop length,  Straight leg,  High waist,  Double front pocket,  Contrast stitching details,  Regular Crop,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-VEGKEY123F065	Fitted Knit Vest with Collar	//colorbox.co.id/cdn/shop/products/I-VEGKEY123F065_BLACK_1_T.jpg?v=1685884472&width=320	Black	161910	Atasan tanpa lengan,  V-neck with polo collar,  Rib details,  Crop length,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-VEGKEY123F064	Fitted Knit Vest with Collar	//colorbox.co.id/cdn/shop/products/I-VEGKEY123F064_LT._BLUE_3_T.jpg?v=1685884466&width=320	Lt. Blue	161910	Atasan tanpa lengan,  V-neck with polo collar,  Rib details,  Crop length,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-STKKEY123F063	Elastic Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123F063_PINK_3_T.jpg?v=1685884459&width=320	Pink	161910	Sweatshirt lengan panjang,  Round neck,  Graphic at front,  Drop shoulder,  Elastic hemline details,  Regular Crop,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-STKKEY123F062	Elastic Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123F062_OFF_WHITE_1_T.jpg?v=1685884451&width=320	Off White	161910	Sweatshirt lengan panjang,  Round neck,  Graphic at front,  Drop shoulder,  Elastic hemline details,  Regular Crop,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSGKEY123F061	Contrast Stripe Short Sleeve Polo Top	//colorbox.co.id/cdn/shop/files/colorbox-55.jpg?v=1687950462&width=320	Off White	161910	Atasan lengan pendek,  Contrast polo collar,  Textured fabric,  Stripe rib details,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSGKEY123F060	Contrast Stripe Short Sleeve Polo Top	//colorbox.co.id/cdn/shop/files/colorbox-53.jpg?v=1687949884&width=320	Blue	161910	Atasan lengan pendek,  Contrast polo collar,  Textured fabric,  Stripe rib details,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-COKKEY123F059	Tie Front Long Sleeve Cardigan	//colorbox.co.id/cdn/shop/products/I-COKKEY123F059_OFF_WHITE_3_T.jpg?v=1685884429&width=320	Off White	143910	Cardigan lengan panjang,  Textured fabric,  V-neckline,  Tied front details,  Crop length,  Fitted fit,  Material: Baby Plisket,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-COKKEY123F058	Tie Front Long Sleeve Cardigan	//colorbox.co.id/cdn/shop/products/I-COKKEY123F058_PINK_3_T.jpg?v=1685884422&width=320	Pink	143910	Cardigan lengan panjang,  Textured fabric,  V-neckline,  Tied front details,  Crop length,  Fitted fit,  Material: Baby Plisket,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SPWKEY123F056	Crinkle Drawstring Shorts	//colorbox.co.id/cdn/shop/products/I-SPWKEY123F056_BROWN_4_T.jpg?v=1685884408&width=320	Brown	161910	Celana pendek high waist,  Elastic waist with drawstring,  Double front pocket,  Regular fit,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:CLWKEY123F055	Cropped Culottes with Double Button Details	//colorbox.co.id/cdn/shop/products/ICLWKEY123F055_BLACK_4_T.jpg?v=1685884401&width=320	Black	206910	Celana panjang crop length,  Front pleat details,  Elastic back waist,  Front zipper with double button opening,  Dilengkapi kantong samping,  Regular fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:CLWKEY123F054	Cropped Culottes with Double Button Details	//colorbox.co.id/cdn/shop/products/ICLWKEY123F054_BROWN_4_T.jpg?v=1685884393&width=320	Brown	206910	Celana panjang crop length,  Front pleat details,  Elastic back waist,  Front zipper with double button opening,  Dilengkapi kantong samping,  Regular fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWKEY123F053	Printed V-Neck Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123F053_ORANGE_1_T.jpg?v=1685884387&width=320	Orange	206910	Mini dress lengan pendek,  V-neckline,  Front button opening,  Stripe printed fabric,  Regular fit,  Material: Oxford,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWKEY123F052	Printed V-Neck Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123F052_BEIGE_1_T.jpg?v=1685884379&width=320	Beige	206910	Mini dress lengan pendek,  V-neckline,  Front button opening,  Stripe printed fabric,  Regular fit,  Material: Oxford,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:BLWKEY123F051	Tie Hem Crinkle Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBLWKEY123F051_BROWN_3_T.jpg?v=1685884372&width=320	Brown	161910	Blouse lengan panjang,  Kerah kemeja,  Front button opening,  Tied front hemline,  Drop shoulder details,  Regular Crop,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:BLWKEY123F050	Tie Hem Crinkle Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBLWKEY123F050_BEIGE_1_T.jpg?v=1685883792&width=320	Beige	161910	Blouse lengan panjang,  Kerah kemeja,  Front button opening,  Tied front hemline,  Drop shoulder details,  Regular Crop,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-COGKEY123F049	Wrap Knit Long Sleeve Sweater	//colorbox.co.id/cdn/shop/products/I-COGKEY123F049_OFF_WHITE_1_T.jpg?v=1685883785&width=320	Off White	206910	Sweater lengan panjang,  V-neck with front wrap,  Side tie details,  Drop shoulder,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-COGKEY123F048	Wrap Knit Long Sleeve Sweater	//colorbox.co.id/cdn/shop/products/I-COGKEY123F048_BEIGE_1_T.jpg?v=1685883778&width=320	Beige	206910	Sweater lengan panjang,  V-neck with front wrap,  Side tie details,  Drop shoulder,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKKEY123F047	Lettuce Rib Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKKEY123F047_OFF_WHITE_3_T.jpg?v=1685883771&width=320	Off White	89910	T-shirt lengan pendek,  High lettuce neck,  Front embroidery details,  Textured fabric,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKKEY123F046	Lettuce Rib Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKKEY123F046_ORANGE_1_T.jpg?v=1685883764&width=320	Orange	89910	T-shirt lengan pendek,  High lettuce neck,  Front embroidery details,  Textured fabric,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BSWKEY123F045	Ruffles Square Crop Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123F045_OFF_WHITE_3_T.jpg?v=1685883757&width=320	Off White	161910	Atasan lengan pendek,  Square neck with open back,  Ruffle sleeves,  Tied back details,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BSWKEY123F044	Ruffles Square Crop Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123F044_ORANGE_1_T.jpg?v=1685883750&width=320	Orange	161910	Atasan lengan pendek,  Square neck with open back,  Ruffle sleeves,  Tied back details,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPWKEY123F043	Parachute Pants with Drawstring Details	//colorbox.co.id/cdn/shop/products/I-LPWKEY123F043_BLACK_4_T.jpg?v=1685883743&width=320	Black	233910	Celana panjang high waist,  Wide leg dengan tali serut di bagian hemline,  Dengan kantong samping,  Elastic waist with drawstring,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPWKEY123F042	Parachute Pants with Drawstring Details	//colorbox.co.id/cdn/shop/files/colorbox-72.jpg?v=1687950688&width=320	Beige	233910	Celana panjang high waist,  Wide leg dengan tali serut di bagian hemline,  Dengan kantong samping,  Elastic waist with drawstring,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SPDKEY123F041	Basic Denim Shorts	//colorbox.co.id/cdn/shop/products/I-SPDKEY123F041_BLACK_4_T.jpg?v=1685883729&width=320	Black	224910	Celana pendek denim,  High waist,  5 pocket details,  Dilengkapi dengan belt loop,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SPDKEY123F040	Basic Denim Shorts	//colorbox.co.id/cdn/shop/products/I-SPDKEY123F040_MED_BLUE_4.jpg?v=1685883722&width=320	Med Blue	224910	Celana pendek denim,  High waist,  5 pocket details,  Dilengkapi dengan belt loop,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-STKKEY123F039	Graphic Long Sleeve Collared Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123F039_GREEN_1_T.jpg?v=1685883715&width=320	Green	179910	Sweatshirt lengan panjang,  Polo collar,  Front graphic details,  Drop shoulder,  Regular fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-STKKEY123F038	Graphic Long Sleeve Collared Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123F038_BLACK_3_T.jpg?v=1685883707&width=320	Black	179910	Sweatshirt lengan panjang,  Polo collar,  Front graphic details,  Drop shoulder,  Regular fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTKKEY123F035	Racer Front Fitted Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKKEY123F035_OFF_WHITE_1_T.jpg?v=1685883700&width=320	Off White	71910	Atasan tanpa lengan,  Racer front details,  Textured fabric,  Regular length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTKKEY123F034	Racer Front Fitted Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKKEY123F034_BLACK_1_T.jpg?v=1685883693&width=320	Black	71910	Atasan tanpa lengan,  Racer front details,  Textured fabric,  Regular length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTKKEY123F033	Racer Front Fitted Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKKEY123F033_LILAC_3_T.jpg?v=1685883686&width=320	Lilac	71910	Atasan tanpa lengan,  Racer front details,  Textured fabric,  Regular length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TLKKEY123F030	Ribbed Long Sleeve Polo Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123F030_BLACK_1_T.jpg?v=1685883671&width=320	Black	143910	Atasan lengan panjang,  V-neck with polo collar,  Textured fabric,  Crop length,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TLKKEY123F029	Ribbed Long Sleeve Polo Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123F029_GREEN_1_T.jpg?v=1685883663&width=320	Green	143910	Atasan lengan panjang,  V-neck with polo collar,  Textured fabric,  Crop length,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWFLW123F025	Piped-Trim Lounge Mini Lounge Dress	//colorbox.co.id/cdn/shop/files/colorbox-24.jpg?v=1687950495&width=320	Pink	179910	Mini lounge dress,  Wide collar with trim details,  Front button opening,  Puff sleeves,  Regular fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWFLW123F024	Printed Piped-Trim Mini Lounge Dress	//colorbox.co.id/cdn/shop/files/colorbox-2.jpg?v=1687949990&width=320	Multicolor	179910	Mini lounge dress,  Wide collar with trim details,  Front button opening,  Puff sleeves,  Printed fabric,  Regular fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SWSFLW123F023	Printed Trim Shirt and Shorts Pajama Set	//colorbox.co.id/cdn/shop/files/colorbox-17.jpg?v=1687950051&width=320	Multicolor	224910	Pajama set lengan pendek dan shorts,  Piped trim details,  Shorts dengan elastic waist dan kantong samping,  Atasan dengan kantong depan,  Regular fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SWSFLW123F022	Piped-Trim Shirt and Shorts Pajama Set	//colorbox.co.id/cdn/shop/files/colorbox-5.jpg?v=1687950135&width=320	Khaki	224910	Pajama set lengan pendek dan shorts,  Piped trim details,  Shorts dengan elastic waist dan kantong samping,  Atasan dengan kantong depan,  Regular fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPDFJN123F021	Parachute Denim Pants with Side Pocket	//colorbox.co.id/cdn/shop/products/I-LPDFJN123F021_LT._BLUE_4_T.jpg?v=1685883626&width=320	Lt. Blue	323910	Celana panjang denim,  Adjustable waist with drawstring,  Double side and back flap pocket,  Dilengkapi kantong samping,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TBWFJN123F019	Smocked Back Tube Top	//colorbox.co.id/cdn/shop/files/colorbox-46.jpg?v=1687950858&width=320	Pink	161910	Atasan model tube,  Smocked back details,  Crop length,  Ruffles hemline,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TLKFJN123F017	Printed Wrap Long Sleeve Top	//colorbox.co.id/cdn/shop/files/colorbox-32.jpg?v=1687950276&width=320	Multicolor	161910	Atasan lengan panjang,  V-neck with wrap details,  Crop length,  Printed fabric,  Fitted Crop,  Material: Poly Spandex,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BLWFJN123F016	Tie Front Long Sleeve Blouse	//colorbox.co.id/cdn/shop/files/colorbox-49.jpg?v=1687950548&width=320	Pink	206910	Blouse lengan panjang,  Puff sleeves,  Notch collar,  Tie front opening,  Slim fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTKFJN123F015	Printed Halter Crop Top	//colorbox.co.id/cdn/shop/files/colorbox-44.jpg?v=1687950222&width=320	Multicolor	116910	Atasan tanpa lengan,  Halter neck with open back,  Front button opening,  Printed fabric,  Fitted Crop,  Material: Poly Spandex,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWFCR123F014	Tie Strap Tiered Cami Dress	//colorbox.co.id/cdn/shop/files/colorbox-19.jpg?v=1687950247&width=320	Khaki	233910	Mini dress tanpa lengan,  Tied strap details,  Tiered bottom,  Aksen ruffle di bagian leher,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SDWFCR123F013	Printed Ruched Midi Skirt	//colorbox.co.id/cdn/shop/products/I-SDWFCR123F013_ORANGE_4_T.jpg?v=1685883299&width=320	Orange	224910	Midi skirt berpotongan lurus,  High slit front details,  Aksen serut di bagian samping,  Printed fabric,  Fitted fit,  Material: Cotton Rayon Twill,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SPWFCR123F012	High Waist Shorts with Drawstring Details	//colorbox.co.id/cdn/shop/products/I-SPWFCR123F012_WHITE_4_T.jpg?v=1685883293&width=320	White	206910	Celana pendek high waist,  Paperbag waist with drawstring,  Dilengkapi kantong depan dan belakang,  Regular fit,  Material: Linen Look,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BSWFCR123F011	Puff Sleeve Crop Top	//colorbox.co.id/cdn/shop/products/I-BSWFCR123F011_WHITE_3_T.jpg?v=1685883286&width=320	White	179910	Atasan lengan pendek,  Puff sleeves,  Side zipper opening,  Elastic back details,  Crop length,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-COGFCR123F010	Knotted Hollow Out Cardigan	//colorbox.co.id/cdn/shop/files/colorbox-27.jpg?v=1687950386&width=320	Khaki	251910	Cardigan lengan panjang,  Textured fabric,  V-neckline,  Tied front details,  Slim Crop,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BLWFCR123F009	Lace Up Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/I-BLWFCR123F009_WHITE_1_T.jpg?v=1685883271&width=320	White	233910	Blouse lengan panjang,  Kerah kemeja,  Front button opening with lace up details,  Rounded hemline,  Slim fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTKFCR123F008	Halter Top with Ruched Details	//colorbox.co.id/cdn/shop/products/I-TTKFCR123F008_ORANGE_1_T.jpg?v=1685883264&width=320	Orange	89910	Atasan tanpa lengan,  Halter neck with open back,  Textured details,  Front ruched details,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SLWFCR123F007	Drawstring Shirred Ruffle Trim Top	//colorbox.co.id/cdn/shop/files/colorbox-11.jpg?v=1687950337&width=320	Orange	161910	Atasan tanpa lengan,  Ruffles on shoulder,  Front tie details,  Side zipper opening,  Crop length,  Fitted Crop,  Material: Cotton Rayon Twill,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-DIWFCT123F006	Halter Neck Mini Dress	//colorbox.co.id/cdn/shop/files/colorbox-74.jpg?v=1687950639&width=320	Black	224910	Mini dress tanpa lengan,  Halter neck,  Side zipper opening,  A-line bottom,  Fitted fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-LPWFCT123F005	Flipped Out Waistline Trousers	//colorbox.co.id/cdn/shop/products/I-LPWFCT123F005_OFF_WHITE_4_T.jpg?v=1685883242&width=320	Off White	296910	Celana panjang high waist,  Wide leg,  Elastic back waist,  Flipped out details on waist,  Dilengkapi kantong samping,  Regular Straight Full,  Material: Poly Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SIWFCT123F004	Sateen Finish Ruffle Mini Skirt	//colorbox.co.id/cdn/shop/products/I-SIWFCT123F004_MULTICOLOR_4_T.jpg?v=1685883235&width=320	Multicolor	179910	Mini skirt bahan print,  Dengan aksen ruffle,  Side tie details,  Slim fit,  Material: Sateen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TLKFCT123F003	Rib Stitch Button Up Crop Top	//colorbox.co.id/cdn/shop/products/I-TLKFCT123F003_BLACK_3_T.jpg?v=1685883228&width=320	Black	161910	Atasan lengan panjang,  V-neckline,  Front button opening,  Textured fabric,  Crop length,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TTWFCT123F002	Sateen Corset Sleeveless Top	//colorbox.co.id/cdn/shop/files/colorbox-60.jpg?v=1687950610&width=320	Multicolor	134910	Atasan tanpa lengan,  Adjustable spaghetti strap,  Crop length,  Ruched back details,  Side zipper opening,  Fitted Crop,  Material: Sateen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-TSKFCT123F001	Short Sleeve Button Down Crop Top	//colorbox.co.id/cdn/shop/products/I-TSKFCT123F001_BLACK_1_T.jpg?v=1685883214&width=320	Black	143910	Atasan lengan pendek,  Kerah kemeja,  Front button opening,  Asymmetric hemline,  Textured fabric,  Fitted Crop,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:SIDFCT123E023	Pleated Denim Mini Skirt	//colorbox.co.id/cdn/shop/products/ISIDFCT123E023_LT._PINK_4_T.jpg?v=1685883208&width=320	Lt. Pink	251910	Mini skirt denim,  Wide pleat details,  Side zipper with metal button opening,  High waist,  Slim fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SIDFJN123E020	Pixel Denim Mini Skirt	//colorbox.co.id/cdn/shop/products/I-SIDFJN123E020_BLUE_4_T.jpg?v=1685883201&width=320	Blue	233910	Mini skirt denim,  Pixel pattern details,  Dengan kantong depan dan belakang,  A-line cut,  Front zipper with metal button opening,  Slim fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:TTDFJN123E016	Sleeveless Denim Crop Top	//colorbox.co.id/cdn/shop/files/COLORBOX_-159.jpg?v=1685885932&width=320	Med Blue	206910	Atasan tanpa lengan,  Embroidered front pocket,  Side metal button details,  Crop length,  Fitted Super Crop,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-SKDFCR123E012	Mini Denim Skort	//colorbox.co.id/cdn/shop/products/I-SKDFCR123E012_LT._BLUE_4_T.jpg?v=1685883187&width=320	Lt. Blue	269910	Mini skort bahan denim,  Dilengkapi belt dengan gesper,  Front slit details,  Slim fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:BLWFCT123E003	Long Sleeve Corset Crop Top	//colorbox.co.id/cdn/shop/files/COLORBOX_-172.jpg?v=1685885734&width=320	Pink	224910	Atasan lengan panjang,  Square neck with tie details,  Puffy sleeves,  Back zipper opening,  Slim Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I-BSWFJN123D017	Collared Crop Blouse with Textured	//colorbox.co.id/cdn/shop/products/I-BSWFJN123D017_ECRU_1_T.jpg?v=1685883173&width=320	Ecru	206910	Atasan lengan pendek,  Kerah kemeja,  Elastic back hemline,  Double front pocket,  Roll up sleeves,  Fitted Crop,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 81 cm,  Hips: 91 cm
I:LPWKEY123E032	Pleated Woven Long Pants	//colorbox.co.id/cdn/shop/products/ILPWKEY123E032_BLACK_4_T.jpg?v=1683700746&width=320	Black	251910	Celana panjang woven,  High waist,  Front pleat details,  With belt loop and side pocket,  Regular fit,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSKBSC522O608	Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O608_BLUE_1_T.jpg?v=1682968227&width=320	Blue	59900	T-shirt lengan pendek,  Round neck,  Raw hemline details,  Crop length,  Regular Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBSC520O602	Round Neck Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O602_BLUE_1.jpg?v=1682968213&width=320	Blue	69900	T-shirt lengan pendek,  Round neck,  Raw hemline details,  Regular length,  Loose fit,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSKBSC523O601	Fitted Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC523O601_DARK_BERRY_1_T.jpg?v=1682968207&width=320	Dark Berry	79900	T-shirt lengan pendek,  Round neck,  Stretch fabric,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSKBSC523O599	Fitted Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC523O599_YELLOW_3_T.jpg?v=1682968192&width=320	Yellow	79900	T-shirt lengan pendek,  Round neck,  Stretch fabric,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSKBSC523O598	Fitted Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC523O598_DUSTY_PINK_1_T.jpg?v=1682968185&width=320	Dusty Pink	79900	T-shirt lengan pendek,  Round neck,  Stretch fabric,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:DIWFJN222I019	Button Front Halter Mini Dress	//colorbox.co.id/cdn/shop/products/IDIWFJN222I019_MULTICOLOR_1_T.jpg?v=1682968171&width=320	Multicolor	83970	Mini dress tanpa lengan,  Halter neck with collar,  Cross back details,  Front button opening,  Slim fit,  Material: Cotton Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-STKECO222I008	Graphic Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKECO222I008_NAVY_1_T.jpg?v=1682968156&width=320	Navy	109900	Sweatshirt lengan panjang,  Round neck,  Drop shoulder details,  Textured fabric,  Graphics at front,  Loose fit,  Material: Waffle,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-STKECO222I007	Graphic Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKECO222I007_ECRU_1_T.jpg?v=1682968149&width=320	Ecru	109900	Sweatshirt lengan panjang,  Round neck,  Drop shoulder details,  Textured fabric,  Graphics at front,  Loose fit,  Material: Waffle,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E306	Graphic Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E306_LT._BLUE_3_T.jpg?v=1682968135&width=320	Lt. Blue	59900	T-shirt lengan pendek,  Round neck,  Graphic at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E305	Graphic Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E305_OFF_WHITE_1_T.jpg?v=1682968128&width=320	Off White	59900	T-shirt lengan pendek,  Round neck,  Graphic at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E304	Graphic V-Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E304_ECRU_3_T.jpg?v=1682968121&width=320	Ecru	59900	T-shirt lengan pendek,  V-neck,  Graphic at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E303	Graphic Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E303_BLACK_3_T.jpg?v=1682968114&width=320	Black	59900	T-shirt lengan pendek,  Round neck,  Graphic at front,  Regular length,  Regular fit,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E302	Graphic Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E302_MISTY_GREY_1_T.jpg?v=1682967879&width=320	Misty Grey	69900	T-shirt lengan pendek,  Round neck,  Graphic at front,  Crop length,  Regular Crop,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKBBT123E301	Full Print Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT123E301_MULTICOLOR_1_T.jpg?v=1682967872&width=320	Multicolor	69900	T-shirt lengan pendek,  Round neck,  Full print fabric,  Crop length,  Regular Crop,  Material: TC,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-DIKKEY123E055	Collared A-Line Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIKKEY123E055_PINK_1_T.jpg?v=1682967864&width=320	Pink	197910	Mini dress lengan pendek,  Kerah kemeja,  Front button opening,  Lettuce hem details,  Regular Crop,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-DIKKEY123E054	Collared A-Line Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIKKEY123E054_BLACK_4_T.jpg?v=1682967856&width=320	Black	197910	Mini dress lengan pendek,  Kerah kemeja,  Front button opening,  Lettuce hem details,  Regular Crop,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPDKEY123E053	Regular Fit Cargo Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY123E053_LT._BLUE_4_T.jpg?v=1682967849&width=320	Lt. Blue	296910	Celana panjang,  denim,  High waist,  Wide leg,  Cargo pocket details,  Kantong depan dan belakang,  Elastic back waist,  Regular fit,  Material: Soft Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPDKEY123E052	Regular Fit Cargo Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY123E052_DARK_BLUE_4_T.jpg?v=1682967841&width=320	Dark Blue	296910	Celana panjang,  denim,  High waist,  Wide leg,  Cargo pocket details,  Kantong depan dan belakang,  Elastic back waist,  Regular fit,  Material: Soft Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BLWKEY123E049	Long Sleeve Printed Crop Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123E049_PINK_1_T.jpg?v=1682967833&width=320	Pink	161910	Atasan lengan panjang,  Kerah kemeja,  Front pocket details,  Crop length,  Printed fabric,  Regular Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BLWKEY123E048	Long Sleeve Printed Crop Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123E048_BLUE_1_T.jpg?v=1682967826&width=320	Blue	161910	Atasan lengan panjang,  Kerah kemeja,  Front pocket details,  Crop length,  Printed fabric,  Regular Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKKEY123E047	Short Sleeve Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY123E047_LT._BLUE_1_T.jpg?v=1682967818&width=320	Lt. Blue	89910	T-shirt lengan pendek,  Round neck,  Stretch fabric,  Crop length,  Graphic at front,  Fitted fit,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKKEY123E045	Short Sleeve Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY123E045_RED_1_T.jpg?v=1682967803&width=320	Red	89910	T-shirt lengan pendek,  Round neck,  Stretch fabric,  Crop length,  Graphic at front,  Fitted fit,  Material: Cotton Spandex,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPKKEY123E044	Drawstring Rib Trousers	//colorbox.co.id/cdn/shop/products/I-LPKKEY123E044_KHAKI_4_T.jpg?v=1682967796&width=320	Khaki	206910	Celana panjang casual,  Textured fabric,  High waist,  Elastic waist with drawstring,  Regular fit,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPKKEY123E043	Drawstring Rib Trousers	//colorbox.co.id/cdn/shop/products/I-LPKKEY123E043_BLACK_4_T.jpg?v=1682967789&width=320	Black	206910	Celana panjang casual,  Textured fabric,  High waist,  Elastic waist with drawstring,  Regular fit,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:SPWKEY123E042	Rolled Up Hem Shorts	//colorbox.co.id/cdn/shop/products/ISPWKEY123E042_LT._BLUE_4_T.jpg?v=1682967782&width=320	Lt. Blue	179910	Celana pendek high waist,  Front pleat details,  Rolled up hemline,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:SPWKEY123E041	Rolled Up Hem Shorts	//colorbox.co.id/cdn/shop/products/ISPWKEY123E041_KHAKI_4_T.jpg?v=1682967776&width=320	Khaki	179910	Celana pendek high waist,  Front pleat details,  Rolled up hemline,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:SPWKEY123E040	Rolled Up Hem Shorts	//colorbox.co.id/cdn/shop/products/ISPWKEY123E040_OFF_WHITE_4_T.jpg?v=1682967769&width=320	Off White	179910	Celana pendek high waist,  Front pleat details,  Rolled up hemline,  Elastic back waist,  Dengan kantong samping,  Regular fit,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSGKEY123E039	Textured Knit Polo Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123E039_KHAKI_1_T.jpg?v=1682967762&width=320	Khaki	179910	Atasan lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSGKEY123E038	Textured Knit Polo Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123E038_OFF_WHITE_3_T.jpg?v=1682967755&width=320	Off White	179910	Atasan lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BLWKEY123E037	Tied Details Bell Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123E037_LT._BLUE_1_T.jpg?v=1682967748&width=320	Lt. Blue	161910	Blouse lengan panjang,  Kerah kemeja,  Bell sleeves with tied details,  Front button opening,  Regular fit,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BLWKEY123E036	Tied Details Bell Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123E036_OFF_WHITE_3_T.jpg?v=1682967741&width=320	Off White	161910	Blouse lengan panjang,  Kerah kemeja,  Bell sleeves with tied details,  Front button opening,  Regular fit,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BSWKEY123E035	Square Neck Printed Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123E035_YELLOW_3_T.jpg?v=1682967734&width=320	Yellow	143910	Atasan lengan pendek,  Square neck with front bow details,  Puff sleeves,  Printed fabric,  Regular Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BSWKEY123E034	Square Neck Printed Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123E034_OFF_WHITE_1_T.jpg?v=1682967727&width=320	Off White	143910	Atasan lengan pendek,  Square neck with front bow details,  Puff sleeves,  Printed fabric,  Regular Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TLKKEY123E029	Back Focus Ribbed Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123E029_BLACK_1_T.jpg?v=1682967548&width=320	Black	116910	Atasan lengan panjang,  Round neck,  Crop length,  Open back details,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TLKKEY123E028	Back Focus Ribbed Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123E028_OFF_WHITE_3_T.jpg?v=1682967541&width=320	Off White	116910	Atasan lengan panjang,  Round neck,  Crop length,  Open back details,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BSWKEY123E027	Flutter Button Up Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123E027_BLACK_1_T.jpg?v=1682967534&width=320	Black	134910	Blouse lengan pendek,  Square neck,  Open back with tied details,  Puffy sleeves,  Crop length,  Fitted Crop,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BSWKEY123E026	Flutter Button Up Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123E026_MULTICOLOR_1_T.jpg?v=1682967528&width=320	Multicolor	134910	Blouse lengan pendek,  Square neck,  Open back with tied details,  Puffy sleeves,  Crop length,  Fitted Crop,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSGKEY123E025	Cropped Knit Polo Top	//colorbox.co.id/cdn/shop/products/ITSGKEY123E025_BLACK_1_T.jpg?v=1682967520&width=320	Black	116910	Atasan lengan pendek,  V-neck with polo collar,  Textured fabric,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSGKEY123E024	Cropped Knit Polo Top	//colorbox.co.id/cdn/shop/products/ITSGKEY123E024_DUSTY_PINK_1_T.jpg?v=1682967513&width=320	Dusty Pink	116910	Atasan lengan pendek,  V-neck with polo collar,  Textured fabric,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-JKDFCT123E022	Biker Denim Jacket	//colorbox.co.id/cdn/shop/files/COLORBOX-82.jpg?v=1685885822&width=320	Black	413910	Jaket denim lengan panjang,  Front metal zipper opening,  Zipped front pocket,  Crop length,  Regular fit,  Material: Denim,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPDFJN123E021	Pixel Denim Pants	//colorbox.co.id/cdn/shop/files/COLORBOX_-140.jpg?v=1685885855&width=320	Multicolor	296910	Celana panjang denim,  Pixel printed details,  Kantong depan dan belakang,  High waist,  Wide straight leg,  Regular Straight Full,  Material: Denim,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BSWFJN123E019	Asymmetrical Hem Crop Blouse	//colorbox.co.id/cdn/shop/files/COLORBOX_-107.jpg?v=1685886437&width=320	Off White	179910	Blouse lengan pendek,  Kerah kemeja,  Asymmetric hem detail,  Front button opening,  Crop length,  Slim Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TLGFJN123E018	Long Sleeve Knit Cardigan	//colorbox.co.id/cdn/shop/products/I-TLGFJN123E018_RED_1_T.jpg?v=1682967478&width=320	Red	251910	Atasan lengan panjang,  Kerah kemeja,  Textured fabric,  Front button opening,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TTGFJN123E017	Criss Cross Tie Tank Top	//colorbox.co.id/cdn/shop/products/I-TTGFJN123E017_OFF_WHITE_3_T.jpg?v=1682967471&width=320	Off White	179910	Atasan tanpa lengan,  Criss cross back with tie details,  Textured fabric,  Square neck,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-COGFJN123E015	Multicolor Knit Cardigan	//colorbox.co.id/cdn/shop/products/I-COGFJN123E015_MULTICOLOR_3_T.jpg?v=1682967464&width=320	Multicolor	296910	Cardigan lengan panjang,  V-neck,  Front button opening,  Drop shoulder details,  Colorblock fabric,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-DDWFCR123E014	Volume Frill Sleeves Midi Dress	//colorbox.co.id/cdn/shop/files/COLORBOX_-83.jpg?v=1685886016&width=320	Yellow	269910	Midi dress tanpa lengan,  Tiered bottom,  Tied back details,  Frill sleeves,  Square neck,  Fit and Flare,  Material: Rayon Twill,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPDFCR123E013	Super Highwaist Paperbag Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDFCR123E013_LT._BLUE_4_T.jpg?v=1682967448&width=320	Lt. Blue	323910	Celana panjang denim,  Super high waist,  Self fabric belt,  Front button opening,  Double back pocket,  High Regular Wide Ankle,  Material: Denim,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSGFCR123E011	Polo Top with Shell Button Details	//colorbox.co.id/cdn/shop/files/COLORBOX_-69.jpg?v=1685885976&width=320	Yellow	233910	Atasan lengan pendek,  Polo collar,  Front button opening,  Crop length,  Textured fabric,  Crop,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-COGFCR123E010	Heart Knit Cable Cardigan	//colorbox.co.id/cdn/shop/products/I-COGFCR123E010_YELLOW_1_T.jpg?v=1682967434&width=320	Yellow	296910	Cardigan lengan panjang,  V-neck,  Front button opening,  Wide sleeves with drop shoulder,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKFCR123E009	Graphic Oversized Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/files/COLORBOX_-37.jpg?v=1685886049&width=320	Off White	161910	T-shirt lengan pendek,  Round neck,  Oversized cut,  Graphics at front,  Oversized,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TTWFCR123E008	Tie Shoulder Trim Crop Top	//colorbox.co.id/cdn/shop/files/COLORBOX_-4.jpg?v=1685886130&width=320	Yellow	161910	Atasan tanpa lengan,  Tied shoulder details,  Elastic at back,  Side zipper opening,  Fitted Crop,  Material: Rayon Twill,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BLWFCR123E007	Off Shoulder Ruffled Top	//colorbox.co.id/cdn/shop/files/COLORBOX_-23.jpg?v=1685886156&width=320	Off White	224910	Atasan lengan panjang,  Frilled off shoulder with adjustable strap,  Elastic on waist,  Crop length,  Slim Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TSKKEY221L074	Fitted Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L074_LILAC_4_T.jpg?v=1636620474&width=320	Lilac	79900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Material: Cotton Combed,  Warna:  LILAC,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:SPWFCT123E006	Cross Over Tailored Shorts	//colorbox.co.id/cdn/shop/products/ISPWFCT123E006_BLACK_4_T.jpg?v=1685886180&width=320	Black	206910	A-line woven short pants,  High waist,  Cut out side details,  Front zipper opening,  Slim fit,  Material: Poly Stretch,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-LPWFCT123E005	Side Lace Wide Leg Pants	//colorbox.co.id/cdn/shop/products/I-LPWFCT123E005_BLACK_4_T.jpg?v=1682967396&width=320	Black	296910	Celana panjang woven,  High waist,  Tied side lace details,  Back zipper opening,  Regular Straight Full,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-DIWFCT123E004	Puffy Smocked Waist Mini Dress	//colorbox.co.id/cdn/shop/files/COLORBOX-34_04ec5d19-126d-4681-8667-eb4f9f5f8df9.jpg?v=1685886401&width=320	Pink	251910	Mini dress lengan pendek,  Puff sleeves,  Smocked waist details,  Printed fabric,  Slim fit,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:TTKFCT123E002	Lace Up Tank Top	//colorbox.co.id/cdn/shop/files/COLORBOX-42.jpg?v=1685886291&width=320	Black	161910	Atasan tanpa lengan,  Front lace up details,  Crop length,  Textured fabric,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-BZWFCT123E001	Cross Over Cropped Blazer	//colorbox.co.id/cdn/shop/products/I-BZWFCT123E001_BLACK_1_T.jpg?v=1682967143&width=320	Black	224910	Blazer lengan panjang,  V-neck with lapel,  Cross over tied back,  Crop length,  Slim Crop,  Material: Polyester,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-JKDFCT123D030	Oversized Denim Jacket	//colorbox.co.id/cdn/shop/products/I-JKDFCT123D030_BLACK_4_T.jpg?v=1682967135&width=320	Black	413910	Jaket denim lengan panjang,  Kerah kemeja,  Double flap pocket at front,  Front metal button opening,  Regular fit,  Material: Denim,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:SIWKEY223A038	Pleated Mini Skirt	//colorbox.co.id/cdn/shop/products/ISIWKEY223A038_BLACK_4_T.jpg?v=1682967121&width=320	Black	111930	Woven mini skirt,  Full pleats detail,  High waist,  Side zipper opening,  Loose fit,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:SIWKEY223A037	Pleated Mini Skirt	//colorbox.co.id/cdn/shop/products/ISIWKEY223A037_BEIGE_4_T.jpg?v=1682967115&width=320	Beige	111930	Woven mini skirt,  Full pleats detail,  High waist,  Side zipper opening,  Loose fit,  Material: Cotton,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-SPWFLW223A037	Printed Lounge Shorts	//colorbox.co.id/cdn/shop/products/I-SPWFLW223A037_LILAC_4_T.jpg?v=1682967107&width=320	Lilac	64950	Celana pendek casual,  Printed fabric,  Elasticated waist,  Dengan kantong samping,  Regular fit,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-SPWFLW223A035	Printed Lounge Shorts	//colorbox.co.id/cdn/shop/products/I-SPWFLW223A035_ORANGE_4_T.jpg?v=1682967100&width=320	Orange	64950	Celana pendek casual,  Printed fabric,  Elasticated waist,  Dengan kantong samping,  Loose fit,  Material: Rayon,  Model menggunakan ukuran  S,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I:CLDBSC500426	Loose Fit Denim Cullotes	//colorbox.co.id/cdn/shop/products/ICLDBSC500426_OFF_WHITE_4_T.jpg?v=1682967093&width=320	Off White	299900	Celana panjang denim,  High waist,  Loose straight leg,  Ankle length,  5 pockets details,  Front zipper with button opening,  Loose fit,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 74 cm,  Waist: 60 cm,  Hips: 87 cm
I-TSKBSC523O597	Basic Fitted Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC523O597_ORANGE_3_T.jpg?v=1680015037&width=320	Orange	79900	T-shirt lengan pendek,  Stretch fabric,  Round neck,  Crop length,  Fitted Crop,  Material: Cotton Spandex,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D077	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123D077_BLACK_1_T.jpg?v=1680015012&width=320	Black	134910	Blouse lengan pendek,  Notch collar,  Regular length,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D076	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123D076_LILAC_3_T.jpg?v=1680015006&width=320	Lilac	134910	Blouse lengan pendek,  Notch collar,  Regular length,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D075	Short Sleeve Blouse with Front Tie	//colorbox.co.id/cdn/shop/products/IBSWKEY123D075_BLACK_4_T.jpg?v=1680015000&width=320	Black	134910	Blouse lengan pendek,  Notch collar,  Front tie details,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D074	Short Sleeve Blouse with Front Tie	//colorbox.co.id/cdn/shop/products/IBSWKEY123D074_LT._BLUE_3_T.jpg?v=1680014993&width=320	Lt. Blue	134910	Blouse lengan pendek,  Notch collar,  Front tie details,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TSKKEY123D072	Zipped Polo Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123D072_OFF_WHITE_3_T.jpg?v=1680014981&width=320	Off White	116910	Atasan lengan pendek,  Polo collar,  Lettuce hem details,  Front zipper opening,  Crop length,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D053	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D053_OFF_WHITE_1_T.jpg?v=1680014931&width=320	Off White	161910	Atasan lengan panjang,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TSKKEY123D071	Zipped Polo Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123D071_GREEN_1_T.jpg?v=1680014791&width=320	Green	116910	Atasan lengan pendek,  Polo collar,  Lettuce hem details,  Front zipper opening,  Crop length,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TSKKEY123D070	Zipped Polo Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123D070_LILAC_3_T.jpg?v=1680014784&width=320	Lilac	116910	Atasan lengan pendek,  Polo collar,  Lettuce hem details,  Front zipper opening,  Crop length,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D069	Puff Sleeve Polo Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D069_BLACK_3_T.jpg?v=1680014778&width=320	Black	143910	Atasan lengan pendek,  Puff sleeves,  Contrast polo collar,  Front button opening,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D068	Puff Sleeve Polo Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D068_GREEN_1_T.jpg?v=1680014771&width=320	Green	143910	Atasan lengan pendek,  Puff sleeves,  Contrast polo collar,  Front button opening,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D067	Balloon Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D067_GREEN_3_T.jpg?v=1680014765&width=320	Green	179910	Blouse lengan panjang,  Kerah kemeja,  Balloon sleeves with drop shoulder details,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D066	Balloon Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D066_OFF_WHITE_1_T.jpg?v=1680014759&width=320	Off White	179910	Blouse lengan panjang,  Kerah kemeja,  Balloon sleeves with drop shoulder details,  Front button opening,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPWKEY123D065	Drawstring Long Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123D065_BLACK_4_T.jpg?v=1680014753&width=320	Black	224910	Celana panjang wide leg,  Elastic waist with drawstring,  High waist,  Dilengkapi kantong samping,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPWKEY123D064	Drawstring Long Pants	//colorbox.co.id/cdn/shop/files/ColorboxApril-19_1_1.jpg?v=1683822369&width=320	Beige	224910	Celana panjang wide leg,  Elastic waist with drawstring,  High waist,  Dilengkapi kantong samping,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPDKEY123D063	Paperbag Waist Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY123D063_BLACK_4_T.jpg?v=1680014740&width=320	Black	296910	Celana panjang denim,  Paperbag high waist with belt loop,  Dengan kantong samping dan belakang,  Regular Fit,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPDKEY123D062	Paperbag Waist Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY123D062_MED_BLUE_4_T.jpg?v=1680014734&width=320	Med Blue	296910	Celana panjang denim,  Paperbag high waist with belt loop,  Dengan kantong samping dan belakang,  Regular Fit,  Material: Denim,  Model meggunakan ukuran 26,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPDKEY123D061	Paperbag Waist Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY123D061_LT._BLUE_4_T.jpg?v=1680014726&width=320	Lt. Blue	296910	Celana panjang denim,  Paperbag high waist with belt loop,  Dengan kantong samping dan belakang,  Regular Fit,  Material: Denim,  Model meggunakan ukuran 26,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TLKKEY123D060	Front Ruched Long Sleeve Top	//colorbox.co.id/cdn/shop/products/ITLKKEY123D060_BLACK_3_T.jpg?v=1680014720&width=320	Black	134910	Atasan lengan panjang,  Front ruched details,  V-neck,  Lettuce hemline,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TLKKEY123D059	Front Ruched Long Sleeve Top	//colorbox.co.id/cdn/shop/products/ITLKKEY123D059_ORANGE_3_T.jpg?v=1680014714&width=320	Orange	134910	Atasan lengan panjang,  Front ruched details,  V-neck,  Lettuce hemline,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TLKKEY123D058	Front Ruched Long Sleeve Top	//colorbox.co.id/cdn/shop/products/ITLKKEY123D058_OFF_WHITE_3_T.jpg?v=1680014707&width=320	Off White	134910	Atasan lengan panjang,  Front ruched details,  V-neck,  Lettuce hemline,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D057	Front Tie Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D057_ORANGE_1_T.jpg?v=1680014701&width=320	Orange	143910	Blouse lengan pendek,  Round neck,  Back button opening,  Front tie details,  Stripe printed fabric,  Regular Crop,  Material: Oxford,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D056	Front Tie Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D056_BLUE_1_T.jpg?v=1680014694&width=320	Blue	143910	Blouse lengan pendek,  Round neck,  Back button opening,  Front tie details,  Stripe printed fabric,  Regular Crop,  Material: Oxford,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:STKKEY123D055	Baggy Long Sleeve Sweatshirt	//colorbox.co.id/cdn/shop/products/ISTKKEY123D055_ECRU_1_T.jpg?v=1680014688&width=320	Ecru	179910	Sweatshirt lengan panjang,  Round neck,  Drop shoulder details,  Front kangaroo pocket,  Oversized,  Material: Baby Terry,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:STKKEY123D054	Baggy Long Sleeve Sweatshirt	//colorbox.co.id/cdn/shop/products/ISTKKEY123D054_LT._BLUE_3_T.jpg?v=1680014682&width=320	Lt. Blue	179910	Sweatshirt lengan panjang,  Round neck,  Drop shoulder details,  Front kangaroo pocket,  Oversized,  Material: Baby Terry,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D052	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D052_LT._BLUE_3_T.jpg?v=1680014675&width=320	Lt. Blue	161910	Atasan lengan panjang,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-COGKEY123D051	Colorblock Boyfriend Cardigan	//colorbox.co.id/cdn/shop/products/I-COGKEY123D051_LT._BLUE_1_T.jpg?v=1680014668&width=320	Lt. Blue	224910	Cardigan lengan panjang,  V-neck,  Colorblock details,  Double front pocket,  Front button opening,  Oversized,  Material: Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-COGKEY123D050	Colorblock Boyfriend Cardigan	//colorbox.co.id/cdn/shop/products/I-COGKEY123D050_BLACK_4_T.jpg?v=1680014662&width=320	Black	224910	Cardigan lengan panjang,  V-neck,  Colorblock details,  Double front pocket,  Front button opening,  Oversized,  Material: Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D049	Short Sleeve Crop Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY123D049_LT._BLUE_1_T.jpg?v=1680014656&width=320	Lt. Blue	143910	Kemeja lengan pendek,  Front button opening,  Drop shoulder details,  Crop length,  Loose Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D048	Short Sleeve Crop Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY123D048_OFF_WHITE_1_T.jpg?v=1680014374&width=320	Off White	143910	Kemeja lengan pendek,  Front button opening,  Drop shoulder details,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TSGKEY123D047	Crop Stripe Knit Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123D047_BLUE_3_T.jpg?v=1680014368&width=320	Blue	179910	Atasan lengan pendek,  Polo collar,  Front button opening,  Crop length with wide rib,  Regular Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TSGKEY123D046	Crop Stripe Knit Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123D046_ECRU_1_T.jpg?v=1680014361&width=320	Ecru	179910	Atasan lengan pendek,  Polo collar,  Front button opening,  Crop length with wide rib,  Regular Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWGKEY123D045	Printed Long Sleeve Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY123D045_ORANGE_3_T.jpg?v=1680014355&width=320	Orange	206910	Sweater lengan panjang,  V-neck with rib ,  Front printed fabric,  Crop length,  Regular Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWGKEY123D044	Printed Long Sleeve Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY123D044_BLUE_3_T.jpg?v=1680014349&width=320	Blue	206910	Sweater lengan panjang,  V-neck with rib ,  Front printed fabric,  Crop length,  Regular Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:LPWKEY123D043	Loose Palazzo Pants	//colorbox.co.id/cdn/shop/products/ILPWKEY123D043_BLACK_4_T.jpg?v=1680014342&width=320	Black	224910	Celana panjang highwaist,  Front pleat details,  Dengan kantong samping,  Front zipper with hook opening,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:LPWKEY123D042	Loose Palazzo Pants	//colorbox.co.id/cdn/shop/products/ILPWKEY123D042_KHAKI_4_T.jpg?v=1680014336&width=320	Khaki	224910	Celana panjang highwaist,  Front pleat details,  Dengan kantong samping,  Front zipper with hook opening,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-CLKKEY123D041	Rib Cullotte Pants	//colorbox.co.id/cdn/shop/products/I-CLKKEY123D041_BLACK_4_T.jpg?v=1680014330&width=320	Black	197910	Celana model kulot,  Elastic waist,  Textured fabric,  High waist,  Regular Fit,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-CLKKEY123D040	Rib Cullotte Pants	//colorbox.co.id/cdn/shop/products/I-CLKKEY123D040_GREEN_4_T.jpg?v=1680014323&width=320	Green	197910	Celana model kulot,  Elastic waist,  Textured fabric,  High waist,  Regular Fit,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SDWKEY123D039	A-line Midi Skirt	//colorbox.co.id/cdn/shop/products/I-SDWKEY123D038_CAMEL_4_T.jpg?v=1680014317&width=320	Camel	251910	Midi skirt berpotongan A-line,  Elastic waist,  Dilengkapi kantong samping,  Textured fabric,  Regular Fit,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SDWKEY123D038	A-line Midi Skirt	//colorbox.co.id/cdn/shop/products/I-SDWKEY123D038_KHAKI_4_K.jpg?v=1680014311&width=320	Khaki	251910	Midi skirt berpotongan A-line,  Elastic waist,  Dilengkapi kantong samping,  Textured fabric,  Regular Fit,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:DDWKEY123D037	Long Sleeve Tiered Midi Dress	//colorbox.co.id/cdn/shop/products/IDDWKEY123D037_GREEN_3_T.jpg?v=1680014304&width=320	Green	296910	Midi dress lengan panjang,  Kerah kemeja,  Front button opening,  Tiered bottom details,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:DDWKEY123D036	Long Sleeve Tiered Midi Dress	//colorbox.co.id/cdn/shop/products/IDDWKEY123D036_KHAKI_4_T.jpg?v=1680014297&width=320	Khaki	296910	Midi dress lengan panjang,  Kerah kemeja,  Front button opening,  Tiered bottom details,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BZWKEY123D035	Rustic Open Blazer	//colorbox.co.id/cdn/shop/products/I-BZWKEY123D035_BLACK_3_T.jpg?v=1680014291&width=320	Black	251910	Blazer lengan panjang,  V-neck with lapel,  Double front pocket,  Open front with button details,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BZWKEY123D034	Rustic Open Blazer	//colorbox.co.id/cdn/shop/products/23D-1.jpg?v=1681444933&width=320	Khaki	251910	Blazer lengan panjang,  V-neck with lapel,  Double front pocket,  Open front with button details,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D033	Square Neck Printed Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D033_OFF_WHITE_1_T.jpg?v=1681444991&width=320	Off White	143910	Atasan lengan panjang,  Puff sleeves,  Square neck,  Flared hemline details,  Printed fabric,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D032	Square Neck Printed Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D032_GREEN_1_T.jpg?v=1680014272&width=320	Green	143910	Atasan lengan panjang,  Puff sleeves,  Square neck,  Flared hemline details,  Printed fabric,  Regular Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TLKKEY123D029	Long Sleeve Top with Lettuce Hem	//colorbox.co.id/cdn/shop/products/I-TLKKEY123D029_BLACK_1_T.jpg?v=1680014260&width=320	Black	116910	Atasan lengan panjang,  High neck,  Lettuce hem details,  Textured fabric,  Regular Fit,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TLKKEY123D028	Long Sleeve Top with Lettuce Hem	//colorbox.co.id/cdn/shop/products/I-TLKKEY123D028_KHAKI_4_T.jpg?v=1680014253&width=320	Khaki	116910	Atasan lengan panjang,  High neck,  Lettuce hem details,  Textured fabric,  Regular Fit,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWSFLW123D028	Printed Long Pants Pyjama Set	//colorbox.co.id/cdn/shop/products/I-SWSFLW123D028_MULTICOLOR_4_T.jpg?v=1680014247&width=320	Multicolor	206910	Pyjama set lengan pendek dan celana panjang,  Notch collar,  Elastic waist pants with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-VEGKEY123D027	Button Up Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123D027_GREEN_1_T.jpg?v=1680014241&width=320	Green	161910	Atasan tanpa lengan,  V-neck,  Front button opening,  Crop length,  Regular Fit,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-VEGKEY123D026	Button Up Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123D026_OFF_WHITE_1_T.jpg?v=1680014234&width=320	Off White	161910	Atasan tanpa lengan,  V-neck,  Front button opening,  Crop length,  Regular Fit,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D025	V-Neck Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123D025_CAMEL_1_T.jpg?v=1680014228&width=320	Camel	179910	Blouse lengan pendek,  V-neck dengan kerah kemeja,  Square front pocket,  Front button opening,  Regular length,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D024	V-Neck Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123D024_KHAKI_3_T.jpg?v=1680014044&width=320	Khaki	179910	Blouse lengan pendek,  V-neck dengan kerah kemeja,  Square front pocket,  Front button opening,  Regular length,  Regular Fit,  Material: Linen Look,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWSFLW123D024	Long Sleeve Pyjama Set	//colorbox.co.id/cdn/shop/products/I-SWSFLW123D024_PINK_1_T.jpg?v=1680014037&width=320	Purple	179910	Pyjama set lengan panjang dan celana pendek,  Peterpan collar,  Short pants with frills hem and elastic waist,  Loose Fit,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWSFLW123D023	Short Sleeve Pyjama Set	//colorbox.co.id/cdn/shop/products/I-SWSFLW123D023_PURPLE_1_T.jpg?v=1680014031&width=320	Purple	161910	Lounge set T-shirt lengan pendek dan celana pendek,  Round neck,  Graphic at front,  Printed short pants with elastic waist,  Loose Fit,  Material: Cotton Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D023	Printed Puff Sleeves Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D023_OFF_WHITE_3_T.jpg?v=1680014025&width=320	Off White	134910	Atasan lengan pendek,  Puff sleeves,  Round neck,  Front button opening,  Flare hemline details,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWKEY123D022	Printed Puff Sleeves Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BSWKEY123D022_GREEN_3_T.jpg?v=1680014018&width=320	Green	134910	Atasan lengan pendek,  Puff sleeves,  Round neck,  Front button opening,  Flare hemline details,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:SPDKEY123D021	Denim Paperbag Shorts	//colorbox.co.id/cdn/shop/products/ISPDKEY123D021_BLACK_4_T.jpg?v=1680014012&width=320	Black	233910	Celana pendek denim,  Paperbag high waist,  Rolled up hemline details,  Dengan kantong depan dan belakang,  Regular Fit,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPWFJN123D021	Cargo Trousers with Adjustable Cuff	//colorbox.co.id/cdn/shop/products/I-LPWFJN123D021_CAMEL_4_T.jpg?v=1680014005&width=320	Camel	341910	Celana panjang high waist,  Side cargo pocket,  Adjustable cuff with drawstring,  Dengan kantong samping dan belakang,  Regular Fit,  Material: Twill,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:SPDKEY123D020	Denim Paperbag Shorts	//colorbox.co.id/cdn/shop/products/ISPDKEY123D020_MED_BLUE_4_T.jpg?v=1680013999&width=320	Med Blue	233910	Celana pendek denim,  Paperbag high waist,  Rolled up hemline details,  Dengan kantong depan dan belakang,  Regular Fit,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SPWFJN123D020	Flowing Bermuda Shorts	//colorbox.co.id/cdn/shop/products/I-SPWFJN123D020_MULTICOLOR_4_T.jpg?v=1681793942&width=320	Multicolor	206910	Celana pendek berbahan print,  High waist,  Dengan kantong samping,  Front zipper with hook opening,  Fitted Crop,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TLKFJN123D019	Printed Raglan Top	//colorbox.co.id/cdn/shop/files/ColorboxApril-27_1_1.jpg?v=1683822818&width=320	Orange	161910	Atasan lengan panjang,  Raglan sleeves,  Round neck with contrast insert,  Detail serut di bagian samping,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-DIWKEY123D019	Balloon Sleeves Mini Shirt Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123D019_BLACK_3_T.jpg?v=1680013979&width=320	Black	233910	Mini dress lengan pendek,  Kerah kemeja,  Balloon sleeves,  Front button opening,  Adjustable waist with drawstring,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-DIWKEY123D018	Balloon Sleeves Mini Shirt Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123D018_OFF_WHITE_4_T.jpg?v=1680013973&width=320	Off White	233910	Mini dress lengan pendek,  Kerah kemeja,  Balloon sleeves,  Front button opening,  Adjustable waist with drawstring,  Regular Fit,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWFJN123D018	Long Sleeve Corduray Overshirt	//colorbox.co.id/cdn/shop/products/I-BLWFJN123D018_CAMEL_1_T.jpg?v=1680013967&width=320	Beige	296910	Kemeja lengan panjang,  Squared front pocket,  Metal front button opening,  Textured fabric,  Oversized,  Material: Corduroy,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPWKEY123D017	Creased Leg Woven Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123D017_BLACK_4_T.jpg?v=1680013960&width=320	Black	206910	Celana panjang high waist,  Wide leg,  Creased front details,  Front zipper with button opening,  Dilengkapi belt loop,  Regular Fit,  Material: Polyester,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPWKEY123D016	Creased Leg Woven Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123D016_LILAC_4_T.jpg?v=1680013954&width=320	Lilac	206910	Celana panjang high waist,  Wide leg,  Creased front details,  Front zipper with button opening,  Dilengkapi belt loop,  Regular Fit,  Material: Polyester,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-JKDKEY123D015	Oversized Crop Denim Jacket	//colorbox.co.id/cdn/shop/products/I-JKDKEY123D015_OFF_WHITE_1_T.jpg?v=1680013948&width=320	Off White	323910	Jaket denim lengan panjang,  Kerah kemeja,  Front metal button opening,  Double front flap pocket,  Crop length,  Oversized Crop,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWFJN123D015	Printed Long Sleeve Wrap Blouse	//colorbox.co.id/cdn/shop/products/I-BLWFJN123D015_MULTICOLOR_3_T.jpg?v=1680013941&width=320	Multicolor	224910	Blouse lengan panjang,  Wrapped v-neck,  Printed fabric,  Elastic on hemline details,  Fitted Crop,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:SKDFCR123D014	Skort with Tie Front Detail	//colorbox.co.id/cdn/shop/products/ISKDFCR123D014_CAMEL_4_T.jpg?v=1680013935&width=320	Camel	269910	Asymmetric mini skort,  Elastic on back waist,  Self fabric belt,  With side pocket and front flap pocket,  Regular Fit,  Material: Twill,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-VEGKEY123D013	Button Up Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123D013_BLACK_3_T.jpg?v=1680013928&width=320	Black	161910	Atasan tanpa lengan,  V-neck,  Front button opening,  Crop length,  Regular Fit,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-LPDFCR123D013	Wide Leg Denim with Belt Details	//colorbox.co.id/cdn/shop/products/I-LPDFCR123D013_MED_BLUE_4_T.jpg?v=1680013922&width=320	Med Blue	341910	Celana panjang denim,  High waist,  Self fabric belt with metal buckle,  Double back pocket,  Regular Fit,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-VEGKEY123D012	Button Up Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123D012_LILAC_3_T.jpg?v=1680013916&width=320	Lilac	161910	Atasan tanpa lengan,  V-neck,  Front button opening,  Crop length,  Regular Fit,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-DIWFCR123D012	Printed Puff Sleeves Mini Dress	//colorbox.co.id/cdn/shop/products/23D-7.jpg?v=1681445487&width=320	Green	251910	Mini dress lengan pendek,  Square neck,  Puff sleeves,  Elastic smocked at the back,  Dilengkapi kantong samping,  Fit and Flare,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TSKKEY123D011	Raglan Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY123D011_BLACK_3_T.jpg?v=1680013903&width=320	Black	107910	T-shirt lengan pendek,  Round neck,  Raglan sleeves with contrast color,  Crop length,  Graphic at front,  Fitted Crop,  Material: Cotton Spandex,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-TTGFCR123D011	Cable Knit Tanktop	//colorbox.co.id/cdn/shop/products/I-TTGFCR123D011_OFF_WHITE_3_T.jpg?v=1680013896&width=320	Off White	179910	Atasan tanpa lengan,  Spaghetti straps,  Low V-neck with open back,  Textured fabric,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TSKKEY123D010	Raglan Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY123D010_OFF_WHITE_1_T.jpg?v=1680013737&width=320	Off White	107910	T-shirt lengan pendek,  Round neck,  Raglan sleeves with contrast color,  Crop length,  Graphic at front,  Fitted Crop,  Material: Cotton Spandex,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWFCR123D010	Puff Long Sleeve Top	//colorbox.co.id/cdn/shop/files/ColorboxApril-30_1_1.jpg?v=1683822908&width=320	Off White	233910	Atasan lengan panjang,  V-neck dengan kerah kemeja,  Puff sleeves,  Elastic smocked hemline,  Crop length,  Fitted Crop,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-VEGFCR123D009	Polo Collar Knit Vest	//colorbox.co.id/cdn/shop/products/23D-6.jpg?v=1681445270&width=320	Green	206910	Atasan tanpa lengan,  Contrast polo collar,  Front button opening,  Textured fabric,  Crop length,  Fitted Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TSKKEY123D009	Keyhole Short Sleeve Crop Top	//colorbox.co.id/cdn/shop/products/ITSKKEY123D009_BLACK_1_T.jpg?v=1680013718&width=320	Black	89910	Atasan lengan pendek,  Round neck,  Key hole details at front,  Crop length,  Textured fabric,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TSKKEY123D008	Keyhole Short Sleeve Crop Top	//colorbox.co.id/cdn/shop/products/ITSKKEY123D008_TERRACOTTA_3_T.jpg?v=1680013712&width=320	Terracotta	89910	Atasan lengan pendek,  Round neck,  Key hole details at front,  Crop length,  Textured fabric,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-COGFCR123D008	Cardigan with Front Chain Details	//colorbox.co.id/cdn/shop/files/ColorboxApril-23_1_1.jpg?v=1683822776&width=320	Camel	161910	Cardigan lengan panjang,  Round neck,  Open front with chain details,  Crop length,  Textured fabric,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D007	Tied Hem Crop Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY123D007_OFF_WHITE_1_T.jpg?v=1680013699&width=320	Off White	143910	Atasan lengan pendek,  Kerah kemeja,  Aksen serut di bagian bawah,  Square front pocket,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWFCR123D007	Printed Puff Sleeves Crop Top	//colorbox.co.id/cdn/shop/files/ColorboxApril-26_1_1.jpg?v=1683822683&width=320	Green	206910	Atasan lengan pendek,  Puff sleeves,  Front button opening,  Elastic smocked back,  Fitted Crop,  Material: Poly Crinkle,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SPDFCT123D006	Denim Cargo Shorts	//colorbox.co.id/cdn/shop/files/ColorboxApril-22_1_1.jpg?v=1683822722&width=320	Lt. Blue	296910	Celana pendek denim,  Double cargo pocket at front,  Dilengkapi kantong depan,  Front zipper with metal button opening,  Regular Fit,  Material: Denim,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:BSWKEY123D006	Tied Hem Crop Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY123D006_TERRACOTTA_1_T.jpg?v=1680013679&width=320	Terracotta	143910	Atasan lengan pendek,  Kerah kemeja,  Aksen serut di bagian bawah,  Square front pocket,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-DIWFCT123D005	Printed Flare Mini Dress	//colorbox.co.id/cdn/shop/products/23D-5.jpg?v=1681445110&width=320	Multicolor	233910	Mini dress tanpa lengan,  Elastic spaghetti straps,  Side zipper opening,  Smocked back details,  Fit and Flare,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D005	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D005_BLACK_1_T.jpg?v=1680013667&width=320	Black	161910	Atasan lengan panjang,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SDWFCT123D004	Parachute Cargo Midi Skirt	//colorbox.co.id/cdn/shop/products/I-SDWFCT123D004_BLACK_4_T.jpg?v=1680013661&width=320	Black	251910	Midi skirt berpotongan lurus,  Adjustable waist,  Aksen serut di bagian samping,  Side cargo pocket,  Regular Fit,  Material: Parachute,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWKEY123D003	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123D003_OFF_WHITE_1_T.jpg?v=1680013655&width=320	Off White	161910	Atasan lengan panjang,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TTKKEY123D002	Cut Out Crop Sleeveless Top	//colorbox.co.id/cdn/shop/products/ITTKKEY123D002_BLACK_1_T.jpg?v=1680013642&width=320	Black	89910	Atasan tanpa lengan,  Round neck,  Side cut out details,  Crop length,  Textured fabric,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BSWFCT123D002	Printed Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/23D-4.jpg?v=1681445091&width=320	Multicolor	179910	Blouse lengan pendek,  Kerah kemeja,  Crop length,  Fitted hemline,  Printed fabric,  Fitted Crop,  Material: Cotton,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-SWGFCT123D001	Long Sleeve Rustic Knit Top	//colorbox.co.id/cdn/shop/products/23D-2.jpg?v=1681445072&width=320	Black	206910	Atasan lengan panjang,  Round neck with rib,  Drop shoulder details,  Crop length,  Regular Crop,  Material: Flat Knit,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I:TTKKEY123D001	Cut Out Crop Sleeveless Top	//colorbox.co.id/cdn/shop/products/ITTKKEY123D001_OFF_WHITE_1_T.jpg?v=1680013624&width=320	Off White	89910	Atasan tanpa lengan,  Round neck,  Side cut out details,  Crop length,  Textured fabric,  Fitted Crop,  Material: Rib,  Model meggunakan ukuran S,  Height: 170 cm,  Bust: 78 cm,  Waist: 66 cm,  Hips: 84 cm
I-BLWFCR123C011	Wide Collar Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWFCR123C011_OFF_WHITE_3_T.jpg?v=1677167337&width=320	Off White	251910	Blouse lengan panjang,  Puff sleeves,  Wide lace collar with tie,  Loose fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWFCT123C006	Trousers with Turndown Waist	//colorbox.co.id/cdn/shop/products/I-LPWFCT123C006_KHAKI_4_T.jpg?v=1677167329&width=320	Khaki	149950	Celana panjang wide leg,  High waist with turndown details,  Dilengkapi kantong samping dan belakang,  Loose fit,  Material: Twill,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SKWFCT123C004	Mini Box-Pleat Skort with Belt	//colorbox.co.id/cdn/shop/products/I-SKWFCT123C004_KHAKI_4_T.jpg?v=1677167322&width=320	Khaki	224910	Mini skort with pleats detail,  Dilengkapi dengan synthetic leather belt,  A-line cut,  Regular fit,  Material: Twill,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPDKEY123C093	Straight Fit Jeans with Side Slit Details	//colorbox.co.id/cdn/shop/products/I-LPDKEY123C093_LT._BLUE_3_T.jpg?v=1677167315&width=320	Lt. Blue	314910	Celana panjang denim,  High waist,  5 pocket details,  Straight leg,  Side slit details,  Regular fit,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPKKEY123C091	Wide Leg Rib Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123C091_BEIGE_4_T.jpg?v=1677167308&width=320	Beige	179910	Celana panjang casual,  High waist,  Elastic wiast,  Textured fabric,  Regular fit,  Material: Baby Plisket,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C079	Straight Fit Long Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C079_BEIGE_4_T.jpg?v=1677167300&width=320	Beige	206910	Celana panjang straight fit,  Front zipper with overlap button opening,  Dengan kantong samping,  High waist with elastic back,  Regular fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C078	Straight Fit Long Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C078_BROWN_4_T.jpg?v=1677167293&width=320	Brown	206910	Celana panjang straight fit,  Front zipper with overlap button opening,  Dengan kantong samping,  High waist with elastic back,  Regular fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C032	Linen Look Loose Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C032_PINK_4_T.jpg?v=1677167271&width=320	Pink	129950	Celana panjang wide leg,  Pleats detail at front,  Elastic back waist with belt loop,  Dengan kantong samping,  Regular fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SPDKEY123C048	Front Pocket Denim Shorts	//colorbox.co.id/cdn/shop/products/I-SPDKEY123C048_MED_BLUE_4_T.jpg?v=1677167263&width=320	Med Blue	124950	Celana pendek denim,  High waist,  Double front pocket,  Front zipper with metal button opening,  Fitted fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-CLDKEY123C073	Tapered Fit Denim Cullote	//colorbox.co.id/cdn/shop/products/I-CLDKEY123C072LILAC_4_T.jpg?v=1678285026&width=320	Lilac	139950	Celana kulot denim,  High waist with belt loop,  5 pocket details,  Crop length,  Regular Tapered Crop,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-CLDKEY123C072	Tapered Fit Denim Cullote	//colorbox.co.id/cdn/shop/products/I-CLDKEY123C073OFFWHITE_4_T.jpg?v=1678284963&width=320	Off White	251910	Celana kulot denim,  High waist with belt loop,  5 pocket details,  Crop length,  Regular Tapered Crop,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SXWKEY123C064	Pleated Maxi Skirt	//colorbox.co.id/cdn/shop/products/I-SXWKEY123C064_BEIGE_4_T.jpg?v=1677167241&width=320	Beige	209930	Regular fit maxi skirt,  Pleated fabric,  Elastic waist,  Regular fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SXWKEY123C063	Pleated Maxi Skirt	//colorbox.co.id/cdn/shop/products/I-SXWKEY123C063_DUSTY_PINK_4_T.jpg?v=1677167233&width=320	Dusty Pink	149950	Regular fit maxi skirt,  Pleated fabric,  Elastic waist,  Regular fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C054	Babydoll Long Sleeve Tunic	//colorbox.co.id/cdn/shop/products/6_2251f022-75a0-4d39-bf25-602fbf4cef4a.jpg?v=1679394505&width=320	Multicolor	153930	Tunik lengan panjang,  V-neck,  Babydoll cut with tier details,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C053	Babydoll Long Sleeve Tunic	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C053_OFF_WHITE_1_T.jpg?v=1677167218&width=320	Off White	109950	Tunik lengan panjang,  V-neck,  Babydoll cut with tier details,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C062	Long Sleeve Peplum Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C062_BEIGE_1_T.jpg?v=1677167210&width=320	Beige	181930	Blouse lengan panjang,  V-neck,  Peplum waist,  Embroidery details at front,  Front button opening,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C061	Long Sleeve Peplum Blouse	//colorbox.co.id/cdn/shop/products/7_1_1.jpg?v=1680669373&width=320	Green	181930	Blouse lengan panjang,  V-neck,  Peplum waist,  Embroidery details at front,  Front button opening,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-VEGKEY123C036	Pattern Knit Vest	//colorbox.co.id/cdn/shop/products/I-VEGKEY123C036_GREEN_3_T.jpg?v=1677166532&width=320	Green	161910	Atasan tanpa lengan,  V-neck,  Printed knit fabric,  Crop length,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-JKDFJN123C017	Super Cropped Denim Jacket	//colorbox.co.id/cdn/shop/products/I-JKDFJN123C017_LT._BLUE_1_T.jpg?v=1677166502&width=320	Lt. Blue	189950	Jaket denim lengan panjang,  Kerah kemeja,  Crop length,  Unfinished hemline. Double front pocket with button,  Slim Crop,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWFCR123C012	Trousers with Tie Belt Details	//colorbox.co.id/cdn/shop/products/I-LPWFCR123C012_ECRU_3_T.jpg?v=1677166487&width=320	Ecru	296910	Celana panjang wide leg,  Tie belt details,  Dilengkapi kantong samping,  Elastic waist with horn button,  Regular fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-DIWKEY123C058	Tiered Swing Mini Dress	//colorbox.co.id/cdn/shop/products/2_1.jpg?v=1679396035&width=320	Brown	181930	Mini dress lengan panjang,  Round neck,  Puff sleeves,  Tiered cut details,  Back button opening,  Loose fit,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-DIWKEY123C057	Tiered Swing Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123C057GREEN_1_T.jpg?v=1678177926&width=320	Green	129950	Mini dress lengan panjang,  Round neck,  Puff sleeves,  Tiered cut details,  Back button opening,  Loose fit,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C042	Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C042_GREEN_3_T.jpg?v=1677166465&width=320	Green	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C041	Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C041_LT._BLUE_3_T.jpg?v=1677166458&width=320	Lt. Blue	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Crop length,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C038	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C038_PINK_1_T.jpg?v=1677166450&width=320	Pink	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Regular length,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C037	Notch Collar Short Sleeve Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C037_OFF_WHITE_3_T.jpg?v=1677166442&width=320	Off White	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Regular length,  Regular Crop,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TTWFCR123C007	Gathered Effect Corset Top	//colorbox.co.id/cdn/shop/products/15_10bd37d2-2440-47c0-9a88-3b380fb25881.jpg?v=1679396116&width=320	Ecru	161910	Atasan tanpa lengan,  Spaghetti strap,  Gathered details with elastic on back,  Crop length,  Fitted Crop,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BSWFCR123C008	Voluminous Puff Sleeves Top	//colorbox.co.id/cdn/shop/products/I-BSWFCR123C008_MULTICOLOR_1_T.jpg?v=1677166428&width=320	Multicolor	124950	Atasan lengan pendek,  Crop length,  Puff sleeves,  Square neck,  Printed fabric,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BSWFCR123C010	Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BSWFCR123C010_PINK_3_T.jpg?v=1677166421&width=320	Pink	161910	Blouse lengan pendek,  Crop length,  Front button opening,  V-neck dengan kerah kemeja,  Elastic hemline,  Fitted fit,  Material: Poly Crinkle,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-DIWKEY123C030	V-Neck Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123C030_PINK_1_T.jpg?v=1677166413&width=320	Pink	224910	Mini dress lengan pendek,  V-neck,  Puff sleeves,  Elastic details on waist,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-DIWKEY123C029	V-Neck Mini Dress	//colorbox.co.id/cdn/shop/products/I-DIWKEY123C029_BEIGE_4_T.jpg?v=1677166406&width=320	Beige	224910	Mini dress lengan pendek,  V-neck,  Puff sleeves,  Elastic details on waist,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-COGKEY123C026	Colorblock Long Sleeve Cardigan	//colorbox.co.id/cdn/shop/products/I-COGKEY123C026_ECRU_1_T.jpg?v=1677166399&width=320	Ecru	224910	Cardigan lengan panjang,  V-neck,  Colorblock details,  Front button opening,  Textured fabric,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-COGKEY123C025	Colorblock Long Sleeve Cardigan	//colorbox.co.id/cdn/shop/products/I-COGKEY123C025_PINK_1_T.jpg?v=1677166391&width=320	Pink	224910	Cardigan lengan panjang,  V-neck,  Colorblock details,  Front button opening,  Textured fabric,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSGKEY123C022	Button Up Flower Knit Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123C022_ECRU_1_T.jpg?v=1677166384&width=320	Ecru	197910	Atasan lengan pendek,  V-neck,  Crop length,  Flower print fabric,  Front button opening,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSGKEY123C021	Button Up Flower Knit Top	//colorbox.co.id/cdn/shop/products/I-TSGKEY123C021_PINK_3_T.jpg?v=1677166377&width=320	Pink	197910	Atasan lengan pendek,  V-neck,  Crop length,  Flower print fabric,  Front button opening,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C004	Corset Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/30.jpg?v=1679396805&width=320	Black	179910	Kemeja lengan panjang,  Front button opening,  Elastic back details,  Crop length,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SIDKEY123C018	Button Up Denim Skirt	//colorbox.co.id/cdn/shop/products/I-SIDKEY123C018_BLACK_4_T.jpg?v=1677165963&width=320	Black	124950	Mini denim skirt,  Front metal button opening,  5 pocket details,  Dilengkapi belt loop,  Fitted fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C003	Corset Long Sleeve Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C003_BEIGE_3_T.jpg?v=1677165956&width=320	Beige	179910	Kemeja lengan panjang,  Front button opening,  Elastic back details,  Crop length,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SIDKEY123C017	Button Up Denim Skirt	//colorbox.co.id/cdn/shop/products/I-SIDKEY123C017_OFF_WHITE_4_T.jpg?v=1677165948&width=320	Off White	124950	Mini denim skirt,  Front metal button opening,  5 pocket details,  Dilengkapi belt loop,  Fitted fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:TSKKEY121D087	Fitted Crop Basic T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121D087_LILAC_4_T.jpg?v=1616479680&width=320	Lilac	79900	Atasan kasual krop,  Fitted,  Round neckline,  Lengan pendek,  Bahan cotton spandex yang nyaman,  Model menggunakan ukuran S,  Height: 175cm,  Bust:83cm,  Waist: 60cm,  Hips 90cm
I-BSWKEY123C024	Short Sleeve Off Shoulder Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123C024_OFF_WHITE_1_T.jpg?v=1677165941&width=320	Off White	179910	Atasan lengan pendek,  Puff sleeves,  Off shoulder with strap details,  Regular length,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BSWKEY123C023	Short Sleeve Off Shoulder Top	//colorbox.co.id/cdn/shop/products/I-BSWKEY123C023_PINK_1_T.jpg?v=1677165933&width=320	Pink	179910	Atasan lengan pendek,  Puff sleeves,  Off shoulder with strap details,  Regular length,  Regular fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C066	Tie Front Wide Leg Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C066_BEIGE_4_T.jpg?v=1677165911&width=320	Beige	139950	Celana panjang wide leg,  Elastic waist with tied front,  High waist,  Dilengkapi kantong samping,  Loose fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C065	Tie Front Wide Leg Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C065_GREEN_4_T.jpg?v=1677165903&width=320	Green	139950	Celana panjang wide leg,  Elastic waist with tied front,  High waist,  Dilengkapi kantong samping,  Loose fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPWKEY123C031	Linen Look Loose Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY123C031_OFF_WHITE_4_T.jpg?v=1677165897&width=320	Off White	233910	Celana panjang wide leg,  Pleats detail at front,  Elastic back waist with belt loop,  Dengan kantong samping,  Loose fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKKEY123C044	Short Sleeve Corset Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123C044_GREEN_3_T.jpg?v=1677165891&width=320	Green	89910	Atasan lengan pendek,  Low round neck,  Corset cut on waist,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKKEY123C043	Short Sleeve Corset Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123C043_OFF_WHITE_3_T.jpg?v=1677165884&width=320	Off White	89910	Atasan lengan pendek,  Low round neck,  Corset cut on waist,  Textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-STKKEY123C040	Collared Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY123C040_OFF_WHITE_3_T.jpg?v=1677165878&width=320	Off White	179910	Sweatshirt lengan panjang,  V-neck with polo collar,  Crop length,  Elastic hemline,  Fitted fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPKKEY123C016	Flare Crease Leg Long Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123C016_BLACK_4_T.jpg?v=1677165865&width=320	Black	197910	Celana panjang knit,  Crease leg details,  Flare bottom,  Side zipper opening,  Regular fit,  Material: Ponte,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPKKEY123C015	Flare Crease Leg Long Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123C015_OFF_WHITE_7.jpg?v=1677165858&width=320	Off White	197910	Celana panjang knit,  Crease leg details,  Flare bottom,  Side zipper opening,  Regular fit,  Material: Ponte,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPKKEY123C014	Fitted Basic Legging	//colorbox.co.id/cdn/shop/products/I-LPKKEY123C014_BLACK_4_T.jpg?v=1677165852&width=320	Black	143910	Celana panjang knit,  Stretch fabric,  High wais with wide rib details,  Fitted fit,  Material: Ponte,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-DDKKEY123C046	Collared Short Sleeve Midi Dress	//colorbox.co.id/cdn/shop/products/I-DDKKEY123C046_LT._BLUE_1_T.jpg?v=1677165846&width=320	Lt. Blue	206910	Midi dress lengan pendek,  Contrast polo collar,  Textured fabric,  Front button opening,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKKEY123C028	Ruffles Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123C028_BEIGE_3_T.jpg?v=1677165833&width=320	Beige	116910	Atasan lengan pendek,  V-neck,  Front button opening,  Ruffles detail,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKKEY123C027	Ruffles Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TSKKEY123C027_PINK_1_T.jpg?v=1677165827&width=320	Pink	116910	Atasan lengan pendek,  V-neck,  Front button opening,  Ruffles detail,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SWGKEY123C034	Soft Knit Long Sleeve Polo Shirt	//colorbox.co.id/cdn/shop/products/I-SWGKEY123C034_OFF_WHITE_3_T.jpg?v=1677165820&width=320	Off White	197910	Atasan lengan panjang,  Polo collar,  Front button opening,  Soft knit fabric,  Regular length,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SWGKEY123C033	Soft Knit Long Sleeve Polo Shirt	//colorbox.co.id/cdn/shop/products/I-SWGKEY123C033_GREEN_1_T.jpg?v=1677165689&width=320	Green	197910	Atasan lengan panjang,  Polo collar,  Front button opening,  Soft knit fabric,  Regular length,  Regular fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TTKKEY123C020	Crop Textured Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKKEY123C020_PINK_1_T.jpg?v=1677165681&width=320	Pink	49950	Atasan tanpa lengan,  Round neck with low back,  Crop length,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TTKKEY123C019	Crop Textured Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKKEY123C019_OFF_WHITE_1_T.jpg?v=1677165672&width=320	Off White	89910	Atasan tanpa lengan,  Round neck with low back,  Crop length,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BSWKEY123C099	Voluminous Sleeves Blouse	//colorbox.co.id/cdn/shop/products/I-BSWKEY123C099_OFF_WHITE_1_T.jpg?v=1677165665&width=320	Off White	139930	Blouse lengan 3/4,  Kerah kemeja,  Voluminous sleeves,  High low hemline,  Drop shoulder details,  Loose fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKFJN123C018	Graphic Tee with Drawstring Side	//colorbox.co.id/cdn/shop/products/21.jpg?v=1679396165&width=320	Off White	161910	Atasan lengan pendek,  Round neck,  Side drawstring details,  Crop length,  Graphic details at front,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TSKFCT123C002	Cut Out Printed Top	//colorbox.co.id/cdn/shop/products/35.jpg?v=1679396855&width=320	Off White	143910	Atasan lengan pendek,  Round neck,  Side cut out details,  Crop length,  Graphic details at front,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TLKFCT123C001	Long Sleeve Crop Top	//colorbox.co.id/cdn/shop/products/I-TLKFCT123C001_BLACK_1.jpg?v=1677165620&width=320	Black	161910	Atasan lengan panjang,  Crop length,  Cut out details,  Back tie details on waist,  Textured fabric,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPDKEY123C092	Straight Fit Jeans with Side Slit Details	//colorbox.co.id/cdn/shop/products/I-LPDKEY123C092_MED_BLUE_3_T.jpg?v=1677165614&width=320	Med Blue	314910	Celana panjang denim,  High waist,  5 pocket details,  Straight leg,  Side slit details,  Regular fit,  Material: Denim,  Model menggunakan ukuran 26,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-LPKKEY123C089	Wide Leg Rib Pants	//colorbox.co.id/cdn/shop/products/I-LPKKEY123C089_OFF_WHITE_4_T.jpg?v=1677165607&width=320	Off White	179910	Celana panjang casual,  High waist,  Elastic wiast,  Textured fabric,  Regular fit,  Material: Baby Plisket,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BLWKEY123C084	Long Sleeve Oversized Shirt	//colorbox.co.id/cdn/shop/products/IBLWKEY123C084_BLACK_1_T.jpg?v=1677165601&width=320	Black	179910	Kemeja lengan panjang,  Front button opening,  Oversized cut,  Rounded hemline,  Oversized,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BLWKEY123C083	Long Sleeve Oversized Shirt	//colorbox.co.id/cdn/shop/products/IBLWKEY123C083_SOFT_GREEN_1_T.jpg?v=1677165595&width=320	Soft Green	179910	Kemeja lengan panjang,  Front button opening,  Oversized cut,  Rounded hemline,  Oversized,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C075	Tie Front Peplum Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C075_BROWN_1.jpg?v=1677165583&width=320	Brown	206910	Blouse lengan panjang,  Peplum waist,  Puff sleeves,  Square neck with tie details,  Loose fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C074	Tie Front Peplum Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C074_OFF_WHITE_1_T.jpg?v=1677165576&width=320	Off White	206910	Blouse lengan panjang,  Peplum waist,  Puff sleeves,  Square neck with tie details,  Loose fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C095	Short Sleeve Notch Collar Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C095_PURPLE_3_T.jpg?v=1677165570&width=320	Purple	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Regular length,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I:BSWKEY123C094	Short Sleeve Notch Collar Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY123C094_BLACK_3_T.jpg?v=1677165564&width=320	Black	134910	Blouse lengan pendek,  Notch collar,  Front button opening,  Regular length,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C068	Long Sleeve Crop Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C068_BLACK_1_T.jpg?v=1677165558&width=320	Black	143910	Blouse lengan panjang,  Kerah kemeja,  Crop length,  Front button opening,  Loose Crop,  Material: Oxford,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-BLWKEY123C067	Long Sleeve Crop Shirt	//colorbox.co.id/cdn/shop/products/I-BLWKEY123C067_OFF_WHITE_1_T.jpg?v=1677165552&width=320	Off White	143910	Blouse lengan panjang,  Kerah kemeja,  Crop length,  Front button opening,  Loose Crop,  Material: Oxford,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TLKKEY123C070	Textured Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123C070_LILAC_3_T.jpg?v=1677165546&width=320	Lilac	161910	Atasan lengan panjang,  Kerah kemeja,  Front button opening,  Textured fabric,  Fitted fit,  Material: Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-TLKKEY123C069	Textured Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY123C069_BLACK_3_T.jpg?v=1677165539&width=320	Black	161910	Atasan lengan panjang,  Kerah kemeja,  Front button opening,  Textured fabric,  Fitted fit,  Material: Knit,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 80 cm,  Waist: 64 cm
I-SWGKEY223A029	Long Sleeve Knit Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY223A029_ECRU_3_T.jpg?v=1674137124&width=320	Ecru	139930	Sweater lengan panjang,  Round neck,  Drop shoulder details,  Crop length,  Loose fit,  Material: Flat Knit,  Model menggunakan ukuran  S,  Height: 175 cm,  Bust: 78 cm,  Waist: 58 cm,  Hips: 88 cm
I-LPDKEY223A056	Crease Leg Straight Fit Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY223A056_LT._BLUE_4_T_841fa75b-6bc9-493a-8678-7cf3b4e470d9.jpg?v=1676895749&width=320	Lt Blue	164950	Celana panjang denim,  Wide leg,  Crease leg details,  Straight fit,  Zip fly opening,  Dilengkapi kantong belakang,  Loose fit,  Material: Denim,  Model menggunakan ukuran 26,  Height: 175 cm,  Bust: 78 cm,  Waist: 58 cm,  Hips: 88 cm
I:LPKKEY223A020	Paperbag Jogger Pants	//colorbox.co.id/cdn/shop/products/ILPKKEY223A020_BLACK_4.jpg?v=1674137044&width=320	Black	139930	Celana panjang casual,  Elastic waist with drawstring details,  Dilengkapi kantong samping,  Ankle length,  Fitted fit,  Material: Baby Terry,  Model menggunakan ukuran  XS,  Height: 175 cm,  Bust: 78 cm,  Waist: 58 cm,  Hips: 88 cm
I:TSKBSC522O570	Short Sleeve T-Shirt with Unfinished Hem	//colorbox.co.id/cdn/shop/products/ITSKBSC522O570_MAROON_3_5fb0a9d9-f8db-4d71-8509-39e327544a22.jpg?v=1676895823&width=320	Maroon	69900	T-shirt lengan pendek,  Round neck,  Regular length,  Unfinished hemline details,  Fitted fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-KMGFCR222L011	Loose Knit Poncho	//colorbox.co.id/cdn/shop/products/I-KMGFCR222L011_ECRU_1_T.jpg?v=1673497561&width=320	Ecru	83970	Outer model poncho,  Open front,  Side slit details,  Transparent printed fabric,  Loose fit,  Material: Flat Knit,  Model menggunakan ukuran All Size,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-LPWKEY223A061	Loose Fit Flowy Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY223A061_BEIGE_4_T.jpg?v=1673497285&width=320	Beige	160930	Celana panjang wide leg,  Elastic waistband,  Dilengkapi kantong samping,  Crinkle textured fabric,  Loose fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SKDKEY223A058	Fitted Wrap Denim Skort	//colorbox.co.id/cdn/shop/products/I-SKDKEY223A058_BLACK_4_T.jpg?v=1673497260&width=320	Black	129950	Mini skort denim,  Front wrap details,  Front zipper with metal button opening,  Dilengkapi kantong samping dan belakang,  Fitted fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-LPDKEY223A057	Crease Leg Straight Fit Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDKEY223A057_MED_BLUE_4.jpg?v=1673497252&width=320	Med Blue	164950	Celana panjang denim,  Wide leg,  Crease leg details,  Straight fit,  Zip fly opening,  Dilengkapi kantong belakang,  Loose fit,  Material: Denim,  Model menggunakan ukuran 26,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SPDKEY223A055	Paperbag Denim Short Pants	//colorbox.co.id/cdn/shop/products/ISPDKEY223A055_LT._BLUE_4_T.jpg?v=1673497243&width=320	Lt Blue	114950	Celana pendek denim,  Paperbag waist,  Elastic waistband with drawstring,  Front patch pocket details,  Dengan kantong belakang,  Loose fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SPDKEY223A054	Paperbag Denim Short Pants	//colorbox.co.id/cdn/shop/products/ISPDKEY223A054_MED_BLUE_4_T.jpg?v=1673497235&width=320	Med Blue	114950	Celana pendek denim,  Paperbag waist,  Elastic waistband with drawstring,  Front patch pocket details,  Dengan kantong belakang,  Loose fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TLKKEY223A051	Long Sleeve Rib Polo Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY223A051_RED_3_T.jpg?v=1673497209&width=320	Red	125930	Atasan lengan panjang,  V-neck with polo collar,  Rib textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TLKKEY223A050	Long Sleeve Rib Polo Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY223A050_BROWN_3_T.jpg?v=1673497200&width=320	Brown	125930	Atasan lengan panjang,  V-neck with polo collar,  Rib textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TLKKEY223A049	Long Sleeve Rib Polo Top	//colorbox.co.id/cdn/shop/products/I-TLKKEY223A049_OFF_WHITE_3_T.jpg?v=1673497191&width=320	Off White	125930	Atasan lengan panjang,  V-neck with polo collar,  Rib textured fabric,  Crop length,  Fitted fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A046	Printed Short Sleeve Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY223A046_RED_1_T.jpg?v=1673497139&width=320	Red	104930	Blouse lengan pendek,  Kerah kemeja,  Front button opening,  Regular length,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A045	Printed Short Sleeve Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY223A045_BROWN_3_T.jpg?v=1673497123&width=320	Brown	74950	Blouse lengan pendek,  Kerah kemeja,  Front button opening,  Regular length,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-LPWKEY223A035	Kick Flare Long Pants	//colorbox.co.id/cdn/shop/products/I-LPWKEY223A035_BEIGE_4_T.jpg?v=1673494378&width=320	Beige	153930	Celana panjang dengan flare bottom,  Front zipper with button opening,  Elastic on back waist,  Dilengkapi belt loop,  Fitted fit,  Material: Polyester,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:DIWKEY223A034	Long Sleeve Tiered Mini Dress	//colorbox.co.id/cdn/shop/products/IDIWKEY223A034_ECRU_1_T.jpg?v=1673494368&width=320	Ecru	160930	Mini dress lengan panjang,  Kerah kemeja,  Tier bottom details,  Front button opening,  Loose fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:DXWKEY223A032	Off Shoulder Printed Maxi Dress	//colorbox.co.id/cdn/shop/products/IDXWKEY223A032_BLACK_4_T.jpg?v=1673494344&width=320	Black	174930	Maxi dress bahan print,  Off shoulder dengan detail pita,  Fit & flare cut with tier details,  Elastic waist with drawstring,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-DIKFLW223A031	Graphic Mini Lounge Dress	//colorbox.co.id/cdn/shop/products/I-DIKFLW223A031_LILAC_1_T.jpg?v=1673494337&width=320	Lilac	99950	Dress mini lengan pendek,  Round neck,  Oversized fit,  Graphic details at front,  Loose fit,  Material: Cotton Combed,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:DXWKEY223A031	Off Shoulder Printed Maxi Dress	//colorbox.co.id/cdn/shop/products/IDXWKEY223A031_OFF_WHITE_1_T.jpg?v=1673494330&width=320	Off White	174930	Maxi dress bahan print,  Off shoulder dengan detail pita,  Fit & flare cut with tier details,  Elastic waist with drawstring,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SWGKEY223A030	Long Sleeve Knit Sweater	//colorbox.co.id/cdn/shop/products/I-SWGKEY223A030_BEIGE_1_T.jpg?v=1673494322&width=320	Beige	139930	Sweater lengan panjang,  Round neck,  Drop shoulder details,  Crop length,  Loose fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TSKFLW223A029	Short Sleeve Lounge T-Shirt with Graphic	//colorbox.co.id/cdn/shop/products/I-TSKFLW223A028ORANGE_3_T.jpg?v=1673582131&width=320	Orange	64950	T-shirt lengan pendek,  Round neck,  Oversized fit,  Graphic details at front,  Loose fit,  Material: Cotton Combed,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TSKFLW223A028	Short Sleeve Lounge T-Shirt with Graphic	//colorbox.co.id/cdn/shop/products/I-TSKFLW223A029OFFWHITE_3_T.jpg?v=1673582101&width=320	Off White	90930	T-shirt lengan pendek,  Round neck,  Oversized fit,  Graphic details at front,  Regular fit,  Material: Cotton Combed,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BLWKEY223A028	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/IBLWKEY223A028_ECRU_1_T.jpg?v=1673494301&width=320	Ecru	111930	Blouse lengan panjang,  Kerah kemeja,  Crop length,  Front button opening,  Drop shoulder details,  Loose Crop,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SWSFLW223A027	Short Sleeve Printed Pyjama Set	//colorbox.co.id/cdn/shop/products/I-SWSFLW223A027_LILAC_1_T.jpg?v=1673494294&width=320	Lilac	124950	Pyjama set dengan atasan lengan pendek,  Notch collar,  Bawahan celana pendek dengan elastic waist dan kantong samping,  Regular fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BLWKEY223A027	Long Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/IBLWKEY223A027_YELLOW_1_T.jpg?v=1673494286&width=320	Yellow	79950	Blouse lengan panjang,  Kerah kemeja,  Crop length,  Front button opening,  Drop shoulder details,  Loose Crop,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-LPDFJN223A024	High Waist Cargo Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDFJN223A024_BLUE_3_T.jpg?v=1673492863&width=320	Blue	179950	Celana panjang denim,  Side patch pocket with flap,  Front zipper with button opening,  Slit details on hemline side,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A024	Short Sleeve Printed Flare Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY223A024_OFF_WHITE_3_T.jpg?v=1673492854&width=320	Off White	104930	Blouse lengan pendek,  Peplum cut with drawstring detail,  Front button opening,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SIWFJN223A023	Mini Skirt with Ruched Details	//colorbox.co.id/cdn/shop/products/ISIWFJN223A023_MULTICOLOR_1.jpg?v=1673492845&width=320	Multicolor	99950	Rok mini berpotongan A-line,  Side zipper opening,  Full print fabric,  Ruched details around waist,  Regular fit,  Material: Rayon Twill,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A023	Short Sleeve Printed Flare Blouse	//colorbox.co.id/cdn/shop/products/IBSWKEY223A023_YELLOW_3_T.jpg?v=1673492836&width=320	Yellow	104930	Blouse lengan pendek,  Peplum cut with drawstring detail,  Front button opening,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SPDFJN223A022	Ripped Bermuda Shorts	//colorbox.co.id/cdn/shop/products/ISPDFJN223A022_BLUE_4.jpg?v=1673492827&width=320	Blue	129950	Celana pendek denim,  Rip details at front,  Unfinished hemline,  Dilengkapi kantong samping dan belakang,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SPWKEY223A022	Stripe Wide Cut Short Pants	//colorbox.co.id/cdn/shop/products/ISPWKEY223A022_BLACK_4_T.jpg?v=1673492818&width=320	Black	79950	Celana pendek casual,  Wide cut,  Stripe printed fabric,  Dilengkapi kantong samping,  Elastic waistband,  Loose fit,  Material: Oxford,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:SPWKEY223A021	Stripe Wide Cut Short Pants	//colorbox.co.id/cdn/shop/products/ISPWKEY223A021_PINK_4_T.jpg?v=1673492809&width=320	Pink	79950	Celana pendek casual,  Wide cut,  Stripe printed fabric,  Dilengkapi kantong samping,  Elastic waistband,  Loose fit,  Material: Oxford,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-JKKFJN223A021	Printed Varsity Jacket	//colorbox.co.id/cdn/shop/products/I-JKKFJN223A021_BLACK_3_T_71c87405-e4af-4f77-b65b-8e9352a1ad0e.jpg?v=1676895814&width=320	Black	265930	Long sleeve varsity jacket,  Contrast front snap button opening,  Graphic prints at front and sleeves,  Drop shoulder details,  Loose fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:LPKKEY223A019	Paperbag Jogger Pants	//colorbox.co.id/cdn/shop/products/ILPKKEY223A019_OFF_WHITE_4_T.jpg?v=1673492782&width=320	Off White	139930	Celana panjang casual,  Elastic waist with drawstring details,  Dilengkapi kantong samping,  Ankle length,  Loose fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-TSKFJN223A018	Flower Cut Out Short Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TSKFJN223A018_RED_3_T.jpg?v=1673492772&width=320	Red	74950	Atasan lengan pendek,  Round neck,  Flower cut out details at front,  Crop length,  Slim fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:DGDKEY223A017	Short Denim Dungarees	//colorbox.co.id/cdn/shop/products/IDGDKEY223A017_LT._BLUE_3_T.jpg?v=1673492763&width=320	Lt Blue	209930	Jumpsuit pendek denim,  Adjustable strap,  Front pocket details,  Unfinished hemline details,  Loose fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-BSWFJN223A017	Double Pocket Printed Crop Shirt	//colorbox.co.id/cdn/shop/products/DSC01259.jpg?v=1675845790&width=320	Multicolor	89950	Kemeja lengan pendek,  Front button opening,  Crop length,  Double pocket details at front,  All over printed fabric,  Regular fit,  Material: Rayon Twill,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SPWFCR223A015	Paperbag Shorts with Belt Details	//colorbox.co.id/cdn/shop/products/I-SPWFCR223A015_YELLOW_4.jpg?v=1673492716&width=320	Yellow	114950	Celana pendek dengan self fabric belt,  Paperbag waist detail,  Elastic waistband,  Dilengkapi kantong samping,  Regular fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SDWFCR223A014	Tiered Midi Skirt with Front Slit	//colorbox.co.id/cdn/shop/products/I-SDWFCR223A014_ECRU_4_T.jpg?v=1673492708&width=320	Ecru	195930	Rok midi dengan aksen tumpuk,  Front slit details,  Elastic on back waist,  Slim fit,  Material: Cotton Linen,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-COGKEY223A012	Colorblock Slouchy Knit Cardigan	//colorbox.co.id/cdn/shop/products/I-COGKEY223A012_BLACK_3_T.jpg?v=1673492011&width=320	Black	181930	Cardigan lengan panjang,  Front horn button opening,  Colorblock fabric details,  Double front pocket,  Loose fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:TTWFCR223A009	Printed Corset Top	//colorbox.co.id/cdn/shop/products/ITTWFCR223A009_ECRU_1_T.jpg?v=1673491968&width=320	Ecru	111930	Atasan tanpa lengan,  Smock details at back,  Crop length,  Princess cut front with strap,  Printed fabric,  Slim fit,  Material: Cotton,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-BSWFCR223A008	Off Shoulder Crop Top	//colorbox.co.id/cdn/shop/products/I-BSWFCR223A008_OFF_WHITE_3_T.jpg?v=1673491942&width=320	Off White	160930	Atasan off shoulder dengan strap,  Elastic band with ruffles detail,  Crop length,  Crinkle textured fabric,  Slim fit,  Material: Cotton Rayon Twill,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-SPDFCT223A006	Cut Out Waist Printed Denim Shorts	//colorbox.co.id/cdn/shop/products/DSC01444.jpg?v=1675847049&width=320	Ecru	195930	Celana pendek denim,  Cut out and buckle details on waist,  Front zipper with metal button opening,  All over doodle printed fabric,  Regular fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A005	Printed Short Sleeve Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY223A005_BLACK_3_T.jpg?v=1673491892&width=320	Black	104930	Kemeja lengan pendek,  Roll up sleeve details,  Front button opening,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A004	Printed Short Sleeve Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY223A004_MULTICOLOR_3_T.jpg?v=1673491875&width=320	Multicolor	104930	Kemeja lengan pendek,  Roll up sleeve details,  Front button opening,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:BSWKEY223A003	Printed Short Sleeve Shirt	//colorbox.co.id/cdn/shop/products/IBSWKEY223A003_OFF_WHITE_3_T.jpg?v=1673491860&width=320	Off White	104930	Kemeja lengan pendek,  Roll up sleeve details,  Front button opening,  Full print fabric,  Loose fit,  Material: Rayon,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-VEGKEY223A002	Pattern Knit Sleeveless Top	//colorbox.co.id/cdn/shop/products/I-VEGKEY223A002_BLACK_3_T.jpg?v=1673491851&width=320	Black	89950	Atasan tanpa lengan,  Round neck,  Striped brush pattern fabric,  Regular length,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-BSDFCT223A002	Printed Short Sleeve Denim Shirt	//colorbox.co.id/cdn/shop/products/I-BSDFCT223A002_ECRU_3_T.jpg?v=1673491844&width=320	Ecru	174930	Kemeja lengan pendek,  Front snap button opening,  Crop length,  All over printed fabric,  Double front pocket details,  Loose fit,  Material: Denim,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I-VEGKEY223A001	Pattern Knit Sleeveless Top	//colorbox.co.id/cdn/shop/products/I-VEGKEY223A001_OFF_WHITE_3_T.jpg?v=1673491835&width=320	Off White	89950	Atasan tanpa lengan,  Round neck,  Striped brush pattern fabric,  Regular length,  Fitted fit,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 77 cm,  Waist: 57 cm,  Hips: 88 cm
I:TSKBSC522O519	Fitted Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O519_BROWN_3_T.jpg?v=1670414100&width=320	Brown	79900	T-shirt lengan pendek,  Round neck,  Crop length,  Fitted Crop,  Material: Cotton,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-LPKBSC522O508	Basic Sweat Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O508_OFF_WHITE_4_T.jpg?v=1670414094&width=320	Off White	100000	Celana panjang casual,  Elastic on waist with drawstring,  Dilengkapi kantong samping,  Regular fit,  Material: Baby Terry,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I:TSKBBT222L308	Crew Neck Printed T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222L308_LILAC_1_T.jpg?v=1670414074&width=320	Lilac	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Regular length,  Fitted fit,  Material: TC,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I:TSKBBT222L306	Crew Neck Printed T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222L306_ORANGE_1_T.jpg?v=1670414062&width=320	Orange	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Regular length,  Fitted fit,  Material: TC,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I:TSKBBT222L304	Short Sleeve Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222L304_ORANGE_3_T.jpg?v=1670414051&width=320	Orange	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Crop length,  Loose Crop,  Material: TC,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I:TSKBBT222L303	Short Sleeve Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222L303_MAROON_1_T.jpg?v=1670414043&width=320	Maroon	49900	T-shirt lengan pendek,  Round neck,  Graphics at front,  Crop length,  Loose Crop,  Material: TC,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I:DDWKEY222L042	Fit & Flare Strappy Mini Dress	//colorbox.co.id/cdn/shop/products/I-DDWKEY222L042_DK._BROWN_4_T.jpg?v=1670412595&width=320	Dark Brown	74970	Mini dress tanpa lengan,  Tied spaghetti strap,  Detail kerut di bagian dada,  Back zipper opening,  Material: Cotton,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-LGKFLW222L025	Legging with Rib Details	//colorbox.co.id/cdn/shop/products/I-LGKFLW222L025_BROWN_4_T.jpg?v=1670412480&width=320	Brown	59970	Celana panjang legging,  Elastic waist,  Rib textured fabric,  Loose fit,  Material: Rib,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-BLWFJN222L017	Long Sleeve Wrap Top with Tied Waist	//colorbox.co.id/cdn/shop/products/I-BLWFJN222L017_GREEN_1_T.jpg?v=1670410112&width=320	Green	68970	Atasan lengan panjang V-neckline with collar,  Tied hemline details,  Crop length,  Slim fit,  Material: Rayon Twill,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-TTWFJN222L016	Sleeveless Shirt with Gathered Front	//colorbox.co.id/cdn/shop/products/319627364_463315559320806_5020795757049149252_n_1.jpg?v=1672918021&width=320	Green	47970	Atasan tanpa lengan,  Kerah kemeja,  Gathered front details,  Crop length,  Slim fit,  Material: Rayon Twill,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-LPDFCR222L012	Rolled Up Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDFCR222L012_BROWN_4.jpg?v=1670410066&width=320	Brown	107970	Celana panjang denim,  Dengan kantong depan dan belakang,  Roll up hemline details,  Material: Denim Twill,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-DIGFCT222L005	Glitter Mini Dress with Side Slit	//colorbox.co.id/cdn/shop/products/I-DIGFCT222L005_BLACK_3_T.jpg?v=1670409869&width=320	Black	77970	Mini dress tanpa lengan,  Tied spaghetti strap, Side slit details,  Glittery textured fabric,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-LPWFCT222L004	Tied Full Length Sateen Trousers	//colorbox.co.id/cdn/shop/products/I-LPWFCT222L004_BLACK_4_T.jpg?v=1670409857&width=320	Black	77970	Celana panjang full length,  Tied waist details,  Front zipper with hook opening,  Dengan kantong samping,  Loose fit,  Material: Sateen,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-TLGFCT222L001	Glitter Cropped Sweater	//colorbox.co.id/cdn/shop/products/I-TLGFCT222L001_BLACK_1_T_6cd2e1ce-9392-45d2-8508-abb5c508e020.jpg?v=1676896122&width=320	Black	59970	Atasan knit lengan panjang,  Round neck,  Glittery textured fabric,  Crop length,  Material: Flat Knit,  Model menggunakan ukuran S,  Height: 174 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 89 cm
I-LPKBSC522O501	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O501_4.jpg?v=1667384863&width=320	Black	100000	Celana panjang jogger,  Elastic waist with drawstring,  Kerah bulat,  Dilengkapi kantong samping,  Loose fit,  Material: Baby Terry,  Warna: BLACK,  Model menggunakan ukuran  S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBSC522O517	Fitted Short Sleeve Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O517_BLACK_1_T_f4023dc5-5be3-4dcb-8119-f1b1d6e60e52.jpg?v=1676896114&width=320	Black	79900	T-shirt basic,  Lengan pendek,  Kerah bulat,  Crop length,  Fitted fit,  Material: Cotton,  Warna: BLACK,  Model menggunakan ukuran  S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBSC522O516	Fitted Short Sleeve Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O516_OFF_WHITE_1_T.jpg?v=1667384849&width=320	Off White	79900	T-shirt basic,  Lengan pendek,  Kerah bulat,  Crop length,  Fitted fit,  Material: Cotton,  Warna: OFF WHITE,  Model menggunakan ukuran  S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPKBSC522O582	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O582_ECRU_4_T.jpg?v=1667191313&width=320	Ecru	100000	Celana panjang jogger,  Dilengkapi kantong samping,  Elastic waist with drawstring,  Regular fit,  Material: Baby Terry,  Warna: ECRU,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-STKBSC522O579	Basic Hoodie Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKBSC522O579_NAVY_1_T.jpg?v=1667191305&width=320	Navy	100000	Sweatshirt lengan panjang,  Crop length,  Dilengkapi hoodie dengan drawstring,  Drop shoulder details,  Loose fit,  Material: Baby Terry,  Warna: NAVY,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-LPKBSC522O576	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O576_NAVY_4_T.jpg?v=1667191283&width=320	Navy	100000	Celana panjang jogger,  Dilengkapi kantong samping,  Elastic waist with drawstring,  Regular fit,  Material: Baby Terry,  Warna: NAVY,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-LPKBSC522O575	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O575_DARK_GREEN_4_T.jpg?v=1667191276&width=320	Dark Green	100000	Celana panjang jogger,  Dilengkapi kantong samping,  Elastic waist with drawstring,  Regular fit,  Material: Baby Terry,  Warna: DARK GREEN,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:TSKBSC522O573	Boxy Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O573_GREY_3_T.jpg?v=1667191087&width=320	Grey	59900	T-shirt lengan pendek,  Round neck,  Crop length,  Unfinished hem details,  Fitted fit,  Material: TC,  Warna: GREY,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:TSKBSC522O572	Boxy Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O572_KHAKI_3_T.jpg?v=1667191080&width=320	Khaki	59900	T-shirt lengan pendek,  Round neck,  Crop length,  Unfinished hem details,  Fitted fit,  Material: TC,  Warna: KHAKI,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:TSKBSC522O571	Basic Loose T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O571_GREEN_1_T.jpg?v=1667191073&width=320	Green	69900	T-shirt lengan pendek,  Round neck,  Regular length,  Unfinished hem details,  Fitted fit,  Material: TC,  Warna: GREEN,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-TSKBSC522O568	Basic Fitted T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O568_FUCHSIA_1_T.jpg?v=1667191052&width=320	Fuchsia	79900	T-shirt lengan pendek,  Round neck,  Crop length,  Stretch fabric,  Fitted fit,  Material: Cotton Spandex,  Warna: FUCHSIA,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-TSKBSC522O511	Boxy Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O511_OFF_WHITE_3_T.jpg?v=1667191044&width=320	Off White	59900	T-shirt lengan pendek,  Round neck,  Crop length,  Unfinished hem details,  Loose fit,  Material: TC,  Warna: OFF WHITE,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-TSKBSC522O510	Boxy Short Sleeve Crop T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O510_BLACK_3_T.jpg?v=1667191037&width=320	Black	59900	T-shirt lengan pendek,  Round neck,  Crop length,  Unfinished hem details,  Loose fit,  Material: TC,  Warna: BLACK,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-STKBSC522O510	Basic Hoodie Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKBSC522O510_BLACK_1_T.jpg?v=1667191031&width=320	Black	100000	Sweatshirt lengan panjang,  Crop length,  Dilengkapi hoodie dengan drawstring,  Drop shoulder details,  Loose fit,  Material: Baby Terry,  Warna: BLACK,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-LPDKEY222K028	Straight Fit Cropped Jeans	//colorbox.co.id/cdn/shop/products/I-LPDKEY222K028_OLIVE_4_T.jpg?v=1667189985&width=320	Olive	89970	Celana panjang denim,  Crop length,  High waist,  5 pockets detail,  Front zipper with button opening,  Loose fit,  Material: Denim,  Warna: OLIVE,  Model menggunakan size 27,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:SPKFLW222K024	Ribbed Jersey Shorts	//colorbox.co.id/cdn/shop/products/ISPKFLW222K024_PINK_4_T.jpg?v=1667189953&width=320	Pink	44970	Celana pendek casual,  Textured printed fabric,  Elastic waist with drawstring,  Frills hemline detail,  Regular fit,  Material: Rib,  Warna: PINK,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-BSWFJN222K019	Printed Crop Shirt with Side Details	//colorbox.co.id/cdn/shop/products/I-BSWFJN222K019_MULTICOLOR_3_T.jpg?v=1667189903&width=320	Multicolor	59970	Blouse lengan panjang,  Kerah kemeja,  Waist strap details,  Printed fabric,  Crop length,  Regular fit,  Material: Rayon Twill,  Warna: MULTICOLOR,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:TSKKEY222K017	Ribbed Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY222K017_OLIVE_3_T.jpg?v=1667189883&width=320	Olive	29970	T-shirt lengan pendek,  Round neck,  Rib textured fabric,  Regular length,  Fitted fit,  Material: Rib,  Warna: OLIVE,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:TTGFJN222K016	Strappy Bra Knit Top	//colorbox.co.id/cdn/shop/products/ITTGFJN222K016_OFF_WHITE_1_T.jpg?v=1667189870&width=320	Off White	53970	Atasan tanpa lengan,  V-neckline wih open back,  Crop length,  Fitted fit,  Material: Flat Knit,  Warna: OFF WHITE,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I:BSWKEY222K015	Ruffle Sleeve Blouse with Knot Details	//colorbox.co.id/cdn/shop/products/IBSWKEY222K015_BEIGE_1_T.jpg?v=1667189857&width=320	Beige	44970	Blouse lengan pendek,  Ruffle sleeves,  V-neckline,  Front button opening,  Knotted waist details,  Loose fit,  Material: Rayon,  Warna: BEIGE,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-SPKKEY222K009	Sweat Short Pants with Elastic	//colorbox.co.id/cdn/shop/products/I-SPKKEY222K009_CORAL_4_T.jpg?v=1667189691&width=320	Coral	44970	Celana pendek casual,  Elastic on waist,  Dilengkapi kantong samping,  Loose fit,  Material: Baby Terry,  Warna: CORAL,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-TTGFCT222K001	Sleeveless Top with Lacing Cut Out	//colorbox.co.id/cdn/shop/products/I-TTGFCT222K001_CORAL_3_T.jpg?v=1667189597&width=320	Coral	44970	Atasan tanpa lengan,  Round neck,  Diagonal laced cut out details,  Textured fabric,  Fitted fit,  Material: Rib,  Warna: CORAL,  Model menggunakan size  S,  Height: 170,  Bust: 74,  Waist: 60, Hips: 78
I-STKBSC522O581	Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKBSC522O581_LILAC_1_T_96252d17-0391-4ab5-bfbc-20c62139d7db.jpg?v=1665648599&width=320	Lilac	100000	Sweatshirt lengan panjang,  Kerah bulat,  Crop length,  Drop shoulder details,  Loose Fit,  Material: Baby Terry,  Color: LILAC,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TTKBSC522O505	Fitted Basic Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC522O505_DENIM_BLUE_1_T_6d65c4f3-2898-4339-a448-4d341313f608.jpg?v=1665648264&width=320	Denim Blue	59900	Atasan tanpa lengan,  Adjustable spaghetti strap,  Stretch fabric,  Fitted Fit,  Material: Cotton,  Color: DENIM BLUE,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TTKBSC522O504	Fitted Basic Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC522O504_DARK_GREEN_3_T_4fe87608-e070-4c65-a84a-aaf3b5723d1a.jpg?v=1665648258&width=320	Dark Green	59900	Atasan tanpa lengan,  Adjustable spaghetti strap,  Stretch fabric,  Fitted Fit,  Material: Cotton,  Color: DARK GREEN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TTKBSC522O503	Fitted Basic Tank Top	//colorbox.co.id/cdn/shop/products/I-TTKBSC522O503_FUCHSIA_3_T_df73748a-4793-49c0-a3a7-38bc06924d71.jpg?v=1665648096&width=320	Fuchsia	59900	Atasan tanpa lengan,  Adjustable spaghetti strap,  Stretch fabric,  Fitted Fit,  Material: Cotton,  Color: FUCHSIA,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TLKBSC522O505	Long Sleeve Turtleneck Top	//colorbox.co.id/cdn/shop/products/I-TLKBSC522O505_BLUE_1_T_07394e91-35a7-4ff4-8d0f-57329c2807ad.jpg?v=1665648065&width=320	Blue	99900	Atasan lengan panjang,  High neckline,  Stretch fabric,  Regular length,  Fitted Fit,  Material: Cotton,  Color: BLUE,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TLKBSC522O504	Long Sleeve Turtleneck Top	//colorbox.co.id/cdn/shop/products/I-TLKBSC522O504_GREEN_3_T_ac4a3b86-6992-4563-a0fb-278425634115.jpg?v=1665648053&width=320	Green	99900	Atasan lengan panjang,  High neckline,  Stretch fabric,  Regular length,  Fitted Fit,  Material: Cotton,  Color: GREEN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TLKBSC522O503	Long Sleeve Turtleneck Top	//colorbox.co.id/cdn/shop/products/I-TLKBSC522O503_CAMEL_1_T_58d97f7f-1683-41f5-b7a1-92db582011cc.jpg?v=1665648028&width=320	Camel	99900	Atasan lengan panjang,  High neckline,  Stretch fabric,  Regular length,  Fitted Fit,  Material: Cotton,  Color: CAMEL,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-SPKBSC522O505	Basic Short Sweatpants	//colorbox.co.id/cdn/shop/products/I-SPKBSC522O505_BLUE_4_T_19e8c55c-e660-4438-b32d-d0b298b2bb77.jpg?v=1665647994&width=320	Blue	129900	Celana pendek casual,  Rounded hemline details,  Elastic waist with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Baby Terry,  Color: BLUE,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-SPKBSC522O504	Basic Short Sweatpants	//colorbox.co.id/cdn/shop/products/I-SPKBSC522O504_GREEN_4_T_063a147f-9dff-4747-9d64-155f48244c50.jpg?v=1665647988&width=320	Green	129900	Celana pendek casual,  Rounded hemline details,  Elastic waist with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Baby Terry,  Color: GREEN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-SPKBSC522O503	Basic Short Sweatpants	//colorbox.co.id/cdn/shop/products/I-SPKBSC522O503_BROWN_4_T_0d10eaa8-ca54-48df-b31a-6f275cb75ef9.jpg?v=1665647976&width=320	Brown	129900	Celana pendek casual,  Rounded hemline details,  Elastic waist with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Baby Terry,  Color: BROWN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-SPKBSC522O502	Basic Short Sweatpants	//colorbox.co.id/cdn/shop/products/I-SPKBSC522O502_OFF_WHITE_4_T_ea04dc05-b90d-4fbf-966a-80c7b3103ee3.jpg?v=1665647969&width=320	Off White	129900	Celana pendek casual,  Rounded hemline details,  Elastic waist with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Baby Terry,  Color: OFF WHITE,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-SPKBSC522O501	Basic Short Sweatpants	//colorbox.co.id/cdn/shop/products/I-SPKBSC522O501_BLACK_4_T_463596dd-f1a3-4206-b919-f5a025a2c18b.jpg?v=1665647965&width=320	Black	129900	Celana pendek casual,  Rounded hemline details,  Elastic waist with drawstring,  Dengan kantong samping,  Loose Fit,  Material: Baby Terry,  Color: BLACK,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I:TSKBBT222J306	Crew Neck Graphic T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222J306_LT._BLUE_3_T_4a91cef4-09b3-41e9-a85b-5c1f833a9498.jpg?v=1665647648&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Regular Fit,  Material: TC,  Color: LT. BLUE,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I:TSKBBT222J304	Round Neck Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222J304_PINK_1_T_9d6927ba-bad0-4396-b10e-f7be33c892e6.jpg?v=1665647642&width=320	Pink	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose Crop,  Material: TC,  Color: PINK,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I:TSKBBT222J303	Round Neck Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222J303_BROWN_1_T_f1b0609b-f27c-4684-842e-e867da181abc.jpg?v=1665647636&width=320	Brown	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose Crop,  Material: TC,  Color: BROWN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I:TSKBBT222J302	Round Neck Graphic Crop T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222J302_GREEN_3_T_4451f286-aace-41e8-9c56-77d5ce5c4424.jpg?v=1665647631&width=320	Green	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose Crop,  Material: TC,  Color: GREEN,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I-TSKBSC522O547	Fitted Short Sleeve T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O547_DENIM_BLUE_3_T.jpg?v=1665376007&width=320	Denim Blue	79900	Sweatshirt lengan panjang,  Kerah bulat,  Crop length,  Drop shoulder details,  Loose Fit,  Material: Baby Terry,  Color: LILAC,  Model menggunakan ukuran S,  Model Height 168 cm,  Bust: 75 cm,  Waist: 63 cm,  Hips: 90 cm
I:SPWFCR221J023	Printed Short Pants	//colorbox.co.id/cdn/shop/products/3560603-1306-3060653-1.jpg?v=1665373089&width=320	Acru	89950	Celana pendek dengan bahan printed,  Dilengkapi kantong samping,  Loose fit,  Warna: Acru,  Model menggunakan ukuran S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-BLWECO222I002	Printed Crop Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWECO222I002_MULTICOLOR_1_T.jpg?v=1663648232&width=320	Multicolor	99900	Blouse lengan panjang,  Pyjama collar,  Crop length,  Printed fabric,  Front button opening,  Loose,  Material: Rayon,  Warna: MULTICOLOR,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-BLWECO222I001	Printed Crop Long Sleeve Blouse	//colorbox.co.id/cdn/shop/products/I-BLWECO222I001_BLUE_1_T.jpg?v=1663648228&width=320	Blue	99900	Blouse lengan panjang,  Pyjama collar,  Crop length,  Printed fabric,  Front button opening,  Loose,  Material: Rayon,  Warna: BLUE,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-STKBSC522O584	Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKBSC522O584_BROWN_1_T.jpg?v=1663518762&width=320	Brown	100000	Sweatshirt lengan panjang,  Kerah bulat,  Drop shoulder details,  Crop length,  Loose,  Material: Baby Terry,  Warna: BROWN,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBSC520O562	Basic Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O562_OLIVE_1_T.jpg?v=1663518757&width=320	Olive	69900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Regular length,  Loose,  Material: TC,  Warna: OLIVE,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBSC520O560	Basic Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O560_MANGO_1_T.jpg?v=1663518747&width=320	Mango	69900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Regular length,  Loose,  Material: TC,  Warna: MANGO,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBSC520O559	Basic Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O559_LT._BLUE_1_T.jpg?v=1663518741&width=320	Lt. Blue	69900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Regular length,  Loose,  Material: TC,  Warna: LT. BLUE,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-LPKBSC522O517	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O517_TERRACOTTA_4_T.jpg?v=1663518720&width=320	Terracotta	100000	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Medium Slim Tapered,  Material: Baby Terry,  Warna: TERRACOTTA,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-LPKBSC522O516	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O516_GREEN_4_T.jpg?v=1663518715&width=320	Green	100000	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Medium Slim Tapered,  Material: Baby Terry,  Warna: GREEN,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TLKBBT122I307	Long Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITLKBBT122I307_BLACK_3_T.jpg?v=1663518504&width=320	Black	49900	T-shirt lengan panjang,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Regular fit,  Material: TC,  Warna: BLACK,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122I306	Crew Neck Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122I306_BROWN_3_T.jpg?v=1663518497&width=320	Brown	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Regular fit,  Material: TC,  Warna: BROWN,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122I305	Crew Neck Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122I305_MAGENTA_3_T.jpg?v=1663518491&width=320	Magenta	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Regular fit,  Material: TC,  Warna: MAGENTA,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-TTGFCR222I008	Floral Printed Bralette	//colorbox.co.id/cdn/shop/products/I-TTGFCR222I008_BEIGE_3_T.jpg?v=1665036923&width=320	Beige	53970	Atasan tanpa lengan,  Low round neckline,  Crop length,  Knit printed fabric,  Fitted,  Material: Flat Knit,  Warna: BEIGE,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122H307	Short Sleeve Fitted Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122H307_LT._BLUE_1_T.jpg?v=1663516399&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Fitted,  Material: TC,  Warna: LT. BLUE,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122H306	Short Sleeve Fitted Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122H306_BLACK_1_T.jpg?v=1663516394&width=320	Black	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Fitted,  Material: TC,  Warna: BLACK,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122H303	Short Sleeve Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122H303_LT._PINK_1_T.jpg?v=1663516380&width=320	Lt. Pink	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose,  Material: TC,  Warna: LT. PINK,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122H302	Short Sleeve Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122H302_OFF_WHITE_3_T_fa5740d3-10e6-45f3-955e-f3f3dfa1a552.jpg?v=1676896357&width=320	Off White	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose,  Material: TC,  Warna: OFF WHITE,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I:TSKBBT122H301	Short Sleeve Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT122H301_DARK_RED_1_T.jpg?v=1663516025&width=320	Dark Red	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose,  Material: TC,  Warna: DARK RED,  Model menggunakan ukuran XS,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-TSGECO122H009	Short Sleeve Fitted Polo Shirt	//colorbox.co.id/cdn/shop/products/I-TSGECO122H009_SOFT_GREEN_1_T.jpg?v=1663516020&width=320	Soft Green	89900	Atasan lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Crop length,  Fitted,  Material: Flat Knit,  Warna: SOFT GREEN,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-TSGECO122H007	Short Sleeve Fitted Polo Shirt	//colorbox.co.id/cdn/shop/products/I-TSGECO122H007_PINK_1_T.jpg?v=1663516015&width=320	Pink	89900	Atasan lengan pendek,  Polo collar,  Front button opening,  Textured fabric,  Crop length,  Fitted,  Material: Flat Knit,  Warna: PINK,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-SWGECO122H002	Long Sleeve Argyle Cardigan	//colorbox.co.id/cdn/shop/products/I-SWGECO122H002_GREY_3_T.jpg?v=1663516010&width=320	Grey	149900	Cardigan lengan panjang,  V-neckline,  Argyle pattern at front,  Front button opening,  Crop length,  Loose,  Material: Flat Knit,  Warna: GREY,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-SWGECO122H001	Long Sleeve Argyle Cardigan	//colorbox.co.id/cdn/shop/products/I-SWGECO122H001_NAVY_3_T.jpg?v=1663516004&width=320	Navy	149900	Cardigan lengan panjang,  V-neckline,  Argyle pattern at front,  Front button opening,  Crop length,  Loose,  Material: Flat Knit,  Warna: NAVY,  Model menggunakan ukuran S,  Height: 173 cm,  Bust: 82 cm,  Waist: 60 cm,  Hips: 89 cm
I-LPKECO122H011	Printed Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKECO122H011_NAVY_4_T.jpg?v=1661411968&width=320	Navy	119900	Celana panjang jogger,   Elastic waist with drawstring,   Dilengkapi kantong samping,   Printed details at front,   Loose fit,   Material: Baby Terry,   Warna: NAVY,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-LPKECO122H010	Printed Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKECO122H010_LILAC_4_T_b1dfb4d2-910c-4452-b525-20e735a03be8.jpg?v=1676896350&width=320	Lilac	119900	Celana panjang jogger,   Elastic waist with drawstring,   Dilengkapi kantong samping,   Printed details at front,   Loose fit,   Material: Baby Terry,   Warna: LILAC,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-TSGECO122H008	Knit Polo Shirt	//colorbox.co.id/cdn/shop/products/I-TSGECO122H008_LILAC_3_T.jpg?v=1661411942&width=320	Lilac	89900	Atasan knit lengan pendek,   Kerah kemeja,   Rib textured fabric,   Front button opening,   Fitted fit,   Material: Flat Knit,   Warna: LILAC,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-SWGECO122H003	V-neck Argyle Cardigan	//colorbox.co.id/cdn/shop/products/I-SWGECO122H003_BROWN_1_T.jpg?v=1661411773&width=320	Brown	149900	Cardigan lengan panjang,   V-neckline,   Front button opening,   Argyle printed fabric,   Loose fit,   Material: Flat Knit,   Warna: BROWN,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-TSKBBT122G307	Full Print Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122G307_MULTICOLOR_3_T_3de50403-f971-41b9-9c1b-bd887d8a60f8.jpg?v=1676896269&width=320	Multicolor	49900	T-shirt lengan pendek,   Kerah bulat,   Full print fabric,   Regular length,   Fitted fit,   Material: TC,   Warna: MULTICOLOR,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-SPWECO122G011	Printed Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWECO122G011_PURPLE_4_T.jpg?v=1661411726&width=320	Purple	79900	Celana pendek berbahan print,   High waist,   Elastic on back waist,   Dilengkapi kantong samping,   Loose fit,   Material: Rayon,   Warna: PURPLE,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-BSWECO122G002	Printed Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BSWECO122G002_PURPLE_3_T.jpg?v=1661411707&width=320	Purple	89900	Blouse lengan pendek,   Kerah kemeja,   Front button opening,   Printed fabric,   Crop length,   Loose fit,   Material: Rayon,   Warna: PURPLE,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-BSWECO122G001	Printed Short Sleeve Crop Blouse	//colorbox.co.id/cdn/shop/products/I-BSWECO122G001_BLACK_3_T.jpg?v=1661411702&width=320	Black	89900	Blouse lengan pendek,   Kerah kemeja,   Front button opening,   Printed fabric,   Crop length,   Loose fit,   Material: Rayon,   Warna: BLACK,   Model menggunakan ukuran  S,   Height: 170 cm,   Bust: 74 cm,   Waist: 60 cm,   Hips: 78 cm
I-TLKBBT122G308	Graphic Long Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I-TLKBBT122G308_3_T.jpg?v=1659064022&width=320	Lt. Blue	49900	T-shirt lengan panjang,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Fitted fit,  Material: TC,  Warna: LT. BLUE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TSKBSC522O567	Basic Crop Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O567_BLUE_1_T.jpg?v=1657769423&width=320	Blue	59900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Crop length,  Loose fit,  Material: TC,  Warna:  BLUE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TSKBSC522O553	Basic Crop Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O553_OLIVE_3_T.jpg?v=1657769419&width=320	Olive	59900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Crop length,  Loose fit,  Material: TC,  Warna:  OLIVE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TSKBSC522O552	Basic Crop Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O552_LT._PINK_3_T.jpg?v=1657769415&width=320	Lt. Pink	59900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Crop length,  Loose fit,  Material: TC,  Warna:  LT. PINK,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TLKFLW122G022	Graphic Long Sleeve Top	//colorbox.co.id/cdn/shop/products/I-TLKFLW122G022_BEIGE_1_T.jpg?v=1657768447&width=320	Beige	79950	Atasan lengan panjang,  Kerah bulat,  Drop shoulder details,  Grafis di bagian depan,  Loose fit,  Material: Rib,  Warna:  BEIGE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-SPWECO122G012	Printed Short Pants	//colorbox.co.id/cdn/shop/products/I-SPWECO122G012_TURQUOIS_4_T.jpg?v=1657708070&width=320	Turquois	79900	Celana pendek casual,  Printed fabric,  Elastic at back waist,  Dilengkapi kantong samping,  Loose fit,  Material: Rayon,  Warna:  TURQUOIS,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TSGFCT122G003	Wrap Knit Crop Top	//colorbox.co.id/cdn/shop/products/623A4349-1.jpg?v=1662546022&width=320	Olive	114950	Atasan lengan pendek,  V-neckline with wrap front,  Aksen tali di bagian pinggang,  Rib textured fabric,  Loose fit,  Material: Flat Knit,  Warna:  OLIVE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TTGFCT122G001	Lace Up Backless Space Dye Knit Top	//colorbox.co.id/cdn/shop/products/I-TTGFCT122G001_YELLOW_3_T.jpg?v=1657707683&width=320	Yellow	99950	Atasan tanpa lengan,  Halter neck with open back,  Tied up details at the back,  Crop length,  Loose fit,  Material: Flat Knit,  Warna:  YELLOW,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-LPKECO122F008	Basic Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKECO122F008_BLUE_4_T.jpg?v=1657707649&width=320	Blue	119900	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Fitted fit,  Material: Baby Terry,  Warna:  BLUE,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-LPKECO122F007	Basic Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKECO122F007_CREAM_4_T.jpg?v=1657707645&width=320	Cream	119900	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Fitted fit,  Material: Baby Terry,  Warna:  CREAM,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-LPKECO122F006	Basic Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKECO122F006_BROWN_3_T.jpg?v=1657707641&width=320	Brown	119900	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Fitted fit,  Material: Baby Terry,  Warna:  BROWN,  Model menggunakan ukuran S,  Height: 172 cm,  Bust: 82 cm,  Waist: 59 cm,  Hips: 88 cm
I-TSKBBT122F306	Graphic Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122F306_OFF_WHITE_3_T.jpg?v=1656576873&width=320	Off White	49900	T-shirt lengan pendek,  Kerah bulat,  Full print fabric,  Regular length,  Fitted fit ,  Material: TC,  Warna:  OFF WHITE,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122F303	Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122F303_DARK_GREEN_1_T.jpg?v=1656576860&width=320	Dark Green	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose fit ,  Material: TC,  Warna:  DARK GREEN,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122F302	Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122F302_DARK_GREY_1_T.jpg?v=1656576856&width=320	Dark Grey	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose fit ,  Material: TC,  Warna:  DARK GREY,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122F301	Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122F301_ACRU_3_T.jpg?v=1656576851&width=320	Acru	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Loose fit ,  Material: TC,  Warna:  ACRU,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBSC522O550	Crop T-shirt with Raw Edge	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O550BROWN_1_T.jpg?v=1666931666&width=320	Brown	59900	T-shirt lengan pendek,  Kerah bulat,  Raw edge details,  Crop length,  Loose fit,  Material: Cotton Combed,  Warna:  BROWN,  Model menggunakan ukuran S,  Model Height: 175 cm,  Bust: 87 cm,  Waist: 69 cm,  Hips: 89 cm
I-TSKBSC522O539	Crop T-shirt with Raw Edge	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O539_KHAKI_3_T.jpg?v=1654490100&width=320	Khaki	59900	T-shirt lengan pendek,  Kerah bulat,  Raw edge details,  Crop length,  Loose fit,  Material: Cotton Combed,  Warna:  KHAKI,  Model menggunakan ukuran S,  Model Height: 175 cm,  Bust: 87 cm,  Waist: 69 cm,  Hips: 89 cm
I-TSKBBT122D303	Short Sleeve Full Print T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122D303_BROWN_1_T.jpg?v=1649925144&width=320	Brown	49900	T-shirt lengan pendek,   Kerah bulat,   Flower full print fabric,   Regular length,   Fitted fit,   Material: TC,   Warna:  BROWN,   Model menggunakan size  S,   Model Height: 165 cm,   Bust: 77 cm,   Waist: 60 cm,   Hips: 88 cm
I-TSKBBT122D302	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122D302_LILAC_1_T.jpg?v=1649925140&width=320	Lilac	49900	T-shirt lengan pendek,   Kerah bulat,   Detail grafis di bagian depan,   Regular length,   Fitted fit,   Material: TC,   Warna:  LILAC,   Model menggunakan size  S,   Model Height: 165 cm,   Bust: 77 cm,   Waist: 60 cm,   Hips: 88 cm
I-TLKBBT122D304	Long Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/I-TLKBBT122D304_OLIVE_1_T.jpg?v=1649925131&width=320	Olive	49900	T-shirt lengan panjang,   Kerah bulat,   Detail grafis di bagian depan,   Regular length,   Fitted fit,   Material: TC,   Warna:  OLIVE,   Model menggunakan size  S,   Model Height: 165 cm,   Bust: 77 cm,   Waist: 60 cm,   Hips: 88 cm
I-CLDKEY122D074	5 Pockets Denim Cullotes	//colorbox.co.id/cdn/shop/products/I-CLDKEY122D074_LT._BLUE_4_T.jpg?v=1648293009&width=320	Lt. Blue	299900	Celana denim model kulot,  Dengan kantong depan dan belakang,  Front zipper with metal button,  Loose fit,  Material: Denim,  Warna: LT. BLUE,  Model menggunakan ukuran 25,  Model Height: 170 cm,  Bust: 80 cm,  Waist: 59 cm,  Hips: 88 cm
I:TSKBSC522O532	Fitted Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/I_TSKBSC522O532_BLUE_3_T.jpg?v=1646988209&width=320	Blue	79900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Fitted fit,  Material: Cotton Combed,  Warna:  BLUE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBSC522O530	Round Neck Crop T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBSC522O530_OLIVE_3_T.jpg?v=1646988200&width=320	Olive	59900	T-shirt lengan pendek,  Kerah bulat,  Unfinished hemline details,  Crop length,  Loose fit,  Material: Cotton Combed,  Warna:  OLIVE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPKBSC522O507	Basic Knit Jogger Pants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O507_OLIVE_1_T.jpg?v=1646988195&width=320	Olive	100000	Celana panjang jogger,  Elastic waist with drawstring,  Wide waistline details,  Fitted fit,  Material: Baby Terry,  Warna:  OLIVE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPDBSC500O408	Basic Skinny Fit Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDBSC500O408_BLACK_4_T.jpg?v=1646988190&width=320	Black	159920	Celana panjang denim,  Skinny fit,  Dengan kantong depan dan belakang,  Front zipper with metal button opening,  Fitted fit,  Material: Denim,  Warna:  BLACK,  Model menggunakan size 26,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPDBSC500O405	Basic Skinny Fit Denim Pants	//colorbox.co.id/cdn/shop/products/I-LPDBSC500O405_MED_BLUE_4_T.jpg?v=1646988185&width=320	Med Blue	159920	Celana panjang denim,  Skinny fit,  Dengan kantong depan dan belakang,  Front zipper with metal button opening,  Fitted fit,  Material: Denim,  Warna:  MED BLUE,  Model menggunakan size 26,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122C307	Short Sleeve Graphic Crop T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122C307_LT._BLUE_1.jpg?v=1646988176&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Round neck,  Detail grafis di bagian depan,  Crop length,  Fitted fit,  Material: TC,  Warna:  LT. BLUE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122C304	Round Neck Full Print T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122C304_BEIGE_3_T.jpg?v=1646988162&width=320	Beige	49900	T-shirt lengan pendek,  Round neck,  Full printed fabric,  Regular length,  Fitted fit,  Material: TC,  Warna:  BEIGE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKBBT122C302	Round Neck Graphic T-shirt	//colorbox.co.id/cdn/shop/products/I-TSKBBT122C302_ACRU_1_T.jpg?v=1646988153&width=320	Acru	49900	T-shirt lengan pendek,  Round neck,  Detail grafis di bagian depan,  Regular length,  Fitted fit,  Material: TC,  Warna:  ACRU,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-SPKFJN122C021	Colourful Short Knit Pants	//colorbox.co.id/cdn/shop/products/I-SPKFJN122C021_MULTICOLOR_4_T.jpg?v=1646976888&width=320	Multicolor	68970	Celana pendek knit,  Wave hemline details,  Stripe waistband with drawstring,  Loose fit,  Material: Flat Knit,  Warna:  MULTICOLOR,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-SIGFCT122C005	Psychedelic Wave Print Skirt	//colorbox.co.id/cdn/shop/products/I-SIGFCT122C005_BLACK_1.jpg?v=1646970614&width=320	Black	68970	Mini skirt bahan knit,  Printed and stretch fabric,  Wide waistband details,  Fitted fit,  Material: Flat Knit,  Warna:  BLACK,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:BSWKEY122C001	Short Sleeve Loose Blouse	//colorbox.co.id/cdn/shop/products/I_BSWKEY122C001_LT._BLUE_3_T.jpg?v=1646970567&width=320	Lt. Blue	129900	Blouse lengan pendek,  Kerah kemeja,  Roll up sleeve details,  Front button opening,  Loose fit,  Material: Rayon,  Warna:  LT. BLUE,  Model menggunakan size S,  Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKKEY121I001	Fitted Short Sleeve Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121I001_OFF_WHITE_1_T.jpg?v=1644383138&width=320	Off White	79900	T-shirt basic,  Lengan pendek,  Kerah bulat,  Crop length,  Warna:  OFF WHITE,  Material: Cotton,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-TLKCBC222B002	Colorbox x Bella Clarissa Crop Corset Top	//colorbox.co.id/cdn/shop/products/I-TLKCBC222B002_BLACK_3_T.jpg?v=1644036678&width=320	Black	159920	Exclusive collab with Bella Clarissa,  Atasan model korset lengan panjang,  Square neckline,  Crop length,  Full print fabric,  Material: Cotton,  Warna:  BLACK,  Loose fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I-TSKCBC222B026	Colorbox x Bella Clarissa Printed Crop T-s...	//colorbox.co.id/cdn/shop/products/Untitleddesign_7.png?v=1644467743&width=320	Black	143920	Exclusive collab with Bella Clarissa,  T-shirt lengan pendek,  Kerah bulat,  Full print fabric,  Crop length,  Material: Cotton,  Warna:  BLACK,  Loose fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I-JKKCBC222B003	Colorbox x Bella Clarissa Crop Bomber Jacket	//colorbox.co.id/cdn/shop/products/I-JKKCBC222B003_BLACK_3_T.jpg?v=1644036125&width=320	Black	239920	Exclusive collab with Bella Clarissa, Jaket bomber lengan panjang, Metal front zipper opening, Detail grafis di belakang, Crop length, Material: Baby Terry, Warna: BLACK, Loose fit, Model menggunakan ukuran S, Model Height: 172 cm, Bust: 72 cm, Waist: 60 cm, Hips: 88 cm 
I-CPDBSC521O419	Denim Capri Pants	//colorbox.co.id/cdn/shop/products/I-CPDBSC521O419_BLUE_4_T.jpg?v=1644036107&width=320	Blue	139950	Celana denim 3/4,  Dengan kantong depan dan belakang,  Front zipper with metal button opening,  Material: Denim,  Warna:  BLUE,  Fitted fit,  Model menggunakan ukuran 25,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I-CPDBSC521O418	Denim Capri Pants	//colorbox.co.id/cdn/shop/products/I-CPDBSC521O418_LT._BLUE_4_T.jpg?v=1644036103&width=320	Lt. Blue	139950	Celana denim 3/4,  Dengan kantong depan dan belakang,  Front zipper with metal button opening,  Material: Denim,  Warna:  LT. BLUE,  Fitted fit,  Model menggunakan ukuran 25,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKKEY222B057	V-neck Basic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY222B057_SOFT_YELLOW_1_T.jpg?v=1644035579&width=320	Soft Yellow	69900	T-shirt lengan pendek,  V-neckline,  Regular length,  Material: TC,  Warna:  SOFT YELLOW,  Loose fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBSC522O529	Loose Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O529_SOFT_GREEN_1_T_9750b9bb-7174-450b-a054-8da7d2cc5956.jpg?v=1676896595&width=320	Soft Green	69900	T-shirt lengan pendek,  Kerah bulat,  Regular length,  Raw edge details,  Material: Cotton,  Warna:  SOFT GREEN,  Loose fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBSC522O527	Loose Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC522O527_BLUE_1_T.jpg?v=1644035549&width=320	Blue	69900	T-shirt lengan pendek,  Kerah bulat,  Regular length,  Raw edge details,  Material: Cotton,  Warna:  BLUE,  Loose fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT222B303	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222B303_YELLOW_3_T.jpg?v=1644035283&width=320	Yellow	49900	T-shirt lengan pendek,  V-neckline,  Detail grafis di bagian depan,  Material: TC,  Warna:  YELLOW,  Fitted fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT222B302	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222B302_BLUE_3_T.jpg?v=1644035279&width=320	Blue	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Material: TC,  Warna:  BLUE,  Fitted fit,  Model menggunakan ukuran S,  Model Height: 172 cm,  Bust: 72 cm,  Waist: 60 cm,  Hips: 88 cm
I-STKKEY222A039	Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY222A039_OLIVE_3_T.jpg?v=1642349199&width=320	Olive	100000	Sweatshirt lengan panjang,  Crop length,  Drop shoulder details,  Loose fit,  Material: Baby Terry,  Warna:  OLIVE,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPKBSC522O004	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O004_BROWN_4_T.jpg?v=1642349194&width=320	Brown	100000	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Loose fit,  Material: Baby Terry,  Warna:  BROWN,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPKBSC522O003	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O003_DUSTY_PINK_4_T.jpg?v=1642349191&width=320	Dusty Pink	100000	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Loose fit,  Material: Baby Terry,  Warna:  DUSTY PINK,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-LPKBSC522O002	Basic Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKBSC522O002_OLIVE_4_T.jpg?v=1642349187&width=320	Olive	100000	Celana panjang jogger,  Elastic waist with drawstring,  Dilengkapi kantong samping,  Loose fit,  Material: Baby Terry,  Warna:  OLIVE,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT222A306	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222A306_BROWN_1_T.jpg?v=1641480438&width=320	Brown	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Warna: BROWN,  Material: TC,  FITTED fit,  Model is wearing size S,  Height 173,  Bust 82,  Waist 60,  Hips 88
I:TSKBBT222A305	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222A305_BLACK_3_T.jpg?v=1641480433&width=320	Black	49900	T-shirt lengan pendek,  V-neckline,  Detail grafis di bagian depan,  Regular length,  Warna: BLACK,  Material: TC,  FITTED fit,  Model is wearing size S,  Height 173,  Bust 82,  Waist 60,  Hips 88
I:TSKBBT222A302	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222A302_ACRU_1_T.jpg?v=1641480417&width=320	Acru	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Warna: ACRU,  Material: TC,  LOOSE fit,  Model is wearing size S,  Height 173,  Bust 82,  Waist 60,  Hips 88
I:TSKBBT222A301	Full Print Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT222A301_PINK_3_T.jpg?v=1641480413&width=320	Pink	49900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Full print details,  Warna: PINK,  Material: TC,  LOOSE fit,  Model is wearing size S,  Height 173,  Bust 82,  Waist 60,  Hips 88
I:TSKKEY222A016	Short Sleeve Graphic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY222A016_BROWN_3_T.jpg?v=1641480177&width=320	Brown	53970	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Frill details on the edge,  Warna: BROWN,  Material: Cotton,  FITTED fit,  Model is wearing size S,  Height 173,  Bust 82,  Waist 60,  Hips 88
I:SIWFCR222A011	Short with Dart Details	//colorbox.co.id/cdn/shop/products/ISIWFCR222A011_ACRU_4_T.jpg?v=1641478560&width=320	Acru	68970	Rok mini dengan detail smock, Elastic waistline, Wide frills on hemline, Warna: ACRU\n, Material: Cotton paris\n, LOOSE fit, Model is wearing size S, Height 173, Bust 82, Waist 60, Hips 88
I:TSKKEY221L075	Fitted Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L075_SOFT_GREEN_1_T.jpg?v=1636620480&width=320	Soft Green	79900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Material: Cotton Combed,  Warna:  SOFT GREEN,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKKEY221L066	Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L066_GREEN_1_T.jpg?v=1636620467&width=320	Green	69900	T-shirt lengan pendek,  Kerah bulat,  Regular length,  Unfinished hemline details,  Material: Cotton Combed,  Warna:  GREEN,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKKEY221L065	Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L065_MAROON_1_T.jpg?v=1636620461&width=320	Maroon	69900	T-shirt lengan pendek,  Kerah bulat,  Regular length,  Unfinished hemline details,  Material: Cotton Combed,  Warna:  MAROON,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKKEY221L069	Short Sleeve Crop Basic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L069_PURPLE_1_T.jpg?v=1636620431&width=320	Purple	59900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Unfinished hemline details,  Material: Cotton Combed,  Warna:  PURPLE,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKKEY221L068	Short Sleeve Crop Basic T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L068_LIME_4_T.jpg?v=1636620426&width=320	Lime	59900	T-shirt lengan pendek,  Kerah bulat,  Crop length,  Unfinished hemline details,  Material: Cotton Combed,  Warna:  LIME,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKKEY221L067	Short Sleeve Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221L067_LT._BLUE_1_T.jpg?v=1636620419&width=320	Lt. Blue	69900	T-shirt lengan pendek,  Kerah bulat,  Regular length,  Unfinished hemline details,  Material: Cotton Combed,  Warna:  LT. BLUE,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKBBT221J307	Plant Seeds Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT221J307_YELLOW_3_T.jpg?v=1636620384&width=320	Yellow	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian dada,  Material: TC,  Warna:  YELLOW,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKBBT221J303	All Your Dream Boat Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT221J303_LT._BLUE_1_T.jpg?v=1636620372&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Boat neckline,  Detail grafis di bagian dada,  Material: TC,  Warna:  LT. BLUE,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKBBT221J301	Doing My Best Boat Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT221J301_GREY_4_T.jpg?v=1636620360&width=320	Grey	49900	T-shirt lengan pendek,  Boat neckline,  Detail grafis di bagian dada,  Material: TC,  Warna:  GREY,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I-STKKEY121J052	Long Sleeve Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY121J052_ACRU_4_T.jpg?v=1636620231&width=320	Acru	100000	Sweatshirt lengan panjang,  Kerah bulat,  Drop shoulder details,  Crop length,  Material: Baby Terry ,  Warna:  ACRU,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I-LPKKEY121J057	Jogger Sweatpants	//colorbox.co.id/cdn/shop/products/I-LPKKEY121J057_ACRU_4.jpg?v=1636620116&width=320	Acru	100000	Celana panjang jogger,  Elastic dengan drawstring di bagian pinggang,  Dilengkapi kantong samping,  Material: Baby Terry ,  Warna:  ACRU,  Model menggunakan ukuran S,  Model Height: 170 cm,  Bust: 77 cm,  Waist: 61 cm,  Hips: 85 cm
I:TSKBBT121I308	Peaches Graphic Tee	//colorbox.co.id/cdn/shop/products/ITSKBBT121I308_LT._BLUE_3_T.jpg?v=1632918476&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Crop length,  Warna:  LT. BLUE,  Material: TC,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT121I306	Full Print Short Sleeve Tee	//colorbox.co.id/cdn/shop/products/ITSKBBT121I306_OFF_WHITE_4_T.jpg?v=1632918465&width=320	Off White	49900	T-shirt lengan pendek,  Kerah bulat,  Full print graphics details,  Regular length,  Warna:  OFF WHITE,  Material: TC,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT121I304	Nice Vibe Graphic Tee	//colorbox.co.id/cdn/shop/products/ITSKBBT121I304_BROWN_3_T.jpg?v=1632918454&width=320	Brown	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Warna:  BROWN,  Material: TC,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT121I301	Short Sleeve Crop Tee	//colorbox.co.id/cdn/shop/products/ITSKBBT121I301_PEACH_3_T.jpg?v=1632917124&width=320	Peach	49900	T-shirt crop lengan pendek,  Kerah bulat,  Folded sleeves,  Elastic details at hemline,  Dengan grafis di bagian depan,  Warna:  PEACH,  Material: Baby Terry,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKBBT121I303	Shine Through Graphic Tee	//colorbox.co.id/cdn/shop/products/ITSKBBT121I303_LIME_3_T.jpg?v=1632916902&width=320	Lime	49900	T-shirt lengan pendek,  Kerah bulat,  Detail grafis di bagian depan,  Regular length,  Warna:  LIME,  Material: TC,  FITTED fit,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I-STKKEY121H062	Basic Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY121H062_LILAC_4_T.jpg?v=1628756316&width=320	Lilac	100000	Sweatshirt lengan panjang,  Berpotongan crop,  Kerah bulat,  Drop shoulder details,  Loose fit,  Warna:  LILAC,  Material: Baby Terry TC,  Model menggunakan ukuran S,  Height 165cm,  Bust: 77cm,  Waist: 60cm,  Hips: 88cm
I-STKKEY121H061	Basic Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY121H061_ACRU_1_T.jpg?v=1628756310&width=320	Acru	100000	Sweatshirt lengan panjang,  Berpotongan crop,  Kerah bulat,  Drop shoulder details,  Loose fit,  Warna:  ACRU,  Material: Baby Terry TC,  Model menggunakan ukuran S,  Height 165cm,  Bust: 77cm,  Waist: 60cm,  Hips: 88cm
I-STKKEY121H060	Basic Crop Sweatshirt	//colorbox.co.id/cdn/shop/products/I-STKKEY121H060_MINT_3_T.jpg?v=1628756305&width=320	Mint	100000	Sweatshirt lengan panjang,  Berpotongan crop,  Kerah bulat,  Drop shoulder details,  Loose fit,  Warna:  MINT,  Material: Baby Terry TC,  Model menggunakan ukuran S,  Height 165cm,  Bust: 77cm,  Waist: 60cm,  Hips: 88cm
I:TSKBBT121H308	Papillon V-neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H308_PINK_1_T_eed31d1a-6e2e-462f-bd30-8cb5882cb545.jpg?v=1676896650&width=320	Pink	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  V-neckline,  Material: TC,  Warna: PINK,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H306	Manifest Crew T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H306_LT._BLUE_3_T.jpg?v=1627727250&width=320	Lt. Blue	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Crew neckline,  Material: TC,  Warna: LT. BLUE,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H305	No Bad Days Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H305_BROWN_3_T.jpg?v=1627727245&width=320	Brown	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Round neckline,  Material: TC,  Warna: BROWN,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H304	Heart Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H304_OFF_WHITE_3_T.jpg?v=1627727240&width=320	Off White	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Crew neckline,  Material: TC,  Warna: OFF WHITE,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H303	Plant Kindness Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H303_PURPLE_3_T.jpg?v=1627727235&width=320	Purple	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Crew neckline,  Material: TC,  Warna: PURPLE,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H302	Psychedelic Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H302_OFF_WHITE_1_T.jpg?v=1627727230&width=320	Off White	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Round neckline,  Material: TC,  Warna: OFF WHITE,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKBBT121H301	Self Love Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBBT121H301_BLACK_3_T.jpg?v=1627727000&width=320	Black	49900	T-shirt lengan pendek,  Detail grafis di bagian depan,  Crew neckline,  Material: TC,  Warna: BLACK,  Model menggunakan ukuran S,  Model Height 172Cm,  Bust 78 Cm,  Waist 59 Cm,  Hips 89Cm
I:TSKKEY121H008	Loose Short Sleeve T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121H008_LILAC_4_T.jpg?v=1627649439&width=320	Lilac	69900	T-shirt lengan pendek,  Kerah bulat,  Detail unfinished di hemline dan ujung lengan,  Material: TC,  Warna: LILAC,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKKEY121H006	Basic Crop T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121H006_BROWN_3_T.jpg?v=1627649429&width=320	Brown	79900	T-shirt lengan pendek,  Kerah bulat,  Berpotongan crop,  Stretch fabric,  Material: Cotton Spandex,  Warna: BROWN,  Model menggunakan ukuran S,  Model Height: 165 cm,  Bust: 77 cm,  Waist: 60 cm,  Hips: 88 cm
I:TSKKEY121G306	Your Girl Gang Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121G306_BROWN_3_T.jpg?v=1624877375&width=320	Brown	49900	T-shirt lengan pendek,  Round neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: BROWN,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121G304	Butterfly Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121G304_OFF_WHITE_3_T.jpg?v=1624877365&width=320	Off White	49900	T-shirt lengan pendek,  Round neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: OFF WHITE,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121G303	Today V-Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121G303_LIME_3_T.jpg?v=1624877361&width=320	Lime	49900	T-shirt lengan pendek,  V-neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: LIME,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121G301	Good Days Round Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121G301_OLIVE_1_T.jpg?v=1624877351&width=320	Olive	49900	T-shirt lengan pendek,  Round neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: OLIVE,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121F305	Love Peace Round Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121F305_BROWN_3_T.jpg?v=1624877129&width=320	Brown	49900	T-shirt lengan pendek,  Round neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: BROWN,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121F304	Bold and Real V-Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121F304_ACRU_1.jpg?v=1624876995&width=320	Acru	49900	T-shirt lengan pendek,  V-neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: ACRU,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKKEY121F301	Note to Self Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121F301_BLACK_3_T.jpg?v=1624876979&width=320	Black	49900	T-shirt lengan pendek,  Crew neckline,  Detail grafis di bagian depan,  Material: TC,  Warna: BLACK,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I-CLDKEY122D075	Cullotte Denim	//colorbox.co.id/cdn/shop/products/I-CLDKEY121G038_OFF_WHITE_4_T.jpg?v=1624876933&width=320	Off White	299900	Celana kulot denim,  Dengan kantong samping dan belakang,  Belt loop details,  Zipper opening,  Material: Denim,  Warna: OFF WHITE,  Model menggunakan ukuran 26,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TTWKEY121G028	V-neck Sleeveless Top	//colorbox.co.id/cdn/shop/products/ITTWKEY121G028_LILAC_3_T.jpg?v=1624876356&width=320	Lilac	38970	Atasan tanpa lengan,  V-neckline,  Detail asimetris di bagian hemline,  Crop length,  Material: Paris,  Warna: LILAC,  Model menggunakan ukuran S,  Height: 171cm,  Bust: 83,  Waist: 60,  Hips: 88
I:TSKDPF321E024	Colorbox X Dinda Puspitasari Oversized Tee	//colorbox.co.id/cdn/shop/products/ITSKDPF321E024_OFF_WHITE_4_T.jpg?v=1620722307&width=320	Off White	53970	Special collaboration Colorbox X Dinda Puspitasari\n, Kaus casual, Animation printed, Loose fit, Material combed, Model height 170cm, Bust 77, waist 61, hips 85, Model memakai size S
I:TSKKEY121E307	Sun And Moon Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121E307_OFF_WHITE_4_T.jpg?v=1619597975&width=320	Off White	49900	Kaus casual,  Model fitted,  Animated full print,  Material TC,  Model height 170cm ,  Bust 77,  waist 61,  hips 85,  Model memakai size S
I:TSKKEY121E302	Its Time For New Adventure Round Neck T-S...	//colorbox.co.id/cdn/shop/products/ITSKKEY121E302_BROWN_3_T.jpg?v=1619597946&width=320	Brown	49900	Kaus casual,  Model fitted,  Animated Print,  Material TC,  Model height 170cm ,  Bust 77,  waist 61,  hips 85,  Model memakai size S
I:TSKKEY121E301	See Ya Later Maybe Never Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121E301_OFF_WHITE_3_T.jpg?v=1619597940&width=320	Off White	49900	Kaus casual,  Model fitted,  Animated Print,  Material TC,  Model height 170cm ,  Bust 77,  waist 61,  hips 85,  Model memakai size S
I-CPDBSC521O421	Capri Denim Pants	//colorbox.co.id/cdn/shop/products/I-CPDBSC521O421_BLACK_4_T.jpg?v=1619597282&width=320	Black	139950	Capri denim,  Model fitted,  Stretch denim,  Design casual,  Model height 170cm ,  Bust 77,  waist 61,  hips 85,  Model memakai size 26
I-CPDBSC521O420	Capri Denim Pants	//colorbox.co.id/cdn/shop/products/I-CPDBSC521O420_DARK_BLUE_4_T.jpg?v=1619597278&width=320	Dark Blue	139950	Capri denim,  Model fitted,  Stretch denim,  Design casual,  Model height 170cm ,  Bust 77,  waist 61,  hips 85,  Model memakai size 26
I:TSKKEY121D304	Make up Crew Neck T-Shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121D304_LIME_3_T.jpg?v=1616477458&width=320	Lime	49900	T-shirt fitted kasual,  Lengan panjang,  Round neckline,  Detil print di bagian depan baju,  Bahan Tetoron Cotton,  Model menggunakan ukuran S,  Height: 175cm,  Bust:83cm,  Waist: 60cm,  Hips 90cm
I:TSKKEY121D084	Cotton T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121D084_YELLOW_1_T.jpg?v=1616477433&width=320	Yellow	69900	Kaos kasual simple,  Lengan pendek,  Round neckline,  Bahan tetoron Cotton,  Loose fit,  Model menggunakan ukuran S,  Height: 175cm,  Bust:83cm,  Waist: 60cm,  Hips 90cm
I:TSKKEY121D082	Cotton T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY121D082_PURPLE_3_T.jpg?v=1616476913&width=320	Purple	69900	Kaos kasual simple,  Lengan pendek,  Round neckline,  Bahan tetoron Cotton,  Loose fit,  Model menggunakan ukuran S,  Height: 175cm,  Bust:83cm,  Waist: 60cm,  Hips 90cm
I:TSKBSC520O502	Cotton T-shirt	//colorbox.co.id/cdn/shop/products/ITSKBSC520O502_BLACK_1_T.jpg?v=1616476860&width=320	Black	69900	Kaos kasual simple,  Lengan pendek,  Round neckline,  Bahan Tetoron Cotton,  Cocok untuk dipakai sehari-hari,  Loose fit,  Model menggunakan ukuran S,  Height: 175cm,  Bust:83cm,  Waist: 60cm,  Hips 90cm
I:TLKKEY121C305	Worry Less Live More Long T-shirt	//colorbox.co.id/cdn/shop/products/ITLKKEY121C305_BLACK_3_T.jpg?v=1613995285&width=320	Black	49900	Atasan t-shirt simple yang cocok dipakai kapan saja,  Basic t-shirt,  Lengan panjang,  Kerah bulat,  Print bagian depan,  Fitting fit,  Bahan TC,  Model height 174cm,  Bust 80cm,  Waist 60cm,  Hips 89 cm,  Model memakai size M
I-LPDBSC500O417	Wide Leg Jeans	//colorbox.co.id/cdn/shop/products/I-LPDBSC500O417MEDBLUE_4_T_62bd5de3-2fcc-453d-858d-b856b7e320f6.jpg?v=1676896666&width=320	Med Blue	249900	High waist denim jeans,  Two front pockets with silver rivets detail,  Two back patch pockets detail,  Loose Fit,  Material: Denim,  Warna: Med. blue,  Model wearing size S
I-LPDBSC500O416	Wide Leg Jeans	//colorbox.co.id/cdn/shop/products/I-LPDBSC500O416LT.BLUE_4_T_e0b43654-f9f6-436b-9e6b-3121e23b536d.jpg?v=1676896675&width=320	Lt. Blue	249900	High waist denim jeans,  Two front pockets with silver rivets detail,  Two back patch pockets detail,  Loose Fit,  Material: Denim,  Warna: Lt. blue,  Model wearing size S
I:TSKKEY221B302	Lemons Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221B302_OFF_WHITE_1.jpg?v=1611830100&width=320	Off White	49900	Atasan t-shirt simple yang cocok dipakai kapan saja,  Basic t-shirt,  Lengan pendek,  Kerah bulat,  Print bagian depan,  Fitting fit,  Bahan TC,  Model height 174cm,  Bust 83,  Waist 62,  Hips 90,  Model memakai size S
I:TSKKEY221B301	Lets Taco Bout Love Round T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221B301_GREY_3.jpg?v=1611830095&width=320	Grey	49900	Atasan t-shirt simple yang cocok dipakai kapan saja,  Basic t-shirt,  Lengan pendek,  Kerah bulat,  Print bagian depan,  Fitting fit,  Bahan TC,  Model height 174cm,  Bust 83,  Waist 62,  Hips 90,  Model memakai size S
I:CLDBSC500O414	Denim Cullotes	//colorbox.co.id/cdn/shop/products/ICLDBSC500O414_MED_BLUE_4.jpg?v=1611828568&width=320	Med Blue	229900	Bawahan denim dengan aksen kasual chic yang cocok dipadankan dengan atasan blouse,  Celana midi,  Cutting kulot,  Kancing dan resleting depan,  Dua kantong samping dan belakang,  Fitting loose,  Bahan denim,  Model height 174cm,  Bust 83,  Waist 62,  Hips 90,  Model memakai size 26
I-CLDBSC500O415	Denim Cullotes	//colorbox.co.id/cdn/shop/products/I-CLDBSC500O415_LT._BLUE_4.jpg?v=1611828562&width=320	Lt. Blue	229900	Bawahan denim dengan aksen kasual chic yang cocok dipadankan dengan atasan blouse,  Celana midi,  Cutting kulot,  Kancing dan resleting depan,  Dua kantong samping dan belakang,  Fitting loose,  Bahan denim,  Model height 174cm,  Bust 83,  Waist 62,  Hips 90,  Model memakai size 26
I:TSKBSC520O503	Regular Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221A060_OFF_WHITE_3_T.jpg?v=1610512243&width=320	Off White	69900	T-shirt polos yang nyaman dan cocok dipakai sehari-hari,  Basic,  Kerah bulat,  Lengan pendek,  Round hemline,  Bahan combed 30s,  Fitting loose,  Warna: OFF WHITE,  Model memakai ukuran M,  Height 170,  Bust 81 Waist 67 Hips 91
I:TSKBSC520O501	Regular Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221A042_MUSTARD_3_T.jpg?v=1610512232&width=320	Mustard	69900	T-shirt polos yang nyaman dan cocok dipakai sehari-hari,  Basic,  Kerah bulat,  Lengan pendek,  Round hemline,  Bahan combed 30s,  FItting loose,  Warna: MUSTARD,  Model memakai ukuran S,  Height 170,  Bust 81 Waist 67 Hips 91
I:TSKKEY221A304	Dont Forget to Sparkle Crew Neck T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221A304_BLACK_1_T.jpg?v=1610120365&width=320	Black	49900	T-shirt kasual bermotif yang cocok dipakai sehari-hari,  Kerah bulat,  lengan pendek,  print dibagian depan,  bahan TC,  fitting fitted,  Warna: BLACK,  Model memakai ukuran M,  Height 170,  Bust 81 Waist 67 Hips 91
I:TSKKEY221A041	Regular Loose T-shirt	//colorbox.co.id/cdn/shop/products/ITSKKEY221A041_RED_4_T.jpg?v=1610118357&width=320	Red	69900	T-shirt polos yang nyaman dan cocok dipakai sehari-hari,  Basic,  kerah bulat,  lengan pendek,  round hemline,  bahan combed 30s,  fitting loose,  Warna: RED,  Model memakai ukuran M,  Height 170,  Bust 81 Waist 67 Hips 91
I-LPDBSC500O413	Mom Jeans	//colorbox.co.id/cdn/shop/products/4_8bf91640-2b08-49d7-8155-060e5c332de2.jpg?v=1602665060&width=320	Off White	199920	N/A
I-LPDBSC500O411	Mom Jeans	//colorbox.co.id/cdn/shop/products/4_11b63058-06a0-4c63-9f66-73c400568fe5.jpg?v=1602665035&width=320	Black	199920	N/A
I-LPDBSC500O410	Mom Jeans	//colorbox.co.id/cdn/shop/products/4_0688cf51-fcc0-4d71-b9e7-a3cba77bb84c.jpg?v=1602665022&width=320	Med Blue	199920	N/A
I-LPDBSC500O409	Mom Jeans	//colorbox.co.id/cdn/shop/products/4_0ba3058f-1d38-4273-80da-93c0c683eb26.jpg?v=1676896685&width=320	Lt. Blue	199920	N/A
I-STKFCT219L027	[GIFT WITH PURCHASE] Smiley sweatshirt	//colorbox.co.id/cdn/shop/products/4_12b82850-3ef2-4c87-9e7c-f5e1333df45d.jpg?v=1601268662&width=320	Black	299900	Cold shoulder sweatshirt, Long sleeves, Motif: Contrast collar, Loose fit, Warna: Black, Material: Baby terry, Model Wearing Size M, Model Height: 175 Cm, Bust: 85 Cm, Waist: 59 Cm, Hips: 89 Cm
I-LPDBSC500O406	Denim Pants	//colorbox.co.id/cdn/shop/products/4_9e312d8c-4c3a-4436-aff8-b4c35107a4ce.jpg?v=1600918897&width=320	Lt. Blue	159920	Basic denim pants,  No contrast stitching,  Stretch fabric,  Slim fit,  Warna: Lt. Blue,  Material: Denim,  Model Wearing Size M,  Model Height: 175 Cm,  Bust: 85 Cm,  Waist: 59 Cm,  Hips: 89 Cm
I:TSKKEY219L306	[GIFT WITH PURCHASE] SmileyWorld Round Nec...	//colorbox.co.id/cdn/shop/products/3_25867d63-6d41-4681-ba1e-68cc74efaf92.jpg?v=1676896694&width=320	Black	129900	SmileyWorld? Round neckline T-Shirt,  Short sleeve,  Printed detail,  Fitted fit,  Warna: Black,  Material: Cotton,  Model Wearing Size M,  Model Height: 175 Cm,  Bust: 85 Cm,  Waist: 59 Cm,  Hips: 89 Cm
I:TSKKEY219L307	[GIFT WITH PURCHASE] SmileyWorld Crew Neck...	//colorbox.co.id/cdn/shop/products/4_4f10d159-3a31-4db2-b148-e3fa128b59b8.jpg?v=1600858357&width=320	Off White	129900	SmileyWorld? Crew neckline T-Shirt,  Short sleeve,  Printed detail,  Fitted fit,  Warna: Off White,  Material: Cotton,  Model Wearing Size M,  Model Height: 175 Cm,  Bust: 85 Cm,  Waist: 59 Cm,  Hips: 89 Cm
I:TSKKEY219L305	[GIFT NOT FOR SALE] SmileyWorld V-Neck T-S...	//colorbox.co.id/cdn/shop/products/4_1402df5b-8d7a-404e-a6d3-3334dc6dd468.jpg?v=1600858340&width=320	Grey	129900	SmileyWorld? V-neck T-Shirt,  Short sleeve,  Printed detail,  Fitted fit,  Warna: Grey,  Material: Cotton,  Model Wearing Size M,  Model Height: 175 Cm,  Bust: 85 Cm,  Waist: 59 Cm,  Hips: 89 Cm
I:TSKKEY219L304	[GIFT NOT FOR SALE] SmileyWorld T-Shirt	//colorbox.co.id/cdn/shop/products/4_09835ec5-e803-4b59-ba3e-2117326d2372.jpg?v=1600858326&width=320	Red	129900	SmileyWorld? Round neckline T-Shirt,  Short sleeve,  Printed detail,  Fitted fit,  Warna: Grey,  Material: Cotton,  Model Wearing Size M,  Model Height: 175 Cm,  Bust: 85 Cm,  Waist: 59 Cm,  Hips: 89 Cm
I-TSKKEY219K307	[GIFT WITH PURCHASE] SmileyWorld T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKKEY219K307-_4_8b4752ca-312a-4135-891e-8bc2eb3019e2.jpg?v=1676896711&width=320	Red	129900	SmileyWorld T-Shirt, Short Sleeve, Fitted, Motif: Solid, Material: Cotton, Model Wearing Size M, Model Height 173 cm, Bust 79 cm, Waist 58 cm, Hips 88 cm
I-TSKKEY219K302	[GIFT WITH PURCHASE] SmileyWorld T-Shirt	//colorbox.co.id/cdn/shop/products/I-TSKKEY219K302-_4.jpg?v=1598021733&width=320	Dark Grey	129900	SmileyWorld T-Shirt, Short Sleeve, Fitted, Motif: Solid, Material: Cotton, Model Wearing Size M, Model Height 173 cm, Bust 79 cm, Waist 58 cm, Hips 88 cm
I-LPDBSC500O407	Basic Highwaist Pants	//colorbox.co.id/cdn/shop/products/I-LPDBSC500O407_4.jpg?v=1597907673&width=320	Off White	183920	Long Denim Pants,  Basic highwaits style with stiches rounded pocket,  Fitted Fit,  Motif: Solid,  Warna: Off white,  Material: Denim,  Model Wearing Size M,  Model Height: 175 cm,  Bust: 85 cm,  Waist: 59 cm,  Hips: 89 cm
\.


--
-- Name: bank_transfer_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_transfer_payment_id_seq', 1, false);


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, false);


--
-- Name: cart_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_customer_id_seq', 1, false);


--
-- Name: cart_product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_product_cart_id_seq', 1, false);


--
-- Name: cart_product_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_product_order_number_seq', 1, false);


--
-- Name: credit_card_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_card_payment_id_seq', 1, false);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);


--
-- Name: e_wallet_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.e_wallet_payment_id_seq', 1, false);


--
-- Name: payment_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_cart_id_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: bank_transfer bank_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_transfer
    ADD CONSTRAINT bank_transfer_pkey PRIMARY KEY (payment_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: cart_product cart_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_pkey PRIMARY KEY (order_number, cart_id);


--
-- Name: credit_card credit_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_pkey PRIMARY KEY (payment_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: e_wallet e_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e_wallet
    ADD CONSTRAINT e_wallet_pkey PRIMARY KEY (payment_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_code);


--
-- Name: cart check_payment_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER check_payment_trigger BEFORE INSERT OR UPDATE ON public.cart FOR EACH ROW EXECUTE FUNCTION public.check_payment();


--
-- Name: payment payment_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER payment_trigger BEFORE INSERT ON public.payment FOR EACH ROW EXECUTE FUNCTION public.check_order_status();


--
-- Name: payment update_status_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_status_trigger AFTER INSERT ON public.payment FOR EACH ROW EXECUTE FUNCTION public.update_unpaid_status_function();


--
-- Name: bank_transfer bank_transfer_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_transfer
    ADD CONSTRAINT bank_transfer_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: cart cart_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: cart_product cart_product_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);


--
-- Name: cart_product cart_product_product_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);


--
-- Name: credit_card credit_card_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card
    ADD CONSTRAINT credit_card_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: e_wallet e_wallet_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e_wallet
    ADD CONSTRAINT e_wallet_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: payment payment_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);


--
-- PostgreSQL database dump complete
--

