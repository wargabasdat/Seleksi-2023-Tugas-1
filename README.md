<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Marcel Ryan Antony - 13521127
  <br>
  <br>
</h2>

### Table of Contents
* [Description of the Data and DBMS](#description-of-the-data-and-dbms)
* [Specification of the Program](#specification-of-the-program)
* [How to Use](#how-to-use)
* [JSON Structure](#json-structure)
* [Database Structure](#database-structure)
* [ERD to Relational Translation Process](#erd-to-relational-translation-process)
* [Screenshots](#screenshots)

### Description of the Data and DBMS
Zillow is an online real estate marketplace that provides a platform for buying, selling, renting, and researching properties. It was founded in 2006 and has become one of the most popular and widely used real estate websites in the United States.

This repository contains the program to scrape and store the data from Zillow's official website specifically at https://www.zillow.com/homes/for_rent/Brooklyn,-New-York,-NY_rb/{}_p/ page where I only take specific data that is the apartments that are rented at Brooklyn, New York. The contents I can scrape from the website are not much due to the strict restriction and minimum data. The item that I scrape at the page is the address of the apartment, the price, and the properties of the apartment.

The reason why I chose the Zillow website is because I am interested in analyzing the price of the apartment that is rented in Brooklyn, New York. By analyzing the price of the apartment I can take some good insights into how the pricing of a rented apartment works. Therefore I can understand more about the impact of properties or others on an apartment price

### Specification of the Program
#### Data Scraping :
For data scraping, this program is built with Python programming language. In order to run and simplify the program, there are some libraries that need to be installed before running the program :
#### Jupyter Notebook
To install jupyter notebook via your terminal, run the prompt below
```bash
pip install notebook
```
#### BeautifulSoup
To install BeautifulSoup via your terminal, run the prompt below
```bash
pip install beautifulsoup4
```
#### JSON
Because the scraped data will be stored in JSON structure, the JSON library is needed. To install JSON via your terminal, run the prompt below
```bash
pip install json
```
#### Pandas
Because the scraped data needs to be processed, pandas library is needed because it provides many tools for processing data. To install pandas via your terminal, run the prompt below
```bash
pip install pandas
```
#### Data Storing : 
For data storing, this program uses PostgreSQL as the DBMS for storing scraped data. The schema of the database is represented by an Entity Relationship Diagram and a Relational Diagram which will be represented below. There are only two tables that are filled with scraped data, the tables are "apartment" table and "room" table. The database can be used by simply importing the SQL file in Data Storing/export.

### How to Use
1. Install all the required libraries
2. Clone this repository to your local repository
3. Open jupyter notebook
   You can open jupyter notebook via your terminal by running the prompt below
  ```bash
  jupyter notebook
  ```
4. Open and run WebScraping.ipynb and DataPreProcessing.ipynb
5. The scraped and processed data will be generated in Data Scraping/data

### JSON Structure
There are two JSON files in this repository, one of them represents the structure in which the data is scraped and the other one represents the structure of processed data. Here are examples of both JSON structures.
```bash
    {
        "address": "West Wharf | 60 Wharf Dr, Brooklyn, NY",
        "price": "$3,575+ Studio",
        "properties": "$4,308+ 1 bd$8,250+ 2 bds$9,167+ 3 bds "
    }
```
```bash
    {
        "ApartmentID":45,
        "Price":3655,
        "NumberOfBedrooms":1,
        "NumberOfBathrooms":1,
        "Address":"One Blue Slip | 1 Blue Slip, Brooklyn, NY"
    }
```
### Database Structure
#### Entity Relationship Diagram
![image](https://github.com/MarcelRyan/Seleksi-2023-Tugas-1/assets/88817627/0aa545f4-e734-41dc-b590-0e9ab4bbf706)
#### Relational Diagram
![image](https://github.com/MarcelRyan/Seleksi-2023-Tugas-1/assets/88817627/451e7181-c5af-44bd-9f24-210716721410)

### ERD to Relational Translation Process
For the full specific step-by-step of ERD to Relational translation process, you can [READ THIS DOC](https://docs.google.com/document/d/108qe9kLSCpudUiD8j0Pmmf38SbYldvXmvZrPH0l88D4/edit)

In summary : 
1. 

### Screenshots
