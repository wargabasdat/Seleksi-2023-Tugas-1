<h1 align="center">
  <br>
  Tugas 1 Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Author:

  18221134 / Muhammad Rafi Haidar

  18221134@std.stei.itb.ac.id
  <br>
  <br>
</h2>


### Description of the data and DBMS

Dashboard

![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/RayWhiteDataVisualization.png)

Ray White Indonesia adalah anak perusahaan Ray White Group, perusahaan real estat multinasional yang berbasis di Australia. Dengan kehadiran melalui 175 kantor cabangnya yang tersebar di 25 kota besar di Indonesia, serta didukung oleh 4000 Marketing Executive yang berpengalaman, Ray White Indonesia mampu menawarkan berbagai layanan unggulan kepada para kliennya. Melalui layanan seperti manajemen properti yang profesional, penjualan properti yang efektif, dan appraisal properti yang akurat, Ray White Indonesia menjadi salah satu pemain utama dalam industri real estat di Indonesia.

Data hasil scraping merupakan hasil pengumpulan informasi dari situs web https://www.raywhite.co.id/ yang mencakup informasi tentang listing properti yang dijual. Data tersebut mencakup judul listing beserta ID listing properti dan live ID properti. Data juga mencakup spesifikasi relevan mengenai properti tersebut, seperti tipe properti, lokasi properti yang mencakup kota dan provinsi, nilai jual properti dalam mata uang dolar AS dan rupiah, status negosiasi harga properti, ukuran tanah dan bangunan dari properti, jenis sertifikat kepemilikan properti, serta jumlah kamar tidur, kamar mandi, dan tempat parkir mobil yang tersedia dalam properti. Selain itu, data juga mencakup informasi tentang agen real estat yang mengurus properti tersebut. Informasi tersebut meliputi nama agen, ID pegawai agen, nomor telepon agen, dan kantor tempat agen tersebut bekerja.

Hasil scraping data disimpan ke dalam beberapa berkas JSON yang terpisah berdasarkan tipe properti dan satu berkas yang merupakan gabungan dari semua berkas JSON. Selain itu, data juga disimpan dalam format CSV sebagai redundancy dan untuk memudahkan penulis dalam memasukkan data ke dalam DBMS. Selain itu, data hasil scraping juga disimpan dalam beberapa tabel di dalam basis data SQL dengan encoding UTF8 menggunakan DBMS PostgreSQL.

Pemilihan PostgreSQL sebagai DBMS didasarkan oleh familiaritas penulis dengan program tersebut. Selain itu, DBMS ini juga dipilih karena sifat open source dari PostgreSQL yang memungkinkan akses dan penggunaan data hasil dumping basis data oleh siapapun.

Penulis memilih untuk melakukan scraping data properti yang dijual di situs https://www.raywhite.co.id/ dengan tujuan mendapatkan gambaran umum tentang pasar properti di Indonesia. Ray White, sebagai salah satu pemain utama dalam industri real estat di Indonesia, dapat menjadi sebagai sumber sampel data yang baik untuk dianalisis.

Data yang diperoleh melalui scraping dapat dianalisis untuk menghasilkan informasi tentang harga properti dan persebarannya di seluruh Indonesia. Analisis tersebut dapat memberikan informasi  bagi calon pembeli dalam menentukan properti yang sesuai dengan kebutuhan mereka. Selain itu, hasil analisis juga dapat digunakan oleh investor real estat untuk mempelajari tren pasar properti di Indonesia dan membantu mereka dalam membuat keputusan investasi.

Selain itu, hasil analisis data properti juga dapat menjadi alat bagi pemangku kepentingan umum seperti pemerintah dalam merencanakan dan mengembangkan daerah. Informasi tentang harga properti, jumlah listing, dan lokasi dapat membantu pihak terkait dalam merencanakan pengembangan wilayah, kebijakan perumahan, dan kebijakan publik lainnya yang berkaitan dengan sektor properti secara umum ataupun perumahan.

