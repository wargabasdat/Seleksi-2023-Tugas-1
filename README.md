<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing of Courses at <a href="https://ocw.mit.edu">MIT OpenCourseWare</a>.
  <br>
  <br>
</h2>


## Data and DBMS Description
The data used in this project are courses of a specific topic from MIT OpenCourseWare, an Open Educational Resources (OER) from MIT.

Every course has details of the course itself such as the lecturer(s), url, semester, course id, year, department, etc. For every department, there are details of the department's website and number of courses within the topic chosen. For every course, there are non-mandatory resources that contains the name of the resoruce, the file type, the type of resource, and the url of the resource itself.

The data is stored in a relational model using SQL and managed with MariaDB.

Accessing resources for open courses online is a privilege that I have in order to study better. By scraping MIT OpenCourseWare, I could help others to immediately get resource without having to open the internet. Not only that, I also want to compare about Indonesia's education by looking up on certain topics such as computer science and analysing which department holds courses for it.


## Program Specification
The scraping program is build using Python 3.11.1 and libraries such as BeautifulSoup, JSON, and Selenium. To gather courses, the scraper uses Selenium, since the website is a dynamically loaded website. After gathering the courses, using BeautifulSoup, the program gathers the details of the courses and the resources, if any exists. The next step is finding the department website for every department. After that, it is a matter of storing the data as JSON.

To store JSON to MariaDB, a Python script is used to execute the JSON data into a database. The database name is up to the user, but for the character encoding setting must be set to utf8mb4. To ensure this, the code to create the database on MariaDB is as follows,

```sql
CREATE DATABASE IF NOT EXISTS database_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```


## How to Use
### Scraping
To scrape the website, use the Python program Scraper.py located in /DataScraping/src/Scraper.py on the src folder. The program will ask the user to input the topic that the user wants and the estimate number of courses that the user wants. After that, the scraper will do it's work, by visiting other each courses page, and produce the .JSON files from the scraping process.

While scraping, the program will remove the 'Show less' text on details and splits data provided to get informations of course semester, year, and id. Whitespaces are also removed. For multivalued data, on department, level, and lecturers, the program will parse for those informations too. For department websites, if none is found, then the default website will be the MIT website. For links, it will be appended with https://ocw.mit.edu to provide a useable link, unless it is stored in a another database.

The data provided now uses the "Computer Science" topic with 96 courses scraped.

### Storing
To store the scraped data, use the Python program Storing.py located in /DataScraping/src/Storing.py. Run the program, on the src folder. Make sure to already create a database. Don't forget to change the connection function to adhere with your local configuration on database name, host, port, user, and password. The charset is utf8mb4.

The dumped SQL file is available in /Data Storing/export/ folder. To dump the database, simply run this command on your terminal
```
mysqldump -u root -p database_name > file_name.sql
```

## JSON Structure
There are three JSON files used in this program
1. courses.json

```json
{
  "course_id": The id of the course,
  "semester": The semester of the course (Fall, Spring, Summer, etc.),
  "year": The year of the course,
  "title": The course title/name,
  "url": The link to the course,
  "lecturers": The courses' lecturer(s),
  "department": The courses' department(s),
  "courseImage": The course image on the web,
  "level": The level(s) of the course (Undergraduate, Graduate, etc.),
  "downloadLink": The Courses resource download page
}
```

2. departments.json
```json
{
  "name": The department name,
  "numberOfCourses": Number of courses that this department held for the topic,
  "departmentWeb": The department's website
}
```

3. resourses.json
```json
{
  "name": The Resource Name,
  "url": The URL to The Resource,
  "type": The type of the resource (assignments, readings, exams, etc.),
  "fType": The file type of the resource (video file, pdf file, etc.),
  "cid": The course's id of the resource,
  "semester": The course's semester of the resource,
  "year": The course's year of the resource
}
```

## Database Structure
The Entity-Relation Diagram (ERD) for the database created to support the data that is scraped is as below,

<img src = "./Data Storing/design/SeleksiBasdat-ERD.png" alt="ERD">

and the translated ERD into a RDBMS design is as below,

<img src = "./Data Storing/design/SeleksiBasdat-Schema.png" alt = "Schema">


## Translating ERD to RDBMS Model Explanation
The explanation is as follows,
1. The weak-entity 'Resources' is made into it's own relation, with primary keys name, url, type, course_id, semester, and year. Therefore the attributes are name, url, type, course_id, semester, year, and type
2. The entity 'Course' is made into it's own relation, with atomic attributes made into it's own attribute and primary keys course_id, semester, and year. Therefore the attributes are course_id, semester, year, title, url, detail, courseImage, and downloadLink
3. The multivalued attribute lecturers, department, and level are each made into it's own separate relations with primary keys the values of lecturers, department, and level then adding a primary key of the course relation i.e., course_id, semester, and year
4. The department entity is made into it's own relation with primary key the name of the department. Therefore the attributes are name, numberOfCourses, and departmentWeb

## Screenshots
### Data Scraping
<img src = "./Data Scraping/screenshot/scraping1.png">
<img src = "./Data Scraping/screenshot/scraping2.png">

### Data Storing
#### Storing with Python
<img src = "./Data Storing/screenshot/storing.png">

#### Courses
<img src = "./Data Storing/screenshot/courses1.png">

selecting some columns for a better view

<img src = "./Data Storing/screenshot/courses.png">

#### Departments
<img src = "./Data Storing/screenshot/departments.png">

#### Course Level
<img src = "./Data Storing/screenshot/courseLevel.png">

#### Course Department
<img src = "./Data Storing/screenshot/courseDepartment.png">

#### Course Lecturers
<img src = "./Data Storing/screenshot/courseLecturers.png">

#### Resource
<img src = "./Data Storing/screenshot/resource.png">

## Data Visualization
The visualized data can be viewd at the Python Notebook in Data Visualization folder.

The visualization covers:
1. Lecturers with 2 Courses or More in Computer Science
2. Number of Computer Science Courses by Departments
3. Resource File Type Count
4. Course Level Count

From the visualized data, it can be deducted that Prof. Erik Demaine, who was a former child prodigy, has 4 courses in Computer Science. Computer Science courses are not only held by the department of Electrical Engineering and Computer Science, but by other majors in engineering and mathematics as it is a fundamental tool to use in engineering and mathematics. The most used type of file to share resource is a PDF File. Most computer science courses are held at graduate level, followed by undergraduate level.

## References
Libraries that are used in this program are,
1. Selenium
2. BeautifulSoup
3. JSON
4. mysql.connector
5. Pandas
6. Matplotlib.Pyplot

## Author
Matthew Mahendra - 13521007