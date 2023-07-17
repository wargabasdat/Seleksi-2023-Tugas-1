# TUGAS SELEKSI WARGA BASDAT
> Data Scraping, Database Modelling & Data Storing

## Author
Jason Rivalino - 13521008

## Table of Contents
* [Deskripsi Singkat Data dan DBMS](#deskripsi-singkat-data-dan-dbms)
* [Spesifikasi Program](#spesifikasi-program)
* [Struktur File](#struktur-file)
* [Requirements](#requirements)
* [Cara Menjalankan Program](#cara-menjalankan-program)
* [JSON Structure](#json-structure)
* [Struktur Database](#struktur-database)
* [Penjelasan Struktur Database](#penjelasan-struktur-database)
* [Screenshoot Program](#screenshoot-program)
* [Referensi](#referensi)
* [Acknowledgements](#acknowledgements)

## Deskripsi Singkat Data dan DBMS
Repository ini berisikan data yang memuat informasi terkait Top 500 lagu dari Rolling Stones sepanjang masa. Beberapa informasi yang diambil dari website antara lain peringkat lagu, judul lagu, nama penyanyi, dan tahun lagu dirilis. Setelah mendapatkan data yang diperlukan dari website, data yang didapat kemudian disimpan dalam bentuk JSON. Dari file JSON yang ada, data dikembangkan lagi untuk membentuk data yang bersifat relasional dengan menambahkan beberapa informasi terkait lagu (genre dan album) dan penyanyi (jenis, tanggal lahir, dan tahun lahir). Setelah terbentuk data relasional, data disimpan dalam bentuk SQL dan dijalankan menggunakan DBMS MariaDB. Penggunaan MariaDB dipilih karena saya sudah pernah menggunakan DBMS ini pada praktikum semester lalu sehingga sudah lebih familier. 

## Spesifikasi Program
Untuk program WebScrapping, program dibuat menggunakan library BeautifySoup dari Python dan library json untuk menyimpan file json pada akhirnya. Setelah import library, berikutnya memasukkan URL yang ingin dilakukan scrapping data. Dari web tersebut kemudian melakukan parsing HTML teksnya dan berikutnya inspeksi untuk mencari data yang akan diambil. Setelah data diambil, kemudian data dicetak dan disimpan dalam bentuk file JSON.

Untuk program SQL. Program dibuat berdasarkan file JSON yang sudah ada sebelumnya. Dalam program SQL, data yang diambil hanyalah data untuk lagu dengan urutan 50 tertinggi saja. Untuk struktur data relasional, dapat dicek pada diagram yang ada dibawah. Terdapat beberapa constraint yang ada dalam program seperti:
1. Primary Key untuk beberapa data seperti rank, idSong, dan idSinger
2. Foreign Key untuk data-data tertentu (penjelasan lebih lengkap dibawah)
3. Check Constraint: jika penyanyi lebih dari 1 (duo, band, dll) maka data tanggal tempat lahir menjadi NULL, jika solo maka data tempat tanggal lahir tidak boleh NULL

## Struktur File
```bash
📦TUGAS_SELEKSI_1_13521008
 ┣ 📂Data Scraping
 ┃ ┣ 📂data
 ┃ ┃ ┗ 📜500_song_data.json
 ┃ ┣ 📂screenshot
 ┃ ┃ ┗ 📜Program Code + Output.png
 ┃ ┗ 📂src
 ┃ ┃ ┗ 📜webscrap.py
 ┣ 📂Data Storing
 ┃ ┣ 📂design
 ┃ ┃ ┣ 📜ER Diagram.png
 ┃ ┃ ┗ 📜Relational Database Diagram.png
 ┃ ┣ 📂export
 ┃ ┃ ┗ 📜top50songs.sql
 ┃ ┗ 📂screenshot
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Constraint Check Penyanyi.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Desc Table SingerInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Desc Table SongInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Desc Table Top50Songs.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Desc Table TopSingerInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Desc Table TopSongInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Select All SingerInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Select All SongInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Select All Top50Songs.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Select All TopSingerInfo.png
 ┃ ┃ ┣ 📜Bukti DBMS MARIADB - Select All TopSongInfo.png
 ┃ ┃ ┗ 📜Bukti DBMS MARIADB - Show Tables.png
 ┗ 📜README.md
 ```

## Requirements
1. Visual Studio Code
2. Python dengan library BeautifySoup (pip install beautifysoup4) dan json (pip install jsons)
3. MariaDB untuk pengelolaan data

## Cara Menjalankan Program
Langkah-langkah proses setup program adalah sebagai berikut:
1. Clone repository ini
2. Jika ingin menjalankan webscrap, ubah direction ke `..\Data Scraping\src` lalu ketikkan `python webscrap.py` maka akan menampilkan data 500 lagu beserta hasil save file dalam bentuk JSON
3. Jika ingin menjalankan file DBMS, membuka DBMS terlebih dahulu dengan buka terminal pada `..\Data Storing\export` lalu ketikkan `mariadb -u root -p`. Jika sudah terbuka, buat database dengan `create database song` lalu gunakan database dengan `use song` lalu import sql dengan `source top50songs.sql`. Setelah data terexport, data kemudian sudah bisa digunakan dan diolah dalam MariaDB

## JSON Structure
```
[
  {
    "rank":"500"
    "song":"Stronger"
    "singer":"Kanye West"
    "yearRelease":"2007"
  }
]
```

## Struktur Database
![er + relational](https://github.com/jasonrivalino/TUGAS_SELEKSI_1_13521008/assets/91790457/6f47f0d7-ebef-48db-aff3-c8eeb659578e)

## Penjelasan Struktur Database
Untuk struktur database, pembuatan ER dilakukan berdasarkan file JSON yang terbentuk sebelumnya. Dari situ kemudian membentuk ER dengan tabel top50songs memiliki relasi dengan tabel songInfo dan singerInfo. Beberapa asumsi yang ada dalam ER diagram ini adalah sebagai berikut:
1. Pada lagu-lagu di top 50, terdapat banyak lagu yang setiap lagu dan penyanyinya juga mempunyai banyak informasi, sehingga hubungan diagram ERnya adalah many-to-many
2. Pada setiap lagu di top 50, pasti terdapat informasi, dan setiap informasi pasti merupakan bagian dari lagu top 50 sehingga bentuknya adalah total participation untuk relasi dari top50songs to songInfo, begitupn sama untuk relasi dari top50songs ke singerInfo

Berdasarkan ER yang telah jadi, kemudian akan dibentuk diagram Relasional. Cara pengubahannya karena relasinya many-to-many, maka dibentuk lagi tabel baru yang berisikan PK dari kedua tabel yang berelasi sehingga bentuk akhir relational diagramnya adalah sebagai berikut:
- top50songs: (<ins>rank</ins>, song, singer, yearRelease)
- songInfo: (<ins>idSong</ins>, song, genre, album)
- singerInfo: (<ins>idSinger</ins>, singer, types, bornPlace, bornDate)
- topSongInfo: (<ins>rank</ins>, <ins>idSong</ins>)
- topSingerInfo: (<ins>rank</ins>, <ins>idSinger</ins>)

Adapun bentuk Foreign Keynya adalah sebagai berikut:
- topSongInfo(rank) -> top50songs(rank)
- topSingerInfo(rank) -> top50songs(rank)
- topSongInfo(idSong) -> songInfo(idSong)
- topSingerInfo(idSinger) -> singerInfo(idSinger)

## Screenshoot Program
- WebScrapping
  
![Program Code + Output](https://github.com/jasonrivalino/TUGAS_SELEKSI_1_13521008/assets/91790457/5b8387a4-5eb5-4772-8a40-fbca98f33fb2)

- MariaDB Show Tables

![Bukti DBMS MARIADB - Show Tables](https://github.com/jasonrivalino/TUGAS_SELEKSI_1_13521008/assets/91790457/c0743fe6-016f-4421-b043-105448cceacc)


## Referensi
|Library|Link|
|:---|:---:|
|BeautifySoup|[Link](https://pypi.org/project/beautifulsoup4/)|
|JSON|[Link](https://pypi.org/project/jsons/)|
|MariaDB Documentation|[Link](https://mariadb.com/kb/en/documentation/)|

## Acknowledgements
- Tuhan Yang Maha Esa
- Kakak-Kakak Asisten Lab Basdat
