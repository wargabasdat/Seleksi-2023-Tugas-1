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

<p align="center">
  <img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" alt="Pikachu">
</p>

`The National Pokédex`, which can be viewed at https://www.pokemon.com/us/pokedex/, has the data for `1010 Pokémon` that were utilized in this project. The retrieved data contains the name, Pokédex ID, description, stats, skills, type, weakness, and other visual needs like picture URLs and the source website for each Pokémon.

For data processing, we will utilize the RDBMS `PostgreSQL` with the assistance of the `pgAdmin 4` GUI. The reason for choosing PostgreSQL is that it is a powerful, reliable, and feature-rich open-source DBMS for database management. Additionally, the author intends to explore further the usage of this DBMS.

## Specification

This program is created using `Python 3.10` as the programming language. The data extracted from the website will be stored in `.JSON` format and will be used for storing data into the `PostgreSQL` RDBMS.

Additionally, several Python libraries will be utilized, including `selenium`, `psycopg2`, `json`, `os`, and `dotenv`.

## How to use

To run this program, there are several prerequisites that need to be fulfilled:

1. Ensure your device has Python installed, preferably version `3.10` or higher and latest `vscode` version.
2. Upgrade pip to the latest version by executing the command `pip install --upgrade` in your favorite terminal.
3. Install all required Python libraries.
4. Install `PostgreSQL` and `pgAdmin 4`.
5. Create a new server with the following connection configuration.
   ![Configure Postgre](Data%20Scraping/screenshot/postgre%20configuration.png)
6. Create a `.env` file on root folder and define the PASSWORD variable with the value of your PostgreSQL account password.

Once the prerequisites are met, follow these steps to run the data scraping program (optional):

1. Open the `main.py` file in the `Data Scraping/src` directory.
2. Run the program by clicking the `Play` button in the top right corner of Visual Studio Code (VSCode).
3. When the first popup window opens, scroll down and click on `Load More Pokemon`, then manually scroll to the end of the list.
   ![Get Url](Data%20Scraping/screenshot/geturl%20loadmore.png)
4. After reaching the end of the list, the program will close automatically and save the URLs of each Pokémon in `url_list.json`.
5. The program will continue to extract data from 1010 Pokémon. This step may take around 3-5 hours, depending on your internet speed.
   ![Crawl Data](Data%20Scraping/screenshot/crawling%20pokemon%20data.png)
6. After data extraction, the program will perform `Preprocessing Data` and create the tables dan insert data in PostgreSQL.
7. The stored `.JSON` data can be found in `evolution.json`, `pokedex.json`, and `url_list.json` in the `Data Scraping/data` directory.
8. The data stored in the DBMS can be exported and saved in the `Data Storing/export` directory.

To view the Data Visualization, just open the file `Data Visualization/src/main.ipynb`. You do not need to execute any code as it has already been run previously.

## JSON Structure

In this project, there are 3 `.JSON` files used, namely `pokedex.json`, `evolution.json`, and `url_list.json`.

- In the `pokedex.json` file, data for each Pokémon will be stored. The structure of each object in this file is as follows:
<pre>
.
└── pokedex.json/
    ├── name
    ├── id
    ├── image
    ├── description
    ├── page
    ├── Height
    ├── Weight
    ├── Gender
    ├── Category
    ├── Abilities
    ├── type
    ├── weaknesses
    ├── stats/
    │   ├── HP
    │   ├── Attack
    │   ├── Defense
    │   ├── Special Attack
    │   ├── Special Defense
    │   └── Speed
    └── evolution/
        ├── first
        ├── middle
        └── last
</pre>

- In the `evolution.json` file, preprocessed data from the pokedex.json file will be stored, containing pairs of pre-evolution and post-evolution Pokémon id. The structure of each object in this file is as follows:
<pre>
.
└── evolution.json
    ├── initial_id
    └── evolution_id
</pre>

- In the `url_list.json` file, URLs leading to the page of each Pokémon will be stored. The structure of each object in this file is a simple list of URLs:

## Database Design

### ER Diagram

![Alt text](Data%20Storing/design/ER%20Diagram.jpg)

### Relational Model

![Alt text](Data%20Storing/design/Relational%20Model.jpg)

## ERD to Relational Model Translation Process

To translate the ER Diagram into a Relational Model, the following process is applied:

1. The `Pokemon` entity is a strong entity with several multivalue attributes. Therefore, this entity is translated into the `Pokemon` table in the Relational Model, with the `id` as the Primary Key of the table. Attributes with no multivalue will inserted to this table and attributes with multivalue will be separated into different tables.
2. The `Pokemon_Stat` entity in the ERD is a weak entity without multivalue attributes. Therefore, this entity is translated into the `Stat` table in the Relational Model, with `pokemon_id` as the Primary Key, which also serves as a Foreign Key referencing `Pokemon.id`.
3. The `Evolution` entity in the ERD is a weak entity with multivalue attributes. Therefore, this entity is translated into the `Evolution` table in the Relational Model, changing the structure into a table that stores pairs of `initial_id` and `evolution_id`. Both attributes are Primary Keys, which also serve as Foreign Keys referencing `Pokemon.id`.
4. Each multivalue attribute in the `Pokemon` entity is stored in a separate table that contains `pokemon_id` and the values they store. Both `pokemon_id` and the values they store are set as Primary Keys, and `pokemon_id` references `pokemon.id` as Foreign Keys. The tables created are `Type`, `Weaknesses`, `Ability`, and `Gender`.

## Reference

Library used:

- selenium
- json
- psycopg2
- os
- dotenv
- matplotlib
- numpy

## Author

Mohammad Farhan Fahrezy - 13521106
