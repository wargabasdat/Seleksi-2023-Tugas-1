# **ANALISIS OBJEK WISATA DI SUMATRA BARAT**
---

## Latar Belakang






Berawal dari pembuatan ER diagram > Diagram Relasional > setelah tahu kebutuhan data baru melakukan data scraping dll

Ulasan hanya diambil yang teratas karena di websitenya ulasan dibagi-bagi per halaman (sampai ratusan halaman ulasan per 1 objeknya), jadi takutnya membebani server (etika scraping)

Di ulasan_teratas ada beberapa objek wisata yang informasi pengulasnya kosong (satu row kosong) karena ada beberapa informasi yang tidak ada (jadi biar datanya bersih, maka 1 rownya dihapus) -> TAPI KAN NAMA AKUN PENGUNJUNG DAN ASAL PENGUNJUNG PRIMARY KEY ALIAS HARUS ADA -> ALTERNATIF SOLUSINYA DATANYA GAUSAH DICLEANING (KHUSUS INFORMASI PENGUNJUNG), JADI GAPAPA ADA INFORMASI BOLONG-BOLONG -> UPDATE : JADINYA CLEANING DENGAN DIREPLACE AJA KARENA SAYANG BANYAK DATA DIBUANG KALAU CLEANINGNYA DENGAN DIHAPUS

Tambahin .gitignore buat script DDL (dan file csv kalau mau)
## Description of the data and DBMS (Why you choose it)
## Specification of the program
## How to use
## JSON Structure
## Database Structure (ERD and relational diagram)
## Explanation of ERD to relational diagram translation process
## Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
## Reference (Library used, etc)
## Author