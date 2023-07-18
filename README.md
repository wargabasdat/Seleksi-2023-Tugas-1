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

### Deskripsi Data dan DBMS yang dipilih
**Sumber data**: _boxofficemojo.com_ </br>
**Data yang dipilih**: Highest Worldwide Gross All Time + Movie Detail Page </br>
**DBMS yang dpilih**: PostgreSQL </br>

Pada halaman web, terdapat 1000 data film yang dibagi dalam 5 halaman. Saya melakukan scrapping bukan hanya pada halaman pertama (200 film teratas) Highest Worldwide Gross All Time (`https://www.boxofficemojo.com/chart/ww_top_lifetime_gross/?area=XWW`), namun juga terhadap seluruh data (yang berada pada url yang berbeda). Tak hanya itu, saya juga melakukan _walk_ pada informasi detail setiap film dengan memasuki url detail film yang tersedia pada halaman web tersebut. Saya berhasil mendapatkan lebih banyak data dengan melakukan kembali scrapping detail film dari setiap film yang tercatat dalam Highest Worldwide Gross All Time.

Hasil scrapping memberikan saya 1000 baris dengan 12 kolom yang berisikan tentang data film dan market performance film tersebut.

### Spesifikasi Program

Program dibuat dalam format `.ipynb` agar kode yang saya buat dapat terlihat lebih _clean_ dan lebih mudah dipahami. Kode pada `.ipynb` ditulis dengan menggunakan bahasa Python. 

Secara garis besar, berikut merupakan tahapan yang saya lakukan dalam melakukan proses scrapping,
1. Data Scrapping
2. Data Transformation to Pandas Dataframe
3. Data Export to JSON
4. Data Export to PostgreSQL
5. Data Visualization and Insights

Dalam proses _scrapping_ saya melakukan beberapa pemrosesan sebelum data hasil scrapping diinput ke dalam pandas DataFrame. Proses pemrosesan adalah sebagai berikut, </br>
1. _Cleaning_ </br>
Terdapat beberapa ketidakkonsistenan isi data, pada kolom Domestic Gross pada web, terdapat beberapa baris yang tidak berisi data berformat uang. Data tersebut dituliskan dengan '-'. Selain itu, terdapat persentasi Domestic Gross yang sangat kecil sehingga pada kolom Domestic Percentage terdapat nilai '<0.1' yang membuat format data pada cell tersebut menjadi berbeda dengan data-data lain pada kolom yang sama. Untuk data-data seperti itu, saya mengubah nilainya menjadi nilai terkecil pada batas kolom tersebut.
2.  _Imputation_</br>
Beberapa film tidak menyediakan seluruh informasi pada kolom yang diambil. Contoh: beberapa film tidak memiliki data MPAA dan budget. Maka perlu dilakukan imputation pada data tersebut agar memiliki nilai. Contoh: untuk film yang tidak memiliki rating MPAA maka akan memiliki rating default 'Not Rated'. 
3. _Transformation_ </br>
Beberapa kolom dapat mempunyai nilai numerik yang dapat diparsing namun kondisi data kolom tersebut tidak berada pada format yang benar. Contoh: 1 Juta Dollar seharusnya cukup ditulis sebagai 1000000, namun pada web tertulis $1,000,000. Transformasi data diperlukan agar nilai numerik dapat diparsing.
4.  _Parsing_</br>
Saya melakukan parsing pada beberapa kolom data yang memiliki nilai numerik. Konversi dilakukan menjadi bentuk integer dan float sesuai dengan karakteristik kolom terkait. Hal ini bertujuan untuk memudahkan pengambilan insight dan visualisasi data.

### Cara Penggunaan
1. Sebelum memulai, Anda perlu menginstall library Python yang digunakan pada project ini. Untuk memudahkan penginstallan, disarankan menggunakan `pip`. Anda perlu menginstall hal-hal berikut: `pandas`, `matplotlib`, `beautifulsoup4`, `psycopg2`, `lxml`, `urllib`, `sqlalchemy`

