<h1 align="center">
  <br>
  DATA HOTEL DI BANDUNG
  <br>
  <br>
</h1>


## DESCRIPTION OF THE DATA AND DBMS

### Data 
Tripadvisor, Inc. adalah perusahaan biro perjalanan daring asal Amerika Serikat yang mengoperasikan situs web dan aplikasi seluler yang berisi konten buatan pengguna dan situs web pencarian harga yang berhubungan dengan perjalanan dan wisata. Perusahaan juga menawarkan reservasi dan pemesanan daring untuk transportasi, penginapan, atraksi wisata, dan restoran.

Script ini ditujukan untuk melakukan scraping pada web tripadvisor yang menunjukkan hotel-hotel terbaik di Bandung. Data yang diambil antara lain:
- Nama hotel
- Alamat hotel
- Harga hotel pada saat data diambil
- Review hotel overall
- Review lokasi hotel
- Review kebersihan hotel
- Review Service hotel
- Review kesepadanan harga hotel

### DBMS
DBMS yang dipilih adalah PostgreSQL dengan fiturnya yang lengkap dan memadai sehingga cocok digunakan sebagai penampung data web scraping ini

## Spesifikasi program
Language version: Python 3
Library:
- Pandas
- numpy
- BeautifulSoup
- Selenium
- time

## How to Use

### Data scraper
Lakukan cloning atau download program scraper.py
Install library yang diperlukan dengan `pip install (library)` pada command prompt
Navigasi ke lokasi file pada .../Data Scraping/src dan lakukan run
Akan digenerasi raw_data.csv pada direktori file scraper.py diletakkan

### Data Cleaner
Lakukan cloning atau download program cleaner.py
Install library yang diperlukan dengan `pip install (library)` pada command prompt
Navigasi ke lokasi file pada .../Data Scraping/src dan lakukan run
Akan digenerasi raw_data.csv pada direktori file cleaner.py diletakkan

### Data Storing
Lakukan cloning atau download database hotels.sql
Install postgresql jika belum terinstal pada perangkat yang digunakan
Navigasi cmd ke .../Data Storing/export
Restore database dengan perintah `psql -U {username} -d {database_name} < hotels.sql` sesuai dengan database yang ingin digunakan dan username postgres pada perangkat

## JSON Structure
JSON digenerasi dengan menggunakan tools online untuk mengkonversi csv menjadi json
JSON digunakan untuk menyimpan data yang nantinya dapat digunakan untuk export data ke sql
![json](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/json_file.png)

## Database Structure
### Entity Relationship Diagram (ERD)
![ERD](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ERD.png)
### Relational Diagram
![Rel Diagram](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relation.png)

## Explanation of ERD to relational diagram and translational process
Pada ERD, dibuat dua buah entitas yaitu hotel dan price. Hotel terhubung dengan price dengan hotel_id sebagai foreign key.
Hotel berisi alamat, point yaitu 50% berasal dari review dan 50% dari harga dan hotel_id sebagai primary key identifier, selain itu hotel juga memiliki review dan detail per kategori
Prices adalah weak entity yang berisi harga per hari

Hotel akan ditranslasikan as is pada psql karena tidak ada yang perlu digantikan, sementara itu prices akan memiliki hotel_id sebagai foreign key karena status prices sebagai weak entity
Karena pengguna kemungkinan tidak memerlukan review setiap kali data hotel ingin diakses, maka akan dilakukan vertical partitioning dengan relasi baru reviews yang berisi detail review per kategori dari hotel

## Screenshots of the program

### Website
![Webpage](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/website.png)

### Export json ke sql
![sql](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/base_sql.png)

### Pembuatan tabel prices
<br>
![prices](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/prices_table.png)

### Pembuatan tabel reviews
![reviews](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reviews_table.png)

### Update tabel hotels
![drop](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/hotel_drop_update.png)
![tabel akhir](https://github.com/Nicholas438/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/hotel_table_final.png)

## References
Libraries:
https://www.postgresql.org/
https://pypi.org/project/beautifulsoup4/
https://www.selenium.dev/
https://pandas.pydata.org/

Tutorials and tools:
https://realpython.com/beautiful-soup-web-scraper-python/
https://realpython.com/modern-web-automation-with-python-and-selenium/
https://www.codespeedy.com/beautifulsoup-lxml-parser-full-tutorial-python/
https://antisyllogism.medium.com/how-to-webscrape-with-requests-selenium-and-beautifulsoup-in-python-d2b1b996399a
https://csvjson.com/
https://www.convertjson.com/json-to-sql.htm

## Author
Nicholas
18221165
Seleksi Warga Basdat 
2023
