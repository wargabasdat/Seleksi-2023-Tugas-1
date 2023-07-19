<h1 align="center">
  <br>
  <b> <em> Comic & Graphical Novel Online Shop Database </em> </b>
  <br>
  <em> <font size="2"> Created for the fulfillment of Seleksi Warga Basdat 2023's Assignment 1 </font> </em>
  <br>
  <br>
</h1>


## __Description__
<p align="center">
  <img src="./Data Storing/screenshot/etc/Gramedia Icon.png" 
    width = "400"
    height = "200"/>
</p>

___Comic & Graphical Novel Online Shop Database (CGNOSDB)___ merupakan suatu program yang memanfaatkan data hasil _webscraping_ Toko Buku Online [Gramedia.com](https://www.gramedia.com) terhadap buku-buku berkategori _comic & graphical novel_ berserta penulis dan penerbitnya. Pengambilan data dilakukan menggunakan bahasa pemorgraman ___Python___ menggunakan beberapa _library & framework,_ seperti ___pandas, BeautifulSoup,___ dan ___Selenium.___ Data hasil _webscraping_ di-_preprocess_ dan disimpan dalam file berekstensi _.json_ sebelum dimasukkan ke dalam basis data.\
&nbsp;

<p align="center">
  <img src="./Data Storing/screenshot/etc/PostgreSQL.png" 
    width = "400"
    height = "200"/>
</p>

DBMS yang digunakan dalam pembuatan program adalah ___PostgreSQL___. PostgreSQL menjadi DBMS pilihan karena kemampuannya dalam menangani _concurrency_ untuk meningkatkan efisiensi dan kecepatan _query_. Selain itu, ketersediaan fitur yang dimiliki PostgreSQL memberikan aksesibilitas terhadap modifikasi dan pengembangan terhadap program kedepannya.\
&nbsp;

## __Specification of the Program__

| <div style="width:240px">Tools</div> | <div style="width:200px">Version</div> |
|--------|--------|
| Python | 3.10.9 |
| Selenium | 4.10.0 |
| BeautifulSoup | 4.11.1 |
| [Chrome](https://www.google.com/intl/id_id/chrome/) | 114.0.5735.199 |
| [ChromeDriver](https://chromedriver.chromium.org/downloads) | 144.0.5735.90 |
| [Jupyter Notebook (Anaconda3)](https://www.anaconda.com/download) | 6.5.2 |
| [PostgreSQL](https://www.postgresql.org/download/) | 15.2 |
&nbsp;

## __How to use?__
To use the program, you need to have all of `the spesification` installed on your personal computer. Once that done, follow these steps!

<h3>Data Scraping</h3>
<ol type="1">
  <li>Download the repository and extract it!</li>
  <li>Open the ScrapingScript.ipynb from the <code> Data Scraping/src folder</code> using Jupyter Notebook!</li>
  <li>Run All!</li>
</ol>

<h3>Data Storing</h3>
<ol>
  <li>Copy the path of the extracted folder! <code>(C://path/to/Seleksi-2023-Tugas-1)</code>
  <li>Open terminal and change directory to the <code>Seleksi-2023-Tugas-1</code> folder path!</li>
  <li>Connect to PostgreSQL!</li>
  <li>Run <code>\i './Data Storing/src/StoringScript.sql'</code>!
</ol>

<h3>Exporting/Dumping Data</h3>
<ol>
  <li>Quit PostgreSQL and run: <code>pg_dump -U postgres -W cgnosdb > './Data Storing/export/CGNOSDB.sql'</code>
</ol>
&nbsp;

## __JSON Structure__
There are 3 JSON files created after `ScrapingScript.ipynb` completed. The JSON files only contain the records of of their corresponding table. The sturcture can be seen as followed.

__JSON Structure__
```
[
    {
          "column1": "value1",
          "column2": "value2",
          "column3": "value3",
          "columnN": "valueN"
    }
]
```

__Example: The JSON Format of the Publisher Data__
```
[
    {
        "publisherID": "PB001",
        "publisherName": "Elex Media Komputindo",
        "address": "182-21-171-STREET",
        "phone": "182-21-171-STREET"
    },
    {
        "publisherID": "PB002",
        "publisherName": "Aria Media Mandiri",
        "address": "182-21-171-STREET",
        "phone": "182-21-171-STREET"
    }
]
```
&nbsp;

However, instead of a general JSON format, we're using another format of JSON called `JSONB`. `JSONB` is a native JSON data type that PostgreSQL introduced and used to store JSON documents. The difference between JSON and `JSONB` is that JSON stores data in raw format, while `JSONB` stores data in a custom binary format. Therefore, the JSON files will be structured and formatted as the following.

__JSONB Structure__
```
{"column1": "value1","column2": "value2","column3": "value3", "columnN": "valueN"}

/* No Square Brackets, nor commas between records */
```

__Example: Publisher.json__
```
{"publisherID":"PB001","publisherName":"Elex Media Komputindo","address":"182-21-171-STREET","phone":"182-21-171-STREET"}
{"publisherID":"PB002","publisherName":"Aria Media Mandiri","address":"182-21-171-STREET","phone":"182-21-171-STREET"}
```
&nbsp;


## __Database Structure (ERD & Relational Diagram)__
<p align="center">
  <figure>
    <img src="./Data Storing/design/ER Diagram.png"/>
    <figcaption>
      <i>Entity Relationship Diagram (ERD)</i>
    </figcaption>
  </figure>
  <figure>
    <img src="./Data Storing/design/Relational Diagram.png"/>
    <figcaption>
      <i>Relational Diagram</i>
    </figcaption>
  </figure>
  <figure>
    <img src="./Data Storing/design/Relational Schema.png"/>
    <figcaption>
      <i>Relational Schema</i>
    </figcaption>
  </figure>
</p>

### __ERD to Relational Diagram Translation Process__
1. publisher
Pada entitas publisher, terdapat 4 atribut: ___publisherID___ sebagai _primary key_, name yang menyimpan nama penerbit, address yang menyimpan alamat penerbit, serta phone yang menyimpan nomor telepon penerbit. Oleh sebab ketiadaan atribut-atribut spesial, entitas berikut dapat diturunkan menjadi skema relational berikut.

* publisher = (___publisherID___, publisherName, address, phone)

2. author
Pada entitas author, terdapat 3 atribut: ___authorID___ sebagai _primary key_, name yang menyimpan nama penulis, serta description yang menyimpan deskripsi penulis. Oleh sebab ketiadaan atribut-atribut spesial, entitas berikut dapat diturunkan menjadi skema relational berikut.

* author = (___authorID___, authorName, description)

3. books
Pada entitas books, terdapat atribut komposit bookDetail. Dengan demikian, langkah transformasi yang tepat untuk mengubah entitas ini adalah menjadikan setiap atribut dalam bookDetail sebagai atribut independen. Selain itu, entitas book juga terhubung pada relasi _publishedBooks_ dan _bookAuthor_. Oleh karena setiap buku harus memiliki data penulis dan peneribit, maka atribut _publisherID_ & _authorID_ akan dimasukkan ke dalam skema relational books sebagai _foreign key_. Atas penjelasan tersebut, entitas books dapat diturunkan menjadi skema relational berikut.

* books = (___isbn___, title, _authorID_, _publisherID_, basePrice, description, publishDate, pageNum, weight, length, width, language)
* books(publisherID) --> publisher(publisherID)
* books(authorID) --> author(authorID)

4. store
Pada entitas store, terdapat 5 atribut: storeID sebagai _primary key_, address yang menyimpan alamat toko, city yang menyimpan kota lokasi toko, province yang menyimpan provinsi lokasi toko, serta phone yang menyimpan no. telepon toko. Oleh sebab ketiadaan atribut-atribut spesial, entitas berikut dapat diturunkan menjadi skema relational berikut.

* store = (___storeID___, address, city, province, phone)

5. customer
Pada entitas customer terdapat 6 atribut: customerID sebagai primary key, email yang menyimpan surel pelanggan, name yang menyimpan nama pelanggan, birthdate yang menyimpan tanggal lahir pelanggan, gender yang menyimpan jenis kelamin pelanggan, serta phone yang menyimpan no. telepon pelanggan. Oleh karena ketiadaan atribut-atribut spesial dalam entitas ini, maka entitas ini dapat ditransformasikan menjadi skema relasional berikut.

* customer = (___customerID___, email, name, birthDate, gender, phone)

6. shippingAddress
Entitas shippingAddress merupakan suatu weak entity yang dependen dengan entitas customer. Oleh karena itu, terdapat 8 atribut: customerID dan addressNum sebagai composite primary key yang menunjukkan alamat yang pelanggan simpan, receiverName yang menyimpan nama penerima, receiverPhone yang menyimpan no. telepon penerima, address yang menyimpan alamat penerima, city yang menyimpan kota domisili penerima, province yang menyimpan provinsi domisili penerima, serta postalCode yang menyimpan kode pos penerima. Atas penjelasan tersebut, entitas ini dapat ditransformasikan menjadi skema relasional berikut yang mengikuti nama sesuai dengan relasi antara entitas shippingAddress serta customer.

* savedAddress = (___addressNum, customerID___, receiverName, receiverPhone, address, city, province, postalCode)
* savedAddress(customerID) --> customer(customerID) 

7. payment
Entitas ini menyimpan seluruh pembayaran yang masuk ke dalam program. Entitas ini tersusun atas 3 atribut: paymentID sebagai primary key, amount yang menyimpan nominal pembayaran, serta method yang menunjukkan cara bayar yang dilakukan. Entitas ini terhubung pada relasi madePayment sebagai total participation sehingga primary key dari entitas customer perlu dimasukkan ke dalam relasi ini. Atas penjelasan tersebut, skema relasional dari entitas ini adalah sebagai berikut.

* payment = (___paymentID___, amount, method, _customerID, invoiceNum_)
* payment(customerID) --> customer(customerID)
* payment(invoiceNum) --> orders(invoiceNum)

8. orders
Entitas ini menyimpan seluruh pemesanan yang terjadi dalam program. Entitas ini memiliki atribut turunan total price sehingga atribut ini tidak dimasukkan dalam skema relasional. Atribut lain yang terdapat dalam entitas ini adalah invoiceNum sebagai primary key, orderDate yang menyimpan tanggal pemesanan, shippingAddress yang menyimpan alamat pengiriman, serta status yang menunjukkan status pemesanan. Entitas ini terhubung dengan relasi orderPayment yang bersifat one-to-one sehingga primary key dari entitas payment dapat dimasukkan sebagai atribut dalam skema relasional orders. Selain itu, entitas ini juga terhubung dengan relasi placed order pada sisi total participation sehingga primary key dari entitas customer harus dimasukkan sebagai atribut foreign key dalam skema relasional orders. Atas penjelasan tersebut, skema relasional yang terbentuk adalah senagai berikut.

* orders = (___invoiceNum___, _customerID_, orderDate, _addressNum_, status)
* orders(customerID) --> customer(customerID)
* orders(addressNum, customerID) --> savedAddress(addressNum, customerID)

9. orderDetails
Entitas ini merupakan suatu weak entity yang dependen pada entitas orders sehingga dibutuhkan primary key entitas orders dalam skema relasional entitas ini sebagai composite primary key. Entitas ini memiliki suatu atribut turunan finalPrice sehingga atribut ini tidak dimasukkan ke dalam skema relasional. Atribut lain yang terdapat dalam entitas ini adalah itemLineNumber sebagai composite primary key bersama invoiceNumber, quantity yang menyimpan jumlah buku yang dipesan, serta discount yang menyimpan diskon yang digunakan. Selain itu, entitas ini juga terhubung dengan relasi contains yang terhubung dengan entitas books pada sisi total participation sehingga primary isbn pada entitas books harus dijadikan foreign key pada skema relasi orderDetails. Atas penjelasan tersebut, skema relasional yang terbentuk adalah sebagai berikut.

* orderDetails(___invoiceNum, itemLineNumber___, _isbn_, quantity, discount)
* orderDetails(invoiceNum) --> orders(invoiceNum)
* orderDetails(isbn) --> books(isbn)

10. storeStock
Relasi ini menghubungkan entitas store dengan books yang menunjukkan ketersediaan buku dalam suatu toko. Relasi ini bersifat total participation pada sisi store dan one pada sisi books yang berarti seluruh toko harus memiliki buku. Selain itu, relasi ini juga ditambahkan dengan atribut stock yang menunjukkan jumlah buku yang tersedia di dalam toko. Atas penjelasan tersebut, skema relasional yang terbentuk adalah sebagai berikut.

* storeStock = (___storeID, isbn___, quantity)
* storeStock(storeID) --> store(storeID)
* storeStock(isbn) --> books(isbn)

11. shoppingCart
Relasi ini merupakan relasi yang menghubungkan entitas books dan customer yang menunjukkan buku-buku yang ingin dibeli pelanggan. Relasi ini bersifat many-to-many dan memiliki 3 atribut: isbn dan customerID sebagai atribut komposit, serta quantity sebagai jumlah dari buku yang ingin dipesan. Atas penjelasan tersebut, skema relasional yang terbentuk adalah sebagai berikut.

* shoppingCart = (___customerID, isbn___, quantity)
* shoppingCart(customerID) --> customer(customerID)
* shoppingCart(isbn) --> books(isbn)
&nbsp;

## __Program Screenshots__
Berikut beberapa Screenshot dari Program. Untuk screenshot dari keseluruhan program dapat dilihat pada folder `Data Scraping/screenshot/` & `Data Storing/screenshot`.
<p align="center">
  <img src="./Data Scraping/screenshot/1.png" />
  <img src="./Data Scraping/screenshot/5.png" />
  <img src="./Data Scraping/screenshot/7.png" />
  <img src="./Data Scraping/screenshot/12.png" />
  <img src="./Data Scraping/screenshot/15.png" />
  <img src="./Data Scraping/screenshot/19.png" />
  <img src="./Data Storing/screenshot/0.png" />
  <img src="./Data Storing/screenshot/1.png" />
  <img src="./Data Storing/screenshot/2.png" />
  <img src="./Data Storing/screenshot/dump.png" />
</p>
&nbsp;

### _References_
- BeautifulSoup4
- Selenium
- JSON & JSONB
- More Ref. on the `ScrapingScript.ipynb` & `Data Storing/src/ files.`
&nbsp;

### __Author__
_Hans Stephano Edbert N._\
_18221171_