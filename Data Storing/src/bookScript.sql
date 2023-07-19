/* Storing: book.json */
/* Pre-req: author & publisher table */
\! echo "-- Storing: book.json in 'book' table --"
CREATE TABLE IF NOT EXISTS temp (data jsonb);

\COPY temp (data) FROM './Data Scraping/data/book.json' WITH (format csv, quote e'\x01', delimiter e'\x02', escape e'\x0d');

CREATE TABLE IF NOT EXISTS book (
    isbn VARCHAR(13) PRIMARY KEY UNIQUE NOT NULL,
    authorid VARCHAR(5) NOT NULL REFERENCES author(authorid),
    title VARCHAR(100) NOT NULL,
    baseprice INT NOT NULL,
    description TEXT,
    pagenum INT,
    publisherid VARCHAR(5) NOT NULL REFERENCES publisher(publisherid),
    publishdate DATE NOT NULL,
    weight REAL NOT NULL,
    width REAL NOT NULL,
    length REAL,
    language VARCHAR(20)
);

INSERT INTO book
SELECT data->>'isbn', data->>'authorID', data->>'title', (data->>'basePrice')::INT, data->>'description', (data->>'pageNum')::INT, data->>'publisherID', (data->>'publishDate')::DATE, (data->>'weight')::REAL, (data->>'width')::REAL, (data->>'length')::REAL, data->>'language'
FROM temp;

DROP TABLE temp;

\! echo "-- Created 'bookData' View to not show the book (long~~) description --"
CREATE VIEW bookData AS (
    SELECT isbn, authorid, title, baseprice, pagenum, publisherid, publishdate, weight, width, length, language
    FROM book
);
\! echo "-- Created 'bookData' view! --" 
