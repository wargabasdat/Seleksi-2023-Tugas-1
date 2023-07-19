<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing Of 1000 Top Manhwa Rating in MyAnimeList Website
  <br>
  <br>
</h2>

## Table of Contents


## Description
[MyAnimeList](https://myanimelist.net/topmanga.php?type=manhwa) merupakan sebuah situs web komunitas yang populer di kalangan penggemar anime dan manga. Situs ini berfungsi sebagai basis data anime dan manga dengan menyediakan informasi lengkap seperti judul, genre, chapter, status, sinopsis, dll serta menjadi platform sosial untuk para penggemar anime dan manga di seluruh dunia. Di MyAnimeList, pengguna dapat menemukan informasi tentang berbagai anime, manga, karakter, staf produksi, dan lainnya. Tak hanya itu, website ini juga mengurutkan berbagai anime dan manga berdasarkan peringkat pengguna yang di-update seriap harinya. Dengan fitur-fitur tersebut, website ini dipercaya oleh oleh para penggemar sebagai referensi dalam mencari anime dan manga serta mencari teman komunitas yang memiliki hobi yang sama.  

Data yang author coba ambil kali ini adalah 1000 top manhwa berdasarkan rating dari website MyAnimeList. Author mengambil data ini atas dasar hobi author dalam membaca manhwa dan ingin mencoba mengetahui berbagai informasi dari top manhwa yang digemari oleh penggemar seluruh dunia. Data yang author scrape antara lain nama manhwa, chapter, status, published, genres, authors, ranked, members, dan favorites dari setiap manhwa. Dengan data ini, akan banyak yang dapat author explore untuk dijadikan insight menarik untuk author sendiri dan para pembaca. 

Hasil data yang author ambil kemudian akan disimpan ke dalam DBMS PostgreSQL. Author memilih DBMS tersebut karena merasa familiar dengan sintax yang digunakan dan juga sebelumnya pernah menggunakan salah satu GUI PostgreSQL yaitu pgAdmin dalam mengelola database. Selain itu, postgreSQL juga menawarkan tingkat keamanan database yang tinggi, dukungan bahasa pemograman yang beragam, dan skalabilitas yang tinggi dalam mengelola database yang besar.

## Spesification
Berikut beberapa library `Python` yang digunakan dalam program.

- Jupyter Notebook
Jupyter notebook digunakan agar penulisan kode lebih mudah untuk ditulis dan dieksplorasi setiap sel kodenya. 

- BeautifulSoup4
Library yang digunakan untuk melakukan scraping pada website. Library ini relatif lebih mudah untuk dipahami dan digunakan.

- Request
Library ini digunakan untuk melakukan request akses kepada website agar proses scraping dapat berjalan.

- Selenium
Library ini digunakan untuk mengakses tombol `next_page` dari website karena data yang diambil berada pada beberapa halaman yang berbeda.

- Pandas
Library ini digunakan untuk melakukan preprocessing pada data seperti parsing, cleansing, dan transforming serta converting dataframe menjadi csv file.

- Time
Library digunakan untuk memberikan jeda saat melakukan scraping dengan fungsi time.sleep(). Hal ini bertujuan untuk mengurangi beban yang diterima server

- JSON
Library ini digunakan untuk menuliskan data hasil scrape kedalam file `.json` format

Proses kerja dari program adalah sebagai berikut.
1. Program mengakses website dari webChromedriver dengan library selenium
2. Program mengambil 1000 link manhwa_page yang tersebar pada 20 page top manhwa ranking dengan mem-parsing `html` page dengan library beautifulsoup
3. Program mengakses setiap link manhwa_page dengan mengirimkan request lalu diikuti dengan mengambil semua data yang diperlukan 
4. Data tersebut ditulis dan disimpan dalam file `.json` 
5. Isi file `.json` dibaca oleh library pandas dan disimpan pada sebuah dataframe `df`
6. Dataframe kemudian dibagi-bagi kedalam entity yang berbeda sesuai dengan relational model dari database
7. Terakhir setiap entity di-convert menjadi file csv yang dapat diakses di folder Data Scraping subfolder data.

## How to Use
1. Clone repository ini ke local directory
2. Install chromeDriver [disini](https://chromedriver.chromium.org/downloads), pastikan versi chromedriver sesuai dengan chrome browser yang dimiliki (versi chrome dapat dilihat di help -> about google chrome)
3. Install semua library yang digunakan dengan menuliskan perintah berikut di command prompt
```
    pip install bs4
    pip install selenium
    pip install request
    pip install pandas
```
4. Buka `Manhwa_Scraper.ipynb` file di IDE yang dimiliki
5. Run semua code dimulai dari paling atas hingga paling bawah, atau run all

## JSON Structure
Data hasil scrape akan disimpan pada `.json` file dengan struktur sebagai berikut.
```
{
    "name" (string)             : nama manhwa,
    "volumes" (int)             : jumlah volume manhwa yang telah di published,
    "chapters" (int)            : jumlah chapters manhwa yang telah di published,
    "status" (string)           : status manhwa saat ini,
    "published_start" (string)  : tanggal manhwa di published (in format yyyy-mm-dd),
    "published_end" (string)    : tanggal manhwa berhenti di published jika statusnya "finished" (in format yyyy-mm-dd),
    "genres" [(string)]         : list genre yang dimiliki manhwa,
    "serialization" (string)    : serial yang mengeluarkan manhwa,
    "authors" [(string)]        : list author yang menulis manhwa,
    "score" (float)             : total rata-rata score manhwa yang di vote oleh pembaca (range 1-10),
    "ranked" (int)              : ranking manhwa di top anime page,
    "popularity_rank" (int)     : ranking popularitas manhwa berdasarkan members dan favorites,
    "members" (int)             : jumlah member yang membaca manhwa,
    "favorites" (int)           : jumlah favorites user terhadap manhwa
}
```
contoh isi `.json` file
```
{
    "name": "Solo Leveling",
    "volumes": null,
    "chapters": 201,
    "status": "Finished",
    "published_start": "2018-03-04 00:00:00",
    "published_end": "2023-05-31 00:00:00",
    "genres": [
        "Action",
        "Adventure",
        "Fantasy"
    ],
    "serialization": "KakaoPag",
    "authors": [
        "Chugong",
        "Jang, Sung-rak",
        "Disciples"
    ],
    "score": 8.68,
    "ranked": 56,
    "popularity_rank": 7,
    "members": 432195,
    "favorites": 40055
}
```

## Database Structure
Berikut ERD dari database Manhwa
![ER Diagram](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ER%20Diagram.png?raw=true)
Database dibuat berdasarkan data yang didapat dari hasil scraping dengan tambahan beberapa entity yang berhubungan. Entity Manhwa merupakan entity utama dari database yang menyimpan sebagian besar dari data hasil scrape. Setiap record pada entity Manhwa dibedakan berdasarkan attribute IDManhwa yang unik. Entity Genre menyimpan IDGenre sebagai primary key dan nama serta deskripsi genre. Entity Serialization menyimpan IDSerialization dan nama serialization dari hasil scrape. Entity Author menyimpan IDAuthor dan nama author yang didapat dari data hasil scrape. Entity User merupakan entity tambahan yang dirasa berhubungan dengan database yang akan dibuat.

Berikut penjelasan relation antar entity.
1. Relasi Genre dengan Manhwa adalah many-to-many dengan total di sisi Genre. Artinya, setiap manhwa dapat memiliki 0 atau lebih genre dan setiap genre pasti berada di satu atau lebih Manhwa. Hal ini karena data genre yang diambil merupakan data yang valid didapatkan dari setiap Manhwa sehingga setiap Genre yang terdaftar pasti merupakan bagian dari salah satu Manhwa
2. Relasi Serialization dengan Manhwa adalah one-to-many dengan total di sisi Serialization. Artinya, setiap manhwa dapat tidak memiliki atau memiliki tepat satu serialization dan setiap serialization bisa memiliki lebih dari satu manhwa yang dipublished
3. Relasi Author dengan Manhwa adalah many-to-many dengan total di kedua sisi. Artinya setiap manhwa pasti memiliki satu atau lebih author dan setiap author yang terdaftar pasti memiliki satu atau lebih manhwa yang ditulis
4. Relasi User dengan Manhwa adalah many-to-many dengan total disisi User. Artinya setiap manhwa dapat di-Like oleh lebih dari satu user dan setiap user yang terdaftar bisa memberikan like kepada lebih dari satu manhwa

Berikut adalah relational diagram dari hasil translasi ER Diagram database Manhwa.
![Relational Model](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Model.png)


## Translasi ERD ke Relational Model
1. Pemetaan entity menjadi relasi
Semua strong entity yang terdapat pada ERD ditranslasi masing-masing menjadi sebuah tabel relasi dengan nama sesuai dengan ERD-nya. Untuk entity User, karena terdapat composite dan multivalued attribute pada atribute `NoTelp` maka attribute dipecah menjadi relasi sensiri yaitu User_Telp.
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Pemetaan%20ERD1.png)
2. Pemetaan relationship menjadi relasi
Setiap relationship yang bersifat many-to-many akan ditranslasi menjadi sebuah relasi baru yang menyimpan primary key dari kedua entity yang dihubungkan oleh relationship tersebut. Contoh pada relationship Manhwa dengan Author yang bersifat many-to-many menghasilkan relasi baru Manhwa_Author yang menyimpan IDManhwa dan IDAuthor sebagi primary keynya
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Pemetaan%20ERD3.png)
untuk relasi one-to-many seperti relationship antara Serialization dengan Manhwa, primary key dari entity one akan dimasukkan ke entity many yang dalam hal ini adalah entity Manhwa
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Pemetaan%20ERD4.png)
3. Database Performace Tuning
Untuk entity Manhwa, author membagi entity kedalam 2 relasi yaitu `Manhwa_Info` yang menyimpan attribute umum dari Manhwa dan `Manhwa_Statistic` yang menyimpan attribute statistic yang berupa nilai eksak. Hal ini karena author merasa jumlah attribute pada entity Manhwa sebelumnya terlalu banyak dan attribute yang sering diakses dari entity Manhwa adalah attribute eksak yaitu `score`, `ranked`, `popularity_rank` dll. Sementara untuk attribute `published_start`, `published_end`, dan sebagainya lebih jarang diakses sehingga lebih baik relasi di-split vertically untuk mengurangi beban kerja DBMS nantinya.
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Pemetaan%20ERD2.png)

