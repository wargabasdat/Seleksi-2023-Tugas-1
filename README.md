<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Kean Nafis Santang - 18221148
  <br>
  <br>
</h2>



### Description of the Data and DBMS
<p>
  VCT Masters Tokyo 2023 was an official Valorant tournament held by Riot Games from the 10th of June, 2023 to the 25th of June, 2023. 12 teams from 4 regions (China, The Americas, EMEA, and The Pacific) qualified and participated in this tournament in order to compete for the trophy and the number 1 spot at the event. 
</p>
<br>

<p>
  This repository contains data regarding the statistics of the maps, matches, agents, and players from the tournament. The map & agent statistics highlight the number of times each map has been played, the attacker win rate of each map, the defender win rate of each map, and the pick rate of every Valorant agent on each map. The match statistics highlight the participants of each match and the outcome of each match. The player statistics represent the different performance metrics of each individual player in the tournament. All the data is stored in an SQL file using PostgreSQL as the DBMS.
</p>
<br>

<p>
  I chose to scrape data from the VLR.gg website that covered the tournament. Data from this tournament interests me because I want to gather a more in-depth analysis of how each team performed in the tournament and how the overall 'Meta' of the game developed in the tournament. I am personally invested in the Valorant Esports environment and this task gave me an opportunity to take a more close-up look at the scene. I intend to use the data acquired to study which players are promising prospects in the future, which teams have a high chance of doing well in the next tournament, and which agent compositions will be 'Meta' in the future. Hopefully, I can incorporate some of the strategies and agent compositions from professional play into my own matches.
</p>

### Specification of the Program
<p>
  The program is split into two parts: Data Scraping and Data Storing. 
  
  The "Data Scraping" folder contains the script I wrote to scrape data from the VLR.gg website. The script is written in the Python programming language and uses the BeautifulSoup library to scrape certain data from the HTML file of the website. All scraping is done in moderation. The scraped data is parsed, transformed, and cleaned before being stored in a Python dictionary localized in the script itself. Once the data processing phase is finished, the dictionary is converted into three JSON files. Each file represents a different data source from the VLR.gg website. The "players.json" file contains the statistics of each performance metric from each player that participated in the tournament. The "matches.json" file contains the results of every match that was played in the tournament. The "map_agent.json" file contains the statistics of each map and how often each agent was picked on that map.

  The "Data Storing" folder contains the SQL dump of the database, the ER diagram of the database, and the relational database design. The ERD design is based on the three main data files I acquired from the scraper script. Some entity sets were added to contextualize the data that I acquired in the process. The relational database design is based on the ER design that was translated using the standard transformation process. Finally, the SQL file in the "export" sub-folder contains the database that was built based on the ER and relational database designs. The data that was acquired from the scraping process has been inserted into the database according to the relevant tables
</p>

### How to use
<p>
  To use the data scraper, download the "VLR_scraper.py" file and the "main.py" file from the Data Scraping folder. In the "main.py" file, adjust the JSON dump path to any path that you want to save the data in, For example:
  with open(<YOUR PATH HERE>, 'w') as f:
    You can change the URL used in the "VLR_scraper.py" file to any other Valorant tournament as long as it is covered on the VLR website. Make sure that each URL refers to the correct tab of the scraper script. The 'stats' tab goes into the player_scraper function, the 'agents' tab goes into the map_agents_scraper function, and the 'matches' tab goes into the match_scraper function

  To use the SQL file, download the "vlr_tokyo_database" SQL file in the export sub-folder of the Data Storing folder. After you've finished downloading the SQL file, import it into your own database. You can do this in PostgreSQL using the following command:
  psql -U {username} -d {database_name} < vlr_tokyo_database.sql
Once done, you can use the database to your heart's content. You can use the relational database design in the design sub-folder as a reference for the database structure
</p>

