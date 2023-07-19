<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  18221090 - Marcheline Fanni Hidayat Putri
  <br>
  <br>
</h2>


<h3 align="center"> DATA EVENT DARI WEBSITE EVENTKAMPUS.COM </h3>
<img src='/Data Visualization/Dashboard.png'>


### Description of the data and DBMS
Event Kampus merupakan sebuah organisasi yang menyediakan jasa _media partner_ maupun paid promote untuk mempromosikan kegiatan-kegiatan yang diadakan untuk publik. Layanan yang diberikan berupa promosi melalui media sosial eventkampuscom maupun pengunggahan informasi terkait _event_ maupun tiketnya melalui website `eventkampus.com`.

Pada program ini, dilakukan _data scraping_ terhadap data event, tiket, kota, dan tag pada website eventkampus.com. Data `event` terdiri dari id_event, nama event, kategori event, tanggal penyelenggaraan event, jam pelaksanaan event, serta tempat pelaksanaan event. Melalui data event, pengguna dapat melihat event-event yang diadakan beserta informasi lengkap terkait event tersebut. Beberapa event yang diunggah pada website eventkampus.com menyediakan `tiket` yang dapat dibeli melalui website. Setiap event dapat memiliki lebih dari satu jenis tiket dengan harga yang berbeda-beda. Selain itu, terdapat data `kota` penyelenggaraan event dan `tag` dari event untuk memudahkan pencarian oleh pengguna. Satu event hanya dapat diselenggarakan di satu kota, namun satu event dapat memiliki banyak tag.

Setelah memperoleh data tersebut, dilakukan _database modelling_. Kemudian, data dalam bentuk JSON dikonversi menjadi bentuk CSV untuk memudahkan proses _data storing_. Pada akhirnya, data tersebut disimpan pada sebuah file SQL dengan DBMS `PostgreSQL`. Proses pengembangan basis data dan penyimpanan data pada basis data dibantu oleh tools bernama pgAdmin 4.

Penulis memilih data _event_ pada eventkampus.com karena pada saat pembuatan, penulis sedang bertugas untuk mengurus _media partner_ pada suatu organisasi. Tak hanya itu, penulis ingin mengetahui jenis-jenis _event_ yang diadakan serta persebaran rentang harga dari tiket yang dijual pada website tersebut. Data tersebut berguna untuk mengetahui tren dari _event_ yang diadakan dan dapat dijadikan _benchmark_ untuk _event_ yang mungkin penulis rancang di masa depan. Selain itu, penulis memilih PostgreSQL sebagai DBMS untuk menguji kemampuan penulis dalam mengoperasikan PostgreSQL berdasarkan yang telah dipelajari pada mata kuliah Manajemen Basis Data dan untuk mengeksplorasi lebih lanjut. PostgreSQL juga memiliki fungsi-fungsi yang tidak terdapat pada MySQL.

<br>

### Specification of the program
Program ini terdiri dari dua bagian, yaitu _data scraping_ dan _data storing_ sesuai dengan folder yang terdapat pada _repository_ ini. Pada folder `Data Scraping`, terdapat kode untuk menjalankan _data scraping_ dari website eventkampus.com serta file JSON berisi data-data hasil _data scraping_ yang telah dilakukan. File kode terdiri dari kode untuk mendapatkan data event, kategori, kota, tag, dan tiket. Kode disusun dengan memanfaatkan bahasa pemrograman `Python` dengan `BeautifulSoup` untuk melakukan _data scraping_. _Data scraping_ dimulai dengan mengidentifikasi data-data yang ingin diperoleh dari website. Kemudian, lakukan _import library_ yang akan digunakan yaitu `requests`, `BeautifulSoup`, dan `json`. Selanjutnya, mencari data-data yang diinginkan berdasarkan URL dari halaman data tersebut. Lakukan _looping_ atau algoritma lainnya bila diperlukan. _Data preprocessing_ dilakukan pada tahap ini untuk memperoleh data bersih untuk disimpan. Data-data yang diperoleh kemudian disimpan ke dalam sebuah _dictionary_. _Dictionary_ tersebut kemudian dimasukkan ke dalam file JSON yang dituju.