Berikut adalah Schema hasil tranlasi ERD menjadi relational model
1. Manhwa_Info(__IDManhwa__,Name,Volumes,Chapters,Status,Published_Start,Published_End,Serialization)
2. Manhwa_Statistic(__Manhwa__,Avg_Score,Ranked,Popularity_Rank,Members,Favorites)
3. Serialization(__IDSerialization__,Name,Website,Manhwa_Published,Owner,Launched)
4. Genre(__IDGenre__,Name,Description)
5. Manhwa_Genre(__Manhwa__,__Genre__)
6. Author(__IDAuthor__,Name,Family_Name,Gender,Birthday,Website,Member_Favorites)
7. Manhwa_Author(__Manhwa__,__Author__)
8. User(__IDUser__,FirstName,LastName,Gender,Birthday,Email)
9. User_Telp(__User__,__NoTelp__)
10. Liked_by(__Manhwa__,__User__,Score)

foreign key:
1. Manhwa_Info(_Serialization_) -> Serialization(IDSerialization)
2. Manhwa_Statistic(_Manhwa_) -> Manhwa_Info(IDManhwa)
3. Manhwa_Genre(_Manhwa_) -> Manhwa_Info(IDManhwa)
4. Manhwa_Genre(_Genre_) -> Genre(IDGenre)
5. Manhwa_Author(_Manhwa_) -> Manhwa_Info(IDManhwa)
6. Manhwa_Author(_Author_) -> Author(IDAuthor)
7. Liked_by(_Manhwa_) -> Manhwa_Info(IDManhwa)
8. Liked_by(_User_) -> User(IDUser)
9. User_Telp(_User_) -> User(IDUser)

