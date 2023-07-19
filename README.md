<h1 align="center">
  <br>
  Top 100 Book Series
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing Goodreads
  <br>
  <br>
</h2>


### Description of the data and DBMS
Goodreads adalah _platform online_ populer untuk para pembaca dan pecinta buku. Situs ini dipergunakan sebagai situs web yang memungkinkan pengguna untuk mencari, menemukan, mengulas buka. Goodreads memiliki fitur rak buku virtual untuk mengatur buku yang telah dibaca, sedang dibaca, atau ingin dibaca. Goodreads juga memiliki profil penulis untuk mereka berinteraksi dengan pembaca, membagikan informasi tentang buku mereka, dan mempromosikan karya mereka. Selain itu, Goodreads juga memiliki berbagai _list_, salah satunya adalah "Best Series", yang saya gunakan pada tugas ini.

DBMS yang digunakan pada tugas ini adalah PostgreSQL. PostgreSQL merupakan sistem manajemen basis data relasional (RDBMS) _open source_ yang kuat. Pada PostgreSQL, data disimpan dalam bentuk tabel dengan baris dan kolom, sehingga dapat melakukan penggabungan, pengurutan, dan pemfilteran data.

### Specification of the program
Kode yang digunakan untuk membuat program _data scraper_ dibuat dengan menggunakan bahasa Python. File hasil _data scraper_ akan dimasukkan ke dalam file JSON. Untuk memasukkan file JSON ke dalam PostgreSQL juga dibuat dengan menggunakan bahasa Python. _Library_ yang digunakan adalah BeautifoulSoup4, requests, dan psycopg2.

### How to use
1. Pastikan Anda telah men-_downoload_ BeautifulSoup4, requests, dan psycopg2
2. Clone _repository_ ini
3. Buka terminal di folder tempat meng-_clone_ dan buka folder src
4. Run program _data scraping_
5. Buka program untuk meng-import hasil JSON ke PostgreSQL. Sesuaikan host, port, database, user, dan password

### JSON Structure
Hasil dari _data scraping_ akan disimpan ke dalam file JSON dengan struktur sebagai berikut. 
```
    "Books": [
        {
            "Rank": nomor ranking (integer),
            "Book_Name": judul buku (string),
            "Author": penulis buku (string),
            "Details": deskripsi buku (string),
            "Pages": jumlah halaman (integer),
            "Ratings": _rating_ buku (float),
            "Published": tanggal rilis buku (date),
            "Genres": [
               genre buku [(string)]
            ]
        }
    "Authors": [
        {
            "Author_Name": nama penulis (string),
            "Author's Description": deskripsi penulis (string),
            "Author's Books Written": jumlah buku yang telah ditulis (integer)
        }

```
### Database Structure (ERD and relational diagram)
#### ERD
<img width="365" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/a8165c77-1b06-4c4c-8294-c82170c71a58">

#### Relational Diagram
<img width="301" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/bb791d0f-bdbe-475e-97fd-e6cd6a08f4f8">

### Explanation of ERD to relational diagram translation process
1. Pemetaan _strong entity_ menjadi relasi
   Pemetaan _strong entity_ menjadi relasi dilakukan dengan memasukkan semua       atribut sederhana dalam ERD menjadi atribut pada _relational diagram_. _Primary key_ yang terdapat pada ERD menjadi _primary key_ pada _relational diagram_.
2. Pemetaan _relationship one to many_
   Pemetaan _relationship one to many_ dilakukan dengan memasukkan _primary key_ dari entitas sisi satu menuju relasi sisi _many_, sehingga menjadi _foreign key_.
3. Pemetaan atribut _multivalued_
   Untuk atribut yang memiliki lebih dari satu  nilai, dibuat relasi baru yang memili atribut _multivalued_ tersebut ditambah dengan _primary key_ dari entitas pemilik atribut _multivalued_. _Primary key_ tersebut juga berperan sebagai _foreign key_ di relasi baru.
   
### Screenshot Program
#### Scraper
<img width="809" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/b26ca9aa-7b1b-4120-8695-2c6839a088d5">
<img width="737" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/25265950-d6c5-44b2-ac8d-9f2f07cb1872">
<img width="782" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/00dd3b67-843a-49c2-8042-e6dfa8f80982">
<img width="767" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/05f61019-942b-451e-9fd9-547ec94a7a60">
<img width="775" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/8f6c2c5a-3e1e-444c-917a-29b99b27b1e0">
<img width="799" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/10dd2e48-766c-4284-a4a1-bfab0f421974">

#### Program saat di-_run_
<img width="903" alt="image" src="https://github.com/aniqakbar/TUGAS_SELEKSI_1_18221020/assets/92070819/1c23062b-ecd5-465f-9853-0ab628a4145d">

### Reference
1. BeautifulSoup4
2. Requests
3. Pyscopg2

### Author
18221020 - Aniqa Fayyaza Akbar