Dashboard yang dibuat merupakan gambaran umum data yang didapat dari proses scraping. Informasi yang diperoleh mencakup data tentang 10 agen properti dan kantor yang memiliki jumlah listing terbanyak. Selain itu, daashboard juga mencakup informasi perihal jumlah listing untuk setiap tipe properti serta nilai mean dan median harga properti untuk setiap tipe tersebut.

Selain data pasar properti umum, terdapat juga informasi perihal jumlah listing, luas bangunan, dan harga rata-rata untuk listing rumah di setiap provinsi di Indonesia. Informasi tentang persebaran harga rumah berdasarkan jumlah listing juga disajikan dalam bentuk distribusi normal.


### Specification of the program

Program scraping terletak di folder __Data Scraping__ dan terletak di dalam berkas Jupyter Notebook dengan nama __RayWhiteScraping.ipynb__. Program ditulis di dalam bahasa pemrograman Python dan mengimpor beberapa library untuk melakukan proses scraping dan memproses data yang diekstrak. Library yang digunakan untuk proses scraping adalah requests, lxml, re, dan BeautifulSoup. Library-library tersebut digunakan untuk mendapatkan data berupa file HTML dari sebuah laman di situs yang dituju dan mengekstrak informasi di dalamnya sebelum pemrosesan data. Library tqdm digunakan sebagai bantuan visual untuk kemajuan proses scraping.

Library yang digunakan untuk memproses data yang telah diekstrak ke dalam dataframe dan diekspor sebagai berkas JSON dan CSV adalah os, pandas, json, dan simplejson. Berkas hasil scraping mempunyai format penamaan __raywhite_{tipeProperti}_{nomorBerkas}.[json|csv]__ dan disimpan di folder __data__. Berkas dengan nama __raywhite_merged.[json|csv]__ merupakan hasil penggabungan dari semua berkas hasil scraping.

Program visualisasi data terletak di folder __Data Visualization__ dan terletak di dalam berkas Jupyter Notebook dengan nama __RayWhiteAnalysis.ipynb__. Program ditulis di dalam bahasa pemrograman Python dan mengimpor beberapa library untuk melakukan proses visualisasi data yang diekstrak. Library yang digunakan adalah pandas, seaborn, dan matplotlib.

Folder __Data Storing__ tidak mempunyai program apapun, namun memiliki hasil dumping basis data dalam bentuk berkas SQL dengan nama __raywhite_database.sql__ . Basis data dibuat di dalam PostgreSQL 15 dengan encoding UTF-8 berdasarkan hasil scraping. Tabel dan kolom yang ditambahkan untuk memberikan konteks pada data diisin dengan nilai null.


### How to use

Untuk menggunakan __RayWhiteScraping.ipynb__, jalankan semua cell program python secara berurutan. Pastikan semua library yang akan digunakan sudah terpasang dan perangkat yang akan digunakan memiliki akses ke internet. Pastikan nilai dari semua variabel __output_dir__ diganti dengan path yang sesuai. Untuk mengganti jumlah laman utama yang ingin di-scrap dari setiap properti, ganti nilai konstanta dengan nama properti di fungsi utama. Semua data dari semua berkas JSON akan digabungkan ke dalam satu berkas gabungan apabila tidak terjadi kendala. Apabila terjadi kendala koneksi, sesuaikan nilai pertama di dalam for loop propertyType untuk memulai proses scraping dari tempat terjadi kegagalan dan jalankan cell terakhir untuk menggabungkan berkas secara manual. 

Untuk menggunakan __RayWhiteAnalysis.ipynb__, jalankan semua cell program python secara berurutan. Pastikan semua library sudah terpasang dan variabel __file_path__ diubah nilainya ke path berkas __raywhite_merged.jeson__.

Untuk menggunakan __raywhite_database.sql__, pastikan versi PostgreSQL yang terpasang merupakan versi ke-15 dan import berkas tersebut ke dalam basis data yang diinginkan. Jalankan query __SET client_encoding = 'UTF8';__ untuk mengubah encoding client ke encoding yang digunakan oleh data hasil scraping.


