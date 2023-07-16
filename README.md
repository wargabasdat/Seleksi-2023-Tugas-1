- Description of the data and DBMS (Why you choose it)
Uniqlo merupakan perusahaan ...
Uniqlo menjadi website yang cocok untuk dijadikan latihan web scrape karena ...
DBMS yang digunakan untuk melihat hasil web scrape yaitu PostgreSQL karena ...

- Specification of the program
Source Code dibentuk menggunakan bahasa Python dengan penambahan library utama Beautiful Soup dan Selenium

- How to use
Langkah penggunaan program:
1.
2.
3.
dst.

- JSON Structure
JSON structure data ini memiliki bentuk yang sama dengan bentuk relational diagram karena penggunaan source code yang sudah mentranslasikan ERD menjadi relasional diagram

- Database Structure (ERD and relational diagram)
ERD:
Products:
Categories:
Subcategories:

Relational Diagram:
Products:
ProductsColors:
ProductsSizes:
Categories:
Subcategories:

- Explanation of ERD to relational diagram translation process
Entitas Categories dan Subcategories pada ERD apabila ditranslasikan menjadi relational diagram memiliki bentuk entitas yang sama dengan bentuk pada ERD.
Entitas Products memiliki penambahan FK CategoryID dan SubcategoryID karena memiliki hubungan one-to-one dan total participation dengan entitas Categories dan Subcategories
Entitas Products karena memiliki dua atribut multi-value maka pada relational diagram ditranslasikan dengan membentuk entitas baru bernama ProductsColors dan ProductsSizes untuk menyimpan nilai warna dan ukuran lebih dari satu untuk setiap produk

- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)

- Reference (Library used, etc)
Beautiful Soup
Selenium

- Author
18221016 | Justin Yusuf Abidjoko
