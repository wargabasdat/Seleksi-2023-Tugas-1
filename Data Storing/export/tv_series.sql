--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: casts; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.casts (
    actor_name character varying(255) NOT NULL,
    gender character varying(50),
    nationality character varying(50),
    birth_date date
);


ALTER TABLE public.casts OWNER TO rana;

--
-- Name: character; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public."character" (
    char_name character varying(255) NOT NULL,
    role character varying(50),
    actor_name character varying(255)
);


ALTER TABLE public."character" OWNER TO rana;

--
-- Name: episodes; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.episodes (
    episode_title character varying(255) NOT NULL,
    air_date date,
    description character varying(255),
    series_title character varying(255)
);


ALTER TABLE public.episodes OWNER TO rana;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.rating (
    user_id character(8) NOT NULL,
    series_title character varying(255) NOT NULL,
    rating double precision,
    comment character varying(255)
);


ALTER TABLE public.rating OWNER TO rana;

--
-- Name: studios; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.studios (
    studio_name character varying(255) NOT NULL,
    year_created integer,
    address character varying(255)
);


ALTER TABLE public.studios OWNER TO rana;

--
-- Name: tv_series; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.tv_series (
    series_title character varying(255) NOT NULL,
    start_year character(10),
    end_year character(10),
    seasons integer,
    rank integer,
    runtime character varying(50),
    finalrate double precision,
    director character varying(255),
    status character varying(50),
    description character varying(300),
    genres character varying(255),
    studio_name character varying(255),
    char_name character varying(255)
);


ALTER TABLE public.tv_series OWNER TO rana;

--
-- Name: users; Type: TABLE; Schema: public; Owner: rana
--

