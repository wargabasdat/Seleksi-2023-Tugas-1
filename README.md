<h1 align="center">
  <br>
Google Font Data Scraping Program using Python<br>
  <br>
</h1>

## Data Description and DBMS
<p>Data yang saya kumpulkan merupakan informasi mengenai <i>typeface</i> yang tersedia di situs <b>Google Font</b>. Data yang saya kumpulkan memiliki informasi berikut:
</p>

* Nama <i>typeface</i>
* Jenis gaya (<i>style</i>) yang dimiliki
* Nama pembuat
* Deskripsi
* Daftar bahasa yang didukung
* Jumlah penggunaan berdasarkan jumlah panggilan API Google Font selama seminggu terakhir
* Jumlah situs web yang menggunakan

DBMS yang saya gunakan dalam proyek ini adalah `PostgreSQL`. Selain mendukung penyimpanan data berbasis relasional, PostgreSQL bersifat gratis, _opensource_, serta memiliki banyak fitur yang tidak dimiliki oleh DBMS lain seperti MariaDB. Misalnya, dukungan pembuatan _stored procedure, function,_ dan _trigger_ yang dapat membantu pemeliharaan serta optimasi basis data (_tuning_)  pada kemudian hari.

## Specification of the program and related challenges
Program ditulis menggunakan Python dengan dukungan berbagai pustaka (_library_). Pemilihan bahasa Python didasarkan pada kemudahan sintaks serta dukungan pustaka yang tersedia. Karakteristik web yang hendak diambil datanya juga masih dalam cakupan kemampuan pustaka Python (khususnya BeautifulSoup dan Selenium).

Situs web Google Font menggunakan mekanisme _dynamic load_ sehingga laman web yang baru dibuka akan kosong, baru kemudian diisi datanya dengan seiring adanya _request_
dari Javascript. Hal ini dapat dibuktikan dengan kosongnya tampilan laman web ketika opsi Javascript pada peramban dimatikan. Oleh karena itu, penggunaan BeautifulSoup saja tidak cukup, kita membutuhkan Selenium untuk membuka laman web. Kendala lain yang muncul adalah bahwa proses _load_ data berjalan secara dinamis, hanya sejumlah data saja yang ditampilkan oleh laman web, sehingga kita tidak bisa langsung _scroll_ ke bawah (data yang di atas akan hilang). Dalam mengatasi masalah ini, saya menggunakan program yang disadur dari program buatan Kuan Wei untuk simulasi _scroll_ secara perlahan, tetapi dimodifikasi agar setiap iterasi program akan menyalin data. Kekurangan dari pendekatan ini adalah banyaknya data duplikat yang didapat. Namun, jumlah data duplikat hanya berkisar di angka ribuan, dan dapat mudah dibersihkan duplikatnya dengan Python maupun layanan daring. Program akan menghasilkan file .txt yang berisi data nama fon.

Setelah itu, gunakan program berikutnya untuk _parsing_ laman HTML, mencari bagian terkait, kemudian ekstraksi data dari halaman. Terdapat tiga total laman web yang harus dijelajahi untuk tiap fon: laman utama, laman _about_, dan laman _glpyhs_. Secara umum, fon di Google Font dapat dibedakan menjadi fon Noto dan fon non-Noto. Fon berjenis Noto dibuat oleh Google sehingga membutuhkan perlakuan khusus, misalnya pola URL yang berbeda, struktur laman HTML yang berbeda, maupun ketiadaan data seperti _designer/author_. Oleh karena itu, pada program dibuat perlakuan berbeda bergantung pada jenis fon (dilihat dari nama). Namun, ada pula fon non-Noto yang memiliki struktur halaman berbeda dibanding fon lain, sehingga diperlukan mekansime _error handling_ menggunakan sintaks _try-catch-exception_. Hasil data diolah menggunakan metode String yang terdapat pada Python kemudian dituliskan menjadi berkas JSON.

## How to use
Program dapat dijalankan pada perangkat yang telah terpasang Python 3 serta terpasang dependensi pustaka berikut:
* BeautifulSoup
* Selenium
* Requests
* LXML
  
Pemasangan pustaka dapat dilakukan menggunakan Pip (_Pip Installs Packages_) lalu tulis perintah berikut pada _command prompt_:
```console
pip install beautifulsoup
```
```console
pip install selenium
```
```console
pip install requests
```
```console
pip install lxml
```
## JSON Structure
Berikut adalah struktur dasar dari berkas JSON hasil _scraping_:
```JSON
{
    "object _name": {
        "font_name": "",
        "styles": [],
        "num_of_styles": ,
        "designer": "",
        "description": "",
        "usage_details": ,
        "web_usage": ,
        "langSupp": {
            "Africa": [],
            "Americas": [],
            "Asia": [],
            "Europe": [],
            "Oceania": []
        },
        "num_of_lang_sup": 
    }
}
```
Pada struktur di atas ada beberapa _key_ yang dapat diidentifikasi:
- `object_name` adalah kunci dari **objek luar (pembungkus)**
- `font_name` adalah kunci yang **menyimpan nama fon dalam bentuk String**
- `styles` adalah kunci yang **menyimpan _array of styles_ yang berbentuk String**
- `num of styles` adalah kunci yang **menyimpan jumlah _styles_ dari suatu fon**
- `designer` adalah kunci yang **menyimpan nama-nama pembuat fon**
- `description` adalah kunci yang **menyimpan deskripsi fon**
- `usage_details` adalah kunci yang** menyimpan jumlah penggunaan berdasarkan jumlah panggilan API Google Font selama seminggu terakhir**
- `web_usage` adalah kunci yang **menyimpan jumlah situs web yang menggunakan fon**
- `langSupp` adalah sebuah kunci yang menyimpan sebuah objek yang memiliki beberapa _sub-object_, yakni **Africa, Americas, Asia, Europe, dan Oceania**. Masing-masing _sub-object_ m**enyimpan _array of String_** berupa bahasa yang didukung fon dari masing-masing benua
- `num_of_lang_sup` adalah kunci yang **menyimpan total jumlah bahasa yang didukung fon**
## Database Structure
## Explanation of ERD to relational diagram translation process
## Screenshot program
## Reference
Program ini ditulis dengan menggunakan _library_ `BeautifulSoup` untuk proses _parsing_ laman HTML, `Selenium` untuk membuka halaman situs yang dinamis serta simulasi aktivitas _scroll_, `JSON` untuk menuliskan hasil _scraping_ ke dalam bentuk berkas JSON, serta _library_ pendukung lainnya seperti `LXML` untuk parsing, `Time` untuk memberi jeda waktu pada proses, dan `requests` untuk mengirimkan permintaan HTTP.

Program untuk simulasi gerakan _scrolling_ didasarkan pada program yang ditulis oleh [Kuan Wei](https://medium.com/analytics-vidhya/using-python-and-selenium-to-scrape-infinite-scroll-web-pages-825d12c24ec7). Namun, program dimodifikasi untuk menyesuaikan perilaku dan karakteristik dari situs web Google Font sehingga pengambilan data tidak dilakukan di akhir, melainkan di tiap kali iterasi _scroll down_.
## Author
Program ini dibuat oleh Rayhan Maheswara Pramanda (18221130) dari program studi sistem dan teknologi informasi.
