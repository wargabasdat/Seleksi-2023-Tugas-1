<h1 align="center">
  <br>
  Data Events di Indonesia
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling, and Data Storing
  <br>
  Website Eventbrite.com
  <br>
</h2>

## Description
  ### Data
  Data yang digunakan merupakan hasil scraping dari website [Eventbrite](https://www.eventbrite.com/). Website ini dimanfaatkan oleh para _event organizer_ untuk mempromosikan berbagai event di seluruh dunia, mulai dari _seminar_, _class_, _conference_, hingga _festival_. Berbagai event tersebut juga terdiri dari berbagai kategori mulai dari bisnis, sains, teknologi, spiritual, hingga musik. Data yang diambil dari website ini adalah data event yang ada di Indonesia. Data yang diambil meliputi nama _event_, tanggal dan waktu _event_, lokasi _event_ (alamat, _latitude, longitude_), harga tiket, _event organizer_, kategori, dan link pemesanan.
  ### DBMS
  DBMS yang digunakan untuk menyimpan data hasil scraping adalah PostgreSQL. PostgreSQL merupakan DBMS yang bersifat open source dan memiliki banyak fitur yang dapat digunakan untuk mengelola data. PostgreSQL mendukung berbagai jenis data, termasuk data terstruktur (JSON). PostgreSQL juga mendukung berbagai bahasa pemrograman, termasuk Python.

## Specification
  Program ini dibuat menggunakan bahasa pemrograman Python dengan beberapa library dan tools tambahan, yaitu:
  - [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) 
    untuk melakukan scraping data dari website
  - [Selenium](https://www.selenium.dev/) 
    untuk melakukan request ke website yang dynamic dengan menggunakan fungsi wait.
  - JSON 
    untuk mengubah data menjadi format JSON
  - Datetime 
    untuk membantu formatting tanggal dan waktu pada data

## How to Use
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

## JSON Structure
  Pada program ini, terdapat 4 file JSON yang dihasilkan, yaitu:
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
   ERD dari database yang digunakan adalah sebagai berikut:
    ![ERD](Data%20Storing/design/ERD.png)
   Relational diagram dari database yang digunakan adalah sebagai berikut:
    ![Relational Design](Data%20Storing/design/Relational%20Diagram.png)
## Screenshots

## References

## Author
  - Naura Valda Prameswari - 18221173
  - Sistem dan Teknologi Informasi
  - Institut Teknologi Bandung
