- Description of the data and DBMS (Why you choose it) <br>
  Saya memilih untuk mengambil data dari kompetisi pertandingan pubg mobile yaitu PMPL South Asia Championship Spring karena saya sendiri menyukai game pubg mobile tersebut dan juga suka mengikuti scene kompetitifnya. Untuk DBMS nya sendiri yang saya pilih adalah DBMS PostgreSQL dengan alasan yang cukup simple yaitu karena matkul terakhir yang berhubungan dengan basis data yaitu Manajemen Basis Data menggunakan DBMS yang sama sehingga masih cukup familiar untuk menggunakannya.
- Specification of the program <br>
  Spesifikasi program yang saya gunakan membutuhkan beberapa library dalam penggunaannya yaitu selenium, requests, pandas, dan matplotlib. Sehingga sebelum menggunakan program kita harus melakukan instalasi terhadap semua library tersebut dengan cara menulis pip install [nama library] pada command prompt. Selain melakukan instalasi library, karena saya juga menggunakan selenium.webdriver.chrome.service maka kita juga harus melakukan instalasi ChromeDriver sebelum membuat dan menjalankan program. ChromeDriver yang diinstall harus sama dan sesuai dengan versi Chrome anda pada web https://sites.google.com/a/chromium.org/chromedriver/ Lalu pindahkan file chromedriver.exe ke direktori yang tepat di komputer Anda. Anda dapat memilih salah satu opsi berikut. Pertama, pindahkan file chromedriver.exe ke direktori Python yang terdaftar di variabel lingkungan PATH. Ini memungkinkan Anda menjalankan ChromeDriver dari mana saja tanpa harus mengubah PATH secara manual. Direktori umum di Windows adalah C:\PythonXX\Scripts (XX adalah versi Python yang Anda gunakan). Kedua, buat direktori baru di dalam proyek Anda dan letakkan file chromedriver.exe di sana. Dalam kasus ini, Anda harus menentukan path ke ChromeDriver dalam kode Python Anda saat menggunakan Selenium.
- How to use <br>
  Tahapan dalam pemakaian program adalah sebagai berikut:
    * Menggunakan selenium untuk mengakses URL https://esports.pubgmobile.com/#/index menggunakan browser Chrome.
    * Mengambil HTML konten halaman menggunakan driver.page_source.
    * Mencetak HTML konten.
    * Menggunakan requests untuk mengirim permintaan GET ke URL https://esports.pubgmobile.com/api/data/getLeagueDay?league_id=117&type=1.
    * Mencetak respons JSON.
    * Menggunakan pandas untuk membaca file CSV dengan nama 'export (1).csv' ke dalam DataFrame.
    * Melakukan pembersihan data dengan menghapus kolom 'Unnamed: 28' dan 'death'.
    * Mencetak DataFrame.
    * Menyimpan DataFrame ke dalam file CSV dengan nama 'pubgdatabase1.csv'.
    * Menggunakan pandas untuk membaca file CSV dengan nama 'pubgdatabase.csv' ke dalam DataFrame.
    * Membuat scatter plot antara kolom 'rank_total' dan 'damage'.
    * Menampilkan plot scatter.
    * Menggunakan pandas untuk membaca file CSV dengan nama 'pubgdatabase1.csv' ke dalam DataFrame.
    * Melakukan pembersihan data dengan menghapus kolom 'Unnamed: 0'.
    * Mencetak DataFrame.
    * Menggunakan pandas untuk membaca file CSV dengan nama 'pubgdatabase1.csv' ke dalam DataFrame.
    * Membuat DataFrame baru dengan kolom yang diinginkan.
    * Menyimpan DataFrame baru ke dalam file CSV dengan nama 'team.csv'.
    * Menggunakan pandas untuk membuat DataFrame baru dengan kolom yang diinginkan.
    * Menyimpan DataFrame baru ke dalam file CSV dengan nama yang sesuai.
