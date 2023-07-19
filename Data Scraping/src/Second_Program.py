# Import all the required library
from bs4 import BeautifulSoup
from selenium.common.exceptions import TimeoutException
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json
import time
import requests
import lxml

# Open the Chrome using webdriver
driver = webdriver.Chrome()

# Set noto_flag to False
noto_flag = False

# Initialize wait variable and set the timeout time to 5 seconds
wait = WebDriverWait(driver, 5)
data_fontdetails = {}

with open('fonts.txt', 'r') as fonts: # Open fonts.txt which contains the list of Font Name
    lines = fonts.readlines()  # Read lines into a list

    for font in lines: # Iterate the font names
        font_info = {} # Initiate the dictionary
        font = ( #Replacement due to different encoding and some font (mostly Noto typeface) not adhering to the usual link format
            font.replace("Korean", "KR")
            .replace("Japanese", "JP")
            .replace("Traditional Chinese", "TC")
            .replace("Simplified Chinese", "SC")
            .replace("Hong Kong", "HK")
            .replace("Półtawski", "Poltawski")
            .replace("PÃ³Å‚tawski", "Poltawski")
            .replace("NÃ¼shu", "Nushu")
            .replace("Nüshu", "Nushu")
            .replace("N'Ko", "NKo")
            .replace("Nyiakeng Puachue", "NP")
        )
        # Noto and non-Noto fonts have different URLs
        # Dictates how the code below should behave depending on its type (Noto/Non-Noto)
        if "Noto" in font: 
            url = "https://fonts.google.com/noto/specimen/" + font.replace(" ", "+")
            noto_flag = True
        else:
            url = "https://fonts.google.com/specimen/" + font.replace(" ", "+")
            noto_flag = False
        
        # Open the URL
        driver.get(url)
        
        # Wait until the class successfully load
        waitFontName = wait.until(EC.presence_of_element_located((By.CLASS_NAME, 'mat-text--title')))
        
        # Parse the HTML page
        soup = BeautifulSoup(driver.page_source, "lxml")
        
        # Find and extract the Font Name
        parent = soup.find('h1', class_='mat-text--title')
        font_info['font_name'] = parent.text
        
        # Find and extract Styles
        styles = soup.find_all('span', class_='mat-text--secondary')
        font_info['styles'] = [element.text for element in styles]
        font_info['num_of_styles'] = int(len(styles))
        
        # If it is not Noto typeface, find the author, otherwise fill it with "Google"
        if not noto_flag:
            designer_element = soup.find('div', class_='header__subtitle')
            designer_name = designer_element.find('a').text
            font_info['designer'] = designer_name
        else:
            font_info['designer'] = "Google"
        data_fontdetails[font] = font_info
        
        # Go to the about page
        url = url + "/about"
        driver.get(url)
        
        # Find and extract description
        # Instead of randomly accessing and waiting for timeout, it's better to check whether it's a Noto typeface or not
        # Sometimes, a Noto typeface might have a different HTML structure compared to the usual Noto page, this applies for non-Noto typeface
        # Hence, we should always check for TimeoutException
        if not noto_flag:
            try:
                waitDesc = wait.until(EC.presence_of_element_located((By.XPATH, './/*[@id="main-content"]/div/div/section[1]/div')))
                soup = BeautifulSoup(driver.page_source, "lxml")
                desc = soup.find('div', itemprop='description', class_='gmat-body-1 specimen__about-description about__description')
            except TimeoutException:
                soup = BeautifulSoup(driver.page_source, "lxml")
                desc = soup.find('gf-html-view', class_='font-article')
        else:
            try:
                waitDesc = wait.until(EC.presence_of_element_located((By.XPATH, './/*[@id="main-content"]/div/div/article/gf-html-view/div')))
                soup = BeautifulSoup(driver.page_source, "lxml")
                desc = soup.find('gf-html-view', class_='font-article')
            except TimeoutException:
                soup = BeautifulSoup(driver.page_source, "lxml")
                desc = soup.find('div', itemprop='description', class_='gmat-body-1 specimen__about-description about__description')
        font_info['description'] = desc.get_text(strip=True)

        # Extract the usage details
        waitValueElement = wait.until(EC.presence_of_element_located((By.XPATH, './/*[@id="main-content"]/div/aside/section[2]/div[1]')))
        soup = BeautifulSoup(driver.page_source, "lxml")
        value_element = soup.find('div', class_='about__views ng-star-inserted')
        
        # Split the result
        value = value_element.text.strip().split()
        usage_details = ' '.join(value[:2]) # Pick the first two words from the sentence
        if "thousand" in usage_details: # Convert the data into Integer by multiplying
            usage_details = int(float(usage_details.replace(" thousand", "")) * 1000)
        elif "million" in usage_details:
            usage_details = int(float(usage_details.replace(" million", "")) * 1000000)
        elif "billion" in usage_details:
            usage_details = int(float(usage_details.replace(" billion", "")) * 1000000000)
        else:
            usage_details = int(usage_details)
        web_usage = int(value[-2].replace(",", "")) # Remove commas and convert to Integer
        
        # Store data on the dictionary
        font_info['usage_details'] = usage_details
        font_info['web_usage'] = web_usage
        
        # Go to Glpyhs page
        if "Noto" in font: # Depends on whether the font has "Noto" in its name
            url = "https://fonts.google.com/noto/specimen/" + font.replace(" ", "+") + "/glyphs"
            noto_flag = True
        else:
            url = "https://fonts.google.com/specimen/" + font.replace(" ", "+") + "/glyphs"
            noto_flag = False
            
        # Open the page    
        driver.get(url)
        
        # Initialize the languages dictionary
        continent_languages = {}
        
        try:
            # Wait until the element is present based on its XPATH
            waitLang = wait.until(EC.presence_of_element_located((By.XPATH, './/*[@id="main-content"]/gf-languages-viewer/article/div/div')))
            # Parse the HTML file
            soup = BeautifulSoup(driver.page_source, "lxml")
            
            # Find and extract the amount of supported language
            lang = soup.find('div', class_='mat-text--secondary gmat-body-2')
            langSupported = lang.text.strip().split()
            
            # Find the bigger container then find every expansion panel inside it
            lang_panels = soup.find('gf-languages-viewer')
            expansion_panels = lang_panels.find_all('mat-expansion-panel', class_='mat-expansion-panel')
            for panel in expansion_panels: # Extract the value of each 'li' inside
                continent = panel.find('div', class_='mat-text--title').text.strip()
                languages = panel.find_all('li', class_='ng-star-inserted')
                language_names = [language.text.strip() for language in languages] # Store it in an array
                continent_languages[continent] = language_names # Save it to the dictionary
        except TimeoutException: # If Timeout period exceeded (no language supported information available)
            langSupported = "0" # Set it to 0
            
        # Save the information to the dictionary    
        font_info['langSupp'] = continent_languages
        font_info['num_of_lang_sup'] = int(langSupported[0]) # Convert the information from String to Integer
        
# Write the data_fontdetails dictionary to a JSON file
with open('Final_Data.json', 'w') as json_file:
    json.dump(data_fontdetails, json_file, indent=4)