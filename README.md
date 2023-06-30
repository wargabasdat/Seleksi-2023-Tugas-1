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

1. Lakukan _data scraping_ dari sebuah laman web untuk memperoleh data atau informasi tertentu **TANPA MENGGUNAKAN API**. Hasil _data scraping_ ini nantinya akan disimpan dalam RDBMS.

2. Daftarkan judul topik yang akan dijadikan bahan _data scraping_ dan DBMS yang akan digunakan pada spreadsheet berikut: [Topik Data Scraping](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit?usp=sharing). Usahakan agar tidak ada peserta dengan topik yang sama. Akses edit ke spreadsheet akan ditutup tanggal **1 Juli 2023 pukul 21.40 WIB.**

3. Pada folder `Data Scraping`, calon warga basdat harus mengumpulkan _file script_, json hasil _data scraping_. Folder `Data Scraping` terdiri dari _folder_ `src`, `data` dan `screenshots`.

   - _Folder_ `src` berisi _file script_/kode yang **_WELL DOCUMENTED_ dan _CLEAN CODE_**.
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

1. Dari data _scraping_ yang sudah dilakukan, lakukan **pengembangan _database_** dalam bentuk ERD kemudian **translasi ERD tersebut menjadi diagram relasional.** Tambahkan tabel lain yang sekiranya berkaitan dengan tabel-tabel yang didapatkan dari _data scraping_ yang dilakukan.
2. Implementasikan skema relational diagram tersebut ke **RDBMS** sesuai pilihan peserta. **DBMS No-SQL tidak akan diterima.** Jangan lupa implementasikan _constraints (primary key, foreign key,_ dsb) pada _database_ yang dibuat.

3. Masukkan data hasil _scraping_ ke dalam RDBMS yang sudah dibuat. Tambahan tabel pada skema yang dibuat tidak perlu diisi dengan data _dummy_ (cukup dibiarkan kosong).

4. Tools yang digunakan **dibebaskan** pada peserta.

5. Pada folder `Data Storing`, Calon warga basdat harus mengumpulkan bukti penyimpanan data pada DBMS. _Folder_ `Data Storing` terdiri dari folder `screenshots`, `export`, dan `design`.
   - _Folder_ `screenshot` berisi tangkapan layar bukti dari penyimpanan data ke RDBMS.
   - _Folder_ `export` berisi _file_ hasil _export_ dari DBMS dengan format `.sql`.
   - _Folder_ `design` berisi ER Diagram dan diagram relasional yang disimpan dalam format `.png`

### Bonus

Task berikut bersifat tidak wajib (**BONUS**), boleh dikerjakan sebagian atau seluruhnya.

- Buatlah visualisasi data dalam bentuk _dashboard_ (dari data hasil _scraping_ saja) dan jelaskan apa _insights_ yang didapatkan dari visualisasi data tersebut. _Tools_ untuk melakukan visualisasi data ini dibebaskan pada peserta.

### Pengumpulan

1. Dalam mengerjakan tugas, calon warga basdat terlebih dahulu melakukan _fork_ project github pada link berikut: [Seleksi-2023-Tugas-1](https://github.com/wargabasdat/Seleksi-2023-Tugas-1). Sebelum batas waktu pengumpulan berakhir, calon warga basdat harus sudah melakukan _pull request_ dengan nama `TUGAS_SELEKSI_1_[NIM]`

2. Tambahkan juga `.gitignore` pada _file_ atau _folder_ yang tidak perlu di-_upload_. **NB: BINARY TIDAK DIUPLOAD**

3. Berikan satu buah file `README` yang **WELL DOCUMENTED** dengan cara **override** _file_ `README.md` ini. `README` harus minimal memuat konten :

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

4. Deadline pengumpulan tugas 1 adalah <span style="color:red">**17 Juli 2023 Pukul 22.40 WIB**</span>

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

Note To Self. Remove `.git/hooks/pre-push` to enable pushing to remote.
