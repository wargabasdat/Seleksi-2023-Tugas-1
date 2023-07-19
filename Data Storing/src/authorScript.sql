/* Storing: author.json */
/* Pre-req: --- */
\! echo "-- Storing: author.json in 'author' table --"
CREATE TABLE IF NOT EXISTS temp (data jsonb);
\COPY temp (data) FROM './Data Scraping/data/author.json';

CREATE TABLE IF NOT EXISTS author (
    authorid VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    authorname VARCHAR(55) NOT NULL,
    description TEXT
);

INSERT INTO author
SELECT data->>'authorID', data->>'authorName', data->>'description'
FROM temp;

DROP TABLE temp;

