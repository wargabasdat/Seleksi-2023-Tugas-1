<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling, Data Visualization & Data Storing
  <br>
  <br>
</h2>

<h3 align="center">
  Fatih Nararya R. I.
</h3>

<h4 align="center">
13521060
</h4>

## Kenapa LeetCode & MariaDB?

Kenapa MariaDB? Karena matkul Basis Data (IF2240) kemarin menggunakan MariaDB. Sesederhana itu.

Kenapa LeetCode? Ada beberapa alasan.

Ketika tugas diumumkan dan disuruh memilih topik, yang pertama kali terpikir adalah LeetCode karena beberapa minggu belakangan banyak pakai situs ini untuk mengasah kemampuan ngoding.

Tentunya menjadi yang pertama terpikir tidak cukup. Ada dua ciri penting yang perlu dipenuhi sebuah topik & sumber data :

1. Mudah melakukan _scraping_
2. Banyak _insight_ dan analisis yang bisa dibuat dari data

Ciri pertama belum menjadi pertimbangan saat itu karena saat itu saya masih belum familiar dengan _data scraping_ dan baru akan mendalaminya setelah topik ditetapkan. (Ciri ini dibahas di [bagian selanjutnya](#apakah-mudah-scraping-leetcode))

Ciri kedua adalah yang membuat LeetCode benar-benar dipakai pada akhirnya. Sebuah _problem_ di LeetCode memiliki selusin atribut sehingga banyak analisis yang bisa dibuat (pada akhirnya terdapat 50 diagram yang dibuat di bagian visualisasi data).

## Lingkup Scraping dan Bagaimana Program Mengeksekusinya

Ada dua _library_ yang digunakan untuk melakukan _scraping_ :

- [`Puppeteer`](https://pptr.dev/) untuk mengambil HTML mentah dari _website_ LeetCode
- [`Cheerio`](https://cheerio.js.org/) untuk melakukan _parsing_ HTML

### Kesulitan Dalam _Scraping_ LeetCode

Ya dan tidak.

_Website_ secara fungsi sebenarnya sangat mendukung _scraping_ karena _problem_ yang ada terhampar begitu saja, siap untuk diambil. Mengganti _page_ pun bisa dilakukan melalui parameter yang ada di URL _website_ sehingga tidak perlu untuk mengklik tombol yang ada di _website_ untuk berganti halaman.

Tetapi, ada dua hambatan utama yang membuat _scraping_ LeetCode menjadi bukan tanpa tantangan.

Pertama, ketika _scraping_ pertama kali dicoba, ditemukan bahwa LeetCode bukan _website_ statis, melainkan menggunakan SSR & _client-side hydration_. Hal ini sebetulnya _obvious_, tetapi implikasinya tidak _obvious_ bagi saya yang baru kenal data _scraping_. Implikasinya adalah halaman yang ingin di-_scrape_ tidak bisa sekadar "ditembak" dengan Axios, karena HTML yang pertama kali diberikan belum "diisi" dengan data (bisa dicoba kunjungi _website_ LeetCode dan waktu pertama kali _loading_ tabel berisi _problem_ pasti baru berisi _skeleton_ saja). Inilah alasan mengapa `Puppeteer` digunakan, karena perlu untuk mensimulasikan sebuah _browser_ yang menunggu _website_ selesai _loading_, barulah HTML diambil (implementasinya dapat dilihat di _file_ `getHTML.js`).

Sebenarnya ini bukan tantangan besar, melainkan merupakan _speed bump_ di awal saja karena begitu _library_ untuk mengambil HTML diubah menggunakan `Puppeteer`, ia langsung menjadi _non-issue_. Tetapi, proses _scraping_ menjadi lebih lama karena adanya _overhead_ dari menjalankan _headless Chromium browser_ (karena menggunakan _library_ tersebut). Hal ini dapat diminimalkan dengan menggunakan _dependency injection_ di fungsi `getHTML` <!-- Tambahin link btw --> sehingga _headless browser_ tidak harus dibuka dan ditutup tiap kali fungsi dijalankan, melainkan cukup sekali di awal dan di akhir proses _scraping_ keseluruhan.

Kedua adalah fakta bahwa sebagian besar halaman LeetCode menggunakan _library_ [`tailwindcss`](https://tailwindcss.com/) untuk _styling_. Ini merupakan hambatan yang sampai akhir proses _scraping_ terus menjadi _pain in the ass_ karena berakibat pada elemen-elemen HTML yang ada tidak memiliki `id` maupun `class` semantik (merepresentasikan fungsi dari elemen tersebut dalam halaman tempat ia berada). Akibatnya adalah saya perlu untuk memutar otak untuk mengambil elemen-elemen HTML di dalam _website_ ini. Contoh-contoh _notable_ dari _approach_ saya diberikan di bawah ini.

### Lingkup _Scraping_ dan Alasannya

Di [bagian sebelumnya](#kesulitan-dalam-scraping-leetcode), disebutkan bahwa fitur dari _website_ ini sedemikian rupa sehingga mudah untuk melakukan _scraping_. Itu benar, untuk lingkup awal dari _scraping_ ini.

Awalnya, ketika saya menuliskan topik di [_sheet_ topik](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit#gid=0), bayangan saya hanyalah melakukan _scraping_ di [halaman utama](https://leetcode.com/problemset/all/?page=1) dan halaman individual (e.g. untuk [_problem_ 1](https://leetcode.com/problems/two-sum/)). Memang benar _website_ ini membuat mereka mudah untuk dilakukan karena semuanya terpampang begitu saja di halaman utama. Tampak seperti sesuatu hal yang mestinya semua _website_ lakukan, tetapi sebenarnya tidak begitu.

Beberapa topik lain di [_sheet_ topik](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit#gid=0) tersebut memiliki _website_ yang tidak memiliki kualitas ini. Contohnya adalah situs _e-commerce_, tidak ada situs _e-commerce_ yang punya halaman berisi semua produk yang mereka jual atau semua penjual yang punya toko di sana. Mereka tersembunyi dibalik halaman topik dan pencarian. UI/UX yang menampilkan produk maupun penjualnya pun tidak seseragam & sesederhana LeetCode yang hanya merupakan sebuah tabel.

Begitu _scraping_ halaman utama selesai, saya iseng berpikir untuk melakukan _scraping_ dari _tags_ yang ada pada halaman utama.

<!-- Tambahkan gambar -->

Ternyata ini mudah untuk dilakukan, malah lebih mudah lagi dari _scraping_ halaman utama karena di halaman untuk setiap _tags_ (e.g. untuk [_Array_](https://leetcode.com/tag/array/)), tidak digunakan _pagination_ seperti di halaman utama dan desain dari _website_-nya cukup tua (menggunakan [`<table>`](https://www.w3schools.com/html/html_tables.asp) dan tidak menggunakan [`tailwindcss`](https://tailwindcss.com/)).

Ketika selesai melakukan _scraping_ halaman individual tiap _problem_ muncullah sebuah ide lain, yaitu _scraping_ solusi dan diskusi yang ada pada tiap _problem_, atau setidaknya salah satu dari ketiga itu. Pada _scraping_ halaman individual yang sudah selesai dilakukan, hanya jumlah dari solusi dan diskusi dalam tiap _problem_ yang dikumpulkan. Tetapi mereka sendiri secara individu tidak.

<!-- Tambahkan foto jumlah solusi, submisi, dan diskusi di halaman utama yang dikumpulkan -->

<!-- Tambahkan foto solusi dan diskusi yang diidekan untuk dikumpulkan -->

Ada alasan teknis, etis, dan _meta_ mengapa hal ini akhirnya tidak dilakukan :

1. _Website_ LeetCode tidak lagi semendukung itu untuk _scraping_ solusi dan diskusi. Hal-hal [berikut]() <!-- Taruh link ke sebuah section di bawah list ini berisi gambar alasan mengapa jadi lambat --> akan membuat proses _scraping_ menjadi jauh lebih lambat dan lebih kompleks.
2. Kebanyakan _problem_ yang ada memiliki, solusi dan diskusi yang jumlahnya dapat mencapai ribuan atau puluh ribuan. _Scraping_ mereka akan makan waktu lama.
3. Solusi dan diskusi sudah menyangkut apa yang dilakukan oleh pengguna. Sebenarnya bisa saja melakukan _scraping_ mereka tanpa melakukan _scraping_ pengguna yang membuat mereka (data pengguna bisa saja di-_mock_), tetapi saya merasa itu "nanggung". Saya pribadi merasa lebih baik _all in or nothing_.
4. Data yang sejauh ini dikumpulkan sudah banyak. Lebih dari cukup untuk dilakukan analisis yang komprehensif. Mengingat poin ke-3 dari penilaian seleksi 1 ini (Kreativitas ide dan inovasi dalam memanfaatkan data yang diperoleh), menurut saya data-data itu tidak perlu dikumpulkan jika pada akhirnya tidak bisa dimanfaatkan dengan baik dalam analisis karena sudah terlalu banyak data (yang seperti disebutkan di alasan kedua, ada banyak sekali diskusi dan solusi).

## Struktur JSON dari Hasil Scraping

Terdapat 3 "jenis" JSON yang dihasilkan. Semuanya berada di dalam folder `Data Visualization/data` <!-- Tambahkan link juga -->.

- `problems.json`
- `tags.json`
- `<X>.json`, `X` _integer_ > 0

### `problems.json`

Semua _problem_ yang ada dalam bentuk _array of objects_ dengan tiap _object_ sebagai representasi _problem_ yang diambil. Terdapat _key_ berikut di dalam tiap _object_ tersebut :

- `number` _problem_ nomor keberapa
- `title` judul atau nama dari _problem_
- `link` link ke halaman individual dari _problem_ ini
- `acceptanceRate` dari semua submisi untuk _problem_ ini berapa persen yang berhasil/diterima?
- `solutionType` jenis solusi yang disediakan dari LeetCode. Ada 3 jenis : `Video` (_self-explanatory_), `ReadUp` (dalam bentuk bacaan), dan `None` (LeetCode tidak menyediakan solusi resmi).
- `difficulty` kesulitan dari _problem_, ada 3 jenis : `Easy`, `Medium`, `Hard`
- `premiumStatus` apakah _problem_ hanya bisa diakses oleh _premium members_?
- `category` kategori dari _problem_

### `tags.json`

Semua _tag_ yang ada dalam bentuk _array of objects_ dengan tiap _object_ sebagai representasi _tag_ yang diambil. Terdapat _key_ berikut di dalam tiap _object_ tersebut :

- `name` nama dari _tag_ tersebut
- `link` link ke _tag_ tersebut
- `problems` _array_ berisi nomor-nomor _problem_ yang termasuk dalam _tag_ tersebut
- `numberOfProblems` banyaknya _problem_ yang ada di dalam _tag_ tersebut

Perlu diingat bahwa _tag_ dan _problem_ punya _many-to-many_ _relationships_, sehingga jumlah _numberOfProblem_ dari semua _tag_ yang ada tidak sama dengan jumlah _problem_ yang ada.

### `<X>.json`

Representasi lebih dalam dari setiap _problem_ yang ada dengan `X` adalah nomor dari _problem_ yang direprentasikannya. Berbeda dengan dua tipe JSON sebelumnya, ia berada di dalam folder `problemsExtended`. Ada dua alasan kenapa dipisahkan tiap _problem_-nya dan tidak digabung seperti `problems.json`:

- Kegagalan _scraping_ satu _problem_ tidak menggagalkan _scraping_ semua _problem_ (telah dijelaskan di [bagian sebelumnya](#lingkup-scraping-dan-bagaimana-program-mengeksekusinya))
- Data yang disimpan untuk tiap _problem_ cukup banyak

Tiap _file_ memiliki _key_ berikut:

- `content` isi dari _problem_. Merupakan HTML mentah yang dikonversi ke `string`.
- `numberOfLikes` jumlah _like_
- `numberOfDislikes` jumlah _dislike_
- `numberOfSubmission` jumlah submisi atau _attempt_ terhadap _problem_
- `numberOfAcceptedSubmission` jumlah submisi yang berhasil menyelesaikan _problem_
- `numberOfDiscussion` jumlah _thread_ diskusi pada _problem_
- `numberOfSolutions` jumlah solusi untuk _problem_ tersebut yang diposting oleh pengguna

## Cara Menggunakan (_web scraping_)

**Disclaimer : Program ini dikembangkan dan dijalankan pada Linux Fedora 39 dan belum diuji di OS lain. Jika ada kendala dalam menjalankan program ini pada OS lain, _kindly get in touch_ agar dapat di-_troubleshoot_**

1. Pasang [NodeJS](https://nodejs.org/en) di komputer yang digunakan menggunakan [tutorial berikut](https://nodejs.dev/en/learn/how-to-install-nodejs/).
2. Ubah _working directory_ ke folder `Data Scraping/src`
3. Jalankan `npm install`
4. Jalankan `npm run scrape` untuk memulai _scraping_ semua data
5. Tunggu ~ 3 jam
6. Semua data hasil _scraping_ dapat ditemukan di folder `Data Scraping/data`

Untuk menjalankan bagian-bagian terpisah dari program, dipersilakan untuk _tinker_ dengan `testBed.js` sesuai dengan kebutuhan, lalu jalankan `npm run test`.

## Desain dari Basis Data

![ER Model](/Data%20Storing/design/ER%20Model.png)

<p align="center">
  <em>E-R Model</em>
</p>

Struktur dari entitas `Tag` dan `Problem` cukup _self-explanatory_ setelah melihat halaman target dari _scraping_. Nama dari tiap `Tag` serta nomor dari tiap `Problem` adalah unik karena tidak mungkin bisa sama. Kemudian dari melihat halaman individual setiap _tags_ di LeetCode (e.g. untuk [_Array_](https://leetcode.com/tag/array/)), didapatkan bahwa sebuah `Problem` dapat memiliki beberapa jenis `Tags` sehingga relasi `Has` antara keduanya bersifat _many-to-many_.

`Problem` memiliki banyak sekali atribut. Berikut penjelasan untuk setiapnya selain `number` :

1. `title` judul dari _problem_
2. `solution_type`solusi yang disediakan LeetCode untuk _problem_
3. `difficulty` kesulitan yang diberikan LeetCode untuk _problem_
4. `premium_status` apakah _problem_ hanya dapat diakses oleh pengguna premium?
5. `category` kategori yang diberikan untuk _problem_ oleh LeetCode
6. `content` isi dari _problem_
7. `acceptance_rate` berapa persen _submission_ untuk _problem_ yang diterima?
8. `number_of_likes` berapa jumlah _like_ yang dimiliki oleh _problem_
9. `number_of_dislikes` berapa jumlah _dislike_ yang dimiliki oleh _problem_
10. `number_of_accepted_submission` berapa jumlah _submission_ untuk _problem_ yang diterima
11. `number_of_submission` berapa jumlah _submission_ untuk _problem_
12. `number_of_discussion` berapa jumlah _thread_ diskusi untuk _problem_
13. `number_of_solution` berapa jumlah solusi yang di-_submit_ oleh pengguna untuk _problem_

Berikut pula gambar pembantu untuk menunjukkan dari bagian mana _website_ tiap atribut di atas didapatkan.

<p align="center">
  <em>Halaman utama</em>
</p>

<p align="center">
  <em>Halaman individual tiap <strong>problem</strong></em>
</p>

Yang tidak _obvious_ di sini adalah mengapa entitas `Submission`, `Solution`, `Discussion`, dan `Account` tampak sangat minim. Tentu saja mereka sebenarnya punya jauh lebih banyak atribut. Tetapi tidak digambarkan di sini karena pada akhirnya mereka tidak akan diisi sebab sudah di luar lingkup _scraping_, seperti yang telah dijelaskan di [bagian sebelumnya](#lingkup-scraping-dan-alasannya). Eksistensi mereka di sini cukup sebatas menggambarkan hubungan mereka dengan tokoh utama, `Problem`.

Elaborasi lain yang diperlukan adalah tentang relasi `LikeOrDislike`. Relasi ini memiliki atribut `Like` yang pada implementasi relasionalnya (_spoilers!_) akan menjadi tipe `boolean` untuk mereprentasikan apakah `Account` memberikan _like_ atau _dislike_ untuk sebuah `Problem`. _Like_ dan _dislike_ digabung karena sebuah `Account` tidak bisa secara bersamaan memberi _Like_ dan _dislike_ untuk sebuah `Problem`.

![Relational Model](/Data%20Storing/design/Relational%20Model.png)

<p align="center">
  <em>Relational Model</em>
</p>

Relasi `Has` yang bersifat _many-to-many_ antara entitas `Problem` dan `Tag` diubah menjadi sebuah tabel baru berisi atribut yang me-_refer_ ke tabel `problem` dan `tag`. Kemudian relasi pada entitas `Solution`, `Discussion`, dan `Submission` (yaitu dua relasi _one-to-many_ dengan mereka sebagai pihak _one_ sementara entitas `Account` dan entitas `Problem` sebagai pihak _many_) diubah menjadi tabel `discussion`, `solution`, dan `submission` "memegang" _primary key_ dari tabel `problem` dan `account`, _respoectively_. Keputusan desain dalam paragraf ini mengikuti _verbatim_ ~~sabda Bu Fazat~~ instruksi yang ada di materi kuliah IF2240 tentang translasi model E-R ke relasional.

## _Trigger_ dan _Procedure_ yang Batal Diimplementasikan

Awalnya, trdapat banyak. Tetapi

## Data Visualization

[Kunjungi _link_ ini dengan _desktop_](https://leet-code-insight.vercel.app/)

### Data Scraping

1. Lakukan _data scraping_ dari sebuah laman web untuk memperoleh data atau informasi tertentu **TANPA MENGGUNAKAN API**. Hasil _data scraping_ ini nantinya akan disimpan dalam RDBMS.

2. Daftarkan judul topik yang akan dijadikan bahan _data scraping_ dan DBMS yang akan digunakan pada spreadsheet berikut: [Topik Data Scraping](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit?usp=sharing). Usahakan agar tidak ada peserta dengan topik yang sama. Akses edit ke spreadsheet akan ditutup tanggal **1 Juli 2023 pukul 21.40 WIB.**

3. Pada folder `Data Scraping`, calon warga basdat harus mengumpulkan _file script_, json hasil _data scraping_. Folder `Data Scraping` terdiri dari _folder_ `src`, `data` dan `screenshots`.

   - _Folder_ `src` berisi _file script_/kode yang **_WELL DOCUMENTED_ dan _CLEAN CODE_**.
   - _Folder_ `data` berisi _file_ json hasil _scraper_.
   - _Folder_ `screenshot` berisi tangkapan layar program.

4. Sebagai referensi untuk mengenal _data scraping_, asisten menyediakan dokumen "_Short Guidance To Data Scraping_" yang dapat diakses pada link berikut: [Data Scraping Guidance](https://docs.google.com/document/d/1vEyAK1HIkM792oIuwR4Li2xOodmAcCXxentCCivxxkw/edit?usp=sharing). Peserta diharapkan untuk memperhatikan etika dalam melakukan _scraping_.

5. Data yang diperoleh harus di-_preprocessing_ terlebih dahulu.

```
Preprocessing contohnya :
- Cleaning
- Parsing
- Transformation
- dan lainnya
```

### Database Modelling & Data Storing

1. Dari data _scraping_ yang sudah dilakukan, lakukan **pengembangan _database_** dalam bentuk ERD kemudian **translasi ERD tersebut menjadi diagram relasional.** Tambahkan tabel lain yang sekiranya berkaitan dengan tabel-tabel yang didapatkan dari _data scraping_ yang dilakukan.
2. Implementasikan skema relational diagram tersebut ke **RDBMS** sesuai pilihan peserta. **DBMS No-SQL tidak akan diterima.** Jangan lupa implementasikan _constraints (primary key, foreign key,_ dsb) pada _database_ yang dibuat.

3. Masukkan data hasil _scraping_ ke dalam RDBMS yang sudah dibuat. Tambahan tabel pada skema yang dibuat tidak perlu diisi dengan data _dummy_ (cukup dibiarkan kosong).

4. Tools yang digunakan **dibebaskan** pada peserta.

5. Pada folder `Data Storing`, Calon warga basdat harus mengumpulkan bukti penyimpanan data pada DBMS. _Folder_ `Data Storing` terdiri dari folder `screenshots`, `export`, dan `design`.
   - _Folder_ `screenshot` berisi tangkapan layar bukti dari penyimpanan data ke RDBMS.
   - _Folder_ `export` berisi _file_ hasil _export_ dari DBMS dengan format `.sql`.
   - _Folder_ `design` berisi ER Diagram dan diagram relasional yang disimpan dalam format `.png`

### Bonus

Task berikut bersifat tidak wajib (**BONUS**), boleh dikerjakan sebagian atau seluruhnya.

- Buatlah visualisasi data dalam bentuk _dashboard_ (dari data hasil _scraping_ saja) dan jelaskan apa _insights_ yang didapatkan dari visualisasi data tersebut. _Tools_ untuk melakukan visualisasi data ini dibebaskan pada peserta.

### Pengumpulan

1. Dalam mengerjakan tugas, calon warga basdat terlebih dahulu melakukan _fork_ project github pada link berikut: [Seleksi-2023-Tugas-1](https://github.com/wargabasdat/Seleksi-2023-Tugas-1). Sebelum batas waktu pengumpulan berakhir, calon warga basdat harus sudah melakukan _pull request_ dengan nama `TUGAS_SELEKSI_1_[NIM]`

2. Tambahkan juga `.gitignore` pada _file_ atau _folder_ yang tidak perlu di-_upload_. **NB: BINARY TIDAK DIUPLOAD**

3. Berikan satu buah file `README` yang **WELL DOCUMENTED** dengan cara **override** _file_ `README.md` ini. `README` harus minimal memuat konten :

```
- Description of the data and DBMS (Why you choose it)
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author
```

4. Deadline pengumpulan tugas 1 adalah <span style="color:red">**17 Juli 2023 Pukul 22.40 WIB**</span>

<h3 align="center">
  <br>
  Selamat Mengerjakan!
  <br>
</h3>

<p align="center">
  <i>
  Happiness does not come from doing easy work
  but from the afterglow of satisfaction that
  comes after the achievement of a difficult
  task that demanded our best.<br><br>
  - Theodore Isaac Rubin
  </i>
</p>
<br>

Note To Self. Remove `.git/hooks/pre-push` to enable pushing to remote.
