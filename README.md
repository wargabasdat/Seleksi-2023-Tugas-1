<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
</h1>

<h2 align="center">
  <br>
  Fatih Nararya R. I.
  <br>
</h2>

<h3 align="center">
13521060
</h3>

## Kenapa LeetCode & MariaDB?

Kenapa MariaDB? Karena matkul Basis Data (IF2240) kemarin menggunakan MariaDB sehingga saya sudah _somewhat_ familiar dengan DBMS tersebut.

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

Detil bagaimana cara program melakukan _scraping_ dapat dibaca langsung pada _source code_ di `Data Scraping/src`. Kode yang ada telah ditulis dengan rapi dan diberikan komentar. Semua fungsi bantuan yang dibuat diberikan anotasi JSDoc.

### Apakah Sulit _Scraping_ LeetCode?

Ya dan tidak.

LeetCode secara fungsi sebenarnya sangat mendukung _scraping_ karena _problem_ yang ada terhampar begitu saja, siap untuk diambil. Mengganti _page_ pun bisa dilakukan melalui parameter yang ada di URL _website_ sehingga tidak perlu untuk mengklik tombol yang ada di _website_ untuk berganti halaman.

Tetapi, ada dua hambatan utama yang membuat _scraping_ LeetCode menjadi bukan tanpa tantangan.

Pertama, ketika _scraping_ pertama kali dicoba, ditemukan bahwa LeetCode bukan _website_ statis, melainkan menggunakan SSR & _client-side hydration_. Hal ini sebetulnya _obvious_, tetapi implikasinya tidak _obvious_ bagi saya yang baru kenal data _scraping_. Implikasinya adalah halaman yang ingin di-_scrape_ tidak bisa sekadar "ditembak" dengan Axios, karena HTML yang pertama kali diberikan belum "diisi" dengan data (bisa dicoba kunjungi _website_ LeetCode dan waktu pertama kali _loading_ tabel berisi _problem_ pasti baru berisi _skeleton_ saja). Inilah alasan mengapa `Puppeteer` digunakan, karena perlu untuk mensimulasikan sebuah _browser_ yang menunggu _website_ selesai _loading_, barulah HTML diambil (implementasinya dapat dilihat di _file_ `getHTML.js`).

Sebenarnya ini bukan tantangan besar, melainkan merupakan _speed bump_ di awal saja karena begitu _library_ untuk mengambil HTML diubah menggunakan `Puppeteer`, ia langsung menjadi _non-issue_. Tetapi, proses _scraping_ menjadi lebih lama karena adanya _overhead_ dari menjalankan _headless Chromium browser_ (karena menggunakan _library_ tersebut). Hal ini dapat diminimalkan dengan menggunakan _dependency injection_ di fungsi
[`getHTML`](/Data%20Scraping/src/utilities/getHTML.js) sehingga _headless browser_ tidak harus dibuka dan ditutup tiap kali fungsi dijalankan, melainkan cukup sekali di awal dan di akhir proses _scraping_ keseluruhan.

