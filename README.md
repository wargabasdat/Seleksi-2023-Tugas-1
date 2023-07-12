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


## Spesifikasi

### Data Scraping

1. Lakukan _data scraping_ dari sebuah laman web untuk memperoleh data atau informasi tertentu __TANPA MENGGUNAKAN API__. Hasil _data scraping_ ini nantinya akan disimpan dalam RDBMS.

2. Daftarkan judul topik yang akan dijadikan bahan _data scraping_ dan DBMS yang akan digunakan pada spreadsheet berikut: [Topik Data Scraping](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit?usp=sharing). Usahakan agar tidak ada peserta dengan topik yang sama. Akses edit ke spreadsheet akan ditutup tanggal __1 Juli 2023 pukul 21.40 WIB.__

3. Pada folder `Data Scraping`, calon warga basdat harus mengumpulkan _file script_, json hasil _data scraping_. Folder `Data Scraping` terdiri dari _folder_ `src`, `data` dan `screenshots`. 
    - _Folder_ `src` berisi _file script_/kode yang __*WELL DOCUMENTED* dan *CLEAN CODE*__.
    - _Folder_ `data` berisi _file_ json hasil _scraper_.
    - _Folder_ `screenshot` berisi tangkapan layar program.

4. Sebagai referensi untuk mengenal _data scraping_, asisten menyediakan dokumen "_Short Guidance To Data Scraping_" yang dapat diakses pada link berikut: [Data Scraping Guidance](https://docs.google.com/document/d/1vEyAK1HIkM792oIuwR4Li2xOodmAcCXxentCCivxxkw/edit?usp=sharing). Peserta diharapkan untuk memperhatikan etika dalam melakukan _scraping_.

5. Data yang diperoleh harus di-_preprocessing_ terlebih dahulu.
```
Preprocessing contohnya :
- Cleaning
- Parsing
- Transformation
- dan lainnya
```

### Database Modelling & Data Storing

1. Dari data _scraping_ yang sudah dilakukan, lakukan __pengembangan *database*__ dalam bentuk ERD kemudian __translasi ERD tersebut menjadi diagram relasional.__ Tambahkan tabel lain yang sekiranya berkaitan dengan tabel-tabel yang didapatkan dari _data scraping_ yang dilakukan.
   
2. Implementasikan skema relational diagram tersebut ke __RDBMS__ sesuai pilihan peserta. __DBMS No-SQL tidak akan diterima.__ Jangan lupa implementasikan _constraints (primary key, foreign key,_ dsb) pada _database_ yang dibuat.

3. Masukkan data hasil _scraping_ ke dalam RDBMS yang sudah dibuat. Tambahan tabel pada skema yang dibuat tidak perlu diisi dengan data _dummy_ (cukup dibiarkan kosong).

4. Tools yang digunakan __dibebaskan__ pada peserta.

5. Pada folder `Data Storing`, Calon warga basdat harus mengumpulkan bukti penyimpanan data pada DBMS. _Folder_ `Data Storing` terdiri dari folder `screenshots`, `export`, dan `design`.
    - _Folder_ `screenshot` berisi tangkapan layar bukti dari penyimpanan data ke RDBMS.
    - _Folder_ `export` berisi _file_ hasil _export_ dari DBMS dengan format `.sql`.
    -  _Folder_ `design` berisi ER Diagram dan diagram relasional yang disimpan dalam format `.png`


### Bonus
Task berikut bersifat tidak wajib (__BONUS__), boleh dikerjakan sebagian atau seluruhnya.

- Buatlah visualisasi data dalam bentuk _dashboard_ (dari data hasil _scraping_ saja) dan jelaskan apa _insights_ yang didapatkan dari visualisasi data tersebut. _Tools_ untuk melakukan visualisasi data ini dibebaskan pada peserta.

### Pengumpulan


1. Dalam mengerjakan tugas, calon warga basdat terlebih dahulu melakukan _fork_ project github pada link berikut: [Seleksi-2023-Tugas-1](https://github.com/wargabasdat/Seleksi-2023-Tugas-1). Sebelum batas waktu pengumpulan berakhir, calon warga basdat harus sudah melakukan _pull request_ dengan nama ```TUGAS_SELEKSI_1_[NIM]```

2. Tambahkan juga `.gitignore` pada _file_ atau _folder_ yang tidak perlu di-_upload_. __NB: BINARY TIDAK DIUPLOAD__

3. Berikan satu buah file `README` yang __WELL DOCUMENTED__ dengan cara __override__ _file_ `README.md` ini. `README` harus minimal memuat konten :


```
- Description of the data and DBMS (Why you choose it)
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author
```


4. Deadline pengumpulan tugas 1 adalah <span style="color:red">__17 Juli 2023 Pukul 22.40 WIB__</span>

<h3 align="center">
  <br>
  Selamat Mengerjakan!
  <br>
</h3>

<p align="center">
  <i>
  Happiness does not come from doing easy work
  but from the afterglow of satisfaction that
  comes after the achievement of a difficult
  task that demanded our best.<br><br>
  - Theodore Isaac Rubin
  </i>
</p>
<br>

## Description of the Data and DBMS
Indomaret is a minimarket retail store from Indonesia that has been active since the 1980s. Until March 2023, Indomaret have had more than 21.000 stores spread across the country. Indomaret has become a dominant place for customers to fulfill their daily wants and needs. As technology progresses, customers can also buy products from Indomaret through online means, specifically from their official website: https://www.klikindomaret.com. <br>

In this repository, I have provided the program to scrape and store the data from the website, specifically the https://www.klikindomaret.com/category/sarapan tab that contains all breakfast products. Each item on the page has its own name, final price, name of the warehouse that stores it, image, and discount (if there is any). And if you click on one of the items, you'll get more information like the PLU (which is basically a unique ID for each item), the composition and the description of each item. <br>

I decided to pick the "klikindomaret" site because I understand how important managing the database within a minimarket retail is, especially since there are multiple entities being involved within the management, like the products themselves, the warehouse, the customers, etc. Therefore, taking good care of the gathered data can provide some good insights that can benefit the company, like what items do customers like to buy, what details that come within a single transaction, etc. 

## Specification of the Program
### Data scraping:
This program uses Python 3.11.4 programming language and the BeautifulSoup for the data scraping process. The data is first gathered from the page's HTML file, parsed, transformed, and cleaned before being appended to the array filled with dictionaries, each containing information of an item gathered. Later on, the dictionary is converted into JSON and CSV files which can be seen at ```Data Scraping/data```.


### Data storing:
This program uses PostgreSQL as the DBMS for the data storing process. The schema of the database is represented as the ER diagram and the relational diagram. The ER diagram contains the entities involved within a minimarket environment like "product", "cart", "customer", "warehouse", and "payment". The relational diagram is made by transforming the ER diagram (the full process can be seen in [Explanation of the ERD to Relational Diagram Process](#explanation-of-the-erd-to-relational-diagram-process)). The only table that is filled with scraped data is the "product" table, while the other tables are left empty. The entire database can be used with the SQL file in ```Data Storing/export```

## How to use
First of all, please download and extract zip of this repository.
### Data scraping:
- Open the extracted folder in your preferred terminal
- Change the directory into ```Data Scraping/src```
- Type ```python -u web_scraping_sarapan.py``` on the terminal
- __Please wait__, it usually takes around +30 seconds to gather the data
- After the process is over, a couple of messages will show up in the terminal telling you that the JSON and CSV files are successfully created.
- You can access them in ```Data Scraping/data```

### Data storing:
- Grab the ```indomaret_database.sql``` file inside the ```Data Storing/export``` folder.
- Import to your PostgreSQL using the command: ```psql -U [username] -d [database_name] < .indomaret_database.sql```
- Log in to yout PostgreSQL account
- Type ```\l``` in the PostgreSQL prompt to check whether the "indomaret" database is listed within the list of databases in your account.
- Use the database using the command ```\c indomaret```.

## JSON Structure
The available JSON file in this project comes in the name of ```products.json``` which can be found in ```Data Scraping/data```. The file has an array that contains all objects in the form of dictionaries which contain the attributes that come from the data scraping of the Indomaret website page.
Below is the following structure: <br>
```
[
  {
    "Key/Column 1": "Value",
    "Key/Column 2": "Value",
    ...
    "Key/Column X": "Value",
  },
  {
    "Key/Column 1": "Value",
    "Key/Column 2": "Value",
    ...
    "Key/Column X": "Value",
  },
  ...
]
```

## Database Structure
This program uses a database named "Indomaret". <br>
Below is the Entity-Relationship Diagram (ERD) of the "Indomaret" database.
<p align="center">
  <img src="./Data Storing/design/ERD indomaret.drawio.png">
</p>
Below is the Entity-Relationship Diagram (ERD) of the "Indomaret" database.
<p align="center">
  <img src="./Data Storing/design/Relational Diagram Indomaret.drawio.png">
</p>

## Explanation of the ERD to Relational Diagram Process

## Screenshots of the Program
Data initialization
<p align="center">
  <img src="./Data Scraping/screenshot/init scraping.png">
</p>
Inserting PLU and product name into the products table dictionary
<p align="center">
  <img src="./Data Scraping/screenshot/insert plu and product name.png">
</p>
Inserting the rest of the products attributes into the dictionary
<p align="center">
  <img src="./Data Scraping/screenshot/add the rest of items.png">
</p>
Converting dictionary into ```.json``` and ```.csv``` file
<p align="center">
  <img src="./Data Scraping/screenshot/convert dictionary to json and csv file.png">
</p>
List of tables in the indomaret database
<p align="center">
  <img src="./Data Storing/screenshot/indomaret tables.png">
</p>
List of product column names
<p align="center">
  <img src="./Data Storing/screenshot/product column names.png">
</p>
An example of selecting products' final price
<p align="center">
  <img src="./Data Storing/screenshot/select final price product.png">
</p>
A dummy data of the warehouse table (that has to be filled in, otherwise the foreign key "warehousename" that is referenced by the products table won't work)
<p align="center">
  <img src="./Data Storing/screenshot/warehouse data.png">
</p>

## References
Below are the libraries I used for this project:
- BeautifulSoup4
- Requests
- JSON
- CSV

## AUTHOR
Muhammad Farrel Danendra Rachim (13521048)

