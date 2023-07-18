--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availability (
    book_id integer NOT NULL,
    is_avail character varying(20)
);


ALTER TABLE public.availability OWNER TO postgres;

--
-- Name: book_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_information (
    book_id integer NOT NULL,
    book_title character varying(255),
    jenis_buku character varying(100),
    book_price character varying(50)
);


ALTER TABLE public.book_information OWNER TO postgres;

--
-- Data for Name: availability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.availability (book_id, is_avail) FROM stdin;
1	In stock
2	In stock
3	In stock
4	In stock
5	In stock
6	In stock
7	In stock
8	In stock
9	In stock
10	In stock
11	In stock
12	In stock
13	In stock
14	In stock
15	In stock
16	In stock
17	In stock
18	In stock
19	In stock
20	In stock
21	In stock
22	In stock
23	In stock
24	In stock
25	In stock
26	In stock
27	In stock
28	In stock
29	In stock
30	In stock
31	In stock
32	In stock
33	In stock
34	In stock
35	In stock
36	In stock
37	In stock
38	In stock
39	In stock
40	In stock
41	In stock
42	In stock
43	In stock
44	In stock
45	In stock
46	In stock
47	In stock
\.


--
-- Data for Name: book_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_information (book_id, book_title, jenis_buku, book_price) FROM stdin;
1	It's Only the Himalayas	Travel	œ45.17
2	Full Moon over Noah's ...	Travel	œ49.43
3	See America: A Celebration ...	Travel	œ48.87
4	Vagabonding: An Uncommon Guide ...	Travel	œ36.94
5	Under the Tuscan Sun	Travel	œ37.33
6	A Summer In Europe	Travel	œ44.34
7	The Great Railway Bazaar	Travel	œ30.54
8	A Year in Provence ...	Travel	œ56.88
9	The Road to Little ...	Travel	œ23.21
10	Neither Here nor There: ...	Travel	œ38.95
11	"1000 Places to See ..."	Travel	œ26.08
12	The Mysterious Affair at ...	Misteri	œ24.80
13	In the Woods (Dublin ...	Misteri	œ38.38
14	The Silkworm (Cormoran Strike ...	Misteri	œ23.05
15	The Exiled	Misteri	œ43.45
16	The Cuckoo's Calling (Cormoran ...	Misteri	œ19.21
17	Extreme Prey (Lucas Davenport ...	Misteri	œ25.40
18	Career of Evil (Cormoran ...	Misteri	œ24.72
19	The No. 1 Ladies' ...	Misteri	œ57.70
20	The Girl You Lost	Misteri	œ12.29
21	The Girl In The ...	Misteri	œ15.85
22	Blood Defense (Samantha Brinkman ...	Misteri	œ20.30
23	1st to Die (Women's ...	Misteri	œ53.98
24	The Mysterious Affair at ...	Misteri	œ24.80
25	In the Woods (Dublin ...	Misteri	œ38.38
26	The Silkworm (Cormoran Strike ...	Misteri	œ23.05
27	The Exiled	Misteri	œ43.45
28	The Cuckoo's Calling (Cormoran ...	Misteri	œ19.21
29	Extreme Prey (Lucas Davenport ...	Misteri	œ25.40
30	Career of Evil (Cormoran ...	Misteri	œ24.72
31	The No. 1 Ladies' ...	Misteri	œ57.70
32	The Girl You Lost	Misteri	œ12.29
33	The Girl In The ...	Misteri	œ15.85
34	Blood Defense (Samantha Brinkman ...	Misteri	œ20.30
35	1st to Die (Women's ...	Misteri	œ53.98
36	The Mysterious Affair at ...	Misteri	œ24.80
37	In the Woods (Dublin ...	Misteri	œ38.38
38	The Silkworm (Cormoran Strike ...	Misteri	œ23.05
39	The Exiled	Misteri	œ43.45
40	The Cuckoo's Calling (Cormoran ...	Misteri	œ19.21
41	Extreme Prey (Lucas Davenport ...	Misteri	œ25.40
42	Career of Evil (Cormoran ...	Misteri	œ24.72
43	The No. 1 Ladies' ...	Misteri	œ57.70
44	The Girl You Lost	Misteri	œ12.29
45	The Girl In The ...	Misteri	œ15.85
46	Blood Defense (Samantha Brinkman ...	Misteri	œ20.30
47	1st to Die (Women's ...	Misteri	œ53.98
\.


--
-- Name: availability availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT availability_pkey PRIMARY KEY (book_id);


--
-- Name: book_information book_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_information
    ADD CONSTRAINT book_information_pkey PRIMARY KEY (book_id);


--
-- Name: availability fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.book_information(book_id);


--
-- PostgreSQL database dump complete
--

