<h1 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h1>

## Description of Data and DBMS
Data diambil dari laman web https://www.dbl.id khususnya __*Season 2022 East Java Series North Region Group Stage to Final*__. Laman web DBL berisi data statistik hasil pertandingan DBL, pemain, dan sekolah di seluruh *region*. Saya memilih untuk melakukan *scraping* web ini karena melihat data-data yang disediakan dalam web tersebut, analisis dapat dilakukan untuk menemukan semua kelemahan maupun kekuatan dari tiap sekolah dan pemain sehingga dapat menentukan strategi yang tepat ketika melawan sekolah-sekolah tersebut.

DBMS yang digunakan adalah __PostgreSQL__. Alasan penggunaan PostgreSQL karena merupakan *database* relasional dan memiliki kompatibilitas dengan __python__ yang dalam *repository* ini digunakan untuk melakukan *data scraping* serta mudah untuk digunakan.

## Specification of the program
Program untuk melakukan *data scraping* dan *data storing* ditulis menggunakan bahasa pemrograman __Python__ dengan beberapa library:
- `Selenium`: Library ini digunakan atas pertimbangan bahwa https://www.dbl.id merupakan web yang __dinamis__ sehingga penggunaan Selenium yang melakukan otomatisasi browser dan interaktif termasuk memungkinkan untuk melakukan klik pada web akan memudahkan dalam melakukan *scraping*.
- `JSON`: Library ini digunakan karena keluaran file yang diharapkan adalah dalam format .json
- `psycopg2`: Library ini digunakan untuk melakukan koneksi dengan *database* PostgreSQL dan memasukkan data-data dari file .json ke *database*

