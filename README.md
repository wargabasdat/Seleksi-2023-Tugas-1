## Deskripsi Data
Data yang digunakan adalah data Buku - buku yang memang websitenya dibuat untuk di scrap. Saya memilih data ini dikarenakan saya awalnya memilih website lainnya dan ternyata data tidak bisa di scraping atau diakses seperti tahun-tahun sebelumnya akhirnya saya mencari website yang bisa diambil datanya yaitu website ini booksrap. Data yang saya gunakan adalah data dari https://books.toscrape.com/ dikarenakan situs ini memiliki data yang bisa di scrap dan dapat digunakan untuk keperluan tugas ini dengan baik. DBMS yang saya gunakan adalah Psql dikarenakan PSQL cukup mudah untuk digunakan dan saya sudah mempelajarinya di kelas Manajemen Basis Data saat semester 4 kemarin

## Spesifikasi Program
Proses pengerjaan program ini dibagi menjadi beberapa tahap, yang pertama adalah data scraping. Data scraping merupakan proses mengambil data dari suatu website, dalam proses ini saya menggunakan bahasa python dengan beberapa library lainnya untuk memperoleh data-data dari website yang saya pilih. Tahap berikutnya adalah data preprocessing. Tahap ini adalah proses dimana saya memilih atribut mana saja yang digunakan dari data yang telah diperoleh dan membagi atribut tersebut menjadi 2 tabel, serta menambahkan beberapa atribut yang diperlukan. Tahap berikutnya adalah data modelling. Pada tahap ini saya mengimplementasikan tabel tersebut ke dalam RDBMS, membuat tabel-tabel serta constraints nya, mengimplementasikan juga primary key serta foreign key pada setiap tabel. Tahap terakhir adalah data storing, dimana saya mencatat data-data yang sudah di preprocess ke dalam tabel-tabel sql.

* Jupyter Notebook
Open-source web application ini mempermudah penataan serta eksekusi kode program. File untuk data scraping akan tersimpan dalam format ".ipynb"
* PSQL
PSQL ini dibuat untuk menyimpan database dan membuat shema serta tabelnya, PSQL sendiri bekerja sebagai server untuk menyimpan database dan memproyeksikannya serta membuat primary key dan foreign key dari schema yang telah dibuat
* BeautifulSoup
Library ini digunakan dalam data scraping dari website Liquipedia CSGO. Library ini akan melakukan parsing pada website dan menyimpan elemen HTML di dalam suatu variabel. Sintaks pada library ini juga cukup mudah sehingga pencarian elemen HTML pada website menjadi praktis.
* Requests
Sebelum melakukan data scraping, program perlu melakukan request terlebih dahulu kepada website server agar elemen HTML bisa didapatkan. Library ini membantu program dalam melakukan hal tersebut.
* JSON
Library ini membantu program menghasilkan keluaran file dengan format .json dari variabel dengan tipe data list. Sebenernya kita juga memakai .CSV hanya saja ini tidak perlu menginport Library
* PANDAS
Library ini berfungsi untuk membuat dataframe atau dimensi data dan merubah-rubahnya sesuai yang kita inginkan

## How To Use
1. Pertama untuk melakukan semuanya agar mudah kita pakai jupyter notebook agar tidak perlu lagi download library lainnya karena sudah include, caranya download anaconda terlebih dahulu di link : https://www.anaconda.com/download
2. Lalu lakukan git clone jika sudah memiliki git bash pada lokal memori yang diinginkan
3. lalu bisa dibuka file .ipynb yang terletak pada folder Data Scraping >> src >> Tugas1_Basdat.ipynb bisa dibuka menggunakan jupyter notebook
4. Untuk menggunakan database yang sudah dibuat, tinggal mendownload file sql yang ada di folder Data Storing/export/Bookscrap.sql. Untuk melihat data dan bermain dengan datanya dapat menggunakan DBMS apapun.

## JSON Structure
Pada file ini jumlah file.json yang diperoleh ada 2 yaitu bookinformation.json dan bookavailbility.json yang berisi contoh
{
   "id"   : "1",
   "Stock"  : "In Stock"
}

{
   "id"           : "1",
   "nama buku"    :  "Saylor moon",
   "Jenis buku"   :  "Misteri",
   "Harga buku"   : "$45"
}

# Database Structure
### ER Diagram



<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>


## Spesifikasi

### Data Scraping

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
