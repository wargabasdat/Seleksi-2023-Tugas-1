<h1 align="center">
  <br>
  Top 250 Movies of All Time IMDb Version
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>

![Logo IMDb](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/IMDB_Logo_2016.svg.png)

## Table of Contents

This README.md contains the following
1. [Description](#description)
2. [Specification](#specification)
3. [How To Use](#how-to-use)
4. [JSON Structure](#json-structure)
5. [Database Structure](#database-structure)
6. [ERD Relational Translation Process](erd-relational-translation-process)
6. [Screenshots](#screenshots)
7. [Reference](#reference)
8. [Author](#author)



## Description

IMDb (Internet Movie Database) is an online database that provides comprehensive information about movies, TV shows, actors, directors, and other industry professionals. IMDb offers users the ability to access details such as film and TV show summaries, cast and crew information, user reviews, ratings, and trailers. With its vast collection of data and user-friendly interface, IMDb has become one of the most popular and trusted sources for entertainment-related information on the internet. The author, being a cinephile, finds this project incredibly fascinating and insightful, as it has exposed him to many great but lesser-known films and expanded his watch list.

In this particular project, the author is focusing on the Top 250 Movies of All Time data, which is rated by IMDb users. Used by more than five million people all over the world, IMDb has became one of the most reliable source for exploring and discovering information about films and television programs from various genres, countries, and eras.

From [this](https://www.imdb.com/chart/top/?ref_=nv_mv_250) webpage, the author has scraped the movie data, including rank, title, year of creation, duration, classification, and rating.

 After scraping the data, the author has expanded the database and created a more complex database design using the Entity Relationship Diagram (ERD) approach. The ERD is then mapped and translated into the relational model, and he denormalize the data to achieve the best possible form, such as BCNF or 3NF. The database is built using PostgreSQL, and the data is stored using the same tool.

 ## Specification

 This program is build using Python programming language. In order to run the program, you are required to install some libraries.

 - #### Jupyter Notebook
To maintain the simplicity, the author has decided to use Google Collab to build the program. Therefore, all scripts will be stored in .ipynb format. However, the author still uses PyCharm to test several things. 

To install, type
```
pip install notebook
```
on your terminal.

- #### BeautifulSoup
Based on the author research, BeautifulSoup is a scraping tool that is used the most. In addition, lots of references are using this tool. In this case, the parser (html.parser) has already included and the author doesn't need to install any other library.

To install BeautifulSoup library, type
```
pip install beautifulsoup4
```
in your terminal.

- #### Time
As the assistant suggested, the author follow the "ethics of scraping". To keep the server from crashing, the author put some waiting time in the program using the time.sleep() method. Time library is already preinstalled with Python.

- #### JSON
The scraped data will be stored in JSON format, as requested by the assistant. To dump the scraped data into JSON format, we need the JSON library. JSON library is already preinstalled with Python.

## How To Use

1. Ins
