<h1 align="center">History Kurs Pajak</h1>

<p align="center">
  <!-- Typing SVG by DenverCoder1 - https://github.com/DenverCoder1/readme-typing-svg -->
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Jetbrains+Mono&pause=800&color=71BCE1&center=true&vCenter=true&width=500&lines=SELEKSI+WARGA+BASDAT+2023;Ahmad+Rizki;18221071" alt="Typing SVG" /></a>
</p>

## Description of the Data and DBMS

### Data

Kurs Pajak adalah kurs yang secara resmi ditetapkan oleh pemerintah dan digunakan dalam perhitungan pajak yang melibatkan mata uang asing. Nilai Kurs Pajak tetap selama periode tertentu dan ditentukan oleh Keputusan Menteri Keuangan Republik Indonesia.

Script ini melakukan scraping pada laman [Kurs Pajak Badan Kebijakan Fiskal, Kementerian Keuangan RI](https://fiskal.kemenkeu.go.id/informasi-publik/kurs-pajak) untuk mendapatkan informasi Kurs Pajak historis. Informasi yang didapatkan adalah:

- Nama mata uang
- Kode mata uang
- Nilai mata uang saat ini dibandingkan dengan Rupiah
- Tanggal mulai berlaku
- Tanggal akhir berlaku

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
2. Pada terminal, masuk ke direktori src dengan perintah `cd "pathfolder/src"`
3. Install library yang dibutuhkan dengan perintah `npm install`
4. Jalankan script dengan perintah `npm run start`

### Data Storing

_File hasil scrapping dituliskan pada file di direktori `"Data Scrapping/data/"`_

## JSON Structure

Hasil scrapping disimpan di dalam 2 jenis file JSON, yaitu:

1. `kurs_pajak.json` : berisi data kurs pajak yang masih bersarang berdasarkan tanggal kurs pajak berlaku
   ```
    [
        {
            "start_date": "2023-07-12",
            "end_date": "2023-07-18",
            "data": [
                {
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
2. `kurs_pajak_normalized.json` : berisi data kurs pajak yang sudah dinormalisasi menjadi bentuk relasional. Terdapat 2 relasi, yaitu `currencies` dan `kurs_pajak`
    ```
    {
        "currencies": [
            {
                "currency": "Dolar Amerika Serikat",
                "currency_code": "USD"
            },
            ...
        ],
        "kurs_pajak": [
            {
                "currency_code": "USD",
                "value": 15053,
                "change": 40,
                "start_date": "2023-07-12",
                "end_date": "2023-07-18"
            },
            ...
        ]
    }
    ```

## Database Structure

## Explanation of ERD to Relational Diagram Translation Process

## Screenshots of the Program

1. Website to be scraped

   ![Webpage to be scraped](./Data%20Scraping/screenshot/Website.png)

2. Running the script

   ![Running the script](./Data%20Scraping/screenshot/CLI.png)

3. Result of the script

   ![Result of the script](./Data%20Scraping/screenshot/JSON.png)


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

## Author

Ahmad Rizki
<br>18221071
<br>Seleksi Warga Basdat 2021
<br>See [LICENSE](LICENSE) file.