Kedua adalah fakta bahwa sebagian besar halaman LeetCode menggunakan _library_ [`tailwindcss`](https://tailwindcss.com/) untuk _styling_. Ini merupakan hambatan yang sampai akhir proses _scraping_ terus menjadi _pain in the ass_ karena berakibat pada elemen-elemen HTML yang ada tidak memiliki `id` maupun `class` semantik yang merepresentasikan fungsi dari elemen tersebut dalam halaman tempat ia berada. Akibatnya adalah saya perlu untuk memutar otak untuk mengambil elemen-elemen HTML di dalam _website_ ini. Contoh-contoh _notable_ dari _approach_ saya diberikan di bawah ini.

![Bruh](/Data%20Scraping/screenshot/Select%20Sample/2.png)

<p align="center">
  Cucu cucu anak
</p>

![Bruh](/Data%20Scraping/screenshot/Select%20Sample/1.png)

<p align="center">
  Menggunakan <em>path</em> SVG sebagai selektor & kakek kakek cucu anak 
</p>

### Lingkup _Scraping_ dan Alasannya

Di [bagian sebelumnya](#kesulitan-dalam-scraping-leetcode), disebutkan bahwa fitur dari _website_ ini sedemikian rupa sehingga mudah untuk melakukan _scraping_. Itu benar, untuk lingkup awal dari _scraping_ ini.

Awalnya, ketika saya menuliskan topik di [_sheet_ topik](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit#gid=0), bayangan saya hanyalah melakukan _scraping_ di [halaman utama](https://leetcode.com/problemset/all/?page=1) dan halaman individual (e.g. untuk [_problem_ 1](https://leetcode.com/problems/two-sum/)). Memang benar _website_ ini membuat mereka mudah untuk dilakukan karena semua _problem_ yang ada terpampang begitu saja di halaman utama. Tampak seperti sesuatu hal yang mestinya semua _website_ lakukan, tetapi sebenarnya tidak begitu.

Beberapa topik lain di [_sheet_ topik](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit#gid=0) tersebut memiliki _website_ yang tidak memiliki kualitas ini. Contohnya adalah situs _e-commerce_, tidak ada situs _e-commerce_ yang punya halaman berisi semua produk yang mereka jual atau semua penjual yang punya toko di sana. Mereka tersembunyi dibalik halaman topik dan pencarian. UI/UX yang menampilkan produk maupun penjualnya pun tidak seseragam & sesederhana LeetCode yang hanya merupakan sebuah tabel.

Begitu _scraping_ halaman utama selesai, saya iseng berpikir untuk melakukan _scraping_ dari _tags_ yang ada pada halaman utama.

![Tags dari problem di LeetCode](/Data%20Scraping/screenshot/Tags.png)

<p align="center">
  <em>Tags</em> dari <em>problem</em> LeetCode
</p>

Ternyata ini mudah untuk dilakukan, malah lebih mudah lagi dari _scraping_ halaman utama karena di halaman untuk setiap _tags_ (e.g. untuk [_Array_](https://leetcode.com/tag/array/)), tidak digunakan _pagination_ seperti di halaman utama dan desain dari _website_-nya cukup tua (menggunakan [`<table>`](https://www.w3schools.com/html/html_tables.asp) dan tidak menggunakan [`tailwindcss`](https://tailwindcss.com/)) sehingga tidak perlu menggunakan tiga tingkat cucu seperti _screenshot_ sebelumnya.

Ketika selesai melakukan _scraping_ halaman individual tiap _problem_ muncullah sebuah ide lain, yaitu _scraping_ solusi dan diskusi yang ada pada tiap _problem_, atau setidaknya salah satu dari ketiga itu. Pada _scraping_ halaman individual yang sudah selesai dilakukan, hanya jumlah dari solusi dan diskusi dalam tiap _problem_ yang dikumpulkan. Tetapi mereka sendiri secara individu tidak.

![Solusi](/Data%20Scraping/screenshot/Solution.png)

<p align="center">
  Solusi
</p>

![Diskusi](/Data%20Scraping/screenshot/Discussion.png)

<p align="center">
  Diskusi
</p>

Ada alasan teknis, etis, dan _meta_ mengapa hal ini akhirnya tidak dilakukan :

1. _Website_ LeetCode tidak lagi semendukung itu untuk _scraping_ solusi dan diskusi. [Hal-hal berikut](#penghambat-teknis-scraping-diskusi-dan-solusi) akan membuat proses _scraping_ menjadi jauh lebih lambat dan lebih kompleks.
2. Kebanyakan _problem_ yang ada memiliki solusi dan diskusi yang jumlahnya dapat mencapai ribuan atau puluh ribuan. _Scraping_ mereka akan makan waktu lama.
3. Solusi dan diskusi sudah menyangkut apa yang dilakukan oleh pengguna. Rasanya tidak etis melakukan _scraping_ aktivitas pengguna di LeetCode.
4. Data yang sejauh ini dikumpulkan sudah banyak, lebih dari cukup untuk dilakukan analisis yang komprehensif. Sehingga saya takut tidak dapat memanfaatkan secara optimal banyaknya data analisis dan solusi yang ada.

#### Penghambat Teknis dari _Scraping_ Diskusi dan Solusi

![Discussion Hardness](/Data%20Scraping/screenshot/Solution-Video.gif)

<p align="center">
  Perlu untuk <em>scroll</em> terus menerus sampai bawah untuk mendapatkan semua diskusi. Dalam proses <em>scrolling</em> tersebut juga harus menunggu <em>loading</em> tiap selusin diskusi yang di-<em>scroll</em>.
</p>

![Solution Pagination](/Data%20Scraping/screenshot/Solution_Pagination.png)

<p align="center">
  Solusi menggunakan paginasi yang nilainya tidak terhubung dengan <em>search params</em> di alamat <em>website</em> sehingga <em>scraping</em> perlu untuk menekan tombol <em>next page</em> untuk tiap <em>page</em> yang ada.
</p>

### Foto Keberjalanan _Scraping_

![Program Running](/Data%20Scraping/screenshot/Program%20Running/All%20Problems/1.png)
![Program Running](/Data%20Scraping/screenshot/Program%20Running/All%20Problems/2.png)
![Program Running](/Data%20Scraping/screenshot/Program%20Running/All%20Problems/3.png)
![Program Running](/Data%20Scraping/screenshot/Program%20Running/Each%20Problems/1.png)
![Program Running](/Data%20Scraping/screenshot/Program%20Running/Each%20Problems/2.png)

<p align="center">
  <em>Browser</em> Chromium yang dijalankan 
  <code>
  Puppeteer
  </code>
  untuk mendapatkan halaman individual <em>problem</em>
</p>

![Program Running](/Data%20Scraping/screenshot/Program%20Running/Tags/1.png)

## Struktur JSON dari Hasil Scraping

Terdapat 3 "jenis" JSON yang dihasilkan. Semuanya berada di dalam folder [`Data Visualization/data`](/Data%20Scraping/data/)

- [`problems.json`](/Data%20Scraping/data/problems.json)
- [`tags.json`](/Data%20Scraping/data/tags.json)
- [`<X>.json`](/Data%20Scraping/data/problemsExtended/1.json), `X` _integer_ > 0

### `problems.json`

Semua _problem_ yang ada dalam bentuk _array of objects_ dengan tiap _object_ sebagai representasi _problem_ yang diambil. Terdapat _key_ berikut di dalam tiap _object_ tersebut beserta deskripsi maknanya :

1. `number` _problem_ nomor keberapa
2. `title` judul atau nama dari _problem_
3. `acceptanceRate` dari semua submisi untuk _problem_ ini berapa persen yang berhasil/diterima?
4. `solutionType` jenis solusi yang disediakan dari LeetCode. Ada 3 jenis : `Video` (_self-explanatory_), `ReadUp` (dalam bentuk bacaan), dan `None` (LeetCode tidak menyediakan solusi resmi).
5. `difficulty` kesulitan dari _problem_, ada 3 jenis : `Easy`, `Medium`, `Hard`
6. `premiumStatus` apakah _problem_ hanya bisa diakses oleh _premium members_?
7. `category` kategori dari _problem_
8. `link` link ke halaman individual dari _problem_ ini

_Key_ 1-6 didapatkan dari mana ditampilkan pada gambar di bawah.
![1-6 key sources](/Data%20Scraping/screenshot/Problem%20Main%20Page.png)

_Key_ 7 didapatkan dari mengunjungi tiap halaman kategori yang ada dan mengecek seluruh _page_ dari kategori tersebut ada _problem_ apa saja.

![Kategori](/Data%20Scraping/screenshot/Category.png)

<p align="center">
  <em>Database</em>, salah satu kategori yang ada.
</p>

_Key_ 8 didapatkan dari mengambil `href` di elemen `a` pada baris di tabel berisi seluruh _problem_.

### `tags.json`

Semua _tag_ yang ada dalam bentuk _array of objects_ dengan tiap _object_ sebagai representasi _tag_ yang diambil. Terdapat _key_ berikut di dalam tiap _object_ tersebut :

- `name` nama dari _tag_ tersebut
- `link` link ke _tag_ tersebut
- `problems` _array_ berisi nomor-nomor _problem_ yang termasuk dalam _tag_ tersebut
- `numberOfProblems` banyaknya _problem_ yang ada di dalam _tag_ tersebut

Perlu diingat bahwa _tag_ dan _problem_ punya _many-to-many_ _relationships_, sehingga jumlah _numberOfProblem_ dari semua _tag_ yang ada tidak sama dengan jumlah _problem_ yang ada.

### `<X>.json`

Representasi lebih dalam dari setiap _problem_ yang ada dengan `X` adalah nomor dari _problem_ yang direprentasikannya. Berbeda dengan dua tipe JSON sebelumnya, ia berada di dalam folder `problemsExtended`. Ada dua alasan kenapa dipisahkan tiap _problem_-nya dan tidak digabung seperti `problems.json`:

- Supaya kegagalan _scraping_ satu _problem_ tidak menggagalkan _scraping_ semua _problem_ (telah dijelaskan di [bagian sebelumnya](#lingkup-scraping-dan-bagaimana-program-mengeksekusinya))
- Data yang disimpan untuk tiap _problem_ cukup banyak

Tiap _file_ ini memiliki _key_ berikut :

1. `content` isi dari _problem_. Merupakan HTML mentah yang dikonversi ke `string`.
2. `numberOfLikes` jumlah _like_
3. `numberOfDislikes` jumlah _dislike_
4. `numberOfSolutions` jumlah solusi untuk _problem_ tersebut yang diposting oleh pengguna
5. `numberOfAcceptedSubmission` jumlah submisi yang berhasil menyelesaikan _problem_
6. `numberOfSubmission` jumlah submisi atau _attempt_ terhadap _problem_
7. `numberOfDiscussion` jumlah _thread_ diskusi pada _problem_

_Key_ 1-7 didapatkan dari mana ditampilkan pada gambar di bawah.
![1-7 key sources](/Data%20Scraping/screenshot/Problem%20Individual.png)

## Cara Menggunakan _Scraping_

**Disclaimer : Program ini dikembangkan dan dijalankan pada Linux Fedora 39 dan belum diuji di OS lain. Jika ada kendala dalam menjalankan program ini pada OS lain, _please get in touch_ agar dapat di-_troubleshoot_** 😊

1. Pasang [NodeJS](https://nodejs.org/en) di komputer yang digunakan menggunakan [tutorial berikut](https://nodejs.dev/en/learn/how-to-install-nodejs/).
2. Ubah _working directory_ ke folder `Data Scraping/src`
3. Jalankan `npm install` untuk memasang _library-library_ yang dibutuhkan
4. Jalankan `npm run scrape` untuk memulai _scraping_ semua data
5. Tunggu ~ 3 jam
6. Semua data hasil _scraping_ dapat ditemukan di folder `Data Scraping/data`

Untuk menjalankan bagian-bagian terpisah dari program, dipersilakan untuk _tinker_ dengan [`testBed.js`](/Data%20Scraping/src/testBed.js) sesuai dengan kebutuhan, lalu jalankan `npm run test`.

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

Dari mana atribut-atribut ini didapatkan dapat dicek di [bagian sebelumnya](#struktur-json-dari-hasil-scraping).

Yang tidak _obvious_ di sini adalah mengapa entitas `Submission`, `Solution`, `Discussion`, dan `Account` tampak sangat minim. Tentu saja mereka sebenarnya punya jauh lebih banyak atribut. Tetapi tidak digambarkan di sini karena pada akhirnya mereka tidak akan diisi sebab sudah di luar lingkup _scraping_, seperti yang telah dijelaskan di [bagian sebelumnya](#lingkup-scraping-dan-alasannya). Eksistensi mereka di sini cukup sebatas menggambarkan hubungan mereka dengan tokoh utama yaitu `Problem`. Sebenarnya juga ada banyak entitas lain yang bisa dibuat karena di LeetCode, solusi dan diskusi yang ada dapat memiliki komentar dan _likes_, tetapi karena entitas `Solution` dan `Discussion` sendiri juga hanyalah _mock table_, tidak dikembangkan entitas baru lagi dari mereka.

Elaborasi lain yang diperlukan adalah tentang relasi `LikeOrDislike`. Relasi ini memiliki atribut `Like` yang pada implementasi relasionalnya (_spoilers!_) akan menjadi tipe `boolean` untuk mereprentasikan apakah `Account` memberikan _like_ atau _dislike_ untuk sebuah `Problem`. _Like_ dan _dislike_ digabung karena sebuah `Account` tidak bisa secara bersamaan memberi _Like_ dan _dislike_ untuk sebuah `Problem`.

![Relational Model](/Data%20Storing/design/Relational%20Model.png)

<p align="center">
  <em>Relational Model</em>
</p>

Relasi `Has` yang bersifat _many-to-many_ antara entitas `Problem` dan `Tag` diubah menjadi sebuah tabel baru berisi atribut yang me-_refer_ ke tabel `problem` dan `tag`. Kemudian relasi pada entitas `Solution`, `Discussion`, dan `Submission` (yaitu dua relasi _one-to-many_ dengan mereka sebagai pihak _one_ sementara entitas `Account` dan entitas `Problem` sebagai pihak _many_) diubah menjadi tabel `discussion`, `solution`, dan `submission` "memegang" _primary key_ dari tabel `problem` dan `account`, _respoectively_. Keputusan desain dalam paragraf ini mengikuti _verbatim_ instruksi yang ada di materi kuliah IF2240 tentang translasi model E-R ke relasional.

Alasan mengapa ada beberapa atribut _derived_ pada E-R Model yang dijadikan atribut konkrit pada tabel di desain relasional dan bukan hanya menggunakan _view_ yang kemudian di-_update_ secara berkala adalah karena _view_ tidak bisa di-_update_ manual salah satu bagiannya saja. Bayangkan misalnya ada sebuah solusi atau diskusi atau sebuah _problem_ yang baru memiliki 0 _likes_. Kemudian seorang pengguna memberikan _like_ untuk solusi/diskusi/_problem_ tersebut. Akan aneh bagi pengguna jika _likes_-nya tidak bertambah hanya karena _view_-nya belum di-_update_, bisa jadi mereka mengira bahwa ada _bug_ di aplikasi ini. Maka menurut saya lebih baik mereka menjadi atribut konkrit yang di-_update_ melalui _trigger_ untuk jumlah yang kecil, barulah nantinya ketika jumlah _likes_ sudah melewati jumlah tertentu, _trigger_ tidak digunakan dan digunakan _update_ berkala. Di kasus tadi, andaikan solusi/diskusi/_problem_ yang di-_like_ pengguna sudah memiliki sejuta _likes_, maka tidak usah di-_update_ melalui _trigger_ karena akhirnya oleh aplikasi tidak akan ditampilkan nilai eksaknya, hanya 1M saja. Hal tersebut barulah bisa cukup di-_update_ secara berkala saja.

## Foto Isi Basis Data

![Tabel problem](/Data%20Storing/screenshot/Problem%20Table.png)

<p align="center">
Tabel <code>problem</code>
</p>

![Tabel tag](/Data%20Storing/screenshot/Tag%20Table.png)

<p align="center">
Tabel <code>tag</code>
</p>

![Tabel tag_contain_problem](/Data%20Storing/screenshot/Tag%20Contain%20Problem%20Table.png)

<p align="center">
Tabel <code>tag_contain_problem</code>
</p>

## Data Visualization : [Twenty Shades of LeetCode](https://leet-code-insight.vercel.app/)

Klik _link_ di atas di _desktop_.

## Lainnya

Kode yang digunakan untuk _Data Storing_ ada pada folder `/Data Storing/src` menggunakan _library_ [`mariadb`](https://mariadb.com/kb/en/getting-started-with-the-nodejs-connector/).

(Sebagian) kode yang digunakan untuk menghasilkan data untuk _Data Visualization_ ada pada folder `/Data Visualization/src` menggunakan _library_ [`mariadb`](https://mariadb.com/kb/en/getting-started-with-the-nodejs-connector/) juga. _Query_ yang digunakan untuk menghasilkan data ditulis dan diuji lebih dulu dalam [DataGrip](https://www.jetbrains.com/datagrip/).

Visualisasi yang ditampilkan pada [Fifteen Shades of LeetCode](https://leet-code-insight.vercel.app/) dibuat dengan [`react-chartjs-2`](https://react-chartjs-2.js.org/)