## Screenshots of the program
### Data Scraping
- Library Import
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Library%20Import.png)
- Funtion and Procedure
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Function%20%26%20procedure.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Function%20%26%20procedure2.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Function%20%26%20procedure3.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Function%20%26%20procedure4.png)
- Main Program
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/main%20program.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/main%20program2.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/main%20program3.png)
- Program succesfully run
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/Ngambil%20data2.png)
- Data convert to csv
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/data%20convert%20to%20csv.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/data%20convert%20to%20csv2.png)
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/data%20convert%20to%20csv3.png)
- Data cleaning
![Library Import](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/data%20cleaning.png)
### Data Storing
- Create Table
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/create%20table.png)
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/create%20table2.png)
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/create%20table3.png)
- Import Data
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/import_data.png)
- Select Table
![Translasi ERD1](https://github.com/WanAzis/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select_isi.png)

## Data Visualization

## Referensi
- Library
Selenium
BeautifulSoup
Pandas
request
json
time

- Documentations
[BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#extract)
[Selenium](https://selenium-python.readthedocs.io/index.html)

- Additional Source
[BeautifulSoup Tutorial web scraping](https://www.youtube.com/watch?v=gRLHr664tXA)
## Author
Wan Aufa Azis - 18221001  
Sistem dan Teknologi Informasi  
Institut Teknologi Bandung  