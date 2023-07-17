<h1 align="center">
  Data Scraping and Data Storing from KKPK Catalogue Website
</h1>
<img src="Data Scraping\screenshot\logo.png">
KKPK (Kecil-Kecil Punya Karya) merupakan pelopor media literasi bagi anak-anak yang sudah ada sejak tahun 2003. Dengan memanfaatkan ilmu dari perkuliahan Basis Data, katalog yang ada pada website KKPK akan diperoleh dengan metode Data Scraping. Data yang terkumpul akan disimpan dalam sebuah database sesuai dengan mata kuliah Basis Data yang sudah pernah dipelajari sebelumnya.

## Table of Contents
* [Description of the data and DBMS](#description-of-the-data-and-dbms)
* [Specification of the program](#specification-of-the-program)
* [How to Run the Program](#how-to-run-the-program)
* [JSON Structure](#json-structure)
* [Database Structure](#database-structure)
* [Screenshots](#screenshot)
* [Reference](#reference)
* [Author](#author)

## Description of the data and DBMS
Data yang digunakan akan diambil dari website [katalog KKPK](https://kecilkecilpunyakarya.com/shop/), dimana di dalam web tersebut tersimpan informasi seperti judul buku KKPK, genre buku KKPK, dan harga. Pengguna juga dapat melihat informasi mengenai pengarang buku, ISBN, serta sinopsis dari setiap produk buku yang tersedia di katalog.

Data yang sudah diperoleh akan disimpan dalam DBMS PostgreSQL. PostgreSQL memiliki fleksibilitas dan fitur yang lebih banyak, juga memiliki sistem database relasional dan bersifat open-source.

## Specification of the program
Data Scraping akan dilakukan menggunakan bahasa [Python](https://www.python.org/downloads/), dengan beberapa library seperti :
- BeautifulSoup
- requests
- os
- pandas
- json
- psycopg2

Data Storing akan dilakukan ke dalam DBMS [PostgreSQL](https://www.postgresql.org/download/) yang instalasinya dapat kalian ikuti melalui [panduan berikut](https://www.postgresqltutorial.com/postgresql-getting-started/install-postgresql/).

## How to Run the Program
1. Clone repository ini terlebih dahulu
```py
> git clone https://github.com/cathlauretta/Seleksi-2023-Tugas-1.git
```
2. Buka folder src yang ada di dalam folder Data Scraping, lalu install library yang diperlukan
```py
> pip install -r library.txt
```

3. Dalam path yang sama, jalankan file ``scraper.py``
```py
> py scraper.py
```
<img src="Data Scraping\screenshot\scraping1.png">
<img src="Data Scraping\screenshot\scraping2.png">

4. Apabila file scraper sudah berhasil dijalankan, selanjutnya kita harus melakukan data storing ke dalam DBMS. Namun, sebelum menjalankan file ``storing.py`` kita harus membuat database bernama ``kkpk`` di dalam PostgreSQL. Di dalam terminal yang sama, jalankan perintah-perintah di bawah ini.
```bash
> psql -U postgres
Password : # Masukkan password kalian
```
```sql
# CREATE DATABASE kkpk;
```

5. Jika database ```kkpk``` sudah berhasil dibuat, kalian bisa keluar dari PostgreSQL dan menjalankan perintah berikut. **Jangan lupa untuk mengubah nama username, database, dan password** di dalam file ``storing.py`` agar sesuai dengan milik kalian.
```py
> py storing.py
```
<img src="Data Storing\screenshot\storing.png">

6. Setelah melakukan data storing, database dapat di-export agar dapat digunakan untuk keperluan lain. SQL hasil export dapat disimpan di folder ```Data Storing\export```. Apabila sudah pindah folder, jalankan perintah berikut untuk melakukan export.
```bash
> pg_dump -U postgres -d > kkpkcatalogue.sql
```

## JSON Structure
Terdapat 3 file JSON yang digunakan untuk menyimpan hasil scraping, yaitu :
1. ``book_details.json``
```json
{
  "Book ID" : ID Buku KKPK,
  "Book Title" : Judul Buku KKPK,
  "Price" : Harga Buku KKPK,
  "ISBN" : ISBN Buku
}
```

2. ``book_author.json``
```json
{
  "Book ID" : ID Buku KKPK,
  "Author" : Pengarang Buku KKPK
}
```

3. ``book_genre.json``
```json
{
  "Book ID" : ID Buku KKPK,
  "Genre" : Genre Buku KKPK
}
```

## Database Structure
Berikut merupakan gambar _Entity-Relationship Diagram_ beserta _Relational Model_-nya
<img src="Data Storing\design\erd-relational.png">
Informasi yang diperoleh dari hasil scraping disusun menjadi atribut-atribut yang ada pada ER Diagram sebelah kiri. Pada website yang digunakan, tidak semua produk buku memiliki informasi mengenai pengarang dan isbn sehingga di dalam DBMS atribut tersebut bisa saja bernilai NULL. Karena terdapat beberapa buku yang dikarang oleh satu dan lebih pengarang, juga ada buku yang memiliki genre lebih dari satu, maka author dan genre dibuat multivalue sehingga transformasi ER Diagram menjadi seperti di gambar bagian sebelah kanan.

## Screenshot
Berikut merupakan daftar relasi yang terdapat dalam database serta deskripsi _field_ pada relasi
<img src="Data Storing\screenshot\relations.png"> 
<img src="Data Storing\screenshot\book_information.png">
<img src="Data Storing\screenshot\book_author.png">
<img src="Data Storing\screenshot\book_genre.png">

## Reference
- [Web Scraping Python using BeautifulSoup](https://www.youtube.com/watch?v=C5AOZZWxvIY)
- [Pandas Dataframe To JSON](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_json.html)
- [PostgreSQL CRUD Operation from Python](https://www.geeksforgeeks.org/perform-postgresql-crud-operations-from-python/)

## Author
| Name | NIM | Program Studi |
|-----|-----|-----|
| Cathleen Lauretta | 18221157 | Sistem dan Teknologi Informasi |

Institut Teknologi Bandung 