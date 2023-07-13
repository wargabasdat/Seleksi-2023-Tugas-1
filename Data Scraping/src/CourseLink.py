# Oleh: Matthew Mahendra - 13521007

from selenium import webdriver
from selenium.webdriver.common.by import By
from Departments import Department
import time

def CourseLink(driver, url: str, num: int):
    driver.get(url)

    last_height = driver.execute_script("return document.body.scrollHeight")

    t = 0

    while t < num:
        # Scroll to the bottom of the page
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # Wait for some time to allow the content to load
        time.sleep(2)

        courses = driver.find_elements(By.TAG_NAME, 'article')

        # Calculate the new scroll height after loading additional data
        new_height = driver.execute_script("return document.body.scrollHeight")
        
        # Break the loop if there is no more content to load
        if new_height == last_height:
            break
        
        # Update the last scroll height
        last_height = new_height

        t = len(courses)

    # Find Course Elements
    # courses = driver.find_elements(By.TAG_NAME, 'article')

    # Find Course Links
    print("Gathering courses")
    links = []
    for course in courses:
        link_tag = course.find_element(By.TAG_NAME, "a")
        link = link_tag.get_attribute("href")
        if link not in links:
            links.append(link)
    print(f"Gathered {len(links)} courses")
    

    # Find Departments
    print("Gathering Departments")
    departmentElements = driver.find_elements(By.CLASS_NAME, 'facet-visible')
    departments = []
    for dept in departmentElements:
        departmentName = dept.find_element(By.NAME, "department_name").get_attribute("value")
        departmentCount = dept.find_element(By.CLASS_NAME, 'facet-count').text
        d = Department(departmentName, departmentCount)
        departments.append(d)
    print(f"Gathered {len(departmentElements)} departments")
    
    return links, departments