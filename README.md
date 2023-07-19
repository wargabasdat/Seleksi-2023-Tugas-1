<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  DATA SCRAPING, STORING, AND VISUALIZATION OF CRYPTO CURRENCIES at <a href="https://finance.yahoo.com/crypto/">Yahoo Finance</a>
  <br>
  <br>
</h2>

- Description of the data and DBMS (Why you choose it)
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author
## Description of the Data and DBMS

### Data
The data used in this project is obtained from Yahoo Finance and focuses on cryptocurrency information. The dataset provides real-time data for various cryptocurrencies such as Bitcoin, Ethereum, and others. Each entry in the dataset includes the following attributes:

- Symbol: The symbol or ticker representing the cryptocurrency (e.g., BTC-USD, ETH-USD).
- Name: The name or title of the cryptocurrency (e.g., Bitcoin, Ethereum).
- Price (Intraday): The current price of the cryptocurrency in the intraday market.
- Change: The change in the price of the cryptocurrency since the last trading session.
- % Change: The percentage change in the price of the cryptocurrency.
- Volume: The trading volume of the cryptocurrency.
- Market Cap: The market capitalization of the cryptocurrency, representing its total value in the market.
- Circulating Supply: The total circulating supply of the cryptocurrency, indicating the number of coins in circulation.

### Database Modelling & Data Storing
The data obtained from Yahoo Finance is stored in a PostgreSQL database, following a well-designed database schema based on the Entity-Relationship Diagram (ERD). The database schema consists of 7 tables and from the website scraping have 3 tables to efficiently store and manage the cryptocurrency data:

1. `Cryptocurrency` Table:
   - Symbol (Primary Key): The unique symbol representing the cryptocurrency.
   - Name: The name or title of the cryptocurrency.
   - Market Cap (in M): The market capitalization of the cryptocurrency, stored in millions.
   - Circulating Supply (in M): The circulating supply of the cryptocurrency, stored in millions.

2. `Price` Table:
   - PriceID (Primary Key): The unique identifier for each price data entry.
   - Symbol (Foreign Key): A reference to the cryptocurrency symbol in the `Cryptocurrency` table.
   - Price (Intraday): The current price of the cryptocurrency in the intraday market.
   - Change: The change in the price of the cryptocurrency since the last trading session.
   - % Change: The percentage change in the price of the cryptocurrency.

3. `Volume` Table:
   - VolumeID (Primary Key): The unique identifier for each volume data entry.
   - Symbol (Foreign Key): A reference to the cryptocurrency symbol in the `Cryptocurrency` table.
   - Total Volume All Currencies in 24hr (in M): The total trading volume of the cryptocurrency in the last 24 hours, stored in millions.


## Program Specification
This program is build by using <b> Python 3.11.2 </b>. The main libary used to scrape website is <b>Selenium </b>. All the datas that are extracted from website will be stored in <b> PostgreSQL </b> database. This program use <b> PostgreSQL 15.3 </b> and visualized using <b> Pandas<b>.

## How to Use
1. Clone this repository 
```sh
  $ git clone https://github.com/AJason36/Seleksi-2023-Tugas-1.git
```
2. Open the cloned folder
```sh
  $ cd Seleksi-2023-Tugas-1
```
3. Open the "Data Scraping" and src folder
```sh
  $ cd "Data Scraping"
  $ cd src
```

4. Run the scraping program in the file
```sh
  $ scraping.ipynb
```
5. Set up database in PostgreSQL and modify the password in 'data_storing.py'. for example:
```sh
  host="localhost",
  database="basdat",
  user="jason",
  password="*****",
  port=5432
```

6. Run the data storing program
```sh
  $ python data_storing.py
```

7. Export the database to sql file
```sh
  $ pg_dump -U <username> -d <database_name> -s > <output_file.sql>
```

