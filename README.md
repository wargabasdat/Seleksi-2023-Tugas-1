<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  NBA Regular Season 2022/23 Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>


# Data and DBMS Description

Data yang saya ambil untuk proyek kali ini adalah data NBA Regular Season 2022/23 yang didapatkan dari website https://www.espn.com/nba/standings/_/sort/wins/dir/desc. Dari website ini saya mengambil data-data seperti posisi dan statistik team, statistik dan data pemain, serta data pertandingan.  Saya mengambil data ini karena tertarik dengan NBA dan ingin mendapatkan insight yang lebih banyak mengenai Regular Season 2022/23. Dengan mengerjakan proyek ini, dua hal yang saya minati bisa digabung menjadi satu, yaitu basket dan basis data.

Untuk proyek kali ini saya menggunakan PostgreSQL dengan alasan, 

1. Kompatibilitas : PostgreSQL mengikuti standar SQL sehingga bisa digunakan dengan berbagai macam framework. Selain itu, PostgreSQL juga dapat digunakan oleh operating system Windows,Mac, dan Linux. 

2. Keamanan: PostgreSQL memiliki berbagai macam fitur keamanan untuk melindungi data yang dimiliki. Hal ini termasuk otorisasi tingkat kolom, enkripsi data, dana pengaturan akses pengguna.

3. Komunitas yang Besar: PostgreSQL memiliki komunitas yang aktif dan beragam, yang akan membantu penyelesaian masalah yang ditemukan selama pengerjaan proyek ini

# Program Spesification

### Project Steps
Proyek kali ini dibagi menjadi 4 tahap, yaitu Data Scrapping, Data Pre-Processing, Normalisation, dan Pemindahan Data yang didapatkan menjadi SQL Dump. 
1. Proses data scrapping cukup sederhana dengan menggunakan function request beserta library BeautifulSoup. 
2. Setelah data-data berhasil di dapatkan dari website ESPN, akan dilakukan pre-processing agar sesuai dengan bentuk yang diinginkan serta mempermudah proses analisis. 
3. Data yang sudah diproses akan dilakukan normalisasi agar sesuai dengan tabel-tabel Relational Model. 
4. Setelah semua ini selesai data akan diubah menjadi JSON untuk disimpan dan juga dipindahkan menjadi SQL yang akan dianalisis menggunakan postgreSQL.

# How to Use the Program
### Data Scraping
Untuk melihat proses data scrapping hingga normalization dapat menjalankan source code yang terdapat pada folder Data Scraping/src dan menjalankan seluruh code block yang terdapat pada source code tersebut. 

### SQL
Cara untuk menjalankan SQL yang sudah dibuat, pertama membuka terminal dan pindah direktori menjadi DataStoring/export. Setelah itu jalankan kode berikut pg_dump -U {nama_user} -d {nama_database}> NBASeason2223.sql

# JSON Structure 
Dari data yang telah di scrape, data dipindahkan menjadi bentuk JSON, sebagai berikut   
1. player_bio JSON Structure

>  {
   "PlayerId": 1,
    "PlayerName": "Giannis Antetokounmpo",
    "Position": "Power Forward",
   "PlayerHeight": 210.82,
    "PlayerWeight": 243.0,
    "Birthdate": "1994-12-6",
    "Experience": "9th Season",
    "Birth City": "Athens",
    "Birth State": "Greece"
>  }

2. player_stats JSON Structure

>{
    "PlayerId": 1,
    "Team": "Milwaukee Bucks",
    "Gp": 63,
    "Gs": 63,
    "Min": 32.1,
    "Pts": 31.1,
    "OffReb": 2.2,
    "DefReb": 9.6,
    "Ast": 5.7,
    "Stl": 0.8,
    "Blk": 0.8,
    "Turnover": 3.9,
    "Pf": 3.1
>}

3. team_matches JSON Structure

