<h1 align="center">Seleksi 1 Warga Basdat 2023</h1>
<h1 align="center">Data Scraping, Data Storing, and Data Visualization from formula1.com</h1>

July 17th 2023 - v01.01

# Description
## Data
Formula 1 .... 

## DBMS
PostgreSQL is used ...

# Specification
Below are the libraries used to run this program.

* *Beautiful Soup*: To scrape the data
* *Requests*: To make requests to URL
* *JSON*: To write JSON encoded data
* *Pandas*: To manipulate dataframes

# How to Use
1. Clone this folder to your local repository
2. Make sure you have the necessary libraries installed. To do that, simply navigate to `Data Scraping/src` and run the following code in your console program such as Command Prompt:
```
pip install -r libs.txt
```
3. Run main.py by running the following code in your console program:
```
python3 main.py
```
4. Follow the instructions in the program as follows. All commands will be done through program

## Available commands and table examples
1. Get driver standings of a season
2. Get teams/constructors standings of a season
3. Get the winners of a season
4. Get race results (requires race IDs from the F1 website)
5. Get quali results (requires race IDs from the F1 website)
6. Get race IDs in a season
7. Save last dataframe to JSON

You may save up to one dataframe to a JSON file at a time.

# JSON Structure
* Driver standings
```
  {
    Pos: driver's final position in the standings
    Driver: driver name
    Nationality: nationality of the driver
    Car: the car the driver drives in
    PTS: points gained in that season
  }
```
* Constructor standings
```
  {
    Pos: team's final position in the standings
    Team: team name
    PTS: points gained by that team
  }
```
* Race winners
```
  {
    Grand Prix: name of Grand Prix
    Date: date Grand Prix was held
    Winner: winner name
    Car: winner's car
    Laps: laps done by winner
    Time: fastest time set by winner
    Race ID: race ID used by F1 website
    Location: location used by F1 website
  }
```
* Race results
```
  {
    Pos: final position held by driver
    No: driver's number
    Driver: driver name
    Car: driver's car
    Laps: laps done by driver
    Time/Retired: fastest time set by driver/retired status
    Points: points gained by driver
  }
```
* Qualifying results
```
  {
    Pos: qualifying position set by driver
    No: driver's number
    Driver: driver name
    Car: driver's car
    Q1: time set by driver in Q1
    Q2: time set by driver in Q2
    Q3: time set by driver in Q3
    Laps: laps done by driver
  }
```
# Database Structure
Below are the structures of the database.

## ERD
The following database is designed around the structure of data available in the Formula 1 website.

The center of this database is the `Season`, which is the year of the championship. A season has many `Races`, so their relationship will be _one-to-many_.

Each race in `Races` is paired with a `Qualifying` session, so their relationship is _one-to-one_. Each race has its own results, so `results` is established as its own entity and having a _one-to-one_ relationship with `Races`. 

In practice, driver and teams should be their own entities, but the data of drivers and teams in the formula1.com website are available from this year only. Drivers and teams who did not race in the current season does not have a page in formula1.com website. Thus, drivers and teams are omitted from this ERD.

Thus, this is the diagram:

## Relational diagram


# ERD to Relational Diagram Translation Process

By now you may realize that there are two new tables seemingly coming out of nowhere. This is caused by the limitations of the data scraped from the Formula 1 website. The driver standings and team standings in the Formula 1 website are the *final* standings, that is, it is updated every time race results are updated. It does not store the standings before and does not have any foreign key connections to the actual race results table. Thus, the author decided to not include it in the ERD diagram.


# Screenshots

# References
## Documentation
## Articles


# Author
Ilmagita Nariswari (18221101)
Information System and Technology
Institut Teknologi Bandung