2. Clone repository ini terlebih dahulu
```py
> git clone https://github.com/natthankrish/Seleksi-2023-Tugas-1.git
```

3. Buka file `Data Scrapping\src\scrapping.ipynb`. Lakukan Run All pada file tersebut. Scrapping membutuhkan waktu rata-rata 1 jam.

4. Apabila file scraper sudah berhasil dijalankan, selanjutnya kita harus melakukan data storing ke dalam DBMS. Pertama pada terminal Anda. pastikan PostgreSQL sudah terinstall. 
```bash
> psql -U postgres
Password : # Masukkan password Anda
```
```sql
CREATE DATABASE <nama database>;
```

5. Jika database sudah berhasil dibuat, jalan kan subbagian Data Export to PostgreSQL pada `Data Scrapping\src\scrapping.ipynb`. Lakukan manipulasi terhadap kredensial PostgreSQL Anda. 
```bash
'postgresql://<username>:<password>@localhost:<port>/<nama database>'
```
6. Setelah melakukan data storing, database dapat di-export agar dapat digunakan untuk keperluan lain. SQL hasil export dapat disimpan di folder ```Data Storing\export```. Apabila sudah pindah folder, jalankan perintah berikut untuk melakukan export.
```bash
> pg_dump -U postgres -d <nama database> > box_office_gross.sql
```

### Struktur JSON
Hasil scrapping web menghasilkan tabel dengan 12 kolom
```json
{
  "title":"Avatar",
  "worldwide_gross":2923706026,
  "domestic_gross":785221649,
  "domestic_p":26.9,
  "foreign_gross":2138484377,
  "foreign_p":73.1,
  "distributor":"Twentieth Century Fox",
  "budget":237000000,
  "domestic_opening":77025481,
  "running_time":"2 hr 42 min",
  "genres":"Action            Adventure            Fantasy            Sci-Fi",
  "mpaa":"PG-13",
  "year":2009
}
```


### Struktur Database
Tabel hasil srapping sudah berbentuk BCNF. Namun, menurut saya, diperlukan dekomposisi tabel untuk meningkatkan performa database. Hal ini juga didasarkan pada data mengenai detail film dan total gross berada di halaman yang berbeda, sehingga akan lebih baik jika data disimpan dalam tabel yang berbeda pula. 

Database yang sudah didekomposisi memiliki diagram sebagai berikut

<img src="Data Storing\design\scheme.png"> 

Dua film boleh memiliki judul yang sama jika mereka berasal dari distributor yang berbeda. Apabila berasal dari distributor yang sama, dua film boleh memiliki judul yang sama namun pada tahun rilis yang berbeda. Dengan itu, judul film, tahun rilis dan distributor film menjadi PRIMARY KEY dari tabel hasil scrapping.

Berikut merupakan dokumentasi basis data pada PostgreSQL
1. Tabel </br>
<img src="Data Storing\screenshot\tables.png"> 
2. Deskripsi Tabel </br>
<img src="Data Storing\screenshot\tabledescription.png"> 
3. Jumlah Data </br>
<img src="Data Storing\screenshot\count.png"> 

### Screenshot program 
Berikut merupakan tangkapan layar kode scrapping web _boxofficemojo.com_. Lebih lengkap dapat dilihat pada `Data Scrapping\src\scrapping.ipynb`
<img src="Data Scraping\screenshot\scrapping.png">

### Reference
- [Web Scraping Python using BeautifulSoup](https://www.youtube.com/watch?v=C5AOZZWxvIY)
- [Pandas Dataframe To JSON](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_json.html)
- [PostgreSQL CRUD Operation from Python](https://www.geeksforgeeks.org/perform-postgresql-crud-operations-from-python/)

### Visualisasi Data
<img src="Visualization\1.png"> 
<img src="Visualization\2.png">
<img src="Visualization\3.png">

### Author
**ANTONIO NATTHAN KRISHNA** (13521162), IF2021

