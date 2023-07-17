import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from datetime import datetime
import time


# URL = "https://www.jamtangan.com/c/jam-tangan"
# URL = "https://www.jamtangan.com/p/avi8-hawker-hunter-av408001-duke-chronograph-men-black-dial-black-leather-strap-462741?list-referer-id=Jam%20Tangan%20Pria&list-referer-name=Jam%20Tangan%20Pria%20Brand%20Avi%208"

URL = "https://www.jamtangan.com/p/casio-gshock-gclassic-ga1001a1dr-analogdigital-dial-resin-band-15821?list-referer-id=Jam%20Tangan&list-referer-name=Jam%20Tangan"

time_start = time.time()

driver = webdriver.Chrome()
driver.get(URL)
driver.maximize_window()

# result = []
# content = driver.page_source
# soup = BeautifulSoup(content, "html.parser")
# print(soup.prettify())

sales_dict = {
    "Product Name" : "",
    "Brand" : "",
    "Model No" : "",
    "Normal Price" : "",
    "Discounted Price" : "",
    "Discount Percentage" : "",
    "Number of Seen" : "",
    "Number of Sold" : "",
    "Online Stock Status" : "",
    "Offline Stock Status" : ""
}

spec_grid = driver.find_element(By.CSS_SELECTOR, ".tab-content .grid")
spec_list = spec_grid.find_elements(By.CSS_SELECTOR, ".spec-item")
for spec in spec_list:
    if spec.find_element(By.CSS_SELECTOR, ".font-black").text in ["Brand", "Model No"]:
        data = spec.find_elements(By.CSS_SELECTOR, ".leading-6")
        key = data[0].text.strip()
        value = data[1].text.strip()
        sales_dict[key] = value

sales_dict["Product Name"] = driver.find_element(By.TAG_NAME, "h1").text.strip()

try:
    normal_price = driver.find_element(By.CSS_SELECTOR, "div[data-testid='test-product-info'] .line-through").text.strip()
except:
    normal_price = driver.find_element(By.CSS_SELECTOR, "div[data-testid='test-product-info'] .text-xl").text.strip()
discounted_price = driver.find_element(By.CSS_SELECTOR, "div[data-testid='test-product-info'] .text-xl").text.strip()
sales_dict["Normal Price"] = int(normal_price.replace("Rp", "").replace(".", "").strip())
sales_dict["Discounted Price"] = int(discounted_price.replace("Rp", "").replace(".", "").strip())

discount_percentage = (sales_dict["Normal Price"] - sales_dict["Discounted Price"]) / sales_dict["Normal Price"]
sales_dict["Discount Percentage"] = round(discount_percentage * 100, 4)

num_seen = driver.find_element(By.CSS_SELECTOR, ".ic-eye + div > .text-sm").text.strip()
if (num_seen.__contains__("Rb")):
    num_seen = float(num_seen.replace(" Rb", "").strip()) * 1000
sales_dict["Number of Seen"] = int(num_seen)

num_sold = driver.find_element(By.CSS_SELECTOR, ".ic-cart.mr-1 + div > .text-sm").text.strip()
if (num_sold.__contains__("Rb")):
    num_sold = float(num_sold.replace(" Rb", "").strip()) * 1000
sales_dict["Number of Sold"] = int(num_sold)

try:
    empty_badge = driver.find_element(By.CSS_SELECTOR, ".badge.bg-accent-red")
    if (empty_badge != None and empty_badge.text.strip().__contains__("habis")):
        sales_dict["Online Stock Status"] = "Not Available"
    else:
        raise Exception("The badge is not empty badge")
except:
    online_stock_status = driver.find_element(By.CSS_SELECTOR, ".stepper-wrapper + div").text.strip()
    if (online_stock_status == "STOK ONLINE < 5 PCS"): sales_dict["Online Stock Status"] = "Low (< 5 PCS)"
    elif (online_stock_status == "STOK ONLINE > 5 PCS"): sales_dict["Online Stock Status"] = "High (>= 5 PCS)"
    else: sales_dict["Online Stock Status"] = "Unknown"

try:
    offline_empty = driver.find_element(By.CSS_SELECTOR, "picture.mr-2 + div")
    if (offline_empty != None and offline_empty.text.strip().__contains__("Tidak tersedia")):
        sales_dict["Offline Stock Status"] = "Not Available"
    else:
        raise Exception("The text is not empty text")
except:
    try:
        offline_stock_status = driver.find_element(By.CSS_SELECTOR, "div[data-testid='store-item-0']")
        if (offline_stock_status != None):
            sales_dict["Offline Stock Status"] = "Available"
    except:
        sales_dict["Offline Stock Status"] = "Unknown"

driver.quit()

for key in sales_dict.keys():
    print(f"{key}: {sales_dict[key]}")

time_end = time.time()

dt1 = datetime.fromtimestamp(time_start)
print('Datetime Start:', dt1)
dt2 = datetime.fromtimestamp(time_end)
print('Datetime End:', dt2)

delta = dt2 - dt1
print('Difference is:', delta)


# # print(specs_grid.prettify())
# # print(specs_grid.prettify())

# specs_grid = soup.find("div", {"class": "tab-content"}).find("div", {"class": "grid"})
# specs_list = specs_grid.find_all("div", {"class": "spec-item"})
# sprecs_dict = {}

# for spec in specs_list:
#     # print(spec.prettify())
#     data = spec.findAll("div", {"class": "leading-6"})
#     key = data[0].text.strip()
#     value = data[1].text.strip()
#     print(f"({key}, {value}")
#     result.append([key, value])

# driver.quit()