Pada folder `Data Storing`, terdapat file-file dari proses _database modelling_ dan _data storing_ berupa ERD, _relational diagram_, dan SQL _dump_. Pada proses ini, pemodelan basis data dalam bentuk `Entity-Relationship Diagram` (ERD) dilakukan berdasarkan data-data yang telah diperoleh. Beberapa tabel dan atribut pun ditambahkan sesuai dengan proses yang terjadi pada website. Pada tahap ini, tabel-tabel yang digambarkan adalah tabel kota, event, tiket (_weak entity_), pembelian, profil, dan pengguna. Setelah keterhubungan masing-masing tabel dan atribut telah terdefinisi dengan baik, ERD ditranslasikan menjadi sebuah skema relasional. Translasi tersebut menghasilkan tabel baru (seperti tabel tag) dan penyisipan atribut pada tabel lain. Skema relasional tersebut kemudian digambarkan dalam bentuk `Relational Diagram` untuk memperjelas model dari basis data yang akan dikembangkan. Model basis data tersebut kemudian dikembangkan menjadi sebuah basis data menggunakan PostgreSQL. Pada pengembangannya, dibentuk sebuah basis data baru yang berisi tabel-tabel sesuai dengan _relational diagram_ yang telah dibentuk. Selain itu, ditambahkan _constraints_ yang sesuai dengan ketentuan dari data serta proses yang berlangsung dari data tersebut. Beberapa _constraints_ yang digunakan pada basis data ini adalah CHECK, NOT NULL, UNIQUE. Selain itu, pendefinisian _primary key_, _foreign key_, dan tipe data juga dilakukan dalam proses pembentukan tabel. Setelah tabel-tabel terbentuk, dilakukan proses _data storing_ ke dalam tabel-tabel pada basis data tersebut. Sebelum melakukan _import_ data, file JSON yang diperoleh dari _data scraping_ diubah bentuknya menjadi file CSV untuk memudahkan proses _data storing_. Kemudian, masing-masing file di-_import_ ke dalam tabel yang bersesuaian. Setelah semua data berhasil tersimpan, basis data telah siap digunakan. Dari basis data yang telah terbentuk, dapat dilakukan proses analisis data dan manipulasi data untuk mendapatkan _insight_ terkait data _event_ yang terdapat pada website eventkampus.com.

<br>

### How to use
Cara menggunakan `Program Data Scraping`:
1. Download file Python pada folder `Data Scraping > src`
2. Persiapkan file JSON untuk menyimpan masing-masing data
3. Ubah folderPath pada file Python sesuai dengan tempat penyimpanan file JSON
4. Sesuaikan nama file pada `open(folderPath + [NAMA FILE], 'w')`
5. Lakukan hal yang sama dengan file Python lainnya untuk mendapatkan semua data yang diperlukan

Cara menggunakan `File SQL`:
1. Download file `eventkampus.sql` pada folder `Data Storing > export`
2. Buatlah database pada terminal dengan command: `create database {database_name};`
3. Import file eventkampus.sql ke dalam database yang telah dibuat dengan command: `psql -U {username} -d {database_name} < {external_file_name}.sql`
4. Pemrosesan data pada database dapat dilakukan dengan memanfaatkan _relational diagram_ sebagai referensi dari keterhubungan masing-masing tabel
5. Jika ingin melakukan _dump_ basis data ke file eksternal, keluar dari PostgreSQL lalu tuliskan pada terminal: `pg_dump -U {username} -d {database_name} > {external_file_name}.sql`

<br>

### JSON Structure
<b>Berikut merupakan struktur JSON dari file event.json:</b>
```
{
    "event_event": [
        {
            "id_event": "4438",
            "event": " JOB FAIR BERSAMA PUSAT KARIR PERGURUAN TINGGI  SOLORAYA 2023 ",
            "kategori": "Bursa Kerja",
            "tanggal": "14  - 15 Peb 2023",
            "jam": "09:00 - 15:00",
            "tempat": "Gedung Grha Soloraya (Eks Gedung Bakorwil) Surakarta"
        }
    ]
}
```
* `id_event`: kode unik untuk event yang diperoleh dari penomoran pada link di website eventkampus.com
* `event`: nama dari event yang diselenggarakan
* `kategori`: kategori dari event yang diselenggarakan, terdapat 8 kategori yang dapat dipilih oleh pengunggah
* `tanggal`: tanggal mulai hingga tanggal selesai pelaksanaan event
* `jam`: waktu pelaksanaan event (jam mulai dan jam selesai)
* `tempat`: tempat penyelenggaraan event (berupa nama gedung atau lokasi spesifik lainnya)

<b>Berikut merupakan struktur JSON dari file tiket.json:</b>
```
{
    "harga_tikettiket_event": [
        {
            "id_event": "4421",
            "id_tiket": "442101",
            "jenis_tiket": "Tour Karanganyar ",
            "harga_tiket": 750000
        }
    ]
}
```
* `id_event`: ID event yang menyediakan tiket
* `id_tiket`: kode unik untuk setiap jenis tiket yang dijual
* `jenis_tiket`: nama atau jenis tiket dari suatu event
* `harga_tiket`: harga tiket yang dijual

<b>Berikut merupakan struktur JSON dari file tag.json:</b>
```
{
    "tag_event": [
        {
            "id_event": "3955",
            "tag": "badminton"
        }
    ]
}
```
* `id_event`: berupa ID event yang terhubung dengan suatu tag
* `tag`: nama tag

