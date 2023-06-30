### Deskripsi Data
<p style="text-align: justify;">
Dalam proyek ini, saya tertarik untuk menganalisis performa tim sepak bola Real Madrid di musim 2022-2023. Untuk melakukannya, saya menggunakan data yang diambil dari website fbref.com/en/squads/53a2f082/Real-Madrid-Stats. Saya memilih situs ini karena menyediakan berbagai tabel statistik yang relevan, termasuk data pemain, pertandingan, catatan gol, dan gaji pemain. Dengan melakukan proses web scraping, preprocessing datanya, serta pemodelan data, saya pun berhasil membuat database relational tentang Real Madrid. Saya ingin melihat gambaran yang lebih lengkap tentang performa Real Madrid di musim lalu dan mungkin menemukan insight menarik dari pemain-pemainnya. Proyek ini tidak hanya memadukan minat pribadi saya dalam sepak bola, tetapi juga keterampilan Basis Data yang telah saya pelajari. </p>


### Spesifikasi Program
<p style="text-align: justify;">
Terdapat 4 proses yang dilakukan dalam mengerjakan proyek ini. Pertama, saya harus melakukan web scraping untuk mendapatkan data yang dibutuhkan. Caranya saya cukup menggunakan fungsi Request beserta read_html untuk membaca tabel tersebut. Setelah itu, datanya harus saya preprocess sehingga datanya dapat lebih mudah untuk dianalisis. Selanjutnya, saya perlu melakukan pemodelan dengan denormalisasi dan normalisasi data tersebut ke berbagai tabel sesuai dengan design relation model. Terakhir, saya perlu visualisasikan data tersebut dalam bentuk dashboard. Visualisasi tersebut saya menggunakan tools Power BI karena tool ini dapat dengan mudah mengintegrasikan data source SQL. Dengan tool ini, kita hanya perlu melakukan drag and drop atribut yang ingin divisualisikan tanpa melakukan join antar tabel, hal ini disebabkan kita sudah melakukan pemodelan dengan menghubungkan Foreign Key dengan Primary Key ke setial tabel.</p>

### How to use
Untuk menggunakan database yang sudah dibuat, anda bisa mendownload file .sql di Data Storing/export. Setelah itu bisa gunakan tools sql favorit anda (kalau saya menggunakan MySQL), dengan menulis mysql -u root -p (database_anda) < realmadrid.sql. Anda juga bisa melihat dashboard Power BI yang saya sudah buat dengan mendownload file tersebut di folder Dashboard. Setelah itu, anda bisa melakukan eksplorasi tentang data statistik Real Madrid di tahun 2022-2023.

### Json Structure
Record

### Database Structure
#### ER Diagram
![Alt Text](Data%20Storing/design/ER%20Diagram.png)
#### Relational Model
![Alt Text](Data%20Storing/design/Relational%20Model.png)
<p style="text-align: justify;">
Pada ER Diagram terdapat 9 entity, dengan 8 strong entity dan 1 weak entity (match_goal_logs). Entity match_goal_logs dapat dikatakan weak entity karena bergantung pada entity matches untuk membuat tiap rownya unik. Entity ini bergantung pada primary key matches (MatchID), serta diskriminator GoalOrder untuk mendefinisikan tiap row unik. Selain itu, terdapat juga specialization pada entity player_basic menjadi player_performance dan goalkeeper_performance secara disjoint. Cara spesialisasinya berada pada atribut Position, apabila Position 'GK' maka akan ke goalkeeper_performance, selain itu akan ke player_performance.  Terdapat juga composite attribute (Address), serta derived attribute (GoalAssist). Derived attribute tersebut didapat dari penjumlah atribut Goals dan Assist. Terakhir, saya juga perlu menentukan hubungan antar entity seperti apakah total participation/partial participation serta one/many relationship. Sebagai contohnya hubungan antara matches dan stadium, sudah jelas bahwa setiap matches pasti terdapat 1 stadium (total participation dan many to one), serta setiap stadium pasti dipakai oleh beberapa matches(partial participation dan many to many). 
Pada Relational Model, semua reational juga sudah termasuk pada form BCNF kecuali relation stadium. Relation BCNF merupakan relation yang semua non primary keynya bergantung penuh ke primary key. Hal ini yang tidak dimiliki relation stadium karena atribut Country bergantung pada City yang bukan merupakan primary key.
</p>

### ERD to Relational Model
<p style="text-align: justify;">
Terdapat hal hal yang menarik saat mengubah dari ER Diagram ke Relation Model. Untuk entity yang terdapat specialization, saya memutuskan untuk menggunakan method 1 karena saya tidak mau agar atribut basic seperti Nation, Age, dan Position menjadi redundant. Walaupun dengan memilih method ini, saya jadinya harus mengakses 2 relasi untuk mendapat data tersebut. Selain itu, pada weak entity juga saya harus menambahkan primary key matches yaitu MatchID. Dengan begini, relation ini dapat terjaga keunikannya. Terakhir, saya juga perlu menghubungkan antara foreign key dan primary key yang sesuai. 
</p>

### Screenshot
#### Data Scraping 
![Alt Text](Data%20Scraping/screenshot/goal_log.png)
![Alt Text](Data%20Scraping/screenshot/goalkeeper_performance.png)
![Alt Text](Data%20Scraping/screenshot/madrid_fixtures.png)
![Alt Text](Data%20Scraping/screenshot/player_performance.png)
![Alt Text](Data%20Scraping/screenshot/wages.png)
#### Data Storing
![Alt Text](Data%20Storing/screenshot/all%20tables.png)
![Alt Text](Data%20Storing/screenshot/goalkeeper_performance.png)
![Alt Text](Data%20Storing/screenshot/match_goal_logs.png)
![Alt Text](Data%20Storing/screenshot/matches.png)
![Alt Text](Data%20Storing/screenshot/player_basic.png)
![Alt Text](Data%20Storing/screenshot/player_performance.png)
![Alt Text](Data%20Storing/screenshot/player_playingtime.png)
![Alt Text](Data%20Storing/screenshot/player_wage.png)

### Reference
Saya mengambil data dari website fbref.com/en/squads/53a2f082/Real-Madrid-Stats. Selain itu juga saya menggunakan beberapa libary seperti :
- pandas untuk preprocessing menggunakan dataframe
- sklearn untuk mengkodekan RefereeID menggunakan OrdinalLabel
- PIL untuk menampilkan gambar
- pycountry untuk mengubah kode negara ke nama negara
- re untuk menggunakan regular expression
- mysql.connector untuk store data ke mysql table
  
Tools
- Jupyter Notebook
- MySQL
- Power BI

### Dashboard
#### Model in Power BI
![Alt Text](Dashboard/Model%20PowerBI.png)

https://github.com/DamianMarvel7/TUGAS_SELEKSI_1_18221164/assets/110451781/5f8e3146-2bde-4e51-9f92-fafcf9cdfc6a



### Author
Damian Marvel/ 18221164
