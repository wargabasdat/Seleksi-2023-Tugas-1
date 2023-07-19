<h2 align="center">
  <br>
  Data Dokter Umum dari Website Alodokter.com
  <br>
  <br>
</h2>


## Deskripsi Data dan DBMS
Data yang diambil adalah data dokter umum yang diambil dari website Alodokter.com. Alodokter.com adalah website yang dapat digunakan oleh orang-orang untuk berkonsultasi dengan dokter di Indonesia. Data dokter umum yang diambil terdiri dari nama, rumah sakit, rating, total rating, biaya konsultasi, dan jumlah orang yang booking. DBMS yang digunakan adalah MySQL karena dipelajari di kuliah dan mudah untuk digunakan.

## Spesifikasi Program
Program dibuat dengan bahasa pemrograman Python.

## Cara Menggunakan
- Clone repository ini dengan perintah sebagai berikut:

```sh
git clone https://github.com/kevinjohn01/Seleksi-2023-Tugas-1.git
```

- `cd` ke directory repository dan jalankan program dengan perintah

```sh
python DataScraping/src/program.py
```

## Struktur JSON
[
  { "nama": "dr. Ardimansah Nurdin",  "harga": "75000", "rating": "100%", "total_rating": "4", "jumlah_booking": "67", "rumah_sakit": "Klinik HK Medical Center Makassar", "kecamatan": "Mariso", "kota": "Makassar"},
  ...
] 

## Struktur Database

### Entity-Relational Diagram
![ERD Diagram](./Data%20Storing/design/ERD.png)

### Relational Diagram
![Relational Diagram](./Data%20Storing/design/Relational.png)

## Penjelasan Proses Translasi Diagram ER ke Relasional
Pada ERD terdapat 3 entity, yaitu dokter, pasien, dan obat. 
- Dokter dan pasien memiliki relasi Konsultasi, yang berupa many-to-many. Relasi Konsultasi ini memiliki atribut waktu_janji. Karena relasi berupa many-to-many, harus dibentuk 1 relasi lagi yang menyimpan primary key dari dokter dan pasien,juga atribut dari relasi konsultasi. Jadi pada Relational Diagram, dibentuk relation Konsultasi. ID_pasien pada konsultasi adalah foreign key dari tabel pasien, dan nama_dokter pada konsultasi adalah foreign key dari tabel dokter.

- Agregasi dari relasi antara dokter dan pasien memiliki hubungan dengan obat yang bernama Pengobatan. Relasi ini berupa many-to many. Sama seperti sebelumnya, dibentuk satu relasi lagi untuk menyimpan primary key dari konsultasi dan obat. ID_pasien dan nama_dokter dari tabel Pengobatan adalah foreign key yang merujuk pada tabel konsultasi. id_obat pada tabel pengobatan adalah foreign key yang merujuk pada tabel obat.

## Screenshot Program
### Algoritma Utama
![Algoritma Utama](./Data%20Scraping/screenshot/program1.png)

### Fungsi untuk mengambil data
![Ambil Data](./Data%20Scraping/screenshot/program2.png)

## Reference
- Selenium: https://www.selenium.dev/documentation/
- JSON: https://docs.python.org/3/library/json.html
- Alodokter: https://www.alodokter.com/cari-dokter/dokter-umum?page=1

## Author
13521042 - Kevin John Wesley Hutabarat
