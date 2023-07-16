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

## Screenshot

Import Libraries

