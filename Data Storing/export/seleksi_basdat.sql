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

