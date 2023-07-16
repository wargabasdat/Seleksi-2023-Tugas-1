<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Grab Food Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>


# Description of the data and DBMS 

The data for this project was obtained through web scraping from the Grab Food website. The website provides information about restaurants, their menus, opening hours, and pricing details. By scraping this data, we can gather insights into the pricing trends in the targeted area, ratings, and more. The reason the Grab Food website was chosen for this project was that the website can be looped through the links of each restaurant to extract the data quite easily.

For this project, the chosen DBMS is PostgreSQL. Several factors influenced the decision to use PostgreSQL:

1. Data Integrity and Reliability: PostgreSQL is known for its robustness and reliability in handling large datasets. It provides ACID (Atomicity, Consistency, Isolation, Durability) compliance, ensuring data integrity and consistency.

2. Flexibility and Scalability: PostgreSQL offers a wide range of features and data types, making it flexible enough to accommodate various data structures. It supports complex queries, indexing, and advanced data manipulation capabilities. Additionally, PostgreSQL scales well and can handle increasing data volumes efficiently.

3. Compatibility: PostgreSQL adheres to SQL standards, which ensures compatibility with other SQL-based systems and allows for easy integration with different tools and frameworks.

4. Security: PostgreSQL provides robust security features, including user authentication, access control, and data encryption options, which are crucial for handling sensitive data.


# Specification of the program

The data scraping program for the Grab Food website is designed to extract restaurant information, including links, dish type details, opening hours, pricing data, and more. The program is built using Python and utilizes various libraries and tools for web scraping, data manipulation, and automation. The program follows these specifications:

1. Language: Python 3

2. Libraries Used:

    Selenium: For automating web browser interactions and extracting data
    Pandas: For data manipulation and analysis
    Other supporting libraries as necessary
3. Scraping Logic:

    The program utilizes Selenium to automate web browser interactions and extract restaurant links from the Grab Food website. Selenium uses browser drivers, in this project, I use Chromium to control the web browser and perform actions like clicking, scrolling, and extracting data. Once the restaurant links are obtained, the program loops through each link to gather additional data such as menu items, opening hours, pricing, and other relevant details.

5. Data cleaning:
    The program applies data cleaning and transformation techniques to handle missing values, format inconsistencies, and other data quality issues using Pandas or other appropriate libraries.
   
6. Data Storing:
    The extracted data can be stored in various formats, such as CSV or JSON files, for further analysis and retrieval. The program uses Pandas library for data manipulation and preprocessing tasks, including creating and organizing data structures. Then the data is stored in a database using PostgreSQL.


# How to use the program

You can use the scraper by running all the command blocks that exist in the notebook. 

These are the simplified steps for using the program:

1. Scrape all restaurant category links on the home page.
2. Loop through the category links to scrape all the restaurant links in each category.
3. Loop through each restaurant links to scrape all the necessary data that you need such as prices, opening hours, rating, etc.
4. Preprocess the data that you scraped.
5. Export the data into a JSON/CSV output.
6. Do the data modeling by creating a valid ERD based on the data you scraped.
7. Store the data in a database using a DBMS, in this case, PostgreSQL.

# JSON Structure 

As mentioned before in the program usage, the scraped data will be exported into a JSON output.
Here is the structure of the JSON data that were exported, for simplicity's sake, only the first record was screenshotted.
1. Restaurant JSON Structure
   
![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/restoJson.jpg?raw=true)

2. Opening Hours JSON Structure

![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/openhourJson.jpg?raw=true)

3. Price Info JSON Structure

![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/priceJson.jpg?raw=true)

4. Restaurant Dish JSON Structure

![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/restoDishJson.jpg?raw=true)

5. Dish Type JSON Structure

![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/dishJson.jpg?raw=true)

# Database Structure

### ERD
![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ERD.jpg?raw=true)

The provided ERD represents the database structure derived from the scraped data. To translate the ERD into a relational diagram, we examine each relationship that connects the entities.

The `resto_hours` relationship establishes a connection between the `restaurant` entity and the `opening_hours` entity. This relationship exhibits a many-to-one pattern from the `restaurant` entity to the `opening_hours` entity. To reflect this relationship in the relational diagram, we include the primary key of the `opening_hours` entity, which is `opening_id`, as a foreign key in the `restaurant` entity.

Similarly, the `resto_price` relationship links the `restaurant` entity with the `price_info` entity. This relationship also demonstrates a many-to-one association, requiring us to incorporate the primary key of the `price_info` entity, `price_id`, as a foreign key in the `restaurant` entity.

Lastly, the `resto_dish` relationship establishes a many-to-many connection between the `restaurant` entity and the `dish_type` entity. To represent this relationship in the relational diagram, we create a new entity that serves as a translation or junction table. This table contains the primary keys of both entities, `dish_id` and `resto_id`, as foreign keys.

By following these steps, we can successfully translate the ERD into a relational diagram that accurately represents the relationships between the entities.

### Relational Diagram
![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Diagram.jpg?raw=true)

# Screenshots
These are some screenshots from the scraper and the RDBMS
![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Data%20Scraping.jpg?raw=true)

![alt text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/Data%20Storing.jpg?raw=true)

# Some insightful Visualization
### Price vs Rating 
![alt_text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/screenshot/PriceVsRating.jpg)

The visualization above indicates that for some restaurants, there is a positive correlation between the average price and the rating. Higher average prices tend to be associated with higher ratings. Additionally, it can be observed that restaurants with an average price above Rp 120,000 consistently receive ratings of 4 or higher.

### Rating Distribution
![alt_text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/screenshot/ratingDistribution.jpg)

The visualization above illustrates the distribution of ratings given by customers on Grab Food. It can be observed that the majority of ratings fall within the range of 4 to 5, with the highest count occurring at a rating of 4.7.

### Price Trend and Average Price Distribution
![alt_text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/screenshot/priceTrend.jpg)
![alt_text](https://github.com/darrendoang/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/screenshot/avgPriceDistribution.jpg)

The visualizations above provide insights into the average price trends and distribution among restaurants. It can be observed that most restaurants have an average price ranging from Rp 20,000 to Rp 100,000, with the highest count occurring at an average price of Rp 50,000.

These visualizations offer valuable insights into the relationship between price and rating, the distribution of ratings, and the average price trends among restaurants.

# References

In this data scraping project for the Grab Food website, the following libraries were used:

1. Selenium: A powerful web automation library used to control web browsers and interact with web elements.
2. Pandas: A versatile data manipulation and analysis library for handling structured data.
3. Matplotlib: A popular data visualization library used to create various types of plots and charts.
4. Seaborn: A statistical data visualization library built on top of Matplotlib, providing enhanced aesthetics and additional plotting functionalities.
5. PostgreSQL: An advanced, open-source, object-relational database management system (DBMS).

These libraries were chosen for their capabilities in web automation, data manipulation, and data visualization, making them ideal for extracting and analyzing data from the Grab Food website.

To learn more about these libraries and their usage, you can refer to their official documentation:
1. Selenium: https://www.selenium.dev/documentation/en/
2. Pandas: https://pandas.pydata.org/docs/
3. Matplotlib: https://matplotlib.org/stable/contents.html
4. Seaborn: https://seaborn.pydata.org/tutorial.html
5. PostgreSQL: https://www.postgresql.org/docs/

These references provide detailed documentation, examples, and tutorials to help you understand and utilize the functionalities of these libraries effectively in your own projects.
<p align="center">

  <br>
   ~Darren~

</p>
<br>
