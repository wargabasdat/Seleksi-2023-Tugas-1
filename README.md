<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Muhammad Farrel Danendra Rachim (13521048)
  <br>
  <br>
</h2>

## Visualization of KlikIndomaret Products
<p align="center">
  <img src="./Data Visualization/Dashboard.png">
</p>

## Description of the Data and DBMS
Indomaret is a minimarket retail store from Indonesia that has been active since the 1980s. Until March 2023, Indomaret have had more than 21.000 stores spread across the country. Indomaret has become a dominant place for customers to fulfill their daily wants and needs. As technology progresses, customers can also buy products from Indomaret through online means, specifically from their official website: https://www.klikindomaret.com. <br>

In this repository, I have provided the program to scrape and store the data from the website, specifically the https://www.klikindomaret.com/category/sarapan tab that contains all breakfast products. Each item on the page has its own name, final price, name of the warehouse that stores it, image, and discount (if there is any). And if you click on one of the items, you'll get more information like the PLU (which is basically a unique ID for each item), the composition and the description of each item. <br>

I decided to pick the "klikindomaret" site because I understand how important managing the database within a minimarket retail is, especially since there are multiple entities being involved within the management, like the products themselves, the warehouse, the customers, etc. Therefore, taking good care of the gathered data can provide some good insights that can benefit the company, like what items do customers like to buy, what details that come within a single transaction, etc. 

## Specification of the Program
### Data scraping:
This program uses Python 3.11.4 programming language and the BeautifulSoup for the data scraping process. The data is first gathered from the page's HTML file, parsed, transformed, and cleaned before being appended to the array filled with dictionaries, each containing information of an item gathered. Later on, the dictionary is converted into JSON and CSV files which can be seen at ```Data Scraping/data```.


### Data storing:
This program uses PostgreSQL as the DBMS for the data storing process. The schema of the database is represented as the ER diagram and the relational diagram. The ER diagram contains the entities involved within a minimarket environment like "product", "cart", "customer", "warehouse", and "payment". The relational diagram is made by transforming the ER diagram (the full process can be seen in [Explanation of the ERD to Relational Diagram Process](#explanation-of-the-erd-to-relational-diagram-process)). The only table that is filled with scraped data is the "product" table, while the other tables are left empty. The entire database can be used with the SQL file in ```Data Storing/export```

## How to use
First of all, please download and extract zip of this repository.
### Data scraping:
- Open the extracted folder in your preferred terminal
- Change the directory into ```Data Scraping/src```
- Type ```python -u web_scraping_sarapan.py``` on the terminal
- __Please wait__, it usually takes around +30 seconds to gather the data
- After the process is over, a couple of messages will show up in the terminal telling you that the JSON and CSV files are successfully created.
- You can access them in ```Data Scraping/data```

### Data storing:
- Grab the ```indomaret_database.sql``` file inside the ```Data Storing/export``` folder.
- Import to your PostgreSQL using the command: ```psql -U [username] -d [database_name] < .indomaret_database.sql```
- Log in to yout PostgreSQL account
- Type ```\l``` in the PostgreSQL prompt to check whether the "indomaret" database is listed within the list of databases in your account.
- Use the database using the command ```\c indomaret```.

## JSON Structure
The available JSON file in this project comes in the name of ```products.json``` which can be found in ```Data Scraping/data```. The file has an array that contains all objects in the form of dictionaries which contain the attributes that come from the data scraping of the Indomaret website page.
Below is the following structure: <br>
```
[
  {
    "Key/Column 1": "Value",
    "Key/Column 2": "Value",
    ...
    "Key/Column X": "Value",
  },
  {
    "Key/Column 1": "Value",
    "Key/Column 2": "Value",
    ...
    "Key/Column X": "Value",
  },
  ...
]
```

## Database Structure
This program uses a database named "Indomaret". <br>
Below is the Entity-Relationship Diagram (ERD) of the "Indomaret" database. "PK" stands for primary key for each entity and "K" stands for regular key.
<p align="center">
  <img src="./Data Storing/design/ERD indomaret.drawio.png">
</p>
Below is the Entity-Relationship Diagram (ERD) of the "Indomaret" database. The underlined attributes are the primary keys of each relation.
<p align="center">
  <img src="./Data Storing/design/Relational Diagram Indomaret.drawio.png">
</p>

## Explanation of the ERD to Relational Diagram Process
1. Turn strong entities into relations like "Products", "Warehouse, "CartProduct", "Customers", and "Payment"
2. Represent multivalued attributes as a separate schema that contains the primary key of the original entity and the multivalued attribute itself
    1. Make a new schema "Customers_Phone" that contains **customer_id** and **phoneNumber**
    2. Make a new schema "Warehouse_Phone" that contains **warehouseName** and **phone_number**
3. Represent the "Payment" specialization by forming a schema for each payment method, including the primary key of "Payment" and the local attributes.
    1. Credit_Card = (**payment_id**, CCNumber, CV)
    2. Debit_Card = (**payment_id**, DCNumber)
    3. Online_Payment = (**payment_id**, PaymentPhoneNumber, CompanyName)
4. Represent the one-to-one relationships, by picking one of the tables in the relationship (prioritizing the entity in the "total participation" side) to be inserted with an extra attribute corresponding to the two entity sets.
    1. "CartProduct" and "Customers" have a one-to-one relationship, so add **customer_id** attribute into the "CartProduct" table since it has a total participation.
    2. "CartProduct" and "Payment" have a one-to-one relationship, so add **payment_id** attribute into the "CartProduct" table since it has a total participation.
5. Represent the many-to-one relationship by adding an extra attribute to the "many" side, containing the primary key of the "one" side
    1. "Products" and "Warehouse" have a many-to-one relationship, so add **warehouseName** to the "Products" table since it's in the "many" side.
6. Represent the many-to-many relationship by creating a schema that contains a) both primary keys from the two entities involved and b) additional attributes within the relationship
    1. "Products" and "CartProduct" have a many-to-many relationship, so add **PLU** and **cart_id** into a new schema called "FillingCart" based off of the "Fills" relationship that connects both entities. Also, add the product_quantity attribute as it is the descriptive attribute from the "Fills" relationship.

## Screenshots of the Program
Data initialization
<p align="center">
  <img src="./Data Scraping/screenshot/init scraping.png">
</p>
Inserting PLU and product name into the products table dictionary
<p align="center">
  <img src="./Data Scraping/screenshot/insert plu and product name.png">
</p>
Inserting the rest of the products attributes into the dictionary
<p align="center">
  <img src="./Data Scraping/screenshot/add the rest of items.png">
</p>
Converting dictionary into ```.json``` and ```.csv``` file
<p align="center">
  <img src="./Data Scraping/screenshot/convert dictionary to json and csv file.png">
</p>
List of tables in the indomaret database
<p align="center">
  <img src="./Data Storing/screenshot/indomaret tables.png">
</p>
List of product column names
<p align="center">
  <img src="./Data Storing/screenshot/product column names.png">
</p>
An example of selecting products' final price
<p align="center">
  <img src="./Data Storing/screenshot/select final price product.png">
</p>
A dummy data of the warehouse table (that has to be filled in, otherwise the foreign key "warehousename" that is referenced by the products table won't work)
<p align="center">
  <img src="./Data Storing/screenshot/warehouse data.png">
</p>

## References
Below are the libraries I used for this project:
- BeautifulSoup4
- Requests
- JSON
- CSV

## AUTHOR
Muhammad Farrel Danendra Rachim (13521048)

