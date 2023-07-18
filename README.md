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
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%202.png" alt="cleaning 1" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%203.png" alt="cleaning 1" width="300"/>
  <img src="https://github.com/miralistyacahya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Translasi%204.png" alt="cleaning 1" width="300"/>
</div>
   
## Screenshot program

## Reference
#### Library yang digunakan :
+ BeautifulSoup
+ json
+ request
+ pandas
  
## Author
__Miralistya Cahya Fatimah__

__18221116__
1. Lakukan _data scraping_ dari sebuah laman web untuk memperoleh data atau informasi tertentu __TANPA MENGGUNAKAN API__. Hasil _data scraping_ ini nantinya akan disimpan dalam RDBMS.

2. Daftarkan judul topik yang akan dijadikan bahan _data scraping_ dan DBMS yang akan digunakan pada spreadsheet berikut: [Topik Data Scraping](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit?usp=sharing). Usahakan agar tidak ada peserta dengan topik yang sama. Akses edit ke spreadsheet akan ditutup tanggal __1 Juli 2023 pukul 21.40 WIB.__

3. Pada folder `Data Scraping`, calon warga basdat harus mengumpulkan _file script_, json hasil _data scraping_. Folder `Data Scraping` terdiri dari _folder_ `src`, `data` dan `screenshots`. 
    - _Folder_ `src` berisi _file script_/kode yang __*WELL DOCUMENTED* dan *CLEAN CODE*__.
    - _Folder_ `data` berisi _file_ json hasil _scraper_.
    - _Folder_ `screenshot` berisi tangkapan layar program.

4. Sebagai referensi untuk mengenal _data scraping_, asisten menyediakan dokumen "_Short Guidance To Data Scraping_" yang dapat diakses pada link berikut: [Data Scraping Guidance](https://docs.google.com/document/d/1vEyAK1HIkM792oIuwR4Li2xOodmAcCXxentCCivxxkw/edit?usp=sharing). Peserta diharapkan untuk memperhatikan etika dalam melakukan _scraping_.

5. Data yang diperoleh harus di-_preprocessing_ terlebih dahulu.
```
Preprocessing contohnya :
- Cleaning
- Parsing
- Transformation
- dan lainnya
```

### Database Modelling & Data Storing

1. Dari data _scraping_ yang sudah dilakukan, lakukan __pengembangan *database*__ dalam bentuk ERD kemudian __translasi ERD tersebut menjadi diagram relasional.__ Tambahkan tabel lain yang sekiranya berkaitan dengan tabel-tabel yang didapatkan dari _data scraping_ yang dilakukan.
   
2. Implementasikan skema relational diagram tersebut ke __RDBMS__ sesuai pilihan peserta. __DBMS No-SQL tidak akan diterima.__ Jangan lupa implementasikan _constraints (primary key, foreign key,_ dsb) pada _database_ yang dibuat.

3. Masukkan data hasil _scraping_ ke dalam RDBMS yang sudah dibuat. Tambahan tabel pada skema yang dibuat tidak perlu diisi dengan data _dummy_ (cukup dibiarkan kosong).

4. Tools yang digunakan __dibebaskan__ pada peserta.

5. Pada folder `Data Storing`, Calon warga basdat harus mengumpulkan bukti penyimpanan data pada DBMS. _Folder_ `Data Storing` terdiri dari folder `screenshots`, `export`, dan `design`.
    - _Folder_ `screenshot` berisi tangkapan layar bukti dari penyimpanan data ke RDBMS.
    - _Folder_ `export` berisi _file_ hasil _export_ dari DBMS dengan format `.sql`.
    -  _Folder_ `design` berisi ER Diagram dan diagram relasional yang disimpan dalam format `.png`


### Bonus
Task berikut bersifat tidak wajib (__BONUS__), boleh dikerjakan sebagian atau seluruhnya.

- Buatlah visualisasi data dalam bentuk _dashboard_ (dari data hasil _scraping_ saja) dan jelaskan apa _insights_ yang didapatkan dari visualisasi data tersebut. _Tools_ untuk melakukan visualisasi data ini dibebaskan pada peserta.

### Pengumpulan


1. Dalam mengerjakan tugas, calon warga basdat terlebih dahulu melakukan _fork_ project github pada link berikut: [Seleksi-2023-Tugas-1](https://github.com/wargabasdat/Seleksi-2023-Tugas-1). Sebelum batas waktu pengumpulan berakhir, calon warga basdat harus sudah melakukan _pull request_ dengan nama ```TUGAS_SELEKSI_1_[NIM]```

2. Tambahkan juga `.gitignore` pada _file_ atau _folder_ yang tidak perlu di-_upload_. __NB: BINARY TIDAK DIUPLOAD__

3. Berikan satu buah file `README` yang __WELL DOCUMENTED__ dengan cara __override__ _file_ `README.md` ini. `README` harus minimal memuat konten :


```
- Description of the data and DBMS (Why you choose it)
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author
```


4. Deadline pengumpulan tugas 1 adalah <span style="color:red">__17 Juli 2023 Pukul 22.40 WIB__</span>

<h3 align="center">
  <br>
  Selamat Mengerjakan!
  <br>
</h3>

<p align="center">
  <i>
  Happiness does not come from doing easy work
  but from the afterglow of satisfaction that
  comes after the achievement of a difficult
  task that demanded our best.<br><br>
  - Theodore Isaac Rubin
  </i>
</p>
<br>