### JSON Structure

Data hasil scraping dibagi ke beberapa berkas JSON berdasarkan tipe propertinya. Satu berkas JSON memuat hasil scraping dari 15 laman yang berisikan 39 listing properti. Semua data akan digabung ke satu berkas JSON bernama __raywhite_merged.jeson__.

Berikut merupakan sampel entri dari salah satu berkas JSON hasil scraping data:

[

  ...,

  {

    "listing_id": 384815,

    "live_id": "L22197450",

    "type": "house",

    "title": "Rumah Mewah Siap Huni Harga Bersahabat Di Taman Laguna",

    "province": "Jawa Barat",

    "city": "Bekasi",

    "value_usd": 165104,

    "value_idr": 2487787072,

    "negotiable": false,

    "building_size": null,

    "land_size": 165.0,

    "certificate": "SHM/Freehold",

    "bedroom": 5.0,

    "bathroom": 4.0,

    "carport": 2.0,

    "realtor_id": 26577,

    "realtor": "Dini Aryati",

    "realtor_phone": "+6281296632515",

    "realtor_office": "Ray White Pondok Indah Arteri"

  },

  ...

]

Berikut penjelasan key dan nilai dari struktur JSON di atas

listing_id : ID listing properti

live_id : ID live properti

type : jenis properti

title : judul listing properti

province : provinsi tempat properti berlokasi

city : kota tempat properti berlokasi

value_usd : harga jual properti dalam dolar AS

value_idr : harga jual properti dalam rupiah

negotiable : status yang menunjukan apakah harga jual properti dapat dinegosiasi (true jika iya, false jika tidak)

building_size : ukuran gedung properti dalam m2

land_size : ukuran tanah properti dalam m2

certificate : jenis sertifikat kepemilikan properti

bedroom: jumlah kamar tidur di properti

bathroom: jumlah kamar mandi di properti

carport: jumlah tempat parkir mobil di properti

realtor_id : ID pegawai milik agen properti yang mengurus listing

realtor : nama agen properti yang mengurus listing

realtor_phone : nomor telepon milik agen properti yang mengurus listing

realtor_office : kantor tempat agen properti yang mengurus listing bekerja


### Database Structure (ERD and relational diagram)

Desain Diagram ER
![raywhite_ERD](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/raywhite_ERD.png)

Desain Relational Diagram
![reaywhite_RelationalModel](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/raywhite_Relational%20Model.png
)


### Explanation of ERD to relational diagram translation process

1. Entity Realtor Office
realtor_office(__office_name__, principal_head, province, city, street, phone, email)

FK:
realtor_office(principal_head) -> realtor(realtor_id)

Penjelasan:
Entity Realtor Office merupakan strong entity yang mempunyai dua relationship dengan entity realtor. 

Relationship pertama merupakan hubungan one-to-many bernama employ. Satu kantor cabang bisa memiliki banyak agen properti di bawahnya, namun satu agen hanya bisa bekerja di bawah satu kantor cabang. Foreign key dengan nama office_name disisipkan pada tabel realtor dan mengacu pada primary key tabel realtor_office.

Relationship kedua merupakan hubungan one-to-one bernama Principal Head of. Satu kantor cabang harus mempunyai satu agen properti yang berperan sebagai principal head. Foreign key dengan nama principal_head disisipkan pada tabel realtor_office dan mengacu pada primary key tabel realtor.

2. Entity Realtor
realtor(__realtor_id__, name, date_of_birth, phone, email, employment_date, office_name)

FK:
realtor(office_name) -> realtor_office(office_name)

Penjelasan:
Entity Realtor merupakan strong entity yang mempunyai empat relationship, yaitu dengan entity Realtor Office, Property, dan Inquiry Request.

Relationship pertama merupakan hubungan one-to-many bernama employ. Satu kantor cabang bisa memiliki banyak agen properti di bawahnya, namun satu agen hanya bisa bekerja di bawah satu kantor cabang. Foreign key dengan nama office_name disisipkan pada tabel realtor dan mengacu pada primary key tabel realtor_office.

