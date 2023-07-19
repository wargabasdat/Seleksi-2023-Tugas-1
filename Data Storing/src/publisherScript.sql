/* Storing: publisher.json */
/* Pre-req: --- */
\! echo "-- Storing: publisher.json in 'publisher' table --"
CREATE TABLE IF NOT EXISTS temp (data jsonb);
\COPY temp (data) FROM './Data Scraping/data/publisher.json';

CREATE TABLE IF NOT EXISTS publisher (
    publisherid VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    publishername VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(20) NOT NULL
);

INSERT INTO publisher
SELECT data->>'publisherID', data->>'publisherName', data->>'address', data->>'phone'
FROM temp;

DROP TABLE temp;

