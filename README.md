<h1 align="center">Seleksi 1 Warga Basdat 2023: Data Scraping, Data Storing, and Data Visualization from formula1.com</h1>
<p align="center"><b>July 17th 2023 - v1.01</b></p>
<p align="center">Ilmagita Nariswari - 18221101</p>

# Description

Formula 1 is the highest class of four-wheel racing in which teams and drivers compete in a series of Grand Prix to win the championship at the end of the year. In the world of Formula 1, data is constantly generated and consumed by not just the teams to improve their chances of winning the championship, but also the spectators and pundits alike. It is also a great source of data for aspiring data analysts to jump into, as the data of each races from 1950 to recent times is readily available on the formula1.com website, which is part of the reason of why I chose this website to scrape from.

The data scraped is the seasons available on the website that contains driver's standings from 1950-2022, drivers that have raced at least once and appears in the driver's standings from 1950-2023, races from 1950-2022, and race results from 1950-2022 that are broken down to each decade. The data is stored in the `.json` format and then stored into a PostgreSQL database. I chose to use PostgreSQL because I am most familiar with that DBMS.

# Specification
This program uses Python and uses the following libraries:

* *BeautifulSoup*: The main library to scrape data. This library is chosen because of its simple syntax and it is easy to use for beginners.
* *requests*: This library is used to make requests to the web server that will be scraped.
* *json*: This library is used to parse JSON strings.
* *pandas*: This library is used to manipulate and transform the data.
* *psycopg2*: This library is used to make a connection to the PostgreSQL database

# How to Use
1. Clone this folder to your local repository.
2. Make sure you have the necessary libraries installed. To do that, simply navigate to `Data Scraping/src` and run the following code in your console program such as Command Prompt:
```
pip install -r libs.txt
```
3. Run main.py by running the following code in your console program:
```
python3 main.py
```
4. Follow the instructions in the program. All commands are done in `main.py`.

## Available commands
```
  0. See available commands
  1. Get driver standings of a season or more
  2. Get the races of a season or more
  3. Get a race results (requires race IDs on the F1 website)
  4. Get multiple race results (must set an array of race IDs first)
  5. Set an array of multiple race IDs
  6. Get the drivers that raced in a range of seasons
  7. Save last dataframe to JSON
  8. Exit the program
```

# JSON Structure
* Seasons
```
  {
    Year: years of the seasons in Formula 1 available on the website
  }
```
* Drivers
```
  {
    Driver: driver name
    Nationality: nationality of driver
  }
```
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
* Races in a season
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
# Database Structure

## ERD

The center of this database is the `Season`, which stores the years of the championships, starting from 1950. A season has many `Races`, so their relationship will be _one-to-many_, with a _total participation_ side on `Races`. Each race has its own results, so `Results` is established as its own entity that has a _one-to-one_ relationship with `Races`. 

A `Driver` is its own entity. On the Formula 1 website, drivers aren't assigned IDs, so the primary key will be their names in this database. Driver's numbers also can't be used to identify drivers, because they can change every year - for example, before Max Verstappen won his first championship in 2021, he raced with the number 33, not 1 (number 1 is usually reserved for championship winners). In real life examples of databases, people should be assigned unique IDs and not just be uniquely identified by name.

`Results` contain the results of multiple drivers of each race, so it has a _many-to-one_ relationship with `Drivers`, with `Results` having a _total participation_. `DriverStandings` is also its own entity and keeps track of many drivers at the same time, so its relationship with `Driver` is _many-to-one_, in which `DriverStandings` has _total participation_.

<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/9b389ce2-67e4-4a4d-a17a-f39515631fc1" width="600" alt="Entity relationship diagram of the Formula 1 website">
</div>

## Relational diagram

<div align="center">
  <img alt="Relational diagram of the Formula 1 website" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/c2f9451c-d094-4cbe-9283-d8ec1eca43ed" width="800"></div>

# ERD to Relational Diagram Translation Process

<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/6fd32b58-6bf7-4a0f-bef6-c66be31e57f8" alt="Reducing Results, Races, and Driver" width="600">
</div>

