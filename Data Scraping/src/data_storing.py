import psycopg2
import json
import os

# Establish a connection to the PostgreSQL database

current_directory = os.path.dirname(os.path.abspath(__file__))
data_folder = os.path.abspath(os.path.join(current_directory, '..', 'data'))

crypto_file_path =  os.path.join(data_folder,"cryptocurrency_data.json")
price_file_path =  os.path.join(data_folder,"price_data.json")
volume_file_path =  os.path.join(data_folder,"volume_data.json")

# Load JSON data from the file
with open(crypto_file_path) as file:
    crypto_data = json.load(file)

with open(price_file_path) as file:
    price_data = json.load(file)

with open(volume_file_path) as file:
    volume_data = json.load(file)

conn = psycopg2.connect(
    host="localhost",
    database="basdat",
    user="jason",
    password="*****",
    port=5432
)
 # Creating cursor object to execute SQL queries
cursor = conn.cursor()
    
# Defining table schema
schema = """
        CREATE TABLE IF NOT EXISTS crypto_currencies(
            Symbol VARCHAR(255) PRIMARY KEY,
            Name VARCHAR(255) NOT NULL,
            Market_Cap FLOAT NOT NULL,
            Circulating_Supply FLOAT NOT NULL
        );
        CREATE TABLE IF NOT EXISTS price_data (
            Symbol VARCHAR(255) PRIMARY KEY,
            Price FLOAT NOT NULL,
            Change FLOAT NOT NULL,
            Per_change FLOAT NOT NULL,
            FOREIGN KEY (Symbol) REFERENCES crypto_currencies(Symbol)
        );

        CREATE TABLE IF NOT EXISTS volume_data (
            Symbol VARCHAR(255) PRIMARY KEY,
            Volume FLOAT,
            FOREIGN KEY (Symbol) REFERENCES crypto_currencies(Symbol)
        );

        CREATE TABLE IF NOT EXISTS users (
            user_id SERIAL PRIMARY KEY,
            username VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL
        );
        CREATE TABLE wallet (
            wallet_id SERIAL PRIMARY KEY,
            user_id INTEGER REFERENCES users(user_id),
            balance FLOAT NOT NULL DEFAULT 0
        );
        CREATE TABLE IF NOT EXISTS transaction (
            transaction_id SERIAL PRIMARY KEY,
            user_id INTEGER NOT NULL REFERENCES users(user_id),
            crypto_symbol VARCHAR(255) NOT NULL REFERENCES crypto_currencies(symbol),
            transaction_time TIMESTAMP NOT NULL,
            status BOOLEAN NOT NULL DEFAULT FALSE,
            amount FLOAT NOT NULL
        );
        
        CREATE TABLE IF NOT EXISTS transaction_history (
            transaction_id INTEGER NOT NULL REFERENCES transaction(transaction_id),
            wallet_id INTEGER NOT NULL REFERENCES wallet(wallet_id)
        );
    """
    
# Execute the schema creation query
cursor.execute(schema)

insert_crypto_query = "INSERT INTO crypto_currencies (Symbol, Name, Market_Cap, Circulating_Supply) VALUES (%s, %s, %s, %s)"
    
for item in crypto_data:
    values = (
        item["Symbol"],
        item["Name"],
        item["Market Cap (in M)"],
        item["Circulating Supply (in M)"]
    )
    cursor.execute(insert_crypto_query, values)
# Insert data into the table
insert_price_query = "INSERT INTO price_data (Symbol, Price, Change, Per_Change) VALUES (%s, %s, %s, %s)"
    
for price in price_data:
    values = (
        price["Symbol"],
        price["Price (Intraday)"],
        price["Change"],
        price["% Change"]
    )
    cursor.execute(insert_price_query, values)

insert_volume_query = "INSERT INTO volume_data (Symbol, Volume) VALUES (%s, %s)"
    
for volume in volume_data:
    values2 = (
        volume["Symbol"],
        volume["Total Volume All Currencies in 24hr (in M)"]
    )
    cursor.execute(insert_volume_query, values2)

# Commit the changes
conn.commit()
    
# Close the cursor and connection
cursor.close()
conn.close()
