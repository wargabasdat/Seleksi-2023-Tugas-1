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

IMDb (Internet Movie Database) is an online database that provides comprehensive information about movies, TV shows, actors, directors, and other industry professionals. IMDb offers users the ability to access details such as film and TV show summaries, cast and crew information, user reviews, ratings, and trailers. With its vast collection of data and user-friendly interface, IMDb has become one of the most popular and trusted sources for entertainment-related information on the internet. The author, being a cinephile, finds this project incredibly fascinating and insightful, as it has exposed him to many great but lesser-known films and expanded his watchlist.

In this particular project, the author is focusing on the Top 250 Movies of All Time data, which is rated by IMDb users. Used by more than five million people all over the world, IMDb has become one of the most reliable sources for exploring and discovering information about films and television programs from various genres, countries, and eras.

From [this](https://www.imdb.com/chart/top/?ref_=nv_mv_250) webpage, the author has scraped the movie data, including rank, title, year of creation, duration, classification, and rating.

After scraping the data, the author expanded the database and created a more complex database design using the Entity Relationship Diagram (ERD) approach. The ERD was then mapped and translated into the relational model, and the author denormalized the data to achieve the best possible form, such as BCNF or 3NF. The database was built using PostgreSQL, and the data was stored using the same tool.

 ## Specification

 This program is built using Python programming language. In order to run the program, you are required to install some libraries.

 - #### Jupyter Notebook
To maintain simplicity, the author has decided to use Jupyter Notebook for building the program. Therefore, all scripts will be stored in the .ipynb format. However, the author occasionally uses PyCharm to test certain aspects. So, expect to see some screenshots of the PyCharm environment.

To install Jupiter Notebook via your terminal, type this promt.
```
pip install notebook
```

- #### BeautifulSoup
Based on the author's research, BeautifulSoup is currently the most commonly used scraping tool. Moreover, many references also utilize this tool. In this case, the parser (html.parser) is already included, so the author doesn't need to install any additional libraries.

To install BeautifulSoup library via your terminal, type this promt.
```
pip install beautifulsoup4
```

- #### Time
As suggested by the assistant, the author adheres to the "ethics of scraping". To prevent overloading the server and potentially causing crashes, the author has incorporated waiting time in the program using the time.sleep() method. The time library is already preinstalled with Python.

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

Here is an example of the generated data in JSON format. It represents the data of the movie ranked first, "The Shawshank Redemption."

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

At first, the author scraped movie data, including attributes such as rank, title, year of creation, duration, classification, and rating. These categories became attributes in the main entity called "movie." The author then expanded this database by creating new entities related to movies, such as genre, award, rating input, people in the movie (including directors and cast), and production house. Each entity was assigned its own identifier to ensure unique identification. The author also created a weak entity called "rating input" since a rating is dependent on the existence of the movie. Additionally, a "person" entity was created, which is further specialized into "director" and "cast" entities. These entities share some common attributes but are differentiated by specific attributes that match their characteristics. It is worth noting that the author used multiple-value and composite attributes to describe certain details for the production house entity.

Now, let's discuss the relationships between each entity, with the movie entity being the central focus since it contains the scraped data.

The "rating input" entity has a many-to-one relationship with the "movie" entity and total participation (on the rating input side) since, in this Top 250 Movie List, all movies have ratings.

Both the "production house" entity and the "person" entity have a many-to-many relationship with the "movie" entity, with total participation on both sides. This is because all movies are produced by production houses or people, and some movies may be produced by multiple production houses or involve multiple individuals. The relationship applies vice versa as well.

The "genre" entity has a many-to-many relationship with the "movie" entity, with total participation on the movie side. This is because some movies may have multiple genres, and vice versa. However, the author believes that not all genres are included in the Top 250 Movies List. That's why the author decide to use partial participation on the genre side.

Lastly, the "award" entity has a many-to-many relationship with the "movie" entity, with partial participation on both sides. This is because a movie may win several awards, and vice versa. However, not all movies have won awards, and some awards may not be included in the list. Therefore, this relationship has partial participation on both sides. 

## ERD Relational Translation Process

Next, the author proceeds with translating the ER Diagram into a Relational Model. Starting with the weak entity (Rating Input Entity), the author creates a relation schema with the same attributes and includes movie_id as the primary key, which references the identifying strong entity. Moving on to the production house entity, the author represents the composite attribute (address attribute) by creating separate attributes for each component attribute. For the multivalued attribute (phone_number), the author creates a separate schema that also includes the primary key of the production_house entity.

An important point to note is that the author decides to use "rank" as the movie_id in this database. This decision is made because no two movies are placed in the same rank. The author still uses the attribute name "rank" in the movie schema. However, in other schemas, this attribute is renamed as "movie_id."

To represent specialization in the schema, the author chooses to form a schema for the Person entity and then creates different schemas for each lower-level entity set. The author also includes person_id as the primary key for the higher-level entity set.

When translating the relationship sets, all entities that have a many-to-many relationship with the movie (production_house, genre, award, director, actor) are represented as a schema with attributes for the primary keys of both entities and any descriptive attributes of the relationship set.

During this translation process, the author also establishes the primary keys and foreign keys within the schema. Here are the final Relational Schema and the full list of keys present in this database.

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

## Reference
Libraries: 
- BeautifulSoup
- time
- requests
- json

## Author

Josua Adriel Sinabutar (18221065)
<br>
Information System and Technology 
<br>
Institut Teknologi Bandung
