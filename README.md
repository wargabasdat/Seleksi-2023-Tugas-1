## Deskripsi Data
Data yang digunakan adalah data Buku - buku yang memang websitenya dibuat untuk di scrap. Saya memilih data ini dikarenakan saya awalnya memilih website lainnya dan ternyata data tidak bisa di scraping atau diakses seperti tahun-tahun sebelumnya akhirnya saya mencari website yang bisa diambil datanya yaitu website ini booksrap. Data yang saya gunakan adalah data dari https://books.toscrape.com/ dikarenakan situs ini memiliki data yang bisa di scrap dan dapat digunakan untuk keperluan tugas ini dengan baik. DBMS yang saya gunakan adalah Psql dikarenakan PSQL cukup mudah untuk digunakan dan saya sudah mempelajarinya di kelas Manajemen Basis Data saat semester 4 kemarin

## Spesifikasi Program
Proses pengerjaan program ini dibagi menjadi beberapa tahap, yang pertama adalah data scraping. Data scraping merupakan proses mengambil data dari suatu website, dalam proses ini saya menggunakan bahasa python dengan beberapa library lainnya untuk memperoleh data-data dari website yang saya pilih. Tahap berikutnya adalah data preprocessing. Tahap ini adalah proses dimana saya memilih atribut mana saja yang digunakan dari data yang telah diperoleh dan membagi atribut tersebut menjadi 2 tabel, serta menambahkan beberapa atribut yang diperlukan. Tahap berikutnya adalah data modelling. Pada tahap ini saya mengimplementasikan tabel tersebut ke dalam RDBMS, membuat tabel-tabel serta constraints nya, mengimplementasikan juga primary key serta foreign key pada setiap tabel. Tahap terakhir adalah data storing, dimana saya mencatat data-data yang sudah di preprocess ke dalam tabel-tabel sql.

* Jupyter Notebook
Open-source web application ini mempermudah penataan serta eksekusi kode program. File untuk data scraping akan tersimpan dalam format ".ipynb"
* PSQL
PSQL ini dibuat untuk menyimpan database dan membuat shema serta tabelnya, PSQL sendiri bekerja sebagai server untuk menyimpan database dan memproyeksikannya serta membuat primary key dan foreign key dari schema yang telah dibuat
* BeautifulSoup
Library ini digunakan dalam data scraping dari website Liquipedia CSGO. Library ini akan melakukan parsing pada website dan menyimpan elemen HTML di dalam suatu variabel. Sintaks pada library ini juga cukup mudah sehingga pencarian elemen HTML pada website menjadi praktis.
* Requests
Sebelum melakukan data scraping, program perlu melakukan request terlebih dahulu kepada website server agar elemen HTML bisa didapatkan. Library ini membantu program dalam melakukan hal tersebut.
* JSON
Library ini membantu program menghasilkan keluaran file dengan format .json dari variabel dengan tipe data list. Sebenernya kita juga memakai .CSV hanya saja ini tidak perlu menginport Library
* PANDAS
Library ini berfungsi untuk membuat dataframe atau dimensi data dan merubah-rubahnya sesuai yang kita inginkan

## How To Use
1. Pertama untuk melakukan semuanya agar mudah kita pakai jupyter notebook agar tidak perlu lagi download library lainnya karena sudah include, caranya download anaconda terlebih dahulu di link : https://www.anaconda.com/download
2. Lalu lakukan git clone jika sudah memiliki git bash pada lokal memori yang diinginkan
3. lalu bisa dibuka file .ipynb yang terletak pada folder Data Scraping >> src >> Tugas1_Basdat.ipynb bisa dibuka menggunakan jupyter notebook
4. Untuk menggunakan database yang sudah dibuat, tinggal mendownload file sql yang ada di folder Data Storing/export/Bookscrap.sql. Untuk melihat data dan bermain dengan datanya dapat menggunakan DBMS apapun.

## JSON Structure
Pada file ini jumlah file.json yang diperoleh ada 2 yaitu bookinformation.json dan bookavailbility.json yang berisi contoh
{
   "id"   : "1",
   "Stock"  : "In Stock"
}

{
   "id"           : "1",
   "nama buku"    :  "Saylor moon",
   "Jenis buku"   :  "Misteri",
   "Harga buku"   : "$45"
}

# Database Structure
### ER Diagram
![ER Diagram drawio (1)](https://github.com/Riandra4trend/Seleksi-2023-Tugas-1/assets/110533263/a25a30e5-317d-45e0-90f8-3acc280a3c2f)

### Relational diagram
![Relational diagram drawio](https://github.com/Riandra4trend/Seleksi-2023-Tugas-1/assets/110533263/e617a788-3899-4fb5-a291-45e0c5a28a38)

## References
### Data Scraping 
https://youtu.be/C5AOZZWxvIY
### Cara memakai DBMS
https://www.postgresql.org/docs/
### Cara memakai PANDAS & BEAUTIFULSOUP
beautifulsoup : https://realpython.com/beautiful-soup-web-scraper-python/
PANDAS        : https://pandas.pydata.org/docs/


