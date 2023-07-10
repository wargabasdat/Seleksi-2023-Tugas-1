<h1 align="center">Seleksi 1 Warga Basdat 2023: Data Scraping, Data Storing, and Data Visualization from formula1.com</h1>
<p align="center"><b>July 17th 2023 - v1.01</b></p>
<p align="center">Ilmagita Nariswari - 18221101</p>

# Description

Formula 1 is the highest class of four-wheel racing in which teams and drivers compete in a series of Grand Prix to win the championship at the end of the year. In the world of Formula 1, data is constantly generated and consumed by not just the teams to improve their chances of winning the championship, but also the spectators and pundits alike. It is also a great source of data for aspiring data analysts to jump into, as the data of each races from 1950 to recent times is readily available on the formula1.com website, which is part of the reason of why I chose this website to scrape from.

The data scraped is the seasons available on the website that contains driver's standings from 1950-2022, drivers that have raced at least once and appears in the driver's standings from 1950-2023, races from 1950-2022, and race results from 1950-2022 that are broken down to each decade. The data is stored in the `.json` format and then stored into a PostgreSQL database. I chose to use PostgreSQL because I am most familiar with that DBMS.

# Specification
This program uses Python and uses the following libraries:

* *Beautiful Soup*: The main library to scrape data. This library is chosen because of its simple syntax and it is easy to use for beginners.
* *Requests*: This library is used to make requests to the web server that will be scraped.
* *JSON*: This library is used to parse JSON strings.
* *Pandas*: This library is used to manipulate and transform the data.

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
4. Follow the instructions in the program. All commands are done in `main.py`.

## Available commands
  0. See available commands
  1. Get driver standings of a season or more
  2. Get the races of a season or more
  3. Get a race results (requires race IDs on the F1 website)
  4. Get multiple race results (must set an array of race IDs first)
  5. Set an array of multiple race IDs
  6. Get the drivers that raced in a range of seasons
  7. Save last dataframe to JSON
  8. Exit the program

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

![Entity relationship diagram of the Formula 1 website](https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/9b389ce2-67e4-4a4d-a17a-f39515631fc1)

## Relational diagram

![Relational diagram of the Formula 1 website](https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/c2f9451c-d094-4cbe-9283-d8ec1eca43ed)

# ERD to Relational Diagram Translation Process

![reducing1](https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/6fd32b58-6bf7-4a0f-bef6-c66be31e57f8)

The `Results` entity has a _many-to-one_ relationship with `Driver`, and the relationship is _total_ on `Results` side. `Results` also has a _many-to-one_ relationship with `Races` and is total on `Results` side. Because of this, the entity `Results` becomes the table `raceResults` that has two foreign keys, `raceID` and `driver`, that refers to the primary keys of the table `races` and `driver`, respectively.

![reducing2](https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/5ab2fd4b-7677-45d8-973b-bb1da7bf1de7)

`Races` has a _many-to-one_ relationship with `Season` and is also a form of _total participation_. Thus, the table `races` has a foreign key `year` that refers to the primary key in `season`.

![reducing3](https://github.com/ilmagita/Seleksi-2023-Tugas-1/assets/52821168/de12fc16-2b84-4cc1-b295-6a1c227aa9c5)

`DriverStandings` has a _many-to-one_ relationship with `Driver`, causing the table `driverStandings` have a foreign key `driver` that refers to the primary key `name` in driver. It also has a _many-to-one_ relationship with `Season`, so it has the foreign key `year` that refers to `season`'s primary key.

# Screenshots

# References
## Documentation
## Articles

# Author
Ilmagita Nariswari (18221101)
Information System and Technology
Institut Teknologi Bandung
