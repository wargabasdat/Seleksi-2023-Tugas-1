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

## Deskripsi dari Data dan DBMS
DBMS : PostgreSQL

Data yang dipilih : data clothing dari https://colorbox.co.id/collections/clothing

Data yang diambil bukan hanya informasi mengenai nama produk dan harga saja, melainkan juga informasi mengenai warna, kode produk, dan detail dari produk sehingga dilakukan pula data scraping untuk tiap link penjelasan produk. Total produk yang datanya berhasil diambil per tanggal 17 Juli 2023 adalah 643 produk dengan 6 atribut, yaitu kode produk, nama produk, image-link, harga, warna, dan details dari produk tersebut. 
Data clothing ini saya gunakan sebagai bahan analisis karena industri fashion merupakan salah satu industri yang sangat berkembang saat ini. Untuk mempelajari trend yang ada pada dunia fashion, saya mengambil contoh kecil dengan mengulas tren koleksi pada toko dengan brand Colorbox, salah satu brand ramah kantong favorit saya. Dengan melakukan data scraping, data modelling, data storing, dan data visualization, kita dapat melihat kategori pakaian apa yang sedang banyak diperjualbelikan, warna apa yang mendominasi pasar pakaian, serta berapa rata-rata harga pakaian yang dijual dalam suatu website (dalam kasus ini adalah pada website Colorbox).


## Spesifikasi Program
Program ini dibuat dengan menggunakan bahasa pemrograman Python 3.10.11 dengan menggunakan beberapa library seperti selenium karena data diambil dari website yang sifatnya dinamis. Selain itu, digunakan pula library BeautifulSoup untuk membantu proses ekstraksi HTML dan parsing informasi dari website Colorbox. Kemudian, dilakukan proses cleaning dari data yang berhasil diproleh dari website tersebut. Salah satu proses cleaning yang dilakukan adalah menghapus tulisan "IDR" dari value atribut Price agar atribut Price dapat disimpan dalam bentuk numeric pada database nantinya. Dilakukan pula proses imputasi pada null value, misalnya dengan mengganti null value menjadi N/A pada data details product yang kosong. Data yang telah melewati proses cleaning kemudian akan melalui proses serializing untuk diubah ke bentuk JSON. 

Sebelum melakukan proses pembuatan skema database, database terlebih dahulu harus dibuat pada sistem DBMS PostgreSQL, seperti di bawah ini

```sql
CREATE DATABASE IF NOT EXISTS seleksi_basdat
```
Kemudian, dibuat beberapa tabel sesuai dengan ERD dan Relational Diagram yang telah dibuat pada bagian design. Setelah skema lengkap dan seluruh constraint dan trigger telah dimasukkan, data JSON dapat dimasukkan ke database.

## Cara Menggunakan
1. User harus terlebih dahulu menginstal library yang digunakan pada program ini, yaitu `numpy', 'matplotlib', 'json', 'jsonpickle', 'BeautifulSoup', 'seleniun', dan 'psycopg2'.
2. Clone repository ini
3. Berada pada dir src
4. Run `python scrape_main.py` untuk melakukan proses scraping dan serializing data to json file
5. Membuat database pada sistem PostgreSQL dengan:
```sql
CREATE DATABASE IF NOT EXISTS seleksi_basdat
```
6. Memodifikasi koneksi pada file db.py agar sesuai dengan konfigurasi sistem PostgreSQL masing-masing
7. Run `python db.py` untuk proses pembuatan skema dan storing data
8. Database PostgreSQL kemudian dapat diexport ke dalam bentuk .sql dengan perintah
   `pg_dump -U <username> -d <database_name> -s > <output_file.sql>`

   
## Struktur JSON
Berikut contoh data JSON dari products.json
```json
{

}


```

## Struktur Basis Data (ERD and relational diagram)
## Penjelasan Proses ERD - Relational 
## Screenshot program
## Reference
-BeautifulSoup

-jsonpickle

-time

-selenium

-json

-psycopg2

## Author
Kandida Edgina Gunawan (13521155)
