<h1 align="center">
  <br>
  Data Sociolla
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Reswara Trista Aulia
  <br>
  <br>
</h2>


## Description of the Data and DBMS

### Data

#### Sumber Data
Data yang diambil berasal dari Sociolla, sebuah platform e-commerce yang fokus pada produk kecantikan dan perawatan kulit. Data ini mencakup informasi tentang merek-merek (brands) produk yang tersedia di Sociolla, termasuk kategori produk, harga, diskon, dan status produk sebagai produk baru (just arrived) atau produk terlaris (best seller).

##### Struktur Data
Data ini terdiri dari beberapa tabel yang saling terkait dalam basis data:

Tabel "brands": Tabel ini menyimpan informasi tentang merek-merek produk yang tersedia di Sociolla. Setiap merek memiliki atribut seperti nama merek (name), negara asal merek (country), dan mungkin atribut lain terkait merek.

Tabel "category": Tabel ini menyimpan informasi tentang kategori-kategori produk yang tersedia di Sociolla. Setiap kategori memiliki atribut seperti nama kategori (name) dan mungkin atribut lain terkait kategori.

Tabel "country": Tabel ini menyimpan informasi tentang asal negara dari suatu brand yang tersedia di Sociolla. Setiap country memiliki atribut nama negara asal (name).

Tabel "products": Tabel ini menyimpan informasi tentang produk-produk yang tersedia di Sociolla. Setiap produk memiliki atribut seperti kategori produk (id_cat), merek produk (id_brand), nama produk (name), harga produk (def_price), diskon produk (discount), dan status produk sebagai produk baru (just_arrived) atau produk terlaris (best_seller).

#### Pengambilan Data 
Data yang ada diambil dengan metode web scraping menggunakan Selenium dari laman [Sociolla](https://www.sociolla.com/). 

