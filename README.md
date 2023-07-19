Christina Wijaya/18221106
- Description of the data and DBMS
I choose this data from Glints because of my curiosity about the job vacancies in Indonesia. I choose PostgreSQL because I have used it before and enjoy using it.

- Specification of the program
The program to do the web scrapping consists of some variables to get the data from the website and some others to store the data in the list and then convert it to a JSON file. I do some configuration such as dividing the location into 4 variables: kecamatan, kota, provinsi, and negara.

- How to use
To use the web scrapping program, you just need to run the code and its done :D

- JSON Structure
The JSON file contains of 13 variables: job_idx, job_id, title, category, company_id, company, kecamatan, kota, provinsi, negara, salary, experience, and education.

- Database Structure (ERD and relational diagram)
The ERD and relational diagram are quite simple. They just have 3 tables: job, company, and location. The job table consists of information about the job vacancy: job_idx, job-id, title, category, salary, experience, and education. The company table consists of information about the company: company_id and company (name). The location table consists of information about the location: location_id and alamat as a composite attribute of kecamatan, kota, provinsi, and negara. The relationship between job and company is one-to-many, as one job can only be owned by one company while one company can have many job vacancies. The relation between job and location is also one-to-many, as one job can only be placed in one location while one location can have many job vacancies.
To turn the ERD into a relational diagram, I just turn the composite attribute to its individual attributes and put the primary key of each "many" tables from the relation one-to-many to the "one" table. In this case, the company_id and location_id are placed in the job table.

- Explanation of ERD to relational diagram translation process
Explained above :)

- Reference (Library used, etc)
I used BeautifulSoup to do the web scraping.

- Author
Me, Christina Wijaya/18221106
