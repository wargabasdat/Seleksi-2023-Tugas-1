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
  "Product_Code": "I-TSKBSC523O606",
  "Product_Name": "Basic Short Sleeve Crop T-Shirt",
  "Image_Link": "//colorbox.co.id/cdn/shop/products/I-TSKBSC523O606_BROWN_1_T.jpg?v=1688058751&width=320",
  "Color": "Brown",
  "Price": "59900",
  "Details": "T-shirt lengan pendek,  Round neck,  Unfinished hemline details,  Crop length,  Regular Crop,  Material: TC,  Model menggunakan ukuran  S,  HEIGHT: 174 cm,  BUST: 84 cm,  WAIST: 60 cm,  HIPS: 89 cm"

}


```

## Struktur Basis Data (ERD and relational diagram)

Sistem basis data online shop Colorbox ini disusun untuk dapat menyimpan informasi Customer (pengguna website). Customer bisa saja belum pernah melakukan transaksi ataupun mengisi keranjang (cart), hanya memiliki akun saja. Sistem basis data juga menyimpan data cart yang merupakan keranjang yang berisi total semua produk yang ingin dibeli pada session tertentu oleh suatu customer tertentu. Pada relasi cart, terdapat pula informasi mengenai order status, yang mengindikasikan apakah barang sudah dibayar, sedang dalam proses pengiriman, atau sudah terkirim. Terdapat juga relasi cart_product yang merupakan weak entity dari cart, kehadiran cart_product bergantung pada kehadiran cart. Bisa saja terdapat cart yang kosong, namun setiap cart_product pasti merujuk pada suatu cart tertentu. Setiap cart_product memiliki urutannya sendiri (dimulai dari 1) pada cart tertentu. Relasi produk berisi informasi mengenai setiap clothing items yang dijual pada situs colorbox. Barang-barang yang dapat dimasukkan ke dalam cart hanyalah barang-barang yang terdata pada relasi product saja. Berikutnya, terdapat pula relasi payment yang terbagi menjadi 3 secara disjoint yaitu e_wallet, credit card, ataupun bank_transfer. Payment hanya dapat dilakukan pada cart yang statusnya unpaid. 

Berikut ini merupakan gambar dari ERD:

<img src="Data Storing\design\seleksi-ERD.png">

Dilakukan proses reduction untuk mengubah bentuk ERD di atas menjadi bentuk relational.
1. Pada relasi Customer terdapat atribut address yang terdiri dari street, ward, subdistrict, city, province, dan postal code. Yang akan tercatat pada relational hanyalah penyusun dari address itu saja.
2. Pada relasi Cart, terdapat Price_Total() yang merupakan atribut turunan. Atribut ini akan dihapus pada relational
3. Hubungan antara cart dan customer adalah many to one dengan partisipasi total pada Cart. Oleh karena itu, pada relasi Cart, ditambahkan atribut Customer_ID yang merupakan primary key pada Customer
4. Relasi Cart_Product merupakan weak entity dari Cart sehingga pada model relational, relasi Cart_Product akan ketambahan atribut Car_ID yang merupakan primary key dari Cart. Atribut Cart_ID ikut menjadi primary key pada relasi Cart_Product, selain Order_Number
5. Relasi Cart_Product memiliki hubungan many to one dengan relasi Product, dengan partisipasi total pada Cart_Product. Oleh karena itu, relasi Cart_Product ketambahan 1 atribut baru yaitu Product_Code yang merupakan primary key dari Product
6. Relasi Cart memiliki hubungan one to one dengan relasi Payment dengan partisipasi total pada Payment. Hal ini membuat pada model relational, relasi payment ketambahan 1 atribut baru yaitu Cart_ID yang merupakan primary key dari Cart.
7. Relasi Credit_Cart, E_Wallet, dan Bank_Transfer berturut-turut akan ketambahan 1 atribut baru yaitu Payment_ID yang merupakan primary key dari Payment.

Berikut ini merupakan model relational yang terbentuk:

<img src = "Data Storing\design\seleksi-Relational.png">

## Screenshot program

Berikut ini merupakan beberapa screenshot code scraping yang code lengkapnya dapat dilihat pada `Data Scraping/src/scrape_lib.py` dan `Data Scraping/src/scrape_main.py`

<img src = "Data Scraping\screenshot\getHTMLText.png">
<img src = "Data Scraping\screenshot\getListOfTupleDatta.png">
<img src = "Data Scraping\screenshot\jsonStoring.png">


Berikut ini beberapa screenshot ketika code `scrape_main.py` dijalankan

<img src = "Data Scraping\screenshot\scraping1.png">
<img src = "Data Scraping\screenshot\scraping2.png">


Berikut screenshot table product pada DBMS yang telah dibuat
<img src = "Data Storing\screenshot\product.png">

Code untuk storing data selengkapnya dapat ditemukan pada `Data Scraping/src/db.py`



## Reference
1. BeautifulSoup
2. jsonpickle
3. time
4. selenium
5. json
6. psycopg2

## Author
Kandida Edgina Gunawan (13521155)
