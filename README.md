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

## Description

_Author (NIM):_ Rinaldy Adin (13521134)
_Data Source:_ https://www.speedrun.com/hl2
_Chosen Data:_ Half Life 2 speedrun records
_Chosen DBMS:_ PostgreSQL

From the Half-Life 2 leaderboard on https://www.speedrun.com, I chose to scrape the top 3 records for the game, including the different categories and subcategories, and likewise for the records of the first 3 levels of the game. The program also crawls the series page of Half Life, each player and moderator found, and each page of the scraped records.

## Specifications

The program in `main.py` crawls and scrapes https://www.speedrun.com/hl2, using selenium to take control of a chrome web browser in order to be able to generate the needed data in the page, as a single GET request won't be able to generate the needed data. The program will then scrape the needed information for the page, store the data, and then continue to crawl the website until all needed data is scraped. Finally, the program will generate `.json` files containing the data for each relation/table.

In order to easily import the generated data into an Postgres Database, `to_csv.py` could be run in order to generate `.csv` files from the prior `.json` files.

## How to Use

1. Create a python virtual environment in the root of this project, using the following commands
   `python -m venv`

2. Install required packages from `requirements.txt` into the virtual environment
   `pip i -r requirements.txt`

3. Move the current directory into the `src` folder
   `cd Data\ Scraping/src/`

4. Run the main scraping program
   `python main.py`

5. Run the json to csv converter
   `python to_csv.py`

6. Import csv files into database

## JSON Structure (Some Examples)

#### Record

```
...
{
    "record_id": "zq1r359m",
    "submitter_id": "SpeedyQ",
    "leaderboard_id": "l824pw25-onv4p5nm.zqomgv41",
    "rank": 4,
    "platform": "PC",
    "lrt_time": "46m 19s 096ms",
    "rta_time": "59m 04s 033ms",
    "build": ""
},
...
```

#### Game

```
{
  "games": [
    {
      "game_id": "hl2",
      "game_name": "Half-Life 2",
      "release_year": "2004",
      "platform": "PC"
    }
  ]
}
```

## Database Structure

### ER Diagram

![ER Diagram](./Data%20Storing/design/ER%20Diagram.jpg)

### Relational Diagram

![Relational Diagram](./Data%20Storing/design/Relational%20Diagram.jpg)

#### ERD to Relational translation process

Based on the developed ER Diagram, the first step in the translation process is removing total many-to-one relations and substituting the relation into an attribute on the enity on the many side. That translation process was applied to the relation `record_comment`, `record_commenter`, `record_submitter`, `leaderboard_record`, `level_leaderboard`, `game_moderator`, and `series_moderator`. The other step to do is to convert the weak entity `level` by doing a similar process to the first step. Finally, the remaining entities and relations are converted into tables.

## Screenshots

![](./Data%20Scraping/screenshot/screenshot.png)
![](./Data%20Storing/screenshot/Data%20Screenshot.png)
![](./Data%20Storing/screenshot/Relational%20Diagram%20Screenshot.png)
![](./Data%20Storing/screenshot/Shell%20Screenshot.png)

## References

![How to use selenium with python](https://selenium-python.readthedocs.io/index.html)
![Beautiful soup documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
