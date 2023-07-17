## Intro : Tentang Data dan DBMS
Data yang saya pakai adalah data obat-obatan dari go.drugbank.com. Pada website tersebut terdapat banyak data tentang obat termasuk nama, berat, struktur, deskripsi, dan kategori obat. Data yang saya scraping sekitar 2748 obat. Alasan saya memilih website ini, selain karena website dapat discraping (website yang saya cantumkan di spreadsheet tidak bisa, namun hopefully topik yang saya ambil berbeda dengan ca aslab lain), menurut saya database tentang obat-obatan sangat penting untuk mengetahui obat apa yang cocok untuk penyakit tertentu. Orang dapat langsung mencari dari query obat yang tepat untuk mereka dengan hanya memasukkan nama sakit yang diderita. Selain itu alasan personal saya Ketika memilih data tentang obat adalah pilihan saya saat SNMPTN. Sebelum saya memutuskan memilih STEI saya sempat terpikirkan untuk mendaftar ke SF ITB saja, namun saya menyadari kalau skill kimia saya kurang :grin:

## Spesifikasi Program
<img src="Data Scraping/screenshot/ssprogram1.png" alt="program" width="500"> <br />
Program yang saya buat diharapkan dapat melakukan web scraping tanpa API dengan user memasukkan page + 1 pada iterasi. Selanjutnya program akan mengscraping website yang dituju sebanyak page yang dimasukkan.

## How to Use
- Install library requests dan beautifulsoup4 dengan :
```
> pip install requests
```
```
> pip install beautifulsoup4
```
- Masukkan URL yang akan discrap pada url: (masukkan tanpa page jika terdapat pagination)
- Masukkan jumlah page yang akan discrap pada iterasi
- Jalankan program, maka program akan mulai scraping yang ditandai dengan output sebagai berikut
- Setelah program selesai berjalan maka di file yang sama akan ada file .json yang berisi data hasil scraping


## JSON Structure
<img src="Data Scraping/screenshot/hasilscrap.png" alt="hasil" width="500"> <br />
File json berisi data obat yang terdiri dari nama obat, berat, deskripsi, dan kategori

## Database Structure
<br />

<img src="Data Storing/design/erd.png" alt="erd" width="480"/>

Selanjutnya dari ER Diagram tersebut akan diterjemahkan kedalam Relational Diagram dengan cara :
- Membuat tabel drug, employee, customer dan memasukkan semua atribut masing-masing
- Pada specialization, ubah masing-masing menjadi satu tabel (customer_personal, customer_hospital, dan customer_drugstore) dan tambahkan PK customer sebagai PK specialization
- Pada ternary, jadikan relasi sebagai satu tabel dengan menambahkan PK masing-masing tabel yang terhubung dan atribut relasi tersebut (time)
- Maka akan dihasilkan relational diagram sebagai berikut : <br />
<img src="Data Storing/design/rd.png" alt="erd" width="480"/>

Keterangan : <br />
Drug = (**name**, weight, description, categories) <br />
Employee = (**employee_id**, first_name, last_name, phone_number, address, date_of_birth) <br />
Customer = (**customer_id**, number, address) <br />
Customer_personal = (***customer_id***, first_name, last_name) <br />
Customer_hospital = (***customer_id***, hospital_id, hospitalname) <br />
Customer_drugstore = (***customer_id***, drugstore_id, drugstorename)<br />
Transaction = (***drug_name***, ***employee_id***, ***customer_id***, time)<br />

##
<br />
Customer_personal(customer_id) -> Customer(customer_id)<br />
Customer_hospital(customer_id) -> Customer(customer_id)<br />
Customer_drugstore(customer_id) -> Customer(customer_id)<br />
Transaction(drug_name) -> Drug(name)<br />
Transaction(employee_id) -> Employee(employee_id)<br />
Transaction(customer_id) -> Customer(customer_id)<br />

## Penyimpanan Database
Database disimpan menjadi file sql dengan cara :
```
>pg_dump -U username [namadatabase] > sqlfile.sql
```
<br />

**Ditulis oleh : Aditya Inas Hamidah(18221172)**

## References
- Library used : requests & beautifulsoup4
- go.drugbank.com