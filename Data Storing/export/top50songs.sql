-- Data yang dari Webscrap hanya data uturan lagu, untuk informasi dan penyanyi dicari sendiri

CREATE TABLE top50songs(
    rank INTEGER NOT NULL,
    song VARCHAR(50) NOT NULL,
    singer VARCHAR(50) NOT NULL,
    yearRelease INTEGER NOT NULL,
    PRIMARY KEY(rank)
);

CREATE TABLE songInfo(
    idSong INTEGER,
    song  VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    album VARCHAR(50),
    PRIMARY KEY(idSong)
);

CREATE TABLE singerInfo(
    idSinger INTEGER,
    singer  VARCHAR(50) NOT NULL,
    types VARCHAR(50) NOT NULL,
    bornPlace VARCHAR(50),
    bornDate DATE,
    PRIMARY KEY(idSinger),
    CHECK (
        (types IN ('Boy Singer', 'Girl Singer') AND bornPlace IS NOT NULL AND bornDate IS NOT NULL)
        OR
        (types NOT IN ('Boy Singer', 'Girl Singer') AND bornPlace IS NULL AND bornDate IS NULL)
    )
);

CREATE TABLE topSongInfo(
    rank INTEGER NOT NULL,
    idSong INTEGER NOT NULL,
    PRIMARY KEY(rank,idSong),
    FOREIGN KEY(rank) REFERENCES top50songs(rank),
    FOREIGN KEY(idSong) REFERENCES songInfo(idSong)
);

CREATE TABLE topSingerInfo(
    rank INTEGER NOT NULL,
    idSinger INTEGER NOT NULL,
    PRIMARY KEY(rank,idSinger),
    FOREIGN KEY(rank) REFERENCES top50songs(rank),
    FOREIGN KEY(idSinger) REFERENCES singerInfo(idSinger)
);

-- Data yang diambil hanya yang ada di peringkat 50 teratas
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (50,'Gasolina','Daddy Yankee',2010);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (49,'Doo Wop (That Thing)','Lauryn Hill',1998);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (48,'Idioteque','Radiohead',2000);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (47,'Tiny Dancer','Elton John',1972);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (46,'Paper Planes','M.I.A.',2008);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (45,'Alright','Kendrick Lamar',2015);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (44,'Billie Jean','Michael Jackson',1982);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (43,'My Girl','Temptations',1965);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (42,'Redemption Song','Bob Marley',1980);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (41,'Love Will Tear Us Apart','Joy Division',1980);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (40,'All Along the Watchtower','Jimi Hendrix',1968);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (39,'B.O.B.','Outkast',2000);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (38,'(Sittin’ on) The Dock of the Bay','Otis Redding',1967);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (37,'When Doves Cry','Prince',1984);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (36,'Seven Nation Army','White Stripes',2003);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (35,'Tutti Frutti','Little Richard',1955);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (34,'Papa’s Got a Brand New Bag','James Brown',1966);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (33,'Johnny B. Goode','Chuck Berry',1958);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (32,'Juicy','Notorious B.I.G.',1994);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (31,'Satisfaction','The Rolling Stones',1965);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (30,'Royals','Lorde',2011);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (29,'Nuthin’ but a ‘G’ Thang','Dr. Dre',1992);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (28,'Once in a Lifetime','Talking Heads',1980);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (27,'Born to Run','Bruce Springsteen',1975);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (26,'A Case of You','Joni Mitchell',1971);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (25,'Runaway','Kanye West',2010);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (24,'A Day in the Life','The Beatles',1967);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (23,'’Heroes’','David Bowie',1977);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (22,'Be My Baby','Ronettes',1963);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (21,'Strange Fruit','Billie Holiday',1939);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (20,'Dancing on My Own','Robyn',2010);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (19,'Imagine','John Lennon',1971);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (18,'Purple Rain','Prince',1984);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (17,'Bohemian Rhapsody','Queen',1975);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (16,'Crazy in Love','Beyonce',2003);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (15,'I Want to Hold Your Hand','The Beatles',1963);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (14,'Waterloo Sunset','The Kinks',1967);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (13,'Gimme Shelter','The Rolling Stones',1969);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (12,'Superstition','Stevie Wonder',1972);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (11,'God Only Knows','Beach Boys',1966);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (10,'‘Hey Ya!','Outkast',2003);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (9,'Dreams','Fleetwood Mac',1977);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (8,'Get Ur Freak On','Missy Elliott',2001);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (7,'Strawberry Fields Forever','The Beatles',1967);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (6,'What’s Goin’ On?','Marvin Gaye',1971);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (5,'Smells Like Teen Spirit','Nirvana',1991);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (4,'Like a Rolling Stone','Bob Dylan',1965);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (3,'A Change is Gonna Come','Sam Cooke',1964);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (2,'Fight the Power','Public Enemy',1989);
INSERT INTO top50songs(rank,song,singer,yearRelease) VALUES (1,'Respect','Aretha Franklin',1967);

