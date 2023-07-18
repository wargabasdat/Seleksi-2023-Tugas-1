import json
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def getUrlList(BASE_URL :str):
    # Initialize driver
    driverSearch = webdriver.Chrome()
    driverSearch.get(BASE_URL+"/us/pokedex")

    try :
        # Manually scroll trough the page, hehe
        wait = WebDriverWait(driverSearch,600).until(EC.presence_of_element_located((By.XPATH,"""/html/body/div[4]/section[5]/ul/li[1010]/a""")))
        results = driverSearch.find_element(By.CLASS_NAME,"results")
        resultsList = results.find_elements(By.TAG_NAME, "a")
        resultText = [result.get_attribute("href") for result in resultsList]
        driverSearch.quit()
        return resultText
    except TimeoutException:
        driverSearch.quit()
        return []

    
