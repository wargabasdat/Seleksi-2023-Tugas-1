<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Farhan Algani Putra - 18221108
  <br>
  <br>
</h2>


### Description of the data and DBMS
<p>
Honkai Star Rail atau yang biasa disingkat sebagai HSR merupakan game terbaru besutan Hoyoverse. HSR pertama kali rilis secara global untuk publik pada tanggal 26 April 2023. HSR merupakan game single player-turn based yang menceritakan kisah seorang trailblazer yang menjelajahi antariksa bersama dengan anggota *The Express*. Permainan ini merupakan salah satu permainan yang sangat populer belakangan ini. Menurut statistik yang didapat dari www.dexerto.com, HSR sudah mencapai lebih dari 30 juta pengunduh hingga bulan Mei 2023. Pertumbuhan permainan ini sangat pesat mengingat usianya yang baru menyentuh hampir 3 bulan.
</p>

<p>
Dengan pertumbuhan tersebut, semakin banyak pemain yang melakukan pencarian terhadap build dari karakter yang dimilikinya untuk bisa memberikan output terbaik pada tiap pertarungan yang dilaluinya. Data diambil dari website genshin.gg/star-rail/. Data yang terdapat pada repository ini mengandung beberapa saran build karakter dengan light cone yang cocok untuknya. Terdapat juga material-material yang dibutuhkan oleh setiap karakter untuk bisa melakukan level-up. Data juga mengandung path yang dimiliki oleh setiap karakter dan light cone serta element yang dimiliki oleh tiap karakter.
</p>

<p>
Data-data tersebut disimpan dalam sebuah database. DBMS yang saya pilih untuk menyimpan data-data tersebut adalah PostgreSQL. Saya memilih untuk menggunakan PostgreSQL karena saya sudah cukup familiar dengan fitur-fitur yang terdapat di dalam DBMS tersebut. Saya juga memiliki waktu penggunaan yang cukup banyak dengan DBMS tersebut sehingga saya cukup mahir dalam menggunakannya. Alasan lain dari pemilihan DBMS tersebut adalah karena data yang saya peroleh akan mudah untuk disimpan dalam bentuk relasional. Fitur-fitur yang terdapat pada DBMS ini juga lengkap sehingga pembuatan database menjadi lebih fleksibel. Selain itu, DBMS tersebut bisa dihubungkan dengan sebuah "workbench" sehingga mudah untuk melakukan pembuatan relasi hingga pemasukan data.
</p>

### Specification of the program
<p>
Program ini dibuat secara bertahap melalui 2 tahap.
</p>

<p>
Tahap pertama pada program ini adalah tahap Data Scraping. Pada tahap ini, dilakukan pemilihan website yang akan diambil datanya. Setelah itu, dilakukan eksplorasi terhadap website sehingga saya bisa mengetahui data apa saja yang akan saya ambil. Selanjutnya, disusunlah sebuah kode program yang dapat mengambil data-data tersebut. Saya menggunakan bahasa python pada bagian ini dan menggunakan beberapa library untuk mendukung proses scraping, seperti BeautifulSoup, Requests, dan JSON. BeautifulSoup digunakan untuk memproses data html sementara requests digunakan untuk memungkinkan pengambilan data dari website. Kemudian, JSON digunakan untuk melakukan penyimpanan terhadap data yang telah diperoleh.
</p>

<p>
Tahap kedua adalah Data Storing. Pada tahap ini, data yang telah didapatkan akan memberikan gambaran terhadap bentuk database yang akan dibangun. Pertama, saya membuat ERD untuk menggambarkan hubungan atau relasi antarentity yang ada. Selanjutnya, saya melakukan translasi ERD menjadi relational model. Setelah itu, barulah saya membuat tabel-tabel atau relasi menggunakan DBeaver dengan memperhatikan constraint-constraint yang ada. Setelah relasi dibentuk, saya melakukan import data yang telah disimpan pada file JSON dengan terlebih dahulu melakukan convert menjadi csv. Terakhir, saya melakukan dump relasi-relasi tersebut menjadi sebuah file .sql.
</p>


### How to use
<p>
Pada program ini, terdapat 2 buah file source code. Source code pertama adalah hsr_scraper.py yang berguna untuk menyimpan perintah-perintah untuk melakukan pengambilan data dari web. Source code kedua adalah file main.py yang digunakan untuk menjalankan perintah-perintah yang ada di file sebelumnya dan untuk melakukan penyimpanan data ke dalam bentuk .json. Cara menggunakan program ini adalah dengan melakukan run pada file main.py dan file-file hasil penyimpanan akan muncul pada directory yang sama.
</p>


### JSON Structure
<p>
Berikut adalah struktur file JSON:
{
  "nama-array": [
    {
      "column_1": data1
      "column_2": data2
      "column_3": data3
    }
  ]
}
dan seterusnya.
Struktur file .json ini sama untuk tiap file.
</p>

### Database Structure
<p>
Berikut adalah ERD database: <br>
<img src='/Data Storing/design/Entity Relationship Diagram.png', title="ERD"> <br>

Berikut adalah Relational database: <br>
<img src='/Data Storing/design/Relational Model.png', title="ERD"> <br>
</p>


### Explanation of ERD to relational diagram translation process
<p>
Pada proses translasi ERD menjadi relational diagram, relationship many-to-one melakukan penyisipan atribut primary key dari relasi one ke yang many. Untuk relationship many-to-many, dibuat relasi baru dengan atributnya merupakan primary key dari kedua entity yang berhubungan.
</p>


### Screenshot program
<p>
Berikut merupakan screenshot fungsi character_stats_scraper pada program:
<img src='/Data Scraping/screenshot/character_stats_scraper.png'><br>

Berikut merupakan screenshot fungsi character_materials_scraper pada program:
<img src='/Data Scraping/screenshot/character_materials_scraper.png'><br>

Berikut merupakan screenshot fungsi element_scraper pada program:
<img src='/Data Scraping/screenshot/element_scraper.png'><br>

Berikut merupakan screenshot fungsi light_cones_scraper pada program:
<img src='/Data Scraping/screenshot/light_cones_scraper.png'><br>

Berikut merupakan screenshot fungsi materials_scraper pada program:
<img src='/Data Scraping/screenshot/materials_scraper.png'><br>

Berikut merupakan screenshot fungsi paths_scraper pada program:
<img src='/Data Scraping/screenshot/paths_scraper.png'><br>

Berikut merupakan screenshot fungsi prefered_pair pada program:
<img src='/Data Scraping/screenshot/prefered_pair.png'><br>
</p>

<p>
Berikut merupakan screenshot hasil data storing character:
<img src='/Data Storing/screenshot/characters_storing.png'><br>

Berikut merupakan screenshot hasil data storing character_materials:
<img src='/Data Storing/screenshot/character_materials_storing.png'><br>

Berikut merupakan screenshot hasil data storing elements:
<img src='/Data Storing/screenshot/elements_storing.png'><br>

Berikut merupakan screenshot hasil data storing light_cones:
<img src='/Data Storing/screenshot/light_cones_storing.png'><br>

Berikut merupakan screenshot hasil data storing materials:
<img src='/Data Storing/screenshot/materials_storing.png'><br>

Berikut merupakan screenshot hasil data storing paths:
<img src='/Data Storing/screenshot/paths_storing.png'><br>

Berikut merupakan screenshot hasil data storing prefered_pair:
<img src='/Data Storing/screenshot/prefered_pairs_storing.png'><br>
</p>


### Reference
1. BeautifulSoup
2. Requests
3. JSON


### Author
__Farhan Algani Putra - 18221108__