>{
    "MatchDay": "Thursday",
    "MatchDate": "2022-10-20",
    "Team1": "Milwaukee Bucks",
    "Court": "Team 2",
    "Team2": "Philadelphia 76ers",
    "Winner": "Milwaukee Bucks",
    "Overtime": false,
    "Score1": 90,
    "Score2": 88
>}

4. teams JSON Structure

> {
    "Standing": 1,
    "City": "MIL",
    "Name": "Milwaukee Bucks",
    "Conference": "Eastern Conference",
    "Pct": 70.7,
    "Ppg": 116.9,
    "OppPpg": 113.3,
    "Coach": "Adrian Griffin"
>}

# Database Structure

### ERD
![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Model%20Design.drawio.png)

ERD Model diatas dibuat berdasarkan data-data yang telah di scrape dari website ESPN

`player_bio` akan memiliki relasi one to many dengan `player_stats`. Selanjutnya `player_stats` akan memiliki relasi many to one dengan `teams`. Terakhir `teams` akan memiliki relasi many to many dengan `teams` sendiri dalam relasi `team_matches`.

Setelah itu kita akan mengubah ERD ke dalam bentuk Relational Model. 
1. `player_bio` akan memiliki primary key `playerid` dengan atribut lainnya yang terdapat entity `player_bio` pada ERD
2. `teams` akan memiliki primary key `name` (nama team) dengan atribut lainnya yang terdapat pada entity `teams` pada ERD
3. `player_stats` akan memiliki primary key yang juga merupakan foreign key, yaitu `playerid` yang merupakan reference to `player_bio` dan `teams` yang terdapat pada entity `player_stats` pada ERD
4. team_matches akan memiliki primary key `matchdate` dan `team1` dan foreign key `team1` dan `team2` yang merupakan reference ke `teams` dan juga deskripsi tambahan yang terdapat pada relasi `team_matches` pada ERD

### Relational Model
![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ERD%20Design.drawio.png)

# Screenshots
Berikut adalah screenshot yang didapatkan saat melakukan Data Scraping dan Data Storing
![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/player_bio.jpg)

![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/player_stats.jpg)

![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/team_matches.jpg)

![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/player_bio%20table.jpg)

![alt text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/teams%20table.jpg)

# Insights
Dari data yang yang didapatkan melalui web scraping, kita bisa mendapatkan beberapa *insights*, seperti

### Oldest NBA Players
![alt_text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/top%2010%20oldest%20player.jpg)

### Team dengan Bigman (200cm) lebih dari 10:
![alt_text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/most%20bigman%20team.jpg)

### Pemain Defensif kuat di NBA
![alt_text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/top%2010%20defensive%20players.jpg)

### Pemain dengan Turnover yang banyak
![alt_text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/umur%20pemain%20dan%20turnover%20lebih%20dari%204.jpg)

### Team yang kuat di home court
![alt_text](https://github.com/Wentonn/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/top%20home%20winners.jpg)

Seperti yang bisa dilihat dari hasil screenshot diatas, kita dapat mempelajari banyak hal-hal dari data yang sudah di scrape. Dengan menggunakan query-query yang tersedia pun kita dapat melakukan analisis mendalam untuk setiap pemain dan tim dan probabilitas statistik mereka di season berikutnya.

# References
Library yang digunakan adalah :
1. Language : Python  (https://www.python.org/doc/)
2. BeautifulSoup : Library utama yang digunakan untuk Data Scraping (https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
3. Requests : Library yang digunakan untuk mengirimkan HTTP request (https://pypi.org/project/requests/)
4. Pandas : Data yang digunakan untuk melakukan pre processing (https://pandas.pydata.org/docs/)
5. JSON : Library json digunakan untuk mendapatkan file json untuk data yang telah diproses (https://www.w3schools.com/python/python_json.asp)
6. re : Library re digunakan untuk membantu pre processing (https://docs.python.org/3/library/re.html)

<p align="center">
  <br>
   18221095 Nicolas Owen Halim
</p>
<br>
