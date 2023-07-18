<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
   <img src="https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/kokoro_logo.jpg" width="300">
  <br>
  Data Scraping, Database Modelling & Data Storing Of 100 Best Seller Product in Kokoro Japan Website
  <br>
  <br>
</h2>

## Visualization
![visual](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/Dashboard%201.png)
Link for <a href="https://public.tableau.com/app/profile/ken.azizan/viz/SeleksiBasdat/Dashboard1?publish=yes">live dashboard</a>

## Description of the Data and DBMS
<p>
  Kokoro Japan adalah e-commerce asal Jepang yang diluncurkan pada tahun 2019. Banyak masyarakat yang sudah mengetahui produk yang berkualitas tinggi dari jepang namun sulit didapatkan pada negara tersebut dan jika ada harganya menjadi mahal .Oleh karena itu, Kokoro didirikan agar masyarakat di seluruh dunia dapat memiliki produk pengalaman berbelanja produk inovasi dan berkualitas tinggi dari negara Jepang dengan harga yang terjangkau. Kategori produk yang dijual diantaranya adalah produk kecantikan seperti skincare dan makeup, produk kesehatan seperti suplemen, makanan dan minuman.
</p>
<br>

<p>
  Pada kali ini saya mengambil data dari 100 best seller produt pada Kokoro Japan. Data yang saya scrape dari Kokoro Japan diantaranya adalah nama produk, status produk, harga normal, harga saat sedang sale, rating, dan jumlah review pada produk. Data yang telah diambil akan disimpan pada DBMS PostgreSQL sebagai file SQL. PostgreSQL saya gunakan karena memiliki syntax yang mudah dipelajari, dapat mengolah query yang kompleks, dapat menyimpan data yang kompleks, keamanan yang ketat, transaksi dapat dilaksanan sesuai dengan kaidah ACID(Atomicity, Consistency, Isolation,Durability), serta dapat digunakan secara gratis
</p>
<br>

<p>
  Saya memilih untuk melakukan Scrapping kokoro japan karena saya tertarik untuk melihat tren produk jepang  yang sedang disukai. Beserta untuk mengetahui produk-produk yang memiliki potongan harga yang besar. Serta Produk-produk memiliki rating yang tinggi dengan jumlah review yang banyak
</p>

## Specification of the Program
<p>
  Pada proses data scraping saya menggunakan Jupyter-Lab, pada prosesnya saya menggunakan beberapa library diantaranya adalah BeautifulSoup, Selenium, chromedriver, dan Pandas. Untuk dapat mengakses website Kokoro Japan digunakan webchromedriver. Website kokoro japan adalah website dinamis maka Selenium harus digunakan untuk dapat mengambil seluruh data HTML dari website. Lalu dengan menggunakan beautifulSoup untuk melakukan scrape data yang dibutuhkan. Setelah itu dilakukan parsing,cleansing,dan transforming pada data yang telah didapatkan. Data tersebut disimpan pada JSON file dengan bantuan dataframe dari pandas.

  Untuk membuat database serta memasukan data hasil scraping ke database postgresql digunakan python 3.11 dengan library psycopg2. psycopg2 digunakan untuk membuka koneksi dengan database postgreSQL sehingga dapat memasukan query dari file python. Kemudian digunakan juga library json untuk load data file json hasil scraping. Data hasil load tersebut akan dimasukan ke tabel dengan query insert.

  Proses data storing dilakukan dengan membuat perancangan dan pengenmbangan database kokoro japan menggunakan Entity Relation Diagram(ERD). Setelah itu, ERD diagram ditranslasikan menjadi relational diagram untuk dapat diimplementasikan pada DBMS PostgreSQL. Data yang sudah didapatkan dari proses scraping dimasukan ke dalam database. File dump SQL dari database dapat ditemukan pada folder data storing, sub-folder export.
</p>

## How To Use
**untuk data scrapping**
1. Clone repository ini
2. Install chromedriver melalui link berikut 'https://chromedriver.chromium.org/downloads', pastikan versi chromedriver sesuai versi chrome yang sudah terinstall
3. Masukan chromedriver.exe pada folder data scraping si subfolder src
4. Install semua libray yang digunakan
```
pip install Selenium
pip install bs4
pip install pandas
pip install time
```
5. buka Scraping_Kokoro.ipynb di IDE pilihan anda
6. Run All, jika ada error lakukan Run All lagi

**untuk memasukan data scraping ke database postgreSQL**
1. Clone repository ini
2. Install library ini terlebih dahulu
```
pip install psycopg2
pip install json
```
3. Buka command promp atau terminal dan masukan command dibawah secara berturut
```
cd /your_file_path
```
 
```
python store.py 
```

**untuk memasukan data SQL ke DBMS PostgreSQL**
1. Clone repository ini
2. Buka command prompt pada folder Data storing, subfolder export
3. Masukan database pada DBMS dengan command berikut
```
psql -U [username] -d[nama_database] < kokoro_japan.sql
```

