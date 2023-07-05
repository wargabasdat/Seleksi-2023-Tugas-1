import json
import mysql.connector

def connection():
    print("Starting Connection")

    conn = mysql.connector.connect(
        host = "localhost",
        user = "root",
        password = "root",
        database = "seleksi",
        charset = "utf8mb4"
    )

    print("Connection Success")
    return conn

def config(conn):
    print("Creating tables, if not already exists")
    cursor = conn.cursor()
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS courses(
            course_id varchar(50),
            semester varchar(50),
            year int,
            title varchar(255),
            url varchar(255),
            detail LONGTEXT,
            downloadlink varchar(255),
            courseImage varchar(255),
            PRIMARY KEY(course_id, semester, year)
        );
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS departments(
            name varchar(50),
            numberOfCourses int,
            departmentWeb varchar(255),
            PRIMARY KEY (name)
        );
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS courseDepartment(
            course_id varchar(50),
            semester varchar(50),
            year int,
            departmentname varchar(50),
            PRIMARY KEY (course_id, semester, year, departmentname),
            FOREIGN KEY (departmentname) REFERENCES departments(name)
        );
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS resource(
            course_id varchar(50),
            semester varchar(50),
            year int,
            name varchar(255),
            ftype varchar(50),
            type varchar(50),
            url varchar(255),
            PRIMARY KEY (course_id, semester, year, url, type),
            FOREIGN KEY (course_id, semester, year) REFERENCES courses(course_id, semester, year)
        );
        """
    )

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS courseLecturers(
            course_id varchar(50),
            semester varchar(50),
            year int,
            lecturerName varchar(255),
            PRIMARY KEY (course_id, semester, year, lecturerName),
            FOREIGN KEY (course_id, semester, year) REFERENCES courses(course_id, semester, year)
        );""")

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS courseLevel(
            course_id varchar(50),
            semester varchar(50),
            year int,
            level varchar(255),
            PRIMARY KEY (course_id, semester, year, level),
            FOREIGN KEY (course_id, semester, year) REFERENCES courses(course_id, semester, year)
        );
        """
    )

    conn.commit()
    print("Done creating tables")

def storeCourses(conn):
    print("Storing courses")
    f = open("../data/courses.json", "r")

    data = json.loads(f.read())

    cursor = conn.cursor()

    statement1 = "INSERT INTO courses(course_id, semester, year, title, url, detail, downloadlink, courseImage) VALUES\n"

    # store1 = open("course.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["courses"])):
        cid = data["courses"][i]["course_id"]
        sem = data["courses"][i]["semester"]
        year = data["courses"][i]["year"]
        title = data["courses"][i]["title"]
        url = data["courses"][i]["url"]
        detail = data["courses"][i]["detail"]
        downloadlink = data["courses"][i]["downloadLink"]
        image = data["courses"][i]["courseImage"]

        if(i != len(data["courses"])-1):
            writeable = '("{}", "{}", {}, "{}", "{}", "{}", "{}", "{}"),\n'.format(cid, sem, year, title, url, detail, downloadlink, image)
            statement1 += writeable
            # store1.write(writeable)
        else:
            writeable = '("{}", "{}", {}, "{}", "{}", "{}", "{}", "{}");'.format(cid, sem, year, title, url, detail, downloadlink, image)
            statement1 += writeable
            # store1.write(writeable)
    cursor.execute(statement1)
    conn.commit()
        
    f.close()

    # store1.close()


def storeDepartments(conn):
    print("Storing departments")
    f = open("../data/departments.json", "r")

    data = json.loads(f.read())

    cursor = conn.cursor()

    statement1 = "INSERT INTO departments(name, numberOfCourses, departmentWeb) VALUES\n"

    # store1 = open("department.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["departments"])):
        name = data["departments"][i]["name"]
        numberOfCourses = data["departments"][i]["numberOfCourses"]
        departmentWeb = data["departments"][i]["departmentWeb"]

        if(i != len(data["departments"])-1):
            writeable = '("{}", {}, "{}"),\n'.format(name, numberOfCourses, departmentWeb)
            statement1 += writeable
            # store1.write(writeable)
        else:
            writeable = '("{}", {}, "{}");'.format(name, numberOfCourses, departmentWeb)
            statement1 += writeable
            # store1.write(writeable)
    
    cursor.execute(statement1)
    conn.commit()

    f.close()

    # store1.close()

def courseDepartment(conn):
    print("Storing courseDepartments")
    f = open("../data/courses.json", "r")

    data = json.loads(f.read())

    cursor = conn.cursor()

    statement1 = "INSERT INTO courseDepartment(course_id, semester, year, departmentName) VALUES\n"

    # store1 = open("courseDepartment.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["courses"])):
        cid = data["courses"][i]["course_id"]
        sem = data["courses"][i]["semester"]
        year = data["courses"][i]["year"]
        departments = data["courses"][i]["department"]
        
        for j, dept in enumerate(departments):
            if i != len(data["courses"]) - 1 or j != len(departments) - 1:
                writeable = '("{}", "{}", {}, "{}"),\n'.format(cid, sem, year, dept)
            else:
                writeable = '("{}", "{}", {}, "{}");'.format(cid, sem, year, dept)
            statement1+=writeable
            # store1.write(writeable)
    
    cursor.execute(statement1)
    conn.commit()
    f.close()

    # store1.close()

def courseLecturers(conn):
    print("Storing courseLecturers")
    f = open("../data/courses.json", "r")

    data = json.loads(f.read())

    cursor = conn.cursor()

    statement1 = "INSERT INTO courseLecturers(course_id, semester, year, lecturerName) VALUES\n"

    # store1 = open("courseLecturers.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["courses"])):
        cid = data["courses"][i]["course_id"]
        sem = data["courses"][i]["semester"]
        year = data["courses"][i]["year"]
        lecturers = data["courses"][i]["lecturers"]

        for j, lect in enumerate(lecturers):
            if i != len(data["courses"]) - 1 or j != len(lecturers) - 1:
                writeable = '("{}", "{}", {}, "{}"),\n'.format(cid, sem, year, lect)
            else:
                writeable = '("{}", "{}", {}, "{}");'.format(cid, sem, year, lect)
            # store1.write(writeable)
            statement1 += writeable

    cursor.execute(statement1)
    conn.commit()
    f.close()

    # store1.close()

def resource(conn):
    print("Storing resources")
    f = open("../data/resources.json", "r")

    data = json.loads(f.read())

    cursor = conn.cursor()

    statement1 = "INSERT INTO resource(course_id, semester, year, name, ftype, type, url) VALUES\n"

    # store1 = open("resource.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["resources"])):
        cid = data["resources"][i]["cid"]
        sem = data["resources"][i]["semester"]
        year = data["resources"][i]["year"]
        name = data["resources"][i]["name"]
        ftype = data["resources"][i]["fType"]
        type = data["resources"][i]["type"]
        url = data["resources"][i]["url"]

        if(i != len(data["resources"])-1):
            writeable = '("{}", "{}", {}, "{}", "{}", "{}", "{}"),\n'.format(cid, sem, year, name.replace('"',""), ftype, type, url)
            # store1.write(writeable)
            statement1+=writeable
        else:
            writeable = '("{}", "{}", {}, "{}", "{}", "{}", "{}");'.format(cid, sem, year, name.replace('"',""), ftype, type, url)
            # store1.write(writeable)
            statement1+=writeable

    cursor.execute(statement1)   
    conn.commit() 
    f.close()

    # store1.close()

def courseLevel(conn):
    print("Storing courseLevels")
    f = open("../data/courses.json", "r")

    data = json.loads(f.read())

    statement1 = "INSERT INTO courseLevel(course_id, semester, year, level) VALUES\n"

    cursor = conn.cursor()

    # store1 = open("courseLevel.sql", "w", encoding='utf-8')

    # store1.write(statement1)

    for i in range(len(data["courses"])):
        cid = data["courses"][i]["course_id"]
        sem = data["courses"][i]["semester"]
        year = data["courses"][i]["year"]
        level = data["courses"][i]["level"]

        for j, lvl in enumerate(level):
            if i != len(data["courses"]) - 1 or j != len(level) - 1:
                writeable = '("{}", "{}", {}, "{}"),\n'.format(cid, sem, year, lvl)
            else:
                writeable = '("{}", "{}", {}, "{}");'.format(cid, sem, year, lvl)
            # store1.write(writeable)
            statement1 += writeable
    
    cursor.execute(statement1)
    conn.commit()
    f.close()

    # store1.close()

conn = connection()
config(conn)
storeCourses(conn)
storeDepartments(conn)
courseDepartment(conn)
courseLecturers(conn)
resource(conn)
courseLevel(conn)
conn.close()
print("Connection closed")