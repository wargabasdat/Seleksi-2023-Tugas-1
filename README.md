## Intro : Tentang Data dan DBMS
Data yang saya pakai adalah data obat-obatan dari go.drugbank.com. Pada website tersebut terdapat banyak data tentang obat termasuk nama, berat, struktur, deskripsi, dan kategori obat. Data yang saya scraping sekitar 2748 obat. Alasan saya memilih website ini, selain karena website dapat discraping (website yang saya cantumkan di spreadsheet tidak bisa, namun hopefully topik yang saya ambil berbeda dengan yang lain), menurut saya database tentang obat-obatan sangat penting untuk mengetahui oba tapa yang cocok untuk penyakit tertentu. Orang dapat langsung mencari dari query obat yang tepat untuk mereka dengan hanya memasukkan nama sakit yang diderita. Selain itu alasan personal saya Ketika memilih data tentang obat adalah pilihan saya saat SNMPTN. Sebelum saya memutuskan memilih STEI saya sempat terpikirkan untuk mendaftar ke SF ITB saja, namun saya menyadari kalau skill kimia saya sangat kurang :grin:

## Spesifikasi Program
![ss](ssprogram1.png)
Program yang saya buat diharapkan dapat melakukan web scraping tanpa API dengan user memasukkan page + 1 pada iterasi. Selanjutnya program akan mengscraping website yang dituju sebanyak page yang dimasukkan.

## How to Use
- Install library requests dan beautifulsoup4 dengan : (cmd -> pip install requests & pip install beautifulsoup4)
[ss program]
''''
''''
```
pip install requests
```
```
pip install beautifulsoup4
```
- Masukkan URL yang akan discrap pada url: (masukkan tanpa page jika terdapat pagination)
- Masukkan jumlah page yang akan discrap pada iterasi
- Jalankan program, maka program akan mulai scraping yang ditandai dengan output sebagai berikut
- Setelah program selesai berjalan maka di file yang sama akan ada file .json yang berisi data hasil scraping
