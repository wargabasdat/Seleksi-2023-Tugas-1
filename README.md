<h1 align="center">
  <br>
  Tugas 1 Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Muhammad Rafi Haidar - 18221134
  18221134@std.stei.itb.ac.id
  <br>
  <br>
</h2>


### Description of the data and DBMS

Ray White Indonesia adalah anak perusahaan Ray White Group, perusahaan real estat multinasional yang berbasis di Australia. Dengan kehadiran melalui 175 kantor cabangnya yang tersebar di 25 kota besar di Indonesia, serta didukung oleh 4000 Marketing Executive yang berpengalaman, Ray White Indonesia mampu menawarkan berbagai layanan unggulan kepada para kliennya. Melalui layanan seperti manajemen properti yang profesional, penjualan properti yang efektif, dan appraisal properti yang akurat, Ray White Indonesia menjadi salah satu pemain utama dalam industri real estat di Indonesia.

Data hasil scraping merupakan hasil pengumpulan informasi dari situs web https://www.raywhite.co.id/ yang mencakup informasi tentang listing properti yang dijual. Data tersebut mencakup judul listing beserta ID listing properti dan live ID properti. Data juga mencakup spesifikasi relevan mengenai properti tersebut, seperti tipe properti, lokasi properti yang mencakup kota dan provinsi, nilai jual properti dalam mata uang dolar AS dan rupiah, status negosiasi harga properti, ukuran tanah dan bangunan dari properti, jenis sertifikat kepemilikan properti, serta jumlah kamar tidur, kamar mandi, dan garasi yang tersedia dalam properti. Selain itu, data juga mencakup informasi tentang agen real estat yang mengurus properti tersebut. Informasi tersebut meliputi nama agen, ID pegawai agen, nomor telepon agen, dan kantor tempat agen tersebut bekerja.

Hasil scraping data disimpan ke dalam beberapa berkas JSON yang terpisah berdasarkan tipe properti dan satu berkas yang merupakan gabungan dari semua berkas JSON. Selain itu, data juga disimpan dalam format CSV sebagai redundancy dan untuk memudahkan penulis dalam memasukkan data ke dalam DBMS. Selain itu, data hasil scraping juga disimpan dalam beberapa tabel di dalam basis data SQL dengan encoding UTF8 menggunakan DBMS PostgreSQL.

Pemilihan PostgreSQL sebagai DBMS didasarkan oleh familiaritas penulis dengan program tersebut. Selain itu, DBMS ini juga dipilih karena sifat open source dari PostgreSQL yang memungkinkan akses dan penggunaan data hasil dumping basis data oleh siapapun.

Penulis memilih untuk melakukan scraping data properti yang dijual di situs https://www.raywhite.co.id/ dengan tujuan mendapatkan gambaran umum tentang pasar properti di Indonesia. Ray White, sebagai salah satu pemain utama dalam industri real estat di Indonesia, dapat menjadi sebagai sumber sampel data yang baik untuk dianalisis.

Data yang diperoleh melalui scraping dapat dianalisis untuk menghasilkan informasi tentang harga properti dan persebarannya di seluruh Indonesia. Analisis tersebut dapat memberikan informasi  bagi calon pembeli dalam menentukan properti yang sesuai dengan kebutuhan mereka. Selain itu, hasil analisis juga dapat digunakan oleh investor real estat untuk mempelajari tren pasar properti di Indonesia dan membantu mereka dalam membuat keputusan investasi.

Selain itu, hasil analisis data properti juga dapat menjadi alat bagi pemangku kepentingan publik dalam merencanakan dan mengembangkan daerah. Informasi tentang harga properti, jumlah listing, dan lokasi dapat membantu pengambil kebijakan dalam merencanakan pengembangan wilayah, kebijakan perumahan, dan kebijakan publik lainnya yang berkaitan dengan sektor properti secara umum ataupun perumahan.


### Specification of the program



### How to use

### JSON Structure

{"listing_id":384815,"live_id":"L22197450","type":"house","title":"Rumah Mewah Siap Huni Harga Bersahabat Di Taman Laguna","province":"Jawa Barat","city":"Bekasi","value_usd":165104,"value_idr":2487787072,"negotiable":false,"building_size":null,"land_size":165.0,"certificate":"SHM\/Freehold","bedroom":5.0,"bathroom":4.0,"carport":2.0,"realtor_id":26577,"realtor":"Dini Aryati","realtor_phone":"+6281296632515","realtor_office":"Ray White Pondok Indah Arteri"}

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
- Description of the data and DBMS (Why you choose it) +
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author +
```
