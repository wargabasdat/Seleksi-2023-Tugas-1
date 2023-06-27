# Oleh: Matthew Mahendra - 13521007

from selenium import webdriver
from CourseLink import CourseLink
from Course import CourseDetail
from AdapterJSON import Serializer

print("Insert topic to scrape: ")
print("1. Engineering\n2. Social Science\n3. Science\n4. Fine Arts\n5. Business\n6. Mathematics\n7. Computer Science")
query=input(">> ")
num = int(input("Insert number of courses\n>> "))

query.replace(" ", "+")

driver = webdriver.Chrome()

url = "https://ocw.mit.edu/search/?t="+query

# Step 1: Get the Links to Each Courses
links, departments = CourseLink(driver, url, num=num)

# Step 2: For each links, get the appropriate data
courses = []
resources = []
print("Scraping Courses")
for link in links:
    print(f"Scraping Course with Link: {link}")
    course, resourcesCourse = CourseDetail(link)
    courses.append(course)
    resources.extend(resourcesCourse)
print("Done Scraping Resources")

# Step 3: Find the Website for every departments
print("Scraping Website for Departments")
for department in departments:
    department.setDepartmentWeb()
print("Done scraping")

# Step 4: Save to JSON
jsonFile = Serializer(courses=courses, departments=departments, resources=resources)
jsonFile.serialize()

driver.close()