<b>Berikut merupakan struktur JSON dari file kota.json:</b>
```
{
    "kota_event": [
        {
            "id_kota": 182001,
            "kota": " Kab. Aceh Barat"
        }
    ]
}
```
* `id_kota`: kode unik untuk suatu kota
* `kota`: nama kota yang diperoleh dari _list_ kota pada website eventkampus.com

<br>

### Database Structure
Berikut merupakan Entity-Relationship Diagram (ERD) dari database eventkampus:
<img src='/Data Storing/design/ERD.png'>

Berikut merupakan Relational Diagram dari database eventkampus:
<img src='/Data Storing/design/RelationalDiagram.png'>

<br>

### Explanation of ERD to relational diagram translation process
Secara umum, translasi _ERD_ menjadi _relational diagram_ dilakukan dengan langkah berikut ini:
1. Setiap relasi yang merupakan `strong entity` akan menjadi tabel tersendiri pada relational diagram.
2. Relasi yang merupakan `weak entity` seperti tiket akan menjadi tabel sendiri dengan _primary key_ berupa gabungan dari _primary key_ dari _strong entity_ serta diskriminator dirinya sendiri.
3. Pada hubungan `one-to-many` seperti pada tabel kota dengan tabel event (diselenggarakan_di), tabel event dengan tabel profil (menyelenggarakan), tabel pembelian dengan tabel tiket (dibeli), dan tabel pembelian dengan tabel profil (membeli), _primary key_ milik tabel dengan hubungan _one_ akan disisipkan menjadi _foreign key_ pada tabel dengan hubungan _many_.
4. Pada hubungan `one-to-one` seperti pada tabel profil dengan tabel pengguna, _primary key_ dari salah satu tabel tersebut disisipkan pada tabel lainnya.
5. Untuk `multivalued attribute` seperti tag pada tabel event, dibentuk tabel baru untuk menyimpan data tag dengan _primary key_ berupa _primary key_ tabel asal (id_event) dan dirinya sendiri (tag).
6. Langkah terakhir, deskripsikan hubungan `foreign key` antara suatu tabel dengan tabel lainnya.

Untuk penjelasan lebih lengkap terkait translasi untuk basis data eventkampus dapat dilihat pada file berikut ini: [ERD to Relational Schema](https://docs.google.com/document/d/1PS7cbDnv4UT22VyY_nF02hs6hviYrJblZLIoEShyvYk/edit?usp=sharing)

<br>

### Screenshot program
#### Data Scraping
Program untuk _scraping_ data event:
<br>
<img src='/Data Scraping/screenshot/ss_dataevent.png'>
<br><br>

Program untuk _scraping_ data tiket:
<br>
<img src='/Data Scraping/screenshot/ss_datatiket.png'>
<br><br>

Program untuk _scraping_ data tag:
<br>
<img src='/Data Scraping/screenshot/ss_datatag.png'>
<br><br>

Program untuk _scraping_ data kota:
<br>
<img src='/Data Scraping/screenshot/ss_datakota.png'>
<br><br>

#### Data Storing
Data pada tabel event:
<br>
<img src='/Data Storing/screenshot/data_event.png'>
<br>
Detail terkait tabel event:
<br>
<img src='/Data Storing/screenshot/detail_event.png'>
<br><br>

Data pada tabel tiket:
<br>
<img src='/Data Storing/screenshot/data_tiket.png'>
<br>
Detail terkait tabel tiket:
<br>
<img src='/Data Storing/screenshot/detail_tiket.png'>
<br><br>

Data pada tabel tag:
<br>
<img src='/Data Storing/screenshot/data_tag.png'>
<br>
Detail terkait tabel tag:
<br>
<img src='/Data Storing/screenshot/detail_tag.png'>
<br><br>

Data pada tabel kota:
<br>
<img src='/Data Storing/screenshot/data_kota.png'>
<br>
Detail terkait tabel kota:
<br>
<img src='/Data Storing/screenshot/detail_kota.png'>
<br><br>

Data pada tabel pembelian:
<br>
<img src='/Data Storing/screenshot/data_pembelian.png'>
<br>
Detail terkait tabel pembelian:
<br>
<img src='/Data Storing/screenshot/detail_pembelian.png'>
<br><br>

Data pada tabel pengguna:
<br>
<img src='/Data Storing/screenshot/data_pengguna.png'>
<br>
Detail terkait tabel pengguna:
<br>
<img src='/Data Storing/screenshot/detail_pengguna.png'>
<br><br>

Data pada tabel profil:
<br>
<img src='/Data Storing/screenshot/data_profil.png'>
<br>
Detail terkait tabel profil:
<br>
<img src='/Data Storing/screenshot/detail_profil.png'>
<br>

<br>

### Reference
#### Libraries used
1. BeautifulSoup4
2. Requests
3. JSON
#### Other references
1. PostgreSQL Documentation
2. pgAdmin

<br>

### Author
#### Marcheline Fanni Hidayat Putri - 18221090