The `Results` entity has a _many-to-one_ relationship with `Driver`, and the relationship is _total_ on `Results` side. `Results` also has a _many-to-one_ relationship with `Races` and is total on `Results` side. Because of this, the entity `Results` becomes the table `raceResults` that has two foreign keys, `raceID` and `driver`, that refers to the primary keys of the table `races` and `driver`, respectively.

<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/5ab2fd4b-7677-45d8-973b-bb1da7bf1de7" alt="Reducing Races and Season" width="600">
</div>

`Races` has a _many-to-one_ relationship with `Season` and is also a form of _total participation_. Thus, the table `races` has a foreign key `year` that refers to the primary key in `season`.

<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/de12fc16-2b84-4cc1-b295-6a1c227aa9c5" alt="Reducing DriverStandings, Driver, and Season" width="600">
</div>

`DriverStandings` has a _many-to-one_ relationship with `Driver`, causing the table `driverStandings` have a foreign key `driver` that refers to the primary key `name` in driver. It also has a _many-to-one_ relationship with `Season`, so it has the foreign key `year` that refers to `season`'s primary key.

# Screenshots

Main program and web scraper
<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/76cbbf1a-f5f4-4e6c-8de0-d262d6b1f020" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/4f3abc93-67db-4b63-b4d9-3df03add71f1" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/8a5edcf3-e88d-4d8c-9585-52a7ce0149ec" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/0610ddf2-8e42-41e1-8248-2f8447e04429" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/8a8007c7-6490-41e4-8be9-8fd74f33adc2" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/f46c01e3-1671-425e-95b3-52822dd086f4" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/7f7c1672-c816-41fd-8cf5-dafddc025bf2" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/05088234-5ced-46dc-a2d1-728562a64bdf" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/5bf8968b-8916-4c6e-ab8b-6e01fe1dfc93" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/f89fc1e0-db24-454f-bb58-614be456b7d0" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/c9496ac8-779d-467b-954a-97bc3251b07e" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/0f94c485-14d4-4ea2-8e6f-696aaf7ae198" width="600"><br><br>
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/7ab6eaa2-ef67-432b-a30e-0449b5461fba" width="600"><br><br>
</div>

Insertion to database is used using a Python program (`inserttodb.py`) with the library `psycopg2`.

<div align="center">
  <img src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/e1cd17d8-2797-4cd8-b74b-824425a57e5f" alt="Python program to insert .json to database" width="600"><br><br>
  <img width="600" alt="Output of the Python program to insert .json to database" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/2a1c9375-c30d-44e4-a8b1-5d3efdc6245b"><br><br>
  <img width="600" alt="pgpadmin4_driverstandings" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/fd63f0ff-a7f8-4486-bd8b-e6be6208ef0d"><br><br>
  <img width="600" alt="pgadmin4_seasons" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/27e1330c-7513-48bb-b4fb-5ee76e46cebb"><br><br>
  <img width="600" alt="pgadmin4_races" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/b6a331f0-7dac-4f93-9ed4-f4c8b2d70f65"><br><br>
  <img width="600" alt="pgadmin4_raceresults" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/eeda6984-e06c-4f24-9b72-c0cc6195fb1e"><br><br>
  <img width="600" alt="pgadmin4_drivers" src="https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/5a113103-6c65-4957-b5d9-6319d4c5878c"><br><br>
</div>

# References
## Documentation
* [Beautiful Soup Documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
* [PostgreSQL Documentation](https://www.postgresql.org/docs/)
* [Pandas Documentation](https://pandas.pydata.org/docs/)

## Articles
* [How to Build a Python Web Scraper: Scrape Data from any Website - Teri Eyenike](https://hackernoon.com/how-to-build-a-python-web-scraper-scrape-data-from-any-website)
* [Formula One: Extracting and analysing historical results - Ciarán Cooney](https://towardsdatascience.com/formula-one-extracting-and-analysing-historical-results-19c950cda1d1)

# Author
Ilmagita Nariswari (18221101)<br>
Information System and Technology<br>
Institut Teknologi Bandung
