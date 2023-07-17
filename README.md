<h1 align="center">
  <br>
  CS:GO S-Tier Tournaments Data
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Storing, and Visualization : CSGO Tournaments
  <br>
  <br>
  
  ![csgo crowd photo](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/MLG_Columbus_-_Luminosity_vs_Navi.jpg/1200px-MLG_Columbus_-_Luminosity_vs_Navi.jpg)


  <br>
</h2>

## Table of Contents
- [Description](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#description)
- [Specification](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#specification)
- [How to Use](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#how-to-use)
- [JSON Structure](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#json-structure)
- [Database Structure](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#database-structure)
- [ERD to Relational Diagram Translation](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#erd-to-relational-diagram-translation)
- [Screenshot of Program](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#screenshot-of-program)
- [References](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#references)
- [Author](https://github.com/attariqazhar/Seleksi-2023-Tugas-1#author)

## Description

<br align = "center">
  <img src="https://trivia.liquipedia.net/static/media/liquipedia-logo.79d7a74bbfbec5cc9cac0ee286716002.svg" width = 400>
<br>
  
Liquipedia merupakan _website_ yang menyimpan informasi terbaru mengenai skor turnamen, profil tim _esport_, dan profil pemain. Salah satu informasi _esport_ yang tersedia di _website_ tersebut adalah Counter Strike: Global Offensive (CSGO). CSGO merupakan permainan _First Person Shooter_ terkemuka di dunia permainan _online_. Pada Liquipedia CSGO, turnamen-turnamen terbagi ke dalam beberapa _tier_ dengan _tier_ tertingginya adalah _S-Tier_. Mengutip dari Liquipedia CSGO, turnamen _S-Tier_ menawarkan total hadiah yang terhitung tinggi, hampir seluruhnya dilaksanakan secara luring (_offline_), dan diikuti oleh tim-tim paling bergengsi di dunia CSGO _esport_. Pada _repository_ ini, akan dilakukan _Data Scraping_ pada _website_ Liquipedia CSGO untuk mencari informasi setiap turnamen _S-Tier_ yang sudah pernah diadakan pada tahun 2012-2023.
<br>
<br>
Dalam _web scraping_ ini, DBMS yang akan digunakan adalah PostgreSQL. PostgreSQL memiliki kelebihan dalam menangani _query_ yang kompleks sehingga visualisasi tabel data menjadi mudah untuk dilakukan. Selain itu, _syntax_ untuk PostgreSQL masih mudah untuk dipelajari sehingga tidak memerlukan waktu lama dalam membuat basis data menggunakan DBMS tersebut.

## Specification
Program _Data Scraping_ ini menggunakan bahasa pemrograman Python dengan dukungan beberapa _libraries_ sebagai berikut
  - Jupyter Notebook
    <br>
    _Open-source web application_ ini mempermudah penataan serta eksekusi kode program. _File_ untuk _data scraping_ akan tersimpan dalam format ".ipynb"
  - BeuatifulSoup
    <br>
    _Library_ ini digunakan dalam _data scraping_ dari website Liquipedia CSGO. _Library_ ini akan melakukan _parsing_ pada website dan menyimpan elemen HTML di dalam suatu variabel. Sintaks pada _library_ ini juga cukup mudah sehingga pencarian elemen HTML pada website menjadi praktis.
  - Requests
    <br>
    Sebelum melakukan _data scraping_, program perlu melakukan _request_ terlebih dahulu kepada _website server_ agar elemen HTML bisa didapatkan. _Library_ ini membantu program dalam melakukan hal tersebut.
  - JSON
    <br>
    _Library_ ini membantu program menghasilkan keluaran file dengan format .json dari variabel dengan tipe data list.
  - Time
    <br>
    Agar _request_ data dilakukan dengan tingkat yang wajar, diperlukan _sleep()_ pada algoritma _request_. Oleh karena itu, _library_ ini membantu program untuk memberikan jeda dalam melakukan _request_.

## How to Use
1. Pastikan komputer/laptop tersambung ke jaringan internet
2. Pastikan seluruh _library_ yang diperlukan telah ter-_install_
3. Apabila menggunakan IDE (seperti VS Code), _install_ Jupyter terlebih dahulu
4. Lakukan _clone_ pada _repository_ ini
5. Pada IDE, buka folder ```Data Scraping``` pada _repository_ ini lalu buka folder ```src```. Pada folder tersebut, buka file "csgo_stier_tourney_scraper.ipynb"
6. Jalan kode program pada _file_ tersebut secara sekuensial dari atas hingga bawah
7. Ketika proses _data scraping_ telah selesai, Anda dapat menjalankan kode paling bawah pada _file_ untuk menghasilkan file JSON

## JSON Structure
Pada kode program "csgo_stier_tourney_scraper.ipynb", _file_ JSON yang dihasilkan akan berjumlah dua.

_File_ pertama merupakan "CSGO_Teams.json" yang menyimpan data tim-tim yang telah memenangkan turnamen _S-Tier_ pada permaianan CSGO.
```
    {
        "team_name": "Heroic",
        "region": "Europe",
        "approx_total_winnings": 3129372
    },
```
_File_ kedua merupakan "CSGO_Tournaments.json" yang menyimpan data turnamen _S-Tier_ pada permainan CSGO.
```
    {
        "tournament_name": "BLAST Premier: Spring Final 2023",
        "start_date": "2023-06-07",
        "end_date": "2023-06-11",
        "city": "Washington, D.C.",
        "country": "United States",
        "type": "Offline",
        "is_major": false,
        "winner": "Heroic",
        "runner_up": "Team Vitality",
        "prize_pool": 425000.0,
        "number_of_participants": 8
    },
```

## Database Structure
Berikut ini adalah desain _ER Diagram_ serta _Relational Diagram_ dari hasil _data scraping_ pada _website_ Liquipedia CSGO

ER Diagram
  
![ERD](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ER%20Diagram.png)

Relational Diagram
  
![Relational Diagram](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Diagram.png)

## ERD to Relational Diagram Translation
Entitas Tournament dan Team memiliki hubungan _many-to-many_ karena setiap turnamen pasti terasosiasi dengan beberapa tim dan setiap tim dapat terasosasi dengan beberapa turnamen. Maka dari itu, hubungan "winner-runner-up" akan direpresentasikan sebagai skema dengan atribut berisi _primary key_ dari kedua entitas. Pada desain _relational diagram_, relasi winner-runner-up menjadikan atribut "tournament id" sebagai _primary key_-nya

## Screenshot of Program
- Import Libraries
  
![import libraries](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/import_libraries.png)

- Deklarasi Fungsi

![function declaration 1](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_1.png)

<br>

![function declaration 2](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_2.png)

<br>

![function declaration 3](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_3.png)

<br>

![function declaration 4.1](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_4_1.png)

<br>

![function declaration 4.2](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_4_2.png)

<br>

![function declaration 4.3](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_4_3.png)

<br>

![function declaration 4.4](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_function_4_4.png)

- Data Scraping

![scraping data 1](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraper_1.png)

<br>

![scraping data 2](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraper_2.png)

<br>

![scraping data 3](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraper_3.png)

- Info saat Program Dijalankan

![scraper running start](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraper_running_start.png)

<br>

![scraper running start](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraper_running_end.png)

- Output dalam Format JSON
![output json](https://github.com/attariqazhar/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/write_json.png)

## References
- Informasi Turnamen S-Tier CSGO
  <br>
  [Liquipedia CS](https://liquipedia.net/counterstrike/S-Tier_Tournaments)
  
- Web Scraping Tutorial
  <br>
  [Web Scraping with Python - Beautiful Soup Crash Course](https://www.youtube.com/watch?v=XVv6mJpFOb0)

- Dokumentasi DBMS
  <br>
  [Dokumentasi PostgreSQL](https://www.postgresql.org/docs/)

## Author
Attariq Muhammad Azhar (18221043)
<br>
Sistem dan Teknologi Informasi
<br>
Institut Teknologi Bandung
