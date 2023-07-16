<h1 align="center">History Kurs Pajak</h1>

<p align="center">
  <!-- Typing SVG by DenverCoder1 - https://github.com/DenverCoder1/readme-typing-svg -->
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Jetbrains+Mono&pause=800&color=71BCE1&center=true&vCenter=true&width=500&lines=SELEKSI+WARGA+BASDAT+2023;Ahmad+Rizki;18221071" alt="Typing SVG" /></a>
</p>

## Description of the Data and DBMS

### Data

Kurs Pajak adalah kurs yang secara resmi ditetapkan oleh pemerintah dan digunakan dalam perhitungan pajak yang melibatkan mata uang asing. Nilai Kurs Pajak tetap selama periode tertentu dan ditentukan oleh Keputusan Menteri Keuangan Republik Indonesia. Nilai Kurs Pajak ini biasanya diperbarui setiap minggu sekali.

Script ini melakukan scraping pada laman [Kurs Pajak Badan Kebijakan Fiskal, Kementerian Keuangan RI](https://fiskal.kemenkeu.go.id/informasi-publik/kurs-pajak) untuk mendapatkan informasi Kurs Pajak historis. Informasi yang didapatkan adalah:

- Nomor KMK (Keputusan Menteri Keuangan)
- Tanggal mulai berlaku
- Tanggal akhir berlaku
- Nama mata uang
- Kode mata uang
- Nilai mata uang saat ini dibandingkan dengan Rupiah
- Perubahan nilai mata uang dibandingkan dengan nilai pada periode sebelumnya


### DBMS

DBMS yang digunakan adalah PostgreSQL. DBMS ini dipilih karena memiliki fitur yang lengkap dan mudah digunakan. Selain itu, DBMS ini juga memiliki fitur untuk melakukan import data dari file JSON ke dalam tabel.

## Specification of the Program

Runtime : Node.js v16.16.0
<br>Library :
- Axios
- Cheerio
- Moment

## How to Use

### Data Scrapping

1. Clone repository ini
2. Pada terminal, masuk ke direktori src dengan perintah `cd "pathfolder/Data Scraping/src"`
3. Install library yang dibutuhkan dengan perintah `npm install`
4. Jalankan script dengan perintah `npm run start`
5. Tunggu hingga proses scrapping selesai
6. JSON hasil scrapping dapat dilihat pada direktori `"Data Scrapping/data/"`

_**note :** File hasil scrapping dituliskan pada file di direktori `"Data Scrapping/data/"`_

### Data Storing

1. Clone repository ini
2. Pada terminal/cmd jalankan perintah `pathfolder/Data Storing/export/kurs_pajak_indonesia.sql`.
3. Restore database dengan perintah `psql -U {username} -d {database_name} < kurs_pajak_indonesia.sql`
4. Database siap digunakan

## JSON Structure

Hasil scrapping disimpan di dalam 2 jenis file JSON, yaitu:

1. `kurs_pajak.json` : berisi data kurs pajak yang masih bersarang berdasarkan tanggal kurs pajak berlaku
    ```
    [
      {
        "doc_id": "35/KM.10/2023",
        "start_date": "2023-07-12",
        "end_date": "2023-07-18",
        "data": [
          {
            "row_id": 1,
            "currency": "Dolar Amerika Serikat",
            "currency_code": "USD",
            "value": 15053,
            "change": 40
          },
          ...
        ]
      },
      ...
    ]
   ```
2. `kurs_pajak_normalized.json` : berisi data kurs pajak yang sudah dinormalisasi menjadi bentuk relasional. Terdapat 3 relasi pada file ini, yaitu `currency`, `kurs_pajak_document` dan `nilai_kurs`.
    ```
    {
      "currency": [
        {
          "currency_code": "USD",
          "currency_name": "Dolar Amerika Serikat"
        },
        ...
      ],
      "kurs_pajak_document": [
        {
          "doc_id": "35/KM.10/2023",
          "start_date": "2023-07-12",
          "end_date": "2023-07-18"
        },
        ...
      ],
      "nilai_kurs": [
        {
          "doc_id": "35/KM.10/2023",
          "no_urut": 1,
          "currency_code": "USD",
          "value_in_rupiah": 15053
        },
        ...
      ]
    }
    ```

## Database Structure

1. Entity Relationship Diagram
   
   ![ERD](./Data%20Storing/design/ERD_Kurs.png)
2. Relational Diagram
   
   ![Relational Diagram](./Data%20Storing/design/Relational_Kurs.png)

## Explanation of ERD to Relational Diagram Translation Process

1. Pada relasi country ditambahkan atribut currency_code yang merupakan primary key dari relasi currency, sebab pada E-R diagram entitas currency memiliki hubungan one-to-many dengan entitas country, dengan many berada pada entitas country.
   
   ![country_translate](Data%20Storing/design/translate_country.png)

2. Relasi *currency* memiliki atribut yang sama seperti pada E-R diagram karena memiliki hubungan *one-to-many* dengan entitas country, dengan one berada di entitas currency, dan hubungan *weak-entity-set* dengan nilai kurs, dengan curs sebagai *strong entity*.
   
   ![currency_translate](Data%20Storing/design/translate_currency.png)

3. Pada relasi nilai_kurs, ditambahkan atribut doc_id yang merujuk pada *primary key* dari relasi kurs_pajak_document, juga ditambahkan atribut currency_code yang merujuk pada relasi *currency*. Hal tersebut dilakukan karena nilai_kurs adalah weak entity yang memiliki 2 *strong entity* yaitu kurs_pajak_document dan *currency*. Pada relasi ini juga atribut change tidak dimasukkan ke model relasional, sebab merupakan derived atribut dari atribut value_in_rupiah.
   
   ![nilai_kurs_translate](Data%20Storing/design/translate_nilai_kurs.png)

4. Relasi kurs_pajak_document memiliki atribut yang sama seperti pada E-R diagram karena hanya memilik hubungan weak-entity-set dengan nilai_kurs dengan kurs_pajak_document adalah strong entity.
   
   ![kurs_pajak_document_translate](Data%20Storing/design/translate_kurs_pajak_document.png)

## Screenshots of the Program

1. Website to be scraped
   
   ![Webpage to be scraped](./Data%20Scraping/screenshot/Website.png)

2. Running the scraping script
   
   ![Running the script](./Data%20Scraping/screenshot/CLI.png)

3. Result of the scraping script
   
   ![Result of the script](./Data%20Scraping/screenshot/JSON.png)

4. Result of stroring data to DBMS
   - Tables in Database
    ![Tables in Database](./Data%20Storing/screenshot/info_table_db.png)

   - Fields Description of Tables
    ![Fields Description of Country](./Data%20Storing/screenshot/info_country.png)
    ![Fields Description of Currency](./Data%20Storing/screenshot/info_currency.png)
    ![Fields Description of Kurs Pajak Document](./Data%20Storing/screenshot/info_kurs_pajak_document.png)
    ![Fields Description of Nilai Kurs](./Data%20Storing/screenshot/info_nilai_kurs.png)

   - Data in Tables
    ![Data in Country](./Data%20Storing/screenshot/select_country.png)
    ![Data in Currency](./Data%20Storing/screenshot/select_currency.png)
    ![Data in Kurs Pajak Document](./Data%20Storing/screenshot/select_kurs_pajak_document.png)
    ![Data in Nilai Kurs](./Data%20Storing/screenshot/select_nilai_kurs.png)


## Data Visualization Analysis (**BONUS**)

### Grafik
  <div style="background-color:white;">
  <img src="Data Visualization/Tren_Kurs.png">
  <img src="Data Visualization/kurs_change_latest.png">
  <img src="Data Visualization/Nilai_kenaikan_tertinggi_dalam_bulan.png">
  </div>

### Insight
  Dari visualisasi yang telah dilakukan dapat ditarik beberapa insight sebagai berikut:
  - Nilai kurs tertinggi yaitu KWD (Dinar Kuwait).
  - Dalam 1 tahun terakhir, BND (Dolar Brunei Darussalam) mengalami kenaikan kurs terbesar. Sedangkan, LKR (Rupee Sri Lanka) mengalami penurunan kurs terbesar.
  - Pada bulan Oktober 2022, terjadi kenaikan kurs terbesar yaitu pada mata uang KWD (Dinar Kuwait).

## References

Script ini menggunakan library dan framework:

1. [Node JS](https://nodejs.org)
2. [Axios](https://github.com/axios/axios)
3. [Cheerio](https://github.com/cheeriojs/cheerio)
4. [Moment.js](https://github.com/moment/moment)

Berikut adalah referensi yang digunakan untuk memahami cara kerja library dan framework tersebut:
- https://axios-http.com/docs/post_example
- https://www.npmjs.com/package/cheerio
- https://www.youtube.com/watch?v=-ZMwRnxIxZY
- https://dba.stackexchange.com/questions/260500/can-a-weak-entity-have-relationship-with-multiple-strong-entities

## Author

**Ahmad Rizki
<br>18221071
<br>Seleksi Warga Basdat 2021**

<br>See [LICENSE](LICENSE) file.