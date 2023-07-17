<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  I Dewa Made Manu Pradnyana / 18221047
  <br>
  <br>
</h2>

## Description of the data and DBMS
Yu-Gi-Oh! adalah permainan kartu koleksi dan franchise multimedia yang populer yang berasal dari Jepang. Permainan ini dibuat oleh Kazuki Takahashi dan pertama kali diterbitkan sebagai seri manga pada tahun 1996. Franchise ini dengan cepat mendapatkan popularitas di seluruh dunia dan berkembang menjadi berbagai bentuk media, termasuk anime, permainan video, dan film. <br>

Data yang diambil berasal dari https://www.db.yugioh-card.com/yugiohdb/card_list.action. Pada website tersebut, diambil data kartu dari boosterpack yang released pada rentang tahun 2018 - 2022. Saya memilih Yu-Gi-Oh! sebagai data yang diambil karena merupakan salah satu permainan favorit saya sejak kecil dan saya mengambil data dari website https://www.db.yugioh-card.com/yugiohdb/card_list.action karena pada website ini menampilkan data kartu yang cukup lengkap dari tahun ke tahun. <br>

Saya memilih postgresql sebagai DBMS yang saya gunakan karena saya cukup familiar dengan DBMS tersebut serta memiliki kemampuan yang cukup baik dalam segi management database.<br>


## Specification of the program
Saya menggunakan python sebagai bahasa pemrograman serta menggunakan library tambahan seperti BeautifulSoup dan requests untuk scraping data dari website. Pertama - tama, saya melakukan request data terlebih dahulu untuk mendapatkan konten dari website tersebut menggunakan requests.get(url). Setelah itu, jika request berhasil dilakukan, akan dilakukan pengambilan data - data yang sekiranya memang dibutuhkan dengan menggunakan fungsi soup.get(). Setelah mendapatkan data, tidak lupa dilakukan preprocessing data agar format data yang diambil sesuai dengan yang diharapkan. Setelah itu, data - data tersebut akan disimpan ke dalam suatu list dan nantinya akan di-export dalam format json menggunakan library pandas. Data - data tersebut nantinya akan digunakan dalam membuat ER-Diagram dan translasi menjadi relational database.

## How to use
1. Download / clone repository terlebih dahulu
2. Untuk melakukan scraping data, buka terminal terlebih dahulu pada directori ../Data Scraping/src kemudian ketik python web_scrapper.py pada terminal. Tunggu hingga beberapa saat kemudian dan json file akan secara otomatis tersimpan pada directori ../Data Scraping/data 
3. Untuk menggunakan sql, buka DBMS yang ingin digunakan (disarankan menggunakan postgresql) dengan cara membuka terminal terlebih dahulu pada directori ../Data Storing/export kemudian ketik psql -U {username} dan ketik password, setelah itu buatlah database baru. Setelah itu log-out terlebih dahulu (ctrl+c) kemudian restore data ke database tersebut dengan ketik psql -U {username} -d {database_name} < {external_file_name}.sql . Setelah itu, lakukan log-in kembali dan database siap digunakan

## JSON Structure
saya menggunakan json dengan struktur array object dengan contoh :
[
  {
    "Key 1": "Value",
    "Key 2": "Value",
    "Key 3": "Value",
    ...
    "Key X": "Value",
  },
  {
    "Key 1": "Value",
    "Key 2": "Value",
    "Key 3": "Value",
    ...
    "Key X": "Value",
  },
  ...
]

## Database Structure (ERD and relational diagram)
Dibawah ini merupakan ERD yang saya buat <br>

Dibawah ini merupakan Relational diagram yang saya buat <br>

## Explanation of ERD to relational diagram translation process

## Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)

## Reference (Library used, etc)
1. BeautifulSoup
2. JSON
3. Requests
4. Pandas

## Author
I Dewa Made Manu Pradnyana / 18221047 <br>
