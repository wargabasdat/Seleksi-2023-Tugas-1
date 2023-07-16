### Deskripsi Data

Data yang digunakan adalah data pertandingan Champions League tahun 2022-2023. Saya memilih data ini dikarenakan saya menyukai sepak bola dan saya menonton banyak pertandingan Champions League kemarin. Data yang saya gunakan adalah data dari https://fbref.com/en/comps/8/2022-2023/stats/2022-2023-Champions-League-Stats dikarenakan situs ini memiliki data yang lengkap dan dapat dignuakan untuk keperluan tugas ini dengan baik. DBMS yang saya gunakan adalah mysql dikarenakan mysql cukup mudah untuk digunakan dan saya sudah mempelajarinya di kelas Pemodelan Basis Data saat semester 3 kemarin

### Spesifikasi Program
Proses pengerjaan program ini dibagi menjadi beberapa tahap, yang pertama adalah data scraping. Data scraping merupakan proses mengambil data dari suatu website, dalam proses ini saya menggunakan read_html untuk memperoleh data-data dari website yang saya pilih. Tahap berikutnya adalah data preprocessing. Tahap ini adalah proses dimana saya memilih atribut mana saja yang digunakan dari data yang telah diperoleh dan membagi atribut tersebut menjadi beberapa tabel, serta menambahkan beberapa atribut yang diperlukan. Tahap berikutnya adalah data modelling. Pada tahap ini saya mengimplementasikan tabel tersebut ke dalam RDBMS, membuat tabel-tabel serta constraints nya, mengimplementasikan juga primary key serta foreign key pada setiap tabel. Tahap terakhir adalah data storing, dimana saya mencatat data-data yang sudah di preprocess ke dalam tabel-tabel sql.

### How To Use
Untuk menggunakan databasenya, tinggal mendownload file sql yang ada di Data Storing/export/championsleague.sql. Untuk melihat data dan bermain dengan datanya dapat menggunakan DBMS apapun.

### JSON Structure
Record

### Database Structure
##### ER Diagram
![ER](/Data%20Storing/design/ER%20Diagram.png)

Terdapat 4 entity dan 3 relation pada diagram ini. Hubungan antar results dan referee adalah many to one, dan relasi antar results dan stadium adalah one to one.

##### Relational Model
![Relational](/Data%20Storing/design/Relational%20Model.png)

Relational database ini diperoleh dengan mengubah ER diagram menjadi model relasional. Database ini terdiri dari 4 tabel dimana terdapat juga foreign key serta primary keynya

### Proses ERD to Relational Model
Untuk relasi yang one to many, memasukan primary key dari one kedalam tabel many. Hal ini diberlakukan kepada setiap relasi pada ER diagram

### Screenshot
##### Data Scraping'
![ucl_teams](/Data%20Scraping/screenshot/ucl_teams.png)

![ucl_results](/Data%20Scraping/screenshot/ucl_results.png)

##### Data Storing
![Table](/Data%20Storing/screenshot/Tables.png)

![Teams](/Data%20Storing/screenshot/teams.png)

![referee](/Data%20Storing/screenshot/Referee.png)

![stadium](/Data%20Storing/screenshot/stadium.png)

![Result1](/Data%20Storing/screenshot/Results1.png)

![Result2](/Data%20Storing/screenshot/Results2.png)

### Reference (library)
* Data: https://fbref.com/en/comps/8/2022-2023/stats/2022-2023-Champions-League-Stats
* Pandas
* sklearn
* pycountry
* requests
* mysql.connector

### Tools
* Visual Studio Code
* MySQL

### Author
##### 18221061
##### Mario Nicholas Reyhan