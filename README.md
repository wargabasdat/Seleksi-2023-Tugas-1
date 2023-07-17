<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
    Michelin Guide Restaurants
  <br>
    Data Scraping, Database Modelling & Data Storing
  <br>
</h2>

## Table of Contents
- [Description of the data and DBMS](#description-of-the-data-and-dbms)
- [Specification of the program](#specification-of-the-program)
- [How to use](#how-to-use)
- [JSON Structure](#json-structure)
- [Database Structure](#database-structure)
- [Explanation of ERD to relational diagram translation process](#explanation-of-erd-to-relational-diagram-translation-process)
- [Screenshot program](#screenshot-program)
- [Reference](#reference)
- [Author](#author)

## Description of the data and DBMS

The Michelin Guide is a series of restaurant guides published by the French tyre company Michelin. It was first published in 1900 and has since become one of the most prestigious restaurant guides in the world. The guide awards up to three stars to restaurants that meet its standards of excellence, with three stars being the highest possible rating. The acquisition or loss of a star can have a significant impact on the success of a restaurant. <br>

The data is scraped from [Michelin Guide](https://guide.michelin.com/en/restaurants) by the award category from 1 star to 3 stars. The data consists of the restaurant name, country, address, award, description, price, cuisine, reservation, phone number, and URL. By scraping the Michelin Guide restaurant data, I intended to collect data about these highly prestigious restaurants and extract some useful or interesting information from the data so that anyone could know more about restaurants with a Michelin award. <br>

The RDBMS used for data storing in this project was PostgreSQL. The reason for using this RDBMS is because it's open source, support many data types, provides data integrity by implementing constraint, and provide reliability with backup and restore feature.


## Specification of the program
The web scraping program in this project is mainly using Python with BeautifulSoup library for parsing web HTML structure to get the needed data and convert it to JSON format. Before running the program make sure all the libraries were installed.


## How to use
1. Clone repository
2. Change directory to `Data Scraping/src`
3. Install all libraries
```
pip install -r requirements.txt
```
4. Run program 
```
python main.py
```
5. JSON file will be stored in `Data Scraping/data`

## JSON Structure
This is the JSON structure for scraped data.
```
{
    "name"                      : string,
    "country"                   : string,
    "address"                   : string,
    "award"                     : string,
    "description"               : string,
    "price_type"                : string,
    "cuisine_type"              : [string],
    "reservation_availability"  : boolean,
    "phone_number"              : string,
    "restaurant_url"            : string
}
```
## Database Structure
### ERD
![erd](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/bfd71b0ccd6cf60715de0e53a72ead3d5ffd8dec/Data%20Storing/design/ERD.png)
### Relational Schema
![relational](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/bfd71b0ccd6cf60715de0e53a72ead3d5ffd8dec/Data%20Storing/design/Relational%20Schema.png)

## Explanation of ERD to relational diagram translation process
### Strong Entity
Strong entity were represented with same schema and primary key. For strong entity with complex attributes like multivalued will caused a new relation created for these attributes. <br>
### Relationship Set
#### Many to many
When dealing with a many-to-many relationship between two entities, it is essential to implement it using a separate relation for the relationship itself. This new relation, often referred to as a junction or associative table, will have a composite primary key that combines the primary keys of the participating entities.
#### One to many
In a one-to-many relationship, a foreign key must incorporate into the table corresponding to the 'many' side of the relationship. Additionally, any other attributes defined for the relationship should also be included in this 'many' table.
#### One to one
In a one-to-one relationship there is flexibility to decide where to implement the relationship by placing foreign key to one of the entity.
## Screenshot program
- Main Program <br>
![mainprogram](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/0b2b982812e8214935e8eb65aacb29142190bd77/Data%20Scraping/screenshot/src.png)
- Preprocessing <br>
![preprocessing](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing.png)

- Scraping process <br>
![scraping](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/bfd71b0ccd6cf60715de0e53a72ead3d5ffd8dec/Data%20Scraping/screenshot/scraping_progress.png)

- Data Storing <br>
![datastoring1](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/bfd71b0ccd6cf60715de0e53a72ead3d5ffd8dec/Data%20Storing/screenshot/restaurant_cuisine_table.png) <br>
![datastoring1](https://github.com/reinhartlim1/Seleksi-2023-Tugas-1/blob/bfd71b0ccd6cf60715de0e53a72ead3d5ffd8dec/Data%20Storing/screenshot/restaurant_table.png)

## Reference
### Libraries
- [BeautifulSoup](https://beautiful-soup-4.readthedocs.io/en/latest/#)
- [requests](https://docs.python-requests.org/en/latest/index.html)
- [lxml](https://lxml.de/)
- [tqdm](https://tqdm.github.io/)
- [json](https://docs.python.org/3/library/json.html)
- [time](https://docs.python.org/3/library/time.html)
## Author
Reinhart Wisely Lim (18221154) <br>
Information System and Technology <br>
Bandung Institute of Technology