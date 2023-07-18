<h1 align="center">
  <br>
  Overall Product, Sales, & Review of Jamtangan.com
</h1>

<h2 align="center">
  Utilizing Data Scraping, Database Modelling, and Data Storing
  <br>
</h2>

![Jamtangan.com](./Assets/header-jamtangan.webp) 

### Table of Contents
  - [Description](#description)
    - [Jamtangan.com](#jamtangancom)
    - [Data and DBMS](#data-and-dbms)
  - [Spesification](#spesification)
    - [Libraries](#libraries)
    - [Tools](#tools)
  - [How to Use](#how-to-use)
  - [JSON Structure](#json-structure)
  - [Database Structure](#database-structure)
    - [ERD](#erd)
    - [Relational Diagram](#relational-diagram)
    - [The Explanation](#the-explanation)
  - [Screenshot of Program](#screenshot-of-program)
  - [Data Visualization](#data-visualization)
  - [References](#references)
  - [Author](#author)

### Description

#### Jamtangan.com 
Jamtangan.com merupakan platform penjualan berbasis online dan offline yang menjual produk jam tangan #PastiOri. Jamtangan.com berada di bawah naungan PT Ming Jaya Sejahtera dengan mengusung nama Jamtangan.com sebagai brand platform penjualan. Jamtangan.com berfokus menjual produk jam tangan dengan pilihan lengkap dengan harga terbaik se-Indonesia. Semua produk di Jamtangan.com telah melalui kurasi yang ketat dari aspek model, fungsi, bahan, dan pemilihan brand demi menyajikan pilihan-pilihan yang beragam untuk berbagai kebutuhan.
#### Data and DBMS
Data yang digunakan adalah data dari website [Jamtangan.com](https://www.jamtangan.com/). Secara umum, data yang diambil adalah data produk, data penjualan, dan data review beserta customer dari tiap review-nya. Data produk dan penjualan diambil dari halaman detail produk tiap brand yang dibatasi sejumlah 20 data untuk setiap produk dengan jumlah brand sekitar 85. Data produk dan penjualan yang diambil tersebut merupakan data teratas yang merepresentasikan data terlaris dan memiliki paling banyak ulasan. Untuk data review diambil dari section review dari setiap produk yang dibatasi sejumlah 5 review dengan reviewer yang tidak anonim. 

Data produk meliputi data brand, nomor model, seri, gender, warna, luminous, kalender, water resistant, diameter case, dan material strap. Data penjualan meliputi nama produk, harga normal, harga terdiskon, persentase diskon, jumlah dilihat, jumlah terjual, status stok online, dan status stok offline. Data review meliputi email reviewer, nama reviewer, tanggal review, waktu review, rating, dan isi review untuk pengantaran dan produknya. Data customer meliputi email, nama, dan status member-nya.

Database Management System (DBMS) yang penulis gunakan adalah PostgreSQL. Alasan pemilihan PostgreSQL adalah kekuatan dan fleksibilitasnya dalam mengelola data terstruktur. Dengan skema relasional, PostgreSQL memungkinkan pengaturan yang terstruktur dan kemudahan dalam melakukan analisis. Fungsionalitas yang kaya, termasuk dukungan untuk transaksi ACID, indeks berbagai jenis, dan kemampuan penyimpanan prosedur, memungkinkan manipulasi dan pengambilan data yang efisien. 

### Spesification
Diperlukan beberapa libraries dan tools untuk menjalankan program. Berikut adalah spesifikasi yang dibutuhkan untuk menjalankan program:
#### Libraries
##### WAJIB
* [Selenium](https://selenium-python.readthedocs.io/)
<br>Digunakan untuk otomatisasi pengujian aplikasi web dan juga dapat digunakan untuk melakukan scraping data dari halaman web.

* [WebDriver Manager](https://pypi.org/project/webdriver-manager/)
<br>Membantu dalam mengelola driver yang diperlukan untuk mengontrol browser menggunakan Selenium, seperti ChromeDriver atau GeckoDriver.

* [Datetime](https://docs.python.org/3/library/datetime.html)
<br>Memanipulasi dan mengelola objek tanggal dan waktu dalam Python, termasuk format tanggal, penghitungan selisih waktu, dan operasi terkait tanggal dan waktu.

* [Time](https://docs.python.org/3/library/time.html)
<br>Memberikan fungsi-fungsi terkait waktu, seperti mengatur jeda atau delay dalam eksekusi program.

* [JSON](https://docs.python.org/3/library/json.html)
<br>Digunakan untuk bekerja dengan format data JSON, termasuk membaca, menulis, dan memanipulasi data dalam format tersebut.

* [CSV](https://docs.python.org/3/library/csv.html)
<br>Menyediakan kemampuan untuk membaca, menulis, dan memanipulasi data dalam format CSV (Comma-Separated Values), yang umum digunakan untuk menyimpan data tabular.

* [Pandas](https://pandas.pydata.org/)
<br>Menyediakan struktur data dan alat analisis data yang efisien dalam Python. Pandas berguna untuk manipulasi dan analisis data, termasuk membaca dan menulis data dari berbagai format, seperti CSV, Excel, SQL, dan lainnya.

* [Traceback](https://docs.python.org/3/library/traceback.html)
<br>Menyediakan fungsi-fungsi untuk menangani dan memanipulasi traceback (jejak panggilan fungsi) dalam penanganan exception, membantu dalam debug dan pelacakan kesalahan.

##### OPTIONAL
* [Email.Message](https://docs.python.org/3/library/email.message.html)
<br>Digunakan untuk membangun dan mengirim pesan email dalam format MIME (Multipurpose Internet Mail Extensions).

* [SSL](https://docs.python.org/3/library/ssl.html)
<br>Menyediakan fungsionalitas yang terkait dengan keamanan SSL/TLS (Secure Sockets Layer/Transport Layer Security) dalam komunikasi jaringan.

* [SMTPLib](https://docs.python.org/3/library/smtplib.html)
<br>Menyediakan antarmuka tingkat tinggi untuk mengirim email melalui protokol SMTP (Simple Mail Transfer Protocol), yang digunakan untuk mengirim email melalui server email.

#### Tools
* [ChromeDriver](https://chromedriver.chromium.org/downloads)
<br>Mengontrol browser Google Chrome secara otomatis melalui Selenium, memungkinkan otomatisasi pengujian dan scraping data dari halaman web.

### How to Use
Berikut adalah langkah-langkah untuk menjalankan program:
1. Pastikan semua libraries dan tools yang dibutuhkan sudah terinstall. <br><br>Untuk menginstall libraries, gunakan perintah berikut pada directory `Data Scraping/src/config` di terminal <p align="center">`pip install -r requirements.txt`</p>
Untuk menginstall [ChromeDriver](https://chromedriver.chromium.org/downloads), download file sesuai versi Google Chrome yang digunakan dan letakkan file tersebut pada folder yang sama dengan file program.

2. Clone repository ini pada local directory yang sudah disiapkan

3. Apabila ingin mendapatkan notifikasi melalui email apabila scraping sudah selesai, lakukan konfigurasi Google 2-Step-Verification dan generate Google Application specific password sesuai panduan berikut
<br><br><p align="center">[How to Generate Google App Specific Password for 2-Step Verification](https://shoutmetech.com/app-specific-google-2-step-verification/)<p/>
Jika sudah, buka file `email_config.txt` dan masukkan email yang akan dikirimkan notifikasi pada baris pertama dan generated password sebelumnya pada baris kedua. 

4. Buka file `main.ipynb` dan jalankan semua cell pada file tersebut untuk menjalankan program.

### JSON Structure
Berikut adalah JSON structure untuk data yang diperoleh
* Product
```
{
  "Brand": brand of product
  "Model No": model number of product
  "Series": series of product on it brand
  "Gender": the intended user's gender
  "Colour": colour of product
  "Luminous": whether it glow in the dark
  "Calendar": format of calendar
  "Water Resistant": limit of water resistant
  "Case Diameter (mm)": diameter of product's case
  "Strap Material": material of product's strap
}
```
* Sales
```
{
  "Product Name": name of product
  "Brand": brand of product
  "Model No": model number of product
  "Normal Price": normal price of product
  "Discounted Price": discounted price of product
  "Discount Percentage": percentage of discount
  "Number of Seen": number of product seen
  "Number of Sold": number of product sold
  "Offline Stock Status": stock status of product in offline store
  "Online Stock Status": stock status of product in online store
}
```
* Review
```
{
  "Product Name": name of product
  "Email": email of reviewer
  "Date": date of review
  "Time": time of review
  "Rating": rating of review
  "Delivery Review": review of delivery service
  "Product Review": review of product
}
```
* Customer
```
{
  "Email": email of customer
  "Name": name of customer
  "Member Status": member status of customer
}
```

### Database Structure

### Screenshot of Program

### Data Visualization

### References

<h3 align="center">
  <br>
  Author
  <br>
</h3>

<p align="center">
  18221096<br>
  Fikri Naufal Hamdi<br>
  Sistem dan Teknologi Informasi
</p>
