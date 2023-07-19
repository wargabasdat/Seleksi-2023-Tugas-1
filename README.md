<h1 align="center">
  <br>
  Data Dragon City
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing : Website deetlist.com/dragoncity/
  <br>
  <br>
</h2>


## Spesifikasi

### Table of Content
  - [Desciption](#description)
  - [Specification of the program](#specification-of-the-program)
  - [How to use](#how-to-use)
  - [JSON Structure](#json-structure)
  - [Database Structure (ERD and relational diagram)](#database-structure-erd-and-relational-diagram)
  - [Explanation of ERD to relational diagram translation process](#explanation-of-erd-to-relational-diagram-translation-process)
  - [Reference (Library used, etc)](#reference-library-used-etc)
  - [Author](#author)

### Description
Data yang digunakan dalam proyek ini berasal dari website deetlist.com/dragoncity/. Data tersebut merupakan informasi tentang naga-naga dalam permainan Dragon City, termasuk detail seperti nama, elemen, statistik, serangan, dan kekuatan/kelemahan.

DBMS yang digunakan dalam proyek ini adalah MySQL yang diakses melalui phpMyAdmin. MySQL dan phpMyAdmin dipilih karena merupakan kombinasi yang populer dan dapat diandalkan untuk mengelola basis data relasional dengan antarmuka pengguna yang intuitif.

MySQL adalah sistem manajemen basis data relasional yang tangguh, stabil, dan populer di kalangan pengembang. Selain itu, MySQL juga mendukung bahasa SQL yang sangat kuat untuk mengelola dan memanipulasi data.

phpMyAdmin adalah aplikasi web berbasis PHP yang menyediakan antarmuka grafis untuk mengelola dan mengakses basis data MySQL. Dengan menggunakan phpMyAdmin, pengguna dapat dengan mudah membuat, mengubah, dan menghapus tabel, menjalankan kueri SQL, mengelola indeks dan kunci asing, serta melakukan tugas administrasi lainnya terkait basis data.

Pemilihan MySQL melalui phpMyAdmin sebagai DBMS yang digunakan memungkinkan penulis untuk membuat skema database yang baik dan efisien, serta melakukan operasi database dengan mudah melalui antarmuka web yang disediakan oleh phpMyAdmin.

Dengan menggunakan MySQL melalui phpMyAdmin, penulis dapat menyimpan, mengelola, dan mengakses data naga Dragon City dengan efisien, memungkinkan pengguna untuk melakukan berbagai operasi dan analisis pada data tersebut.

### Specification

Program ini menggunakan Python dan beberapa library sebagai berikut:

- `requests`: Digunakan untuk mengirim permintaan HTTP ke website dan mendapatkan responnya.
- `json`: Digunakan untuk memanipulasi data dalam format JSON.
- `BeautifulSoup`: Digunakan untuk melakukan parsing dan ekstraksi data dari HTML.
- `urllib.parse`: Digunakan untuk menggabungkan URL dengan benar.
- `re`: Digunakan untuk melakukan pencocokan pola (pattern matching) menggunakan regular expression.

### How to use

1. Clone repository ini.
2. Buka terminal dan arahkan ke direktori repository ini.
3. Pastikan Python sudah terinstall di komputer Anda. Jika belum, silakan install Python terlebih dahulu.
4. Install library yang dibutuhkan dengan menjalankan perintah `pip install <library>`.
5. Jalankan program file `scrapping_dc_json` pada `Data Scraping/src`
6. Anda akan mendapatkan file `all_dragon_data.json` pada `Data Scraping/data`

### JSON Structure
Berikut adalah struktur JSON yang dihasilkan oleh program:

```json
[
  {
    "name": "Nature Dragon",
    "breed_time": "20 minutes",
    "buy_price": 500,
    "hatch_time": "20 minutes",
    "breedable": "Yes",
    "hatch_xp": 1000,
    "description": "The Nature Dragon is a Common Dragon with the primary typing of Nature. The Nature Dragon loves humans, animals, and all living things - some of them for gastronomic purposes. Even though she hasnt eaten a whole human, a finger or two have been lost...",
    "base_moves": [
      {
        "type": "att_physical",
        "name": "Punch",
        "damage": 338
      },
      {
        "type": "att_plant",
        "name": "Stitching Roots",
        "damage": 550
      },
      {
        "type": "att_plant",
        "name": "Poison Ivy",
        "damage": 650
      },
      {
        "type": "att_plant",
        "name": "Leaf Blast",
        "damage": 1050
      }
    ],
    "trainable_attacks": [
      {
        "type": "att_physical",
        "name": "Hard Charge",
        "damage": 488
      },
      {
        "type": "att_plant",
        "name": "Rotting Spell",
        "damage": 1200
      },
      {
        "type": "att_physical",
        "name": "Stunning Hit",
        "damage": 638
      },
      {
        "type": "att_plant",
        "name": "Beehive",
        "damage": 1350
      }
    ],
    "strengths": [
      "Sea",
      "Light"
    ],
    "weaknesses": [
      "Flame",
      "Ice"
    ]
  }.
]
```
Struktur JSON di atas menggambarkan data naga yang diperoleh dari scraping. Setiap objek naga memiliki properti-properti seperti name (nama naga), breed_time (waktu pembiakan), buy_price (harga beli), hatch_time (waktu penetasan), breedable (dapat dipiara), hatch_xp (XP saat menetaskan), description (deskripsi naga), base_moves (serangan dasar), trainable_attacks (serangan yang dapat dilatih), strengths (kekuatan), dan weaknesses (kelemahan).

Bagian base_moves dan trainable_attacks berisi array dari objek-objek serangan dengan properti seperti type (jenis serangan), name (nama serangan), dan damage (jumlah kerusakan yang disebabkan).

Bagian strengths dan weaknesses berisi array dari elemen-elemen yang menyatakan kekuatan dan kelemahan naga terhadap elemen-elemen tertentu.

Ini adalah struktur JSON yang dapat digunakan untuk menyimpan data naga hasil scraping.

### Database Structure (ERD and relational diagram)

#### ERD
Berikut adalah diagram hubungan antar entitas (Entity Relationship Diagram/ERD) berdasarkan poin-poin yang telah disebutkan:

![ERD](Data%20Storing/design/ERD_Dragon_City.png)



Berikut adalah diagram relasional yang menggambarkan tabel-tabel yang akan dibuat:

Entitas : 
1. Dragon

    - id_dragon
    - dragon_name
    - breed_time
    - buy_price
    - hatch_time
    - breedable
    - hatch_xp
    - description

2. Element

    - id_element
    - element_name

3. Trainable_Attack

    - id_trainable_attack
    - trainable_attack_name
    - trainable_attack_type
    - trainable_attack_damage

4. Base_move

    - id_base_move
    - base_move_name
    - base_move_type
    - base_move_damage

5. Rarity

    - id_rarity
    - rarity_name

Hubungan Antar Entitas:
1. Dragon_Element (Many-to-One)
  
    - Setiap naga hanya dapat memiliki satu elemen
    - Satu elemen dapat dimiliki oleh banyak naga

2. Dragon_Strength (Many-to-Many)

    - Setiap naga dapat memiliki banyak kekuatan
    - Setiap kekuatan dapat dimiliki oleh banyak naga

3. Dragon_Weakness (Many-to-Many)

    - Setiap naga dapat memiliki banyak kelemahan
    - Setiap kelemahan dapat dimiliki oleh banyak naga

4. Dragon_Trainable_Attack (Many-to-Many)

    - Setiap naga dapat memiliki banyak serangan yang dapat dilatih
    - Setiap serangan yang dapat dilatih dapat dimiliki oleh banyak naga

5. Dragon_Base_Move (Many-to-Many)

    - Setiap naga dapat memiliki banyak serangan dasar
    - Setiap serangan dasar dapat dimiliki oleh banyak naga

6. Dragon_Rarity (Many-to-One)

    - Setiap naga hanya dapat memiliki satu rarity
    - Satu rarity dapat dimiliki oleh banyak naga


####  Relational Diagram
Berikut adalah diagram relasional yang menggambarkan tabel-tabel yang akan dibuat:

![Relational Diagram](Data%20Storing/design/Relational_Diagram_Dragon_City.png)






### Explanation of ERD to relational diagram translation process

Proses translasi ERD menjadi relational diagram melibatkan beberapa langkah berikut:

1. Identifikasi Entity

    - Setiap entitas dalam ERD akan menjadi tabel dalam relational diagram

2. Identifikasi Atribut
  
    - Setiap atribut dalam ERD akan menjadi kolom dalam tabel yang sesuai

3. Identifikasi Relation

    - Setiap relasi dalam ERD akan menjadi tabel atau kolom dalam relational diagram
    - Setiap relasi many-to-many akan menjadi tabel join baru yang berisi primary key dari kedua entitas yang berelasi
    - Setiap relasi many-to-one akan menjadi kolom dalam tabel yang sesuai

4. Identifikasi Primary Key
  
    - Setiap primary key dalam ERD akan menjadi primary key dalam tabel yang sesuai

5. Identifikasi dan implementasi Foreign Key
  
    - Setiap foreign key dalam ERD akan menjadi foreign key dalam tabel yang sesuai


### Reference (Library used, etc)

- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
- [Requests](https://requests.readthedocs.io/en/master/)
- [JSON](https://docs.python.org/3/library/json.html)
- [MySQL](https://www.mysql.com/)
- [PhpMyAdmin](https://www.phpmyadmin.net/)
- [XAMPP](https://www.apachefriends.org/index.html)
- [Minimization of ER Diagrams - GeeksforGeeks](https://www.geeksforgeeks.org/minimization-of-er-diagrams/)


### Author

<h3 align="center">
  <br>
  Adrian Fahri Affandi
  <br>
  18221002
  <br>

</h3>


<p align="center">
  <i>
    <a href="https://www.linkedin.com/in/adrian-fahri-affandi-030698217/">LinkedIn</a>
    &nbsp;&nbsp;&nbsp;
    <a href="https://www.instagram.com/adrianfhr/">Instagram</a>
  </i>
</p>
<br>
