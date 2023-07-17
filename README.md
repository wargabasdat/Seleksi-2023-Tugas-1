# **ANALISIS OBJEK WISATA DI SUMATRA BARAT**
---

## **A. Latar Belakang**
Pembuatan analisis ini dilakukan untuk pemenuhan tugas seleksi asisten laboratorium basis data tahun 2023 Institut Teknologi Bandung. Adapun pemilihan topik objek wisata di sumatra barat ini karena penulis merupakan mahasiswa ITB yang berasal dari Sumatra Barat. Selain itu, pemilihan objek wisata sebagai data karena penulis merasa Sumatra Barat memiliki potensi yang besar dalam pengembangan objek wisata. Saat ini, objek wisata Sumatra Barat mulai dipandang oleh masyarakat di luar Sumatra Barat sebagai salah satu destinasi pariwisata yang diperhitungkan. Jadi, tak jarang wisatawan terkadang bingung dalam memilih daerah dan objek wisata mana yang sebaiknya dikunjungi terlebih dahulu. Hasil analisis ini nantinya berguna bagi calon pengunjung, apalagi bagi pengunjung yang memiliki *budget* terbatas, tapi tetap ingin menikmati wisata di daerah minangkabau ini.

## **B. Alur Perancangan dan Pembuatan**
Pada pembuatant tugas ini, setelah menentukan topik yang akan dijadikan sebagai data, penulis selanjutnya melakukan eksplorasi menyeluruh tentang website penyedia informasi mengenai objek wisata di Sumatra Barat pada laman [web tripadvisor](https://www.tripadvisor.co.id/Attractions-g2301784-Activities-West_Sumatra_Sumatra.html) berikut. Selama eksplorasi, penulis melakukan pemindaian informasi dan mencatat poin-poin apa saja yang sekiranya bisa dijadikan data dalam tugas analisis ini. Setelah mengetahui data yang dapat diambil, selanjutnya penulis membuat gambaran desain *ER diagram* dan relational *diagram* agar mendapat gambaran tabel-tabel seperti apa yang nantinya dapat dibuat. Pembuatan diagram ini bersifat sementara sebagai gambaran awal saja, karena nantinya di tengah jalan akan ada beberapa modifikasi yang dilakukan terhadap diagram yang telah dibuat. Setelah selesai, selanjutnya penulis melakukan persiapan dengan menyiapkan *tools* yang sekiranya dapat digunakan. Dalam hal ini, penulis menggunakan bahasa pemrograman python dengan library beautifulsoup untuk melakukan *scraping* data, draw.io untuk pembuatan desain, serta postgreSQL sebagai DBMS untuk penyimpanan data. Setelah melakukan persiapan, barulah penulis melakukan proses untuk mendapatkan hasil yang diminta dengan melakukan *data scraping* dan *data storing*.

## C. Deskripsi Data dan Pemilihan DBMS
Data yang penulis ambil terdiri dari data peringkat, nama objek, nama daerah, rata-rata *rating*, *rating* bintang 1, *rating* bintang 2, *rating* bintang 3, *rating* bintang 4, *rating* bintang 5, jumlah ulasan, jumlah objek sedaerah, nama jenis, nama akun pengunjung, asal pengunjung, *rating* pengunjung, waktu berkunjung, dan tipe kunjungan yang semua data tersebut terbagi menjadi 4 tabel pada diagram relasional. Selain itu, untuk membuat relasi objek wisata Sumatra Barat ini lebih akurat, penulis menambahkan tabel pengelola dan operasional sebagai tabel tambahan. Untuk lebih lengkapnya mengenai *ER diagram* dan *relational diagram* dari objek wisata Sumatra Barat ini dapat dilihat pada gambar [ER diagram](https://github.com/ReyhanPA/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ER%20Diagram.png) dan [relational diagram](https://github.com/ReyhanPA/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/Relational%20Diagram.png) berikut. DBMS yang digunakan dalam tugas ini adalah postgreSQL. Penulis memilih DBMS ini karena dirasa cukup mudah digunakan dan fiturnya sangat *powerfull* dalam penyimpanan data. Selain itu, postgreSQL ini dilengkapi dengan UI yang cukup *friendly* sehingga dapat dengan lebih mudah membaca isi *database*.




Ulasan hanya diambil yang teratas karena di websitenya ulasan dibagi-bagi per halaman (sampai ratusan halaman ulasan per 1 objeknya), jadi takutnya membebani server (etika scraping)

Di ulasan_teratas ada beberapa objek wisata yang informasi pengulasnya kosong (satu row kosong) karena ada beberapa informasi yang tidak ada (jadi biar datanya bersih, maka 1 rownya dihapus) -> TAPI KAN NAMA AKUN PENGUNJUNG DAN ASAL PENGUNJUNG PRIMARY KEY ALIAS HARUS ADA -> ALTERNATIF SOLUSINYA DATANYA GAUSAH DICLEANING (KHUSUS INFORMASI PENGUNJUNG), JADI GAPAPA ADA INFORMASI BOLONG-BOLONG -> UPDATE : JADINYA CLEANING DENGAN DIREPLACE AJA KARENA SAYANG BANYAK DATA DIBUANG KALAU CLEANINGNYA DENGAN DIHAPUS

Tambahin .gitignore buat script DDL (dan file csv kalau mau)
## Specification of the program
## How to use
## JSON Structure
## Database Structure (ERD and relational diagram)
## Explanation of ERD to relational diagram translation process
## Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
## Reference (Library used, etc)
## Author