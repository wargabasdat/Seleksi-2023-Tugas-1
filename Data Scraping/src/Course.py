from bs4 import BeautifulSoup
import requests
from Resource import GetResource

class Course:
    def __init__(self, cid: str, sem: str, year: str, url: str, detail: str,
                 lecturers: list, department: list, courseImage: str, level: str,
                 download:str, title:str):
        self.course_id = cid
        self.semester = sem
        self.year = year
        self.title = title
        self.url = url
        self.detail = detail
        self.lecturers = lecturers
        self.department = department
        self.courseImage = courseImage
        self.level=level
        self.download = download

    def print(self):
        print(f"CID={self.course_id}")
        print(f"Semester={self.semester}")
        print(f"Year = {self.year}")
        print(f"Course URL = {self.url}")
        print(f"Detail = {self.detail}")
        print(f"Lecturers:")
        for l in self.lecturers:
            print(f"     {l}")

        print(f"Department:")
        for l in self.department:
            print(f"     {l}")    

        print(f"Download Link: {self.download}")

        print(f"Image: {self.courseImage}")
        print("\n\n")

def CourseDetail(url):
    headers = {'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"}
    request = requests.get(url = url, headers= headers)
    soup = BeautifulSoup(request.content, "html.parser")

    # Get Course Number, Semester, and Year
    courseInfo = soup.find("span", class_="course-number-term-detail")

    # Splitting at | and " " to separate course id, semester, and year
    cInfo = courseInfo.text.split(" | ")
    year = cInfo[1].split(" ")

    # Get Course Title
    title = soup.find("a", class_="text-capitalize m-0 text-white").get_text()

    # Get Course Detail
    description = ""

    if soup.find("div", id = "expanded-description", class_="description d-none"):
        courseDescriptionElement = soup.find("div", id = "expanded-description", class_="description d-none")

        if courseDescriptionElement.find('p'):
            courseDescription = courseDescriptionElement.find_all("p")
            for desc in courseDescription:
                description += desc.text

        else:
            description = courseDescriptionElement.get_text()
    elif soup.find("div", id = "full-description", class_="description"):
        courseDescriptionElement = soup.find("div", id = "full-description", class_="description")

        if courseDescriptionElement.find('p'):
            courseDescription = courseDescriptionElement.find_all("p")
            for desc in courseDescription:
                description += desc.text

        else:
            description = courseDescriptionElement.get_text()

    # Clean description
    substring = "Show less"

    if substring in description:
        description = description.replace(substring, "")

    # Get Lecturers
    lecturers = []
    l = soup.find_all("a", class_="course-info-instructor strip-link-offline")
    for i in range(len(l)//2):
        lecturers.append(l[i].text)

    # Get Department
    department = []
    dept = soup.find_all("a", class_ = "course-info-department strip-link-offline")
    for i in range(len(dept)//2):
        department.append(dept[i].text)

    # Get Course URL Image
    image = ""
    img = soup.find("img", class_="course-image")
    image = "https://ocw.mit.edu" + img["src"]

    # Get Course Download Link
    unduh = soup.find("a", "download-course-link-button btn btn-outline-primary btn-link link-button text-decoration-none px-4 py-2")
    download = "https://ocw.mit.edu" + unduh["href"]

    print("Scraping Resources")
    resources = GetResource(url = download, cid = cInfo[0], semester=year[0], year = year[-1])
    print(f"Done Scraping Resources. Gathered {len(resources)}")

    # Save to A Model
    CourseRet = Course(cid = cInfo[0], title=title, sem = year[0], year = year[-1], level = cInfo[2].split(", "), url = url, lecturers=lecturers,
                       detail = description, department=department, courseImage = image, download=download)

    return CourseRet, resources