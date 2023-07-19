/* StoringScript calls authorScript, publisherScript, bookScript and elseScript */
/* Reference: https://konbert.com/blog/import-json-into-postgres-using-copy */

CREATE DATABASE cgnosdb;
\! echo "-- Created: CGNOSDB Database --"
\c cgnosdb
\i './Data Storing/src/authorScript.sql'
\! echo "-- Inserted: Author --"
\i './Data Storing/src/publisherScript.sql'
\! echo "-- Inserted: Publisher --"
\i './Data Storing/src/bookScript.sql'
\! echo "-- Inserted: Book --"
\i './Data Storing/src/elseScript.sql'
\! echo "-- Inserted: The Rest of Relation.. --"