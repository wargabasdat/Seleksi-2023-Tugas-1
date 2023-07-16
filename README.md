<h1 align="center">
  <br>
  Scraping Data Laptop Bhinneka
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing, and Data Visualization from bhinneka.com
  <br>
  <br>
</h2>

## Deskripsi Data & DBMS

Pada Tugas 1 ini, saya memilih untuk melakukan scraping pada website bhinneka.com. Seperti yang tertulis di website bhinneka.com, website ini merupakan platform bisnis online. Berawal sebagai distributor mesin cetak format besar hingga saat ini  menyediakan produk IT, MRO, Business Solution dan Professional Services, untuk segmen UMKM,  korporasi dan institusi pemerintahan. Saat ini bhinneka tersebar di toko dan 33 kantor perwakilan di seluruh Indonesia. 

Alasan saya memilih website tersebut adalah maraknya jual beli online pada masa kini dan tidak dapat dipungkiri terdapat beberapa oknum yang menipu saat melakukan kegiatan jual beli online tersebut. Kategori yang saya pilih adalah laptop karena sebagian besar masyarakat Indonesia khususnya mahasiswa menggunakan laptop untuk menunjang kesehariaannya. Data yang saya ambil berupa nama produk, harga, cicilan, nama toko, lokasi toko, garansi, keunggulan, spesifikasi, deskripsi, estimasi,dan rating. Diakhir data saya menambahkan kolom id untuk membedakan setiap item.

DBMS yang saya gunakan untuk menyimpan hasil scraping tersebut adalah Postgresql. Alasan penggunaan Postgresql karena file hasil export dari web scraping berformat JSON dimana kita dapat menyimpan data JSON secara langsung dalam kolom JSON dan menggunakan fungsi-fungsi untuk memanipulasi data JSON. Selain itu, PostgreSQL menyediakan fleksibilitas dalam mengolah data JSON untuk mengakses, memperbarui, dan memanipulasi data JSON menggunakan query SQL.

## Spesifikasi

Program web scraping ini menggunakan bahasa pemrograman Python dengan bantuan library BeautifulSoup dan Selenium untuk melakukan scraping-nya. Terdapat beberapa library lain yang digunakan pada program ini yang akan dijelaskan kemudian serta dapat dilihat pada file library.txt.

## How To Use

1. Install library yang dibutuhkan
2. Clone repository ini ke local repository di PC Anda
3. Buka folder ini dengan Jupyter Notebook atau IDE yang biasa Anda gunakan
4. Run setiap kode di file bhinneka_scrape.ipynb
5. File hasil scraping akan berada di folder Data Scraping/data dan bernama Data_Laptop_Bhinneka.json

## JSON Structure

Berikut format file JSON yang dihasilkan dari scraping data:

```
{
        "nama_produk": string,
        "harga": string,
        "cicilan": string,
        "nama_toko": string,
        "lokasi_toko": string,
        "info_detail": [
            {
                "garansi": string,
                "keunggulan": string,
                "estimasi": string,
                "rating": float
            }
        ],
        "id": int
    }
```

## Database Structure

Berikut merupakan struktur database yang tercipta. Primary key dari struktur ini merupakan id dari setiap item.

![DataLaptop_ERD](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/0be884e0-60cd-4cd3-bddc-6bed038b2d45)

Berikut merupakan relational diagram dari pemetaan ERD yang telah dibuat

![image](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/c756ca04-8b6d-4d06-b7cd-8d5c91b30492)

## Explanation of ERD to relational diagram translation process

Semua atribut yang ada di dalam entitas lemah dipetakan menjadi relasi (tabel) yang melibatkan seluruh atribut yang sama pada entitas tersebut dengan menambahkan primary key dari entitas kuatnya (owner entity type) yang akan digunakan sebagai bersama dengan partial key dari entitas lemah.

|Sebelum|Sesudah|
|-------|-------|
|![DataLaptop_ERD](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/4e6a8c23-7038-448a-9802-a1b88307d465)|![image](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/c756ca04-8b6d-4d06-b7cd-8d5c91b30492)|

