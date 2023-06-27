# Oleh: Matthew Mahendra - 13521007

from bs4 import BeautifulSoup
import requests

class Department:
    def __init__(self, name: str, numberOfCourses: int) -> None:
        self.name = name
        self.numberOfCourses = numberOfCourses
        self.departmentWeb = ""

    def print(self):
        print(f"{self.name}: {self.numberOfCourses}\n Link: {self.departmentWeb}")

    def setDepartmentWeb(self, url ="https://www.mit.edu/education/schools-and-departments/"):
        headers = {'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"}
        request = requests.get(url = url, headers= headers)
        soup = BeautifulSoup(request.content, "html.parser")
        
        lists = soup.find_all("li", class_="sortable-list__item js-sortable-list-item")

        for list in lists:
            if(list.find("span", class_="sortable-list__item-name").text == self.name):
                self.departmentWeb = list.find("a")['href']
                break
            else:
                # Default Web MIT
                self.departmentWeb = "https://www.mit.edu"