<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  BWF Men's Singles
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
  <br>
</h2>


## Deskripsi Data dan DBMS
BWF (Badminton World Federation) adalah badan pengatur olahraga bulu tangkis internasional yang bertanggung jawab mengawasi dan mengembangkan olahraga bulu tangkis di seluruh dunia. BWF secara aktif menyelenggarakan berbagai turnamen bergengsi, termasuk Kejuaraan Dunia BWF dan Olimpiade, yang menarik perhatian jutaan penggemar dari berbagai negara. Bulu tangkis telah menjadi salah satu olahraga paling populer dan kompetitif di dunia, dengan pemain-pemain hebat yang menampilkan keterampilan teknis, kecepatan, dan kekuatan fisik yang luar biasa. Keberhasilan BWF dalam meningkatkan popularitas dan daya tarik olahraga ini telah membuat bulu tangkis menjadi olahraga yang semakin menarik bagi masyarakat global.

Oleh sebab itu, sebagai individu yang memiliki kegemaran dalam olah raga bulu tangkis dan menyadari betapa populernya olah raga ini di Indonesia, saya tertarik untuk mengumpulkan dan mengolah data mengenai bulu tangkis dari laman <a>https://bwf.tournamentsoftware.com/</a> . Dari laman tersebut, saya mengumpulkan data untuk kategori Men's Singles berupa peringkat pemain, profil pemain, hingga turnamen dan pertandingan-pertandingan yang diselenggarakan pada paruh pertama tahun 2023. Dengan mengolah data-data tersebut, saya bisa memberikan kemudahan bagi banyak orang untuk memantau peringkat pemain favorit mereka, serta melihat perkembangan peringkat dari waktu ke waktu. Selain itu, informasi ini juga bisa membantu para penggemar bulu tangkis dalam mengikuti perkembangan turnamen dan kompetisi dengan lebih mendalam serta peringkat pemain favorit mereka, serta melihat perkembangan peringkat dari waktu ke waktumembantu penggemar mengenal pemain baru yang mungkin memiliki potensi besar di masa depan.

DBMS yang saya gunakan untuk menyimpan data-data tersebut adalah PostgreSQL karena database relasional ini menawarkan sejumlah keunggulan. PostgreSQL memiliki kemampuan untuk menangani data terstruktur dan kompleks dengan baik, sehingga dapat dengan mudah menyimpan dan mengelola data. Kemudian, PostgreSQL juga menawarkan dukungan untuk kueri kompleks dan indeks yang canggih sehingga memungkinkan analisis data yang mendalam dan pencarian data yang cepat. Selain itu, PostgreSQL adalah database open-source yang aktif dikembangkan oleh komunitas besar, sehingga pengguna dapat mengandalkan dukungan dan pembaruan berkala. Itulah alasan mengapa saya memilih untuk menggunakan database ini.

## Spesifikasi
Program web scraping ini dibuat menggunakan bahasa pemrograman Python dengan beberapa library yang dibutuhkan untuk menjalankan berbagai macam fungsi terkait, mulai dari `BeautifulSoup4` dan `Selenium` untuk proses web scraping, `Request`, `lxml`, `Time`, `JSON`. Penjelasan mengenai kegunaan library-library ini akan dijabarkan pada bagian `Reference`.

## Cara Menggunakan
### Data Scraping
1. Clone repository ini ke local directory Anda
2. Lakukan change directory ke folder `Data Scraping/src`
3. Install semua library yang dibutuhkan dengan memasukkan perintah 
```
pip install -r library.txt
```
4. Run `main.py` dengan memasukkan perintah 
```
python main.py
```
5. Data-data hasil scraping dapat dilihat pada folder `Data Scraping/data`

### Data Storing
1. Masuk ke PostgreSQL dan buat sebuah database baru yang kosong.
2. Lakukan change directory ke folder `Data Storing/export`
3. Import file SQL dump pada folder tersebut ke PostgreSQL dengan memasukkan perintah `psql -U {username} -d {database < bwf.sql}`
4. Data-data tersebut akan terimpan dalam database tersebut

## JSON Structure
Ada 2 jenis struktur yang saya gunakan dalam menyimpan data-data hasil scraping dalam format JSON.

Yang pertama untuk file `player.json` yang menyimpan berbagai data terkait pemain, struktur JSON-nya adalah sebagai berikut:
```
{
    "member_id": string,
    "player_name": string,
    "date_of_birth": string,
    "nationality": string,
    "confederation": string,
    "rank": int,
    "points": int,
    "tournaments": int,
    "win": int,
    "lose": int,
    "total_match": int,
    "year_prize": float,
    "total_prize": float
}
```

Yang kedua untuk file `tournament.json` yang menyimpan berbagai data terkait turnamen, struktur JSON-nya sedikit berbeda sebagai berikut:
```
{
  "tournament_name": string,
  "organization": string,
  "city": string,
  "country": string,
  "venue": string,
  "start_date": string,
  "end_date": string,
  "series": string,
  "match_count": int,
  "match": [
      {
        "day": string,
        "court": string,
        "player_1": string,
        "player_2": string,
        "player_1_score": int,
        "player_2_score": int,
        "duration": int,
        "winner": string
      }]
}
```