INSERT INTO songInfo(idSong,song,genre,album) VALUES (50,'Gasolina','Reggaeton','Barrio Fino');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (49,'Doo Wop (That Thing)','Hip Hop','The Miseducation of Lauryn Hill');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (48,'Idioteque','Electronica','Kid A');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (47,'Tiny Dancer','Rock','Madman Across the Water');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (46,'Paper Planes','Hip Hop','Kala');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (45,'Alright','Hip Hop','To Pimp a Butterfly');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (44,'Billie Jean','Pop','Thriller');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (43,'My Girl','Soul','The Temptations Sing Smokey');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (42,'Redemption Song','Folk','Uprising');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (41,'Love Will Tear Us Apart','Post Punk',NULL);
INSERT INTO songInfo(idSong,song,genre,album) VALUES (40,'All Along the Watchtower','Rock','Electric Ladyland');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (39,'B.O.B.','Hip Hop','Stankonia');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (38,'(Sittin’ on) The Dock of the Bay','Soul','The Dock of the Bay');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (37,'When Doves Cry','Pop','Purple Rain');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (36,'Seven Nation Army','Rock','Elephant');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (35,'Tutti Frutti','Rock','Here’s Little Richard');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (34,'Papa’s GotBrand New Bag','Soul',NULL);
INSERT INTO songInfo(idSong,song,genre,album) VALUES (33,'Johnny B. Goode','Rock','Chuck Berry Is on Top');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (32,'Juicy','Hip Hop','Ready to Die');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (31,'Satisfaction','Rock','Out of Our Heads');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (30,'Royals','Pop','Pure Heroine');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (29,'Nuthin’ but a ‘G’ Thang','Hip Hop','The Chronic');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (28,'Once in a Lifetime','New Wave','Remain in Light');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (27,'Born to Run','Rock','Born to Run');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (26,'A Case of You','Folk','Blue');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (25,'Runaway','Hip Hop','My Beautiful Dark Twisted Fantasy');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (24,'A Day in the Life','Rock','Sgt. Pepper’s Lonely Hearts Club Band');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (23,'’Heroes’','Rock','Heroes');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (22,'Be My Baby','Pop','Presenting the Fabulous Ronettes');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (21,'Strange Fruit','Jazz','Lady Sings the Blues');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (20,'Dancing on My Own','Electropop','Body Talk');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (19,'Imagine','Rock','Imagine');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (18,'Purple Rain','Rock','Purple Rain');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (17,'Bohemian Rhapsody','Rock','A Night at the Opera');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (16,'Crazy in Love','R&B','Dangerously in Love');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (15,'I Want to Hold Your Hand','Rock','Meet the Beatles!');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (14,'Waterloo Sunset','Rock','Something Else by the Kinks');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (13,'Gimme Shelter','Rock','Let It Bleed');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (12,'Superstition','Funk','Talking Book');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (11,'God Only Knows','Rock','Pet Sounds');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (10,'‘Hey Ya!','Hip Hop','Speakerboxxx/The Love Below');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (9,'Dreams','Rock','Rumours');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (8,'Get Ur Freak On','Hip Hop','Miss E… So Addictive');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (7,'Strawberry Fields Forever','Rock','Magical Mystery Tour');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (6,'What’s Goin’ On?','Soul','What’s Going On');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (5,'Smells Like Teen Spirit','Rock','Nevermind');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (4,'Like a Rolling Stone','Rock','Highway 61 Revisited');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (3,'A Change is Gonna Come','Soul','Ain’t That Good News');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (2,'Fight the Power','Hip Hop','Fear of a Black Planet');
INSERT INTO songInfo(idSong,song,genre,album) VALUES (1,'Respect','Soul','I Never Loved a Man the Way I Love You');

INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (45,'Daddy Yankee','Boy Singer','San Juan','1977-02-03');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (44,'Lauryn Hill','Girl Singer','East Orange','1975-05-26');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (43,'Radiohead','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (42,'Elton John','Boy Singer','Pinner','1947-03-25');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (41,'M.I.A.','Girl Singer','Hounslow','1975-07-18');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (40,'Kendrick Lamar','Boy Singer','Compton','1987-06-17');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (39,'Michael Jackson','Boy Singer','Gary','1958-08-29');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (38,'Temptations','Vocal Group',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (37,'Bob Marley','Boy Singer','Nine Mile','1945-02-06');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (36,'Joy Division','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (35,'Jimi Hendrix','Boy Singer','Seattle','1942-11-27');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (34,'Otis Redding','Boy Singer','Dawson','1941-09-09');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (33,'White Stripes','Duo',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (32,'Little Richard','Boy Singer','Macon','1932-12-05');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (31,'James Brown','Boy Singer','Barnwell','1933-05-03');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (30,'Chuck Berry','Boy Singer','St. Louis','1926-10-18');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (29,'Notorious B.I.G.','Boy Singer','Brooklyn','1972-05-21');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (28,'Lorde','Girl Singer','Auckland','1996-11-07');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (27,'Dr. Dre','Boy Singer','Compton','1965-02-18');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (26,'Talking Heads','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (25,'Bruce Springsteen','Boy Singer','Long Branch','1949-09-23');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (24,'Joni Mitchell','Girl Singer','Fort Macleod','1943-11-07');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (23,'Kanye West','Boy Singer','Atlanta','1977-06-08');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (22,'David Bowie','Boy Singer','Brixton','1947-01-08');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (21,'Ronettes','Vocal Group',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (20,'Billie Holiday','Girl Singer','Philadelphia','1915-04-07');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (19,'Robyn','Girl Singer','Stockholm','1979-06-12');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (18,'John Lennon','Boy Singer','Liverpool','1940-10-09');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (17,'Prince','Boy Singer','Minneapolis','1958-06-07');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (16,'Queen','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (15,'Beyonce','Girl Singer','Houston','1981-09-04');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (14,'The Kinks','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (13,'The Rolling Stones','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (12,'Stevie Wonder','Boy Singer','Saginaw','1950-05-13');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (11,'Beach Boys','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (10,'Outkast','Duo',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (9,'Fleetwood Mac','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (8,'Missy Elliott','Girl Singer','Portsmouth','1971-07-01');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (7,'The Beatles','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (6,'Marvin Gaye','Boy Singer','Washington','1939-04-02');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (5,'Nirvana','Band',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (4,'Bob Dylan','Boy Singer','Duluth','1941-05-24');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (3,'Sam Cooke','Boy Singer','Clarksdale','1931-01-22');
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (2,'Public Enemy','Vocal Group',NULL,NULL);
INSERT INTO singerInfo(idSinger,singer,types,bornPlace,bornDate) VALUES (1,'Aretha Franklin','Girl Singer','Memphis','1942-03-25');

INSERT INTO topSongInfo(rank,idSong) VALUES(50,50);
INSERT INTO topSongInfo(rank,idSong) VALUES(49,49);
INSERT INTO topSongInfo(rank,idSong) VALUES(48,48);
INSERT INTO topSongInfo(rank,idSong) VALUES(47,47);
INSERT INTO topSongInfo(rank,idSong) VALUES(46,46);
INSERT INTO topSongInfo(rank,idSong) VALUES(45,45);
INSERT INTO topSongInfo(rank,idSong) VALUES(44,44);
INSERT INTO topSongInfo(rank,idSong) VALUES(43,43);
INSERT INTO topSongInfo(rank,idSong) VALUES(42,42);
INSERT INTO topSongInfo(rank,idSong) VALUES(41,41);
INSERT INTO topSongInfo(rank,idSong) VALUES(40,40);
INSERT INTO topSongInfo(rank,idSong) VALUES(39,39);
INSERT INTO topSongInfo(rank,idSong) VALUES(38,38);
INSERT INTO topSongInfo(rank,idSong) VALUES(37,37);
INSERT INTO topSongInfo(rank,idSong) VALUES(36,36);
INSERT INTO topSongInfo(rank,idSong) VALUES(35,35);
INSERT INTO topSongInfo(rank,idSong) VALUES(34,34);
INSERT INTO topSongInfo(rank,idSong) VALUES(33,33);
INSERT INTO topSongInfo(rank,idSong) VALUES(32,32);
INSERT INTO topSongInfo(rank,idSong) VALUES(31,31);
INSERT INTO topSongInfo(rank,idSong) VALUES(30,30);
INSERT INTO topSongInfo(rank,idSong) VALUES(29,29);
INSERT INTO topSongInfo(rank,idSong) VALUES(28,28);
INSERT INTO topSongInfo(rank,idSong) VALUES(27,27);
INSERT INTO topSongInfo(rank,idSong) VALUES(26,26);
INSERT INTO topSongInfo(rank,idSong) VALUES(25,25);
INSERT INTO topSongInfo(rank,idSong) VALUES(24,24);
INSERT INTO topSongInfo(rank,idSong) VALUES(23,23);
INSERT INTO topSongInfo(rank,idSong) VALUES(22,22);
INSERT INTO topSongInfo(rank,idSong) VALUES(21,21);
INSERT INTO topSongInfo(rank,idSong) VALUES(20,20);
INSERT INTO topSongInfo(rank,idSong) VALUES(19,19);
INSERT INTO topSongInfo(rank,idSong) VALUES(18,18);
INSERT INTO topSongInfo(rank,idSong) VALUES(17,17);
INSERT INTO topSongInfo(rank,idSong) VALUES(16,16);
INSERT INTO topSongInfo(rank,idSong) VALUES(15,15);
INSERT INTO topSongInfo(rank,idSong) VALUES(14,14);
INSERT INTO topSongInfo(rank,idSong) VALUES(13,13);
INSERT INTO topSongInfo(rank,idSong) VALUES(12,12);
INSERT INTO topSongInfo(rank,idSong) VALUES(11,11);
INSERT INTO topSongInfo(rank,idSong) VALUES(10,10);
INSERT INTO topSongInfo(rank,idSong) VALUES(9,9);
INSERT INTO topSongInfo(rank,idSong) VALUES(8,8);
INSERT INTO topSongInfo(rank,idSong) VALUES(7,7);
INSERT INTO topSongInfo(rank,idSong) VALUES(6,6);
INSERT INTO topSongInfo(rank,idSong) VALUES(5,5);
INSERT INTO topSongInfo(rank,idSong) VALUES(4,4);
INSERT INTO topSongInfo(rank,idSong) VALUES(3,3);
INSERT INTO topSongInfo(rank,idSong) VALUES(2,2);
INSERT INTO topSongInfo(rank,idSong) VALUES(1,1);

INSERT INTO topSingerInfo(rank,idSinger) VALUES(50,45);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(49,44);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(48,43);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(47,42);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(46,41);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(45,40);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(44,39);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(43,38);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(42,37);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(41,36);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(40,35);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(39,10);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(38,34);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(37,18);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(36,33);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(35,32);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(34,31);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(33,30);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(32,29);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(31,13);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(30,28);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(29,27);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(28,26);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(27,25);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(26,24);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(25,23);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(24,7);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(23,22);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(22,21);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(21,20);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(20,19);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(19,18);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(18,17);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(17,16);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(16,15);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(15,7);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(14,14);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(13,13);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(12,12);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(11,11);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(10,10);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(9,9);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(8,8);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(7,7);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(6,6);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(5,5);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(4,4);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(3,3);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(2,2);
INSERT INTO topSingerInfo(rank,idSinger) VALUES(1,1);