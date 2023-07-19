from scrape_lib import getHTMLText, getListOfTupleData, jsonStoring
from selenium import webdriver


home_link = 'https://colorbox.co.id'
all_products_link = 'https://colorbox.co.id/collections/clothing'
driver = webdriver.Chrome()
driver.get(all_products_link)

print("Getting HTML text...")
html_txt = getHTMLText(driver)

print("Scraping clothing data....")
products_info = getListOfTupleData(html_txt, home_link)

# Create json file for data
print("Serializing clothing data to json....")
jsonStoring(products_info)
print("products.json is saved")