Relationship kedua merupakan hubungan one-to-one bernama Principal Head of. Satu kantor cabang harus mempunyai satu agen properti yang berperan sebagai principal head. Foreign key dengan nama principal_head disisipkan pada tabel realtor_office dan mengacu pada primary key tabel realtor.

Relationship ketiga merupakan hubungan one-to-many bernama Manage. Satu agen properti bisa mengurus banyak properti di bawahnya, namun satu properti hanya bisa diurus oleh satu agen properti. Foreign key dengan nama realtor_id disisipkan pada tabel property dan mengacu pada primary key tabel realtor.

Relationship keempat merupakan hubungan one-to-many bernama Handle. Satu agen properti bisa menerima banyak inquiry request, namun satu inquiry request hanya bisa diterima oleh satu agenproperti. Foreign key dengan nama realtor_id disisipkan pada tabel inquiry_request dan mengacu pada primary key tabel realtor.

3. Entity Seller
seller(__seller_id__, name, date_of_birth, province, city, street, phone, email)

Penjelasan:
Entity Seller merupakan strong entity yang mempunyai satu relationship, yaitu dengan entity property. Relationship berupa hubungan one-to-many bernama Sell. Satu penjual bisa menjual banyak properti, namun satu properti hanya bisa dijual oleh satu penjual. Foreign key dengan nama seller_id disisipkan pada tabel property dan mengacu pada primary key tabel seller.

4. Entity Buyer
seller(__buyer_id__, name, date_of_birth, province, city, street, phone, email, credit_score)

Penjelasan:
Entity Buyer merupakan strong entity yang mempunyai satu relationship, yaitu dengan entity Transaction. Relationship berupa hubungan one-to-many bernama Participate. Satu pembeli dapat berpartisipasi di berbagai transaksi pembelian, namun satu transaksi hanya bisa memiliki satu pembeli yang berpartisipasi di dalamnya. Foreign key dengan nama buyer_id disisipkan pada tabel transaction dan mengacu pada primary key tabel buyer.

5. Entity Transaction
transaction(__transaction_id__, purchase_price_usd, purchase_date, buyer_id, listing_id)

FK:
transaction(buyer_id) -> buyer(buyer_id)
transaction(listing_id) -> property(listing_id)

Penjelasan:
Entity Transaction merupakan strong entity yang mempunyai dua relationship, yaitu dengan entity Buyer dan Property.

Relationship pertama merupakan hubungan one-to-many bernama Participate. Satu pembeli dapat berpartisipasi di berbagai transaksi pembelian, namun satu transaksi hanya bisa memiliki satu pembeli yang berpartisipasi di dalamnya. Foreign key dengan nama buyer_id disisipkan pada tabel transaction dan mengacu pada primary key tabel buyer.

Relationship kedua merupakan hubungan one_to_one bernama Purchase. Satu transaksi harus mempunyai satu properti yang dibeli. Foreign  key dengan nama lisitng_id disisipkan pada tabel transaction dan mengacu pada primary key tabel property.

6. Entity Property
property(__listing_id__, live_id, type, title, province, city, listed_price_usd, negotiable, cetificate, building_size, land_size, bedroom, bathroom, carport, sold, seller_id, realtor_id)

FK:
property(seller_id) -> seller(seller_id)
property(realtor_id) -> realtor(realtor_id)

Penjelasan:
Entity Property merupakan strong entity yang mempunyai empat relationship, yaitu dengan entity realtor, seller, transaction, dan inquiry_request.

Relationship pertama merupakan hubungan one-to-many bernama Manage. Satu agen properti bisa mengurus banyak properti di bawahnya, namun satu properti hanya bisa diurus oleh satu agen properti. Foreign key dengan nama realtor_id disisipkan pada tabel property dan mengacu pada primary key tabel realtor.

Relationship kedua merupakan hubungan one-to-many bernama Sell. Satu penjual bisa menjual banyak properti, namun satu properti hanya bisa dijual oleh satu penjual. Foreign key dengan nama seller_id disisipkan pada tabel property dan mengacu pada primary key tabel seller.

