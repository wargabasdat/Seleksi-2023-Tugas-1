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
* [Author](#author)

## **Repository Description**
This repository contains the program to scrape, preprocess, model, and store data. The scrapped data is the [Top Electronic Deals on Ebay.com](https://www.ebay.com/globaldeals/tech). This website is chosen with consideration that Ebay is well-known to people and the website is allowed to be scrapped.
In these times of globalization, electronic products are considered to be top-searched in e-commerce website. However, I believe that scraping all the displayed products is considered too much. Therefore, the scrapped data will be limited to every first pagination in every type of electronic products.

<div align="center">
    <img src="./assets/ebay.png" width="300px">
</div>

The data will be scrapped and then preprocessed with the steps of **Data Cleaning** and **Data Transformation**. All the preprocessed steps is done using **pandas** and **numpy** in Python programming language. After the data is preprocessed, the data will be stored in a RDBMS using MySQL. 
This exporting steps are done with the **mysql.connector** libraries in Python programming language. First thing first, I initially chose PostgreSQl as the RDBMS. But unfortunately, the PostgreSQL installation got somekind of error and did not seem to be working. Therefore, I changed the chosen RDMS to MySQL since I have already installed it for the long time. In addition, I believe that MySQL is sufficiently well-known to be used for data storing.

## **Program Specification**
The program specification that I used in order to develop the programs are displayed as below:
| Specification | Additional Info |
|---------------|----------|
| [Python](https://www.python.org/downloads/release/python-3113/) | v3.11.3 
| [MySQL](https://www.mysql.com/downloads/) |  |

Several libraries are used 

## **How To Use**


## **JSON Structure**

Scraped data is stored inside `Data Scraping/data/data.json`. The explanation of the structure is explained as below:

```
JSON Structure
{
    <Dataframe Index> : {
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

After the preprocessing steps, considering the readable aspect, the data will be stored in three seperate `.json` file inside the `Data Scraping/data` folder, which are `data_price.json`, `data_product.json`, and `data_shipment.json`. The explanation of each attributes is displayed as below:

### *data_product.json*
```json
{
  "0":{
    "listing_id":354907151520,
    "title":"Microsoft 13\" Surface Pro 8 (i5, 8GB RAM, 256GB SSD, Graphite) with Surface Pen",
    "type":"Laptops & Netbooks",
    "available":"Limited quantity ",
    "sold":1,
    "return":"30 days ",
    "seller":"Always Deals Store",
    "condition":"New"
  },
}
```

### *data_price.json*
```json
{
  "0":{
    "price_original_currency":"US $",
    "price_original_value":669.99,
    "price_idr":9999850.75
  },
}
```

### *data_shipment.json*
```json
{
  "0":{
    "shipping_availability":true,
    "shipping_price_currency":"US $",
    "shipping_price_value":54.46,
    "shipping_location":"Avenel, New Jersey, United States"
  },
}
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

## **Screenshot**

## **References**


## **Author**

| Name | Student ID |
|--------|--------------|
| Juan Christopher Santoso | 13521116 |