## JSON Structure
There are three JSON files that are generated from the scraping process. The JSON files are as follows:
1. `cryptocurrency_data.json`
```json
{
  "Symbol": "cryptocurrencies' symbol",
  "Name": "cryptocurrencies' name",
  "Market Cap (in M)": "cryptocurrencies' market cap in Million",
  "Circulating Supply (in M)":"cryptocurrencies' circulating supply in Million"
}
```
2. `price_data.json`
```json
{
  "Symbol": "cryptocurrencies' symbol",
  "Price (Intraday)": "cryptocurrencies' price in intraday market",
  "Change": "cryptocurrencies' change in price since last trading session",
  "% Change": "cryptocurrencies' percentage change in price"
}
```

3. `volume_data.json`
```json
{
  "Symbol": "cryptocurrencies' symbol",
  "Total Volume All Currencies in 24hr (in M)": "cryptocurrencies' total trading volume in the last 24 hours in Million"
}
```
## Database Structure
The entity relationship diagram for cryptocurrencies's database can be seen at the picture below
<img src="Data Storing/design/ERD.png"/>

The relational diagram for cryptocurrencies's database can be seen at the picture below
<img src="Data Storing/design/Relational Model.png" />

## ERD to Relational Diagram Translation Process
The translation process from ERD to relational diagram are:
1. 'Is A' relation between `Crypto_currencies` and `Price_Data` table is translated into `Crypto_currencies` table and `Price_Data` table. The `Crypto_currencies` table has a primary key `Symbol` and the `Price_Data` table has a primary key `PriceID` and a foreign key `Symbol` that references the `Symbol` attribute in the `Crypto_currencies` table. Same goes to `Volume_Data` table.

2. 'Many to One' relation between `Transaction` and `Crypto_currencies` table is translated into `Transaction` table and `Crypto_currencies` table. The `Transaction` table has a primary key `TransactionID` and a foreign key `Symbol` that references the `Symbol` attribute in the `Crypto_currencies` table.

3. 'Many to One' relation between `Transaction` and `Users` table is translated into `Transaction` table and `Users` table. The `Transaction` table has a primary key `TransactionID` and a foreign key `UserID` that references the `UserID` attribute in the `Users` table.

4. 'Many to One' relation between `Wallet` and `Users` table is translated into `Wallet` table and `Users` table. The `Wallet` table has a primary key `WalletID` and a foreign key `UserID` that references the `UserID` attribute in the `Users` table.

5. 'Many to Many' relation between `Wallet` and `Transaction` is translated into `Wallet` table, `Transaction` table, and `Transaction_History` table as the bridge table. The `Wallet` table has a primary key `WalletID` and the `Transaction` table has a primary key `TransactionID`. The `Transaction_History` table has a primary key `TransactionHistoryID` and two foreign keys `WalletID` and `TransactionID` that references the `WalletID` attribute in the `Wallet` table and the `TransactionID` attribute in the `Transaction` table.

## Screenshot
### Data Scraping
<img src="Data Scraping/screenshot/clean_data.jpg" />
<img src="Data Scraping/screenshot/convert.jpg" />
<img src="Data Scraping/screenshot/get_driver.jpg" />
<img src="Data Scraping/screenshot/get_table_header.jpg" />
<img src="Data Scraping/screenshot/get_table_rows.jpg" />
<img src="Data Scraping/screenshot/parse_table_rows.jpg" />
<img src="Data Scraping/screenshot/parse_multiple_pages.jpg" />
<img src="Data Scraping/screenshot/scrape_data.png" />
<img src="Data Scraping/screenshot/main.jpg" />

### Data Storing
<img src="Data Storing/screenshot/crypto_currencies.jpg" />
<img src="Data Storing/screenshot/price_data.jpg" />
<img src="Data Storing/screenshot/volume_data.jpg" />
<img src="Data Storing/screenshot/users.jpg" />
<img src="Data Storing/screenshot/wallet.jpg" />
<img src="Data Storing/screenshot/transaction.jpg" />
<img src="Data Storing/screenshot/transaction_history.jpg" />

## Reference
1. JSON
2. Psycopg2
3. Selenium
4. Pandas
5. PostgreSQL
6. MatPlotLib

## Author
Alexander Jason - 13521100