## JSON FILE STRUCTURE
Berikut hasi struktur hasil scraping dalam format JSON

```
{
          "Product_name":nama dari produk (string),
          "status":status dari produk ('Sale','Not Sale','Sold out'),
          "normal_price":harga normal produk dalam JPY (float),
          "sale_price":harga normal produk dalam JPY (float),
          "ratings":nilai rating dengan nilai maksimal 5 (float),
          "count_reviews":Jumlah review yang didapatkan (integer)
     },
```

contoh isi JSON file
```
{
        "Product_name":"Biore UV Aqua Rich Watery Essence SPF50+\/PA++++ 70ml",
        "status":"Not sale",
        "normal_price":1305.0,
        "sale_price":1305.0,
        "ratings":4.8,
        "count_reviews":76
    },
```

## Database Structure

Berikut merupakan ERD dari database
![erd_design](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/ERD_Kokoro.png)
<p>
  Database ini dibuat berdasarkan data produk hasil dari proses scraping sebelumnya. Produk menjadi entity tersendiri dan memiliki atribut hasil dari data scraping. Atributnya diantaranya adalah product_name, status, normal_price, sale_price, ratings, dan count_reviews. Dari entity product itu saya mengembangkan sebuah database berdasarkan website kokoro japan. Saya menambahkan entity customer sebagai pengguna dari website. entity shopping cart juga saya tambahkan untuk customer berbelanja produk yang. Entity voucher juga ditambahkan untuk mendapatkan potongan harga. Terdapat juga entity payment untuk melakukan pembayaran.

  Berikut relation antar entity beserta alasannya
1. Customer dengan shopping_cart memiliki relasi one-to-many dan total pada shopping cart. Hal ini dikarenakan, setiap customer dapat boleh memliki banyak shopping_cart tetapi shopping cart hanya boleh dimiliki oleh satu customer saja dan shopping_cart pasti dimiliki oleh customer.
2. Customer dengan voucher memiliki relasi one-to-many dengan keduanya parsial. Customer boleh memiliki lebih dari satu voucher namun voucher hanya boleh dimiliki satu customer. Tidak semua customer memiliki voucher dan voucher juga tidak harus dimiliki voucher.
3. Shopping_cart memiliki relasi many-to-many. shopping_cart dapat memiliki banyak produk dan produk dapat berada pada dibanyak shopping_cart. Pada relasi ini juga diperlukan kuantitas antara produk pada suatu shopping sehingga terdapat atribut relasi yang disebut entity.
4. Shopping_cart mempunyai relasi one-to-one dengan payment karena pada satu transaksi pembayaran hanya bisa untuk membayar satu shopping cart
5. Relasi antara voucher dengan payment juga one-to-one karena pada satu pembayaran hanya boleh menggunaka satu buah voucher. Untuk voucher yang sama potongan harga bisa didapatkan berbeda jika transaksi pembayarannya berbeda. Oleh karena itu, diperluka atribut relasi yaitu price_off
6. Pada relasi pembayaran terdapat dua cara untuk membayar yaitu paypal dan kartu kredit. Kedua jenis pembayaran tersebut memiliki atribut yang berbeda. Sehingga diperlukan spesialization dengan payment sebagai high-level entity dengan paypal dan credit_card sebagai low-level entity. Pembayaran hanya dapat dilakukan menggunakan paypal atau credit card sehingga pada payment relasi menjadi total. Customer hanya boleh menggunakan satu jenis pembayaran sehingga perlu diberikan keterangan disjoint.
</p>

Berikut merupakan Relational diagram dari database
![relational_diagram](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/RD_Kokoro.png)

## Translasi ERD ke RDBMS
Setiap strong entity pada ERD akan menjadi tabel tersendiri. dan setiap atribut pada entitas akan menjadi kolom pada tabel relasional. Entitas customer menjadi tabel customer, entitas product menjadi tabel product, entitas shopping_cart menjadi tabel shopping_cart, entitas voucher menjadi tabel voucher, dan entitas payment menjadi tabel payment.

1. Pada entitas customer terdapat phone_number yang merupakan multivalue atribut. Oleh karena itu, dibuat tabel customer_phone yang memiliki kolom id_customer dan phone atribut. id_customer menjadi primary key dan sekaligus sebagai foreign key  yang reference pada kolom id_customer pada tabel customer
![translate1](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate1.png)

2. relasi antara customer dengan shopping_cart adalah one-to-many dan total berada pada shopping cart. Sehingga pada tabel shoping cart akan ditambah atribut primary key dari tabel customer yaitu id_customer
![translate2](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate2.png)

3. Relasi antara shopping_cart dengan produk adalah many-to-many sehinga diperlukan tabel baru yang dinamakan fill_up dengan berisikan primary key dari kedua tabel yaitu id_shopping_cart dan id_product. pada relasi tersebut juga terdapat atribut relasi, atribut tersebut akan dimasukan ke dalam tabel fill_up.
![translate3](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate3.png)

