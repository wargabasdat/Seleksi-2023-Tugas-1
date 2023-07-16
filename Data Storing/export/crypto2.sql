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

--
-- Name: check_ownership(); Type: FUNCTION; Schema: public; 
--

CREATE FUNCTION public.check_ownership() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM wallet w
        WHERE w.user_id = (
            SELECT t.user_id
            FROM transaction t
            WHERE t.transaction_id = NEW.transaction_id
        )
        AND w.wallet_id = NEW.wallet_id
    ) THEN
        RAISE EXCEPTION 'Invalid ownership: wallet is not owned by the user.';
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_ownership();

--
-- Name: check_transaction_amount(); Type: FUNCTION; Schema: public; 
--

CREATE FUNCTION public.check_transaction_amount() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.amount > (
        SELECT balance
        FROM wallet
        WHERE wallet.user_id = NEW.user_id
    ) THEN
        RAISE EXCEPTION 'Invalid transaction amount: amount exceeds wallet balance.';
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_transaction_amount();

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: crypto_currencies; Type: TABLE; Schema: public; 
--

CREATE TABLE public.crypto_currencies (
    symbol character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    market_cap double precision,
    circulating_supply double precision
);


ALTER TABLE public.crypto_currencies;

--
-- Name: price_data; Type: TABLE; Schema: public; 
--

CREATE TABLE public.price_data (
    symbol character varying(255) NOT NULL,
    price double precision NOT NULL,
    change double precision NOT NULL,
    per_change double precision NOT NULL
);


ALTER TABLE public.price_data;

--
-- Name: transaction; Type: TABLE; Schema: public; 
--

CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    user_id integer NOT NULL,
    crypto_symbol character varying(255) NOT NULL,
    transaction_time timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.transaction;

--
-- Name: transaction_history; Type: TABLE; Schema: public; 
--

CREATE TABLE public.transaction_history (
    transaction_id integer NOT NULL,
    wallet_id integer NOT NULL
);


ALTER TABLE public.transaction_history;

--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_transaction_id_seq;

--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;


--
-- Name: users; Type: TABLE; Schema: public; 
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: volume_data; Type: TABLE; Schema: public; 
--

CREATE TABLE public.volume_data (
    symbol character varying(255) NOT NULL,
    volume double precision
);


ALTER TABLE public.volume_data;

--
-- Name: wallet; Type: TABLE; Schema: public; 
--

