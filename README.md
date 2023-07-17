<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>


## Data and DBMS Description
This program uses badminton players's rangking from all categories (men's singles, women's singles, men doubles, women doubles, and mixed doubles).All datas are scraped from https://bwfbadminton.com/ranking on 8th July 2023.

From that website, author extract few informations from players accros the world. Few datas that extracted are player's firstname, lastname, country, rangking, and points. 

Author used this data because the data is ordered neatly on the website. Moreover, this data provides enough and compact information for readers.

The DBMS used in this program is PostgreSQL since it is widely used by many people and has useful features.

## Program Spesification
This program is build by using <b> Python 3.11.2 </b>. The main libary used to scrape website is <b>Selenium </b>. All the datas that are extracted from website will be stored in <b> PostgreSQL </b> database. This program use <b> PostgreSQL 15.3 </b>.

## How to Use

### Data Scraping
1. Clone this repository 
```sh
  $ git clone https://github.com/nathaniacalista01/Seleksi-2023-Tugas-1.git
```
2. Open the cloned folder
```sh
  $ cd Seleksi-2023-Tugas-1
```
3. Run the scraping program 
```sh
  $ python -m src.scraping
```

4. By default, program will only scrape men's singles data. If you want to scrape another data, you can uncomment several functions in main function

### Data Storing 
1. Install <b>PostgreSQL</b> and make sure you have <b>pgAdmin 4</b> on your device
2. Create <b>badminton </b> database on pgAdmin 4
3. Enter your password on <b>conn </b> variable at <b>database.py file </b> and at <b>fetch.py file </b>
4. Run the database program to create all tables needed
```sh
  $ python -m src.database
```
5. Run the fetch program to insert all data from json file to tables
```sh
  $ python -m src.fetch
```
6. Check the pgAdmin 4 to make sure all datas are saved succesfully

## JSON Structure
There are 3 JSON's structures can be obtained from the website.
1. players.json <br>
This json structure holds information about badminton's player
```json
  {
    "id" : "player's id",
    "firstName" : "player's first name",
    "lastName" : "player's last name",
    "country" : "player's country",
    "gender" : "players'gender"
  }
```

2. single_statistics.json <br>
This json structure holds information about men's singles and women's singles statistics

```json
  {
    "points" : "single player's points",
    "rank" : "single player's current ranks",
    "id" : "player id",
    "type" : "single statistic's type, either men_single or women_single"
  }
```

3. double_statistics.json <br>
This json structure holds information about women doubles, men doubles, and mixed doubles statistics
```json
  {
    "firstPlayerId" : "first player's id refer to players table",
    "secondPlayerId" : "second player's id refer to players table",
    "rank" : "the pair ranks",
    "points" : "the pair's points",
    "type" : "double's statistics type, either women_double, men_double or mixed_double"
  }
```
## Database Structure (ERD and Relational)

The entity relationship diagram for badminton's database can be seen at the picture below
<img src="Data Storing/design/ER Diagram.png"/>

The relational diagram for badminton's database can be seen at the picture below
<img src="Data Storing/design/Relational Diagram.png" />

## ERD to Relational Database Transformation

The translating process from ERD to relation database are listed below : 

1.Create separate columns for every component attributes of any composite attribute.<br>
At this database, there is a composite attribute at players's relation

2.Create table for all strong entities. In this case, there are 9 tables : 
- players
- singlestatistics 
- doublestatistics
- mensinglestatistics
- womensinglestatistics
- mendoublestatistics
- womendoublestatistics
- mixeddoublestatistics
- tournaments

3.Create table for many to many relationships.<br>
In this database, create new table to describe relationships between players and tournaments. On <b>database.py</b>, author create new tables called <b>tournamentparticipants</b> to desribe this relation.<br>
tournamentparticipants's attributes are tournament's id, player's id and tournamentparticipant's id.

## Screenshoot Program

### Data Scraping

1. <b>Scrape men singles </b><br>
Algorithm to scrape men singles data can be seen at the picture below
<img src="Data Scraping/screenshot/scrape man single data.png" />

2. <b> Scrape women singles</b> <br>
Algorithm to scrape women singles data can be seen at the picture below
<img src="Data Scraping/screenshot/scrape women single data.png" />

3. <b>Scrape men doubles</b> <br>
Algorithm to scrape men doubles data can be seen at the picture below
<img src="Data Scraping/screenshot/scrape men double data.png" />

4. <b>Scrape women doubles</b> <br>
Algorithm to scrape men doubles data can be seen at the picture below
<img src="Data Scraping/screenshot/scrape women double data.png" />
5. <b>Scrape mixed doubles</b> <br>
Algorithm to scrape mixed doubles data can be seen at the picture below
<img src="Data Scraping/screenshot/scrape mixed double data.png" />

<b> Fetch Data Algorithm </b> <br>
Algorithm to fetch single data can be seen at pictures below
<img src="Data Scraping/screenshot/algorithm to fetch single players data - 1.png" />
<img src="Data Scraping/screenshot/algorithm to fetch single players data - 2.png" />
<img src="Data Scraping/screenshot/algorithm to fetch single players data - 3.png" />

<b> Fetch Double Data Algorithm</b><br>
Algorithm to fetch double players data can be seen at pictures below
<img src="Data Scraping/screenshot/algorithm to fetch double players data - 1.png" />
<img src="Data Scraping/screenshot/algorithm to fetch double players data - 2.png" />
<img src="Data Scraping/screenshot/algorithm to fetch double players data - 3.png" />
<img src="Data Scraping/screenshot/algorithm to fetch double players data - 4.png" />

### Data Storing 
1.<b> Data in pgAdmin4 </b>
- players <br>
<img src="Data Storing/screenshot/players DBMS.png" />
- singlestatistics <br>
<img src="Data Storing/screenshot/single_statistics DBMS.png" />

- mensinglestatistics
<img src="Data Storing/screenshot/men_single_statistics DBMS.png" />

- womensinglestatistics
<img src="Data Storing/screenshot/women_single_statistics DBMS.png" />

- doublestatistics
<img src="Data Storing/screenshot/double_statistics DBMS.png" />
- mendoublestatistics
<img src="Data Storing/screenshot/men_doubles_statistics DBMS.png" />
- womendoublestatistics
<img src="Data Storing/screenshot/women_doubles_statistics DBMS.png" />
- mixeddobulestatistics
<img src="Data Storing/screenshot/mixed_double_statistics DBMS.png" />

2.<b>Algorithm to Store Data</b>
- Database Setup
<img src="Data Storing/screenshot/database setup.png"/>
- Store players
<img src="Data Storing/screenshot/store players.png" />
- Store single statistics
<img src="Data Storing/screenshot/store single statistics.png" />
- Store double statistics
<img src="Data Storing/screenshot/store double statistics.png" />
- Main Program
<img src="Data Storing/screenshot/main store program.png" />

## Reference
Libraries that are used in this program :<br>
1. <b><a href="https://www.scrapingbee.com/blog/selenium-python/#the-find_element-methods">Selenium</a> </b><br>
This library is used to scrape data from website.
2. <b>JSON</b><br>
This library is used to store scraped data to json file
3. <b>OS</b> <br>
This library is used to get current work directory
4. <a href="https://www.geeksforgeeks.org/perform-postgresql-crud-operations-from-python/"><b>psycopg2</b></a><br>
This library is used to connect to PostgreSQL

## Author
Nathania Calista Djunaedi - 13521139