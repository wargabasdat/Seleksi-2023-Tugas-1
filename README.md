<h1 align="center">
  <br>
  Data Events Indonesia
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling, and Data Storing
  <br>
  <br>
  Website Eventbrite.com

  ![logo](Data%20Visualization/pic/eventbrite.png)
  <br>
</h2>

## Table of Contents
  - [Description](#description)
    - [Data](#data)
    - [DBMS](#dbms)
  - [Specification](#specification)
  - [How to Use](#how-to-use)
    - [Data Scraping](#data-scraping)
    - [Data Storing](#data-storing)
  - [JSON Structure](#json-structure)
  - [Database Structure](#database-structure)
    - [ERD](#erd)
    - [Explanation of ERD to relational diagram translation process](#explanation-of-erd-to-relational-diagram-translation-process)
    - [Relational Diagram](#relational-diagram)
  - [Data Visualization](#data-visualization)
  - [Screenshots](#screenshots)
  - [References](#references)
  - [Author](#author)

## Description
  ### Data
  Data yang digunakan merupakan hasil scraping dari website [Eventbrite](https://www.eventbrite.com/). Website ini dimanfaatkan oleh para _event organizer_ untuk mempromosikan berbagai event di seluruh dunia, mulai dari _seminar_, _class_, _conference_, hingga _festival_. Berbagai event tersebut juga terdiri dari berbagai kategori mulai dari bisnis, sains, teknologi, spiritual, hingga musik. Data yang diambil dari website ini adalah data event yang ada di Indonesia. Pada website ini, pengguna bisa mengetahui detail event sekaligus memesan tiket. Selain itu, pengguna juga dapat mengunjungi profil _event organizer_ yang mengadakan event tersebut.
  Berikut adalah data yang diambil dari website:
  - Nama event
  - Harga tiket
  - Tanggal event
  - Waktu mulai event
  - Durasi event
  - Link pemesanan tiket
  - Alamat event
  - Nama _event organizer_
  - Jumlah _followers_ _event organizer_
  - Page _event organizer_
  - Kategori event
  - Latitude dan longitude alamat event
  
  ### DBMS
  DBMS yang digunakan untuk menyimpan data hasil _scraping_ adalah PostgreSQL. PostgreSQL merupakan DBMS yang bersifat _open source_ dan memiliki banyak fitur yang dapat digunakan untuk mengelola data. PostgreSQL mendukung berbagai jenis data, termasuk JSON. PostgreSQL juga mendukung berbagai bahasa pemrograman, termasuk Python, sehingga mempermudah untuk _export_ _file_ hasil _scraping_ ke _database_.

## Specification
  Program ini dibuat menggunakan bahasa pemrograman [Python](https://https://www.python.org/doc/) dengan beberapa library dan tools tambahan, yaitu:
  - [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) : Library untuk melakukan _scraping_ data dari _website_
  - [Selenium](https://www.selenium.dev/) : Library untuk melakukan request ke website yang _dynamic_ dengan memanfaatkan fungsi _wait_.
  - JSON : Format data yang digunakan untuk menyimpan data hasil scraping
  - Datetime : Library untuk membantu formatting tanggal dan waktu pada data
  - [psycopg2](https://pypi.org/project/psycopg2/) : Library untuk melakukan koneksi ke database PostgreSQL
  - [Matplotlib](https://matplotlib.org/) : Library visualisasi data

## How to Use
  ### Data Scraping
  1. Clone repository ini ke directory lokal
  2. Install library yang dibutuhkan dengan menjalankan perintah berikut pada terminal:
  ```
  pip install bs4
  pip install selenium
  ```
  3. Jalankan program dengan menjalankan perintah berikut pada terminal:
  ```
  python main.py
  ```
  4. Tunggu hingga program selesai berjalan. Program akan mengambil data dari website dan menyimpannya dalam format JSON. Program juga akan menyimpan data ke dalam database PostgreSQL.
  5. Untuk melihat hasil data scraping, buka file `events.json`, `organizers.json`, `categories.json`, dan `locations.json` yang ada di folder `Data Storing\data`.
  ### Data Storing
  1. Clone repository ini ke directory lokal
  2. Buka path `Data Storing\export` pada terminal
  3. Jalankan command berikut pada terminal:
  ```
  pg_dump -U {username} -d {database} < events_data.sql
  ```

## JSON Structure
  Pada program ini, terdapat 4 file JSON hasil _scraping_, yaitu:
  - `events.json`
     dengan struktur sebagai berikut:
     ```
     {"ID_event": 1, 
      "Name": "Free Career Empowerment & Meditation Class - Jakarta", 
      "Price": 0.0, 
      "Date": "2023-07-19", 
      "Start_time": "07:30", 
      "Duration": 24, 
      "Order_link": "https://www.eventbrite.com/e/free-career-empowerment-meditation-class-jakarta-tickets-558392485957?aff=ebdssbdestsearch", 
      "Address": "See Confirmation Email for Zoom Link, Jakarta, Jakarta 10110", 
      "Organizer": "https://www.eventbrite.com/o/career-bliss-academy-34346634153", "Category": "B"}
     ```
  - `organizers.json`
    dengan struktur sebagai berikut:
    ```
    {
      "Name": "Career Bliss Academy"
      "Total_folowers": 5100, 
      "Organizer_page": "https://www.eventbrite.com/o/career-bliss-academy-34346634153"
      }, 
     
    ```
  - `categories.json`
    dengan struktur sebagai berikut:
    ```
    {
      "ID_category": "B", 
      "Name": "business events"
      }
    ```
  - `locations.json`
    dengan struktur sebagai berikut:
    ```
    {
      "Address": "Jalan Daan Mogot No.63 Tj. Duren Utara Kec. Grogol petamburan, Daerah Khusus Ibukota Jakarta 11470", 
      "Latitude": -6.1753942, 
      "Longitude": 106.827183
      }
    ```

## Database Structure
   ### ERD
  ER Diagram dari database yang digunakan adalah sebagai berikut:
    ![ERD](Data%20Storing/design/ERD.png)
   ### Explanation of ERD to relational diagram translation process
   Berikut adalah langkah-langkah untuk mengubah ERD menjadi relational diagram:
  1. Relasi `organizer` pada relational diagram memiliki atribut yang sama seperti pada ERD, yaitu `Name`, `Total_followers`, dan `Organizer_page` karena hanya memiliki hubungan one-to-many dengan `event`. Primary key dari `organizer` (`Organizer_page`) menjadi atribut pada `event` sebagai foreign key di relational diagram.
  2. Relasi `category` pada relational diagram memiliki atribut yang sama seperti pada ERD, yaitu `ID_category` dan `Name` karena hanya memiliki hubungan one-to-many dengan `event`. Primary key dari `category` (`ID`) menjadi atribut pada `event` sebagai foreign key di relational diagram.
  3. Relasi `location` pada relational diagram memiliki atribut yang sama seperti pada ERD, yaitu `Address`, `Latitude`, dan `Longitude` karena hanya memiliki hubungan one-to-many dengan `event`. Primary key dari `location` (`Address`) menjadi atribut pada `event` sebagai foreign key di relational diagram.
  4. Sehingga, masing-masing relasi pada relational diagram memiliki atribut sebagai berikut:
       - `event` = (<u>**ID_event**<u>, Name, Price, Date, Start_time, Duration, Order_link, Address, Organizer, Category)
          - FK = event(Organizer) -> organizer(Organizer_page)
          - FK = event(Category) -> category(ID)
          - FK = event(Address) -> location(Address)
       - `organizer` = (Name, Total_followers, Organizer_page)
       - `category` = (ID, Name)
       - `location` = (Address, Latitude, dan Longitude).
   ### Relational Diagram
  Relational Diagram dari database yang digunakan adalah sebagai berikut:
    ![Relational Design](Data%20Storing/design/Relational%20Diagram.png)

## Data Visualization
  Berikut adalah dashboard yang menampilkan visualisasi data dari database:
  ![Data Visualization](Data%20Visualization/DASHBOARD.png)
  Informasi yang ditampilkan pada dashboard adalah:
  - Jumlah event yang di-_publish_ dari waktu ke waktu
  - Jumlah event tiap kategori
  - Leaderboard _event organizer_ berdasarkan jumlah event yang di-_publish_
  - Leaderboard _event organizer_ berdasarkan popularitas (_followers_)
  
  _note : code visualisasi data terdapat di folder `Data Visualization`_

## Screenshots
  ### Data Scraping
  - Scrape Function
    ![scrape_func_01_load](Data%20Scraping/screenshot/scrape_func_01_load.png)
    ![scrape_func_02_load](Data%20Scraping/screenshot/scrape_func_02_load.png)
    ![scrape_func_03](Data%20Scraping/screenshot/scrape_func_03.png)
    ![scrape_func_04](Data%20Scraping/screenshot/scrape_func_04.png)
    ![scrape_func_05](Data%20Scraping/screenshot/scrape_func_05.png)
    ![scrape_func_06](Data%20Scraping/screenshot/scrape_func_06.png)
  - Main Program
    ![main1](Data%20Scraping/screenshot/main1.png)
    ![main2](Data%20Scraping/screenshot/main2.png)
    ![main3](Data%20Scraping/screenshot/main3.png)
  - Terminal while running
    ![terminal1](Data%20Scraping/screenshot/Terminal/01_business_page1.png)
  ### Data Storing
  - Tables in Database
    <br>
    ![d_tables](Data%20Storing/screenshot/d_tables.png)
  - Description of Tables
    ![d_event_table](Data%20Storing/screenshot/d_event_table.png)
    ![d_organizer_table](Data%20Storing/screenshot/d_organizer_table.png)
    ![d_category_table](Data%20Storing/screenshot/d_category_table.png)
    ![d_location_table](Data%20Storing/screenshot/d_location_table.png)
  - Data in Tables
    ![event_table](Data%20Storing/screenshot/event_table.png)
    ![organizer_table](Data%20Storing/screenshot/organizer_table.png)
    ![category_table](Data%20Storing/screenshot/category_table.png)
    ![location_table](Data%20Storing/screenshot/location_table.png)


## References
  - Documentation
    - [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
    - [Selenium](https://www.selenium.dev/)
    - [psycopg2](https://pypi.org/project/psycopg2/)
    - [Matplotlib](https://matplotlib.org/)
    - [PostgreSQL](https://www.postgresql.org/docs/)
    - [Eventbrite](https://www.eventbrite.com/)
    - [Python](https://https://www.python.org/doc/)
  - Others
    - [Scrape data using Python](https://www.freecodecamp.org/news/how-to-scrape-websites-with-python-and-beautifulsoup-5946935d93fe/)
    - [Stackoverflow](https://stackoverflow.com/)

## Author
  _Naura Valda Prameswari - 18221173_ <br>
  _Sistem dan Teknologi Informasi_ <br>
  _Institut Teknologi Bandung_
