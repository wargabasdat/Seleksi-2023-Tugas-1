<h1 align="center">
  Seleksi Warga Basdat 2023
  
  Data Scraping [Pakaian Pria di Uniqlo](https://www.uniqlo.com/id/id/men)
</h1>
<h3 align="center">
  18221016 | Justin Yusuf Abidjoko
  <br>
</h3>

## Description of the data

Uniqlo merupakan perusahaan Jepang yang bergerak dalam bidang perencanaan produk, produksi, dan distribusi berbagai jenis pakaian.

Uniqlo menjadi website yang saya jadikan sebagai latihan _data scraping_ karena saya memiliki beberapa pertanyaan. Pertanyaan pertama, kira-kira apa saja data yang dibutuhkan untuk menjalankan _website_ seperti Uniqlo? Pertanyaan kedua, apa saja produk-produk yang memiliki _review_ yang bagus? Pertanyaan terakhir, sesulit apakah untuk men-_data scrape_ Uniqlo?

Karena Uniqlo memiliki berbagai jenis pakaian untuk wanita, pria, anak, dan bayi, maka yang saya _data scrape_ hanya data pakaian pria.

DBMS yang digunakan untuk melihat hasil _data scraping_ pakaian pria dari Uniqlo yaitu PostgreSQL. Berkat praktikum mata kuliah II2250 Manajemen Basis Data, saya menjadi cukup familiar dengan PostgreSQL dan dokumentasinya yang cukup mudah untuk dimengerti.

## Specification of the program

Source Code dibentuk menggunakan bahasa Python dengan penambahan library utama Beautiful Soup dan Selenium. Output dari program berupa suatu file JSON yang kemudian dapat di-_import_ dalam PostgreSQL dengan JSON _structure_:

- Products: {"product_id", "name", "price", "description", "rating", "review_count", "categpry_id", "subcategory_id"}
- Products_Colors: {"product_id", "color"}
- Products_Sizes: {"product_id", "size"}
- Categories: {"category_id", "category"}
- Subcategories: {"subcategory_id", "subcategory"}

## How to use
1. Download _repository_ ini
2. Buka _terminal_ dalam folder Data Scraping/src
3. Pastikan Python sudah ter-_download_ dalam komputer Anda
4. Ketik ini di terminal
```
   python scraper.py
```
5. Jika _command_ diatas tidak bisa maka jalankan _command_ ini
```
   "python3 scraper.py"
```
6. Tunggu selama 15-20 menit, waktu dapat berlangsung lebih lama berdasarkan internet yang Anda gunakan
7. Lakukan langkah-langkah yang disebutkan dalam file [Importing to PostgreSQL Tutorial](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/blob/main/Data%20Scraping/src/import_tutorial.txt)
8. Anda berhasil menambahkan hasil _data scraping website_ Uniqlo dalam RDBMS PostgreSQL

## Database Structure (ERD and relational diagram)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/261becc9-343b-4d2c-8f07-340be272ea9c)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/38d40d57-9114-4b3c-ba3d-ccb8d74eecff)

## Explanation of ERD to relational diagram translation process
Entitas Categories dan Subcategories pada ERD apabila ditranslasikan menjadi relational diagram memiliki bentuk entitas yang sama dengan bentuk pada ERD.

Entitas Products memiliki penambahan FK CategoryID dan SubcategoryID karena memiliki hubungan one-to-one dan total participation dengan entitas Categories dan Subcategories

Entitas Products karena memiliki dua atribut multi-value maka pada relational diagram ditranslasikan dengan membentuk entitas baru bernama ProductsColors dan ProductsSizes untuk menyimpan nilai warna dan ukuran lebih dari satu untuk setiap produk

## Screenshot of program
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/749ee812-6c58-4815-8a04-f216e251be42)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/78b800c7-b76b-4340-81ad-cdeb5b5433f5)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/59f6ed2d-cb30-47d8-8b7d-b69244508df0)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/495f129b-9da6-41e7-9218-c2dfd686087a)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/c6e69448-59d8-4eeb-955f-f31c6c3ebc32)
![image](https://github.com/justinjya/TUGAS_SELEKSI_1_18221016/assets/103380665/a84aef23-d765-4891-a914-66d27a6126a6)

## References (Library used, etc)
- Beautiful Soup
- Selenium
- jq (JSON to NDJSON Converter)
