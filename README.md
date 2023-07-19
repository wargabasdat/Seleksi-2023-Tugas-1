<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023: Data Sociolla
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Reswara Trista Aulia C. (18221122)
  <br>
  <br>
</h2>


## Description of the Data and DBMS

### Data

#### Data Source
Data yang diambil berasal dari laman [Sociolla](https://www.sociolla.com/), sebuah platform e-commerce yang fokus pada produk kecantikan dan perawatan kulit. Data ini mencakup informasi tentang merek-merek (brands) produk yang tersedia di Sociolla, termasuk kategori produk, harga, diskon, dan status produk sebagai produk baru (just arrived) atau produk terlaris (best seller).

#### Data Structure
Data ini terdiri dari beberapa tabel yang saling terkait dalam basis data:

Tabel `"brands"`: Tabel ini menyimpan informasi tentang merek-merek produk yang tersedia di Sociolla. Setiap merek memiliki atribut seperti nama merek (name), negara asal merek (country), dan mungkin atribut lain terkait merek.

Tabel `"category"`: Tabel ini menyimpan informasi tentang kategori-kategori produk yang tersedia di Sociolla. Setiap kategori memiliki atribut seperti nama kategori (name) dan mungkin atribut lain terkait kategori.

Tabel `"country"`: Tabel ini menyimpan informasi tentang asal negara dari suatu brand yang tersedia di Sociolla. Setiap country memiliki atribut nama negara asal (name).

Tabel `"products"`: Tabel ini menyimpan informasi tentang produk-produk yang tersedia di Sociolla. Setiap produk memiliki atribut seperti kategori produk (id_cat), merek produk (id_brand), nama produk (name), harga produk (def_price), diskon produk (discount), dan status produk sebagai produk baru (just_arrived) atau produk terlaris (best_seller).

### DBMS 

DBMS yang digunakan adalah PostgreSQL. PostgreSQL lengkap dan mudah digunakan untuk tipe data __.json__ karena memiliki fitur import dan load. DBMS ini .....


## Specification of The Program 

### Features

#### Web Scraping

Program ini menggunakan `Selenium Library` untuk otomatisasi proses _scraping data_. Program ini diarahkan menuju _website_ Sociolla, klik berbagai elemen untuk membuka halaman yang diperlukan, dan ekstraksi informasi yang diinginkan dari _web page_. 

#### Data Extraction

Program ini mengekstraksi data seperti _brand names, product details, category information,_ dan data relevan lainnya dari _website_ Sociolla. Program ini memanfaatkan XPath dan teknik _parsing_ HTML lainnya untuk menemukan dan mengekstrak data.

#### Data Storage

Data yang diekstraksi disimpan dalam _database_ PostgreSQL. Program membuat koneksi ke _database_ dan memasukkan data ke dalam masing-masing tabel. Ini memastikan integritas data dan menangani kendala atau hubungan _foreign key_ selama proses _insertion_.

#### Data Transformation

Program menerapkan transformasi data dan pembersihan data yang diperlukan sebelum data disimpan dalam database. Ini menangani nilai yang hilang, pemformatan data, dan konversi ke tipe data yang sesuai.

#### Error Handling

Program ini menggabungkan mekanisme penanganan kesalahan untuk menangani _exception_ dan skenario tak terduga selama _scraping web_ dan penyimpanan data. Ini mencatat kesalahan dan memberikan pesan kesalahan yang relevan untuk tujuan _debugging_ dan pemecahan masalah.

#### Dependencies

Program bergantung pada dependensi berikut:
Python 3.8.16
Selenium library
Chrome WebDriver
Pandas library
PostgreSQL database

## How to use
### Pre-Requisites
1. Installed Python and Jupyter
2. Installed Postgresql (or have access to cloud based Postgresql)
3. Installed Chrome WebDriver

### Configure the dependencies
1. Install this library: selenium, pandas, seaborn, numpy, matplotlib
2. Use `pip install` to each of the library:
```
pip install <library>
```

### Run the app
#### Data Scraping
1. Open `data_scraping.ipynb` in `\Data Scraping\src`
2. `Run All` 

#### Data Storing
1. Open `data_storing.ipynb` in `\Data Storing\export`
2. `Run All` 

#### Data Visualization
1. Open `dashboard.ipynb` in `\Data Visualization`
2. `Run All` 

## JSON Structure
```json
{
  "products": [
    {
      "brand name": ...,
      "product name": ...,
      "review number": ...,
      "category": ...,
      "price_before_discount": ...,
      "discount": ...
    },
    ...
  ],
  "best_seller": [
    {
      "brand name": ...,
      "product name": ...
    },
    ...
  ],
  "just_arrived": [
    {
      "brand name": ...,
      "product name": ...
    },
    ...
  ],
  "brand_list": [
    {
      "brand name": ...
    },
    ...
  ],
  "brand_origins": [
    {
      "brand_origins": ...
    },
    ...
  ],
  "brand_country": [
    {
      "country name": ...,
      "brand name": ...
    },
    ...
  ]
}
```

## ERD to Relational Diagram

Dari data yang diambil, dapat dibuat ERD seperti gambar di bawah.
![ERD](<Data Storing/design/DBMS ER diagram (UML notation) - DBMS ER diagram (UML notation).png>)

Dengan mengikuti aturan: 
1. One - to - one relation: Menambahkan Primary Key entity One ke entity One yang lain.
2. One - to - many relation: Menambahkan Primary Key entity Many ke entity One.
3. Many - to - one relation: Menambahkan Primary Key entity Many ke entity One.
4. Many - to - many relation: Membuat tabel baru yang terdapat primary key dari kedua entity.

Maka, akan didapatkan Relational Diagram seperti gambar di bawah

![Relational](<Data Storing/design/DBMS ER diagram (UML notation) - Relational Diagram.png>)

## Screenshots

### Data Scraping
![IPYNB](Data%20Scraping/screenshot/ipynb.png)
![JSON](Data%20Scraping/screenshot/JSON.png)
![Website Sociolla](Data%20Scraping/screenshot/website-sociolla.png)
### Data Storing
![Brands](Data%20Storing/screenshot/brands.png)
![Category](Data%20Storing/screenshot/category.png)
![Country](Data%20Storing/screenshot/country.png)
![Order Detail](Data%20Storing/screenshot/order_detail.png)
![Orders](Data%20Storing/screenshot/orders.png)
![Products](Data%20Storing/screenshot/products.png)
![Users](Data%20Storing/screenshot/users.png)

## Reference (Library used, etc)

## Author
> Reswara Trista Aulia C. (18221122)