CREATE TABLE public.wallet (
    wallet_id integer NOT NULL,
    user_id integer,
    balance double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.wallet;

--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.wallet_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_wallet_id_seq;

--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
--

ALTER SEQUENCE public.wallet_wallet_id_seq OWNED BY public.wallet.wallet_id;


--
-- Name: transaction transaction_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: wallet wallet_id; Type: DEFAULT; Schema: public; 
--

ALTER TABLE ONLY public.wallet ALTER COLUMN wallet_id SET DEFAULT nextval('public.wallet_wallet_id_seq'::regclass);


--
-- Data for Name: crypto_currencies; Type: TABLE DATA; Schema: public; 
--

COPY public.crypto_currencies (symbol, name, market_cap, circulating_supply) FROM stdin;
BTC-USD	Bitcoin USD	588893	19.43
ETH-USD	Ethereum USD	232343	120.202
USDT-USD	Tether USD	83637	83614
BNB-USD	BNB USD	39029	155.849
XRP-USD	XRP USD	37264	52544
USDC-USD	USD Coin USD	27281	27282
STETH-USD	Lido Staked ETH USD	14886	7.727
ADA-USD	Cardano USD	11533	34976
SOL-USD	Solana USD	11152	402.546
DOGE-USD	Dogecoin USD	10218	140185
WTRX-USD	Wrapped TRON USD	8212	101676
MATIC-USD	Polygon USD	7501	9319
TRX-USD	TRON USD	7239	89779
LTC-USD	Litecoin USD	6939	73.368
DOT-USD	Polkadot USD	6305	1204
WKAVA-USD	Wrapped Kava USD	5249	497.669
AVAX-USD	Avalanche USD	5224	345.851
BCH-USD	Bitcoin Cash USD	4928	19.449
WBTC-USD	Wrapped Bitcoin USD	4787	\N
DAI-USD	Dai USD	4663	4666
TON11419-USD	Toncoin USD	4632	3432
SHIB-USD	Shiba Inu USD	4431	589347000
BUSD-USD	Binance USD USD	3988	3988
LINK-USD	Chainlink USD	3760	538.1
LEO-USD	UNUS SED LEO USD	3712	929.842
UNI7083-USD	Uniswap USD	3086	577.501
XMR-USD	Monero USD	3021	18.305
TUSD-USD	TrueUSD USD	2844	2845
ETC-USD	Ethereum Classic USD	2747	141.97
OKB-USD	OKB USD	2616	60
CNX-USD	Cryptonex USD	2407	107.405
FGC-USD	FantasyGold USD	2113	139.66
FIL-USD	Filecoin USD	1927	436.472
ICP-USD	Internet Computer USD	1829	438.352
HEX-USD	HEX USD	1780	173411
HBAR-USD	Hedera USD	1677	32287.999999999996
LDO-USD	Lido DAO USD	1673	878.74
WHBAR-USD	Wrapped HBAR USD	1672	32287.999999999996
BTCB-USD	Bitcoin BEP2 USD	1630	\N
ARB11841-USD	Arbitrum USD	1611	1275
APT21794-USD	Aptos USD	1606	215.606
CRO-USD	Cronos USD	1526	25263
VET-USD	VeChain USD	1430	72715
NEAR-USD	NEAR Protocol USD	1392	936.797
QNT-USD	Quant USD	1227	12.073
AAVE-USD	Aave USD	1093	14.473
GRT6719-USD	The Graph USD	1067	9075
FRAX-USD	Frax USD	1002.9999999999999	1004
XLM-USD	Stellar USD	3496	1844
OP-USD	Optimism USD	943.467	644.595
EGLD-USD	MultiversX USD	904.909	25.691
STX4847-USD	Stacks USD	896.873	1391
ALGO-USD	Algorand USD	874.07	7711
MKR-USD	Maker USD	864.87	\N
EOS-USD	EOS USD	846.001	1097
XTZ-USD	Tezos USD	834.564	945.206
WEOS-USD	Wrapped EOS USD	825.697	1097
IMX10603-USD	Immutable USD	808.244	1082
THETA-USD	Theta Network USD	798.853	1000
SAND-USD	The Sandbox USD	793.979	1870
MANA-USD	Decentraland USD	789.486	1893
FTM-USD	Fantom USD	769.511	2799
RNDR-USD	Render Token USD	743.594	368.853
USDD-USD	USDD USD	739.795	740.36
AXS-USD	Axie Infinity USD	730.132	119.285
SNX-USD	Synthetix USD	726.262	267.073
BSV-USD	Bitcoin SV USD	721.573	19.266
RPL-USD	Rocket Pool USD	715.517	19.547
APE18876-USD	ApeCoin USD	688.493	368.594
CRV-USD	Curve DAO Token USD	687.936	868.621
BGB-USD	Bitget Token USD	661.188	1400
NEO-USD	Neo USD	657.836	70.539
XRD-USD	Radix USD	653.977	10213
BIT11221-USD	BitDAO USD	960.013	1844
XEC-USD	eCash USD	640.372	19442000
FLOW-USD	Flow USD	628.756	1036
TNC5524-USD	TNC Coin USD	613.605	5851
USDP-USD	Pax Dollar USD	613.835	616.553
KCS-USD	KuCoin Token USD	594.656	96.794
COMP5692-USD	Compound USD	591.123	7.76
KAVA-USD	Kava USD	587.825	630.324
CFX-USD	Conflux USD	581.99	3071
CHZ-USD	Chiliz USD	580.668	7105
WBNB-USD	Wrapped BNB USD	565.697	2.3
GUSD-USD	Gemini Dollar USD	559.667	564.428
KLAY-USD	Klaytn USD	543.158	3144
KAS-USD	Kaspa USD	539.743	19650
MIOTA-USD	IOTA USD	530.257	2780
GALA-USD	Gala USD	526.37	21624
FTT-USD	FTX Token USD	523.516	328.895
ZEC-USD	Zcash USD	516.21	16.328
GMX11857-USD	GMX USD	508.625	8.873
LUNC-USD	Terra Classic USD	499.69	5819000
PAXG-USD	PAX Gold USD	492.157	\N
XAUT-USD	Tether Gold USD	481.805	\N
FXS-USD	Frax Share USD	458.342	72.884
BTTOLD-USD	BitTorrent USD	456.93	990000
\.


--
-- Data for Name: price_data; Type: TABLE DATA; Schema: public; 
--

COPY public.price_data (symbol, price, change, per_change) FROM stdin;
BTC-USD	30308.38	-624.78	-2.02
ETH-USD	1932.94	-38.07	-1.93
USDT-USD	1.0003	-0.0002	-0.02
BNB-USD	250.43	-2.13	-0.84
XRP-USD	0.709199	-0.01576	-2.17
USDC-USD	0.99996	-0.000192	-0.02
STETH-USD	1926.48	-42.76	-2.17
ADA-USD	0.329745	-0.005925	-1.77
SOL-USD	27.7	0.47	1.73
DOGE-USD	0.072887	0.00226	3.2
WTRX-USD	0.080763	-6.6e-05	-0.08
MATIC-USD	0.804844	-0.018188	-2.21
TRX-USD	0.080635	5.8e-05	0.07
LTC-USD	94.58	-3.74	-3.81
DOT-USD	5.2356	-0.0219	-0.42
WKAVA-USD	10.55	2.24	26.98
AVAX-USD	15.1	-0.57	-3.65
BCH-USD	253.37	-11.62	-4.38
WBTC-USD	30299.55	-664.25	-2.15
DAI-USD	0.999559	0.000988	0.1
TON11419-USD	1.3498	-0.0096	-0.71
SHIB-USD	7.52e-06	-2e-08	-0.3
BUSD-USD	0.999944	-0.000182	-0.02
LINK-USD	6.988	-0.0067	-0.1
LEO-USD	3.9917	0.0264	0.67
UNI7083-USD	5.3433	-0.0042	-0.08
XMR-USD	165.05	3.81	2.36
TUSD-USD	0.999853	0.000268	0.03
ETC-USD	19.35	-0.21	-1.07
OKB-USD	43.59	-0.65	-1.46
CNX-USD	22.41	-0.45	-1.99
FGC-USD	15.13	-5.2	-25.57
FIL-USD	4.4159	-0.1538	-3.3663
ICP-USD	4.1729	0.0021	0.05
HEX-USD	0.0103	-0.0009	-8.1553
HBAR-USD	0.0519	-0.0009	-1.6953
LDO-USD	1.9044	-0.0162	-0.85
WHBAR-USD	0.051786	-0.000916	-1.74
BTCB-USD	30292.28	-647.14	-2.09
ARB11841-USD	1.2637	-0.0121	-0.95
APT21794-USD	7.4476	-0.1201	-1.59
CRO-USD	0.0604	0.0001	0.1841
VET-USD	0.0197	-0.0002	-1.1573
NEAR-USD	1.4863	-0.0698	-4.49
QNT-USD	101.63	-2.47	-2.37
AAVE-USD	75.54	-1.06	-1.39
GRT6719-USD	0.117568	0.000653	0.56
FRAX-USD	0.998758	-0.000536	-0.05
XLM-USD	0.1288	-0.0021	-1.5845
OP-USD	1.4637	-0.0378	-2.52
EGLD-USD	35.22	-0.38	-1.07
STX4847-USD	0.64457	-0.043139	-6.27
ALGO-USD	0.113355	-0.003884	-3.31
MKR-USD	884.66	-13.7	-1.53
EOS-USD	0.771298	-0.023355	-2.94
XTZ-USD	0.882944	-0.009131	-1.02
WEOS-USD	0.752788	-0.012127	-1.59
IMX10603-USD	0.747068	-0.030729	-3.95
THETA-USD	0.798853	-0.021704	-2.65
SAND-USD	0.424649	-0.005623	-1.31
MANA-USD	0.417034	-0.010266	-2.4
FTM-USD	0.274912	-0.014926	-5.15
RNDR-USD	2.016	-0.0781	-3.73
USDD-USD	0.999238	-2.7e-05	0
AXS-USD	6.1209	0.1164	1.94
SNX-USD	2.7193	-0.168	-5.82
BSV-USD	37.45	0.44	1.2
RPL-USD	36.6	-1.48	-3.88
APE18876-USD	1.8679	-0.0442	-2.31
CRV-USD	0.791987	-0.009138	-1.14
BGB-USD	0.472277	-0.01061	-2.2
NEO-USD	9.3259	-0.1496	-1.58
XRD-USD	0.064035	-0.006316	-8.98
BIT11221-USD	0.520708	-0.000558	-0.11
XEC-USD	3.3e-05	-1e-06	-2.97
FLOW-USD	0.60679	-0.032691	-5.11
TNC5524-USD	0.104868	-0.000745	-0.71
USDP-USD	0.995592	-0.001208	-0.12
KCS-USD	6.1435	-0.0698	-1.12
COMP5692-USD	76.17	6.76	9.73
KAVA-USD	0.932576	-0.0203	-2.13
CFX-USD	0.189533	-0.011813	-5.87
CHZ-USD	0.08173	-0.000346	-0.42
WBNB-USD	245.98	-1.46	-0.59
GUSD-USD	0.991564	-0.001285	-0.13
KLAY-USD	0.172737	-0.00223	-1.27
KAS-USD	0.027468	-0.001083	-3.79
MIOTA-USD	0.190772	1.9e-05	0.01
GALA-USD	0.024342	-0.000445	-1.79
FTT-USD	1.5917	-0.0033	-0.21
ZEC-USD	31.61	-0.72	-2.22
GMX11857-USD	57.32	-2.57	-4.29
LUNC-USD	8.6e-05	-2e-06	-2.13
PAXG-USD	1947.43	22.7	1.18
XAUT-USD	1954.39	-1.77	-0.09
FXS-USD	6.2887	-0.0531	-0.84
BTTOLD-USD	0.000462	-1e-05	-2.05
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; 
--

COPY public.transaction (transaction_id, user_id, crypto_symbol, transaction_time, status, amount) FROM stdin;
\.


--
-- Data for Name: transaction_history; Type: TABLE DATA; Schema: public; 
--

COPY public.transaction_history (transaction_id, wallet_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; 
--

COPY public.users (user_id, username, email, password) FROM stdin;
\.


--
-- Data for Name: volume_data; Type: TABLE DATA; Schema: public; 
--

COPY public.volume_data (symbol, volume) FROM stdin;
BTC-USD	14738
ETH-USD	7389
USDT-USD	28747
BNB-USD	535.403
XRP-USD	4657
USDC-USD	3384
STETH-USD	13.672
ADA-USD	394.988
SOL-USD	1586
DOGE-USD	959.055
WTRX-USD	1.061
MATIC-USD	365.29
TRX-USD	206.14
LTC-USD	714.813
DOT-USD	98.532
WKAVA-USD	\N
AVAX-USD	327.549
BCH-USD	481.154
WBTC-USD	119.597
DAI-USD	98.419
TON11419-USD	8.379
SHIB-USD	74.179
BUSD-USD	1884
LINK-USD	240.012
LEO-USD	\N
UNI7083-USD	51.28
XMR-USD	68.799
TUSD-USD	1616
ETC-USD	198.326
OKB-USD	2.274
CNX-USD	1.847
FGC-USD	\N
FIL-USD	167.643
ICP-USD	13.704
HEX-USD	1.562
HBAR-USD	35.051
LDO-USD	17.605
WHBAR-USD	\N
BTCB-USD	16.527
ARB11841-USD	558.538
APT21794-USD	165.44
CRO-USD	12.615
VET-USD	41.722
NEAR-USD	78.556
QNT-USD	18.403
AAVE-USD	83.582
GRT6719-USD	29.424
FRAX-USD	5.141
XLM-USD	259.258
OP-USD	293.337
EGLD-USD	10.46
STX4847-USD	46.725
ALGO-USD	69.846
MKR-USD	54.078
EOS-USD	178.618
XTZ-USD	18.385
WEOS-USD	\N
IMX10603-USD	17.823
THETA-USD	18.867
SAND-USD	43.859
MANA-USD	58.759
FTM-USD	125.761
RNDR-USD	45.231
USDD-USD	16.526
AXS-USD	38.784
SNX-USD	198.496
BSV-USD	58.147
RPL-USD	4.601
APE18876-USD	54.364
CRV-USD	24.38
BGB-USD	13.174
NEO-USD	36.143
XRD-USD	4.533
BIT11221-USD	33.335
XEC-USD	37.645
FLOW-USD	35.716
TNC5524-USD	\N
USDP-USD	1.316
KCS-USD	1.786
COMP5692-USD	244.943
KAVA-USD	25.545
CFX-USD	47.133
CHZ-USD	34.643
WBNB-USD	66.901
GUSD-USD	1.043
KLAY-USD	14.996
KAS-USD	16.063
MIOTA-USD	12.217
GALA-USD	39.293
FTT-USD	27.81
ZEC-USD	25.453
GMX11857-USD	17.696
LUNC-USD	35.283
PAXG-USD	10.17
XAUT-USD	4.653
FXS-USD	15.078
BTTOLD-USD	\N
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; 
--

COPY public.wallet (wallet_id, user_id, balance) FROM stdin;
\.


--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE SET; Schema: public; 
--

SELECT pg_catalog.setval('public.wallet_wallet_id_seq', 1, false);


--
-- Name: crypto_currencies crypto_currencies_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.crypto_currencies
    ADD CONSTRAINT crypto_currencies_pkey PRIMARY KEY (symbol);


--
-- Name: price_data price_data_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.price_data
    ADD CONSTRAINT price_data_pkey PRIMARY KEY (symbol);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: volume_data volume_data_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.volume_data
    ADD CONSTRAINT volume_data_pkey PRIMARY KEY (symbol);


--
-- Name: wallet wallet_pkey; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (wallet_id);


--
-- Name: transaction check_transaction_amount_trigger; Type: TRIGGER; Schema: public; 
--

CREATE TRIGGER check_transaction_amount_trigger BEFORE INSERT OR UPDATE ON public.transaction FOR EACH ROW EXECUTE FUNCTION public.check_transaction_amount();


--
-- Name: transaction_history transaction_history_check_ownership; Type: TRIGGER; Schema: public; 
--

CREATE TRIGGER transaction_history_check_ownership BEFORE INSERT OR UPDATE ON public.transaction_history FOR EACH ROW EXECUTE FUNCTION public.check_ownership();


--
-- Name: price_data price_data_symbol_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.price_data
    ADD CONSTRAINT price_data_symbol_fkey FOREIGN KEY (symbol) REFERENCES public.crypto_currencies(symbol);


--
-- Name: transaction transaction_crypto_symbol_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_crypto_symbol_fkey FOREIGN KEY (crypto_symbol) REFERENCES public.crypto_currencies(symbol);


--
-- Name: transaction_history transaction_history_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.transaction_history
    ADD CONSTRAINT transaction_history_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id);


--
-- Name: transaction_history transaction_history_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.transaction_history
    ADD CONSTRAINT transaction_history_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallet(wallet_id);


--
-- Name: transaction transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: volume_data volume_data_symbol_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.volume_data
    ADD CONSTRAINT volume_data_symbol_fkey FOREIGN KEY (symbol) REFERENCES public.crypto_currencies(symbol);


--
-- Name: wallet wallet_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

