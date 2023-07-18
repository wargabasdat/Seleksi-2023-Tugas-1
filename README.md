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
The web scraping program in this project is mainly using Python with `BeautifulSoup` library for parsing web HTML structure to get the needed data and convert it to JSON format. Another libraries that used in this project were `TQDM`, `time`, `json`, `lxml`. Before running the program make sure all the libraries were installed.


## How to use
### Data Scraping
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

### Data Storing
1. Change directory to `Data Storing/export`
2. Create a new database in PostgreSQL to restore the dump file
3. Use this command to restore the dump file
```
psql -U username dbname < restaurant.sql
```
4. The data will be stored in PostgreSQL database

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
### Example
```
 {
    "name": "Le Gavroche",
    "country": "United Kingdom",
    "address": "43 Upper Brook Street, London, W1K 7QR, United Kingdom",
    "award": "2 Stars",
    "description": "Le Gavroche’s longevity is legendary. Opened in 1967, this iconic  restaurant has been a key player in the post-war culinary history of the UK and, as you descend the stairs into the intimate, clubby room, you’ll be transported back in time. It might have a formal air but it also has a comforting feel, and it’s a delight to see Michel Roux Jnr in his element, touring the tables and chatting to diners as he continues the family legacy.The menu is a roll-call of refined, sophisticated French classics that delight and satisfy in equal measure – the soufflé Suissesse is renowned and luxury items lead the way, with the likes of coquilles St Jacques, turbot and lobster; if it all sounds so good that you simply can’t decide, go for the ‘Menu Exceptionnel’. The sommelier’s recommendations are spot-on and the cheese trolley is one of the best around.",
    "price_type": "Spare no expense",
    "cuisine_type": [
        "French"
    ],
    "reservation_availability": false,
    "phone_number": "+442074080881",
    "restaurant_url": "https://www.le-gavroche.co.uk/"
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
```
restaurant = (restaurant_id, name, country, address, award, description, price_type, reservation_availability, phone_number, restaurant_url)
chef = (chef_id, chef_name, chef_type)
supplier = (supplier_id, supplier_name, address, phone_number)
menu = (menu_id, menu_name, description)
dish = (dish_id, name, description, price)

// Multivalued
restaurant_cuisine = (restaurant_id, cuisine_type)
```

### Relationship Set
#### Many to many
When dealing with a many-to-many relationship between two entities, it is essential to implement it using a separate relation for the relationship itself. This new relation, often referred to as a junction or associative table, will have a composite primary key that combines the primary keys of the participating entities.
```
partnership = (restaurant_id, supplier_id)
```
#### One to many
In a one-to-many relationship, a foreign key must incorporate into the table corresponding to the 'many' side of the relationship. Additionally, any other attributes defined for the relationship should also be included in this 'many' table.
```
dish = (dish_id, name, description, price, menu_id)
chef = (chef_id, chef_name, chef_type, restaurant_id)
```
#### One to one
In a one-to-one relationship there is flexibility to decide where to implement the relationship by placing foreign key to one of the entity.
```
restaurant = (restaurant_id, name, country, address, award, description, price_type, reservation_availability, phone_number, restaurant_url, menu_id)
```
#### Foreign Key
```
dish(menu_id) -> menu(menu_id)
restaurant(menu_id) -> menu(menu_id)
chef(restaurant_id) -> restaurant(restaurant_id)
restaurant_cuisine(restaurant_id) -> restaurant(restaurant_id)
partnership(restaurant_id) -> restaurant(restaurant_id)
partnership(supplier_id) -> supplier(supplier_id)
```
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

## References
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