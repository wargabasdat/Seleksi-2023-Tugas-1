--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

-- Started on 2023-07-19 18:55:49

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 34001)
-- Name: character_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_materials (
    character_name character varying NOT NULL,
    material_name character varying NOT NULL
);


ALTER TABLE public.character_materials OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33981)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    name character varying NOT NULL,
    rarity character varying NOT NULL,
    element character varying NOT NULL,
    path character varying NOT NULL,
    hp integer NOT NULL,
    atk integer NOT NULL,
    def integer NOT NULL,
    speed integer NOT NULL,
    taunt integer NOT NULL,
    CONSTRAINT characters_check_atk CHECK ((atk >= 0)),
    CONSTRAINT characters_check_def CHECK ((def >= 0)),
    CONSTRAINT characters_check_hp CHECK ((hp >= 0)),
    CONSTRAINT characters_check_speed CHECK ((speed >= 0)),
    CONSTRAINT characters_check_taunt CHECK ((taunt >= 0))
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33958)
-- Name: elements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elements (
    name character varying(20) NOT NULL,
    effect character varying(100)
);


ALTER TABLE public.elements OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33968)
-- Name: light_cones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.light_cones (
    name character varying NOT NULL,
    rarity character varying(6) NOT NULL,
    path character varying(20) NOT NULL,
    hp integer NOT NULL,
    atk integer NOT NULL,
    def integer NOT NULL,
    CONSTRAINT light_cones_check_atk CHECK ((atk >= 0)),
    CONSTRAINT light_cones_check_def CHECK ((def >= 0)),
    CONSTRAINT light_cones_check_hp CHECK ((hp >= 0))
);


ALTER TABLE public.light_cones OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33963)
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    name character varying NOT NULL,
    source character varying
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33953)
-- Name: paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paths (
    name character varying(20) NOT NULL,
    description character varying(100)
);


ALTER TABLE public.paths OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 34016)
-- Name: prefered_pairs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prefered_pairs (
    character_name character varying NOT NULL,
    light_cone_name character varying NOT NULL
);


