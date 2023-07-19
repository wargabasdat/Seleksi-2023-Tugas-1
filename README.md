<h1 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing of
  <br>
  <a href="https://www.2kratings.com/">NBA2K24 Players Data</a>
  <br><br>
</h1>

> A project assignment for 2023 Database Lab Assistant Candidate Selection at Bandung Institute of Technology

![GitHub repo size](https://img.shields.io/github/repo-size/kennypanjaitan/TUGAS_SELEKSI_1_13521023)

## Table of Contents
- [Data Description](#data-description)
- [Program Specification](#program-specification)
- [How to Use](#how-to-use)
  - [Prerequisites](#how-to-use)
  - [Libraries Used](#how-to-use)
  - [Environment Variables](#environment-variables)
  - [Run Locally](#run-locally)
- [JSON Structure](#json-structure)
- [Database Schema](#database-schema)
- [ERD to Relational Model Tranlation](#translation-from-erd-to-relational-model-explanation)
- [Author](#author)


## Data Description
This project involves scraping data from the website [2kratings](https://www.2kratings.com/), an __unofficial website__ that provides NBA2K24's data. The data that will be scraped are all NBA2K24 players' ```name, team, position, height, overall rating, three point rating, and dunk rating```. 

I really love sport, especially basketball. NBA 2K able to give me the experience to play in one of the best if not the best basketball league in the world. This data is particularly interesting to me because it allows me to explore and analyze the virtual representation of NBA players within the game.

As an avid basketball fan, I find it fascinating to compare the in-game ratings of players with their real-life performances and skills. The NBA 2K series is renowned for its attention to detail, aiming to replicate the strengths and weaknesses of each player accurately. Scrutinizing the ratings of players' three-point shooting and dunking abilities, among other attributes, can provide insights into how the game developers perceive the skills and attributes of different NBA players.

Moreover, having access to this data enables me to perform various analyses and visualizations. For instance, I can create visual representations of player ratings across teams or positions, identify the highest-rated players in the game, or even track changes in ratings through different game updates. This data scraping project will not only satisfy my curiosity but also allow me to delve deeper into the intricacies of NBA 2K and gain a deeper understanding of the game's mechanics and player rankings.

Overall, scraping the player data from 2kratings presents an exciting opportunity to combine my passion for basketball with my interest in data analysis. It allows me to explore the virtual realm of NBA 2K24 and gain valuable insights into the game's player ratings, contributing to a richer understanding of the sport I love.

## Program Specification
The program will scrape the data from the website [2kratings](https://www.2kratings.com/) and store it in a __MariaDB__ database. The program is written in __Python 3.9.6__ and will use some [libraries](#how-to-use). The scraper will scrape the data from every team's website with the base url as _https://www.2kratings.com/teams/_ and then follows with the corresponding team. For example, the scraper will scrape the data  from the _Los Angeles Lakers_ website with the url _https://www.2kratings.com/teams/los-angeles-lakers_. The scraper's script will be stored in the `Data Scraping/src` directory named `scraper.py`. After the data is scraped, the data will be stored in a JSON file named `database.json` in the `Data Scraping/data` directory. 

The data storing's script is stored in the `Data Storing/src` directory named `storing.py`. Before runing the data storing's script, the database must be created first. The database schema is represented by the following [ERD](#database-schema) and has been translated into a [relational model](#database-schema). After creating the database, the data storing's script can be run. The script will make a connection to the database, creating all tables, and then store the data from the JSON file into the __MariaDB__ database. 


## How to Use

<details>
  <summary><b>Prerequisites</b></summary>
    <ul>
      <li><a href="https://www.python.org/downloads/">Python - 3.9.0</a></li>
      <li><a href="https://mariadb.org/download/">MariaDB - 11.0.2</a></li>
    </ul>
</details>

<details>
  <summary><b>Libraries Used</b></summary>
    <ul>
      <li><a href="https://pypi.org/project/beautifulsoup4/">BeautifulSoup</a></li>
      <li><a href="https://pypi.org/project/urllib3/">urllib3</a></li>
      <li><a href="https://pypi.org/project/mariadb/">mariaDB</a></li>
      <li><a href="https://pypi.org/project/python-dotenv/">dotenv</a></li>
    </ul>
</details>

### Environment Variables
To run this project, you will need to add the following environment variables to your ```.env``` file
```python
# DB Details
DB_USER=root        # your username
DB_PASS=            # your password 
DB_HOST=localhost   # your host (to run locally use localhost)
DB_PORT=3306        # your port (default: 3306)
DB_NAME=nba2k24_db  # your database name
```

### Run Locally
1. Clone this repository (first-time use only)
```bash
git clone https://github.com/kennypanjaitan/Seleksi-2023-Tugas-1.git
```

2. Install all the required libraries
```bash
pip install -r requirements.txt
```

3. Run the data scraper's script
```bash
python 'Data Scraping/src/scaper.py'
```

4. Connect to your MariaDB server and create a new database
```sql
CREATE DATABASE nba2k24_db;
USE nba2k24_db;
```

5. Run the data storing's script
```bash
python 'Data Storing/src/storing.py'
```

## JSON Structure
There is a JSON File that will be generated by the scraper's script. The JSON file will be stored in the `Data Scraping/data` directory named `database.json`. The JSON file will have the following structure:
```json
{
  // List of players
  "players": [ 
    {
      "name":         Player's full name,
      "teams":        Player's team,
      "position":     Player's primary and secondary position (if any),
      "heightFeet":   Player's height in feet,
      "heightInches": Player's height in inches,
      "overall":      Player's overall rating,
      "three":        Player's three point rating,
      "dunk":         Player's dunk rating,
    }
  ],

  // List of teams
  "teams": [
    {
      "teamID":   Team's ID by abbreviation,
      "teamName": Team's full name,
      "homeBase": Team's home base (city),
    }
  ],

  // List of positions
  "positions": [
    {
      "posName": Position's full name,
      "posAbbr": Position's abbreviation,
    }
  ]
}
```

## Database Schema
The database schema is represented by the following Entity-Relationship Diagram (ERD),
<br>
<br>
<img alt="ERD" src="Data Storing/design/erd.png">
<br>
<br>
Additionally, the ERD is translated into a relational model, providing a structured representation of the database tables and their corresponding attributes.
<br>
<br>
<img alt="Relational Model" src="Data Storing/design/relationalModel.png">

## Translation from ERD to Relational Model Explanation
The ERD is translated into a relational model, providing a structured representation of the database tables and their corresponding attributes. The explanation of the translation process is as follows:
1. The entity ```Team``` is translated into a table named ```teams```. The table has the following attributes:
    - ```teamID``` as the primary key (using the team's abbreviation)
    - ```teamName``` as the team's full name
    - ```homeBase``` as the team's home base (city)
2. The entity ```Position``` is translated into a table named ```positions```. The table has the following attributes:
    - ```posID``` as the primary key (using the position's abbreviation)
    - ```posName``` as the position's full name
3. The entity ```Player``` is translated into a table named ```players```. The table has the following attributes:
    - ```playerID``` as the primary key (using a generated UUID)
    - ```playerName``` as the player's full name
    - ```teamID``` as the foreign key referencing the ```teamID``` attribute in the ```teams``` table
    - ```heightFeet``` as the player's height in feet
    - ```heightInches``` as the player's height in inches
    - ```overall``` as the player's overall rating
    - ```three``` as the player's three point rating
    - ```dunk``` as the player's dunk rating
4. The relationship ```Player``` that can have multiple position ```Position``` is translated into a table named ```playerPositions```. The table has the following attributes:
    - ```playerID``` as the foreign key referencing the ```playerID``` attribute in the ```players``` table
    - ```posID``` as the foreign key referencing the ```posID``` attribute in the ```positions``` table

## Author
[Kenny Benaya Nathan](https://github.com/kennypanjaitan) - 13521023