Relationship ketiga merupakan hubungan one_to_one bernama Purchase. Satu transaksi harus mempunyai satu properti yang dibeli. Foreign  key dengan nama lisitng_id disisipkan pada tabel transaction dan mengacu pada primary key tabel property.

Relationship keempat merupakan hubungan one-to-many bernama About dengan weak entity Inquiry Request yang terikat pada strong entity Property. Satu property bisa memiliki banyak inquiry request namun satu inquiry request hanya bisa mengacu pada inquiry request. Foreign key dengan nama listing_id dijadikan sebagai primary key di tabel inquiry_request bersama dengan discriminatornya.

7. Weak Entity Inquiry Request
inquiry_request(__timestamp, phone, listing_id__, realtor_id, email, name, message)

FK:
inquiry_request(listing_id) -> property(listing_id)
inquiry_request(realtor_id) -> realtor(realtor_id)

Penjelasan:
Entity Inquiry Request merupakan weak entity yang mempunyai dua relationship, yaitu dengan entity realtor dan property.

Relationship pertama merupakan hubungan one-to-many bernama Handle. Satu agen properti bisa menerima banyak inquiry request, namun satu inquiry request hanya bisa diterima oleh satu agenproperti. Foreign key dengan nama realtor_id disisipkan pada tabel inquiry_request dan mengacu pada primary key tabel realtor.

Relationship kedua merupakan hubungan one-to-many bernama About dengan strong entity Property yang terikat dengan weak entity inquiry_request. Satu property bisa memiliki banyak inquiry request namun satu inquiry request hanya bisa mengacu pada inquiry request. Foreign key dengan nama listing_id dijadikan sebagai primary key di tabel inquiry_request bersama dengan discriminatornya.


### Screenshot program

1. Data Scraping

Library yang digunakan oleh program scraping dan nilai dari konstanta URL ke laman situs dan XPATH elemen HTML
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_header.png)

Fungsi yang digunakan untuk melakukan scraping data dari laman situs

Fungsi terbagi menjadi fungsi yang melakukan scraping elemen data spesifik dan scraping secara keseluruhan
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_scraping_function_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_scraping_function_2.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_scraping_function_3.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_scraping_function_4.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_scraping_function_5.png)

Fungsi lain yang digunakan untuk pembersihan data hasil scraping dan ekspor berkas JSON dan CSV
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_other_function.png)

Program utama untuk melakukan scraping
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_2.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_3.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_4.png)

Hasil scraping data
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_result_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_result_2.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_main_result_3.png)

Program untuk me-reset progress bar
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_bar_reset.png)

Program untuk melakukan merging data hasil scraping
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_merging.png)

Hasil merging data
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/raywhite_scraping_merging_result.png)

2. Data Storing
Daftar tabel pada basis data
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_table_list.png)

Deskripsi tabel buyer
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_buyer.png)

Deskripsi tabel inquiry_request
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_inquiry_request.png)

Deskripsi tabel property
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_property.png)

Deskripsi tabel realtor
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_realtor.png)

Deskripsi tabel realtor_office
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_realtor_office.png)

Deskripsi tabel seller
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_seller.png)

Deskripsi tabel transaction
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/reaywhite_sql_table_transaction.png)

Hasil SELECT * tabel property
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_property_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_property_2.png)

Hasil SELECT * tabel realtor
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_realtor_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_realtor_2.png)

Hasil SELECT * tabel realtor_office
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_realtor_office_1.png)
![Alt text](https://github.com/haidar2003/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/raywhite_sql_select_realtor_office_2.png)


### Reference, Credits, and Libraries Used
Python Libraries:

1. BeautifulSoup
2. lxml
3. json
4. simplejson
5. os
6. pandas
7. requests
8. re
9. tqdm
10. seaborn
11. matplotlib

Credits:

Data diperoleh dari https://www.raywhite.co.id/

Ray White Indonesia merupakan bagian dari Ray White Group

References:

https://towardsdatascience.com/