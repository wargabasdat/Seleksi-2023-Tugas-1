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


## 18221150/Nixon Deflin Kurniawan

### Deskripsi Data

Pada proyek data scraping ini, saya mengambil data dari website __liquipedia.net/valorant/VCT/2023/Pacific_League/Statistics__ dengan data spesifik berupa Statistik Pro Player Valorant pada VCT Pacific 2023, saya tertarik untuk mengambil data tersebut dikarenakan website _liquipedia.net_ memberikan berbagai tabel statistik yang lengkap mengenai pertandingan-pertandingan _e-sport_. Hal ini meliputi data pertandingan, pemain, dan juga scoreboard. Tentu juga, ini didukung oleh minat saya terhadap game Valorant.

Data yang di-scrape pada proyek kali ini adalah statistik para pro player Valorant saat pertandingan VCT Pacific 2023. Data-data ini meliputi nickname dari player, tim player, agents yang dimainkan, total map yang dimainkan, total kills, total deaths, total assists, dan masih banyak lagi. Tak lupa juga, saya mengambil data profil para pro player Valorant seperti nama asli,kewarganegaraan, dan juga tanggal lahir.

Untuk DBMS, saya menggunakan PostgreSQL, alasan utama dibalik pemilihan DBMS ini adalah karena saya familiar dalam menggunakannya. Namun, dibalik itu, PostgreSQL memiliki range fitur yang luas dalam memenuhi kebutuhan dalam memanajemen data, serta sudah mendukung sebagian besar fitur standar SQL dan juga memiliki ekstensi yang memperluas kemampuannya lebih jauh.

### Spesifikasi Program

Untuk spesifikasi program, saya menggunakan Selenium sebagai tools untuk web scraping agar bisa mendapat data yang digunakan, saya menggunakan fungsi driver.get() untuk membaca link source. Kemudian, akan terbuka tab baru pada browser (di proyek ini, saya menggunakan Chrome) dan Selenium akan menjalankan webnya dan mensimulasikan dirinya sebagai seorang user. Lalu, saya mencari data yang diinginkan menggunakan XPATH dari file html. Setelah saya mendapatkan data-data yang diinginkan, tidak lupa saya melakukan pre-processing agar data-data yang sudah discraping menjadi lebih teratur, mudah dibaca, dan outputnya sesuai dengan apa yang saya inginkan. Selanjutnya, dilakukan pemodelan ERD dan saya pun mentransformasikan ERD tersebut ke dalam diagram relasional. Tak lupa, saya menggunakan PowerBI untuk memvisualisasikan data tersebut ke dalam bentuk dashboard untuk mendapatkan insight-insight yang saya perlukan.

### How to Use
1. Download file .sql yang terdapat di Data Storing/export
2. Gunakan tools SQL (pada proyek ini, disarankan menggunakan pgAdmin atau tools yang sudah support special characters)
3. Pada tools tersebut, buatlah sebuah database baru, kemudian buat sebuah table baru
4. Restore file .sql tersebut sesuai dengan tools yang digunakan
5. Untuk visualisasi data, kalian bisa mendownload file .pbix pada folder Dashboard

### JSON Structure
Tersedia pada folder Data Scraping/data

### Database Structure

#### ERD & Relational Model

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Storing/design/designseleksibasdat_18221150.png)

Terdapat 2 entity pada ERD yaitu entity playerinfo dan playerstats,masing masing dari entity ini membentuk relasi info_stats yang bersifat one to one karena tiap player memiliki statistiknya masing-masing. Pada tabel playerinfo, playernickname bertindak sebagai primary key, sedangkan pada tabel playerstats stats_id bertindak sebagai primary key. Selain itu, terdapat derived attribute pada tabel playerinfo yaitu age, karena kolom age bisa diturunkan dari kolom birth.

#### Explanation of ERD to Relational Diagram Translation Process

Karena relasi info_stats bersifat one to one, maka primary key bebas dititipkan ke salah satu entity, karena saya ingin menampilkan statistik dari para pro player, maka saya memilih untuk menitipkan primary key playernickname dari tabel playerinfo ke tabel playerstats. Kemudian terdapat foreign key dari playernickname dari tabel playerstats yang mengarah pada playernickname pada tabel playerinfo.

### Screenshot

#### Data Scraping

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Scraping/screenshot/playerinfoscrape.png)

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Scraping/screenshot/playerinfoscrapefinal.png)

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Scraping/screenshot/playerstatisticscrape.png)


#### Data Storing

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Storing/screenshot/playerinfo.png)

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Storing/screenshot/playerstats.png)

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Data%20Storing/screenshot/view%20playerage.png)

### Dashboard

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Dashboard/PowerBI%20Model.png)

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Dashboard/Dashboard_Screenshot.png)

Berdasarkan dashboard di atas, dapat dilihat total map yang dimainkan oleh tiap tim, representasi negara di pertandingan tersebut, serta data-data seperti player dengan kill terbanyak, assist terbanyak, serta KDA (Kill Death Assists) terbesar. Terdapat pula rata-rata dari ACS/Map,Kills/Map,Deaths/Map, dan Assists/Map. Beberapa insight dapat kita simpulkan dari sini.

#### Insights :
* Sebagian besar pro player Valorant yang bertanding berkewarganegaraan Korea Selatan, diikuti oleh Jepang, dan Filipina.
* Total Map yang dimainkan oleh tiap tim menunjukkan seberapa kuat dan kompetitif tim tersebut, walaupun hal ini tidak terjamin 100%, namun dapat dipastikan Top 3 dari data tersebut telah memasuki tahap Semifinal atau Grand Final.
* Sayaplayer merupakan pemain dengan kill terbanyak dalam semua pertandingan di VCT Pacific 2023.
* MaKo merupakan pemain dengan assists terbanyak dalam semua pertandingan di VCT Pacific 2023, mengindikasikan agent-agent yang MaKo pakai berupa agent dengan tipe support.

![alt text](https://github.com/nixondeflin/TUGAS_SELEKSI_1_18221150/blob/main/Dashboard/a.png)

(Agent Viper,Omen,Brimstone merupakan agent smoker yang berfungsi untuk support teammate lain dengan menutup jalan bagi musuh)
* d4v4i merupakan pemain dengan KDA terbesar di sepanjang pertandingan, mengindikasikan d4v4i memiliki impact yang besar bagi timnya sendiri.
* Rata-rata dari ACS/Map,Kills/Map,Deaths/Map, dan Assists/Map merupakan statistik yang menggambarkan performa atau kontribusi seorang pemain dalam permainan.

### Reference
* https://liquipedia.net/valorant/VCT/2023/Pacific_League/Statistics
* pandas (Preprocessing)
* Selenium (Data Scraping)

### Tools
* Visual Studio Code
* pgAdmin
* PostgreSQL
* Power BI

### Author
Nixon Deflin Kurniawan / 18221150