## How to use
### Data Scraping
1. *Clone repository* ini.
2. *Install* library yang dibutuhkan dengan mengetik di CMD
  `pip install selenium`
  - Unduh *package webdriver* sesuai dengan aplikasi yang digunakan, dalam *repository* ini menggunakan chrome (https://chromedriver.chromium.org/downloads)
  - Ganti *path webdriver* di file __Data Scraping/src/main.py__ dengan *path package webdriver* yang telah diunduh
3. Ganti variabel `path` di file __main.py__ dengan *path* __Seleksi-2023-Tugas-1/Data Scraping/data/data.json__ di komputer.
4. Buka CMD, masuk ke root folder __Seleksi-2023-Tugas-1/Data Scraping/src__.
5. Jalankan program dengan mengetikkan __python3 main.py__ pada CMD.

### Data Storing
1. *Install* modul yang dibutuhkan dengan mengetik di CMD
  `pip install psycopg2`
2. Buka CMD, masuk ke root folder __Seleksi-2023-Tugas-1/Data Scraping/src__.
3. Ganti variabel `path` di file __store.py__ dengan *path* __Seleksi-2023-Tugas-1/Data Scraping/data/data.json__ di komputer Anda.
4. Buka CMD, masuk ke root folder __Seleksi-2023-Tugas-1/Data Scraping/src__.
5. *create database* terlebih dahulu di __PostgreSQL__. Ganti nama __database, user, dan password yang sesuai__ pada file __store.py__.
6. Jalankan program dengan mengetikkan __python3 store.py__ pada CMD

## JSON Structure {#JSON-structure}
Contoh *instance* data JSON:
```
{ "school": [
    {"name": "SMA NATION STAR ACADEMY SURABAYA", 
     "street": "Jl. Dharmahusada Indah Barat Vi / I", 
     "subdistrict": "Gubeng", 
     "city": "Kota Surabaya"},
  ],
  "match_info": [
   {"team_A": "SMA NATION STAR ACADEMY SURABAYA", 
    "type": "Boys", 
    "venue": "DBL Arena Surabaya", 
    "date_time": "10 Sep 2022 11:00 WIB", 
    "score_A": "32", 
    "score_B": "67", 
    "team_B": "SMA GLORIA 1 SURABAYA", 
    "winner": "SMA GLORIA 1 SURABAYA", 
    "field_goal_A": "10/43", 
    "field_goal_pct_A": "23.3", 
    "field_goal_B": "27/58", 
    "field_goal_pct_B": "46.6", 
    "2pts_A": "8/28", 
    "2pts_pct_A": "28.6", 
    "2pts_B": "24/40", 
    "2pts_pct_B": "60", 
    "3pts_A": "2/15", 
    "3pts_pct_A": "13.3", 
    "3pts_B": "3/18", 
    "3pts_pct_B": "16.7", 
    "free_throw_A": "10/24", 
    "free_throw_pct_A": "41.7", 
    "free_throw_B": "10/13", 
    "free_throw_pct_B": "76.9", 
    "rebound(O/D)_A": "10/16", 
    "rebound(O/D)_B": "14/23", 
    "assist_A": "4", 
    "assist_B": "12", 
    "steal_A": "6", 
    "steal_B": "14", 
    "block_A": "1", 
    "block_B": "0", 
    "turnover_A": "18", 
    "turnover_B": "16", 
    "foul_A": "13", 
    "foul_B": "20", 
    "pts_off_turnover_A": "12", 
    "pts_off_turnover_B": "29"},
  ], 
  "player_stats": [
    {"date_time": "10 Sep 2022 11:00 WIB", 
     "name": "Roben Sasmita", 
     "school": "SMA NATION STAR ACADEMY SURABAYA", 
     "position": "Forward", 
     "minute": "13:21", 
     "points": "2", 
     "assists": "1", 
     "rebound": "2"},
  ],
  "official": [
    {"name": "Nandesha Nensia D.c", 
     "school": "SMA NATION STAR ACADEMY SURABAYA", 
     "type": "Boys", 
     "role": "Coach", 
     "type2": "Girls",
     "role2": "Assistant Coach"},
  ]
}
```

## Database Structure
### Entity Relationship Diagram
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ER%20Diagram.png width=450>
</div>

### Explanation of ERD to relational diagram translation process
ER Diagram yang telah dibuat kemudian diubah menjadi diagram relasional untuk kemudian diimplementasikan ke *database*.  
1. Pemetaan *strong entity* menjadi relasi
    - person = (__name__, gender, age)
    - school = (__name__, address_street, address_subdistrict, address_city)
    - match_info = (__date_time__, type, venue)  

2. Pemetaan *weak entity* menjadi relasi  
    Primary key *strong entity* dari *weak entity* dan diskriminator akan menjadi PK dari *weak entity*  
    - player_stats = (__date_time__, __name__, position, minute, points, assist, rebound)  
    - team_stats = (__date_time__, __name__, score, field_goal, field_goal_pct, two_pts, two_pts_pct, three_pts, three_pts_pct, free_throw,     free_throw_pct, rebound_od, assist, steal, block, turnover, foul, pts_off_turnover)
      
    FK:  
    - player_stats(date_time) -> match_info(date_time)
    - player_stats(name) -> player(name)
    - team_stats(date_time) -> match_info(date_time)
    - team_stats(name) -> school(name)  

3. Pemetaan specialization person menjadi 2 entitas, yaitu *official* dan *player*  
   Karena tabel official dan player akan berhubungan dengan entitas-entitas yang berbeda, maka akan lebih mudah untuk menjadikan *official* dan *player* menjadi dua entitas yang berbeda.
    - official = (__name__, job_type, job_role gender, age)
    - player = (__name__, gender, age)  

4. Pemetaan *One to Many Relationship* menjadi relasi  
   *Primary Key* dari entitas *one* ke *many* untuk menghindari adanya *null value* maupun data yang redundan  
    - official = (__name__, school, job_type, job_role, gender, age)
    - player = (__name__, school, gender, age)
    - match_info = (__date_time__, type, venue, winner)
  
    FK:
    - official(school) -> school(name)
    - player(school) -> school(name)
    - match_info(winner) -> school(name)

5. Pemetaan *Multivalued Attributes*  
   Atribut ini akan menjadi relasi baru untuk menghindari adanya duplikasi dimana *multivalued attributes* dan PK dari relasi akan menjadi PK di relasi baru.  
    - official_role = (__name__, __job_type__, __job_role__)  

    FK:
    - official_role(name) -> official(name)

### Relational Diagram
Setelah pemetaan *Entity-Relationship Diagram*, didapatkan *Relational Diagram* sebagai berikut.
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Diagram%20Relasional.png width=450>
</div>

## Screenshot program
Berikut merupakan beberapa *screenshot* program beserta penjelasannya.  
Website yang digunakan:
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_website.jpg width=600>
</div>

### Data Scraping
Dalam 1 *season*, terdapat beberapa games yang dipisahkan dalam beberapa hari dan hari dipisahkan menggunakan *button* yang ketika diklik akan mengarahkan ke *page website* yang lain. Maka dari itu, dilakukan penyimpanan link url untuk setiap hari yang tercatat serta link url *game detail* untuk setiap *match* yang dilaksanakan pada hari itu.  
<div style="display: flex; justify-content: center;">
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_link_day.jpg width=510>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_urlgame.jpg width=450>
</div>

  
Sebelum melakukan *scraping*, dibuat fungsi untuk melakukan *data cleaning* sehingga data yang didapatkan bersih dan tidak ada *null value* maupun data yang redundan
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_data_cleaning.jpg width=400>
</div>

  
Setelah itu, dilakukan iterasi untuk setiap *match* yang dilaksanakan. Website menggunakan button yang harus diklik untuk melihat *summary* dan *boxscore* dari tiap team. Dilakukan *scraping* untuk mendapatkan informasi umum tentang *match* dan *summary* yang merupakan tampilan *default* setelah link dibuka untuk mendapatkan statistik team. Kemudian, dilakukan klik pada *button boxscore* terlebih dahulu. Teamm A merupakan *default* tampilan setelah *button* diklik, kemudian dilakukan *scraping* terhadap statistik pemain team A. Setelah itu, dilakukan klik pada button *team B* untuk melakukan *scraping* statistik pemain team B.
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_team.jpg width=500>
</div>

  
Lalu, dilakukan *scraping* untuk mendapatkan data umum sekolah. Link telah didapatkan dari *scraping game detail* yang sebelumnya.
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_school.jpg width=500>
</div>

Seluruh hasil *scraping* diletakkan di dalam list yang telah dideklarasikan sebelumnya. Setelah *scraping* selesai, hasil akan dimasukkan ke file .json 
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_scraping_export_json.jpg width=500>
</div>

### Data Storing
Dilakukan perintah *create table* terlebih dahulu di awal program sesuai dengan diagram relasional yang telah dibuat.
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_storing_create_table.jpg width=600>
</div>

Setelah itu, dilakukan perintah *insert value* untuk memindahkan seluruh isi dari file .json ke dalam *database*
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss_storing_insert_data.jpg width=600>
</div>

Berikut merupakan contoh hasil penyimpanan data pada *database* setelah program dijalankan pada __table match_info__
<div align=center>
  <img src=https://github.com/raniakiranaa/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/ss_match_info.jpg width=500>
</div>


## Reference 
1. [Website DBL](https://www.dbl.id/)
3. [Dokumentasi Selenium](https://selenium-python.readthedocs.io/)
2. [Dokumentasi Psycopg](https://www.psycopg.org/docs/)
3. [Dokumentasi PostgreSQL](https://www.postgresql.org/)

## Author
Rania Sasi Kirana  
18221168  
Sistem dan Teknologi Informasi  
Institut Teknologi Bandung  