4. Relasi antara voucher dengan customer adalah mmany-to-one dan kedua bagiannya relasi parsial. Bagian many terdapat pada voucher sehingga pada tabel voucher ditambahkan primary key dari tabel customer yaitu id_customer
<img src="https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate4.png">

5. Relasi antara shopping_cart dengan payment adalah one-to-one sehingga dapat dapat memilih tabel yang mana yang akan mendapatkan atribut tambahan yang berupa primary key dari tabel lainnya. Saya memilih untuk menambahkan id_shopping_cart pada tabel payment.
![translate5](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate5.png)

6. Relasi antara shopping cart dengan voucher juga one-to-one hingga dapat dapat memilih tabel yang mana yang akan mendapatkan atribut tambahan yang berupa primary key dari tabel lainnya. Saya memilih untuk menambahkan atribut id_voucher pada tabel payment. Relasi ini juga memiliki atribut sendiri yaitu price-off yang juga ditambahkan pada tabel payment
![translate6](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate6.png)

7. Pada tabel payment terdapat specialization dari payment_method diantaranya terdapat credit_card dan paypal yang memiliki atribut tambahan tersendiri. Oleh karena dibuat tabel untuk lower-level entity masing-masing, tabel itu diisi dengan primary key dari higher-level entity yaitu id_payment dan atribut lokalnya masing-masing.
![translate7](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/translate7.png)

Berikut Schema hasil translasi ERD
note : **bold** untuk primary key, *italic* untuk foreign key

1. product(**id_product**,product_name,status,normal_price,sale_price,rating, count_reviews)
2. customer(**id_customer**,first_name,last_name, email, password,country, state, city, address, post_code)
3. customer_phone(**id_customer**,phone_number)
4. shopping_cart(**id_shopping_cart**,id_customer,note,cart_status,date)
5. fill_up(**id_shopping_cart**,**id_product**,quantity)
6. voucher(**id_voucher**, voucher_name,voucher_exp,*id_customer*)
7. payment(**id_payment**,*id_shopping_cart*,*id_customer*,total_amaount,price_off,payment_date,payment_status,payment_method)
8. paypal(**id_payment**,paypal_number)
9. credit_card(**id_payment**,card_number,name_on_card,exp_date)

foreign  key:
1. customer_phone(*id_customer*) -> customer(**id_customer**)
2. shopping_cart(*id_customer*) -> customer(**id_customer**)
3. voucher(*id_customer*) -> customer(**id_customer**)
4. fill_up(*id_product*) -> product(**id_product**)
5. fill_up(*id_shopping_cart*) -> shopping_cart(**id_shopping_cart**)
6. payment(*id_shopping_cart*) -> shopping_cart(**id_shopping_cart**)
7. payment(*id_voucher*) -> voucher(**id_voucher**)
8. paypal(*id_payment*) -> payment(**id_payment**)
9. credit card(*id_payment*) -> payment(**id_payment**)


## Screenshots of the program
### Data scraping
* search key function
![search](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/search_key.png)

* data cleaning function
![cleaning](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/data_cleaning_function.png)

* df to JSON function
![JSON](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/df_to_json.png)

* df to CSV function
![CSV](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/df_to_csv.png)

* load HTML function
![load](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/load_html_function.png)

* extracting product data function
![extract](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing.png)

* Main function
![main](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/main.png)

* program succesfully run
![run](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/running.png)

### Data Storing

* Berikut merupakan kode yang digunakan untuk membuat database beserta tabel dan constraint juga insert data pada tabel product menggunakan python
![code1](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/code1.jpg)
![code2](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/code2.jpg)
![code3](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/code3.jpg)


* berikut output terminal
![terminal](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/terminal.jpg)

* Berikut tabel yang ada pada database
![tabel](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/table.jpg)

* Berikut mengenai tabel product dan constraint
![product](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/product.jpg)

* Berikut isi tabel product
![show](https://github.com/Kenazizan01/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/show_product.jpg)

## Data vsiualization
<p> 
Tabelau digunakan untuk membuat dashbroad sebagai visualization dari data produk hasil scraping. Dashboard menampilkan price-range harga, 5 produk dengan potongan harga terbesar, dan jumlah produk berdasarkan status.
</p>
<br>

## Referensi
Library
- BeautifulSoup
- Selenium
- Pandas
- Chromedriver
- time
- psycopg2
- json

Blog
- <a href="https://medium.com/python-in-plain-english/introduction-to-python-web-scraping-libraries-selenium-beautifulsoup-and-scrapy-71a1d86b7aaf">introduction of webscraping library</a>
- <a href="https://pythonbasics.org/selenium-scroll-down/">Selenium scroll down</a>
- <a href="https://www.tutorialspoint.com/python_data_access/python_postgresql_create_database.htm">Create database on postgreSQL using python</a>
## Author
### Ken Azizan - 18221107
