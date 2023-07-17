import json
import psycopg2
import os

dir = os.getcwd()

# Connect to the database and don't forget to change the user and password based on your own
conn = psycopg2.connect(host="localhost", database="kkpk", user="postgres", password="12345678")

# Create a cursor to perform database operations
cursor = conn.cursor()

# Function to create tables
def createTable() :
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS book_information (
            bookID VARCHAR(10) NOT NULL,
            book_title VARCHAR(50),
            price INT,
            isbn VARCHAR(20),
            PRIMARY KEY (bookID)
    )
                   """)
    print("Table book_information created successfully")
    
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS book_genre (
            bookID VARCHAR(10) NOT NULL,
            genre VARCHAR(20),          
            PRIMARY KEY (bookID, genre),
            FOREIGN KEY (bookID) REFERENCES book_information(bookID)
    )
                   """)
    print("Table book_genre created successfully")
    
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS book_author (
            bookID VARCHAR(10) NOT NULL,
            author VARCHAR(50),
            PRIMARY KEY (bookID, author),
            FOREIGN KEY (bookID) REFERENCES book_information(bookID)
    )
                    """)
    print("Table book_author created successfully")

# Functions to insert data into the table
def insertBookInformation() :
    data_path = dir[:-3] + 'data\\book_details.json'
    with open(data_path) as file :
        data = json.load(file)
    
    for d in data :
        cursor.execute("INSERT INTO book_information (bookID, book_title, price, isbn) VALUES (%s, %s, %s, %s)", (d["Book ID"], d["Book Title"], d["Price"], d["ISBN"]))
    
    print("book_information.json stored successfully")

def insertBookGenre() :
    with open(dir[:-3] + 'data\\book_genre.json') as file :
        data = json.load(file)
    
    for d in data :
        cursor.execute("INSERT INTO book_genre (bookID, genre) VALUES (%s, %s)", (d["Book ID"], d["Genre"]))
    
    print("book_genre.json stored successfully")

def insertBookAuthor() :
    with open(dir[:-3] + 'data\\book_author.json') as file :
        data = json.load(file)
    
    for d in data :
        cursor.execute("INSERT INTO book_author (bookID, author) VALUES (%s, %s)", (d["Book ID"], d["Author"]))

    print("book_author.json stored successfully")

# Execute the function
createTable()
insertBookInformation()
insertBookGenre()
insertBookAuthor()

# Commit the changes to the database and close the cursor and connection
conn.commit()
cursor.close()
conn.close()