Struktur pada file `tournament.json` sedikit berbeda dibanding file `player.json` karena dalam setiap turnamen dimungkinkan untuk terdapat lebih dari satu pertandingan yang berlangsung. Oleh sebab itulah dibentuk struktur yang nested.

## Database Structure
Berikut adalah struktur database dalam bentuk ERD (Entity Relationship Diagram):

![erd](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/BWF%20Men's%20Singles%20ERD.png)

Berikut adalah struktur database dalam bentuk Relational Diagram:

![erd](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/design/BWF%20Men's%20Singles%20Relational%20Diagram.png)

## Proses Memetakan ERD ke Relational Diagram
### Memetakan Entity menjadi Relasi
#### Strong Entity
Strong Entity merupakan entity yang dapat berdiri sendiri tanpa bergantung pada entity lainnya. Dalam hal ini, yang termasuk dalam Strong Entity adalah city, coach, confederation, country, organization, player, tournament, dan umpire. Strong Entity ini akan dipetakan ke Relational Diagram dengan atribut yang sama. Maka ketika dipetakan ke relational diagram akan terbentuk relasi-relasi sebagai berikut:
```
city = (city_id, city_name)
coach = (coach_id, coach_name, date_of_birth, role)
confederation = (confederation_id, confederation_name)
country = (country_id, country_name)
organization = (organization_id, organization_name)
player = (player_id, player_name, date_of_birth)
tournament = (tournament_id, tournament_name, venue, start_date, end_date, series, match_count)
umpire = (umpire_id, umpire_name)
```

#### Weak Entity
Weak entity adalah entity yang keberadaannya bergantung pada Strong Entity lain. Dalam hal ini, player_performance, player_prize, dan player_rank tidak akan dapat berdiri sendiri karena bergantung pada entity player. Hal ini dikarenakan entity-entity tersebut merupakan bagian dari player dan tidak dapat berdiri sendiri sehingga primary key dari player, yaitu member_id lah yang membedakan dan akan membuat setiap baris dari player_performance, player_prize, dan player_rank bersifat unik. Di samping itu, ada pula entity match yang bergantung pada entity tournament. Hal ini dikarenakan match merupakan bagian dari sebuah turnamen dan tidak dapat berdiri sendiri sehingga, primary key dari tournament, yaitu tournament_id yang membedakan dan akan membuat setiap baris dari match. Ketika Weak Entity akan dipetakan ke Relational Diagram, akan ditambahkan atribut primary key yang dimiliki oleh Strong Entity. Selain itu, atribut ini akan menjadi foreign key yang me-refer ke primary key dari Strong Entity. Nantinya, primary key dari Weak Entity tersebut akan berupa komposit dari primary key yang dimiliki Strong Entity beserta diskriminatornya. Maka ketika dipetakan ke relational diagram akan terbentuk relasi-relasi sebagai berikut:
```
player_performance = (member_id, tournaments, total_match, win, lose)
player_prize = (member_id, rank, points)
player_rank = (member_id, year_prize, total_prize)
match = (tournament_id, day, court, player_1, player_2, player_1_score, player_2_score, duration, winner)
```

### Memetakan Relationship
#### Many-to-One
Many-to-One adalah jenis relationship antara entity yang menggambarkan situasi di mana banyak entity pada satu sisi hubungan dapat terkait dengan satu entity pada sisi lainnya. Dalam ERD ini, hampir seluruh relationship yang ada di antara entity merupakan Many-to-One, yang ditunjukkan oleh country-confederation, city-country, tournament-city, tournament-country, tournament-organization, match-umpire, match-player, umpire-country, coach-country, player-coach, player-country, dan player-confederation. Ketika akan dipetakan ke Relational Diagram, akan ditambahkan atribut ekstra pada bagian "Many" berupa primary key yang dimiliki oleh bagian "One" yang nantinya menjadi foreign key yang me-refer ke primary key dari bagian "One". Maka ketika dipetakan ke relational diagram akan terbentuk relasi-relasi sebagai berikut:
```
city = (city_id, city_name, country_id)
coach = (coach_id, coach_name, date_of_birth, role, country_id)  //(country_id akan direname menjadi nationality)
country = (country_id, country_name, confederation_id)
player = (player_id, player_name, date_of_birth, coach_id, country_id, confederation_id) //(country_id akan direname menjadi nationality)
match = (tournament_id, day, court, player_1, player_2, player_1_score, player_2_score, duration, winner, member_id, umpire_id) //(member_id akan direname menjadi player_1_id)
tournament = (tournament_id, tournament_name, venue, start_date, end_date, series, match_count, city_id, country_id, organization_id)
umpire = (umpire_id, umpire_name, country_id) //(country_id akan direname menjadi nationality)
```

### List Foreign Key
```
country(confederation_id) -> confederation(confederation_id)
city(country_id) -> country(country_id)
tournament(city_id) -> city(city_id)
tournament(country_id) -> country(country_id)
tournament(organization_id) = organization(organization_id)
match(umpire_id) -> umpire(umpire_id)
match(player_1_id) -> player(member_id)
umpire(nationality) -> country(country_id)
coach(nationality) -> country(country_id)
player(coach_id) -> coach(coach_id)
player(country_id) -> country(country_id)
player(confederation_id) -> confederation(confederation_id)
```

## Screenshot
### Data Scraping
- Berikut adalah kode lengkap dari `main.py`:

![main](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/main_program.png)

- Berikut adalah kode lengkap dari `scrap.py`:

![scrap](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/full_scraping_program.png)

- Berikut adalah preprocessing untuk data-data terkait pemain:

![preprocess_player](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_player_data.png)

- Berikut adalah preprocessing untuk data-data terkait turnamen:

![preprocess_tournament](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/preprocessing_tournament_data.png)

- Berikut adalah proses scraping untuk data-data terkait player:

![scraping_player](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraping_player_data.png)

- Berikut adalah proses scraping untuk data-data terkait turnamen:

![scraping_tournament](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Scraping/screenshot/scraping_tournament_data.png)

### Data Storing
- Berikut adalah keseluruhan tabel dalam database:

![all_tables](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/all_tables.png)

- Berikut adalah tabel city:

![city_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/city_table.png)

- Berikut adalah tabel coach:

![coach_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/coach_table.png)

- Berikut adalah tabel confederation:

![confederation_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/confederation_table.png)

- Berikut adalah tabel country:

![country_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/country_table.png)

- Berikut adalah tabel match:

![match_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/match_table.png)

- Berikut adalah tabel organization:

![organization_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/organization_table.png)

- Berikut adalah tabel player_performance:

![player_performance_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/match_table.png)

- Berikut adalah tabel player_prize:

![player_prize_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/player_prize_table.png)

- Berikut adalah tabel player_rank:

![player_rank_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/player_rank_table.png)

- Berikut adalah tabel player:

![player_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/player_table.png)

- Berikut adalah tabel tournament:

![tournament_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/tournament_table.png)

- Berikut adalah tabel umpire:

![umpire_table](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Storing/screenshot/umpire_table.png)

## Dashboard
Berikut adalah tampilan dari dashboard interaktif yang menyajikan visualisasi data terkait BWF Men's Singles:

![dashboard](https://github.com/imanuelraditya/Seleksi-2023-Tugas-1/blob/main/Data%20Visualization/Dashboard.png)

Dashboard tersebut dapat diakses pada link <a href=https://public.tableau.com/app/profile/imanuel.raditya/viz/BWFMensSinglesData/OverallData><strong>berikut</strong></a>.

### Insight
Beberapa contoh insight yang bisa diperoleh berdasarkan visualisasi tersebut adalah sebagai berikut:
- Negara dengan jumlah pemain terbanyak yang tercatat oleh BWF adalah India
- Sepanjang paruh pertama pada tahun 2023, jumlah pertandingan terbanyak yang berlangsung dalam satu hari terjadi pada tanggal 9 Juni 2023 dengan total 68 pertandingan
- Peringkat pertama untuk kategori Men's Singles masih dipegang oleh Viktor Axelsen dengan poin yang sangat tinggi, yaitu 101.205
- Besarnya jumlah hadiah yang diperoleh oleh para pemain tidak selalu berbanding lurus dengan poin yang mereka miliki. Hal ini dikarenakan jumlah hadiah relatif bergantung pada turnamen yang diikuti serta anggaran dan sponsor yang mendukung turnamen tersebut.

## Reference
### Libraries
1. BeautifulSoup4
   - Library ini digunakan untuk mengekstrak data dari halaman web statis dengan cara yang mudah dan efisien.
2. Requests
   - Library ini digunakan untuk mengirim permintaan ke server dan menerima tanggapan, memungkinkan akses ke halaman web untuk dilakukan dalam proses web scraping.
3. Selenium
   - Library ini digunakan untuk mengotomatisasi browser dan mengambil data dari halaman web dinamis yang menggunakan teknologi JavaScript atau menangani aksi-aksi interaktif di situs web yang tidak dapat diatasi oleh BeautifulSoup4.
4. Time
   - Library ini digunakan untuk mengatur jeda waktu antara permintaan ke server, berguna untuk menghindari penalti dan pembatasan ketika melakukan web scraping.
5. JSON
   - Library ini digunakan untuk memproses dan menguraikan data dalam format JSON.
6. lxml
   - Library ini digunakan untuk pemrosesan dokumen XML dan HTML, memberikan kecepatan yang tinggi dan dukungan yang kuat dalam manipulasi elemen dan struktur data dalam dokumen tersebut.

### Tools
1. Python
2. PostgreSQL
3. Tableau

## Author
Imanuel Raditya (18221112)

Sistem dan Teknologi Informasi

Institut Teknologi Bandung