### JSON Structure
<p>
  There are three JSON files in this repository that each represents one table in the database. Each JSON file holds one object (the database table) that contains an array, the array contains objects that represent the columns of the table and its contents (from the VLR page). The structure of each file is as follows:
  { <br>
    &ensp"Table Name": [ <br>
        &ensp;&ensp;{ <br>
          &ensp;&ensp;&ensp;"Column 1": "Value", <br>
          &ensp;&ensp;&ensp;"Column 2": "Value", <br>
          &ensp;&ensp;&ensp;"Column 3": "Value", <br>
        &ensp;&ensp;}, <br>
        &ensp;&ensp;{ <br>
          &ensp;&ensp;&ensp;"Column 1": "Value", <br>
          &ensp;&ensp;&ensp;"Column 2": "Value", <br>
          &ensp;&ensp;&ensp;"Column 3": "Value", <br>
        &ensp;&ensp;}, <br>
    &ensp;] <br>
</p>


### Database Structure
<p>
  This is the Entity-Relationship Diagram of the database <br>
  <img src='/Data Storing/design/VLR_ERD.png' title="ER DIAGRAM">

  This is the Relational Diagram of the database <br>
  <img src='/Data Storing/design/VLR_Relational.png' title="RELATIONAL DIAGRAM">
</p>
<br>
<br>
<br>

### Explanation of the ERD to Relational Diagram Process
For the full step-by-step explanation of the ERD to Relational process, you can <br>
<a href='https://docs.google.com/document/d/1Mb3ZZDUXXIagf17eEDmtMFo0wlgui2ADBjK_Nw-NXo0/edit?usp=sharing'>READ THIS DOCUMENT </a>

In summary:
1. The strong entities are turned into their own relation
2. Weak entities are turned into a relation with their discriminator + their strong entity's primary key as their primary key
3. one-to-many relationships are turned into a foreign key inside of the relation that can have one of the other entity
4. one-to-one relationships are not present, but if they are, they would be treated in the same way as one-to-many relationships with priority to the entity that has total participation
5. many-to-many relationships are turned into their own relation with the primary keys of both the entities in the relationship
6. Specializations: each specialization is turned into their own relation while the parent entity stays as its own relation. The primary key of each child is a foreign key to the primary key of the parent entity

### Screenshots of the Program
<p>
  This is the main code that uses the three functions from VLR_scraper.py
  <img src='/Data Scraping/screenshot/main_code.png'>



  This is the code from the function that scrapes the map data
  <img src='/Data Scraping/screenshot/soup_maps_init.png'>
  This code accesses the map tab on the website
  <img src='/Data Scraping/screenshot/soup_maps_access.png'>
  This code scrapes the desired agent and map data
  <img src='/Data Scraping/screenshot/soup_maps_agent_search.png'>
  This code appends all the data into a dictionary
  <img src='/Data Scraping/screenshot/soup_maps_append.png'>




  This is the code from the function that scrapes the match data
  <img src='/Data Scraping/screenshot/soup_matches_init_1.png'>
  Searching all the first matches on a given day
  <img src='/Data Scraping/screenshot/soup_matches_data_search.png'>
  Appending the results into a dictionary
  <img src='/Data Scraping/screenshot/soup_matches_append_1.png'>
  Searching all the match data (non-first)
  <img src='/Data Scraping/screenshot/soup_matches_data_search_2.png'>
  Appending the data into a dictionary
  <img src='/Data Scraping/screenshot/soup_matches_append_2.png'>\



  This is the code from the function that scrapes the player data
  <img src='/Data Scraping/screenshot/soup_player_init.png'>
  Accessing the table that contains the data
  <img src='/Data Scraping/screenshot/soup_player_table.png'>
  An inner function to automate data cleaning
  <img src='/Data Scraping/screenshot/soup_player_innerfunc.png'>
  Scraping the data as well as some transformation
  <img src='/Data Scraping/screenshot/soup_player_scraping.png'>
  Appending the data into a dictionary
  <img src='/Data Scraping/screenshot/soup_player_insert.png'>


  This is a sample from the database included in the repository
  <img src='/Data Storing/screenshot/vlr_sql_tables.png'>
  This is a snippet of selecting * in the player_stats relation
  <img src='/Data Storing/screenshot/vlr_sql_players_full.png'>
  
  An example of selecting data from the "player_stats" relation
  <img src='/Data Storing/screenshot/vlr_sql_players_selected.png'>

  An example of selecting data from the "map_stats" relation
  <img src='/Data Storing/screenshot/vlr_sql_map_selection.png'>

  Data from the "matches" relation
  <img src='/Data Storing/screenshot/vlr_sql_matches.png'>
</p>

### References
#### Libraries used
1. BeautifulSoup4
2. Requests
3. JSON

### AUTHOR: Kean Nafis Santang - 18221148