- JSON Structure <br>
Berikut adalah sample dari salah satu baris data pada JSON Structure:
    * ```javascript
      {
			"teams_id": 1553,
			"pic": "http://esportsdatacenter-1300342684.cos.ap-singapore.myqcloud.com/F6975F83-B43E-404A-BE22-C1ADD5E86063%20-%20Zeyan%20Shafiq.png20230320152501-4740",
			"damage": 33741,
			"placement": 104,
			"Death": 19,
			"wwcd": 7,
			"assists": 85,
			"useFragGrenadeNum": 268,
			"useSmokeGrenadeNum": 296,
			"rescueTimes": 29,
			"health": 1244,
			"killNumByGrenade": 18,
			"nomp": 24,
			"heal": 14650,
			"total": 259,
			"MovingDistance": 662798,
			"kd": 6.46,
			"kill_num": 155,
			"drive_distance": 465193,
			"air_drop": 2,
			"headshot_num": 27,
			"in_damage": 22737,
			"march_distance": 197605,
			"max_kill_distance": 406,
			"survival_time": 111727,
			"death": 19,
			"name": "Stalwart Esports",
			"rank_total": 1
		},
  Bisa dilihat dari struktur JSON di atas bahwa untuk kolom pic dan juga name akan bertipe string, kolom kd akan bertipe float atau real, dan sisanya akan memiliki tipe integer.
- Database Structure (ERD and relational diagram) <br>
  Berikut adalah tabel ERD dari database:
  ![ERD](https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/a77580c8-ca94-464e-809c-156e892d4c4d)
  Berikut adalah tabel relasional dari database:
  ![Relational](https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/57c5c9e3-4acf-4137-9bdd-c00af8e99cdf)
- Explanation of ERD to relational diagram translation process <br>
  Dapat dilihat dari gambar pada tabel ERD sebelumnya semua hubungan antara tabel satu dengan yang lainnya memiliki hubungan one to one relationship dengan total participation. Alasan saya menarik kesimpulan seperti itu adalah karena data yang saya gunakan sebagian besar berisi angka seperti data statistik sehingga setiap satu data pada suatu tabel pasti hanya memiliki satu pasangan data pada tabel yang lainnya. Selain situ semua data yang tercantum harus dan pasti memiliki pasangannya sehingga saya kategorikan juga semuanya dengan total participation. <br>
  Berdasarkan kepada apa yang sudah dipelajari, jika hubungan antara tabel pada ERD memiliki hubungan one to one relationship, maka untuk mengubahnya ke diagram relasional kita hanya perlu menitipkan salah satu primary key pada satu tabel ke tabel yang lainnya. Dalam hal database pubg ini saya selalu menitipkan primary key dari teams_id ke tabel yang lainnya dengan pertimbangan primary key dari teams_id adalah primary key yang paling penting dan unik sebagai identitasi suatu tim sehingga saya membuat teams_id juga ada di semua tabel lainnya sebagai foreign key.
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README) <br>
  Berikut adalah hasil dari tangkapan layar dari program yang digunakan:
  <img width="509" alt="code1" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/d69b0b73-b65d-4428-87a8-4c4727c3ae9f">
  <img width="505" alt="code 2" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/08f15267-cba5-4bee-9b2c-77406d77d5f3">
  <img width="437" alt="code 3" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/b8d18dfb-8a73-4e88-8f78-3b113ef4c2c3">
  <img width="341" alt="code 4" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/7cb277f5-2e85-4c7c-b4f0-0ec31cb486f6">
  <img width="338" alt="code 5" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/ebd92848-1a10-4b63-9ba6-dd9e7c9f5b20">
  <img width="467" alt="code 6" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/7d04fb02-5d2b-4af7-abb3-363e4c3695b7">
  <img width="409" alt="code 7" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/4582137b-1f3e-4b89-ba29-a4a4d481b472">
  <img width="382" alt="code 8" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/b93f69e4-8a0d-46ec-9f5d-b433d79b10df">
  <img width="401" alt="code 9" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/7821c38d-a48b-484b-ac89-14179be072e3">
  <img width="402" alt="code 10" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/110d5008-24cc-41a9-9ec6-c5193b166ff1">
  <img width="450" alt="code 11" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/291d9725-2dc7-43f4-96fd-68cf4a377973">
  <img width="440" alt="code 12" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/3d471f3c-37e1-4a40-806b-617dfd93b236">
- Reference <br>
  * Selenium: Selenium adalah library yang digunakan untuk mengotomatisasi browser web. Dalam program tersebut, Selenium digunakan untuk membuka halaman web, mengambil konten HTML, dan mengakses elemen-elemen pada halaman web seperti tombol dan formulir.
  * Pandas: Pandas adalah library yang digunakan untuk analisis dan manipulasi data. Pandas menyediakan struktur data yang efisien seperti DataFrame untuk bekerja dengan data tabular. Dalam program tersebut, Pandas digunakan untuk membaca data dari file CSV, melakukan pembersihan data, memilih kolom yang diinginkan, dan menyimpan data ke dalam file CSV.
  * Matplotlib: Matplotlib adalah library visualisasi data yang populer dalam Python. Matplotlib memungkinkan pembuatan berbagai jenis plot dan grafik, termasuk scatter plot yang digunakan dalam program tersebut. Dalam program tersebut, Matplotlib digunakan untuk membuat scatter plot yang memvisualisasikan hubungan antara dua variabel.
  * Requests: Requests adalah library yang digunakan untuk melakukan permintaan HTTP dalam Python. Dalam program tersebut, Requests digunakan untuk mengirim permintaan GET ke URL API dan mengambil respons JSON.
  * Selenium.webdriver.chrome.service: Bagian dari Selenium, modul ini digunakan untuk mengelola layanan ChromeDriver, yang diperlukan untuk mengotomatisasi browser Chrome menggunakan Selenium.
- Bonus <br>
<img width="409" alt="code 7" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/0c048ed0-2533-4baa-94df-cd366ff72901"> <br>
Berdasarkan hasil scatter plot di atas dapat disimpulkan bahwa tim yang memperoleh rank total lebih tinggi cenderung memiliki jumlah damage yang lebih besar untuk dihasilkan dibandingkan dengan tim yang memiliki rank total lebih rendah. <br>
<img width="382" alt="code 8" src="https://github.com/johanchristiansen/Seleksi-2023-Tugas-1/assets/110555249/84db81f7-1801-446f-b1d1-683ede7fe047"> <br>
Berdasarkan hasil scatter plot yang kedua juga dapat disimpulkan bahwa tim yang memperoleh lebih rank total lebih tinggi juga cenderung memiliki jumlah wwcd yang lebih banyak terutama tim yang memperoleh posisi pertama dalam rank total tim tersebut memang layak untuk memenangkan kompetisi yang ada. <br>
- Author <br>
Johan Christiansen 18221088
