<div align="center">

# Seleksi Warga Basdat 2023
##  **Data Scraping, Data Modelling, and Data Storing**

</div>

## **Table of Content**
* [Repository Description](#repository-description)
* [Program Specification](#program-specification)
* [How To Use](#how-to-use)
* [JSON Structure](#json-structure)
* [Database Structure](#database-structure)
* [ERD to Relational Diagram](#erd-to-relational-diagram)
* [Screenshot](#screenshot)
* [References](#references)
* [Visualization](#visualization)
* [Author](#author)

## **Repository Description**
This repository contains the program to scrape, preprocess, model, and store data. The scrapped data is the [Top Electronic Deals on Ebay.com](https://www.ebay.com/globaldeals/tech). This website is chosen with consideration that Ebay is well-known to people and the website is allowed to be scrapped.
In these times of globalization, electronic products are considered to be top-searched in e-commerce website. However, I believe that scraping all the displayed products is considered too much. Therefore, the scrapped data will be limited to every first pagination in every type of electronic products.

<div align="center">
    <img src="./assets/ebay.png" width="300px">
</div>

The data will be scrapped and then preprocessed with the steps of **Data Cleaning** and **Data Transformation**. All the preprocessed steps is done using **pandas** and **numpy** in Python programming language. After the data is preprocessed, the data will be stored in a RDBMS using MySQL. 
This exporting steps are done with the **mysql.connector** library in Python programming language. First thing first, I initially chose PostgreSQl as the RDBMS. But unfortunately, the PostgreSQL installation got somekind of error and did not seem to be working. Therefore, I changed the chosen RDMS to MySQL since I have already installed it for the long time. In addition, I believe that MySQL is sufficiently well-known to be used for data storing.

## **Program Specification**
The program specification that I used in order to develop the programs are displayed as below:
| Specification | Additional Info |
|---------------|----------|
| [Python](https://www.python.org/downloads/release/python-3113/) | v3.11.3 
| [MySQL](https://www.mysql.com/downloads/) or [MariaDB](https://mariadb.org/download/?t=mariadb&p=mariadb&r=11.2.0) |  |
| [Tableau](https://www.tableau.com/)| 2023.2 |

## **How To Use**
First thing first, clone this repository:
```sh
git clone git@github.com:Gulilil/Seleksi-2023-Tugas-1.git
```

All the programs are stored inside `.ipynb` files in the `Data Scraping/src` folder. Therefore, all these files needed to be run sequentially, starts from `scraping.ipynb`, then `preprocess.ipynb`, and last `export.ipynb`.

The `scraping.ipynb` contains the algorithm starts from scraping the website to storing the data as `.json` file.

The `preprocess.ipynb` contains the algorithm to prepare the data from previous `.json` file to be processed further.

The `export.ipynb` contains the algorithm starts from connecting the code to local RDBMS, creating database and tables, and inserting the needed data into the database.

After the database is inserted with data, the specific database will be dumped into an `.sql` file, with a command as below:
```sh
mysqldump -u root -p {database_name} > {sql_file_name}.sql 
```


## **JSON Structure**

Scraped data is stored inside `Data Scraping/data/data.json`. The explanation of the structure is explained as below:

```
JSON Structure

// orient = 'index'
{
    <Dataframe Index> : {
        <Attribute 1> : <Value 1>,
        <Attribute 2> : <Value 2>,
        .
        .
        <Attribute n> : <Value n>
    },
}

// orient = 'records'
{
    {
        <Attribute 1> : <Value 1>,
        <Attribute 2> : <Value 2>,
        .
        .
        <Attribute n> : <Value n>
    },
}
```

### *data.json*
```json
{
    "0":{
    "listing_id":"354907151520",
    "title":"Microsoft 13\" Surface Pro 8 (i5, 8GB RAM, 256GB SSD, Graphite) with Surface Pen",
    "type":"Laptops & Netbooks",
    "available":"Limited quantity available",
    "sold":"1 ",
    "price_original":"US $669.99",
    "price_idr":"IDR9,999,850.75",
    "shipping_price_original":"US $54.46 ",
    "shipping_location":"Avenel, New Jersey, United States",
    "return":"30 days returns",
    "seller":"Always Deals Store",
    "condition":"New"
    },
}
```

After the preprocessing steps, considering the readable aspect, the data will be stored in four seperate `.json` file inside the `Data Scraping/data` folder, which are `data_payment.json`, `data_price.json`, `data_product.json`, and `data_shipment.json`. The explanation of each attributes is displayed as below:

### *data_payment.json*
```json
[
  {
    "listing_id":"333563280818",
    "method":"PayPal"
  },
]
```

### *data_price.json*
```json
[
  {
    "price_original_currency":"EUR ",
    "price_original_value":239.99,
    "price_idr":4026996.3799999999
  },
]
```

### *data_product.json*
```json
[
  {
    "listing_id":333563280818,
    "title":"CHUWI Laptop HeroBook GemiBook CoreBook Pro\/Plus\/X Intel Core Laptop Windows",
    "type":"Laptops & Netbooks",
    "available":"2 ",
    "sold":32,
    "return":"30 days ",
    "seller":"CHUWI Official Store\uff08chuwi2018\uff09",
    "condition":"New"
  },
]
```

### *data_shipment.json*
```json
[
  {
    "shipping_availability":true,
    "shipping_price_currency":null,
    "shipping_price_value":0.0,
    "shipping_location":null
  },
]
```

## **Database Structure**
<div align="center">
    <img src="./Data Storing/design/ERD.jpg" width='500px'>
    <h4> <bold> Entity Relationship Diagram </bold> </h4>
</div>

<div align="center">
    <img src="./Data Storing/design/Relational Diagram.jpg" width='500px'>
    <h4> <bold> Relational Diagram </bold> </h4>
</div>

## **ERD to Relational Diagram**
Here are the explanation steps to translate the ERD into a Relational Diagram.
1. Composite attribute inside an entity is needed to be seperated into a different table. The new tables made from this attributes have two primary keys, which are the primary key from the previous entity and the composite attribute itself. The primary key from the previous entity will be set as a reference to the primary key from the origin entity.
2. Create a table for each weak entity with its primary key is the attribute from the strong attribute it depended on. This primary key will be set as a reference to the primary key of the strong entity.
3. For the strong entity, make a table with the same attributes with the origin entity, excluding the composite attribute which has been seperated.

## **Screenshot**

### Data Scraping

Function to scrap item and to get href of a product page in a webpage

<img src='./Data Scraping/screenshot/scraping1.png'>

Function to scrap product data from a product page

<img src='./Data Scraping/screenshot/scraping2.jpg'>

List of product type pages to be scraped

<img src='./Data Scraping/screenshot/scraping3.jpg'>

### Data Preprocess
Splitting price attributes to currency and value

<img src='./Data Scraping/screenshot/preprocess1.jpg'>
<img src='./Data Scraping/screenshot/preprocess2.jpg'>

Drop unused attributes

<img src='./Data Scraping/screenshot/preprocess3.jpg'>

Replace unnecessary value for string data

<img src='./Data Scraping/screenshot/preprocess4.jpg'>

Drop products that might be categorized as multiple types 

<img src='./Data Scraping/screenshot/preprocess5.jpg'>

Split payment value into a new dataframe

<img src='./Data Scraping/screenshot/preprocess6.jpg'>

### Data Exporting
Establish connection to local RDBMS and create a new database

<img src='./Data Storing/screenshot/export1.jpg'>

Query to create tables

<img src='./Data Storing/screenshot/export2.jpg'>

Insert data to `product` table

<img src='./Data Storing/screenshot/export3.jpg'>

Insert data to `price` table

<img src='./Data Storing/screenshot/export4.jpg'>

Insert data to `shipment` table

<img src='./Data Storing/screenshot/export5.jpg'>

Insert data to `payment` table

<img src='./Data Storing/screenshot/export6.jpg'>

### Data Storing

Tables in the constructed database

<img src='./Data Storing/screenshot/dbms1.jpg'>

`payment` and `price` tables' description

<img src='./Data Storing/screenshot/dbms2.jpg'>

`product` and `shipment` tables' description

<img src='./Data Storing/screenshot/dbms3.jpg'>

Selecting data in `product` table

<img src='./Data Storing/screenshot/dbms4.jpg'>

Selecting data in `price`, `payment`, and `shipment` tables

<img src='./Data Storing/screenshot/dbms5.jpg'>

## **References**

Here are the libraries used the program development:

| Libraries | |
|----------|--|
| BeautifulSoup (bs4) | urllib.request |
| pandas | numpy |
| mysql.conector | |


## **Visualization**
The Data Visualization aspect is developed using [Tableau](https://www.tableau.com/) software. The result dashboards and the link to the dashboards are displayed as png as below:

<div align="center">
<img src="./Data Visualization/Dashboard_1.png">

Source: [Data Visualization 1](https://public.tableau.com/app/profile/juan.christopher/viz/VisualisasiDataAslabBasdat1/Dashboard?publish=yes)
</div>

<div align="center">
<img src="./Data Visualization/Dashboard_2.png">

Source: [Data Visualization 2](https://public.tableau.com/app/profile/juan.christopher/viz/VisualisasiDataAslabBasdat2/Dashboard2?publish=yes)
</div>

## **Author**
| Name | Student ID |
|--------|--------------|
| Juan Christopher Santoso | 13521116 |