CREATE TABLE public.users (
    user_id character(8) NOT NULL,
    username character varying(50),
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.users OWNER TO rana;

--
-- Data for Name: casts; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.casts (actor_name, gender, nationality, birth_date) FROM stdin;
Henry Cavill	\N	\N	\N
Freya Allan	\N	\N	\N
Anya Chalotra	\N	\N	\N
Eamon Farren	\N	\N	\N
Wunmi Mosaku	\N	\N	\N
Monica Dolan	\N	\N	\N
Daniel Lapaine	\N	\N	\N
Hannah John-Kamen	\N	\N	\N
Jeremy Allen White	\N	\N	\N
Ebon Moss-Bachrach	\N	\N	\N
Ayo Edebiri	\N	\N	\N
Lionel Boyce	\N	\N	\N
Rebecca Ferguson	\N	\N	\N
Common	\N	\N	\N
Tim Robbins	\N	\N	\N
Harriet Walter	\N	\N	\N
John Krasinski	\N	\N	\N
Wendell Pierce	\N	\N	\N
Michael Kelly	\N	\N	\N
Abbie Cornish	\N	\N	\N
The Weeknd	\N	\N	\N
Lily-Rose Depp	\N	\N	\N
Suzanna Son	\N	\N	\N
Troye Sivan	\N	\N	\N
Idris Elba	\N	\N	\N
Neil Maskell	\N	\N	\N
Max Beesley	\N	\N	\N
Ben Miles	\N	\N	\N
Gabriel Macht	\N	\N	\N
Patrick J. Adams	\N	\N	\N
Meghan Markle	\N	\N	\N
Sarah Rafferty	\N	\N	\N
Nicholas Braun	\N	\N	\N
Brian Cox	\N	\N	\N
Kieran Culkin	\N	\N	\N
Peter Friedman	\N	\N	\N
Harold Perrineau	\N	\N	\N
Catalina Sandino Moreno	\N	\N	\N
Eion Bailey	\N	\N	\N
David Alpay	\N	\N	\N
Manuel Garcia-Rulfo	\N	\N	\N
Becki Newton	\N	\N	\N
Angus Sampson	\N	\N	\N
Jazz Raycole	\N	\N	\N
Emilia Clarke	\N	\N	\N
Peter Dinklage	\N	\N	\N
Kit Harington	\N	\N	\N
Lena Headey	\N	\N	\N
Jason Sudeikis	\N	\N	\N
Brett Goldstein	\N	\N	\N
Brendan Hunt	\N	\N	\N
Nick Mohammed	\N	\N	\N
John Goodman	\N	\N	\N
Danny McBride	\N	\N	\N
Adam Devine	\N	\N	\N
Edi Patterson	\N	\N	\N
Kevin Costner	\N	\N	\N
Luke Grimes	\N	\N	\N
Kelly Reilly	\N	\N	\N
Wes Bentley	\N	\N	\N
Bryan Cranston	\N	\N	\N
Aaron Paul	\N	\N	\N
Anna Gunn	\N	\N	\N
Betsy Brandt	\N	\N	\N
Caitríona Balfe	\N	\N	\N
Sam Heughan	\N	\N	\N
Sophie Skelton	\N	\N	\N
Richard Rankin	\N	\N	\N
Andrew Koji	\N	\N	\N
Langley Kirkwood	\N	\N	\N
Olivia Cheng	\N	\N	\N
Dianne Doan	\N	\N	\N
Andrew Lincoln	\N	\N	\N
Norman Reedus	\N	\N	\N
Melissa McBride	\N	\N	\N
Lauren Cohan	\N	\N	\N
James Spader	\N	\N	\N
Megan Boone	\N	\N	\N
Diego Klattenhoff	\N	\N	\N
Ryan Eggold	\N	\N	\N
Karl Urban	\N	\N	\N
Jack Quaid	\N	\N	\N
Antony Starr	\N	\N	\N
Erin Moriarty	\N	\N	\N
Sarah Jessica Parker	\N	\N	\N
Cynthia Nixon	\N	\N	\N
Kristin Davis	\N	\N	\N
Sara Ramirez	\N	\N	\N
Millie Bobby Brown	\N	\N	\N
Finn Wolfhard	\N	\N	\N
Winona Ryder	\N	\N	\N
David Harbour	\N	\N	\N
Lola Tung	\N	\N	\N
Christopher Briney	\N	\N	\N
Gavin Casalegno	\N	\N	\N
Sean Kaufman	\N	\N	\N
James Gandolfini	\N	\N	\N
Lorraine Bracco	\N	\N	\N
Edie Falco	\N	\N	\N
Michael Imperioli	\N	\N	\N
Brenton Thwaites	\N	\N	\N
Anna Diop	\N	\N	\N
Ryan Potter	\N	\N	\N
Teagan Croft	\N	\N	\N
Bob Odenkirk	\N	\N	\N
Rhea Seehorn	\N	\N	\N
Jonathan Banks	\N	\N	\N
Patrick Fabian	\N	\N	\N
Melissa Roxburgh	\N	\N	\N
Josh Dallas	\N	\N	\N
J.R. Ramirez	\N	\N	\N
Luna Blaise	\N	\N	\N
Ellen Pompeo	\N	\N	\N
Chandra Wilson	\N	\N	\N
James Pickens Jr.	\N	\N	\N
Justin Chambers	\N	\N	\N
Nathan Fillion	\N	\N	\N
Alyssa Diaz	\N	\N	\N
Richard T. Jones	\N	\N	\N
Melissa O'Neil	\N	\N	\N
Emmy Rossum	\N	\N	\N
William H. Macy	\N	\N	\N
Ethan Cutkosky	\N	\N	\N
Lou Llobell	\N	\N	\N
Lee Pace	\N	\N	\N
Jared Harris	\N	\N	\N
Leah Harvey	\N	\N	\N
Jared Padalecki	\N	\N	\N
Jensen Ackles	\N	\N	\N
Jim Beaver	\N	\N	\N
Misha Collins	\N	\N	\N
Melanie Lynskey	\N	\N	\N
Tawny Cypress	\N	\N	\N
Sophie Nélisse	\N	\N	\N
Jasmin Savoy Brown	\N	\N	\N
Pedro Pascal	\N	\N	\N
Bella Ramsey	\N	\N	\N
Anna Torv	\N	\N	\N
Lamar Johnson	\N	\N	\N
Shaun Evans	\N	\N	\N
Roger Allam	\N	\N	\N
James Bradshaw	\N	\N	\N
Sean Rigby	\N	\N	\N
Kim Cattrall	\N	\N	\N
Miss Benny	\N	\N	\N
Jade Payton	\N	\N	\N
Zane Phillips	\N	\N	\N
Cillian Murphy	\N	\N	\N
Paul Anderson	\N	\N	\N
Sophie Rundle	\N	\N	\N
Helen McCrory	\N	\N	\N
Bill Hader	\N	\N	\N
Stephen Root	\N	\N	\N
Sarah Goldberg	\N	\N	\N
Anthony Carrigan	\N	\N	\N
Josh Grelle	\N	\N	\N
Bryce Papenbrook	\N	\N	\N
Yûki Kaji	\N	\N	\N
Yui Ishikawa	\N	\N	\N
Kirsten Vangsness	\N	\N	\N
Matthew Gray Gubler	\N	\N	\N
A.J. Cook	\N	\N	\N
Joe Mantegna	\N	\N	\N
David McCallum	\N	\N	\N
Sean Murray	\N	\N	\N
Mark Harmon	\N	\N	\N
Brian Dietzen	\N	\N	\N
Mariska Hargitay	\N	\N	\N
Christopher Meloni	\N	\N	\N
Ice-T	\N	\N	\N
Dann Florek	\N	\N	\N
Vince Vaughn	\N	\N	\N
Colin Farrell	\N	\N	\N
Rachel McAdams	\N	\N	\N
Taylor Kitsch	\N	\N	\N
Timothy Olyphant	\N	\N	\N
Nick Searcy	\N	\N	\N
Joelle Carter	\N	\N	\N
Jacob Pitts	\N	\N	\N
Adam Scott	\N	\N	\N
Zach Cherry	\N	\N	\N
Britt Lower	\N	\N	\N
Tramell Tillman	\N	\N	\N
Jennifer Coolidge	\N	\N	\N
Jon Gries	\N	\N	\N
F. Murray Abraham	\N	\N	\N
Adam DiMarco	\N	\N	\N
Maitreyi Ramakrishnan	\N	\N	\N
Poorna Jagannathan	\N	\N	\N
Darren Barnet	\N	\N	\N
John McEnroe	\N	\N	\N
Ed O'Neill	\N	\N	\N
Sofía Vergara	\N	\N	\N
Julie Bowen	\N	\N	\N
Ty Burrell	\N	\N	\N
Alan Ritchson	\N	\N	\N
Malcolm Goodwin	\N	\N	\N
Willa Fitzgerald	\N	\N	\N
Hugh Thompson	\N	\N	\N
Dominic West	\N	\N	\N
Lance Reddick	\N	\N	\N
Sonja Sohn	\N	\N	\N
Zendaya	\N	\N	\N
Hunter Schafer	\N	\N	\N
Angus Cloud	\N	\N	\N
Jacob Elordi	\N	\N	\N
Michael Dorman	\N	\N	\N
Julianna Guill	\N	\N	\N
Skywalker Hughes	\N	\N	\N
Kamryn Pliva	\N	\N	\N
Harrison Ford	\N	\N	\N
Helen Mirren	\N	\N	\N
Brandon Sklenar	\N	\N	\N
Julia Schlaepfer	\N	\N	\N
Rachel Brosnahan	\N	\N	\N
Alex Borstein	\N	\N	\N
Michael Zegen	\N	\N	\N
Marin Hinkle	\N	\N	\N
Jorge Garcia	\N	\N	\N
Josh Holloway	\N	\N	\N
Yunjin Kim	\N	\N	\N
Evangeline Lilly	\N	\N	\N
Grant Gustin	\N	\N	\N
Candice Patton	\N	\N	\N
Danielle Panabaker	\N	\N	\N
Carlos Valdes	\N	\N	\N
JD Pardo	\N	\N	\N
Clayton Cardenas	\N	\N	\N
Sarah Bolger	\N	\N	\N
Michael Irby	\N	\N	\N
Gabriel Basso	\N	\N	\N
Luciane Buchanan	\N	\N	\N
Fola Evans-Akingbola	\N	\N	\N
Sarah Desjardins	\N	\N	\N
Emily Deschanel	\N	\N	\N
David Boreanaz	\N	\N	\N
Michaela Conlin	\N	\N	\N
T.J. Thyne	\N	\N	\N
Chiara Aurelia	\N	\N	\N
Olivia Holt	\N	\N	\N
Sadie Stanley	\N	\N	\N
Lexi Underwood	\N	\N	\N
Tyler Hoechlin	\N	\N	\N
Elizabeth Tulloch	\N	\N	\N
Alex Garfin	\N	\N	\N
Erik Valdez	\N	\N	\N
Matt Smith	\N	\N	\N
Graham McTavish	\N	\N	\N
Steve Toussaint	\N	\N	\N
Eve Best	\N	\N	\N
Jodie Whittaker	\N	\N	\N
Peter Capaldi	\N	\N	\N
Pearl Mackie	\N	\N	\N
Keri Russell	\N	\N	\N
Rufus Sewell	\N	\N	\N
David Gyasi	\N	\N	\N
Ali Ahn	\N	\N	\N
Mayumi Tanaka	\N	\N	\N
Laurent Vernin	\N	\N	\N
Tony Beck	\N	\N	\N
Akemi Okamura	\N	\N	\N
John Nettles	\N	\N	\N
Jane Wymark	\N	\N	\N
Barry Jackson	\N	\N	\N
Neil Dudgeon	\N	\N	\N
Hugh Laurie	\N	\N	\N
Omar Epps	\N	\N	\N
Robert Sean Leonard	\N	\N	\N
Jesse Spencer	\N	\N	\N
Jason Segel	\N	\N	\N
Jessica Williams	\N	\N	\N
Luke Tennie	\N	\N	\N
Katheryn Winnick	\N	\N	\N
Gustaf Skarsgård	\N	\N	\N
Alexander Ludwig	\N	\N	\N
Georgia Hirst	\N	\N	\N
Lady Gaga	\N	\N	\N
Kathy Bates	\N	\N	\N
Angela Bassett	\N	\N	\N
Sarah Paulson	\N	\N	\N
Asa Butterfield	\N	\N	\N
Gillian Anderson	\N	\N	\N
Ncuti Gatwa	\N	\N	\N
Emma Mackey	\N	\N	\N
Shemar Moore	\N	\N	\N
Alex Russell	\N	\N	\N
Kenny Johnson	\N	\N	\N
Jay Harrington	\N	\N	\N
Joe Locke	\N	\N	\N
Kit Connor	\N	\N	\N
Yasmin Finney	\N	\N	\N
William Gao	\N	\N	\N
Freddie Highmore	\N	\N	\N
Hill Harper	\N	\N	\N
Richard Schiff	\N	\N	\N
Christina Chang	\N	\N	\N
Kim Dickens	\N	\N	\N
Frank Dillane	\N	\N	\N
Cliff Curtis	\N	\N	\N
Rubén Blades	\N	\N	\N
Steven Yeun	\N	\N	\N
Ali Wong	\N	\N	\N
Joseph Lee	\N	\N	\N
Young Mazino	\N	\N	\N
Sarah Lancashire	\N	\N	\N
Siobhan Finneran	\N	\N	\N
James Norton	\N	\N	\N
Rhys Connah	\N	\N	\N
Rod Serling	\N	\N	\N
Robert McCord	\N	\N	\N
Jay Overholts	\N	\N	\N
James Turley	\N	\N	\N
Natasha Lyonne	\N	\N	\N
Benjamin Bratt	\N	\N	\N
Simon Helberg	\N	\N	\N
Pedro Hollywood	\N	\N	\N
David Duchovny	\N	\N	\N
Mitch Pileggi	\N	\N	\N
William B. Davis	\N	\N	\N
Jon Hamm	\N	\N	\N
Elisabeth Moss	\N	\N	\N
Vincent Kartheiser	\N	\N	\N
January Jones	\N	\N	\N
Richard Madden	\N	\N	\N
Priyanka Chopra Jonas	\N	\N	\N
Stanley Tucci	\N	\N	\N
Lesley Manville	\N	\N	\N
Billy Bob Thornton	\N	\N	\N
Martin Freeman	\N	\N	\N
Allison Tolman	\N	\N	\N
Colin Hanks	\N	\N	\N
Tom Ellis	\N	\N	\N
Lauren German	\N	\N	\N
Kevin Alejandro	\N	\N	\N
D.B. Woodside	\N	\N	\N
Tom Welling	\N	\N	\N
Michael Rosenbaum	\N	\N	\N
Allison Mack	\N	\N	\N
Kristin Kreuk	\N	\N	\N
Charlie Hunnam	\N	\N	\N
Katey Sagal	\N	\N	\N
Mark Boone Junior	\N	\N	\N
Kim Coates	\N	\N	\N
Elle Fanning	\N	\N	\N
Phoebe Fox	\N	\N	\N
Gwilym Lee	\N	\N	\N
Adam Godley	\N	\N	\N
Golshifteh Farahani	\N	\N	\N
Shamier Anderson	\N	\N	\N
Shioli Kutsuna	\N	\N	\N
Billy Barratt	\N	\N	\N
Stana Katic	\N	\N	\N
Susan Sullivan	\N	\N	\N
Jon Huertas	\N	\N	\N
Peter Krause	\N	\N	\N
Oliver Stark	\N	\N	\N
Aisha Hinds	\N	\N	\N
Donnie Wahlberg	\N	\N	\N
Bridget Moynahan	\N	\N	\N
Will Estes	\N	\N	\N
Len Cariou	\N	\N	\N
Elizabeth Bourgine	\N	\N	\N
Don Warrington	\N	\N	\N
Danny John-Jules	\N	\N	\N
Tobi Bakare	\N	\N	\N
Angela Lansbury	\N	\N	\N
William Windom	\N	\N	\N
Ron Masak	\N	\N	\N
Louis Herthum	\N	\N	\N
Nina Dobrev	\N	\N	\N
Paul Wesley	\N	\N	\N
Ian Somerhalder	\N	\N	\N
Kat Graham	\N	\N	\N
Alexander Dreymon	\N	\N	\N
Eliza Butterworth	\N	\N	\N
Arnas Fedaravicius	\N	\N	\N
Mark Rowley	\N	\N	\N
Natara Nopparatayapon	\N	\N	\N
Nat Kitcharit	\N	\N	\N
Sarika Sartsilpsupa	\N	\N	\N
Chutimon Chuengcharoensukying	\N	\N	\N
Lili Reinhart	\N	\N	\N
Camila Mendes	\N	\N	\N
Cole Sprouse	\N	\N	\N
K.J. Apa	\N	\N	\N
Nicola Coughlan	\N	\N	\N
Julie Andrews	\N	\N	\N
Luke Newton	\N	\N	\N
Luke Thompson	\N	\N	\N
\.


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public."character" (char_name, role, actor_name) FROM stdin;
\.


--
-- Data for Name: episodes; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.episodes (episode_title, air_date, description, series_title) FROM stdin;
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.rating (user_id, series_title, rating, comment) FROM stdin;
\.


--
-- Data for Name: studios; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.studios (studio_name, year_created, address) FROM stdin;
\.


--
-- Data for Name: tv_series; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.tv_series (series_title, start_year, end_year, seasons, rank, runtime, finalrate, director, status, description, genres, studio_name, char_name) FROM stdin;
The Witcher	2019      	Present   	\N	1	60	8.1	\N	\N	Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.	Action,  Adventure,  Drama	\N	\N
Black Mirror	2011      	Present   	\N	2	60	8.7	\N	\N	An anthology series exploring a twisted, high-tech multiverse where humanity's greatest innovations and darkest instincts collide.	Drama,  Mystery,  Sci-Fi	\N	\N
The Bear	2022      	Present   	\N	3	30	8.5	\N	\N	A young chef from the fine dining world returns to Chicago to run his family's sandwich shop.	Comedy,  Drama	\N	\N
Silo	2023      	Present   	\N	4	None	8.1	\N	\N	Men and women live in a giant silo underground with several regulations which they believe are in place to protect them from the toxic and ruined world on the surface.	Drama,  Mystery,  Sci-Fi	\N	\N
Jack Ryan	2018      	2023      	\N	5	60	8	\N	\N	Up-and-coming CIA analyst, Jack Ryan, is thrust into dangerous field assignments.	Action,  Drama,  Thriller	\N	\N
The Idol	2023      	2023      	\N	6	276	4.7	\N	\N	Jocelyn is desperate to reclaim her rightful title as the greatest and sexiest pop diva in America after a nervous breakdown disrupted her most recent tour after Tedros, a notorious nightclub entrepreneur, reignites her passions.	Drama	\N	\N
Hijack	2023      	Present   	\N	7	None	7.8	\N	\N	A plane from Dubai to London is hijacked over a 7-hour flight, while authorities on the ground scramble for answers.	Drama,  Thriller	\N	\N
Suits	2011      	2019      	\N	8	44	8.4	\N	\N	On the run from a drug deal gone bad, brilliant college dropout Mike Ross finds himself working with Harvey Specter, one of New York City's best lawyers.	Comedy,  Drama	\N	\N
Succession	2018      	2023      	\N	9	60	8.9	\N	\N	The Roy family is known for controlling the biggest media and entertainment company in the world. However, their world changes when their father steps down from the company.	Comedy,  Drama	\N	\N
From	2022      	Present   	\N	10	52	7.7	\N	\N	Unravel the mystery of a city in middle U.S.A. that imprisons everyone who enters. As the residents struggle to maintain a sense of normalcy and seek a way out, they must also survive the threats of the surrounding forest.	Drama,  Horror,  Mystery	\N	\N
The Lincoln Lawyer	2022      	Present   	\N	11	60	7.7	\N	\N	An iconoclastic idealist runs his law practice out of the back of his Lincoln Town Car in this series based on Michael Connelly's bestselling novels.	Crime,  Drama,  Mystery	\N	\N
Game of Thrones	2011      	2019      	\N	12	57	9.2	\N	\N	Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for a millennia.	Action,  Adventure,  Drama	\N	\N
Ted Lasso	2020      	2023      	\N	13	30	8.8	\N	\N	American college football coach Ted Lasso heads to London to manage AFC Richmond, a struggling English Premier League football team.	Comedy,  Drama,  Sport	\N	\N
The Righteous Gemstones	2019      	Present   	\N	14	36	8.1	\N	\N	Follows a world-famous televangelist family with a long tradition of deviance, greed, and charitable work.	Comedy,  Drama	\N	\N
Yellowstone	2018      	2023      	\N	15	60	8.7	\N	\N	A ranching family in Montana faces off against others encroaching on their land.	Drama,  Western	\N	\N
Breaking Bad	2008      	2013      	\N	16	49	9.5	\N	\N	A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family's future.	Crime,  Drama,  Thriller	\N	\N
Outlander	2014      	Present   	\N	17	60	8.4	\N	\N	Claire Beauchamp Randall, a nurse in World War II, mysteriously goes back in time to Scotland in 1743. There, she meets a dashing Highland warrior and gets drawn into an epic rebellion.	Drama,  Fantasy,  Romance	\N	\N
Warrior	2019      	Present   	\N	18	60	8.4	\N	\N	During the Tong Wars in the late 1800s, Ah Sahm, a martial arts prodigy from China, immigrates to San Francisco and becomes a hatchet man for the most powerful tong in Chinatown.	Action,  Crime,  Drama	\N	\N
The Walking Dead	2010      	2022      	\N	19	44	8.1	\N	\N	Sheriff Deputy Rick Grimes wakes up from a coma to learn the world is in ruins and must lead a group of survivors to stay alive.	Drama,  Horror,  Thriller	\N	\N
The Blacklist	2013      	2023      	\N	20	43	8	\N	\N	A new FBI profiler, Elizabeth Keen, has her entire life uprooted when a mysterious criminal, Raymond Reddington, who has eluded capture for decades, turns himself in and insists on speaking only to her.	Crime,  Drama,  Mystery	\N	\N
The Boys	2019      	Present   	\N	21	60	8.7	\N	\N	A group of vigilantes set out to take down corrupt superheroes who abuse their superpowers.	Action,  Comedy,  Crime	\N	\N
And Just Like That...	2021      	Present   	\N	22	40	5.7	\N	\N	The series follows Carrie, Miranda, and Charlotte as they navigate the journey from the complicated reality of life and friendship in their 30s to the even more complicated reality of life and friendship in their 50s.	Comedy,  Drama,  Romance	\N	\N
Stranger Things	2016      	2024      	\N	23	51	8.7	\N	\N	When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.	Drama,  Fantasy,  Horror	\N	\N
The Summer I Turned Pretty	2022      	Present   	\N	24	45	7.4	\N	\N	A love triangle between one girl and two brothers. A story about first love, first heartbreak, and the magic of that one perfect summer.	Drama,  Romance	\N	\N
The Sopranos	1999      	2007      	\N	25	55	9.2	\N	\N	New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek professional psychiatric counseling.	Crime,  Drama	\N	\N
Titans	I 2018    	2023      	\N	26	45	7.5	\N	\N	Dick and Rachel, a girl possessed by a strange darkness, get embroiled in a conspiracy that could bring Hell on Earth. Joining them along the way are the hot-headed Starfire and lovable Beast Boy. Together they become a team of heroes.	Action,  Adventure,  Crime	\N	\N
Better Call Saul	2015      	2022      	\N	27	46	9	\N	\N	The trials and tribulations of criminal lawyer Jimmy McGill in the years leading up to his fateful run-in with Walter White and Jesse Pinkman.	Crime,  Drama	\N	\N
Manifest	2018      	2023      	\N	28	43	7.1	\N	\N	When a commercial airliner suddenly reappears after being missing for five years, those aboard must reintegrate into society.	Drama,  Mystery,  Sci-Fi	\N	\N
Grey's Anatomy	2005      	Present   	\N	29	41	7.6	\N	\N	A drama centered on the personal and professional lives of five surgical interns and their supervisors.	Drama,  Romance	\N	\N
The Rookie	2018      	Present   	\N	30	43	8	\N	\N	Starting over isn't easy, especially for John Nolan who, after a life-altering incident, is pursuing his dream of joining the LAPD. As their oldest rookie, he's met with skepticism from those who see him as just a walking midlife crisis.	Action,  Crime,  Drama	\N	\N
Shameless	2011      	2021      	\N	31	46	8.6	\N	\N	A scrappy, feisty, fiercely loyal Chicago family makes no apologies.	Comedy,  Drama	\N	\N
Foundation	2021      	Present   	\N	32	60	7.5	\N	\N	A complex saga of humans scattered on planets throughout the galaxy all living under the rule of the Galactic Empire.	Drama,  Sci-Fi	\N	\N
Supernatural	2005      	2020      	\N	33	44	8.4	\N	\N	Two brothers follow their father's footsteps as hunters, fighting evil supernatural beings of many kinds, including monsters, demons, and gods that roam the earth.	Drama,  Fantasy,  Horror	\N	\N
Yellowjackets	2021      	Present   	\N	34	60	7.8	\N	\N	A wildly talented high school girl soccer team becomes the (un)lucky survivors of a plane crash deep in the Canadian wilderness.	Drama,  Horror,  Mystery	\N	\N
The Last of Us	2023      	Present   	\N	35	50	8.8	\N	\N	After a global pandemic destroys civilization, a hardened survivor takes charge of a 14-year-old girl who may be humanity's last hope.	Action,  Adventure,  Drama	\N	\N
Endeavour	2012      	2023      	\N	36	89	8.6	\N	\N	Set from 1965 into the 1970s, the show follows Endeavour Morse in his early years as a police constable. Working alongside his senior partner DI Fred Thursday, Morse engages in a number of investigations around Oxford.	Crime,  Drama,  Mystery	\N	\N
Glamorous	2023      	Present   	\N	37	45	5.9	\N	\N	Marco Mejia, a young gender non-conforming queer person whose life seems to be stuck in place until he lands a job working for legendary makeup mogul Madolyn Addison.	Comedy,  Drama	\N	\N
Peaky Blinders	2013      	2022      	\N	38	60	8.8	\N	\N	A gangster family epic set in 1900s England, centering on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.	Crime,  Drama	\N	\N
Barry	2018      	2023      	\N	39	30	8.4	\N	\N	A hit man from the Midwest moves to Los Angeles and gets caught up in the city's theatre arts scene.	Action,  Comedy,  Crime	\N	\N
Shingeki no Kyojin	2013      	2023      	\N	40	24	9.1	\N	\N	After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.	Animation,  Action,  Adventure	\N	\N
Criminal Minds	2005      	Present   	\N	41	42	8.1	\N	\N	A group of criminal profilers who work for the FBI as members of its Behavioral Analysis Unit (BAU) using behavioral analysis and profiling to help investigate crimes and find the suspect known as the unsub.	Crime,  Drama,  Mystery	\N	\N
NCIS: Naval Criminal Investigative Service	2003      	Present   	\N	42	60	7.8	\N	\N	The cases of the Naval Criminal Investigative Service's Washington, D.C. Major Case Response Team.	Action,  Crime,  Drama	\N	\N
Law & Order: Special Victims Unit	1999      	Present   	\N	43	60	8.1	\N	\N	This series follows the Special Victims Unit, a specially trained squad of detectives in the New York City Police Department that investigate sexually related crimes.	Crime,  Drama,  Mystery	\N	\N
True Detective	2014      	Present   	\N	44	55	8.9	\N	\N	Seasonal anthology series in which police investigations unearth the personal and professional secrets of those involved, both within and outside the law.	Crime,  Drama,  Mystery	\N	\N
Justified	2010      	2015      	\N	45	44	8.6	\N	\N	Enforcing his own brand of justice, US Marshal Raylan, a strong-willed, quiet law-man haunted by his past, returns to his native town to see that justice is served to those in need.	Action,  Crime,  Drama	\N	\N
Severance	2022      	Present   	\N	46	55	8.7	\N	\N	Mark leads a team of office workers whose memories have been surgically divided between their work and personal lives. When a mysterious colleague appears outside of work, it begins a journey to discover the truth about their jobs.	Drama,  Mystery,  Sci-Fi	\N	\N
The White Lotus	2021      	2024      	\N	47	60	7.9	\N	\N	The exploits of various guests and employees of a tropical resort over the span of a week.	Comedy,  Drama	\N	\N
Never Have I Ever	2020      	2023      	\N	48	30	7.9	\N	\N	The complicated life of a first-generation Indian-American teenage girl, inspired by Mindy Kaling's own childhood.	Comedy,  Drama	\N	\N
Modern Family	2009      	2020      	\N	49	22	8.5	\N	\N	Three different but related families face trials and tribulations in their own uniquely comedic ways.	Comedy,  Drama,  Romance	\N	\N
Reacher	2022      	Present   	\N	50	49	8.1	\N	\N	Jack Reacher was arrested for murder and now the police need his help. Based on the books by Lee Child.	Action,  Crime,  Drama	\N	\N
The Wire	2002      	2008      	\N	51	59	9.3	\N	\N	The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.	Crime,  Drama,  Thriller	\N	\N
Euphoria	2019      	Present   	\N	52	55	8.3	\N	\N	A look at life for a group of high school students as they grapple with issues of drugs, sex, and violence.	Drama	\N	\N
Joe Pickett	2021      	Present   	\N	53	50	7.7	\N	\N	Follows a game warden and his family during a changing political and socioeconomic climate in a small rural town.	Drama,  Western	\N	\N
1923	2022      	2023      	\N	54	60	8.4	\N	\N	The Duttons face a new set of challenges in the early 20th century, including the rise of Western expansion, Prohibition, and the Great Depression.	Drama,  Western	\N	\N
The Marvelous Mrs. Maisel	2017      	2023      	\N	55	57	8.7	\N	\N	After her husband leaves her, young mother of two Miriam "Midge" Maisel discovers that she has a talent for stand-up comedy. Could this be her calling?	Comedy,  Drama	\N	\N
Lost	2004      	2010      	\N	56	44	8.3	\N	\N	The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.	Adventure,  Drama,  Fantasy	\N	\N
The Flash	2014      	2023      	\N	57	43	7.5	\N	\N	After being struck by lightning, Barry Allen wakes up from his coma to discover he's been given the power of super speed, becoming the Flash, and fighting crime in Central City.	Action,  Adventure,  Drama	\N	\N
Mayans M.C.	2018      	2023      	\N	58	60	7.6	\N	\N	Set in a post-Jax Teller world, "Mayans MC" sees EZ Reyes, a former golden boy now fresh out of prison, as a prospect in the Mayan MC charter on the California-Mexico border who must carve out his new outlaw identity.	Crime,  Drama,  Thriller	\N	\N
The Night Agent	2023      	Present   	\N	59	45	7.5	\N	\N	Low-level FBI agent Peter Sutherland works in the basement of the White House manning a phone that never rings - until the night it does, propelling him into a conspiracy that leads all the way to the Oval Office.	Action,  Drama,  Thriller	\N	\N
Sex and the City	1998      	2004      	\N	60	30	7.3	\N	\N	Four female New Yorkers gossip about their sex lives (or lack thereof) and find new ways to deal with being a woman in the late 1990s.	Comedy,  Drama,  Romance	\N	\N
Bones	2005      	2017      	\N	61	40	7.8	\N	\N	Forensic anthropologist Dr. Temperance "Bones" Brennan and cocky F.B.I. Special Agent Seeley Booth build a team to investigate murders. Quite often, there isn't more to examine than rotten flesh or mere bones.	Crime,  Drama,  Mystery	\N	\N
Cruel Summer	2021      	Present   	\N	62	45	7.4	\N	\N	In a small Texas town, popular teen Kate is abducted. Seemingly unrelated, a girl named Jeanette goes from being a sweet, awkward outsider to the most popular girl in town, but by 1995 she has become the most-despised person in America.	Drama,  Mystery,  Thriller	\N	\N
Superman & Lois	2021      	Present   	\N	63	42	7.8	\N	\N	The world's most famous superhero and comic books' most famous journalist face the pressures and complexities that come with balancing work, justice, and parenthood in today's society.	Action,  Adventure,  Drama	\N	\N
House of the Dragon	2022      	Present   	\N	64	None	8.5	\N	\N	An internal succession war within House Targaryen at the height of its power, 172 years before the birth of Daenerys Targaryen.	Action,  Adventure,  Drama	\N	\N
Doctor Who	2005      	Present   	\N	65	45	8.6	\N	\N	The further adventures in time and space of the alien adventurer known as the Doctor and their companions from planet Earth.	Adventure,  Drama,  Sci-Fi	\N	\N
The Diplomat	II 2023   	Present   	\N	66	50	8	\N	\N	In the midst of an international crisis, Kate Wyler, a career diplomat, lands in a high-profile job for which she is not suited, with tectonic implications for her marriage and her political future.	Drama,  Thriller	\N	\N
One Piece: Wan pîsu	1999      	Present   	\N	67	24	8.9	\N	\N	Follows the adventures of Monkey D. Luffy and his pirate crew in order to find the greatest treasure ever left by the legendary Pirate, Gold Roger. The famous mystery treasure named "One Piece".	Animation,  Action,  Adventure	\N	\N
Midsomer Murders	1997      	Present   	\N	68	90	7.9	\N	\N	A veteran Detective Chief Inspector and his young Sergeant investigate murders around the regional community of Midsomer County.	Crime,  Drama,  Mystery	\N	\N
House M.D.	2004      	2012      	\N	69	44	8.7	\N	\N	An antisocial maverick doctor who specializes in diagnostic medicine does whatever it takes to solve puzzling cases that come his way using his crack team of doctors and his wits.	Drama,  Mystery	\N	\N
Shrinking	2023      	Present   	\N	70	33	8	\N	\N	A grieving therapist starts to tell his clients exactly what he thinks. Ignoring his training and ethics, he finds himself making huge changes to people's lives - including his own.	Comedy,  Drama	\N	\N
Vikings	2013      	2020      	\N	71	44	8.5	\N	\N	Vikings transports us to the brutal and mysterious world of Ragnar Lothbrok, a Viking warrior and farmer who yearns to explore--and raid--the distant shores across the ocean.	Action,  Adventure,  Drama	\N	\N
American Horror Story	2011      	Present   	\N	72	60	8	\N	\N	An anthology series centering on different characters and locations, including a house with a murderous past, an insane asylum, a witch coven, a freak show circus, a haunted hotel, a possessed farmhouse, a cult, the apocalypse, a slasher summer camp, a bleak beach town and desert valley, and NYC.	Drama,  Horror,  Sci-Fi	\N	\N
Sex Education	2019      	2023      	\N	73	45	8.3	\N	\N	A teenage boy with a sex therapist mother teams up with a high school classmate to set up an underground sex therapy clinic at school.	Comedy,  Drama	\N	\N
S.W.A.T.	2017      	2023      	\N	74	43	7.2	\N	\N	Follows a locally born and bred S.W.A.T. sergeant and his team of highly-trained men and women as they solve crimes in Los Angeles.	Action,  Adventure,  Crime	\N	\N
Heartstopper	2022      	Present   	\N	75	30	8.7	\N	\N	Teens Charlie and Nick discover their unlikely friendship might be something more as they navigate school and young love in this coming-of-age series.	Drama,  Romance	\N	\N
The Good Doctor	2017      	Present   	\N	76	41	8	\N	\N	Shaun Murphy, a young surgeon with autism and Savant syndrome, is recruited into the surgical unit of a prestigious hospital.	Drama	\N	\N
Fear the Walking Dead	2015      	2023      	\N	77	44	6.8	\N	\N	A Walking Dead spinoff set in Los Angeles, California. Follows two families who must band together to survive the undead apocalypse.	Drama,  Horror,  Sci-Fi	\N	\N
Beef	2023      	Present   	\N	78	30	8.1	\N	\N	Two people let a road rage incident burrow into their minds and slowly consume their every thought and action.	Comedy,  Drama	\N	\N
Happy Valley	2014      	2023      	\N	79	58	8.5	\N	\N	Yorkshire-based crime drama centering on the personal and professional life of Police Sergeant Catherine Cawood.	Crime,  Drama,  Thriller	\N	\N
The Twilight Zone	1959      	1964      	\N	80	51	9.1	\N	\N	Ordinary people find themselves in extraordinarily astounding situations, which they each try to solve in a remarkable manner.	Drama,  Fantasy,  Horror	\N	\N
Poker Face	2023      	Present   	\N	81	58	7.9	\N	\N	Charlie has an extraordinary ability to determine when someone is lying. She hits the road with her Plymouth Barracuda and with every stop encounters a new cast of characters and strange crimes she can't help but investigate and solve.	Comedy,  Crime,  Drama	\N	\N
The X Files	1993      	2018      	\N	82	45	8.6	\N	\N	Two F.B.I. Agents, Fox Mulder the believer and Dana Scully the skeptic, investigate the strange and unexplained, while hidden forces work to impede their efforts.	Crime,  Drama,  Mystery	\N	\N
Mad Men	2007      	2015      	\N	83	47	8.7	\N	\N	A drama about one of New York's most prestigious ad agencies at the beginning of the 1960s, focusing on one of the firm's most mysterious but extremely talented ad executives, Donald Draper.	Drama	\N	\N
Citadel	2023      	Present   	\N	84	None	6.1	\N	\N	Global spy agency Citadel has fallen, and its agents' memories were wiped clean. Now the powerful syndicate, Manticore, is rising in the void. Can the Citadel agents recollect their past and summon the strength to fight back?	Action,  Drama,  Thriller	\N	\N
Fargo	2014      	2023      	\N	85	53	8.9	\N	\N	Various chronicles of deception, intrigue and murder in and around frozen Minnesota. Yet all of these tales mysteriously lead back one way or another to Fargo, North Dakota.	Crime,  Drama,  Thriller	\N	\N
Lucifer	2016      	2021      	\N	86	42	8.1	\N	\N	Lucifer Morningstar has decided he's had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.	Crime,  Drama,  Fantasy	\N	\N
Smallville	2001      	2011      	\N	87	60	7.5	\N	\N	A young Clark Kent struggles to find his place in the world as he learns to harness his alien powers for good and deals with the typical troubles of teenage life in Smallville, Kansas.	Action,  Adventure,  Drama	\N	\N
Sons of Anarchy	2008      	2014      	\N	88	45	8.6	\N	\N	A biker struggles to balance being a father and being involved in an outlaw motorcycle club.	Crime,  Drama,  Thriller	\N	\N
The Great	2020      	Present   	\N	89	45	8.2	\N	\N	A royal woman living in rural Russia during the 18th century is forced to choose between her own personal happiness and the future of Russia, when she marries an Emperor.	Biography,  Comedy,  Drama	\N	\N
Invasion	2021      	Present   	\N	90	60	6.1	\N	\N	Earth is visited by an alien species that threatens humanity's existence. Events unfold in real time through the eyes of five ordinary people across the globe as they struggle to make sense of the chaos unraveling around them.	Drama,  Fantasy,  Sci-Fi	\N	\N
Castle	2009      	2016      	\N	91	43	8.1	\N	\N	After a serial killer imitates the plots of his novels, successful mystery novelist Richard "Rick" Castle receives permission from the Mayor of New York City to tag along with an NYPD homicide investigation team for research purposes.	Comedy,  Crime,  Drama	\N	\N
9-1-1	2018      	Present   	\N	92	43	7.9	\N	\N	Explores the high-pressure experiences of the first responders who are thrust into the most frightening, shocking, and heart-stopping situations.	Action,  Drama,  Thriller	\N	\N
Blue Bloods	2010      	Present   	\N	93	43	7.7	\N	\N	Revolves around a family of New York cops.	Crime,  Drama,  Mystery	\N	\N
Death in Paradise	2011      	Present   	\N	94	60	7.8	\N	\N	A Detective Inspector is transferred from London to the Caribbean island of Saint-Marie to investigate and solve complex murders.	Comedy,  Crime,  Drama	\N	\N
Murder, She Wrote	1984      	1996      	\N	95	50	7.2	\N	\N	Professional writer and amateur sleuth Jessica Fletcher uses her intellect, charm, and persistence to get to the bottom of every crime she encounters.	Crime,  Drama,  Mystery	\N	\N
The Vampire Diaries	2009      	2017      	\N	96	43	7.7	\N	\N	The lives, loves, dangers and disasters in the town, Mystic Falls, Virginia. Creatures of unspeakable horror lurk beneath this town as a teenage girl is suddenly torn between two vampire brothers.	Drama,  Fantasy,  Horror	\N	\N
The Last Kingdom	2015      	2022      	\N	97	60	8.5	\N	\N	As Alfred the Great defends his kingdom from Norse invaders, Uhtred--born a Saxon but raised by Vikings--seeks to claim his ancestral birthright.	Action,  Drama,  History	\N	\N
Delete	2023      	Present   	\N	98	45	6.3	\N	\N	A complicated relationship with secrets to hide, and a grim question to ponder: who do you want to delete from your life?	Drama,  Horror,  Romance	\N	\N
Riverdale	2017      	2023      	\N	99	45	6.5	\N	\N	While navigating the troubled waters of romance, school and family, Archie and his gang become entangled in dark Riverdale mysteries.	Crime,  Drama,  Mystery	\N	\N
Bridgerton	2020      	Present   	\N	100	60	7.4	\N	\N	The eight close-knit siblings of the Bridgerton family look for love and happiness in London high society. Inspired by Julia Quinn's best selling novels.	Drama,  History,  Romance	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rana
--

COPY public.users (user_id, username, first_name, last_name) FROM stdin;
\.


--
-- Name: casts casts_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_pkey PRIMARY KEY (actor_name);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (char_name);


--
-- Name: episodes episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (episode_title);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (user_id, series_title);


--
-- Name: studios studios_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.studios
    ADD CONSTRAINT studios_pkey PRIMARY KEY (studio_name);


--
-- Name: tv_series tv_series_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.tv_series
    ADD CONSTRAINT tv_series_pkey PRIMARY KEY (series_title);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: character character_actor_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_actor_name_fkey FOREIGN KEY (actor_name) REFERENCES public.casts(actor_name);


--
-- Name: episodes episodes_series_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_series_title_fkey FOREIGN KEY (series_title) REFERENCES public.tv_series(series_title);


--
-- Name: rating rating_series_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_series_title_fkey FOREIGN KEY (series_title) REFERENCES public.tv_series(series_title);


--
-- Name: rating rating_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: tv_series tv_series_char_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.tv_series
    ADD CONSTRAINT tv_series_char_name_fkey FOREIGN KEY (char_name) REFERENCES public."character"(char_name);


--
-- Name: tv_series tv_series_studio_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rana
--

ALTER TABLE ONLY public.tv_series
    ADD CONSTRAINT tv_series_studio_name_fkey FOREIGN KEY (studio_name) REFERENCES public.studios(studio_name);


--
-- PostgreSQL database dump complete
--

