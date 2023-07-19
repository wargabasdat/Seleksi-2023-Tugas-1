<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
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
```json
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
```

## Database Structure (ERD and relational diagram)
Dibawah ini merupakan ERD yang saya buat
<img src = "./Data Storing/design/ERDiagram.png" alt="ERD">

Dibawah ini merupakan Relational diagram yang saya buat <br>
<img src = "./Data Storing/design/RelationalDiagram.png" alt = "Schema">

## Explanation of ERD to relational diagram translation process
proses translasi ERD menjadi relational diagram dilakukan dengan berbagai proses, yaitu :
1. Hubungan many-to-many antara boosterpack dan player ditranslasikan menjadi tiga buah tabel, yaitu tabel boosterpack, player, dan hubungan relasi antara kedua tabel tersebut yang dijadikan tabel (boosterpack_order) dengan primary key dari kedua tabel dijadikan atribut pada tabel boosterpack_order
2. Hubungan many to one antara boosterpack dan cards ditranslasikan menjadi tiga buah tabel, yaitu tabel boosterpack, cards, dan hubungan relasi antara kedua tabel tersebut yang dijadikan tabel (Card_Boosterpack) dengan primary key dari kedua tabel dijadikan atribut pada tabel card_boosterpack. Dilakukan hal tersebut karena dirasa lebih efisien.
3. Hubungan many (partial) to one antara card dengan forbiddenlist ditranslasikan menjadi tiga buah tabel, yaitu tabel cards, forbiddenlist, dan hubungan relasi antara kedua tabel tersebut yang dijadikan tabel (Card_Forbiddenlist) dengan primary key dari kedua tabel dijadikan atribut pada tabel card_forbiddenlist. Hal ini dilakukan agar menghindari null value pada many side.
4. Hubungan spesialisasi pada tabel card serta tabel lainnya yang berhubungan ditranslasikan menjadi tiga tabel, yaitu tabel cards, monster, dan pendulum. Hal ini karena beberapa tabel spesialisasi yang dibuat tidak memiliki atribut khusus sehingga tidak perlu dibuat tabel. Lalu, primary key dari tabel card dimasukkan pada tabel monster dan primary key dari tabel monster dimasukkan pada tabel pendulum.


## Screenshot program

### Data Scraping
<p align="center">
  <img src="./Data Scraping/screenshot/Scrap Testing.png">
</p>

### Data Storing
List of Table
<p align="center">
  <img src="./Data Storing/screenshot/listoftable.png">
</p>

1. Tabel Boosterpack
<p align="center">
  <img src="./Data Storing/screenshot/boosterpack.png">
</p>

2. Tabel Card_Boosterpack
<p align="center">
  <img src="./Data Storing/screenshot/card_boosterpack.png">
</p>

3. Tabel Card
<p align="center">
  <img src="./Data Storing/screenshot/card.png">
</p>

4. Tabel Monster
<p align="center">
  <img src="./Data Storing/screenshot/monster.png">
</p>

5. Tabel Pendulum
<p align="center">
  <img src="./Data Storing/screenshot/pendulum.png">
</p>

### Data Visualization
<p align="center">
  <img src="./Data Visualization/yugioh_dashboard.png">
</p>
Insight yang didapatkan dari hasil visualisasi data :
1. Jenis kartu monster terbanyak yang released pada rentang tahun 2018 - 2022 yaitu Effect Monster dengan jumlah sebanyak 1572 kartu
2. Jenis kartu spell terbanyak yang released pada rentang tahun 2018 - 2022 yaitu Normal Spell dengan jumlah sebanyak 410 kartu
3. Jenis kartu trap terbanyak yang released pada rentang tahun 2018 - 2022 yaitu Normal Trap dengan jumlah sebanyak 344 kartu
4. Tahun 2022 merupakan tahun dengan jumlah keluaran boosterpack terbanyak, yaitu sebanyak 12 boosterpack
5. Ghost from the past: the 2nd haunting merupakan boosterpack dengan jumlah kartu terbanyak, yaitu sebanyak 183 kartu

## Reference (Library used, etc)
1. BeautifulSoup
2. JSON
3. Requests
4. Pandas

## Author
I Dewa Made Manu Pradnyana / 18221047 <br>