ALTER TABLE public.prefered_pairs OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 34001)
-- Dependencies: 215
-- Data for Name: character_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.character_materials VALUES ('March 7th', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('March 7th', 'Endurance of Bronze');
INSERT INTO public.character_materials VALUES ('March 7th', 'Horn of Snow');
INSERT INTO public.character_materials VALUES ('March 7th', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Trailblazer (Physical)', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('Trailblazer (Physical)', 'Shattered Blade');
INSERT INTO public.character_materials VALUES ('Trailblazer (Physical)', 'Enigmatic Ectostella');
INSERT INTO public.character_materials VALUES ('Trailblazer (Physical)', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Dan Heng', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Dan Heng', 'Arrow of the Beast Hunter');
INSERT INTO public.character_materials VALUES ('Dan Heng', 'Storm Eye');
INSERT INTO public.character_materials VALUES ('Dan Heng', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Himeko', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Himeko', 'Key of Inspiration');
INSERT INTO public.character_materials VALUES ('Himeko', 'Endotherm Chitin');
INSERT INTO public.character_materials VALUES ('Himeko', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Asta', 'Silvermane Badge');
INSERT INTO public.character_materials VALUES ('Asta', 'Harmonic Tune');
INSERT INTO public.character_materials VALUES ('Asta', 'Endotherm Chitin');
INSERT INTO public.character_materials VALUES ('Asta', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Arlan', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Arlan', 'Shattered Blade');
INSERT INTO public.character_materials VALUES ('Arlan', 'Lightning Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Arlan', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Seele', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('Seele', 'Arrow of the Beast Hunter');
INSERT INTO public.character_materials VALUES ('Seele', 'Void Cast Iron');
INSERT INTO public.character_materials VALUES ('Seele', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Natasha', 'Ancient Part');
INSERT INTO public.character_materials VALUES ('Natasha', 'Seed of Abundance');
INSERT INTO public.character_materials VALUES ('Natasha', 'Broken Teeth of Iron Wolf');
INSERT INTO public.character_materials VALUES ('Natasha', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Pela', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Pela', 'Obsidian of Dread');
INSERT INTO public.character_materials VALUES ('Pela', 'Horn of Snow');
INSERT INTO public.character_materials VALUES ('Pela', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Hook', 'Ancient Part');
INSERT INTO public.character_materials VALUES ('Hook', 'Shattered Blade');
INSERT INTO public.character_materials VALUES ('Hook', 'Endotherm Chitin');
INSERT INTO public.character_materials VALUES ('Hook', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Serval', 'Silvermane Badge');
INSERT INTO public.character_materials VALUES ('Serval', 'Key of Inspiration');
INSERT INTO public.character_materials VALUES ('Serval', 'Lightning Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Serval', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Qingque', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('Qingque', 'Key of Inspiration');
INSERT INTO public.character_materials VALUES ('Qingque', 'Void Cast Iron');
INSERT INTO public.character_materials VALUES ('Qingque', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Herta', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Herta', 'Key of Inspiration');
INSERT INTO public.character_materials VALUES ('Herta', 'Horn of Snow');
INSERT INTO public.character_materials VALUES ('Herta', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Tingyun', 'Immortal Scionette');
INSERT INTO public.character_materials VALUES ('Tingyun', 'Harmonic Tune');
INSERT INTO public.character_materials VALUES ('Tingyun', 'Lightning Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Tingyun', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Sushang', 'Module Machina');
INSERT INTO public.character_materials VALUES ('Sushang', 'Arrow of the Beast Hunter');
INSERT INTO public.character_materials VALUES ('Sushang', 'Broken Teeth of Iron Wolf');
INSERT INTO public.character_materials VALUES ('Sushang', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Clara', 'Ancient Part');
INSERT INTO public.character_materials VALUES ('Clara', 'Shattered Blade');
INSERT INTO public.character_materials VALUES ('Clara', 'Broken Teeth of Iron Wolf');
INSERT INTO public.character_materials VALUES ('Clara', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Bronya', 'Silvermane Badge');
INSERT INTO public.character_materials VALUES ('Bronya', 'Harmonic Tune');
INSERT INTO public.character_materials VALUES ('Bronya', 'Storm Eye');
INSERT INTO public.character_materials VALUES ('Bronya', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Gepard', 'Silvermane Badge');
INSERT INTO public.character_materials VALUES ('Gepard', 'Endurance of Bronze');
INSERT INTO public.character_materials VALUES ('Gepard', 'Horn of Snow');
INSERT INTO public.character_materials VALUES ('Gepard', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Bailu', 'Extinguished Core');
INSERT INTO public.character_materials VALUES ('Bailu', 'Seed of Abundance');
INSERT INTO public.character_materials VALUES ('Bailu', 'Lightning Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Bailu', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Yanqing', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('Yanqing', 'Arrow of the Beast Hunter');
INSERT INTO public.character_materials VALUES ('Yanqing', 'Gelid Chitin');
INSERT INTO public.character_materials VALUES ('Yanqing', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Welt', 'Silvermane Badge');
INSERT INTO public.character_materials VALUES ('Welt', 'Obsidian of Dread');
INSERT INTO public.character_materials VALUES ('Welt', 'Golden Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Welt', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Sampo', 'Ancient Part');
INSERT INTO public.character_materials VALUES ('Sampo', 'Obsidian of Dread');
INSERT INTO public.character_materials VALUES ('Sampo', 'Storm Eye');
INSERT INTO public.character_materials VALUES ('Sampo', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Trailblazer (Fire)', 'Thief''s Instinct');
INSERT INTO public.character_materials VALUES ('Trailblazer (Fire)', 'Endurance of Bronze');
INSERT INTO public.character_materials VALUES ('Trailblazer (Fire)', 'Enigmatic Ectostella');
INSERT INTO public.character_materials VALUES ('Trailblazer (Fire)', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Jing Yuan', 'Immortal Scionette');
INSERT INTO public.character_materials VALUES ('Jing Yuan', 'Key of Inspiration');
INSERT INTO public.character_materials VALUES ('Jing Yuan', 'Shape Shifter''s Lightning Staff');
INSERT INTO public.character_materials VALUES ('Jing Yuan', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Silver Wolf', 'Ancient Part');
INSERT INTO public.character_materials VALUES ('Silver Wolf', 'Obsidian of Dread');
INSERT INTO public.character_materials VALUES ('Silver Wolf', 'Void Cast Iron');
INSERT INTO public.character_materials VALUES ('Silver Wolf', 'Destroyer''s Final Road');
INSERT INTO public.character_materials VALUES ('Luocha', 'Seed of Abundance');
INSERT INTO public.character_materials VALUES ('Luocha', 'Artifex''s Module');
INSERT INTO public.character_materials VALUES ('Luocha', 'Golden Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Luocha', 'Guardian''s Lament');
INSERT INTO public.character_materials VALUES ('Yukong', 'Harmonic Tune');
INSERT INTO public.character_materials VALUES ('Yukong', 'Artifex''s Module');
INSERT INTO public.character_materials VALUES ('Yukong', 'Golden Crown of the Past Shadow');
INSERT INTO public.character_materials VALUES ('Yukong', 'Destroyer''s Final Road');


--
-- TOC entry 3360 (class 0 OID 33981)
-- Dependencies: 214
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.characters VALUES ('March 7th', '4 star', 'Ice', 'The Preservation', 1058, 511, 573, 101, 150);
INSERT INTO public.characters VALUES ('Trailblazer (Physical)', '5 star', 'Physical', 'The Destruction', 1203, 620, 460, 100, 125);
INSERT INTO public.characters VALUES ('Dan Heng', '4 star', 'Wind', 'The Hunt', 882, 546, 396, 110, 75);
INSERT INTO public.characters VALUES ('Himeko', '5 star', 'Fire', 'The Erudition', 1047, 756, 436, 96, 75);
INSERT INTO public.characters VALUES ('Asta', '4 star', 'Fire', 'The Harmony', 1023, 511, 463, 106, 100);
INSERT INTO public.characters VALUES ('Arlan', '4 star', 'Lightning', 'The Destruction', 1199, 599, 330, 102, 125);
INSERT INTO public.characters VALUES ('Seele', '5 star', 'Quantum', 'The Hunt', 931, 640, 363, 115, 75);
INSERT INTO public.characters VALUES ('Natasha', '4 star', 'Physical', 'The Abundance', 1164, 476, 507, 98, 100);
INSERT INTO public.characters VALUES ('Pela', '4 star', 'Ice', 'The Nihility', 987, 546, 463, 105, 100);
INSERT INTO public.characters VALUES ('Hook', '4 star', 'Fire', 'The Destruction', 1340, 617, 352, 94, 125);
INSERT INTO public.characters VALUES ('Serval', '4 star', 'Lightning', 'The Erudition', 917, 652, 374, 104, 75);
INSERT INTO public.characters VALUES ('Qingque', '4 star', 'Quantum', 'The Erudition', 1023, 652, 441, 98, 75);
INSERT INTO public.characters VALUES ('Herta', '4 star', 'Ice', 'The Erudition', 952, 582, 396, 100, 75);
INSERT INTO public.characters VALUES ('Tingyun', '4 star', 'Lightning', 'The Harmony', 846, 529, 396, 112, 100);
INSERT INTO public.characters VALUES ('Sushang', '4 star', 'Physical', 'The Hunt', 917, 564, 418, 107, 75);
INSERT INTO public.characters VALUES ('Clara', '5 star', 'Physical', 'The Destruction', 1241, 737, 485, 90, 125);
INSERT INTO public.characters VALUES ('Bronya', '5 star', 'Wind', 'The Harmony', 1241, 582, 533, 99, 100);
INSERT INTO public.characters VALUES ('Gepard', '5 star', 'Ice', 'The Preservation', 1397, 543, 654, 92, 150);
INSERT INTO public.characters VALUES ('Bailu', '5 star', 'Lightning', 'The Abundance', 1319, 562, 485, 98, 100);
INSERT INTO public.characters VALUES ('Yanqing', '5 star', 'Ice', 'The Hunt', 892, 679, 412, 109, 75);
INSERT INTO public.characters VALUES ('Welt', '5 star', 'Imaginary', 'The Nihility', 1125, 620, 509, 102, 100);
INSERT INTO public.characters VALUES ('Sampo', '4 star', 'Wind', 'The Nihility', 1023, 617, 396, 102, 100);
INSERT INTO public.characters VALUES ('Trailblazer (Fire)', '5 star', 'Fire', 'The Preservation', 1241, 601, 606, 95, 150);
INSERT INTO public.characters VALUES ('Jing Yuan', '5 star', 'Lightning', 'The Erudition', 1164, 698, 485, 99, 75);
INSERT INTO public.characters VALUES ('Silver Wolf', '5 star', 'Quantum', 'The Nihility', 1047, 640, 460, 107, 100);
INSERT INTO public.characters VALUES ('Luocha', '5 star', 'Imaginary', 'The Abundance', 1280, 756, 363, 101, 100);
INSERT INTO public.characters VALUES ('Yukong', '4 star', 'Imaginary', 'The Harmony', 917, 599, 374, 107, 100);


--
-- TOC entry 3357 (class 0 OID 33958)
-- Dependencies: 211
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.elements VALUES ('Fire', NULL);
INSERT INTO public.elements VALUES ('Ice', NULL);
INSERT INTO public.elements VALUES ('Imaginary', NULL);
INSERT INTO public.elements VALUES ('Lightning', NULL);
INSERT INTO public.elements VALUES ('Physical', NULL);
INSERT INTO public.elements VALUES ('Quantum', NULL);
INSERT INTO public.elements VALUES ('Wind', NULL);


--
-- TOC entry 3359 (class 0 OID 33968)
-- Dependencies: 213
-- Data for Name: light_cones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.light_cones VALUES ('Before Dawn', '5 star', 'The Erudition', 1058, 582, 463);
INSERT INTO public.light_cones VALUES ('Cruising in the Stellar Sea', '5 star', 'The Hunt', 952, 529, 463);
INSERT INTO public.light_cones VALUES ('Echoes of the Coffin', '5 star', 'The Abundance', 1164, 582, 396);
INSERT INTO public.light_cones VALUES ('In the Name of the World', '5 star', 'The Nihility', 1058, 582, 463);
INSERT INTO public.light_cones VALUES ('In the Night', '5 star', 'The Hunt', 1058, 582, 463);
INSERT INTO public.light_cones VALUES ('Incessant Rain', '5 star', 'The Nihility', 1058, 582, 463);
INSERT INTO public.light_cones VALUES ('Moment of Victory', '5 star', 'The Preservation', 1058, 476, 595);
INSERT INTO public.light_cones VALUES ('Night on the Milky Way', '5 star', 'The Erudition', 1164, 582, 396);
INSERT INTO public.light_cones VALUES ('On the Fall of an Aeon', '5 star', 'The Destruction', 1058, 529, 396);
INSERT INTO public.light_cones VALUES ('Sleep Like the Dead', '5 star', 'The Hunt', 1058, 582, 463);
INSERT INTO public.light_cones VALUES ('Something Irreplaceable', '5 star', 'The Destruction', 1164, 582, 396);
INSERT INTO public.light_cones VALUES ('Texture of Memories', '5 star', 'The Preservation', 1058, 423, 529);
INSERT INTO public.light_cones VALUES ('The Battle Isn''t Over', '5 star', 'The Harmony', 1164, 529, 463);
INSERT INTO public.light_cones VALUES ('Time Waits for No One', '5 star', 'The Abundance', 1270, 476, 463);
INSERT INTO public.light_cones VALUES ('A Secret Vow', '4 star', 'The Destruction', 1058, 476, 264);
INSERT INTO public.light_cones VALUES ('Before the Tutorial Mission Starts', '4 star', 'The Nihility', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Carve the Moon, Weave the Clouds', '4 star', 'The Harmony', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Dance! Dance! Dance!', '4 star', 'The Harmony', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Day One of My New Life', '4 star', 'The Preservation', 952, 370, 463);
INSERT INTO public.light_cones VALUES ('Eyes of the Prey', '4 star', 'The Nihility', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Fermata', '4 star', 'The Nihility', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Geniuses'' Repose', '4 star', 'The Erudition', 846, 476, 396);
INSERT INTO public.light_cones VALUES ('Good Night and Sleep Well', '4 star', 'The Nihility', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Landau''s Choice', '4 star', 'The Preservation', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Make the World Clamor', '4 star', 'The Erudition', 846, 476, 396);
INSERT INTO public.light_cones VALUES ('Memories of the Past', '4 star', 'The Harmony', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Nowhere to Run', '4 star', 'The Destruction', 952, 529, 264);
INSERT INTO public.light_cones VALUES ('Only Silence Remains', '4 star', 'The Hunt', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Past and Future', '4 star', 'The Harmony', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Perfect Timing', '4 star', 'The Abundance', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Planetary Rendezvous', '4 star', 'The Harmony', 1058, 423, 330);
INSERT INTO public.light_cones VALUES ('Post-Op Conversation', '4 star', 'The Abundance', 1058, 423, 330);
INSERT INTO public.light_cones VALUES ('Quid Pro Quo', '4 star', 'The Abundance', 952, 423, 396);
INSERT INTO public.light_cones VALUES ('Resolution Shines As Pearls of Sweat', '4 star', 'The Nihility', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Return to Darkness', '4 star', 'The Hunt', 846, 529, 330);
INSERT INTO public.light_cones VALUES ('Shared Feeling', '4 star', 'The Abundance', 952, 426, 396);
INSERT INTO public.light_cones VALUES ('Subscribe for More!', '4 star', 'The Hunt', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Swordplay', '4 star', 'The Hunt', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('The Birth of the Self', '4 star', 'The Erudition', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('The Moles Welcome You', '4 star', 'The Destruction', 1058, 476, 264);
INSERT INTO public.light_cones VALUES ('The Seriousness of Breakfast', '4 star', 'The Erudition', 846, 476, 396);
INSERT INTO public.light_cones VALUES ('This Is Me!', '4 star', 'The Preservation', 846, 370, 529);
INSERT INTO public.light_cones VALUES ('Today is Another Peaceful Day', '4 star', 'The Erudition', 846, 529, 330);
INSERT INTO public.light_cones VALUES ('Warmth Shortens Cold Nights', '4 star', 'The Abundance', 1058, 370, 396);
INSERT INTO public.light_cones VALUES ('We Are Wildfire', '4 star', 'The Preservation', 740, 476, 463);
INSERT INTO public.light_cones VALUES ('We Will Meet Again', '4 star', 'The Nihility', 846, 529, 330);
INSERT INTO public.light_cones VALUES ('Woof! Walk Time!', '4 star', 'The Destruction', 952, 476, 330);
INSERT INTO public.light_cones VALUES ('Adversarial', '3 star', 'The Hunt', 740, 370, 264);
INSERT INTO public.light_cones VALUES ('Amber', '3 star', 'The Preservation', 846, 264, 330);
INSERT INTO public.light_cones VALUES ('Arrows', '3 star', 'The Hunt', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Chorus', '3 star', 'The Harmony', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Collapsing Sky', '3 star', 'The Destruction', 846, 370, 198);
INSERT INTO public.light_cones VALUES ('Cornucopia', '3 star', 'The Abundance', 952, 264, 264);
INSERT INTO public.light_cones VALUES ('Darting Arrow', '3 star', 'The Hunt', 740, 370, 264);
INSERT INTO public.light_cones VALUES ('Data Bank', '3 star', 'The Erudition', 740, 370, 264);
INSERT INTO public.light_cones VALUES ('Defense', '3 star', 'The Preservation', 952, 264, 264);
INSERT INTO public.light_cones VALUES ('Fine Fruit', '3 star', 'The Abundance', 952, 317, 198);
INSERT INTO public.light_cones VALUES ('Hidden Shadow', '3 star', 'The Nihility', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Loop', '3 star', 'The Nihility', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Meditation', '3 star', 'The Harmony', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Meshing Cogs', '3 star', 'The Harmony', 846, 317, 264);
INSERT INTO public.light_cones VALUES ('Multiplication', '3 star', 'The Abundance', 952, 317, 198);
INSERT INTO public.light_cones VALUES ('Mutual Demise', '3 star', 'The Destruction', 846, 370, 198);
INSERT INTO public.light_cones VALUES ('Passkey', '3 star', 'The Erudition', 740, 370, 264);
INSERT INTO public.light_cones VALUES ('Pioneering', '3 star', 'The Preservation', 952, 264, 264);
INSERT INTO public.light_cones VALUES ('Sagacity', '3 star', 'The Erudition', 740, 370, 264);
INSERT INTO public.light_cones VALUES ('Shattered Home', '3 star', 'The Destruction', 846, 370, 198);
INSERT INTO public.light_cones VALUES ('Void', '3 star', 'The Nihility', 846, 317, 264);


--
-- TOC entry 3358 (class 0 OID 33963)
-- Dependencies: 212
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materials VALUES ('Destroyer''s Final Road', NULL);
INSERT INTO public.materials VALUES ('Guardian''s Lament', NULL);
INSERT INTO public.materials VALUES ('Broken Teeth of Iron Wolf', NULL);
INSERT INTO public.materials VALUES ('Endotherm Chitin', NULL);
INSERT INTO public.materials VALUES ('Enigmatic Ectostella', NULL);
INSERT INTO public.materials VALUES ('Gelid Chitin', NULL);
INSERT INTO public.materials VALUES ('Golden Crown of the Past Shadow', NULL);
INSERT INTO public.materials VALUES ('Horn of Snow', NULL);
INSERT INTO public.materials VALUES ('Lightning Crown of the Past Shadow', NULL);
INSERT INTO public.materials VALUES ('Shape Shifter''s Lightning Staff', NULL);
INSERT INTO public.materials VALUES ('Storm Eye', NULL);
INSERT INTO public.materials VALUES ('Void Cast Iron', NULL);
INSERT INTO public.materials VALUES ('Ancient Part', NULL);
INSERT INTO public.materials VALUES ('Artifex''s Module', NULL);
INSERT INTO public.materials VALUES ('Arrow of the Beast Hunter', NULL);
INSERT INTO public.materials VALUES ('Endurance of Bronze', NULL);
INSERT INTO public.materials VALUES ('Extinguished Core', NULL);
INSERT INTO public.materials VALUES ('Harmonic Tune', NULL);
INSERT INTO public.materials VALUES ('Immortal Scionette', NULL);
INSERT INTO public.materials VALUES ('Key of Inspiration', NULL);
INSERT INTO public.materials VALUES ('Module Machina', NULL);
INSERT INTO public.materials VALUES ('Obsidian of Dread', NULL);
INSERT INTO public.materials VALUES ('Seed of Abundance', NULL);
INSERT INTO public.materials VALUES ('Shattered Blade', NULL);
INSERT INTO public.materials VALUES ('Silvermane Badge', NULL);
INSERT INTO public.materials VALUES ('Thief''s Instinct', NULL);


--
-- TOC entry 3356 (class 0 OID 33953)
-- Dependencies: 210
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paths VALUES ('The Abundance', NULL);
INSERT INTO public.paths VALUES ('The Destruction', NULL);
INSERT INTO public.paths VALUES ('The Erudition', NULL);
INSERT INTO public.paths VALUES ('The Harmony', NULL);
INSERT INTO public.paths VALUES ('The Hunt', NULL);
INSERT INTO public.paths VALUES ('The Nihility', NULL);
INSERT INTO public.paths VALUES ('The Preservation', NULL);


--
-- TOC entry 3362 (class 0 OID 34016)
-- Dependencies: 216
-- Data for Name: prefered_pairs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prefered_pairs VALUES ('March 7th', 'Moment of Victory');
INSERT INTO public.prefered_pairs VALUES ('March 7th', 'Day One of My New Life');
INSERT INTO public.prefered_pairs VALUES ('March 7th', 'This Is Me!');
INSERT INTO public.prefered_pairs VALUES ('March 7th', 'We Are Wildfire');
INSERT INTO public.prefered_pairs VALUES ('March 7th', 'Amber');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Physical)', 'On the Fall of an Aeon');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Physical)', 'Something Irreplaceable');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Physical)', 'The Moles Welcome You');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Physical)', 'Nowhere to Run');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Physical)', 'Collapsing Sky');
INSERT INTO public.prefered_pairs VALUES ('Dan Heng', 'In the Night');
INSERT INTO public.prefered_pairs VALUES ('Dan Heng', 'Sleep Like the Dead');
INSERT INTO public.prefered_pairs VALUES ('Dan Heng', 'Cruising in the Stellar Sea');
INSERT INTO public.prefered_pairs VALUES ('Dan Heng', 'Swordplay');
INSERT INTO public.prefered_pairs VALUES ('Dan Heng', 'Only Silence Remains');
INSERT INTO public.prefered_pairs VALUES ('Himeko', 'Before Dawn');
INSERT INTO public.prefered_pairs VALUES ('Himeko', 'Today is Another Peaceful Day');
INSERT INTO public.prefered_pairs VALUES ('Himeko', 'Night on the Milky Way');
INSERT INTO public.prefered_pairs VALUES ('Himeko', 'The Birth of the Self');
INSERT INTO public.prefered_pairs VALUES ('Himeko', 'The Seriousness of Breakfast');
INSERT INTO public.prefered_pairs VALUES ('Asta', 'The Battle Isn''t Over');
INSERT INTO public.prefered_pairs VALUES ('Asta', 'Planetary Rendezvous');
INSERT INTO public.prefered_pairs VALUES ('Asta', 'Dance! Dance! Dance!');
INSERT INTO public.prefered_pairs VALUES ('Asta', 'Carve the Moon, Weave the Clouds');
INSERT INTO public.prefered_pairs VALUES ('Asta', 'Meshing Cogs');
INSERT INTO public.prefered_pairs VALUES ('Arlan', 'Something Irreplaceable');
INSERT INTO public.prefered_pairs VALUES ('Arlan', 'On the Fall of an Aeon');
INSERT INTO public.prefered_pairs VALUES ('Arlan', 'A Secret Vow');
INSERT INTO public.prefered_pairs VALUES ('Arlan', 'Nowhere to Run');
INSERT INTO public.prefered_pairs VALUES ('Arlan', 'Mutual Demise');
INSERT INTO public.prefered_pairs VALUES ('Seele', 'In the Night');
INSERT INTO public.prefered_pairs VALUES ('Seele', 'Sleep Like the Dead');
INSERT INTO public.prefered_pairs VALUES ('Seele', 'Cruising in the Stellar Sea');
INSERT INTO public.prefered_pairs VALUES ('Seele', 'Swordplay');
INSERT INTO public.prefered_pairs VALUES ('Seele', 'Only Silence Remains');
INSERT INTO public.prefered_pairs VALUES ('Natasha', 'Time Waits for No One');
INSERT INTO public.prefered_pairs VALUES ('Natasha', 'Post-Op Conversation');
INSERT INTO public.prefered_pairs VALUES ('Natasha', 'Warmth Shortens Cold Nights');
INSERT INTO public.prefered_pairs VALUES ('Natasha', 'Shared Feeling');
INSERT INTO public.prefered_pairs VALUES ('Natasha', 'Cornucopia');
INSERT INTO public.prefered_pairs VALUES ('Pela', 'Resolution Shines As Pearls of Sweat');
INSERT INTO public.prefered_pairs VALUES ('Pela', 'Eyes of the Prey');
INSERT INTO public.prefered_pairs VALUES ('Pela', 'Good Night and Sleep Well');
INSERT INTO public.prefered_pairs VALUES ('Pela', 'We Will Meet Again');
INSERT INTO public.prefered_pairs VALUES ('Pela', 'In the Name of the World');
INSERT INTO public.prefered_pairs VALUES ('Hook', 'On the Fall of an Aeon');
INSERT INTO public.prefered_pairs VALUES ('Hook', 'Something Irreplaceable');
INSERT INTO public.prefered_pairs VALUES ('Hook', 'Woof! Walk Time!');
INSERT INTO public.prefered_pairs VALUES ('Hook', 'The Moles Welcome You');
INSERT INTO public.prefered_pairs VALUES ('Hook', 'Collapsing Sky');
INSERT INTO public.prefered_pairs VALUES ('Serval', 'Before Dawn');
INSERT INTO public.prefered_pairs VALUES ('Serval', 'Today is Another Peaceful Day');
INSERT INTO public.prefered_pairs VALUES ('Serval', 'Night on the Milky Way');
INSERT INTO public.prefered_pairs VALUES ('Serval', 'The Seriousness of Breakfast');
INSERT INTO public.prefered_pairs VALUES ('Serval', 'Geniuses'' Repose');
INSERT INTO public.prefered_pairs VALUES ('Qingque', 'Before Dawn');
INSERT INTO public.prefered_pairs VALUES ('Qingque', 'Today is Another Peaceful Day');
INSERT INTO public.prefered_pairs VALUES ('Qingque', 'Night on the Milky Way');
INSERT INTO public.prefered_pairs VALUES ('Qingque', 'The Seriousness of Breakfast');
INSERT INTO public.prefered_pairs VALUES ('Qingque', 'Geniuses'' Repose');
INSERT INTO public.prefered_pairs VALUES ('Herta', 'Before Dawn');
INSERT INTO public.prefered_pairs VALUES ('Herta', 'Today is Another Peaceful Day');
INSERT INTO public.prefered_pairs VALUES ('Herta', 'Night on the Milky Way');
INSERT INTO public.prefered_pairs VALUES ('Herta', 'The Birth of the Self');
INSERT INTO public.prefered_pairs VALUES ('Herta', 'The Seriousness of Breakfast');
INSERT INTO public.prefered_pairs VALUES ('Tingyun', 'Dance! Dance! Dance!');
INSERT INTO public.prefered_pairs VALUES ('Tingyun', 'Carve the Moon, Weave the Clouds');
INSERT INTO public.prefered_pairs VALUES ('Tingyun', 'The Battle Isn''t Over');
INSERT INTO public.prefered_pairs VALUES ('Tingyun', 'Memories of the Past');
INSERT INTO public.prefered_pairs VALUES ('Tingyun', 'Chorus');
INSERT INTO public.prefered_pairs VALUES ('Sushang', 'In the Night');
INSERT INTO public.prefered_pairs VALUES ('Sushang', 'Sleep Like the Dead');
INSERT INTO public.prefered_pairs VALUES ('Sushang', 'Cruising in the Stellar Sea');
INSERT INTO public.prefered_pairs VALUES ('Sushang', 'Swordplay');
INSERT INTO public.prefered_pairs VALUES ('Sushang', 'Only Silence Remains');
INSERT INTO public.prefered_pairs VALUES ('Clara', 'Something Irreplaceable');
INSERT INTO public.prefered_pairs VALUES ('Clara', 'On the Fall of an Aeon');
INSERT INTO public.prefered_pairs VALUES ('Clara', 'The Moles Welcome You');
INSERT INTO public.prefered_pairs VALUES ('Clara', 'Nowhere to Run');
INSERT INTO public.prefered_pairs VALUES ('Clara', 'Mutual Demise');
INSERT INTO public.prefered_pairs VALUES ('Bronya', 'The Battle Isn''t Over');
INSERT INTO public.prefered_pairs VALUES ('Bronya', 'Past and Future');
INSERT INTO public.prefered_pairs VALUES ('Bronya', 'Memories of the Past');
INSERT INTO public.prefered_pairs VALUES ('Bronya', 'Carve the Moon, Weave the Clouds');
INSERT INTO public.prefered_pairs VALUES ('Bronya', 'Meshing Cogs');
INSERT INTO public.prefered_pairs VALUES ('Gepard', 'Moment of Victory');
INSERT INTO public.prefered_pairs VALUES ('Gepard', 'Texture of Memories');
INSERT INTO public.prefered_pairs VALUES ('Gepard', 'Landau''s Choice');
INSERT INTO public.prefered_pairs VALUES ('Gepard', 'Day One of My New Life');
INSERT INTO public.prefered_pairs VALUES ('Gepard', 'Amber');
INSERT INTO public.prefered_pairs VALUES ('Bailu', 'Time Waits for No One');
INSERT INTO public.prefered_pairs VALUES ('Bailu', 'Post-Op Conversation');
INSERT INTO public.prefered_pairs VALUES ('Bailu', 'Warmth Shortens Cold Nights');
INSERT INTO public.prefered_pairs VALUES ('Bailu', 'Shared Feeling');
INSERT INTO public.prefered_pairs VALUES ('Bailu', 'Cornucopia');
INSERT INTO public.prefered_pairs VALUES ('Yanqing', 'In the Night');
INSERT INTO public.prefered_pairs VALUES ('Yanqing', 'Sleep Like the Dead');
INSERT INTO public.prefered_pairs VALUES ('Yanqing', 'Cruising in the Stellar Sea');
INSERT INTO public.prefered_pairs VALUES ('Yanqing', 'Swordplay');
INSERT INTO public.prefered_pairs VALUES ('Yanqing', 'Only Silence Remains');
INSERT INTO public.prefered_pairs VALUES ('Welt', 'In the Name of the World');
INSERT INTO public.prefered_pairs VALUES ('Welt', 'Eyes of the Prey');
INSERT INTO public.prefered_pairs VALUES ('Welt', 'Good Night and Sleep Well');
INSERT INTO public.prefered_pairs VALUES ('Welt', 'We Will Meet Again');
INSERT INTO public.prefered_pairs VALUES ('Welt', 'Loop');
INSERT INTO public.prefered_pairs VALUES ('Sampo', 'In the Name of the World');
INSERT INTO public.prefered_pairs VALUES ('Sampo', 'Eyes of the Prey');
INSERT INTO public.prefered_pairs VALUES ('Sampo', 'Good Night and Sleep Well');
INSERT INTO public.prefered_pairs VALUES ('Sampo', 'We Will Meet Again');
INSERT INTO public.prefered_pairs VALUES ('Sampo', 'Fermata');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Fire)', 'Moment of Victory');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Fire)', 'Landau''s Choice');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Fire)', 'Day One of My New Life');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Fire)', 'This Is Me!');
INSERT INTO public.prefered_pairs VALUES ('Trailblazer (Fire)', 'Amber');
INSERT INTO public.prefered_pairs VALUES ('Jing Yuan', 'Before Dawn');
INSERT INTO public.prefered_pairs VALUES ('Jing Yuan', 'Today is Another Peaceful Day');
INSERT INTO public.prefered_pairs VALUES ('Jing Yuan', 'Night on the Milky Way');
INSERT INTO public.prefered_pairs VALUES ('Jing Yuan', 'The Birth of the Self');
INSERT INTO public.prefered_pairs VALUES ('Jing Yuan', 'The Seriousness of Breakfast');
INSERT INTO public.prefered_pairs VALUES ('Silver Wolf', 'Incessant Rain');
INSERT INTO public.prefered_pairs VALUES ('Silver Wolf', 'Before the Tutorial Mission Starts');
INSERT INTO public.prefered_pairs VALUES ('Silver Wolf', 'In the Name of the World');
INSERT INTO public.prefered_pairs VALUES ('Silver Wolf', 'Resolution Shines As Pearls of Sweat');
INSERT INTO public.prefered_pairs VALUES ('Silver Wolf', 'Eyes of the Prey');
INSERT INTO public.prefered_pairs VALUES ('Luocha', 'Echoes of the Coffin');
INSERT INTO public.prefered_pairs VALUES ('Luocha', 'Post-Op Conversation');
INSERT INTO public.prefered_pairs VALUES ('Luocha', 'Shared Feeling');
INSERT INTO public.prefered_pairs VALUES ('Luocha', 'Perfect Timing');
INSERT INTO public.prefered_pairs VALUES ('Luocha', 'Quid Pro Quo');
INSERT INTO public.prefered_pairs VALUES ('Yukong', 'The Battle Isn''t Over');
INSERT INTO public.prefered_pairs VALUES ('Yukong', 'Past and Future');
INSERT INTO public.prefered_pairs VALUES ('Yukong', 'Planetary Rendezvous');
INSERT INTO public.prefered_pairs VALUES ('Yukong', 'Carve the Moon, Weave the Clouds');
INSERT INTO public.prefered_pairs VALUES ('Yukong', 'Dance! Dance! Dance!');


--
-- TOC entry 3207 (class 2606 OID 34106)
-- Name: character_materials character_materials_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_materials
    ADD CONSTRAINT character_materials_pk PRIMARY KEY (character_name, material_name);


--
-- TOC entry 3205 (class 2606 OID 34085)
-- Name: characters characters_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pk PRIMARY KEY (name);


--
-- TOC entry 3199 (class 2606 OID 33962)
-- Name: elements elements_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pk PRIMARY KEY (name);


--
-- TOC entry 3203 (class 2606 OID 34044)
-- Name: light_cones light_cones_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.light_cones
    ADD CONSTRAINT light_cones_pk PRIMARY KEY (name);


--
-- TOC entry 3201 (class 2606 OID 34113)
-- Name: materials materials_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pk PRIMARY KEY (name);


--
-- TOC entry 3197 (class 2606 OID 33957)
-- Name: paths paths_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT paths_pk PRIMARY KEY (name);


--
-- TOC entry 3209 (class 2606 OID 34131)
-- Name: prefered_pairs prefered_pairs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefered_pairs
    ADD CONSTRAINT prefered_pairs_pk PRIMARY KEY (character_name, light_cone_name);


--
-- TOC entry 3213 (class 2606 OID 34098)
-- Name: character_materials character_materials_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_materials
    ADD CONSTRAINT character_materials_fk FOREIGN KEY (character_name) REFERENCES public.characters(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3214 (class 2606 OID 34114)
-- Name: character_materials character_materials_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_materials
    ADD CONSTRAINT character_materials_fk_1 FOREIGN KEY (material_name) REFERENCES public.materials(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3211 (class 2606 OID 34074)
-- Name: characters characters_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_fk FOREIGN KEY (element) REFERENCES public.elements(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3212 (class 2606 OID 34079)
-- Name: characters characters_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_fk_1 FOREIGN KEY (path) REFERENCES public.paths(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3210 (class 2606 OID 33976)
-- Name: light_cones light_cones_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.light_cones
    ADD CONSTRAINT light_cones_fk FOREIGN KEY (path) REFERENCES public.paths(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3215 (class 2606 OID 34123)
-- Name: prefered_pairs prefered_pairs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefered_pairs
    ADD CONSTRAINT prefered_pairs_fk FOREIGN KEY (character_name) REFERENCES public.characters(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3216 (class 2606 OID 34132)
-- Name: prefered_pairs prefered_pairs_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prefered_pairs
    ADD CONSTRAINT prefered_pairs_fk_1 FOREIGN KEY (light_cone_name) REFERENCES public.light_cones(name) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-07-19 18:55:49

--
-- PostgreSQL database dump complete
--

