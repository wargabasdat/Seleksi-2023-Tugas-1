import psycopg2
import json

with open('goodreads.json', 'r') as json_file:
    json_data = json.load(json_file)

conn = psycopg2.connect(
    host='localhost',
    port=5432,
    database='goodreads',
    user='postgres',
    password='aniqa'
)

cursor = conn.cursor()

# Create the 'authors' table
create_tableauthor_query = '''
CREATE TABLE IF NOT EXISTS authors (
    author_name VARCHAR PRIMARY KEY,
    description TEXT,
    books_written INTEGER
);
'''
cursor.execute(create_tableauthor_query)

# Create the 'books' table
create_tablebook_query = '''
CREATE TABLE IF NOT EXISTS books (
    rank INTEGER PRIMARY KEY,
    book_name TEXT,
    author TEXT,
    details VARCHAR(5000),
    pages INTEGER,
    ratings FLOAT,
    published DATE,
    FOREIGN KEY (author) REFERENCES authors(author_name)
);
'''
cursor.execute(create_tablebook_query)

# Create the 'book_genres' table
create_table_genres_query = '''
CREATE TABLE IF NOT EXISTS book_genres (
    rank INTEGER REFERENCES books(rank),
    genre TEXT
);
'''
cursor.execute(create_table_genres_query)

# Insert data into the 'authors' table
for author in json_data['Authors']:
    author_name = author['Author_Name']
    description = author['Author\'s Description']
    books_written = author['Author\'s Books Written']

    # Limit the 'description' length and add "..." for longer texts
    description_max_length = 5000

    if description and len(description) > description_max_length:
        description = description[:description_max_length] + "..."

    cursor.execute(
        """
        INSERT INTO authors (author_name, description, books_written)
        VALUES (%s, %s, %s)
        """,
        (
            author_name,
            description,
            books_written
        )
    )


# Insert data into the 'books' table
for book in json_data['Books']:
    rank = book['Rank']
    title = book['Book_Name']
    pages = book['Pages']
    ratings = book['Ratings']
    details = book['Details']
    published = book['Published']
    genres = book['Genres']

    # Limit the 'details' length and add "..." for longer texts
    details_max_length = 5000

    if details and len(details) > details_max_length:
        details = details[:details_max_length] + "..."

    title_max_length = 500
    if len(title) > title_max_length:
        title = title[:title_max_length] + "..."

    cursor.execute(
        """
        INSERT INTO books (rank, book_name, author, details, pages, ratings, published)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """,
        (
            rank,
            title,
            book['Author'],
            details,
            pages,
            ratings,
            published
        )
    )

    # Insert data into the 'book_genres' table
    for genre in genres:
        cursor.execute(
            """
            INSERT INTO book_genres (rank, genre)
            VALUES (%s, %s)
            """,
            (
                rank,
                genre
            )
        )   

# Commit the changes to the database
conn.commit()

# Close the cursor and database connection
cursor.close()
conn.close()
