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

 This program is built using Python programming language. In order to run the program, you are required to install some libraries.

 - #### Jupyter Notebook
Let's start with Jupyter Notebook. To maintain the simplicity, the author has decided to use Jupyter Notebook to build the program. Therefore, all scripts will be stored in .ipynb format. However, the author still uses PyCharm to test several things. So, expect some Pycharm environment on the screenshot part. 

To install Jupiter Notebook via your terminal, type this promt.
```
pip install notebook
```

- #### BeautifulSoup
Based on the author research, BeautifulSoup is a scraping tool that is currently used the most. In addition, lots of references are using this tool. In this case, the parser (html.parser) has already included and the author doesn't need to install any other library.

To install BeautifulSoup library via your terminal, type this promt.
```
pip install beautifulsoup4
```

- #### Time
As the assistant suggested, the author follow the "ethics of scraping". To keep the server from crashing, the author put some waiting time in the program using the time.sleep() method. Time library is already preinstalled with Python.

- #### JSON
The scraped data will be stored in JSON format, as requested by the assistant. To dump the scraped data into JSON format, we need the JSON library. JSON library is already preinstalled with Python.

## How To Use

1. Insall all prerequisite libraries to run the program

2. Clone this repository to your local directory.

One way to get this done is through your terminal.

To clone it via your terminal, type this promt.
```
git clone https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1.git
```

3. Open Jupyter Notebook 

Navigate the directory on your terminal to the repository and type this prompt to open Jupyter Notebook. 
```
jupyter-notebook
```

4. Open and run Seleksi_Basdat.ipynb on Jupyter Notebook 

5. The scraping data result will be generated and dumped into JSON file format.

## JSON Structure

Here is the first rank movie data stored in JSON format.

<pre>
{
      "rank": "1",
      "title": "The Shawshank Redemption",
      "year_created": "1994",
      "duration": "2h 22m",
      "classification": "18+",
      "rating": "9.3"
    },
</pre>

## Database Structure

![ER Diagram](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ER%20Diagram.png)

At first, the author has scraped the movie data, which are rank, title, year of creation, duration, classification, and rating. These categories become attributes in the main entity named movie. The author than expand this database by creating new entities that related to movies such as genre, award, rating input, people in the movie (including director and cast), and production house. Each enitity is made with its own identifier in order to uniquely identify them. The author create a weak entity called rating input. Since there is no rating without the existance of the movie, rating is dependant to the movie. Other thing to notice is the author create person entity that are further specialized as director and cast. Both entities have some common attributes but they are differentiated with a specific attributes that match their characteristic. You can also notice that the author use multiple value and composite attributes to describe some detail for production house entity. 

Now let's talk about the relationship between each entity. The relationship mainly centered to the movie entity, since that's the scrapped data. 

The rating input entity has many to one and total participation (on rating input side) relationship with the movie entity, since in this Top 250 Movie List, there is no movie that has no rating at all. 

Both production house entity and person entity has many to many and total participation on both sides relationship with the movie entity because all movies are produced by production house/person and some of them might produce by several production house/person. It applies vice versa. 

The genre entity has many to many and total participation (on movie side) relationship with the movie entity, since some movies might have several genres and vice versa. However, the author believe that not all genre are included in the Top 250 Movies List.

Lastly, the award entity has many to many and partial participation relationship with the movie entity because one movie might win several award and vice versa. However, not all movie have won award and some award might not included in the list, therefore this relationship has partial participation on both sides.  

## ERD Relational Translation Process

Next step is translating the ER Diagram into Relatonal Model. Starting from the weak entity (Rating Input Entity), the author creates a relation schema with the same attributes and includes movie_id for the primary key of the identifying strong entity. Moving on to the production house entity, the author represent composite attribute (address attribute) by creating seperate  attribute for each component attribute. For multivalued attribute (phone_number), the author creates a
separate schema that also include the primary key of production_house entity. 

An important insight to know, the author decide to use rank as the movie_id in this database. This happened because there is no movie that's placed in the same rank. The author still use "rank" as the name of the attribute in the movie schema. However, in other schemas, this "rank" attribute is renamed into "movie_id"

In order to represent specialization via schema, the author choose to form a schema for the Person entity, then form a different schema for each lower-level entity set. The author also include person_id as the primary key of higher-level entity set. 

Translating the relationship sets, all entities that have many to many relationship with movie (production_house, genre, award, director, actor) are represented as a schema with attributes for the primary keys of both of them and any descriptive attributes of the relationship set. 

While doing this translation, the author also establish the primary keys and foreign keys to the schema. Here are the final Relational Schema and full list of keys that exist in this database.

![Relational Schema](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Schema.drawio.png)

## ScreenShots

- #### Scraping Function

![Scraping Function](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Scraping%20Function.png)

- #### Testing Progress

![Testing Progress](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Testing%20Progress.png)

- #### Preprocessing Input Data

![Preprocessing Input Data](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/Preprocessing%20Input%20Data.png)

- #### JSON Output

![JSON Output](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/JSON%20Output.png)

- #### Data Storing in PostreSQL

![Data Storing 1](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/Data%20Storing%20in%20PostreSQL%201.png)

![Data Storing 2](https://github.com/JosuaAdriel/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/Data%20Storing%20in%20PostreSQL%202.png)


