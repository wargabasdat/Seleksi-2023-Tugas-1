<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Peringkat Universitas ASEAN - Webometrics
  <br>
  <br>
</h2>

## Description of the data and DBMS
#### Data
Webometrics adalah salah satu dari beberapa sistem pemeringkatan universitas yang ada di dunia. Webometrics sendiri dikembangkan oleh _Cybermetrics lab_, yaitu kelompok penelitian yang merupakan bagian dari _Consejo Superior de Investigaciones Cientificas_ (CSIC) atau  _Institute of Scientific Research Council_, badan penelitian nasional di Spanyol. Sistem ini melakukan metode penilaian berbasis _website_ yang mengevaluasi kualitas, kuantitas, aksesbilitas, dan visibilitas dari _website_ universitas yang ada di internet. Pemeringkatan webometrics ini bertujuan untuk memberikan pengukuran yang objektif mengenai kualitas dan visibilitas _website_ universitas.

Pada project ini, _scraping_ dilakukan terhadap _website_ [webometrics](https://www.webometrics.info/en/world). Data yang diambil tidak seluruhnya, melainkan data mengenai peringkat universitas yang berada di ASEAN pada tahun 2023. Data tersebut terdiri dari `nama universitas`, `asal negara`, `link profile universitas`, `ranking di ASEAN`, `ranking di Negara`, `ranking berdasarkan Impact`, `ranking berdasarkan Openness`, `ranking berdasarkan Excellence`. Data webometrics ini saya pilih agar dapat mengetahui perbandingan dan letak posisi universitas saat ini bila dibandingkan dengan universitas-universitas lain yang berada di kontinen yang sama yaitu ASEAN. Data ini dapat bermanfaat bagi civitas akademika universitas agar dapat melakukan pengembangan kualitas dan visibilitas website universitasnya masing-masing.

#### DBMS
Pada project ini, data-data hasil scraping diolah dan disimpan pada database sql dengan menggunakan DBMS PostgreSQL. DBMS PostgreSQL ini dipilih karena mudah untuk digunakan dan mudah pula untuk menemukan dokumentasinya apabila menemukan hambatan. 


## Specification of the program
#### Data Scraping
Proses data _scraping_ yang dilakukan pada project ini melalui beberapa tahapan pre-processing seperti parsing data dari website (HTML), transformasi, dan juga _data cleaning_. Tahapan-tahapan tersebut dilakukan menggunakan python (ipynb) untuk memudahkan proses cleaning nantinya. Proses scraping dilakukan dengan memanfaatkan library `beautifulSoup`. Sebelum dilakukan _scraping_, telah dilakukan pengecekan terlebih dahulu mengenai _robots.txt_ dari _webiste_. Selain itu, pada proses _scraping_, telah ditambahkan header sebagai identitas untuk memenuhi etika dari melakukan _scraping_. 
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/add_header.png" alt="penambahan header" width="500">
</div>

Pada proses _cleaning_ telah dilakukan beberapa pengecekan untuk memastikan data yang tersedia sudah _clear_. Beberapa pengecekan yang dilakukan antara lain mengenai ada atau tidaknya nama universitas yang berulang, ada atau tidaknya ranking ASEAN maupun _world_ yang diduduki oleh lebih dari satu universitas, dan ada atau tidaknya data _null_. Selain itu, telah dilakukan _formattiing_ pula pada nama universitas agar hanya terdapat satu nama universitas (tanpa nama lain yang pada awalnya tertulis menggunakan "/") karena dianggap akan menyulitkan untuk diolah pada _database_.

_cleaning_ :
<div align="center">
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/cleaning1.png" alt="cleaning 1" width="400"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/cleaning2.png" alt="cleaning 1" width="400"/>
</div>

code _formatting_ :
<div align="center">
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/formatting.png" alt="cleaning 1" width="450"/>
</div>

data sebelum dan sesudah _formatting_ :
<div align="center">
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/sebelum_formatting.png" alt="cleaning 1" width="400"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/setelah_formatting.png" alt="cleaning 1" width="400"/>
</div>

#### Data Storing
Proses data _storing_ dilakukan pada project ini dengan memasukkan data hasil _scraping_ ke dalam RDBMS sesuai hasil desain ERD dan juga diagram relasional. RDBMS yang dihasilkan terdiri dari 5 relasi, yaitu `Country`, `University`, `Rank`, `University_website`, dan juga `info`. Pada relasi Country, University, dan Rank, data hasil _scraping_ telah dimasukkan. Relasi University_website dan juga info merupakan hasil dari pengembangan ERD sehingga belum terdapat data didalamnya, namun telah diatur mengenai _constraint_ yang sesuai.

## How to use

## JSON Structure
Data hasil _scraping_ disimpan dalam format `JSON` yaitu pada `scraping_webometrics.json`. Struktur dari `file` JSON tersebut adalah sebagai berikut.
```
[
  {
    "Ranking":1,
    "World Ranking":47,
    "University":"National University of Singapore",
    "Country":"Singapore",
    "Impact Rank":119,
    "Openness Rank":60,
    "Excellence Rank":22,
    "Uni Profile":"https:\/\/ror.org\/01tgyzw49"
  },
  {
    "Ranking":2,
    "World Ranking":87,
    "University":"Nanyang Technological University",
    "Country":"Singapore",
    "Impact Rank":304,
    "Openness Rank":95,
    "Excellence Rank":36,
    "Uni Profile":"https:\/\/ror.org\/02e7b5302"
  },
  {
```
struktur orientasi yang digunakan pada JSON tersebut adalah berdasarkan __records__ data. Hal ini membuat formatnya berbentuk daftar __nama kolom : value__ perbarisnya.

## Database Structure
#### ERD (Entity Relationship Diagram)
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ERD%20Webometrics%20-%2018221116.png" alt="ERD Webometrics" width="500">
</div>

Gambar di atas merupakan design ERD dari data Webometrics. Pada ERD tersebut, terdapat 5 _entity_ dengan 4 _relationship_. 

#### Diagram Relasional
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/diagram%20relasional%20Webometrics%20-%2018221116.png" alt="ERD Webometrics" width="500">
</div>

Gambar di atas merupakan diagram relasional yang dihasilkan dari ERD yang telah dibuat. Pada diagram relasional tersebut, terdapat 5 relasi yang dihasilkan.

## Explanation of ERD to relational diagram translation process
Berdasarkan ERD dan diagram relasional sebelumnya, maka terdapat beberapa tahapan proses translasi dari ERD menjadi diagram relasional.
1. __one-to-many relationship__
   Pada ERD, _relationship_ `located` antara _entity country_ dengan _university_ berjenis _one-to-many_. Untuk itu, proses translasi yang dilakukan adalah menambahkan __primary key__ _entity one_ pada relasi _entity many_. Maka atribut country_id dari relasi country ditambahkan pada relasi university.
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%201.png" alt="Translasi 1" width="500">
</div>

2. __one-to-one relationship__
   Pada ERD, _relationship_ `website`, `detail`, dan `ranking` berjenis _one-to-one_. Untuk itu, proses translasi yang dilakukan adalah menambahkan __primary key__ pada relasi pasangannya dengan dibebaskan _primary key_ milik siapa yang ingin ditambahkan diantara keduanya. _Entity_ dengan _total relationship_ menjadi prioritas untuk dipilih sebagai penyimpan _primary key_ pasangannya. Oleh karena itu, karena semua _one-to-one relationship_ yang terdapat di ERD bersifat total, maka dibebaskan. Maka, atribut yang dipilih adalah university_id yang ditambahkan pada relasi University_website, Info, dan juga Rank.
<div align="center">
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%202.png" alt="Translasi 2" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%203.png" alt="Translasi 3" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%204.png" alt="Translasi 4" width="300"/>
</div>
   
## Screenshot program
#### Website yang digunakan:
<div align="center">
  <a href="https://www.webometrics.info/en/Asia_Pacifico/South%20East%20Asia">
    <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/website.png" alt="Webometrics" width="600">
  </a>
</div>

#### Code Data scraping :
<div align="center">
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss%20code%201.png" alt="code 1" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss%20code%202.png" alt="code 2" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/ss%20code%203.png" alt="code 3" width="300"/>
</div>

#### Code Data storing :
daftar tabel : 
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/daftar%20tabel.png" alt="Daftar tabel" width="450">
</div>

detail dari setiap tabel :
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select%20dan%20detail%20country.png" alt="Country" width="500">
</div>

<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select%20dan%20detail%20info.png" alt="Info" width="500">
</div>

<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select%20dan%20detail%20rank.png" alt="Rank" width="500">
</div>

<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select%20dan%20detail%20university.png" alt="University" width="500">
</div>
<div align="center">
<img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/select%20dan%20detail%20university_website.png" alt="Website" width="500">
</div>

## Reference
#### Library yang digunakan :
+ BeautifulSoup
+ json
+ request
+ pandas
  
## Author
__Miralistya Cahya Fatimah__

__18221116__