##### Keterangan:
Weak entity info_detail terhubung dengan strong entity DataLaptop sehingga primary key dari entity DataLaptop dilibatkan dalam relasi tersebut.

## Screenshot

Import Libraries

![import_libraries](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/d834d719-621e-46f7-87d4-a69558b32837)

Main Program Data Scraping
![scraper1](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/9f4bfb97-4a6d-44f9-90e1-a158b2dbc991)
![scraper2](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/e25170d6-f55e-4ac1-a6de-7a41e37e3291)
![scraper3](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/ec91d36e-db7f-476b-94f4-04e5164b33fb)

Proses Scraping
![scrape_run](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/a3665bdd-a061-4457-b31b-999504206adc)

Menyimpan Data Hasil Scraping Ke File JSON
![scrape_json](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/050d8278-29c8-4acd-8263-ceef438e6045)

Menambahkan Kolom id Pada File JSON
![add_id_json](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/6aa0d83b-5fc0-4612-b5ba-1c0b85ac277e)

Storing Data Ke Postgresql
![Storing_Data_Postgresql](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/dcc4767c-e93b-4a92-ac97-da3d4ee68e03)

Save File Ekstensi .sql
![Saving_File_Postgresql](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/8171b5ec-b921-4f22-84d6-b2899dbdca3e)

Test Ambil Semua Data Dari File
![TestData_Postgresql](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/cb2abf91-a3df-4200-8082-ea1ef13c3088)

Test Ambil Data Dengan Tambahan Kondisi
![TestData_Condition_Postgresql](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/410d2bcf-165a-444c-9fc7-56cf1eaa19f8)

#### Bonus

Preview File JSON Menggunakan Pandas
![preview_json](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/b6229344-f24e-41bd-8ca2-7a1877d6beec)

Bonus 1 Menampilkan data nama toko yang menjual lebih dari 50 produk
![bonus1](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/0f33f1e7-ee02-400a-ad2a-16d70f5e8444) ![bonus1_pie](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/f7a352b4-5183-484f-926e-aa70c467c51e)

Bonus 2 Menampilkan jumlah dari produk dengan harga yang sama lebih dari 9
![bonus2](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/8d1f4062-5aa6-4b34-b306-608b33620f55) ![bonus2_pie](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/ae95c378-81cd-47c0-a7de-6adf46350a34)

Bonus 3 Menampilkan lokasi toko yang sama lebih dari 50 
![bonus3](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/2e073fbd-9e3e-4d0f-902b-9a2fd9842565) ![bonus3_pie](https://github.com/RazanPtr/Seleksi-2023-Tugas-1/assets/88721317/6597cd78-ba54-4b86-89e5-58eb3aa264da)

## Reference

  <a href='https://selenium-python.readthedocs.io/index.html'> Selenium</a>
  <br>
  <a href='https://www.crummy.com/software/BeautifulSoup/bs4/doc/#extract'> BeautifulSoup</a>
  <br>
  <a href='https://chromedriver.chromium.org/getting-started'> Chrome WebDriver</a>
  <br>
  Web scraping : <a href='https://youtu.be/XVv6mJpFOb0'> Web Scraping with Python - Beautiful Soup Crash Course</a>
  <br>
  Python & JSON :<br>
  <a href='https://pynative.com/python-json-dumps-and-dump-for-json-encoding/'> Python JSON dump() and dumps() for JSON Encoding</a>
  <br>
  <a href='https://pynative.com/python-json-encode-unicode-and-non-ascii-characters-as-is/'> Python Encode Unicode and non-ASCII characters as-is into JSON</a>
  <br>
  Selenium : 
  <a href='https://medium.com/codex/web-scraping-with-selenium-in-python-832cf4b827a4'> Web Scraping with Selenium in Python</a>
  <br>

## Author
Razan Aditya Putra (18221132)
<br>
Information System and Technology
<br>
Institut Teknologi Bandung
