<h1 align="center">
  Seleksi Warga Basdat 2023
  
  Data Scraping Pakaian Pria di Uniqlo
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
1.
2.
3.
dst.

## Database Structure (ERD and relational diagram)
(picture here)

## Explanation of ERD to relational diagram translation process
Entitas Categories dan Subcategories pada ERD apabila ditranslasikan menjadi relational diagram memiliki bentuk entitas yang sama dengan bentuk pada ERD.

Entitas Products memiliki penambahan FK CategoryID dan SubcategoryID karena memiliki hubungan one-to-one dan total participation dengan entitas Categories dan Subcategories

Entitas Products karena memiliki dua atribut multi-value maka pada relational diagram ditranslasikan dengan membentuk entitas baru bernama ProductsColors dan ProductsSizes untuk menyimpan nilai warna dan ukuran lebih dari satu untuk setiap produk

## Screenshot of program
(di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)

## References (Library used, etc)
- Beautiful Soup
- Selenium
